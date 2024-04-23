# Remove accents from strings

```python
import unicodedata

def strip_accents(s):
    """ Strip accents from input String. """
    normalized = []
   
    for c in unicodedata.normalize('NFD', s):
        if unicodedata.category(c) != 'Mn':
            normalized.append(c)
    return ''.join(normalized)
```

short version
```python
import unicodedata

def strip_accents(s):
    return ''.join(c for c in unicodedata.normalize('NFD', s)  if unicodedata.category(c) != 'Mn')
```

other version
```python
import unicodedata

def strip_accents(s):
    """ Strip accents from input String. """

    try:
        s = unicode(s, 'utf-8')
    except (TypeError, NameError): # unicode is a default on python 3 
        pass
    s = unicodedata.normalize('NFD', s)
    s = s.encode('ascii', 'ignore')
    s = s.decode("utf-8")
    return str(s)
```