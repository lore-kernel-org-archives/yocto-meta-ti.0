Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.16324.1636726303038125644
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 06:11:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QwJE7aq8;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1ACEBfZt074362;
	Fri, 12 Nov 2021 08:11:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1636726301;
	bh=Xp96g4zeEPjtvAW/gj6n3qz05Wpa3utNFIeOjcsPvEU=;
	h=From:To:Subject:Date;
	b=QwJE7aq8E8X+SuDMQMTUNzuD8x3dc/YabTYpbOvOJ9PbnqttfU2zYMDCiT0ltlC5C
	 MmX2XyzNeZG3u560cdXbNX2PLY3ECivZhKrBoupTFMXh+sWAHWBpk2LZWI+smV6maX
	 Dq3dPZCS/tRcxjkuctONOFdZWJJy+QDyVYNsoRh0=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1ACEBfG1056139
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Nov 2021 08:11:41 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 12
 Nov 2021 08:11:40 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 12 Nov 2021 08:11:41 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1ACEBe0J068092;
	Fri, 12 Nov 2021 08:11:40 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] conf: am57xx-evm: Add missing *.dtb and *.dtbo
Date: Fri, 12 Nov 2021 14:11:40 +0000
Message-ID: <20211112141140.49589-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Add missing dtb and dtbo to deploy folder

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 conf/machine/am57xx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 7441e80e..f977c5c6 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -15,6 +15,7 @@ KERNEL_DEVICETREE = " \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
     ti/am57xx-evm-common.dtbo \
+    am57xx-evm-reva3.dtb \
     ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
     ti/am571x-idk-touchscreen.dtbo \
@@ -22,6 +23,8 @@ KERNEL_DEVICETREE = " \
     am574x-idk.dtb \
     ti/am57xx-idk-osd-lcd-common.dtbo \
     ti/am572x-idk-touchscreen.dtbo \
+    ti/lcd-osd101t2587.dtbo \
+    ti/lcd-osd101t2045.dtbo \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

