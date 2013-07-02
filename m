Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5A02E0140D
	for <meta-ti@yoctoproject.org>; Tue,  2 Jul 2013 08:41:05 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8089352A4D; Tue,  2 Jul 2013 15:41:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130702154103.8089352A4D@arago-project.org>
Date: Tue,  2 Jul 2013 15:41:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Siddharth Heroor : linux-ti-glsdk: update to latest fixes
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
X-List-Received-Date: Tue, 02 Jul 2013 15:41:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: c5d939ad134006e764ba2d54ee704e90d5d5ed8c
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c5d939ad134006e764ba2d54ee704e90d5d5ed8c

Author: Siddharth Heroor <heroor@ti.com>
Date:   Mon Jul  1 14:09:39 2013 +0530

linux-ti-glsdk: update to latest fixes

* Fixes for USB, SATA and enables GPU (omapdrm).
* Fix OMAP5 LDO1 value.

Signed-off-by: Siddharth Heroor <heroor@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-glsdk_3.8.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
index 2746188..9e3e499 100644
--- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
@@ -20,11 +20,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "master"
 
-SRCREV = "4e8193eb3b7465d7f67cd8c7e6c2ed99dad1a483"
+SRCREV = "6076e6882d1d6a64b104e42e56a3eada36605cb3"
 PV = "3.8.13"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-3-8-y-kernel.git;protocol=git;branch=${BRANCH} \
            file://defconfig \


