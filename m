Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99476C433EF
	for <webhook@archiver.kernel.org>; Tue, 17 May 2022 21:53:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.3603.1652824424750589782
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 May 2022 14:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nQrMJ/fS;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24HLrbGc102425;
	Tue, 17 May 2022 16:53:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652824417;
	bh=z4KG9ixVwT04E2LrB+A+BY9wdCT1vDCb+7iS3fM6drk=;
	h=From:To:CC:Subject:Date;
	b=nQrMJ/fSjwkCNB5k6+1cSkEYLJTkPd+PTyw3sDBOxJo0EAfx9QA+5r+XpqS18kJYr
	 XoN4aZdRtUW82PHT6n05+g/h0Mw56JZW9cig3ucR1xkgtopdlYb3kJ0AkYR3IkPYjc
	 suaEY1vvn5WnE+GPrt7vnCtsoDfNqpd2U2WT8/Fo=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24HLrbbH116674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 17 May 2022 16:53:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 17
 May 2022 16:53:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 17 May 2022 16:53:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24HLrb93028392;
	Tue, 17 May 2022 16:53:37 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Brattlof Bryan <bb@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH] conf: machine: am62xx: add new dtb for low-power
Date: Tue, 17 May 2022 16:53:37 -0500
Message-ID: <20220517215337.30354-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 17 May 2022 21:53:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14746

The following commits in ti-linux-5.10.y kernel has introduced new dtbs.
a minimal skeleton and a lpm (low-power-mode) demo dtb.

commit c161df7b1ea0 ("arm64: dts: ti: Introduce k3-am625-sk-lpmdemo")
commit 61df7fcf9307 ("arm64: dts: ti: introduce minimal dt for am625")

This patch on am62xx conf is to include the new dtbs.

Reported-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/am62xx-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index 195cb90c..cbab26dd 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -8,6 +8,8 @@ MACHINE_FEATURES += "gpu"
 
 KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
+    ti/k3-am625-skeleton.dtb \
+    ti/k3-am625-sk-lpmdemo.dtb \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
 
-- 
2.17.1


