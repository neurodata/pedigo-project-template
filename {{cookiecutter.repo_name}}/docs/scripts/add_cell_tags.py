import nbformat as nbf
import numpy as np
import sys

# input is path to a .ipynb file
ipath = sys.argv[1]


def get_tags(cell):
    cell_tags = cell.get("metadata", {}).get("tags", [])
    cell_tags = list(np.unique(cell_tags))
    return cell_tags


def set_tags(cell, cell_tags):
    if len(cell_tags) > 0:
        cell["metadata"]["tags"] = cell_tags


ntbk = nbf.read(ipath, nbf.NO_CONVERT)
for cell in ntbk.cells:
    cell_type = cell.get("cell_type")

    # hide all code cells
    if cell_type == "code":
        cell_tags = get_tags(cell)
        if "hide-input" not in cell_tags:
            cell_tags.append("hide-input")
        set_tags(cell, cell_tags)

    # add all "title" bits from the cell to tags
    if (cell_type == "markdown") or (cell_type == "code"):
        cell_tags = get_tags(cell)
        title = cell.get("metadata", {}).get("title", "")
        if title != "":
            title_bits = title.split(",")
            for title_bit in title_bits:
                cell_tags.append(title_bit.strip(" "))
        set_tags(cell, cell_tags)

nbf.write(ntbk, ipath)
