Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A696E00C4D; Tue, 18 Jul 2017 16:05:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E51A8E00C92
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 16:05:01 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6IN4pQU001310
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500419091;
	bh=WJpxTrKwCpFbQ7C1QVtGgZtyhfP+XwyNeHIiW5srZCQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=CnDq9yY4TT5pBoCSuGwSezWW5EcwxPbMAOI6rBb+coNy98+Z9/yo/w49Z3ozOz76w
	VYuXUi2XWhBVN7yzVBRFAF4R/mtgsP1nKWEN94Gk/5uccJminZOXs/MR2BMo8gWZ0v
	b8SA2Id7L4HvIGNUQ/P9fIBwxoIQIAlA1VTlJnOY=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6IN4kZE008802
	for <meta-ti@yoctoproject.org>; Tue, 18 Jul 2017 18:04:46 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 18 Jul 2017 18:04:46 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6IN46hw000997;	Tue, 18 Jul 2017 18:04:46 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 18 Jul 2017 19:03:36 -0400
Message-ID: <1500419028-3361-25-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe for pm-lld
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
X-List-Received-Date: Tue, 18 Jul 2017 23:05:10 -0000
Content-Type: text/plain

Upstreaming TI RTOS low level driver for Power Management module (PM)
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

v2 - Added summary & merged in to a single recipe

 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 95 +++++++++++++++++++++++++++++++++++
 1 file changed, 95 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
new file mode 100644
index 0000000..c976deb
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -0,0 +1,95 @@
+SUMMARY = "TI RTOS driver for Power Management module (PM)"
+
+require recipes-ti/includes/ti-paths.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://Power.h;beginline=1;endline=31;md5=527b91fdcd26cd19ac07a754f45dedbe"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+
+PM_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/pm-lld.git"
+PM_LLD_GIT_PROTOCOL = "git"
+PM_LLD_GIT_BRANCH = "int_pm_am335x"
+PM_LLD_GIT_BRANCH_dra7xx-evm = "master"
+PM_LLD_GIT_DESTSUFFIX = "git/ti/drv/pm"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"
+PM_LLD_SRCREV = "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"
+
+# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
+PM_LLD_SRCREV_dra7xx-evm = "46ea13503d2991f636197edb206a9f62cea398d4"
+
+BRANCH = "${PM_LLD_GIT_BRANCH}"
+SRC_URI = "${PM_LLD_GIT_URI};destsuffix=${PM_LLD_GIT_DESTSUFFIX};protocol=${PM_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+#PATCHTOOL = "git"
+#SRC_URI_append = " \
+#    file://.patch \
+#"
+
+SRCREV = "${PM_LLD_SRCREV}"
+PV = "01.04.00.01"
+PR = "r0"
+
+S = "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS = " ti-sysbios \
+            gcc-arm-none-eabi-native \
+            osal-rtos \
+            ca-certificates-native \
+            ti-pdk-setup \
+"
+DEPENDS_append_omap-a15 = " ti-cgt-arm-native \
+                            ti-cgt6x-native \
+                            common-csl-ip-rtos \
+"
+DEPENDS_append_ti33x = " starterware-rtos \
+"
+DEPENDS_append_ti43x = " starterware-rtos \
+"
+DEPENDS_append_k2g = " common-csl-ip-rtos \
+                       ti-cgt6x-native \
+"
+
+# Fetch task cannot be completed until after ca-certificates-native populates sysroot with the SSL certificates
+do_fetch[depends] = "ca-certificates-native:do_populate_sysroot"
+
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A8 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export TOOLCHAIN_PATH_A9 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export FPULIB_PATH = "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/4.9.3/fpu/"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+export BIOS_INSTALL_PATH = "${SYSBIOS_INSTALL_DIR}"
+export XDC_INSTALL_PATH = "${XDC_INSTALL_DIR}"
+
+export PDK_PM_ROOT_PATH = "${WORKDIR}/git"
+
+# Used by DEST_ROOT to redirect binary and obj files away from sysroot PDK tree
+OBJ_DIR = "${WORKDIR}/git/ti/binary"
+
+do_compile() {
+    make clean lib xdc_meta doxygen LIMIT_SOCS="${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS="${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=${OBJ_DIR}
+
+    # Remove unnecessary files from packaging
+    rm -rf patches/
+
+    # Cleanup docs
+    rm -rf docs/ReleaseNotes_PM_LLD.doc
+    rm -rf internal/
+
+    #archive
+    tar -cf pm_lld.tar --exclude='*.tar' ./*
+}
+
+do_install() {
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm
+    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
+INSANE_SKIP_${PN} = "arch staticdev"
-- 
1.9.1


