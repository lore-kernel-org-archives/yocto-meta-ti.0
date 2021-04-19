Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1162.1618867005331086814
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=oFFOPZ3X;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGiFR043831;
	Mon, 19 Apr 2021 16:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867004;
	bh=iNbnEu9YXZJQmMmiwUvFo+/JxS9LB5EN+CHiVjPC3+E=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oFFOPZ3XlKOyLHxPiTe8zWiTCoZ41SMzZ0YYBCh0INQ1oqSefY4AsLAqUElqjgDxo
	 PZCGsrQ5OyITwgqkHHb/E7yY192piVZ8t1H+t+OyUmeqgXIRWJwFf7QJ6eUPJCkONO
	 zQWX4DWR/rpOetPR5IUqzT54Ioje7mFB462KTt0o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGiRG004712
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:44 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGivF067950;
	Mon, 19 Apr 2021 16:16:44 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 4/8] conf: k2g-evm: Remove keystone-k2g-evm-lcd.dtb from 5.10
Date: Mon, 19 Apr 2021 16:16:39 -0500
Message-ID: <20210419211643.3942-5-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419211643.3942-1-praneeth@ti.com>
References: <20210419211643.3942-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb, as they are not currently present on
ti-linux-5.10.y.

-    keystone-k2g-evm-lcd.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/k2g-evm.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/machine/k2g-evm.conf b/conf/machine/k2g-evm.conf
index 7681a752..d4cf0605 100644
--- a/conf/machine/k2g-evm.conf
+++ b/conf/machine/k2g-evm.conf
@@ -6,7 +6,7 @@ require conf/machine/include/k2g.inc
 
 MACHINE_FEATURES += "alsa"
 
-KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-evm-lcd.dtb keystone-k2g-ice.dtb \
+KERNEL_DEVICETREE = "keystone-k2g-evm.dtb keystone-k2g-ice.dtb \
                      ${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'keystone-k2g-ice-pru-excl-uio.dtb', '', d)}"
 
 UBOOT_MACHINE = "k2g_evm_config"
-- 
2.17.1

