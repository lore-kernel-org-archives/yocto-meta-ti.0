Return-Path: <b-padhi@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C511C83F1A
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 06:00:05 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.7277.1752213596083640288
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 10 Jul 2025 22:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rGkuKXna;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: b-padhi@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56B5xsFK1720371;
	Fri, 11 Jul 2025 00:59:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1752213594;
	bh=wHBLOPg3RA4meAi/jjfMVpBxqqs0Vc/xbuuKNJ5oDlE=;
	h=From:To:CC:Subject:Date;
	b=rGkuKXnacxdbrHJhAkkHUmyUTqM1qZAawFM9yUXhV5pBqoMuxGuBfscrCM06Q+nqk
	 L4JsQFqAIrvY/ILRlDHux+7NucZB2lGb8Lyn6V/P6Cz6UDhoAcEnledAYULmEmkA/a
	 JylJKMUCLtk0MIGqgHy5HHwS6TQHbZHYdpENel+8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56B5xs8i1987599
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 11 Jul 2025 00:59:54 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 11
 Jul 2025 00:59:53 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 11 Jul 2025 00:59:53 -0500
Received: from uda0510294.dhcp.ti.com (uda0510294.dhcp.ti.com [172.24.227.151])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56B5xprX2948358;
	Fri, 11 Jul 2025 00:59:51 -0500
From: Beleswar Padhi <b-padhi@ti.com>
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <a-limaye@ti.com>, <afd@ti.com>, <u-kumar1@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [master/scarthgap][PATCH v2] linux-ti-staging-rt_6.12: Add ARM32 RT branch
Date: Fri, 11 Jul 2025 11:29:50 +0530
Message-ID: <20250711055950.2658531-1-b-padhi@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Jul 2025 06:00:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18776

While all ARM64 devices use the same branch for RT and non-RT builds,
the ARM32 devices have a separate branch for RT Kernel which is
"ti-rt-linux-6.12.y-arm32". Update the BRANCH and SRCREV for ARM32
devices for RT builds.

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
---
v2: Changelog:
Ryan:
1. Update RT branch for all ARM32 devices (ti33x, ti43x and am57xx)
2. Update commit message to make it generic to ARM32
3. Shorten subject message.

Link to v1:
https://lore.kernel.org/all/20250710093957.3740966-1-b-padhi@ti.com/

 .../recipes-kernel/linux/linux-ti-staging-rt_6.12.bb  | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 9e5c4ee4..3a3df0e6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -6,4 +6,15 @@ KERNEL_LOCALVERSION:append = "-rt"
 # This will have priority over generic non-rt path
 FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.12:"
 
+BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
+SRCREV_ARM32 = "f0e4f5ca0905956c70779b31663f594c08c6a3bc"
+
+BRANCH:ti33x = "${BRANCH_ARM32}"
+BRANCH:ti43x = "${BRANCH_ARM32}"
+BRANCH:am57xx = "${BRANCH_ARM32}"
+
+SRCREV:ti33x = "${SRCREV_ARM32}"
+SRCREV:ti43x = "${SRCREV_ARM32}"
+SRCREV:am57xx = "${SRCREV_ARM32}"
+
 include ${@ 'recipes-kernel/linux/ti-extras-rt.inc' if d.getVar('TI_EXTRAS') else ''}
-- 
2.34.1


