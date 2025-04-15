Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2463C369B5
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:37:12 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.15950.1744709824866676666
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 02:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VGMidMMm;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: anshuld@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53F9b35i2317731
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 04:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744709824;
	bh=HD0IgBDkR4mf6ukYcr6LnO0US9z5fp0wwiFt55MrosQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VGMidMMmsKw4CazsQWMP9qdug+6xkkxrSnFwwgjRqpTXwgdF+LgpzaPMj2G3lObrO
	 v0AggM2pr8iVUDHmm5KBw6r0Mqx4uJV9hdbJq123WV/0+v1fO4QCpmBmdY19ubTPKv
	 GwotaoCDQ0OWI4iqH+7AOueeUQ8C0JF4e2D3tKyc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53F9b3Sb041444
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 04:37:03 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 04:37:02 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 04:37:02 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53F9b2NW073246;
	Tue, 15 Apr 2025 04:37:02 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [master/scarthgap][PATCH v1 2/3] bsp: conf: machine: add ti-falcon.inc
Date: Tue, 15 Apr 2025 15:06:43 +0530
Message-ID: <20250415093645.435281-2-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250415093645.435281-1-anshuld@ti.com>
References: <20250415093645.435281-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 09:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18470

ti-falcon.inc configures the following things for enabling falcon boot:

1. Change fitImage class to kernel-fitimage-legacyhs
2. Update kernel and dtb address for falcon boot
3. Disable kernel compression

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc        | 4 ++++
 meta-ti-bsp/conf/machine/include/ti-falcon.inc | 5 +++++
 2 files changed, 9 insertions(+)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-falcon.inc

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index ea6a5028..329ac037 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -56,3 +56,7 @@ TI_WKS_BOOTLOADER_APPEND ?= ""
 do_image_wic[depends] += "virtual/bootloader:do_deploy"
 
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS2"
+
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

