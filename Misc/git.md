1. git submodule: already exists in the index
- git rm -r --cached public
2. git submodule add -b master https://github.com/yunfan23/yunfan23.github.io.git public
3. delete local branch
   - git branch -D main

## Change a file name
- open shell and change to the working directory
- Rename the file, specifying the old file name and the new name you'd like to give the file. This will stage your change for commit
   ```
   git mv old_filename new_filename
   ```
- use `git status` to check the old and new file name
- Commit the file that you've staged in your local repository
- Push the changes in your local repository to GitHub