Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 925CBE016DC
	for <meta-ti@yoctoproject.org>; Mon,  4 Nov 2013 11:42:19 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVR000J782D9ZZ0@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 04 Nov 2013 13:42:13 -0600 (CST)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2D2C22004C; Mon,
	04 Nov 2013 14:42:13 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 04 Nov 2013 14:42:12 -0500
Message-id: <1383594132-14499-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: remove local bbappends, as now mesa-gl provides virtual/libgl
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
X-List-Received-Date: Mon, 04 Nov 2013 19:42:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

With the recent introduction of mesa-gl, there is no longer a need to override
main mesa PROVIDES list to avoid conflicts with libgles-omap3, remove bbappends

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/mesa/mesa-omap3-common.inc | 7 -------
 recipes-graphics/mesa/mesa_9.1.6.bbappend   | 1 -
 recipes-graphics/mesa/mesa_git.bbappend     | 1 -
 3 files changed, 9 deletions(-)
 delete mode 100644 recipes-graphics/mesa/mesa-omap3-common.inc
 delete mode 100644 recipes-graphics/mesa/mesa_9.1.6.bbappend
 delete mode 100644 recipes-graphics/mesa/mesa_git.bbappend

diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
deleted file mode 100644
index 0340770..0000000
--- a/recipes-graphics/mesa/mesa-omap3-common.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-
-# avoid providing conflicts for libgles-omap3 compatibles
-PROVIDES_omap3 = "virtual/libgl"
-PROVIDES_ti814x = "virtual/libgl"
-PROVIDES_ti816x = "virtual/libgl"
-PROVIDES_ti33x = "virtual/libgl"
diff --git a/recipes-graphics/mesa/mesa_9.1.6.bbappend b/recipes-graphics/mesa/mesa_9.1.6.bbappend
deleted file mode 100644
index 164ec1b..0000000
--- a/recipes-graphics/mesa/mesa_9.1.6.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa_git.bbappend b/recipes-graphics/mesa/mesa_git.bbappend
deleted file mode 100644
index 164ec1b..0000000
--- a/recipes-graphics/mesa/mesa_git.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require mesa-omap3-common.inc
-- 
1.8.3.2


