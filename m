Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6385C77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:42:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.26952.1684255347506667403
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:42:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZbPttGRq;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgQte052930;
	Tue, 16 May 2023 11:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255346;
	bh=yQvxdPnbXrLAnM4Vw9VCwu98Yi53riQTDLSAtvLIlCk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ZbPttGRqHF6x0Ab9n06ShzQzM11BwR4VRyTgHCkEoHUMIbaU0VOkxb+zxB/xrHig6
	 FODz2kQO1enTrH+YDfchWLT1+CNHiGV70FpQqtNuelfqr0V6wv0ndqRvtxPXbekLP3
	 4yyyYMii9+h2xEb/nCAqR8f6fUJfYlLLjiCRBi/U=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGgQmK020305
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:42:26 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:42:25 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:42:25 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgPAZ077219;
	Tue, 16 May 2023 11:42:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxkn-0003Dc-Qn; Tue, 16 May 2023 11:42:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 3/8] j721e-hs-evm: Merge j721e defconfigs
Date: Tue, 16 May 2023 11:42:20 -0500
Message-ID: <20230516164225.12311-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164225.12311-1-reatmon@ti.com>
References: <20230516164225.12311-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 16:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16538

From: Manorit Chawdhry <m-chawdhry@ti.com>

uboot will now use a merged defconfig build so keep the defconfig same
for hs here

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf | 2 +-
 meta-ti-bsp/conf/machine/j721e-hs-evm.conf      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
index 56312c0c..94c434ea 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm-k3r5.conf
@@ -14,4 +14,4 @@ UBOOT_BINARY = "tiboot3.${UBOOT_SUFFIX}"
 UBOOT_IMAGE = "tiboot3-${MAINMACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
 UBOOT_SYMLINK = "tiboot3-${MAINMACHINE}.${UBOOT_SUFFIX}"
 
-UBOOT_MACHINE = "j721e_hs_evm_r5_defconfig"
+UBOOT_MACHINE = "j721e_evm_r5_defconfig"
diff --git a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
index 00ec1998..0ed77c3d 100644
--- a/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721e-hs-evm.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/j721e-evm.conf
 
-UBOOT_MACHINE = "j721e_hs_evm_a72_defconfig"
+UBOOT_MACHINE = "j721e_evm_a72_defconfig"
 
 SPL_BINARY = "tispl.bin_HS"
 UBOOT_BINARY = "u-boot.img_HS"
-- 
2.17.1


