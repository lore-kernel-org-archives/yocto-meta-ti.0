Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3429C25B50
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 20:41:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.54888.1674506483363119355
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 23 Jan 2023 12:41:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g0L641qo;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: jm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30NKfMHr066977
	for <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 14:41:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674506482;
	bh=Ee7GbCCWBnZGUMlgwICQZraiPn5xbLAkFHEAozGNwr8=;
	h=From:To:CC:Subject:Date;
	b=g0L641qoI+lPmeSgaZNuNJRl4xSvVhtdXQUbKLlg+zbame4ZQlV82y7ut1JQzPAK8
	 /jNz2BkYaaej5sv0OwP8RpKdA0SPaEZ0LD1L9CM1eukdutxJ7UKYbnF7T2zlcctoT0
	 jdAVIudwEKVj98ktI430Kw4MOcsnSNq1tP6eB8DU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30NKfMb2006461
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 14:41:22 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 23
 Jan 2023 14:41:22 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 23 Jan 2023 14:41:22 -0600
Received: from uda0498204.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30NKfMnY010571;
	Mon, 23 Jan 2023 14:41:22 -0600
From: Judith Mendez <jm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@ti.com>
CC: Judith Mendez <jm@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell v2] trusted-firmware-a: upgrade to v2.8+
Date: Mon, 23 Jan 2023 14:41:22 -0600
Message-ID: <20230123204122.22432-1-jm@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 23 Jan 2023 20:41:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15630

Upgrade arm-trusted-firmare to v2.8-226-g2fcd408bb.

This upgrade picks up K3 L2 cache, snoop delayed, and EA
handling updates from upstream master.

Do not update to tip of master due to PSCI system off
support breaking AM62x and AM62q platforms.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index a5eb9ff8..4dcba358 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -1,6 +1,6 @@
-PV_k3 = "2.6"
+PV_append_k3 = "+git${SRCPV}"
 LIC_FILES_CHKSUM_k3 = "file://license.rst;md5=1dd070c98a281d18d9eefd938729b031"
-SRCREV_tfa_k3 = "1309c6c805190bd376c0561597653f3f8ecd0f58"
+SRCREV_tfa_k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
 COMPATIBLE_MACHINE_k3 = "k3"
 TFA_BUILD_TARGET_k3 = "all"
 TFA_INSTALL_TARGET_k3 = "bl31"
-- 
2.17.1


