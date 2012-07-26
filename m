Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26F45E01401
	for <meta-ti@yoctoproject.org>; Wed, 25 Jul 2012 18:32:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D6051529A4; Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120726013212.D6051529A4@arago-project.org>
Date: Thu, 26 Jul 2012 01:32:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2.23
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
Commit: 9bc77dff5f84578e259f8225bfa0656d94a2a60a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9bc77dff5f84578e259f8225bfa0656d94a2a60a

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Jul 17 09:23:14 2012 +0200

linux-ti33x-psp 3.2: update to 3.2.23

Regenerate all beaglebone patches and add one vfs tracer patch for powertop

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...iio-ad7606-Re-add-missing-scale-attribute.patch |   37 +++
 ...erify-origin-of-netlink-connector-message.patch |   51 ++++
 ...mce-decoding-crash-after-edac-driver-unlo.patch |  166 +++++++++++
 ...0004-hwrng-atmel-rng-fix-data-valid-check.patch |   72 +++++
 .../0005-staging-r8712u-Add-new-USB-IDs.patch      |   32 ++
 ...esmc-Limit-key-length-in-warning-messages.patch |   43 +++
 ..._atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch |  218 ++++++++++++++
 ...tomic64_read-in-pmd_read_atomic-for-32bit.patch |  125 ++++++++
 ...nsure-proper-cache-clearing-for-gc-inodes.patch |   71 +++++
 ...nish-any-pending-operations-on-the-frameb.patch |  130 +++++++++
 ...move-use-of-the-autoreported-ringbuffer-H.patch |   84 ++++++
 .../0012-e1000e-Disable-ASPM-L1-on-82574.patch     |   41 +++
 ...ve-special-case-for-82573-82574-ASPM-L1-d.patch |   43 +++
 ...-the-fallback-non-IRQ-wait-in-ring-thrott.patch |   39 +++
 ..._pstor-Fix-possible-panic-by-NULL-pointer.patch |   72 +++++
 ...Fix-buffers-staying-in-queued-state-after.patch |   45 +++
 ...autodetection-support-for-USB-ID-2040-f5a.patch |   30 ++
 ...n-t-return-stack-garbage-from-supports_rb.patch |   36 +++
 ...-fbcon-using-nv_two_heads-is-not-a-good-i.patch |   43 +++
 ...nstate-missing-mempool_free-in-cell_relea.patch |   55 ++++
 ...Fix-a-WARNING-on-suspend-resume-with-IBSS.patch |   75 +++++
 ...0211-fix-potential-deadlock-in-regulatory.patch |  144 ++++++++++
 .../0023-ath9k-Fix-softlockup-in-AR9485.patch      |   68 +++++
 ...can-precedence-error-in-c_can_chip_config.patch |   38 +++
 ...9k-fix-a-tx-rate-duration-calculation-bug.patch |   41 +++
 .../0026-batman-adv-fix-skb-data-assignment.patch  |   42 +++
 ...-Should-check-for-IS_ERR-clk-instead-of-N.patch |   33 +++
 ...oid-possible-infinite-loop-in-ar9003_get_.patch |   61 ++++
 ...ove-log_event-debugfs-file-debugging-is-d.patch |   67 +++++
 ...AMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch |   36 +++
 ...31-USB-option-add-id-for-Cellient-MEN-200.patch |   44 +++
 ...rf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch |   44 +++
 ...factor-the-deferred-PM_IIR-handling-into-.patch |  107 +++++++
 .../0034-drm-i915-rip-out-the-PM_IIR-WARN.patch    |   60 ++++
 ...x-eDP-blank-screen-after-S3-resume-on-HP-.patch |   46 +++
 ...event-waiting-forever-on-asynchronous-sus.patch |   62 ++++
 ...ure-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch |   73 +++++
 ...w-merging-of-backports-for-serious-user-v.patch |   51 ++++
 ...ALSA-hda-Add-Realtek-ALC280-codec-support.patch |   34 +++
 ...tion-Add-USB-ID-for-Novatel-Ovation-MC551.patch |   41 +++
 .../3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch |   61 ++++
 ...t-teardown-the-device-before-unregisterin.patch |   58 ++++
 ...-use-be32_to_cpup-to-handle-the-value-of-.patch |   44 +++
 ...acpi_pad-fix-power_saving-thread-deadlock.patch |   66 +++++
 ...v-only-drop-packets-of-known-wifi-clients.patch |   55 ++++
 .../3.2.22/0046-Linux-3.2.22.patch                 |   24 ++
 .../0001-splice-fix-racy-pipe-buffers-uses.patch   |  298 ++++++++++++++++++++
 .../3.2.23/0002-umem-fix-up-unplugging.patch       |   86 ++++++
 ...0003-mwifiex-fix-11n-rx-packet-drop-issue.patch |   88 ++++++
 ...4-mwifiex-fix-WPS-eapol-handshake-failure.patch |   52 ++++
 ...-Prevent-multiple-buffer-overflows-in-NCI.patch |   52 ++++
 ...-ath9k-fix-dynamic-WEP-related-regression.patch |   80 ++++++
 ...turn-from-rawsock_release-when-sk-is-NULL.patch |  107 +++++++
 .../0008-rtlwifi-rtl8192cu-New-USB-IDs.patch       |   45 +++
 ...ble-serialize_regmode-for-non-PCIE-AR9287.patch |   34 +++
 ...rrect-behaviour-on-unrecognised-action-fr.patch |   48 ++++
 ...C-tlv320aic3x-Fix-codec-pll-configure-bug.patch |   62 ++++
 ...mon-Use-cpumask-iterator-to-avoid-warning.patch |   56 ++++
 .../0013-powerpc-kvm-sldi-should-be-sld.patch      |   40 +++
 ...on-t-try-to-recovery-unmatched-and-unused.patch |   50 ++++
 ...-not-add-data_offset-before-call-to-is_ba.patch |   54 ++++
 ...-ops_run_io-inc-nr_pending-before-calling.patch |   45 +++
 ...ix-failure-when-trying-to-repair-a-read-e.patch |   61 ++++
 ...ck-any-firmware-framebuffers-before-claim.patch |  118 ++++++++
 ...nt-data-fix-shadow_info_leak-on-dm_tm_des.patch |   37 +++
 ...nt-data-handle-space-map-checker-creation.patch |  182 ++++++++++++
 ...nt-data-fix-allocation-failure-in-space-m.patch |   95 +++++++
 ...da-Fix-power-map-regression-for-HP-dv6-co.patch |   49 ++++
 ...nge-CPU-ring-buffer-state-from-tracing_cp.patch |   56 ++++
 ...-wrong-return-values-in-add_virtual_intf-.patch |   93 ++++++
 ...-instead-of-abusing-i-in-udf_load_logical.patch |   35 +++
 ...un-away-loop-when-partition-table-length-.patch |   54 ++++
 ...0027-udf-Fortify-loading-of-sparing-table.patch |  134 +++++++++
 .../0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch |   68 +++++
 ...lidate-data_len-before-allocating-skb-in-.patch |   53 ++++
 ...e-CIPSO-options-correctly-when-NetLabel-i.patch |   80 ++++++
 ...tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch |   43 +++
 .../0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch  |   53 ++++
 ...fix-checksum-bit-management-on-some-chips.patch |   47 +++
 .../3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch |   44 +++
 ...-dummy-fix-rcu_sched-self-detected-stalls.patch |   49 ++++
 .../0036-bonding-Fix-corrupted-queue_mapping.patch |  117 ++++++++
 ...thtool-allow-ETHTOOL_GSSET_INFO-for-users.patch |   36 +++
 .../0038-netpoll-fix-netpoll_send_udp-bugs.patch   |   77 +++++
 ...pv6-proc-file-registration-to-end-of-init.patch |  126 ++++++++
 ...gn-rtnl_link_ops-to-bridge-devices-create.patch |   62 ++++
 ...elayed-directory-updates-during-log-repla.patch |   56 ++++
 ...erver-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch |   60 ++++
 ...s2-clear-unaligned-io-flag-when-dio-fails.patch |   38 +++
 ...ake-kiocb-private-NUll-in-init_sync_kiocb.patch |   39 +++
 .../0045-mtd-cafe_nand-fix-an-vs-mistake.patch     |   39 +++
 ...m-Hold-a-file-reference-in-madvise_remove.patch |   80 ++++++
 ..._fc-Resolve-suspicious-RCU-usage-warnings.patch |   36 +++
 ...O_PATH-file-descriptors-usable-for-fchdir.patch |   56 ++++
 .../3.2.23/0049-Linux-3.2.23.patch                 |   24 ++
 ...1-f_rndis-HACK-around-undefined-variables.patch |    8 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    8 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |    8 +-
 .../beaglebone/0004-more-beaglebone-merges.patch   |   10 +-
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |    8 +-
 ...general-purpose-mode-untested-with-touchs.patch |    6 +-
 ...dc-Add-board-file-mfd-support-fix-warning.patch |    6 +-
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |    8 +-
 ...cadc-make-stepconfig-channel-configurable.patch |    8 +-
 .../0010-tscadc-Trigger-through-sysfs.patch        |    6 +-
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |    8 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |    8 +-
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |    8 +-
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    8 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |    8 +-
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   12 +-
 ...set-default-brightness-to-50-for-pwm-back.patch |    8 +-
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    8 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |    8 +-
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   10 +-
 ...add-more-beagleboardtoys-cape-partnumbers.patch |    8 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |    8 +-
 ...23-beaglebone-add-enter-key-for-lcd7-cape.patch |    8 +-
 .../0024-beaglebone-add-gpio-keys-for-lcd.patch    |    8 +-
 ...025-beaglebone-fix-direction-of-gpio-keys.patch |    8 +-
 .../0026-beaglebone-fix-3.5-lcd-cape-support.patch |    8 +-
 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |    8 +-
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |    8 +-
 ...0029-beaglebone-also-report-cape-revision.patch |    8 +-
 ...don-t-compare-undefined-characters-it-mak.patch |    8 +-
 .../0031-beaglebone-fix-3.5-cape-support.patch     |    8 +-
 ...-connect-batterycape-GPIO-to-gpio-charger.patch |    8 +-
 ...lebone-add-support-for-CAN-and-RS232-cape.patch |   10 +-
 ...glebone-add-support-for-DVI-rev.-A2-capes.patch |    8 +-
 ...e-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch |   10 +-
 ...036-Beaglebone-Fixed-compiletime-warnings.patch |    8 +-
 ...Added-missing-termination-record-to-bone_.patch |    8 +-
 ...xevm.c-Beaglebone-expose-all-pwms-through.patch |    8 +-
 ...x-Fixed-debugfs-mux-output-always-reporti.patch |   10 +-
 ...export-SPI2-as-spidev-when-no-capes-are-u.patch |    8 +-
 ...rking-WIP-changes-to-make-DMA-safe-and-ad.patch |    8 +-
 .../0042-omap-hwmod-silence-st_shift-error.patch   |    8 +-
 ...psw-phy_device-demote-PHY-message-to-INFO.patch |    6 +-
 ...ne-add-support-for-7-LCD-cape-revision-A2.patch |    8 +-
 ...beaglebone-allow-capes-to-disable-w1-gpio.patch |    8 +-
 ...add-stub-for-the-camera-cape-to-disable-w.patch |    8 +-
 ...y-of-the-missing-signals-to-the-mux-table.patch |    8 +-
 ...sed-part-of-LCD-bus.-Added-even-more-miss.patch |   10 +-
 ...c-add-defines-for-4x-and-16x-oversampling.patch |    8 +-
 .../0050-ts_tscadc-switch-to-4x-oversampling.patch |    8 +-
 ...of-pinmux-data-array-in-EEPROM-data-struc.patch |    8 +-
 ...-Bone-Cape-configuration-from-EEPROM.-Onl.patch |    8 +-
 ...nditional-debug-code-by-pr_debug-statemen.patch |    8 +-
 ...for-boards-with-mistaken-ASCII-interpreta.patch |    8 +-
 ...for-EEPROM-contents-blocking-further-I2C-.patch |    8 +-
 ...-on-EEPROM-revision-to-prevent-interpreti.patch |    8 +-
 ...lar-fix-i2c-fixed-prescalar-setting-issue.patch |    8 +-
 ...lebone-annotate-default-beaglebone-pinmux.patch |    8 +-
 ...fix-pin-free-thinko-this-method-doesn-t-g.patch |    8 +-
 ...060-beaglebone-switch-RS232-cape-to-ttyO2.patch |    8 +-
 ...-make-uart2-pinmux-match-the-uart0-pinmux.patch |    8 +-
 ...unding-FB-size-to-satisfy-SGX-buffer-requ.patch |    8 +-
 .../0063-beaglebone-dvi-cape-audio-hacks.patch     |   12 +-
 ...lebone-always-execute-the-pin-free-checks.patch |    8 +-
 .../0065-ti_tscadc-switch-to-16x-averaging.patch   |    8 +-
 ...-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch} |    8 +-
 ...dd-support-for-the-4.3-lcd-cape-with-res.patch} |   12 +-
 ...8-beaglebone-add-support-for-LCD3-rev-A1.patch} |   10 +-
 ...ix-buttons-spidev-clash-when-using-mcasp.patch} |   10 +-
 ...0070-beaglebone-fix-LCD3-led-key-overlap.patch} |    6 +-
 ...h => 0071-beaglebone-fix-audio-spi-clash.patch} |   12 +-
 ...dd-support-for-QuickLogic-Camera-interfa.patch} |   18 +-
 ...dd-support-for-DVI-audio-and-audio-only-.patch} |   11 +-
 ...lebone-disable-LBO-GPIO-for-battery-cape.patch} |    6 +-
 ...race-point-in-the-mark_inode_dirty-functi.patch |  103 +++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  116 +++++++-
 172 files changed, 6825 insertions(+), 323 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=9bc77dff5f84578e259f8225bfa0656d94a2a60a

