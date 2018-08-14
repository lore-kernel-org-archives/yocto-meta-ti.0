Return-Path: <nsaulnier@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17A25E00566; Tue, 14 Aug 2018 08:50:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCA32E0049F
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 08:50:34 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7EFoYrN074541
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 10:50:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534261834;
	bh=KKIQ3KUurzh1TJuBg7qH4+fvgZyGUpS+2hTwkjIybMU=;
	h=From:To:CC:Subject:Date;
	b=UhC+S3nt+lalVKqETtlWTOqZv0poE0CyUEJTRIkV5ArFI4I34qxNyk7HnBh7d9BPC
	XV+NUA6ELqj/Ru41AYrlUY410MEdS7sUT7CIP+Lq/lsDU4sOsSvP1vp64FYO7AZ89D
	PA9U+M+vc6v2/En+/OuB4D3EBez7Daz7irSzAGm0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EFoY0Q008885
	for <meta-ti@yoctoproject.org>; Tue, 14 Aug 2018 10:50:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 14 Aug 2018 10:50:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 14 Aug 2018 10:50:33 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7EFoX63008112;
	Tue, 14 Aug 2018 10:50:33 -0500
Received: from localhost (uda0226750.dhcp.ti.com [128.247.59.152])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w7EFoXx25899; Tue, 14 Aug 2018 10:50:33 -0500 (CDT)
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 14 Aug 2018 10:50:21 -0500
Message-ID: <1534261821-11798-1-git-send-email-nsaulnier@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2] pru-icss_git.bb: Add am65x PRU_Halt
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
X-List-Received-Date: Tue, 14 Aug 2018 15:50:36 -0000
Content-Type: text/plain

Updated SRCREV to point to an updated version of the PRU Software Support
Package which includes PRU_Halt and RTU_Halt examples for am65x. PV will
get updated in the next patch.

Added PRU_Halt and RTU_Halt to do_install_append_am65xx-evm(). Decided to leave
the installation of PRU_Halt examples in each processor's do_install_append
function for now since PRU_Halt and RTU_Halt for am65x have different output
file names than the previous ICSS processors. Those different output names can
be seen in the lines ALTERNATIVE_TARGET_pru-icss-halt[am65x....].

The previous commit made several changes to account for the fact that am65x Halt
examples had not yet been added to the PRU Software Support Package. Those
changes were removed in this commit.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 3c871b70e3f0..e150076ec0a2 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "81b568741b8b98e6f590271a9aea5956d2b2d9ce"
+SRCREV = "1d9249c012005a669a6ffb2f76255d72ed5c0e4c"
 
 PV = "5.2.1"
-PR = "r1"
+PR = "r2"
 
 require recipes-ti/includes/ti-paths.inc
 
@@ -103,6 +103,13 @@ do_install_append_k2g() {
 }
 
 do_install_append_am65xx-evm() {
+    for i in 0 1 
+    do
+        install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU${i}/PRU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
+        install -m 644 ${S}/examples/${PLATFORM}/RTU_Halt/gen/RTU${i}/RTU_Halt_${i}.out \
+                   ${D}/lib/firmware/pru
+    done
     for i in 0 1 2
     do
         for j in 0 1
@@ -116,7 +123,7 @@ do_install_append_am65xx-evm() {
     done
 }
 
-FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt.out"
+FILES_${PN}-halt = "/lib/firmware/pru/PRU_Halt* /lib/firmware/pru/RTU_Halt*"
 FILES_${PN}-rpmsg-echo = "/lib/firmware/pru/PRU_RPMsg_Echo_Interrupt* /lib/firmware/pru/RTU_RPMsg_Echo_Interrupt*"
 
 # Set up names for the firmwares
@@ -161,9 +168,6 @@ ALTERNATIVE_LINK_NAME[am65x-rtu2_1-fw] = "/lib/firmware/am65x-rtu2_1-fw"
 # Create the pru-icss-halt firmware alternatives
 ALTERNATIVE_pru-icss-halt = "${PRU_ICSS_ALTERNATIVES}"
 
-# am65xx doesn't have halt FW for now
-ALTERNATIVE_pru-icss-halt_am65xx-evm = ""
-
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am335x-pru1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 
@@ -182,6 +186,19 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt.ou
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt.out"
 
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru0_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru1_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_0-fw] = "/lib/firmware/pru/PRU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-pru2_1-fw] = "/lib/firmware/pru/PRU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu0_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu1_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_0-fw] = "/lib/firmware/pru/RTU_Halt_0.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU_Halt_1.out"
+
 ALTERNATIVE_PRIORITY_pru-icss-halt = "50"
 
 # Create the pru-icss-rpmsg-echo firmware alternatives
@@ -220,9 +237,6 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am65x-rtu2_1-fw] = "/lib/firmware/pru/RTU
 
 ALTERNATIVE_PRIORITY_pru-icss-rpmsg-echo = "100"
 
-# am65xx doesn't have halt FW for now
-ALLOW_EMPTY_${PN}-halt = "1"
-
 ALLOW_EMPTY_${PN} = "1"
 
 # This installs PRU firmware, so skip "arch" QA check
-- 
1.9.1


