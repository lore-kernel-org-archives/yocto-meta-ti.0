Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B6C0EE00B30; Mon, 25 Apr 2016 10:58:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.17 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E99EE00AAB
	for <meta-ti@yoctoproject.org>; Mon, 25 Apr 2016 10:56:58 -0700 (PDT)
Received: from vz-proxy-l003.mx.aol.com ([64.236.82.155])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O67004N2B66CI80@vms173017.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 25 Apr 2016 12:56:31 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=i+tV1o3iWEoTTvx3QNPGxA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=SeJH2icdfR3x7s8erkIA:9
Received: by 100.15.86.14 with SMTP id 65c523c7; Mon, 25 Apr 2016 17:56:31 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7D8BF161FB4;	Mon,
	25 Apr 2016 13:56:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 25 Apr 2016 13:56:26 -0400
Message-id: <1461606987-25418-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 1/2] sgx: rename and clean up kernel and user space components
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Apr 2016 17:58:25 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf                                    |  4 +--
 ...14.3699939.bb => ti-sgx-ddk-km_1.14.3699939.bb} |  8 ++++++
 ...14.3699939.bb => ti-sgx-ddk-um_1.14.3699939.bb} | 29 +++++++++++++++++++---
 3 files changed, 35 insertions(+), 6 deletions(-)
 rename recipes-bsp/powervr-drivers/{omapdrm-pvr_1.14.3699939.bb => ti-sgx-ddk-km_1.14.3699939.bb} (87%)
 rename recipes-graphics/libgles/{omap5-sgx-ddk-um-linux_1.14.3699939.bb => ti-sgx-ddk-um_1.14.3699939.bb} (54%)

diff --git a/conf/layer.conf b/conf/layer.conf
index 95ffe8e..4ad5022 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -11,8 +11,8 @@ BBFILE_PRIORITY_meta-ti = "6"
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    omapdrm-pvr \
-    omap5-sgx-ddk-um-linux \
+    ti-sgx-ddk-km \
+    ti-sgx-ddk-um \
     ti-ipc \
     ti-ipc-rtos \
     cmem-mod \
diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
similarity index 87%
rename from recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
rename to recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index e6e4e5d..0e99791 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -12,6 +12,14 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+DEPENDS = "virtual/kernel"
+
+PROVIDES = "omapdrm-pvr"
+
+RPROVIDES_${PN} = "omapdrm-pvr"
+RREPLACES_${PN} = "omapdrm-pvr"
+RCONFLICTS_${PN} = "omapdrm-pvr"
+
 BRANCH = "ti-img-sgx/${PV}/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
similarity index 54%
rename from recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
rename to recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
index a79c61f..c29b9fe 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.14.3699939.bb
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
@@ -10,6 +10,18 @@ BRANCH = "ti-img-sgx/${PV}"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git;protocol=git;branch=${BRANCH}"
 SRCREV = "626c4f773b7c704f1d9a55ca80f60a79f809186d"
 
+# There's only hardfp version available
+python __anonymous() {
+    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
+    if not tunes:
+        return
+    pkgn = bb.data.getVar("PN", d, 1)
+    pkgv = bb.data.getVar("PV", d, 1)
+    if "callconvention-hard" not in tunes:
+        bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+        raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
+}
+
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
@@ -20,13 +32,21 @@ INITSCRIPT_PARAMS = "defaults 8"
 inherit update-rc.d
 
 PR = "r8"
-PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2"
+PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-sgx-ddk-um-linux"
 
 RDEPENDS_${PN} += "libdrm libudev libgbm wayland libffi libdrm-omap"
 
-RREPLACES_${PN} = "libegl libgles1 libgles2"
-RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev"
-RREPLACES_${PN}-dbg = "libegl-dbg"
+RPROVIDES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RPROVIDES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RPROVIDES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+RREPLACES_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RREPLACES_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RREPLACES_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
+
+RCONFLICTS_${PN} = "libegl libgles1 libgles2 omap5-sgx-ddk-um-linux"
+RCONFLICTS_${PN}-dev = "libegl-dev libgles1-dev libgles2-dev omap5-sgx-ddk-um-linux-dev"
+RCONFLICTS_${PN}-dbg = "libegl-dbg libgles1-dbg libgles2-dbg omap5-sgx-ddk-um-linux-dbg"
 
 S = "${WORKDIR}/git"
 
@@ -48,6 +68,7 @@ RDEPENDS_${PN} += "${PN}-plugins"
 ALLOW_EMPTY_${PN}-plugins = "1"
 
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
 
 INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"
 INSANE_SKIP_${PN}-plugins = "dev-so"
-- 
2.2.0


