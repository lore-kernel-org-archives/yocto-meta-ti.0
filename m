Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.8462.1618499295452178823
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Apr 2021 08:08:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TL6ZSmZI;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13FF8DCH105810;
	Thu, 15 Apr 2021 10:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618499293;
	bh=k8tXV4sNH7k52qFhv3o2TQQvDEU+RckwStWfN2hLdk8=;
	h=From:To:CC:Subject:Date;
	b=TL6ZSmZIWgfw1aOiLww/+hIM4pgSZe/rU6F3NKGrZM1Z0hrHVKS+95Wfv2BdKSDb4
	 Ao2Xm5klb1pWTztMlJi2CdIvv5RwYrM6K3OjjcvsLeIORKVZuyGlGChe2Aqp1Yb2Py
	 UVpeOxcEi1rzbUIY0Nh8k2XwdPewc5MEv1kVjkJk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13FF8D2h005756
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Apr 2021 10:08:13 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 15
 Apr 2021 10:08:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 15 Apr 2021 10:08:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13FF8DJW002552;
	Thu, 15 Apr 2021 10:08:13 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <lokeshvutla@ti.com>,
        Nishanth Menon
	<nm@ti.com>
Subject: [dunfell/master PATCH V2] recipes-bsp: u-boot-ti-mainline: Update to v2021.04 release
Date: Thu, 15 Apr 2021 10:08:10 -0500
Message-ID: <20210415150810.18555-1-nm@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update u-boot recipe to be on the bleeding upstream tag.

While at it, also update the u-boot source url to point to the new
server as per [1].

[1] https://source.denx.de/u-boot/u-boot/-/commit/a3bbd0b912f9afff745247fe9641961875322926

Signed-off-by: Nishanth Menon <nm@ti.com>
---

Changes in v2:
- Update the source URL to the latest url for upstream repos

V1: https://lists.yoctoproject.org/g/meta-ti/message/13681

 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index ee0b17640807..8259579fc323 100644
--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
 PR = "r0"
 
-PV = "2020.10"
-UBOOT_GIT_URI = "git://gitlab.denx.de/u-boot/u-boot.git"
+PV = "2021.04"
+UBOOT_GIT_URI = "https://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "http"
-SRCREV = "050acee119b3757fee3bd128f55d720fdd9bb890"
+SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
-- 
2.31.0

