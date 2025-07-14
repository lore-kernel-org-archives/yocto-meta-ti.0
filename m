Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4086DC83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:01:13 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.81767.1752508868719115211
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 09:01:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rAs2+YPd;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EG15sZ2410362;
	Mon, 14 Jul 2025 11:01:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752508865;
	bh=h3c+M9v+Ay+DKQoHP3hA8suh8/w1g+Ngf7DGSqBGwbE=;
	h=From:To:Subject:Date;
	b=rAs2+YPdF810McNIu71TlaGiF71QRKqvlDZT1Govzyriu88zsDnWpkUXZsPFLZR6j
	 9SKcDQBH9B30eicormtyvdwLQ9RU2WcRQ6HqLNwsWDBBITmW4hclW76jhj5ZURJhsd
	 DuIKua22lNhe1gv+1XZZed/IQyFmhhkicWZ76aD8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EG15Ue3515713
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 14 Jul 2025 11:01:05 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 11:01:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 11:01:04 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EG14KE1295518;
	Mon, 14 Jul 2025 11:01:04 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ubLc0-0003lP-Ho; Mon, 14 Jul 2025 11:01:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] linux-ti-staging-rt: Need finer control for BRANCH
Date: Mon, 14 Jul 2025 11:01:04 -0500
Message-ID: <20250714160104.14428-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Jul 2025 16:01:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18779

The CICD flow needs to control the value for BRANCH in order to have the
recipe updated with the next SRCREV, but point to the CICD/next branch
for initial build/test.

With this split in linux-ti-staging-rt we cannot just have an override
for BRANCH in the local.conf because it trumps the new BRANCH_ARM32
system.

This patch creates an additional "default" variable BRANCH_ARM64 (or not
arm32), which can be controlled separately by the CICD flow.  Then BRANCH
simply is picking between the two and so can be controlled by overrides
in the recipe.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 8f638df2..8da70a02 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -6,6 +6,9 @@ KERNEL_LOCALVERSION:append = "-rt"
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 
+BRANCH_ARM64 = "ti-linux-6.12.y"
+BRANCH = "${BRANCH_ARM64}"
+
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
 SRCREV_ARM32 = "1fcbb534d8fab782f701fc197a4345db693b5fc9"
 PV_ARM32 = "6.12.35+git"
-- 
2.17.1


