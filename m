Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.24551.1617408631560891828
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 10E9640C92;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I0mrzDDWtugx; Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E679940C5E;
	Sat,  3 Apr 2021 00:10:28 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CCC5117457A;
	Fri,  2 Apr 2021 20:10:27 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Suman Anna <s-anna@ti.com>
Subject: [master][PATCH 02/11] ti-ipc-examples: fix deprecation of sys_errlist[] in glibc
Date: Fri,  2 Apr 2021 20:09:54 -0400
Message-Id: <1617408603-2482-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

It was giving this warning for years, finally gone:
| warning: `sys_errlist' is deprecated; use `strerror' or `strerror_r' instead

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Cc: Suman Anna <s-anna@ti.com>
---
 ...usterMgr-sys_errlist-has-been-deprecated-.patch | 40 ++++++++++++++++++++++
 recipes-ti/ipc/ti-ipc-examples-linux_git.bb        |  2 ++
 2 files changed, 42 insertions(+)
 create mode 100644 recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch

diff --git a/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch b/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
new file mode 100644
index 0000000..ea51469
--- /dev/null
+++ b/recipes-ti/ipc/ti-ipc-examples-linux/0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch
@@ -0,0 +1,40 @@
+From cca4fd812959a0cd241dd3bbebfd461ece94c9b8 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denis@denix.org>
+Date: Mon, 29 Mar 2021 19:42:00 -0400
+Subject: [PATCH] examples/ClusterMgr: sys_errlist[] has been deprecated in
+ glibc
+
+Use strerror() instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Denys Dmytriyenko <denis@denix.org>
+---
+ src/examples/templates/ex46_graph/manager/ClusterMgr.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/examples/templates/ex46_graph/manager/ClusterMgr.c b/src/examples/templates/ex46_graph/manager/ClusterMgr.c
+index 19216c9..a1fa679 100644
+--- a/src/examples/templates/ex46_graph/manager/ClusterMgr.c
++++ b/src/examples/templates/ex46_graph/manager/ClusterMgr.c
+@@ -714,7 +714,7 @@ static pid_t ClusterMgr_system(char *cmd, bool wait)
+     pid = fork();
+ 
+     if (pid == -1) {
+-        LOG "CM_system: fork error: %s\n", sys_errlist[errno] LOGF
++        LOG "CM_system: fork error: %s\n", strerror(errno) LOGF
+         status = -1;
+         goto leave;
+     }
+@@ -739,7 +739,7 @@ static pid_t ClusterMgr_system(char *cmd, bool wait)
+     else {
+         /* overlay a new executable */
+         execvp(argv[0], argv);
+-        LOG "CM_system: execvp error: %s\n", sys_errlist[errno] LOGF
++        LOG "CM_system: execvp error: %s\n", strerror(errno) LOGF
+         status = -1;
+     }
+ 
+-- 
+2.7.4
+
diff --git a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
index 471d7ff..ab47955 100644
--- a/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples-linux_git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "TI Inter Process Communication (IPC) examples with Host running bios"
 require ti-ipc-examples.inc
 
+SRC_URI += "file://0001-examples-ClusterMgr-sys_errlist-has-been-deprecated-.patch;patchdir=../git/ipc-examples"
+
 DEPENDS = "ti-ipc ti-xdctools-native ti-sysbios ti-ipc-rtos zip-native"
 
 do_compile_append() {
-- 
2.7.4

