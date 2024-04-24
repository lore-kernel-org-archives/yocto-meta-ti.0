Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7ECFC10F16
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:35:53 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11700.1713947751936868115
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Apr 2024 01:35:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rELo4zC1;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43O8ZpMw095554
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 03:35:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713947751;
	bh=fqt//XygIVs+Q/LEPkg9YaRtWtgG1gsAI4pBULCWYgM=;
	h=From:To:CC:Subject:Date;
	b=rELo4zC1ulYOqiwhrtaQZEEv/y898el4JoyyOvMzTfTcJnYXz54w9ep6ejBbB2vRc
	 ePsWqiSBw7CbTeNdZ39Mj9pgcWX6oSiUNWpKiHkRe8bYbHzOLyXO/5JueolCSID9II
	 SRmf65ZCc4Kb7UFj8mvDW7TW3aCjsxwm4F5uVB2A=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43O8ZpaY024654
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 03:35:51 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 24
 Apr 2024 03:35:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 24 Apr 2024 03:35:50 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [172.24.227.91])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43O8Zmbd068036;
	Wed, 24 Apr 2024 03:35:48 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <b-padhi@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: add AM69-SK machine configuration
Date: Wed, 24 Apr 2024 14:05:46 +0530
Message-ID: <20240424083546.2190336-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Apr 2024 08:35:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17596

From: Beleswar Padhi <b-padhi@ti.com>

As of commits [1] and [2] in ti-u-boot-2024.04 and upstream respectively
there is a separate defconfig to build u-boot for j784s4-evm and am69-sk

Hence, introduce new yocto machine configs for am69-sk. Also remove am69
devicetree builds from the j784s4-evm conf

[1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=ti-u-boot-2024.04&id=8a46af7a39e6218e4de5c6195697af36201c778c
[2]: https://source.denx.de/u-boot/u-boot/-/commit/740759d558e632e1540d620baadbcc46fdf24db2

Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf | 11 +++++++++++
 meta-ti-bsp/conf/machine/am69-sk.conf      | 20 ++++++++++++++++++++
 meta-ti-bsp/conf/machine/j784s4-evm.conf   |  1 -
 3 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
 create mode 100644 meta-ti-bsp/conf/machine/am69-sk.conf

diff --git a/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
new file mode 100644
index 00000000..9d2b4cd6
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am69-sk-k3r5.conf
@@ -0,0 +1,11 @@
+#@TYPE: Machine
+#@NAME: AM69 SK (R5F)
+#@DESCRIPTION: Machine configuration for the TI AM69 SK (R5F core)
+
+require conf/machine/include/k3r5.inc
+
+SYSFW_SOC = "j784s4"
+SYSFW_CONFIG = "evm"
+SYSFW_SUFFIX = "hs-fs"
+
+UBOOT_MACHINE = "am69_sk_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
new file mode 100644
index 00000000..233a4618
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -0,0 +1,20 @@
+#@TYPE: Machine
+#@NAME: AM69 SK
+#@DESCRIPTION: Machine configuration for the TI AM69 SK
+
+require conf/machine/include/j784s4.inc
+
+TFA_K3_USART = "0x8"
+OPTEE_K3_USART = "0x8"
+
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-am69-sk \
+    ti/k3-fpdlink \
+    ti/k3-v3link \
+"
+
+KERNEL_DEVICETREE = " \
+    ti/k3-am69-sk.dtb \
+"
+
+UBOOT_MACHINE = "am69_sk_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index e451bf47..6573e5c5 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -11,7 +11,6 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j784s4 \
     ti/k3-fpdlink \
     ti/k3-j7200-evm-mcspi-loopback \
-    ti/k3-am69-sk \
     ti/k3-v3link \
 "
 
-- 
2.34.1


