Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 06016E007DC; Mon, 15 Feb 2016 12:31:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=5.0 tests=BAYES_00, NO_RDNS_DOTCOM_HELO,
	RCVD_IN_DNSWL_LOW,URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.23 listed in list.dnswl.org]
	*  0.8 NO_RDNS_DOTCOM_HELO Host HELO'd as a big ISP, but had no rDNS
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0E113E0079A
	for <meta-ti@yoctoproject.org>; Mon, 15 Feb 2016 12:31:40 -0800 (PST)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.153])
	by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O2L006W4VO2PTW0@vms173023.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 15 Feb 2016 14:31:27 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=jFJIQSaiL_oA:10 a=sozttTNsAAAA:8	a=7DQiEtIss1jMj1yzuboA:9
Received: by 100.15.86.14 with SMTP id 47c82bd8; Mon, 15 Feb 2016 20:31:27 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 7D61C161B15;	Mon,
	15 Feb 2016 15:31:14 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 15 Feb 2016 15:31:10 -0500
Message-id: <1455568271-11485-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
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
X-List-Received-Date: Mon, 15 Feb 2016 20:31:44 -0000

From: Anand Balagopalakrishnan <anandb@ti.com>

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 ..._1.9.2253347.bb => omapdrm-pvr_1.14.3699939.bb} |   30 +++++++-------------
 1 file changed, 11 insertions(+), 19 deletions(-)
 copy recipes-bsp/powervr-drivers/{omapdrm-pvr_1.9.2253347.bb => omapdrm-pvr_1.14.3699939.bb} (39%)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
similarity index 39%
copy from recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
copy to recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
index 4552fe1..e6e4e5d 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.14.3699939.bb
@@ -1,7 +1,7 @@
-DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
-HOMEPAGE = "http://git.ti.com"
+DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the TI SoCs"
+HOMEPAGE = "https://git.ti.com/graphics/omap5-sgx-ddk-linux"
 LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bfc03386bb4d8d9381b79d33898"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
 
 inherit module
 
@@ -12,31 +12,23 @@ PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-BRANCH_omap-a15 = "dra7/k4.1"
-BRANCH_ti33x = "am4/k4.1"
-BRANCH_ti43x = "am4/k4.1"
+BRANCH = "ti-img-sgx/${PV}/k4.1"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV_omap-a15 = "c53a5dfb9f4d5612c372ec8e252cb13a731c9c10"
-SRCREV_ti33x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
-SRCREV_ti43x = "f7ae3f68dd6a05f67b15702b823ed15d2c03105d"
+SRCREV = "fed0756f1b8b9d526da2821635c7d742989d47c3"
 
-PVR_NULLDRM_ti33x = "1"
-PVR_NULLDRM_ti43x = "0"
-PVR_NULLDRM_omap-a15 = "0"
+TARGET_PRODUCT_omap-a15 = "jacinto6evm"
+TARGET_PRODUCT_ti33x = "ti335x"
+TARGET_PRODUCT_ti43x = "ti437x"
 
-EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" PVR_NULLDRM=${PVR_NULLDRM}'
-
-DEVICE_SUB_DIR_omap-a15 = "omap5430"
-DEVICE_SUB_DIR_ti33x = "omap335x"
-DEVICE_SUB_DIR_ti43x = "omap437x"
+EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
 
 do_compile_prepend() {
-    cd ${S}/eurasia_km/eurasiacon/build/linux2/${DEVICE_SUB_DIR}_linux
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap_linux
 }
 
 do_install() {
-    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_${DEVICE_SUB_DIR}_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
+    make -C ${STAGING_KERNEL_DIR} SUBDIRS=${B}/eurasia_km/eurasiacon/binary2_omap_linux_release/target/kbuild INSTALL_MOD_PATH=${D} PREFIX=${STAGING_DIR_HOST} modules_install
 }
-- 
1.7.9.5


