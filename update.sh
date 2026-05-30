#!/bin/sh
headers='
    X11
    GL
    KHR
    wayland-client-core.h
    wayland-client.h
    wayland-egl-core.h
    wayland-egl.h
    wayland-util.h
    wayland-version.h
    xkbcommon
    EGL
    pulse
    libdecor-0/libdecor.h
    libudev.h
'
protocols='
    staging/cursor-shape/cursor-shape-v1
    stable/tablet/tablet-v2
    staging/fractional-scale/fractional-scale-v1
    staging/xdg-activation/xdg-activation-v1
    stable/viewporter/viewporter
    unstable/pointer-constraints/pointer-constraints-unstable-v1
    unstable/relative-pointer/relative-pointer-unstable-v1
    unstable/text-input/text-input-unstable-v3
    unstable/pointer-gestures/pointer-gestures-unstable-v1
'
urls='
    https://cvsweb.openbsd.org/checkout/src/include/sndio.h?rev=1.17
'
rm -rf include
mkdir include
cd include
for header in $headers; do
    cp -r /usr/include/$header .
done
rm -r X11/dri X11/fonts GL/internal xkbcommon/xkbregistry.h
for protocol in ../wayland/wayland $protocols; do
    name=${protocol##*/}
    wayland-scanner client-header </usr/share/wayland-protocols/$protocol.xml >$name-client-protocol.h
    wayland-scanner private-code </usr/share/wayland-protocols/$protocol.xml >$name-protocol.c
done
for url in $urls; do
    curl -OL $url
done
