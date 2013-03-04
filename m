Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6133E014E3
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2013 09:15:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9F3C152A8E; Mon,  4 Mar 2013 17:15:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130304171528.9F3C152A8E@arago-project.org>
Date: Mon,  4 Mar 2013 17:15:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap: replace use of FILESPATHPKG with FILESEXTRAPATHS
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
X-List-Received-Date: Mon, 04 Mar 2013 17:15:29 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 36fde3ec4125ddf4f41375fac300e9146ed47e24
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=36fde3ec4125ddf4f41375fac300e9146ed47e24

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar  4 12:10:47 2013 -0500

linux-omap: replace use of FILESPATHPKG with FILESEXTRAPATHS

Thanks to Robert P. J. Day for reporting.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omap_2.6.37.bb |    2 +-
 recipes-kernel/linux/linux-omap_2.6.39.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-kernel/linux/linux-omap_2.6.37.bb
index aa7d2fc..62076fb 100644
--- a/recipes-kernel/linux/linux-omap_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
@@ -10,7 +10,7 @@ PV = "2.6.37"
 MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
 SRCREV = "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
 
-FILESPATHPKG_prepend = "linux-omap-2.6.37:"
+FILESEXTRAPATHS_prepend := "{THISDIR}/${PN}-${PV}:"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
 	   file://defconfig"
diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-kernel/linux/linux-omap_2.6.39.bb
index 34e24e7..ae90ad2 100644
--- a/recipes-kernel/linux/linux-omap_2.6.39.bb
+++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
@@ -9,7 +9,7 @@ COMPATIBLE_MACHINE = "(beagleboard)"
 SRCREV_pn-${PN} = "v2.6.39"
 MACHINE_KERNEL_PR_append = "o"
 
-FILESPATHPKG_prepend = "linux-omap-2.6.39:"
+FILESEXTRAPATHS_prepend := "{THISDIR}/${PN}-${PV}:"
 
 SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git;protocol=git \
             file://defconfig"


