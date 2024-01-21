To install configuration

```
chmod +x install.sh
./install
```

Sddm themes included:

-   [Sugar Dark (id: sugar-dark)](https://store.kde.org/p/1272122)

Postinstall:
Set preferred sddm theme in `/usr/lib/sddm/sddm.conf.d/default.conf`

```
[Theme]
# Current theme name
Current={theme-id}
```

TODO:

-   oh-my-zsh autoconfig
-   check for non present packages in a VM, modify installed
-   add phpmyadmin autoconfig
-   add mssql autoconfig (waiting for aut package to be fixed)
-   add web app manager package and config for YT Music, Zoom, Discord & Teams with screen sharing support
