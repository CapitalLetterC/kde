# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_HANDBOOK="optional"
KDE_SELINUX_MODULE="games"
inherit kde4-base

DESCRIPTION="KDE Board Game"
HOMEPAGE="
	http://www.kde.org/applications/games/kreversi/
	http://games.kde.org/game.php?game=kreversi
"
KEYWORDS=""
IUSE="debug"

DEPEND="$(add_kdeapps_dep libkdegames '' '14.12.3')"
RDEPEND="${DEPEND}"
