Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78153E00509; Mon, 23 Jun 2014 15:15:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0BB8AE0027B
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:15:08 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id DB8D152A04; Mon, 23 Jun 2014 22:15:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623221507.DB8D152A04@arago-project.org>
Date: Mon, 23 Jun 2014 22:15:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot: remove old platform-specific versions
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
X-List-Received-Date: Mon, 23 Jun 2014 22:15:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 5a82920f4f2fe7b4a4cd723521464c08d3a870e4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5a82920f4f2fe7b4a4cd723521464c08d3a870e4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Jun 21 03:34:55 2014 +0000

u-boot: remove old platform-specific versions

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...hange-default-memory-to-not-limit-at-32MB.patch |   34 -
 recipes-bsp/u-boot/u-boot-am180x_2010.12.bb        |   22 -
 recipes-bsp/u-boot/u-boot-am33x_2011.10rc.bb       |   27 -
 recipes-bsp/u-boot/u-boot-am3517_2011.09.bb        |   21 -
 recipes-bsp/u-boot/u-boot-beagleboard_2011.09.bb   |   36 -
 ...-Beagle-Pin-Mux-initialization-glitch-fix.patch |   46 -
 .../u-boot/0001-armv7-Unaligned-access-fix.patch   |   30 -
 .../u-boot/0001-config-Always-use-GNU-ld.patch     |   43 -
 ...m-Change-default-console-serial-port-from.patch |   30 -
 ...-omapfb.debug-y-from-Beagle-and-Overo-env.patch |   56 -
 ...e-enable-the-use-of-a-plain-text-file-nam.patch |   89 -
 ...-OMAP3-BeagleBoard-Enable-pullups-on-i2c2.patch |   69 -
 ...MAP3-BeagleBoard-add-xM-rev-B-to-ID-table.patch |  111 -
 ...3-BeagleBoard-add-more-expansionboard-IDs.patch |   95 -
 .../0007-OMAP3-Add-DSS-driver-for-OMAP3.patch      |  435 ----
 ...0008-BeagleBoard-Added-userbutton-command.patch |  100 -
 ...agle-pass-expansionboard-name-in-bootargs.patch |   57 -
 .../u-boot/0010-Enable-DSS-driver-for-Beagle.patch |  107 -
 .../u-boot/u-boot/0011-Add-led-command.patch       |  213 --
 .../u-boot/0012-BeagleBoard-Added-LED-driver.patch |  160 --
 ...BeagleBoard-updated-default-configuration.patch |  184 --
 ...ED-name-match-finding-avoiding-extraneous.patch |   42 -
 ...e-Switch-default-console-from-ttyS2-to-tt.patch |   29 -
 ...gleBoard-Load-kernel-via-MMC-ext2-not-fat.patch |   26 -
 ...p3-mem-Comment-enable_gpmc_cs_config-more.patch |   56 -
 ...e-SDRC-dram_init-to-always-call-make_cs1_.patch |   66 -
 ...-a-helper-function-to-set-timings-in-SDRC.patch |  172 --
 ...e-mem_ok-to-clear-again-after-reading-bac.patch |   30 -
 .../0005-OMAP3-Remove-get_mem_type-prototype.patch |   28 -
 .../0006-omap3-mem-Add-MCFG-helper-macro.patch     |   97 -
 ...d-optimal-SDRC-autorefresh-control-values.patch |   59 -
 ...x-all-Micron-memory-timing-parts-with-the.patch |   55 -
 ...ework-memory-initalization-and-devkit8000.patch |  174 --
 ...OMAP3-SPL-Add-identify_nand_chip-function.patch |  142 --
 ...0011-OMAP3-Add-SPL-support-to-Beagleboard.patch |  315 ---
 .../0012-OMAP3-Add-SPL-support-to-omap3_evm.patch  |  319 ---
 .../2011.09/0013-AM3517-Add-SPL-support.patch      |  150 --
 .../0014-AM3517-CraneBoard-Add-SPL-support.patch   |  150 --
 ...-beagleboard-config-disable-cache-for-USB.patch |   33 -
 ...16-beagleboard-config-enable-gpio-command.patch |   25 -
 ...d-some-timeout-durations-for-MMC-and-EHCI.patch |   39 -
 ...ard-mount-rootfs-RO-instead-of-RW-at-boot.patch |   26 -
 ...BeagleBoard-config-Really-switch-to-ttyO2.patch |   28 -
 ...gleboard-add-support-for-TCT-Beacon-board.patch |   65 -
 ...-add-support-for-scanning-loop-through-ex.patch |  105 -
 ...add-option-to-boot-kernel-from-boot-in-ex.patch |   26 -
 .../0002-am335x_evm-set-bootdelay-to-1.patch       |   26 -
 ...-make-MMC-rootfs-RO-on-boot-so-fsck-works.patch |   26 -
 .../0004-am335x_evm-switch-to-ext4.patch           |   26 -
 ...35x-evm-enable-i2c2-pinmux-for-beaglebone.patch |   63 -
 .../0006-ext2load-increase-read-speed.patch        |   74 -
 ...fix-ext2load-and-specify-partition-for-bo.patch |   30 -
 ...evm-load-uImage-from-boot-instead-of-VFAT.patch |   35 -
 .../2011.09git/0009-ext4fs-ls-load-support.patch   | 2362 --------------------
 .../0010-am335x-switch-to-ext4-mode.patch          |   52 -
 ...ard-mount-rootfs-RO-instead-of-RW-at-boot.patch |   26 -
 ...gleboard-add-support-for-TCT-Beacon-board.patch |   65 -
 ...-add-support-for-scanning-loop-through-ex.patch |  121 -
 .../2011.12/0004-omap4-common-mount-root-RO.patch  |   26 -
 .../0005-omap4-common-use-ext4-by-default.patch    |   26 -
 ...P-MMC-Add-delay-before-waiting-for-status.patch |   44 -
 .../2011.12/0007-config-Always-use-GNU-ld.patch    |   43 -
 ...7-disable-L2-cache-in-cleanup_before_linu.patch |   25 -
 ...Beagleboard-Correct-memory-size-on-rev-C4.patch |   37 -
 ...0010-OMAP3-Correct-get_sdr_cs_offset-mask.patch |   37 -
 .../0011-ext2load-increase-read-speed.patch        |   74 -
 .../2011.12/0012-ext4fs-ls-load-support.patch      | 2362 --------------------
 .../0013-beagleboard-switch-mmcroots-to-ext4.patch |   43 -
 recipes-bsp/u-boot/u-boot/600mhz.patch             |   25 -
 recipes-bsp/u-boot/u-boot/ai-logo.patch            | 1353 -----------
 .../u-boot/u-boot/beagleboard/fw_env.config        |    1 -
 .../u-boot/u-boot/dont-inline-weak-symbols.patch   |   39 -
 .../u-boot/u-boot/dont-inline-weak-symbols2.patch  |   45 -
 recipes-bsp/u-boot/u-boot/dss2.patch               |   73 -
 recipes-bsp/u-boot/u-boot/fw_env.config            |    8 -
 recipes-bsp/u-boot/u-boot/headphone.patch          |   47 -
 recipes-bsp/u-boot/u-boot/mmcinit.patch            |   34 -
 recipes-bsp/u-boot/u-boot/new-pinmux.patch         |   82 -
 recipes-bsp/u-boot/u-boot/power.patch              |   27 -
 recipes-bsp/u-boot/u-boot/spi3.patch               |   43 -
 recipes-bsp/u-boot/u-boot/spi4.patch               |   36 -
 81 files changed, 0 insertions(+), 11658 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=5a82920f4f2fe7b4a4cd723521464c08d3a870e4

