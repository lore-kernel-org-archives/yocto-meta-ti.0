Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.4941.1618549569702097848
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 22:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=g5ybUbys;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13G568Q2093496;
	Fri, 16 Apr 2021 00:06:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618549568;
	bh=Cmjjvfw0JZjw+DJVJnlKOrqHXVKB5Er31ivQ3o/JKFg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=g5ybUbys4qdeFvvrwgFLZgwhz5v8qCz0J0lP6GLuDH5Ec1+U89UFxPf9SmELacFvK
	 KJmW7+J6egfyH15FnP73lQhmXeO7UR5iDyd3JyJAuloPkm3WNnL1v5N6TOJMhPItuu
	 4G+aLHouUlsV6VzdE/rdwGS/erkDD3hHAMNYEhTk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13G5686U077925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Apr 2021 00:06:08 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Apr 2021 00:06:08 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Apr 2021 00:06:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13G567SF064465;
	Fri, 16 Apr 2021 00:06:07 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH v2 6/6] conf: am437xx-evm: Remove non-existent dtb* from 5.10
Date: Fri, 16 Apr 2021 00:06:00 -0500
Message-ID: <20210416050600.16593-7-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210416050600.16593-1-praneeth@ti.com>
References: <20210416050600.16593-1-praneeth@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Remove the non-existent dtb* , as they are not currently present on
ti-linux-5.10.y.

-    am437x-gp-evm-hdmi.dtb
-    am43x-epos-evm-hdmi.dtb

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 conf/machine/include/ti43x.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 524b0b2c..b1a27f93 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -27,9 +27,9 @@ PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 KERNEL_IMAGETYPE = "zImage"
 
 KERNEL_DEVICETREE = " \
-    am437x-gp-evm.dtb am437x-gp-evm-hdmi.dtb \
+    am437x-gp-evm.dtb \
     am437x-sk-evm.dtb am437x-idk-evm.dtb \
-    am43x-epos-evm.dtb am43x-epos-evm-hdmi.dtb \
+    am43x-epos-evm.dtb \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am437x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.17.1

