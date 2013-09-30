Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19DFFE01695
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:37 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D59C352A6C; Mon, 30 Sep 2013 20:37:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203736.D59C352A6C@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-omap-psp-2.6.32: remove old linux-omap3 PSP kernel
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: 9d38e2e41b64fffd957a2ee3c04a4c140bf13677
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9d38e2e41b64fffd957a2ee3c04a4c140bf13677

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 17:01:14 2013 -0400

linux-omap-psp-2.6.32: remove old linux-omap3 PSP kernel

* Many machines are supported by newer 3.x kernel recipes
* Few old platforms are still supported by 2.6.37 recipes
* Some platforms are not supported in meta-ti, like Crane, Touchbook, Overo
* For any platform still requiring this outdated kernel, the recipe can be picked
  up from Danny or Denzil

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0001-Added-Crane-Board-support.patch           | 5237 --
 ...BeagleBoard-Adjust-USER-button-pin-for-xM.patch |   28 -
 ...board-print-expansionboard-name-detected-.patch |   51 -
 ....1.6-kernel-source-patched-with-OCF-Linux.patch |88333 --------------------
 ...vert-omap3-beagle-Fix-compile-time-errors.patch |   67 -
 ...create-sys-fs-cgroup-to-mount-cgroupfs-on.patch |   58 -
 ...board-add-support-for-TinCanTools-Trainer.patch |   55 -
 ...touchbook-make-it-build-against-TI-linux-.patch |   61 -
 ...d-support-for-TCT-Zippy-to-Beagle-board-f.patch |  135 -
 ...MAP-Make-beagle-u-boot-partition-writable.patch |   24 -
 .../0005-board-omap3-beagle-add-DSS2-support.patch |  200 -
 ...beagle-prepare-for-DM3730-based-Beagleboa.patch |  103 -
 ...agleboard-Add-infrastructure-to-do-fixups.patch |  172 -
 ...agleboard-pre-export-GPIOs-to-userspace-w.patch |   57 -
 ...agleboard-initialize-ds1307-and-eeprom-on.patch |   76 -
 ...010-ARM-OMAP-update-beagleboard-defconfig.patch | 3323 -
 ...able-audio-capture-by-default-for-twl4030.patch |   27 -
 ...ap2-proper-fix-for-subpage-read-ECC-error.patch |   35 -
 ...-DSS2-Enable-Pre-Multiplied-Alpha-Support.patch |   44 -
 ...otarg-for-selecting-svideo-or-composite-f.patch |   75 -
 ...-add-some-more-from-Leopard-imaging-patch.patch |  133 -
 ...vero-Add-support-for-second-ethernet-port.patch |  110 -
 ...-smsc911x-return-ENODEV-if-device-is-not-.patch |   29 -
 ...ut-touchscreen-ads7846-return-ENODEV-if-d.patch |   53 -
 .../0019-drivers-mfd-add-twl4030-madc-driver.patch |  601 -
 ...OMAP-Add-missing-twl4030-madc-header-file.patch |  149 -
 ...RM-OMAP-Add-twl4030-madc-support-to-Overo.patch |   32 -
 ...M-OMAP-Add-twl4030-madc-support-to-Beagle.patch |   35 -
 ...usb-add-vendor-device-ID-for-Ceiva-Wirele.patch |   25 -
 ...isplay-single-block-read-console-messages.patch |   28 -
 ...mc-twl4030-move-clock-input-selection-pri.patch |   47 -
 ...-add-PM-code-and-sync-with-http-www.sakom.patch |  373 -
 ...0-madc-adjust-for-twl4030-twl-api-changes.patch |   85 -
 ...e-add-support-for-Samsung-lte430wq-f0c-pa.patch |  161 -
 ...Add-support-for-LG-Philips-LB035Q02-panel.patch |  254 -
 ...-width-which-improves-SD-card-s-peformanc.patch |   32 -
 ...-support-to-sync-the-VFP-state-of-the-cur.patch |  109 -
 ...serve-the-HW-context-when-calling-signal-.patch |  211 -
 ...h-SGX-clocks-to-200MHz-on-DM37xx-OMAP36xx.patch |   27 -
 .../0034-modedb.c-add-proper-720p60-mode.patch     |   27 -
 ...C-add-support-for-backup-battery-recharge.patch |   55 -
 ...-ARM-Add-prompt-for-CONFIG_ALIGNMENT_TRAP.patch |   29 -
 ...-warning-on-alignment-trap-in-kernel-mode.patch |   31 -
 ...pose-some-CPU-control-registers-via-sysfs.patch |  202 -
 ...-Add-option-to-allow-userspace-PLE-access.patch |   48 -
 ...ion-to-allow-userspace-access-to-performa.patch |   49 -
 ...-Expose-some-PMON-registers-through-sysfs.patch |   41 -
 ...-musb-allow-host-io-without-gadget-module.patch |   90 -
 .../0043-MTD-silence-ecc-errors-on-mtdblock0.patch |   59 -
 ...agle-every-known-beagle-except-revB-uses-.patch |   34 -
 ...agle-add-support-for-beagleFPGA-expansion.patch |   70 -
 ...ix-serial-console-corruption-during-cpuid.patch |   57 -
 ...nly-try-to-idle-IVA-subsys-when-CONFIG_PM.patch |   37 -
 ...048-HACK-try-to-poweron-stuff-on-xM-rev-A.patch |   60 -
 .../linux-omap-psp-2.6.32/am3517-crane/defconfig   | 2139 -
 .../linux-omap-psp-2.6.32/am3517-evm/configs/stock | 2151 -
 .../linux-omap-psp-2.6.32/am3517-evm/defconfig     | 2151 -
 .../linux-omap-psp-2.6.32/am37x-evm/defconfig      | 2045 -
 .../0001-omap-Beagle-revision-detection.patch      |  135 -
 ...-only-Cx-boards-use-pin-23-for-write-prot.patch |   35 -
 ...ap-Beagle-no-gpio_wp-pin-connection-on-xM.patch |   33 -
 ...omap3-beaglexm-fix-EHCI-power-up-GPIO-dir.patch |   42 -
 .../0005-omap3-beaglexm-fix-DVI-reset-GPIO.patch   |   48 -
 .../0006-omap3-beaglexm-fix-power-on-of-DVI.patch  |   92 -
 ...beagleboard-hack-in-support-from-xM-rev-C.patch |   61 -
 ...agle-cleaned-up-board-revision-conditions.patch |  153 -
 .../beagleboard/configs/cpuidle                    | 3053 -
 .../beagleboard/configs/cpuidle-gether             | 3051 -
 .../linux-omap-psp-2.6.32/beagleboard/defconfig    | 3071 -
 .../beagleboard/logo_linux_clut224.ppm             |73147 ----------------
 ...st-stab-at-merging-sensor-driver-based-on.patch | 2394 -
 .../0002-mt9t111-Fix-all-checkpatch-errors.patch   |  398 -
 .../0003-mt9t111-Pass-v4l2_int_device-data.patch   |   40 -
 .../cam/0004-omap3beagle-Add-camera-support.patch  |  352 -
 ...005-TEMP-omap3beagle-camera-Add-defconfig.patch | 3070 -
 ...3beagle-camera-Add-support-for-regulators.patch |  238 -
 ...0007-TEMP-omap3beagle-cam-Enable-OMAP_MUX.patch |   37 -
 ...eagle-camera-Fix-null-pointer-dereference.patch |   54 -
 ...vert-TEMP-omap3beagle-cam-Enable-OMAP_MUX.patch |   42 -
 ...p3beagle-camera-Change-arch-late_initcall.patch |   25 -
 ...-camera-Move-i2c-registration-to-the-main.patch |  107 -
 ...ake-camera-code-build-if-MT9T111-is-built.patch |   38 -
 ...ap3beagle-camera-Force-mode0-in-cam_xclka.patch |   41 -
 ...-Add-capability-to-change-rate-of-dpll4_m.patch |   33 -
 ...G-omap3beagle-camera-Force-mode0-in-cam_x.patch |   41 -
 ...p3beagle-camera-Fix-wrong-XCLKA-selection.patch |   30 -
 ...t-CAM_MCLK-to-172.8-MHz-allows-exact-9.6-.patch |   91 -
 ...-Fix-Moved-MCLK-setting-to-the-board-file.patch |  209 -
 ...019-omap3isp-core-Do-smarter-MCLK-setting.patch |   47 -
 ...0-omap3beagle-camera-set-mclk-for-mt9t111.patch |   36 -
 .../cam/0021-mt9t111-Fix-max-supported-xclk.patch  |   28 -
 ...ap3beagle-camera-Clarify-regulators-names.patch |  103 -
 ...3-omap3beagle-camera-Fix-powerup-sequence.patch |  103 -
 ...4-omap3beagle-camera-Change-vaux4-to-1.8v.patch |   32 -
 ...-camera-Rename-regulators-to-match-actual.patch |  110 -
 ...-camera-Complement-remainig-sensor-hw-con.patch |   37 -
 ...-detect-function-retval-and-cleanup-print.patch |   48 -
 ...e-camera-Set-padconf-settings-in-cam-init.patch |   66 -
 ...-camera-only-register-camera-driver-for-3.patch |   31 -
 ...11-Work-in-progress-for-camera-enablement.patch |   53 -
 ...XM-Cam-Add-support-for-MT9V113-VGA-Sensor.patch | 2441 -
 ...MT9V113-Fixed-sensor-nitialization-issues.patch |  294 -
 .../cam/0033-mt9v113-Fix-wrong-active-widths.patch |   29 -
 ...x-Wrong-check-on-non-interlaced-sensor-on.patch |   34 -
 ...-Fix-bad-YUV_BT-checks-in-datapath_config.patch |   45 -
 ...p-Set-vd_pol-to-0-by-default-on-all-cases.patch |   35 -
 ...isp-ccdc-Set-datalines-to-10-for-YUV_SYNC.patch |   29 -
 ...p3beagle-camera-Fix-parallel-i-f-settings.patch |   43 -
 ...-camera-Clean-up-Remove-unneccessary-code.patch |  118 -
 ...-Clean-Up-Remove-unneccessary-code-printf.patch |  390 -
 ...Min-Max-clk-input-changed-as-per-the-spec.patch |   54 -
 ...-omap3beagle-camera-Further-clode-cleanup.patch |  237 -
 ...Settings-from-Aptima-used-to-increase-FPS.patch |  135 -
 ...44-mt9v113-AE-param-tuned-to-get-28-30FPS.patch |   33 -
 ...5-omap3beagle-camera-Cleanup-of-boardfile.patch |  161 -
 ...map3beagle-camera-Cleanup-regulator-usage.patch |  172 -
 ...3beagle-camera-Bring-back-mt9t111-support.patch |  251 -
 ...-REMOVE-v4l2-Delete-MT9T111-sensor-driver.patch | 2402 -
 ...3670-soc-camera-Add-mt9t112-camera-driver.patch | 1285 -
 ...mt9t112-modify-exiting-conditions-from-st.patch |   31 -
 ...igrate-from-soc_camera-to-v4l2-int-device.patch |  934 -
 ...52-mt9t112-Add-more-info-to-public-header.patch |   29 -
 .../0053-mt9t112-Fix-null-pointer-kernel-bug.patch |   84 -
 ...EBUG-omap3beagle-Add-MT9T112-to-defconfig.patch |   26 -
 ...-camera-Change-MT9T111-references-to-new-.patch |  207 -
 ...4xxcam-Fix-multi-pixel-format-negotiation.patch |   26 -
 ...3beagle-camera-Bring-back-mt9t111-support.patch |   43 -
 ...0058-mt9t112-Do-init_camera-every-powerup.patch |   57 -
 ...agle-camera-Switch-flag-for-no-sensor-ISP.patch |   26 -
 .../cam/0060-mt9t112-Add-back-3MP-basesize.patch   |   37 -
 ...9t112-Prepare-for-24MHz-EXTCLK-and-30-fps.patch |   63 -
 ...gle-camera-Prepare-24MHz-xclk-for-mt9t112.patch |   62 -
 ...rect-register-settings-for-mt9t111-sensor.patch |  109 -
 .../0064-mt9t112-Remove-smart-size-selection.patch |  188 -
 ...emove-bogus-Kconfig-depend-on-PCI-and-add.patch |   38 -
 ...12-Add-Context-selection-to-configuration.patch |   96 -
 .../0067-mt9t112-Disable-JPEG-in-Context-B.patch   |   32 -
 ...12-Make-context-B-stream-unlimited-frames.patch |   30 -
 ...69-mt9t112-Fix-pll-p-dividers-abstraction.patch |   58 -
 ...t9t112-Adjust-50-60Hz-flickering-settings.patch |   51 -
 ...gger-autofocus-at-the-end-of-context-swit.patch |   35 -
 ...eagle-camera-Fix-dual-sensor-registration.patch |   43 -
 .../0073-mt9v113-Fix-State-variable-handling.patch |   68 -
 ...-Move-sensor-rest-to-after-applying-power.patch |   65 -
 .../cam/0075-omap3beagle-Add-camera-bootarg.patch  |  108 -
 ...ort-driver-from-https-github.com-Aptina-B.patch | 1547 -
 ...beagle-import-li5m03-driver-from-https-gi.patch |  294 -
 .../linux-omap-psp-2.6.32/dm37x-evm/defconfig      | 2024 -
 .../0001-ARM-OMAP-add-spi-platform-devices.patch   |   62 -
 .../0002-MMA7455L-accelerometer-driver.patch       |  683 -
 ...27x00_battery-remove-error-message-output.patch |   53 -
 .../0004-bq27x00_battery-add-charged-gpio.patch    |   65 -
 .../0005-adf7846-add-more-debugging.patch          |   99 -
 .../0006-ads7846-read-max-mix-x-y-from-pdata.patch |   35 -
 .../0007-ads7846-add-settling-delay-to-pdata.patch |   59 -
 ...-Translate-X-Y-coordinates-for-the-video-.patch |   99 -
 ...aling-checks-when-rotation-is-90-or-270-d.patch |   52 -
 .../0010-add-touchbook-hid-driver.patch            |  339 -
 ...ke-backlight-controls-accessible-to-users.patch |   25 -
 ...-t-error-out-when-there-s-no-pendown-gpio.patch |   30 -
 .../0013-ASoC-add-driver-for-omap3-touchbook.patch |  350 -
 .../0014-backlight-add-PWM-support.patch           |  126 -
 ...t-TWL4030-BCI-driver-from-2.6.29-to-2.6.3.patch | 1367 -
 ...ARM-OMAP-omap3-touchbook-update-boardfile.patch |  620 -
 ...OMAP-add-800MHz-OPP-and-remove-125MHz-one.patch |   48 -
 .../omap3-touchbook/defconfig                      | 3043 -
 .../linux/linux-omap-psp-2.6.32/omap3evm/defconfig | 3088 -
 .../linux/linux-omap-psp-2.6.32/overo/defconfig    | 2467 -
 .../linux/linux-omap-psp-2.6.32/porches.patch      |   55 -
 recipes-kernel/linux/linux-omap-psp_2.6.32.bb      |  213 -
 170 files changed, 0 insertions(+), 228462 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=9d38e2e41b64fffd957a2ee3c04a4c140bf13677

