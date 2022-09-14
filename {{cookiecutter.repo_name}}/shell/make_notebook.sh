SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
BASE_DIR=$SCRIPT_DIR/..

build=false
markdown=false
while getopts 'bm:' OPTION; do
  case $OPTION in
    b)
      echo "[make_notebook.sh] Will build docs"
      build=true
      ;;
    m)
      echo "[make_notebook.sh] Will build slides"
      markdown=true
      ;;
  esac
done

# not sure why this has to be 2, most examples this is a 1
shift $((OPTIND -2))

echo "[make_notebook.sh] Converting python script to notebook"
jupytext --to notebook --output $BASE_DIR/docs/$1.ipynb $BASE_DIR/scripts/$1.py
echo "[make_notebook.sh] Executing notebook"
jupyter nbconvert --to notebook --inplace --execute --ExecutePreprocessor.timeout=-1 $BASE_DIR/docs/$1.ipynb 
echo "[make_notebook.sh] Adding cell tags to notebook"
python $BASE_DIR/docs/scripts/add_cell_tags.py $BASE_DIR/docs/$1.ipynb

if "$build"; then
  echo "[make_notebook.sh] Building docs"
  jupyter-book build $BASE_DIR/docs
fi

if "$markdown"; then
  if [ ! -d "$BASE_DIR/docs/slides/$1" ]; then
      echo "[make_notebook.sh] Making directory to save slides"
      mkdir "$BASE_DIR/docs/slides/$1"
  fi
  echo "[make_notebook.sh] Building slides markdown file"
  jupyter nbconvert --to markdown $BASE_DIR/docs/$1.ipynb --TagRemovePreprocessor.enabled=True --TagRemovePreprocessor.remove_input_tags hide-input --TagRemovePreprocessor.remove_cell_tags hide-slide --output-dir "$BASE_DIR/docs/slides/$1"
  echo "[make_notebook.sh] Modifying slides for Marp"
  python $BASE_DIR/docs/scripts/marpify.py $BASE_DIR/docs/slides/$1/$1.md
fi
