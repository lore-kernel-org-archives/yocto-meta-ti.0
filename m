Return-Path: <u-kumar1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8C1CC77B61
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 11:51:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5443.1680868282302636421
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 04:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UYn0PY86;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: u-kumar1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 337BpLpq072557
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680868281;
	bh=IAXxnRA0pry1UCM9tZfmwA9zNqE6faW47T6mhaLBaRw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UYn0PY86Okj64iOXUYJSZZxHZ8dohwVcvaWtzfeyoTVYuf/hb/XHVyYKJJG9iOjVB
	 i6QQhMDXJduEoVvsMTjzO4GIp7ZU1tC0tdiFLziH0CzwIXZ8zOQDnitd5ASuORMZCT
	 ATdV3hLegI8GzOuGbq/KMAwpFIs7BzQvWTEbaYik=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 337BpLU2018237
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 7 Apr 2023 06:51:21 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 7
 Apr 2023 06:51:21 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 7 Apr 2023 06:51:21 -0500
Received: from udit-HP-Z2-Tower-G9-Workstation-Desktop-PC.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 337BpDVd035857;
	Fri, 7 Apr 2023 06:51:20 -0500
From: Udit Kumar <u-kumar1@ti.com>
To: <praneeth@ti.com>, <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <m-chawdhry@ti.com>, Udit Kumar <u-kumar1@ti.com>
Subject: [PATCH 3/4] meta-ti-bsp: conf: machine: j721s2: Update SPL_BINARY
Date: Fri, 7 Apr 2023 17:21:06 +0530
Message-ID: <20230407115107.839204-4-u-kumar1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230407115107.839204-1-u-kumar1@ti.com>
References: <20230407115107.839204-1-u-kumar1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 11:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16323

u-boot 2023.4 merged SPL build target for HS and GP
as tispl.bin_HS.
This patch updates SPL_BINARY to align with u-boot.

Signed-off-by: Udit Kumar <u-kumar1@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/machine/j721s2-evm.conf
index bef5684f..100008f0 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -20,6 +20,8 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j721s2_evm_a72_defconfig"
 
+SPL_BINARY = "tispl.bin_HS"
+
 # Default tiboot3.bin on J721S2 is for GP
 BBMULTICONFIG = "k3r5-gp"
 do_image_complete[mcdepends] = "mc::k3r5-gp:ti-sci-fw:do_deploy"
-- 
2.34.1


