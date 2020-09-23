#! /usr/bin/env false

### Create shortcuts for color switching
### BLA, RED, GRE, YEL, BLU, MAG, CYA, WHI
export BLA="\033[30m"
export RED="\033[31m"
export GRE="\033[32m"
export YEL="\033[33m"
export BLU="\033[34m"
export MAG="\033[35m"
export CYA="\033[36m"
export WHI="\033[37m"

clear
echo """${GRE}
=======================================================
        Initializing Python Virtual Environment
=======================================================
 ${WHI}"""

sleep 1

### 1. Get rid of caches NOT in .venv
find . -type d ! -path './.venv/*' -name '__pycache__' -exec rm -rf {} +
find . -type d ! -path './.venv/*' -name '.pytest_cache' -exec rm -rf {} +

### 2. Load vars defined in .env
if [ ! -f $PWD/.env ]; then
  echo "No .env file found!!!"
  return 1
fi
source .env

### 3. Check for existence of `.venv` dir
if [[ ! -d $PWD/.venv ]]; then
  echo """${BLU}
    virtual Environment Not Found -- Creating '.venv'
  """
  $PYTHON_3_5_OR_HIGHER -m venv .venv
fi

### 4. Activate VENV
source ./.venv/bin/activate

### 5. Install package dependencies for project
if [[ $(pip freeze | diff requirements.txt -) ]]; then
  echo """${BLU}
    requirements.txt does not match installations
    running pip install -r requirements.txt...
  """
  sleep 1
  pip install --upgrade -q -q -q pip
  pip install -q -r requirements.txt
fi

### 6. Link git pre-commit-hook script
ln -fs $PWD/_precommit_hook $PWD/.git/hooks/pre-commit

### 7. Final Message
echo """${BLU}
    Done. Bon courage!
 ${WHI}
 """
