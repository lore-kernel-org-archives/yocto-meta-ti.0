Return-Path: <a-bhatia1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2F9FC4321E
	for <webhook@archiver.kernel.org>; Mon,  5 Dec 2022 11:45:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.13319.1670240722230013587
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Dec 2022 03:45:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TGmHLP8z;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: a-bhatia1@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B5BjJtc063469;
	Mon, 5 Dec 2022 05:45:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1670240719;
	bh=9Zp+6YncLd4SsidkEi8KNJigiffo9M1G6MufnguWSgE=;
	h=From:To:CC:Subject:Date;
	b=TGmHLP8zCcC6La2e/yM0eKCFZCiPNe1oEhubY8cWBxyDxvSs5Hq4yf58Ao3CgVPja
	 9Q4eMhLs29Emq+lF7SEsKnXdb6qrQ+cq/mKi3Bvm7R8rpRlCLpe7/3OkPAquQ1bvsj
	 Uc/ZTAOpRaL3zqo8/hTuiNE+Y6dvHKaw4TDixqJM=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B5BjJg9083547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 5 Dec 2022 05:45:19 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 5
 Dec 2022 05:45:19 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 5 Dec 2022 05:45:19 -0600
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B5BjI5h042975;
	Mon, 5 Dec 2022 05:45:19 -0600
From: Aradhya Bhatia <a-bhatia1@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI List <meta-ti@lists.yoctoproject.org>,
        Vignesh Raghavendra
	<vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Aradhya Bhatia
	<a-bhatia1@ti.com>
Subject: [dunfell][PATCH] conf: machine: am62xx: Add missing overlays for AM625 SK
Date: Mon, 5 Dec 2022 17:15:18 +0530
Message-ID: <20221205114518.17263-1-a-bhatia1@ti.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Dec 2022 11:45:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15406

Add the overlay files, over AM625 SK, for the following:

1. Technexion OV5640 Camera
2. Enhanced Capture (ECAP)
3. HDMI Audio Output
4. MCAN Transceiver
5. Microtips OLDI Panel

Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
---
 conf/machine/am62xx-evm.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/conf/machine/am62xx-evm.conf b/conf/machine/am62xx-evm.conf
index cbab26dd15c8..3d9e3b903487 100644
--- a/conf/machine/am62xx-evm.conf
+++ b/conf/machine/am62xx-evm.conf
@@ -11,6 +11,11 @@ KERNEL_DEVICETREE = " \
     ti/k3-am625-skeleton.dtb \
     ti/k3-am625-sk-lpmdemo.dtb \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
+    ti/k3-am625-sk-csi2-tevi-ov5640.dtbo \
+    ti/k3-am625-sk-ecap-capture.dtbo \
+    ti/k3-am625-sk-hdmi-audio.dtbo \
+    ti/k3-am625-sk-mcan.dtbo \
+    ti/k3-am625-sk-oldi-panel.dtbo \
 "
 
 UBOOT_MACHINE = "am62x_evm_a53_defconfig"
-- 
2.38.1


