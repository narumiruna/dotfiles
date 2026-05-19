ARG UBUNTU_IMAGE=ubuntu:24.04
FROM ${UBUNTU_IMAGE}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL=/usr/bin/fish
ENV PATH=/root/.cargo/bin:/root/.local/bin:/root/.atuin/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        ca-certificates \
        build-essential \
        clang \
        cmake \
        curl \
        fish \
        git \
        libclang-dev \
        python3 \
        stow \
    && chsh -s /usr/bin/fish root \
    && rm -rf /var/lib/apt/lists/*

RUN curl --proto "=https" --tlsv1.2 -sSf https://sh.rustup.rs \
    | sh -s -- -y --profile minimal

RUN curl --proto "=https" --tlsv1.2 -sSf https://just.systems/install.sh \
    | bash -s -- --to /usr/local/bin

RUN curl -sS https://starship.rs/install.sh \
    | sh -s -- --yes --bin-dir /usr/local/bin

WORKDIR /workspace/dotfiles
COPY . /workspace/dotfiles

RUN just install-deps

RUN rm -f /root/.zshrc \
    && just install

CMD ["fish"]
