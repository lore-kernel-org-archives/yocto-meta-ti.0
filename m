Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 014E0E00B0B; Wed,  4 Nov 2015 06:58:05 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8922E00B0B
	for <meta-ti@yoctoproject.org>; Wed,  4 Nov 2015 06:58:00 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 68BEF52AB3; Wed,  4 Nov 2015 14:57:59 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151104145759.68BEF52AB3@arago-project.org>
Date: Wed,  4 Nov 2015 14:57:59 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : hplib: Clean up recipes
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
X-List-Received-Date: Wed, 04 Nov 2015 14:58:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: b53c46e035e9aaa9b51daba6f5d4afb42ccf1341
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b53c46e035e9aaa9b51daba6f5d4afb42ccf1341

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Nov  4 01:47:13 2015 +0000

hplib: Clean up recipes

* Use INC_PR to track recipe revisions
* Define variables for GIT SRC_URI parameters

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib-test_git.bb |    2 ++
 recipes-bsp/hplib/hplib.inc         |   13 ++++++++++---
 recipes-bsp/hplib/hplib_git.bb      |    2 ++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/hplib/hplib-test_git.bb b/recipes-bsp/hplib/hplib-test_git.bb
index 574fa2a..4ba79db 100644
--- a/recipes-bsp/hplib/hplib-test_git.bb
+++ b/recipes-bsp/hplib/hplib-test_git.bb
@@ -6,6 +6,8 @@ DEPENDS = "common-csl-ip qmss-lld sa-lld pktlib hplib"
 
 include hplib.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 S = "${WORKDIR}/git/ti/runtime/hplib"
diff --git a/recipes-bsp/hplib/hplib.inc b/recipes-bsp/hplib/hplib.inc
index e4211ee..7ed47a5 100644
--- a/recipes-bsp/hplib/hplib.inc
+++ b/recipes-bsp/hplib/hplib.inc
@@ -2,9 +2,16 @@ COMPATIBLE_MACHINE = "keystone"
 
 DEVICELIST = "k2h k2k k2l k2e"
 
-BRANCH = "master"
-SRC_URI = "git://git.ti.com/keystone-rtos/hplib.git;protocol=git;branch=${BRANCH}"
+HPLIB_GIT_URI = "git://git.ti.com/keystone-rtos/hplib.git"
+HPLIB_GIT_PROTOCOL = "git"
+HPLIB_GIT_BRANCH = "master"
 
 # Below Commit ID corresponds to "DEV.HPLIB.01.01.00.06"
-SRCREV = "1cbe6a41926c131d9cab63b40d43807c6e56e2fd"
+HPLIB_SRCREV = "1cbe6a41926c131d9cab63b40d43807c6e56e2fd"
+
+BRANCH = "${HPLIB_GIT_BRANCH}"
+SRC_URI = "${HPLIB_GIT_URI};protocol=${HPLIB_GIT_PROTOCOL};branch=${BRANCH}"
+SRCREV = "${HPLIB_SRCREV}"
+
 PV = "01.01.00.06+git${SRCPV}"
+INC_PR = "r1"
diff --git a/recipes-bsp/hplib/hplib_git.bb b/recipes-bsp/hplib/hplib_git.bb
index da8853b..1423de5 100644
--- a/recipes-bsp/hplib/hplib_git.bb
+++ b/recipes-bsp/hplib/hplib_git.bb
@@ -7,6 +7,8 @@ RDEPENDS_${PN} = "hplib-mod"
 
 include hplib.inc
 
+PR = "${INC_PR}.0"
+
 CHOICELIST = "yes no"
 
 S = "${WORKDIR}/git/ti/runtime/hplib"


