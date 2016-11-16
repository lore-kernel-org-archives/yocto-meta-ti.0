Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E67C7E00C2E; Wed, 16 Nov 2016 11:34:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5574E00C2E
	for <meta-ti@yoctoproject.org>; Wed, 16 Nov 2016 11:34:07 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7E06852ACB; Wed, 16 Nov 2016 19:34:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161116193406.7E06852ACB@arago-project.org>
Date: Wed, 16 Nov 2016 19:34:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : ti-sgx-ddk-km: disable parallel builds for SGX driver
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
X-List-Received-Date: Wed, 16 Nov 2016 19:34:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e1b686cc0158cf5855dd846884eb4d47251a4267
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e1b686cc0158cf5855dd846884eb4d47251a4267

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Wed Nov  9 14:39:58 2016 +0000

ti-sgx-ddk-km: disable parallel builds for SGX driver

Random build failures are reported on SGX driver when building for

different targets. Disable parallel compilation in SGX driver.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index d0e9206..0e9592e 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -31,6 +31,8 @@ TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"
 TARGET_PRODUCT_ti43x = "ti437x"
 
+PARALLEL_MAKE = ""
+
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}" TARGET_PRODUCT=${TARGET_PRODUCT}'
 
 do_compile_prepend() {


