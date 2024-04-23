# Add transparency to rgb colors

## rgb values

HEX format for red
```
#FF0000
```

red, green, blue (RGB) format
```
rgb(255, 0, 0)
```

## transparency
add the alpha channel using RGBA with 50% transparency

in decimal (0 - 1), may not be cross-platform
```
rgba(255, 0, 0, 0.5)
```

or in number (0 - 255), usually in android
```
rgba(255, 0, 0, 127)
```

### ARGB

cross-platform using HEX code
```
#80FF0000
```

### HEX table

| Alpha Level | Hex Code |
|-------------|----------|
| 100%        | FF       |
| 95%         | F2       |
| 90%         | E6       |
| 85%         | D9       |
| 80%         | CC       |
| 75%         | BF       |
| 70%         | B3       |
| 65%         | A6       |
| 60%         | 99       |
| 55%         | 8C       |
| 50%         | 80       |
| 45%         | 73       |
| 40%         | 66       |
| 35%         | 59       |
| 30%         | 4D       |
| 25%         | 40       |
| 20%         | 33       |
| 15%         | 26       |
| 10%         | 1A       |
| 5%          | 0D       |
| 0%          | 00       |

### Function convertion

javascript
```javascript
let percentage_opacity = 0.5
// convert decimal numberto hex equivalent
Math.floor(percentage_opacity * 255).toString(16);
```
