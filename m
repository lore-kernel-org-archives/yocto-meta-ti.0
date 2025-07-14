Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D75EBC83F17
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 16:30:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.82644.1752510595354243059
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Jul 2025 09:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W47/WszD;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56EGTsiD2691424;
	Mon, 14 Jul 2025 11:29:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752510594;
	bh=c7a3fFkeLWBAQ5GJ1wZPT3ESjjdCZEye2uDGtm38cdo=;
	h=From:To:Subject:Date;
	b=W47/WszDhGy4IHtn1imhJgMgHbbojPBa589dfz4IbDJSFsjdSAJRjqEgbBA55ehsG
	 T56ct8vZvIaYndArmUIbNQwaMOwO+HBFEuDPNG32XByVPsEr7PCMSRPqDAZq4uSZXD
	 nqNPBlFnYuHoXRh5Dx1SLUd/80VL/LcrAEybUY/E=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56EGTshg4052268
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 14 Jul 2025 11:29:54 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 14
 Jul 2025 11:29:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 14 Jul 2025 11:29:54 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56EGTs4O1338701;
	Mon, 14 Jul 2025 11:29:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ubM3t-0005kN-VS; Mon, 14 Jul 2025 11:29:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] linux-ti-staging-rt_6.12: Need finer control for BRANCH
Date: Mon, 14 Jul 2025 11:29:53 -0500
Message-ID: <20250714162953.22052-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 14 Jul 2025 16:30:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18780

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
v2: Added _6.12 to subject/commit message.

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


