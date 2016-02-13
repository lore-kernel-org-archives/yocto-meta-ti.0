Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E104FE00CD4; Sat, 13 Feb 2016 06:29:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92748E00CD0
	for <meta-ti@yoctoproject.org>; Sat, 13 Feb 2016 06:28:56 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1DESud0009276
	for <meta-ti@yoctoproject.org>; Sat, 13 Feb 2016 08:28:56 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1DEStEE007119
	for <meta-ti@yoctoproject.org>; Sat, 13 Feb 2016 08:28:55 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 13 Feb 2016 08:28:55 -0600
Received: from uda0876520.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1DESrm9009329;	Sat, 13 Feb 2016 08:28:54 -0600
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sat, 13 Feb 2016 20:00:36 +0530
Message-ID: <1455373837-15354-1-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] omapdrm_pvr: SGX kernel mode driver v1.14 for all TI SoCs
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
X-List-Received-Date: Sat, 13 Feb 2016 14:29:01 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.14.3699939.bb    | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
new file mode 100644
index 0000000..e6e4e5d
--- /dev/null
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
@@ -0,0 +1,34 @@
+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
+LICENSE = "MIT | GPLv2"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+
+inherit module
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
+
+MACHINE_KERNEL_PR_append = "i"
+PR = "${MACHINE_KERNEL_PR}"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+BRANCH = "ti-img-sgx/${PV}/k4.1"
+
+SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
+S = "${WORKDIR}/git"
+
+SRCREV = "fed0756f1b8b9d526da2821635c7d742989d47c3"
+
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
+
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
+
+do_compile_prepend() {
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
+}
+
+do_install() {
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+}
-- 
1.9.1


