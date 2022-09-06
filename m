Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 080B9C38145
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 23:11:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1343.1662505883177980443
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Sep 2022 16:11:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=sVF6Cs2c;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 286NBKxF014868;
	Tue, 6 Sep 2022 18:11:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1662505880;
	bh=qg/RWRwRXtedIQyOlKJqg0Twz8RO/LsXimDN4CILbFE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sVF6Cs2c1DosIRDkG21VIJbsIA2tPpXgBzrI0mKWtcmfdXYKSlr6fF0xyjXhODGG5
	 gmig+Hc+tEq8N7wkCQe7gFwG5J1O2k/pW/F5Tr3CvcFRqowK/IEky45hJKXqYFwhOd
	 EZpkTk1WMWJCeaOERwtZL59Y2dQxOM0rr25c0z5Q=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 286NBKh3009740
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Sep 2022 18:11:20 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 6 Sep
 2022 18:11:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 6 Sep 2022 18:11:20 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 286NBJcX035641;
	Tue, 6 Sep 2022 18:11:19 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Anand Gadiyar <gadiyar@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][dunfell][PATCH 2/2] conf: machine: am64xx: Move
 multi-config targets into base SoC include
Date: Tue, 6 Sep 2022 18:11:19 -0500
Message-ID: <20220906231119.29102-2-afd@ti.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220906231119.29102-1-afd@ti.com>
References: <20220906231119.29102-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 06 Sep 2022 23:11:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14999

The supported device types depends on the SoC, not on any specific
board or EVM. Any board can be populated with any of the 3 supported
AM64x types. Move these into the AM64x common include.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 conf/machine/am64xx-evm.conf    | 26 +++++++-------------------
 conf/machine/include/am64xx.inc | 13 +++++++++++++
 2 files changed, 20 insertions(+), 19 deletions(-)
 rewrite conf/machine/am64xx-evm.conf (76%)

diff --git a/conf/machine/am64xx-evm.conf b/conf/machine/am64xx-evm.conf
dissimilarity index 76%
index d9afb08e..c6ba2a87 100644
--- a/conf/machine/am64xx-evm.conf
+++ b/conf/machine/am64xx-evm.conf
@@ -1,19 +1,7 @@
-#@TYPE: Machine
-#@NAME: AM64xx EVM
-#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
-
-require conf/machine/include/am64xx.inc
-
-UBOOT_MACHINE = "am64x_evm_a53_defconfig"
-
-# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
-BBMULTICONFIG += "k3r5-gp"
-IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
-
-# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
-BBMULTICONFIG += "k3r5-sr2-hs-se"
-IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
-do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
-do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+#@TYPE: Machine
+#@NAME: AM64xx EVM
+#@DESCRIPTION: Machine configuration for the TI AM64xx EVM
+
+require conf/machine/include/am64xx.inc
+
+UBOOT_MACHINE = "am64x_evm_a53_defconfig"
diff --git a/conf/machine/include/am64xx.inc b/conf/machine/include/am64xx.inc
index 0b9a3e59..913d95e6 100644
--- a/conf/machine/include/am64xx.inc
+++ b/conf/machine/include/am64xx.inc
@@ -14,10 +14,23 @@ KERNEL_DEVICETREE = " \
     ti/k3-am642-evm-nand.dtbo \
 "
 
+# Default tiboot3.bin on AM64x is for SR2.0 HS-FS
 BBMULTICONFIG = "k3r5-sr2-hs-fs"
 do_image_wic[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
 do_image_tar[mcdepends] = "mc::k3r5-sr2-hs-fs:ti-sci-fw:do_deploy"
 
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for GP
+BBMULTICONFIG += "k3r5-gp"
+IMAGE_BOOT_FILES += " tiboot3-am64x-gp-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-gp:ti-sci-fw:do_deploy"
+
+# Since default tiboot3.bin on AM64x is for SR2.0 HS-FS, add a version for SR2.0 HS-SE
+BBMULTICONFIG += "k3r5-sr2-hs-se"
+IMAGE_BOOT_FILES += " tiboot3-am64x_sr2-hs-evm.bin"
+do_image_wic[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+do_image_tar[mcdepends] += "mc::k3r5-sr2-hs-se:ti-sci-fw:do_deploy"
+
 TFA_BOARD = "lite"
 OPTEEMACHINE = "k3-am64x"
 OPTEEOUTPUTMACHINE = "k3"
-- 
2.36.1


