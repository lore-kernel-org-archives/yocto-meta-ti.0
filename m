Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC1CC83F1D
	for <webhook@archiver.kernel.org>; Thu, 10 Jul 2025 09:40:12 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.4587.1752140402523953265
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jul 2025 02:40:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=C5l+byVb;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56A9e06S1702321;
	Thu, 10 Jul 2025 04:40:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752140400;
	bh=0WBjbyEowx5qnCj0C30OqIsw6pgIDoVuIA1t38oZ6MA=;
	h=From:To:CC:Subject:Date;
	b=C5l+byVbvGaWjALxS1x3TBkClmdEEXu3PYNnUuY6inMD02l9FhQokrVGq/07jTB7P
	 9lABYCB2/jlp0Xq0/Nalf4EyiiqwR6Tt/Q9uALcjNF2b9kkjRz7LAQ8t9RrOYi3KFe
	 sobnvUCfcaOeRTXFqsb//kcoXK7Ft3jBPvkTi1Uo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56A9e0Ua1102500
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 10 Jul 2025 04:40:00 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 10
 Jul 2025 04:40:00 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 10 Jul 2025 04:40:00 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56A9dvAg1125222;
	Thu, 10 Jul 2025 04:39:58 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH] meta-ti-bsp: linux-ti-staging-rt_6.12.bb: Add AM57xx RT branch
Date: Thu, 10 Jul 2025 15:09:57 +0530
Message-ID: <20250710093957.3740966-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Jul 2025 09:40:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18769

While all other devices use the same branch for RT and non-RT builds,
the AM57xx ARM32 devices have a separate branch for RT Kernel which is
"ti-rt-linux-6.12.y-arm32". Update the BRANCH and SRCREV for am57xx
device family for RT builds.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 9e5c4ee4..e78f046d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -6,4 +6,7 @@ KERNEL_LOCALVERSION:append = "-rt"
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 
+BRANCH:am57xx = "ti-rt-linux-6.12.y-arm32"
+SRCREV:am57xx = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
+
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
-- 
2.34.1


