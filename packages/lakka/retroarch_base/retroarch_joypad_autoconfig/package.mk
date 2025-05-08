PKG_NAME="retroarch_joypad_autoconfig"
PKG_VERSION="07bc9d42b067960521c900e364c9571662a975b1" #v1.21.1
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/libretro/retroarch-joypad-autoconfig"
PKG_URL="${PKG_SITE}.git"
PKG_LONGDESC="RetroArch joypad autoconfig files"
PKG_DEPENDS_TARGET="gcc:host"
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  make -C ${PKG_BUILD} install INSTALLDIR="${INSTALL}/etc/retroarch-joypad-autoconfig" DOC_DIR="${INSTALL}/etc/doc/."

  #Remove non tested joycon configs
  for file in "${INSTALL}"/etc/retroarch-joypad-autoconfig/udev/Nintendo*.cfg; do
    safe_remove "$file"
  done

  #remove conflicting SNES joypads configs
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/dinput/Retro-Bit_Genesis_Saturn_8_Button_Arcade_Pad.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/dinput/Retrolink_(S)NES_USB.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/hid/Generic_NES_USB_Controller.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Hyperkin_Genesis_6_Button.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/iNNEXT SNES remote.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Retro-Bit_Genesis_Saturn_8_Button_Arcade_Pad.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Retrolink_Sega_Saturn_USB_GamePad.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/xinput/Retrolink_(S)NES_USB.cfg"
  #remove conflicting N64 joypads configs
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/dinput/Defender Joystick Cobra R4.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/dinput/Retrolink_N64_USB.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/dinput/SQONYY_gamepad.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/hid/DragonRise_ZeroDelay.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/hid/Retrolink_N64_USB_Controller.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/sdl2/DragonRise Inc. Generic USB Joystick.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/DragonRise_Inc._PC_TWIN_SHOCK_Gamepad.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/DragonRise_N64.cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Generic   USB  Joystick  .cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Microntek              USB Joystick          .cfg"
  safe_remove "${INSTALL}/etc/retroarch-joypad-autoconfig/udev/Retrolink_N64_USB_controller.cfg"

  #Place Working configs
  cp -Pr "${PKG_DIR}"/joypad_configs/* "${INSTALL}"/etc/retroarch-joypad-autoconfig/

}

