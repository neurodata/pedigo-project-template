#%%
import sys

# input is path to a .md file
path = sys.argv[1]
# path = "/Users/bpedigo/JHU_code/maggot-multiome/maggot-multiome/docs/example_notebook.md"

with open(path, "r") as f:
    text = f.read()

header = "---\nmarp: true\n---\n\n<!-- headingDivider: 3 -->\n\n\n"

new_text = header + text

with open(path, "w") as f:
    f.write(new_text)
