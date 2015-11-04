Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C4265E00B28; Wed,  4 Nov 2015 07:00:39 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE35DE00B37
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8A35F52AB0; Wed,  4 Nov 2015 15:00:04 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150004.8A35F52AB0@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:04 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : mmap-lld-test: Only build binaries relevent to the machine
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:39 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 5a8aabf3bc74b97451af9d302398e54d51b710fd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a8aabf3bc74b97451af9d302398e54d51b710fd

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:19 2015 +0000

mmap-lld-test: Only build binaries relevent to the machine

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld-test_git.bb |   10 +++++-----
 recipes-bsp/mmap-lld/mmap-lld.inc         |    4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 0617376..5fdb646 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -1,15 +1,15 @@
 DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
 include mmap-lld.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
-DEVICELIST = "k2h \
-              k2k \
-              k2e \
-"
+DEVICELIST_k2hk-evm = "k2h k2k"
+DEVICELIST_k2e-evm  = "k2e"
 
 CHOICELIST = " yes \
                no \
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index cde0fec..3dfc93c 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -1,6 +1,6 @@
 LICENSE = "BSD-3-Clause"
 
-COMPATIBLE_MACHINE = "keystone"
+COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
@@ -17,6 +17,6 @@ SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${
 SRCREV = "${MMAP_LLD_SRCREV}"
 
 PV = "2.0.0.4"
-INC_PR = "r2"
+INC_PR = "r3"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"


