# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde5

DESCRIPTION="KDE Telepathy account management kcm"
HOMEPAGE="http://community.kde.org/Real-Time_Communication_and_Collaboration"

LICENSE="LGPL-2.1"
KEYWORDS="~amd64 ~x86"
IUSE="experimental"

COMMON_DEPEND="
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemviews)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_kdeapps_dep kaccounts-integration)
	dev-qt/qtdbus:5
	dev-qt/qtgui:5
	dev-qt/qtnetwork:5
	dev-qt/qtwidgets:5
	net-libs/accounts-qt
	net-libs/signond
	net-libs/telepathy-qt[qt5]
"
DEPEND="
	${COMMON_DEPEND}
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kio)
	net-libs/libaccounts-glib
"
RDEPEND="${COMMON_DEPEND}
	$(add_kdeapps_dep kaccounts-providers)
	net-im/telepathy-connection-managers
	!net-im/ktp-accounts-kcm
"

src_prepare() {
	if use experimental; then
		mv "${S}"/data/kaccounts/disabled/*.in "${S}"/data/kaccounts/ || die "couldn't enable experimental services"
	fi
	kde5_src_prepare
}

pkg_postinst() {
	if use experimental; then
		ewarn "Experimental providers are enabled."
		ewarn "Most of them aren't integrated nicely and may require additional steps for account creation."
		ewarn "Use at your own risk!"
	fi
}
