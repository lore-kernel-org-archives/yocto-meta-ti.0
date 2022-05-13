Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002FDC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 07:39:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.5603.1652427539661313395
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 00:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tUSqd6GR;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-m1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24D7ctgB098988;
	Fri, 13 May 2022 02:38:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652427535;
	bh=Z3LrKvEtBThPKDdIa8V0dVuMIbkiqFczekVHzvswqZE=;
	h=From:To:CC:Subject:Date;
	b=tUSqd6GRTczV4QAbBVibZZgu+QN1pYIn0QkaDN0NaNqx3aTqwQy82TU92biXK+xMc
	 4WJ7mea1NgKTPMFau0ST16qfu8YYHAYgG9TpPYctnispwrbHdXAEf3jEN9W0+NntCM
	 PoTwcTkyn85ABZcfCjtZeYn1kDBeqef/F3KzSn8E=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24D7ctYh118008
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 02:38:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 02:38:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 02:38:54 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24D7cpsg030267;
	Fri, 13 May 2022 02:38:52 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <nm@ti.com>, <praneeth@ti.com>,
        <denis@denix.org>, <reatmon@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-ti][dunfell][PATCH] ti-tros-firmware: Add DM firmware binary to
 deploy directory for am62xx-evm
Date: Fri, 13 May 2022 13:08:48 +0530
Message-ID: <20220513073848.13539-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 07:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14733

The DM firmware binary is required for building uboot binaries for
am62xx-evm  using toplevel makefile in SDK. Add this file to deploy
directory so it can be included in prebuilt-images directory of SDK
for am62xx-evm.

Signed-off-by: Aparna M <a-m1@ti.com>
---

I have had to include a dummy do_deplo without which yocto build fails
with a "Task do_deploy is empty" error. Any suggestions as to why this
could be happening?

 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 56a74899..0f2ba9af 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -169,6 +169,16 @@ do_install_am62xx() {
     install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${LEGACY_DM_FW_DIR}
 }
 
+
+do_deploy() {
+    install -d ${DEPLOYDIR}
+}
+
+do_deploy_am62xx() {
+    install -d ${DEPLOYDIR}
+    install -m 0644 ${RTOS_DM_FW_DIR}/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}
+}
+
 # Set up names for the firmwares
 ALTERNATIVE_${PN}_am65xx = "\
                     am65x-mcu-r5f0_0-fw \
@@ -357,3 +367,5 @@ INSANE_SKIP_${PN} += "arch"
 # we don't want to configure and build the source code
 do_compile[noexec] = "1"
 do_configure[noexec] = "1"
+
+addtask deploy after do_install
-- 
2.17.1


