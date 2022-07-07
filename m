Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A486C43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 20:26:28 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.2542.1657225587432823657
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 07 Jul 2022 13:26:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XARG4QjZ;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 267KQQSZ006265;
	Thu, 7 Jul 2022 15:26:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1657225586;
	bh=bKmOrruU8S8Q9e8+OTV7yJ1e19SX759xq5tsb/4TZ7A=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XARG4QjZoY/V7p6/umhgzkG3IYkQbsNCCKJfIw4lOYAyOO8Bkg2rtoK1bILZG85uU
	 L+EfwU3xTXmH6rETfQHntUOVRh9glst4hQK/CJsEOJwxaGRWrAUWjurAxpKuIIGjru
	 UoHGCf4iiTGILkbp1vW8izxORApULgF57zP7TSlw=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 267KQQHU093235
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 7 Jul 2022 15:26:26 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 7
 Jul 2022 15:26:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 7 Jul 2022 15:26:25 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 267KQPE3127644;
	Thu, 7 Jul 2022 15:26:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o9Y4v-0005a7-P8; Thu, 07 Jul 2022 15:26:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/3] linux-ti-staging: Bump to 08.04.00.004
 release
Date: Thu, 7 Jul 2022 15:26:24 -0500
Message-ID: <20220707202625.21413-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14875

Updated the linux version for 08.04.00.004

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 633e15e4..d7cb9914 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "a293790a7822997b0ff63bdd95f580ac6e2d85e2"
+SRCREV = "b56b1fd4a1c0e331114d15f7030bc8397a7e7b9b"
 PV = "5.10.120+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1


