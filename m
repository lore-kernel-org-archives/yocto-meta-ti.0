Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCBCC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 16:21:56 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3.1710346911680720770
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 09:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Zh3MKMQK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42DGLomM053494;
	Wed, 13 Mar 2024 11:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710346910;
	bh=idYuwdDlgqiGqhH8zPca407Sp5nnWMyBzp58Yl/q8j4=;
	h=From:To:Subject:Date;
	b=Zh3MKMQKajpecNKPD32XNMVsIfclDAMMaqfdHCuJRY5h4xNi1E0mBSrO+CHwM6vQj
	 ORXuGkmndkYAhhTA69rLsy1HB9vO3KSPlZB9LdWNMrlnVwWJv5JoxXK1YwjBYncMDw
	 39UX1FP7ZXk5aI7OPW1zqwUKLzGYGmHmVIMPs1Wg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42DGLoIh032771
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Mar 2024 11:21:50 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Mar 2024 11:21:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Mar 2024 11:21:50 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42DGLonU048417;
	Wed, 13 Mar 2024 11:21:50 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rkRMT-0004ib-Ty; Wed, 13 Mar 2024 11:21:50 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf: machine: beagle: Centralize some settings for all beagle boards
Date: Wed, 13 Mar 2024 11:21:49 -0500
Message-ID: <20240313162149.18098-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Mar 2024 16:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17524

We have a request to be able to override the beagle kernel set in
PREFERRED_PROVIDER_virtual/kernel, but it is being absolutely set and
not loosely set with ?=.  Take this time to create a central include for
all beagle boards like we have for the k3.inc.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf      | 3 +--
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +--
 meta-ti-bsp/conf/machine/beaglebone.conf      | 3 +--
 meta-ti-bsp/conf/machine/beagleplay.conf      | 2 +-
 meta-ti-bsp/conf/machine/include/beagle.inc   | 3 +++
 5 files changed, 7 insertions(+), 7 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/beagle.inc

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/machine/beagle-x15.conf
index d368fe1a..6fc7957c 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -2,10 +2,9 @@
 #@NAME: BeagleBoard X15
 #@DESCRIPTION: Machine configuration for the BeagleBoard X15
 
+require conf/machine/include/beagle.inc
 require conf/machine/include/am57xx.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-
 KERNEL_DEVICETREE_PREFIX = "am57xx-beagle-x15"
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
index a19a3e29..8ec52bba 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -2,6 +2,7 @@
 #@NAME: BeagleBone AI-64 (A72)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board (A72 core)
 
+require conf/machine/include/beagle.inc
 require conf/machine/include/j721e.inc
 
 UBOOT_MACHINE = "j721e_evm_a72_config"
@@ -12,8 +13,6 @@ UBOOT_MACHINE = "j721e_evm_a72_config"
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 UBOOT_CONFIG_FRAGMENTS = "j721e_beagleboneai64_a72.config"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-
 KERNEL_DEVICETREE = " \
 ti/k3-j721e-beagleboneai64.dtb \
 ti/k3-j721e-common-proc-board.dtb \
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/machine/beaglebone.conf
index 7f78b297..8b8b9d29 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -2,10 +2,9 @@
 #@NAME: BeagleBone machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
+require conf/machine/include/beagle.inc
 require conf/machine/include/ti33x.inc
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
-
 KERNEL_DEVICETREE_PREFIX = "am335x-bone"
 
 KERNEL_DEVICETREE = " \
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/machine/beagleplay.conf
index 9f926b86..75e62afd 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -2,6 +2,7 @@
 #@NAME: BeaglePlay (A53)
 #@DESCRIPTION: Machine configuration for the BeaglePlay board (A53 core)
 
+require conf/machine//include/beagle.inc
 require conf/machine/include/k3.inc
 SOC_FAMILY:append = ":am62xx"
 
@@ -24,7 +25,6 @@ UBOOT_MACHINE = "am62x_evm_a53_defconfig"
 # under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
 UBOOT_CONFIG_FRAGMENTS = "am625_beagleplay_a53.config"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-bb.org"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-bb.org"
 PREFERRED_PROVIDER_u-boot = "u-boot-bb.org"
 
diff --git a/meta-ti-bsp/conf/machine/include/beagle.inc b/meta-ti-bsp/conf/machine/include/beagle.inc
new file mode 100644
index 00000000..27e3298d
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/beagle.inc
@@ -0,0 +1,3 @@
+
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-bb.org"
+
-- 
2.17.1


