Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E51B4E01469
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:25:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2DD755203A; Mon, 18 Mar 2013 23:25:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130318232512.2DD755203A@arago-project.org>
Date: Mon, 18 Mar 2013 23:25:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti33x: switch default preference to ti-staging tree
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
X-List-Received-Date: Mon, 18 Mar 2013 23:25:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 2843ce635791efd8ee8d53564867334abddaf749
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2843ce635791efd8ee8d53564867334abddaf749

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 14:34:15 2013 -0400

ti33x: switch default preference to ti-staging tree

SDKs or other users of meta-ti can still use one of the older 3.2 recipes for
stability or featureset, by setting PREFERRED_PROVIDER in distro or local config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 conf/machine/am335x-evm.conf   |    2 --
 conf/machine/beaglebone.conf   |    2 --
 conf/machine/include/ti33x.inc |    2 +-
 3 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/conf/machine/am335x-evm.conf b/conf/machine/am335x-evm.conf
index 91f7e54..21e79a2 100644
--- a/conf/machine/am335x-evm.conf
+++ b/conf/machine/am335x-evm.conf
@@ -13,8 +13,6 @@ IMAGE_FSTYPES += "ubi tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
-
 # UBI information.  Note that this is board and kernel specific.  Changes
 # in your kernel port may require changes in these variables.  For more
 # details about this board please see
diff --git a/conf/machine/beaglebone.conf b/conf/machine/beaglebone.conf
index f4112f5..8a83a1a 100644
--- a/conf/machine/beaglebone.conf
+++ b/conf/machine/beaglebone.conf
@@ -7,8 +7,6 @@ require conf/machine/include/ti33x.inc
 # Only has DVI connector for external screen
 GUI_MACHINE_CLASS = "bigscreen"
 
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
-
 IMAGE_FSTYPES += "tar.gz"
 
 SERIAL_CONSOLE = "115200 ttyO0"
diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index f00c797..62afe16 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -19,7 +19,7 @@ GUI_MACHINE_CLASS = "bigscreen"
 MACHINE_KERNEL_PR = "r18"
 
 # Default providers, may need to override for specific machines
-PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
+PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 KERNEL_IMAGETYPE = "uImage"


