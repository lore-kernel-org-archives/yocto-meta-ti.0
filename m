Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0653C3ABA2
	for <webhook@archiver.kernel.org>; Mon, 16 Sep 2024 16:09:05 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.12619.1726502940920192129
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Sep 2024 09:09:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qusrXdFm;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48GG90e9126525;
	Mon, 16 Sep 2024 11:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726502940;
	bh=JP0IjqeYfo/NtmoL7HLP2zqqrU/jB5U3mMQZMwhvKIg=;
	h=From:To:Subject:Date;
	b=qusrXdFmWwDZbULLIajsxlpXQuoTVR1ORAUyjPSIYOElvh7IHu1bRpXBhbLzEdHYA
	 sGRjy5v7DdFFE5Me8jrfh6FrLMPZKM+4I6uXzPj8JL+tDlJzVRNfpTUIw2KjFNW+bM
	 /GK6/nfjsAQPS4H0CFRerycbtOFE8wSCGX4KtrMo=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48GG90bP015623
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Sep 2024 11:09:00 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Sep 2024 11:08:59 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Sep 2024 11:08:59 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48GG8xrv126870;
	Mon, 16 Sep 2024 11:08:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sqEHb-0002sA-JA; Mon, 16 Sep 2024 11:08:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH v2] linux: Remove two 6.6 reproducibility patches
Date: Mon, 16 Sep 2024 11:08:59 -0500
Message-ID: <20240916160859.10821-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Sep 2024 16:09:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17966

The upcoming SRCREV change to the linux-ti 6.6 kernel version no longer
needs these two patches, and they are blocking the CICD promotion being
in place.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Cleaned up grammar in commit message.

 ..._registry-fix-reproducibility-issues.patch | 46 ----------------
 ...-pnmtologo-use-relocatable-file-name.patch | 55 -------------------
 .../recipes-kernel/linux/ti-kernel.inc        |  2 -
 3 files changed, 103 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-lib-build_OID_registry-fix-reproducibility-issues.patch
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-pnmtologo-use-relocatable-file-name.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-lib-build_OID_registry-fix-reproducibility-issues.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-lib-build_OID_registry-fix-reproducibility-issues.patch
deleted file mode 100644
index 75477ef8..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/0001-lib-build_OID_registry-fix-reproducibility-issues.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From 2fca0fd719812ea2ff67630b01355aa80481623e Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Sun, 10 Jul 2022 22:56:53 -0400
-Subject: [PATCH] lib/build_OID_registry: fix reproducibility issues
-
-The script build_OID_registry captures the full path of itself
-in the generated data. This causes reproduciblity issues as the
-path is captured and packaged.
-
-We use the basename of the script instead, and that allows us
-to be reprodicible, with slightly less information captured in
-the output data (but the generating script can still easily
-be found).
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- lib/build_OID_registry | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/lib/build_OID_registry b/lib/build_OID_registry
-index d7fc32ea8ac2..f6de0a7f7457 100755
---- a/lib/build_OID_registry
-+++ b/lib/build_OID_registry
-@@ -8,6 +8,7 @@
- #
-
- use strict;
-+use File::Basename;
-
- my @names = ();
- my @oids = ();
-@@ -35,7 +36,7 @@ close IN_FILE || die;
- #
- open C_FILE, ">$ARGV[1]" or die;
- print C_FILE "/*\n";
--print C_FILE " * Automatically generated by ", $0, ".  Do not edit\n";
-+print C_FILE " * Automatically generated by ", basename $0, ".  Do not edit\n";
- print C_FILE " */\n";
-
- #
---
-2.25.1
diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-pnmtologo-use-relocatable-file-name.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-pnmtologo-use-relocatable-file-name.patch
deleted file mode 100644
index bfc081fa..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/files/0001-pnmtologo-use-relocatable-file-name.patch
+++ /dev/null
@@ -1,55 +0,0 @@
-From a40d2daf2795d89e3ef8af0413b25190558831ec Mon Sep 17 00:00:00 2001
-From: Bruce Ashfield <bruce.ashfield@gmail.com>
-Date: Thu, 14 Jul 2022 14:43:46 -0400
-Subject: [PATCH] pnmtologo: use relocatable file name
-
-The logo generation utility is capturing the source of the logo
-in the generated .c file. The source file is absolute (as passed
-by make), so the full path is captured.
-
-This makes the source fail reproducibility tests.
-
-We use basename() to just get the source file name, and use
-that in the generated .c file.
-
-Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- drivers/video/logo/pnmtologo.c | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
-index ada5ef6e51b7..7527be845443 100644
---- a/drivers/video/logo/pnmtologo.c
-+++ b/drivers/video/logo/pnmtologo.c
-@@ -13,7 +13,7 @@
- #include <stdlib.h>
- #include <string.h>
- #include <unistd.h>
--
-+#include <libgen.h>
-
- static const char *programname;
- static const char *filename;
-@@ -223,6 +223,7 @@ static inline int is_equal(struct color c1, struct color c2)
-
- static void write_header(void)
- {
-+	char *filename_basename = basename(filename);
-	/* open logo file */
-	if (outputname) {
-		out = fopen(outputname, "w");
-@@ -235,7 +236,7 @@ static void write_header(void)
-	fputs("/*\n", out);
-	fputs(" *  DO NOT EDIT THIS FILE!\n", out);
-	fputs(" *\n", out);
--	fprintf(out, " *  It was automatically generated from %s\n", filename);
-+	fprintf(out, " *  It was automatically generated from %s\n", filename_basename);
-	fputs(" *\n", out);
-	fprintf(out, " *  Linux logo %s\n", logoname);
-	fputs(" */\n\n", out);
---
-2.25.1
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
index 4cd5886a..4bcbc27e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc
@@ -21,9 +21,7 @@ KERNEL_PATCHES:bsp-mainline = " \
 "
 
 KERNEL_PATCHES:bsp-ti-6_6 = " \
-    file://0001-lib-build_OID_registry-fix-reproducibility-issues.patch \
     file://0001-vt-conmakehash-improve-reproducibility.patch \
-    file://0001-pnmtologo-use-relocatable-file-name.patch \
 "
 
 SRC_URI:append = " ${KERNEL_PATCHES} "
-- 
2.17.1


