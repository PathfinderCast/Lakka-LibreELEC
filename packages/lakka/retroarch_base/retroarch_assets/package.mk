PKG_NAME="retroarch_assets"
PKG_VERSION="818aca56efd784624a241a12936b5c0864e3ddd8"
PKG_LICENSE="CC-BY-4.0"
PKG_SITE="https://github.com/libretro/retroarch-assets"
PKG_URL="${PKG_SITE}.git"
PKG_DEPENDS_TARGET="gcc:host"
PKG_LONGDESC="RetroArch assets. Background and icon themes for the menu drivers."
PKG_TOOLCHAIN="manual"

makeinstall_target() {
  cd ${PKG_BUILD}
  make install INSTALLDIR="${INSTALL}/usr/share/retroarch/assets"

  # Replace default lakka logo
  cp -Pr "${PKG_DIR}"/lakka.png "${INSTALL}"/usr/share/retroarch/assets/xmb/monochrome/png/lakka.png
}

post_makeinstall_target() {
  # Remove unnecessary files
  safe_remove ${INSTALL}/usr/share/retroarch/assets/devtools
  safe_remove ${INSTALL}/usr/share/retroarch/assets/README.md
}
