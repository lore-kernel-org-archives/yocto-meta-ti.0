Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 01520E00B85
	for <meta-ti@yoctoproject.org>; Sun, 13 Apr 2014 20:51:08 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N400069V5CAVQA0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Sun, 13 Apr 2014 22:50:49 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 11C9320182; Sun,
	13 Apr 2014 23:50:34 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Sun, 13 Apr 2014 23:50:21 -0400
Message-id: <1397447422-6936-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Subject: [RFC][PATCH 1/2] setup-defconfig.inc: implement config fragments by using in-kernel script
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
X-List-Received-Date: Mon, 14 Apr 2014 03:51:12 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/setup-defconfig.inc | 27 ++++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index ed3bce2..d6e5557 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -5,27 +5,32 @@ KERNEL_LOCALVERSION ?= ""
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
 
-addtask setup_defconfig before do_configure after do_patch
-do_setup_defconfig() {
-    # Always copy the defconfig file to .config to keep consistency
-    # between the case where there is a real config and the in kernel
-    # tree config
-    cp ${WORKDIR}/defconfig ${S}/.config
-}
-
 # define our own do_configure that will:
 #   1. Check the .config file and see if string use-kernel-config= is present
 #   2. If the use-kernel-config string is present parse out the config to use
-#      and run make ${config}
+#      and run make $config
 #   3. else run yes '' | oe_runmake oldconfig like the default do_configure
 #      does
 do_configure() {
+    # Always copy the defconfig file to .config to keep consistency
+    # between the case where there is a real config and the in kernel
+    # tree config
+    cp ${WORKDIR}/defconfig ${S}/.config
+
     echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
     echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
     config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
-    if [ "x${config}" != "x" ]
+    if [ "x$config" != "x" ]
     then
-        oe_runmake ${config}
+        # check for fragments
+        fragments=`cat ${S}/.config | grep config-fragment | cut -d= -f2`
+        oe_runmake $config
+        if [ "x$fragments" != "x" ]
+        then
+            fragnames=`basename -a $fragments`
+            ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config $fragnames 1>&2 )
+            yes '' | oe_runmake oldconfig
+        fi
     else
         yes '' | oe_runmake oldconfig
     fi
-- 
1.9.2


