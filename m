Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80481E00C63
	for <meta-ti@yoctoproject.org>; Fri, 25 Apr 2014 16:41:36 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4M00FX41SMOB90@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 25 Apr 2014 18:41:24 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D49A12001F; Fri,
	25 Apr 2014 19:41:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 25 Apr 2014 19:41:00 -0400
Message-id: <1398469261-32287-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH v2 1/2] setup-defconfig.inc: implement config fragments by using in-kernel script
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
X-List-Received-Date: Fri, 25 Apr 2014 23:41:39 -0000

From: Denys Dmytriyenko <denys@ti.com>

* Use in-kernel merge_config.sh script and KERNEL_CONFIG_FRAGMENTS list
* Move copying provided defconfig from own task to do_configure() for atomicity
* Don't use curly brackets for shell variables to avoid conflict with Bitbake

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - Use recipe variable to list config fragments instead of file

 recipes-kernel/linux/setup-defconfig.inc | 26 +++++++++++++++-----------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index ed3bce2..4277f26 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -5,28 +5,32 @@ KERNEL_LOCALVERSION ?= ""
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
+    if [ ! -z "$config" ]
     then
-        oe_runmake ${config}
+        oe_runmake $config
     else
         yes '' | oe_runmake oldconfig
     fi
+
+    # check for fragments
+    if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
+    then
+        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
+        yes '' | oe_runmake oldconfig
+    fi
 }
-- 
1.9.2


