Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61EF1E009CA; Mon, 20 Jun 2016 13:05:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BD15EE0091D
	for <meta-ti@yoctoproject.org>; Mon, 20 Jun 2016 13:05:42 -0700 (PDT)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O930055Q6GPZCB0@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 20 Jun 2016 15:05:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=pD_ry4oyNxEA:10 a=sozttTNsAAAA:8	a=LZhGnNNbEdGQWnzKE9sA:9
Received: by 100.15.86.14 with SMTP id 719b31b8; Mon, 20 Jun 2016 20:05:23 GMT
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 0551B162042;	Mon,
	20 Jun 2016 16:05:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Jun 2016 16:05:09 -0400
Message-id: <20160620200509.21056-1-denis@denix.org>
X-Mailer: git-send-email 2.9.0
Subject: [PATCH] linux-ti-staging: update to 4.4.13, use new defconfig builder
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
X-List-Received-Date: Mon, 20 Jun 2016 20:05:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Convert to using tisdk configs from defconfig_map processed by defconfig_builder.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../linux/linux-ti-staging-4.4/defconfig           |  2 +-
 .../linux/linux-ti-staging-4.4/dra7xx/defconfig    |  1 +
 .../linux/linux-ti-staging-4.4/k2g-evm/defconfig   |  1 +
 .../linux/linux-ti-staging-4.4/keystone/defconfig  |  2 +-
 .../linux/linux-ti-staging-4.4/ti33x/defconfig     |  1 +
 .../linux/linux-ti-staging-4.4/ti43x/defconfig     |  1 +
 .../linux/linux-ti-staging-rt-4.4/defconfig        |  2 +-
 .../linux/linux-ti-staging-rt-4.4/dra7xx/defconfig |  1 +
 .../linux-ti-staging-rt-4.4/k2g-evm/defconfig      |  1 +
 .../linux-ti-staging-rt-4.4/keystone/defconfig     |  2 +-
 .../linux/linux-ti-staging-rt-4.4/ti33x/defconfig  |  1 +
 .../linux/linux-ti-staging-rt-4.4/ti43x/defconfig  |  1 +
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb    |  2 +-
 .../linux/linux-ti-staging-systest-4.4/defconfig   |  2 +-
 .../linux-ti-staging-systest-4.4/dra7xx/defconfig  |  1 +
 .../linux-ti-staging-systest-4.4/k2g-evm/defconfig |  1 +
 .../keystone/defconfig                             |  2 +-
 .../linux-ti-staging-systest-4.4/ti33x/defconfig   |  1 +
 .../linux-ti-staging-systest-4.4/ti43x/defconfig   |  1 +
 recipes-kernel/linux/linux-ti-staging_4.4.bb       | 15 +----
 recipes-kernel/linux/setup-defconfig.inc           | 66 ++++++++++++----------
 21 files changed, 58 insertions(+), 49 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/k2g-evm/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g-evm/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig

diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
index 990e7f7..d083d18 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/defconfig_fragment
+use-tisdk-config=ti_sdk_omap2_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig
new file mode 100644
index 0000000..dcb53ba
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/dra7xx/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dra7x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/k2g-evm/defconfig
new file mode 100644
index 0000000..316b04b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/k2g-evm/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
index 470cf11..5a40b93 100644
--- a/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/keystone/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/multi_core_defconfig_fragment
+use-tisdk-config=ti_sdk_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig
new file mode 100644
index 0000000..88f80fa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/ti33x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am3x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig
new file mode 100644
index 0000000..4b9daaf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.4/ti43x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am4x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
index 2091fca..f0b8bab 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/rt_defconfig_fragment
+use-tisdk-config=ti_sdk_omap2_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig
new file mode 100644
index 0000000..47e3d04
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/dra7xx/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dra7x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g-evm/defconfig
new file mode 100644
index 0000000..a9c24f2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/k2g-evm/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_k2g_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
index 6d28753..fc68085 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/keystone/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/rt_multi_core_defconfig_fragment
+use-tisdk-config=ti_sdk_keystone_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig
new file mode 100644
index 0000000..0a4fbac
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti33x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am3x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig
new file mode 100644
index 0000000..99594c8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-rt-4.4/ti43x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_am4x_rt_release
diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index 159693b..03c4ee3 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "8c26434b1cf4e1c3011c7a9925aeb2bec735db6a"
+SRCREV = "047640ce9624f2d6456e743954761af73527fa91"
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
index cfe4f99..155165d 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/system_test_defconfig_fragment
+use-tisdk-config=ti_sdk_dbg_omap2_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
new file mode 100644
index 0000000..9e250ca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/dra7xx/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dbg_dra7x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
new file mode 100644
index 0000000..32c70e7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/k2g-evm/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dbg_k2g_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
index 68cfc25..4ed25d7 100644
--- a/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/keystone/defconfig
@@ -1 +1 @@
-use-combined-config=ti_config_fragments/multi_core_system_test_defconfig_fragment
+use-tisdk-config=ti_sdk_dbg_keystone_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
new file mode 100644
index 0000000..4deed2c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti33x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dbg_am3x_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
new file mode 100644
index 0000000..4646059
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.4/ti43x/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_dbg_am4x_release
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index a756e4a..8c1272c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -63,30 +63,19 @@ KERNEL_DEVICETREE_k2e-evm = "keystone-k2e-evm.dtb"
 KERNEL_DEVICETREE_k2g-evm = "keystone-k2g-evm.dtb"
 KERNEL_DEVICETREE_k2l-evm = "keystone-k2l-evm.dtb"
 
-KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT}"
-
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|omap3|omap4|keystone"
 
 S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "51452e46647ed57ae83e6a95e1a4d700260e6bf0"
-PV = "4.4.12+git${SRCPV}"
+SRCREV = "26c74f51ccb2e7c63bf10defcef646f2cb4a3ea4"
+PV = "4.4.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
-
-KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_dra7xx = " ${KERNEL_CONFIG_DIR}/dra7_only.cfg"
-KERNEL_CONFIG_FRAGMENTS_append_k2g-evm = " ${KERNEL_CONFIG_DIR}/k2g_only.cfg"
-
-MULTI_CONFIG_BASE_SUFFIX = ""
-
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
diff --git a/recipes-kernel/linux/setup-defconfig.inc b/recipes-kernel/linux/setup-defconfig.inc
index cfad14b..7faf7f2 100644
--- a/recipes-kernel/linux/setup-defconfig.inc
+++ b/recipes-kernel/linux/setup-defconfig.inc
@@ -24,39 +24,47 @@ do_configure() {
     echo ${KERNEL_LOCALVERSION} > ${B}/.scmversion
     echo ${KERNEL_LOCALVERSION} > ${S}/.scmversion
 
-    # First, check if pointing to a combined config with config fragments
-    config=`cat ${B}/.config | grep use-combined-config | cut -d= -f2`
+    # Zero, when using "tisdk" configs, pass control to defconfig_builder
+    config=`cat ${B}/.config | grep use-tisdk-config | cut -d= -f2`
     if [ -n "$config" ]
     then
-        cp ${S}/$config ${B}/.config
-    fi
+        ${S}/ti_config_fragments/defconfig_builder.sh -w ${S} -t $config
+        oe_runmake -C ${S} O=${B} "$config"_defconfig
+    else
+        # First, check if pointing to a combined config with config fragments
+        config=`cat ${B}/.config | grep use-combined-config | cut -d= -f2`
+        if [ -n "$config" ]
+        then
+            cp ${S}/$config ${B}/.config
+        fi
 
-    # Second, extract any config fragments listed in the defconfig
-    config=`cat ${B}/.config | grep config-fragment | cut -d= -f2`
-    if [ -n "$config" ]
-    then
-        configfrags=""
-        for f in $config
-        do
-            # Check if the config fragment is available
-            if [ ! -e "${S}/$f" ]
-            then
-                echo "Could not find kernel config fragment $f"
-                exit 1
-            else
-                # Sanitize config fragment files to be relative to sources
-                configfrags="$configfrags ${S}/$f"
-            fi
-        done
-    fi
+        # Second, extract any config fragments listed in the defconfig
+        config=`cat ${B}/.config | grep config-fragment | cut -d= -f2`
+        if [ -n "$config" ]
+        then
+            configfrags=""
+            for f in $config
+            do
+                # Check if the config fragment is available
+                if [ ! -e "${S}/$f" ]
+                then
+                    echo "Could not find kernel config fragment $f"
+                    exit 1
+                else
+                    # Sanitize config fragment files to be relative to sources
+                    configfrags="$configfrags ${S}/$f"
+                fi
+            done
+        fi
 
-    # Third, check if pointing to a known in kernel defconfig
-    config=`cat ${B}/.config | grep use-kernel-config | cut -d= -f2`
-    if [ -n "$config" ]
-    then
-        oe_runmake -C ${S} O=${B} $config
-    else
-        yes '' | oe_runmake -C ${S} O=${B} oldconfig
+        # Third, check if pointing to a known in kernel defconfig
+        config=`cat ${B}/.config | grep use-kernel-config | cut -d= -f2`
+        if [ -n "$config" ]
+        then
+            oe_runmake -C ${S} O=${B} $config
+        else
+            yes '' | oe_runmake -C ${S} O=${B} oldconfig
+        fi
     fi
 
     # Fourth, handle config fragments specified in the recipe
-- 
2.7.4


