Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0BA15E00AF9; Fri, 23 Oct 2015 05:53:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CA100E00ABE
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 05:53:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9NCrYTq012554
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 07:53:34 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9NCrY4x030189
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2015 07:53:34 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 23 Oct 2015 07:53:34 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t9NCrY4l020523;	Fri, 23 Oct 2015 07:53:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 23 Oct 2015 08:53:32 -0400
Message-ID: <1445604812-27932-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gcc-arm-none-eabi-native: Add GCC baremetal toolchain
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
X-List-Received-Date: Fri, 23 Oct 2015 12:53:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../gcc/gcc-arm-none-eabi-native_4.8.2014q3.bb      | 21 +++++++++++++++++++++
 recipes-ti/includes/ti-paths.inc                    |  2 ++
 2 files changed, 23 insertions(+)
 create mode 100644 recipes-devtools/gcc/gcc-arm-none-eabi-native_4.8.2014q3.bb

diff --git a/recipes-devtools/gcc/gcc-arm-none-eabi-native_4.8.2014q3.bb b/recipes-devtools/gcc/gcc-arm-none-eabi-native_4.8.2014q3.bb
new file mode 100644
index 0000000..971ae48
--- /dev/null
+++ b/recipes-devtools/gcc/gcc-arm-none-eabi-native_4.8.2014q3.bb
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
-- 
1.9.1


