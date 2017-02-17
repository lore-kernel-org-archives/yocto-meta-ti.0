Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54561E00A64; Thu, 16 Feb 2017 22:53:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FC25E00A25
	for <meta-ti@yoctoproject.org>; Thu, 16 Feb 2017 22:53:22 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1360C52A62; Fri, 17 Feb 2017 06:53:21 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170217065321.1360C52A62@arago-project.org>
Date: Fri, 17 Feb 2017 06:53:21 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : ti-cgt-pru: update to version 2.1.4
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
X-List-Received-Date: Fri, 17 Feb 2017 06:53:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 819e5c7a4eac57d19ffbb8909a21736f0cb40e2d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=819e5c7a4eac57d19ffbb8909a21736f0cb40e2d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Feb 16 21:28:31 2017 +0000

ti-cgt-pru: update to version 2.1.4

* The old license file, LICENSE.txt, has been removed in this release,
  so use the HTML manifest for the license.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{ti-cgt-pru_2.1.1.bb => ti-cgt-pru_2.1.4.bb}   |   16 ++++++++++------
 1 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb b/recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
similarity index 66%
rename from recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
rename to recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
index 049682f..5667ea2 100644
--- a/recipes-ti/devtools/ti-cgt-pru_2.1.1.bb
+++ b/recipes-ti/devtools/ti-cgt-pru_2.1.4.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "TI PRU Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & AFL-3.0 & MIT & BSD-2-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
-LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/LICENSE.txt;md5=b6311962635a4f15630e36ec2d875eca"
+LIC_FILES_CHKSUM = "file://ti-cgt-pru_${PV}/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=d7fea45a7968939ff953ae8a1e6719f4"
+LIC_FILES_CHKSUM_class-target = "file://usr/share/doc/ti/cgt-pru/PRU_Code_Generation_Tools_2.1.x_manifest.html;md5=d7fea45a7968939ff953ae8a1e6719f4"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-unpack.inc
@@ -18,11 +18,11 @@ BINFILE_NAME_class-target = "cgt-pru-arm"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/PRU/${PV}/${BINFILE};name=${BINFILE_NAME}"
 
-SRC_URI[cgt-pru-x86.md5sum] = "d9923acea12dc41fc975c381804bd5ed"
-SRC_URI[cgt-pru-x86.sha256sum] = "bbea68a6e793156cfb4874777bfd41a32b20172d3a8f61db6aed33a697a58e30"
+SRC_URI[cgt-pru-x86.md5sum] = "496b32b9804cf5b5b293dd938f7c5339"
+SRC_URI[cgt-pru-x86.sha256sum] = "c80dbf35e7401f4c122ff25cc2f6b5db496607782fb4583cee8663a2763f4472"
 
-SRC_URI[cgt-pru-arm.md5sum] = "3b97df4966715bdb50f9a9fc58fe6b24"
-SRC_URI[cgt-pru-arm.sha256sum] = "819a4680296fabf1ae0d4e0184276f8ab5324621d35388026d1b678ea71040c9"
+SRC_URI[cgt-pru-arm.md5sum] = "b13bf0cdf484102cdfcb92a81b8092a2"
+SRC_URI[cgt-pru-arm.sha256sum] = "c125bbe4e805b830e5d746ade929dc1f202f25a6863d5005ed97cc5a82e26754"
 
 do_install() {
     install -d ${D}${TI_CGT_PRU_INSTALL_DIR_RECIPE}
@@ -40,6 +40,10 @@ FILES_${PN}-dbg = "${TI_CGT_PRU_INSTALL_DIR_RECIPE}/bin/.debug \
                    ${TI_CGT_PRU_INSTALL_DIR_RECIPE}/lib/.debug \
 "
 
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
 INSANE_SKIP_${PN} += "arch staticdev already-stripped"
 
 BBCLASSEXTEND = "native nativesdk"


