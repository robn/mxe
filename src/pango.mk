# This file is part of MXE.
# See index.html for further information.

PKG             := pango
$(PKG)_IGNORE   :=
$(PKG)_VERSION  := 1.35.3
$(PKG)_CHECKSUM := ca439b3947854bf7bf8b8235c29427f357fb6e8c
$(PKG)_SUBDIR   := pango-$($(PKG)_VERSION)
$(PKG)_FILE     := pango-$($(PKG)_VERSION).tar.xz
$(PKG)_URL      := http://ftp.gnome.org/pub/gnome/sources/pango/$(call SHORT_PKG_VERSION,$(PKG))/$($(PKG)_FILE)
$(PKG)_DEPS     := gcc fontconfig freetype cairo glib harfbuzz

define $(PKG)_UPDATE
    $(WGET) -q -O- 'http://git.gnome.org/browse/pango/refs/tags' | \
    grep '<a href=' | \
    $(SED) -n "s,.*<a href='[^']*/tag/?id=\\([0-9][^']*\\)'.*,\\1,p" | \
    head -1
endef

define $(PKG)_BUILD
    rm '$(1)'/docs/Makefile.am
    cd '$(1)' && NOCONFIGURE=1 ./autogen.sh
    cd '$(1)' && ./configure \
        --host='$(TARGET)' \
        --build="`config.guess`" \
        --disable-shared \
        --prefix='$(PREFIX)/$(TARGET)' \
        --enable-explicit-deps \
        --with-included-modules \
        --without-dynamic-modules \
        CXX='$(TARGET)-g++'
    $(MAKE) -C '$(1)' -j '$(JOBS)' install bin_PROGRAMS= sbin_PROGRAMS= noinst_PROGRAMS=
endef
