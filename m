Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.491.1617235062355287625
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 31 Mar 2021 16:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d1wuT5z7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12VNveJB124633;
	Wed, 31 Mar 2021 18:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617235060;
	bh=NGE015NNmlBg6GLq8s8l8Jsx5JKtZRQ1YI/LzRTrzAU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=d1wuT5z7Il2sDme5ICB5hyKonimS/hi44Vi/hbjCdxA5aSryaK7uQJk4Or3PYJ4rr
	 6a/QfmJ0//oyMEcDUMi+zDo8ckg4jQiZojMeLJT5IpyroDOKXzfKemC7WfJtfE6whV
	 BbtNlY/LIy9DoIOkuarkQL/ZBvDAI66f0/RKM8vQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12VNveku096227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 31 Mar 2021 18:57:40 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 31
 Mar 2021 18:57:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 31 Mar 2021 18:57:40 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12VNve4Z093151;
	Wed, 31 Mar 2021 18:57:40 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>
CC: <denis@denix.org>, <meta-ti@lists.yoctoproject.org>,
        Nishanth Menon
	<nm@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH V2 6/8] conf/machine: am64xx: Consolidate image configuration to SoC include
Date: Wed, 31 Mar 2021 18:57:34 -0500
Message-ID: <20210331235736.30481-7-nm@ti.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210331235736.30481-1-nm@ti.com>
References: <20210331235736.30481-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

IMAGE type and dependencies can easily be centralized to SoC include
file. This is necessary to make sure that we don't do the duplication
and having multiple places to fix up.

Signed-off-by: Nishanth Menon <nm@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
---
Changes since V1:
- picked up reviewed-by
- rebased on cleanups for tf-a

NOTE: merge of sk and evm is still pending, hopefully we can do that
in a follow on series later on.

V1: https://lists.yoctoproject.org/g/meta-ti/message/13611

 conf/machine/am64xx-evm.conf    | 5 -----
 conf/machine/am64xx-sk.conf     | 5 -----
 conf/machine/include/am64xx.inc | 4 ++++
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
index 788b15abab21..c6ba2a8735f3 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -4,9 +4,4 @@
 
 require conf/machine/include/am64xx.inc
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-
 UBOOT_MACHINE = "am64x_evm_a53_defconfig"
-
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
diff --git a/conf/machine/am64xx-sk.conf b/conf/machine/am64xx-sk.conf
index 70c9c4f6ae7c..445ff72339d9 100644
--- a/conf/machine/am64xx-sk.conf
+++ b/conf/machine/am64xx-sk.conf
@@ -4,13 +4,8 @@
 
 require conf/machine/include/am64xx.inc
 
-IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
-
 UBOOT_MACHINE = "am64x_sk_a53_defconfig"
 
-do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
-
 KERNEL_DEVICETREE = " \
     ti/k3-am642-sk.dtb \
 "
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 20441d8a757f..56d015023f5e 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -10,6 +10,10 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm.dtb \
 "
 
+IMAGE_BOOT_FILES = "tispl.bin u-boot.img"
+do_image_wic[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] = "mc::k3r5:ti-sci-fw:do_deploy"
+
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am65x"
 OPTEEOUTPUTMACHINE = "k3"
-- 
2.31.0

