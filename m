Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19CFC7618D
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 21:29:47 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.170707.1680816580549831008
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 14:29:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Bpfw1O+O;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336LTcHj026993;
	Thu, 6 Apr 2023 16:29:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680816578;
	bh=T9mupI3pYgbuzE+6ywyQ8X8d6OxVpCS++OMv6c/wLA8=;
	h=From:To:Subject:Date;
	b=Bpfw1O+OhR4Ptd+Kvh5eMmjpukXSXaUp5BoUxTFGhTNTofgkGkHlMmycXF/WuaeSL
	 nMZaFsN5LPERbJM2n5iJUDRrmVof9+EhNj/yLB2gIh7W5Gr0RP1/NnTecMw07EgXRV
	 wM6vZnpy0hvrIRPYqs8Dey/zHYfPSwefdDWmqutc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336LTbmp130113
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 16:29:37 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 16:29:37 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 16:29:37 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336LTbbM112827;
	Thu, 6 Apr 2023 16:29:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pkXAn-00029q-Ew; Thu, 06 Apr 2023 16:29:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY to match k3-image-gen
Date: Thu, 6 Apr 2023 16:29:37 -0500
Message-ID: <20230406212937.8254-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 21:29:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16314

k3_image_gen added the suffix to the sysfw binary to differentiate
between GP and HS binaries.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  2 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 32 +++++++++----------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index 564d61b0..d0e826c0 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -23,7 +23,7 @@ do_image_wic[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
+IMAGE_BOOT_FILES += "sysfw-am65x-gp-evm.itb"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 31b2910a..dc423012 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -54,26 +54,26 @@ SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
 SYSFW_TIBOOT3 = "tiboot3-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.bin"
 SYSFW_TIBOOT3_SYMLINK ?= "tiboot3.bin"
 
-SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_BINARY = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_VBINARY = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_IMAGE = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 SYSFW_SYMLINK ?= "sysfw.itb"
 
-SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-
-SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
-SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:am65xx-hs-evm-k3r5-sr2 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-hs-evm-k3r5 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_VBINARY:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${PV}-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+
+SYSFW_IMAGE:am65xx-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:am65xx-hs-evm-k3r5-sr2 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-hs-evm-k3r5 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
+SYSFW_IMAGE:j721e-hs-evm-k3r5-sr1-1 = "sysfw-${SYSFW_SOC}-${SYSFW_SUFFIX}-${SYSFW_CONFIG}.itb"
 
 CFLAGS[unexport] = "1"
 LDFLAGS[unexport] = "1"
-- 
2.17.1


