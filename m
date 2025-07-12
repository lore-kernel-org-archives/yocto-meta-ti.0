Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BA2C83F10
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 16:31:27 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.39662.1752337883888448554
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 12 Jul 2025 09:31:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eN2LaQU4;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56CGVMlp2269979;
	Sat, 12 Jul 2025 11:31:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752337882;
	bh=IPKSN8u5o2qk4RlsErCFI28WGr14PFiuTyrt4pNxEUI=;
	h=From:To:Subject:Date;
	b=eN2LaQU4DQQivZLweiXFK9eszkFuotydeuB0oJTUU3mHm/tywDKREja/7oIy64jB1
	 Rk88aX0l/0njbaOn/1dGLdnX+uc5NQapGdOAgx91re4Q8/Tc+JEHSmcaNZqDlbnxwM
	 r7bygt7kBN+gRHrmWUBdvdfvLh08/B6WYz6ad3So=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56CGVMS62428861
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Sat, 12 Jul 2025 11:31:22 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 12
 Jul 2025 11:31:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Sat, 12 Jul 2025 11:31:21 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56CGVLEj1188022;
	Sat, 12 Jul 2025 11:31:21 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uad8D-0004nU-Ku; Sat, 12 Jul 2025 11:31:21 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] linux-ti-staging-rt_6.12: Add PV tracking for ARM32
Date: Sat, 12 Jul 2025 11:31:21 -0500
Message-ID: <20250712163121.18401-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 12 Jul 2025 16:31:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18778

Since the kernel branches could theoretically drift apart, we need to
track the PV of the kernel on the RT branch for the ARM32 platforms as
well.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 3a3df0e6..513b9c0f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -8,6 +8,7 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
 SRCREV_ARM32 = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
+PV_ARM32 = "6.12.35+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
@@ -17,4 +18,8 @@ SRCREV:ti33x = "${SRCREV_ARM32}"
 SRCREV:ti43x = "${SRCREV_ARM32}"
 SRCREV:am57xx = "${SRCREV_ARM32}"
 
+PV:ti33x = "${PV_ARM32}"
+PV:ti43x = "${PV_ARM32}"
+PV:am57xx = "${PV_ARM32}"
+
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
-- 
2.17.1


