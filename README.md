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

# 👏 What packages are hosted?
### 🚀 To install packages marked as huge, install `lukemech-huge` and run `lukemech add <name>`
*✔ Packages listed in dependencies are also hosted and automatically installed by pacman* <br />
<table>
  <tr>
    <th>🎁 Package</th>
    <th>✨ Dependencies</th>
    <th>🤞 Huge</th>
  </tr>
  
  <td align="center" colspan=3>Missing firmware</td>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/mkinitcpio-firmware">mkinitcpio-firmware</a></td>
    <td>
      <details>
        <summary>4</summary>
        <a target="_blank" href="https://aur.archlinux.org/packages/aic94xx-firmware">aic94xx-firmware</a><br />
        <a target="_blank" href="https://aur.archlinux.org/packages/ast-firmware">ast-firmware</a><br />
        <a target="_blank" href="https://aur.archlinux.org/packages/upd72020x-fw">upd72020x-fw</a><br />
        <a target="_blank" href="https://aur.archlinux.org/packages/wd719x-firmware">wd719x-firmware</a>
      </details>
    </td>
    <td>✖️</td>
  </tr>
  
  <th align="center" colspan=3>Cosmic desktop</th>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-session-git">cosmic-session-git</a></td>
    <td>
	    <details>
		<summary>20</summary>
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-applets-git">cosmic-applets-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-applibrary-git">cosmic-applibrary-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-bg-git">cosmic-bg-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-comp-git">cosmic-comp-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-greeter-git">cosmic-greeter-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-icons-git">cosmic-icons-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/pop-icon-theme-git">pop-icon-theme-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-launcher-git">cosmic-launcher-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/pop-launcher-git">pop-launcher-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-notifications-git">cosmic-notifications-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-osd-git">cosmic-osd-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-panel-git">cosmic-panel-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-randr-git">cosmic-randr-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-screenshot-git">cosmic-screenshot-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-settings-daemon-git">cosmic-settings-daemon-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/adw-gtk3-git">adw-gtk3-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-settings-git">cosmic-settings-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-workspaces-git">cosmic-workspaces-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/xdg-desktop-portal-cosmic-git">xdg-desktop-portal-cosmic-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/pop-shell-plugin-system76-power-git">pop-shell-plugin-system76-power-git</a> <i>(optional; from build, missing other deps)</i><br />
	    </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-edit-git">cosmic-edit-git</a></td>
    <td>
	    <details>
		<summary>2</summary>
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-icons-git">cosmic-icons-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/pop-icon-theme-git">pop-icon-theme-git</a><br />
	    </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-files-git">cosmic-files-git</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-store-git">cosmic-store-git</a></td>
    <td>
	    <details>
		<summary>2</summary>
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-icons-git">cosmic-icons-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/pop-icon-theme-git">pop-icon-theme-git</a><br />
	    </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-term-git">cosmic-term-git</a></td>
    <td>
	    <details>
		<summary>2</summary>
		<a target="_blank" href="https://aur.archlinux.org/packages/cosmic-icons-git">cosmic-icons-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/pop-icon-theme-git">pop-icon-theme-git</a><br />
	    </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-webapps-git">cosmic-webapps-git</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cosmic-tasks-git">cosmic-tasks-git</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  
  <th align="center" colspan=3>Fonts</th>
  <tr align="center">
    <td>
	<details>
		<summary><a target="_blank" href="https://aur.archlinux.org/packages/ttf-ms-win11-auto">ttf-ms-win11-auto</a></summary>
		<a>ttf-ms-win11-auto-japanese</a><br />
		ttf-ms-win11-auto-korean<br />
		ttf-ms-win11-auto-other<br />
		ttf-ms-win11-auto-sea<br />
		ttf-ms-win11-auto-thai<br />
		ttf-ms-win11-auto-zh_cn<br />
		ttf-ms-win11-auto-zh_tw<br />
	</details>
    </td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/ttf-twemoji">ttf-twemoji</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  
  <th align="center" colspan=3>AUR Helpers</th>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/octopi">octopi</a></td>
    <td>
      <details>
        <summary>3</summary>
        <a target="_blank" href="https://aur.archlinux.org/packages/alpm_octopi_utils">alpm_octopi_utils</a><br />
        <a target="_blank" href="https://aur.archlinux.org/packages/qt-sudo-git">qt-sudo-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/yay-git">yay-git</a><i> (optional)</i>
      </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/yay-git">yay-git</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  
  <th align="center" colspan=3>Programs</th>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/nasa-wallpaper">nasa-wallpaper</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/waydroid-git">waydroid-git</a></td>
    <td>0</td>
    <td>✔️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/extension-manager">extension-manager</a></td>
    <td>
      <details>
        <summary>1</summary>
        <a target="_blank" href="https://aur.archlinux.org/packages/text-engine">text-engine</a>
       </details>
    </td>
    <td>✔️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/syncthingtray">syncthingtray</a></td>
    <td>
      <details>
        <summary>3</summary>
        <a target="_blank" href="https://aur.archlinux.org/packages/c++utilities">c++utilities</a><br />
        <a target="_blank" href="https://aur.archlinux.org/packages/qtforkawesome">qtforkawesome</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/qtutilities">qtutilities</a>
      </details>
    </td>
    <td>✔️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/brave-bin">brave-bin</a></td>
    <td>0</td>
    <td>✔️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/visual-studio-code-bin">visual-studio-code-bin</a></td>
    <td>0</td>
    <td>✔️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/variety-git">variety-git</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/ventoy-bin">ventoy-bin</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/sklauncher-bin">sklauncher-bin</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/amulet-map-editor-git">amulet-map-editor-git</a></td>
    <td>
      <details>
        <summary>8</summary>
        <a target="_blank" href="https://aur.archlinux.org/packages/python-amulet-core-git">python-amulet-core-git</a><br />
        <a target="_blank" href="https://aur.archlinux.org/packages/python-portalocker">python-portalocker</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/python-amulet-leveldb-git">python-amulet-leveldb-git</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/python-leveldb">python-leveldb</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/python-amulet-nbt">python-amulet-nbt</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/python-mutf8">python-mutf8</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/python-minecraft-model-reader">python-minecraft-model-reader</a><br />
		<a target="_blank" href="https://aur.archlinux.org/packages/python-pymctranslate-git">python-pymctranslate-git</a>
      </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/yt-dlg">yt-dlg</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/czkawka-gui-bin">czkawka-gui-bin</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <th align="center" colspan=3>For server</th>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/realmd-git">realmd-git</a></td>
    <td>
      <details>
        <summary>1</summary>
		<a target="_blank" href="https://aur.archlinux.org/packages/adcli">adcli</a>
      </details>
    </td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cockpit-docker">cockpit-docker</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cockpit-navigator-git">cockpit-navigator-git</a></td>
    <td>0</td>
    <td>✖️</td>
  </tr>
  <tr align="center">
    <td><a target="_blank" href="https://aur.archlinux.org/packages/cockpit-composer">cockpit-composer</a></td>
    <td>
	<details>
	    <summary>1</summary>
	    <a target="_blank" href="https://aur.archlinux.org/packages/osbuild-composer">osbuild-composer</a>   
	</details>
    </td>
    <td>✖️</td>
  </tr>
</table>
