Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1416CE014C9
	for <meta-ti@yoctoproject.org>; Mon,  4 Mar 2013 10:03:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id B80D352ABC; Mon,  4 Mar 2013 18:03:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130304180329.B80D352ABC@arago-project.org>
Date: Mon,  4 Mar 2013 18:03:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Robert P. J. Day : u-boot: unify denx.de SRC_URIs to match all others
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
X-List-Received-Date: Mon, 04 Mar 2013 18:03:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 814a292394b82541134a58574a742dc4e4462adc
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=814a292394b82541134a58574a742dc4e4462adc

Author: Robert P. J. Day <rpjday@crashcourse.ca>
Date:   Tue Nov 20 13:09:11 2012 -0500

u-boot: unify denx.de SRC_URIs to match all others

Every other u-boot git SRC_URI has a different value, so make the odd
ones out consistent with the rest, as in:

-SRC_URI = "git://www.denx.de/git/u-boot.git ...
+SRC_URI = "git://git.denx.de/u-boot.git ...

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot_2011.06.bb |    2 +-
 recipes-bsp/u-boot/u-boot_2011.09.bb |    2 +-
 recipes-bsp/u-boot/u-boot_2011.12.bb |    2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot_2011.06.bb b/recipes-bsp/u-boot/u-boot_2011.06.bb
index 21f47d6..4fa8f07 100644
--- a/recipes-bsp/u-boot/u-boot_2011.06.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.06.bb
@@ -3,7 +3,7 @@ require u-boot.inc
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
            file://2011.06/0001-OMAP3-Beagle-Pin-Mux-initialization-glitch-fix.patch \
            file://2011.06/0002-OMAP-Remove-omapfb.debug-y-from-Beagle-and-Overo-env.patch \
            file://2011.06/0003-OMAP3-beagle-pass-expansionboard-name-in-bootargs.patch \
diff --git a/recipes-bsp/u-boot/u-boot_2011.09.bb b/recipes-bsp/u-boot/u-boot_2011.09.bb
index b164c77..edacb6c 100644
--- a/recipes-bsp/u-boot/u-boot_2011.09.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.09.bb
@@ -10,7 +10,7 @@ UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard)"
 
-SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
            file://2011.09/0001-omap3-mem-Comment-enable_gpmc_cs_config-more.patch \
            file://2011.09/0002-OMAP3-Update-SDRC-dram_init-to-always-call-make_cs1_.patch \
            file://2011.09/0003-OMAP3-Add-a-helper-function-to-set-timings-in-SDRC.patch \
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 45c64a6..137f5b5 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -19,7 +19,7 @@ CACHEFIX_omap4 = ""
 FWENV_beagleboard = "file://fw_env.config"
 FWENV = ""
 
-SRC_URI = "git://www.denx.de/git/u-boot.git;protocol=git \
+SRC_URI = "git://git.denx.de/u-boot.git;protocol=git \
            file://2011.12/0001-beagleboard-mount-rootfs-RO-instead-of-RW-at-boot.patch \
            file://2011.12/0002-beagleboard-add-support-for-TCT-Beacon-board.patch \
            file://2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch \


