Return-Path: <bb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DB9CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:55:35 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.4623.1755636926998483025
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 13:55:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=eYRmeUSZ;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: bb@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JKtP2U2975505;
	Tue, 19 Aug 2025 15:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755636925;
	bh=JIO48KzfMyV2hFIJmknOHcaS08IDnxDKBc2jbztnrTw=;
	h=From:Date:Subject:To:CC;
	b=eYRmeUSZDXzqCfUoz7rW0bpG5S23d58NBL1fZg1h489g/o5QvCDsmH6v5y32nJ7sd
	 iisW5n7+lD1SCOBqSKSQWRiXwKpyeZJGg6UJczSlGMzbuEzXUfuoBBtY0ZIMCg5n9f
	 VEgSJJ2UOKVyEvZAOP6L9DhjfWVInBRQcmthRsvQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JKtPpI1538443
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 15:55:25 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 15:55:25 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 15:55:25 -0500
Received: from localhost (bb.dhcp.ti.com [128.247.81.12])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JKtPdl3603760;
	Tue, 19 Aug 2025 15:55:25 -0500
From: Bryan Brattlof <bb@ti.com>
Date: Tue, 19 Aug 2025 15:55:14 -0500
Subject: [PATCH master/scarthgap] conf: machine: add optee-os into
 am62lxx-evm builds
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250819-62loptee-v1-1-6b87b2dcda78@ti.com>
X-B4-Tracking: v=1; b=H4sIALHkpGgC/x3MQQqEMAxA0atI1hZjB8XOVcRFqBkNOFqSIoJ49
 ymzfPD5NxirsMG7ukH5FJNjL2jrCuJK+8JO5mLw6Dsc2uB6vx0pM7v5FXoijEgYoORJ+SPXfzX
 ClyyzNhZJ87pQgul5fgxS111sAAAA
X-Change-ID: 20250819-62loptee-d396aa0c0a09
To: <reatmon@ti.com>, <denys@konsulko.com>
CC: <afd@ti.com>, <meta-ti@lists.yoctoproject.org>, Bryan Brattlof <bb@ti.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2108; i=bb@ti.com;
 h=from:subject:message-id; bh=tEYXEklyY7NoIB20ZdJPvXSLtJ4J8F4rwzR+YPtPVzI=;
 b=owNCWmg5MUFZJlNZPNIFYQAAYP///r/vj/P2/ry2/t331f9/skz3TrV8bfu/7/nr/Zdc3v+wA
 RssDFD1AAAABtQDQAaaBoADQNAAAaBtQ0AaANAADTQyMgDTQaNPUNPT1TD1RAaaDTIADQPUGEaG
 mjaho9T1AyAwgDQG1Gg00D1GQ0ZDRpppoAAaAABtQGgZGg5DxTRkGQ0BoAyDTJiDIyA0BpggDQA
 00AAAAwgD0jIGjRoNNAaGgD0jIAA2XhCuCvFgL4OfS1nFgyjv1DxwoNxvMxdbWY9ziNJyviaOFE
 8BZ8MyD6T4BHoPisYoEAu/BnPoPnDqu6LHbX4EtPea9sq/Vw3peAoRQLjVpPeFAYdbF001XN2s7
 psPElhMtGyUdlnm1hC1xd+TTDULI9AiL684EdxAhqbCOglypDOsGYqaoN4T2b2Oe9kBrs0bEW1T
 b/1EspQmAb+gK4ARdVN5SEay7jXQzkRTDhEE0/GB9T5k2sGtVJcjYfiX9UelUcV1CXaPtXkZorl
 ww1L6fyrx/Uu0SpLRqc3gdaiSRfJkAijfSR6tPaDTizELRdGSgIWAqBgGF2qvS1cy6+VD8YqRAh
 VnAB3YwuKfYKm0WIQmc4oLPpFDojgLkBI4q4RaYAffQ1qY0bOmGCZaUAC9rYnhQ+7oaDmJR5Rjz
 BOh/xdyRThQkDzSBWE=
X-Developer-Key: i=bb@ti.com; a=openpgp;
 fpr=D3D177E40A38DF4D1853FEEF41B90D5D71D56CE0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 19 Aug 2025 20:55:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18941

Newer silicon revision of the AM62L family are capable of reliably
booting with OP-TEE integrated in the bootflow with all bootmedia.
However to support as many DDR densities as possible we cannot use the
default 0x9e78000 location as with other K3 devices.

So add OP-TEE back into the default build but modify the BL32 base
address for TF-A so it will jump to the correct location.

Signed-off-by: Bryan Brattlof <bb@ti.com>
---
 meta-ti-bsp/conf/machine/am62lxx-evm.conf                            | 2 ++
 meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc | 1 -
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
index 607092a7cfa6888edfe582d03223d6b2d4a2026a..5c0535c244b777bd48a5931ab14cb5259b57ee15 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -5,6 +5,8 @@
 require conf/machine/include/am62lxx.inc
 require conf/machine/include/ti-extras.inc
 
+TFA_K3_BL32_BASE = "0x80200000"
+
 IMAGE_FSTYPES += "ubifs ubi"
 
 MKUBIFS_ARGS ?= "-F -m 4096 -e 258048 -c 8500"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index e965e9595abec44588aed1479b0f2574247c07f4..88ac6156fdd3db1dc70bb5133dc39ab32fd6db8c 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -22,7 +22,6 @@ TFA_SPD = "opteed"
 
 # For am62lxx, install bl1 & bl31 using TFA_INSTALL_TARGET
 TFA_INSTALL_TARGET:am62lxx = "bl31 bl1"
-TFA_SPD:am62lxx = ""
 
 EXTRA_OEMAKE += "${@ 'K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
 EXTRA_OEMAKE += "${@ 'BL32_BASE=' + d.getVar('TFA_K3_BL32_BASE') if d.getVar('TFA_K3_BL32_BASE') else ''}"

---
base-commit: bf71f80f3e8d7dc77f9e32389f922e762f87eec2
change-id: 20250819-62loptee-d396aa0c0a09

Best regards,
-- 
Bryan Brattlof <bb@ti.com>


