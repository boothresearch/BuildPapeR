# Remote FTP Exercise
## Some Background: Why Remote FTP?
For some of your projects as an R.P. and beyond, you may find yourself having to develop and run code on remote servers instead of your own machine. Many researchers use proprietary datasets, and the owners of such data typically do not want all researchers to have a copy of the data on their personal computers. Instead, the owners of the data can set up a remote server which researchers can access using a secure log-in called an ssh connection. Some common examples of datasets that may require this type of connection are:
- medical or health records that are protected under HIPAA
- government datasets such as block-level census data that may not be public
- individual-level expenditure data from a private bank or credit card company

Depending on the setup offered by the server-providers, you may not be able to develop code in the ways that you're used to. Individual researchers often don't have the permissions to install applications on the server, so tools like RStudio and Jupyter Notebooks may not be available. If you are really comfortable working with just your shell, you can of course develop code using vim. For most of us, though, vim is a fairly steep learning curve. Luckily we have another option: the `Remote-SSH` extension in VSCode!

## How Does `Remote-SSH` Work?
The `Remote-SSH` extension in vscode allows us to develop code on a remote server from the comfort of our local machine. Basically, we set up a config file that tells vscode how to connect to the server and then it allows us to interact with these files as we would any local files. Now that we have a basic understanding of why `Remote-SSH` might be useful, let's try setting up an FTP connection in VSCode.

*Note: Although we will focus on a vscode example for today, know that similar extensions exist in other text editors (e.g. `remote_ftp` in Atom), so if you prefer another editor you can likely find an analog there.*

## `Remote-SSH` Example in VSCode
### 1. Set up the SSH Connection
Make sure you have the extension `Remote Development` installed in VSCode. This is a collection of several extensions that will be useful for connecting to remote servers and editing files there. Once you have the extension installed, we can connect to the remote server. To do this, open a new window in VSCode and use CMD + Shift + P or F1 to open the command search menu. Search for `Remote-SSH:Connect current window to host` and then select `Add new SSH connection`. It will ask you to enter the SSH Connection Command, which is:
```
ssh root@137.184.31.136
```
Then it will ask you which config file to update; you can just hit enter to choose the first file suggested. Now, we can again go to `Remote-SSH:Connect` and select the address we've just added to the config. It should prompt you for a password; enter `Wm.rNTfuUb9_B`. Now open a new terminal in VSCode. If your login was successful, the command prompt should read `root@wcfr-workshop:~#`.
### 2. Set up a personal directory on the server
From your terminal in VSCode, go ahead and `cd` into the directory `ssh_exercise`.
```
cd ssh_exercise
```
Now, we want each of you to create a personal directory with your first initial and last name. If you type `ls`, you will see my directory `cshubatt` is already there. To make your directory, type your version of:
```
mkdir cshubatt
```
Then go ahead and enter this directory using
```
cd cshubatt
```
when you type `ls`, you should see nothing because your directory is empty.
### 3. Clone a sample project to your personal directory
We would like a sample project to work with, so we're going to clone the `BuildPapeR` repo from the Booth RP GitHub. You can do this by typing
```
git clone https://github.com/boothresearch/BuildPapeR.git
```
Now when you type `ls`, you should see one directory entitled `BuildPapeR`.

### 4. Set up our project in VSCode
Now, we want to open the remote directory `cshubatt/BuildPapeR` in VSCode. Go to your Explorer tab on the left side of your VSCode interface and add a project folder. It should give you a dropdown menu where you can choose from the remote directories at the root. Navigate to find your personal directory and then open your personal copy of `BuildPapeR`. You should see on the left hand side of your interface a list of 9 files including `earnings.R`, `makefile`, and `paper.Rmd`.

### 5. Ensure the code runs
The repo we're working with today is a project that performs some simple analysis and outputs results into a file called `paper.pdf`. The whole pipeline should run when we type `make` in our VSCode terminal while connected to the server. Try this now, and then refresh the file tree to make sure `paper.pdf` has apppeared. It's helpful here to install the extension `vscode-pdf`, which allows us to view PDF files in VSCode. If you already have this (or something similar) downloaded, you may need to install it again for this particular connection. Once you have some kind of PDF viewer installed, click on `paper.pdf` to see what you've built.

### 6. Edit A Script Remotely From VSCode
Congratulations! You have now used VSCode to remotely connect to a server and run a script. Now comes the real value of the remote connection: you can edit scripts on this server from the comfort of your beautiful, personally customized text editor. Let's practice this! We are going to build our paper again, but first, let's make a change to the RMarkdown file from which the pdf is compiled. 
- Click on `paper.Rmd` to open it in the text editor
- Add yourself as a coauthor
- Save

### 7. Compile The Paper
WOW! You've edited a file on a faraway server without ever leaving your own machine! Now, all that's left to do is build the paper with the updated script. If you return to your terminal in VSCode, you can again run the command `make`. When it's done, try opening `paper.pdf` again. Do you see your name listed next to Derek's? Well done -- you've earned your coauthorship designation!
