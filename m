Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD87FC54E58
	for <webhook@archiver.kernel.org>; Tue, 12 Mar 2024 17:11:42 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.2040.1710263498220952765
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Mar 2024 10:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tZL/oAkM;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42CHBbrg048170;
	Tue, 12 Mar 2024 12:11:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710263497;
	bh=tuvGUbGYC44FPu0u64oxwxPC47FgacBIJj5FVTbH+VM=;
	h=From:To:CC:Subject:Date;
	b=tZL/oAkMZP+Ca0a/QpInz1wV++fMNbOQnjmm8ZXoq7it7nmE6cWC8yUrhMaYQUwO9
	 Xzme0nyawWV7RGgDaDmHanArAniyj4AhPNcrlGzI3TnWfmOyq/7YMIWi7XCP+ofCoX
	 Nb4dfrWGh6YtpwHZ6Il3XwO7BX1hMCJuxnSdGjN8=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42CHBawG016935
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Mar 2024 12:11:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 12
 Mar 2024 12:11:36 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 12 Mar 2024 12:11:36 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (udit-hp-z2-tower-g9-workstation-desktop-pc.dhcp.ti.com [172.24.227.18])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42CHBY5p128068;
	Tue, 12 Mar 2024 12:11:35 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <sbellary@baylibre.com>, <sinthu.raja@mistralsolutions.com>,
        <reatmon@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [meta-ti][kirkstone][PATCH v2] conf: machine: am57xx: export ov10635 camera device tree overlay
Date: Tue, 12 Mar 2024 22:41:32 +0530
Message-ID: <20240312171132.1330699-1-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 12 Mar 2024 17:11:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17519


Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
Changelog:
Changes in v2:
1) Updated subject of patch
2) moved overlay to KERNEL_DEVICETREE_PREFIX
link to v1:
https://lore.kernel.org/all/20240311111359.1556157-1-u-kumar1@ti.com/

 meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/machine/am57xx-evm.conf
index 43a6a833..8bcf20ea 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -10,6 +10,7 @@ SERIAL_CONSOLES = "115200;ttyS2"
 
 KERNEL_DEVICETREE_PREFIX = " \
     am57 \
+    ov10635 \
     ti/am57 \
     ti/lcd \
     ti/ov10635 \
-- 
2.34.1


