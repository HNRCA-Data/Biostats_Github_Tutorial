# HNRCA BDMU GitHub Tutorial

This tutorial will provide an introduction to using GitHub within the HNRCA-Data organization. The focus will be on intializing existing projects as that is expected to be a common workflow. However, initalizing a git repository at the onset of a project is the recommended workflow. That is not the focus here as initialzing an empty directory is a simplified version of initializing a directory with existing files.

1. Prerequistes 
    - Create a [GitHub](github.com) account and request access to HNRCA-Data
    - Download and install [git](https://git-scm.com/download/win)
    - (Optional) Install [GitHub Desktop](https://desktop.github.com/)
2. Initialize the project directory
3. Ignore datasets and sensitive information (we are not storing data on GitHub at this time)
4. Create the GitHub repository and link to local repository
5. Commit and push changes as you work

Note that there are several ways to interface with git. The ones that will be covered here are the native git bash terminal and GUI, as well as GUIs provided by GitHub and Rstudio. Relevant instructions for each of these will be included in each step. The recommended workflow would be to initialize the repository with the git terminal or GUI, then maintain your repository with the Rstudio or GitHub GUI.


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
GitHub Desktop is designed to initialize repositories in empty directories and therefore it is not recommended to use this application for initialization. If you would like to do so, it is critical that you create a git ignore file first and ensure that you don't overwrite the git ignore file during initialization.


## Create git ignore file
The git ignore file is a simple text file that tells git which files should not be uploaded to the online repository. This should include all datasets and any sensitive information, or any other local files which are not pertinent to the project.

- In your favorite text editor, open a new file and save it in your project directory as '.gitignore'
- List items to be ignored, one per line
- Specific files can be ignored by adding the name of the file, including the file extension
- To ignore all files of a specific type, use the syntax '\*.extension'. Eg '\*.csv' will ignore all csv files
- To ignore entire folders, use the syntax '/folder' 
- To ignore folders recursively, use the syntax 'folder/'. Eg 'Archive/' will ignore any subdirectory named 'Archive' within the project directory.

For examples or information see the .gitignore file in this repository or see this detailed [.gitignore tutorial](https://www.atlassian.com/git/tutorials/saving-changes/gitignore) 


## Create and Sync GitHub Repository
The GitHub is the online or 'remote' place where your project will be stored and tracked. To create the repo, use the following steps:

- Go to [github.com](github.com) and create an account if you haven't already. 
- Click the top right icon and select 'Your Organizations', then 'HNRCA-Data'. 
- Click the 'New' button on the right to create your repository. 
- Name the repo and select 'Private'. Do not use the options to initialize with a readme or .gitignore unless you are starting with an empty project directory.
- Copy the repo url. Eg https://github.com/HNRCA-Data/Biostats_Github_Tutorial.git

After the remote repo has been created, you need point your local repo to the remote in order to keep them synced.
### Git Bash
- Navigate to the project directory in the file explorer
- Right click and select 'Git Bash Here'
- Run `git remote add` command with the name of the remote and it's url. Eg ` git remote add origin https://github.com/HNRCA-Data/Biostats_Github_Tutorial.git`

### Git GUI
- Navigate to the project directory in the file explorer
- Right click and select 'Git GUI Here'
- Select the 'Remote' menu at the top then click 'Add'
- Enter the remote name, eg 'origin'
- Enter the remote location, eg 'https://github.com/HNRCA-Data/Biostats_Github_Tutorial.git'
- Click 'Add'


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
RStudio also has a git GUI which can be quite convenient when working in R. To access the git interface, you must A) be working within an R project and B) have already initialized the directory. If you just initialized the repository, close and reopen the project in R. Once these steps are done you will see a git icon appear just to the right of the 'Go to file/function' search bar. The GUI is similar to the native git GUI but a bit more polished and has a few extra options. The main drawback of the Rstudio GUI compared to the native GUI is that it tends to be slow when previewing and staging files. 
- Click the git icon then click 'Commit' (or ctrl-alt-M)
- You can review the changes in files by clicking on them
- To stage files individually, check the box in the 'Staged' column next to the filename
- To stage all files, click the 'Stage All' button between the file and preview panes
- Write a commit message, then click 'Commit'
- Click the push button above the commit pane to send those changes to GitHub


### GitHub Desktop
#### Disclaimer
GitHub has written a very clean, useable, and comprehensive GUI for git that is excellent for maintaining existing git repositories. However, it is designed to initialize new repositories with an empty project directory and this causes issues that may result in files being overwritten or deleted. If using GitHub Deskop to initalize rather than maintain a repository, exercise caution. Most importantly, **one should create a .gitignore file before initializing a repository with GitHub Desktop.**

#### GitHub Desktop
To begin using GitHub Desktop, you'll first need to add the local repository.
- Click 'Add existing repository' 
    - If you have existing projects in GitHub Desktop already:
        - Click the down arrow at the top left under 'Current repository', click 'Add', then 'Add existing repository'
- Choose your project directory then click 'Add repository'

Now that you've added the repository


Start by creating a git ignore file. This will define which files shouldn't Navigate to project directory in file explorer. 
Create a new file called '.gitignore' and open in a text editor. You'll want to include the name of any file containing
sensitive info (ie API keys) or data. At this time repos should only contain code and other relevant files.
- Add all files that should not be uploaded to github
- Archive/ will ignore all 'Archive' directories recursively
- *.csv will ignore all csv files
- [More git ignore patterns](https://www.atlassian.com/git/tutorials/saving-changes/gitignore#git-ignore-patterns)

Download GitHub Desktop [here](https://desktop.github.com/). Install and run the program, then create an account if needed or login. 
Click 'Add existing repository'. If you have existing projects in GitHub Desktop already, click the down arrow at the top left under
'Current repository', click Add, then Add existing repository'. After adding your local project
path, GitHub Desktop will detect that there is no existing repository at that location. 
Click 'create a repository', add a description if desired, then click 'Create repository'.
Note that the name of the repository must be the same as the directory it is being initalized in.
If you attempt to enter a new name, it will be ignored and initialized as the directory name. If you
start this process via the 'Create new repository' option, changing the repository name will cause
GitHub Deskop to create an empty directory within your selected directory and initialize a repo there.
Also note that if you select the 'Initialize with a README' or Git ignore options, existing readme or
git ignore files will be overwritten.

Once you've created the repo, GitHub Desktop will automatically perform the inital commit and all
you need to do is click 'Publish repository' at the top right. You may assign a different name to
the repository which will be displayed on GitHub. Be sure that the 'Keep this code private' option
is selected, and under organization select 'HNRCA-Data'. Click 'Publish repository' and your repo
is now live on GitHub!

At this point further changes committed and pushed by selecting the repository at the top left. The
changes and commit options will be displayed below and you can push the changes via the button at
the top right.
