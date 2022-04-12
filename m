Return-Path: <nsaulnier@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BED4C4708B
	for <webhook@archiver.kernel.org>; Tue, 12 Apr 2022 16:46:40 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.5821.1649727381558249397
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 18:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TgL22aw4;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nsaulnier@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23C1aKBZ041348
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Apr 2022 20:36:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649727380;
	bh=gvc7iPifo3SU2irhLGZShX5NSBZk2LHJqJed+2GuYFA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TgL22aw4gNCiDju8gNZdNMrOc9/FBrYJcjpqk4duno/5IA0o2VcjkXlM12aDTSYdH
	 pHJuRYM7jRjj6Iy13hzGuuX6yWSPpce7qbFBTcpQT9Ap6uLggfCL0U4vdQoyutQm6J
	 0WmOPkgECAVh0qufrJ3+cX+aS2fyeYc/iMMLrsuw=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23C1aKiN052788
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 11 Apr 2022 20:36:20 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 11
 Apr 2022 20:36:20 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 11 Apr 2022 20:36:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23C1aJfQ056705;
	Mon, 11 Apr 2022 20:36:19 -0500
From: Nick Saulnier <nsaulnier@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <nsaulnier@ti.com>, <reatmon@ti.com>, <kishon@ti.com>, <s-anna@ti.com>
Subject: [meta-ti][master/dunfell PATCH v1 2/2] pru-icss_git.bb: add AM62x
Date: Mon, 11 Apr 2022 20:35:59 -0500
Message-ID: <20220412013559.4140-2-nsaulnier@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220412013559.4140-1-nsaulnier@ti.com>
References: <20220412013559.4140-1-nsaulnier@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Apr 2022 16:46:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14598

This commit adds the PRU Software Support Package (PSSP) to the AM62x Linux
Processor SDK under example-applications/pru-icss-x.x.x. It also adds prebuilt
PRU firmware to the default AM62x filesystem image under the /lib/firmware
folder.

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index ac75103d31d6..1ceba0573af0 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -41,6 +41,7 @@ PLATFORM_ti33x = "am335x"
 PLATFORM_ti43x = "am437x"
 PLATFORM_omap-a15 = "am572x"
 PLATFORM_k2g = "k2g"
+PLATFORM_am62xx = "am62x"
 PLATFORM_am64xx = "am64x"
 PLATFORM_am65xx = "am65x"
 PLATFORM_j7 = "j721e"
@@ -113,6 +114,16 @@ do_install_append_k2g() {
     done
 }
 
+do_install_append_am62xx() {
+    install -m 644 ${S}/examples/${PLATFORM}/PRU_Halt/gen/PRU_Halt.out \
+                   ${D}${base_libdir}/firmware/pru
+    for i in 0 1
+    do
+        install -m 0644 ${S}/examples/${PLATFORM}/PRU_RPMsg_Echo_Interrupt${i}/gen/PRU_RPMsg_Echo_Interrupt${i}.out \
+                        ${D}${base_libdir}/firmware/pru
+    done
+}
+
 do_install_append_am64xx(){
     for i in 0 1
     do
@@ -190,6 +201,7 @@ PRU_ICSS_ALTERNATIVES_ti33x    = "am335x-pru0-fw am335x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_ti43x    = "am437x-pru0_0-fw am437x-pru0_1-fw am437x-pru1_0-fw am437x-pru1_1-fw"
 PRU_ICSS_ALTERNATIVES_omap-a15 = "am57xx-pru1_0-fw am57xx-pru1_1-fw am57xx-pru2_0-fw am57xx-pru2_1-fw"
 PRU_ICSS_ALTERNATIVES_k2g      = "k2g-pru0_0-fw k2g-pru0_1-fw k2g-pru1_0-fw k2g-pru1_1-fw"
+PRU_ICSS_ALTERNATIVES_am62xx   = "am62x-pru0-fw am62x-pru1-fw"
 PRU_ICSS_ALTERNATIVES_am64xx   = "am64x-pru0_0-fw am64x-pru0_1-fw am64x-pru1_0-fw am64x-pru1_1-fw am64x-rtu0_0-fw am64x-rtu0_1-fw am64x-rtu1_0-fw am64x-rtu1_1-fw"
 PRU_ICSS_ALTERNATIVES_am65xx   = "am65x-pru0_0-fw am65x-pru0_1-fw am65x-pru1_0-fw am65x-pru1_1-fw am65x-pru2_0-fw am65x-pru2_1-fw am65x-rtu0_0-fw am65x-rtu0_1-fw am65x-rtu1_0-fw am65x-rtu1_1-fw am65x-rtu2_0-fw am65x-rtu2_1-fw"
 PRU_ICSS_ALTERNATIVES_j7       = "j7-pru0_0-fw j7-pru0_1-fw j7-pru1_0-fw j7-pru1_1-fw j7-rtu0_0-fw j7-rtu0_1-fw j7-rtu1_0-fw j7-rtu1_1-fw"
@@ -213,6 +225,9 @@ ALTERNATIVE_LINK_NAME[k2g-pru0_1-fw] = "${base_libdir}/firmware/k2g-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_0-fw] = "${base_libdir}/firmware/k2g-pru1_0-fw"
 ALTERNATIVE_LINK_NAME[k2g-pru1_1-fw] = "${base_libdir}/firmware/k2g-pru1_1-fw"
 
+ALTERNATIVE_LINK_NAME[am62x-pru0-fw] = "${base_libdir}/firmware/am62x-pru0-fw"
+ALTERNATIVE_LINK_NAME[am62x-pru1-fw] = "${base_libdir}/firmware/am62x-pru1-fw"
+
 ALTERNATIVE_LINK_NAME[am64x-pru0_0-fw] = "${base_libdir}/firmware/am64x-pru0_0-fw"
 ALTERNATIVE_LINK_NAME[am64x-pru0_1-fw] = "${base_libdir}/firmware/am64x-pru0_1-fw"
 ALTERNATIVE_LINK_NAME[am64x-pru1_0-fw] = "${base_libdir}/firmware/am64x-pru1_0-fw"
@@ -284,6 +299,9 @@ ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru0_1-fw] = "${base_libdir}/firmware/pru/P
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
 ALTERNATIVE_TARGET_pru-icss-halt[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
 
+ALTERNATIVE_TARGET_pru-icss-halt[am62x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+ALTERNATIVE_TARGET_pru-icss-halt[am62x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_Halt.out"
+
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_Halt_1.out"
 ALTERNATIVE_TARGET_pru-icss-halt[am64x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_Halt_0.out"
@@ -353,6 +371,9 @@ ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru0_1-fw] = "${base_libdir}/firmware
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[k2g-pru1_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_1.out"
 
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am62x-pru0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0.out"
+ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am62x-pru1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1.out"
+
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_0.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru0_1-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt0_1.out"
 ALTERNATIVE_TARGET_pru-icss-rpmsg-echo[am64x-pru1_0-fw] = "${base_libdir}/firmware/pru/PRU_RPMsg_Echo_Interrupt1_0.out"
-- 
2.17.1


