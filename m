Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0FD41E01423
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1F5DA52AA6; Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013212.1F5DA52AA6@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : u-boot 2011.09+git: update to latest version of Tom Rini's tree
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
X-List-Received-Date: Thu, 26 Jul 2012 01:32:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Jul 11 11:53:27 2012 +0200

u-boot 2011.09+git: update to latest version of Tom Rini's tree

All patches have been rediffed and boot tested

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...add-option-to-boot-kernel-from-boot-in-ex.patch |   26 ++++++
 ...only-do-in-kernel-dhcp-when-using-NFS-use.patch |   35 --------
 ...ddr_defs-change-DDR-timings-for-15x15-EVM.patch |   30 -------
 ...boot-kernel-from-boot-in-ext2-3-filesyste.patch |   27 -------
 ...ch => 0002-am335x_evm-set-bootdelay-to-1.patch} |   18 ++--
 ...make-MMC-rootfs-RO-on-boot-so-fsck-works.patch} |   12 ++--
 ....patch => 0004-am335x_evm-switch-to-ext4.patch} |   14 ++--
 ...ge-mmc_load_uimage-to-load-at-a-fixed-add.patch |   49 ------------
 ...5x-evm-enable-i2c2-pinmux-for-beaglebone.patch} |   18 ++--
 ...vm-Fix-bone-pmic-shut-down-over-USB-power.patch |   82 --------------------
 ...tch => 0006-ext2load-increase-read-speed.patch} |   10 +-
 ...fix-ext2load-and-specify-partition-for-bo.patch |   30 +++++++
 ...-evm-turn-d-cache-on-globally-turn-it-off.patch |   46 -----------
 ...vm-load-uImage-from-boot-instead-of-VFAT.patch} |   18 ++--
 ...ort.patch => 0009-ext4fs-ls-load-support.patch} |   12 ++--
 ...patch => 0010-am335x-switch-to-ext4-mode.patch} |   33 ++++----
 ...fix-ext2load-and-specify-partition-for-bo.patch |   28 -------
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |   31 +++----
 18 files changed, 137 insertions(+), 382 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=e1b4ab72cfb3ea4599701d1600c44fe3c5f8ba66

