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
- From the command line, run ``cookiecutter https://github.com/neurodata/pedigo-project-template.git``.
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
- On GitHub, click on the "Settings" tab.
- Click on the `Pages` option.
- Under `Source`, select `Branch: gh-pages`. This may only show up after a few minutes
  when the first GitHub action has completed.
- Click `Save`.
- Your documentation should now be available at `http://docs.neurodata.io/<repo_name>/`.
- Navigate back to the repo page, and hit the settings gear icon to the right of `About`
  on the upper right. Paste the URL for your documentation into the `Website` option so
  that people can easily find your documentation. 

### Setting up Marp (VS Code instructions)
- Get [Marp for VS Code](https://marketplace.visualstudio.com/items?itemName=marp-team.marp-vscode).
- Access the Command Palette (on Mac it is ``Command + Shift + P`` by default) and type `Preferences: Open Workspace Settings (JSON)`.
- Add the paths for the Marp themes to your `settings.json`. For me this looks like:
  ```
  "markdown.marp.themes": [
     "./<repo_name>/docs/slides/themes/poster.css",
     "./<repo_name>/docs/slides/themes/slides.css"
  ],
  ```

### Setting up Overleaf
*Coming soon*

### Using the repository
Guides to setting up an environment, running the code and using the shell scripts in
your repo, and building the documentation are provided within the repo created by
`cookiecutter` so that users of your repository can see them, too.
