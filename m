Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC532C77B73
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:42:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.417.1681324964786167768
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:42:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cyriyjlO;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIghr1047908;
	Wed, 12 Apr 2023 13:42:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324963;
	bh=E75+8ijaL69Xr7bHDE//PWSpiN8RzXmu3NKFG07MAME=;
	h=From:To:CC:Subject:Date;
	b=cyriyjlOWMWkan+F/gvJqeykaj3YpA/6USh0aXy925xtOz6G08y5QsHDpmiq/oUMP
	 3WlhFc6v96mFNhPjaSaiN/EfMxfxvr9ZN3tTBbr+/dvukXQt+oJw7zq70ZYZGrMYDM
	 P0mahDNxprJxjU0bUb09vTTUxLPBqwP/Q3bRsOjk=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIggdX121140
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:42:42 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:42:42 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:42:43 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIggZV023440;
	Wed, 12 Apr 2023 13:42:42 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 1/6] ti-sgx-ddk-um: Remove RDEPENDS on libdrm-omap
Date: Wed, 12 Apr 2023 13:42:37 -0500
Message-ID: <20230412184242.29743-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16376

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


