Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 16443E003FA; Mon, 23 Jun 2014 15:15:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=RDNS_DYNAMIC autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CF95E00282
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:15:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 0B822529F2; Mon, 23 Jun 2014 22:15:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623221507.0B822529F2@arago-project.org>
Date: Mon, 23 Jun 2014 22:15:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux: remove old platform-specific 2.6.37 kernels
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
X-List-Received-Date: Mon, 23 Jun 2014 22:15:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bf0741681d3ddd0c02fbbbe8b19cd7bf19d43c7b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bf0741681d3ddd0c02fbbbe8b19cd7bf19d43c7b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Jun 20 17:18:40 2014 -0400

linux: remove old platform-specific 2.6.37 kernels

Most of the legacy devices should be working fine with latest kernels,
either ti-staging or mainline.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...date-PIO-mode-help-information-in-Kconfig.patch |   44 -
 .../linux-omap-psp-2.6.37/am3517-evm/defconfig     | 2358 -
 .../omap3/0001-Fix-matrix-suspend.patch            |  111 -
 ...upport-remove-support-for-non-TI-hardware.patch |  130 -
 ...001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch |  319 -
 ...ux-omap3-Add-OCF-support-to-2.6.37-kernel.patch | 7043 --
 ...nable-clock-pad-register-in-configuration.patch |   29 -
 .../0001-nlcp-sdio-fixes-for-wowlan-support.patch  |   96 -
 ...7evm-Allow-for-NAND-to-really-be-disabled.patch |   48 -
 ...vm-add-support-for-the-WL12xx-WLAN-module.patch |  147 -
 .../0001-omap3evm-add-wake-on-wlan-support.patch   |   49 -
 ...0001-omap_hsmmc-make-default-dto-value-14.patch |   34 -
 ...musb-am35x-set-default-VBUS-timeout-value.patch |   38 -
 ...ecting-WL12XX_PLATFROM_DATA-independently.patch |   37 -
 ...pport-suspend-resume-while-runtime-suspen.patch |   82 -
 ...map3-am3517evm-Update-NOR-partition-table.patch |   58 -
 ...map3_evm_defconfig-add-OCF-driver-support.patch | 2292 -
 ...2-usb-musb-am35x-fix-role-switching-issue.patch |   67 -
 .../0003-AM3517-Add-am3517_evn_nor_defconfig.patch |  256 -
 ...detection-of-nonremovable-cards-on-rescan.patch |   43 -
 .../omap3/0003-mmc_card_keep_power-cleanups.patch  |   69 -
 ...ap3_evm_defconfig-add-WLAN-config-options.patch |  283 -
 ...-not-switch-to-1-bit-mode-if-not-required.patch |   43 -
 ...n-t-reinitialize-nonremovable-powered-res.patch |   77 -
 ...0005-mmc-fix-division-by-zero-in-MMC-core.patch |   41 -
 ...io-don-t-power-up-cards-on-system-suspend.patch |  112 -
 ...icate-insertion-of-mmc_card_keep_power-fu.patch |   30 -
 ...0006-wl12xx-Backport-wl12xx-platform-data.patch |   64 -
 .../omap3/0007-activate-wireless-extensions.patch  |   26 -
 .../linux/linux-omap-psp-2.6.37/omap3/defconfig    | 2505 -
 recipes-kernel/linux/linux-omap-psp_2.6.37.bb      |  103 -
 ...BeagleBoard-Adjust-USER-button-pin-for-xM.patch |   29 -
 ...beagleboard-hack-in-support-from-xM-rev-C.patch |   94 -
 ...0001-board-omap3beagle-whitespace-cleanup.patch |   91 -
 .../0001-omap3-allow-1GHz-mpurates.patch           |   26 -
 .../linux-omap/0001-xM-audio-fix-from-Ashok.patch  |   27 -
 ...3beagle-allow-for-building-without-wl1271.patch |   42 -
 ...omap3-beaglexm-fix-EHCI-power-up-GPIO-dir.patch |   44 -
 .../0002-omap3-beaglexm-fix-DVI-reset-GPIO.patch   |   48 -
 .../0003-omap3-beaglexm-fix-power-on-of-DVI.patch  |   94 -
 ...0004-omap-Beagle-detect-new-xM-revision-B.patch |   43 -
 ...agleboard-Add-infrastructure-to-do-fixups.patch |  219 -
 ...agleboard-pre-export-GPIOs-to-userspace-w.patch |   57 -
 .../0007-modedb.c-add-proper-720p60-mode.patch     |   28 -
 ...isplay-single-block-read-console-messages.patch |   28 -
 .../0009-MTD-silence-ecc-errors-on-mtdblock0.patch |   63 -
 .../linux/linux-omap/base/0010-Miracle-patch.patch |  504 -
 .../base/0011-ARM-OMAP-add-omap_rev_-macros.patch  |   81 -
 ...enable-hsclk-in-dsi_pll_init-for-OMAP36XX.patch |   31 -
 ...eboard-add-WIP-support-for-beagleboardtoy.patch |  128 -
 ...-smsc911x-return-ENODEV-if-device-is-not-.patch |   29 -
 ...ut-touchscreen-ads7846-return-ENODEV-if-d.patch |   47 -
 ...able-audio-capture-by-default-for-twl4030.patch |   27 -
 .../base/0017-MFD-enable-madc-clock.patch          |   51 -
 .../base/0018-MFD-add-twl4030-madc-driver.patch    |  740 -
 ...RM-OMAP-Add-twl4030-madc-support-to-Overo.patch |   32 -
 ...M-OMAP-Add-twl4030-madc-support-to-Beagle.patch |   35 -
 ...dd-support-for-Samsung-LTE430WQ-F0C-panel.patch |  173 -
 ...Add-support-for-LG-Philips-LB035Q02-panel.patch |  299 -
 ...dd-bootarg-for-selecting-svideo-or-compos.patch |   75 -
 ...mc-twl4030-move-clock-input-selection-pri.patch |   39 -
 ...C-add-support-for-backup-battery-recharge.patch |   55 -
 ...tomatically-set-musb-mode-in-platform-dat.patch |   49 -
 ...heck-for-both-cpu-type-and-revision-rathe.patch |   34 -
 ...0028-OMAP-DSS2-Add-DSS2-support-for-Overo.patch |  355 -
 .../linux/linux-omap/beagleboard/defconfig         | 3361 -
 .../linux-omap/beagleboard/logo_linux_clut224.ppm  |73147 --------------------
 ...MAP3-PM-Adding-T2-enabling-of-smartreflex.patch |   60 -
 ...q-ensure-driver-initializes-after-cpufreq.patch |   27 -
 ...PUfreq-ensure-policy-is-fully-initialized.patch |   31 -
 .../0004-OMAP3-PM-CPUFreq-driver-for-OMAP3.patch   |  269 -
 ...AP-PM-CPUFREQ-Fix-conditional-compilation.patch |   32 -
 ...uce-a-user-list-for-each-voltage-domain-i.patch |  199 -
 ...uce-API-in-the-OPP-layer-to-find-the-opp-.patch |   82 -
 ...uce-API-to-register-a-device-with-a-volta.patch |  182 -
 ...uce-device-specific-set-rate-and-get-rate.patch |  120 -
 ...MAP-Voltage-layer-changes-to-support-DVFS.patch |  134 -
 ...ntroduce-dependent-voltage-domain-support.patch |  195 -
 .../dvfs/0012-OMAP-Introduce-device-scale.patch    |  134 -
 ...0013-OMAP-Disable-smartreflex-across-DVFS.patch |   50 -
 ...duce-custom-set-rate-and-get-rate-APIs-fo.patch |  176 -
 ...e-cpufreq-driver-to-use-the-new-set_rate-.patch |   54 -
 ...duce-voltage-domain-info-in-the-hwmod-str.patch |   45 -
 ...AP3-Add-voltage-dependency-table-for-VDD1.patch |   61 -
 ...map3-4-opp-make-omapx_opp_init-non-static.patch |   62 -
 ...0019-OMAP3-beagle-xm-enable-upto-1GHz-OPP.patch |  107 -
 ...0-omap3-Add-basic-support-for-720MHz-part.patch |  202 -
 ...01-ARM-pxa-PXA_ESERIES-depends-on-FB_W100.patch |   29 -
 ...void-incrementing-mm_users-on-CPU-startup.patch |   32 -
 .../0003-ARM-get-rid-of-kmap_high_l1_vipt.patch    |  186 -
 ...ache-xsc3l2-after-stack-based-kmap_atomic.patch |  189 -
 ...he-feroceon-l2-after-stack-based-kmap_ato.patch |  119 -
 ...t-the-required-VFMUNIT-clock-gating-disab.patch |   45 -
 ...vo-Add-hdmi-connector-properties-after-in.patch |   38 -
 ...tel_ips-When-i915-loads-after-IPS-make-IP.patch |  190 -
 ...rify-Ironlake-eDP-presence-on-DP_A-using-.patch |   69 -
 ...0010-ARM-6536-1-Add-missing-SZ_-32-64-128.patch |   42 -
 ...update-Nomadik-U300-and-Ux500-maintainers.patch |   65 -
 ...40-1-Stop-irqsoff-trace-on-return-to-user.patch |   44 -
 ...le-atm-fix-PHY-signal-initialization-race.patch |  100 -
 .../0014-ehea-Avoid-changing-vlan-flags.patch      |   34 -
 ...isabling-multilink-protocol-ID-compressio.patch |   64 -
 ...ng-the-wrong-variable-in-skfp_driver_init.patch |   31 -
 ...s-Add-missing-control_type-initialization.patch |   84 -
 ...s-max98088-Fix-register-cache-incoherency.patch |   72 -
 ...ecs-wm8523-Fix-register-cache-incoherency.patch |   74 -
 ...ecs-wm8741-Fix-register-cache-incoherency.patch |   61 -
 ...ecs-wm8904-Fix-register-cache-incoherency.patch |  131 -
 ...ecs-wm8955-Fix-register-cache-incoherency.patch |  107 -
 ...ecs-wm8962-Fix-register-cache-incoherency.patch |  151 -
 ...ecs-wm9090-Fix-register-cache-incoherency.patch |   75 -
 ...ecs-wm8753-Fix-register-cache-incoherency.patch |  514 -
 ...-incorrect-direct-gfn-for-unpaged-mode-sh.patch |   35 -
 ...027-fix-freeing-user_struct-in-user-cache.patch |   34 -
 ...cspi.c-Force-CS-to-be-in-inactive-state-a.patch |  111 -
 ...-undesirable-side-effect-of-adding-visibl.patch |   49 -
 ...-m68knommu-Coldfire-QSPI-platform-support.patch |   33 -
 ...nt-buffer-overflow-in-OSS-load_mixer_volu.patch |   47 -
 ...e-LPIB-quirk-for-Dell-Inspiron-m101z-1120.patch |   32 -
 ...i915-bios-Reverse-order-of-100-120-Mhz-SS.patch |   33 -
 ...o-Report-LVDS-attached-to-ch701x-as-conne.patch |   30 -
 ...-update-Documentation-filesystems-Locking.patch |  402 -
 ...rong-VM_BUG_ON-in-try_charge-s-mm-owner-c.patch |   63 -
 ...ing-zram-work-around-oops-due-to-startup-.patch |   54 -
 ...de-instead-of-kernel-address-for-proc-fil.patch |   43 -
 ...aset-Fix-memory-leak-in-do_disconnect_req.patch |   56 -
 ...IC-core-network-driver-fix-mem-leak-on-al.patch |   58 -
 ...g3-fix-return-value-check-in-tg3_read_vpd.patch |   35 -
 ...tarfire-Fix-dma_addr_t-size-test-for-MIPS.patch |   37 -
 ...vers-atm-atmtcp.c-add-missing-atm_dev_put.patch |   50 -
 .../linus/0044-KVM-i8259-initialize-isr_ack.patch  |   32 -
 .../0045-hwmon-s3c-hwmon-Fix-compilation.patch     |   37 -
 ...prove-initialisation-error-message-and-do.patch |   58 -
 ...M-6605-1-Add-missing-include-asm-memory.h.patch |   42 -
 .../0048-mv_xor-fix-race-in-tasklet-function.patch |   31 -
 ...-provide-dummy-functions-for-DMA_ENGINE-n.patch |   55 -
 ...vent-device-probe-failure-due-to-volume-c.patch |   52 -
 ...rt-changeset-fcb9757333-to-avoid-a-regres.patch |  518 -
 ...radio_fops-should-also-use-unlocked_ioctl.patch |   31 -
 ...rofile-op_model_amd.c-Perform-initialisat.patch |   81 -
 ...x-callchain-hit-bad-cast-on-ascii-display.patch |   39 -
 ...add-IT8152_LAST_IRQ-definition-to-fix-bui.patch |   40 -
 ...M-pxa-fix-page-table-corruption-on-resume.patch |   46 -
 ...-fix-oops-when-changing-tx-rx-ring-params.patch |   63 -
 ...-fix-br_multicast_ipv6_rcv-for-paged-skbs.patch |  157 -
 ...9-name_to_dev_t-must-not-call-__init-code.patch |   31 -
 .../0060-bridge-stp-ensure-mac-header-is-set.patch |   38 -
 .../linus/0061-ima-fix-add-LSM-rule-bug.patch      |   64 -
 .../0062-arch-mn10300-kernel-irq.c-fix-build.patch |   31 -
 ..._fs-method-from-Documentation-filesystems.patch |   38 -
 ...-route.c-respect-prefsrc-for-local-routes.patch |   57 -
 .../linux/linux-omap/linus/0065-Linux-2.6.37.patch |   25 -
 ...ode-between-video_usercopy-and-video_ioct.patch |  297 -
 ...-v4l-subdev-Don-t-require-core-operations.patch |   31 -
 ...Merge-v4l2_i2c_new_subdev_cfg-and-v4l2_i2.patch |  132 -
 .../0004-v4l-subdev-Add-device-node-support.patch  |  615 -
 ...ev-Uninline-the-v4l2_subdev_init-function.patch |  103 -
 .../0006-v4l-subdev-Control-ioctls-support.patch   |   88 -
 .../media/0007-v4l-subdev-Events-support.patch     |  223 -
 .../0008-media-Media-device-node-support.patch     |  500 -
 .../linux-omap/media/0009-media-Media-device.patch |  398 -
 .../media/0010-media-Entities-pads-and-links.patch |  690 -
 .../media/0011-media-Entity-graph-traversal.patch  |  228 -
 .../media/0012-media-Entity-use-count.patch        |  176 -
 ...0013-media-Media-device-information-query.patch |  659 -
 ...media-Entities-pads-and-links-enumeration.patch |  889 -
 .../linux-omap/media/0015-media-Links-setup.patch  |  517 -
 .../0016-media-Pipelines-and-media-streams.patch   |  259 -
 ...edia_device-pointer-to-the-v4l2_device-st.patch |  115 -
 ...ke-video_device-inherit-from-media_entity.patch |  234 -
 ...ake-v4l2_subdev-inherit-from-media_entity.patch |  265 -
 ...e-media-v4l2-mediabus.h-header-to-include.patch |  205 -
 ...-enums-with-fixed-sized-fields-in-public-.patch |   50 -
 ...V4L2_MBUS_FMT_GREY8_1X8-to-V4L2_MBUS_FMT_.patch |  154 -
 ...edia-bus-pixel-codes-by-types-and-sort-th.patch |  112 -
 ...-Create-v4l2-subdev-file-handle-structure.patch |  243 -
 ...4l-subdev-Add-a-new-file-operations-class.patch |   93 -
 ...0026-v4l-v4l2_subdev-pad-level-operations.patch |   49 -
 ...0028-v4l-v4l2_subdev-userspace-format-API.patch | 3546 -
 ...-v4l2_subdev-userspace-frame-interval-API.patch |  479 -
 .../0030-v4l-v4l2_subdev-userspace-crop-API.patch  |  350 -
 .../0031-v4l-subdev-Generic-ioctl-support.patch    |   46 -
 ...Add-subdev-sensor-g_skip_frames-operation.patch |   35 -
 ...e-linux-videodev2.h-in-media-v4l2-ctrls.h.patch |   27 -
 ...a-use-before-set-in-the-control-framework.patch |   32 -
 ...it-YUYV-on-16-bit-bus-and-SGRBG10-media-b.patch |   60 -
 ...aining-RAW10-patterns-w-DPCM-pixel-code-v.patch |   48 -
 ...d-missing-12-bits-bayer-media-bus-formats.patch |  105 -
 .../0038-v4l-Add-12-bits-bayer-pixel-formats.patch |   35 -
 ...pdate-Camera-ISP-definitions-for-OMAP3630.patch |   99 -
 ...0-omap3-Remove-unusued-ISP-CBUFF-resource.patch |   32 -
 ...unction-to-register-omap3isp-platform-dev.patch |   91 -
 ...-omap2-Fix-camera-resources-for-multiomap.patch |   70 -
 .../linux-omap/media/0043-OMAP3-ISP-driver.patch   |21513 ------
 ...nable-Magic-SysRq-on-serial-console-ttyOx.patch |   35 -
 .../linux/linux-omap/omap3-touchbook/defconfig     |    1 -
 recipes-kernel/linux/linux-omap/omap3evm/defconfig |    1 -
 recipes-kernel/linux/linux-omap/overo/defconfig    |    1 -
 .../linux/linux-omap/usrp-e1xx/defconfig           |    1 -
 ...-to-set-config-options-in-GPMC-per-CS-con.patch |   80 -
 ...ns-to-dma.c-to-set-address-and-length-for.patch |   83 -
 ...ed-Add-driver-for-USRP-Embedded-FPGA-inte.patch | 1889 -
 ...d-MAC-address-from-NVS-file-on-HW-startup.patch |   41 -
 .../0002-wl1271-11n-Support-Add-Definitions.patch  |  165 -
 .../0003-wl1271-11n-Support-ACX-Commands.patch     |  128 -
 ...Support-functionality-and-configuration-a.patch |  249 -
 ...et-wl-vif-only-if-add_interface-succeeded.patch |   86 -
 ...t-bssid-filter-ssid-and-bssid-from-firmwa.patch |   44 -
 ...ia-radio-wl128x-FM-Driver-common-header-f.patch |  268 -
 ...media-radio-wl128x-FM-Driver-V4L2-sources.patch |  645 -
 ...dia-radio-wl128x-FM-Driver-Common-sources.patch | 2114 -
 ...s-media-radio-wl128x-FM-driver-RX-sources.patch |  938 -
 ...s-media-radio-wl128x-FM-driver-TX-sources.patch |  494 -
 ...ia-radio-wl128x-Kconfig-Makefile-for-wl12.patch |   52 -
 ...ia-radio-Update-Kconfig-and-Makefile-for-.patch |   38 -
 ...rs-misc-ti-st-change-protocol-parse-logic.patch |  900 -
 .../wl1271/0015-Bluetooth-btwilink-driver.patch    |  463 -
 recipes-kernel/linux/linux-omap_2.6.37.bb          |  215 -
 .../0001-TI-WL12xx-MMC-patches-03.21.00.04.patch   |  616 -
 ...date-PIO-mode-help-information-in-Kconfig.patch |   44 -
 ...da850-Set-maximum-OPP-frequency-to-456MHz.patch |   28 -
 .../0003-AM18xx-WL1271-Enable-BT.patch             |  114 -
 ...21.00.04.sdk-activate-wireless-extensions.patch |   25 -
 ...a850-Add-Mistral-WL12XX-config-support-to.patch |   77 -
 .../0006-Add-wlan-and-BT-config-switches.patch     |  210 -
 ...mmc-davinci-Eliminate-spurious-interrupts.patch |   64 -
 ...mmc-davinci-Poll-for-small-size-transfers.patch |   96 -
 .../am180x-evm/configs/static                      | 1891 -
 .../linux-omapl138-psp-2.6.37/am180x-evm/defconfig | 2020 -
 .../tipspkernel/am180x-evm/configs/static          | 1858 -
 .../tipspkernel/am180x-evm/defconfig               | 1858 -
 .../linux-omapl138-psp-2.6.37/uio_pruss.patch      |  539 -
 recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb  |   42 -
 233 files changed, 0 insertions(+), 156701 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=bf0741681d3ddd0c02fbbbe8b19cd7bf19d43c7b

