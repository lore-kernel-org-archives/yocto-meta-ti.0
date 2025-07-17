Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4380DC83F22
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 14:12:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.50467.1752761552286358042
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Jul 2025 07:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nAi1JKeN;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56HECUXn489186;
	Thu, 17 Jul 2025 09:12:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752761550;
	bh=O1d8gpwmAaA8ttVKh64Di2cQuu5NrIf0B3ZYFOT13cc=;
	h=From:To:Subject:Date;
	b=nAi1JKeN8Zh1meuvDp5Caok2X2bd8ohuDuUJ6N/r5qI5818A0K6VsOqeoqeRqkE7b
	 sOi8LdePNDpeoDiWBy5xI/nXh44/xk1Ax7cZ/YL/qnO2AoEtGecP4waFvF4HFMqXqJ
	 haIl4WIzfMsSYp+sHTtv/x7sS9G1vTCSTf5yIYAE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56HECUjF277499
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 17 Jul 2025 09:12:30 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 17
 Jul 2025 09:12:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 17 Jul 2025 09:12:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56HECUFI2292035;
	Thu, 17 Jul 2025 09:12:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ucPLa-0007kQ-3A; Thu, 17 Jul 2025 09:12:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-kernel-fitimage: Add missing SUMMARY
Date: Thu, 17 Jul 2025 09:12:30 -0500
Message-ID: <20250717141230.29742-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Jul 2025 14:12:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18794

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
index a5e6a280..fc20b713 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -1,3 +1,5 @@
+SUMMARY = "Generate and sign the fitImage file for TI Machines"
+
 FIT_DESC ?= "Kernel fitImage for ${DISTRO_NAME}/${PKGV}/${MACHINE}"
 FIT_CONF_PREFIX ?= "conf-ti_"
 
-- 
2.17.1


