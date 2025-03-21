Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32BA1C36000
	for <webhook@archiver.kernel.org>; Fri, 21 Mar 2025 13:45:00 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.161.1742564691656735293
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Mar 2025 06:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=kwlbqiFW;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52LDipcs303708
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Mar 2025 08:44:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742564691;
	bh=qReN8eYfA7QkN7TvWBauqHlJni/yW+k2U/xxmBOjnxM=;
	h=From:To:CC:Subject:Date;
	b=kwlbqiFW9z/qQVMV+rw9TsUNkxdcqvR9n02jnLFR5xDRcA8cmFuc2xwGQIHjpLdhJ
	 QAkxJ7Oiswu/yMm86R6opnr5atgq/7CeBDyevc+6R1NsCtyL1FMoxsrxTnenMwLHjm
	 i9PbGPcS1g1Rb5BeoYJA2EKi0BmFwEB4H1fy8Thg=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52LDio9A085936
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Mar 2025 08:44:51 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 21
 Mar 2025 08:44:50 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 21 Mar 2025 08:44:50 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52LDinq1107358;
	Fri, 21 Mar 2025 08:44:49 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [scarthgap][PATCH] conf: machine: am62: Add FIT_CONF_DEFAULT_DTB
Date: Fri, 21 Mar 2025 19:14:42 +0530
Message-ID: <20250321134443.337567-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Mar 2025 13:45:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18419

FIT_CONF_DEFAULT_DTB config specifies the default dtb file for the FIT
image when multiple ones are provided[1].

Since the variable is not set in current machine configs, the default is
set to the first dtb read during FIT image creation which doesn't give
us direct control over the default configuration.

Therefore this patch adds default dtbs for am62 evms.

[1]:
https://docs.yoctoproject.org/ref-manual/variables.html#term-FIT_CONF_DEFAULT_DTB

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62xx-evm.conf    | 2 ++
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 2 ++
 meta-ti-bsp/conf/machine/am62xxsip-evm.conf | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm.conf b/meta-ti-bsp/conf/machine/am62axx-evm.conf
index a5d41856..faeb34a9 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm.conf
@@ -20,4 +20,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62a7-sk.dtb"
+
 UBOOT_MACHINE = "am62ax_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index bb3c34a3..09f0d1fb 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -21,6 +21,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"
+
 UBOOT_MACHINE = "am62px_evm_a53_defconfig"
 
 # UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments which has to be build
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index bf2b4a6b..c826439b 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -31,4 +31,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
+FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
+
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 5a332b58..32d9eb31 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -22,4 +22,6 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
 "
 
+FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
+
 UBOOT_MACHINE = "am62x_lpsk_a53_defconfig"
diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
index 8104329e..2ca2cbdb 100644
--- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
@@ -13,6 +13,8 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-sk.dtb \
 "
 
+FIT_CONF_DEFAULT_DTB = "ti/k3-am625-sk.dtb"
+
 UBOOT_MACHINE = "am62xsip_evm_a53_defconfig"
 
 UBOOT_MACHINE:bsp-ti-6_1 = "am62x_evm_a53_defconfig"

