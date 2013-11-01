Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E829BE0166B
	for <meta-ti@yoctoproject.org>; Fri,  1 Nov 2013 13:15:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2723252A8F; Fri,  1 Nov 2013 20:15:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131101201530.2723252A8F@arago-project.org>
Date: Fri,  1 Nov 2013 20:15:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Mrinmayee Hingolikar : linux-ti-glsdk: Update to latest fixes
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
X-List-Received-Date: Fri, 01 Nov 2013 20:15:34 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 400dc74ceb551281cedd2e3ed0d30af2e3cf5e9b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=400dc74ceb551281cedd2e3ed0d30af2e3cf5e9b

Author: Mrinmayee Hingolikar <mrinmayee@ti.com>
Date:   Mon Oct 21 18:48:16 2013 +0530

linux-ti-glsdk: Update to latest fixes

* Kernel source migration from git.ti.com to omapzoom.org. The development
  tree is shared between the Linux and Android teams.This enables a common
  kernel development platform for both the teams for better alignment.
* Add support for VIP and VPE
* Add wilink/wlan support
* Enable rpmsg/remoteproc driver for multimedia

Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 291e852..a843272 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -18,15 +18,15 @@ DEFAULT_PREFERENCE = "-1"
 
 S = "${WORKDIR}/git"
 
-BRANCH = "master"
+BRANCH ?= "p-ti-glsdk-3.8.y"
 
-SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
+SRCREV ?= "cc16f99176bf083829c028f9af5b8eb560debcc1"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "d+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
-SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
+SRC_URI = "git://git.omapzoom.org/kernel/omap.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
           "


