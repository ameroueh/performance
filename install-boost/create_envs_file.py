import glob
import sys

BOOST_ROOT = sys.argv[1]
BOOST_LIB = BOOST_ROOT + "/stage/lib"


PYTHON_BASE = sys.executable.replace("/bin/python", "")

for filename in glob.iglob(PYTHON_BASE + "/**/Python.h", recursive=True):
    PYTHON_INCLUDE = filename.replace("/Python.h", "")

for filename in glob.iglob(PYTHON_BASE + "/**/arrayobject.h", recursive=True):
    NUMPY_INCLUDE = filename.replace("/numpy/arrayobject.h", "")

with open("boost_envs.sh", "w") as f:
    f.write("export BOOST_ROOT={}\n".format(BOOST_ROOT))
    f.write("export BOOST_LIB={}\n".format(BOOST_LIB))
    f.write("export PYTHON_INCLUDE={}\n".format(PYTHON_INCLUDE))
    f.write("export NUMPY_INCLUDE={}\n".format(NUMPY_INCLUDE))
    f.write("export LD_LIBRARY_PATH=$BOOST_LIB:$LD_LIBRARY_PATH")
