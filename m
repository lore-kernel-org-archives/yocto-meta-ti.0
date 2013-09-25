Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E66AFE0162C
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 13:57:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A9C7E52AAF; Wed, 25 Sep 2013 20:57:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130925205739.A9C7E52AAF@arago-project.org>
Date: Wed, 25 Sep 2013 20:57:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: fix missing kernel image in /boot
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
X-List-Received-Date: Wed, 25 Sep 2013 20:57:49 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7b4870a30d8a151be5683adb97bb319b615afc81
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7b4870a30d8a151be5683adb97bb319b615afc81

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep 25 14:49:14 2013 -0400

linux-ti-staging: fix missing kernel image in /boot

We rely on kernel-base having run-time dependency on kernel-image, which
normally would pull uImage/zImage into /boot directory of rootfs.
Thanks to Chase for pointing me in the right direction by noticing that our
addition of cm3 firmware breaks that dependency for ti33x.
The reason for that is RDEPENDS is being conditionally assigned with ?=
in kernel.bbclass and using += with machine-override clears that value due
to the order of processing. Hence _append should be used instead of += to
process it after the machine-override takes place.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_3.8.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-kernel/linux/linux-ti-staging_3.8.bb
index fd7b671..833fb48 100644
--- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
+++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
@@ -11,7 +11,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.
diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-kernel/linux/linux-ti-staging_git.bb
index e903215..778ea7f 100644
--- a/recipes-kernel/linux/linux-ti-staging_git.bb
+++ b/recipes-kernel/linux/linux-ti-staging_git.bb
@@ -10,7 +10,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 
 # Add a run-time dependency for the PM firmware to be installed
 # on the target file system.
-RDEPENDS_kernel-base_ti33x += "am33x-cm3 am33x-cm3-initscript"
+RDEPENDS_kernel-base_append_ti33x = " am33x-cm3 am33x-cm3-initscript"
 
 # Default is to package all dtb files for ti33x devices unless building
 # for the specific beaglebone machine.


