Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C715BC433F5
	for <webhook@archiver.kernel.org>; Fri, 13 May 2022 16:51:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.36.1652460673972219063
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 May 2022 09:51:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=b3N6Wd0T;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24DGpCRu067141;
	Fri, 13 May 2022 11:51:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652460672;
	bh=RAUikOmOJMehBhn7L4gpzPB4oXajABKoF9QoBHW9YSo=;
	h=From:To:Subject:Date;
	b=b3N6Wd0TsL9R+DeQUqnRSJ1vRKXbDb+w6CCV5Afb+oe2Whft7xfx0A6gYMvxuo3Ql
	 CUa9Qil+kQKJ0JS1noHd2XJvBcwQydb+h6JNNPljhJhCv9fIFn6SFVkoEtZn44A5iy
	 u2dj4bQuio+LewYu8yWgltKOhtcQBvmB8cIPmzGQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24DGpCl2015322
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 May 2022 11:51:12 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 13
 May 2022 11:51:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 13 May 2022 11:51:12 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24DGpCgn027042;
	Fri, 13 May 2022 11:51:12 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1npYVT-0003d0-WC; Fri, 13 May 2022 11:51:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] conf: machine: am62xx Fix overlay
 extension
Date: Fri, 13 May 2022 11:51:11 -0500
Message-ID: <20220513165111.13907-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 May 2022 16:51:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14737

The file extension for the overlay needs to be .dtbo.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 conf/machine/am62xx-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index 44f46d78..195cb90c 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -8,7 +8,7 @@ MACHINE_FEATURES += "gpu"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
-    ti/k3-am625-sk-csi2-ov5640.dtb \
+    ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-- 
2.17.1


