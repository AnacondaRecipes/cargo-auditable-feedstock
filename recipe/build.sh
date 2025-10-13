#!/usr/bin/env bash

set -euxo pipefail

# OSX: Reserve maximum extra space in the binary header for library paths so they can be modified after compilation without breaking the file.
if [[ "${target_platform}" == osx-* ]]; then
    export RUSTFLAGS="$RUSTFLAGS -Clink-arg=-Wl,-headerpad_max_install_names"
fi

cargo install --no-track --locked --root ${PREFIX} --path cargo-auditable
cargo-bundle-licenses --format yaml --output ${SRC_DIR}/THIRDPARTY.yml