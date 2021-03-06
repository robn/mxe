# This file is part of MXE.
# See index.html for further information.

PKG                := libnut
$(PKG)_IGNORE      :=
$(PKG)_VERSIONDATE := 20110421
$(PKG)_VERSIONREV  := r678
$(PKG)_VERSION     := $($(PKG)_VERSIONDATE)-$($(PKG)_VERSIONREV)
$(PKG)_CHECKSUM    := 4cb226110aaae672a70955fe39062409973bcfdc
$(PKG)_SUBDIR      := $(PKG)-$($(PKG)_VERSIONREV)
$(PKG)_FILE        := $(PKG)-$($(PKG)_VERSIONREV).tar.gz
$(PKG)_URL         := https://launchpad.net/$(PKG)/trunk/$($(PKG)_VERSIONREV)/+download/$($(PKG)_FILE)
$(PKG)_DEPS        := gcc

define $(PKG)_UPDATE
    echo "TODO: libnut-UPDATE"
endef

define $(PKG)_BUILD
    $(MAKE) -C '$(1)' -j '$(JOBS)' CC='$(TARGET)-gcc' AR='$(TARGET)-ar' RANLIB='$(TARGET)-ranlib' PREFIX='$(PREFIX)/$(TARGET)'
    $(MAKE) -C '$(1)' -j 1 install CC='$(TARGET)-gcc' AR='$(TARGET)-ar' RANLIB='$(TARGET)-ranlib' PREFIX='$(PREFIX)/$(TARGET)'
endef
