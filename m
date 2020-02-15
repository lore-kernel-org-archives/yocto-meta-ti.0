Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.4366.1581801217356032211
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 15 Feb 2020 13:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CE2B0E0172D; Sat, 15 Feb 2020 13:13:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6FB6E00C29
	for <meta-ti@yoctoproject.org>; Sat, 15 Feb 2020 13:13:35 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E42A540C2E;
	Sat, 15 Feb 2020 21:13:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rzDEsLZZOvy; Sat, 15 Feb 2020 21:13:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C7A0940C21;
	Sat, 15 Feb 2020 21:13:33 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 161DB174405;
	Sat, 15 Feb 2020 16:13:33 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] gdbc6x: suppress gcc9 -Wstringop-truncation warning
Date: Sat, 15 Feb 2020 16:13:32 -0500
Message-Id: <1581801212-50695-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

It's an old bfd/coff code, will need to be updated in the future.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...bbfd.h-suppress-GCC9-Wstringop-truncation.patch | 28 ++++++++++++++++++++++
 recipes-devtools/gdbc6x/gdbc6x_git.bb              |  1 +
 2 files changed, 29 insertions(+)
 create mode 100644 recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch

diff --git a/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch b/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
new file mode 100644
index 0000000..1cc23b3
--- /dev/null
+++ b/recipes-devtools/gdbc6x/gdbc6x/0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch
@@ -0,0 +1,28 @@
+From 0aa294e2bbd37a42266e59cb67687e57bfba4a88 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Sat, 15 Feb 2020 15:59:37 -0500
+Subject: [PATCH] libbfd.h: suppress GCC9 -Wstringop-truncation
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gdbc6x/bfd/libbfd.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/gdbc6x/bfd/libbfd.h b/gdbc6x/bfd/libbfd.h
+index 72d3c50..3465f89 100644
+--- a/gdbc6x/bfd/libbfd.h
++++ b/gdbc6x/bfd/libbfd.h
+@@ -34,6 +34,10 @@
+ #pragma GCC diagnostic ignored "-Wcast-function-type"
+ #endif
+ 
++#if __GNUC__ >= 9
++#pragma GCC diagnostic ignored "-Wstringop-truncation"
++#endif
++
+ #include "hashtab.h"
+ 
+ /* Align an address upward to a boundary, expressed as a number of bytes.
+-- 
+2.7.4
+
diff --git a/recipes-devtools/gdbc6x/gdbc6x_git.bb b/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 8ab9cf9..2d2f6c1 100644
--- a/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -11,6 +11,7 @@ PR = "${INC_PR}.1"
 
 SRC_URI_append = " \
     file://init \
+    file://0001-libbfd.h-suppress-GCC9-Wstringop-truncation.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/gdbc6x"
-- 
2.7.4

