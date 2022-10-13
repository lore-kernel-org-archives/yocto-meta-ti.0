Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29E1C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 21:04:14 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web12.22.1665695045049074617
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 14:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=X8eXwYL9;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DL44M6061066;
	Thu, 13 Oct 2022 16:04:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665695044;
	bh=1XLtY1Trr23LdH1wK2A2gcjYwaVUBVEX8YRpOSvaHNU=;
	h=From:To:Subject:Date;
	b=X8eXwYL9Nac9XKbD0yIeWZBgXRFl0jaRSAUO2lR/IFT0Mwbu6CqIfCIS8JbWVpN8D
	 iEIP7IvI7hThOkYWQaE1ybHGHxKeqnTgeF1RhOVhikSp34hMQzDzPX2xOL+lnD/98x
	 upJM5SfTpQ1Dkb9lR6CaYegwLj427iryCsRgTEX8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DL439X040321
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 16:04:04 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 16:04:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 16:04:03 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DL43FY013884;
	Thu, 13 Oct 2022 16:04:03 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oj5N5-00050d-6V; Thu, 13 Oct 2022 16:04:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] u-boot: Remove lzop dependency
Date: Thu, 13 Oct 2022 16:04:03 -0500
Message-ID: <20221013210403.18295-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 21:04:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15173

lzop support has been moved from oe-core to meta-oe.  Since we are not
setting FIT_KERNEL_COMP_ALG and (for minimal poky builds) we would like
to not require meta-oe just for this, just remove the dependency entirely.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index d29c80cf..a82981cc 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 PV:append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
+DEPENDS += "dtc-native bc-native flex-native bison-native python3-setuptools-native"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
-- 
2.17.1


