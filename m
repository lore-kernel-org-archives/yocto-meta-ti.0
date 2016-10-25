Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EFBEFE00C7D; Mon, 24 Oct 2016 19:29:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 45015E00C71
	for <meta-ti@yoctoproject.org>; Mon, 24 Oct 2016 19:29:38 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 41DBE52AC6; Tue, 25 Oct 2016 02:29:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161025022934.41DBE52AC6@arago-project.org>
Date: Tue, 25 Oct 2016 02:29:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Anand Balagopalakrishnan : ti-sgx-ddk-km: remove dependency between user-mode and kernel-mode builds
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
X-List-Received-Date: Tue, 25 Oct 2016 02:29:43 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a5ff1c0717ba7c3c53bd72fbf2bcc18cf2798633
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a5ff1c0717ba7c3c53bd72fbf2bcc18cf2798633

Author: Anand Balagopalakrishnan <anandb@ti.com>
Date:   Thu Oct 13 18:38:06 2016 +0000

ti-sgx-ddk-km: remove dependency between user-mode and kernel-mode builds

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb  |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 7007c20..d0e9206 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -25,7 +25,7 @@ BRANCH = "ti-img-sgx/${PV}/k4.4"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "a5a0fe1799cabfa1278321b667263cf3fa2cf32f"
+SRCREV = "e68719ba7c54602c710b6615cd665f5b7f47f85e"
 
 TARGET_PRODUCT_omap-a15 = "jacinto6evm"
 TARGET_PRODUCT_ti33x = "ti335x"


