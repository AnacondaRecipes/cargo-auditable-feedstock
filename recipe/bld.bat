@echo off

cargo install --no-track --locked --root %PREFIX% --path cargo-auditable
if errorlevel 1 exit 1
cargo-bundle-licenses --format yaml --output %SRC_DIR%/THIRDPARTY.yml
if errorlevel 1 exit 1
