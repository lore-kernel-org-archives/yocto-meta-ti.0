Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48BD0CD1292
	for <webhook@archiver.kernel.org>; Thu,  4 Apr 2024 13:37:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.38275.1712237854122251762
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 04 Apr 2024 06:37:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RZ2nsUDG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 434DbWSl041202;
	Thu, 4 Apr 2024 08:37:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712237852;
	bh=TgfFBsKNXqwLzu9f2A25MaHHU59tUQdbz+vq4iv5/bM=;
	h=From:To:Subject:Date;
	b=RZ2nsUDGKHGoWrfWrraKCXJXOe8Pj2oWFerz9lDES1dlio5vSYU3c+/SR3uP9MjuV
	 HZ0PZ/5vYjQ1FP+OPr5QxDyzBRlhz+PNzmgMWtZoO/hUXCeoBHhBTPEdVeDParwsid
	 2IvL0WTZChHszFzhnh/yjk1EB0t7sFbaIivAB8Uo=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 434DbWLf065931
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 4 Apr 2024 08:37:32 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 4
 Apr 2024 08:37:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 4 Apr 2024 08:37:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 434DbW8b129724;
	Thu, 4 Apr 2024 08:37:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rsNHY-0008SX-50; Thu, 04 Apr 2024 08:37:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: machine: beagleplay/beaglebone-ai64: Set KERNEL_DEVICETREE_PREFIX
Date: Thu, 4 Apr 2024 08:37:32 -0500
Message-ID: <20240404133732.32477-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 04 Apr 2024 13:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17558

Set the KERNEL_DEVICETREE_PREFIX so that, when using the various TI
kernel recipes, the "correct" DTB files are pulled in depending on what
is available in that kernel source.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 4 ++++
 meta-ti-bsp/conf/machine/beagleplay.conf      | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index 8ec52bba..a9be4d13 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -13,6 +13,10 @@ UBOOT_MACHINE = "j721e_evm_a72_config"
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 UBOOT_CONFIG_FRAGMENTS = "j721e_beagleboneai64_a72.config"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j721e \
+"
+
 KERNEL_DEVICETREE = " \
 ti/k3-j721e-beagleboneai64.dtb \
 ti/k3-j721e-common-proc-board.dtb \
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index 75e62afd..65c14333 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -28,6 +28,11 @@ UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
 PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am625 \
+    ti/k3-am62x-sk \
+"
+
 KERNEL_DEVICETREE = " \
 ti/k3-am625-beagleplay.dtb \
 ti/k3-am625-beagleplay-csi2-ov5640.dtbo \
-- 
2.17.1


