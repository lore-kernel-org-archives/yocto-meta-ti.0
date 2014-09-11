Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 601A6E00842; Thu, 11 Sep 2014 08:02:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C2B0E006DB
	for <meta-ti@yoctoproject.org>; Thu, 11 Sep 2014 08:02:26 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0DD1552972; Thu, 11 Sep 2014 15:02:26 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140911150226.0DD1552972@arago-project.org>
Date: Thu, 11 Sep 2014 15:02:26 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : vpe-vpdma: pass float ABI flag to fix gcc-4.9. 1 issue with stubs
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
X-List-Received-Date: Thu, 11 Sep 2014 15:02:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ec7902f7ef856e01abc378c4dcf3a84437817841
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ec7902f7ef856e01abc378c4dcf3a84437817841

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Sep  9 05:31:16 2014 +0000

vpe-vpdma: pass float ABI flag to fix gcc-4.9.1 issue with stubs

Similar fix as 7b8ee4026e0e3b69a8ce5526be24ba70321e88dc, see for more details.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
index 14f059b..f7a63ab 100644
--- a/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
+++ b/recipes-bsp/vpe-vpdma/vpe-vpdma_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 COMPATIBLE_MACHINE = "dra7xx"
 
 PV = "1b8"
-PR = "r1"
+PR = "r2"
 
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
@@ -17,8 +17,10 @@ SRC_URI = "git://git.ti.com/vpe_tests/vpe_tests.git;protocol=git;branch=${BRANCH
 
 S = "${WORKDIR}/git"
 
+FLOATABI = "${@base_contains("TUNE_FEATURES", "vfp", base_contains("TUNE_FEATURES", "callconvention-hard", " -mfloat-abi=hard", " -mfloat-abi=softfp", d), "" ,d)}"
+
 # The test application needs additional include headers from the kernel
-EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
+EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOATABI}" KDIR="${STAGING_KERNEL_DIR}/include/uapi -I${STAGING_KERNEL_DIR}/include"'
 
 do_install() {
     oe_runmake DESTDIR="${D}" install


