Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5D95E013DB
	for <meta-ti@yoctoproject.org>; Thu, 29 Mar 2012 22:57:10 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EFA8452AA0; Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120330055709.EFA8452AA0@arago-project.org>
Date: Fri, 30 Mar 2012 05:57:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel: add a comment on the addition of preparekernel task
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 05:57:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c5bb2de92249f802c7a038401b696be9c636895a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5bb2de92249f802c7a038401b696be9c636895a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Mar 30 01:54:27 2012 -0400

multi-kernel: add a comment on the addition of preparekernel task

As suggested by Richard:
https://lists.yoctoproject.org/pipermail/meta-ti/2012-March/000869.html
While at it, reformat the header.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |   26 ++++++++++++++++++--------
 1 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 056adb9..04bc987 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -1,14 +1,24 @@
-# This .inc file allows you to build and deploy multiple sets of kernel + modules with different defconfigs
+# This .inc file allows building and deploying multiple sets of kernel + modules
+# with different defconfigs
 #
-# Note that this include will NOT stage anything nor create packages, since that is virtually impossible
-# Userspace should be built against the 'regular' kernel
+# Note that this include will NOT stage anything nor create packages, since that
+# is virtually impossible. Userspace should be built against the 'regular' kernel
 #
-# The intended usecase is for machines that have mutually exclusive drivers due to e.g. pinmuxing issues.
-# For example the LogicPD omap-l138 experimenter board can have multiple mutually exclusive expansion boards
-# like lcd, ethernet, sound, 20x2 character LCD, etc. To be able to easily test all of those you can use this .inc
+# The intended usecase is for machines that have mutually exclusive drivers due
+# to e.g. pinmuxing issues. For example the LogicPD omap-l138 experimenter board
+# can have multiple mutually exclusive expansion boards like lcd, ethernet,
+# sound, 20x2 character LCD, etc. To be able to easily test all of those you can
+# use this .inc
 #
-# To make it easier finding the original defconfig from a running kernel, this also forcefully turns on 
-# CONFIG_IKCONFIG_PROC so people can do 'zcat /proc/config.gz' on the target.
+# To make it easier finding the original defconfig from a running kernel, this
+# also forcefully turns on CONFIG_IKCONFIG_PROC so people can do
+# 'zcat /proc/config.gz' on the target.
+#
+# The function get_kernelversion uses generated header files to extract the
+# version number. But those files are not available until do_compile, and
+# do_compileconfigs is injected before that, hence the version becomes None
+# and breaks in several places. Introduce a task do_preparekernel that calls
+# "make prepare" in the kernel tree to generate all the necessary files.
 
 require linux.inc
 


