Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.1217.1634595036420286677
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 15:10:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eWIT7Xov;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAZ0V123167;
	Mon, 18 Oct 2021 17:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634595035;
	bh=z7v9nDPIwAwDdJQcLGPU67Ub3BTm5SwCnz8r3v7vTiM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=eWIT7XovlmgER+IoNR3Kki0sqBse3lJooTu3LUGXvdK+37CVLzMyMT4ZrfD+GmP1E
	 cp/kzh19phQT8SU1y45occbVVTQA5wfJQ4vk+qH+DsJV6XcYCFlwFryG8Ez+4l5lp7
	 sKPGoVL5fXKnxF64yoJehumie++g+jlLdXS1jzM4=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IMAYl7114805
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 17:10:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 17:10:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 17:10:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAYBA052943;
	Mon, 18 Oct 2021 17:10:34 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH v3 1/3] conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
Date: Mon, 18 Oct 2021 22:10:32 +0000
Message-ID: <20211018221034.11092-2-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211018221034.11092-1-yogeshs@ti.com>
References: <20211018221034.11092-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 8bdfe1413c00e0c55132989dafcf8d91827999c3.
Introduces existent dtb and dtbo for dra7x

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/dra7xx-evm.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ad4b0263..db4a5e1c 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -10,10 +10,18 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
+    ti/dra7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
+    dra71-evm-nand.dtb \
+    ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
+    ti/dra72-evm-touchscreen.dtbo \
+    ti/dra74-evm-touchscreen.dtbo \
     dra76-evm.dtb \
+    ti/dra76-evm-tfp410.dtbo \
+    ti/lcd-osd101t2045.dtbo \
+    ti/lcd-osd101t2587.dtbo \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
-- 
2.17.1

