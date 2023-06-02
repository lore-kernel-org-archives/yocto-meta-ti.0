Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F354AC7EE2A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 03:59:19 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4827.1685678355106042054
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Jun 2023 20:59:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=DZzpJWjF;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3523xCBA090865;
	Thu, 1 Jun 2023 22:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685678352;
	bh=u4pGxRRHRwoLOW3EqAPXTu7XY8shVgqY1wJU2/paol0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DZzpJWjFSQHyLcJK0fwx+nZ1oMrPh6woJzesuiHuMljy2yWECqJsgm3kg2ZCB9FRm
	 b1wP48uIfhpPFMlOOL4+O+JckK4rR+OQ5zRA2GudBinvhTJ0YLn9xWrd3hRBJQ1GU4
	 zgt/TEnlMCuMsptds+kfEyTdduUq7/ssKK1KODnY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3523xCce001236
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Jun 2023 22:59:12 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 1
 Jun 2023 22:59:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 1 Jun 2023 22:59:12 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3523xBov061674;
	Thu, 1 Jun 2023 22:59:11 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-ti][master/kirkstone][PATCHv3 1/2] libgles: rename subdir to powervr-umlibs
Date: Thu, 1 Jun 2023 22:58:56 -0500
Message-ID: <20230602035857.771739-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230602035857.771739-1-rs@ti.com>
References: <20230602035857.771739-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 03:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16652

From: Randolph Sapp <rs@ti.com>

Move recipes to new subdir since we offer more than just libgles now.
Reusing the naming convention of the subdirectory used for the km
components for now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../ti-img-rogue-umlibs_23.1.6404501.bb                           | 0
 .../{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules      | 0
 .../{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-img-rogue-umlibs_23.1.6404501.bb (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um/pvrsrvkm.rules (100%)
 rename meta-ti-bsp/recipes-graphics/{libgles => powervr-umlibs}/ti-sgx-ddk-um_1.17.4948957.bb (100%)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-umlibs_23.1.6404501.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_23.1.6404501.bb
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um/pvrsrvkm.rules
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
similarity index 100%
rename from meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
rename to meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-sgx-ddk-um_1.17.4948957.bb
-- 
2.40.1


