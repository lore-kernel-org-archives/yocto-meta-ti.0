Return-Path: <s-anna@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59C1DE00D63; Tue, 24 Sep 2019 09:59:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AE07E00961
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2019 09:59:25 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8OGxO0L073167
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2019 11:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569344364;
	bh=tVDiVjE8yFJmdOyTwi3K7aU9Uf6J/TRkQvnZxrKOcLc=;
	h=From:To:CC:Subject:Date;
	b=kclnOVteZuiivKIq2I1NcNPJh/bjlARCPL90no5r+LpO89imbcg8Tt60CEGQo5U2F
	KeoMwow8GnjC0+AtdtR9AHaoKVq2slW807UT+r8g0uuY4LEuLhjPpvaU8LHmFK6s4Z
	f7jolqqdfLsxV5bPF9lxw5lFRPAVd6hXuc3SO9iU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8OGxOOV100419
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2019 11:59:24 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 24 Sep 2019 11:59:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 24 Sep 2019 11:59:18 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8OGxOoc024023;
	Tue, 24 Sep 2019 11:59:24 -0500
Received: from localhost (irmo.dhcp.ti.com [128.247.58.153])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8OGxOZ11649; Tue, 24 Sep 2019 11:59:24 -0500 (CDT)
From: Suman Anna <s-anna@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Tue, 24 Sep 2019 11:59:23 -0500
Message-ID: <20190924165923.9813-1-s-anna@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Suman Anna <s-anna@ti.com>
Subject: [thud/master PATCH v2] pru-icss: add J721E Support
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
X-List-Received-Date: Tue, 24 Sep 2019 16:59:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Nick Saulnier <nsaulnier@ti.com>

Updated git commit & version number for PRU Software Support Package.

Builds J721E Halt and RPMsg examples and packages them into lib/firmware/pru

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Suman Anna <s-anna@ti.com>
---
v2:
 - Fix PLATFORM_j7-evm value to j721e
 - Move back PR to "r0" from "r1"

 recipes-bsp/pru/pru-icss_git.bb | 70 +++++++++++++++++++++++++++++++--
 1 file changed, 66 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 812caae9ade0..b2642fbcc821 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "99b1bfd8ca8780fd2306c2c939f3fd477b2e5218"
+SRCREV = "1ff0393b3b9454fe9c58399c1b5d2db511e8049c"
 
-PV = "5.4.0"
-PR = "r1"
+PV = "5.5.0"
+PR = "r0"
 
 require recipes-ti/includes/ti-paths.inc
 
@@ -41,6 +41,7 @@ PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
 PLATFORM_k2g = "k2g"
 PLATFORM_am65xx = "am65x"
+PLATFORM_j7-evm = "j721e"
 
 do_compile() {
     for dir in ${SUBDIRS}
@@ -131,7 +132,31 @@ do_install_append_am65xx() {
     done
 }
 
-FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_Halt*"
+do_install_append_j7-evm() {
+    for i in 0 1
+    do
+        install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/TX_PRU_Halt/gen/TX_PRU${i}/TX_PRU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
+    done
+    for i in 0 1
+    do
+        for j in 0 1
+        do
+            install -m 0644 ${S}/examples/j721e/PRU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/PRU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/pru
+            install -m 0644 ${S}/examples/j721e/RTU_RPMsg_Echo_Interrupt${j}/gen/icssg${i}/RTU_RPMsg_Echo_Interrupt${i}_${j}.out \
+                            ${D}/lib/firmware/pru
+
+        done
+    done
+}
+
+
+FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_Halt* /lib/firmware/pru/TX_PRU_Halt*"
 FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt* /lib/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
 
 # Set up names for the firmwares
@@ -140,6 +165,7 @@ PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
+PRU_ICSS_ALTERNATIVES_j7-evm   = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw j7-txpru0_0-fw j7-txpru0_1-fw j7-txpru1_0-fw j7-txpru1_1-fw"
 
 # Set up link names for the firmwares
 ALTERNATIVE_LINK_NAME[am335x-pru0-fw] = "/lib/firmware/am335x-pru0-fw"
@@ -173,6 +199,19 @@ ALTERNATIVE_LINK_NAME[am65x-rtu1_1-fw] = "/lib/firmware/am65x-rtu1_1-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu2_0-fw] = "/lib/firmware/am65x-rtu2_0-fw"
 ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
 
+ALTERNATIVE_LINK_NAME[j7-pru0_0-fw] = "/lib/firmware/j7-pru0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-pru0_1-fw] = "/lib/firmware/j7-pru0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-pru1_0-fw] = "/lib/firmware/j7-pru1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-pru1_1-fw] = "/lib/firmware/j7-pru1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu0_0-fw] = "/lib/firmware/j7-rtu0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu0_1-fw] = "/lib/firmware/j7-rtu0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu1_0-fw] = "/lib/firmware/j7-rtu1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-rtu1_1-fw] = "/lib/firmware/j7-rtu1_1-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru0_0-fw] = "/lib/firmware/j7-txpru0_0-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru0_1-fw] = "/lib/firmware/j7-txpru0_1-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru1_0-fw] = "/lib/firmware/j7-txpru1_0-fw"
+ALTERNATIVE_LINK_NAME[j7-txpru1_1-fw] = "/lib/firmware/j7-txpru1_1-fw"
+
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
@@ -207,6 +246,20 @@ ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
 
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru0_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_0-fw] = "/lib/firmware/pru/TX_PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[j7-txpru1_1-fw] = "/lib/firmware/pru/TX_PRU_Halt_1.out"
+
+
 ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
 
 # Create the pru-icss-rpmsg-echo firmware alternatives
@@ -243,6 +296,15 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt2_1.out"
 
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru0_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_0-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-pru1_1-fw] = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu0_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt0_1.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_0-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[j7-rtu1_1-fw] = "/lib/firmware/pru/RTU_RPMsg_Echo_Interrupt1_1.out"
+
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 
 ALLOW_EMPTY_${PN} = "1"
-- 
2.23.0


