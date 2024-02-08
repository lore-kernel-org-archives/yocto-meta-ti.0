Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E479C4829E
	for <webhook@archiver.kernel.org>; Thu,  8 Feb 2024 18:54:57 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.3445.1707418488301419853
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 08 Feb 2024 10:54:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=G1kwCpVf;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 418Isk5t046205;
	Thu, 8 Feb 2024 12:54:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707418487;
	bh=50wSt08PWmslKIY/NHjoHf9WP00QCE93fuASyIAkag4=;
	h=From:To:Subject:Date;
	b=G1kwCpVf/DcmQD1zz8drxwj+1Hwzgdpr0qeZrLTx6a4/QFS6ej2ca6S95qDt4LmH9
	 jdyEpY6qrL6Fm5D/jLG2WPko5sRHm8Dx4YqPvNCwwtQYpgwMQ83aXxgeJ4kE+Zg7tX
	 Uo6P26DR4FNpJ8oc/p1tg7iKZDuFtY7zu2iELqLo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 418IskAO023291
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Feb 2024 12:54:46 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Feb 2024 12:54:46 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Feb 2024 12:54:46 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 418IskwX125258;
	Thu, 8 Feb 2024 12:54:46 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rY9Xq-0000X3-Fv; Thu, 08 Feb 2024 12:54:46 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] gdbc6x: Fix kernel module to work on 6.6+
Date: Thu, 8 Feb 2024 12:54:45 -0600
Message-ID: <20240208185446.1999-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 08 Feb 2024 18:54:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17458

The "upstream" is not maintained, but this is an easy patch to get this
working again.  Still need to watch this for big breakages and rethink
supporting this recipe at that time.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Change Upstream-Status to Inactive-Upstream

 .../0002-Support-Linux-kernels-v6.6.patch     | 31 +++++++++++++++++++
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  5 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
new file mode 100644
index 00000000..1e897394
--- /dev/null
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv/0002-Support-Linux-kernels-v6.6.patch
@@ -0,0 +1,31 @@
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 08 Feb 2024 10:43:00 -0500
+Subject: [PATCH] Support Linux kernels v6.6+
+
+gdb_write arg changed from int to unsigned int
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ kernel_module/gdbproxy-mod/gdbserverproxy.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/kernel_module/gdbproxy-mod/gdbserverproxy.c b/kernel_module/gdbproxy-mod/gdbserverproxy.c
+index 418b6db..4b1c676 100644
+--- a/kernel_module/gdbproxy-mod/gdbserverproxy.c
++++ b/kernel_module/gdbproxy-mod/gdbserverproxy.c
+@@ -496,8 +496,13 @@ static void gdb_close(struct tty_struct *tty, struct file *filp)
+  * 
+  *
+  */
++#if (LINUX_VERSION_CODE >= KERNEL_VERSION(6,6,0))
++static int gdb_write(struct tty_struct *tty,
++        const unsigned char *buf, unsigned int count)
++#else
+ static int gdb_write(struct tty_struct *tty,
+         const unsigned char *buf, int count)
++#endif
+ {
+      struct dsp_session *dsp = tty->driver_data;
+      int ret = 0;
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 60492f81..b68c4463 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -7,7 +7,10 @@ MACHINE_KERNEL_PR:append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 PV:append = "+git${SRCPV}"
 
-SRC_URI:append = " file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.."
+SRC_URI:append = "\
+    file://0001-Support-Linux-kernels-v5.15.patch;patchdir=../.. \
+    file://0002-Support-Linux-kernels-v6.6.patch;patchdir=../.. \
+"
 
 S = "${WORKDIR}/git/kernel_module/gdbproxy-mod"
 
-- 
2.17.1


