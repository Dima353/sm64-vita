# Super Mario 64 Port

- This repo contains a full decompilation of Super Mario 64 (J), (U), (E), and (SH).
- Naming and documentation of the source code and data structures are in progress.
- Beyond Nintendo 64, it can also target the PS Vita.

This repo does not include all assets necessary for compiling the game.
A prior copy of the game is required to extract the assets.

## Building for the Vita
Savedata is stored at `ux0:data/sm64_save_file.bin`. `cont.m64` can be put either into the same folder, or into `ux0:app/PCSE64001/` for TAS input.

### Prerequisites
For running this on the PS Vita you will first need to extract the runtime shader compiler. Follow this [guide](https://samilops2.gitbook.io/vita-troubleshooting-guide/shader-compiler/extract-libshacccg.suprx) for help with that.

Ubuntu or WSL
- `sudo apt install -y git build-essential pkg-config`
- `sudo apt install python-is-python3`


### Build Instructions
1. Install [Vita SDK](https://github.com/vitasdk/vdpm)

If you encounter error `Invalid hostname error while running bootstrap-vitasdk.sh` then make changes to the file:
`vdpm\include\install-vitasdk.sh`

Before:
```bash
get_download_link () {
  wget -qO- https://github.com/vitasdk/vita-headers/raw/master/.travis.d/last_built_toolchain.py | python - $@
}
```
After modification:
```bash
get_download_link () {
  wget -qO- https://github.com/vitasdk/vita-headers/raw/master/.travis.d/last_built_toolchain.py | $(which python||which python3) - $@
}
```
2. Clone the repo, which will create a directory and then enter it

- `git clone https://github.com/Dima353/sm64-vita.git`
- `cd sm64-vita`

3. Place a Super Mario 64 ROM called `baserom.<VERSION>.z64` into the repository's root directory for asset extraction, 
where VERSION can be `us`, `jp`, or `eu`.
4. Building
    - Run `./build_deps.sh` to build and install dependencies. This only has to be done once.
    - Run `make TARGET_VITA=1 vpk` to build the game. Add `-j4` to improve build time.
5. The installable vpk will be located at `build/us_vita/sm64.<VERSION>.vpk`
6. To add patches, look in `README.md` along the path: `sm64-vita\enhancements`

## Known Issues

1. TAS Input stops working if the app is suspended or the Vita is put to sleep.

## Contributing

If you want to make it better, fork it and make it better. Thanks. 

## Credits

* WOLFwang for making the livearea assets.
* fgsfds for the initial effort towards porting to the vita.
* The original sm64decomp team for this impressive decompilation.
* The sm64-port team for the work towards porting the decomp to other platforms.
* Rinnegatamante for making the vitaGL library, it made this port alot easier.
* bythos14 for the initial port
* martepato Fixing the bythos14 repo
