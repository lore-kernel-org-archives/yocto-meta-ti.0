Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3485.1634702830325932202
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Oct 2021 21:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ryiaFy8P;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nsaulnier@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19K47826008305
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 23:07:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634702828;
	bh=0NULrv2aMd1rmUbnUI81BsFo2+qwJ9GiXvgecAV7z9w=;
	h=From:To:CC:Subject:Date;
	b=ryiaFy8PDyWrIwa4lAxMAaqkzst1My0pyfeX/pIF55IStIxkIPGXfZEzgY6Ajwz4j
	 p4Y5PJwVl51QJWrl43HB1ITirCVrCAgsGOv3QhYsahxMCzw37eATfjHMMGh6Z4Cq4/
	 MqQfEuOUaMwwYmNb4P0EX/5ymaxVFFG/Y8Rk4RRY=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19K478Dm106773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 19 Oct 2021 23:07:08 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 19
 Oct 2021 23:07:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 19 Oct 2021 23:07:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19K4782h129352;
	Tue, 19 Oct 2021 23:07:08 -0500
From: "Nick Saulnier" <nsaulnier@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <nsaulnier@ti.com>, <yogeshs@ti.com>, <kishon@ti.com>, <s-anna@ti.com>
Subject: [meta-ti][master/dunfell PATCH v2] pru-icss_git.bb: add AM64x, update to PSSP v6.0.0
Date: Tue, 19 Oct 2021 23:06:53 -0500
Message-ID: <20211020040653.20846-1-nsaulnier@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

PRU Software Support Package (PSSP) v6.0.0 should be included in Linux Processor
SDK 8.1 for AM335x, AM437x, AM57x (if generated), AM64x, AM65x under
example-applications. For the release notes that come with v6.0.0, see
https://git.ti.com/cgit/pru-software-support-package/pru-software-support-package/tag/?h=v6.0.0

Linux Processor SDK 8.1 will be the first AM64x SDK release to include the PSSP.

PRU firmware will also be generated and placed in the default filesystem under
lib/firmware/pru.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 64 +++++++++++++++++++++++++++++++--
 1 file changed, 62 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index c74a15dc88a2..3acafa3b9af8 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,9 +8,9 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "a9bff6f43001cf66dc1ed3ef7e9dfb688b67f7bb"
+SRCREV = "acd8479d7f3bdbb4536ceca3cd6803662babaa5a"
 
-PV = "5.7.0"
+PV = "6.0.0"
 PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
@@ -41,6 +41,7 @@ PLATFORM_ti33x = "am335x"
 PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
 PLATFORM_k2g = "k2g"
+PLATFORM_am64xx = "am64x"
 PLATFORM_am65xx = "am65x"
 PLATFORM_j7 = "j721e"
 
@@ -112,6 +113,28 @@ do_install_append_k2g() {
     done
 }
 
+do_install_append_am64xx(){
+    for i in 0 1
+    do
+        install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
+                   ${D}${base_libdir}/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
+                   ${D}${base_libdir}/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
+                   ${D}${base_libdir}/firmware/pru
+    done
+    for i in 0 1
+    do
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/${PLATFORM}/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}${base_libdir}/firmware/pru
+            install -m 0644 ${S}/examples/${PLATFORM}/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}${base_libdir}/firmware/pru
+        done
+    done
+}
+
 do_install_append_am65xx() {
     for i in 0 1 
     do
@@ -167,6 +190,7 @@ PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_am64xx   = "am64x-pru0_0-fw am64x-pru0_1-fw am64x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw am64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
 PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
 
@@ -189,6 +213,19 @@ ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "${base_libdir}/firmware/k2g-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "${base_libdir}/firmware/k2g-pru1_0-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "${base_libdir}/firmware/k2g-pru1_1-fw"
 
+ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] = "${base_libdir}/firmware/am64x-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] = "${base_libdir}/firmware/am64x-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] = "${base_libdir}/firmware/am64x-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-pru1_1-fw] = "${base_libdir}/firmware/am64x-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu0_0-fw] = "${base_libdir}/firmware/am64x-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu0_1-fw] = "${base_libdir}/firmware/am64x-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu1_0-fw] = "${base_libdir}/firmware/am64x-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-rtu1_1-fw] = "${base_libdir}/firmware/am64x-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru0_0-fw] = "${base_libdir}/firmware/am64x-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru0_1-fw] = "${base_libdir}/firmware/am64x-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru1_0-fw] = "${base_libdir}/firmware/am64x-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[am64x-txpru1_1-fw] = "${base_libdir}/firmware/am64x-txpru1_1-fw"
+
 ALTERNATIVE_LINK_NAME[am65x-pru0_0-fw] = "${base_libdir}/firmware/am65x-pru0_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-pru0_1-fw] = "${base_libdir}/firmware/am65x-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[am65x-pru1_0-fw] = "${base_libdir}/firmware/am65x-pru1_0-fw"
@@ -225,6 +262,7 @@ ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "${base_libdir}/firmware/j7-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
 # Only Halt firmware images are supported for the Tx_PRU cores
+ALTERNATIVE_pru-icss-halt_append_am64xx = " am64x-txpru0_0-fw am64x-txpru0_1-fw am64x-txpru1_0-fw am64x-txpru1_1-fw"
 ALTERNATIVE_pru-icss-halt_append_am65xx = " am65x-txpru0_0-fw am65x-txpru0_1-fw am65x-txpru1_0-fw am65x-txpru1_1-fw am65x-txpru2_0-fw am65x-txpru2_1-fw"
 ALTERNATIVE_pru-icss-halt_append_j7 = " j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
 
@@ -246,6 +284,19 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/P
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
 
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru0_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_0-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am64x-txpru1_1-fw] = "${base_libdir}/firmware/pru/TX_PRU_Halt_1.out"
+
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
@@ -302,6 +353,15 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "${base_libdir}/firmware
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
 
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu0_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_0-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-rtu1_1-fw] = "${base_libdir}/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-- 
2.17.1

