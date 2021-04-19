Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.1163.1618867006020881512
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZNnUsMTy;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGjXq042027;
	Mon, 19 Apr 2021 16:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867005;
	bh=rJFkUoHJSe25jHh5nL8SgEQD9juc1GAHBYTOgb2rDa4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZNnUsMTyZWtlSwoTUDnxOjfNFg7EH2lTattkzlW+lZg5rflwkykmgyaI0HEu6uvOa
	 F7GH/KLPvMwfNisS8e7kp8EE+mfUQAoHw/7arm2ncIUEMv/ssZETTc2l9BK+ckWhz5
	 l6ana3wWbxQ/urbL01XJp3VTJFGWqnKV7fqPiGbI=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGjUX092669
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGiTW085233;
	Mon, 19 Apr 2021 16:16:44 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 7/8] conf: am57xx-evm: Remove non-existent dtb* from 5.10
Date: Mon, 19 Apr 2021 16:16:42 -0500
Message-ID: <20210419211643.3942-8-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419211643.3942-1-praneeth@ti.com>
References: <20210419211643.3942-1-praneeth@ti.com>
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

