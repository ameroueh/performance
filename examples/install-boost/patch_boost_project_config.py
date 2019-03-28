import os
import re
import sys

with open(sys.argv[1], "r") as f:
    lines = f.read().split("\n")

PYTHON_CONFIG_LINE_REGEX = re.compile(" *using python")
PYTHON_VERSION = "{}.{}".format(sys.version_info.major, sys.version_info.minor)
PYTHON_BASE_PATH = sys.executable.replace("/bin/python", "")

index = None
for i, line in enumerate(lines):
    if PYTHON_CONFIG_LINE_REGEX.findall(line):
        index = i
        patched_python_config_line = "    using python : {} : {} : {} ;".format(
            PYTHON_VERSION, PYTHON_BASE_PATH, os.environ["PYTHON_INCLUDE"]
        )
        lines[index] = patched_python_config_line

        with open(sys.argv[1], "w") as f:
            f.write("\n".join(lines))
        sys.exit(0)

raise RuntimeError("Could not find Python configuration line.")
