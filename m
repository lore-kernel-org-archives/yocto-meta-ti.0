Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.77.1588786671103478041
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 10:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3798740C2D;
	Wed,  6 May 2020 17:37:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u-oYmVhQ49NZ; Wed,  6 May 2020 17:37:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B7A4E40A6E;
	Wed,  6 May 2020 17:37:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C1F3E16ECE4;
	Wed,  6 May 2020 13:37:46 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Nick Saulnier <nsaulnier@ti.com>,
	Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v3] pru-icss: update Manifest, PSSP, add am65x tx_pru
Date: Wed,  6 May 2020 13:37:46 -0400
Message-Id: <1588786666-50629-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Nick Saulnier <nsaulnier@ti.com>

- Updated the Software Manifest from 6.0 -> 6.1
	removes GPL-2.0 license from package
	adds j7 processor

- Updated to PRU Software Support Package v5.7.0
	Updated AM65x code for AM65x Silicon Revision 2.0
	Updated software manifest & code to remove GPL-2.0 license
	Minor README improvements

- Add AM65x SR2.0 TX_PRU cores & firmware to recipe

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
Reviewed-by: Suman Anna <s-anna@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v3 - fix missing leading space in ALTERNATIVE_pru-icss-halt_append_am65xx

 recipes-bsp/pru/pru-icss_git.bb | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 7288851..fc7b6f7 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -1,17 +1,17 @@
 DESCRIPTION = "Programmable Real-time Unit Software Package"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
-LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
+LICENSE = "BSD-3-Clause & PD"
 
-LIC_FILES_CHKSUM = "file://PRU-Package-v6.0-Manifest.html;md5=ea854230556f47609efdaedca174b44c"
+LIC_FILES_CHKSUM = "file://PRU-Package-v6.1-Manifest.html;md5=1e37797ebe9254922f4278bb6047211c"
 
 inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "ff252a5e174f1b6aa42931744939f20d25d8e070"
+SRCREV = "a9bff6f43001cf66dc1ed3ef7e9dfb688b67f7bb"
 
-PV = "5.6.0"
-PR = "r1"
+PV = "5.7.0"
+PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
 
@@ -119,6 +119,8 @@ do_install_append_am65xx() {
                    ${D}/lib/firmware/pru
         install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
                    ${D}/lib/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
     done
     for i in 0 1 2
     do
@@ -199,6 +201,12 @@ ALTERNATIVE_LINK_NAME[am65x-rtu1_0-fw] = "/lib/firmware/am65x-rtu1_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_0-fw] = "/lib/firmware/am65x-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru0_1-fw] = "/lib/firmware/am65x-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_0-fw] = "/lib/firmware/am65x-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru1_1-fw] = "/lib/firmware/am65x-txpru1_1-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_0-fw] = "/lib/firmware/am65x-txpru2_0-fw"
+ALTERNATIVE_LINK_NAME[am65x-txpru2_1-fw] = "/lib/firmware/am65x-txpru2_1-fw"
 
 ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
 ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
@@ -217,6 +225,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
 # Only Halt firmware images are supported for the Tx_PRU cores
+ALTERNATIVE_pru-icss-halt_append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
 ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
 
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
@@ -249,6 +258,12 @@ ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-txpru2_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
 
 ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
-- 
2.7.4

