Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DAFE77183
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 18:12:41 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.63391.1734372752729094427
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 10:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=d91fvDDa;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGICVog3511825
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 12:12:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734372751;
	bh=QORkp568iPIg60ijv/IIyYAnyoX5+Gc/5KJdGzzx74k=;
	h=From:To:Subject:Date;
	b=d91fvDDaMfK/FXQGK0fGR6vW3961XT/uxMs80467DknOx51zDWnSgZpeEKSrjxMCY
	 z/aF0iNHZJeN5aBaeIwPrIEGdNklpqvF6uwZ+CymbDBWmLEGBT4duLtwePrAvf8xxl
	 folkga/UQf8WJlDthkefNdYkSlhJ86JrKTv/Ervk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGICVfw024720
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 12:12:31 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 12:12:30 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 12:12:30 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGICU32059991;
	Mon, 16 Dec 2024 12:12:30 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tNFa2-0005Lg-R2; Mon, 16 Dec 2024 12:12:30 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] linux-ti-mainline: Update to version: v6.12
Date: Mon, 16 Dec 2024 12:12:30 -0600
Message-ID: <20241216181230.20523-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Dec 2024 18:12:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18123

Updated the value(s) for:
  am65xx-evm: KERNEL_DEVICETREE
  j722s-evm: KERNEL_DEVICETREE
  linux-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
v2: Fixed logic in script that was listing too many configs in the
    above table even though there were no changes.

 meta-ti-bsp/conf/machine/include/am65xx.inc               | 2 ++
 meta-ti-bsp/conf/machine/j722s-evm.conf                   | 4 +++-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 3 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 803e369c..99a3b12f 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -17,6 +17,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am654-idk.dtbo \
     ti/k3-am654-pcie-usb2.dtbo \
     ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am6548-iot2050-advanced-m2-bkey-ekey-pcie.dtbo \
+    ti/k3-am6548-iot2050-advanced-m2-bkey-usb3.dtbo \
     ti/k3-am6548-iot2050-advanced-m2.dtb \
     ti/k3-am6548-iot2050-advanced-pg2.dtb \
     ti/k3-am6548-iot2050-advanced-sm.dtb \
diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf/machine/j722s-evm.conf
index 74bcdfce..2af0981e 100644
--- a/meta-ti-bsp/conf/machine/j722s-evm.conf
+++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
@@ -10,6 +10,8 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-v3link \
 "
 
-KERNEL_DEVICETREE = ""
+KERNEL_DEVICETREE = " \
+    ti/k3-j722s-evm.dtb \
+"
 
 UBOOT_MACHINE = "j722s_evm_a53_defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 765375b0..803db1fd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -13,9 +13,9 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}"
 
 S = "${WORKDIR}/git"
 
-# 6.11 Mainline version
-SRCREV = "fa7818b3a6dd56c7956f515d287ed9f80c7bf59a"
-PV = "6.11"
+# 6.12 Mainline version
+SRCREV = "adc218676eef25575469234709c2d87185ca223a"
+PV = "6.12"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
 BRANCH = "master"
-- 
2.17.1


