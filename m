Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A3FF8E00B58; Fri,  6 Nov 2015 05:26:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 947A6E00B52
	for <meta-ti@yoctoproject.org>; Fri,  6 Nov 2015 05:25:58 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6DPvks002306
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2015 07:25:57 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6DPv28027554
	for <meta-ti@yoctoproject.org>; Fri, 6 Nov 2015 07:25:57 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Nov 2015 07:25:57 -0600
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tA6DPuCe019548;	Fri, 6 Nov 2015 07:25:57 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 6 Nov 2015 08:25:55 -0500
Message-ID: <1446816355-12645-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] pru-icss: install multiple example firmwares
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
X-List-Received-Date: Fri, 06 Nov 2015 13:26:01 -0000
Content-Type: text/plain

* Create packages for the PRU_Halt and PRU_RPMsg_Echo_Interrupt
  example firmwares
* Use update-alternatives to link these to the required firmware path

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 97 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 12 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index b756713..802521b 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -4,18 +4,30 @@ LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
 
 LIC_FILES_CHKSUM = "file://PRU-Package-v4.0-Manifest.html;md5=5ea937e4ff2c924a735d42e61ad8cbe3"
 
+inherit update-alternatives
+
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
 SRCREV = "476289eb7c3a91977bae84aea55c56f3120b48ea"
 
 PV = "4.0.0.0"
-PR = "r0"
+PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+PACKAGES_prepend = " \
+    ${PN}-halt \
+    ${PN}-rpmsg-echo \
+"
+
+RDEPENDS_${PN}_append = " \
+    ${PN}-halt \
+    ${PN}-rpmsg-echo \
+"
+
 DEPENDS = "ti-cgt-pru-native"
 
 S = "${WORKDIR}/git"
@@ -24,6 +36,10 @@ export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
 
 SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
 
+PLATFORM_ti33x = "am335x"
+PLATFORM_ti43x = "am437x"
+PLATFORM_omap-a15 = "am572x"
+
 do_compile() {
     for dir in ${SUBDIRS}
     do
@@ -31,36 +47,93 @@ do_compile() {
     done
 }
 
-do_install_ti33x() {
-    install -d ${D}/lib/firmware
+do_install() {
+    install -d ${D}/lib/firmware/pru
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}/lib/firmware/pru
+}
+
+do_install_append_ti33x() {
     for i in 0 1
     do
         install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
-                        ${D}/lib/firmware/am335x-pru${i}-fw
+                        ${D}/lib/firmware/pru
     done
 }
 
-do_install_ti43x() {
-    install -d ${D}/lib/firmware
+do_install_append_ti43x() {
     for i in 0 1
     do
         install -m 0644 ${S}/examples/am437x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
-                        ${D}/lib/firmware/am437x-pru1_${i}-fw
+                        ${D}/lib/firmware/pru
     done
 }
 
-do_install_omap-a15() {
-    install -d ${D}/lib/firmware
+do_install_append_omap-a15() {
     for i in 1 2
     do
         for j in 0 1
         do
             install -m 0644 ${S}/examples/am572x/PRU_RPMsg_Echo_Interrupt${i}_${j}/gen/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
-                            ${D}/lib/firmware/am57xx-pru${i}_${j}-fw
+                            ${D}/lib/firmware/pru
         done
     done
 }
 
-FILES_${PN} += "/lib/firmware"
+FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt.out"
+FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt*"
+
+# Set up names for the firmwares
+PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
+PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru1_0-fw am437x-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
+
+# Set up link names for the firmwares
+ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
+ALTERNATIVE_LINK_NAME[am335x-pru1-fw] = "/lib/firmware/am335x-pru1-fw"
+
+ALTERNATIVE_LINK_NAME[am437x-pru1_0-fw] = "/lib/firmware/am437x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am437x-pru1_1-fw] = "/lib/firmware/am437x-pru1_1-fw"
+
+ALTERNATIVE_LINK_NAME[am57xx-pru1_0-fw] = "/lib/firmware/am57xx-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru1_1-fw] = "/lib/firmware/am57xx-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru2_0-fw] = "/lib/firmware/am57xx-pru2_0-fw"
+ALTERNATIVE_LINK_NAME[am57xx-pru2_1-fw] = "/lib/firmware/am57xx-pru2_1-fw"
+
+# Create the pru-icss-halt firmware alternatives
+ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
+
+ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
+
+# Craete the pru-icss-rpmsg-echo firmware alternatives
+ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am437x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am57xx-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
+
+ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
+
+ALLOW_EMPTY_${PN} = "1"
 
-INSANE_SKIP_${PN} = "arch"
+# This installs PRU firmware, so skip "arch" QA check
+INSANE_SKIP_${PN}-halt = "arch"
+INSANE_SKIP_${PN}-rpmsg-echo = "arch"
-- 
1.9.1


