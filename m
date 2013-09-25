Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EB07BE01621
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2013 13:57:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 24576529B0; Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130925205739.24576529B0@arago-project.org>
Date: Wed, 25 Sep 2013 20:57:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default
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
X-List-Received-Date: Wed, 25 Sep 2013 20:57:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: ccc9b8c50c1df3df24939c33e09e0940511d9a90
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ccc9b8c50c1df3df24939c33e09e0940511d9a90

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Sep 23 22:19:02 2013 -0400

ti43x, omap-a15: switch KERNEL_IMAGETYPE to zImage by default

* To be used with latest u-boot, that prefers zImage over uImage
* ti33x will follow as soon as u-boot changes its default for that platform

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Tom Rini <trini@ti.com>

---

 conf/machine/include/omap-a15.inc |    2 +-
 conf/machine/include/ti43x.inc    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index 623f2df..aba122a 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -10,7 +10,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
diff --git a/conf/machine/include/ti43x.inc b/conf/machine/include/ti43x.inc
index 62da105..adb66e3 100644
--- a/conf/machine/include/ti43x.inc
+++ b/conf/machine/include/ti43x.inc
@@ -23,7 +23,7 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
-KERNEL_IMAGETYPE = "uImage"
+KERNEL_IMAGETYPE = "zImage"
 
 UBOOT_ARCH = "arm"
 UBOOT_MACHINE = "am43xx_evm_config"


