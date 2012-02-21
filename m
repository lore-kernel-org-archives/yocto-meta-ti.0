Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 564DBE0123C
	for <meta-ti@yoctoproject.org>; Mon, 20 Feb 2012 18:26:20 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 49E6E52AB4; Tue, 21 Feb 2012 02:26:19 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120221022619.49E6E52AB4@arago-project.org>
Date: Tue, 21 Feb 2012 02:26:19 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Peter A. Bigot : ti-dmai_svn: correct path within svn checkout
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
X-List-Received-Date: Tue, 21 Feb 2012 02:26:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: a365e31ab237156244ff265a7c2d11153f2ef9b1
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a365e31ab237156244ff265a7c2d11153f2ef9b1

Author: Peter A. Bigot <bigotp@acm.org>
Date:   Tue Jan 31 06:40:57 2012 -0600

ti-dmai_svn: correct path within svn checkout

At r642 as currently retrieved, the contents of ${S} are subdirectories dmai
and patches, so the subsequent attempt to run "make clean" in ${S} fails
because there is no Makefile there.  Append /dmai to the default ${S},
remove the now incorrect /dmai from LIC_FILES_CHKSUM, and correct the
strippath for the patches to reflect the new starting location.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
Acked-by: Roger Monk <r-monk@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/dmai/ti-dmai_svn.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 3c5595d..3ac7a81 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -1,11 +1,14 @@
 require ti-dmai.inc
 
+# Need to descend one level more to find source
+S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
+
 # Hack to be able to use recent kernel headers from userspace
 TARGET_CC_ARCH += " -D__EXPORTED_HEADERS__"
 
 PV = "2_10_00_01+svnr${SRCPV}"
 
-LIC_FILES_CHKSUM = "file://dmai/dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54d7fa607"
+LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54d7fa607"
 
 # This package has high dependence on kernel, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
@@ -29,7 +32,7 @@ SRCREV_omapl137       = "482"
 SRCREV_omapl138       = "570"
 SRCREV               ?= "UNDEFINED_SRCREV"
 
-SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=2 \
-                   file://r642-fix-config-bld.diff;striplevel=2 \
+SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
+                   file://r642-fix-config-bld.diff;striplevel=3 \
                  "
 


