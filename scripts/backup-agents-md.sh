#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
repo_root="$(cd "${script_dir}/.." && pwd)"
backup_date="${BACKUP_DATE:-$(date +%F)}"
backup_root="${repo_root}/legacy/agents_md"

case "${backup_date}" in
    ????-??-??) ;;
    *)
        echo "BACKUP_DATE must use YYYY-MM-DD format: ${backup_date}" >&2
        exit 2
        ;;
esac

backup_agents_md() {
    local provider="$1"
    local source_rel="$2"
    local source_path="${repo_root}/${source_rel}"
    local target_dir="${backup_root}/${provider}"
    local target_path="${target_dir}/${backup_date}_AGENTS.md"

    if [ ! -f "${source_path}" ]; then
        echo "missing source file: ${source_rel}" >&2
        return 1
    fi

    mkdir -p "${target_dir}"
    cp "${source_path}" "${target_path}"

    if ! cmp -s "${source_path}" "${target_path}"; then
        echo "backup verification failed: ${source_rel} -> ${target_path#"${repo_root}/"}" >&2
        return 1
    fi

    echo "backed up ${source_rel} -> ${target_path#"${repo_root}/"}"
}

backup_agents_md "codex" "codex/.codex/AGENTS.md"
backup_agents_md "pi" "pi/.pi/agent/AGENTS.md"
