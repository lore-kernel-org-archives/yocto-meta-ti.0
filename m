Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25E85E00480; Tue,  6 May 2014 15:36:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50A0FE00B9D
	for <meta-ti@yoctoproject.org>; Tue,  6 May 2014 15:35:53 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 01A9C52A73; Tue,  6 May 2014 22:26:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140506222630.01A9C52A73@arago-project.org>
Date: Tue,  6 May 2014 22:26:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : setup-defconfig.inc: implement config fragments by using in-kernel script
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
X-List-Received-Date: Tue, 06 May 2014 22:36:03 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 58f0ba756b822a55975147f8d91e617c02dda0f1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=58f0ba756b822a55975147f8d91e617c02dda0f1

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Apr 26 05:41:00 2014 +0000

setup-defconfig.inc: implement config fragments by using in-kernel script

* Use in-kernel merge_config.sh script and KERNEL_CONFIG_FRAGMENTS list
* Move copying provided defconfig from own task to do_configure() for atomicity
* Don't use curly brackets for shell variables to avoid conflict with Bitbake

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Reviewed-by: Chase Maupin <chase.maupin@ti.com>

---

 recipes-kernel/linux/setup-defconfig.inc |   26 +++++++++++++++-----------
 1 files changed, 15 insertions(+), 11 deletions(-)

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


