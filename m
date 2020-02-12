Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.960.1581531831674785685
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Feb 2020 10:23:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SIw4porN;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3B331E01723; Wed, 12 Feb 2020 10:23:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC21BE01486
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2020 10:23:47 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01CINlgR128449
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2020 12:23:47 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581531827;
	bh=BPCh3zyiqZTTOrt8aDJd/buQ+6MfsOqb+rPCEUKDxUU=;
	h=From:To:CC:Subject:Date;
	b=SIw4porNe9v9yQuh+YFsv6AraE/dXV6lvX6/NyeXubMHhgMKl0PWyo1JyWe+xp6jp
	 G5E/szgtXAgibnXHRZvdqoAuUZwzc09CYBUo+Mz3Npxj4n2LaRhxtstEthHYTGqLfK
	 xG0owE++UsxSCYYtUO8irdiXZ+Z/eKJLKXjMzrnQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01CINl1Z089224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 12 Feb 2020 12:23:47 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 12
 Feb 2020 12:23:47 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 12 Feb 2020 12:23:47 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01CINk7p037076;
	Wed, 12 Feb 2020 12:23:46 -0600
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] conf/machine: add dependency for wic to package deployed SPL
Date: Wed, 12 Feb 2020 18:02:58 +0000
Message-ID: <20200212180258.14666-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/k3.inc       | 1 -
 conf/machine/include/omap-a15.inc | 1 +
 conf/machine/include/ti33x.inc    | 1 +
 conf/machine/include/ti43x.inc    | 1 +
 4 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index c9ff553d..3416be9e 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -39,5 +39,4 @@ IMAGE_FSTYPES += "tar.xz wic.xz"
 # u-boot-k3-r5 and ti-sci-fw recipes
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
 WKS_FILE ?= "sdimage-bootpart.wks"
-
 do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 1b9f653b..d458809a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -41,3 +41,4 @@ MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa etherne
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 4ee79957..3c752d54 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -63,3 +63,4 @@ TI_PDK_LIMIT_BOARDS = "evmAM335x icev2AM335x iceAMIC110 bbbAM335x skAM335x"
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+do_image_wic[depends] += "u-boot:do_deploy"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 252053c6..d1fc0b50 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -59,3 +59,4 @@ TI_PDK_LIMIT_BOARDS = "evmAM437x idkAM437x skAM437x"
 IMAGE_FSTYPES += "tar.xz wic.xz"
 WKS_FILE ?= "sdimage-bootpart.wks"
 IMAGE_BOOT_FILES ?= "${SPL_BINARY} u-boot.${UBOOT_SUFFIX}"
+do_image_wic[depends] += "u-boot:do_deploy"
-- 
2.17.1

