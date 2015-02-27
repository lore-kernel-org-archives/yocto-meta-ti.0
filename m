Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 45EA3E00837; Fri, 27 Feb 2015 14:30:17 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 52822E00321
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 14:30:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0585F529D9; Fri, 27 Feb 2015 22:30:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150227223011.0585F529D9@arago-project.org>
Date: Fri, 27 Feb 2015 22:30:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : kernel .inc: fix the breakage due to S!= B separation in master
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
X-List-Received-Date: Fri, 27 Feb 2015 22:30:17 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 23d3e10a0ff7ea95d649dc22dc34b3e4010d8d77
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=23d3e10a0ff7ea95d649dc22dc34b3e4010d8d77

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Feb 28 01:49:37 2015 +0000

kernel .inc: fix the breakage due to S!=B separation in master

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc    |    7 +++----
 recipes-kernel/linux/setup-defconfig.inc |   20 ++++++++++----------
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index b3358f9..5d21d4e 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -54,7 +54,7 @@ do_compileconfigs () {
 
         for configname in ${WORKDIR}/configs/* ; do
             # Copy in alternative config
-            cd ${S}
+            cd ${B}
             cp $configname ${WORKDIR}/defconfig
 
             # Build and Install this alternative kernel
@@ -96,7 +96,7 @@ do_compileconfigs () {
 
         # Restore the regular 'defconfig'
         cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
-        cd ${S}
+        cd ${B}
         do_configure
     fi
 }
@@ -106,8 +106,7 @@ do_deploy_append () {
     install -d ${DEPLOYDIR}
 
     # Drop the regular defconfig along side the others for consistency
-    cd ${S}
-    cp .config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.config
+    cp ${B}/.config ${DEPLOYDIR}/config-${PV}-${PR}-${MACHINE}.config
 
     # add symlink
     cd ${DEPLOYDIR}
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index 2c169cd..2b67bfc 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -11,27 +11,27 @@ do_configure() {
     # Always copy the defconfig file to .config to keep consistency
     # between the case where there is a real config and the in kernel
     # tree config
-    cp ${WORKDIR}/defconfig ${S}/.config
+    cp ${WORKDIR}/defconfig ${B}/.config
 
     echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
     echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
 
     # First, check if pointing to a combined config with config fragments
-    config=`cat ${S}/.config | grep use-combined-config | cut -d= -f2`
+    config=`cat ${B}/.config | grep use-combined-config | cut -d= -f2`
     if [ -n "$config" ]
     then
-        cp $config ${S}/.config
+        cp ${S}/$config ${B}/.config
     fi
 
     # Second, extract any config fragments listed in the defconfig
-    config=`cat ${S}/.config | grep config-fragment | cut -d= -f2`
+    config=`cat ${B}/.config | grep config-fragment | cut -d= -f2`
     if [ -n "$config" ]
     then
         configfrags=""
         for f in $config
         do
             # Check if the config fragment is available
-            if [ ! -e "$f" ]
+            if [ ! -e "${S}/$f" ]
             then
                 echo "Could not find kernel config fragment $f"
                 exit 1
@@ -43,12 +43,12 @@ do_configure() {
     fi
 
     # Third, check if pointing to a known in kernel defconfig
-    config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
+    config=`cat ${B}/.config | grep use-kernel-config | cut -d= -f2`
     if [ -n "$config" ]
     then
-        oe_runmake $config
+        oe_runmake -C ${S} O=${B} $config
     else
-        yes '' | oe_runmake oldconfig
+        yes '' | oe_runmake -C ${S} O=${B} oldconfig
     fi
 
     # Fourth, handle config fragments specified in the recipe
@@ -70,7 +70,7 @@ do_configure() {
     # Now that all the fragments are located merge them
     if [ -n "${KERNEL_CONFIG_FRAGMENTS}" -o -n "$configfrags" ]
     then
-        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config $configfrags ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
-        yes '' | oe_runmake oldconfig
+        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${B} ${B}/.config $configfrags ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
+        yes '' | oe_runmake -C ${S} O=${B} oldconfig
     fi
 }


