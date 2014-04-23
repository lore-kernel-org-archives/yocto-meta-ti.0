Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EF4B9E00B50
	for <meta-ti@yoctoproject.org>; Wed, 23 Apr 2014 14:55:07 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I0034K7JTMO80@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 23 Apr 2014 16:55:06 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BC1AA20396; Wed,
	23 Apr 2014 17:55:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 23 Apr 2014 17:54:52 -0400
Message-id: <1398290092-20034-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398290092-20034-1-git-send-email-denis@denix.org>
References: <1398290092-20034-1-git-send-email-denis@denix.org>
Subject: [PATCH 3/3] recipes: use proper TI-TSPA license name instead of TSPA
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
X-List-Received-Date: Wed, 23 Apr 2014 21:55:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb    | 4 ++--
 recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb        | 2 +-
 recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb        | 2 +-
 recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb        | 4 ++--
 recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb        | 4 ++--
 recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb        | 4 ++--
 recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb        | 4 ++--
 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb | 4 ++--
 recipes-ti/c6accel/ti-c6accel.inc                           | 2 +-
 9 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
index f7b9d66..15aa8a6 100644
--- a/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3-x11_4.09.00.01.bb
@@ -1,8 +1,8 @@
 require libgles-omap3-x11.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 DEFAULT_PREFERENCE = "-1"
 
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
index 990b425..e466aab 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.01.bb
@@ -1,6 +1,6 @@
 require libgles-omap3.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
index 59ef358..f4cd9ae 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.08.00.02.bb
@@ -1,6 +1,6 @@
 require libgles-omap3.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
 BINLOCATION_omap3  = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
index fec84fd..373dd9d 100644
--- a/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_4.09.00.01.bb
@@ -1,8 +1,8 @@
 require libgles-omap3-no-x.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
index e48ec63..22e510b 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.00.00.01.bb
@@ -1,8 +1,8 @@
 require libgles-omap3-no-x.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
index a3b34fe..607b44a 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.01.00.01.bb
@@ -1,8 +1,8 @@
 require libgles-omap3-no-x.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
index 2d11317..0b1b8ca 100644
--- a/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
+++ b/recipes-graphics/libgles/libgles-omap3_5.01.01.01.bb
@@ -1,8 +1,8 @@
 require libgles-omap3-no-x.inc
 
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 BINLOCATION_omap3 = "${S}/gfx_rel_es3.x"
 BINLOCATION_ti816x = "${S}/gfx_rel_es6.x"
diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
index 8a03cd2..37ca7d8 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Userspace libraries for omap5 sgx"
 HOMEPAGE = "http://downloads.ti.com/dsps/dsps_public_sw/gfxsdk"
-LICENSE = "TSPA"
+LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://OMAP5-Linux-Graphics-DDK-UM-Manifest.doc;md5=d280df8e94bb2e7b9251c8526078eeb8"
 
 COMPATIBLE_MACHINE = "omap-a15"
@@ -9,7 +9,7 @@ INHIBIT_PACKAGE_STRIP = "1"
 
 SRC_URI = "http://downloads.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/gfxsdk/OMAP5_1_09_00_10//exports/${PN}-${PV}.tar.gz;protocol=http"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI[md5sum] = "3cfb875de031098a4c1eeeaf4e442367"
 SRC_URI[sha256sum] = "20b849088c0fd3ee5dd6bad8ddf16fb2b3267aa053cf3488c762fbc72f22489a"
diff --git a/recipes-ti/c6accel/ti-c6accel.inc b/recipes-ti/c6accel/ti-c6accel.inc
index 638c9be..65990a8 100644
--- a/recipes-ti/c6accel/ti-c6accel.inc
+++ b/recipes-ti/c6accel/ti-c6accel.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "TI C6Accel - DSP Software Libraries on ARM"
 HOMEPAGE = "https://gforge01.dal.design.ti.com/gf/project/dsplib4arm/"
 
 SECTION = "devel"
-LICENSE = "TI TSPA"
+LICENSE = "TI-TSPA"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
-- 
1.9.2


