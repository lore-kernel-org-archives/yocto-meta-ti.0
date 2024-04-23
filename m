Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572B0C4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 20:12:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.59.1713903150537316180
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Apr 2024 13:12:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=unoFsCaA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: b-brnich@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43NKCTSx084398
	for <meta-ti@lists.yoctoproject.org>; Tue, 23 Apr 2024 15:12:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713903149;
	bh=YN8bBbI/kWV6lMCIGqpchKW8x/3KyJh67FXrZY0T3vM=;
	h=From:To:CC:Subject:Date;
	b=unoFsCaAya8divHJnJFr1GT9+VahzQeEnQt+7bBiiUBzwKsCC9w51ihHWbeS0d12x
	 84YMl0/5D3lSH6jRAoaS8tjOS2LKHFaI5Hjj/c75vLTC79JIpLSAE9absffXZ9fe0J
	 g41T2Xo1u+NZjg0fwxVAqv7rbGS/K3Z3V5eInWrA=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43NKCTfx070626
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 23 Apr 2024 15:12:29 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 23
 Apr 2024 15:12:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 23 Apr 2024 15:12:29 -0500
Received: from udba0500997.dhcp.ti.com (udba0500997.dhcp.ti.com [128.247.81.249])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43NKCTSK027197;
	Tue, 23 Apr 2024 15:12:29 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>
Subject: [master/scarthgap] meta-ti-bsp: cnm-wave-fw: Change target firmware name
Date: Tue, 23 Apr 2024 15:12:17 -0500
Message-ID: <20240423201217.3561252-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Apr 2024 20:12:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17595

Upstream driver expects Wave5 firmware to be named "wave521c_k3_codec_fw.bin".
Driver probe fails because this compatible isn't being found.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
index 1a2e911c..b28bea92 100644
--- a/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cnm-wave-fw/cnm-wave-fw_git.bb
@@ -12,7 +12,7 @@ PR = "${INC_PR}.1"
 
 COMPATIBLE_MACHINE = "j721s2|j784s4|j722s|am62axx|am62pxx"
 
-TARGET_WAVE521C = "wave521c_codec_fw.bin"
+TARGET_WAVE521C = "wave521c_k3_codec_fw.bin"
 
 SOURCE_WAVE521C = "wave521c_k3_codec_fw.bin"
 
-- 
2.34.1


