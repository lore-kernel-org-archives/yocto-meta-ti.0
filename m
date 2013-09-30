Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2C39E01683
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:29 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1007152A6C; Mon, 30 Sep 2013 20:37:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203729.1007152A6C@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap-2.6.39: remove old beagleboard-specific and not supported kernel
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 8c96f41ba6e3160d0826e112599285cf64541257
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8c96f41ba6e3160d0826e112599285cf64541257

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 15:54:37 2013 -0400

linux-omap-2.6.39: remove old beagleboard-specific and not supported kernel

Beagleboard is supported by newer 3.x kernel recipes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 ...e-add-support-for-beagleboard-xM-revision.patch |  117 -
 ...P3-beagle-add-support-for-expansionboards.patch |  359 -
 .../0003-OMAP3-beagle-add-MADC-support.patch       |   36 -
 ...eagle-add-regulators-for-camera-interface.patch |   88 -
 .../0005-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch   |   31 -
 .../beagle/0006-OMAP3-BEAGLE-fix-RTC.patch         |   27 -
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   33 -
 ...ap3-beagle-Use-GPTIMERi-1-for-clockevents.patch |   42 -
 .../linux-omap-2.6.39/beagleboard/configs/stock    | 3490 ------
 .../linux/linux-omap-2.6.39/beagleboard/defconfig  | 3517 ------
 ...d-driver-for-Aptina-Micron-mt9p031-sensor.patch |  859 --
 .../0002-v4l-Add-mt9v032-sensor-driver.patch       |  853 --
 ...-for-mt9p031-LI-5M03-module-in-Beagleboar.patch |  162 -
 ...ap-usbhs-crash-when-rmmoding-ehci-or-ohci.patch |   67 -
 ...-omap_usbhs_alloc_children-error-handling.patch |   50 -
 ...003-mfd-Add-omap-usbhs-runtime-PM-support.patch |  245 -
 ...b-ehci-and-ohci-hwmod-structures-for-omap.patch |  406 -
 ...005-arm-omap-usb-register-hwmods-of-usbhs.patch |  160 -
 ...b-device-name-change-for-the-clk-names-of.patch |  123 -
 ...Suspend-and-resume-support-of-ehci-and-oh.patch |  165 -
 ...-Correct-the-warning-print-during-script-.patch |   36 -
 ...-Modifying-the-macro-name-Main_Ref-to-all.patch |   61 -
 ...FD-TWL4030-power-scripts-for-OMAP3-boards.patch |  705 --
 .../0011-MFD-TWL4030-TWL-version-checking.patch    |  164 -
 ...TWL4030-workaround-changes-for-Erratum-27.patch |  341 -
 ...TWL4030-optimizing-resource-configuration.patch |  184 -
 ...-Enable-DMA-mode1-RX-for-USB-Mass-Storage.patch |  121 -
 ...-NFS-Revert-NFSROOT-default-mount-options.patch |   13 -
 .../0001-OMAP2-cpufreq-free-up-table-on-exit.patch |   38 -
 ...MAP2-cpufreq-handle-invalid-cpufreq-table.patch |   44 -
 .../0003-OMAP2-cpufreq-minor-comment-cleanup.patch |   33 -
 ...eq-use-clk_init_cpufreq_table-if-OPPs-not.patch |   48 -
 ...pufreq-use-cpufreq_frequency_table_target.patch |   78 -
 .../0006-OMAP2-cpufreq-fix-freq_table-leak.patch   |  100 -
 ...q-helpers-for-walking-the-frequency-table.patch |  134 -
 .../0002-cpufreq-introduce-hotplug-governor.patch  |  879 --
 ...q-ensure-driver-initializes-after-cpufreq.patch |   27 -
 ...PUfreq-ensure-policy-is-fully-initialized.patch |   31 -
 .../0003-OMAP3-PM-CPUFreq-driver-for-OMAP3.patch   |  263 -
 ...AP-PM-CPUFREQ-Fix-conditional-compilation.patch |   32 -
 ...-cpufreq-fixup-after-new-OPP-layer-merged.patch |   33 -
 ...q-Split-OMAP1-and-OMAP2PLUS-CPUfreq-drive.patch |  669 --
 ...cpufreq-Add-SMP-support-to-cater-OMAP4430.patch |  170 -
 ...pufreq-Fix-typo-when-attempting-to-set-mp.patch |   29 -
 ...-clockdomain-Add-an-api-to-read-idle-mode.patch |   77 -
 ...kdomain-Add-SoC-support-for-clkdm_is_idle.patch |   86 -
 ...itialise-sleep_switch-to-a-non-valid-valu.patch |   35 -
 ...P2-PM-idle-clkdms-only-if-already-in-idle.patch |   50 -
 ...hwmod-Follow-the-recomended-PRCM-sequence.patch |   46 -
 ...6-OMAP-Serial-Check-wk_st-only-if-present.patch |   33 -
 ...age-remove-spurious-pr_notice-for-debugfs.patch |   30 -
 ...OMAP4-PM-remove-redundant-ifdef-CONFIG_PM.patch |   41 -
 ...reflex-fix-sr_late_init-error-path-in-pro.patch |   30 -
 ...AP3-smartreflex-request-the-memory-region.patch |   36 -
 ...artreflex-fix-ioremap-leak-on-probe-error.patch |   66 -
 ...reflex-delete-instance-from-sr_list-on-pr.patch |   29 -
 ...reflex-delete-debugfs-entries-on-probe-er.patch |   48 -
 ...uidle-remove-useless-SDP-specific-timings.patch |   57 -
 ...OMAP3-SR-make-notify-independent-of-class.patch |   48 -
 ...010-OMAP3-SR-disable-interrupt-by-default.patch |   37 -
 ...1-OMAP3-SR-enable-disable-SR-only-on-need.patch |   41 -
 .../0012-OMAP3-SR-fix-cosmetic-indentation.patch   |   49 -
 ...01-OMAP-DSS2-DSI-fix-use_sys_clk-highfreq.patch |   33 -
 .../0002-OMAP-DSS2-DSI-fix-dsi_dump_clocks.patch   |   49 -
 ...SS2-Fix-Return-correct-lcd-clock-source-f.patch |   43 -
 .../0004-OMAP-DSS-DSI-Fix-DSI-PLL-power-bug.patch  |   64 -
 ...-OMAP-DSS2-fix-panel-Kconfig-dependencies.patch |   61 -
 ...dd-bootarg-for-selecting-svideo-or-compos.patch |   75 -
 .../sakoman/0007-video-add-timings-for-hd720.patch |   27 -
 ...-smsc911x-return-ENODEV-if-device-is-not-.patch |   29 -
 ...ut-touchscreen-ads7846-return-ENODEV-if-d.patch |   47 -
 ...10-Revert-omap2_mcspi-Flush-posted-writes.patch |   25 -
 ...p_hsmmc-improve-interrupt-synchronisation.patch |  482 -
 ...SDIO-cards-off-to-save-power.-Doing-so-wi.patch |   51 -
 ...13-Enable-the-use-of-SDIO-card-interrupts.patch |  288 -
 ...Enable-audio-capture-by-default-for-twl40.patch |   27 -
 ...odecs-twl4030-Turn-on-mic-bias-by-default.patch |   25 -
 ...C-add-support-for-backup-battery-recharge.patch |   55 -
 ...mc-twl4030-move-clock-input-selection-pri.patch |   39 -
 ...wer-off-support-for-the-TWL4030-companion.patch |  103 -
 ...RM-OMAP-Add-twl4030-madc-support-to-Overo.patch |   33 -
 ...20-Enabling-Hwmon-driver-for-twl4030-madc.patch |   46 -
 .../0021-mfd-twl-core-enable-madc-clock.patch      |   54 -
 ...0022-rtc-twl-Switch-to-using-threaded-irq.patch |   25 -
 ...tomatically-set-musb-mode-in-platform-dat.patch |   49 -
 ...mc-Adjust-dto-to-eliminate-timeout-errors.patch |   28 -
 .../0025-omap-Fix-mtd-subpage-read-alignment.patch |   95 -
 ...ap2-Force-all-buffer-reads-to-u32-alignme.patch |   35 -
 ...-nand-fix-subpage-ecc-issue-with-prefetch.patch |   63 -
 .../0028-OMAP-Overo-Add-support-for-spidev.patch   |   46 -
 ...029-unionfs-Add-support-for-unionfs-2.5.9.patch |11494 --------------------
 ...-omap_device-activate-latency-messages-fr.patch |   34 -
 .../sakoman/0031-omap-overo-Add-opp-init.patch     |  105 -
 ...2-omap3-Add-basic-support-for-720MHz-part.patch |  202 -
 recipes-kernel/linux/linux-omap_2.6.39.bb          |  123 -
 95 files changed, 0 insertions(+), 29857 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8c96f41ba6e3160d0826e112599285cf64541257

