Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.4960.1618549567827112440
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZOgJjeSg;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G5664Y093490;
	Fri, 16 Apr 2021 00:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549566;
	bh=yqW45Lc80TCcRMEDJKt822ZfMqkzy3HXvIruVXPB2Hw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ZOgJjeSgOJze5JRDFxICZsmkzS6lBkoxXTetd+huI6cgXZN3S4Fwzn88QfYy2UnUk
	 zgyIJqyxfPp1wxhcvELxOTEtGZWb09/pW76OfypYJkt0GXHgO0wKEWaV9NCToCXN5r
	 VyemIbH08D94BiopnxEJmZaUr9QXUblX9IT0C2bU=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G566ui116103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:06 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G565xF037123;
	Fri, 16 Apr 2021 00:06:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 4/6] conf: k2g-evm: Remove non-existent dtb* from 5.10
Date: Fri, 16 Apr 2021 00:05:58 -0500
Message-ID: <20210416050600.16593-5-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416050600.16593-1-praneeth@ti.com>
References: <20210416050600.16593-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    keystone-k2g-evm-lcd.dtb
-    keystone-k2g-ice.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/k2g-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 7681a752..e032068e 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa"
 
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb \
                      ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "k2g_evm_config"
-- 
2.17.1

