Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E9F5C3DA7F
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 20:09:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.33316.1722802149444456242
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 13:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lkjQV4mH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 474K97qM056307;
	Sun, 4 Aug 2024 15:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722802147;
	bh=ZwTGSDpdBCvLjyBHF2szu61S1aQ6j4QCSlkckalJeaM=;
	h=From:To:Subject:Date;
	b=lkjQV4mHZY3V9Uz/YNbPufy6o1BZooii3oElrY4iFNS1HrB+l6FXB+utNlqPGqnj+
	 GAC8wWI5aWjdaGQXataU6J0sDE2htSY8e0AZH0Odtm8g7nBLjMwj5WZh4RAouKQIR+
	 xUFv9i0eY1+8IiQ0RunetdeodHQSHEdB3I2tjyrw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 474K97TW107965
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 Aug 2024 15:09:07 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 4
 Aug 2024 15:09:07 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 4 Aug 2024 15:09:07 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 474K97cA046778;
	Sun, 4 Aug 2024 15:09:07 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sahXP-0007bA-0l; Sun, 04 Aug 2024 15:09:07 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] u-boot-ti-mainline: Update to 2024.07
Date: Sun, 4 Aug 2024 15:09:06 -0500
Message-ID: <20240804200906.29156-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 04 Aug 2024 20:09:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17920

Update to the latest u-boot release v2024.07.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index f497054c..3457772c 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -2,7 +2,7 @@ require u-boot-ti.inc
 
 PR = "r0"
 
-PV = "2024.01"
+PV = "2024.07"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -13,4 +13,4 @@ PV = "2024.01"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
+SRCREV = "3f772959501c99fbe5aa0b22a36efe3478d1ae1c"
-- 
2.17.1


