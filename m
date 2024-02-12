Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 222B9C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 09:46:18 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3327.1707731169016328514
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 01:46:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=svJgwMlQ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41C9k8S7084678
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 03:46:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707731168;
	bh=aYtJ4lrT8tm9ht2dbdb+msydDJtBgzy1KTl8PvyE/WQ=;
	h=From:To:CC:Subject:Date;
	b=svJgwMlQdW7o0D6A5vnUUzbUX/cqUGl4Z09dYBmN7snNBFbY+LNPb8GIU0YNn9KB/
	 UKEzIajAjSVjG4tvu/FQKScGd55hCOpkv2VxTQ73P5kUkBHsgV0YV6tO3+DI5su1hA
	 oVSqalkQsunT+ey4mJ8eJGukn6REAlkZUY46sizI=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41C9k8AY014433
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 03:46:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 03:46:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 03:46:07 -0600
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41C9k7Rx037641;
	Mon, 12 Feb 2024 03:46:07 -0600
From: Chirag Shilwant <c-shilwant@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Sai Sree Kartheek Adivi <s-adivi@ti.com>,
        Paresh Bhagat <p-bhagat@ti.com>, Gyan Gupta <g-gupta@ti.com>,
        Khasim
	<khasim@ti.com>
Subject: [meta-ti][kirkstone/master][PATCH] conf: machine: Apply U-boot fragment configs for AM62P Display Cluster Image
Date: Mon, 12 Feb 2024 15:15:52 +0530
Message-ID: <20240212094552.2246859-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 09:46:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17466

- For AM62P tisdk-display-cluster image[1], Splash Screen is handled by SBL[2].
Hence, disable the A53 based U-boot Splash Screen using the am62px_evm_prune_splashscreen.config
fragment present in ti-u-boot tree.

- Apply a check on DISPLAY_CLUSTER_ENABLE variable[3] to ensure we apply am62px_evm_prune_splashscreen.config
only incase of tisdk-display-cluster image as tisdk-default-image will still have the A53 based U-boot Splash Screen.

References
----------
[1] https://git.ti.com/cgit/ti-sdk-linux/meta-tisdk/tree/recipes-core/images/tisdk-display-cluster-image.bb?h=kirkstone

[2] https://software-dl.ti.com/mcu-plus-sdk/esd/AM62PX/09_01_00_39/exports/docs/api_guide_am62px/EXAMPLES_DRIVERS_DSS_DISPLAY_SHARE.html

[3] https://software-dl.ti.com/processor-sdk-linux/esd/AM62PX/09_01_00_08/exports/docs/linux/Overview_Building_the_SDK.html#build-steps

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index d7c9f589..95602116 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -16,3 +16,10 @@ KERNEL_DEVICETREE = " \
 "
 
 UBOOT_MACHINE = "am62px_evm_a53_defconfig"
+
+# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
+# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u-boot-mergeconfig.inc
+# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
+# For AM62P tisdk-display-cluster image, splash screen is handled by SBL.
+# Hence, disable the A53 based splash screen using the am62px_evm_prune_splashscreen.config fragment present in ti-u-boot tree
+UBOOT_CONFIG_FRAGMENTS = "${@oe.utils.conditional('DISPLAY_CLUSTER_ENABLE', '1', 'am62px_evm_prune_splashscreen.config', '', d)}"
-- 
2.34.1


