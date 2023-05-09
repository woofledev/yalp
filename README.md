# yalp
the linux package manager written in bash™

readme in construction!!
## setup
requirements: curl, GNU coreutils.<br>
`curl -fsSL https://raw.githubusercontent.com/woofledev/yalp/main/scripts/install.sh | sh`
### configuring
user settings are on the top of the file. you can change the `REPO` or `PKGDIR`

## config file syntax
if you've looked inside the backend folder, you might've noticed the `.config` file.
<br>yalp sources this file, as it tells it what to do. here's what each variable means:
- `REALNAME`: the actual name/location for the package on the repo.
<br><br>       for example: you have a `neofetch.config` and `neofetch.sh` file. you set the `REALNAME` to `neofetch.sh`, which tells the script to go to REPO/pkg/REALNAME to download the file and continue.
- `PKGVER`: package version. only used when running the `update` command
- `ADDTOPATH`: (optional) choose whether to add the package folder to PATH or not. pretty much self-explanatory.
- `INSTALL_CMD`: a command ran during the installation process for the package. 
<br> this could be running the file provided or anything else.
- `EXEC_CMD`: the command ran when the `run` function is executed. could be starting your program if it's not in PATH.