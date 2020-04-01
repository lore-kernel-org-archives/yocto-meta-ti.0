Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.97.1585770604810817595
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Apr 2020 12:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2804F409AA;
	Wed,  1 Apr 2020 19:50:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4H2GDRh-4Df; Wed,  1 Apr 2020 19:50:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A3E34400E8;
	Wed,  1 Apr 2020 19:50:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C25351718E5;
	Wed,  1 Apr 2020 15:50:01 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] jailhouse: finish conversion to python3
Date: Wed,  1 Apr 2020 15:50:01 -0400
Message-Id: <1585770601-10754-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ate-shebang-in-helper-scripts-for-python3.patch | 56 ++++++++++++++++++++++
 recipes-kernel/jailhouse/jailhouse_git.bb          |  3 +-
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch

diff --git a/recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch b/recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
new file mode 100644
index 0000000..f492236
--- /dev/null
+++ b/recipes-kernel/jailhouse/jailhouse/0001-tools-update-shebang-in-helper-scripts-for-python3.patch
@@ -0,0 +1,56 @@
+From 24e58c75592a2ba09f3062c8a4722c0e29a9b558 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Wed, 1 Apr 2020 15:44:46 -0400
+Subject: [PATCH] tools: update shebang in helper scripts for python3
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ tools/jailhouse-cell-linux     | 2 +-
+ tools/jailhouse-cell-stats     | 2 +-
+ tools/jailhouse-config-create  | 2 +-
+ tools/jailhouse-hardware-check | 2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tools/jailhouse-cell-linux b/tools/jailhouse-cell-linux
+index 007a5c4..e106b9d 100755
+--- a/tools/jailhouse-cell-linux
++++ b/tools/jailhouse-cell-linux
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ # Jailhouse, a Linux-based partitioning hypervisor
+ #
+diff --git a/tools/jailhouse-cell-stats b/tools/jailhouse-cell-stats
+index 2f7e966..4c5289f 100755
+--- a/tools/jailhouse-cell-stats
++++ b/tools/jailhouse-cell-stats
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ # Jailhouse, a Linux-based partitioning hypervisor
+ #
+diff --git a/tools/jailhouse-config-create b/tools/jailhouse-config-create
+index 1e2df74..9382b05 100755
+--- a/tools/jailhouse-config-create
++++ b/tools/jailhouse-config-create
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ #
+ # Jailhouse, a Linux-based partitioning hypervisor
+ #
+diff --git a/tools/jailhouse-hardware-check b/tools/jailhouse-hardware-check
+index 375816e..658ce6f 100755
+--- a/tools/jailhouse-hardware-check
++++ b/tools/jailhouse-hardware-check
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ # Jailhouse, a Linux-based partitioning hypervisor
+ #
+-- 
+2.7.4
+
diff --git a/recipes-kernel/jailhouse/jailhouse_git.bb b/recipes-kernel/jailhouse/jailhouse_git.bb
index d3cd873..6f442fe 100644
--- a/recipes-kernel/jailhouse/jailhouse_git.bb
+++ b/recipes-kernel/jailhouse/jailhouse_git.bb
@@ -16,6 +16,7 @@ BRANCH = "ti-jailhouse-0.12"
 
 SRC_URI = " \
     git://git.ti.com/jailhouse/ti-jailhouse.git;protocol=git;branch=${BRANCH} \
+    file://0001-tools-update-shebang-in-helper-scripts-for-python3.patch \
 "
 
 DEPENDS = "virtual/kernel dtc-native python3-mako-native python3-mako make-native"
@@ -89,7 +90,7 @@ do_install() {
 	# We want to install the python tools, but we do not want to use pip...
 	# At least with v0.10, we can work around this with
 	# 'PIP=":" PYTHON_PIP_USEABLE=yes'
-	oe_runmake PIP=: PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
+	oe_runmake PIP=: PYTHON=python3 PYTHON_PIP_USEABLE=yes DESTDIR=${D} install
 
 	install -d ${D}${CELL_DIR}
 	install -m 0644 ${B}/configs/${JH_ARCH}/${JH_CELL_FILES} ${D}${CELL_DIR}/
-- 
2.7.4

