Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91C46E01472
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 11:42:56 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5CE4F52A21; Mon, 18 Mar 2013 18:42:55 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130318184255.5CE4F52A21@arago-project.org>
Date: Mon, 18 Mar 2013 18:42:55 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omapl138: fix alignment issue of 2.6. 37 kernel with gcc-4.7
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
X-List-Received-Date: Mon, 18 Mar 2013 18:42:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: a81353cabbda057be390fc7e9c2c47984fa0b76b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=a81353cabbda057be390fc7e9c2c47984fa0b76b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Feb 25 22:48:33 2013 -0500

linux-omapl138: fix alignment issue of 2.6.37 kernel with gcc-4.7

Patch by Steve Sakoman

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
index 9618d42..0b6c50d 100644
--- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
+++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
@@ -6,7 +6,7 @@ KERNEL_IMAGETYPE = "uImage"
 require multi-kernel.inc
 require tipspkernel.inc
 
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 
 S = "${WORKDIR}/git"
 
@@ -34,3 +34,8 @@ PATCHES_OVER_PSP = " \
 
 # Updated PIO mode for MUSB help description
 PATCHES_OVER_PSP += "file://0001-musb-update-PIO-mode-help-information-in-Kconfig.patch"
+
+# Fix alignment issue with gcc-4.7
+PATCHES_OVER_PSP += " \
+    file://0001-arm-fix-builds-with-gcc-4.7.patch \
+"


