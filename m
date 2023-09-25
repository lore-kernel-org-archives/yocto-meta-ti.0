Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B270FCE7A9D
	for <webhook@archiver.kernel.org>; Mon, 25 Sep 2023 16:08:13 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.65258.1695658092550094609
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 25 Sep 2023 09:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Gj1LeKdX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38PG8BWt125648;
	Mon, 25 Sep 2023 11:08:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1695658091;
	bh=T3taJdh6M8hhN0mw43yFYeArXSKJp0zs5pOtR0+Bqlo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Gj1LeKdXRKMgHoXw4q1KkZMKXzV/uv+B2CbXpnh9l+UW0PzblA3ZXO9Uona3FGHgw
	 bqhD/tiMPIe6sUqlNj2nO7EUlQNZqGOCQMggGIm+x/2gJJo9ct5XpinyFLpgZdmZ70
	 /y9r3x66LPcvSHVsblq4XuxOCYevAyxXR9xkn+F8=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38PG8AKS006560
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 25 Sep 2023 11:08:11 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 25
 Sep 2023 11:08:10 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 25 Sep 2023 11:08:10 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38PG8AuS106830;
	Mon, 25 Sep 2023 11:08:10 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qko82-0007gN-Ht; Mon, 25 Sep 2023 11:08:10 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 2/2] u-boot-ti-mainline: update to the latest 2023.07
Date: Mon, 25 Sep 2023 11:08:10 -0500
Message-ID: <20230925160810.29488-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230925160810.29488-1-reatmon@ti.com>
References: <20230925160810.29488-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 25 Sep 2023 16:08:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17012

Update to the latest release version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index ebeb4d42..64bb1441 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 
 PR = "r0"
 
-PV = "2022.10"
+PV = "2023.07"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -15,4 +15,4 @@ PV = "2022.10"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "4debc57a3da6c3f4d3f89a637e99206f4cea0a96"
+SRCREV = "83cdab8b2c6ea0fc0860f8444d083353b47f1d5c"
-- 
2.17.1


