Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EB92FE00751; Mon,  5 Jan 2015 16:32:33 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 3600 seconds by postgrey-1.32 at yocto-www;
	Mon, 05 Jan 2015 16:32:19 PST
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B1D6E003E3
	for <meta-ti@yoctoproject.org>; Mon,  5 Jan 2015 16:32:19 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NHQ00JJQ9D96FF0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 05 Jan 2015 17:32:03 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=b6gFOWC0 c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=lGHdoIVS9Vq03D4QAO0A:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 6336720088;	Mon,
	5 Jan 2015 18:31:57 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 05 Jan 2015 18:31:57 -0500
Message-id: <1420500717-26033-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] setup-defconfig: support combined defconfig with listed config fragments
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
X-List-Received-Date: Tue, 06 Jan 2015 00:32:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux/linux-ti-staging-3.14/defconfig          |  2 +-
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |  8 +--
 recipes-kernel/linux/setup-defconfig.inc           | 64 ++++++++++++++--------
 3 files changed, 44 insertions(+), 30 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/defconfig b/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
index 926b35a..990e7f7 100644
--- a/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-3.14/defconfig
@@ -1 +1 @@
-use-kernel-config=omap2plus_defconfig
+use-combined-config=ti_config_fragments/defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 61989c3..2e89ace 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -44,18 +44,14 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "f93aba31cfc224ed7ea414d1b7ab988808d764ba"
+SRCREV = "4311f726041145161621593e5d67f106913c0f28"
 PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-KERNEL_CONFIG_FRAGMENTS = "${KERNEL_CONFIG_DIR}/baseport.cfg ${KERNEL_CONFIG_DIR}/all_valid_socs.cfg \
-                           ${KERNEL_CONFIG_DIR}/power.cfg ${KERNEL_CONFIG_DIR}/connectivity.cfg \
-                           ${KERNEL_CONFIG_DIR}/ipc.cfg ${KERNEL_CONFIG_DIR}/audio_display.cfg \
-                           ${KERNEL_CONFIG_DIR}/wlan.cfg"
 
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index dbfd0d4..7468929 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -4,13 +4,9 @@ KERNEL_LOCALVERSION ?= ""
 
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
+# Or if it points to a combined defconfig that lists both in kernel
+# defconfig and associated config fragments.
 
-# define our own do_configure that will:
-#   1. Check the .config file and see if string use-kernel-config= is present
-#   2. If the use-kernel-config string is present parse out the config to use
-#      and run make $config
-#   3. else run yes '' | oe_runmake oldconfig like the default do_configure
-#      does
 do_configure() {
     # Always copy the defconfig file to .config to keep consistency
     # between the case where there is a real config and the in kernel
@@ -19,40 +15,62 @@ do_configure() {
 
     echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
     echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
+
+    # First, check if pointing to a combined config with config fragments
+    config=`cat ${S}/.config | grep use-combined-config | cut -d= -f2`
+    if [ -n "$config" ]
+    then
+        cp $config ${S}/.config
+    fi
+
+    # Second, extract any config fragments listed in the defconfig
+    config=`cat ${S}/.config | grep config-fragment | cut -d= -f2`
+    if [ -n "$config" ]
+    then
+        configfrags=""
+        for f in $config
+        do
+            # Check if the config fragment is available
+            if [ ! -e "$f" ]
+            then
+                echo "Could not find kernel config fragment $f"
+                exit 1
+            else
+                # Sanitize config fragment files to be relative to sources
+                configfrags+=" ${S}/$f"
+            fi
+        done
+    fi
+
+    # Third, check if pointing to a known in kernel defconfig
     config=`cat ${S}/.config | grep use-kernel-config | cut -d= -f2`
-    if [ ! -z "$config" ]
+    if [ -n "$config" ]
     then
         oe_runmake $config
     else
         yes '' | oe_runmake oldconfig
     fi
 
-    # Check for kernel config fragments.  The assumption is that the config
-    # fragment will be specified with the absolute path.  For example:
-    #   * ${WORKDIR}/config1.cfg
-    #   * ${S}/config2.cfg
-    # Iterate through the list of configs and make sure that you can find
-    # each one.  If not then error out.
-    # NOTE: If you want to override a configuration that is kept in the kernel
-    #       with one from the OE meta data then you should make sure that the
-    #       OE meta data version (i.e. ${WORKDIR}/config1.cfg) is listed
-    #       after the in kernel configuration fragment.
-    # Check if any config fragments are specified.
-    if [ ! -z "${KERNEL_CONFIG_FRAGMENTS}" ]
+    # Fourth, handle config fragments specified in the recipe
+    # The assumption is that the config fragment will be specified with the absolute path.
+    # E.g. ${WORKDIR}/config1.cfg or ${S}/config2.cfg
+    if [ -n "${KERNEL_CONFIG_FRAGMENTS}" ]
     then
         for f in ${KERNEL_CONFIG_FRAGMENTS}
         do
-            # Check if the config fragment was copied into the WORKDIR from
-            # the OE meta data
+            # Check if the config fragment is available
             if [ ! -e "$f" ]
             then
                 echo "Could not find kernel config fragment $f"
                 exit 1
             fi
         done
+    fi
 
-        # Now that all the fragments are located merge them.
-        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
+    # Now that all the fragments are located merge them
+    if [ -n "${KERNEL_CONFIG_FRAGMENTS}" -o -n "$configfrags" ]
+    then
+        ( cd ${WORKDIR} && ${S}/scripts/kconfig/merge_config.sh -m -r -O ${S} ${S}/.config $configfrags ${KERNEL_CONFIG_FRAGMENTS} 1>&2 )
         yes '' | oe_runmake oldconfig
     fi
 }
-- 
2.2.0


