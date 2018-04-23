Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6BA6E008BF; Mon, 23 Apr 2018 12:59:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 311 seconds by postgrey-1.32 at yocto-www;
	Mon, 23 Apr 2018 12:59:03 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B9B3BE00529
	for <meta-ti@yoctoproject.org>; Mon, 23 Apr 2018 12:59:03 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1062B20B6A;
	Mon, 23 Apr 2018 19:53:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id WowXSZrMphG4; Mon, 23 Apr 2018 19:53:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E052E2079D;
	Mon, 23 Apr 2018 19:53:50 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 5633E163440;
	Mon, 23 Apr 2018 15:53:50 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 23 Apr 2018 15:53:50 -0400
Message-Id: <1524513230-34660-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] multiprocmgr: don't hardcode "uapi" kernel location
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Apr 2018 19:59:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

This way keystone_remoteproc.h can also be found in sysroots, when available.
Otherwise it can fall back to using kernel sources directly.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...on-t-hardcode-kernel-s-uapi-location-keys.patch | 27 ++++++++++++++++++++++
 recipes-ti/multiprocmgr/multiprocmgr_git.bb        |  9 +++++---
 2 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch

diff --git a/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch b/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch
new file mode 100644
index 0000000..25deedc
--- /dev/null
+++ b/recipes-ti/multiprocmgr/multiprocmgr/0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch
@@ -0,0 +1,27 @@
+From 17c307ff6e67af43f243366baa2ccc01f89cdddd Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Mon, 23 Apr 2018 15:35:44 -0400
+Subject: [PATCH] mpmdlif.c: don't hardcode kernel's "uapi" location
+ keystone_remoteproc.h
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ src/daemon/mpmdlif.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/daemon/mpmdlif.c b/src/daemon/mpmdlif.c
+index 0c31604..d287bbc 100644
+--- a/src/daemon/mpmdlif.c
++++ b/src/daemon/mpmdlif.c
+@@ -47,7 +47,7 @@
+ #include <stdint.h>
+ 
+ #define _LINUX_TYPES_H
+-#include "uapi/linux/keystone_remoteproc.h"
++#include "linux/keystone_remoteproc.h"
+ #include "internal/rsc_types.h"
+ //#include <elf.h>
+ // #define LOADER_DEBUG
+-- 
+2.7.4
+
diff --git a/recipes-ti/multiprocmgr/multiprocmgr_git.bb b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
index 053a04e..f37b97e 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr_git.bb
@@ -3,15 +3,18 @@ SUMMARY = "Provides download, debug and other utilities for other cores in the S
 
 include multiprocmgr.inc
 
-SRC_URI_append = " file://mpmsrv-daemon.service"
+SRC_URI += " \
+	file://mpmsrv-daemon.service \
+	file://0001-mpmdlif.c-don-t-hardcode-kernel-s-uapi-location-keys.patch \
+"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS = "mpm-transport libdaemon virtual/kernel cmem"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CC += "-I${STAGING_KERNEL_DIR}/include"
+CC += "-I${STAGING_KERNEL_DIR}/include -I${STAGING_KERNEL_DIR}/include/uapi"
 
 INITSCRIPT_NAME = "mpmsrv-daemon.sh"
 INITSCRIPT_PARAMS = "defaults 10"
-- 
2.7.4


