# Remove Diacritic/Accent in Power Query

## Create a new function
- New Query > Blank Query

```
let
    Source = (textToConvert) =>
let 
    textBinary = Text.ToBinary  (textToConvert,              1251 ),
    textASCII  = Text.FromBinary(textBinary   , TextEncoding.Ascii)
in    
    textASCII
in
    Source
```

## Use function on column
- Custom column > Custom column formula