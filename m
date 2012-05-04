Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C232CE00596
	for <meta-ti@yoctoproject.org>; Thu,  3 May 2012 17:07:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D852D52A6F; Fri,  4 May 2012 00:07:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120504000734.D852D52A6F@arago-project.org>
Date: Fri,  4 May 2012 00:07:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-mainline 3.2: kernel recipe based on mainline 3.2. 16 with additional patches for e.g. beagleboard on top
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
Commit: 4e18d702479ac6f835f3493d8aa81b8d323e1827
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4e18d702479ac6f835f3493d8aa81b8d323e1827

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  1 21:06:48 2012 +0200

linux-mainline 3.2: kernel recipe based on mainline 3.2.16 with additional patches for e.g. beagleboard on top

This patchset is managed in https://github.com/beagleboard/kernel/tree/beagleboard-3.2 by Robert Nelson and myself.

Tested on beagleboard-xM/Angstrom

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-add-buddy-param-for-expansionboard-names.patch |   59 +
 ...xpansion-add-mmc-regulator-and-ds1307-rtc.patch |   57 +
 .../beagle/0003-expansion-add-zippy.patch          |   82 +
 .../beagle/0004-expansion-add-zippy2.patch         |   82 +
 .../beagle/0005-expansion-add-trainer.patch        |   55 +
 .../beagle/0006-expansion-add-ulcd.patch           |  262 +
 ...d-reinstate-usage-of-hi-speed-PLL-divider.patch |   29 +
 ...the-USB-regulator-on-Beagle-xM-explicitly.patch |   55 +
 ...b-add-Toshiba-LTA070B220F-800x480-support.patch |   30 +
 .../0010-beagleboard-fix-uLCD7-support.patch       |   66 +
 ...fault-to-fifo-mode-5-for-old-musb-beagles.patch |   29 +
 ...ght-Add-TLC59108-backlight-control-driver.patch |  215 +
 ...013-tlc59108-adjust-for-beagleboard-uLCD7.patch |  124 +
 .../linux/linux-mainline-3.2/beagleboard/defconfig | 4280 ++
 .../beagleboard/logo_linux_clut224.ppm             |73147 ++++++++++++++++++++
 ...-devkit8000-for-lcd-use-samsung_lte_panel.patch |   28 +
 ...pkg-set-host-machine-after-dpkg-gencontro.patch |  114 +
 .../0001-ksz8851-eeprom-93cx6-add-drive_data.patch |   62 +
 ...z8851-eeprom-93cx6-add-eeprom_93cx6_write.patch |  129 +
 .../micrel_zippy2/0003-ksz8851-read_mac_addr.patch |   93 +
 .../0004-ksz8851-93cx6-eeprom-access.patch         |  130 +
 ...51.h-it-helps-to-include-the-include-file.patch |   43 +
 .../0006-ksz8851-move-to-header.patch              |  326 +
 .../0007-ksz8851-move-more-to-header.patch         |  143 +
 .../0008-ksz8851-share-ks8851_tx_hdr-union.patch   |   95 +
 .../0009-ksz8851-add-is_level_irq.patch            |  101 +
 ...n-off-hardware-interrupt-druing-receive-p.patch |   42 +
 ...851-make-sure-is-awake-before-writing-mac.patch |   63 +
 .../0012-ksz8851-add-mutex-lock-unlock-to-ks.patch |   42 +
 .../0013-ksz8851-add-ks8851_tx_check.patch         |  121 +
 .../0014-ksz8851-move-ks8851_set_powermode.patch   |   71 +
 ...P-cleanup-for-multi-SoC-support-move-into.patch |  422 +
 ...02-cpufreq-OMAP-Add-SMP-support-for-OMAP4.patch |  191 +
 ...MAP-Enable-all-CPUs-in-shared-policy-mask.patch |   42 +
 ...-OMAP-notify-even-with-bad-boot-frequency.patch |   48 +
 ...ufreq-OMAP-move-clk-name-decision-to-init.patch |   64 +
 ...req-OMAP-deny-initialization-if-no-mpudev.patch |   64 +
 ...0007-cpufreq-OMAP-dont-support-freq_table.patch |  125 +
 ...08-cpufreq-OMAP-only-supports-OPP-library.patch |   43 +
 ...9-cpufreq-OMAP-put-clk-if-cpu_init-failed.patch |   61 +
 .../0010-cpufreq-OMAP-fix-freq_table-leak.patch    |   90 +
 ...P-fixup-for-omap_device-changes-include-l.patch |   47 +
 ...1-omap3-Increase-limit-on-bootarg-mpurate.patch |   33 +
 ...3517-3505-fix-crash-on-boot-due-to-incorr.patch |  110 +
 ...wmod-Don-t-wait-for-the-idle-status-if-mo.patch |  200 +
 ...MAP4-clock-Add-CPU-local-timer-clock-node.patch |   56 +
 ...wmod-data-disable-multiblock-reads-on-MMC.patch |  161 +
 ...6-OMAP-HWMOD-add-es3plus-to-am36xx-am35xx.patch |   34 +
 .../panda/0001-panda-fix-wl12xx-regulator.patch    |   27 +
 .../panda/0002-panda-enable-bluetooth.patch        |   88 +
 .../0003-ti-st-st-kim-fixing-firmware-path.patch   |   35 +
 ...MAP-DSS2-add-bootarg-for-selecting-svideo.patch |   78 +
 .../sakoman/0002-video-add-timings-for-hd720.patch |   28 +
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   30 +
 .../0001-omap3-touchbook-remove-mmc-gpio_wp.patch  |   39 +
 ...0002-omap3-touchbook-drop-u-boot-readonly.patch |   25 +
 recipes-kernel/linux/linux-mainline_3.2.bb         |   90 +
 57 files changed, 82406 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4e18d702479ac6f835f3493d8aa81b8d323e1827

