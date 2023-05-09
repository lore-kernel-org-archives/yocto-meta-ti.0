Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1A5CC77B75
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 17:06:13 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.38816.1683651969130170827
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 May 2023 10:06:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=e8wn4rby;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 349H66Bx044648;
	Tue, 9 May 2023 12:06:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683651966;
	bh=pYW9n8Ldd4fXML+KoCMK5u+51UMTbjE2itcM/1p+qFg=;
	h=From:To:Subject:Date;
	b=e8wn4rbygdjP0rQK3GnTOGhHbbC9crMb1ttWdoWWzINfY4d42d+zOuEIiAdUtMhxO
	 e7dm3czLsFU8ENb1a1QMnsNViqEQN8px+vX5tnlSmbWkmfjGKknUfI8KtOs5173zn0
	 fRMqxeMnYCH4qT02uhcdUDqcfwTZM/Z1clCUMIhY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 349H66Kp119491
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 May 2023 12:06:06 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 9
 May 2023 12:06:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 9 May 2023 12:06:06 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 349H66v0117148;
	Tue, 9 May 2023 12:06:06 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pwQms-0001Tf-5a; Tue, 09 May 2023 12:06:06 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] conf: Sync KERNEL_DEVICETREE(_PREFIX) with upstream
Date: Tue, 9 May 2023 12:06:06 -0500
Message-ID: <20230509170606.5639-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 May 2023 17:06:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16503

Some of the settings for KERNEL_DEVICETREE_PREFIX were missed in the
first pass.  Additionally, some new dts files that were not present in
upstream are now there and can be updated in KERNEL_DEVICETREE.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j721s2-hs-evm.conf | 6 +++++-
 meta-ti-bsp/conf/machine/j784s4-evm.conf    | 4 +++-
 meta-ti-bsp/conf/machine/j784s4-hs-evm.conf | 5 +++++
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
index 337818a4..2ee1d949 100644
--- a/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-hs-evm.conf
@@ -7,9 +7,13 @@ require conf/machine/include/j721s2.inc
 TFA_K3_USART = "0x8"
 OPTEE_K3_USART = "0x8"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j721s2 \
+    ti/k3-j7200-mcspi-loopback \
+"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j721s2-common-proc-board.dtb \
-    ti/k3-j721s2-gesi-exp-board.dtbo \
 "
 
 UBOOT_MACHINE = "j721s2_hs_evm_a72_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j784s4-evm.conf b/meta-ti-bsp/conf/machine/j784s4-evm.conf
index 7971ad73..f0d04a89 100644
--- a/meta-ti-bsp/conf/machine/j784s4-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-evm.conf
@@ -12,7 +12,9 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-j7200-mcspi-loopback \
 "
 
-KERNEL_DEVICETREE = ""
+KERNEL_DEVICETREE = " \
+    ti/k3-j784s4-evm.dtb \
+"
 
 UBOOT_MACHINE = "j784s4_evm_a72_defconfig"
 
diff --git a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
index 123de8c1..89803598 100644
--- a/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j784s4-hs-evm.conf
@@ -8,6 +8,11 @@ TFA_K3_USART = "0x8"
 OPTEEMACHINE = "k3-j784s4"
 OPTEE_K3_USART = "0x8"
 
+KERNEL_DEVICETREE_PREFIX = " \
+    ti/k3-j784s4 \
+    ti/k3-j7200-mcspi-loopback \
+"
+
 KERNEL_DEVICETREE = " \
     ti/k3-j784s4-evm.dtb \
 "
-- 
2.17.1


