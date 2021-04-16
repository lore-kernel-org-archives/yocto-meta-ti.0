Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.4940.1618549568262864753
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a2HpSWJD;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G567QO095412;
	Fri, 16 Apr 2021 00:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549567;
	bh=2+zKp3aF6F4IToFmO3aqgdIpJgaQmV1NmZkyzMtnlo8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a2HpSWJDE+k/oksh7mZVD1tuR80NT9QgbHGIBdeX8kZWqALtUvvSx+rlSEImdM/pW
	 TKAGeaHQiaU0lCxpe+g41woQ8pGLFgn+X+6f1iHXOjOIlzzfGivjBJMLhxpOqzr0jM
	 01I2PX5UuU9irs1uilFuYu4xH97WCIJzDrof1b3g=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G567ei091050
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:07 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:07 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G566OU064388;
	Fri, 16 Apr 2021 00:06:06 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 5/6] conf: am335x-evm: Remove non-existent dtb* from 5.10
Date: Fri, 16 Apr 2021 00:05:59 -0500
Message-ID: <20210416050600.16593-6-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416050600.16593-1-praneeth@ti.com>
References: <20210416050600.16593-1-praneeth@ti.com>
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

