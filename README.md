# gotop

This is a snap of [gotop](https://github.com/xxxserxxx/gotop), a terminal-based
graphical activity monitor.


## Explanation

TBD


## Building

In order to build the snap, install snapcraft 8.x:

```
  snap install --classic --channel=8.x/stable snapcraft
```

Then start the build:

```
  snapcraft
```

## Installing

To install the snap with devmode confinment:

```
  snap install --devmode gotop_*.snap
```

To install the snap with strict confinement:

```
  snap install --jailmode --dangerous gotop_*.snap
```
