Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02B22E01757
	for <meta-ti@yoctoproject.org>; Tue,  5 Nov 2013 10:36:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A13A52A4C; Tue,  5 Nov 2013 18:36:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131105183627.2A13A52A4C@arago-project.org>
Date: Tue,  5 Nov 2013 18:36:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : mesa: remove local bbappends, as now mesa-gl provides virtual/libgl
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
X-List-Received-Date: Tue, 05 Nov 2013 18:36:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d3a24f40b9f023607d5a16fabd0dd3930103ec22
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d3a24f40b9f023607d5a16fabd0dd3930103ec22

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  4 14:36:09 2013 -0500

mesa: remove local bbappends, as now mesa-gl provides virtual/libgl

With the recent introduction of mesa-gl, there is no longer a need to override
main mesa PROVIDES list to avoid conflicts with libgles-omap3, remove bbappends

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/mesa/mesa-omap3-common.inc |    7 -------
 recipes-graphics/mesa/mesa_9.1.6.bbappend   |    1 -
 recipes-graphics/mesa/mesa_git.bbappend     |    1 -
 3 files changed, 0 insertions(+), 9 deletions(-)

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


