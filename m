Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 873C8E00D9D; Wed,  9 Sep 2015 13:09:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C064E00D7B
	for <meta-ti@yoctoproject.org>; Wed,  9 Sep 2015 13:09:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id F026152A6D; Wed,  9 Sep 2015 20:09:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150909200929.F026152A6D@arago-project.org>
Date: Wed,  9 Sep 2015 20:09:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : vpe-tests: resolve conflict with vpdma-fw
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
X-List-Received-Date: Wed, 09 Sep 2015 20:09:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: fcf175de9490cbfa03ad843138cbc2ab878c7513
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fcf175de9490cbfa03ad843138cbc2ab878c7513

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Sep 10 01:54:47 2015 +0000

vpe-tests: resolve conflict with vpdma-fw

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vpe-tests/vpe-tests_git.bb |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
index 776bda5..951544b 100644
--- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -3,9 +3,9 @@ DESCRIPTION = "VPE test program"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
-DEPENDS = "virtual/kernel"
+DEPENDS = "virtual/kernel vpdma-fw"
 
-PR = "r2"
+PR = "r3"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
@@ -25,4 +25,6 @@ EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOAT
 
 do_install() {
     oe_runmake DESTDIR="${D}" install
+    rm -rf ${D}${base_libdir}/firmware/vpdma-*.bin
+    rmdir -p ${D}${base_libdir}/firmware || true
 }


