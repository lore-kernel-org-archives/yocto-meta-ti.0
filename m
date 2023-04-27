Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6BB7C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:08:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.4090.1682629675906579585
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=a05aJrPG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7r2c127534;
	Thu, 27 Apr 2023 16:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682629673;
	bh=SSJ2f1HszrGtBoDjfmP+cWVylCgh3qeGHNrwlPbpHS8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=a05aJrPG7Cb4qLGqn1dPy8q+I2yDAg2NNnbk8dyqZMcUaKwepWkj/tsk94KxKF4Fy
	 QrZbSm7wA8OfG2A1zwyxroPXdm192TjvGh/3sMI80Ri0Dh0kFnsi/7ABResfeEhoTD
	 SVPL1s13g8ccBwrvYfivSpmKvidIfJpHFmK1s2d0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RL7rqA005184
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:07:53 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:07:53 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:07:53 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7k8b002940;
	Thu, 27 Apr 2023 16:07:53 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 4/4] ti-img-rogue-umlibs: package firmware separately
Date: Thu, 27 Apr 2023 16:07:46 -0500
Message-ID: <20230427210746.1915362-5-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230427210746.1915362-1-rs@ti.com>
References: <20230427210746.1915362-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 27 Apr 2023 21:08:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16448

From: Randolph Sapp <rs@ti.com>

Split the firmware into it's own package so we can make the insane
checks a little more paranoid again.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../libgles/ti-img-rogue-umlibs_23.1.6404501.bb           | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
index 9068d341..c33f8ae0 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
@@ -32,7 +32,7 @@ do_install:append() {
     rm -rf "${D}/etc/init.d"
 }
 
-PACKAGES = "${PN}-vulkan ${PN}-tools ${PN}"
+PACKAGES = "${PN}-vulkan ${PN}-tools ${PN}-firmware ${PN}"
 
 FILES:${PN}-vulkan = " \
     ${datadir}/vulkan \
@@ -53,6 +53,10 @@ INSANE_SKIP:${PN}-vulkan += " \
 FILES:${PN}-tools = "${bindir}/"
 RDEPENDS:${PN}-tools = "python3-core"
 
+FILES:${PN}-firmware = "${base_libdir}/firmware/*"
+INSANE_SKIP:${PN}-firmware += "arch"
+
 RRECOMMENDS:${PN} += "${PN}-vulkan ${PN}-tools"
+RDEPENDS:${PN} += " ${PN}-firmware"
 
-INSANE_SKIP:${PN} += "ldflags arch already-stripped dev-so"
+INSANE_SKIP:${PN} += "already-stripped dev-so"
-- 
2.40.0


