Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.55.1598290259746227244
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 15ECA40C5A;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lpxcuxN0ZWVG; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F331B40A55;
	Mon, 24 Aug 2020 17:30:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 111A217446E;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 05/14] Revert "HACK: ipumm: Temporary work-around for linker error with XDC tools upgrade"
Date: Mon, 24 Aug 2020 13:30:40 -0400
Message-Id: <1598290249-23943-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 33b0e937b77894e0402d42e3798f48309a03fdce.
---
 ...01-HACK-ipumm-Workaround-for-linker-error.patch | 48 ----------------------
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  6 +--
 2 files changed, 1 insertion(+), 53 deletions(-)
 delete mode 100644 recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch

diff --git a/recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch b/recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch
deleted file mode 100644
index 0bea358..0000000
--- a/recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 7226700841c62e6a42690eaa8b3e31b2c329b341 Mon Sep 17 00:00:00 2001
-From: Ramprasad N <x0038811@ti.com>
-Date: Thu, 28 May 2020 09:53:59 +0530
-Subject: [PATCH] HACK: ipumm: Workaround for linker error
-
-* HACK: ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E is no longer
-* defined with latest XDC tools. To temporarily get around the issue
-* until the real fix can be made, dummy defination of the missing function
-* is added in ipu_main.c
-
-*IPUMM dependent tool chain components are upgraded to latest version
-* BIOS : 6_82_01_17_eng
-* XDC  : 3_61_00_16_core
-* This issue is seen only with xdc tools upgrade.
-
-Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
-Signed-off-by: Ramprasad N <x0038811@ti.com>
----
- platform/ti/dce/baselib/ipumm_main.c | 13 +++++++++++++
- 1 file changed, 13 insertions(+)
-
-diff --git a/platform/ti/dce/baselib/ipumm_main.c b/platform/ti/dce/baselib/ipumm_main.c
-index 76ccd34..f4ca6e5 100644
---- a/platform/ti/dce/baselib/ipumm_main.c
-+++ b/platform/ti/dce/baselib/ipumm_main.c
-@@ -50,6 +50,19 @@
- #include <string.h>
- #include <stdlib.h>
- 
-+/*
-+ * HACK: ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E is no longer
-+ * defined with latest XDC tools. To temporarily get around the issue
-+ * until the real fix can be made, define the missing function
-+ * here.
-+ */
-+extern ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__F(xdc_Int state);
-+
-+/* Module_startup */
-+xdc_Int ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E( xdc_Int state )
-+{
-+    return ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__F(state);
-+}
- 
- /* Legacy function to allow Linux side rpmsg sample tests to work: */
- extern void start_ping_tasks();
--- 
-1.9.1
-
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index e53d0a9..4f6ae89 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -15,14 +15,10 @@ SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
 SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 
-SRC_URI += " \
-	           file://0001-HACK-ipumm-Workaround-for-linker-error.patch \
-	     "
-
 S = "${WORKDIR}/git"
 
 PV = "3.00.15.00"
-PR = "r6"
+PR = "r5"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
2.7.4

