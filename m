Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9F93E01601
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 11:57:37 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MTP0044T3C0TGA1@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 25 Sep 2013 13:57:37 -0500 (CDT)
Received: from elrond.denix (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 4F71C20091; Wed,
	25 Sep 2013 14:57:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 25 Sep 2013 14:57:34 -0400
Message-id: <1380135454-5044-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] linux-ti-staging: fix missing kernel image in /boot
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
X-List-Received-Date: Wed, 25 Sep 2013 18:57:38 -0000

From: Denys Dmytriyenko <denys@ti.com>

We rely on kernel-base having run-time dependency on kernel-image, which
normally would pull uImage/zImage into /boot directory of rootfs.
Thanks to Chase for pointing me in the right direction by noticing that our
addition of cm3 firmware breaks that dependency for ti33x.
The reason for that is RDEPENDS is being conditionally assigned with ?=
in kernel.bbclass and using += with that is unsafe/racy and _append should
be used instead.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_3.8.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_git.bb | 2 +-
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
-- 
1.8.3.2


