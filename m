Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0464E77175
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 18:31:14 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.18959.1733423471837458688
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2024 10:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LTPi4D+5;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5IVA5r1795406
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 12:31:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733423471;
	bh=usDMAmTpzhfpx+KjB7NXUDi9j5eMBR/SqYsdsxbKKP8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LTPi4D+51usazOL0mC7fFzc2UxA8XbqEkUpndAXQirvap5Zr/SzKpTGk2CidKcdcm
	 +3ZmHBauCjpB4TLIvz1FDDbnUf06KGCH2TcfYm5xhwj+4AXATx0XoTMtoOSERPyk9F
	 +uHHsdgvhBbRkACjyW9ngslaETLezFLqO00+JKLM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B5IVAqe003920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 5 Dec 2024 12:31:10 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 5
 Dec 2024 12:31:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 5 Dec 2024 12:31:10 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B5IV6nj101183;
	Thu, 5 Dec 2024 12:31:08 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, <u-kumar1@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH 1/2] meta-ti-extras: ti-ipc-rtos: Deploy ipc firmware
Date: Thu, 5 Dec 2024 23:35:47 +0530
Message-ID: <20241205183103.3411587-2-a-limaye@ti.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241205183103.3411587-1-a-limaye@ti.com>
References: <20241205183103.3411587-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Dec 2024 18:31:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18082

Early boot of remote processors from SPL stage of bootloader requires
the remoteproc firmware to be present in the boot partition. Deploy this
rproc IPC firmware so that it can be copied to the boot partitions of
the wic images.

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
index 999993ea..be769abb 100644
--- a/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
+++ b/meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb
@@ -2,6 +2,8 @@ require recipes-ti/ipc/ti-ipc.inc
 require recipes-ti/ipc/ti-ipc-common.inc
 require ti-ipc-rtos.inc
 
+inherit deploy
+
 DEPENDS = "ti-xdctools-native ti-sysbios doxygen-native zip-native"
 
 PACKAGES =+ "${PN}-fw"
@@ -99,3 +101,15 @@ pkg_postinst:${PN}-fw:omapl138 () {
 pkg_postrm:${PN}-fw:omapl138 () {
   update-alternatives --remove rproc-dsp-fw ipc/ti_platforms_evmOMAPL138_DSP/messageq_single.xe674
 }
+
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
-- 
2.47.0


