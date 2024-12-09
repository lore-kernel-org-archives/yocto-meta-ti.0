Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A3BE7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 10:13:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.97817.1733739218230694181
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Dec 2024 02:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ipvvt5uM;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ADbvM083004
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:13:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733739217;
	bh=3rk4ndqHOxgu/76m/oafsCCWqzvk69SFLj3YwvOYurs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Ipvvt5uMeT1R2jqOhtJtUYux83bbhziY+roRNVz9wTanxzwly12vOEcytqoF2kSPc
	 9loUkHn8Bgp63ScaSRQZjFv3NyKkhroC9JKDwhL+lE5m3Y0XXoAPso7HvSbuiUOYlv
	 5i1Xhim70av8ABPx8vsqgr48L6fDhJYkEJl8hKY0=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ADb7S108355
	for <meta-ti@lists.yoctoproject.org>; Mon, 9 Dec 2024 04:13:37 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 9
 Dec 2024 04:13:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 9 Dec 2024 04:13:37 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91] (may be forged))
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B9ADX06063363;
	Mon, 9 Dec 2024 04:13:35 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/2] meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
Date: Mon, 9 Dec 2024 15:40:34 +0530
Message-ID: <20241209101330.1893700-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209101330.1893700-1-a-limaye@ti.com>
References: <20241209101330.1893700-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Dec 2024 10:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18097

Early boot of remote processors from SPL stage of bootloader requires
the remoteproc firmware to be present in the boot partition. Deploy this
rproc IPC firmware so that it can be copied to the boot partitions of
the wic images.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index b4d2e2fa..7d845d39 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,6 +2,8 @@ require recipes-ti/ipc/ti-ipc.inc
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
+inherit deploy
+
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
 
 PACKAGES =+ "${PN}-fw"
@@ -100,6 +102,17 @@ pkg_postrm:${PN}-fw:omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
 }
 
+do_deploy() {
+  install -d ${DEPLOYDIR}
+}
+
+do_deploy:append:omap-a15() {
+  install -d ${DEPLOYDIR}/ipc
+  install -m 0644 ${S}/packages/ti/ipc/tests/bin/ti_platforms_evmDRA7XX_ipu1/test_omx_ipu1_vayu.xem4 ${DEPLOYDIR}/ipc/dra7-ipu1-fw.xem4
+}
+
+addtask deploy after do_install
+
 # Disable the "buildpaths" check while we figure out how we are
 # going to address this issue.
 #
-- 
2.47.0


