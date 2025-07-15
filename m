Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD77C83F22
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 17:54:49 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.1742.1752602087518421357
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Jul 2025 10:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EMaFBU7w;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56FHsj202664934;
	Tue, 15 Jul 2025 12:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752602085;
	bh=VWv9ExBHi8Z65/eKYl03EvdUoBG8qe9TX9VCQbJcivg=;
	h=From:To:Subject:Date;
	b=EMaFBU7w5k0MzQjNF81vLt/YX3JIEIcNZA2QIWgy3Yifnfz20EdmmmsTbzJIVwSbD
	 ToKulED0xLFA+HhHIHscC7ovAa3cVV1VpPSwLYSYWJirlLKikdVtSskaFCPkj5XmNq
	 /oiPrahXLalN/rW2zsmgeOvVz1zvRVuKUhm0FI00=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56FHsjQo758672
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 15 Jul 2025 12:54:45 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 15
 Jul 2025 12:54:45 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 15 Jul 2025 12:54:45 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56FHsjVW2998545;
	Tue, 15 Jul 2025 12:54:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ubjrZ-0007fz-AT; Tue, 15 Jul 2025 12:54:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-kernel-fitimage: Add ti-secdev
Date: Tue, 15 Jul 2025 12:54:45 -0500
Message-ID: <20250715175445.28647-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Jul 2025 17:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18788

In order to turn the fitImage signing back on, we need to inherit the
ti-secdev class to setup all of the needed signing variables.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
index dae76387..a5e6a280 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb
@@ -3,6 +3,8 @@ FIT_CONF_PREFIX ?= "conf-ti_"
 
 require recipes-kernel/linux/linux-yocto-fitimage.bb
 
+inherit ti-secdev
+
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
 
 do_compile[depends] += "virtual/kernel:do_shared_workdir"
-- 
2.17.1


