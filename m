Return-Path: <m-chawdhry@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519F6C77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 06:24:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.52393.1683786244720446366
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 May 2023 23:24:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jeebwg1g;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: m-chawdhry@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34B6O405024744
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 01:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683786244;
	bh=KL3QpmjAfMCXOQb1oRBd4tgOXesxm2viVpOWRa919HY=;
	h=From:To:CC:Subject:Date;
	b=jeebwg1gsYGmKp4xWqrtijHFCPDGS6mc3iNPxnIFrxuMEpR4qiIcr5RRkw8yLfgMB
	 TFBPOUER45WilS6GYR/iIVGaw9JNOzJpAfxJBcpw8hs+PW8sLhYU+ctzmDnOpYFgGV
	 N1U7JLlNrzOYW5hdpRV+lU/+4j1Gutm7oI+bdtbo=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34B6O4OV014420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 01:24:04 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 01:24:03 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 01:24:03 -0500
Received: from uda0497581.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34B6O0bv107992;
	Thu, 11 May 2023 01:24:01 -0500
From: Manorit Chawdhry <m-chawdhry@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Manorit Chawdhry <m-chawdhry@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        Denys
 Dmytriyenko <denys@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Praneeth
 Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
        Andrew Davis
	<afd@ti.com>, Kamlesh Gurudasani <kamlesh@ti.com>
Subject: [meta-ti][master/kirkstone][RFC PATCH] conf: machine: include: k3 enable fit signing for uboot
Date: Thu, 11 May 2023 11:54:00 +0530
Message-ID: <20230509-b4-k3-fit-signing-v1-1-2e335869bec8@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1683786221; l=1226; i=m-chawdhry@ti.com; s=20230417; h=from:subject:message-id; bh=KENnhdeNXLHut1nBc3BnOf4Pfr9yyv7fHwrl3JU2diQ=; b=U5fm1VKDxD7+MEkuhKnB/hPtZ5myg/Leg/xm+jtfzOLSYpVa3APXKmgX8KDYI0POX7xTpuz6o Y9j2MHd7M1/AsmrvZOy4IVLyPsbwaISVjgix2dWLNLjnT+TM9lhv7SQ
X-Developer-Key: i=m-chawdhry@ti.com; a=ed25519; pk=J/YFdaNRtg/0laEMIcsNnCdIcyFQ3oolBqBrCkiyjHo=
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 06:24:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16507

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
---
To: Ryan Eatmon <reatmon@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Cc: Vignesh Raghavendra <vigneshr@ti.com>
Cc: Praneeth Bajjuri <praneeth@ti.com>
Cc: Udit Kumar <u-kumar1@ti.com>
Cc: Andrew Davis <afd@ti.com>
Cc: Kamlesh Gurudasani <kamlesh@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index fff1550564b3..ab7e45a8016f 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -31,6 +31,12 @@ SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
+UBOOT_SIGN_ENABLE = "1"
+UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
+UBOOT_SIGN_KEYNAME = "uboot_signing_dev_key"
+UBOOT_SIGN_KEYDIR = "${DEPLOY_DIR_IMAGE}/u-boot-keys"
+FIT_GENERATE_KEYS = "1"
+
 EXTRA_IMAGEDEPENDS += "virtual/bootloader"
 
 TFA_PLATFORM = "k3"

---
base-commit: a9b35f1e7c3a7746fb4f6807166bcb27ba9ca5eb
change-id: 20230509-b4-k3-fit-signing-316ca2af859c

Best regards,
-- 
Manorit Chawdhry <m-chawdhry@ti.com>


