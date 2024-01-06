Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07237C47077
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 04:05:31 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.42624.1704513925755853626
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 20:05:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wiiESdSR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40645OJB057319
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1704513924;
	bh=xqmXO4bhF7oYgB3GjJkrHqUEAhHRva3NcEHAuc+2CHQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wiiESdSRMQmeBqDLL9bRrT2qdj3tEuHYIh6bZKOXQPllSe4Di9C9Vp/vSC8jtxvEE
	 QpGI012j7UFvFWkAJfvVwYVfoQgQ692YYhIBg3VpqTZScuQ95sf8zFR0+/HLiIf9Hs
	 8UpJZ6wOAVbwGr0YeigoB89IPsySp8LVE7o+C0/4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40645OKA072165
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Jan 2024 22:05:24 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 5
 Jan 2024 22:05:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 5 Jan 2024 22:05:24 -0600
Received: from PSDKL-Workstation0.dhcp.ti.com (psdkl-workstation0.dhcp.ti.com [10.24.68.244])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40645HFp064807;
	Fri, 5 Jan 2024 22:05:22 -0600
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Darren Etheridge <detheridge@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-ti][kirkstone][PATCH v2 3/3] meta-ti-bsp: j722s: add Rogue GPU driver to machine defintion
Date: Sat, 6 Jan 2024 09:35:12 +0530
Message-ID: <20240106040512.2493439-4-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240106040512.2493439-1-a-limaye@ti.com>
References: <20240106040512.2493439-1-a-limaye@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 Jan 2024 04:05:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17390

From: Darren Etheridge <detheridge@ti.com>

j722s is same GPU as am62p,  need to add this into machine definition so
that Rogue driver gets included in the image.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-ti-bsp/conf/machine/include/j722s.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/include/j722s.inc b/meta-ti-bsp/conf/machine/include/j722s.inc
index 59f45c93..e165f51b 100644
--- a/meta-ti-bsp/conf/machine/include/j722s.inc
+++ b/meta-ti-bsp/conf/machine/include/j722s.inc
@@ -4,7 +4,7 @@ SOC_FAMILY:append = ":j722s"
 MACHINE_FEATURES += "screen gpu"
 
 require conf/machine/include/mesa-pvr.inc
-PREFERRED_PROVIDER_virtual/gpudriver ?= ""
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
 
 # Default tiboot3.bin on J722S is for HS-FS
 IMAGE_BOOT_FILES += "tiboot3-j722s-hs-fs-evm.bin"
-- 
2.34.1


