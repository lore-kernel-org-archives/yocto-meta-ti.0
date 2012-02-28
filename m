Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D8F4BE0123C
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 14:13:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DAD82529BA; Tue, 28 Feb 2012 22:13:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120228221335.DAD82529BA@arago-project.org>
Date: Tue, 28 Feb 2012 22:13:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : matrix-tui: deprecated
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 22:13:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 827f9e9a8a8d933791966da46e9ad9d1a57b0403
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=827f9e9a8a8d933791966da46e9ad9d1a57b0403

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Feb 28 17:05:03 2012 -0500

matrix-tui: deprecated

Remove matrix-tui, since it has been deprecated and no longer supported.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/matrix/matrix-tui.inc    |   44 -----------------------------------
 recipes-ti/matrix/matrix-tui/init   |   24 -------------------
 recipes-ti/matrix/matrix-tui_1.1.bb |    4 ---
 3 files changed, 0 insertions(+), 72 deletions(-)

diff --git a/recipes-ti/matrix/matrix-tui.inc b/recipes-ti/matrix/matrix-tui.inc
deleted file mode 100644
index 3be1295..0000000
--- a/recipes-ti/matrix/matrix-tui.inc
+++ /dev/null
@@ -1,44 +0,0 @@
-DESCRIPTION = "Matrix TUI"
-HOMEPAGE = "https://gforge.ti.com/gf/project/matrix_tui/"
-LICENSE = "BSD"
-SECTION = "multimedia"
-DEPENDS = "libxml2 zlib ncurses"
-
-INC_PR = "r7"
-
-COMPATIBLE_MACHINE = "(omapl138|omap3)"
-
-SRC_URI = "svn://gforge.ti.com/svn/matrix_tui/;module=trunk;proto=https;user=anonymous;pswd='' \
-	file://init \
-"
-
-S = "${WORKDIR}/trunk"
-
-# Do not auto-start TUI by default, uncomment otherwise
-#inherit update-rc.d
-#INITSCRIPT_NAME = "matrix-tui"
-#INITSCRIPT_PARAMS = "defaults 99"
-
-do_configure() {
-	sed -i -e 's|LIBS :=|LIBS := ${LDFLAGS} |' Release/objects.mk
-}
-
-do_compile() {
-	# don't build debug version
-	touch debug
-	export CROSS_COMPILE=${TARGET_PREFIX}
-	export TUI_INCLUDE_PATH=${STAGING_INCDIR}
-	export XML_INCLUDE_PATH=${STAGING_INCDIR}/libxml2
-	export TUI_LIB_PATH=${STAGING_LIBDIR}
-	export PLATFORM=${MACHINE}
-	make release
-}
-
-do_install() {
-	export PLATFORM=${MACHINE}
-	make DESTDIR=${D} install
-	install -d ${D}${sysconfdir}/init.d/
-	install -c -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/matrix-tui
-}
-
-FILES_${PN} += "${datadir}/matrix/*"
diff --git a/recipes-ti/matrix/matrix-tui/init b/recipes-ti/matrix/matrix-tui/init
deleted file mode 100755
index e581382..0000000
--- a/recipes-ti/matrix/matrix-tui/init
+++ /dev/null
@@ -1,24 +0,0 @@
-#! /bin/sh
-
-matrixtui="/usr/bin/matrix_tui"
-TUI_OPTS="/usr/share/matrix/xml/matrix.xml"
-
-test -x "$matrixtui" || exit 0
-
-case "$1" in
-  start)
-    echo -n "Starting Matrix TUI application"
-    start-stop-daemon --start --quiet --background --pidfile /var/run/matrix-tui.pid --exec $matrixtui -- $TUI_OPTS
-    echo "."
-    ;;
-  stop)
-    echo -n "Stopping Matrix TUI application"
-    start-stop-daemon --stop --quiet --pidfile /var/run/matrix-tui.pid
-    echo "."
-    ;;
-  *)
-    echo "Usage: /etc/init.d/matrix-tui {start|stop}"
-    exit 1
-esac
-
-exit 0
diff --git a/recipes-ti/matrix/matrix-tui_1.1.bb b/recipes-ti/matrix/matrix-tui_1.1.bb
deleted file mode 100644
index 9814d5f..0000000
--- a/recipes-ti/matrix/matrix-tui_1.1.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-require matrix-tui.inc
-
-SRCREV = "37"
-PR = "${INC_PR}.4"


