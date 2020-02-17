Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.13210.1581964975442013612
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 10:42:55 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50039E01734; Mon, 17 Feb 2020 10:42:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00F51E01732
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 10:42:53 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4AE2340BFD;
	Mon, 17 Feb 2020 18:42:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_zF7_q8serl; Mon, 17 Feb 2020 18:42:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D32BC4006B;
	Mon, 17 Feb 2020 18:42:51 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 264F5174406;
	Mon, 17 Feb 2020 13:42:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] multiprocmgr: update to latest, drop upstreamed patches
Date: Mon, 17 Feb 2020 13:42:51 -0500
Message-Id: <1581964971-44914-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-test_git.bb   |  7 ------
 recipes-ti/multiprocmgr/multiprocmgr.inc           |  4 ++--
 ...on-t-hardcode-kernel-s-uapi-location-keys.patch | 27 ---------------------
 ...on-t-suppress-kernel-linux-types.h-inclus.patch | 28 ----------------------
 recipes-ti/multiprocmgr/multiprocmgr_git.bb        |  2 --
 5 files changed, 2 insertions(+), 66 deletions(-)
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch
 delete mode 100644 recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
index aab8ae6..7c3f9e1 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-test_git.bb
@@ -1,14 +1,7 @@
-FILESEXTRAPATHS_prepend := "${THISDIR}/multiprocmgr:"
-
 SUMMARY = "TI Multiproc Manager test code"
 
 include multiprocmgr.inc
 
-SRC_URI += " \
-	file://0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch \
-	file://0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch \
-"
-
 PR = "${INC_PR}.2"
 
 DEPENDS = "multiprocmgr cmem"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr.inc b/recipes-ti/multiprocmgr/multiprocmgr.inc
index 40a20af..64fb6f6 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr.inc
+++ b/recipes-ti/multiprocmgr/multiprocmgr.inc
@@ -9,10 +9,10 @@ MULTIPROCMGR_GIT_PROTOCOL = "git"
 MULTIPROCMGR_GIT_BRANCH = "master"
 
 # The following commits correspond to DEV.MPM-3.00.05.00
-MULTIPROCMGR_SRCREV = "f7fb3b7c21b3f6dd8b4adeef5df5be1824b9be73"
+MULTIPROCMGR_SRCREV = "810d8a31c797d07abe808cb3fa89465fa934d4dd"
 
 PV = "3.0.5.0"
-INC_PR = "r0"
+INC_PR = "r1"
 
 BRANCH = "${MULTIPROCMGR_GIT_BRANCH}"
 SRC_URI = "${MULTIPROCMGR_GIT_URI};protocol=${MULTIPROCMGR_GIT_PROTOCOL};branch=${BRANCH}"
diff --git a/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch b/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch
deleted file mode 100644
index 25deedc..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 17c307ff6e67af43f243366baa2ccc01f89cdddd Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Mon, 23 Apr 2018 15:35:44 -0400
-Subject: [PATCH] mpmdlif.c: don't hardcode kernel's "uapi" location
- keystone_remoteproc.h
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- src/daemon/mpmdlif.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/daemon/mpmdlif.c b/src/daemon/mpmdlif.c
-index 0c31604..d287bbc 100644
---- a/src/daemon/mpmdlif.c
-+++ b/src/daemon/mpmdlif.c
-@@ -47,7 +47,7 @@
- #include <stdint.h>
- 
- #define _LINUX_TYPES_H
--#include "uapi/linux/keystone_remoteproc.h"
-+#include "linux/keystone_remoteproc.h"
- #include "internal/rsc_types.h"
- //#include <elf.h>
- // #define LOADER_DEBUG
--- 
-2.7.4
-
diff --git a/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch b/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch
deleted file mode 100644
index c3315cf..0000000
--- a/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 95921ccf77ae037bb3b95f45a632f60975c6c9bb Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 11 Feb 2020 17:03:18 -0500
-Subject: [PATCH] mpmdlif.c: don't suppress kernel <linux/types.h> inclusion
-
-Defining _LINUX_TYPES_H before including <linux/keystone_remoteproc.h> causes
-<linux/types.h> to skip defining kernel types, resulting in undefined __u32
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- src/daemon/mpmdlif.c | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/src/daemon/mpmdlif.c b/src/daemon/mpmdlif.c
-index 0c31604..1abd00f 100644
---- a/src/daemon/mpmdlif.c
-+++ b/src/daemon/mpmdlif.c
-@@ -46,7 +46,6 @@
- #include <byteswap.h>
- #include <stdint.h>
- 
--#define _LINUX_TYPES_H
- #include "linux/keystone_remoteproc.h"
- #include "internal/rsc_types.h"
- //#include <elf.h>
--- 
-2.7.4
-
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index b3479fb..0751260 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -5,8 +5,6 @@ include multiprocmgr.inc
 
 SRC_URI += " \
 	file://mpmsrv-daemon.service \
-	file://0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch \
-	file://0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch \
 "
 
 PR = "${INC_PR}.2"
-- 
2.7.4

