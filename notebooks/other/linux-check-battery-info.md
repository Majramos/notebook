# Check Laptop Battery Info

How to check a Linux laptop battery info/health


## upower command
Display the a list of all available power sources
```bash
upower -e
```

Output:

>/org/freedesktop/UPower/devices/line_power_AC
>/org/freedesktop/UPower/devices/battery_BAT0
>/org/freedesktop/UPower/devices/DisplayDevice

To get detailed information related to a power source (-i flag)

```bash
upower -i /org/freedesktop/UPower/devices/line_power_AC
```

## acpi utility
ACPI stands for Advanced Configuration and Power Interface. You can use the acpi command in Linux to display information associated with your laptop's battery. This command extracts the information from the /proc and /sys filesystem.
```bash
acpi -v
```

information about battery termal
```bash
acpi -t
```

