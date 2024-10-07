# 😎 Add repo
🔑 Firstly, get key by pacman-key
```sh
sudo pacman-key --recv-keys  134757291BB9BD83
```
🔏 And after it's imported, sign it
```bash
sudo pacman-key --lsign-key 134757291BB9BD83
```
🚀 Then, add repository to pacman
```shell
sudo nano /etc/pacman.conf
```
👌 Add
```ini
[lukemech]
Server = https://lukemech.github.io/arch_repo/x86_64/
```
⚠ Replace `x86_64` with `arm64` for arm machines *(not supported yet)*<br />
🤞 And install everything ;)
```shell
sudo pacman -Sy <packages from up here>
```