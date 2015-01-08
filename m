Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 870B3E004FF; Thu,  8 Jan 2015 15:34:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.25 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F5FAE0048B
	for <meta-ti@yoctoproject.org>; Thu,  8 Jan 2015 15:34:37 -0800 (PST)
Received: from gandalf.denix.org ([108.18.33.160]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NHV00EGMTH7YCK0@vms173025.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Thu, 08 Jan 2015 17:34:20 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Kc1larcG c=1 sm=1 tr=0	a=A8KAnipHuDHkz1LiHkTZyg==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=YNv0rlydsVwA:10
	a=sozttTNsAAAA:8	a=tlbNOaAUJXqdYbab5qYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7418420076;	Thu,
	8 Jan 2015 18:34:19 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Thu, 08 Jan 2015 18:34:19 -0500
Message-id: <1420760059-21811-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH v2] multi-kernel: update to work with latest code
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
X-List-Received-Date: Thu, 08 Jan 2015 23:34:44 -0000

From: Denys Dmytriyenko <denys@ti.com>

Handle multi-config kernel builds with separate namespaces to allow installing
them side by side safely.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - implement namespace separation and fix smaller naming issues

 .../linux/linux-ti-staging-3.14/configs/systest    |   1 +
 recipes-kernel/linux/linux-ti-staging_3.14.bb      |  13 +-
 recipes-kernel/linux/multi-kernel.inc              | 137 ++++++++++-----------
 3 files changed, 76 insertions(+), 75 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-3.14/configs/systest

diff --git a/recipes-kernel/linux/linux-ti-staging-3.14/configs/systest b/recipes-kernel/linux/linux-ti-staging-3.14/configs/systest
new file mode 100644
index 0000000..cfe4f99
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-3.14/configs/systest
@@ -0,0 +1 @@
+use-combined-config=ti_config_fragments/system_test_defconfig_fragment
diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
index 2e89ace..6c0a352 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
@@ -7,6 +7,7 @@ inherit kernel
 
 require recipes-kernel/linux/linux-dtb.inc
 require recipes-kernel/linux/setup-defconfig.inc
+require recipes-kernel/linux/multi-kernel.inc
 
 # Look in the generic major.minor directory for files
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-3.14:"
@@ -44,11 +45,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-3.14.y"
 
-SRCREV = "4311f726041145161621593e5d67f106913c0f28"
+SRCREV = "6b7737373fad112d416781e83841732d33b0d1bd"
 PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
@@ -56,8 +57,10 @@ KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"
 KERNEL_CONFIG_FRAGMENTS_append_ti33x = " ${KERNEL_CONFIG_DIR}/am33xx_only.cfg"
 KERNEL_CONFIG_FRAGMENTS_append_ti43x = " ${KERNEL_CONFIG_DIR}/am43xx_only.cfg"
 
+MULTI_CONFIG_BASE_SUFFIX = ""
+
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-SRC_URI = "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
-           file://defconfig \
-          "
+SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
+            file://defconfig \
+           "
diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index e696c8b..93cf064 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -10,113 +10,110 @@
 # sound, 20x2 character LCD, etc. To be able to easily test all of those you can
 # use this .inc
 #
-# To make it easier finding the original defconfig from a running kernel, this
-# also forcefully turns on CONFIG_IKCONFIG_PROC so people can do
-# 'zcat /proc/config.gz' on the target.
-#
 # The function get_kernelversion uses generated header files to extract the
 # version number. But those files are not available until do_compile, and
 # do_compileconfigs is injected before that, hence the version becomes None
 # and breaks in several places. Introduce a task do_preparekernel that calls
 # "make prepare" in the kernel tree to generate all the necessary files.
 
-require linux.inc
-
 SRC_URI += " \
            file://configs "
 
 MULTI_CONFIG_BASE_SUFFIX = "multi-config-"
 MODULE_IMAGE_BASE_NAME ?= "modules-${PE}-${PV}-${PR}-${MACHINE}-${DATETIME}"
 
+EXTRA_OEMAKE = "${PARALLEL_MAKE} "
+
 do_preparekernel () {
-	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
-	oe_runmake prepare CC="${KERNEL_CC}" LD="${KERNEL_LD}"
+    unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
+    oe_runmake prepare CC="${KERNEL_CC}" LD="${KERNEL_LD}"
 }
 
 addtask preparekernel after do_configure before do_compile
 
 do_compileconfigs () {
+    # fixup for fetcher change
+    if [ -e ${WORKDIR}/configs/configs ] ; then
+        if [ -e ${WORKDIR}/configs/configs/empty ] ; then
+            mv ${WORKDIR}/configs/configs/empty ${WORKDIR}/configs/
+        fi
+        mv ${WORKDIR}/configs/configs/* ${WORKDIR}/configs/
+        rm -rf ${WORKDIR}/configs/configs
+    fi
 
-  # fixup for fetcher change
-  if [ -e ${WORKDIR}/configs/configs ] ; then
-      if [ -e ${WORKDIR}/configs/configs/empty ] ; then
-          mv ${WORKDIR}/configs/configs/empty ${WORKDIR}/configs/
-      fi
-      mv ${WORKDIR}/configs/configs/* ${WORKDIR}/configs/
-      rm -rf ${WORKDIR}/configs/configs
-  fi
-
-  # Compile and Install additional kernel configs if found
-  if [ -e ${WORKDIR}/configs/empty ] ; then
-       echo "No configs found in configs/ directory, skipping to regular build"
-  else
-      echo "Multiple configs found, building those first"
-
-      # Context Save the regular 'defconfig'
-      cp ${WORKDIR}/defconfig ${WORKDIR}/defconfig.save
-
-      for config in ${WORKDIR}/configs/* ; do
-
-        # Copy in alternative config
+    # Compile and Install additional kernel configs if found
+    if [ -e ${WORKDIR}/configs/empty ] ; then
+        echo "No configs found in configs/ directory, skipping to regular build"
+    else
+        echo "Multiple configs found, building those first"
+
+        # Context Save the regular 'defconfig'
+        cp ${WORKDIR}/defconfig ${WORKDIR}/defconfig.save
+
+        for configname in ${WORKDIR}/configs/* ; do
+            # Copy in alternative config
+            cd ${S}
+            cp $configname ${WORKDIR}/defconfig
+
+            # Build and Install this alternative kernel
+            do_configure
+            echo ${KERNEL_LOCALVERSION}-$(basename $configname) > ${B}/.scmversion
+            echo ${KERNEL_LOCALVERSION}-$(basename $configname) > ${S}/.scmversion
+            kernel_do_compile
+            do_compile_kernelmodules
+            install -d "${D}/lib/modules/${KERNEL_VERSION}"
+            touch "${D}/lib/modules/${KERNEL_VERSION}/build"
+            touch "${D}/lib/modules/${KERNEL_VERSION}/source"
+            install -d "${D}/lib/modules/${KERNEL_VERSION}/kernel"
+            kernel_do_install
+            rm "${D}/lib/modules/${KERNEL_VERSION}-$(basename $configname)/build"
+            rm "${D}/lib/modules/${KERNEL_VERSION}-$(basename $configname)/source"
+            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}-$(basename $configname)/kernel"
+            rmdir --ignore-fail-on-non-empty "${D}/lib/modules/${KERNEL_VERSION}"
+
+            # Drop the resulting images in the deploy dir
+            install -d ${DEPLOY_DIR_IMAGE}
+            install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
+
+            if [ -d "${D}/lib" ]; then
+                tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz -C ${D} lib
+            fi
+
+            # Install the final config alongside the images
+            cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
+
+            # Create symlinks
+            cd ${DEPLOY_DIR_IMAGE}
+            rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
+            ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).bin
+            rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
+            ln -sf ${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).tgz
+            rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
+            ln -sf config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $configname).config
+        done
+
+        # Restore the regular 'defconfig'
+        cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
         cd ${S}
-        cp $config ${WORKDIR}/defconfig
-
-        # Enable config to be viewed on the target
-        echo "CONFIG_IKCONFIG=y" >> ${WORKDIR}/defconfig
-        echo "CONFIG_IKCONFIG_PROC=y" >> ${WORKDIR}/defconfig
-	
-        # Build and Install this alternative kernel
         do_configure
-        kernel_do_compile
-        do_compile_kernelmodules
-        kernel_do_install
-
-        # Drop the resulting images in the deploy dir
-        install -d ${DEPLOY_DIR_IMAGE}
-        install -m 0644 ${KERNEL_OUTPUT} ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
-
-        if [ -d "${D}/lib" ]; then
-            tar --owner=root --group=root -cvzf ${DEPLOY_DIR_IMAGE}/${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz -C ${D} lib
-        fi
- 
-        # Install the final config alongside the images
-        cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
-
-        # Create symlinks
-        cd ${DEPLOY_DIR_IMAGE}
-        rm -f ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
-        ln -sf ${KERNEL_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin ${KERNEL_IMAGE_SYMLINK_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).bin
-        rm -f modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
-        ln -sf ${MODULE_IMAGE_BASE_NAME}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz modules-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).tgz
-        rm -f config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
-        ln -sf config-${PV}-${PR}-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config config-${MACHINE}.${MULTI_CONFIG_BASE_SUFFIX}$(basename $config).config
-
-      done
-
-      # Restore the regular 'defconfig'
-      cp ${WORKDIR}/defconfig.save ${WORKDIR}/defconfig
-      cd ${S}
-      do_configure
     fi
 }
 
 # For reference, copy .config to deploy image
 do_deploy_append () {
-
-	install -d ${DEPLOY_DIR_IMAGE}
+    install -d ${DEPLOY_DIR_IMAGE}
 
     # Drop the regular defconfig along side the others for consistency
     cd ${S}
     cp .config ${DEPLOY_DIR_IMAGE}/config-${PV}-${PR}-${MACHINE}.config
 
     # add symlink
-    cd ${DEPLOY_DIR_IMAGE}    
+    cd ${DEPLOY_DIR_IMAGE}
     rm -f config-${MACHINE}.config
     ln -s config-${PV}-${PR}-${MACHINE}.config config-${MACHINE}.config
 
     rm -f modules-${MACHINE}.tgz
     ln -sf ${MODULE_IMAGE_BASE_NAME}.tgz modules-${MACHINE}.tgz
-
 }
 
 do_compileconfigs[depends] += "u-boot-mkimage-native:do_populate_sysroot virtual/${TARGET_PREFIX}gcc:do_populate_sysroot"
-- 
2.2.0


