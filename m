Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DDDCE00BDC; Thu,  6 Jul 2017 15:56:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 112B7E00BC1
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 15:56:32 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66MuWeA021884
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:56:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499381792;
	bh=92Q1NL4scqzOoUBF3Y0bWXRIDjZtXcjvQA6v9VNZuL0=;
	h=From:To:CC:Subject:Date;
	b=nZEyGH1ERM+WXjh3vniNgm1WbosmJE2ncg9CKPKl3LSgV26koiKjbiAXJLaZIVQgw
	sTScMG/F8urzHLfVYTPzXvSSvV+NbjcLgnmGXKk4muaeebAh/UYWsrMMebZCD1KtLw
	LASUVWlQTmqknro5PZQYCap+mPwEz+OtkV2/J1UQ=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66MuW7u012709
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 17:56:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 17:56:31 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66MuVEC022673;	Thu, 6 Jul 2017 17:56:31 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 18:56:30 -0400
Message-ID: <1499381790-61156-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] stw-lld-rtos: Added rtos recipe for stw-lld
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
X-List-Received-Date: Thu, 06 Jul 2017 22:56:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/stw-lld/stw-lld-rtos_git.bb | 60 +++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)
 create mode 100644 recipes-bsp/stw-lld/stw-lld-rtos_git.bb

diff --git a/recipes-bsp/stw-lld/stw-lld-rtos_git.bb b/recipes-bsp/stw-lld/stw-lld-rtos_git.bb
new file mode 100644
index 0000000..e50fd45
--- /dev/null
+++ b/recipes-bsp/stw-lld/stw-lld-rtos_git.bb
@@ -0,0 +1,60 @@
+require recipes-ti/includes/ti-paths.inc
+require recipes-ti/includes/ti-staging.inc
+
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM_dra7xx-evm = "file://stw_lld_component.mk;beginline=1;endline=35;md5=2a19315729a9cb8a4a463e920f36e090"
+
+COMPATIBLE_MACHINE = "dra7xx-evm"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+DEPENDS = " common-csl-ip-rtos \
+            pm-lld-rtos \
+            vps-lld-rtos \
+"
+
+STW_LLD_GIT_URI = "git://gerrit01.dal.design.ti.com:8445/ADAS/stw_lld"
+STW_LLD_GIT_PROTOCOL = "https"
+STW_LLD_GIT_BRANCH = "master"
+STW_LLD_GIT_DESTSUFFIX = "git/ti/drv/stw_lld"
+
+# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
+STW_LLD_SRCREV = "63391ee1bf978eef61ea472ec4fcec7b77de7d0c"
+
+BRANCH = "${STW_LLD_GIT_BRANCH}"
+SRC_URI = "${STW_LLD_GIT_URI};destsuffix=${STW_LLD_GIT_DESTSUFFIX};protocol=${STW_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+
+SRCREV = "${STW_LLD_SRCREV}"
+PV = "01.00.00.00"
+PR = "r0"
+
+S = "${WORKDIR}/${STW_LLD_GIT_DESTSUFFIX}"
+
+export TOOLCHAIN_PATH_A15 = "${GCC_ARM_NONE_TOOLCHAIN}"
+export FPULIB_PATH = "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/4.9.3/fpu/"
+export TOOLCHAIN_PATH_M4 = "${M4_TOOLCHAIN_INSTALL_DIR}"
+export C6X_GEN_INSTALL_PATH = "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x"
+export PDK_INSTALL_PATH = "${PDK_INSTALL_DIR}/packages"
+
+export PDK_STW_LLD_ROOT_PATH = "${WORKDIR}/git"
+
+# Used by DEST_ROOT to redirect binary and obj files away from sysroot PDK tree
+OBJ_DIR = "${WORKDIR}/git/ti/binary"
+
+LIMSOCS_dra7xx-evm="dra72x dra75x dra78x"
+LIMBOARDS_dra7xx-evm="evmDRA72x evmDRA75x evmDRA78x"
+
+do_compile() {
+
+    make clean all LIMIT_SOCS="${LIMSOCS}" LIMIT_BOARDS="${LIMBOARDS}" DEST_ROOT=${OBJ_DIR}
+
+    tar -cf stw_lld.tar --exclude='*.tar' --exclude='*.git*' ./*
+}
+
+do_install() {
+
+    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/stw_lld
+    find -name "*.tar" -exec tar xf {} -C ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/stw_lld \;
+}
+
+FILES_${PN} += "${PDK_INSTALL_DIR_RECIPE}/packages"
+
-- 
1.9.1


