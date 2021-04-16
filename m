Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2865.1618607243088404122
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Apr 2021 14:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=VaA1pnEF;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13GL7Ksr088333;
	Fri, 16 Apr 2021 16:07:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618607240;
	bh=SHrsAZu9KCx4gt6VqumrvTz1uJHqUA2xGrtdVoQvpmM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VaA1pnEFq0lDQ9P1YmgXncQVinXkwEIp5cDtmvckgGVrxxoefId1ECUw9pc7aK913
	 HMMovsznLHkLZ7p3XIuQcRcAXTcv4p1OUIT0ZbdUqQO8WRYjOOrz/a9ieyxgDpHIG9
	 O9wYluz1JjPBAE8mkl4aS8GbebMjt1TA7O7hgJPQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13GL7Kcb103378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 16:07:20 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 16:07:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 16:07:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13GL7Jrl006285;
	Fri, 16 Apr 2021 16:07:19 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/2] conf: dra7xx-evm: Remove non-existent dtb* from 5.10
Date: Fri, 16 Apr 2021 16:07:17 -0500
Message-ID: <20210416210717.30692-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416210717.30692-1-praneeth@ti.com>
References: <20210416210717.30692-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    dra7-evm-lcd-osd101t2045.dtb
-    dra7-evm-lcd-osd101t2587.dtb
-    dra71-evm-nand.dtb
-    dra71-evm-lcd-auo-g101evn01.0.dtb
-    dra72-evm-lcd-osd101t2045.dtb
-    dra72-evm-lcd-osd101t2587.dtb
-    dra72-evm-revc-lcd-osd101t2045.dtb
-    dra72-evm-revc-lcd-osd101t2587.dtb
-    dra76-evm-tfp410.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/dra7xx-evm.conf | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index 67f9a0d1..ad4b0263 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -10,19 +10,10 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
-    dra7-evm-lcd-osd101t2045.dtb \
-    dra7-evm-lcd-osd101t2587.dtb \
     dra71-evm.dtb \
-    dra71-evm-nand.dtb \
-    dra71-evm-lcd-auo-g101evn01.0.dtb \
     dra72-evm.dtb \
-    dra72-evm-lcd-osd101t2045.dtb \
-    dra72-evm-lcd-osd101t2587.dtb \
     dra72-evm-revc.dtb \
-    dra72-evm-revc-lcd-osd101t2045.dtb \
-    dra72-evm-revc-lcd-osd101t2587.dtb \
     dra76-evm.dtb \
-    dra76-evm-tfp410.dtb \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
-- 
2.17.1

