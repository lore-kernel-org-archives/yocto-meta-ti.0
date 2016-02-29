Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96DB2E00D29; Sun, 28 Feb 2016 22:40:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0BB1E00C72
	for <meta-ti@yoctoproject.org>; Sun, 28 Feb 2016 22:40:56 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1T6euUi013034
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 00:40:56 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1T6eu7b007688
	for <meta-ti@yoctoproject.org>; Mon, 29 Feb 2016 00:40:56 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 29 Feb 2016 00:40:55 -0600
Received: from uda0876520.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1T6erBU015838;	Mon, 29 Feb 2016 00:40:55 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 29 Feb 2016 12:12:38 +0530
Message-ID: <1456728158-25636-2-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456728158-25636-1-git-send-email-anandb@ti.com>
References: <1456728158-25636-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] omapdrm_pvr: remove version 1.9.2253347 as replaced by 1.14.3699939
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
X-List-Received-Date: Mon, 29 Feb 2016 06:40:59 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     | 42 ----------------------
 1 file changed, 42 deletions(-)
 delete mode 100644 recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
deleted file mode 100644
index 4552fe1..0000000
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
-HOMEPAGE = "http://git.ti.com"
-LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bfc03386bb4d8d9381b79d33898"
-
-inherit module
-
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
-
-MACHINE_KERNEL_PR_append = "i"
-PR = "${MACHINE_KERNEL_PR}"
-
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
-BRANCH_omap-a15 = "dra7/k4.1"
-BRANCH_ti33x = "am4/k4.1"
-BRANCH_ti43x = "am4/k4.1"
-
-SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
-S = "${WORKDIR}/git"
-
-SRCREV_omap-a15 = "c53a5dfb9f4d5612c372ec8e252cb13a731c9c10"
-SRCREV_ti33x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
-SRCREV_ti43x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
-
-PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "0"
-PVR_NULLDRM_omap-a15 = "0"
-
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'
-
-DEVICE_SUB_DIR_omap-a15 = "omap5430"
-DEVICE_SUB_DIR_ti33x = "omap335x"
-DEVICE_SUB_DIR_ti43x = "omap437x"
-
-do_compile_prepend() {
-    cd ${S}/eurasia_km/eurasiacon/build/linux2/${DEVICE_SUB_DIR}_linux
-}
-
-do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_${DEVICE_SUB_DIR}_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
-}
-- 
1.9.1


