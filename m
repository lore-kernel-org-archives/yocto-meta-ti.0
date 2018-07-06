Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59A78E00DFF; Fri,  6 Jul 2018 12:53:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E717E00AD8
	for <meta-ti@yoctoproject.org>; Fri,  6 Jul 2018 12:53:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w66JrY1H089573
	for <meta-ti@yoctoproject.org>; Fri, 6 Jul 2018 14:53:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530906814;
	bh=TNIZZ2cWnZGOjj6wOsB2L4KLaLswm/MuA8s5GW5EXUg=;
	h=From:To:CC:Subject:Date;
	b=nMLbinsbr+bsyuuKmD6xL6b05HQTOGA5q+b9vYbFAL4xuI8EONDvJdpG3YOpiuxv7
	HWlgf0l08daAYrNARYAcM1/u9dkYlvxforegWrH6yi/HtYyqmZLtQF6xS+uRcczFBs
	los1MXiIlIZiAnUotSy1E6yZZnDSqiHg/IdRkyWE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w66JrYDs003464
	for <meta-ti@yoctoproject.org>; Fri, 6 Jul 2018 14:53:34 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 6 Jul 2018 14:53:34 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 6 Jul 2018 14:53:34 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w66JrYek013348;
	Fri, 6 Jul 2018 14:53:34 -0500
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w66JrXx10171; Fri, 6 Jul 2018 14:53:33 -0500 (CDT)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 6 Jul 2018 14:53:27 -0500
Message-ID: <1530906808-11973-1-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v1 1/2] pru-icss_git.bb: added AM65x support
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
X-List-Received-Date: Fri, 06 Jul 2018 19:53:36 -0000
Content-Type: text/plain

Updated SRCREV to point to the latest PRU Software Support Package.
Added support for AM65x by adding a COMPATIBLE_MACHINE, PLATFORM,
do_install_append_am65xx-evm which installs RPMsg examples,
PRU_ICSS_ALTERNATIVES, ALTERNATIVE_LINK_NAMEs,
ALTERNATIVE_TARGET_pru-icss-rpmsg-echo. Moved the installation of
PRU_Halt from do_install to the associated do_install_appends, since
am65x will require different PRU_Halts for each PRU/RTU core.
Did not yet add ALTERNATIVE_TARGET_pru-icss-halt as the am65x PRU_Halt
examples have not been written yet.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 62 +++++++++++++++++++++++++++++++++++++----
 1 file changed, 56 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index c8c472ef924a..1bd9d35fd655 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,14 +8,14 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "4efd227bebd8eb0bc12f40fac043dc9c26d4f8c3"
+SRCREV = "df1d9da2047385fdd27e8735af31000dfdcf7625"
 
-PV = "5.1.0"
+PV = "5.2.0"
 PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES_prepend = " \
@@ -40,6 +40,7 @@ PLATFORM_ti33x = "am335x"
 PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
 PLATFORM_k2g = "k2g"
+PLATFORM_am65xx-evm = "am65x"
 
 do_compile() {
     for dir in ${SUBDIRS}
@@ -50,11 +51,11 @@ do_compile() {
 
 do_install() {
     install -d ${D}/lib/firmware/pru
-    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
-                   ${D}/lib/firmware/pru
 }
 
 do_install_append_ti33x() {
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}/lib/firmware/pru
     for i in 0 1
     do
         install -m 0644 ${S}/examples/am335x/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
@@ -63,6 +64,8 @@ do_install_append_ti33x() {
 }
 
 do_install_append_ti43x() {
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}/lib/firmware/pru
     for i in 0 1
     do
         for j in 0 1
@@ -74,6 +77,8 @@ do_install_append_ti43x() {
 }
 
 do_install_append_omap-a15() {
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}/lib/firmware/pru
     for i in 1 2
     do
         for j in 0 1
@@ -85,6 +90,8 @@ do_install_append_omap-a15() {
 }
 
 do_install_append_k2g() {
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}/lib/firmware/pru
     for i in 0 1
     do
         for j in 0 1
@@ -95,6 +102,20 @@ do_install_append_k2g() {
     done
 }
 
+do_install_append_am65xx-evm() {
+    for i in 0 1 2
+    do
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/am65x/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/pru
+            install -m 0644 ${S}/examples/am65x/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/pru
+
+        done
+    done
+}
+
 FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt.out"
 FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt*"
 
@@ -103,6 +124,7 @@ PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_am65xx-evm = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
@@ -123,6 +145,19 @@ ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "/lib/firmware/k2g-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "/lib/firmware/k2g-pru1_0-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "/lib/firmware/k2g-pru1_1-fw"
 
+ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "/lib/firmware/am65x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "/lib/firmware/am65x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "/lib/firmware/am65x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru1_1-fw] = "/lib/firmware/am65x-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru2_0-fw] = "/lib/firmware/am65x-pru2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-pru2_1-fw] = "/lib/firmware/am65x-pru2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu0_0-fw] = "/lib/firmware/am65x-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu0_1-fw] = "/lib/firmware/am65x-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
+
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
@@ -146,7 +181,7 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.ou
 
 ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
 
-# Craete the pru-icss-rpmsg-echo firmware alternatives
+# Create the pru-icss-rpmsg-echo firmware alternatives
 ALTERNATIVE_pru-icss-rpmsg-echo = "${PRU_ICSS_ALTERNATIVES}"
 
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am335x-pru0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
@@ -167,6 +202,21 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_R
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
 
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt2_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
+
+A
+
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
1.9.1


