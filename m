Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DF79E009F8; Mon,  1 Jun 2015 07:54:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 158CDE00A38
	for <meta-ti@yoctoproject.org>; Mon,  1 Jun 2015 07:54:47 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id C95EC52A47; Mon,  1 Jun 2015 14:54:46 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150601145446.C95EC52A47@arago-project.org>
Date: Mon,  1 Jun 2015 14:54:46 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : edma3-lld: Seperate source and version into include file.
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
X-List-Received-Date: Mon, 01 Jun 2015 14:54:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: f802ffbd1b749536dfa094b04799c2e16f33ca5b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f802ffbd1b749536dfa094b04799c2e16f33ca5b

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed May 27 22:20:15 2015 +0000

edma3-lld: Seperate source and version into include file.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/edma3-lld/edma3-lld.inc    |   10 ++++++++++
 recipes-bsp/edma3-lld/edma3-lld_git.bb |   11 +----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
new file mode 100644
index 0000000..e6dd92b
--- /dev/null
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -0,0 +1,10 @@
+DESCRIPTION = "TI EDMA3 low level driver and test code"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+
+BRANCH = "master"
+SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
+# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
+SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
+
+PV = "2.11.13"
diff --git a/recipes-bsp/edma3-lld/edma3-lld_git.bb b/recipes-bsp/edma3-lld/edma3-lld_git.bb
old mode 100755
new mode 100644
index 1ed4b93..913dd3e
--- a/recipes-bsp/edma3-lld/edma3-lld_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld_git.bb
@@ -1,13 +1,5 @@
-DESCRIPTION = "TI EDMA3 low level driver and test code"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5bdceac872dffdec915b819654ee23ea"
+require edma3-lld.inc
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
-# The following commit corresponds to tag DEV_EDMA3_LLD_02_11_13_17
-SRCREV = "8c27e548fa53ca8472404ef347b8f6b6e2588d46"
-
-PV = "2.11.13"
 PR = "r0"
 
 COMPATIBLE_MACHINE = "keystone"
@@ -77,4 +69,3 @@ do_install () {
 	install -c -m 755 ${S}/examples/edma3_user_space_driver/evmC66AK2E/bin/c66ak2e-evm/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg \
 		${D}/${bindir}/edma3_drv_c66ak2e_a15_sample_a15host_release.xa15fg
 }
-


