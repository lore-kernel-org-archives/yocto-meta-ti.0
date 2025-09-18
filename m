Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BD29CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 18:52:25 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.23253.1758221544711174315
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 11:52:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XqlCRC/P;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58IIqM1s071800;
	Thu, 18 Sep 2025 13:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1758221542;
	bh=WHCx/zFz4wLCJQTouzc6ZxcznVAwje2kFPbcqXetqGo=;
	h=From:To:Subject:Date;
	b=XqlCRC/PiIbPQTYArdJn0dRcOuFEo1AGJTvX6OmlnbpbTGvUm7+rzz/VWMBKHJyB/
	 5J/ymrxUu8a/2eqXZlAKwnddkAb2eTcj4Zmu3FDTVKdVDsBVNik3nc/fYmIhmo6fa9
	 5pLSzqM0oMhUv0TMh+y3xDwy59XcYiUhEeCFBENA=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58IIqMLT2561266
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 18 Sep 2025 13:52:22 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 13:52:22 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 13:52:22 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58IIqMOb1045272;
	Thu, 18 Sep 2025 13:52:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uzJjx-0001cJ-TZ; Thu, 18 Sep 2025 13:52:21 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mesa-pvr: add PROVIDES for Vulkan and OpenCL ICDs
Date: Thu, 18 Sep 2025 13:52:21 -0500
Message-ID: <20250918185221.5553-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 18 Sep 2025 18:52:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19039

A recent change in oe-core [1] has created new virtual packages to pick
the driver packages for OpenCL and Vulkan Installable Client Drivers.
This patch just copies the same changes from oe-core into our copy of the
mesa package.

[1] https://git.openembedded.org/openembedded-core/commit/meta/recipes-graphics/mesa/mesa.inc?id=6f01f029ef6fed96e257d6a88de42edaa437de3e

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
index 45d5ada3..5ce93d27 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
@@ -228,6 +228,10 @@ CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
 # Remove the mesa dependency on mesa-dev, as mesa is empty
 DEV_PKG_DEPENDENCY = ""
 
+# Provide virtual names to allow selecting preferred rproviders
+RPROVIDES:mesa-vulkan-drivers += "virtual-vulkan-icd"
+RPROVIDES:libopencl-mesa += "virtual-opencl-icd"
+
 # GLES2 and GLES3 implementations are packaged in a single library in libgles2-mesa.
 # Add a dependency so the GLES3 dev package is associated with its implementation.
 RPROVIDES:libgles2-mesa += "libgles3-mesa"
-- 
2.17.1


