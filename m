Return-Path: <jreeder@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A219E00D35; Wed, 15 Jun 2016 13:31:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 852 seconds by postgrey-1.32 at yocto-www;
	Wed, 15 Jun 2016 13:31:00 PDT
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DD7C2E00D31
	for <meta-ti@yoctoproject.org>; Wed, 15 Jun 2016 13:31:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5FKGkqC032143
	for <meta-ti@yoctoproject.org>; Wed, 15 Jun 2016 15:16:46 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5FKGkfB028795
	for <meta-ti@yoctoproject.org>; Wed, 15 Jun 2016 15:16:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Jun 2016 15:16:45 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u5FKGjUc006088;	Wed, 15 Jun 2016 15:16:46 -0500
Received: from localhost (uda0273976.am.dhcp.ti.com [10.219.21.82])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	u5FKGj319486; Wed, 15 Jun 2016 15:16:45 -0500 (CDT)
From: Jason Reeder <jreeder@ti.com>
To: meta-ti <meta-ti@yoctoproject.org>
Date: Wed, 15 Jun 2016 15:16:33 -0500
Message-ID: <1466021793-5056-1-git-send-email-jreeder@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pru-icss: add new device support and bump SRCREV
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
X-List-Received-Date: Wed, 15 Jun 2016 20:31:02 -0000
Content-Type: text/plain

The PRU Software Support Package now includes examples for
the k2g device that need to be built and then placed into
the file system.

The Linux driver now supports loading firmwares into both
PRU-ICSS subsystems on the am437x device so the recipe was
also updated to build and install those firmwares.

Non-backward compatible changes were made to the inner
workings of rpmsg that required a major revision bump. The
package revision was bumped to 5.0.0 and this commit moves
the SRCREV to the v5.0.0 tag.

Signed-off-by: Jason Reeder <jreeder@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 53 ++++++++++++++++++++++++++++++++++-------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 075ac27..a56eba0 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -2,20 +2,20 @@ DESCRIPTION = "Programmable Real-time Unit Software Package"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
 LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
 
-LIC_FILES_CHKSUM = "file://PRU-Package-v4.0-Manifest.html;md5=5ea937e4ff2c924a735d42e61ad8cbe3"
+LIC_FILES_CHKSUM = "file://PRU-Package-v5.0-Manifest.html;md5=eec933459cb42544706e35289de38e03"
 
 inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "804b548e69ef9fdf44445f6d0968d81cb8a1e7b4"
+SRCREV = "913cf232ebe655603d3385de2b9cde4af7af5308"
 
-PV = "4.0.2"
-PR = "r2"
+PV = "5.0.0"
+PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g-evm"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES_prepend = " \
@@ -39,6 +39,7 @@ SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
 PLATFORM_ti33x = "am335x"
 PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
+PLATFORM_k2g-evm = "k2g"
 
 do_compile() {
     for dir in ${SUBDIRS}
@@ -64,8 +65,11 @@ do_install_append_ti33x() {
 do_install_append_ti43x() {
     for i in 0 1
     do
-        install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt1_${i}/gen/PRU_RPMsg_Echo_Interrupt1_${i}.out \
-                        ${D}/lib/firmware/pru
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/pru
+        done
     done
 }
 
@@ -80,18 +84,32 @@ do_install_append_omap-a15() {
     done
 }
 
+do_install_append_k2g-evm() {
+    for i in 0 1
+    do
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/k2g/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/pru
+        done
+    done
+}
+
 FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt.out"
 FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt*"
 
 # Set up names for the firmwares
 PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
-PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru1_0-fw am437x-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
+PRU_ICSS_ALTERNATIVES_k2g-evm  = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
 ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "/lib/firmware/am335x-pru1-fw"
 
+ALTERNATIVE_LINK_NAME[am437x-pru0_0-fw] = "/lib/firmware/am437x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru0_1-fw] = "/lib/firmware/am437x-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "/lib/firmware/am437x-pru1_0-fw"
 ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "/lib/firmware/am437x-pru1_1-fw"
 
@@ -100,12 +118,19 @@ ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "/lib/firmware/am57xx-pru1_1-fw"
 ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "/lib/firmware/am57xx-pru2_0-fw"
 ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "/lib/firmware/am57xx-pru2_1-fw"
 
+ALTERNATIVE_LINK_NAME[k2g-pru0_0-fw] = "/lib/firmware/k2g-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "/lib/firmware/k2g-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "/lib/firmware/k2g-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "/lib/firmware/k2g-pru1_1-fw"
+
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 
@@ -114,6 +139,11 @@ ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt
 ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
+
 ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
 
 # Craete the pru-icss-rpmsg-echo firmware alternatives
@@ -122,6 +152,8 @@ ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
 
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
 
@@ -130,6 +162,11 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "/lib/firmware/pru/PR
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
 
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


