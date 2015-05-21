Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2993E009E6; Thu, 21 May 2015 08:12:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87093E009D9
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 08:12:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 26977529AE; Thu, 21 May 2015 15:12:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150521151201.26977529AE@arago-project.org>
Date: Thu, 21 May 2015 15:12:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : vpe-tests: mark as machine-specific due to kernel dependency
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
X-List-Received-Date: Thu, 21 May 2015 15:12:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 447523d268063b5277d868d30c9ca12c1409df7a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=447523d268063b5277d868d30c9ca12c1409df7a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 21 07:56:24 2015 +0000

vpe-tests: mark as machine-specific due to kernel dependency

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vpe-tests/vpe-tests_git.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
index ee91dea..776bda5 100644
--- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -5,10 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
 DEPENDS = "virtual/kernel"
 
-PR="r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "dra7xx"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"
 BRANCH ?= "master"
 
@@ -24,4 +26,3 @@ EXTRA_OEMAKE = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${TARGET_PREFIX}gcc ${FLOAT
 do_install() {
     oe_runmake DESTDIR="${D}" install
 }
-


