Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15F84E00CCA; Wed, 23 Nov 2016 10:08:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D20C1E00CAF
	for <meta-ti@yoctoproject.org>; Wed, 23 Nov 2016 10:08:33 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C5E3D52AD0; Wed, 23 Nov 2016 18:08:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161123180832.C5E3D52AD0@arago-project.org>
Date: Wed, 23 Nov 2016 18:08:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : dsptop: fix build with any toolchain by passing correct CC var
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
X-List-Received-Date: Wed, 23 Nov 2016 18:08:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ab0505ceb0e983b21ac9a254176c657177cacb36
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ab0505ceb0e983b21ac9a254176c657177cacb36

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Nov 19 03:51:23 2016 +0000

dsptop: fix build with any toolchain by passing correct CC var

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/dsptop_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/dsptop/dsptop_git.bb b/recipes-bsp/dsptop/dsptop_git.bb
index 121dc9b..70f9166 100644
--- a/recipes-bsp/dsptop/dsptop_git.bb
+++ b/recipes-bsp/dsptop/dsptop_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979
 
 DEPENDS = "libulm ncurses"
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 S = "${WORKDIR}/git/dsptop"
 
@@ -12,7 +12,7 @@ DEVICE = ""
 DEVICE_dra7xx = "DRA7xx"
 DEVICE_keystone = "C66AK2Hxx"
 
-EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
+EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX} CC="${CC}""
 
 do_install() {
     oe_runmake install DESTDIR=${D}


