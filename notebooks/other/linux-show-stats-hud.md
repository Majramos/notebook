# Heads Up Display with FPS Counter And Other Data

GALLIUM_HUD can provide you with a heads-up display which shows frames 
per second, CPU load and other data. It works with any OpenGL game or 
application as long as the graphics driver supports it.


## How to
Start your application with an environment-variable called GALLIUM_HUD="" 

```bash
GALLIUM_HUD="help" glxgears
```

**help** command prints an explanation and all the info about the names
and values that can be used with your specific hardware 

### Common names
- 'fps' frapes per second value
- 'cpu' cpu usage value in percentage
- 'GPU-load' gpu usage value in percentage
- 'temperature' temperature

this example will show a graph with the fps values
```bash
GALLIUM_HUD="fps" glxgears
```

### Identifiers
- '.w' width in pixels
- '.h' height in pixels
- '.c' max high number in the graph
- '.d' graph dinamically readjust its ceiling
- ':value' specify inicial maximum value of Y axis

### Multiple Graphs
Can display multiple graphs stacked or arranged vertically/horizontally
- '+' same graph
- ',' graph stacked vertically
- ';' graph stacked horizontally

## Period
Change how fast the hud refreshes, the default value is 0.5

```bash
GALLIUM_HUD_PERIOD=0.25 GALLIUM_HUD="fps" glxgears
```
