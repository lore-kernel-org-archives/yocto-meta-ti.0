Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93ACC77B7C
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 21:08:03 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4151.1682629675906998300
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 27 Apr 2023 14:07:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=un0JnfwS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7rvD127526;
	Thu, 27 Apr 2023 16:07:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682629673;
	bh=S+nYHWklaluDi6ZhBjp2A3CrUdNOC3rJaAWbYsIQYK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=un0JnfwS/gMNmzDXTJrfZ6QRrLYef/YeAsZDLzmltaEdPwZ52iNo4VdhqOgo6cqHU
	 l7gSP9fKvPdnDJMwZ3SG7aJyBEB4MoBFZ8wo6MfbqYKv61rBgUAYWGq75+ZdDHxMbK
	 Thv10qa+fWm6sCm2SAP2nTB7G8oJXw0ZKitVvd+g=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RL7rCC005176
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Apr 2023 16:07:53 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 16:07:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 16:07:52 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RL7k8Z002940;
	Thu, 27 Apr 2023 16:07:52 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <detheridge@ti.com>, <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCHv2 2/4] pvr-mesa: add new vulkan configuration options and wsi
Date: Thu, 27 Apr 2023 16:07:44 -0500
Message-ID: <20230427210746.1915362-3-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16446

From: Randolph Sapp <rs@ti.com>

Add the required vulkan configuration options and the new PVR WSI file to
the corresponding package.

Also bump the PV to match the version of Mesa actually being shipped.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
index d938f41c..caf94156 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc
@@ -38,14 +38,18 @@ PACKAGECONFIG:remove = "xvmc"
 PACKAGECONFIG[xvmc] = ""
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-PV = "22.0.3+pvr"
+PV = "22.3.5+pvr"
 
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', ',sgx', '', d)}"
 
+VULKAN_DRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'pvr', ',pvr', '', d)}"
+
 do_install:append () {
     # remove pvr custom pkgconfig
     rm -rf ${D}${datadir}/pkgconfig
 }
 
+FILES:mesa-vulkan-drivers += " ${libdir}/libpvr_mesa_wsi.so"
+
 RRECOMMENDS:mesa-megadriver:append:class-target = " ${@d.getVar('PREFERRED_PROVIDER_virtual/gpudriver')}"
-- 
2.40.0


