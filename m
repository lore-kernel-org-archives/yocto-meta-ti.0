Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488D7E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 17:52:31 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.62807.1734371542044448206
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 09:52:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Bsk5PryD;
 spf=pass (domain: list.ti.com, ip: 198.47.19.246, mailfrom: lcpdbld@list.ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGHqJmW3509715
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 11:52:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734371540; i=@ti.com;
	bh=wJOlZyirkf8m5f5eCNhqfsfaHkO2t4xYClWdt+2xKbo=;
	h=From:To:Subject:Date;
	b=Bsk5PryDMet9JUayqbJFpkEJMa7p4qwoNplShKtQ004MKU7sj2opx06Ub1UbNxNB0
	 4mY7/2qQftLdDuNFa7zsaWixFc4ZVLv57RoDU0Ws866gtBsXcAYKdG4Rkb5yqb7qR4
	 VZE2qKXFCTCCCRYcPXalMG3GkSXoaQs/b1SRcTEE=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGHqJt8079815
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 11:52:19 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 11:51:49 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 11:51:49 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGHpnYj034755;
	Mon, 16 Dec 2024 11:51:49 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <lcpdbld@list.ti.com>)
	id 1tNFG1-0004Z0-GH; Mon, 16 Dec 2024 11:51:49 -0600
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys
 Dmytriyenko <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-mainline: Update to version: v6.12
Date: Mon, 16 Dec 2024 11:51:49 -0600
Message-ID: <20241216175149.17499-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Dec 2024 17:52:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18122

From: Ryan Eatmon <reatmon@ti.com>

Updated the value(s) for:
  am57xx-evm: KERNEL_DEVICETREE
  am62axx-evm: KERNEL_DEVICETREE
  am62pxx-evm: KERNEL_DEVICETREE
  am62xx-evm: KERNEL_DEVICETREE
  am62xx-lp-evm: KERNEL_DEVICETREE
  am68-sk: KERNEL_DEVICETREE
  am69-sk: KERNEL_DEVICETREE
  beagleplay: KERNEL_DEVICETREE
  am64xx-evm: KERNEL_DEVICETREE
  am65xx-evm: KERNEL_DEVICETREE
  am335x-evm: KERNEL_DEVICETREE
  am437x-evm: KERNEL_DEVICETREE
  j7200-evm: KERNEL_DEVICETREE
  j721e-evm: KERNEL_DEVICETREE
  j721e-sk: KERNEL_DEVICETREE
  j721s2-evm: KERNEL_DEVICETREE
  j722s-evm: KERNEL_DEVICETREE
  j784s4-evm: KERNEL_DEVICETREE
  linux-ti-mainline: PV,SRCREV

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc               | 2 ++
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 6 +++---
 2 files changed, 5 insertions(+), 3 deletions(-)

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


