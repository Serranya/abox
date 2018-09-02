#! /bin/bash

set -o errexit
set -o pipefail
set -o nounset

gpg --recv-keys DBE7D3DD8C81D58D0A13D0E76BC26A17B9B7018A
git clone https://aur.archlinux.org/aurutils.git
cd aurutils
makepkg -rc
cd ..
