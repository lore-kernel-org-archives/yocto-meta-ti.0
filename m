Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F416CC7EE2F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 16:42:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.26997.1684255348412809323
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 09:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TVR4OXkM;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgQeg075842;
	Tue, 16 May 2023 11:42:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684255346;
	bh=MXNy+NdVW3HNot4NWQiUIWnVj/31e6rOLX9BnOKPx8Y=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=TVR4OXkMD7oTaF9HGIdZ6YbqtjcBlSeoxtYuMQcovkThvM/aeSu+WpezPD3N8/6bs
	 YW3aLkPAhw0oe+znWRcS9PdKPhe7sKTljVChgUVDvpflUk//YRU4ASHGMoroa4te1q
	 Fj8U1G9tyYZSA4KxZ42MqqTnF0vdfcJgM7FBEpM8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GGgQcB005882
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 11:42:26 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 11:42:26 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 11:42:26 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GGgQCW004055;
	Tue, 16 May 2023 11:42:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyxkn-0003Di-Ut; Tue, 16 May 2023 11:42:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 4/8] ti-ipc: Stop looking for rpmsg_rpc.h in the kernel
Date: Tue, 16 May 2023 11:42:21 -0500
Message-ID: <20230516164225.12311-5-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230516164225.12311-1-reatmon@ti.com>
References: <20230516164225.12311-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 16:42:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16542

Stop looking for the rpmsg_rpc.h in the kernel.  While we are doing the
LTS migration for kirkstone, this file is not going to be in the kernel
for a bit.  This patch works in conjunction with a recipe change that
downloads the header and adds a -I to the CFLAGS to pick it up.  This
will be removed once the 6.1 kernel has been updated.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
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


