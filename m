Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31814E002AC
	for <meta-ti@yoctoproject.org>; Tue, 18 Sep 2012 16:58:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 35F6E52A02; Tue, 18 Sep 2012 23:58:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120918235828.35F6E52A02@arago-project.org>
Date: Tue, 18 Sep 2012 23:58:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIG1lc2E6IGFkZCBhcHBlbmRzIHRvIGF2b2lkIHByb3ZpZGluZyBjb25mbGljdHM=?=
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
X-List-Received-Date: Tue, 18 Sep 2012 23:58:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bef66dc21a80d237028e003abdc71c66eb0078f9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bef66dc21a80d237028e003abdc71c66eb0078f9

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Tue Sep  4 18:20:57 2012 +0200

mesa: add appends to avoid providing conflicts

For libgles-omap3 compatible machines mesa should only provide libgl.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>

Rebased to squash removal of mesa-xlib.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/mesa/mesa-dri_8.0.4.bbappend |    1 +
 recipes-graphics/mesa/mesa-dri_git.bbappend   |    1 +
 recipes-graphics/mesa/mesa-omap3-common.inc   |    7 +++++++
 3 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend b/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-dri_git.bbappend b/recipes-graphics/mesa/mesa-dri_git.bbappend
new file mode 100644
index 0000000..164ec1b
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-dri_git.bbappend
@@ -0,0 +1 @@
+require mesa-omap3-common.inc
diff --git a/recipes-graphics/mesa/mesa-omap3-common.inc b/recipes-graphics/mesa/mesa-omap3-common.inc
new file mode 100644
index 0000000..0340770
--- /dev/null
+++ b/recipes-graphics/mesa/mesa-omap3-common.inc
@@ -0,0 +1,7 @@
+PRINC := "${@int(PRINC) + 1}"
+
+# avoid providing conflicts for libgles-omap3 compatibles
+PROVIDES_omap3 = "virtual/libgl"
+PROVIDES_ti814x = "virtual/libgl"
+PROVIDES_ti816x = "virtual/libgl"
+PROVIDES_ti33x = "virtual/libgl"


