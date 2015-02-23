Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 358D5E00871; Mon, 23 Feb 2015 05:21:01 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B54C2E006B5
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 05:20:58 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1NDKvVe005685
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:20:57 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDKufu005940
	for <meta-ti@yoctoproject.org>; Mon, 23 Feb 2015 07:20:56 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 23 Feb 2015 07:20:56 -0600
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1NDKsNL009663;
	Mon, 23 Feb 2015 07:20:55 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 23 Feb 2015 18:50:52 +0530
Message-ID: <1424697652-22984-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [meta-ti 1/1] omapdrm-pvr: recipe update for SGX KM for Kernel 3.14
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
X-List-Received-Date: Mon, 23 Feb 2015 13:21:01 -0000
Content-Type: text/plain

 * Change do_install for updated directory structure

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index bd78b36..1a91e1c 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -1,17 +1,17 @@
 DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
 HOMEPAGE = "http://git.ti.com"
 LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bfc03386bb4d8d9381b79d33898"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git"
 S = "${WORKDIR}/git"
 
-SRCREV = "bf8997b894f216261f914f64d33e6e588770da5a"
+SRCREV = "0f3561a47cf7a1b968fb64446a0be10abc9a15d5"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
 
@@ -21,6 +21,6 @@ do_compile_prepend() {
 
 do_install() {
     mkdir -p ${D}/lib/modules/${KERNEL_VERSION}/extra/
-    cp ${S}/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapdrm_pvr.ko \
+    cp ${S}/eurasia_km/eurasiacon/binary2_omap5430_linux_release/target/kbuild/omapdrm_pvr.ko \
     ${D}/lib/modules/${KERNEL_VERSION}/extra/
 }
-- 
1.7.9.5


