import json, re, sys

if (len(sys.argv) != 2):
    sys.stderr.write("Usage: composer_php_version /path/to/composer.json\n")
    sys.exit(1)

path = sys.argv[1]

try:
    with open(path, encoding="utf-8") as fh:
        data = json.load(fh)
except json.JSONDecodeError as exc:
    sys.stderr.write(f"composer_php_version: failed to parse {path}: {exc}\n")
    sys.exit(2)
except FileNotFoundError:
    sys.stderr.write(f"composer_php_version: file not found: {path}\n")
    sys.exit(5)

constraint = data.get("require", {}).get("php")

if not constraint:
    constraint = data.get("config", {}).get("platform", {}).get("php")
if not constraint:
    sys.stderr.write(f"composer_php_version: php requirement not found in {path}\n")
    sys.exit(3)

match = re.search(r"(\d+(?:\.\d+)*)", constraint)
if not match:
    sys.stderr.write(f"composer_php_version: no numeric version found in constraint {constraint!r}\n")
    sys.exit(4)

print(match.group(1).strip("."))
