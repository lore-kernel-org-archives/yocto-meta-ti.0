Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2B68C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 19:56:52 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.25786.1714507006836860979
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Apr 2024 12:56:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jSn24wyW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43UJujLg078518;
	Tue, 30 Apr 2024 14:56:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714507005;
	bh=2XtWnK2fvaR6+6n+oTBqX7EdzC7fe0qPFFa8jFwa03M=;
	h=From:To:Subject:Date;
	b=jSn24wyWv4fWQoRLH2692ONYmZ9v0NBAKyt2/vNx114ss/1P9A2u0ryNYTml80Ye+
	 mcisp06cIuTNMQlrImG9xSsbGCqUo++QtGinJI3BuijheNORacQv6KeZCkxOZmjlGk
	 ygYzJblaAfKg+GgipXYRsYvLIFg7pRDsUFYT5myA=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43UJujQu057103
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 Apr 2024 14:56:45 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 Apr 2024 14:56:45 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 Apr 2024 14:56:45 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43UJuj4P044053;
	Tue, 30 Apr 2024 14:56:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s1tan-0000b1-03; Tue, 30 Apr 2024 14:56:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] conf: machine: am69-sk: Create a new am69.inc file
Date: Tue, 30 Apr 2024 14:56:44 -0500
Message-ID: <20240430195644.2243-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 30 Apr 2024 19:56:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17613

Reusing the j784s4.inc file presents problems as the am69-sk platform
does not support GP.  So copy the j784s4.inc to am699.inc and update
accordingly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am69-sk.conf     |  2 +-
 meta-ti-bsp/conf/machine/include/am69.inc | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/am69.inc

diff --git a/meta-ti-bsp/conf/machine/am69-sk.conf b/meta-ti-bsp/conf/machine/am69-sk.conf
index 233a4618..6341a6fa 100644
--- a/meta-ti-bsp/conf/machine/am69-sk.conf
+++ b/meta-ti-bsp/conf/machine/am69-sk.conf
@@ -2,7 +2,7 @@
 #@NAME: AM69 SK
 #@DESCRIPTION: Machine configuration for the TI AM69 SK
 
-require conf/machine/include/j784s4.inc
+require conf/machine/include/am69.inc
 
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
diff --git a/meta-ti-bsp/conf/machine/include/am69.inc b/meta-ti-bsp/conf/machine/include/am69.inc
new file mode 100644
index 00000000..81be1397
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/am69.inc
@@ -0,0 +1,19 @@
+require conf/machine/include/k3.inc
+SOC_FAMILY:append = ":j784s4"
+
+MACHINE_FEATURES += "screen gpu"
+
+require conf/machine/include/mesa-pvr.inc
+PREFERRED_PROVIDER_virtual/gpudriver ?= "ti-img-rogue-driver"
+
+# Default tiboot3.bin on AM69 is for SR1.0 HS-FS
+IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-fs-evm.bin"
+
+# Since default tiboot3.bin on AM69 is for HS-FS, add a version for SR1.0 HS-SE
+IMAGE_BOOT_FILES += "tiboot3-j784s4-hs-evm.bin"
+
+TFA_BOARD = "j784s4"
+
+OPTEEMACHINE = "k3-j784s4"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS += "cadence-mhdp-fw cnm-wave-fw ti-eth-fw"
-- 
2.17.1


