Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48567CCD184
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 20:07:09 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.5924.1760472424096302596
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 13:07:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EG3PCtgR;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: jm@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59EK72bh1146111;
	Tue, 14 Oct 2025 15:07:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760472422;
	bh=Wvl4s1X4qUue8Tdv1M3jV7Rn4eGJiFgSRnUbtQfcnpI=;
	h=From:To:CC:Subject:Date;
	b=EG3PCtgR2mLb985r3naxL1+Mv4jHbcvDJ414PPgI3XQVt7rTUSNB6dmujTvzdCPqp
	 7byCRUDfZF8LvZ1yt4QNHcf/k1HRFO1FSyHUH0kdmpEksj+laiQzzRFVCnOI42YlJP
	 wAJ2AU6qdkOVZih7wyZnxF3DO+G5wBi/Ewx2NvmE=
Received: from DFLE207.ent.ti.com (dfle207.ent.ti.com [10.64.6.65])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59EK729I268603
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 14 Oct 2025 15:07:02 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 14 Oct
 2025 15:07:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 14 Oct 2025 15:07:02 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59EK72vX707378;
	Tue, 14 Oct 2025 15:07:02 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] 1/2 conf: machine: Include MCSPI overlay for am62p and am62 LP
Date: Tue, 14 Oct 2025 15:07:01 -0500
Message-ID: <20251014200702.933617-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 14 Oct 2025 20:07:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19121

MCSPI overlay can be used for all am62* SK boards as well as
am62p SK, so include the overlay for am62p and am62 LP SK builds
since it is not included in the default configuration.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-ti-bsp/conf/machine/am62pxx-evm.conf   | 1 +
 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62pxx-evm.conf b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
index a923d3e9..8a3747f8 100644
--- a/meta-ti-bsp/conf/machine/am62pxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62pxx-evm.conf
@@ -18,6 +18,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62x-sk-csi2-ov5640.dtbo \
     ti/k3-am62x-sk-csi2-tevi-ov5640.dtbo \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
+    ti/k3-am62x-sk-mcspi-loopback.dtbo \
 "
 
 FIT_CONF_DEFAULT_DTB = "ti/k3-am62p5-sk.dtb"
diff --git a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
index 78bca1ab..d34801f2 100644
--- a/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-lp-evm.conf
@@ -20,6 +20,7 @@ KERNEL_DEVICETREE = " \
     ti/k3-am62-lp-sk.dtb \
     ti/k3-am625-sk.dtb \
     ti/k3-am62x-sk-hdmi-audio.dtbo \
+    ti/k3-am62x-sk-mcspi-loopback.dtbo \
 "
 
 FIT_CONF_DEFAULT_DTB = "ti/k3-am62-lp-sk.dtb"
-- 
2.34.1


