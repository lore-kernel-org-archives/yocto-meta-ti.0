Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A63CCE00749
	for <meta-ti@yoctoproject.org>; Tue, 28 Feb 2012 14:57:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 42623529BA; Tue, 28 Feb 2012 22:57:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120228225723.42623529BA@arago-project.org>
Date: Tue, 28 Feb 2012 22:57:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Khem Raj : meta-ti: Fix quotes to make new bitbake happy
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
X-List-Received-Date: Tue, 28 Feb 2012 22:57:23 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c44b242d8509738df60a7cbb57f9a5f27e103fad
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c44b242d8509738df60a7cbb57f9a5f27e103fad

Author: Khem Raj <raj.khem@gmail.com>
Date:   Tue Feb 28 11:39:16 2012 -0800

meta-ti: Fix quotes to make new bitbake happy

Changes from the original patch:
* Matrix is no longer available, no fixes necessary
* Most of the recipes-ti/ was cleaned up by Koen's earlier patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot.inc               |    2 +-
 recipes-bsp/x-load/x-load.inc               |    2 +-
 recipes-bsp/x-load/x-load_git.bb            |    2 +-
 recipes-ti/codec-engine/ti-codec-engine.inc |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot.inc b/recipes-bsp/u-boot/u-boot.inc
index 9303568..720f995 100644
--- a/recipes-bsp/u-boot/u-boot.inc
+++ b/recipes-bsp/u-boot/u-boot.inc
@@ -44,7 +44,7 @@ do_install () {
 
 FILES_${PN} = "/boot ${sysconfdir}"
 # no gnu_hash in uboot.bin, by design, so skip QA
-INSANE_SKIP_${PN} = True
+INSANE_SKIP_${PN} = "1"
 
 inherit deploy
 
diff --git a/recipes-bsp/x-load/x-load.inc b/recipes-bsp/x-load/x-load.inc
index c8ab3e9..7a9638b 100644
--- a/recipes-bsp/x-load/x-load.inc
+++ b/recipes-bsp/x-load/x-load.inc
@@ -17,7 +17,7 @@ XLOAD_USB_SYMLINK ?= "x-load-usb-${MACHINE}.bin"
 MLO_IMAGE ?= "MLO-${MACHINE}-${PV}-${PR}"
 MLO_SYMLINK ?= "MLO-${MACHINE}"
 MLO_SYMLINK_NOMACHINE ?= "MLO"
-XLOAD_LOAD_ADDRESS ?= 0x40200800
+XLOAD_LOAD_ADDRESS ?= "0x40200800"
 
 do_compile () {
 	unset LDFLAGS
diff --git a/recipes-bsp/x-load/x-load_git.bb b/recipes-bsp/x-load/x-load_git.bb
index 1017e38..dd8bce2 100644
--- a/recipes-bsp/x-load/x-load_git.bb
+++ b/recipes-bsp/x-load/x-load_git.bb
@@ -13,7 +13,7 @@ SRC_URI = "git://gitorious.org/x-loader/x-loader.git;branch=master;protocol=git
 S = "${WORKDIR}/git"
 
 XLOAD_MACHINE_beagleboard = "omap3530beagle_config"
-CONFIG_HEADER_beagleboard = 1
+CONFIG_HEADER_beagleboard = "1"
 XLOAD_MACHINE_omap3-touchbook = "omap3530beagle_config"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
diff --git a/recipes-ti/codec-engine/ti-codec-engine.inc b/recipes-ti/codec-engine/ti-codec-engine.inc
index 4fb5575..15bd464 100644
--- a/recipes-ti/codec-engine/ti-codec-engine.inc
+++ b/recipes-ti/codec-engine/ti-codec-engine.inc
@@ -194,6 +194,6 @@ RDEPENDS_ti-codec-engine-examples_append_omap3    = " ti-dsplink-module ti-lpm-m
 RDEPENDS_ti-codec-engine-examples_append_omapl137 = " ti-dsplink-module"
 RDEPENDS_ti-codec-engine-examples_append_omapl138 = " ti-dsplink-module"
 FILES_ti-codec-engine-examples = "${installdir}/ti-codec-engine-examples/*"
-INSANE_SKIP_ti-codec-engine-examples = True
+INSANE_SKIP_ti-codec-engine-examples = "1"
 
 FILES_${PN}-dbg += "${installdir}/ti-codec-engine-examples/*/.debug"


