Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AEE3CCA479
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 20:26:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.2661.1657225587409618551
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 13:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=LN6Dfrm4;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267KQQtK006269;
	Thu, 7 Jul 2022 15:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657225586;
	bh=hRJGX9ceomc04mqL6CjxuULpcfFx7qfkKtYhbsthrTA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LN6Dfrm4re5rUC8YN7TGMs+17tjvzy7UoPSYLUfp9pf4ZmJnvL3U9oTwGJNsoUccC
	 WtkCVdRz80TaQFy3hp7RNV7czdyWfcmpvoRxCOGznIyAPssVGlvwkXEtyIUu6N3mF7
	 WMV4LDcLuTtUXtTsbsb5c+G7qofd/cNWP2Z+cCao=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267KQQIH017001
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Jul 2022 15:26:26 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 15:26:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 15:26:26 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267KQQPq109014;
	Thu, 7 Jul 2022 15:26:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o9Y4v-0005aG-TY; Thu, 07 Jul 2022 15:26:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 3/3] linux-ti-staging-rt: Bump to
 08.04.00.004 release
Date: Thu, 7 Jul 2022 15:26:25 -0500
Message-ID: <20220707202625.21413-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220707202625.21413-1-reatmon@ti.com>
References: <20220707202625.21413-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 07 Jul 2022 20:26:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14874

Updated the linux rt version for 08.04.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 828bee43..deae742c 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "70d8aea23ac37d6a72bfd18fd8661ca6f1136c0a"
+SRCREV = "1872082f52dc08d10c9db367dd3530fb9b4e5a9c"
 PV = "5.10.120+git${SRCPV}"
-- 
2.17.1


