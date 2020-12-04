Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.373.1607115076586619830
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Dec 2020 12:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CrchbuK/;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B4KpF02102463;
	Fri, 4 Dec 2020 14:51:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607115075;
	bh=1YvofNqJTtby40qZa287spVEQqEPcQ+Qe9zMkhYmuWA=;
	h=From:To:CC:Subject:Date;
	b=CrchbuK/7ucRchAawNYg2ztLaRQ6YobXDORymwFvxh4BrAAwIi9PM6kUXYPy3hmDu
	 q/zhBqXBs4n42K17T0e3MA5zvIa5NVNlcv5MvQaoxk5ZaVEShGVF7/x/2c4fbAGQ/j
	 LDorGzkJ3sWvwsvL0PZJxCjbrRwbsTMZIxx9MNbo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B4KpF7B123670
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 4 Dec 2020 14:51:15 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 4 Dec
 2020 14:51:14 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 4 Dec 2020 14:51:14 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B4KpEva095602;
	Fri, 4 Dec 2020 14:51:14 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Dan Murphy <dmurphy@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Suman Anna <s-anna@ti.com>, Khem Raj <raj.khem@gmail.com>
Subject: [dunfell/master PATCH v2] u-boot-ti-staging_2020.01: Update SRCREV to latest
Date: Fri, 4 Dec 2020 14:51:14 -0600
Message-ID: <20201204205114.19323-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

commit a6904f563f ("Remove redundant YYLOC global declaration")
is in ti-u-boot-2020.01 branch now.

Updating SRCREV of ti-u-boot-2020.01 to pick the patch from there.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 ...e-redundant-YYLOC-global-declaration.patch | 28 -------------------
 .../u-boot/u-boot-ti-staging_2020.01.bb       |  6 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch

diff --git a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch b/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
deleted file mode 100644
index 4973ea9d..00000000
--- a/recipes-bsp/u-boot/files/0001-Remove-redundant-YYLOC-global-declaration.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From b436a29de12d3f1da579edf3e3d4d42a60b9e58a Mon Sep 17 00:00:00 2001
-From: Peter Robinson <pbrobinson@gmail.com>
-Date: Thu, 30 Jan 2020 09:37:15 +0000
-Subject: [PATCH] Remove redundant YYLOC global declaration
-
-Same as the upstream fix for building dtc with gcc 10.
-
-Upstream-Status: Backport [https://github.com/u-boot/u-boot/commit/018921ee79d3f30893614b3b2b63b588d8544f73]
-Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
----
- scripts/dtc/dtc-lexer.l | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
-index fd825ebba6..24af549977 100644
---- a/scripts/dtc/dtc-lexer.l
-+++ b/scripts/dtc/dtc-lexer.l
-@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
- #include "srcpos.h"
- #include "dtc-parser.tab.h"
- 
--YYLTYPE yylloc;
- extern bool treesource_error;
- 
- /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
--- 
-2.29.2
-
diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
index 29fa6ee6..4028a7a9 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2020.01.bb
@@ -1,9 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r23"
+PR = "r24"
 
 BRANCH = "ti-u-boot-2020.01"
 
-SRCREV = "3c9ebdb87d65aacc4ec302be8bef3df15364bacd"
-
-SRC_URI += "file://0001-Remove-redundant-YYLOC-global-declaration.patch"
+SRCREV = "4bd43879837910eaf0bf45af7ec5ddfaca203ff4"
-- 
2.17.1

