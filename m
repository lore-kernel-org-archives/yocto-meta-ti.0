Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4947C47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 19:04:23 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1321.1706295858660996622
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Jan 2024 11:04:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=agAQ+pMV;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40QJ4HgJ045638;
	Fri, 26 Jan 2024 13:04:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706295857;
	bh=vthvDgIGHvYAHndxtrYseUjrK46HAKfIoMuaO7rFtNg=;
	h=From:To:CC:Subject:Date;
	b=agAQ+pMV8Xj8/fUFrsqg815BHXq1va1GJb/+MJmEcPPFpZ+TfJXi4pYQLn3gehPOh
	 92HuhCRV79h8bcMd2tQmtKUKmQldBjRANTiNyttP+/NcYAST8BXTRoqxjPSQrYiOmJ
	 OyqFUmzlDutdeJt3efxdTVt+0W+nmo8qhjKZxsd0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40QJ4HBV060838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jan 2024 13:04:17 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jan 2024 13:04:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jan 2024 13:04:16 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40QJ4G8x068879;
	Fri, 26 Jan 2024 13:04:16 -0600
From: <rs@ti.com>
To: <denys@konsulko.com>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone/master][PATCH] mesa-pvr: bump srcrev and drop conditional logic
Date: Fri, 26 Jan 2024 13:04:16 -0600
Message-ID: <20240126190416.1368711-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Jan 2024 19:04:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17421

From: Randolph Sapp <rs@ti.com>

Bump the SRCREV to include some useful patches that:
	- Fix the ROGUE segfault issue introduced by SGX (this was what
	  the old conditional logic was addressing)
	- Fix destruction of event queue with proxies still attached

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 554fadd3..5abd0793 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -28,11 +28,7 @@ PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
-# Temporary work around to use a different SRCREV for SGX Mesa, vs Rogue Mesa
-# Idea is these two should be the same, but currently a segfault is happening
-# on certain platforms if the sgx commit is used.
-SRCREV = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', '7c9522a4147836064f582278e4f7115735c16868', '54fd9d7dea098b6f11c2a244b0c6763dc8c5690c', d)}"
-PR = "sgxrgx${SRCPV}"
+SRCREV = "1be98ba80452ebe38546a7fca26b5a70f2629083"
 
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-- 
2.43.0


