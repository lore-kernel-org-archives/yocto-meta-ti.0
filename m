Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62523C61D97
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 14:53:50 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.21448.1700664823434174838
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Nov 2023 06:53:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=p1hxt2c2;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: anandb@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3AMErg9x060739;
	Wed, 22 Nov 2023 08:53:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1700664822;
	bh=S+QCHhQviu3tQlaPsl3Vhz8iiJhxGx2P0zK19ZplBT8=;
	h=From:To:CC:Subject:Date;
	b=p1hxt2c2/Zxh4MjNMV1jQvQExBHf/cFnp31Z2Q4p2Wj115DETDdgY42vDRbMxkTxN
	 XrBB94NaSBxi7MGINKAE1TDDvpcIzP35QWvr328v5eZ436+A3YlL5imvp9jplLHspR
	 dO7oK+NKjzmA0aVFHr0ykXZwLMMeQHo8B1d5HDSM=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3AMErgHn052810
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 22 Nov 2023 08:53:42 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 22
 Nov 2023 08:53:41 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 22 Nov 2023 08:53:41 -0600
Received: from uds0876520.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3AMErdbE125147;
	Wed, 22 Nov 2023 08:53:40 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>, <reatmon@ti.com>
CC: <anandb@ti.com>, <detheridge@ti.com>, <rs@ti.com>
Subject: [kirkstone][PATCH 1/1] mesa-pvr: use different srcrev for Rogue and SGX GPU platforms
Date: Wed, 22 Nov 2023 20:23:24 +0530
Message-ID: <20231122145324.3481890-1-anandb@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Nov 2023 14:53:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17328

From: Darren Etheridge <detheridge@ti.com>

A bug was introduced while trying to unify the Mesa version that is used
on SGX GPU's and Rogue GPU's.   It manifests itself as an immediate segfault
whenever you try and run something like glmark2-es2-wayland or
weston-simple-egl on certain Rogue based platforms (specifically am62x).

Use different srcrev for Rogue GPU and SGX GPU platforms. The SGX GPU platforms
will use the latest commit. Rogue GPU platforms will use the last good working
commit before SGX related changes were introduced.

This change will be reverted once the issue is rootcaused and a common solution
is found for both Rogue and SGX based GPU platforms.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
index 98d30c5b..55dad414 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_22.3.5.bb
@@ -23,13 +23,17 @@ SRC_URI = " \
 
 S = "${WORKDIR}/git"
 
-SRCREV = "7c9522a4147836064f582278e4f7115735c16868"
-
 PACKAGECONFIG:append = " \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-img-rogue-driver', 'pvr', '', d)} \
     ${@bb.utils.contains('PREFERRED_PROVIDER_virtual/gpudriver', 'ti-sgx-ddk-km', 'sgx', '', d)} \
 "
 
+# Temporary work around to use a different SRCREV for SGX Mesa, vs Rogue Mesa
+# Idea is these two should be the same, but currently a segfault is happening
+# on certain platforms if the sgx commit is used.
+SRCREV = "${@bb.utils.contains('PACKAGECONFIG', 'sgx', '7c9522a4147836064f582278e4f7115735c16868', '54fd9d7dea098b6f11c2a244b0c6763dc8c5690c', d)}"
+PR = "sgxrgx-${SRCREV}"
+
 PVR_DISPLAY_CONTROLLER_ALIAS ??= "tidss"
 PACKAGECONFIG[pvr] = "-Dgallium-pvr-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
 PACKAGECONFIG[sgx] = "-Dgallium-sgx-alias=${PVR_DISPLAY_CONTROLLER_ALIAS},"
-- 
2.34.1


