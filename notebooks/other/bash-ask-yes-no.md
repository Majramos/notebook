# simple aks year or no bash script

A simple ask yes or no script that exists in case of "No/n/N"

The default answer is Yes

askyesno.sh
```bash
#!/usr/bin/env bash

ask_yesno() {
    while true
    do
      read -p "$1 [Y/n]: " yesno
      yesno=${yesno:-Y}
      case $yesno in
        [Yy]*|yes) break;;
        [Nn]*|no ) exit;;
      esac
    done
}
```

## Usage

```bash
$ ask_yesno "Is this a question?"
Is this a question? [Y/n]
````