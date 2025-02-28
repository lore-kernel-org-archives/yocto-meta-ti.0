Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4005FC282C6
	for <webhook@archiver.kernel.org>; Fri, 28 Feb 2025 18:12:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.1076.1740766335452118197
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 28 Feb 2025 10:12:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=en6pxKCY;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: bb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 51SICDdk2119163
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 28 Feb 2025 12:12:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1740766333;
	bh=vtgDLwv0NMHnEQbHt0TF1Ovl7ahe2F5ieOVMYuKAkN4=;
	h=From:Date:Subject:To:CC;
	b=en6pxKCY7YiZoLEBDBBG/1vAQjWyQHy/QLNrKoBzhu1p+oAiQOn59PnbDW570hQiN
	 aICMx3P/qdElpoCiMYv7HA057AtwH2RIPcwpIB+iYgeEoyNFeM1KoKYYwyk8qahCcO
	 t54KAiN74H9ddy65QjSJtyCHv4OyQeLvFleNTb/E=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SICDYI024405;
	Fri, 28 Feb 2025 12:12:13 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Feb 2025 12:12:13 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Feb 2025 12:12:13 -0600
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 51SICDgf025472;
	Fri, 28 Feb 2025 12:12:13 -0600
From: Bryan Brattlof <bb@ti.com>
Date: Fri, 28 Feb 2025 12:12:10 -0600
Subject: [PATCH master/scarthgap] conf: machine: k3: disable all fit
 signing for uboot
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250228-uboot-cleanup-v1-1-3f7d3f2a4ee2@ti.com>
X-B4-Tracking: v=1; b=H4sIAHn8wWcC/x3MwQrCMAyA4VcZOVvsMjrUVxEPWYxbQduSdCKMv
 btlx+/w/xuYaBSDW7eByjdazKmhP3XAC6VZXHw2A3oMHvHi1inn6vgtlNbihsATjjz2Vx+gNUX
 lFX/H7w4fsip6Niaty0wFHvv+BzerTzxxAAAA
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: Meta-TI <meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1071; i=bb@ti.com;
 h=from:subject:message-id; bh=3r6uCvuWHVe/kjerOdFFXyh7Xgn26/NmmZjlsVDfmnU=;
 b=owNCWmg5MUFZJlNZofaVvwAAZf///r//7jt7+8ruq99R267n/3v2/VU3fe7/+ftLyvn0v38wA
 RmZo6A0AxABoNNDQABpkANGmgAAABphDQ2kGQAGgGTINDEPKDEyepoPEmjEAaAAaAAaB6QyDRoD
 JoZAAaDI0aAYgyDAjJo0MCMgZGQDJmptQMhoZNAzVG1PUeoDQDRoaD1HqANBo0MhoMg0AAZAAGg
 A0NNDQaA0NGjQHqMmmjQaAA2kDDRisqMS+DdXI2VMmYUScPIDgzm9OwSggcqvBi2B1BZqIRbk7L
 ICU+OaSQaJYTLHUKmBOTOl+FMtuPkC/C7HRGFu6U4NswsbSyaeLLprsFk6HtSVatsqoYd+i4HFU
 2fn47bkmkmzR68zGQK4vf9K1rsC1iomnVHV4AL3VaYF9UlA1gFZBL9G1bfadDOMcPizRbE+ElAM
 ND3tL53P8Q2X+vktc17JQpsTG0d4e9yACt65PCj3bVsvWjXQK2YUtw9IQKrZPoIlclWN0JaaYde
 iEu9Dx1dDulwh/CWF3mGwBvzNjM/WVI7GaIQs8tYYEj2ZZhghAbvBY0bIfTtBzWibfYZkVSM1th
 RQxf09EXO5dg/abABFr/k8C3TvqlgRnd0Qhyif4EY/+rBoxSx+uMjaE7GQxEaq2o0vEmpQIKFXn
 R3/8ezhyLuSKcKEhQ+0rfg=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 28 Feb 2025 18:12:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18341

All K3 SoCs utilize the binman packaging tools in U-Boot to package
and sign the different boot firmware components needed to boot the
various security variants of K3 platform. Disable UBOOT_SIGN_ENABLE
to simplify the build

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/machine/include/k3.inc
index dd3cbecab3d51..b98b45802bc76 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -25,10 +25,6 @@ SPL_BINARY = "tispl.bin"
 SPL_BINARYNAME = "tispl.bin"
 UBOOT_SUFFIX = "img"
 
-UBOOT_SIGN_ENABLE = "1"
-UBOOT_MKIMAGE_DTCOPTS = "-I dts -O dtb"
-UBOOT_SIGN_KEYNAME ?= "custMpk"
-UBOOT_SIGN_KEYDIR ?= "${TI_SECURE_DEV_PKG}/keys"
 FIT_HASH_ALG ?= "sha512"
 FIT_SIGN_ALG ?= "rsa4096"
 

---
base-commit: c3d050c2c9db34e250b4b61e90a67bacbfa45066
change-id: 20250228-uboot-cleanup-35cb26c61905

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


