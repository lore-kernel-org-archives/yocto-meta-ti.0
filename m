Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0B85E0140E
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:20:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 277E952975; Wed, 18 Apr 2012 17:20:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418172029.277E952975@arago-project.org>
Date: Wed, 18 Apr 2012 17:20:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : libgles-omap3: fix RRECOMMENDS
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 17:20:31 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 41053c22a786de9026b85b125554eea55d381a39
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=41053c22a786de9026b85b125554eea55d381a39

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Apr 17 14:47:41 2012 +0200

libgles-omap3: fix RRECOMMENDS

The modules assignment overwrote the previous ones, leading to missing libraries.

Before:
	 Package: libgles-omap3
	 Recommends: omap3-sgx-modules
After:
	 Package: libgles-omap3
	 Recommends: omap3-sgx-modules, libgles-omap3-es8, libgles-omap3-es6, libgles-omap3-es5, libgles-omap3-es3, libgles-omap3-es2

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/libgles/libgles-omap3.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
index 69254c1..fbd931f 100644
--- a/recipes-graphics/libgles/libgles-omap3.inc
+++ b/recipes-graphics/libgles/libgles-omap3.inc
@@ -3,7 +3,7 @@ LICENSE = "proprietary-binary"
 # 'TSPA.txt' might not be the best file to md5sum
 LIC_FILES_CHKSUM = "file://TSPA.txt;md5=c0d5d9c1e38b41677144c4e24d6ddee1"
 
-PR = "r25"
+PR = "r26"
 
 COMPATIBLE_MACHINE = "(omap3|ti816x|ti33x)"
 
@@ -320,7 +320,7 @@ FILES_${PN}-x11trainingcourses = "${bindir}/SGX/trainingcourses/X11/*"
 RRECOMMENDS_${PN}-x11trainingcourses = "${PN}-x11wsegl"
 
 # The libs need the kernel-modules
-RRECOMMENDS_${PN} = "omap3-sgx-modules"
+RRECOMMENDS_${PN} += "omap3-sgx-modules"
 
 # The initscript calls fbset, cputype calls devmem2
 RDEPENDS_${PN} += "fbset devmem2"


