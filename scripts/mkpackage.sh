#!/bin/sh

# Increment release number
RELEASE="`cat scripts/release`"
RELEASE=$(( $RELEASE + 1 ))
echo $RELEASE > release

# Set package control information
make control

# Update package
fakeroot dpkg-deb --build debian output
