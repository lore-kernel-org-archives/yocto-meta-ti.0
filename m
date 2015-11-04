Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AFD9E00B58; Wed,  4 Nov 2015 07:00:21 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00457E008AE
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 07:00:01 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9A66952AA7; Wed,  4 Nov 2015 15:00:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104150001.9A66952AA7@arago-project.org>
Date: Wed,  4 Nov 2015 15:00:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : mmap-lld: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 15:00:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ba5a045f85afc3e510170a038ef4d55bce505bd7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ba5a045f85afc3e510170a038ef4d55bce505bd7

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:18 2015 +0000

mmap-lld: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/mmap-lld/mmap-lld-test_git.bb |    2 ++
 recipes-bsp/mmap-lld/mmap-lld.inc         |   15 +++++++++++----
 recipes-bsp/mmap-lld/mmap-lld_git.bb      |    2 ++
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
index 41e46f7..0617376 100644
--- a/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld-test_git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "TI KEYSTONE MMAP driver test binaries "
 include mmap-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS="common-csl-ip mmap-lld"
 RDEPENDS_${PN}="uio-module-drv"
 
diff --git a/recipes-bsp/mmap-lld/mmap-lld.inc b/recipes-bsp/mmap-lld/mmap-lld.inc
index a5158d5..cde0fec 100644
--- a/recipes-bsp/mmap-lld/mmap-lld.inc
+++ b/recipes-bsp/mmap-lld/mmap-lld.inc
@@ -4,12 +4,19 @@ COMPATIBLE_MACHINE = "keystone"
 
 LIC_FILES_CHKSUM = "file://COPYING.txt;md5=b3315b8190036fe1c6a8263d02e15606"
 
-BRANCH="master"
-SRC_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git;destsuffix=git/ti/runtime/mmap;protocol=git;branch=${BRANCH}"
+MMAP_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/mmap-lld.git"
+MMAP_LLD_GIT_PROTOCOL = "git"
+MMAP_LLD_GIT_BRANCH = "master"
+MMAP_LLD_GIT_DESTSUFFIX = "git/ti/runtime/mmap"
+
 # Commit correspond to DEV.MMAP.02.00.00.04
-SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
+MMAP_LLD_SRCREV = "306895eb2d5decd14a760e70d273946958ff716f"
+
+BRANCH="${MMAP_LLD_GIT_BRANCH}"
+SRC_URI = "${MMAP_LLD_GIT_URI};destsuffix=${MMAP_LLD_GIT_DESTSUFFIX};protocol=${MMAP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${MMAP_LLD_SRCREV}"
 
 PV = "2.0.0.4"
-PR = "r1"
+INC_PR = "r2"
 
 S = "${WORKDIR}/git/ti/runtime/mmap"
diff --git a/recipes-bsp/mmap-lld/mmap-lld_git.bb b/recipes-bsp/mmap-lld/mmap-lld_git.bb
index 3a56a62..1cfc90f 100644
--- a/recipes-bsp/mmap-lld/mmap-lld_git.bb
+++ b/recipes-bsp/mmap-lld/mmap-lld_git.bb
@@ -1,6 +1,8 @@
 DESCRIPTION = "TI KEYSTONE mmap driver using Keystone MPAX Programming"
 include mmap-lld.inc
 
+PR = "${INC_PR}.0"
+
 DEPENDS="common-csl-ip"
 
 do_compile () {


