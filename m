Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.1224.1634595037207802429
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 18 Oct 2021 15:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=trp2egwl;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAZEL049168;
	Mon, 18 Oct 2021 17:10:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634595035;
	bh=z0q8gqrn9MjmZ07yVTn4vKp7bbApnFTKQpGSV5rZW4Q=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=trp2egwl3oJaUl8Z/xFjvQZ22ri+h3KoMwsy/C358SXRRukkkeXQ89yqwdoUa4ffp
	 VASmzkOBkMla7gamyQp2MUCOBidS5Edm3Sxv+gv7/QAxFIRYl7L1iUkbA0NaH27rRU
	 K3XX+oNO4U0XccLS6uTjDZf8W/iuLWbEp79pD1lA=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19IMAYHW114804
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 18 Oct 2021 17:10:35 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 18
 Oct 2021 17:10:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 18 Oct 2021 17:10:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19IMAYdm036572;
	Mon, 18 Oct 2021 17:10:34 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell][PATCH v3 2/3] conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
Date: Mon, 18 Oct 2021 22:10:33 +0000
Message-ID: <20211018221034.11092-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211018221034.11092-1-yogeshs@ti.com>
References: <20211018221034.11092-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 43bf0f36a3ac62cc3378688358ba704a27b501ce.
Added dtb and dtbo for am57xx

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/am57xx-evm.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 78e730ca..7441e80e 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,10 +14,14 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
-    am57xx-evm-reva3.dtb \
+    ti/am57xx-evm-common.dtbo \
+    ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
+    ti/am571x-idk-touchscreen.dtbo \
     am572x-idk.dtb \
     am574x-idk.dtb \
+    ti/am57xx-idk-osd-lcd-common.dtbo \
+    ti/am572x-idk-touchscreen.dtbo \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

