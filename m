Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6834.1634123673975743107
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Oct 2021 04:14:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t4Bp0VeB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19DBEWPx109261;
	Wed, 13 Oct 2021 06:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634123672;
	bh=+S9fAH8OMhYEwL/VEWjAopvr9740FfHqvxIkVaUpwGs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=t4Bp0VeBmBgQyPDVOZyN7+rmTiQF173KZAB4CixvG/j0NEQ36ZSI/079fIPghzDII
	 PtxDIrnLFyH/yjknK8ki+bg754fnMbpW2kL4viG6CLxyrFUV1prBVfCDx2cR8zAW8W
	 /jTEzWmS9mfP1Aon7OYPtjqVcHweueHgLgWZXGXs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19DBEWpB126822
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Oct 2021 06:14:32 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 13
 Oct 2021 06:14:32 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 13 Oct 2021 06:14:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19DBEWKh024192;
	Wed, 13 Oct 2021 06:14:32 -0500
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/dunfell PATCH v2 2/2] conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
Date: Wed, 13 Oct 2021 11:14:32 +0000
Message-ID: <20211013111432.62301-3-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211013111432.62301-1-yogeshs@ti.com>
References: <20211013111432.62301-1-yogeshs@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This reverts commit 43bf0f36a3ac62cc3378688358ba704a27b501ce.
Added dtb and dtbo for am57xx

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---

Changes from v1:
1) Fixed compile issue.
2) Corrected the dtbo path

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

