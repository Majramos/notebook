# Tips for PySide6
- [Qt for Python](https://wiki.qt.io/Qt_for_Python)

## Opening Qt Designer to edit/create .ui files with the command:
```bash
pyside6-designer
```

## Fix pyside6/Qt Designer uic export module
```bash
cd ./env/Lib/site-packages/PySide6
mkdir ./bin
mv uic.exe /bin
```

## Convert resource file (contains all icons and fonts) .qrc to .py with the command:
```bash
pyside6-rcc app/resources.qrc -o resources_rc.py
```


## How to import ui files generated in Qt Designer

Import the required modules

```python
import sys
from pathlib import Path

from PySide6.QtWidgets import QApplication, QMessageBox
from PySide6.QtUiTools import loadUiType
from PySide6.QtGui import QCloseEvent
```

Use this instead of QUiLoader. PySide6 loader does not allow you to apply an UI layout to an existing widget. 
This prevents you adding custom code for the initialization of the widget in a class __init__ block

Baseclass will be QMainWindow class

```python
CWD = Path(__file__).parent
uiclass, baseclass = loadUiType(os.path.join(CWD, 'mainwindow.ui'))
```

add basic functionallity to 
```python
class MainWindow(uiclass, baseclass):
    def __init__(self):
        super().__init__()
        self.setupUi(self)

    def closeEvent(self, event: QCloseEvent):
        reply = QMessageBox.question(self, 'Leaving...', 'Are you sure you want to quit?',
                                     QMessageBox.Yes | QMessageBox.No, QMessageBox.No)

        if reply == QMessageBox.Yes:
            event.accept()
        else:
            event.ignore()
```

required section to run application
```python
if __name__ == "__main__":
    app = QApplication(sys.argv)

    window = MainWindow()
    window.show()

    sys.exit(app.exec())
```
