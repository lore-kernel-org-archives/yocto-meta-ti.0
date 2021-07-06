Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.7847.1625585272667521361
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Jul 2021 08:27:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=n0eDhv/I;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 166FRpKt096315;
	Tue, 6 Jul 2021 10:27:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625585271;
	bh=Ck9SpbiZUyLiIjeVZe6YWnMCTy/28zKRlE3ScEusKtE=;
	h=From:To:CC:Subject:Date;
	b=n0eDhv/IX1gp5H00Oz1WL4p8OZeyzhl+8C9OSAltPtU3adrQZZNMbYZnsIVrYS/G5
	 M1xLQFaUphK1TDzvcsFBGkc3RhUzqj73rUcWOXW7l2GClswPZX78HA9jyVuP7NPJSd
	 +3vQmPa1VZ44dVnPjc8FAj2pXiuh6uTMKyqmcpqI=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 166FRpF9081890
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jul 2021 10:27:51 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 6 Jul
 2021 10:27:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 6 Jul 2021 10:27:50 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 166FRotO111120;
	Tue, 6 Jul 2021 10:27:50 -0500
From: "Nishanth Menon" <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denys@konsulko.com>
CC: Tom Rini <trini@konsulko.com>, <meta-ti@lists.yoctoproject.org>,
        Nishanth
 Menon <nm@ti.com>
Subject: [dunfell/master PATCH] recipes-bsp: u-boot-ti-mainline: Update to v2021.07 release
Date: Tue, 6 Jul 2021 10:27:47 -0500
Message-ID: <20210706152747.31291-1-nm@ti.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Update u-boot recipe to be on the bleeding upstream tag.

This introduces initial support for AM64x which works with v5.13
kernel tag.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-mainline_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
index 0d3f33ef8ff6..2db9899609d0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-mainline_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://Licenses/README;md5=5a7450c57ffe5ae63fd732446b988025"
 
 PR = "r0"
 
-PV = "2021.04"
+PV = "2021.07"
 
 # For the un-initiated:
 # The actual URL you'd use with a git clone for example would be:
@@ -15,4 +15,4 @@ PV = "2021.04"
 # b) and we want git fetcher to use https protocol, hence GIT_PROTOCOL as https
 UBOOT_GIT_URI = "git://source.denx.de/u-boot/u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
-SRCREV = "b46dd116ce03e235f2a7d4843c6278e1da44b5e1"
+SRCREV = "840658b093976390e9537724f802281c9c8439f5"
-- 
2.32.0

