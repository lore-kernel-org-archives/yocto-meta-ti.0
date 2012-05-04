Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB0C7E01413
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 17:07:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 63EE752AA1; Fri,  4 May 2012 00:07:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120504000735.63EE752AA1@arago-project.org>
Date: Fri,  4 May 2012 00:07:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : u-boot 2011.12: don't poke at uLCD7 settings from u-boot, it' s handled in the kernel now
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 04 May 2012 00:07:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: f0e2305c7e1395066b4303b4a891bfb2a066602b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f0e2305c7e1395066b4303b4a891bfb2a066602b

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  1 21:06:51 2012 +0200

u-boot 2011.12: don't poke at uLCD7 settings from u-boot, it's handled in the kernel now

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Acked-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-add-support-for-scanning-loop-through-ex.patch |    2 +-
 recipes-bsp/u-boot/u-boot_2011.12.bb               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch b/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
index 71dd2bb..1bbe14e 100644
--- a/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
+++ b/recipes-bsp/u-boot/u-boot/2011.12/0003-beagleboard-add-support-for-scanning-loop-through-ex.patch
@@ -62,7 +62,7 @@ index 9c2e6d0..5ea50d1 100644
 +		printf("Recognized BeagleBoardToys uLCD-lite board\n");
 +		setenv("buddy2", "bbtoys-ulcd");
 +		setenv("defaultdisplay", "lcd");
-+		setenv("uenvcmd", "i2c dev 1 ; i2c mw 40 00 00; i2c mw 40 04 80; i2c mw 40 0d 05; i2c mw 40 0d 15");
++		//setenv("uenvcmd", "i2c dev 1 ; i2c mw 40 00 00; i2c mw 40 04 80; i2c mw 40 0d 05; i2c mw 40 0d 15");
 +		break;
 +	case BEAGLE_NO_EEPROM:
 +		printf("No EEPROM on expansion board\n");
diff --git a/recipes-bsp/u-boot/u-boot_2011.12.bb b/recipes-bsp/u-boot/u-boot_2011.12.bb
index 9bbd31e..9616a05 100644
--- a/recipes-bsp/u-boot/u-boot_2011.12.bb
+++ b/recipes-bsp/u-boot/u-boot_2011.12.bb
@@ -6,7 +6,7 @@ UBOOT_IMAGE = "u-boot-${MACHINE}-${PV}-${PR}.img"
 UBOOT_SYMLINK = "u-boot-${MACHINE}.img"
 
 PV = "2011.12"
-PR = "r6"
+PR = "r7"
 
 # No patches for other machines yet
 COMPATIBLE_MACHINE = "(beagleboard|pandaboard|hawkboard|am3517-evm|am37x-evm|omap3evm)"


