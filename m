Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ECB37E00A1A; Mon,  6 Jul 2015 01:28:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32899E009CC
	for <meta-ti@yoctoproject.org>; Mon,  6 Jul 2015 01:28:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t668Sam1020098
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 03:28:36 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t668SakS030043
	for <meta-ti@yoctoproject.org>; Mon, 6 Jul 2015 03:28:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 6 Jul 2015 03:28:24 -0500
Received: from swubn01.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t668SZPL005664;
	Mon, 6 Jul 2015 03:28:35 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 6 Jul 2015 13:58:32 +0530
Message-ID: <1436171313-7471-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [[GRAPHICS PATCHES] [for daisy, master] 1/2] omapdrm-pvr: Bug fixes and updates to the driver
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
X-List-Received-Date: Mon, 06 Jul 2015 08:28:41 -0000
Content-Type: text/plain

 * Fixed array out of bounds issue which causes failure in create_gem_wrapper
 * Truncate SGX HW recovery traces

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 39885f8..e173557 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bf
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "e"
+MACHINE_KERNEL_PR_append = "f"
 PR = "${MACHINE_KERNEL_PR}"
 
 BRANCH = "next"
@@ -13,7 +13,7 @@ BRANCH = "next"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "872aa64b227cadbc97755a4192919dd5ca637971"
+SRCREV = "430673f78b79eccdf308a6bbfb524209b485d2cc"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
 
-- 
1.7.9.5


