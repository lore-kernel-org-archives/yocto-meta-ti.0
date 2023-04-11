Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96182C76196
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 22:54:24 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.29927.1681253661723829436
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 15:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OwEkzIdW;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BMsK1w130738;
	Tue, 11 Apr 2023 17:54:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681253660;
	bh=ZaCINF280KO+SeCqVFKqORiOR9uxR/M9aKUr8p8SkNw=;
	h=From:To:Subject:Date;
	b=OwEkzIdW4rrEDsQ7ZvtZYz8/KUtv+4tjrDUF6KERs7OsF1OJ7zTq0O3zmSf5riiIu
	 J8WLnDNmmJ9imHfk1TgaCQ9edLikcnQDo0hToqbSX08yDxSjcarNi3geM6a2JnhFPu
	 kyF7lR700OGr+37xRfLCzmN3DPaWCBVIfnWK76rw=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BMsK9F009661
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 17:54:20 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 17:54:20 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 17:54:20 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BMsKwM010609;
	Tue, 11 Apr 2023 17:54:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pmMsW-0002pk-6h; Tue, 11 Apr 2023 17:54:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH v2] ti-sci-fw: Add SYSFW_SUFFIX to SYSFW_BINARY to match k3-image-gen
Date: Tue, 11 Apr 2023 17:54:20 -0500
Message-ID: <20230411225420.10044-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 22:54:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16373

k3_image_gen added the suffix to the sysfw binary to differentiate
between GP and HS binaries.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Split the IMAGE_BOOT_FILES for GP and HS.  This is not the final
form.  We will be re-working a lot of the platforms to follow the am62
model of building everything, but for LTS migration progress this is needed.

 meta-ti-bsp/conf/machine/include/am65xx.inc   |  3 +-
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    | 32 +++++++++----------
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/conf/machine/include/am65xx.inc
index edfc7c11..3f29076f 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -23,7 +23,8 @@ do_image_complete[mcdepends] += "mc::k3r5-sr2:ti-sci-fw:do_deploy"
 IMAGE_BOOT_FILES += "sysfw.itb"
 
 # Since default sysfw.itb on AM65x is for SR2.0, add a version for SR1.0
-IMAGE_BOOT_FILES += "sysfw-am65x-evm.itb"
+IMAGE_BOOT_FILES:am65xx-evm += "sysfw-am65x-gp-evm.itb"
+IMAGE_BOOT_FILES:am65xx-hs-evm += "sysfw-am65x-hs-evm.itb"
 
 TFA_BOARD = "generic"
 
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index cde768df..ee995fa5 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -55,26 +55,26 @@ SYSFW_TISCI = "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-*.bin"
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


