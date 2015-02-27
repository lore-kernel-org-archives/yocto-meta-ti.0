Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C886BE0076B; Fri, 27 Feb 2015 12:14:53 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 985C0E0034A
	for <meta-ti@yoctoproject.org>; Fri, 27 Feb 2015 12:14:48 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.236]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NKG0001R5KM4690@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 27 Feb 2015 14:14:47 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=A7bb5BSD c=1 sm=1 tr=0	a=SSUdfGXV8XCffJJ8+gLrig==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8	a=8TWMsW3S1vRvTSo14McA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 06E4B22DB3;	Fri,
	27 Feb 2015 14:49:38 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Fri, 27 Feb 2015 14:49:37 -0500
Message-id: <1425066577-25435-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH master] kernel .inc: fix the breakage due to S!=B separation in master
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
X-List-Received-Date: Fri, 27 Feb 2015 20:14:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/multi-kernel.inc    |  7 +++----
 recipes-kernel/linux/setup-defconfig.inc | 20 ++++++++++----------
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
-- 
2.2.0


