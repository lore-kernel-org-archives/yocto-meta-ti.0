Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 663A4C369C2
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 11:36:47 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6410.1744889798356519381
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Apr 2025 04:36:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Y9EJ+/Gk;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53HBabD52951021
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 06:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744889797;
	bh=satio7vTI9nc664rj0HBcZCw7AUMrmyQqvhe6o0n47k=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Y9EJ+/Gk7lmZbd4EvHifRjXUEKz6EisExWBuPZuTbwUQkFuMUm0TLtSGy7lXTVgUz
	 6yeqQrqKKR4nMdicFj0tyTYTggokWo7mUVMdlbeT5+Dgxru6YAYYbsfDej2wzLhkiF
	 +pmJKmpcAAJhie+dwibCcYaCYzJtc0QBiY+Nz7EI=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53HBabFE005842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 06:36:37 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 17
 Apr 2025 06:36:37 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 17 Apr 2025 06:36:37 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53HBaaiw103245;
	Thu, 17 Apr 2025 06:36:37 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [PATCH v2 2/3] bsp: conf: machine: add ti-falcon.inc
Date: Thu, 17 Apr 2025 17:06:12 +0530
Message-ID: <20250417113614.1780603-3-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417113614.1780603-1-anshuld@ti.com>
References: <20250417113614.1780603-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 17 Apr 2025 11:36:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18481

ti-falcon.inc configures the following things for enabling falcon boot:

1. Change fitImage class to kernel-fitimage-legacyhs
2. Update kernel and dtb address for falcon boot
3. Disable kernel compression

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc        | 5 +++++
 meta-ti-bsp/conf/machine/include/ti-falcon.inc | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index ea6a5028..2f8b17ca 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -56,3 +56,8 @@ TI_WKS_BOOTLOADER_APPEND ?= ""
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
+
+FALCON_INCLUDE = ""
+FALCON_INCLUDE:ti-falcon = "conf/machine/include/ti-falcon.inc"
+
+require ${FALCON_INCLUDE}
diff --git a/meta-ti-bsp/conf/machine/include/ti-falcon.inc b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
new file mode 100644
index 00000000..b571c04d
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-falcon.inc
@@ -0,0 +1,5 @@
+KERNEL_CLASSES:remove = "kernel-fitimage"
+KERNEL_CLASSES += "kernel-fitimage-legacyhs"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+UBOOT_LOADADDRESS = "0x82200000"
+FIT_KERNEL_COMP_ALG = "none"

