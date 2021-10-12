Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.16765.1634056919511649979
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 12 Oct 2021 09:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=H5MUEOfK;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19CGfvRl108304;
	Tue, 12 Oct 2021 11:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634056917;
	bh=GKvkVPWcBf3w1Gm+ZuxD6EPRN7Rrs0p7OPO2xuQkXyk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=H5MUEOfK9n2uFnQCNroTlYf8t+s5hhjAGrbRYSPb26MDzuuN/RuSGLk0+bFNDI035
	 AuAg9aNP6N0VMWUpn+uT+Wkq+rVpjwNZliwv/2rMDBB64JbWvaUytfDDULJbh60/IJ
	 lcqjN4Mq/8YJseU3KPh9QTWgV+Bred3fHi9Wqxyg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19CGfv56003459
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 12 Oct 2021 11:41:57 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 12
 Oct 2021 11:41:57 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 12 Oct 2021 11:41:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19CGfv8u103208;
	Tue, 12 Oct 2021 11:41:57 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH 1/2] conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
Date: Tue, 12 Oct 2021 16:41:56 +0000
Message-ID: <20211012164157.3888-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211012164157.3888-1-yogeshs@ti.com>
References: <20211012164157.3888-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 8bdfe1413c00e0c55132989dafcf8d91827999c3.
Introduces existent dtb and dtbo for dra7x

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/dra7xx-evm.conf | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ad4b0263..2beb569b 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -10,10 +10,21 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
+    d7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
+    dra71-evm-nand.dtb \
+    dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
+    dra72-evm-revc-lcd-osd101t2045.dtb \
+    dra72-evm-revc-lcd-osd101t2587.dtb \
+    dra72-evm-touchscreen.dtbo \
+    dra74-evm-touchscreen.dtbo \
     dra76-evm.dtb \
+    dra76-evm-tfp410.dtbo \
+    lcd-osd101t2045.dtbo \
+    lcd-osd101t2587.dtbo \
+
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
-- 
2.17.1

