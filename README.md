# Pedigo's cookiecutter project template 

## Features
- A local Python `pkg` for utility functions (e.g. saving figures, loading data, functions which are shared across notebooks/scripts)
- [Poetry](https://python-poetry.org/) for environment specification.
- [Jupyter Book](https://jupyterbook.org/en/stable/intro.html) hosted on [GitHub Pages](https://pages.github.com/) for documentation.
- [Marp](https://marp.app/) for creating slides and posters.
- Shell scripts to facilitate: 
   - Conversion of Python scripts to Jupyter Notebooks.
   - Running a collection of Python files to build an entire project.
   - Copying generated figures to an Overleaf repository.

## Instructions
### Using cookiecutter
- Make sure you have [cookiecutter](https://cookiecutter.readthedocs.io/en/1.7.2/installation.html) installed.
- From the command line, run ``cookiecutter https://github.com/audreyr/cookiecutter-pypackage.git``.
- Answer each of the prompts from the command line.
- Your new project should now be created!

### Setting up GitHub
- Create a [new repository on GitHub](https://github.com/organizations/neurodata/repositories/new).
- Give your repo the same name that you did using the template.
- Do not add any files to the repo when creating it on GitHub.
- Follow the instructions on GitHub (roughly) to push to the newly created repo:
  ```
    git init
    git add .
    git commit -m "initial"
    git branch -M main
    git remote add origin https://github.com/neurodata/<repo_name>.git
    git push -u origin main
  ```
  
### Setting up GitHub Pages
- On GitHub, click on the "Settings" tab


### Setting up Marp
- Get Marp for VSCode
- Access the (on Mac it is ``command + shift + P``) and type `Preferences: Open Workspace Settings (JSON)`.
- Add the following to your `settings.json` to add the included custom themes for Marp:
  ```
  "markdown.marp.themes": [
     "./bilateral-connectome/docs/slides/themes/poster.css",
     "./bilateral-connectome/docs/slides/themes/slides.css"
  ],
  ``` 

### Setting up Overleaf
*Coming soon*