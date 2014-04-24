Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 099BCE00B81
	for <meta-ti@yoctoproject.org>; Thu, 24 Apr 2014 10:49:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id BDA6B52AB4; Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140424174904.BDA6B52AB4@arago-project.org>
Date: Thu, 24 Apr 2014 17:49:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : recipes: use proper TI-TSPA license name instead of TSPA
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
X-List-Received-Date: Thu, 24 Apr 2014 17:49:05 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dora
Commit: 97067d97d33020042b800549cd670aa2fa94d40b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=97067d97d33020042b800549cd670aa2fa94d40b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Apr 24 03:54:52 2014 +0000

recipes: use proper TI-TSPA license name instead of TSPA

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/libgles-omap3-x11_4.09.00.01.bb        |    4 ++--
 .../libgles/libgles-omap3_4.08.00.01.bb            |    2 +-
 .../libgles/libgles-omap3_4.08.00.02.bb            |    2 +-
 .../libgles/libgles-omap3_4.09.00.01.bb            |    4 ++--
 .../libgles/libgles-omap3_5.00.00.01.bb            |    4 ++--
 .../libgles/libgles-omap3_5.01.00.01.bb            |    4 ++--
 .../libgles/libgles-omap3_5.01.01.01.bb            |    4 ++--
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.10.bb     |    4 ++--
 recipes-ti/c6accel/ti-c6accel.inc                  |    2 +-
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


