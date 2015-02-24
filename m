Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8007E00961; Tue, 24 Feb 2015 13:11:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=BAYES_00, RDNS_DYNAMIC, URI_HEX
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3CA0FE0090F
	for <meta-ti@yoctoproject.org>; Tue, 24 Feb 2015 13:11:48 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E022852A30; Tue, 24 Feb 2015 21:11:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150224211147.E022852A30@arago-project.org>
Date: Tue, 24 Feb 2015 21:11:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : omapdrm-pvr: recipe update for SGX KM for Kernel 3.14
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
X-List-Received-Date: Tue, 24 Feb 2015 21:11:55 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 6dba2733094dcad75c5c64c0421f961255e78e84
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6dba2733094dcad75c5c64c0421f961255e78e84

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Mon Feb 23 19:20:52 2015 +0000

omapdrm-pvr: recipe update for SGX KM for Kernel 3.14

* Change do_install for updated directory structure

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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


