Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C856BE0141C
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 10:09:14 -0800 (PST)
Received: from cpebcc8100fb8db-cmbcc8100fb8d8.cpe.net.cable.rogers.com
	([174.116.196.46]:35673 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.77) (envelope-from <rpjday@crashcourse.ca>)
	id 1TasG2-0002KO-8H
	for meta-ti@yoctoproject.org; Tue, 20 Nov 2012 13:09:14 -0500
Date: Tue, 20 Nov 2012 13:09:11 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1211201305300.28223@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: [PATCH] recipes-bsp/u-boot: Update SRC_URIs to match all others.
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
X-List-Received-Date: Tue, 20 Nov 2012 18:09:15 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


Every other u-boot git SRC_URI has a different value, so make the odd
ones out consistent with the rest, as in:

-SRC_URI = "git://www.denx.de/git/u-boot.git ...
+SRC_URI = "git://git.denx.de/u-boot.git ...

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

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


