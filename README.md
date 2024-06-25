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

Note that this snap is built with `SNAPCRAFT_BUILD_INFO=1` to include a
`manifest.yaml` and `snapcraft.yaml` in the final snap package, enabling the
store to notify us of any USNs which get published for this snap.

In order to take in the updates those USNs inform us of, we should also include
our Pro token for our builds via either:

```
  snapcraft --ua-token <token>
```

or by exporting

```
  SNAPCRAFT_UA_TOKEN=<token>
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
