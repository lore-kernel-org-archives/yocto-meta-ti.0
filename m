Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55E23C433FE
	for <webhook@archiver.kernel.org>; Thu, 13 Oct 2022 18:26:13 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.28.1665685567046614517
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Oct 2022 11:26:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Tha4PRdY;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29DIQ2qS036058;
	Thu, 13 Oct 2022 13:26:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665685562;
	bh=d91u4kZZz4LjXOQUyU7cufNKaK2/DX8BGdsgZUKgAnw=;
	h=From:To:Subject:Date;
	b=Tha4PRdYwwQ1JytJD8I36cm94Zq9EsoSRmKnDo9HpCqrBt8f0rPgpCAjAIwUc7sHc
	 FsNFRPkNgIAkEbTQTNQnFOQ14jcfb+jtmqpe0pHlH2bxZvujoRPCi3OQzNiYrl8P7F
	 FkaDurQ+4BsJSrrkvEvLAxdO+9wrVNuQRN82Vygk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29DIQ2vc001462
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Oct 2022 13:26:02 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Thu, 13
 Oct 2022 13:26:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Thu, 13 Oct 2022 13:26:02 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29DIQ2bW121380;
	Thu, 13 Oct 2022 13:26:02 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oj2uA-0002Qz-6r; Thu, 13 Oct 2022 13:26:02 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] u-boot: Change depends from lzop to lzo
Date: Thu, 13 Oct 2022 13:26:02 -0500
Message-ID: <20221013182602.9318-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 13 Oct 2022 18:26:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15163

lzop has disappeared from upstream master, but lzo is there.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fixed typo lzpo -> lzop

 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index d29c80cf..88018541 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -23,7 +23,7 @@ SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 PV:append = "+git${SRCPV}"
 
 # u-boot needs devtree compiler to parse dts files
-DEPENDS += "dtc-native bc-native lzop-native flex-native bison-native python3-setuptools-native"
+DEPENDS += "dtc-native bc-native lzo-native flex-native bison-native python3-setuptools-native"
 
 DM_FIRMWARE = "ipc_echo_testb_mcu1_0_release_strip.xer5f"
 
-- 
2.17.1


