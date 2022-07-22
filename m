Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 109ECC43334
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:03:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.3401.1658455411624067734
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 Jul 2022 19:03:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=YHgvzap9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26M23T1O113942;
	Thu, 21 Jul 2022 21:03:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658455409;
	bh=f/RKOU0MZy/4+onGhx+MEyemj4dzkm5fNyv4x8SYrwo=;
	h=From:To:Subject:Date;
	b=YHgvzap9mz7pnobI/nk7mS5N6g4YMZ+F88AR6EQ3eqlMVD86FA5MzoQQlySARs93E
	 R01otlXIFBBnW5HQTpcGH+3yHUrbL70ON0bkKz6dFeazWROb5P/fputAQ2VY3NVg8p
	 HQUvu8Lz9lP1z0OoSEpzMf1jf36JdTJ8JyA3pQTg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26M23Tww005793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 21 Jul 2022 21:03:29 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 21
 Jul 2022 21:03:29 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 21 Jul 2022 21:03:29 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26M23TV8029866;
	Thu, 21 Jul 2022 21:03:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oEi0m-0001sF-TJ; Thu, 21 Jul 2022 21:03:28 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH v2] kernel u-boot: Fix formulation of
 LOCALVERSION
Date: Thu, 21 Jul 2022 21:03:28 -0500
Message-ID: <20220722020328.7150-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 22 Jul 2022 02:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14897

devtool does not work with the current formulation of
the LOCALVERSION variables.  We need to use SRCPV to
avoid AUTOREV on bleeding builds, but there will be no
+ in the string, so we cannot split on that.  Just
use SRCPV directly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: More testing showed the first pass caused some problems.

 recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
 recipes-kernel/linux/setup-defconfig.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti.inc b/recipes-bsp/u-boot/u-boot-ti.inc
index e7c93335..1f8fb6de 100644
--- a/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,6 +1,6 @@
 # UBOOT_LOCALVERSION can be set to add a tag to the end of the
 # U-boot version string.  such as the commit id
-UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
+UBOOT_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
 
 UBOOT_SUFFIX ?= "img"
 SPL_BINARY ?= "MLO"
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 1e97acc0..df7d9ac8 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,6 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
-KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).split('+')[1]}"
+KERNEL_LOCALVERSION = "-g${@d.getVar('SRCPV', True).replace('AUTOINC+','')[:10]}"
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
-- 
2.17.1


