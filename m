Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25E31E01488
	for <meta-ti@yoctoproject.org>; Wed, 17 Apr 2013 17:21:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EE04C529AF; Thu, 18 Apr 2013 00:21:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130418002122.EE04C529AF@arago-project.org>
Date: Thu, 18 Apr 2013 00:21:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Chase Maupin : setup-defconfig: allow using KERNEL_LOCALVERSION
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
X-List-Received-Date: Thu, 18 Apr 2013 00:21:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 4b0d898ffdf7c186c6e02b59bb9093488a8774c7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4b0d898ffdf7c186c6e02b59bb9093488a8774c7

Author: Chase Maupin <Chase.Maupin@ti.com>
Date:   Wed Apr 10 16:51:43 2013 -0500

setup-defconfig: allow using KERNEL_LOCALVERSION

* Add capability to use KERNEL_LOCALVERSION to set an extra
  version string in the kernel.  This mimics functionality
  submitted to the kernel.bbclass but since this overwrites
  the do_configure it must be added here as well.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/setup-defconfig.inc |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index fc5e18e..ed3bce2 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -1,3 +1,7 @@
+# KERNEL_LOCALVERSION can be set to add a tag to the end of the
+# kernel version string.  such as the commit id
+KERNEL_LOCALVERSION ?= ""
+
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
 
@@ -16,6 +20,8 @@ do_setup_defconfig() {
 #   3. else run yes '' | oe_runmake oldconfig like the default do_configure
 #      does
 do_configure() {
+    echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
+    echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
     config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
     if [ "x${config}" != "x" ]
     then


