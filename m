Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 760FEC47088
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 14:58:22 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.77460.1669993101092872414
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 06:58:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lkkZqohC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2B2EwIKl118956;
	Fri, 2 Dec 2022 08:58:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1669993098;
	bh=iLL7ZMP6F/WAEF2OHjJo5pfGonkfdeFyJzFmkqC9+5A=;
	h=From:To:Subject:Date;
	b=lkkZqohCW72GHWfXVKVh9tTlGML/SLgVeag5RgRr5/FcMIRx5/osJKEDSBIzdBCJE
	 1+Uc7zdGLUnuD0NdtepwG3unKRmlD08wPatFPHWFvLn8XaVY65Z/ZpVNrfuJOIX3Eo
	 LH+M7wKZ8ugp6jqraNyL3Bd2kM1FTReYDDqGwECI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2B2EwIvE021262
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Dec 2022 08:58:18 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 2
 Dec 2022 08:58:18 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 2 Dec 2022 08:58:18 -0600
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2B2EwIiI060574;
	Fri, 2 Dec 2022 08:58:18 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1p17UX-0007Rh-TN; Fri, 02 Dec 2022 08:58:17 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Add lzop dependency
Date: Fri, 2 Dec 2022 08:58:17 -0600
Message-ID: <20221202145817.28581-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Dec 2022 14:58:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15387

It turns out we do need lzop for building dra7 and am57 in u-boot,
so add the dependency back in and add a layer dependency on
meta-oe(openembedded-layer).

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/layer.conf                  | 1 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 39e7f9eb..8bafa854 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -15,6 +15,7 @@ LICENSE_PATH += "${LAYERDIR}/licenses"
 
 LAYERDEPENDS_meta-ti-bsp = " \
     core \
+    openembedded-layer \
     meta-arm \
 "
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index d87dcbe1..5127e137 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 PV:append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
+DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
-- 
2.17.1


