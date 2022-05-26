# NfSen Patches

The purpose of this repository
is to track the sources of [NfSen](http://nfsen.sourceforge.net/) from [SourceForge](https://sourceforge.net/projects/nfsen/) 
and manage patches for the released versions.

This repository is organized as follows.

## Branches

Branch *main* just contains this README and the script in the root of the repository.

Branch *sourceforge* contains the pristine sources of NfSen from SourceForge.
These are imported from the tar file and tagged with the version (e.g. 1.3.8).

Branches named *sf-$version* start at the version in branch *sourceforge* that is tagged with $version.
These branches take the changes for the correspondent versions of NfSen.

# Patches

To get a patch use the script `get-patch.sh` like this:

    ./get-patch.sh 1.3.8 > nfsen-1.3.8.patch

The patch can then be applied to the pristine sources that you can get from SourceForge.

    tar xzf nfsen-1.3.8.tar.gz
    cd nfsen-1.3.8
    patch -p2 < ../nfsen-1.3.8.patch

