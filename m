Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8363FC369C2
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 15:26:40 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.9210.1745594797727229709
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Apr 2025 08:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=R9GKRawp;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: anshuld@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQX6x2974339
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 10:26:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745594793;
	bh=Q4/9eDD/ZNLgx4Lr9Q8pu+bEosZOjIYaep8EBbre9MQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=R9GKRawpafo+IxB41B9KC6d15wl1xt8AXEHqTuZnuk9WoGN2GVpvGQuR6Tvxwehpt
	 Hx02Q/Lks3clpzE7d7QRFbMTNbnRlPCU59xhb9HQRf1+eeQLr6uQuHLdrcu3rrmF29
	 vie/bgCqRpySsjQQUxb9q2+OVTyAL+fWkCyerKDw=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PFQXFN017955
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 10:26:33 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 10:26:33 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 10:26:33 -0500
Received: from localhost (dhcp-172-24-227-250.dhcp.ti.com [172.24.227.250])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PFQW8p105707;
	Fri, 25 Apr 2025 10:26:33 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <denis@denix.org>, <reatmon@ti.com>,
        <vigneshr@ti.com>
Subject: [PATCH v3 1/4] am62: apply u-boot config fragment on ti-falcon
Date: Fri, 25 Apr 2025 20:56:07 +0530
Message-ID: <20250425152613.2470204-2-anshuld@ti.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425152613.2470204-1-anshuld@ti.com>
References: <20250425152613.2470204-1-anshuld@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Apr 2025 15:26:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18508

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

