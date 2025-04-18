PKG_NAME="retroarch_joypad_autoconfig"
PKG_VERSION="91af80b8b54bfc793f470017c1962106de7a4388"
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

  #remove conflicting joypads configs
  safe_remove "${INSTALL}"/etc/retroarch-joypad-autoconfig/udev/Hyperkin_Genesis_6_Button.cfg
  safe_remove "${INSTALL}"/etc/retroarch-joypad-autoconfig/udev/Retro-Bit_Genesis_Saturn_8_Button_Arcade_Pad.cfg
  safe_remove "${INSTALL}"/etc/retroarch-joypad-autoconfig/udev/Retrolink_Sega_Saturn_USB_GamePad.cfg
  safe_remove "${INSTALL}"/etc/retroarch-joypad-autoconfig/udev/Retrolink_N64_USB_controller.cfg

  #Place Working configs
  cp -Pr "${PKG_DIR}"/joypad_configs/* "${INSTALL}"/etc/retroarch-joypad-autoconfig/

}

