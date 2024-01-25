Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18259C48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 10:28:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.14389.1706178489995630503
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 02:28:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T7C1CA3j;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: p-bhagat@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40PAS8bp118382
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 Jan 2024 04:28:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706178488;
	bh=oEBAdN/l+ZaOoUSeBv08AyiF5F7tvU1sB1B7Hce55ME=;
	h=From:To:CC:Subject:Date;
	b=T7C1CA3jlRgWHRG6yuY6Y1WYvYpNTKnIg5hf7Psn+sN4rv/gEvHFQZJC1zORCxa9j
	 m8dL8My1pz70whTAlvhl8ol/tkO2lIXlt37soTFhFCKLic5xyIP9Synr6/znZDl3nV
	 fxAXXTjO6Ilc2k1fY9b7GcRNwR/Fkj0BJDRid/Bk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40PAS8tJ035022
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 25 Jan 2024 04:28:08 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 04:28:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 04:28:08 -0600
Received: from localhost (paresh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.38])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40PAS7WU083931;
	Thu, 25 Jan 2024 04:28:08 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <praneeth@ti.com>, <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>, <khasim@ti.com>, <g-gupta@ti.com>
Subject: [kirkstone][PATCH] ti-extras: Add support for extra kernel/u-boot features for am62xx-lp
Date: Thu, 25 Jan 2024 15:57:50 +0530
Message-ID: <20240125102750.1287456-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 25 Jan 2024 10:28:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17416

Add support for ti-extras for am62xx-lp to control the kernel and u-boot
repos, branches, and srcrevs via the TI_EXTRAS variable in the local.conf
file.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
index aa9422cd..52b69a72 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm-k3r5.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62xx LP GP EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
+require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 229b74bc..51e99728 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62XX LP EVM
 
 require conf/machine/include/am62xx.inc
+require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62-lp \
-- 
2.34.1


