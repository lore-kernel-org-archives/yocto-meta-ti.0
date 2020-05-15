Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.13837.1589551163556369645
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 15 May 2020 06:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T7hc8TPL;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nikhil.nd@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04FDxMRJ062631
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2020 08:59:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1589551162;
	bh=2jvLv4mHemzVnNl18n8Z3Dz+uokyyzsgnVWl94b21uo=;
	h=From:To:CC:Subject:Date;
	b=T7hc8TPLmBI4j76PvIdfEWsNPd1Pa58voYONgkt2r/y98V5TW5mNFW1AElC9/48eV
	 bTswnHKtcsj1SVCwePcZvP6srnKz85Ism9Gl1ZleJqQNVHcsycOcsnj1qJHh6GVDC0
	 cDMVahzPMivkIGZ5IKfFYYPRIl34e0ekKgj3sKTU=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04FDxMfe032624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 15 May 2020 08:59:22 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 15
 May 2020 08:59:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 15 May 2020 08:59:22 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04FDxKXE072037;
	Fri, 15 May 2020 08:59:21 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][dunfell PATCH] recipes-kernel: jailhouse: Update SRCREV to latest
Date: Fri, 15 May 2020 19:28:44 +0530
Message-ID: <20200515135844.4333-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index 3ee24e58..46447af6 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 PV = "0.12+git${SRCPV}"
-SRCREV = "2c6516ce3d0e0c4e9372e4439562dd660877cb79"
+SRCREV = "8fd88c37ae1a4f7130ef40899c0eadd737c64832"
 BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
-- 
2.17.1

