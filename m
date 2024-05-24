Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20CDC25B74
	for <webhook@archiver.kernel.org>; Fri, 24 May 2024 21:07:11 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.6003.1716584823429575756
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 May 2024 14:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=jKciTwJA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44OL6wdZ020458;
	Fri, 24 May 2024 16:06:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1716584818;
	bh=UvqQkhclYgpwkRCpg1TtXFa98vpR8DLq/2lm3/wt0f0=;
	h=From:To:CC:Subject:Date;
	b=jKciTwJA0Ookx4dFNf8Bu5n54fUECACzBVcnXrlsI/Zo2r/ZLR1JjYY5Af2uAEuF4
	 LTFM/KPoixM4T4q/RuNwcD5sh1VsYCHWsS2EaMAEkKnZdWeaChGT0LCiXuU+6DMtNI
	 aHjrOiFwP08mgYTMJ818lt1mkjJruGOxSJZZJ9gE=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44OL6wnM015242
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 May 2024 16:06:58 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 24
 May 2024 16:06:58 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 24 May 2024 16:06:58 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44OL6wgE063344;
	Fri, 24 May 2024 16:06:58 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <detheridge@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap/master] ti-img-rogue-umlibs: bump SRCREV for alloc patch
Date: Fri, 24 May 2024 16:06:53 -0500
Message-ID: <20240524210653.39569-1-rs@ti.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 May 2024 21:07:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17681

From: Randolph Sapp <rs@ti.com>

Bump the SRCREV to pick up rebuilt binaries. Upstream release notes:

Regenerate all binaries with a fix for exportable buffer allocations
that should improve Chromium compatibility.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
index d43d1635..c731fabb 100644
--- a/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
+++ b/meta-ti-bsp/recipes-graphics/powervr-umlibs/ti-img-rogue-umlibs_24.1.6554834.bb
@@ -16,7 +16,7 @@ PR = "r3"
 
 BRANCH = "linuxws/scarthgap/k6.6/${PV}"
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-umlibs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "e473234158c736248cf71a60080b7faf76fca561"
+SRCREV = "aeaf6d007abdc0f782d5f5c4b374efdad2d87943"
 S = "${WORKDIR}/git/targetfs/${TARGET_PRODUCT}/${PVR_WS}/${PVR_BUILD}"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
-- 
2.45.1


