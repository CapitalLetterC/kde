# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_PUNT_BOGUS_DEPS="true"
inherit kde5

# version scheme fail by upstream
if [[ ${KDE_BUILD_TYPE} = release ]]; then
	PLASMA_VERSION=5.3.0
	SRC_URI="mirror://kde/unstable/plasma/${PLASMA_VERSION}/${PN}-${PV}.tar.xz"
fi

DESCRIPTION="Framework for searching and managing metadata"
KEYWORDS=""
IUSE=""

DEPEND="
	$(add_frameworks_dep kauth)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kcrash)
	$(add_frameworks_dep kdbusaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kidletime)
	$(add_frameworks_dep kio)
	$(add_frameworks_dep solid)
	$(add_plasma_dep kfilemetadata)
	dev-db/lmdb
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtsql:5
	dev-qt/qtwidgets:5
	sys-apps/attr
	!<kde-base/nepomuk-4.12.50
"
RDEPEND="${DEPEND}
	!kde-base/baloo:4[-minimal(-)]
	!kde-base/baloo:5
"
