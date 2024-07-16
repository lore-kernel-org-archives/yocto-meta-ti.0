Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D3EC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 19:45:46 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.5733.1721159136738561736
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 12:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n35HhVi4;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46GJjXwq130433;
	Tue, 16 Jul 2024 14:45:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1721159133;
	bh=8R0EdGtnn/mCkLw2dWuh8ivcTNnzlIAFKKxBL6F9m+E=;
	h=From:To:Subject:Date;
	b=n35HhVi4xOZvvYOe1KmBaZFWxqKa4i8zbZGVACc5a1eA277eR7lc9hjk0cUTpLgB5
	 1JzQcStKjJRXQeywUcE1TIlyKpCBAr0PYWdaMx+IhYQBGttcEeIJVrZAIownSH4gu3
	 zwXPwBZ6BJUALV9MYEY6QrG8CA43g8jawhgKdGlo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46GJjXmK087583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Jul 2024 14:45:33 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Jul 2024 14:45:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Jul 2024 14:45:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46GJjWsc093069;
	Tue, 16 Jul 2024 14:45:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sTo7A-0006um-IK; Tue, 16 Jul 2024 14:45:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-ipc: Fix "buildpaths" QA error
Date: Tue, 16 Jul 2024 14:45:32 -0500
Message-ID: <20240716194532.26124-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Jul 2024 19:45:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17868

Referring to the TI specific kernel header file via -I${UNPACKDIR}
causes a "buildpaths" QA error.  Solution is to copy the file from
UNPACKDIR into the S dir at the start of each compile, and then fix the
patch to make sure the #include is correct for this new location.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...1-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch | 2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb                    | 6 ++++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
index 522ad5e4..6d84cfb4 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc/0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch
@@ -26,7 +26,7 @@ index 2df7420..10f496b 100644
  #endif
 
 -#include linux_include(KERNEL_INSTALL_DIR,rpmsg_rpc)
-+#include "linux/rpmsg_rpc.h"
++#include "rpmsg_rpc.h"
 
  #ifdef _linux_
  #define linux _linux
diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
index 11be09ea..e12ce273 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -18,8 +18,6 @@ SRC_URI += "file://tiipclad-daemon.sh \
             file://0001-MmRpc-Stop-looking-for-rpmsg_rpc.h-in-the-kernel.patch \
            "
 
-CFLAGS += "-I${UNPACKDIR}"
-
 DAEMON = "UNKNOWN"
 DAEMON:dra7xx = "lad_dra7xx"
 DAEMON:omapl138 = "lad_omapl138"
@@ -40,6 +38,10 @@ do_configure() {
     oe_runconf
 }
 
+do_compile:prepend() {
+    cp ${UNPACKDIR}/linux/rpmsg_rpc.h ${S}/packages/ti/ipc/mm/rpmsg_rpc.h
+}
+
 do_install:append() {
     install -d ${D}${sysconfdir}/init.d/
 
-- 
2.17.1


