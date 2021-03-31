Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.304.1617209498547498507
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 09:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=kG1dWq4l;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYhl077633;
	Wed, 31 Mar 2021 11:51:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617209494;
	bh=Mva4cQfRMH4QNMP+tNnK98hILw1/rdVZwHV7fRCHu0A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=kG1dWq4leTAwYJTSV2syjW0e7bxSyWYBPH40lVfMjO8ACIm33WL6WtdI3SmJn1ShB
	 za0jq1NEemf9BfPvs9P+rW8fLrvGrAeAlaKrEDLDLiEDEi6N2w7Zo72jL2QH+XQOJr
	 /pncEj76h0Efws1VADGD/bu7FS9COwhvDxXKiN3w=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VGpYXY072195
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 11:51:34 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 11:51:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 11:51:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VGpYmr003249;
	Wed, 31 Mar 2021 11:51:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master][PATCH 5/7] conf/machine: am64xx: Consolidate image configuration to SoC include
Date: Wed, 31 Mar 2021 11:51:31 -0500
Message-ID: <20210331165133.3746-6-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331165133.3746-1-nm@ti.com>
References: <20210331165133.3746-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

IMAGE type and dependencies can easily be centralized to SoC include
file. This is necessary to make sure that we don't do the duplication
and having multiple places to fix up.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 conf/machine/am64xx-evm.conf    | 8 --------
 conf/machine/am64xx-sk.conf     | 8 --------
 conf/machine/include/am64xx.inc | 6 ++++++
 3 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index eda310a32b14..c6ba2a8735f3 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -4,12 +4,4 @@
 
 require conf/machine/include/am64xx.inc
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
-
-do_image_wic[depends] += "trusted-firmware-a:do_deploy"
-do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
index 4cad8adcf1df..445ff72339d9 100644
--- a/conf/machine/am64xx-sk.conf
+++ b/conf/machine/am64xx-sk.conf
@@ -4,16 +4,8 @@
 
 require conf/machine/include/am64xx.inc
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-
 UBOOT_MACHINE = "am64x_sk_a53_defconfig"
 
-do_image_wic[depends] += "trusted-firmware-a:do_deploy"
-do_image_tar[depends] += "trusted-firmware-a:do_deploy"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
 KERNEL_DEVICETREE = " \
     ti/k3-am642-sk.dtb \
 "
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 20441d8a757f..3173319df354 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,6 +10,12 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
 "
 
+IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+do_image_wic[depends] += "trusted-firmware-a:do_deploy"
+do_image_tar[depends] += "trusted-firmware-a:do_deploy"
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
-- 
2.31.0

