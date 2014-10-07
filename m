Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B860E0076C; Tue,  7 Oct 2014 12:24:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 959D2E00848
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:24:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7A098529DD; Tue,  7 Oct 2014 19:23:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141007192359.7A098529DD@arago-project.org>
Date: Tue,  7 Oct 2014 19:23:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : omapdrm-pvr: recipe update for SGX KM compatible with Kernel 3.12
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
X-List-Received-Date: Tue, 07 Oct 2014 19:24:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 937b7408f296d1f75467b5334e85a79305935a00
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=937b7408f296d1f75467b5334e85a79305935a00

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Tue Sep 23 22:00:31 2014 +0000

omapdrm-pvr: recipe update for SGX KM compatible with Kernel 3.12

* Also adapted recipe to directory restructuring

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index a129e60..bd78b36 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -1,22 +1,22 @@
 DESCRIPTION =  "Kernel drivers for the PowerVR SGX chipset found in the omap5 SoCs"
 HOMEPAGE = "http://git.ti.com"
 LICENSE = "MIT | GPLv2"
-LIC_FILES_CHKSUM = "file://README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
+LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=74506d9b8e5edbce66c2747c50fcef12"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git"
 S = "${WORKDIR}/git"
 
-SRCREV = "86a4ffae3458c51f0a58e44b17b7a4fd92d2b8c6"
+SRCREV = "bf8997b894f216261f914f64d33e6e588770da5a"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
 
 do_compile_prepend() {
-    cd ${S}/eurasiacon/build/linux2/omap5430_linux
+    cd ${S}/eurasia_km/eurasiacon/build/linux2/omap5430_linux
 }
 
 do_install() {


