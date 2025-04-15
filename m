Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1140C369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:37:12 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.15920.1744709822586025114
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 15 Apr 2025 02:37:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CcNoHZR6;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53F9b1sq2441563
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 04:37:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1744709821;
	bh=Q4/9eDD/ZNLgx4Lr9Q8pu+bEosZOjIYaep8EBbre9MQ=;
	h=From:To:CC:Subject:Date;
	b=CcNoHZR6C8C+N2G01kK4WkmlRLnJLKNYGPhj6y6oDhqaEs/xRUYoZ4jnDthwwXQA4
	 Za4zUSRk8DH+Ea4g16ETpLgFqCBNFKVRoguLrDNTz0SzQnReODJNjPv9dWYaISw98x
	 6psuyEV/mDg1pDAez5P1Ohh5zQF7YzrLULUGvuWk=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53F9b115001085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 04:37:01 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Apr 2025 04:37:01 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Apr 2025 04:37:01 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53F9b0Bf066167;
	Tue, 15 Apr 2025 04:37:01 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <vigneshr@ti.com>
Subject: [master/scarthgap][PATCH v1 1/3] am62: apply u-boot config fragment on ti-falcon
Date: Tue, 15 Apr 2025 15:06:42 +0530
Message-ID: <20250415093645.435281-1-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Apr 2025 09:37:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18469

The am62x_r5_falcon.config fragment in u-boot enables falcon boot
support for R5 SPL, this patch enables the config fragment for am62a,
62p, 62x and 62lp evms based on ti-falcon distro override.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
 meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf   | 2 ++
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf    | 2 ++
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
index 2af3317e..ab14feef 100644
--- a/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62axx-evm-k3r5.conf
@@ -9,3 +9,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62ax_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
index 36915381..849d6625 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm-k3r5.conf
@@ -10,3 +10,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62px_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 548369ca..a624a35d 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -10,3 +10,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_evm_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index 52b69a72..851935db 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -10,3 +10,5 @@ SYSFW_CONFIG = "evm"
 SYSFW_SUFFIX = "hs-fs"
 
 UBOOT_MACHINE = "am62x_lpsk_r5_defconfig"
+
+UBOOT_CONFIG_FRAGMENTS:ti-falcon = "am62x_r5_falcon.config"

