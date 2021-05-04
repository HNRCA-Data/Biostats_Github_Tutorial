# HNRCA BDMU GitHub Tutorial

This tutorial will provide an introduction to using GitHub within the HNRCA-Data organization. The focus will be on intializing projects with existing files. It is recommended to initalize the git repository at the onset of a project before creating any files, however doing so after the fact is still expected to be a common workflow and is the more complex of the processes.

1. Prerequistes - setup accounts and software
2. Create a git ignore file
3. Initialize the project directory
4. Create the GitHub repository and link to local repository
5. Commit and push changes as you work

Note that there are several ways to interface with git. The ones that will be covered here are the native git bash terminal and GUIs provided by git, GitHub, and Rstudio. Relevant instructions for each of these will be included in each step. The recommended workflow would be to initialize the repository with the git terminal or GUI, then maintain your repository with the Rstudio or GitHub GUI.


## Prerequistes
- Create a [GitHub](github.com) account
- Request access to the HNRCA-Data organization by contacting Greg Matuszek and providing your GitHub username
- Download and install [git](https://git-scm.com/download/win). The default install options are sufficient.
- (Optional) Install [GitHub Desktop](https://desktop.github.com/). The default install options are sufficient.


## Create a git ignore file
The git ignore file is a simple text file that tells git which files should not be uploaded to the online repository. This should include all datasets and any sensitive information, or any other local files which are not pertinent to the project.

- In your favorite text editor, open a new file and save it in your project directory as '.gitignore'
- List items to be ignored, one per line
- Specific files can be ignored by adding the name of the file, including the file extension
- To ignore all files of a specific type, use the syntax '\*.\<extension\>'. Eg '\*.csv' will ignore all csv files
- To ignore entire folders, use the syntax '/\<folder\>'. Eg '/Archive' will ignore the 'Archive' folder in the root directory and '/data/Archive' will ignore the 'Archive' folder in the data directory. 
- To ignore folders recursively, use the syntax '\<folder\>/'. Eg 'Archive/' will ignore any subdirectory named 'Archive' within the project directory.

For examples see the .gitignore file in this repository or for more information see this detailed [.gitignore tutorial](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) 


## Initalize Repository
### Git Bash
- Navigate to the project directory in the file explorer
- Right click and select 'Git Bash Here'
- Run the command `git init`

### Git GUI
- Navigate to the project directory in the file explorer
- Right click and select 'Git GUI Here'
- Click 'Create new Repository'
- Select your directory and 'click Create'

### GitHub Desktop
While GitHub Desktop is an excellent git interface for maintaining repositories, its behavior makes it unsuitable for initalizing repositories in non-empty directories. It can be done, however the application is clearly designed to initialize repos in empty directories. Initializing a repo in a non-empty directory could result in data loss. If you would like to use this application for this purpose, it is critical that you ***create a .gitignore file before initializing and ensure that the .gitignore isn't overwritten during initialization.*** 

Another work-around would be to initialize a new, empty directory, then copy your files into the new directory.
- After installing GitHub Desktop, click 'Create new repository'
    - If you have existing projects in GitHub Desktop already:
        - Click the down arrow at the top left under 'Current repository', click 'Add', then 'Create new repository'
- Enter the name of the new directory to be created
- Under 'Local path', choose the parent directory you would like the new directory in
- Fill out the other options if desired and click 'Create repository'
- Copy your files into the new directory


## Create and Sync GitHub Repository
The GitHub is the online or 'remote' place where your project will be stored and tracked. To create the repo, use the following steps:

- Go to [github.com](github.com). If using GitHub Desktop, skip this step.
- Click the top right icon and select 'Your Organizations', then 'HNRCA-Data'. 
- Click the 'New' button on the right to create your repository. 
- Name the repo and select 'Private'. Do not use the options to initialize with a readme or .gitignore unless you are starting with an empty project directory.
- Copy the repo url. Eg https://github.com/HNRCA-Data/Biostats_Github_Tutorial.git

After the remote repo has been created, you need point your local repo to the remote in order to keep them synced.
### Git Bash
- Navigate to the project directory in the file explorer
- Right click and select 'Git Bash Here'
- Run a `git remote add` command with the name of the remote and it's url. Eg ` git remote add origin https://github.com/HNRCA-Data/Biostats_Github_Tutorial.git`

### Git GUI
- Navigate to the project directory in the file explorer
- Right click and select 'Git GUI Here'
- Select the 'Remote' menu at the top then click 'Add'
- Enter the remote name, eg 'origin'
- Enter the remote location, eg 'https://github.com/HNRCA-Data/Biostats_Github_Tutorial.git'
- Click 'Add'

### GitHub Desktop
- If using GitHub Desktop to initialize the repository, you can skip creating a repository on github.com. If you've already done so, you must follow the Git Bash or Git GUI instructions above.
- Select the new repository from the 'Current repository' drop down at the top left, then click 'Publish repository'
- You can choose a name other than the folder name if desired
- Be sure to select the 'Keep this code private' option
- Select HNRCA-Data under 'Organization'
- Click 'Publish repository'


## Commit and Push Changes
Now that your project directory is connected to GitHub, all you need to do is commit the changes and push them to GitHub as you work. A 'commit' is equivalent to saving your work on git, and each of these save points will act as an 'undo' point that you can roll back to in the future. The term 'push' refers to sending those commits to your remote repository on GitHub.

### Git Bash
- Navigate to the project directory in the file explorer
- Right click and select 'Git Bash Here'
- To add all new or changed files to your commit run `git add .`
- You can also add files to the commit individually by replacing the '.' with the file name. Eg `git add readme.md`
- Finalize the commit by running a commit command including a commit message. Eg `git commit -m "Initial commit"`
- To send those changes to GitHub run a push command with the remote name and branch name. Eg `git push origin main`

### Git GUI
- Navigate to the project directory in the file explorer
- Right click and select 'Git GUI Here'
- If the GUI was already open, click 'Rescan' to make sure the changes are up-to-date
- You can review your changes by clicking on a file in the left-hand pane
- To add all files to the commit, click 'Stage Changed'. Or add individually by clicking the file then pressing ctrl-T
- Write a commit message, then click 'Commit'
- Click push to send those changes to GitHub

### RStudio Git GUI
RStudio also has a git GUI which can be quite convenient when working in R. To access the git interface, you must A) be working within an R project and B) have already initialized the directory. If you just initialized the repository, close and reopen the project in R. Once these steps are done you will see a git icon appear just to the right of the 'Go to file/function' search bar. The GUI is similar to the native git GUI but a bit more polished and has a few extra options. The main drawback of the Rstudio GUI compared to the native GUI is that it tends to be slow when previewing and staging files. Additionally, this interface has no management features (intializing, adding/removing remote repositories, etc).
- Click the git icon then click 'Commit' (or ctrl-alt-M)
- You can review the changes in files by clicking on them
- To stage files individually, check the box in the 'Staged' column next to the filename
- To stage all files, click the 'Stage All' button between the file and preview panes
- Write a commit message, then click 'Commit'
- Click the push button above the commit pane to send those changes to GitHub

### GitHub Desktop
GitHub Desktop is the most polished git interface. The UI is modern and does not suffer from lag like the Rstudio interface. It also refreshes automatically unlike the other GUIs. The drawback of this GUI is there is no 'ammend to previous commit' option. 

To begin using GitHub Desktop, you'll first need to add your repository.
- Click 'Add existing repository' 
    - If you have existing projects in GitHub Desktop already:
        - Click the down arrow at the top left under 'Current repository', click 'Add', then 'Add existing repository'
- Choose your project directory then click 'Add repository'

Once the repository is added it is quite similar to the other GUIs, however it is the most polished among them. 
- Select your repository by clicking the 'Current repository' drop down at the top left
- Review your changes by clicking filenames 
- Add or remove them to the commit using the checkboxes next to the filenames
- Add a brief commit message in the summary box, with an optional detailed message in the description box
- Click 'Commit to \<branch\>
- Push the changes to GitHub via the push button at the top right


## Helpful Resources
[A quick list of common git bash commands](https://www.atlassian.com/git/tutorials/atlassian-git-cheatsheet)

[Git bash initialization walkthrough](https://docs.github.com/en/github/importing-your-projects-to-github/adding-an-existing-project-to-github-using-the-command-line)
