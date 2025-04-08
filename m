Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C04C36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 20:15:06 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.5941.1744143303444940310
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 13:15:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=gQOMgnMe;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: jm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 538KExuB1302134
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Apr 2025 15:14:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744143299;
	bh=1nX4CQIVHg/1XMtWB513oqgcZ3Dg/7Ju1fQ+51sAAk4=;
	h=From:To:CC:Subject:Date;
	b=gQOMgnMekpya1RY2VvRi/gCY7L1nYGhK9QDTxbTKwsHekCjAHVDZbsnHTYuat4l+J
	 TfFAmrsg0rrgYxR7o+u64CqCbW25JrBIJdqbR3CybCUmeEbFAABEKegTb/P20zdHmV
	 heejCk8zZRHeZile4rAuEijXpckQn7KiqMgoq2UY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 538KEx0G007938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 8 Apr 2025 15:14:59 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 8
 Apr 2025 15:14:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 8 Apr 2025 15:14:59 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 538KExsZ074317;
	Tue, 8 Apr 2025 15:14:59 -0500
From: Judith Mendez <jm@ti.com>
To: <reatmon@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] conf: machine: am62xx-lp-evm: Add eqep overlay
Date: Tue, 8 Apr 2025 15:14:59 -0500
Message-ID: <20250408201459.2863836-1-jm@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 08 Apr 2025 20:15:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18452

This patch adds prefix string for eqep overlay to
KERNEL_DEVICETREE_PREFIX.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 32d9eb31..37f4a644 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
     ti/k3-am625-sk \
     ti/k3-am62x-sk-dmtimer-pwm \
+    ti/k3-am62x-sk-eqep \
     ti/k3-am62x-sk-hdmi \
     ti/k3-am62x-sk-lpm \
     ti/k3-am62x-sk-mcan \
-- 
2.49.0


