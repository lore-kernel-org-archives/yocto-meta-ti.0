Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9F3FAE0168C
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:34 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8A31F52A7F; Mon, 30 Sep 2013 20:37:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203734.8A31F52A7F@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-3.0: remove old beagleboard-specific 3.0 and 3. 1rc kernel recipes
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: edfd76fce4c3fbf6074c42d4ce55c456db333279
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=edfd76fce4c3fbf6074c42d4ce55c456db333279

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 16:37:39 2013 -0400

linux-3.0: remove old beagleboard-specific 3.0 and 3.1rc kernel recipes

Beagleboard is supported by newer 3.2 and 3.3.7 kernel recipes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 ...OMAP3-beagle-add-support-for-expansionboa.patch |  340 --
 ...0002-HACK-OMAP3-beagle-switch-to-GPTIMER1.patch |   26 -
 .../0003-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch   |   31 -
 .../linux/linux-3.0+3.1rc/beagleboard/defconfig    | 3517 -------------------
 .../linux/linux-3.0+3.1rc/fixes/vout.patch         |   79 -
 ...01-Enabling-Hwmon-driver-for-twl4030-madc.patch |   46 -
 .../madc/0002-mfd-twl-core-enable-madc-clock.patch |   54 -
 recipes-kernel/linux/linux-3.0+3.1rc/patch.sh      |   27 -
 ...001-ARM-L2-Add-and-export-outer_clean_all.patch |   67 -
 ...e-add-support-for-beagleboard-xM-revision.patch |  196 --
 ...OMAP3-beagle-add-support-for-expansionboa.patch |  340 --
 ...0003-HACK-OMAP3-beagle-switch-to-GPTIMER1.patch |   26 -
 .../0004-OMAP3-beagle-HACK-add-in-1GHz-OPP.patch   |   31 -
 ...5-omap3-Add-basic-support-for-720MHz-part.patch |  202 --
 ...eagleboard-make-wilink-init-look-more-lik.patch |   32 -
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   33 -
 ...add-cpu-id-register-to-MAC-address-helper.patch |   89 -
 ...BeagleBoard-Fix-up-random-or-missing-MAC-.patch |  156 -
 ...eagleboard-fix-mmc-write-protect-pin-when.patch |   26 -
 ...d-reinstate-usage-of-hi-speed-PLL-divider.patch |   29 -
 .../linux/linux-3.0/beagleboard/defconfig          | 3604 --------------------
 ...3630-PRM-add-ABB-PRM-register-definitions.patch |   93 -
 ...P3-PM-VP-generalize-PRM-interrupt-helpers.patch |  263 --
 ...P3-PRM-add-tranxdone-IRQ-handlers-for-ABB.patch |  202 --
 ...P3-ABB-Adaptive-Body-Bias-structures-data.patch |  240 --
 ...-OMAP3-OPP-add-ABB-data-to-voltage-tables.patch |  194 --
 ...3-Voltage-add-ABB-data-to-voltage-domains.patch |   83 -
 ...3-ABB-initialization-transition-functions.patch |  274 --
 ...-OMAP3-Voltage-add-ABB-to-voltage-scaling.patch |  114 -
 ...01-Enabling-Hwmon-driver-for-twl4030-madc.patch |   46 -
 .../madc/0002-mfd-twl-core-enable-madc-clock.patch |   54 -
 ...Undef-before-redefining-__attribute_const.patch |   31 -
 ...llow-OPP-enumeration-to-continue-if-devic.patch |   43 -
 ...nking-error-in-twl-common.c-for-OMAP2-3-4.patch |  129 -
 recipes-kernel/linux/linux-3.0/patch.sh            |   29 -
 ...-introduce-function-to-free-cpufreq-table.patch |   84 -
 ...q-ensure-driver-initializes-after-cpufreq.patch |   28 -
 ...PUfreq-ensure-policy-is-fully-initialized.patch |   32 -
 .../0004-OMAP3-PM-CPUFreq-driver-for-OMAP3.patch   |  264 --
 ...AP-PM-CPUFREQ-Fix-conditional-compilation.patch |   33 -
 ...-cpufreq-fixup-after-new-OPP-layer-merged.patch |   34 -
 ...q-Split-OMAP1-and-OMAP2PLUS-CPUfreq-drive.patch |  673 ----
 ...cpufreq-Add-SMP-support-to-cater-OMAP4430.patch |  171 -
 ...pufreq-Fix-typo-when-attempting-to-set-mp.patch |   30 -
 ...P2-cpufreq-move-clk-name-decision-to-init.patch |   64 -
 ...-cpufreq-deny-initialization-if-no-mpudev.patch |   64 -
 ...012-OMAP2-cpufreq-dont-support-freq_table.patch |  129 -
 ...3-OMAP2-cpufreq-only-supports-OPP-library.patch |   46 -
 ...-OMAP2-cpufreq-put-clk-if-cpu_init-failed.patch |   61 -
 .../0015-OMAP2-cpufreq-fix-freq_table-leak.patch   |   90 -
 ...eq-Remove-superfluous-check-in-target-for.patch |   58 -
 ...ufreq-notify-even-with-bad-boot-frequency.patch |   48 -
 ...req-Enable-all-CPUs-in-shared-policy-mask.patch |   42 -
 ...eq-update-lpj-with-reference-value-to-avo.patch |  121 -
 ...egulator-supply-definitions-in-mach-omap2.patch | 1083 ------
 ...style-supply.dev-assignments-common-in-hs.patch |  160 -
 ...parate-init_irq-functions-to-avoid-cpu_is.patch |  802 -----
 ...parate-timer-init-functions-to-avoid-cpu_.patch |  689 ----
 ...05-omap-Move-dmtimer-defines-to-dmtimer.h.patch |  287 --
 ...-subset-of-dmtimer-functions-into-inline-.patch |  323 --
 ...7-omap2-Use-dmtimer-macros-for-clockevent.patch |  279 --
 .../0008-omap2-Remove-gptimer_wakeup-for-now.patch |  177 -
 ...OMAP3-SR-make-notify-independent-of-class.patch |   47 -
 ...010-OMAP3-SR-disable-interrupt-by-default.patch |   36 -
 ...1-OMAP3-SR-enable-disable-SR-only-on-need.patch |   40 -
 .../0012-OMAP3-SR-fix-cosmetic-indentation.patch   |   48 -
 ...ve-clocksource-and-timesource-and-initial.patch |  125 -
 ...-omap2-Use-dmtimer-macros-for-clocksource.patch |  163 -
 ...p2-Remove-omap2_gp_clockevent_set_gptimer.patch |  240 --
 ...e-timer-gp.c-into-timer.c-to-combine-time.patch |  737 ----
 .../0017-omap-cleanup-NAND-platform-data.patch     |  165 -
 ...omap-board-omap3evm-Fix-compilation-error.patch |   40 -
 .../0019-omap-mcbsp-Drop-SPI-mode-support.patch    |  311 --
 ...map-mcbsp-Drop-in-driver-transfer-support.patch |  548 ---
 .../voltdm/0021-omap2-fix-build-regression.patch   |   29 -
 ...w-twl-common-for-common-TWL-configuration.patch |  200 --
 ...common-twl6030-configuration-to-twl-commo.patch |  601 ----
 ...ve-common-twl-configuration-to-twl-common.patch |  827 -----
 ...common-regulator-configuration-to-twl-com.patch |  924 -----
 ...mcbsp-Remove-rx_-tx_word_length-variables.patch |   45 -
 .../0027-omap-mcbsp-Remove-port-number-enums.patch |   68 -
 .../0028-OMAP-dmtimer-add-missing-include.patch    |   31 -
 ...P2-hwmod-Fix-smart-standby-wakeup-support.patch |  130 -
 ...4-hwmod-data-Add-MSTANDBY_SMART_WKUP-flag.patch |   61 -
 ...-Enable-module-in-shutdown-to-access-sysc.patch |   37 -
 ...-Do-not-write-the-enawakeup-bit-if-SYSC_H.patch |   65 -
 ...wmod-Remove-_populate_mpu_rt_base-warning.patch |   33 -
 ...4-OMAP2-hwmod-Fix-the-HW-reset-management.patch |   87 -
 ...-OMAP-hwmod-Add-warnings-if-enable-failed.patch |   30 -
 ...-Move-pr_debug-to-improve-the-readability.patch |   95 -
 ...use-a-null-structure-record-to-terminate-.patch | 3529 -------------------
 ...share-identical-omap_hwmod_addr_space-arr.patch | 1958 -----------
 ...use-a-terminator-record-with-omap_hwmod_m.patch | 2904 ----------------
 ...share-identical-omap_hwmod_mpu_irqs-array.patch | 1815 ----------
 ...use-a-terminator-record-with-omap_hwmod_d.patch | 1382 --------
 ...share-identical-omap_hwmod_dma_info-array.patch |  935 -----
 ...share-identical-omap_hwmod_class-omap_hwm.patch | 1730 ----------
 ...-data-Fix-L3-interconnect-data-order-and-.patch |  116 -
 ...-OMAP4-hwmod-data-Remove-un-needed-parens.patch |   42 -
 .../0046-OMAP4-hwmod-data-Fix-bad-alignement.patch |  218 --
 ...-data-Align-interconnect-format-with-regu.patch |  154 -
 ...48-OMAP4-clock-data-Add-sddiv-to-USB-DPLL.patch |   31 -
 ...-data-Remove-usb_host_fs-clkdev-with-NULL.patch |   48 -
 ...-data-Re-order-some-clock-nodes-and-struc.patch |  229 --
 ...ck-data-Fix-max-mult-and-div-for-USB-DPLL.patch |  143 -
 ...OMAP4-prcm-Fix-errors-in-few-defines-name.patch |  256 --
 ...MAP4-prm-Remove-wrong-clockdomain-offsets.patch |   50 -
 ...54-OMAP4-powerdomain-data-Fix-indentation.patch |  109 -
 ...move-RESTORE-macros-to-avoid-access-from-.patch | 1523 ---------
 ...6-OMAP4-prcm_mpu-Fix-indent-in-few-macros.patch |  111 -
 ...domain-data-Fix-data-order-and-wrong-name.patch |  294 --
 ...evice-replace-_find_by_pdev-with-to_omap_.patch |   84 -
 ...OMAP-PM-remove-OMAP_PM_NONE-config-option.patch |   63 -
 ...-data-Remove-McASP2-McASP3-and-MMC6-clock.patch |  178 -
 ...MAP4-clock-data-Remove-UNIPRO-clock-nodes.patch |   99 -
 ...62-OMAP4-hwmod-data-Modify-DSS-opt-clocks.patch |  153 -
 ...itialise-sleep_switch-to-a-non-valid-valu.patch |   39 -
 ...domain-data-Fix-core-mem-states-and-missi.patch |   68 -
 ...-data-Keep-GPMC-clocks-always-enabled-and.patch |   45 -
 ...domain-data-Remove-unsupported-MPU-powerd.patch |   44 -
 ...AP4-hwmod-data-Change-DSS-main_clk-scheme.patch |  163 -
 ...et-hwmod-flags-to-only-allow-16-bit-acces.patch |  133 -
 ...ncrease-omap_i2c_dev_attr-flags-from-u8-t.patch |   46 -
 ...AP2-Introduce-I2C-IP-versioning-constants.patch |   61 -
 ...MAP2-create-omap-I2C-functionality-flags-.patch |   51 -
 ...ag-all-OMAP2-hwmod-defintions-with-I2C-IP.patch |   77 -
 ...dd-correct-functionality-flags-to-all-oma.patch |  146 -
 ...d-fix-the-i2c-reset-timeout-during-bootup.patch |  286 --
 ...evice-Create-clkdev-entry-for-hwmod-main_.patch |  437 ---
 ...-data-Add-missing-divider-selection-for-a.patch |  292 --
 ...AP4-hwmod-data-Add-clock-domain-attribute.patch |  724 ----
 ...OMAP2-hwmod-Init-clkdm-field-at-boot-time.patch |   86 -
 ...-Replace-CLKCTRL-absolute-address-with-of.patch |  976 ------
 ...hwmod-Wait-the-idle-status-to-be-disabled.patch |  153 -
 ...-Replace-RSTCTRL-absolute-address-with-of.patch |  459 ---
 ...eplace-warm-reset-API-with-the-offset-bas.patch |  125 -
 ...083-OMAP4-prm-Remove-deprecated-functions.patch |   81 -
 ...wmod-data-Add-PRM-context-register-offset.patch |  630 ----
 ...-data-Add-modulemode-entry-in-omap_hwmod-.patch |  503 ---
 ...m-Add-two-new-APIs-for-modulemode-control.patch |   88 -
 ...-Introduce-the-module-control-in-hwmod-co.patch |  129 -
 ...omain-Remove-redundant-call-to-pwrdm_wait.patch |   30 -
 ...domain-Add-2-APIs-to-control-clockdomain-.patch |  231 --
 ...0090-OMAP2-clockdomain-add-clkdm_in_hwsup.patch |  141 -
 ...P2-PM-idle-clkdms-only-if-already-in-idle.patch |   53 -
 ...domain-Add-per-clkdm-lock-to-prevent-conc.patch |  264 --
 ...-allow-per-SoC-clock-init-code-to-prevent.patch |  123 -
 ...-Follow-the-recommended-PRCM-module-enabl.patch |  173 -
 ...bugfs-node-to-show-the-summary-of-all-clo.patch |   84 -
 ...hwmod-remove-unused-voltagedomain-pointer.patch |   30 -
 ...ge-move-PRCM-mod-offets-into-VC-VP-struct.patch |  577 ----
 ...ge-move-prm_irqst_reg-from-VP-into-voltag.patch |  203 --
 ...ge-start-towards-a-new-voltagedomain-laye.patch |  986 ------
 ...ltage-rename-mpu-voltagedomain-to-mpu_iva.patch |   82 -
 ...MAP3-voltagedomain-data-add-wakeup-domain.patch |   37 -
 ...oltage-add-scalable-flag-to-voltagedomain.patch |   93 -
 ...domain-add-voltagedomain-to-struct-powerd.patch |   51 -
 ...oltage-domains-and-connect-to-powerdomain.patch |  138 -
 ...MAP3-powerdomain-data-add-voltage-domains.patch |  161 -
 ...MAP4-powerdomain-data-add-voltage-domains.patch |  177 -
 ...domain-add-voltage-domain-lookup-during-r.patch |   89 -
 ...ge-keep-track-of-powerdomains-in-each-vol.patch |  200 --
 ...ge-split-voltage-controller-VC-code-into-.patch |  666 ----
 ...ge-move-VC-into-struct-voltagedomain-misc.patch |  544 ---
 ...ge-enable-VC-bypass-scale-method-when-VC-.patch |   37 -
 ...ge-split-out-voltage-processor-VP-code-in.patch |  874 -----
 ...pport-PMICs-with-separate-voltage-and-com.patch |  109 -
 ...RM-VP-functions-for-checking-clearing-VP-.patch |  375 --
 ...place-transaction-done-check-clear-with-V.patch |  142 -
 ...M-add-register-access-functions-for-VC-VP.patch |  119 -
 ...ge-convert-to-PRM-register-access-functio.patch |  627 ----
 ...C-cleanup-i2c-slave-address-configuration.patch |  145 -
 ...eanup-PMIC-register-address-configuration.patch |  185 -
 ...pass-use-fields-from-VC-struct-instead-of.patch |   42 -
 ...-cleanup-voltage-setup-time-configuration.patch |  227 --
 ...ve-on-onlp-ret-off-command-configuration-.patch |   83 -
 ...AP3-VC-abstract-out-channel-configuration.patch |  267 --
 ...ge-domain-move-PMIC-struct-from-vdd_info-.patch |  394 ---
 ...ke-I2C-config-programmable-with-PMIC-spec.patch |  221 --
 ...-handle-mutant-channel-config-for-OMAP4-M.patch |  168 -
 ...e-last-nominal-voltage-setting-to-get-cur.patch |   31 -
 ...eanup-move-VP-instance-into-voltdm-misc.-.patch |  643 ----
 ...voltage-remove-unneeded-debugfs-interface.patch |  317 --
 ...ruct-omap_vp_common-replace-shift-with-__.patch |  214 --
 ...ve-SoC-specific-sys-clock-rate-retreival-.patch |  184 -
 ...ve-timing-calculation-config-into-VP-init.patch |   94 -
 ...eate-VP-helper-function-for-updating-erro.patch |  107 -
 ...0134-OMAP3-VP-remove-omap_vp_runtime_data.patch |  170 -
 ...ve-voltage-scale-function-pointer-into-st.patch |  134 -
 ...6-OMAP-VP-Explicitly-mask-VPVOLTAGE-field.patch |   81 -
 ...P3-VP-update_errorgain-return-error-if-VP.patch |   29 -
 ...P3-VP-remove-unused-omap_vp_get_curr_volt.patch |   70 -
 ...mbine-setting-init-voltage-into-common-fu.patch |  141 -
 ...ge-rename-scale-and-reset-functions-using.patch |  141 -
 ...ge-move-rename-curr_volt-from-vdd_info-in.patch |  106 -
 ...AP3-voltdm-final-removal-of-omap_vdd_info.patch |  282 --
 ...ge-rename-omap_voltage_get_nom_volt-voltd.patch |   91 -
 ...ge-update-nominal-voltage-in-voltdm_scale.patch |   49 -
 ...PM-TWL6030-fix-voltage-conversion-formula.patch |   85 -
 ...AP4-PM-TWL6030-fix-uv-to-voltage-for-0x39.patch |   37 -
 ...7-OMAP4-PM-TWL6030-address-0V-conversions.patch |   38 -
 ...-OMAP4-PM-TWL6030-fix-ON-RET-OFF-voltages.patch |   71 -
 .../0149-OMAP4-PM-TWL6030-add-cmd-register.patch   |   56 -
 ...isplay-single-block-read-console-messages.patch |   28 -
 ...-omap_device-activate-dectivate-latency-m.patch |   49 -
 ...dd-bootarg-for-selecting-svideo-or-compos.patch |   75 -
 ...iminate-noisey-uncorrectable-error-messag.patch |   28 -
 .../sakoman/0005-video-add-timings-for-hd720.patch |   27 -
 ...-smsc911x-return-ENODEV-if-device-is-not-.patch |   29 -
 ...ut-touchscreen-ads7846-return-ENODEV-if-d.patch |   45 -
 ...08-Revert-omap2_mcspi-Flush-posted-writes.patch |   27 -
 ...-threaded-IRQ-remove-IRQ-enable-in-interr.patch |   57 -
 ...0-rtc-twl-Fix-registration-vs.-init-order.patch |  122 -
 ...Enable-audio-capture-by-default-for-twl40.patch |   27 -
 ...odecs-twl4030-Turn-on-mic-bias-by-default.patch |   25 -
 ...l4030-move-clock-input-selection-prior-to.patch |   39 -
 ...l-add-support-for-backup-battery-recharge.patch |   57 -
 ...001-ARM-L2-Add-and-export-outer_clean_all.patch |   67 -
 ...ix-build-break-caused-by-update_mode-remo.patch |   44 -
 ...-beagleboard-add-bbtoys-ulcd-lite-support.patch |  235 --
 ...eagleboard-add-support-for-loopthrough-ex.patch |   61 -
 ...add-initial-support-for-WS2801-controller.patch |  242 --
 .../usb/0001-Fix-sprz319-erratum-2.1.patch         |  210 --
 recipes-kernel/linux/linux_3.0.bb                  |  234 --
 recipes-kernel/linux/linux_3.1.bb                  |   33 -
 225 files changed, 0 insertions(+), 60457 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=edfd76fce4c3fbf6074c42d4ce55c456db333279

