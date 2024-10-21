Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B6BD17137
	for <webhook@archiver.kernel.org>; Mon, 21 Oct 2024 20:39:00 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.2864.1729543132524885236
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Oct 2024 13:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tVC3/08B;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49LKcp3l065408;
	Mon, 21 Oct 2024 15:38:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729543131;
	bh=enUfKwVVtnzYWayYXpQb9z72KUzhTPZBqPwRJ9qeGgQ=;
	h=From:To:Subject:Date;
	b=tVC3/08Bs97WU+bM/0xbseC47E5kyzErBcKqccCiHVggk20BsIy9JfOtmNW2HwdmO
	 CMAzh0o9rTGOFk2sGjiXq6VYXhV1xXQZ046Fgi3ASHkpvRQQJ0wQMkgdyzydWytawZ
	 PS/pMExDGxpDN/3MIYEzQkUU4WuKfAfodUWAxHtY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49LKcpLv002997
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 21 Oct 2024 15:38:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 21
 Oct 2024 15:38:50 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 21 Oct 2024 15:38:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49LKcp6b020378;
	Mon, 21 Oct 2024 15:38:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t2zAw-0002Gn-Ry; Mon, 21 Oct 2024 15:38:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] u-boot-ti-mainline: Update to 2024.10
Date: Mon, 21 Oct 2024 15:38:50 -0500
Message-ID: <20241021203850.8685-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 21 Oct 2024 20:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18022

Update to the latest u-boot release v2024.10.

Additionally, take this time to clean up the mainline recipe and
streamline it a bit.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-bsp/u-boot/u-boot-ti-mainline_git.bb  | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 3457772c..e1b51ce7 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -1,16 +1,9 @@
 require u-boot-ti.inc
 
-PR = "r0"
+SUMMARY = "Mainline U-Boot for TI devices"
 
-PV = "2024.07"
+PV = "2024.10"
 
-# For the un-initiated:
-# The actual URL you'd use with a git clone for example would be:
-# https://source.denx.de/u-boot/u-boot.git/
-# However, in the context of OE, we have to explicitly split things up:
-# a) we want it to use git fetcher - hence git:// prefix in GIT_URI (if we
-#  used https here, we'd endup attempting wget instead of git)
-# b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
-UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
+
+SRCREV = "f919c3a889f0ec7d63a48b5d0ed064386b0980bd"
-- 
2.17.1


