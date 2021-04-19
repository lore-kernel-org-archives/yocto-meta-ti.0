Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1125.1618867006057773328
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QO6kJqg7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGjSh042031;
	Mon, 19 Apr 2021 16:16:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867005;
	bh=SHrsAZu9KCx4gt6VqumrvTz1uJHqUA2xGrtdVoQvpmM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=QO6kJqg721wfge2nX9kD47N2m2UrsPRAA4G3FqwIwKUgF7+f7rBddwHUDgZ7pd7hU
	 GwbLl9B84tg+YISrxfAK9Vu1/mEpbm63KgaeUkpdVo+8+dQ+8DRWI0GNfZtTUBS52y
	 o0cTPJz3c/I/pc5U+9XindVfDau6ZUnJOB+1mMN8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGjZB031921
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:45 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:44 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGipM050762;
	Mon, 19 Apr 2021 16:16:44 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 8/8] conf: dra7xx-evm: Remove non-existent dtb* from 5.10
Date: Mon, 19 Apr 2021 16:16:43 -0500
Message-ID: <20210419211643.3942-9-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419211643.3942-1-praneeth@ti.com>
References: <20210419211643.3942-1-praneeth@ti.com>
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

