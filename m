Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4791.1596143488806759061
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jul 2020 14:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=eo/lAc4r;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: denys@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06ULBROS086341
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Jul 2020 16:11:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596143487;
	bh=3+xwjXw+g/fzKOmZLQOTEtUl/UCRl2ORIO7J8h9abzo=;
	h=From:To:CC:Subject:Date;
	b=eo/lAc4rCnW9vePm5rLS/VVAtBH/W4V00Am2oZ1BxG0xgrbtQM21xjkxMkeYs2x+Z
	 VuYWcXMurQwR3J4odzPG63XMVV1liHNFFEE3r8dpC2OJJmdTnYMaHRqgbmpQRAsRbD
	 7ibuBIhzuKoYlMTuVNnJOvxW5SpoMDQPtFW4RD9s=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06ULBRWt003196
	for <meta-ti@lists.yoctoproject.org>; Thu, 30 Jul 2020 16:11:27 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 30
 Jul 2020 16:11:27 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 30 Jul 2020 16:11:27 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06ULBRre075448;
	Thu, 30 Jul 2020 16:11:27 -0500
From: "Denys Dmytriyenko" <denys@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH] u-boot-ti-staging: update to the latest
Date: Thu, 30 Jul 2020 21:11:27 +0000
Message-ID: <20200730211127.16753-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 6ea97ac9..718022a4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r12"
+PR = "r13"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "f9b0d030d31ab79577f1dd1e48814a8f3119c481"
+SRCREV = "8f6a3d099040aa30bb46a4833a0766051507b3c5"
-- 
2.17.1

