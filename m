Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D578E00C58; Fri, 28 Aug 2015 09:31:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFC8CE00C0F
	for <meta-ti@yoctoproject.org>; Fri, 28 Aug 2015 09:31:11 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 114DC52A65; Fri, 28 Aug 2015 16:31:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150828163111.114DC52A65@arago-project.org>
Date: Fri, 28 Aug 2015 16:31:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omapdrm-pvr: bump rev to match v3 of corresponding kernel patches
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
X-List-Received-Date: Fri, 28 Aug 2015 16:31:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0101a0942c2b1721dd1a56f760e19118e56a0007
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0101a0942c2b1721dd1a56f760e19118e56a0007

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Aug 28 22:01:59 2015 +0000

omapdrm-pvr: bump rev to match v3 of corresponding kernel patches

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
index 665c3de..e2d01cd 100644
--- a/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
+++ b/recipes-bsp/powervr-drivers/omapdrm-pvr_1.9.2253347.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://eurasia_km/README;beginline=13;endline=22;md5=2b841bf
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "g"
+MACHINE_KERNEL_PR_append = "h"
 PR = "${MACHINE_KERNEL_PR}"
 
 BRANCH = "dra7/k4.1"
@@ -13,7 +13,7 @@ BRANCH = "dra7/k4.1"
 SRC_URI = "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git"
 
-SRCREV = "333ef031a98c0abdd49b6cfac61fbdd8c1d88518"
+SRCREV = "e06c0a4e11401534b938b9a7b1c3f27a65db871f"
 
 EXTRA_OEMAKE += 'KERNELDIR="${STAGING_KERNEL_DIR}"'
 


