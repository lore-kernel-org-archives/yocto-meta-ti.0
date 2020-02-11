Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.17477.1581459564950437638
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Feb 2020 14:19:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 140.211.169.56, mailfrom: denis@denix.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85340E016D6; Tue, 11 Feb 2020 14:19:24 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D42EE013AE
	for <meta-ti@yoctoproject.org>; Tue, 11 Feb 2020 14:19:22 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B0D9240C1C;
	Tue, 11 Feb 2020 22:19:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EeNuXV3VuKIR; Tue, 11 Feb 2020 22:19:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8702E40BCC;
	Tue, 11 Feb 2020 22:19:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3F8B01743F8;
	Tue, 11 Feb 2020 17:19:18 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>,
	Suman Anna <s-anna@ti.com>,
	Sam Nelson <sam.nelson@ti.com>
Subject: [zeus/master][PATCH] multiprocmgr: do not mix kernel and user-space headers, fully depend on uapi
Date: Tue, 11 Feb 2020 17:19:12 -0500
Message-Id: <1581459552-49195-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

As multiprocmgr is a user-space app and should only use uapi headers, drop
extra -I for the kernel headers. Patch out any assumptions of direct access
to the kernel headers.

Cc: Suman Anna <s-anna@ti.com>
Cc: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...on-t-suppress-kernel-linux-types.h-inclus.patch | 28 ++++++++++++++++++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb        |  3 +--
 2 files changed, 29 insertions(+), 2 deletions(-)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch

diff --git a/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch b/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch
new file mode 100644
index 0000000..c3315cf
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch
@@ -0,0 +1,28 @@
+From 95921ccf77ae037bb3b95f45a632f60975c6c9bb Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 11 Feb 2020 17:03:18 -0500
+Subject: [PATCH] mpmdlif.c: don't suppress kernel <linux/types.h> inclusion
+
+Defining _LINUX_TYPES_H before including <linux/keystone_remoteproc.h> causes
+<linux/types.h> to skip defining kernel types, resulting in undefined __u32
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ src/daemon/mpmdlif.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/daemon/mpmdlif.c b/src/daemon/mpmdlif.c
+index 0c31604..1abd00f 100644
+--- a/src/daemon/mpmdlif.c
++++ b/src/daemon/mpmdlif.c
+@@ -46,7 +46,6 @@
+ #include <byteswap.h>
+ #include <stdint.h>
+ 
+-#define _LINUX_TYPES_H
+ #include "linux/keystone_remoteproc.h"
+ #include "internal/rsc_types.h"
+ //#include <elf.h>
+-- 
+2.7.4
+
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 6143341..aea2445 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -6,6 +6,7 @@ include multiprocmgr.inc
 SRC_URI += " \
 	file://mpmsrv-daemon.service \
 	file://0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch \
+	file://0001-mpmdlif.c-don-t-suppress-kernel-linux-types.h-inclus.patch \
 "
 
 PR = "${INC_PR}.2"
@@ -14,8 +15,6 @@ DEPENDS = "mpm-transport libdaemon virtual/kernel cmem"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CC += "-I${STAGING_KERNEL_DIR}/include -I${STAGING_KERNEL_DIR}/include/uapi"
-
 INITSCRIPT_NAME = "mpmsrv-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
 
-- 
2.7.4

