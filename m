Return-Path: <vaishnav.a@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 841DFC41513
	for <webhook@archiver.kernel.org>; Thu, 27 Jun 2024 08:34:51 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.3403.1719477282556201820
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Jun 2024 01:34:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RdmMffTk;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: vaishnav.a@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45R8YdCt034424;
	Thu, 27 Jun 2024 03:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1719477279;
	bh=smdMosk7zdGJwHfpoRgJsoBIpqKE6Pyb36anlGgSGO8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=RdmMffTk2+yAbZbuW7vnnN0QMquB0gBwLagDWUqqnr/gs4CEwxc8RaHUdrKyQa4iF
	 P+KJAoCkqtf7yV48zTT0MuFpk6p9lXtoPdkQPbf68WHCG3/36NBlvFIZUjyBtJfTlp
	 0mmMEJMnPWbG4C+u59wjIklF6UKWUtuVCsw/PYu4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45R8YdF0090203
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jun 2024 03:34:39 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Jun 2024 03:34:39 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Jun 2024 03:34:38 -0500
Received: from uda0490681.. ([10.24.69.142])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45R8YWsf034736;
	Thu, 27 Jun 2024 03:34:36 -0500
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <reatmon@ti.com>, <praneeth@ti.com>, <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
CC: <u-kumar1@ti.com>, <a-limaye@ti.com>, <m-chawdhry@ti.com>,
        <j-luthra@ti.com>, <r-ravikumar@ti.com>, <vaishnav.a@ti.com>
Subject: [meta-ti][scarthgap][PATCH 1/3] conf: machine: j784s4-evm: Pick overlays for CSI2 and FPD-Link
Date: Thu, 27 Jun 2024 14:04:29 +0530
Message-ID: <20240627083431.1096889-2-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240627083431.1096889-1-vaishnav.a@ti.com>
References: <20240627083431.1096889-1-vaishnav.a@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Jun 2024 08:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17810

J784S4 and J721S2 EVM has similar connectivity for MIPI CSI2
connector and the same overlays can be reused, thus pick the
J721S2 CSI2 OV5640 and J721S2 EVM fusion overlays for J784S4.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---
 meta-ti-bsp/conf/machine/j784s4-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index e451bf47..770701f7 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -11,6 +11,8 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j784s4 \
     ti/k3-fpdlink \
     ti/k3-j7200-evm-mcspi-loopback \
+    ti/k3-j721s2-evm-csi2-ov5640 \
+    ti/k3-j721s2-evm-fusion \
     ti/k3-am69-sk \
     ti/k3-v3link \
 "
-- 
2.34.1


