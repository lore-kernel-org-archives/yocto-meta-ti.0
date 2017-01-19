Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BCE4E004D2; Wed, 18 Jan 2017 18:09:29 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 881C2E00480
	for <meta-ti@yoctoproject.org>; Wed, 18 Jan 2017 18:09:27 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B4B86529CD; Thu, 19 Jan 2017 02:09:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170119020926.B4B86529CD@arago-project.org>
Date: Thu, 19 Jan 2017 02:09:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: e-ruei1@ti.com : ti-sgx-ddk-km: remove update of sysconfig register in driver
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
X-List-Received-Date: Thu, 19 Jan 2017 02:09:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: d9a81e3be2945e11bd9da58b6de2ac31d51e9286
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d9a81e3be2945e11bd9da58b6de2ac31d51e9286

Author: e-ruei1@ti.com <e-ruei1@ti.com>
Date:   Tue Jan 17 21:57:55 2017 +0000

ti-sgx-ddk-km: remove update of sysconfig register in driver

The OCP SYSCONFIG register should be controlled by kernel hwmod only.
the original code sets the SGX idle and standby mode to "No Standby"
which prevents the SGX power domain to reach off state during suspend.
Even though the problem was only introduced with kernel 4.4 upgrade, i.e.
it seemed to be no harm before, we should remove the same.

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 6d48fdd..ca5916e 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -7,7 +7,7 @@ inherit module
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15"
 
-MACHINE_KERNEL_PR_append = "j"
+MACHINE_KERNEL_PR_append = "k"
 PR = "${MACHINE_KERNEL_PR}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
@@ -25,7 +25,7 @@ BRANCH = "ti-img-sgx/${PV}/k4.4"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "bc3128527024bd76f9ab4d8d7db13ad65a24458b"
+SRCREV = "8d5305b03dce13f3a9a89328c69c762dcd3109a4"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"


