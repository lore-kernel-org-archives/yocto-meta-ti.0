Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 409D4E0093E; Sat,  2 Apr 2016 11:05:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BAE9E007B5
	for <meta-ti@yoctoproject.org>; Sat,  2 Apr 2016 11:05:22 -0700 (PDT)
Received: from vz-proxy-l008.mx.aol.com ([64.236.82.152])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5000DO2Q8YRY10@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sat, 02 Apr 2016 13:05:22 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=a3t/a0oOYlYu/nGe1mf8ZA==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=nQD0ZUSAnwBHNObAknsA:9
Received: by 100.15.86.14 with SMTP id 086cbc60; Sat, 02 Apr 2016 18:05:22 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id BD127161F77;	Sat,
	2 Apr 2016 14:05:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sat, 02 Apr 2016 14:05:21 -0400
Message-id: <1459620321-14741-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] recipes-ti: prevent any stripping of binaries due to different arch/format
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
X-List-Received-Date: Sat, 02 Apr 2016 18:05:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb | 3 +++
 recipes-ti/devtools/ti-xdctools-common.inc         | 3 +++
 recipes-ti/devtools/ti-xdctools_3.32.00.06.bb      | 2 --
 recipes-ti/xdais/ti-xdais.inc                      | 3 +++
 recipes-ti/xdais/ti-xdais_7.24.00.04.bb            | 2 --
 5 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb b/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
index f533c0d..270169d 100644
--- a/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
+++ b/recipes-ti/devtools/ti-ccsv6-native_6.1.2.00015.bb
@@ -37,6 +37,9 @@ FILES_${PN} += "\
   ${M4_TOOLCHAIN_INSTALL_DIR_RECIPE} \
 "
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} = "arch libdir ldflags staticdev textrel dev-so"
 
 EXCLUDE_FROM_SHLIBS = "1"
diff --git a/recipes-ti/devtools/ti-xdctools-common.inc b/recipes-ti/devtools/ti-xdctools-common.inc
index 2d5f2d7..17166ca 100644
--- a/recipes-ti/devtools/ti-xdctools-common.inc
+++ b/recipes-ti/devtools/ti-xdctools-common.inc
@@ -11,6 +11,9 @@ do_install() {
     cp -pPrf ${S}/* ${D}${XDC_INSTALL_DIR_RECIPE}
 }
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN} = "installed-vs-shipped"
 
 # Prevent internal libs from getting picked up
diff --git a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
index 6db742a..19bbe5d 100644
--- a/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.32.00.06.bb
@@ -1,5 +1,3 @@
-INHIBIT_PACKAGE_STRIP = "1"
-
 require recipes-ti/devtools/ti-xdctools-core.inc
 
 PV = "3_32_00_06"
diff --git a/recipes-ti/xdais/ti-xdais.inc b/recipes-ti/xdais/ti-xdais.inc
index a7017e7..a12ad64 100644
--- a/recipes-ti/xdais/ti-xdais.inc
+++ b/recipes-ti/xdais/ti-xdais.inc
@@ -15,6 +15,9 @@ do_install() {
     cp -pPrf ${S}/* ${D}${XDAIS_INSTALL_DIR_RECIPE}
 }
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 INSANE_SKIP_${PN}-dev = "arch"
 
 ALLOW_EMPTY_${PN} = "1"
diff --git a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
index 6c81960..8148f73 100644
--- a/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
+++ b/recipes-ti/xdais/ti-xdais_7.24.00.04.bb
@@ -1,5 +1,3 @@
-INHIBIT_PACKAGE_STRIP = "1"
-
 require ti-xdais.inc
 
 PV = "7_24_00_04"
-- 
2.2.0


