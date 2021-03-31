Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.514.1617235062053070524
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DQg6CJ33;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNvebm124629;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=nML+W35qXAqMPPwRFgLMfprKiAPyAXl21fxEZYL9P48=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DQg6CJ336933O/TcPydWiseAVXOUA4fMiyl7l3NswIxP+8C5lSQ9UuIm9SmU5YLZ5
	 TJawXDhhm/bWQTYfOlpuQK9sz27/4IAAgJRozF4yTyZES9DrYh3JU4iMwmL+2vRwzT
	 aDX3H4+HP79N04yYT7TfCqWHHkNkKwSIry7+3/hI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNve2d001465
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveJi093146;
	Wed, 31 Mar 2021 18:57:40 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH V2 5/8] conf/machine: j7200-evm: Switch to multi-certificate boot images
Date: Wed, 31 Mar 2021 18:57:33 -0500
Message-ID: <20210331235736.30481-6-nm@ti.com>
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
---
Changes since V1:
- Updated patch by dropping the tf-a dependency

V1: https://lists.yoctoproject.org/g/meta-ti/message/13610

 conf/machine/j7200-evm.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/conf/machine/j7200-evm.conf b/conf/machine/j7200-evm.conf
index 5a589f305c7c..5ee6c89c080e 100644
--- a/conf/machine/j7200-evm.conf
+++ b/conf/machine/j7200-evm.conf
@@ -14,7 +14,8 @@ KERNEL_DEVICETREE = " \
 
 UBOOT_MACHINE = "j7200_evm_a72_config"
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+# J7200 supports multi-certificate images, use the same
+IMAGE_BOOT_FILES = "${IMAGE_BOOT_FILES_MULTI_CERT}"
 
 do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-- 
2.31.0

