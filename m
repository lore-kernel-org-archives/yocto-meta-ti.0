Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E94EC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 23:49:41 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.4815.1651708174589408076
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 May 2022 16:49:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=pv+VHwI1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 244NnUuX023691;
	Wed, 4 May 2022 18:49:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651708170;
	bh=0gWT53Zmuk5SjlSjBTxfpSJan4KkApZMoXYKJf8zyac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=pv+VHwI1SJuwtcCjj7aDE7kydH3HU7KaGHuK+XVNFw1BMcnfMGI9jKSwdoNCzk1Qt
	 swbXN8kBryW5fKSEBwcc4nU+fjtvJjAqH3z6xw5VU4KF9oLK9UcOcEEdJkmuFQuAYT
	 Aw9F7vWqAq2v+KEhwIb8K8FgUaS6UBJB0/9fa6AU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 244NnUtD119154
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 May 2022 18:49:30 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 4
 May 2022 18:49:30 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 4 May 2022 18:49:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 244NnUcP108315;
	Wed, 4 May 2022 18:49:30 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
CC: Nishanth Menon <nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        Dave
 Gerlach <d-gerlach@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell PATCH v2 2/2] conf/machine: am62xx: Update build flag for
 low power mode
Date: Wed, 4 May 2022 18:49:30 -0500
Message-ID: <20220504234930.6508-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220504234930.6508-1-praneeth@ti.com>
References: <20220504234930.6508-1-praneeth@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 May 2022 23:49:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14697

From: Nishanth Menon <nm@ti.com>

Update build flag for arm-trusted-firmware to include low power mode
support

K3_PM_SYSTEM_SUSPEND is added in arm-trusted-firmware now which enables
low power mode support for am62xx.

Signed-off-by: Nishanth Menon <nm@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/am62xx.inc                              | 2 ++
 recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend | 1 +
 2 files changed, 3 insertions(+)

diff --git a/conf/machine/include/am62xx.inc b/conf/machine/include/am62xx.inc
index e8823dd2..ff857b97 100644
--- a/conf/machine/include/am62xx.inc
+++ b/conf/machine/include/am62xx.inc
@@ -6,6 +6,8 @@ MACHINE_FEATURES += "screen touchscreen"
 SERIAL_CONSOLES = "115200;ttyS2"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
+TFA_K3_SYSTEM_SUSPEND = "1"
+
 # AM62 supports multi-certificate images, use the same
 IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 
diff --git a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
index 80b1d664..5264fa97 100644
--- a/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
+++ b/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
@@ -9,6 +9,7 @@ TFA_INSTALL_TARGET_k3 = "bl31"
 TFA_SPD_k3 = "opteed"
 
 EXTRA_OEMAKE_append_k3 = "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
+EXTRA_OEMAKE_append_k3 += "${@ 'K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
 
 do_compile_append_am65xx-hs-evm() {
 	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
-- 
2.17.1


