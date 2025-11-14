# Lakka - The DIY retro emulation console

Lakka is a lightweight Linux distribution that transforms a small computer into a full blown emulation console.

An optimized build of Lakka 4.x specifically for the Raspberry Pi 4b. Includes a curated list of emulator cores that have been tested to work well on a Raspberry Pi 4b. In some cases this means running an older build and in others newer builds are used. All cores have been tested to work well on the Raspberry Pi 4b. In some cases multiple cores are provided for the same system which can be used on a per game basis.

I run this build in an original Playstation 1 case with a Raspberry Pi. The power and reset buttons are wired to the GPIO with python scripts to perform actions for reset, power off, and LED control.

## Technical Details
- Pi Firmware: 2025-03-27
- Mesa drivers: v24.0.9
- Python: 3.11

## Emulators supported in build:

| Emulator            | System                     |
|---------------------|----------------------------|
| stella              | Atari 2600/5200            |
| bluemsx             | Colecovision/MSX           |
| bnes                | NES                        |
| fceumm              | NES                        |
| bsnes               | Super NES                  |
| snes9x              | Super NES                  |
| genesis_plus_gx     | Sega Genesis/Megadrive     |
| picodrive           | SEGA CD/32x                |
| pcsx_rearmed        | PSX                        |
| swanstation         | PSX                        |
| duckstation         | PSX                        |
| mupen64plus_next    | Nintendo 64                |
| gambatte            | Gameboy Advance            |
| ppsspp              | Playstation Portable       |
| flycast             | Dreamcast                  |

## Installation instructions

Installation is the same as the main. Please refer to this website https://www.lakka.tv/get on how to setup Lakka.

You will need to provide your own bios files to be put in the /system folder and your own game files to put in the /roms folder.

