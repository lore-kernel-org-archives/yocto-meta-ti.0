Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1140.1618867005438736014
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Apr 2021 14:16:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=F6Z7V2ex;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGikV043835;
	Mon, 19 Apr 2021 16:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618867004;
	bh=2+zKp3aF6F4IToFmO3aqgdIpJgaQmV1NmZkyzMtnlo8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F6Z7V2exE1tc5eHEtMpNW3Ue7+GfgEi253UE1Sx64rD6352UGNKLXFsIFt6NigFvA
	 LP4Eedt48TawBKQ/X0NDHC28Hh+lFS2IT9KZskMECE+wg5xums6EoCvDdCTMLLa9gJ
	 +AFlWdaV8mCfGKldRWe7xOwtgj3YvdtsbVSkPOaA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13JLGilJ104663
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Apr 2021 16:16:44 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 19
 Apr 2021 16:16:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 19 Apr 2021 16:16:44 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13JLGiqD085223;
	Mon, 19 Apr 2021 16:16:44 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v3 5/8] conf: am335x-evm: Remove non-existent dtb* from 5.10
Date: Mon, 19 Apr 2021 16:16:40 -0500
Message-ID: <20210419211643.3942-6-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210419211643.3942-1-praneeth@ti.com>
References: <20210419211643.3942-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    am335x-icev2-prueth.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/ti33x.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index b3c3b6d7..6dfda754 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -29,7 +29,6 @@ KERNEL_IMAGETYPE = "zImage"
 KERNEL_DEVICETREE = " \
     am335x-evm.dtb am335x-evmsk.dtb \
     am335x-icev2.dtb \
-    am335x-icev2-prueth.dtb \
     am335x-pocketbeagle.dtb am335x-bone.dtb am335x-boneblue.dtb \
     am335x-bonegreen.dtb am335x-bonegreen-wireless.dtb \
     am335x-boneblack.dtb am335x-boneblack-wireless.dtb \
-- 
2.17.1

