# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "pandas",
# ]
# ///
from datetime import datetime

import pandas as pd

RAW_STR = """
Wednesday, January 01, 2025	$500,000.00
"""


def parse(line: str) -> tuple[datetime, float]:
    date_str, value_str = line.split("$")
    date = datetime.strptime(date_str.strip(), "%A %B %d %Y")
    date = date.strftime("%Y-%m-%d")
    value = float(value_str)
    return date, value


def main() -> None:
    lines = (
        RAW_STR.strip()
        .replace("Historical Total Value", "")
        .replace("Date", "")
        .replace("Total Value", "")
        .replace("\t", " ")
        .replace(",", "")
        .strip()
        .split("\n")
    )

    data = [parse(line) for line in lines]

    df = pd.DataFrame(data, columns=["date", "value"])
    df.sort_values(by="date", inplace=True, ascending=True)
    df.drop_duplicates(subset=["date"], inplace=True)
    df.to_csv("output.csv", index=False)
    print(df.head())


if __name__ == "__main__":
    main()
