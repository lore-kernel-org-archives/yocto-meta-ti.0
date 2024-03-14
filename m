Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC23DC54E5D
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 17:34:16 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2495.1710437647909050593
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Mar 2024 10:34:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ptbosuIS;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42EHY7ce069040
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 12:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710437647;
	bh=OyC9QynhAO3iPZTRCXxzvlA+68bA3Rz05/wp3cng3OM=;
	h=From:To:CC:Subject:Date;
	b=ptbosuISB6oGr6cvqHuyXD9vk8UkN21HczNMMRBbgC8R0N2go/XC7PWjYJzP8gswM
	 ljs6yTU5oaMgcCwto4w64jGgnqEzvwhOPF2161KVWgUJbV2GJhXtRrjzHCV3o4WdgB
	 BPoj82JPwIa46ScsdFhTmxrJWP2E86WFhjRVuknE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42EHY7W1056629
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 12:34:07 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Mar 2024 12:34:06 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Mar 2024 12:34:06 -0500
Received: from localhost (praneethhome.dhcp.ti.com [128.247.81.61])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42EHY6iv090739;
	Thu, 14 Mar 2024 12:34:06 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Vibhore Vardhan <vibhore@ti.com>
Subject: [kirkstone PATCH] conf: machine: am62p: pick lpm overlay
Date: Thu, 14 Mar 2024 12:34:06 -0500
Message-ID: <20240314173406.10661-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Mar 2024 17:34:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17531

From: Praneeth Bajjuri <praneeth@ti.com>

overlay k3-am62x-sk-lpm-wkup-sources.dtso is common across
am62x platforms. This overlay is added in 6.1 kernel at [1]

[1]: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?&id=4ba1886b886d

This patch is to enable the same low power management wakeup sources
overlay for am62pxx platform as well.

Reported-by: Vibhore Vardhan <vibhore@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index 95602116..fab96bd8 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -9,6 +9,7 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62p5 \
     ti/k3-am62x-sk-csi2 \
     ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-lpm \
 "
 
 KERNEL_DEVICETREE = " \
-- 
2.17.1


