Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B49BEC77B61
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 12:52:58 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.92965.1682945568277092035
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 05:52:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CpWLE9Dk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 341Cqk5x058442;
	Mon, 1 May 2023 07:52:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1682945566;
	bh=3awDAAnsZm5V/zQL3qBMy9GWGYR8di38FRYnFY8EhWA=;
	h=From:To:Subject:Date;
	b=CpWLE9DkqY5feb3Wb7+pBlzK6DqSjxTT6RicBwzNWaZZBLp5QIdsXkhw0BWeNJTtW
	 8M2o4KLmlXtYOXKxeGQNuq+LiXMx0zHYshfcoihIzFGQGQ/ir3Ide3sEB59enk8reb
	 QZqqMDpX7TzsRoMTQxe7V5/h0bTXq5Bm3iBzySbY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 341CqkpY017999
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 1 May 2023 07:52:46 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 1
 May 2023 07:52:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 1 May 2023 07:52:45 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 341CqjP0073736;
	Mon, 1 May 2023 07:52:45 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ptT1J-0000VB-Na; Mon, 01 May 2023 07:52:45 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][kirkstone][PATCH v2] ti-ipc: Stop looking for rpmsg_rpc.h in the kernel
Date: Mon, 1 May 2023 07:52:45 -0500
Message-ID: <20230501125245.1888-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 May 2023 12:52:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16463

Stop looking for the rpmsg_rpc.h in the kernel.  While we are doing the
LTS migration for kirkstone, this file is not going to be in the kernel
for a bit.  This patch works in conjunction with a recipe change that
downloads the header and adds a -I to the CFLAGS to pick it up.  This
will be removed once the 6.1 kernel has been updated.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Added missing space to SRC_URI:append.

 ...ooking-for-rpmsg_rpc.h-in-the-kernel.patch | 35 +++++++++++++++++++
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb      |  6 ++++
 2 files changed, 41 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
new file mode 100644
index 00000000..ef12af88
--- /dev/null
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
@@ -0,0 +1,35 @@
+From 66ca0e732c2e287814d4fc5082b818554ee42398 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Fri, 28 Apr 2023 14:30:59 -0500
+Subject: [PATCH] MmRpc: Stop looking for rpmsg_rpc.h in the kernel
+
+Stop looking for the rpmsg_rpc.h in the kernel.  While we are doing the
+LTS migration for kirkstone, this file is not going to be in the kernel
+for a bit.  This patch works in conjunction with a recipe change that
+downloads the header and adds a -I to the CFLAGS to pick it up.  This
+will be removed once the 6.1 kernel has been updated.
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+
+Upstream-Status: Inappropriate [other]
+
+---
+ packages/ti/ipc/mm/MmRpc.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/packages/ti/ipc/mm/MmRpc.c b/packages/ti/ipc/mm/MmRpc.c
+index 2df7420..10f496b 100644
+--- a/packages/ti/ipc/mm/MmRpc.c
++++ b/packages/ti/ipc/mm/MmRpc.c
+@@ -64,7 +64,7 @@
+ #define linux_include(kd,m) <kd/include/uapi/linux/m.h>
+ #endif
+ 
+-#include linux_include(KERNEL_INSTALL_DIR,rpmsg_rpc)
++#include "linux/rpmsg_rpc.h"
+ 
+ #ifdef _linux_
+ #define linux _linux
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
index 01b857c2..e2db6efd 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -8,12 +8,18 @@ PR = "${INC_PR}.2"
 
 DEPENDS += "virtual/kernel"
 
+SRC_URI:append = " https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/plain/include/uapi/linux/rpmsg_rpc.h?h=ti-linux-5.10.y;name=rpmsg_rpc;subdir=linux;downloadfilename=rpmsg_rpc.h"
+SRC_URI[rpmsg_rpc.sha256sum] = "cd237f40a37520a1f2df19fbfeefd00c0a5ad68efeaba9ba0fba60ca16ea09be"
+
 SRC_URI += "file://tiipclad-daemon.sh \
             file://omap_remoteproc.conf \
             file://tiipclad-daemon.service \
             file://0001-Add-kernel-build-dir.patch \
+            file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch \
            "
 
+CFLAGS += "-I${WORKDIR}"
+
 DAEMON = "UNKNOWN"
 DAEMON:dra7xx = "lad_dra7xx"
 DAEMON:omapl138 = "lad_omapl138"
-- 
2.17.1


