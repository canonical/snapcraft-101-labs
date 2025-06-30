# gotop

This is a snap of [gotop](https://github.com/xxxserxxx/gotop), a terminal-based
graphical activity monitor.

## Explanation

This snap should be capable of showing useful hardware information statistics,
such as running process or CPU and RAM utilization. If it is not, please ensure
its interfaces are connected:

```
  snap connect gotop:hardware-observe
  # etc...
```

## Building

In order to build the snap, install snapcraft 8.x:

```
  snap install --classic --channel=8.x/stable snapcraft
```

Then start the build:

```
  snapcraft
```

Snaps must include a `manifest.yaml` in the final snap package so that
the store to notify publishers and collaborators of USNs published for any
of this snap's debian package dependencies. This can be done by setting
`SNAPCRAFT_BUILD_INFO=1` before building the snap.

In order to take in the updates those USNs inform us of, we should also include
our Pro token for our builds:

```
  SNAPCRAFT_UA_TOKEN=<token>
```

## Installing

To install the snap with devmode confinement:

```
  snap install --devmode gotop_*.snap
```

To install the snap with strict confinement:

```
  snap install --jailmode --dangerous gotop_*.snap
```
