Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9FDDFE0088C; Wed, 28 Oct 2015 13:06:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86220E007AE
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2015 13:06:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 06CCA52A5B; Wed, 28 Oct 2015 20:06:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151028200626.06CCA52A5B@arago-project.org>
Date: Wed, 28 Oct 2015 20:06:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : gcc-arm-none-eabi-native: Add GCC baremetal toolchain
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
X-List-Received-Date: Wed, 28 Oct 2015 20:06:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: af7f3df8df4e844bc185235fdb795237c142ba6a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=af7f3df8df4e844bc185235fdb795237c142ba6a

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Sat Oct 24 01:56:46 2015 +0000

gcc-arm-none-eabi-native: Add GCC baremetal toolchain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../gcc-arm-none-eabi-native_4.8.2014q3.bb         |   21 ++++++++++++++++++++
 recipes-ti/includes/ti-paths.inc                   |    2 +
 2 files changed, 23 insertions(+), 0 deletions(-)

diff --git a/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
new file mode 100644
index 0000000..971ae48
--- /dev/null
+++ b/recipes-ti/devtools/gcc-arm-none-eabi-native_4.8.2014q3.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "Baremetal GCC for ARM"
+LICENSE = "GPL-3.0-with-GCC-exception & GPLv3"
+
+LIC_FILES_CHKSUM = "file://share/doc/gcc-arm-none-eabi/license.txt;md5=cba77c7fde3ed13e866b04a2f3d93918"
+
+inherit native
+require recipes-ti/includes/ti-paths.inc
+
+SRC_URI = "https://launchpad.net/gcc-arm-embedded/4.8/4.8-2014-q3-update/+download/gcc-arm-none-eabi-4_8-2014q3-20140805-linux.tar.bz2;name=gcc-arm-none"
+
+SRC_URI[gcc-arm-none.md5sum] = "acc8c8ff45f8801e2155934214309a87"
+SRC_URI[gcc-arm-none.sha256sum] = "e33d7546de1e02844239c72b3ef5563f472fcd6b4637419d513770ae13f551c0"
+
+S = "${WORKDIR}/gcc-arm-none-eabi-4_8-2014q3"
+
+do_install() {
+    install -d ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+    cp -r ${S}/. ${D}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}
+}
+
+FILES_${PN} = "${GCC_ARM_NONE_TOOLCHAIN_RECIPE}/*"
diff --git a/recipes-ti/includes/ti-paths.inc b/recipes-ti/includes/ti-paths.inc
index d4bbe9e..8880591 100644
--- a/recipes-ti/includes/ti-paths.inc
+++ b/recipes-ti/includes/ti-paths.inc
@@ -47,6 +47,7 @@ export PDK_INSTALL_DIR_RECIPE        = "${installdir}/ti-pdk-tree"
 export OSAL_INSTALL_DIR_RECIPE       = "${installdir}/ti-osal-tree"
 export M4_TOOLCHAIN_INSTALL_DIR_RECIPE    = "${installdir}/ti-cgt-arm"
 export CCSV6_INSTALL_DIR_RECIPE           = "${installdir}/ccsv6"
+export GCC_ARM_NONE_TOOLCHAIN_RECIPE      = "${installdir}/gcc-arm-none-eabi"
 
 # This is where the tools will end up in sysroot
 export BIOS_INSTALL_DIR       = "${STAGING_DIR_TARGET}${BIOS_INSTALL_DIR_RECIPE}"
@@ -84,6 +85,7 @@ export PDK_INSTALL_DIR        = "${STAGING_DIR_TARGET}${PDK_INSTALL_DIR_RECIPE}"
 export OSAL_INSTALL_DIR       = "${STAGING_DIR_TARGET}${OSAL_INSTALL_DIR_RECIPE}"
 export M4_TOOLCHAIN_INSTALL_DIR    = "${STAGING_DIR_NATIVE}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}"
 export CCSV6_INSTALL_DIR           = "${STAGING_DIR_NATIVE}${CCSV6_INSTALL_DIR_RECIPE}"
+export GCC_ARM_NONE_TOOLCHAIN      = "${STAGING_DIR_NATIVE}${GCC_ARM_NONE_TOOLCHAIN_RECIPE}"
 
 DSPSUFFIX_omapl137 = "x674"
 DSPSUFFIX_omapl138 = "x674"


