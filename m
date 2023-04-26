Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE2A7C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 21:55:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5974.1682546145487751856
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 Apr 2023 14:55:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UASTWXlu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33QLtfHp115575;
	Wed, 26 Apr 2023 16:55:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682546141;
	bh=S+nYHWklaluDi6ZhBjp2A3CrUdNOC3rJaAWbYsIQYK4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UASTWXluU5Mb1S11jx1CRTEWcvdJ7sd24tHY5xbIFHoGsfzbLm6TNAqtzrca7gBPo
	 gXTMgpTF+hOj29UfN6zPtysUFp4NLlZpp9zMi4SCJk5g/Oe/pvDGYeMAK348KGAzIw
	 3dSEE2ctvUsBlixXyrT+1Scq26cJO8WYHr4ztTMU=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33QLtfCj011085
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 Apr 2023 16:55:41 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 26
 Apr 2023 16:55:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 26 Apr 2023 16:55:41 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33QLtf4B081011;
	Wed, 26 Apr 2023 16:55:41 -0500
From: <rs@ti.com>
To: <afd@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][kirkstone][PATCH 2/4] pvr-mesa: add new vulkan configuration options and wsi
Date: Wed, 26 Apr 2023 16:55:36 -0500
Message-ID: <20230426215538.3502212-3-rs@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426215538.3502212-1-rs@ti.com>
References: <20230426215538.3502212-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 26 Apr 2023 21:55:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16435

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


