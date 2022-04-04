Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD22CC47085
	for <webhook@archiver.kernel.org>; Mon,  4 Apr 2022 18:46:41 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.35954.1649080707605895587
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 Apr 2022 06:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Mj8z+cc2;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 234DwMdF123327;
	Mon, 4 Apr 2022 08:58:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649080702;
	bh=JrqHu56rrUhuLTNB86vIFlfM0mrV115eYfuK6jL8V+A=;
	h=From:To:CC:Subject:Date;
	b=Mj8z+cc2C6LEyZV4yzpnEMeNBVQixJEZ9zRQy1BrNj6VaK7MArftUfvE0cDw1UwBX
	 gTkV7TvzdaI84wNRfu5V2KTcR1etZMEzLqKXeLWn6q3ShndtzlA7EFLvuS9R3gyJKY
	 2fxy242JZ1NmIT25bLZT48bbw1chrSte6UIy/86I=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 234DwMqD070870
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 4 Apr 2022 08:58:22 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 4
 Apr 2022 08:58:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 4 Apr 2022 08:58:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 234DwMGt001310;
	Mon, 4 Apr 2022 08:58:22 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master] conf: am62xx: remove unused dtbs
Date: Mon, 4 Apr 2022 08:58:22 -0500
Message-ID: <20220404135822.913-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 04 Apr 2022 18:46:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14588

The current ti-linux-5.10.y kernel doesnt have the
following dtb.
-    ti/k3-am625-sk-lpmdemo.dtb
-    ti/k3-am625-minimal.dtb

This patch is to remove them for now.
Enable the applicable dtb once the equivalent support is
added in ti-linux-5.10.y kernel later.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/am62xx-evm.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index 086e40e4..eb1563f8 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -8,8 +8,6 @@ MACHINE_FEATURES += "gpu"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
-    ti/k3-am625-sk-lpmdemo.dtb \
-    ti/k3-am625-minimal.dtb \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-- 
2.17.1


