Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B915C6FD18
	for <webhook@archiver.kernel.org>; Tue, 18 Apr 2023 16:59:44 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.15175.1681837180640771225
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Apr 2023 09:59:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=tgen7LT3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33IGxdlH092974;
	Tue, 18 Apr 2023 11:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681837179;
	bh=Jq+8ANyMP4mxzv8oB+RaxRjOSjJe0kKx/yh9kjUNXUA=;
	h=From:To:CC:Subject:Date;
	b=tgen7LT3C3Nena3UmX0/T87ISUyClGEP8iwEmHIDCFFXyjBdqxe0WVjBnsT7o37Td
	 iDQ+9hbd2P8dkMX8opi1bzDgm8zVJodisENcDPwK0Anp0HcGPWcwn7MidCCmKEdr11
	 pbcGYlsqyBPfH5lfZ2Zuh0lXP/vVDdBbf49UfIbQ=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33IGxd5K040741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 18 Apr 2023 11:59:39 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 18
 Apr 2023 11:59:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 18 Apr 2023 11:59:39 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33IGxcLY018250;
	Tue, 18 Apr 2023 11:59:38 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] gdbc6x: Fix kernel module to work on v5.15+
Date: Tue, 18 Apr 2023 11:59:38 -0500
Message-ID: <20230418165938.21313-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 18 Apr 2023 16:59:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16407

Small changes, the "upstream" doesn't look to be maintained anymore,
so if we get any more breaks it might be time to remove this recipe.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../0001-Support-Linux-kernels-v5.15.patch    | 41 +++++++++++++++++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  2 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch
new file mode 100644
index 00000000..108a7081
--- /dev/null
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0001-Support-Linux-kernels-v5.15.patch
@@ -0,0 +1,41 @@
+From 7e6e1312629f9bc7a24871f7f395f2d288a1758f Mon Sep 17 00:00:00 2001
+From: Andrew Davis <afd@ti.com>
+Date: Tue, 18 Apr 2023 11:38:54 -0500
+Subject: [PATCH] Support Linux kernels v5.15+
+
+put_tty_driver was removed and write_room return type has changed.
+
+Function tty_driver_kref_put has been around a while, so no need
+to do a kernel version check.
+
+Upstream-Status: Pending
+Signed-off-by: Andrew Davis <afd@ti.com>
+---
+ kernel_module/gdbproxy-mod/gdbserverproxy.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/kernel_module/gdbproxy-mod/gdbserverproxy.c b/kernel_module/gdbproxy-mod/gdbserverproxy.c
+index 418b6db..4b1c676 100644
+--- a/kernel_module/gdbproxy-mod/gdbserverproxy.c
++++ b/kernel_module/gdbproxy-mod/gdbserverproxy.c
+@@ -540,7 +540,11 @@ static int gdb_write(struct tty_struct *tty,
+  * 
+  *
+  */
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(5,15,0))
++static unsigned int gdb_write_room(struct tty_struct *tty)
++#else
+ static int gdb_write_room(struct tty_struct *tty)
++#endif
+ {
+      return GDB_STR_SIZE;
+ }
+@@ -914,7 +918,7 @@ static int __init gdb_dev_init(void)
+      if (ret < 0) {
+ 
+           printk(KERN_ERR "Couldn't register gdbtty driver.\n");
+-          put_tty_driver(tty_gdb_driver);
++          tty_driver_kref_put(tty_gdb_driver);
+           return ret;
+      }
+ 
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index cb9e4c24..60492f81 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -7,6 +7,8 @@ MACHINE_KERNEL_PR:append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 PV:append = "+git${SRCPV}"
 
+SRC_URI:append = " file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.."
+
 S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
 
 inherit module
-- 
2.39.2


