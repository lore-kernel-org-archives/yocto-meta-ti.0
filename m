Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.274.1617209498444837614
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iVq59WaY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYf7077629;
	Wed, 31 Mar 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209494;
	bh=aLDVN+BSqBWYOIqcsyesKnrJro4bArQ/zvftjwlsoqE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=iVq59WaYUkk37wHnazNqhewhKdVxWjlIgpgZ92qgdMNTjJmZEcHK77YrE+ajBFYUi
	 CcOfneImm4uE/BnLmNgQRxhPSFznTOCoPGk6/F6J4HO0rU9tGvqOZyPZ6GPd0WEDAv
	 aR/PybDq7Bgl2jnlpJLsj9Ac3DtEuwVpmwY1mvtw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYcr091684
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:34 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYOM085054;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 2/7] conf/machine: am65xx: Document boot images as legacy mode
Date: Wed, 31 Mar 2021 11:51:28 -0500
Message-ID: <20210331165133.3746-3-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331165133.3746-1-nm@ti.com>
References: <20210331165133.3746-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

We use the default IMAGE_BOOT_FILES configuration which matches up with
legacy boot configuration. Document the same to allow folks to
understand by just looking at the SoC include file.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 conf/machine/include/am65xx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index 684fea45b6d7..bb5911f7b041 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -23,6 +23,7 @@ KERNEL_DEVICETREE = " \
 
 BBMULTICONFIG += "k3r5-sr2"
 
+# Use default IMAGE_BOOT_FILES_LEGACY files
 IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
 do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
-- 
2.31.0

