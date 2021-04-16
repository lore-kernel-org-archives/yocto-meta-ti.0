Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2891.1618607243088041230
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 14:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T7WeJSle;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GL7J5i086318;
	Fri, 16 Apr 2021 16:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618607239;
	bh=rJFkUoHJSe25jHh5nL8SgEQD9juc1GAHBYTOgb2rDa4=;
	h=From:To:CC:Subject:Date;
	b=T7WeJSleUHgpOe1QViCOtQjFLfX+k74Vgr99RiWPcZKPPlTcQ8SQagBhraxFuMD83
	 rgmCfRtIINnukK4sgnK3IYRdvJX9ZL/kIbY7w2KXze2Gvcy8bl49W3fgSICm/4l2ER
	 29l+ibwSHo1CH8knkLpKKWUSMRATPhnqqpxkuXes=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GL7JgB087514
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 16:07:19 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 16:07:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 16:07:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13GL7Is3067097;
	Fri, 16 Apr 2021 16:07:18 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 1/2] conf: am57xx-evm: Remove non-existent dtb* from 5.10
Date: Fri, 16 Apr 2021 16:07:16 -0500
Message-ID: <20210416210717.30692-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    am57xx-evm-cam-ov10635.dtb
-    am57xx-evm-reva3-cam-ov10635.dtb
-    am571x-idk-lcd-osd101t2045.dtb
-    am571x-idk-lcd-osd101t2587.dtb
-    am572x-idk-lcd-osd101t2045.dtb
-    am572x-idk-lcd-osd101t2587.dtb
-    am574x-idk-lcd-osd101t2587.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/am57xx-evm.conf | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 3b0c18af..78e730ca 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,17 +14,10 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
-    am57xx-evm-cam-ov10635.dtb \
     am57xx-evm-reva3.dtb \
-    am57xx-evm-reva3-cam-ov10635.dtb \
     am571x-idk.dtb \
-    am571x-idk-lcd-osd101t2045.dtb \
-    am571x-idk-lcd-osd101t2587.dtb \
     am572x-idk.dtb \
-    am572x-idk-lcd-osd101t2045.dtb \
-    am572x-idk-lcd-osd101t2587.dtb \
     am574x-idk.dtb \
-    am574x-idk-lcd-osd101t2587.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

