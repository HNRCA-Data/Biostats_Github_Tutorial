##--Git Bash Steps--

Start by creating a git ignore file. This will define which files shouldn't Navigate to project directory in file explorer. 
Create a new file called '.gitignore' and open in a text editor. You'll want to include the name of any file containing
sensitive info (ie API keys) or data. At this time repos should only contain code and other relevant files.
- Add all files that should not be uploaded to github
- Archive/ will ignore all 'Archive' directories recursively
- *.csv will ignore all csv files
- [More git ignore patterns](https://www.atlassian.com/git/tutorials/saving-changes/gitignore#git-ignore-patterns)

Download git [here](https://git-scm.com/download/win) and install with the default options. Then right click 
in the project directory and select 'Git Bash Here' and use the following commands to initalize the repository and
perform you inital commit.
```
git init
git add .
git commit -m "Initial commit"
```
Next go to [github.com](github.com), create an account if you haven't already.
Click the top right icon, select 'Your Organizations', Click 'HNRCA-Data'
Click the 'New' button on the right to create your repository. Name the repo and be sure to keep it private
Copy the repo url. Eg https://github.com/HNRCA-Data/test.git
```
git remote add origin https://github.com/HNRCA-Data/test.git
git push origin master
```
Now that he repo is setup, simply commit and push new changes as you make them
This can be done via the terminal or GUIs provided by git, RStudio, or GitHub

##--RStudio Git GUI--


##--GitHub Desktop Steps--

GitHub has written a very clean, useable, and comprehensive GUI for git that is excellent for
maintaining existing git repositories. However it is designed to initialize new repositories 
with an empty project directory and this causes issues that may result in files being 
overwritten or deleted. If using GitHub Deskop to initalize rather than maintain a repository,
exercise caution.
One issue is that GitHub Desktop will automatically commit all existing files immediately when
initializing a repo, therefore one should create a .gitignore file *before* initializing.


Navigate to project directory in file explorer. 
Create a new file called '.gitignore' and open in a text editor
	Add all files that should not be uploaded to github (only upload code for now, ignore data and sensitive info)
	**/Archive will ignore all 'Archive' directories recursively
	*.csv will ignore all csv files
	https://www.atlassian.com/git/tutorials/saving-changes/gitignore#git-ignore-patterns

Download from https://desktop.github.com/
Install and open GitHub Desktop, create an account if needed. Click 'Add existing repository'.
If you have existing projects in GitHub Desktop already, click the down arrow at the top left under
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
