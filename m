Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1FF7DE014E9
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0E03852991; Tue, 26 Mar 2013 00:42:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004228.0E03852991@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am180x: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 45b73845d59bc859418e0cd6871093cd0b5ab83b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=45b73845d59bc859418e0cd6871093cd0b5ab83b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:25:52 2013 -0400

am180x: switch default u-boot preference to machine-specific tree

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am180x-evm.conf     |    2 ++
 conf/machine/include/davinci.inc |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index 7ea25cf..cff1565 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -14,3 +14,5 @@ IMAGE_FSTYPES += "tar.gz ubi"
 SERIAL_CONSOLE = "115200 ttyS2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omapl138-psp"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am180x"
+PREFERRED_PROVIDER_u-boot = "u-boot-am180x"
diff --git a/conf/machine/include/davinci.inc b/conf/machine/include/davinci.inc
index 756a1e5..6be5eb7 100644
--- a/conf/machine/include/davinci.inc
+++ b/conf/machine/include/davinci.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/tune-arm926ejs.inc
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r52"
+MACHINE_KERNEL_PR = "r53"
 
 KERNEL_IMAGETYPE = "uImage"
 


