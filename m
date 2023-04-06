Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DE47C76196
	for <webhook@archiver.kernel.org>; Thu,  6 Apr 2023 19:28:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.168213.1680809330554644408
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Apr 2023 12:28:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=NXfDt0ZG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 336JSmrQ003152;
	Thu, 6 Apr 2023 14:28:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680809328;
	bh=E75+8ijaL69Xr7bHDE//PWSpiN8RzXmu3NKFG07MAME=;
	h=From:To:CC:Subject:Date;
	b=NXfDt0ZGqUiVaIoJiXz+FhGkuN4/FaKGH5X3hliB56boO3q7SkqMGfwVTkVzJyi6U
	 WTl0ePZmd86+UfKQfUagjcpzho0gNdyXrFqJhLySPWos2unk0pyxTYlhSgWagISHgg
	 GoQGU+bbBHYojJn53e8Y78Q4zsXOPGiwZ/DWzhZo=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 336JSmsv067400
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Apr 2023 14:28:48 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 6
 Apr 2023 14:28:48 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 6 Apr 2023 14:28:48 -0500
Received: from lelv0854.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 336JSm3J012041;
	Thu, 6 Apr 2023 14:28:48 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 1/5] ti-sgx-ddk-um: Remove RDEPENDS on libdrm-omap
Date: Thu, 6 Apr 2023 14:28:43 -0500
Message-ID: <20230406192847.7934-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 06 Apr 2023 19:28:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16304

We no longer use libdrm-omap so remove it.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index 73d7acb9..9ea3add7 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -34,7 +34,7 @@ def use_initscript(d):
 
 inherit ${@oe.utils.ifelse(use_initscript(d), 'update-rc.d', '')}
 
-RDEPENDS:${PN} += "libdrm libdrm-omap"
+RDEPENDS:${PN} += "libdrm"
 
 RRECOMMENDS:${PN} += "ti-sgx-ddk-km"
 
-- 
2.39.2


