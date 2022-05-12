Return-Path: <a-m1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76A57C433EF
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 13:47:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.4340.1652363249097684340
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 May 2022 06:47:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n5TxVIY3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-m1@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24CDlOWk055743;
	Thu, 12 May 2022 08:47:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652363244;
	bh=RAzj6YICWz7ENYjecj8hTPpG/DsXbejUts/ITkBklRM=;
	h=From:To:CC:Subject:Date;
	b=n5TxVIY3plEJKBjTn2pCagnKl5OTLsx2jE/6Lpk3V7jnguePOgLIDP4lIRXw7hNu6
	 mZbyhLAtFe3lr2x60i4DrXOZOdPuoyFEFAiobzbLMxjnEGZQkHwJNKCi/6c1MGcUsV
	 Z0gSMTXaCrF4jmvWZ3tFShrq2jN6AVexnrl81+iw=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24CDlOC7035510
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 12 May 2022 08:47:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 12
 May 2022 08:47:24 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 12 May 2022 08:47:23 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24CDlLG1020052;
	Thu, 12 May 2022 08:47:22 -0500
From: Aparna M <a-m1@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <denis@denix.org>,
        <reatmon@ti.com>
CC: <devarsht@ti.com>, <s-adivi@ti.com>
Subject: [meta-ti][dunfell][PATCH] ti-sci-fw: Add DM firmware to deploy
 directory for am62xx-evm
Date: Thu, 12 May 2022 19:16:57 +0530
Message-ID: <20220512134657.31238-1-a-m1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 12 May 2022 13:47:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14728

Add DM firmware ipc_echo_testb_mcu1_0_release_strip.xer5f to deploy
directory for am62xx-evm. This is required for building tispl.bin.

Signed-off-by: Aparna M <a-m1@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 099473b4..bb88633a 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -186,6 +186,7 @@ do_deploy_am62xx-evm-k3r5() {
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_SYMLINK}
 	ln -sf ${UBOOT_IMAGE} ${DEPLOYDIR}/${UBOOT_BINARY}
 	install -m 644 ${SYSFW_TISCI} ${DEPLOYDIR}/
+        install -m 644 ${S}/ti-dm/am62xx/ipc_echo_testb_mcu1_0_release_strip.xer5f ${DEPLOYDIR}/
 }
 
 addtask deploy before do_build after do_compile
-- 
2.17.1


