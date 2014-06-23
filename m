Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE8D2E00282; Mon, 23 Jun 2014 15:04:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CCAFDE00282
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:04:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id ACBDB52A04; Mon, 23 Jun 2014 22:04:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623220449.ACBDB52A04@arago-project.org>
Date: Mon, 23 Jun 2014 22:04:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ash Charles : Use INSANE_SKIP_${PN} = "installed-vs-shipped"
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
X-List-Received-Date: Mon, 23 Jun 2014 22:04:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: ec85fc2d3b884da85152e6e7e5ea16970d80fa8a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ec85fc2d3b884da85152e6e7e5ea16970d80fa8a

Author: Ash Charles <ashcharles@gmail.com>
Date:   Sat Jun 14 04:34:07 2014 +0000

Use INSANE_SKIP_${PN} = "installed-vs-shipped"

A number of recipes in recipes-ti install more files than are
packaged causing lots of QA errors.  We choose to ignore these.

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/bios/ti-biosutils_1.02.02.bb            |    1 +
 recipes-ti/bios/ti-dspbios_5.41.11.38.bb           |    2 ++
 .../codec-engine/ti-codec-engine_2.26.02.11.bb     |    2 ++
 .../codec-engine/ti-codecs-omap3530_4.00.00.00.bb  |    2 +-
 recipes-ti/devtools/ti-cgt6x_7.2.7.bb              |    2 ++
 recipes-ti/devtools/ti-xdctools_3.23.00.32.bb      |    2 ++
 recipes-ti/dmai/ti-dmai_svn.bb                     |    1 +
 recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb        |    1 +
 recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb     |    1 +
 .../ti-framework-components_2.26.00.01.bb          |    2 +-
 recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb  |    1 +
 .../ti-local-power-manager_1.24.02.09.bb           |    1 +
 recipes-ti/xdais/ti-xdais_6.26.01.03.bb            |    2 +-
 13 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/bios/ti-biosutils_1.02.02.bb b/recipes-ti/bios/ti-biosutils_1.02.02.bb
index 918f124..5b6b4f4 100644
--- a/recipes-ti/bios/ti-biosutils_1.02.02.bb
+++ b/recipes-ti/bios/ti-biosutils_1.02.02.bb
@@ -6,3 +6,4 @@ PVsuffix = "_02"
 SRC_URI[biosutilstarball.md5sum] = "0654e9e72b0a6fc7a6575829c0cd90c9"
 SRC_URI[biosutilstarball.sha256sum] = "df486500bdc8dbe3800fc7efe4241e6fa5b1827ba7c0dc17a71b41d42ef921e1"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
index 9e3b695..f60f6c0 100644
--- a/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
+++ b/recipes-ti/bios/ti-dspbios_5.41.11.38.bb
@@ -5,3 +5,5 @@ PV = "5_41_11_38"
 SRC_URI[biosbin.md5sum] = "7fab13740c25f5b34b331bcdc759536e"
 SRC_URI[biosbin.sha256sum] = "96b8e090f79420a4c11d9c0c10d182d1d3b4afb48f11ec375c97b4c91970d0a0"
 
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
index bcb89b7..4a27b1d 100644
--- a/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
+++ b/recipes-ti/codec-engine/ti-codec-engine_2.26.02.11.bb
@@ -8,3 +8,5 @@ SRC_URI += "file://bypass-GCArmv5T-used-is-sealed.patch"
 
 SRC_URI[cetarball.md5sum] = "4f755f77119e4da19ab5cc7ae7ccfdb4"
 SRC_URI[cetarball.sha256sum] = "17fa053719265e0901fe3c3f90c9204957c6d0f5351d6b3ba4900df58cb7300f"
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
index ea9f389..5c87b4c 100644
--- a/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
+++ b/recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb
@@ -205,4 +205,4 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES += "ti-codecs-omap3530-server"
 FILES_ti-codecs-omap3530-server = "${installdir}/ti-codecs-server/*"
 
-
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
index aab1b96..a226600 100644
--- a/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
+++ b/recipes-ti/devtools/ti-cgt6x_7.2.7.bb
@@ -9,3 +9,5 @@ PVwithdots = "7.2.7"
 SRC_URI[cgt6xbin.md5sum] = "71a0768a541fdebd9c35d44301019d1d"
 SRC_URI[cgt6xbin.sha256sum] = "211477f0142d603975544abe3c45cc3b77a3b38038158676c60812806378738b"
 
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
index b2db76c..7f00d9e 100644
--- a/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.23.00.32.bb
@@ -9,3 +9,5 @@ SRC_URI[xdcbin.md5sum] = "263aa11795670265551d36a8c77ad27d"
 SRC_URI[xdcbin.sha256sum] = "880b4e263850f2a3c0ea7352c5b6e0a86692361e26634c3b70dddc42c71231a5"
 
 S = "${WORKDIR}/ti/xdctools_${PV}"
+
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 3ac7a81..536bb78 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -36,3 +36,4 @@ SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=
                    file://r642-fix-config-bld.diff;striplevel=3 \
                  "
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
index a124b21..1d6fb00 100644
--- a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
+++ b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
@@ -14,3 +14,4 @@ SRC_URI += "file://dsplink-BKL-fix.patch \
 SRC_URI[dsplinktarball.md5sum] = "1bda596b631bd2f517edc70f6be4f2ca"
 SRC_URI[dsplinktarball.sha256sum] = "4b1bda89bd8465b887f5bcdf7b95018bc1d1f8968c0c44f8cbad2a9e1c52bcb7"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb b/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
index 9b03e9b..549e020 100644
--- a/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
+++ b/recipes-ti/edma3lld/ti-edma3lld_01.11.01.04.bb
@@ -7,3 +7,4 @@ SRC_URI_edma3lldsite = "sdo_tii/psp"
 SRC_URI[edma3lldbin.md5sum] = "b3c41cb946e2e4b94348fc6bcbe30b16"
 SRC_URI[edma3lldbin.sha256sum] = "617db3eadff33a88e3d42818c204f379906da3b312bc120092408043e7e2aaeb"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
index b7ea9b8..7abe793 100644
--- a/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
+++ b/recipes-ti/framework-components/ti-framework-components_2.26.00.01.bb
@@ -5,4 +5,4 @@ PV = "2_26_00_01"
 SRC_URI[fctarball.md5sum] = "40b51cade2f9ae6e6f6dca73c17065af"
 SRC_URI[fctarball.sha256sum] = "3f7a12a51dfe87310828a31518d7ef8f9039e59269c0ca24f74a68433c235048"
 
-
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
index 2a67e6a..75a32da 100644
--- a/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
+++ b/recipes-ti/linuxutils/ti-linuxutils_2.26.01.02.bb
@@ -8,3 +8,4 @@ PV = "2_26_01_02"
 SRC_URI[md5sum] = "70b4918bc35c1bcfef34d6ba3fbce0c8"
 SRC_URI[sha256sum] = "51266dd928f8d629cd417c869789a6c0d596612120f165619119cbaadfd66ee2"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb b/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
index 759561f..195b177 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
+++ b/recipes-ti/local-power-manager/ti-local-power-manager_1.24.02.09.bb
@@ -8,3 +8,4 @@ SRC_URI += "file://lpm-BKL-fix.patch"
 SRC_URI[lpmtarball.md5sum] = "3d05453df26dfc811de04839d74c2f2b" 
 SRC_URI[lpmtarball.sha256sum] = "7335959a6217df17289f81839e6c6948f31cc0797ebc5389edef7190ed3ea589"
 
+INSANE_SKIP_${PN} = "installed-vs-shipped"
diff --git a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
index f8bef79..0451b2d 100644
--- a/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
+++ b/recipes-ti/xdais/ti-xdais_6.26.01.03.bb
@@ -5,4 +5,4 @@ PV = "6_26_01_03"
 SRC_URI[xdaistarball.md5sum] = "9b2bea3408254e737ec0d819a031adf6"
 SRC_URI[xdaistarball.sha256sum] = "d7bcbd8bcfe6fdfc5f402e4b125ced6c806dc30bc5296e98d5d43b0b5a237a0d"
 
-
+INSANE_SKIP_${PN} = "installed-vs-shipped"


