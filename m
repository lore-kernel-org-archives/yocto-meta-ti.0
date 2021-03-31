Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.515.1617235062348823088
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xlCdYew+;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveLR124637;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=w0TVP33dIfrr/Pnvo10G7SmxLI+9VhBQQUdtS3fMSpY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xlCdYew+3PVxF4S8SJC2y+JggdJbJPYCn26lrcG6rmayQXaT/Q8RlzqPYfIs+xuHx
	 G5mVX9d1qdynF0bc4/0wHRdkpFXTNkSS4J6wlIRNwxfdG+xgeLZ+6Ue79XRUVxmofP
	 PXcQofFEpRY5M08S3jznxFyUOzla4mMCV1NTiLVI=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNveL5118312
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvedO093154;
	Wed, 31 Mar 2021 18:57:40 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH V2 7/8] conf/machine: am64xx: Switch to multi-certificate boot images
Date: Wed, 31 Mar 2021 18:57:35 -0500
Message-ID: <20210331235736.30481-8-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331235736.30481-1-nm@ti.com>
References: <20210331235736.30481-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Switch to using all of multi-certificate boot images. This allows us
to create bootable images - in this case, we are missing tiboot3.bin

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---
Changes since V1:
- picked up reviewed-by
- rebase based on cleanup of tf-a
V1: https://lists.yoctoproject.org/g/meta-ti/message/13613
 conf/machine/include/am64xx.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 56d015023f5e..641bddd00b0a 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,7 +10,9 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
 "
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+# AM64 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
+
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 
-- 
2.31.0

