Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70E1CE00348
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:41 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id d41so1131520eek.35
	for <meta-ti@yoctoproject.org>; Sun, 29 Jul 2012 10:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=H/wDDe3tFweXbmDw9PlJwAQuMRFb1qS3eueI0pqATqQ=;
	b=XTRf68uO33trULlczoakH4BhjaEWk7kN31UrHU8PZR86pzILWzc3GV4p7qCRqzQ1nJ
	iyREvT9oOZfJgJrL7ep0gFNm7tBP0gYRewR8pb6ic6J2LixG8XwKWGZtfE29FRVy8lpK
	52uCNzAO71EpUiK7Sz3Z2kXY4B4JyYaTomflrLo/fWyu1CRPr83KBD2N90p+mr8Hq57X
	mjcgm5ZsES7yZW7LtRdOLxPPyXYaV51OInpqI23ngRgkUKKuTVJuy5DpUeoEisnoF2VS
	Gd6j0UImeUc9bUTIOH4trfMiKBgUFj/P9atYXK6p+adgt23IoBHwxiPswBrcllXlrIvn
	4gdA==
Received: by 10.14.203.132 with SMTP id f4mr9130743eeo.24.1343581780883;
	Sun, 29 Jul 2012 10:09:40 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id t6sm21525605eeo.17.2012.07.29.10.09.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Jul 2012 10:09:37 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Sun, 29 Jul 2012 19:08:33 +0200
Message-Id: <1343581714-20397-11-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
References: <1343581714-20397-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmS5VwLvuzf6DeEokccJS/+1z+6YtibeeO+Aj79Cu++YRx+iE7pEPtvHu05htyr+irvexZn
Subject: [PATCH][for-denzil 11/12] linux-ti33x-psp 3.2: update to 3.2.23
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
X-List-Received-Date: Sun, 29 Jul 2012 17:09:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Regenerate all beaglebone patches and add one vfs tracer patch for powertop

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...iio-ad7606-Re-add-missing-scale-attribute.patch |   37 +
 ...erify-origin-of-netlink-connector-message.patch |   51 +
 ...mce-decoding-crash-after-edac-driver-unlo.patch |  166 ++
 ...0004-hwrng-atmel-rng-fix-data-valid-check.patch |   72 +
 .../0005-staging-r8712u-Add-new-USB-IDs.patch      |   32 +
 ...esmc-Limit-key-length-in-warning-messages.patch |   43 +
 ..._atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch |  218 +++
 ...tomic64_read-in-pmd_read_atomic-for-32bit.patch |  125 ++
 ...nsure-proper-cache-clearing-for-gc-inodes.patch |   71 +
 ...nish-any-pending-operations-on-the-frameb.patch |  130 ++
 ...move-use-of-the-autoreported-ringbuffer-H.patch |   84 +
 .../0012-e1000e-Disable-ASPM-L1-on-82574.patch     |   41 +
 ...ve-special-case-for-82573-82574-ASPM-L1-d.patch |   43 +
 ...-the-fallback-non-IRQ-wait-in-ring-thrott.patch |   39 +
 ..._pstor-Fix-possible-panic-by-NULL-pointer.patch |   72 +
 ...Fix-buffers-staying-in-queued-state-after.patch |   45 +
 ...autodetection-support-for-USB-ID-2040-f5a.patch |   30 +
 ...n-t-return-stack-garbage-from-supports_rb.patch |   36 +
 ...-fbcon-using-nv_two_heads-is-not-a-good-i.patch |   43 +
 ...nstate-missing-mempool_free-in-cell_relea.patch |   55 +
 ...Fix-a-WARNING-on-suspend-resume-with-IBSS.patch |   75 +
 ...0211-fix-potential-deadlock-in-regulatory.patch |  144 ++
 .../0023-ath9k-Fix-softlockup-in-AR9485.patch      |   68 +
 ...can-precedence-error-in-c_can_chip_config.patch |   38 +
 ...9k-fix-a-tx-rate-duration-calculation-bug.patch |   41 +
 .../0026-batman-adv-fix-skb-data-assignment.patch  |   42 +
 ...-Should-check-for-IS_ERR-clk-instead-of-N.patch |   33 +
 ...oid-possible-infinite-loop-in-ar9003_get_.patch |   61 +
 ...ove-log_event-debugfs-file-debugging-is-d.patch |   67 +
 ...AMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch |   36 +
 ...31-USB-option-add-id-for-Cellient-MEN-200.patch |   44 +
 ...rf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch |   44 +
 ...factor-the-deferred-PM_IIR-handling-into-.patch |  107 ++
 .../0034-drm-i915-rip-out-the-PM_IIR-WARN.patch    |   60 +
 ...x-eDP-blank-screen-after-S3-resume-on-HP-.patch |   46 +
 ...event-waiting-forever-on-asynchronous-sus.patch |   62 +
 ...ure-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch |   73 +
 ...w-merging-of-backports-for-serious-user-v.patch |   51 +
 ...ALSA-hda-Add-Realtek-ALC280-codec-support.patch |   34 +
 ...tion-Add-USB-ID-for-Novatel-Ovation-MC551.patch |   41 +
 .../3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch |   61 +
 ...t-teardown-the-device-before-unregisterin.patch |   58 +
 ...-use-be32_to_cpup-to-handle-the-value-of-.patch |   44 +
 ...acpi_pad-fix-power_saving-thread-deadlock.patch |   66 +
 ...v-only-drop-packets-of-known-wifi-clients.patch |   55 +
 .../3.2.22/0046-Linux-3.2.22.patch                 |   24 +
 .../0001-splice-fix-racy-pipe-buffers-uses.patch   |  298 ++++
 .../3.2.23/0002-umem-fix-up-unplugging.patch       |   86 ++
 ...0003-mwifiex-fix-11n-rx-packet-drop-issue.patch |   88 ++
 ...4-mwifiex-fix-WPS-eapol-handshake-failure.patch |   52 +
 ...-Prevent-multiple-buffer-overflows-in-NCI.patch |   52 +
 ...-ath9k-fix-dynamic-WEP-related-regression.patch |   80 +
 ...turn-from-rawsock_release-when-sk-is-NULL.patch |  107 ++
 .../0008-rtlwifi-rtl8192cu-New-USB-IDs.patch       |   45 +
 ...ble-serialize_regmode-for-non-PCIE-AR9287.patch |   34 +
 ...rrect-behaviour-on-unrecognised-action-fr.patch |   48 +
 ...C-tlv320aic3x-Fix-codec-pll-configure-bug.patch |   62 +
 ...mon-Use-cpumask-iterator-to-avoid-warning.patch |   56 +
 .../0013-powerpc-kvm-sldi-should-be-sld.patch      |   40 +
 ...on-t-try-to-recovery-unmatched-and-unused.patch |   50 +
 ...-not-add-data_offset-before-call-to-is_ba.patch |   54 +
 ...-ops_run_io-inc-nr_pending-before-calling.patch |   45 +
 ...ix-failure-when-trying-to-repair-a-read-e.patch |   61 +
 ...ck-any-firmware-framebuffers-before-claim.patch |  118 ++
 ...nt-data-fix-shadow_info_leak-on-dm_tm_des.patch |   37 +
 ...nt-data-handle-space-map-checker-creation.patch |  182 +++
 ...nt-data-fix-allocation-failure-in-space-m.patch |   95 ++
 ...da-Fix-power-map-regression-for-HP-dv6-co.patch |   49 +
 ...nge-CPU-ring-buffer-state-from-tracing_cp.patch |   56 +
 ...-wrong-return-values-in-add_virtual_intf-.patch |   93 ++
 ...-instead-of-abusing-i-in-udf_load_logical.patch |   35 +
 ...un-away-loop-when-partition-table-length-.patch |   54 +
 ...0027-udf-Fortify-loading-of-sparing-table.patch |  134 ++
 .../0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch |   68 +
 ...lidate-data_len-before-allocating-skb-in-.patch |   53 +
 ...e-CIPSO-options-correctly-when-NetLabel-i.patch |   80 +
 ...tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch |   43 +
 .../0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch  |   53 +
 ...fix-checksum-bit-management-on-some-chips.patch |   47 +
 .../3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch |   44 +
 ...-dummy-fix-rcu_sched-self-detected-stalls.patch |   49 +
 .../0036-bonding-Fix-corrupted-queue_mapping.patch |  117 ++
 ...thtool-allow-ETHTOOL_GSSET_INFO-for-users.patch |   36 +
 .../0038-netpoll-fix-netpoll_send_udp-bugs.patch   |   77 +
 ...pv6-proc-file-registration-to-end-of-init.patch |  126 ++
 ...gn-rtnl_link_ops-to-bridge-devices-create.patch |   62 +
 ...elayed-directory-updates-during-log-repla.patch |   56 +
 ...erver-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch |   60 +
 ...s2-clear-unaligned-io-flag-when-dio-fails.patch |   38 +
 ...ake-kiocb-private-NUll-in-init_sync_kiocb.patch |   39 +
 .../0045-mtd-cafe_nand-fix-an-vs-mistake.patch     |   39 +
 ...m-Hold-a-file-reference-in-madvise_remove.patch |   80 +
 ..._fc-Resolve-suspicious-RCU-usage-warnings.patch |   36 +
 ...O_PATH-file-descriptors-usable-for-fchdir.patch |   56 +
 .../3.2.23/0049-Linux-3.2.23.patch                 |   24 +
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
 ...o-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch |   45 +
 ...add-support-for-the-4.3-lcd-cape-with-res.patch |   94 ++
 ...o-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch |   45 -
 ...68-beaglebone-add-support-for-LCD3-rev-A1.patch |  132 ++
 ...add-support-for-the-4.3-lcd-cape-with-res.patch |   94 --
 ...69-beaglebone-add-support-for-LCD3-rev-A1.patch |  132 --
 ...fix-buttons-spidev-clash-when-using-mcasp.patch |   52 +
 .../0070-beaglebone-fix-LCD3-led-key-overlap.patch |   54 +
 ...fix-buttons-spidev-clash-when-using-mcasp.patch |   52 -
 .../0071-beaglebone-fix-LCD3-led-key-overlap.patch |   54 -
 .../0071-beaglebone-fix-audio-spi-clash.patch      |   25 +
 ...add-support-for-QuickLogic-Camera-interfa.patch | 1612 ++++++++++++++++++++
 .../0072-beaglebone-fix-audio-spi-clash.patch      |   25 -
 ...add-support-for-DVI-audio-and-audio-only-.patch |   64 +
 ...add-support-for-QuickLogic-Camera-interfa.patch | 1612 --------------------
 ...add-support-for-DVI-audio-and-audio-only-.patch |   63 -
 ...glebone-disable-LBO-GPIO-for-battery-cape.patch |   35 +
 ...glebone-disable-LBO-GPIO-for-battery-cape.patch |   35 -
 ...race-point-in-the-mark_inode_dirty-functi.patch |  103 ++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  116 +-
 181 files changed, 8891 insertions(+), 2389 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0001-staging-iio-ad7606-Re-add-missing-scale-attribute.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0002-Tools-hv-verify-origin-of-netlink-connector-message.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0003-edac-avoid-mce-decoding-crash-after-edac-driver-unlo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0004-hwrng-atmel-rng-fix-data-valid-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0005-staging-r8712u-Add-new-USB-IDs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0006-hwmon-applesmc-Limit-key-length-in-warning-messages.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0007-mm-pmd_read_atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0008-thp-avoid-atomic64_read-in-pmd_read_atomic-for-32bit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0009-nilfs2-ensure-proper-cache-clearing-for-gc-inodes.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0010-drm-i915-Finish-any-pending-operations-on-the-frameb.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0011-drm-i915-Remove-use-of-the-autoreported-ringbuffer-H.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0012-e1000e-Disable-ASPM-L1-on-82574.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0013-e1000e-Remove-special-case-for-82573-82574-ASPM-L1-d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0014-drm-i915-Do-the-fallback-non-IRQ-wait-in-ring-thrott.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0015-staging-rts_pstor-Fix-possible-panic-by-NULL-pointer.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0016-gspca-core-Fix-buffers-staying-in-queued-state-after.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0017-smsusb-add-autodetection-support-for-USB-ID-2040-f5a.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0018-drm-edid-don-t-return-stack-garbage-from-supports_rb.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0019-drm-nouveau-fbcon-using-nv_two_heads-is-not-a-good-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0020-dm-thin-reinstate-missing-mempool_free-in-cell_relea.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0021-ath9k-Fix-a-WARNING-on-suspend-resume-with-IBSS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0022-cfg80211-fix-potential-deadlock-in-regulatory.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0023-ath9k-Fix-softlockup-in-AR9485.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0024-can-c_can-precedence-error-in-c_can_chip_config.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0025-ath9k-fix-a-tx-rate-duration-calculation-bug.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0026-batman-adv-fix-skb-data-assignment.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0027-ARM-SAMSUNG-Should-check-for-IS_ERR-clk-instead-of-N.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0028-ath9k_hw-avoid-possible-infinite-loop-in-ar9003_get_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0029-iwlwifi-remove-log_event-debugfs-file-debugging-is-d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0030-ARM-SAMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0031-USB-option-add-id-for-Cellient-MEN-200.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0032-oprofile-perf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0033-drm-i915-Refactor-the-deferred-PM_IIR-handling-into-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0034-drm-i915-rip-out-the-PM_IIR-WARN.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0035-drm-i915-Fix-eDP-blank-screen-after-S3-resume-on-HP-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0036-PM-Sleep-Prevent-waiting-forever-on-asynchronous-sus.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0037-x86-cpufeature-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0038-stable-Allow-merging-of-backports-for-serious-user-v.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0039-ALSA-hda-Add-Realtek-ALC280-codec-support.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0040-USB-option-Add-USB-ID-for-Novatel-Ovation-MC551.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0042-xen-netfront-teardown-the-device-before-unregisterin.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0043-can-flexcan-use-be32_to_cpup-to-handle-the-value-of-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0044-acpi_pad-fix-power_saving-thread-deadlock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0045-batman-adv-only-drop-packets-of-known-wifi-clients.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0046-Linux-3.2.22.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0001-splice-fix-racy-pipe-buffers-uses.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0002-umem-fix-up-unplugging.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0003-mwifiex-fix-11n-rx-packet-drop-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0004-mwifiex-fix-WPS-eapol-handshake-failure.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0005-NFC-Prevent-multiple-buffer-overflows-in-NCI.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0006-ath9k-fix-dynamic-WEP-related-regression.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0007-NFC-Return-from-rawsock_release-when-sk-is-NULL.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0008-rtlwifi-rtl8192cu-New-USB-IDs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0009-ath9k-enable-serialize_regmode-for-non-PCIE-AR9287.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0010-mac80211-correct-behaviour-on-unrecognised-action-fr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0011-ASoC-tlv320aic3x-Fix-codec-pll-configure-bug.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0012-powerpc-xmon-Use-cpumask-iterator-to-avoid-warning.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0013-powerpc-kvm-sldi-should-be-sld.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0014-md-raid10-Don-t-try-to-recovery-unmatched-and-unused.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0015-md-raid5-Do-not-add-data_offset-before-call-to-is_ba.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0016-md-raid5-In-ops_run_io-inc-nr_pending-before-calling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0017-md-raid10-fix-failure-when-trying-to-repair-a-read-e.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0018-drm-i915-kick-any-firmware-framebuffers-before-claim.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0019-dm-persistent-data-fix-shadow_info_leak-on-dm_tm_des.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0020-dm-persistent-data-handle-space-map-checker-creation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0021-dm-persistent-data-fix-allocation-failure-in-space-m.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0022-ALSA-hda-Fix-power-map-regression-for-HP-dv6-co.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0023-tracing-change-CPU-ring-buffer-state-from-tracing_cp.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0024-mwifiex-fix-wrong-return-values-in-add_virtual_intf-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0025-udf-Use-ret-instead-of-abusing-i-in-udf_load_logical.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0026-udf-Avoid-run-away-loop-when-partition-table-length-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0027-udf-Fortify-loading-of-sparing-table.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0029-net-sock-validate-data_len-before-allocating-skb-in-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0030-cipso-handle-CIPSO-options-correctly-when-NetLabel-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0031-net-l2tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0033-sky2-fix-checksum-bit-management-on-some-chips.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0035-dummy-fix-rcu_sched-self-detected-stalls.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0036-bonding-Fix-corrupted-queue_mapping.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0037-ethtool-allow-ETHTOOL_GSSET_INFO-for-users.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0038-netpoll-fix-netpoll_send_udp-bugs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0039-ipv6-Move-ipv6-proc-file-registration-to-end-of-init.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0040-bridge-Assign-rtnl_link_ops-to-bridge-devices-create.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0041-Btrfs-run-delayed-directory-updates-during-log-repla.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0042-cifs-when-server-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0043-ocfs2-clear-unaligned-io-flag-when-dio-fails.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0044-aio-make-kiocb-private-NUll-in-init_sync_kiocb.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0045-mtd-cafe_nand-fix-an-vs-mistake.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0046-mm-Hold-a-file-reference-in-madvise_remove.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0047-tcm_fc-Resolve-suspicious-RCU-usage-warnings.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0048-vfs-make-O_PATH-file-descriptors-usable-for-fchdir.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0049-Linux-3.2.23.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-LCD3-rev-A1.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-LCD3-led-key-overlap.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-audio-spi-clash.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0080-vfs-Add-a-trace-point-in-the-mark_inode_dirty-functi.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 441a7bb..02759d5 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r13"
+MACHINE_KERNEL_PR = "r14"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0001-staging-iio-ad7606-Re-add-missing-scale-attribute.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0001-staging-iio-ad7606-Re-add-missing-scale-attribute.patch
new file mode 100644
index 0000000..4f7f561
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0001-staging-iio-ad7606-Re-add-missing-scale-attribute.patch
@@ -0,0 +1,37 @@
+From ea62444a6898324ec9aeb8799a8fd518073fe5a8 Mon Sep 17 00:00:00 2001
+From: Lars-Peter Clausen <lars@metafoo.de>
+Date: Tue, 5 Jun 2012 18:16:31 +0200
+Subject: [PATCH 01/46] staging:iio:ad7606: Re-add missing scale attribute
+
+commit 279bf2e57c30c9a4482b2b6ede11b31c41e35e78 upstream.
+
+Commit 50ac23be ("staging:iio:adc:ad7606 add local define for chan_spec
+structures.") accidentally removed the scale info_mask flag. This patch
+adds it back again.
+
+Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
+Acked-by: Jonathan Cameron <jic23@kernel.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+[bwh: Backported to 3.2:
+ - info_mask was completely gone rather than set to another flag
+ - IIO_CHAN_INFO_SCALE_SHARED_BIT was not defined; write it out as a shift]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/staging/iio/adc/ad7606_core.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/staging/iio/adc/ad7606_core.c b/drivers/staging/iio/adc/ad7606_core.c
+index 54423ab..2ee187f 100644
+--- a/drivers/staging/iio/adc/ad7606_core.c
++++ b/drivers/staging/iio/adc/ad7606_core.c
+@@ -241,6 +241,7 @@ static const struct attribute_group ad7606_attribute_group = {
+ 		.indexed = 1,				\
+ 		.channel = num,				\
+ 		.address = num,				\
++		.info_mask = (1 << IIO_CHAN_INFO_SCALE_SHARED), \
+ 		.scan_index = num,			\
+ 		.scan_type = IIO_ST('s', 16, 16, 0),	\
+ 	}
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0002-Tools-hv-verify-origin-of-netlink-connector-message.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0002-Tools-hv-verify-origin-of-netlink-connector-message.patch
new file mode 100644
index 0000000..7b4da32
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0002-Tools-hv-verify-origin-of-netlink-connector-message.patch
@@ -0,0 +1,51 @@
+From 510150c1fa93796d65a9b598a8e1509629f5d84e Mon Sep 17 00:00:00 2001
+From: Olaf Hering <olaf@aepfle.de>
+Date: Thu, 31 May 2012 16:40:06 +0200
+Subject: [PATCH 02/46] Tools: hv: verify origin of netlink connector message
+
+commit bcc2c9c3fff859e0eb019fe6fec26f9b8eba795c upstream.
+
+The SuSE security team suggested to use recvfrom instead of recv to be
+certain that the connector message is originated from kernel.
+
+CVE-2012-2669
+
+Signed-off-by: Olaf Hering <olaf@aepfle.de>
+Signed-off-by: Marcus Meissner <meissner@suse.de>
+Signed-off-by: Sebastian Krahmer <krahmer@suse.de>
+Signed-off-by: K. Y. Srinivasan <kys@microsoft.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ tools/hv/hv_kvp_daemon.c |   10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/tools/hv/hv_kvp_daemon.c b/tools/hv/hv_kvp_daemon.c
+index 11224ed..323d4d9 100644
+--- a/tools/hv/hv_kvp_daemon.c
++++ b/tools/hv/hv_kvp_daemon.c
+@@ -384,14 +384,18 @@ int main(void)
+ 	pfd.fd = fd;
+ 
+ 	while (1) {
++		struct sockaddr *addr_p = (struct sockaddr *) &addr;
++		socklen_t addr_l = sizeof(addr);
+ 		pfd.events = POLLIN;
+ 		pfd.revents = 0;
+ 		poll(&pfd, 1, -1);
+ 
+-		len = recv(fd, kvp_recv_buffer, sizeof(kvp_recv_buffer), 0);
++		len = recvfrom(fd, kvp_recv_buffer, sizeof(kvp_recv_buffer), 0,
++				addr_p, &addr_l);
+ 
+-		if (len < 0) {
+-			syslog(LOG_ERR, "recv failed; error:%d", len);
++		if (len < 0 || addr.nl_pid) {
++			syslog(LOG_ERR, "recvfrom failed; pid:%u error:%d %s",
++					addr.nl_pid, errno, strerror(errno));
+ 			close(fd);
+ 			return -1;
+ 		}
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0003-edac-avoid-mce-decoding-crash-after-edac-driver-unlo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0003-edac-avoid-mce-decoding-crash-after-edac-driver-unlo.patch
new file mode 100644
index 0000000..6670761
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0003-edac-avoid-mce-decoding-crash-after-edac-driver-unlo.patch
@@ -0,0 +1,166 @@
+From 081ba8d6f6253982766e17b90992c1002c31acb0 Mon Sep 17 00:00:00 2001
+From: Chen Gong <gong.chen@linux.intel.com>
+Date: Tue, 8 May 2012 20:40:12 -0300
+Subject: [PATCH 03/46] edac: avoid mce decoding crash after edac driver
+ unloaded
+
+commit e35fca4791fcdd43dc1fd769797df40c562ab491 upstream.
+
+Some edac drivers register themselves as mce decoders via
+notifier_chain. But in current notifier_chain implementation logic,
+it doesn't accept same notifier registered twice. If so, it will be
+wrong when adding/removing the element from the list. For example,
+on one SandyBridge platform, remove module sb_edac and then trigger
+one error, it will hit oops because it has no mce decoder registered
+but related notifier_chain still points to an invalid callback
+function. Here is an example:
+
+Call Trace:
+ [<ffffffff8150ef6a>] atomic_notifier_call_chain+0x1a/0x20
+ [<ffffffff8102b936>] mce_log+0x46/0x180
+ [<ffffffff8102eaea>] apei_mce_report_mem_error+0x4a/0x60
+ [<ffffffff812e19d2>] ghes_do_proc+0x192/0x210
+ [<ffffffff812e2066>] ghes_proc+0x46/0x70
+ [<ffffffff812e20d8>] ghes_notify_sci+0x48/0x80
+ [<ffffffff8150ef05>] notifier_call_chain+0x55/0x80
+ [<ffffffff81076f1a>] __blocking_notifier_call_chain+0x5a/0x80
+ [<ffffffff812aea11>] ? acpi_os_wait_events_complete+0x23/0x23
+ [<ffffffff81076f56>] blocking_notifier_call_chain+0x16/0x20
+ [<ffffffff812ddc4d>] acpi_hed_notify+0x19/0x1b
+ [<ffffffff812b16bd>] acpi_device_notify+0x19/0x1b
+ [<ffffffff812beb38>] acpi_ev_notify_dispatch+0x67/0x7f
+ [<ffffffff812aea3a>] acpi_os_execute_deferred+0x29/0x36
+ [<ffffffff81069dc2>] process_one_work+0x132/0x450
+ [<ffffffff8106bbcb>] worker_thread+0x17b/0x3c0
+ [<ffffffff8106ba50>] ? manage_workers+0x120/0x120
+ [<ffffffff81070aee>] kthread+0x9e/0xb0
+ [<ffffffff81514724>] kernel_thread_helper+0x4/0x10
+ [<ffffffff81070a50>] ? kthread_freezable_should_stop+0x70/0x70
+ [<ffffffff81514720>] ? gs_change+0x13/0x13
+Code: f3 49 89 d4 45 85 ed 4d 89 c6 48 8b 0f 74 48 48 85 c9 75 17 eb 41
+0f 1f 80 00 00 00 00 41 83 ed 01 4c 89 f9 74 22 4d 85 ff 74 1d <4c> 8b
+79 08 4c 89 e2 48 89 de 48 89 cf ff 11 4d 85 f6 74 04 41
+RIP  [<ffffffff8150eef6>] notifier_call_chain+0x46/0x80
+ RSP <ffff88042868fb20>
+CR2: ffffffffa01af838
+---[ end trace 0100930068e73e6f ]---
+BUG: unable to handle kernel paging request at fffffffffffffff8
+IP: [<ffffffff810705b0>] kthread_data+0x10/0x20
+PGD 1a0d067 PUD 1a0e067 PMD 0
+Oops: 0000 [#2] SMP
+
+Only i7core_edac and sb_edac have such issues because they have more
+than one memory controller which means they have to register mce
+decoder many times.
+
+Signed-off-by: Chen Gong <gong.chen@linux.intel.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+[bwh: Backported to 3.2: drivers call atomic_notifier_chain_{,un}register()
+ directly]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/edac/i7core_edac.c |   15 ++++-----------
+ drivers/edac/sb_edac.c     |   10 ++++------
+ 2 files changed, 8 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/edac/i7core_edac.c b/drivers/edac/i7core_edac.c
+index 70ad892..b3ccefa 100644
+--- a/drivers/edac/i7core_edac.c
++++ b/drivers/edac/i7core_edac.c
+@@ -1932,12 +1932,6 @@ static int i7core_mce_check_error(struct notifier_block *nb, unsigned long val,
+ 	if (mce->bank != 8)
+ 		return NOTIFY_DONE;
+ 
+-#ifdef CONFIG_SMP
+-	/* Only handle if it is the right mc controller */
+-	if (mce->socketid != pvt->i7core_dev->socket)
+-		return NOTIFY_DONE;
+-#endif
+-
+ 	smp_rmb();
+ 	if ((pvt->mce_out + 1) % MCE_LOG_LEN == pvt->mce_in) {
+ 		smp_wmb();
+@@ -2234,8 +2228,6 @@ static void i7core_unregister_mci(struct i7core_dev *i7core_dev)
+ 	if (pvt->enable_scrub)
+ 		disable_sdram_scrub_setting(mci);
+ 
+-	atomic_notifier_chain_unregister(&x86_mce_decoder_chain, &i7_mce_dec);
+-
+ 	/* Disable EDAC polling */
+ 	i7core_pci_ctl_release(pvt);
+ 
+@@ -2336,8 +2328,6 @@ static int i7core_register_mci(struct i7core_dev *i7core_dev)
+ 	/* DCLK for scrub rate setting */
+ 	pvt->dclk_freq = get_dclk_freq();
+ 
+-	atomic_notifier_chain_register(&x86_mce_decoder_chain, &i7_mce_dec);
+-
+ 	return 0;
+ 
+ fail0:
+@@ -2481,8 +2471,10 @@ static int __init i7core_init(void)
+ 
+ 	pci_rc = pci_register_driver(&i7core_driver);
+ 
+-	if (pci_rc >= 0)
++	if (pci_rc >= 0) {
++		atomic_notifier_chain_register(&x86_mce_decoder_chain, &i7_mce_dec);
+ 		return 0;
++	}
+ 
+ 	i7core_printk(KERN_ERR, "Failed to register device with error %d.\n",
+ 		      pci_rc);
+@@ -2498,6 +2490,7 @@ static void __exit i7core_exit(void)
+ {
+ 	debugf2("MC: " __FILE__ ": %s()\n", __func__);
+ 	pci_unregister_driver(&i7core_driver);
++	atomic_notifier_chain_unregister(&x86_mce_decoder_chain, &i7_mce_dec);
+ }
+ 
+ module_init(i7core_init);
+diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
+index 7a402bf..18a1293 100644
+--- a/drivers/edac/sb_edac.c
++++ b/drivers/edac/sb_edac.c
+@@ -1661,9 +1661,6 @@ static void sbridge_unregister_mci(struct sbridge_dev *sbridge_dev)
+ 	debugf0("MC: " __FILE__ ": %s(): mci = %p, dev = %p\n",
+ 		__func__, mci, &sbridge_dev->pdev[0]->dev);
+ 
+-	atomic_notifier_chain_unregister(&x86_mce_decoder_chain,
+-					 &sbridge_mce_dec);
+-
+ 	/* Remove MC sysfs nodes */
+ 	edac_mc_del_mc(mci->dev);
+ 
+@@ -1731,8 +1728,6 @@ static int sbridge_register_mci(struct sbridge_dev *sbridge_dev)
+ 		goto fail0;
+ 	}
+ 
+-	atomic_notifier_chain_register(&x86_mce_decoder_chain,
+-				       &sbridge_mce_dec);
+ 	return 0;
+ 
+ fail0:
+@@ -1861,8 +1856,10 @@ static int __init sbridge_init(void)
+ 
+ 	pci_rc = pci_register_driver(&sbridge_driver);
+ 
+-	if (pci_rc >= 0)
++	if (pci_rc >= 0) {
++		atomic_notifier_chain_register(&x86_mce_decoder_chain, &sbridge_mce_dec);
+ 		return 0;
++	}
+ 
+ 	sbridge_printk(KERN_ERR, "Failed to register device with error %d.\n",
+ 		      pci_rc);
+@@ -1878,6 +1875,7 @@ static void __exit sbridge_exit(void)
+ {
+ 	debugf2("MC: " __FILE__ ": %s()\n", __func__);
+ 	pci_unregister_driver(&sbridge_driver);
++	atomic_notifier_chain_unregister(&x86_mce_decoder_chain, &sbridge_mce_dec);
+ }
+ 
+ module_init(sbridge_init);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0004-hwrng-atmel-rng-fix-data-valid-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0004-hwrng-atmel-rng-fix-data-valid-check.patch
new file mode 100644
index 0000000..85105de
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0004-hwrng-atmel-rng-fix-data-valid-check.patch
@@ -0,0 +1,72 @@
+From 28a0aa72b2ef00a665564ea05846ad22cb3f18ee Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Tue, 12 Jun 2012 08:27:04 +0800
+Subject: [PATCH 04/46] hwrng: atmel-rng - fix data valid check
+
+commit c475c06f4bb689d6ad87d7512e036d6dface3160 upstream.
+
+Brown paper bag: Data valid is LSB of the ISR (status register), and NOT
+of ODATA (current random data word)!
+
+With this, rngtest is a lot happier. Before:
+
+rngtest 3
+Copyright (c) 2004 by Henrique de Moraes Holschuh
+This is free software; see the source for copying conditions.  There is NO warr.
+
+rngtest: starting FIPS tests...
+rngtest: bits received from input: 20000032
+rngtest: FIPS 140-2 successes: 3
+rngtest: FIPS 140-2 failures: 997
+rngtest: FIPS 140-2(2001-10-10) Monobit: 604
+rngtest: FIPS 140-2(2001-10-10) Poker: 996
+rngtest: FIPS 140-2(2001-10-10) Runs: 36
+rngtest: FIPS 140-2(2001-10-10) Long run: 0
+rngtest: FIPS 140-2(2001-10-10) Continuous run: 117
+rngtest: input channel speed: (min=622.371; avg=23682.481; max=28224.350)Kibitss
+rngtest: FIPS tests speed: (min=12.361; avg=12.718; max=12.861)Mibits/s
+rngtest: Program run time: 2331696 microsecondsx
+
+After:
+rngtest 3
+Copyright (c) 2004 by Henrique de Moraes Holschuh
+This is free software; see the source for copying conditions.  There is NO warr.
+
+rngtest: starting FIPS tests...
+rngtest: bits received from input: 20000032
+rngtest: FIPS 140-2 successes: 999
+rngtest: FIPS 140-2 failures: 1
+rngtest: FIPS 140-2(2001-10-10) Monobit: 0
+rngtest: FIPS 140-2(2001-10-10) Poker: 0
+rngtest: FIPS 140-2(2001-10-10) Runs: 1
+rngtest: FIPS 140-2(2001-10-10) Long run: 0
+rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
+rngtest: input channel speed: (min=777.363; avg=43588.270; max=47870.711)Kibitss
+rngtest: FIPS tests speed: (min=11.943; avg=12.716; max=12.844)Mibits/s
+rngtest: Program run time: 1955282 microseconds
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Reported-by: George Pontis <GPontis@z9.com>
+Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/hw_random/atmel-rng.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/char/hw_random/atmel-rng.c b/drivers/char/hw_random/atmel-rng.c
+index 0477982..1b5675b 100644
+--- a/drivers/char/hw_random/atmel-rng.c
++++ b/drivers/char/hw_random/atmel-rng.c
+@@ -34,7 +34,7 @@ static int atmel_trng_read(struct hwrng *rng, void *buf, size_t max,
+ 	u32 *data = buf;
+ 
+ 	/* data ready? */
+-	if (readl(trng->base + TRNG_ODATA) & 1) {
++	if (readl(trng->base + TRNG_ISR) & 1) {
+ 		*data = readl(trng->base + TRNG_ODATA);
+ 		/*
+ 		  ensure data ready is only set again AFTER the next data
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0005-staging-r8712u-Add-new-USB-IDs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0005-staging-r8712u-Add-new-USB-IDs.patch
new file mode 100644
index 0000000..2bc87d7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0005-staging-r8712u-Add-new-USB-IDs.patch
@@ -0,0 +1,32 @@
+From 4f4723008a7461c6840e643bc66fcd92bfbf26b3 Mon Sep 17 00:00:00 2001
+From: Lubomir Schmidt <gentoo.lubomir@googlemail.com>
+Date: Fri, 15 Jun 2012 15:12:17 -0500
+Subject: [PATCH 05/46] staging: r8712u: Add new USB IDs
+
+commit 3026b0e942c65c65c8fc80d391d004228b52b916 upstream.
+
+There are two new devices for this driver.
+
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/staging/rtl8712/usb_intf.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
+index ec41d38..f4b738f 100644
+--- a/drivers/staging/rtl8712/usb_intf.c
++++ b/drivers/staging/rtl8712/usb_intf.c
+@@ -102,6 +102,8 @@ static struct usb_device_id rtl871x_usb_id_tbl[] = {
+ 	/* - */
+ 	{USB_DEVICE(0x20F4, 0x646B)},
+ 	{USB_DEVICE(0x083A, 0xC512)},
++	{USB_DEVICE(0x25D4, 0x4CA1)},
++	{USB_DEVICE(0x25D4, 0x4CAB)},
+ 
+ /* RTL8191SU */
+ 	/* Realtek */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0006-hwmon-applesmc-Limit-key-length-in-warning-messages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0006-hwmon-applesmc-Limit-key-length-in-warning-messages.patch
new file mode 100644
index 0000000..dc75f16
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0006-hwmon-applesmc-Limit-key-length-in-warning-messages.patch
@@ -0,0 +1,43 @@
+From d94e9fcf553861cd10a1780c6aeaa6a4419ba5ce Mon Sep 17 00:00:00 2001
+From: Henrik Rydberg <rydberg@euromail.se>
+Date: Thu, 7 Jun 2012 04:54:29 -0400
+Subject: [PATCH 06/46] hwmon: (applesmc) Limit key length in warning messages
+
+commit ac852edb47b15900886ba2564eeeb13b3b526e3e upstream.
+
+Key lookups may call read_smc() with a fixed-length key string,
+and if the lookup fails, trailing stack content may appear in the
+kernel log. Fixed with this patch.
+
+Signed-off-by: Henrik Rydberg <rydberg@euromail.se>
+Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/hwmon/applesmc.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
+index 4c07436..d99aa84 100644
+--- a/drivers/hwmon/applesmc.c
++++ b/drivers/hwmon/applesmc.c
+@@ -215,7 +215,7 @@ static int read_smc(u8 cmd, const char *key, u8 *buffer, u8 len)
+ 	int i;
+ 
+ 	if (send_command(cmd) || send_argument(key)) {
+-		pr_warn("%s: read arg fail\n", key);
++		pr_warn("%.4s: read arg fail\n", key);
+ 		return -EIO;
+ 	}
+ 
+@@ -223,7 +223,7 @@ static int read_smc(u8 cmd, const char *key, u8 *buffer, u8 len)
+ 
+ 	for (i = 0; i < len; i++) {
+ 		if (__wait_status(0x05)) {
+-			pr_warn("%s: read data fail\n", key);
++			pr_warn("%.4s: read data fail\n", key);
+ 			return -EIO;
+ 		}
+ 		buffer[i] = inb(APPLESMC_DATA_PORT);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0007-mm-pmd_read_atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0007-mm-pmd_read_atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch
new file mode 100644
index 0000000..9cac18d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0007-mm-pmd_read_atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch
@@ -0,0 +1,218 @@
+From 8bf1709b6925d4e05120bdfed73992d50e7f11bf Mon Sep 17 00:00:00 2001
+From: Andrea Arcangeli <aarcange@redhat.com>
+Date: Tue, 29 May 2012 15:06:49 -0700
+Subject: [PATCH 07/46] mm: pmd_read_atomic: fix 32bit PAE pmd walk vs
+ pmd_populate SMP race condition
+
+commit 26c191788f18129af0eb32a358cdaea0c7479626 upstream.
+
+When holding the mmap_sem for reading, pmd_offset_map_lock should only
+run on a pmd_t that has been read atomically from the pmdp pointer,
+otherwise we may read only half of it leading to this crash.
+
+PID: 11679  TASK: f06e8000  CPU: 3   COMMAND: "do_race_2_panic"
+ #0 [f06a9dd8] crash_kexec at c049b5ec
+ #1 [f06a9e2c] oops_end at c083d1c2
+ #2 [f06a9e40] no_context at c0433ded
+ #3 [f06a9e64] bad_area_nosemaphore at c043401a
+ #4 [f06a9e6c] __do_page_fault at c0434493
+ #5 [f06a9eec] do_page_fault at c083eb45
+ #6 [f06a9f04] error_code (via page_fault) at c083c5d5
+    EAX: 01fb470c EBX: fff35000 ECX: 00000003 EDX: 00000100 EBP:
+    00000000
+    DS:  007b     ESI: 9e201000 ES:  007b     EDI: 01fb4700 GS:  00e0
+    CS:  0060     EIP: c083bc14 ERR: ffffffff EFLAGS: 00010246
+ #7 [f06a9f38] _spin_lock at c083bc14
+ #8 [f06a9f44] sys_mincore at c0507b7d
+ #9 [f06a9fb0] system_call at c083becd
+                         start           len
+    EAX: ffffffda  EBX: 9e200000  ECX: 00001000  EDX: 6228537f
+    DS:  007b      ESI: 00000000  ES:  007b      EDI: 003d0f00
+    SS:  007b      ESP: 62285354  EBP: 62285388  GS:  0033
+    CS:  0073      EIP: 00291416  ERR: 000000da  EFLAGS: 00000286
+
+This should be a longstanding bug affecting x86 32bit PAE without THP.
+Only archs with 64bit large pmd_t and 32bit unsigned long should be
+affected.
+
+With THP enabled the barrier() in pmd_none_or_trans_huge_or_clear_bad()
+would partly hide the bug when the pmd transition from none to stable,
+by forcing a re-read of the *pmd in pmd_offset_map_lock, but when THP is
+enabled a new set of problem arises by the fact could then transition
+freely in any of the none, pmd_trans_huge or pmd_trans_stable states.
+So making the barrier in pmd_none_or_trans_huge_or_clear_bad()
+unconditional isn't good idea and it would be a flakey solution.
+
+This should be fully fixed by introducing a pmd_read_atomic that reads
+the pmd in order with THP disabled, or by reading the pmd atomically
+with cmpxchg8b with THP enabled.
+
+Luckily this new race condition only triggers in the places that must
+already be covered by pmd_none_or_trans_huge_or_clear_bad() so the fix
+is localized there but this bug is not related to THP.
+
+NOTE: this can trigger on x86 32bit systems with PAE enabled with more
+than 4G of ram, otherwise the high part of the pmd will never risk to be
+truncated because it would be zero at all times, in turn so hiding the
+SMP race.
+
+This bug was discovered and fully debugged by Ulrich, quote:
+
+----
+[..]
+pmd_none_or_trans_huge_or_clear_bad() loads the content of edx and
+eax.
+
+    496 static inline int pmd_none_or_trans_huge_or_clear_bad(pmd_t
+    *pmd)
+    497 {
+    498         /* depend on compiler for an atomic pmd read */
+    499         pmd_t pmdval = *pmd;
+
+                                // edi = pmd pointer
+0xc0507a74 <sys_mincore+548>:   mov    0x8(%esp),%edi
+...
+                                // edx = PTE page table high address
+0xc0507a84 <sys_mincore+564>:   mov    0x4(%edi),%edx
+...
+                                // eax = PTE page table low address
+0xc0507a8e <sys_mincore+574>:   mov    (%edi),%eax
+
+[..]
+
+Please note that the PMD is not read atomically. These are two "mov"
+instructions where the high order bits of the PMD entry are fetched
+first. Hence, the above machine code is prone to the following race.
+
+-  The PMD entry {high|low} is 0x0000000000000000.
+   The "mov" at 0xc0507a84 loads 0x00000000 into edx.
+
+-  A page fault (on another CPU) sneaks in between the two "mov"
+   instructions and instantiates the PMD.
+
+-  The PMD entry {high|low} is now 0x00000003fda38067.
+   The "mov" at 0xc0507a8e loads 0xfda38067 into eax.
+----
+
+Reported-by: Ulrich Obergfell <uobergfe@redhat.com>
+Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Mel Gorman <mgorman@suse.de>
+Cc: Hugh Dickins <hughd@google.com>
+Cc: Larry Woodman <lwoodman@redhat.com>
+Cc: Petr Matousek <pmatouse@redhat.com>
+Cc: Rik van Riel <riel@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/include/asm/pgtable-3level.h |   50 +++++++++++++++++++++++++++++++++
+ include/asm-generic/pgtable.h         |   22 +++++++++++++--
+ 2 files changed, 70 insertions(+), 2 deletions(-)
+
+diff --git a/arch/x86/include/asm/pgtable-3level.h b/arch/x86/include/asm/pgtable-3level.h
+index effff47..43876f1 100644
+--- a/arch/x86/include/asm/pgtable-3level.h
++++ b/arch/x86/include/asm/pgtable-3level.h
+@@ -31,6 +31,56 @@ static inline void native_set_pte(pte_t *ptep, pte_t pte)
+ 	ptep->pte_low = pte.pte_low;
+ }
+ 
++#define pmd_read_atomic pmd_read_atomic
++/*
++ * pte_offset_map_lock on 32bit PAE kernels was reading the pmd_t with
++ * a "*pmdp" dereference done by gcc. Problem is, in certain places
++ * where pte_offset_map_lock is called, concurrent page faults are
++ * allowed, if the mmap_sem is hold for reading. An example is mincore
++ * vs page faults vs MADV_DONTNEED. On the page fault side
++ * pmd_populate rightfully does a set_64bit, but if we're reading the
++ * pmd_t with a "*pmdp" on the mincore side, a SMP race can happen
++ * because gcc will not read the 64bit of the pmd atomically. To fix
++ * this all places running pmd_offset_map_lock() while holding the
++ * mmap_sem in read mode, shall read the pmdp pointer using this
++ * function to know if the pmd is null nor not, and in turn to know if
++ * they can run pmd_offset_map_lock or pmd_trans_huge or other pmd
++ * operations.
++ *
++ * Without THP if the mmap_sem is hold for reading, the
++ * pmd can only transition from null to not null while pmd_read_atomic runs.
++ * So there's no need of literally reading it atomically.
++ *
++ * With THP if the mmap_sem is hold for reading, the pmd can become
++ * THP or null or point to a pte (and in turn become "stable") at any
++ * time under pmd_read_atomic, so it's mandatory to read it atomically
++ * with cmpxchg8b.
++ */
++#ifndef CONFIG_TRANSPARENT_HUGEPAGE
++static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
++{
++	pmdval_t ret;
++	u32 *tmp = (u32 *)pmdp;
++
++	ret = (pmdval_t) (*tmp);
++	if (ret) {
++		/*
++		 * If the low part is null, we must not read the high part
++		 * or we can end up with a partial pmd.
++		 */
++		smp_rmb();
++		ret |= ((pmdval_t)*(tmp + 1)) << 32;
++	}
++
++	return (pmd_t) { ret };
++}
++#else /* CONFIG_TRANSPARENT_HUGEPAGE */
++static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
++{
++	return (pmd_t) { atomic64_read((atomic64_t *)pmdp) };
++}
++#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
++
+ static inline void native_set_pte_atomic(pte_t *ptep, pte_t pte)
+ {
+ 	set_64bit((unsigned long long *)(ptep), native_pte_val(pte));
+diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
+index a03c098..831924a 100644
+--- a/include/asm-generic/pgtable.h
++++ b/include/asm-generic/pgtable.h
+@@ -445,6 +445,18 @@ static inline int pmd_write(pmd_t pmd)
+ #endif /* __HAVE_ARCH_PMD_WRITE */
+ #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+ 
++#ifndef pmd_read_atomic
++static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
++{
++	/*
++	 * Depend on compiler for an atomic pmd read. NOTE: this is
++	 * only going to work, if the pmdval_t isn't larger than
++	 * an unsigned long.
++	 */
++	return *pmdp;
++}
++#endif
++
+ /*
+  * This function is meant to be used by sites walking pagetables with
+  * the mmap_sem hold in read mode to protect against MADV_DONTNEED and
+@@ -458,11 +470,17 @@ static inline int pmd_write(pmd_t pmd)
+  * undefined so behaving like if the pmd was none is safe (because it
+  * can return none anyway). The compiler level barrier() is critically
+  * important to compute the two checks atomically on the same pmdval.
++ *
++ * For 32bit kernels with a 64bit large pmd_t this automatically takes
++ * care of reading the pmd atomically to avoid SMP race conditions
++ * against pmd_populate() when the mmap_sem is hold for reading by the
++ * caller (a special atomic read not done by "gcc" as in the generic
++ * version above, is also needed when THP is disabled because the page
++ * fault can populate the pmd from under us).
+  */
+ static inline int pmd_none_or_trans_huge_or_clear_bad(pmd_t *pmd)
+ {
+-	/* depend on compiler for an atomic pmd read */
+-	pmd_t pmdval = *pmd;
++	pmd_t pmdval = pmd_read_atomic(pmd);
+ 	/*
+ 	 * The barrier will stabilize the pmdval in a register or on
+ 	 * the stack so that it will stop changing under the code.
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0008-thp-avoid-atomic64_read-in-pmd_read_atomic-for-32bit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0008-thp-avoid-atomic64_read-in-pmd_read_atomic-for-32bit.patch
new file mode 100644
index 0000000..79be9e0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0008-thp-avoid-atomic64_read-in-pmd_read_atomic-for-32bit.patch
@@ -0,0 +1,125 @@
+From dcfb4634621189a74522dee4d0dab8b5c1786b02 Mon Sep 17 00:00:00 2001
+From: Andrea Arcangeli <aarcange@redhat.com>
+Date: Wed, 20 Jun 2012 12:52:57 -0700
+Subject: [PATCH 08/46] thp: avoid atomic64_read in pmd_read_atomic for 32bit
+ PAE
+
+commit e4eed03fd06578571c01d4f1478c874bb432c815 upstream.
+
+In the x86 32bit PAE CONFIG_TRANSPARENT_HUGEPAGE=y case while holding the
+mmap_sem for reading, cmpxchg8b cannot be used to read pmd contents under
+Xen.
+
+So instead of dealing only with "consistent" pmdvals in
+pmd_none_or_trans_huge_or_clear_bad() (which would be conceptually
+simpler) we let pmd_none_or_trans_huge_or_clear_bad() deal with pmdvals
+where the low 32bit and high 32bit could be inconsistent (to avoid having
+to use cmpxchg8b).
+
+The only guarantee we get from pmd_read_atomic is that if the low part of
+the pmd was found null, the high part will be null too (so the pmd will be
+considered unstable).  And if the low part of the pmd is found "stable"
+later, then it means the whole pmd was read atomically (because after a
+pmd is stable, neither MADV_DONTNEED nor page faults can alter it anymore,
+and we read the high part after the low part).
+
+In the 32bit PAE x86 case, it is enough to read the low part of the pmdval
+atomically to declare the pmd as "stable" and that's true for THP and no
+THP, furthermore in the THP case we also have a barrier() that will
+prevent any inconsistent pmdvals to be cached by a later re-read of the
+*pmd.
+
+Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Jonathan Nieder <jrnieder@gmail.com>
+Cc: Ulrich Obergfell <uobergfe@redhat.com>
+Cc: Mel Gorman <mgorman@suse.de>
+Cc: Hugh Dickins <hughd@google.com>
+Cc: Larry Woodman <lwoodman@redhat.com>
+Cc: Petr Matousek <pmatouse@redhat.com>
+Cc: Rik van Riel <riel@redhat.com>
+Cc: Jan Beulich <jbeulich@suse.com>
+Cc: KOSAKI Motohiro <kosaki.motohiro@gmail.com>
+Tested-by: Andrew Jones <drjones@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/include/asm/pgtable-3level.h |   30 +++++++++++++++++-------------
+ include/asm-generic/pgtable.h         |   10 ++++++++++
+ 2 files changed, 27 insertions(+), 13 deletions(-)
+
+diff --git a/arch/x86/include/asm/pgtable-3level.h b/arch/x86/include/asm/pgtable-3level.h
+index 43876f1..cb00ccc 100644
+--- a/arch/x86/include/asm/pgtable-3level.h
++++ b/arch/x86/include/asm/pgtable-3level.h
+@@ -47,16 +47,26 @@ static inline void native_set_pte(pte_t *ptep, pte_t pte)
+  * they can run pmd_offset_map_lock or pmd_trans_huge or other pmd
+  * operations.
+  *
+- * Without THP if the mmap_sem is hold for reading, the
+- * pmd can only transition from null to not null while pmd_read_atomic runs.
+- * So there's no need of literally reading it atomically.
++ * Without THP if the mmap_sem is hold for reading, the pmd can only
++ * transition from null to not null while pmd_read_atomic runs. So
++ * we can always return atomic pmd values with this function.
+  *
+  * With THP if the mmap_sem is hold for reading, the pmd can become
+- * THP or null or point to a pte (and in turn become "stable") at any
+- * time under pmd_read_atomic, so it's mandatory to read it atomically
+- * with cmpxchg8b.
++ * trans_huge or none or point to a pte (and in turn become "stable")
++ * at any time under pmd_read_atomic. We could read it really
++ * atomically here with a atomic64_read for the THP enabled case (and
++ * it would be a whole lot simpler), but to avoid using cmpxchg8b we
++ * only return an atomic pmdval if the low part of the pmdval is later
++ * found stable (i.e. pointing to a pte). And we're returning a none
++ * pmdval if the low part of the pmd is none. In some cases the high
++ * and low part of the pmdval returned may not be consistent if THP is
++ * enabled (the low part may point to previously mapped hugepage,
++ * while the high part may point to a more recently mapped hugepage),
++ * but pmd_none_or_trans_huge_or_clear_bad() only needs the low part
++ * of the pmd to be read atomically to decide if the pmd is unstable
++ * or not, with the only exception of when the low part of the pmd is
++ * zero in which case we return a none pmd.
+  */
+-#ifndef CONFIG_TRANSPARENT_HUGEPAGE
+ static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
+ {
+ 	pmdval_t ret;
+@@ -74,12 +84,6 @@ static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
+ 
+ 	return (pmd_t) { ret };
+ }
+-#else /* CONFIG_TRANSPARENT_HUGEPAGE */
+-static inline pmd_t pmd_read_atomic(pmd_t *pmdp)
+-{
+-	return (pmd_t) { atomic64_read((atomic64_t *)pmdp) };
+-}
+-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
+ 
+ static inline void native_set_pte_atomic(pte_t *ptep, pte_t pte)
+ {
+diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
+index 831924a..bc00876 100644
+--- a/include/asm-generic/pgtable.h
++++ b/include/asm-generic/pgtable.h
+@@ -484,6 +484,16 @@ static inline int pmd_none_or_trans_huge_or_clear_bad(pmd_t *pmd)
+ 	/*
+ 	 * The barrier will stabilize the pmdval in a register or on
+ 	 * the stack so that it will stop changing under the code.
++	 *
++	 * When CONFIG_TRANSPARENT_HUGEPAGE=y on x86 32bit PAE,
++	 * pmd_read_atomic is allowed to return a not atomic pmdval
++	 * (for example pointing to an hugepage that has never been
++	 * mapped in the pmd). The below checks will only care about
++	 * the low part of the pmd with 32bit PAE x86 anyway, with the
++	 * exception of pmd_none(). So the important thing is that if
++	 * the low part of the pmd is found null, the high part will
++	 * be also null or the pmd_none() check below would be
++	 * confused.
+ 	 */
+ #ifdef CONFIG_TRANSPARENT_HUGEPAGE
+ 	barrier();
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0009-nilfs2-ensure-proper-cache-clearing-for-gc-inodes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0009-nilfs2-ensure-proper-cache-clearing-for-gc-inodes.patch
new file mode 100644
index 0000000..4cfe490
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0009-nilfs2-ensure-proper-cache-clearing-for-gc-inodes.patch
@@ -0,0 +1,71 @@
+From c1a7e61b722c55f0bbbe234d8f16ab19882a0c6b Mon Sep 17 00:00:00 2001
+From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Date: Wed, 20 Jun 2012 12:52:57 -0700
+Subject: [PATCH 09/46] nilfs2: ensure proper cache clearing for gc-inodes
+
+commit fbb24a3a915f105016f1c828476be11aceac8504 upstream.
+
+A gc-inode is a pseudo inode used to buffer the blocks to be moved by
+garbage collection.
+
+Block caches of gc-inodes must be cleared every time a garbage collection
+function (nilfs_clean_segments) completes.  Otherwise, stale blocks
+buffered in the caches may be wrongly reused in successive calls of the GC
+function.
+
+For user files, this is not a problem because their gc-inodes are
+distinguished by a checkpoint number as well as an inode number.  They
+never buffer different blocks if either an inode number, a checkpoint
+number, or a block offset differs.
+
+However, gc-inodes of sufile, cpfile and DAT file can store different data
+for the same block offset.  Thus, the nilfs_clean_segments function can
+move incorrect block for these meta-data files if an old block is cached.
+I found this is really causing meta-data corruption in nilfs.
+
+This fixes the issue by ensuring cache clear of gc-inodes and resolves
+reported GC problems including checkpoint file corruption, b-tree
+corruption, and the following warning during GC.
+
+  nilfs_palloc_freev: entry number 307234 already freed.
+  ...
+
+Signed-off-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Tested-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nilfs2/gcinode.c |    2 ++
+ fs/nilfs2/segment.c |    2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
+index 08a07a2..57ceaf3 100644
+--- a/fs/nilfs2/gcinode.c
++++ b/fs/nilfs2/gcinode.c
+@@ -191,6 +191,8 @@ void nilfs_remove_all_gcinodes(struct the_nilfs *nilfs)
+ 	while (!list_empty(head)) {
+ 		ii = list_first_entry(head, struct nilfs_inode_info, i_dirty);
+ 		list_del_init(&ii->i_dirty);
++		truncate_inode_pages(&ii->vfs_inode.i_data, 0);
++		nilfs_btnode_cache_clear(&ii->i_btnode_cache);
+ 		iput(&ii->vfs_inode);
+ 	}
+ }
+diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
+index bb24ab6..6f24e67 100644
+--- a/fs/nilfs2/segment.c
++++ b/fs/nilfs2/segment.c
+@@ -2309,6 +2309,8 @@ nilfs_remove_written_gcinodes(struct the_nilfs *nilfs, struct list_head *head)
+ 		if (!test_bit(NILFS_I_UPDATED, &ii->i_state))
+ 			continue;
+ 		list_del_init(&ii->i_dirty);
++		truncate_inode_pages(&ii->vfs_inode.i_data, 0);
++		nilfs_btnode_cache_clear(&ii->i_btnode_cache);
+ 		iput(&ii->vfs_inode);
+ 	}
+ }
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0010-drm-i915-Finish-any-pending-operations-on-the-frameb.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0010-drm-i915-Finish-any-pending-operations-on-the-frameb.patch
new file mode 100644
index 0000000..9d0f37e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0010-drm-i915-Finish-any-pending-operations-on-the-frameb.patch
@@ -0,0 +1,130 @@
+From 4c0724b407a2c71dbb932d74363e386f798dca61 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Tue, 3 Apr 2012 17:58:35 +0100
+Subject: [PATCH 10/46] drm/i915: Finish any pending operations on the
+ framebuffer before disabling
+
+Similar to the case where we are changing from one framebuffer to
+another, we need to be sure that there are no pending WAIT_FOR_EVENTs on
+the pipe for the current framebuffer before switching. If we disable the
+pipe, and then try to execute a WAIT_FOR_EVENT it will block
+indefinitely and cause a GPU hang.
+
+We attempted to fix this in commit 85345517fe6d4de27b0d6ca19fef9d28ac947c4a
+(drm/i915: Retire any pending operations on the old scanout when switching)
+for the case of mode switching, but this leaves the condition where we
+are switching off the pipe vulnerable.
+
+There still remains the race condition were a display may be unplugged,
+switched off by the core, a uevent sent to notify the DDX and the DDX
+may issue a WAIT_FOR_EVENT before it processes the uevent. This window
+does not exist if the pipe is only switched off in response to the
+uevent. Time to make sure that is so...
+
+Reported-by: Francis Leblanc <Francis.Leblanc-Lebeau@verint.com>
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=36515
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=45413
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Reviewed-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+[danvet: fixup spelling in comment, noticed by Eugeni.]
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+(cherry picked from commit 14667a4bde4361b7ac420d68a2e9e9b9b2df5231)
+Signed-off-by: Timo Aaltonen <timo.aaltonen@canonical.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_display.c |   65 ++++++++++++++++++++++++----------
+ 1 file changed, 46 insertions(+), 19 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
+index 5c1cdb8..6aa7716 100644
+--- a/drivers/gpu/drm/i915/intel_display.c
++++ b/drivers/gpu/drm/i915/intel_display.c
+@@ -2187,6 +2187,33 @@ intel_pipe_set_base_atomic(struct drm_crtc *crtc, struct drm_framebuffer *fb,
+ }
+ 
+ static int
++intel_finish_fb(struct drm_framebuffer *old_fb)
++{
++	struct drm_i915_gem_object *obj = to_intel_framebuffer(old_fb)->obj;
++	struct drm_i915_private *dev_priv = obj->base.dev->dev_private;
++	bool was_interruptible = dev_priv->mm.interruptible;
++	int ret;
++
++	wait_event(dev_priv->pending_flip_queue,
++		   atomic_read(&dev_priv->mm.wedged) ||
++		   atomic_read(&obj->pending_flip) == 0);
++
++	/* Big Hammer, we also need to ensure that any pending
++	 * MI_WAIT_FOR_EVENT inside a user batch buffer on the
++	 * current scanout is retired before unpinning the old
++	 * framebuffer.
++	 *
++	 * This should only fail upon a hung GPU, in which case we
++	 * can safely continue.
++	 */
++	dev_priv->mm.interruptible = false;
++	ret = i915_gem_object_finish_gpu(obj);
++	dev_priv->mm.interruptible = was_interruptible;
++
++	return ret;
++}
++
++static int
+ intel_pipe_set_base(struct drm_crtc *crtc, int x, int y,
+ 		    struct drm_framebuffer *old_fb)
+ {
+@@ -2224,25 +2251,8 @@ intel_pipe_set_base(struct drm_crtc *crtc, int x, int y,
+ 		return ret;
+ 	}
+ 
+-	if (old_fb) {
+-		struct drm_i915_private *dev_priv = dev->dev_private;
+-		struct drm_i915_gem_object *obj = to_intel_framebuffer(old_fb)->obj;
+-
+-		wait_event(dev_priv->pending_flip_queue,
+-			   atomic_read(&dev_priv->mm.wedged) ||
+-			   atomic_read(&obj->pending_flip) == 0);
+-
+-		/* Big Hammer, we also need to ensure that any pending
+-		 * MI_WAIT_FOR_EVENT inside a user batch buffer on the
+-		 * current scanout is retired before unpinning the old
+-		 * framebuffer.
+-		 *
+-		 * This should only fail upon a hung GPU, in which case we
+-		 * can safely continue.
+-		 */
+-		ret = i915_gem_object_finish_gpu(obj);
+-		(void) ret;
+-	}
++	if (old_fb)
++		intel_finish_fb(old_fb);
+ 
+ 	ret = intel_pipe_set_base_atomic(crtc, crtc->fb, x, y,
+ 					 LEAVE_ATOMIC_MODE_SET);
+@@ -3312,6 +3322,23 @@ static void intel_crtc_disable(struct drm_crtc *crtc)
+ 	struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
+ 	struct drm_device *dev = crtc->dev;
+ 
++	/* Flush any pending WAITs before we disable the pipe. Note that
++	 * we need to drop the struct_mutex in order to acquire it again
++	 * during the lowlevel dpms routines around a couple of the
++	 * operations. It does not look trivial nor desirable to move
++	 * that locking higher. So instead we leave a window for the
++	 * submission of further commands on the fb before we can actually
++	 * disable it. This race with userspace exists anyway, and we can
++	 * only rely on the pipe being disabled by userspace after it
++	 * receives the hotplug notification and has flushed any pending
++	 * batches.
++	 */
++	if (crtc->fb) {
++		mutex_lock(&dev->struct_mutex);
++		intel_finish_fb(crtc->fb);
++		mutex_unlock(&dev->struct_mutex);
++	}
++
+ 	crtc_funcs->dpms(crtc, DRM_MODE_DPMS_OFF);
+ 
+ 	if (crtc->fb) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0011-drm-i915-Remove-use-of-the-autoreported-ringbuffer-H.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0011-drm-i915-Remove-use-of-the-autoreported-ringbuffer-H.patch
new file mode 100644
index 0000000..ad69a94
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0011-drm-i915-Remove-use-of-the-autoreported-ringbuffer-H.patch
@@ -0,0 +1,84 @@
+From 7e3ac17c5a78a999c5932d6617f63a6ca7cf91b0 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Wed, 8 Feb 2012 13:34:13 +0000
+Subject: [PATCH 11/46] drm/i915: Remove use of the autoreported ringbuffer
+ HEAD position
+
+This is a revert of 6aa56062eaba67adfb247cded244fd877329588d.
+
+This was originally introduced to workaround reads of the ringbuffer
+registers returning 0 on SandyBridge causing hangs due to ringbuffer
+overflow. The root cause here was reads through the GT powerwell require
+the forcewake dance, something we only learnt of later. Now it appears
+that reading the reported head position from the HWS is returning
+garbage, leading once again to hangs.
+
+For example, on q35 the autoreported head reports:
+  [  217.975608] head now 00010000, actual 00010000
+  [  436.725613] head now 00200000, actual 00200000
+  [  462.956033] head now 00210000, actual 00210010
+  [  485.501409] head now 00400000, actual 00400020
+  [  508.064280] head now 00410000, actual 00410000
+  [  530.576078] head now 00600000, actual 00600020
+  [  553.273489] head now 00610000, actual 00610018
+which appears reasonably sane. In contrast, if we look at snb:
+  [  141.970680] head now 00e10000, actual 00008238
+  [  141.974062] head now 02734000, actual 000083c8
+  [  141.974425] head now 00e10000, actual 00008488
+  [  141.980374] head now 032b5000, actual 000088b8
+  [  141.980885] head now 03271000, actual 00008950
+  [  142.040628] head now 02101000, actual 00008b40
+  [  142.180173] head now 02734000, actual 00009050
+  [  142.181090] head now 00000000, actual 00000ae0
+  [  142.183737] head now 02734000, actual 00009050
+
+In addition, the automatic reporting of the head position is scheduled
+to be defeatured in the future. It has no more utility, remove it.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=45492
+Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Tested-by: Eric Anholt <eric@anholt.net>
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+(cherry picked from commit 5d031e5b633d910f35e6e0abce94d9d842390006)
+Signed-off-by: Timo Aaltonen <timo.aaltonen@canonical.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_ringbuffer.c |   14 +-------------
+ 1 file changed, 1 insertion(+), 13 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_ringbuffer.c b/drivers/gpu/drm/i915/intel_ringbuffer.c
+index 933e66b..f6613dc 100644
+--- a/drivers/gpu/drm/i915/intel_ringbuffer.c
++++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
+@@ -306,7 +306,7 @@ static int init_ring_common(struct intel_ring_buffer *ring)
+ 
+ 	I915_WRITE_CTL(ring,
+ 			((ring->size - PAGE_SIZE) & RING_NR_PAGES)
+-			| RING_REPORT_64K | RING_VALID);
++			| RING_VALID);
+ 
+ 	/* If the head is still not zero, the ring is dead */
+ 	if ((I915_READ_CTL(ring) & RING_VALID) == 0 ||
+@@ -1157,18 +1157,6 @@ int intel_wait_ring_buffer(struct intel_ring_buffer *ring, int n)
+ 	struct drm_device *dev = ring->dev;
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
+ 	unsigned long end;
+-	u32 head;
+-
+-	/* If the reported head position has wrapped or hasn't advanced,
+-	 * fallback to the slow and accurate path.
+-	 */
+-	head = intel_read_status_page(ring, 4);
+-	if (head > ring->head) {
+-		ring->head = head;
+-		ring->space = ring_space(ring);
+-		if (ring->space >= n)
+-			return 0;
+-	}
+ 
+ 	trace_i915_ring_wait_begin(ring);
+ 	end = jiffies + 3 * HZ;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0012-e1000e-Disable-ASPM-L1-on-82574.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0012-e1000e-Disable-ASPM-L1-on-82574.patch
new file mode 100644
index 0000000..b47746d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0012-e1000e-Disable-ASPM-L1-on-82574.patch
@@ -0,0 +1,41 @@
+From 7bc45fa1ef48339e44c48d53e0cdb9d0d4e33d43 Mon Sep 17 00:00:00 2001
+From: Chris Boot <bootc@bootc.net>
+Date: Tue, 24 Apr 2012 07:24:52 +0000
+Subject: [PATCH 12/46] e1000e: Disable ASPM L1 on 82574
+
+commit id d4a4206ebbaf48b55803a7eb34e330530d83a889
+
+ASPM on the 82574 causes trouble. Currently the driver disables L0s for
+this NIC but only disables L1 if the MTU is >1500. This patch simply
+causes L1 to be disabled regardless of the MTU setting.
+
+Signed-off-by: Chris Boot <bootc@bootc.net>
+Cc: "Wyborny, Carolyn" <carolyn.wyborny@intel.com>
+Cc: Nix <nix@esperi.org.uk>
+Link: https://lkml.org/lkml/2012/3/19/362
+Tested-by: Jeff Pieper <jeffrey.e.pieper@intel.com>
+[Jeff Kirsher: Backport to 3.2-3.4 kernels]
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/intel/e1000e/82571.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/ethernet/intel/e1000e/82571.c b/drivers/net/ethernet/intel/e1000e/82571.c
+index a3e65fd..e556fc3 100644
+--- a/drivers/net/ethernet/intel/e1000e/82571.c
++++ b/drivers/net/ethernet/intel/e1000e/82571.c
+@@ -2080,8 +2080,9 @@ const struct e1000_info e1000_82574_info = {
+ 				  | FLAG_HAS_SMART_POWER_DOWN
+ 				  | FLAG_HAS_AMT
+ 				  | FLAG_HAS_CTRLEXT_ON_LOAD,
+-	.flags2			  = FLAG2_CHECK_PHY_HANG
++	.flags2			= FLAG2_CHECK_PHY_HANG
+ 				  | FLAG2_DISABLE_ASPM_L0S
++				  | FLAG2_DISABLE_ASPM_L1
+ 				  | FLAG2_NO_DISABLE_RX,
+ 	.pba			= 32,
+ 	.max_hw_frame_size	= DEFAULT_JUMBO,
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0013-e1000e-Remove-special-case-for-82573-82574-ASPM-L1-d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0013-e1000e-Remove-special-case-for-82573-82574-ASPM-L1-d.patch
new file mode 100644
index 0000000..3eeacc0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0013-e1000e-Remove-special-case-for-82573-82574-ASPM-L1-d.patch
@@ -0,0 +1,43 @@
+From 51d8e7091033042d3ae09363abe5e93d0698930e Mon Sep 17 00:00:00 2001
+From: Chris Boot <bootc@bootc.net>
+Date: Tue, 24 Apr 2012 07:24:58 +0000
+Subject: [PATCH 13/46] e1000e: Remove special case for 82573/82574 ASPM L1
+ disablement
+
+commit 59aed95263bdd0e2b48eb9be5a94346d2d4abf90 upstream.
+
+For the 82573, ASPM L1 gets disabled wholesale so this special-case code
+is not required. For the 82574 the previous patch does the same as for
+the 82573, disabling L1 on the adapter. Thus, this code is no longer
+required and can be removed.
+
+Signed-off-by: Chris Boot <bootc@bootc.net>
+Tested-by: Jeff Pieper <jeffrey.e.pieper@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/intel/e1000e/netdev.c |    8 --------
+ 1 file changed, 8 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
+index 4e933d1..64d3f98 100644
+--- a/drivers/net/ethernet/intel/e1000e/netdev.c
++++ b/drivers/net/ethernet/intel/e1000e/netdev.c
+@@ -5132,14 +5132,6 @@ static int e1000_change_mtu(struct net_device *netdev, int new_mtu)
+ 		return -EINVAL;
+ 	}
+ 
+-	/* 82573 Errata 17 */
+-	if (((adapter->hw.mac.type == e1000_82573) ||
+-	     (adapter->hw.mac.type == e1000_82574)) &&
+-	    (max_frame > ETH_FRAME_LEN + ETH_FCS_LEN)) {
+-		adapter->flags2 |= FLAG2_DISABLE_ASPM_L1;
+-		e1000e_disable_aspm(adapter->pdev, PCIE_LINK_STATE_L1);
+-	}
+-
+ 	while (test_and_set_bit(__E1000_RESETTING, &adapter->state))
+ 		usleep_range(1000, 2000);
+ 	/* e1000e_down -> e1000e_reset dependent on max_frame_size & mtu */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0014-drm-i915-Do-the-fallback-non-IRQ-wait-in-ring-thrott.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0014-drm-i915-Do-the-fallback-non-IRQ-wait-in-ring-thrott.patch
new file mode 100644
index 0000000..3601ef4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0014-drm-i915-Do-the-fallback-non-IRQ-wait-in-ring-thrott.patch
@@ -0,0 +1,39 @@
+From f00febe1475d06993b3f723ece375388dcf3bb9b Mon Sep 17 00:00:00 2001
+From: Eric Anholt <eric@anholt.net>
+Date: Thu, 22 Dec 2011 14:54:59 -0800
+Subject: [PATCH 14/46] drm/i915: Do the fallback non-IRQ wait in ring
+ throttle, too.
+
+commit 7ea29b13e5e3e1e61e612349eb0366efdb6457f3 upstream.
+
+As a workaround for IRQ synchronization issues in the gen7 BLT ring,
+we want to turn the two wait functions into polling loops.
+
+Signed-off-by: Eric Anholt <eric@anholt.net>
+Tested-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Reviewed-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Acked-by: Kenneth Graunke <kenneth@whitecape.org>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/i915_gem.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
+index 3e7c478..3e2edc6 100644
+--- a/drivers/gpu/drm/i915/i915_gem.c
++++ b/drivers/gpu/drm/i915/i915_gem.c
+@@ -3312,6 +3312,10 @@ i915_gem_ring_throttle(struct drm_device *dev, struct drm_file *file)
+ 
+ 			if (ret == 0 && atomic_read(&dev_priv->mm.wedged))
+ 				ret = -EIO;
++		} else if (wait_for(i915_seqno_passed(ring->get_seqno(ring),
++						      seqno) ||
++				    atomic_read(&dev_priv->mm.wedged), 3000)) {
++			ret = -EBUSY;
+ 		}
+ 	}
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0015-staging-rts_pstor-Fix-possible-panic-by-NULL-pointer.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0015-staging-rts_pstor-Fix-possible-panic-by-NULL-pointer.patch
new file mode 100644
index 0000000..bfe82b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0015-staging-rts_pstor-Fix-possible-panic-by-NULL-pointer.patch
@@ -0,0 +1,72 @@
+From 1c17511004913ab88dd06ac7df912125a97ea2c3 Mon Sep 17 00:00:00 2001
+From: wwang <wei_wang@realsil.com.cn>
+Date: Tue, 27 Mar 2012 16:43:11 +0800
+Subject: [PATCH 15/46] staging:rts_pstor:Fix possible panic by NULL pointer
+ dereference
+
+commit 0d05568ac79bfc595f1eadc3e0fd7a20a45f7b69 upstream.
+
+rtsx_transport.c (rtsx_transfer_sglist_adma_partial):
+pointer struct scatterlist *sg, which is mapped in dma_map_sg,
+is used as an iterator in later transfer operation. It is corrupted and
+passed to dma_unmap_sg, thus causing fatal unmap of some erroneous address.
+Fix it by duplicating *sg_ptr for iterating.
+
+Signed-off-by: wwang <wei_wang@realsil.com.cn>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/staging/rts_pstor/rtsx_transport.c |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/staging/rts_pstor/rtsx_transport.c b/drivers/staging/rts_pstor/rtsx_transport.c
+index 4e3d2c1..9b2e5c9 100644
+--- a/drivers/staging/rts_pstor/rtsx_transport.c
++++ b/drivers/staging/rts_pstor/rtsx_transport.c
+@@ -335,6 +335,7 @@ static int rtsx_transfer_sglist_adma_partial(struct rtsx_chip *chip, u8 card,
+ 	int sg_cnt, i, resid;
+ 	int err = 0;
+ 	long timeleft;
++	struct scatterlist *sg_ptr;
+ 	u32 val = TRIG_DMA;
+ 
+ 	if ((sg == NULL) || (num_sg <= 0) || !offset || !index)
+@@ -371,7 +372,7 @@ static int rtsx_transfer_sglist_adma_partial(struct rtsx_chip *chip, u8 card,
+ 	sg_cnt = dma_map_sg(&(rtsx->pci->dev), sg, num_sg, dma_dir);
+ 
+ 	resid = size;
+-
++	sg_ptr = sg;
+ 	chip->sgi = 0;
+ 	/* Usually the next entry will be @sg@ + 1, but if this sg element
+ 	 * is part of a chained scatterlist, it could jump to the start of
+@@ -379,14 +380,14 @@ static int rtsx_transfer_sglist_adma_partial(struct rtsx_chip *chip, u8 card,
+ 	 * the proper sg
+ 	 */
+ 	for (i = 0; i < *index; i++)
+-		sg = sg_next(sg);
++		sg_ptr = sg_next(sg_ptr);
+ 	for (i = *index; i < sg_cnt; i++) {
+ 		dma_addr_t addr;
+ 		unsigned int len;
+ 		u8 option;
+ 
+-		addr = sg_dma_address(sg);
+-		len = sg_dma_len(sg);
++		addr = sg_dma_address(sg_ptr);
++		len = sg_dma_len(sg_ptr);
+ 
+ 		RTSX_DEBUGP("DMA addr: 0x%x, Len: 0x%x\n",
+ 			     (unsigned int)addr, len);
+@@ -415,7 +416,7 @@ static int rtsx_transfer_sglist_adma_partial(struct rtsx_chip *chip, u8 card,
+ 		if (!resid)
+ 			break;
+ 
+-		sg = sg_next(sg);
++		sg_ptr = sg_next(sg_ptr);
+ 	}
+ 
+ 	RTSX_DEBUGP("SG table count = %d\n", chip->sgi);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0016-gspca-core-Fix-buffers-staying-in-queued-state-after.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0016-gspca-core-Fix-buffers-staying-in-queued-state-after.patch
new file mode 100644
index 0000000..152c0d5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0016-gspca-core-Fix-buffers-staying-in-queued-state-after.patch
@@ -0,0 +1,45 @@
+From f9f47b15a0eb3d8ae86f5d034fd8924ab258a4d2 Mon Sep 17 00:00:00 2001
+From: Hans de Goede <hdegoede@redhat.com>
+Date: Tue, 22 May 2012 11:24:05 -0300
+Subject: [PATCH 16/46] gspca-core: Fix buffers staying in queued state after
+ a stream_off
+
+commit af05ef01e9cde84620c6855a8d8ab9c8a1db9009 upstream.
+
+This fixes a regression introduced by commit f7059ea and should be
+backported to all supported stable kernels which have this commit.
+
+Signed-off-by: Hans de Goede <hdegoede@redhat.com>
+Tested-by: Antonio Ospite <ospite@studenti.unina.it>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/media/video/gspca/gspca.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/media/video/gspca/gspca.c b/drivers/media/video/gspca/gspca.c
+index 2ca10df..981501f 100644
+--- a/drivers/media/video/gspca/gspca.c
++++ b/drivers/media/video/gspca/gspca.c
+@@ -1697,7 +1697,7 @@ static int vidioc_streamoff(struct file *file, void *priv,
+ 				enum v4l2_buf_type buf_type)
+ {
+ 	struct gspca_dev *gspca_dev = priv;
+-	int ret;
++	int i, ret;
+ 
+ 	if (buf_type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+ 		return -EINVAL;
+@@ -1728,6 +1728,8 @@ static int vidioc_streamoff(struct file *file, void *priv,
+ 	wake_up_interruptible(&gspca_dev->wq);
+ 
+ 	/* empty the transfer queues */
++	for (i = 0; i < gspca_dev->nframes; i++)
++		gspca_dev->frame[i].v4l2_buf.flags &= ~BUF_ALL_FLAGS;
+ 	atomic_set(&gspca_dev->fr_q, 0);
+ 	atomic_set(&gspca_dev->fr_i, 0);
+ 	gspca_dev->fr_o = 0;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0017-smsusb-add-autodetection-support-for-USB-ID-2040-f5a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0017-smsusb-add-autodetection-support-for-USB-ID-2040-f5a.patch
new file mode 100644
index 0000000..84e2eb9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0017-smsusb-add-autodetection-support-for-USB-ID-2040-f5a.patch
@@ -0,0 +1,30 @@
+From ac5a4cc2f5d46f744484e577f41441acdbb0a68b Mon Sep 17 00:00:00 2001
+From: Michael Krufky <mkrufky@linuxtv.org>
+Date: Fri, 25 May 2012 09:29:12 -0300
+Subject: [PATCH 17/46] smsusb: add autodetection support for USB ID 2040:f5a0
+
+commit 3e1141e2ce5667301a74ca2ef396d9bd5e995f7f upstream.
+
+Signed-off-by: Michael Krufky <mkrufky@linuxtv.org>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/media/dvb/siano/smsusb.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/media/dvb/siano/smsusb.c b/drivers/media/dvb/siano/smsusb.c
+index b7d1e3e..fb68805 100644
+--- a/drivers/media/dvb/siano/smsusb.c
++++ b/drivers/media/dvb/siano/smsusb.c
+@@ -544,6 +544,8 @@ static const struct usb_device_id smsusb_id_table[] __devinitconst = {
+ 		.driver_info = SMS1XXX_BOARD_HAUPPAUGE_WINDHAM },
+ 	{ USB_DEVICE(0x2040, 0xc0a0),
+ 		.driver_info = SMS1XXX_BOARD_HAUPPAUGE_WINDHAM },
++	{ USB_DEVICE(0x2040, 0xf5a0),
++		.driver_info = SMS1XXX_BOARD_HAUPPAUGE_WINDHAM },
+ 	{ } /* Terminating entry */
+ 	};
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0018-drm-edid-don-t-return-stack-garbage-from-supports_rb.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0018-drm-edid-don-t-return-stack-garbage-from-supports_rb.patch
new file mode 100644
index 0000000..87ce7d9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0018-drm-edid-don-t-return-stack-garbage-from-supports_rb.patch
@@ -0,0 +1,36 @@
+From 2d6a30faab149fe943e5648ef8ed9a6de7c112b1 Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Tue, 19 Jun 2012 11:33:06 +0200
+Subject: [PATCH 18/46] drm/edid: don't return stack garbage from supports_rb
+
+commit b196a4980ff7bb54db478e2a408dc8b12be15304 upstream.
+
+We need to initialize this to false, because the is_rb callback only
+ever sets it to true.
+
+Noticed while reading through the code.
+
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/drm_edid.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
+index 3e927ce..a1ee634 100644
+--- a/drivers/gpu/drm/drm_edid.c
++++ b/drivers/gpu/drm/drm_edid.c
+@@ -585,7 +585,7 @@ static bool
+ drm_monitor_supports_rb(struct edid *edid)
+ {
+ 	if (edid->revision >= 4) {
+-		bool ret;
++		bool ret = false;
+ 		drm_for_each_detailed_block((u8 *)edid, is_rb, &ret);
+ 		return ret;
+ 	}
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0019-drm-nouveau-fbcon-using-nv_two_heads-is-not-a-good-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0019-drm-nouveau-fbcon-using-nv_two_heads-is-not-a-good-i.patch
new file mode 100644
index 0000000..85deab4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0019-drm-nouveau-fbcon-using-nv_two_heads-is-not-a-good-i.patch
@@ -0,0 +1,43 @@
+From 94823f5367fcb795a9e2d263b23c600ffa1b465f Mon Sep 17 00:00:00 2001
+From: Ben Skeggs <bskeggs@redhat.com>
+Date: Tue, 26 Jun 2012 12:12:30 +1000
+Subject: [PATCH 19/46] drm/nouveau/fbcon: using nv_two_heads is not a good
+ idea
+
+commit 9bd0c15fcfb42f6245447c53347d65ad9e72080b upstream.
+
+nv_two_heads() was never meant to be used outside of pre-nv50 code.  The
+code checks for >= NV_10 for 2 CRTCs, then downgrades a few specific
+chipsets to 1 CRTC based on (pci_device & 0x0ff0).
+
+The breakage example seen is on GTX 560Ti, with a pciid of 0x1200, which
+gets detected as an NV20 (0x020x) with 1 CRTC by nv_two_heads(), causing
+memory corruption because there's actually 2 CRTCs..
+
+This switches fbcon to use the CRTC count directly from the mode_config
+structure, which will also fix the same issue on Kepler boards which have
+4 CRTCs.
+
+Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/nouveau/nouveau_fbcon.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+index 3a4cc32..cc0801d 100644
+--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
++++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+@@ -499,7 +499,7 @@ int nouveau_fbcon_init(struct drm_device *dev)
+ 	nfbdev->helper.funcs = &nouveau_fbcon_helper_funcs;
+ 
+ 	ret = drm_fb_helper_init(dev, &nfbdev->helper,
+-				 nv_two_heads(dev) ? 2 : 1, 4);
++				 dev->mode_config.num_crtc, 4);
+ 	if (ret) {
+ 		kfree(nfbdev);
+ 		return ret;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0020-dm-thin-reinstate-missing-mempool_free-in-cell_relea.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0020-dm-thin-reinstate-missing-mempool_free-in-cell_relea.patch
new file mode 100644
index 0000000..725aa12
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0020-dm-thin-reinstate-missing-mempool_free-in-cell_relea.patch
@@ -0,0 +1,55 @@
+From 41466ed94cbd995e8553e3f6bd76b698cdb398ab Mon Sep 17 00:00:00 2001
+From: Mike Snitzer <snitzer@redhat.com>
+Date: Sat, 12 May 2012 01:43:12 +0100
+Subject: [PATCH 20/46] dm thin: reinstate missing mempool_free in
+ cell_release_singleton
+
+commit 03aaae7cdc71bc306888440b1f569d463e917b6d upstream.
+
+Fix a significant memory leak inadvertently introduced during
+simplification of cell_release_singleton() in commit
+6f94a4c45a6f744383f9f695dde019998db3df55 ("dm thin: fix stacked bi_next
+usage").
+
+A cell's hlist_del() must be accompanied by a mempool_free().
+Use __cell_release() to do this, like before.
+
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/dm-thin.c |    9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
+index da2f021..532a902 100644
+--- a/drivers/md/dm-thin.c
++++ b/drivers/md/dm-thin.c
+@@ -288,8 +288,10 @@ static void __cell_release(struct cell *cell, struct bio_list *inmates)
+ 
+ 	hlist_del(&cell->list);
+ 
+-	bio_list_add(inmates, cell->holder);
+-	bio_list_merge(inmates, &cell->bios);
++	if (inmates) {
++		bio_list_add(inmates, cell->holder);
++		bio_list_merge(inmates, &cell->bios);
++	}
+ 
+ 	mempool_free(cell, prison->cell_pool);
+ }
+@@ -312,9 +314,10 @@ static void cell_release(struct cell *cell, struct bio_list *bios)
+  */
+ static void __cell_release_singleton(struct cell *cell, struct bio *bio)
+ {
+-	hlist_del(&cell->list);
+ 	BUG_ON(cell->holder != bio);
+ 	BUG_ON(!bio_list_empty(&cell->bios));
++
++	__cell_release(cell, NULL);
+ }
+ 
+ static void cell_release_singleton(struct cell *cell, struct bio *bio)
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0021-ath9k-Fix-a-WARNING-on-suspend-resume-with-IBSS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0021-ath9k-Fix-a-WARNING-on-suspend-resume-with-IBSS.patch
new file mode 100644
index 0000000..a3917dc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0021-ath9k-Fix-a-WARNING-on-suspend-resume-with-IBSS.patch
@@ -0,0 +1,75 @@
+From 5bd15d249215ca79b080b366616c0a5f1c38904c Mon Sep 17 00:00:00 2001
+From: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Date: Wed, 6 Jun 2012 10:33:10 +0530
+Subject: [PATCH 21/46] ath9k: Fix a WARNING on suspend/resume with IBSS
+
+commit 2031b4c2b4904f7448ab9e4bc6b9bf16e32709f5 upstream.
+
+this patch is dependent on the patch "cfg80211: fix interface
+combinations"
+
+In ath9k currently we have ADHOC interface as a single incompatible
+interface. when drv_add_interface is called during resume we got to
+consider number of vifs already present in addition to checking the
+drivers 'opmode' information about ADHOC.  we incorrectly assume
+an ADHOC interface is already present. Then we may miss some driver
+specific data for the ADHOC interface after resume.
+
+The above mentioned checks can be removed from the driver,
+as the patch 'cfg80211: fix interface combinations' ensures that
+if an interface type is not advertised by the driver in any of the
+interface combinations(via ieee80211_iface_combination) then it shall
+be treated as a single incompatible interface. Fixes the following
+warning on suspend/resume with ibss interface.
+
+        ath: phy0: Cannot create ADHOC interface when other
+        interfaces already exist.
+        WARNING: at net/mac80211/driver-ops.h:12
+        ieee80211_reconfig+0x1882/0x1ca0 [mac80211]()
+        Hardware name: 2842RK1
+        wlan2:  Failed check-sdata-in-driver check, flags: 0x0
+
+        Call Trace:
+        [<c01361b2>] warn_slowpath_common+0x72/0xa0
+        [<f8aaa7c2>] ? ieee80211_reconfig+0x1882/0x1ca0
+        [mac80211]
+        [<f8aaa7c2>] ? ieee80211_reconfig+0x1882/0x1ca0
+        [mac80211]
+        [<c0136283>] warn_slowpath_fmt+0x33/0x40
+        [<f8aaa7c2>] ieee80211_reconfig+0x1882/0x1ca0 [mac80211]
+        [<c06c1d1a>] ? mutex_lock_nested+0x23a/0x2f0
+        [<f8a95097>] ieee80211_resume+0x27/0x70 [mac80211]
+        [<fd177edf>] wiphy_resume+0x8f/0xa0 [cfg80211]
+
+Cc: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
+Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath9k/main.c |    9 ---------
+ 1 file changed, 9 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
+index f76a814..5b22ecd 100644
+--- a/drivers/net/wireless/ath/ath9k/main.c
++++ b/drivers/net/wireless/ath/ath9k/main.c
+@@ -1486,15 +1486,6 @@ static int ath9k_add_interface(struct ieee80211_hw *hw,
+ 		}
+ 	}
+ 
+-	if ((ah->opmode == NL80211_IFTYPE_ADHOC) ||
+-	    ((vif->type == NL80211_IFTYPE_ADHOC) &&
+-	     sc->nvifs > 0)) {
+-		ath_err(common, "Cannot create ADHOC interface when other"
+-			" interfaces already exist.\n");
+-		ret = -EINVAL;
+-		goto out;
+-	}
+-
+ 	ath_dbg(common, ATH_DBG_CONFIG,
+ 		"Attach a VIF of type: %d\n", vif->type);
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0022-cfg80211-fix-potential-deadlock-in-regulatory.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0022-cfg80211-fix-potential-deadlock-in-regulatory.patch
new file mode 100644
index 0000000..fe1bc4b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0022-cfg80211-fix-potential-deadlock-in-regulatory.patch
@@ -0,0 +1,144 @@
+From 76f7c2172698cade04f33c7f8841b641c95ddeda Mon Sep 17 00:00:00 2001
+From: Eliad Peller <eliad@wizery.com>
+Date: Tue, 12 Jun 2012 12:53:13 +0300
+Subject: [PATCH 22/46] cfg80211: fix potential deadlock in regulatory
+
+commit fe20b39ec32e975f1054c0b7866c873a954adf05 upstream.
+
+reg_timeout_work() calls restore_regulatory_settings() which
+takes cfg80211_mutex.
+
+reg_set_request_processed() already holds cfg80211_mutex
+before calling cancel_delayed_work_sync(reg_timeout),
+so it might deadlock.
+
+Call the async cancel_delayed_work instead, in order
+to avoid the potential deadlock.
+
+This is the relevant lockdep warning:
+
+cfg80211: Calling CRDA for country: XX
+
+======================================================
+[ INFO: possible circular locking dependency detected ]
+3.4.0-rc5-wl+ #26 Not tainted
+-------------------------------------------------------
+kworker/0:2/1391 is trying to acquire lock:
+ (cfg80211_mutex){+.+.+.}, at: [<bf28ae00>] restore_regulatory_settings+0x34/0x418 [cfg80211]
+
+but task is already holding lock:
+ ((reg_timeout).work){+.+...}, at: [<c0059e94>] process_one_work+0x1f0/0x480
+
+which lock already depends on the new lock.
+
+the existing dependency chain (in reverse order) is:
+
+-> #2 ((reg_timeout).work){+.+...}:
+       [<c008fd44>] validate_chain+0xb94/0x10f0
+       [<c0090b68>] __lock_acquire+0x8c8/0x9b0
+       [<c0090d40>] lock_acquire+0xf0/0x114
+       [<c005b600>] wait_on_work+0x4c/0x154
+       [<c005c000>] __cancel_work_timer+0xd4/0x11c
+       [<c005c064>] cancel_delayed_work_sync+0x1c/0x20
+       [<bf28b274>] reg_set_request_processed+0x50/0x78 [cfg80211]
+       [<bf28bd84>] set_regdom+0x550/0x600 [cfg80211]
+       [<bf294cd8>] nl80211_set_reg+0x218/0x258 [cfg80211]
+       [<c03c7738>] genl_rcv_msg+0x1a8/0x1e8
+       [<c03c6a00>] netlink_rcv_skb+0x5c/0xc0
+       [<c03c7584>] genl_rcv+0x28/0x34
+       [<c03c6720>] netlink_unicast+0x15c/0x228
+       [<c03c6c7c>] netlink_sendmsg+0x218/0x298
+       [<c03933c8>] sock_sendmsg+0xa4/0xc0
+       [<c039406c>] __sys_sendmsg+0x1e4/0x268
+       [<c0394228>] sys_sendmsg+0x4c/0x70
+       [<c0013840>] ret_fast_syscall+0x0/0x3c
+
+-> #1 (reg_mutex){+.+.+.}:
+       [<c008fd44>] validate_chain+0xb94/0x10f0
+       [<c0090b68>] __lock_acquire+0x8c8/0x9b0
+       [<c0090d40>] lock_acquire+0xf0/0x114
+       [<c04734dc>] mutex_lock_nested+0x48/0x320
+       [<bf28b2cc>] reg_todo+0x30/0x538 [cfg80211]
+       [<c0059f44>] process_one_work+0x2a0/0x480
+       [<c005a4b4>] worker_thread+0x1bc/0x2bc
+       [<c0061148>] kthread+0x98/0xa4
+       [<c0014af4>] kernel_thread_exit+0x0/0x8
+
+-> #0 (cfg80211_mutex){+.+.+.}:
+       [<c008ed58>] print_circular_bug+0x68/0x2cc
+       [<c008fb28>] validate_chain+0x978/0x10f0
+       [<c0090b68>] __lock_acquire+0x8c8/0x9b0
+       [<c0090d40>] lock_acquire+0xf0/0x114
+       [<c04734dc>] mutex_lock_nested+0x48/0x320
+       [<bf28ae00>] restore_regulatory_settings+0x34/0x418 [cfg80211]
+       [<bf28b200>] reg_timeout_work+0x1c/0x20 [cfg80211]
+       [<c0059f44>] process_one_work+0x2a0/0x480
+       [<c005a4b4>] worker_thread+0x1bc/0x2bc
+       [<c0061148>] kthread+0x98/0xa4
+       [<c0014af4>] kernel_thread_exit+0x0/0x8
+
+other info that might help us debug this:
+
+Chain exists of:
+  cfg80211_mutex --> reg_mutex --> (reg_timeout).work
+
+ Possible unsafe locking scenario:
+
+       CPU0                    CPU1
+       ----                    ----
+  lock((reg_timeout).work);
+                               lock(reg_mutex);
+                               lock((reg_timeout).work);
+  lock(cfg80211_mutex);
+
+ *** DEADLOCK ***
+
+2 locks held by kworker/0:2/1391:
+ #0:  (events){.+.+.+}, at: [<c0059e94>] process_one_work+0x1f0/0x480
+ #1:  ((reg_timeout).work){+.+...}, at: [<c0059e94>] process_one_work+0x1f0/0x480
+
+stack backtrace:
+[<c001b928>] (unwind_backtrace+0x0/0x12c) from [<c0471d3c>] (dump_stack+0x20/0x24)
+[<c0471d3c>] (dump_stack+0x20/0x24) from [<c008ef70>] (print_circular_bug+0x280/0x2cc)
+[<c008ef70>] (print_circular_bug+0x280/0x2cc) from [<c008fb28>] (validate_chain+0x978/0x10f0)
+[<c008fb28>] (validate_chain+0x978/0x10f0) from [<c0090b68>] (__lock_acquire+0x8c8/0x9b0)
+[<c0090b68>] (__lock_acquire+0x8c8/0x9b0) from [<c0090d40>] (lock_acquire+0xf0/0x114)
+[<c0090d40>] (lock_acquire+0xf0/0x114) from [<c04734dc>] (mutex_lock_nested+0x48/0x320)
+[<c04734dc>] (mutex_lock_nested+0x48/0x320) from [<bf28ae00>] (restore_regulatory_settings+0x34/0x418 [cfg80211])
+[<bf28ae00>] (restore_regulatory_settings+0x34/0x418 [cfg80211]) from [<bf28b200>] (reg_timeout_work+0x1c/0x20 [cfg80211])
+[<bf28b200>] (reg_timeout_work+0x1c/0x20 [cfg80211]) from [<c0059f44>] (process_one_work+0x2a0/0x480)
+[<c0059f44>] (process_one_work+0x2a0/0x480) from [<c005a4b4>] (worker_thread+0x1bc/0x2bc)
+[<c005a4b4>] (worker_thread+0x1bc/0x2bc) from [<c0061148>] (kthread+0x98/0xa4)
+[<c0061148>] (kthread+0x98/0xa4) from [<c0014af4>] (kernel_thread_exit+0x0/0x8)
+cfg80211: Calling CRDA to update world regulatory domain
+cfg80211: World regulatory domain updated:
+cfg80211:   (start_freq - end_freq @ bandwidth), (max_antenna_gain, max_eirp)
+cfg80211:   (2402000 KHz - 2472000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
+cfg80211:   (2457000 KHz - 2482000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
+cfg80211:   (2474000 KHz - 2494000 KHz @ 20000 KHz), (300 mBi, 2000 mBm)
+cfg80211:   (5170000 KHz - 5250000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
+cfg80211:   (5735000 KHz - 5835000 KHz @ 40000 KHz), (300 mBi, 2000 mBm)
+
+Signed-off-by: Eliad Peller <eliad@wizery.com>
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/wireless/reg.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/wireless/reg.c b/net/wireless/reg.c
+index c1c99dd..d57d05b 100644
+--- a/net/wireless/reg.c
++++ b/net/wireless/reg.c
+@@ -1369,7 +1369,7 @@ static void reg_set_request_processed(void)
+ 	spin_unlock(&reg_requests_lock);
+ 
+ 	if (last_request->initiator == NL80211_REGDOM_SET_BY_USER)
+-		cancel_delayed_work_sync(&reg_timeout);
++		cancel_delayed_work(&reg_timeout);
+ 
+ 	if (need_more_processing)
+ 		schedule_work(&reg_work);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0023-ath9k-Fix-softlockup-in-AR9485.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0023-ath9k-Fix-softlockup-in-AR9485.patch
new file mode 100644
index 0000000..7a88ca0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0023-ath9k-Fix-softlockup-in-AR9485.patch
@@ -0,0 +1,68 @@
+From 7195eb3dcc15a2a0ea8c557806abf32241e276d1 Mon Sep 17 00:00:00 2001
+From: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Date: Wed, 13 Jun 2012 21:28:09 +0530
+Subject: [PATCH 23/46] ath9k: Fix softlockup in AR9485
+
+commit bcb7ad7bcbef030e6ba71ede1f9866368aca7c99 upstream.
+
+steps to recreate:
+load latest ath9k driver with AR9485
+stop the network-manager and wpa_supplicant
+bring the interface up
+
+	Call Trace:
+	[<ffffffffa0517490>] ? ath_hw_check+0xe0/0xe0 [ath9k]
+	[<ffffffff812cd1e8>] __const_udelay+0x28/0x30
+	[<ffffffffa03bae7a>] ar9003_get_pll_sqsum_dvc+0x4a/0x80 [ath9k_hw]
+	[<ffffffffa05174eb>] ath_hw_pll_work+0x5b/0xe0 [ath9k]
+	[<ffffffff810744fe>] process_one_work+0x11e/0x470
+	[<ffffffff8107530f>] worker_thread+0x15f/0x360
+	[<ffffffff810751b0>] ? manage_workers+0x230/0x230
+	[<ffffffff81079af3>] kthread+0x93/0xa0
+	[<ffffffff815fd3a4>] kernel_thread_helper+0x4/0x10
+	[<ffffffff81079a60>] ? kthread_freezable_should_stop+0x70/0x70
+	[<ffffffff815fd3a0>] ? gs_change+0x13/0x13
+
+ensure that the PLL-WAR for AR9485/AR9340 is executed only if the STA is
+associated (or) IBSS/AP mode had started beaconing. Ideally this WAR
+is needed to recover from some rare beacon stuck during stress testing.
+Before the STA is associated/IBSS had started beaconing, PLL4(0x1618c)
+always seem to have zero even though we had configured PLL3(0x16188) to
+query about PLL's locking status. When we keep on polling infinitely PLL4's
+8th bit(ie check for PLL locking measurements is done), machine hangs
+due to softlockup.
+
+fixes https://bugzilla.redhat.com/show_bug.cgi?id=811142
+
+Reported-by: Rolf Offermanns <rolf.offermanns@gmx.net>
+Tested-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath9k/main.c |    9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/net/wireless/ath/ath9k/main.c b/drivers/net/wireless/ath/ath9k/main.c
+index 5b22ecd..95437fc 100644
+--- a/drivers/net/wireless/ath/ath9k/main.c
++++ b/drivers/net/wireless/ath/ath9k/main.c
+@@ -1042,6 +1042,15 @@ void ath_hw_pll_work(struct work_struct *work)
+ 					    hw_pll_work.work);
+ 	u32 pll_sqsum;
+ 
++	/*
++	 * ensure that the PLL WAR is executed only
++	 * after the STA is associated (or) if the
++	 * beaconing had started in interfaces that
++	 * uses beacons.
++	 */
++	if (!(sc->sc_flags & SC_OP_BEACONS))
++		return;
++
+ 	if (AR_SREV_9485(sc->sc_ah)) {
+ 
+ 		ath9k_ps_wakeup(sc);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0024-can-c_can-precedence-error-in-c_can_chip_config.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0024-can-c_can-precedence-error-in-c_can_chip_config.patch
new file mode 100644
index 0000000..4fd58e4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0024-can-c_can-precedence-error-in-c_can_chip_config.patch
@@ -0,0 +1,38 @@
+From a06c6152d3db3bab83eefcbff5a1e41c91c8295d Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Fri, 15 Jun 2012 00:20:44 +0000
+Subject: [PATCH 24/46] can: c_can: precedence error in c_can_chip_config()
+
+commit d9cb9bd63eb27ac19f26a8547128c053f43a5da8 upstream.
+
+(CAN_CTRLMODE_LISTENONLY & CAN_CTRLMODE_LOOPBACK) is (0x02 & 0x01) which
+is zero so the condition is never true.  The intent here was to test
+that both flags were set.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/can/c_can/c_can.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/can/c_can/c_can.c b/drivers/net/can/c_can/c_can.c
+index 8dc84d6..86cd532 100644
+--- a/drivers/net/can/c_can/c_can.c
++++ b/drivers/net/can/c_can/c_can.c
+@@ -590,8 +590,8 @@ static void c_can_chip_config(struct net_device *dev)
+ 	priv->write_reg(priv, &priv->regs->control,
+ 			CONTROL_ENABLE_AR);
+ 
+-	if (priv->can.ctrlmode & (CAN_CTRLMODE_LISTENONLY &
+-					CAN_CTRLMODE_LOOPBACK)) {
++	if ((priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY) &&
++	    (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)) {
+ 		/* loopback + silent mode : useful for hot self-test */
+ 		priv->write_reg(priv, &priv->regs->control, CONTROL_EIE |
+ 				CONTROL_SIE | CONTROL_IE | CONTROL_TEST);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0025-ath9k-fix-a-tx-rate-duration-calculation-bug.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0025-ath9k-fix-a-tx-rate-duration-calculation-bug.patch
new file mode 100644
index 0000000..82df3fb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0025-ath9k-fix-a-tx-rate-duration-calculation-bug.patch
@@ -0,0 +1,41 @@
+From aabb8d6daa5fecfc6086a480865312860e6a1080 Mon Sep 17 00:00:00 2001
+From: Felix Fietkau <nbd@openwrt.org>
+Date: Fri, 15 Jun 2012 03:04:52 +0200
+Subject: [PATCH 25/46] ath9k: fix a tx rate duration calculation bug
+
+commit 76591bea9714a58d8924154068c78d702eb2cb17 upstream.
+
+The rate pointer variable for a rate series is used in a loop before it is
+initialized. This went unnoticed because it was used earlier for the RTS/CTS
+rate. This bug can lead to the wrong PHY type being passed to the
+duration calculation function.
+
+Signed-off-by: Felix Fietkau <nbd@openwrt.org>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath9k/xmit.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/xmit.c b/drivers/net/wireless/ath/ath9k/xmit.c
+index 76fd277..c59c592 100644
+--- a/drivers/net/wireless/ath/ath9k/xmit.c
++++ b/drivers/net/wireless/ath/ath9k/xmit.c
+@@ -936,13 +936,13 @@ static void ath_buf_set_rate(struct ath_softc *sc, struct ath_buf *bf,
+ 		}
+ 
+ 		/* legacy rates */
++		rate = &sc->sbands[tx_info->band].bitrates[rates[i].idx];
+ 		if ((tx_info->band == IEEE80211_BAND_2GHZ) &&
+ 		    !(rate->flags & IEEE80211_RATE_ERP_G))
+ 			phy = WLAN_RC_PHY_CCK;
+ 		else
+ 			phy = WLAN_RC_PHY_OFDM;
+ 
+-		rate = &sc->sbands[tx_info->band].bitrates[rates[i].idx];
+ 		info->rates[i].Rate = rate->hw_value;
+ 		if (rate->hw_value_short) {
+ 			if (rates[i].flags & IEEE80211_TX_RC_USE_SHORT_PREAMBLE)
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0026-batman-adv-fix-skb-data-assignment.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0026-batman-adv-fix-skb-data-assignment.patch
new file mode 100644
index 0000000..f64ab78
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0026-batman-adv-fix-skb-data-assignment.patch
@@ -0,0 +1,42 @@
+From 124c9eb2772ae36b2a2d9afa510976cc38a497ef Mon Sep 17 00:00:00 2001
+From: Antonio Quartulli <ordex@autistici.org>
+Date: Fri, 29 Jun 2012 22:58:03 +0200
+Subject: [PATCH 26/46] batman-adv: fix skb->data assignment
+
+commit 2c995ff892313009e336ecc8ec3411022f5b1c39 upstream.
+
+skb_linearize(skb) possibly rearranges the skb internal data and then changes
+the skb->data pointer value. For this reason any other pointer in the code that
+was assigned skb->data before invoking skb_linearise(skb) must be re-assigned.
+
+In the current tt_query message handling code this is not done and therefore, in
+case of skb linearization, the pointer used to handle the packet header ends up
+in pointing to free'd memory.
+
+This bug was introduced by a73105b8d4c765d9ebfb664d0a66802127d8e4c7
+(batman-adv: improved client announcement mechanism)
+
+Signed-off-by: Antonio Quartulli <ordex@autistici.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+[This patch is a backport for kernel versions 3.1 and 3.2 - Antonio]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/batman-adv/routing.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/net/batman-adv/routing.c b/net/batman-adv/routing.c
+index f961cc5..da587ad 100644
+--- a/net/batman-adv/routing.c
++++ b/net/batman-adv/routing.c
+@@ -619,6 +619,8 @@ int recv_tt_query(struct sk_buff *skb, struct hard_iface *recv_if)
+ 		/* packet needs to be linearized to access the TT changes */
+ 		if (skb_linearize(skb) < 0)
+ 			goto out;
++		/* skb_linearize() possibly changed skb->data */
++		tt_query = (struct tt_query_packet *)skb->data;
+ 
+ 		if (is_my_mac(tt_query->dst))
+ 			handle_tt_response(bat_priv, tt_query);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0027-ARM-SAMSUNG-Should-check-for-IS_ERR-clk-instead-of-N.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0027-ARM-SAMSUNG-Should-check-for-IS_ERR-clk-instead-of-N.patch
new file mode 100644
index 0000000..99b9398
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0027-ARM-SAMSUNG-Should-check-for-IS_ERR-clk-instead-of-N.patch
@@ -0,0 +1,33 @@
+From dcf35ea664aae563cd99db11c78285f28b7bdcde Mon Sep 17 00:00:00 2001
+From: Jonghwan Choi <jhbird.choi@samsung.com>
+Date: Wed, 20 Jun 2012 17:05:37 +0900
+Subject: [PATCH 27/46] ARM: SAMSUNG: Should check for IS_ERR(clk) instead of
+ NULL
+
+commit a5d8f4765f0e92ef027492a8cb979c5b8d45f2c3 upstream.
+
+On the error condition clk_get() returns ERR_PTR().
+
+Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
+Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/plat-samsung/include/plat/watchdog-reset.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/plat-samsung/include/plat/watchdog-reset.h b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+index 40dbb2b..11b19ea 100644
+--- a/arch/arm/plat-samsung/include/plat/watchdog-reset.h
++++ b/arch/arm/plat-samsung/include/plat/watchdog-reset.h
+@@ -24,7 +24,7 @@ static inline void arch_wdt_reset(void)
+ 
+ 	__raw_writel(0, S3C2410_WTCON);	  /* disable watchdog, to be safe  */
+ 
+-	if (s3c2410_wdtclk)
++	if (!IS_ERR(s3c2410_wdtclk))
+ 		clk_enable(s3c2410_wdtclk);
+ 
+ 	/* put initial values into count and data */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0028-ath9k_hw-avoid-possible-infinite-loop-in-ar9003_get_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0028-ath9k_hw-avoid-possible-infinite-loop-in-ar9003_get_.patch
new file mode 100644
index 0000000..2b1b0a7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0028-ath9k_hw-avoid-possible-infinite-loop-in-ar9003_get_.patch
@@ -0,0 +1,61 @@
+From 750f92b77aa8db48a56f5d34dd6a61a3184cf119 Mon Sep 17 00:00:00 2001
+From: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Date: Mon, 18 Jun 2012 13:13:30 +0530
+Subject: [PATCH 28/46] ath9k_hw: avoid possible infinite loop in
+ ar9003_get_pll_sqsum_dvc
+
+commit f18e3c6b67f448ec47b3a5b242789bd3d5644879 upstream.
+
+"ath9k: Fix softlockup in AR9485" with commit id
+64bc1239c790e051ff677e023435d770d2ffa174 fixed the reported
+issue, yet its better to avoid the possible infinite loop
+in ar9003_get_pll_sqsum_dvc by having a timeout as suggested
+by ath9k maintainers.
+http://www.spinics.net/lists/linux-wireless/msg92126.html.
+Based on my testing PLL's locking measurement is done in
+~200us (2 iterations).
+
+Cc: Rolf Offermanns <rolf.offermanns@gmx.net>
+Cc: Sujith Manoharan <c_manoha@qca.qualcomm.com>
+Cc: Senthil Balasubramanian <senthilb@qca.qualcomm.com>
+Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath9k/hw.c |   14 +++++++++++++-
+ 1 file changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
+index 8b0c2ca..6973620 100644
+--- a/drivers/net/wireless/ath/ath9k/hw.c
++++ b/drivers/net/wireless/ath/ath9k/hw.c
+@@ -718,13 +718,25 @@ static void ath9k_hw_init_qos(struct ath_hw *ah)
+ 
+ u32 ar9003_get_pll_sqsum_dvc(struct ath_hw *ah)
+ {
++	struct ath_common *common = ath9k_hw_common(ah);
++	int i = 0;
++
+ 	REG_CLR_BIT(ah, PLL3, PLL3_DO_MEAS_MASK);
+ 	udelay(100);
+ 	REG_SET_BIT(ah, PLL3, PLL3_DO_MEAS_MASK);
+ 
+-	while ((REG_READ(ah, PLL4) & PLL4_MEAS_DONE) == 0)
++	while ((REG_READ(ah, PLL4) & PLL4_MEAS_DONE) == 0) {
++
+ 		udelay(100);
+ 
++		if (WARN_ON_ONCE(i >= 100)) {
++			ath_err(common, "PLL4 meaurement not done\n");
++			break;
++		}
++
++		i++;
++	}
++
+ 	return (REG_READ(ah, PLL3) & SQSUM_DVC_MASK) >> 3;
+ }
+ EXPORT_SYMBOL(ar9003_get_pll_sqsum_dvc);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0029-iwlwifi-remove-log_event-debugfs-file-debugging-is-d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0029-iwlwifi-remove-log_event-debugfs-file-debugging-is-d.patch
new file mode 100644
index 0000000..65fb0be
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0029-iwlwifi-remove-log_event-debugfs-file-debugging-is-d.patch
@@ -0,0 +1,67 @@
+From 470e08b2e73b3ce64336de8d55b009e4782735b8 Mon Sep 17 00:00:00 2001
+From: Johannes Berg <johannes.berg@intel.com>
+Date: Wed, 20 Jun 2012 08:46:25 +0200
+Subject: [PATCH 29/46] iwlwifi: remove log_event debugfs file debugging is
+ disabled
+
+commit 882b7b7d11d65e8eccce738f1ce97cdfdb998f9f upstream.
+
+When debugging is disabled, the event log functions aren't
+functional in the way that the debugfs file expects. This
+leads to the debugfs access crashing. Since the event log
+functions aren't functional then, remove the debugfs file
+when CONFIG_IWLWIFI_DEBUG is not set.
+
+Reported-by: Lekensteyn <lekensteyn@gmail.com>
+Reviewed-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: adjust filename, context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/iwlwifi/iwl-trans-pcie.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/net/wireless/iwlwifi/iwl-trans-pcie.c b/drivers/net/wireless/iwlwifi/iwl-trans-pcie.c
+index 5815cf5..4661a64 100644
+--- a/drivers/net/wireless/iwlwifi/iwl-trans-pcie.c
++++ b/drivers/net/wireless/iwlwifi/iwl-trans-pcie.c
+@@ -1777,6 +1777,7 @@ static ssize_t iwl_dbgfs_rx_queue_read(struct file *file,
+ 	return simple_read_from_buffer(user_buf, count, ppos, buf, pos);
+ }
+ 
++#ifdef CONFIG_IWLWIFI_DEBUG
+ static ssize_t iwl_dbgfs_log_event_read(struct file *file,
+ 					 char __user *user_buf,
+ 					 size_t count, loff_t *ppos)
+@@ -1814,6 +1815,7 @@ static ssize_t iwl_dbgfs_log_event_write(struct file *file,
+ 
+ 	return count;
+ }
++#endif
+ 
+ static ssize_t iwl_dbgfs_interrupt_read(struct file *file,
+ 					char __user *user_buf,
+@@ -1941,7 +1943,9 @@ static ssize_t iwl_dbgfs_fh_reg_read(struct file *file,
+ 	return ret;
+ }
+ 
++#ifdef CONFIG_IWLWIFI_DEBUG
+ DEBUGFS_READ_WRITE_FILE_OPS(log_event);
++#endif
+ DEBUGFS_READ_WRITE_FILE_OPS(interrupt);
+ DEBUGFS_READ_FILE_OPS(fh_reg);
+ DEBUGFS_READ_FILE_OPS(rx_queue);
+@@ -1957,7 +1961,9 @@ static int iwl_trans_pcie_dbgfs_register(struct iwl_trans *trans,
+ {
+ 	DEBUGFS_ADD_FILE(rx_queue, dir, S_IRUSR);
+ 	DEBUGFS_ADD_FILE(tx_queue, dir, S_IRUSR);
++#ifdef CONFIG_IWLWIFI_DEBUG
+ 	DEBUGFS_ADD_FILE(log_event, dir, S_IWUSR | S_IRUSR);
++#endif
+ 	DEBUGFS_ADD_FILE(interrupt, dir, S_IWUSR | S_IRUSR);
+ 	DEBUGFS_ADD_FILE(csr, dir, S_IWUSR);
+ 	DEBUGFS_ADD_FILE(fh_reg, dir, S_IRUSR);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0030-ARM-SAMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0030-ARM-SAMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch
new file mode 100644
index 0000000..4a91186
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0030-ARM-SAMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch
@@ -0,0 +1,36 @@
+From 4885fac40cf4f8adf4c6832d90b3b60c4ac44f19 Mon Sep 17 00:00:00 2001
+From: Jose Miguel Goncalves <jose.goncalves@inov.pt>
+Date: Sat, 12 May 2012 06:11:49 +0900
+Subject: [PATCH 30/46] ARM: SAMSUNG: Fix for S3C2412 EBI memory mapping
+
+commit 3dca938656c7b0ff6b0717a5dde0f5f45e592be5 upstream.
+
+While upgrading the kernel on a S3C2412 based board I've noted
+that it was impossible to boot the board with a 2.6.32 or upper
+kernel. I've tracked down the problem to the EBI virtual memory
+mapping that is in conflict with the IO mapping definition in
+arch/arm/mach-s3c24xx/s3c2412.c.
+
+Signed-off-by: Jose Miguel Goncalves <jose.goncalves@inov.pt>
+Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/plat-samsung/include/plat/map-s3c.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/plat-samsung/include/plat/map-s3c.h b/arch/arm/plat-samsung/include/plat/map-s3c.h
+index 7d04875..c0c70a8 100644
+--- a/arch/arm/plat-samsung/include/plat/map-s3c.h
++++ b/arch/arm/plat-samsung/include/plat/map-s3c.h
+@@ -22,7 +22,7 @@
+ #define S3C24XX_VA_WATCHDOG	S3C_VA_WATCHDOG
+ 
+ #define S3C2412_VA_SSMC		S3C_ADDR_CPU(0x00000000)
+-#define S3C2412_VA_EBI		S3C_ADDR_CPU(0x00010000)
++#define S3C2412_VA_EBI		S3C_ADDR_CPU(0x00100000)
+ 
+ #define S3C2410_PA_UART		(0x50000000)
+ #define S3C24XX_PA_UART		S3C2410_PA_UART
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0031-USB-option-add-id-for-Cellient-MEN-200.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0031-USB-option-add-id-for-Cellient-MEN-200.patch
new file mode 100644
index 0000000..d41471f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0031-USB-option-add-id-for-Cellient-MEN-200.patch
@@ -0,0 +1,44 @@
+From 8ca01cdb21b1e0daed013a4536ca89543f844424 Mon Sep 17 00:00:00 2001
+From: Dmitry Shmygov <shmygov@rambler.ru>
+Date: Wed, 20 Jun 2012 15:51:40 +0400
+Subject: [PATCH 31/46] USB: option: add id for Cellient MEN-200
+
+commit 1e2c4e59d2b8797973471b4a287a43eac12a0f40 upstream.
+
+Add vendor and product ID to option.c driver
+for Cellient MEN-200 EVDO Rev.B 450MHz data module.
+http://cellient.com
+
+Signed-off-by: Dmitry Shmygov <shmygov@rambler.ru>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/option.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 61d6c31..e311711c 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -496,6 +496,10 @@ static void option_instat_callback(struct urb *urb);
+ /* MediaTek products */
+ #define MEDIATEK_VENDOR_ID			0x0e8d
+ 
++/* Cellient products */
++#define CELLIENT_VENDOR_ID			0x2692
++#define CELLIENT_PRODUCT_MEN200			0x9005
++
+ /* some devices interfaces need special handling due to a number of reasons */
+ enum option_blacklist_reason {
+ 		OPTION_BLACKLIST_NONE = 0,
+@@ -1227,6 +1231,7 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a1, 0xff, 0x02, 0x01) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x00, 0x00) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x02, 0x01) },        /* MediaTek MT6276M modem & app port */
++	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MEN200) },
+ 	{ } /* Terminating entry */
+ };
+ MODULE_DEVICE_TABLE(usb, option_ids);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0032-oprofile-perf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0032-oprofile-perf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch
new file mode 100644
index 0000000..e2c5be8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0032-oprofile-perf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch
@@ -0,0 +1,44 @@
+From fa7b3de0ebfa0cd8a833ea2daa5ded5ea50fd085 Mon Sep 17 00:00:00 2001
+From: Will Deacon <will.deacon@arm.com>
+Date: Fri, 8 Jun 2012 16:16:04 +0100
+Subject: [PATCH 32/46] oprofile: perf: use NR_CPUS instead or nr_cpumask_bits
+ for static array
+
+commit e734568b675c985db2026848fefaac01c22977a5 upstream.
+
+The OProfile perf backend uses a static array to keep track of the
+perf events on the system. When compiling with CONFIG_CPUMASK_OFFSTACK=y
+&& SMP, nr_cpumask_bits is not a compile-time constant and the build
+will fail with:
+
+oprofile_perf.c:28: error: variably modified 'perf_events' at file scope
+
+This patch uses NR_CPUs instead of nr_cpumask_bits for the array
+initialisation. If this causes space problems in the future, we can
+always move to dynamic allocation for the events array.
+
+Cc: Matt Fleming <matt@console-pimps.org>
+Reported-by: Russell King - ARM Linux <linux@arm.linux.org.uk>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Robert Richter <robert.richter@amd.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/oprofile/oprofile_perf.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/oprofile/oprofile_perf.c b/drivers/oprofile/oprofile_perf.c
+index da14432..efc4b7f 100644
+--- a/drivers/oprofile/oprofile_perf.c
++++ b/drivers/oprofile/oprofile_perf.c
+@@ -25,7 +25,7 @@ static int oprofile_perf_enabled;
+ static DEFINE_MUTEX(oprofile_perf_mutex);
+ 
+ static struct op_counter_config *counter_config;
+-static struct perf_event **perf_events[nr_cpumask_bits];
++static struct perf_event **perf_events[NR_CPUS];
+ static int num_counters;
+ 
+ /*
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0033-drm-i915-Refactor-the-deferred-PM_IIR-handling-into-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0033-drm-i915-Refactor-the-deferred-PM_IIR-handling-into-.patch
new file mode 100644
index 0000000..ac1efd7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0033-drm-i915-Refactor-the-deferred-PM_IIR-handling-into-.patch
@@ -0,0 +1,107 @@
+From 179d0e42c797861a350b6f72e534edad4dac0f65 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Sun, 15 Apr 2012 11:56:03 +0100
+Subject: [PATCH 33/46] drm/i915: Refactor the deferred PM_IIR handling into a
+ single function
+
+commit fc6826d1dcd65f3d1e9a5377678882e4e08f02be upstream.
+
+This function, along with the registers and deferred work hander, are
+all shared with SandyBridge, IvyBridge and their variants. So remove the
+duplicate code into a single function.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+[bwh: Backported to 3.2: adjust context; drop changes for Valley View]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/i915_irq.c |   58 +++++++++++++++++++--------------------
+ 1 file changed, 29 insertions(+), 29 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
+index d3820c2..17c335e 100644
+--- a/drivers/gpu/drm/i915/i915_irq.c
++++ b/drivers/gpu/drm/i915/i915_irq.c
+@@ -424,6 +424,31 @@ static void gen6_pm_rps_work(struct work_struct *work)
+ 	mutex_unlock(&dev_priv->dev->struct_mutex);
+ }
+ 
++static void gen6_queue_rps_work(struct drm_i915_private *dev_priv,
++				u32 pm_iir)
++{
++	unsigned long flags;
++
++	/*
++	 * IIR bits should never already be set because IMR should
++	 * prevent an interrupt from being shown in IIR. The warning
++	 * displays a case where we've unsafely cleared
++	 * dev_priv->pm_iir. Although missing an interrupt of the same
++	 * type is not a problem, it displays a problem in the logic.
++	 *
++	 * The mask bit in IMR is cleared by rps_work.
++	 */
++
++	spin_lock_irqsave(&dev_priv->rps_lock, flags);
++	WARN(dev_priv->pm_iir & pm_iir, "Missed a PM interrupt\n");
++	dev_priv->pm_iir |= pm_iir;
++	I915_WRITE(GEN6_PMIMR, dev_priv->pm_iir);
++	POSTING_READ(GEN6_PMIMR);
++	spin_unlock_irqrestore(&dev_priv->rps_lock, flags);
++
++	queue_work(dev_priv->wq, &dev_priv->rps_work);
++}
++
+ static void pch_irq_handler(struct drm_device *dev, u32 pch_iir)
+ {
+ 	drm_i915_private_t *dev_priv = (drm_i915_private_t *) dev->dev_private;
+@@ -529,16 +554,8 @@ static irqreturn_t ivybridge_irq_handler(DRM_IRQ_ARGS)
+ 		pch_irq_handler(dev, pch_iir);
+ 	}
+ 
+-	if (pm_iir & GEN6_PM_DEFERRED_EVENTS) {
+-		unsigned long flags;
+-		spin_lock_irqsave(&dev_priv->rps_lock, flags);
+-		WARN(dev_priv->pm_iir & pm_iir, "Missed a PM interrupt\n");
+-		dev_priv->pm_iir |= pm_iir;
+-		I915_WRITE(GEN6_PMIMR, dev_priv->pm_iir);
+-		POSTING_READ(GEN6_PMIMR);
+-		spin_unlock_irqrestore(&dev_priv->rps_lock, flags);
+-		queue_work(dev_priv->wq, &dev_priv->rps_work);
+-	}
++	if (pm_iir & GEN6_PM_DEFERRED_EVENTS)
++		gen6_queue_rps_work(dev_priv, pm_iir);
+ 
+ 	/* should clear PCH hotplug event before clear CPU irq */
+ 	I915_WRITE(SDEIIR, pch_iir);
+@@ -634,25 +651,8 @@ static irqreturn_t ironlake_irq_handler(DRM_IRQ_ARGS)
+ 		i915_handle_rps_change(dev);
+ 	}
+ 
+-	if (IS_GEN6(dev) && pm_iir & GEN6_PM_DEFERRED_EVENTS) {
+-		/*
+-		 * IIR bits should never already be set because IMR should
+-		 * prevent an interrupt from being shown in IIR. The warning
+-		 * displays a case where we've unsafely cleared
+-		 * dev_priv->pm_iir. Although missing an interrupt of the same
+-		 * type is not a problem, it displays a problem in the logic.
+-		 *
+-		 * The mask bit in IMR is cleared by rps_work.
+-		 */
+-		unsigned long flags;
+-		spin_lock_irqsave(&dev_priv->rps_lock, flags);
+-		WARN(dev_priv->pm_iir & pm_iir, "Missed a PM interrupt\n");
+-		dev_priv->pm_iir |= pm_iir;
+-		I915_WRITE(GEN6_PMIMR, dev_priv->pm_iir);
+-		POSTING_READ(GEN6_PMIMR);
+-		spin_unlock_irqrestore(&dev_priv->rps_lock, flags);
+-		queue_work(dev_priv->wq, &dev_priv->rps_work);
+-	}
++	if (IS_GEN6(dev) && pm_iir & GEN6_PM_DEFERRED_EVENTS)
++		gen6_queue_rps_work(dev_priv, pm_iir);
+ 
+ 	/* should clear PCH hotplug event before clear CPU irq */
+ 	I915_WRITE(SDEIIR, pch_iir);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0034-drm-i915-rip-out-the-PM_IIR-WARN.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0034-drm-i915-rip-out-the-PM_IIR-WARN.patch
new file mode 100644
index 0000000..bd34e07
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0034-drm-i915-rip-out-the-PM_IIR-WARN.patch
@@ -0,0 +1,60 @@
+From a01c3081fec2775e6ed17963f2f70ea67d5e6401 Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Thu, 21 Jun 2012 14:55:22 +0200
+Subject: [PATCH 34/46] drm/i915: rip out the PM_IIR WARN
+
+commit 58bf8062d0b293b8e1028e5b0342082002886bd4 upstream.
+
+After banging my head against this for the past few months, I still
+don't see how this could possible race under the premise that once an
+irq bit is masked in PM_IMR and reset in PM_IIR it won't show up again
+until we unmask it in PM_IMR.
+
+Still, we have reports of this being seen in the wild. Now Bspec has
+this little bit of lovely language in the PMIIR register:
+
+Public SNB Docs, Vol3Part2, 2.5.14 "PMIIR":
+
+"For each bit, the IIR can store a second pending interrupt if two or
+more of the same interrupt conditions occur before the first condition
+is cleared. Upon clearing the interrupt, the IIR bit will momentarily
+go low, then return high to indicate there is another interrupt
+pending."
+
+Now if we presume that PMIMR only prevent new interrupts from being
+queued, we could easily end up masking an interrupt and clearing it,
+but the 2nd pending interrupt setting the bit in PMIIR right away
+again. Which leads, the next time the irq handler runs, to hitting the
+WARN.
+
+Also, no bad side effects of this have ever been reported. And we've
+tracked down our issues with the gpu turbo getting stuck to bogus
+interrupt generation limits in th RPLIMIT register.
+
+So let's just rip out this WARN as bogus and call it a day. The only
+shallow thing here is that this 2-deep irq queue in the hw makes you
+wonder how racy the windows irq handler is ...
+
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=42907
+Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/i915_irq.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
+index 17c335e..578ddfc 100644
+--- a/drivers/gpu/drm/i915/i915_irq.c
++++ b/drivers/gpu/drm/i915/i915_irq.c
+@@ -440,7 +440,6 @@ static void gen6_queue_rps_work(struct drm_i915_private *dev_priv,
+ 	 */
+ 
+ 	spin_lock_irqsave(&dev_priv->rps_lock, flags);
+-	WARN(dev_priv->pm_iir & pm_iir, "Missed a PM interrupt\n");
+ 	dev_priv->pm_iir |= pm_iir;
+ 	I915_WRITE(GEN6_PMIMR, dev_priv->pm_iir);
+ 	POSTING_READ(GEN6_PMIMR);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0035-drm-i915-Fix-eDP-blank-screen-after-S3-resume-on-HP-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0035-drm-i915-Fix-eDP-blank-screen-after-S3-resume-on-HP-.patch
new file mode 100644
index 0000000..7f6394c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0035-drm-i915-Fix-eDP-blank-screen-after-S3-resume-on-HP-.patch
@@ -0,0 +1,46 @@
+From e083a17405e8771aaa8853534c66721aa5aa36ea Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Thu, 21 Jun 2012 15:30:41 +0200
+Subject: [PATCH 35/46] drm/i915: Fix eDP blank screen after S3 resume on HP
+ desktops
+
+commit 6db65cbb941f9d433659bdad02b307f6d94465df upstream.
+
+This patch fixes the problem on some HP desktop machines with eDP
+which give blank screens after S3 resume.
+
+It turned out that BLC_PWM_CPU_CTL must be written after
+BLC_PWM_CPU_CTL2.  Otherwise it doesn't take effect on these
+SNB machines.
+
+Tested with 3.5-rc3 kernel.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=49233
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/i915_suspend.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i915/i915_suspend.c
+index a1eb83d..f38d196 100644
+--- a/drivers/gpu/drm/i915/i915_suspend.c
++++ b/drivers/gpu/drm/i915/i915_suspend.c
+@@ -739,8 +739,11 @@ static void i915_restore_display(struct drm_device *dev)
+ 	if (HAS_PCH_SPLIT(dev)) {
+ 		I915_WRITE(BLC_PWM_PCH_CTL1, dev_priv->saveBLC_PWM_CTL);
+ 		I915_WRITE(BLC_PWM_PCH_CTL2, dev_priv->saveBLC_PWM_CTL2);
+-		I915_WRITE(BLC_PWM_CPU_CTL, dev_priv->saveBLC_CPU_PWM_CTL);
++		/* NOTE: BLC_PWM_CPU_CTL must be written after BLC_PWM_CPU_CTL2;
++		 * otherwise we get blank eDP screen after S3 on some machines
++		 */
+ 		I915_WRITE(BLC_PWM_CPU_CTL2, dev_priv->saveBLC_CPU_PWM_CTL2);
++		I915_WRITE(BLC_PWM_CPU_CTL, dev_priv->saveBLC_CPU_PWM_CTL);
+ 		I915_WRITE(PCH_PP_ON_DELAYS, dev_priv->savePP_ON_DELAYS);
+ 		I915_WRITE(PCH_PP_OFF_DELAYS, dev_priv->savePP_OFF_DELAYS);
+ 		I915_WRITE(PCH_PP_DIVISOR, dev_priv->savePP_DIVISOR);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0036-PM-Sleep-Prevent-waiting-forever-on-asynchronous-sus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0036-PM-Sleep-Prevent-waiting-forever-on-asynchronous-sus.patch
new file mode 100644
index 0000000..0426542
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0036-PM-Sleep-Prevent-waiting-forever-on-asynchronous-sus.patch
@@ -0,0 +1,62 @@
+From 148576d5144418385e4a0d59c5c9547d662ae0f2 Mon Sep 17 00:00:00 2001
+From: Mandeep Singh Baines <msb@chromium.org>
+Date: Sun, 24 Jun 2012 23:31:09 +0200
+Subject: [PATCH 36/46] PM / Sleep: Prevent waiting forever on asynchronous
+ suspend after abort
+
+commit 1f758b23177d588a71b96ad02990e715949bb82f upstream.
+
+__device_suspend() must always send a completion. Otherwise, parent
+devices will wait forever.
+
+Commit 1e2ef05b, "PM: Limit race conditions between runtime PM and
+system sleep (v2)", introduced a regression by short-circuiting the
+complete_all() for certain error cases.
+
+This patch fixes the bug by always signalling a completion.
+
+Addresses http://crosbug.com/31972
+
+Tested by injecting an abort.
+
+Signed-off-by: Mandeep Singh Baines <msb@chromium.org>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/base/power/main.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
+index c3d2dfc..b96544a 100644
+--- a/drivers/base/power/main.c
++++ b/drivers/base/power/main.c
+@@ -869,7 +869,7 @@ static int __device_suspend(struct device *dev, pm_message_t state, bool async)
+ 	dpm_wait_for_children(dev, async);
+ 
+ 	if (async_error)
+-		return 0;
++		goto Complete;
+ 
+ 	pm_runtime_get_noresume(dev);
+ 	if (pm_runtime_barrier(dev) && device_may_wakeup(dev))
+@@ -878,7 +878,7 @@ static int __device_suspend(struct device *dev, pm_message_t state, bool async)
+ 	if (pm_wakeup_pending()) {
+ 		pm_runtime_put_sync(dev);
+ 		async_error = -EBUSY;
+-		return 0;
++		goto Complete;
+ 	}
+ 
+ 	device_lock(dev);
+@@ -926,6 +926,8 @@ static int __device_suspend(struct device *dev, pm_message_t state, bool async)
+ 	}
+ 
+ 	device_unlock(dev);
++
++ Complete:
+ 	complete_all(&dev->power.completion);
+ 
+ 	if (error) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0037-x86-cpufeature-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0037-x86-cpufeature-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch
new file mode 100644
index 0000000..c536a73
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0037-x86-cpufeature-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch
@@ -0,0 +1,73 @@
+From edb1135bf688ed567d95e964af22488274890640 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@linux.intel.com>
+Date: Fri, 22 Jun 2012 10:58:06 -0700
+Subject: [PATCH 37/46] x86, cpufeature: Rename X86_FEATURE_DTS to
+ X86_FEATURE_DTHERM
+
+commit 4ad33411308596f2f918603509729922a1ec4411 upstream.
+
+It makes sense to label "Digital Thermal Sensor" as "DTS", but
+unfortunately the string "dts" was already used for "Debug Store", and
+/proc/cpuinfo is a user space ABI.
+
+Therefore, rename this to "dtherm".
+
+This conflict went into mainline via the hwmon tree without any x86
+maintainer ack, and without any kind of hint in the subject.
+
+    a4659053 x86/hwmon: fix initialization of coretemp
+
+Reported-by: Jean Delvare <khali@linux-fr.org>
+Link: http://lkml.kernel.org/r/4FE34BCB.5050305@linux.intel.com
+Cc: Jan Beulich <JBeulich@suse.com>
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+[bwh: Backported to 3.2: drop the coretemp device table change]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/include/asm/cpufeature.h |    2 +-
+ arch/x86/kernel/cpu/scattered.c   |    2 +-
+ drivers/hwmon/coretemp.c          |    2 +-
+ 3 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
+index f3444f7..0c3b775 100644
+--- a/arch/x86/include/asm/cpufeature.h
++++ b/arch/x86/include/asm/cpufeature.h
+@@ -175,7 +175,7 @@
+ #define X86_FEATURE_XSAVEOPT	(7*32+ 4) /* Optimized Xsave */
+ #define X86_FEATURE_PLN		(7*32+ 5) /* Intel Power Limit Notification */
+ #define X86_FEATURE_PTS		(7*32+ 6) /* Intel Package Thermal Status */
+-#define X86_FEATURE_DTS		(7*32+ 7) /* Digital Thermal Sensor */
++#define X86_FEATURE_DTHERM	(7*32+ 7) /* Digital Thermal Sensor */
+ 
+ /* Virtualization flags: Linux defined, word 8 */
+ #define X86_FEATURE_TPR_SHADOW  (8*32+ 0) /* Intel TPR Shadow */
+diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
+index c7f64e6..ea6106c 100644
+--- a/arch/x86/kernel/cpu/scattered.c
++++ b/arch/x86/kernel/cpu/scattered.c
+@@ -31,7 +31,7 @@ void __cpuinit init_scattered_cpuid_features(struct cpuinfo_x86 *c)
+ 	const struct cpuid_bit *cb;
+ 
+ 	static const struct cpuid_bit __cpuinitconst cpuid_bits[] = {
+-		{ X86_FEATURE_DTS,		CR_EAX, 0, 0x00000006, 0 },
++		{ X86_FEATURE_DTHERM,		CR_EAX, 0, 0x00000006, 0 },
+ 		{ X86_FEATURE_IDA,		CR_EAX, 1, 0x00000006, 0 },
+ 		{ X86_FEATURE_ARAT,		CR_EAX, 2, 0x00000006, 0 },
+ 		{ X86_FEATURE_PLN,		CR_EAX, 4, 0x00000006, 0 },
+diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
+index 427468f..0790c98 100644
+--- a/drivers/hwmon/coretemp.c
++++ b/drivers/hwmon/coretemp.c
+@@ -660,7 +660,7 @@ static void __cpuinit get_core_online(unsigned int cpu)
+ 	 * sensors. We check this bit only, all the early CPUs
+ 	 * without thermal sensors will be filtered out.
+ 	 */
+-	if (!cpu_has(c, X86_FEATURE_DTS))
++	if (!cpu_has(c, X86_FEATURE_DTHERM))
+ 		return;
+ 
+ 	if (!pdev) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0038-stable-Allow-merging-of-backports-for-serious-user-v.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0038-stable-Allow-merging-of-backports-for-serious-user-v.patch
new file mode 100644
index 0000000..37925c6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0038-stable-Allow-merging-of-backports-for-serious-user-v.patch
@@ -0,0 +1,51 @@
+From 2bbcf955f97142e2b38c1da222da381d3729beb9 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 21 Jun 2012 11:36:50 +0100
+Subject: [PATCH 38/46] stable: Allow merging of backports for serious
+ user-visible performance issues
+
+commit eb3979f64d25120d60b9e761a4c58f70b1a02f86 upstream.
+
+Distribution kernel maintainers routinely backport fixes for users that
+were deemed important but not "something critical" as defined by the
+rules. To users of these kernels they are very serious and failing to fix
+them reduces the value of -stable.
+
+The problem is that the patches fixing these issues are often subtle and
+prone to regressions in other ways and need greater care and attention.
+To combat this, these "serious" backports should have a higher barrier
+to entry.
+
+This patch relaxes the rules to allow a distribution maintainer to merge
+to -stable a backported patch or small series that fixes a "serious"
+user-visible performance issue. They should include additional information on
+the user-visible bug affected and a link to the bugzilla entry if available.
+The same rules about the patch being already in mainline still apply.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ Documentation/stable_kernel_rules.txt |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/Documentation/stable_kernel_rules.txt b/Documentation/stable_kernel_rules.txt
+index 21fd05c..e1f856b 100644
+--- a/Documentation/stable_kernel_rules.txt
++++ b/Documentation/stable_kernel_rules.txt
+@@ -12,6 +12,12 @@ Rules on what kind of patches are accepted, and which ones are not, into the
+    marked CONFIG_BROKEN), an oops, a hang, data corruption, a real
+    security issue, or some "oh, that's not good" issue.  In short, something
+    critical.
++ - Serious issues as reported by a user of a distribution kernel may also
++   be considered if they fix a notable performance or interactivity issue.
++   As these fixes are not as obvious and have a higher risk of a subtle
++   regression they should only be submitted by a distribution kernel
++   maintainer and include an addendum linking to a bugzilla entry if it
++   exists and additional information on the user-visible impact.
+  - New device IDs and quirks are also accepted.
+  - No "theoretical race condition" issues, unless an explanation of how the
+    race can be exploited is also provided.
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0039-ALSA-hda-Add-Realtek-ALC280-codec-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0039-ALSA-hda-Add-Realtek-ALC280-codec-support.patch
new file mode 100644
index 0000000..a784376
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0039-ALSA-hda-Add-Realtek-ALC280-codec-support.patch
@@ -0,0 +1,34 @@
+From 0aab048a80bd01c77244fa5d7e714a1174401ab1 Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Mon, 25 Jun 2012 19:49:28 +0200
+Subject: [PATCH 39/46] ALSA: hda - Add Realtek ALC280 codec support
+
+commit befae82e2906cb7155020876a531b0b8c6c8d8c8 upstream.
+
+This chip looks very similar to ALC269 and ALC27* variants. The bug reporter
+has verified that sound was working after this patch had been applied.
+
+BugLink: https://bugs.launchpad.net/bugs/1017017
+Tested-by: Richard Crossley <richardcrossley@o2.co.uk>
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_realtek.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 0005bde..5f096a5 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -5988,6 +5988,7 @@ static const struct hda_codec_preset snd_hda_preset_realtek[] = {
+ 	{ .id = 0x10ec0272, .name = "ALC272", .patch = patch_alc662 },
+ 	{ .id = 0x10ec0275, .name = "ALC275", .patch = patch_alc269 },
+ 	{ .id = 0x10ec0276, .name = "ALC276", .patch = patch_alc269 },
++	{ .id = 0x10ec0280, .name = "ALC280", .patch = patch_alc269 },
+ 	{ .id = 0x10ec0861, .rev = 0x100340, .name = "ALC660",
+ 	  .patch = patch_alc861 },
+ 	{ .id = 0x10ec0660, .name = "ALC660-VD", .patch = patch_alc861vd },
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0040-USB-option-Add-USB-ID-for-Novatel-Ovation-MC551.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0040-USB-option-Add-USB-ID-for-Novatel-Ovation-MC551.patch
new file mode 100644
index 0000000..4e011cd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0040-USB-option-Add-USB-ID-for-Novatel-Ovation-MC551.patch
@@ -0,0 +1,41 @@
+From 2e5d03393a6928616737edfb24457da88d21102b Mon Sep 17 00:00:00 2001
+From: Forest Bond <forest.bond@rapidrollout.com>
+Date: Fri, 22 Jun 2012 10:30:38 -0400
+Subject: [PATCH 40/46] USB: option: Add USB ID for Novatel Ovation MC551
+
+commit 065b07e7a14676f4138ce4619d229c0be5a74230 upstream.
+
+This device is also known as the Verizon USB551L.
+
+Signed-off-by: Forest Bond <forest.bond@rapidrollout.com>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/option.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index e311711c..21a4734 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -235,6 +235,7 @@ static void option_instat_callback(struct urb *urb);
+ #define NOVATELWIRELESS_PRODUCT_G1		0xA001
+ #define NOVATELWIRELESS_PRODUCT_G1_M		0xA002
+ #define NOVATELWIRELESS_PRODUCT_G2		0xA010
++#define NOVATELWIRELESS_PRODUCT_MC551		0xB001
+ 
+ /* AMOI PRODUCTS */
+ #define AMOI_VENDOR_ID				0x1614
+@@ -734,6 +735,8 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_G1) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_G1_M) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_G2) },
++	/* Novatel Ovation MC551 a.k.a. Verizon USB551L */
++	{ USB_DEVICE_AND_INTERFACE_INFO(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_MC551, 0xff, 0xff, 0xff) },
+ 
+ 	{ USB_DEVICE(AMOI_VENDOR_ID, AMOI_PRODUCT_H01) },
+ 	{ USB_DEVICE(AMOI_VENDOR_ID, AMOI_PRODUCT_H01A) },
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch
new file mode 100644
index 0000000..f6509bf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch
@@ -0,0 +1,61 @@
+From 88093f6173b2c203d31bf67ed055419f5ec21953 Mon Sep 17 00:00:00 2001
+From: Craig Shelley <craig@microtron.org.uk>
+Date: Tue, 26 Jun 2012 23:20:04 +0100
+Subject: [PATCH 41/46] USB: CP210x Add 10 Device IDs
+
+commit 3fcc8f96829776cf181918461923d1e3bbb831a2 upstream.
+
+This patch adds 10 device IDs for CP210x based devices from the following manufacturers:
+Timewave
+Clipsal
+Festo
+Link Instruments
+
+Signed-off-by: Craig Shelley <craig@microtron.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/cp210x.c |   11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
+index aa0c43f..35e6b5f 100644
+--- a/drivers/usb/serial/cp210x.c
++++ b/drivers/usb/serial/cp210x.c
+@@ -93,6 +93,7 @@ static const struct usb_device_id id_table[] = {
+ 	{ USB_DEVICE(0x10C4, 0x814B) }, /* West Mountain Radio RIGtalk */
+ 	{ USB_DEVICE(0x10C4, 0x8156) }, /* B&G H3000 link cable */
+ 	{ USB_DEVICE(0x10C4, 0x815E) }, /* Helicomm IP-Link 1220-DVM */
++	{ USB_DEVICE(0x10C4, 0x815F) }, /* Timewave HamLinkUSB */
+ 	{ USB_DEVICE(0x10C4, 0x818B) }, /* AVIT Research USB to TTL */
+ 	{ USB_DEVICE(0x10C4, 0x819F) }, /* MJS USB Toslink Switcher */
+ 	{ USB_DEVICE(0x10C4, 0x81A6) }, /* ThinkOptics WavIt */
+@@ -134,7 +135,13 @@ static const struct usb_device_id id_table[] = {
+ 	{ USB_DEVICE(0x10CE, 0xEA6A) }, /* Silicon Labs MobiData GPRS USB Modem 100EU */
+ 	{ USB_DEVICE(0x13AD, 0x9999) }, /* Baltech card reader */
+ 	{ USB_DEVICE(0x1555, 0x0004) }, /* Owen AC4 USB-RS485 Converter */
++	{ USB_DEVICE(0x166A, 0x0201) }, /* Clipsal 5500PACA C-Bus Pascal Automation Controller */
++	{ USB_DEVICE(0x166A, 0x0301) }, /* Clipsal 5800PC C-Bus Wireless PC Interface */
+ 	{ USB_DEVICE(0x166A, 0x0303) }, /* Clipsal 5500PCU C-Bus USB interface */
++	{ USB_DEVICE(0x166A, 0x0304) }, /* Clipsal 5000CT2 C-Bus Black and White Touchscreen */
++	{ USB_DEVICE(0x166A, 0x0305) }, /* Clipsal C-5000CT2 C-Bus Spectrum Colour Touchscreen */
++	{ USB_DEVICE(0x166A, 0x0401) }, /* Clipsal L51xx C-Bus Architectural Dimmer */
++	{ USB_DEVICE(0x166A, 0x0101) }, /* Clipsal 5560884 C-Bus Multi-room Audio Matrix Switcher */
+ 	{ USB_DEVICE(0x16D6, 0x0001) }, /* Jablotron serial interface */
+ 	{ USB_DEVICE(0x16DC, 0x0010) }, /* W-IE-NE-R Plein & Baus GmbH PL512 Power Supply */
+ 	{ USB_DEVICE(0x16DC, 0x0011) }, /* W-IE-NE-R Plein & Baus GmbH RCM Remote Control for MARATON Power Supply */
+@@ -146,7 +153,11 @@ static const struct usb_device_id id_table[] = {
+ 	{ USB_DEVICE(0x1843, 0x0200) }, /* Vaisala USB Instrument Cable */
+ 	{ USB_DEVICE(0x18EF, 0xE00F) }, /* ELV USB-I2C-Interface */
+ 	{ USB_DEVICE(0x1BE3, 0x07A6) }, /* WAGO 750-923 USB Service Cable */
++	{ USB_DEVICE(0x1E29, 0x0102) }, /* Festo CPX-USB */
++	{ USB_DEVICE(0x1E29, 0x0501) }, /* Festo CMSP */
+ 	{ USB_DEVICE(0x3195, 0xF190) }, /* Link Instruments MSO-19 */
++	{ USB_DEVICE(0x3195, 0xF280) }, /* Link Instruments MSO-28 */
++	{ USB_DEVICE(0x3195, 0xF281) }, /* Link Instruments MSO-28 */
+ 	{ USB_DEVICE(0x413C, 0x9500) }, /* DW700 GPS USB interface */
+ 	{ } /* Terminating Entry */
+ };
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0042-xen-netfront-teardown-the-device-before-unregisterin.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0042-xen-netfront-teardown-the-device-before-unregisterin.patch
new file mode 100644
index 0000000..5847cb6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0042-xen-netfront-teardown-the-device-before-unregisterin.patch
@@ -0,0 +1,58 @@
+From 55cebafff1e8327fe9dfa3b66d6f70bf88138902 Mon Sep 17 00:00:00 2001
+From: Ian Campbell <Ian.Campbell@citrix.com>
+Date: Mon, 25 Jun 2012 22:48:41 +0000
+Subject: [PATCH 42/46] xen/netfront: teardown the device before unregistering
+ it.
+
+commit 6bc96d047fe32d76ef79f3195c52a542edf7c705 upstream.
+
+Fixes:
+[   15.470311] WARNING: at /local/scratch/ianc/devel/kernels/linux/fs/sysfs/file.c:498 sysfs_attr_ns+0x95/0xa0()
+[   15.470326] sysfs: kobject eth0 without dirent
+[   15.470333] Modules linked in:
+[   15.470342] Pid: 12, comm: xenwatch Not tainted 3.4.0-x86_32p-xenU #93
+and
+[    9.150554] BUG: unable to handle kernel paging request at 2b359000
+[    9.150577] IP: [<c1279561>] linkwatch_do_dev+0x81/0xc0
+[    9.150592] *pdpt = 000000002c3c9027 *pde = 0000000000000000
+[    9.150604] Oops: 0002 [#1] SMP
+[    9.150613] Modules linked in:
+
+This is http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=675190
+
+Reported-by: George Shuklin <george.shuklin@gmail.com>
+Signed-off-by: Ian Campbell <ian.campbell@citrix.com>
+Tested-by: William Dauchy <wdauchy@gmail.com>
+Cc: 675190@bugs.debian.org
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/xen-netfront.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/xen-netfront.c b/drivers/net/xen-netfront.c
+index 226faab..fc35308 100644
+--- a/drivers/net/xen-netfront.c
++++ b/drivers/net/xen-netfront.c
+@@ -1922,14 +1922,14 @@ static int __devexit xennet_remove(struct xenbus_device *dev)
+ 
+ 	dev_dbg(&dev->dev, "%s\n", dev->nodename);
+ 
+-	unregister_netdev(info->netdev);
+-
+ 	xennet_disconnect_backend(info);
+ 
+-	del_timer_sync(&info->rx_refill_timer);
+-
+ 	xennet_sysfs_delif(info->netdev);
+ 
++	unregister_netdev(info->netdev);
++
++	del_timer_sync(&info->rx_refill_timer);
++
+ 	free_percpu(info->stats);
+ 
+ 	free_netdev(info->netdev);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0043-can-flexcan-use-be32_to_cpup-to-handle-the-value-of-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0043-can-flexcan-use-be32_to_cpup-to-handle-the-value-of-.patch
new file mode 100644
index 0000000..fa007b3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0043-can-flexcan-use-be32_to_cpup-to-handle-the-value-of-.patch
@@ -0,0 +1,44 @@
+From 06f8253f22e3ba961cc490243917206e2a8a8502 Mon Sep 17 00:00:00 2001
+From: Hui Wang <jason77.wang@gmail.com>
+Date: Wed, 27 Jun 2012 16:19:18 +0800
+Subject: [PATCH 43/46] can: flexcan: use be32_to_cpup to handle the value of
+ dt entry
+
+commit 85f2f834e85517307f13e30e630a5fc86f757cb5 upstream.
+
+The freescale arm i.MX series platform can support this driver, and
+usually the arm cpu works in the little endian mode by default, while
+device tree entry value is stored in big endian format, we should use
+be32_to_cpup() to handle them, after modification, it can work well
+both on the le cpu and be cpu.
+
+Cc: Shawn Guo <shawn.guo@linaro.org>
+Signed-off-by: Hui Wang <jason77.wang@gmail.com>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/can/flexcan.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/can/flexcan.c b/drivers/net/can/flexcan.c
+index e023379..e59d006 100644
+--- a/drivers/net/can/flexcan.c
++++ b/drivers/net/can/flexcan.c
+@@ -933,12 +933,12 @@ static int __devinit flexcan_probe(struct platform_device *pdev)
+ 	u32 clock_freq = 0;
+ 
+ 	if (pdev->dev.of_node) {
+-		const u32 *clock_freq_p;
++		const __be32 *clock_freq_p;
+ 
+ 		clock_freq_p = of_get_property(pdev->dev.of_node,
+ 						"clock-frequency", NULL);
+ 		if (clock_freq_p)
+-			clock_freq = *clock_freq_p;
++			clock_freq = be32_to_cpup(clock_freq_p);
+ 	}
+ 
+ 	if (!clock_freq) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0044-acpi_pad-fix-power_saving-thread-deadlock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0044-acpi_pad-fix-power_saving-thread-deadlock.patch
new file mode 100644
index 0000000..fd063f1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0044-acpi_pad-fix-power_saving-thread-deadlock.patch
@@ -0,0 +1,66 @@
+From 64a1cb8318eb947d5217e72c7b295a1bda892ecd Mon Sep 17 00:00:00 2001
+From: Stuart Hayes <Stuart_Hayes@Dell.com>
+Date: Wed, 13 Jun 2012 16:10:45 -0500
+Subject: [PATCH 44/46] acpi_pad: fix power_saving thread deadlock
+
+commit 5f1601261050251a5ca293378b492a69d590dacb upstream.
+
+The acpi_pad driver can get stuck in destroy_power_saving_task()
+waiting for kthread_stop() to stop a power_saving thread.  The problem
+is that the isolated_cpus_lock mutex is owned when
+destroy_power_saving_task() calls kthread_stop(), which waits for a
+power_saving thread to end, and the power_saving thread tries to
+acquire the isolated_cpus_lock when it calls round_robin_cpu().  This
+patch fixes the issue by making round_robin_cpu() use its own mutex.
+
+https://bugzilla.kernel.org/show_bug.cgi?id=42981
+
+Signed-off-by: Stuart Hayes <Stuart_Hayes@Dell.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/acpi/acpi_pad.c |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/acpi/acpi_pad.c b/drivers/acpi/acpi_pad.c
+index a43fa1a..1502c502 100644
+--- a/drivers/acpi/acpi_pad.c
++++ b/drivers/acpi/acpi_pad.c
+@@ -36,6 +36,7 @@
+ #define ACPI_PROCESSOR_AGGREGATOR_DEVICE_NAME "Processor Aggregator"
+ #define ACPI_PROCESSOR_AGGREGATOR_NOTIFY 0x80
+ static DEFINE_MUTEX(isolated_cpus_lock);
++static DEFINE_MUTEX(round_robin_lock);
+ 
+ static unsigned long power_saving_mwait_eax;
+ 
+@@ -107,7 +108,7 @@ static void round_robin_cpu(unsigned int tsk_index)
+ 	if (!alloc_cpumask_var(&tmp, GFP_KERNEL))
+ 		return;
+ 
+-	mutex_lock(&isolated_cpus_lock);
++	mutex_lock(&round_robin_lock);
+ 	cpumask_clear(tmp);
+ 	for_each_cpu(cpu, pad_busy_cpus)
+ 		cpumask_or(tmp, tmp, topology_thread_cpumask(cpu));
+@@ -116,7 +117,7 @@ static void round_robin_cpu(unsigned int tsk_index)
+ 	if (cpumask_empty(tmp))
+ 		cpumask_andnot(tmp, cpu_online_mask, pad_busy_cpus);
+ 	if (cpumask_empty(tmp)) {
+-		mutex_unlock(&isolated_cpus_lock);
++		mutex_unlock(&round_robin_lock);
+ 		return;
+ 	}
+ 	for_each_cpu(cpu, tmp) {
+@@ -131,7 +132,7 @@ static void round_robin_cpu(unsigned int tsk_index)
+ 	tsk_in_cpu[tsk_index] = preferred_cpu;
+ 	cpumask_set_cpu(preferred_cpu, pad_busy_cpus);
+ 	cpu_weight[preferred_cpu]++;
+-	mutex_unlock(&isolated_cpus_lock);
++	mutex_unlock(&round_robin_lock);
+ 
+ 	set_cpus_allowed_ptr(current, cpumask_of(preferred_cpu));
+ }
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0045-batman-adv-only-drop-packets-of-known-wifi-clients.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0045-batman-adv-only-drop-packets-of-known-wifi-clients.patch
new file mode 100644
index 0000000..ce2107d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0045-batman-adv-only-drop-packets-of-known-wifi-clients.patch
@@ -0,0 +1,55 @@
+From b3f045e43695ea8ac7c43715d0c98d58d488683d Mon Sep 17 00:00:00 2001
+From: Marek Lindner <lindner_marek@yahoo.de>
+Date: Wed, 20 Jun 2012 17:16:05 +0200
+Subject: [PATCH 45/46] batman-adv: only drop packets of known wifi clients
+
+commit 5870adc68fc39d81089f1e80efdf64b97e5c37a1 upstream.
+
+bug introduced with 59b699cdee039d75915c354da06937102d1f9a84
+
+If the source or destination mac address of an ethernet packet
+could not be found in the translation table the packet was
+dropped if AP isolation was turned on. This behavior would
+make it impossible to send broadcast packets over the mesh as
+the broadcast address will never enter the translation table.
+
+Signed-off-by: Marek Lindner <lindner_marek@yahoo.de>
+Acked-by: Antonio Quartulli <ordex@autistici.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/batman-adv/translation-table.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
+index 5f09a57..088af45 100644
+--- a/net/batman-adv/translation-table.c
++++ b/net/batman-adv/translation-table.c
+@@ -1816,10 +1816,10 @@ bool is_ap_isolated(struct bat_priv *bat_priv, uint8_t *src, uint8_t *dst)
+ {
+ 	struct tt_local_entry *tt_local_entry = NULL;
+ 	struct tt_global_entry *tt_global_entry = NULL;
+-	bool ret = true;
++	bool ret = false;
+ 
+ 	if (!atomic_read(&bat_priv->ap_isolation))
+-		return false;
++		goto out;
+ 
+ 	tt_local_entry = tt_local_hash_find(bat_priv, dst);
+ 	if (!tt_local_entry)
+@@ -1829,10 +1829,10 @@ bool is_ap_isolated(struct bat_priv *bat_priv, uint8_t *src, uint8_t *dst)
+ 	if (!tt_global_entry)
+ 		goto out;
+ 
+-	if (_is_ap_isolated(tt_local_entry, tt_global_entry))
++	if (!_is_ap_isolated(tt_local_entry, tt_global_entry))
+ 		goto out;
+ 
+-	ret = false;
++	ret = true;
+ 
+ out:
+ 	if (tt_global_entry)
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0046-Linux-3.2.22.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0046-Linux-3.2.22.patch
new file mode 100644
index 0000000..f96d4a6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.22/0046-Linux-3.2.22.patch
@@ -0,0 +1,24 @@
+From 453efabb6ea10cbe4a726e9637b76991f39d3655 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 4 Jul 2012 05:44:35 +0100
+Subject: [PATCH 46/46] Linux 3.2.22
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 7eb465e..9a7d921 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 21
++SUBLEVEL = 22
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0001-splice-fix-racy-pipe-buffers-uses.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0001-splice-fix-racy-pipe-buffers-uses.patch
new file mode 100644
index 0000000..6441cc2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0001-splice-fix-racy-pipe-buffers-uses.patch
@@ -0,0 +1,298 @@
+From e02d361ade75d22d28ce36460954b4bc6439fc74 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Tue, 12 Jun 2012 15:24:40 +0200
+Subject: [PATCH 01/49] splice: fix racy pipe->buffers uses
+
+commit 047fe3605235888f3ebcda0c728cb31937eadfe6 upstream.
+
+Dave Jones reported a kernel BUG at mm/slub.c:3474! triggered
+by splice_shrink_spd() called from vmsplice_to_pipe()
+
+commit 35f3d14dbbc5 (pipe: add support for shrinking and growing pipes)
+added capability to adjust pipe->buffers.
+
+Problem is some paths don't hold pipe mutex and assume pipe->buffers
+doesn't change for their duration.
+
+Fix this by adding nr_pages_max field in struct splice_pipe_desc, and
+use it in place of pipe->buffers where appropriate.
+
+splice_shrink_spd() loses its struct pipe_inode_info argument.
+
+Reported-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Cc: Jens Axboe <axboe@kernel.dk>
+Cc: Alexander Viro <viro@zeniv.linux.org.uk>
+Cc: Tom Herbert <therbert@google.com>
+Tested-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+[bwh: Backported to 3.2:
+ - Adjust context in vmsplice_to_pipe()
+ - Update one more call to splice_shrink_spd(), from skb_splice_bits()]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/splice.c            |   35 ++++++++++++++++++++---------------
+ include/linux/splice.h |    8 ++++----
+ kernel/relay.c         |    5 +++--
+ kernel/trace/trace.c   |    6 ++++--
+ mm/shmem.c             |    3 ++-
+ net/core/skbuff.c      |    3 ++-
+ 6 files changed, 35 insertions(+), 25 deletions(-)
+
+diff --git a/fs/splice.c b/fs/splice.c
+index 6d0dfb8..014fcb4 100644
+--- a/fs/splice.c
++++ b/fs/splice.c
+@@ -274,13 +274,16 @@ void spd_release_page(struct splice_pipe_desc *spd, unsigned int i)
+  * Check if we need to grow the arrays holding pages and partial page
+  * descriptions.
+  */
+-int splice_grow_spd(struct pipe_inode_info *pipe, struct splice_pipe_desc *spd)
++int splice_grow_spd(const struct pipe_inode_info *pipe, struct splice_pipe_desc *spd)
+ {
+-	if (pipe->buffers <= PIPE_DEF_BUFFERS)
++	unsigned int buffers = ACCESS_ONCE(pipe->buffers);
++
++	spd->nr_pages_max = buffers;
++	if (buffers <= PIPE_DEF_BUFFERS)
+ 		return 0;
+ 
+-	spd->pages = kmalloc(pipe->buffers * sizeof(struct page *), GFP_KERNEL);
+-	spd->partial = kmalloc(pipe->buffers * sizeof(struct partial_page), GFP_KERNEL);
++	spd->pages = kmalloc(buffers * sizeof(struct page *), GFP_KERNEL);
++	spd->partial = kmalloc(buffers * sizeof(struct partial_page), GFP_KERNEL);
+ 
+ 	if (spd->pages && spd->partial)
+ 		return 0;
+@@ -290,10 +293,9 @@ int splice_grow_spd(struct pipe_inode_info *pipe, struct splice_pipe_desc *spd)
+ 	return -ENOMEM;
+ }
+ 
+-void splice_shrink_spd(struct pipe_inode_info *pipe,
+-		       struct splice_pipe_desc *spd)
++void splice_shrink_spd(struct splice_pipe_desc *spd)
+ {
+-	if (pipe->buffers <= PIPE_DEF_BUFFERS)
++	if (spd->nr_pages_max <= PIPE_DEF_BUFFERS)
+ 		return;
+ 
+ 	kfree(spd->pages);
+@@ -316,6 +318,7 @@ __generic_file_splice_read(struct file *in, loff_t *ppos,
+ 	struct splice_pipe_desc spd = {
+ 		.pages = pages,
+ 		.partial = partial,
++		.nr_pages_max = PIPE_DEF_BUFFERS,
+ 		.flags = flags,
+ 		.ops = &page_cache_pipe_buf_ops,
+ 		.spd_release = spd_release_page,
+@@ -327,7 +330,7 @@ __generic_file_splice_read(struct file *in, loff_t *ppos,
+ 	index = *ppos >> PAGE_CACHE_SHIFT;
+ 	loff = *ppos & ~PAGE_CACHE_MASK;
+ 	req_pages = (len + loff + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
+-	nr_pages = min(req_pages, pipe->buffers);
++	nr_pages = min(req_pages, spd.nr_pages_max);
+ 
+ 	/*
+ 	 * Lookup the (hopefully) full range of pages we need.
+@@ -498,7 +501,7 @@ fill_it:
+ 	if (spd.nr_pages)
+ 		error = splice_to_pipe(pipe, &spd);
+ 
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ 	return error;
+ }
+ 
+@@ -599,6 +602,7 @@ ssize_t default_file_splice_read(struct file *in, loff_t *ppos,
+ 	struct splice_pipe_desc spd = {
+ 		.pages = pages,
+ 		.partial = partial,
++		.nr_pages_max = PIPE_DEF_BUFFERS,
+ 		.flags = flags,
+ 		.ops = &default_pipe_buf_ops,
+ 		.spd_release = spd_release_page,
+@@ -609,8 +613,8 @@ ssize_t default_file_splice_read(struct file *in, loff_t *ppos,
+ 
+ 	res = -ENOMEM;
+ 	vec = __vec;
+-	if (pipe->buffers > PIPE_DEF_BUFFERS) {
+-		vec = kmalloc(pipe->buffers * sizeof(struct iovec), GFP_KERNEL);
++	if (spd.nr_pages_max > PIPE_DEF_BUFFERS) {
++		vec = kmalloc(spd.nr_pages_max * sizeof(struct iovec), GFP_KERNEL);
+ 		if (!vec)
+ 			goto shrink_ret;
+ 	}
+@@ -618,7 +622,7 @@ ssize_t default_file_splice_read(struct file *in, loff_t *ppos,
+ 	offset = *ppos & ~PAGE_CACHE_MASK;
+ 	nr_pages = (len + offset + PAGE_CACHE_SIZE - 1) >> PAGE_CACHE_SHIFT;
+ 
+-	for (i = 0; i < nr_pages && i < pipe->buffers && len; i++) {
++	for (i = 0; i < nr_pages && i < spd.nr_pages_max && len; i++) {
+ 		struct page *page;
+ 
+ 		page = alloc_page(GFP_USER);
+@@ -666,7 +670,7 @@ ssize_t default_file_splice_read(struct file *in, loff_t *ppos,
+ shrink_ret:
+ 	if (vec != __vec)
+ 		kfree(vec);
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ 	return res;
+ 
+ err:
+@@ -1616,6 +1620,7 @@ static long vmsplice_to_pipe(struct file *file, const struct iovec __user *iov,
+ 	struct splice_pipe_desc spd = {
+ 		.pages = pages,
+ 		.partial = partial,
++		.nr_pages_max = PIPE_DEF_BUFFERS,
+ 		.flags = flags,
+ 		.ops = &user_page_pipe_buf_ops,
+ 		.spd_release = spd_release_page,
+@@ -1631,13 +1636,13 @@ static long vmsplice_to_pipe(struct file *file, const struct iovec __user *iov,
+ 
+ 	spd.nr_pages = get_iovec_page_array(iov, nr_segs, spd.pages,
+ 					    spd.partial, flags & SPLICE_F_GIFT,
+-					    pipe->buffers);
++					    spd.nr_pages_max);
+ 	if (spd.nr_pages <= 0)
+ 		ret = spd.nr_pages;
+ 	else
+ 		ret = splice_to_pipe(pipe, &spd);
+ 
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ 	return ret;
+ }
+ 
+diff --git a/include/linux/splice.h b/include/linux/splice.h
+index 26e5b61..09a545a 100644
+--- a/include/linux/splice.h
++++ b/include/linux/splice.h
+@@ -51,7 +51,8 @@ struct partial_page {
+ struct splice_pipe_desc {
+ 	struct page **pages;		/* page map */
+ 	struct partial_page *partial;	/* pages[] may not be contig */
+-	int nr_pages;			/* number of pages in map */
++	int nr_pages;			/* number of populated pages in map */
++	unsigned int nr_pages_max;	/* pages[] & partial[] arrays size */
+ 	unsigned int flags;		/* splice flags */
+ 	const struct pipe_buf_operations *ops;/* ops associated with output pipe */
+ 	void (*spd_release)(struct splice_pipe_desc *, unsigned int);
+@@ -85,9 +86,8 @@ extern ssize_t splice_direct_to_actor(struct file *, struct splice_desc *,
+ /*
+  * for dynamic pipe sizing
+  */
+-extern int splice_grow_spd(struct pipe_inode_info *, struct splice_pipe_desc *);
+-extern void splice_shrink_spd(struct pipe_inode_info *,
+-				struct splice_pipe_desc *);
++extern int splice_grow_spd(const struct pipe_inode_info *, struct splice_pipe_desc *);
++extern void splice_shrink_spd(struct splice_pipe_desc *);
+ extern void spd_release_page(struct splice_pipe_desc *, unsigned int);
+ 
+ extern const struct pipe_buf_operations page_cache_pipe_buf_ops;
+diff --git a/kernel/relay.c b/kernel/relay.c
+index b6f803a..a535fc9 100644
+--- a/kernel/relay.c
++++ b/kernel/relay.c
+@@ -1235,6 +1235,7 @@ static ssize_t subbuf_splice_actor(struct file *in,
+ 	struct splice_pipe_desc spd = {
+ 		.pages = pages,
+ 		.nr_pages = 0,
++		.nr_pages_max = PIPE_DEF_BUFFERS,
+ 		.partial = partial,
+ 		.flags = flags,
+ 		.ops = &relay_pipe_buf_ops,
+@@ -1302,8 +1303,8 @@ static ssize_t subbuf_splice_actor(struct file *in,
+                 ret += padding;
+ 
+ out:
+-	splice_shrink_spd(pipe, &spd);
+-        return ret;
++	splice_shrink_spd(&spd);
++	return ret;
+ }
+ 
+ static ssize_t relay_file_splice_read(struct file *in,
+diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
+index 697e49d..7e4edd3 100644
+--- a/kernel/trace/trace.c
++++ b/kernel/trace/trace.c
+@@ -3456,6 +3456,7 @@ static ssize_t tracing_splice_read_pipe(struct file *filp,
+ 		.pages		= pages_def,
+ 		.partial	= partial_def,
+ 		.nr_pages	= 0, /* This gets updated below. */
++		.nr_pages_max	= PIPE_DEF_BUFFERS,
+ 		.flags		= flags,
+ 		.ops		= &tracing_pipe_buf_ops,
+ 		.spd_release	= tracing_spd_release_pipe,
+@@ -3527,7 +3528,7 @@ static ssize_t tracing_splice_read_pipe(struct file *filp,
+ 
+ 	ret = splice_to_pipe(pipe, &spd);
+ out:
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ 	return ret;
+ 
+ out_err:
+@@ -4017,6 +4018,7 @@ tracing_buffers_splice_read(struct file *file, loff_t *ppos,
+ 	struct splice_pipe_desc spd = {
+ 		.pages		= pages_def,
+ 		.partial	= partial_def,
++		.nr_pages_max	= PIPE_DEF_BUFFERS,
+ 		.flags		= flags,
+ 		.ops		= &buffer_pipe_buf_ops,
+ 		.spd_release	= buffer_spd_release,
+@@ -4104,7 +4106,7 @@ tracing_buffers_splice_read(struct file *file, loff_t *ppos,
+ 	}
+ 
+ 	ret = splice_to_pipe(pipe, &spd);
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ out:
+ 	return ret;
+ }
+diff --git a/mm/shmem.c b/mm/shmem.c
+index 6c253f7..7a82174 100644
+--- a/mm/shmem.c
++++ b/mm/shmem.c
+@@ -1359,6 +1359,7 @@ static ssize_t shmem_file_splice_read(struct file *in, loff_t *ppos,
+ 	struct splice_pipe_desc spd = {
+ 		.pages = pages,
+ 		.partial = partial,
++		.nr_pages_max = PIPE_DEF_BUFFERS,
+ 		.flags = flags,
+ 		.ops = &page_cache_pipe_buf_ops,
+ 		.spd_release = spd_release_page,
+@@ -1447,7 +1448,7 @@ static ssize_t shmem_file_splice_read(struct file *in, loff_t *ppos,
+ 	if (spd.nr_pages)
+ 		error = splice_to_pipe(pipe, &spd);
+ 
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ 
+ 	if (error > 0) {
+ 		*ppos += error;
+diff --git a/net/core/skbuff.c b/net/core/skbuff.c
+index 2ec200de..af9c3c6 100644
+--- a/net/core/skbuff.c
++++ b/net/core/skbuff.c
+@@ -1663,6 +1663,7 @@ int skb_splice_bits(struct sk_buff *skb, unsigned int offset,
+ 	struct splice_pipe_desc spd = {
+ 		.pages = pages,
+ 		.partial = partial,
++		.nr_pages_max = MAX_SKB_FRAGS,
+ 		.flags = flags,
+ 		.ops = &sock_pipe_buf_ops,
+ 		.spd_release = sock_spd_release,
+@@ -1709,7 +1710,7 @@ done:
+ 		lock_sock(sk);
+ 	}
+ 
+-	splice_shrink_spd(pipe, &spd);
++	splice_shrink_spd(&spd);
+ 	return ret;
+ }
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0002-umem-fix-up-unplugging.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0002-umem-fix-up-unplugging.patch
new file mode 100644
index 0000000..0b28837
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0002-umem-fix-up-unplugging.patch
@@ -0,0 +1,86 @@
+From fd0fcfd8f28824587f180ccde95c03fca533ab05 Mon Sep 17 00:00:00 2001
+From: Tao Guo <glorioustao@gmail.com>
+Date: Wed, 13 Jun 2012 21:17:21 +0200
+Subject: [PATCH 02/49] umem: fix up unplugging
+
+commit 32587371ad3db2f9d335de10dbd8cffd4fff5669 upstream.
+
+Fix a regression introduced by 7eaceaccab5f40 ("block: remove per-queue
+plugging").  In that patch, Jens removed the whole mm_unplug_device()
+function, which used to be the trigger to make umem start to work.
+
+We need to implement unplugging to make umem start to work, or I/O will
+never be triggered.
+
+Signed-off-by: Tao Guo <Tao.Guo@emc.com>
+Cc: Neil Brown <neilb@suse.de>
+Cc: Jens Axboe <axboe@kernel.dk>
+Cc: Shaohua Li <shli@kernel.org>
+Acked-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/block/umem.c |   40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/drivers/block/umem.c b/drivers/block/umem.c
+index aa27120..9a72277 100644
+--- a/drivers/block/umem.c
++++ b/drivers/block/umem.c
+@@ -513,6 +513,44 @@ static void process_page(unsigned long data)
+ 	}
+ }
+ 
++struct mm_plug_cb {
++	struct blk_plug_cb cb;
++	struct cardinfo *card;
++};
++
++static void mm_unplug(struct blk_plug_cb *cb)
++{
++	struct mm_plug_cb *mmcb = container_of(cb, struct mm_plug_cb, cb);
++
++	spin_lock_irq(&mmcb->card->lock);
++	activate(mmcb->card);
++	spin_unlock_irq(&mmcb->card->lock);
++	kfree(mmcb);
++}
++
++static int mm_check_plugged(struct cardinfo *card)
++{
++	struct blk_plug *plug = current->plug;
++	struct mm_plug_cb *mmcb;
++
++	if (!plug)
++		return 0;
++
++	list_for_each_entry(mmcb, &plug->cb_list, cb.list) {
++		if (mmcb->cb.callback == mm_unplug && mmcb->card == card)
++			return 1;
++	}
++	/* Not currently on the callback list */
++	mmcb = kmalloc(sizeof(*mmcb), GFP_ATOMIC);
++	if (!mmcb)
++		return 0;
++
++	mmcb->card = card;
++	mmcb->cb.callback = mm_unplug;
++	list_add(&mmcb->cb.list, &plug->cb_list);
++	return 1;
++}
++
+ static void mm_make_request(struct request_queue *q, struct bio *bio)
+ {
+ 	struct cardinfo *card = q->queuedata;
+@@ -523,6 +561,8 @@ static void mm_make_request(struct request_queue *q, struct bio *bio)
+ 	*card->biotail = bio;
+ 	bio->bi_next = NULL;
+ 	card->biotail = &bio->bi_next;
++	if (bio->bi_rw & REQ_SYNC || !mm_check_plugged(card))
++		activate(card);
+ 	spin_unlock_irq(&card->lock);
+ 
+ 	return;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0003-mwifiex-fix-11n-rx-packet-drop-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0003-mwifiex-fix-11n-rx-packet-drop-issue.patch
new file mode 100644
index 0000000..eef5de7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0003-mwifiex-fix-11n-rx-packet-drop-issue.patch
@@ -0,0 +1,88 @@
+From 8c92af27a522bcec5dc2ced7b49b8f3f57492b21 Mon Sep 17 00:00:00 2001
+From: Stone Piao <piaoyun@marvell.com>
+Date: Wed, 20 Jun 2012 20:21:10 -0700
+Subject: [PATCH 03/49] mwifiex: fix 11n rx packet drop issue
+
+commit 925839243dc9aa4ef25305f5afd10ed18258a4ac upstream.
+
+Currently we check the sequence number of last packet received
+against start_win. If a sequence hole is detected, start_win is
+updated to next sequence number.
+
+Since the rx sequence number is initialized to 0, a corner case
+exists when BA setup happens immediately after association. As
+0 is a valid sequence number, start_win gets increased to 1
+incorrectly. This causes the first packet with sequence number 0
+being dropped.
+
+Initialize rx sequence number as 0xffff and skip adjusting
+start_win if the sequence number remains 0xffff. The sequence
+number will be updated once the first packet is received.
+
+Signed-off-by: Stone Piao <piaoyun@marvell.com>
+Signed-off-by: Avinash Patil <patila@marvell.com>
+Signed-off-by: Kiran Divekar <dkiran@marvell.com>
+Signed-off-by: Bing Zhao <bzhao@marvell.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/mwifiex/11n_rxreorder.c |    5 +++--
+ drivers/net/wireless/mwifiex/11n_rxreorder.h |    7 +++++++
+ drivers/net/wireless/mwifiex/wmm.c           |    2 ++
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/mwifiex/11n_rxreorder.c b/drivers/net/wireless/mwifiex/11n_rxreorder.c
+index 7aa9aa0..39fd4d5 100644
+--- a/drivers/net/wireless/mwifiex/11n_rxreorder.c
++++ b/drivers/net/wireless/mwifiex/11n_rxreorder.c
+@@ -267,7 +267,8 @@ mwifiex_11n_create_rx_reorder_tbl(struct mwifiex_private *priv, u8 *ta,
+ 	else
+ 		last_seq = priv->rx_seq[tid];
+ 
+-	if (last_seq >= new_node->start_win)
++	if (last_seq != MWIFIEX_DEF_11N_RX_SEQ_NUM &&
++	    last_seq >= new_node->start_win)
+ 		new_node->start_win = last_seq + 1;
+ 
+ 	new_node->win_size = win_size;
+@@ -611,5 +612,5 @@ void mwifiex_11n_cleanup_reorder_tbl(struct mwifiex_private *priv)
+ 	spin_unlock_irqrestore(&priv->rx_reorder_tbl_lock, flags);
+ 
+ 	INIT_LIST_HEAD(&priv->rx_reorder_tbl_ptr);
+-	memset(priv->rx_seq, 0, sizeof(priv->rx_seq));
++	mwifiex_reset_11n_rx_seq_num(priv);
+ }
+diff --git a/drivers/net/wireless/mwifiex/11n_rxreorder.h b/drivers/net/wireless/mwifiex/11n_rxreorder.h
+index 033c8ad..7128baa 100644
+--- a/drivers/net/wireless/mwifiex/11n_rxreorder.h
++++ b/drivers/net/wireless/mwifiex/11n_rxreorder.h
+@@ -37,6 +37,13 @@
+ 
+ #define ADDBA_RSP_STATUS_ACCEPT 0
+ 
++#define MWIFIEX_DEF_11N_RX_SEQ_NUM	0xffff
++
++static inline void mwifiex_reset_11n_rx_seq_num(struct mwifiex_private *priv)
++{
++	memset(priv->rx_seq, 0xff, sizeof(priv->rx_seq));
++}
++
+ int mwifiex_11n_rx_reorder_pkt(struct mwifiex_private *,
+ 			       u16 seqNum,
+ 			       u16 tid, u8 *ta,
+diff --git a/drivers/net/wireless/mwifiex/wmm.c b/drivers/net/wireless/mwifiex/wmm.c
+index 6c239c3..b94a349 100644
+--- a/drivers/net/wireless/mwifiex/wmm.c
++++ b/drivers/net/wireless/mwifiex/wmm.c
+@@ -406,6 +406,8 @@ mwifiex_wmm_init(struct mwifiex_adapter *adapter)
+ 		priv->add_ba_param.tx_win_size = MWIFIEX_AMPDU_DEF_TXWINSIZE;
+ 		priv->add_ba_param.rx_win_size = MWIFIEX_AMPDU_DEF_RXWINSIZE;
+ 
++		mwifiex_reset_11n_rx_seq_num(priv);
++
+ 		atomic_set(&priv->wmm.tx_pkts_queued, 0);
+ 		atomic_set(&priv->wmm.highest_queued_prio, HIGH_PRIO_TID);
+ 	}
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0004-mwifiex-fix-WPS-eapol-handshake-failure.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0004-mwifiex-fix-WPS-eapol-handshake-failure.patch
new file mode 100644
index 0000000..b25c446
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0004-mwifiex-fix-WPS-eapol-handshake-failure.patch
@@ -0,0 +1,52 @@
+From ea7217bde3c1bbcb215d3b67a4308399ac1d574c Mon Sep 17 00:00:00 2001
+From: Stone Piao <piaoyun@marvell.com>
+Date: Wed, 20 Jun 2012 20:21:11 -0700
+Subject: [PATCH 04/49] mwifiex: fix WPS eapol handshake failure
+
+commit f03ba7e9a24e5e9efaad56bd1713b994ea556b16 upstream.
+
+After association, STA will go through eapol handshake with WPS
+enabled AP. It's observed that WPS handshake fails with some 11n
+AP. The reason for the failure is that the eapol packet is sent
+via 11n frame aggregation.
+
+The eapol packet should be sent directly without 11n aggregation.
+
+This patch fixes the problem by adding WPS session control while
+dequeuing Tx packets for transmission.
+
+Signed-off-by: Stone Piao <piaoyun@marvell.com>
+Signed-off-by: Avinash Patil <patila@marvell.com>
+Signed-off-by: Bing Zhao <bzhao@marvell.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: reformat the if-statement per earlier
+ upstream commit c65a30f35f938b421ac67c34a9e70b0e49e6019a]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/mwifiex/wmm.c |   10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/wireless/mwifiex/wmm.c b/drivers/net/wireless/mwifiex/wmm.c
+index b94a349..06fcf1e 100644
+--- a/drivers/net/wireless/mwifiex/wmm.c
++++ b/drivers/net/wireless/mwifiex/wmm.c
+@@ -1211,10 +1211,12 @@ mwifiex_dequeue_tx_packet(struct mwifiex_adapter *adapter)
+ 		return 0;
+ 	}
+ 
+-	if (!ptr->is_11n_enabled || mwifiex_is_ba_stream_setup(priv, ptr, tid)
+-	    || ((priv->sec_info.wpa_enabled
+-		  || priv->sec_info.wpa2_enabled) && !priv->wpa_is_gtk_set)
+-		) {
++	if (!ptr->is_11n_enabled ||
++	    mwifiex_is_ba_stream_setup(priv, ptr, tid) ||
++	    priv->wps.session_enable ||
++	    ((priv->sec_info.wpa_enabled ||
++	      priv->sec_info.wpa2_enabled) &&
++	     !priv->wpa_is_gtk_set)) {
+ 		mwifiex_send_single_packet(priv, ptr, ptr_index, flags);
+ 		/* ra_list_spinlock has been freed in
+ 		   mwifiex_send_single_packet() */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0005-NFC-Prevent-multiple-buffer-overflows-in-NCI.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0005-NFC-Prevent-multiple-buffer-overflows-in-NCI.patch
new file mode 100644
index 0000000..10ae647
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0005-NFC-Prevent-multiple-buffer-overflows-in-NCI.patch
@@ -0,0 +1,52 @@
+From e7d858dec1d8cf3c283019ff51adae14b8be9388 Mon Sep 17 00:00:00 2001
+From: Dan Rosenberg <dan.j.rosenberg@gmail.com>
+Date: Mon, 25 Jun 2012 16:05:27 +0200
+Subject: [PATCH 05/49] NFC: Prevent multiple buffer overflows in NCI
+
+commit 67de956ff5dc1d4f321e16cfbd63f5be3b691b43 upstream.
+
+Fix multiple remotely-exploitable stack-based buffer overflows due to
+the NCI code pulling length fields directly from incoming frames and
+copying too much data into statically-sized arrays.
+
+Signed-off-by: Dan Rosenberg <dan.j.rosenberg@gmail.com>
+Cc: security@kernel.org
+Cc: Lauro Ramos Venancio <lauro.venancio@openbossa.org>
+Cc: Aloisio Almeida Jr <aloisio.almeida@openbossa.org>
+Cc: Samuel Ortiz <sameo@linux.intel.com>
+Cc: David S. Miller <davem@davemloft.net>
+Acked-by: Ilan Elias <ilane@ti.com>
+Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
+[bwh: Backported to 3.2:
+ - Drop changes to parsing of tech B and tech F parameters
+ - Various renaming]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/nfc/nci/ntf.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/net/nfc/nci/ntf.c b/net/nfc/nci/ntf.c
+index 96633f5..12b6a80 100644
+--- a/net/nfc/nci/ntf.c
++++ b/net/nfc/nci/ntf.c
+@@ -86,7 +86,7 @@ static int nci_rf_activate_nfca_passive_poll(struct nci_dev *ndev,
+ 	nfca_poll->sens_res = __le16_to_cpu(*((__u16 *)data));
+ 	data += 2;
+ 
+-	nfca_poll->nfcid1_len = *data++;
++	nfca_poll->nfcid1_len = min_t(__u8, *data++, sizeof(nfca_poll->nfcid1));
+ 
+ 	nfc_dbg("sens_res 0x%x, nfcid1_len %d",
+ 		nfca_poll->sens_res,
+@@ -111,7 +111,7 @@ static int nci_rf_activate_nfca_passive_poll(struct nci_dev *ndev,
+ 
+ 	switch (ntf->rf_interface_type) {
+ 	case NCI_RF_INTERFACE_ISO_DEP:
+-		nfca_poll_iso_dep->rats_res_len = *data++;
++		nfca_poll_iso_dep->rats_res_len = min_t(__u8, *data++, 20);
+ 		if (nfca_poll_iso_dep->rats_res_len > 0) {
+ 			memcpy(nfca_poll_iso_dep->rats_res,
+ 				data,
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0006-ath9k-fix-dynamic-WEP-related-regression.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0006-ath9k-fix-dynamic-WEP-related-regression.patch
new file mode 100644
index 0000000..e8fe414
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0006-ath9k-fix-dynamic-WEP-related-regression.patch
@@ -0,0 +1,80 @@
+From 11f5e090b288e9e933c8b7790626db9a5beef760 Mon Sep 17 00:00:00 2001
+From: Felix Fietkau <nbd@openwrt.org>
+Date: Sat, 23 Jun 2012 19:23:31 +0200
+Subject: [PATCH 06/49] ath9k: fix dynamic WEP related regression
+
+commit bed3d9c0b71f9afbfec905cb6db3b9f16be29d4d upstream.
+
+commit 7a532fe7131216a02c81a6c1b1f8632da1195a58
+ath9k_hw: fix interpretation of the rx KeyMiss flag
+
+This commit used the rx key miss indication to detect packets that were
+passed from the hardware without being decrypted, however it seems that
+this bit is not only undefined in the static WEP case, but also for
+dynamically allocated WEP keys. This caused a regression when using
+WEP-LEAP.
+
+This patch fixes the regression by keeping track of which key indexes
+refer to CCMP keys and only using the key miss indication for those.
+
+Reported-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: Felix Fietkau <nbd@openwrt.org>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath.h        |    1 +
+ drivers/net/wireless/ath/ath9k/recv.c |    3 ++-
+ drivers/net/wireless/ath/key.c        |    4 ++++
+ 3 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
+index 0f9ee46..4cc4a8b 100644
+--- a/drivers/net/wireless/ath/ath.h
++++ b/drivers/net/wireless/ath/ath.h
+@@ -143,6 +143,7 @@ struct ath_common {
+ 	u32 keymax;
+ 	DECLARE_BITMAP(keymap, ATH_KEYMAX);
+ 	DECLARE_BITMAP(tkip_keymap, ATH_KEYMAX);
++	DECLARE_BITMAP(ccmp_keymap, ATH_KEYMAX);
+ 	enum ath_crypt_caps crypt_caps;
+ 
+ 	unsigned int clockrate;
+diff --git a/drivers/net/wireless/ath/ath9k/recv.c b/drivers/net/wireless/ath/ath9k/recv.c
+index 2f3aeac..e6d791c 100644
+--- a/drivers/net/wireless/ath/ath9k/recv.c
++++ b/drivers/net/wireless/ath/ath9k/recv.c
+@@ -829,7 +829,8 @@ static bool ath9k_rx_accept(struct ath_common *common,
+ 	 * descriptor does contain a valid key index. This has been observed
+ 	 * mostly with CCMP encryption.
+ 	 */
+-	if (rx_stats->rs_keyix == ATH9K_RXKEYIX_INVALID)
++	if (rx_stats->rs_keyix == ATH9K_RXKEYIX_INVALID ||
++	    !test_bit(rx_stats->rs_keyix, common->ccmp_keymap))
+ 		rx_stats->rs_status &= ~ATH9K_RXERR_KEYMISS;
+ 
+ 	if (!rx_stats->rs_datalen)
+diff --git a/drivers/net/wireless/ath/key.c b/drivers/net/wireless/ath/key.c
+index 4cf7c5e..1ec3fa5 100644
+--- a/drivers/net/wireless/ath/key.c
++++ b/drivers/net/wireless/ath/key.c
+@@ -556,6 +556,9 @@ int ath_key_config(struct ath_common *common,
+ 		return -EIO;
+ 
+ 	set_bit(idx, common->keymap);
++	if (key->cipher == WLAN_CIPHER_SUITE_CCMP)
++		set_bit(idx, common->ccmp_keymap);
++
+ 	if (key->cipher == WLAN_CIPHER_SUITE_TKIP) {
+ 		set_bit(idx + 64, common->keymap);
+ 		set_bit(idx, common->tkip_keymap);
+@@ -582,6 +585,7 @@ void ath_key_delete(struct ath_common *common, struct ieee80211_key_conf *key)
+ 		return;
+ 
+ 	clear_bit(key->hw_key_idx, common->keymap);
++	clear_bit(key->hw_key_idx, common->ccmp_keymap);
+ 	if (key->cipher != WLAN_CIPHER_SUITE_TKIP)
+ 		return;
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0007-NFC-Return-from-rawsock_release-when-sk-is-NULL.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0007-NFC-Return-from-rawsock_release-when-sk-is-NULL.patch
new file mode 100644
index 0000000..43801f4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0007-NFC-Return-from-rawsock_release-when-sk-is-NULL.patch
@@ -0,0 +1,107 @@
+From fd1f8dc4e31b8daeec0cb785256de7297a06e300 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Tue, 12 Jun 2012 00:47:58 +0200
+Subject: [PATCH 07/49] NFC: Return from rawsock_release when sk is NULL
+
+commit 03e934f620101ca2cfc9383bd76172dd3e1f8567 upstream.
+
+Sasha Levin reported following panic :
+
+[ 2136.383310] BUG: unable to handle kernel NULL pointer dereference at
+00000000000003b0
+[ 2136.384022] IP: [<ffffffff8114e400>] __lock_acquire+0xc0/0x4b0
+[ 2136.384022] PGD 131c4067 PUD 11c0c067 PMD 0
+[ 2136.388106] Oops: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
+[ 2136.388106] CPU 1
+[ 2136.388106] Pid: 24855, comm: trinity-child1 Tainted: G        W
+3.5.0-rc2-sasha-00015-g7b268f7 #374
+[ 2136.388106] RIP: 0010:[<ffffffff8114e400>]  [<ffffffff8114e400>]
+__lock_acquire+0xc0/0x4b0
+[ 2136.388106] RSP: 0018:ffff8800130b3ca8  EFLAGS: 00010046
+[ 2136.388106] RAX: 0000000000000086 RBX: ffff88001186b000 RCX:
+0000000000000000
+[ 2136.388106] RDX: 0000000000000000 RSI: 0000000000000000 RDI:
+0000000000000000
+[ 2136.388106] RBP: ffff8800130b3d08 R08: 0000000000000001 R09:
+0000000000000000
+[ 2136.388106] R10: 0000000000000000 R11: 0000000000000001 R12:
+0000000000000002
+[ 2136.388106] R13: 00000000000003b0 R14: 0000000000000000 R15:
+0000000000000000
+[ 2136.388106] FS:  00007fa5b1bd4700(0000) GS:ffff88001b800000(0000)
+knlGS:0000000000000000
+[ 2136.388106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+[ 2136.388106] CR2: 00000000000003b0 CR3: 0000000011d1f000 CR4:
+00000000000406e0
+[ 2136.388106] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
+0000000000000000
+[ 2136.388106] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7:
+0000000000000400
+[ 2136.388106] Process trinity-child1 (pid: 24855, threadinfo
+ffff8800130b2000, task ffff88001186b000)
+[ 2136.388106] Stack:
+[ 2136.388106]  ffff8800130b3cd8 ffffffff81121785 ffffffff81236774
+000080d000000001
+[ 2136.388106]  ffff88001b9d6c00 00000000001d6c00 ffffffff130b3d08
+ffff88001186b000
+[ 2136.388106]  0000000000000000 0000000000000002 0000000000000000
+0000000000000000
+[ 2136.388106] Call Trace:
+[ 2136.388106]  [<ffffffff81121785>] ? sched_clock_local+0x25/0x90
+[ 2136.388106]  [<ffffffff81236774>] ? get_empty_filp+0x74/0x220
+[ 2136.388106]  [<ffffffff8114e97a>] lock_acquire+0x18a/0x1e0
+[ 2136.388106]  [<ffffffff836b37df>] ? rawsock_release+0x4f/0xa0
+[ 2136.388106]  [<ffffffff837c0ef0>] _raw_write_lock_bh+0x40/0x80
+[ 2136.388106]  [<ffffffff836b37df>] ? rawsock_release+0x4f/0xa0
+[ 2136.388106]  [<ffffffff836b37df>] rawsock_release+0x4f/0xa0
+[ 2136.388106]  [<ffffffff8321cfe8>] sock_release+0x18/0x70
+[ 2136.388106]  [<ffffffff8321d069>] sock_close+0x29/0x30
+[ 2136.388106]  [<ffffffff81236bca>] __fput+0x11a/0x2c0
+[ 2136.388106]  [<ffffffff81236d85>] fput+0x15/0x20
+[ 2136.388106]  [<ffffffff8321de34>] sys_accept4+0x1b4/0x200
+[ 2136.388106]  [<ffffffff837c165c>] ? _raw_spin_unlock_irq+0x4c/0x80
+[ 2136.388106]  [<ffffffff837c1669>] ? _raw_spin_unlock_irq+0x59/0x80
+[ 2136.388106]  [<ffffffff837c2565>] ? sysret_check+0x22/0x5d
+[ 2136.388106]  [<ffffffff8321de8b>] sys_accept+0xb/0x10
+[ 2136.388106]  [<ffffffff837c2539>] system_call_fastpath+0x16/0x1b
+[ 2136.388106] Code: ec 04 00 0f 85 ea 03 00 00 be d5 0b 00 00 48 c7 c7
+8a c1 40 84 e8 b1 a5 f8 ff 31 c0 e9 d4 03 00 00 66 2e 0f 1f 84 00 00 00
+00 00 <49> 81 7d 00 60 73 5e 85 b8 01 00 00 00 44 0f 44 e0 83 fe 01 77
+[ 2136.388106] RIP  [<ffffffff8114e400>] __lock_acquire+0xc0/0x4b0
+[ 2136.388106]  RSP <ffff8800130b3ca8>
+[ 2136.388106] CR2: 00000000000003b0
+[ 2136.388106] ---[ end trace 6d450e935ee18982 ]---
+[ 2136.388106] Kernel panic - not syncing: Fatal exception in interrupt
+
+rawsock_release() should test if sock->sk is NULL before calling
+sock_orphan()/sock_put()
+
+Reported-by: Sasha Levin <levinsasha928@gmail.com>
+Tested-by: Sasha Levin <levinsasha928@gmail.com>
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
+[bwh: Backported to 3.2: keep using nfc_dbg(), not pr_debug()]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/nfc/rawsock.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/net/nfc/rawsock.c b/net/nfc/rawsock.c
+index ee7b2b3..7a167fc 100644
+--- a/net/nfc/rawsock.c
++++ b/net/nfc/rawsock.c
+@@ -52,7 +52,10 @@ static int rawsock_release(struct socket *sock)
+ {
+ 	struct sock *sk = sock->sk;
+ 
+-	nfc_dbg("sock=%p", sock);
++	nfc_dbg("sock=%p sk=%p", sock, sk);
++
++	if (!sk)
++		return 0;
+ 
+ 	sock_orphan(sk);
+ 	sock_put(sk);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0008-rtlwifi-rtl8192cu-New-USB-IDs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0008-rtlwifi-rtl8192cu-New-USB-IDs.patch
new file mode 100644
index 0000000..99f6f60
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0008-rtlwifi-rtl8192cu-New-USB-IDs.patch
@@ -0,0 +1,45 @@
+From a771eb7b20c60a73ec422943dd387fbca27cf94d Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Mon, 25 Jun 2012 18:01:12 -0500
+Subject: [PATCH 08/49] rtlwifi: rtl8192cu: New USB IDs
+
+commit f63d7dabd5da9ef41f28f6d69b29bc084db0ca5a upstream.
+
+The latest Realtek driver for the RTL8188CU and RTL8192CU chips adds three
+new USB IDs.
+
+Reported-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rtlwifi/rtl8192cu/sw.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192cu/sw.c b/drivers/net/wireless/rtlwifi/rtl8192cu/sw.c
+index 94a3e17..0302148 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192cu/sw.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192cu/sw.c
+@@ -311,9 +311,11 @@ static struct usb_device_id rtl8192c_usb_ids[] = {
+ 	{RTL_USB_DEVICE(0x07b8, 0x8188, rtl92cu_hal_cfg)}, /*Abocom - Abocom*/
+ 	{RTL_USB_DEVICE(0x07b8, 0x8189, rtl92cu_hal_cfg)}, /*Funai - Abocom*/
+ 	{RTL_USB_DEVICE(0x0846, 0x9041, rtl92cu_hal_cfg)}, /*NetGear WNA1000M*/
++	{RTL_USB_DEVICE(0x0bda, 0x5088, rtl92cu_hal_cfg)}, /*Thinkware-CC&C*/
+ 	{RTL_USB_DEVICE(0x0df6, 0x0052, rtl92cu_hal_cfg)}, /*Sitecom - Edimax*/
+ 	{RTL_USB_DEVICE(0x0df6, 0x005c, rtl92cu_hal_cfg)}, /*Sitecom - Edimax*/
+ 	{RTL_USB_DEVICE(0x0eb0, 0x9071, rtl92cu_hal_cfg)}, /*NO Brand - Etop*/
++	{RTL_USB_DEVICE(0x4856, 0x0091, rtl92cu_hal_cfg)}, /*NetweeN - Feixun*/
+ 	/* HP - Lite-On ,8188CUS Slim Combo */
+ 	{RTL_USB_DEVICE(0x103c, 0x1629, rtl92cu_hal_cfg)},
+ 	{RTL_USB_DEVICE(0x13d3, 0x3357, rtl92cu_hal_cfg)}, /* AzureWave */
+@@ -355,6 +357,7 @@ static struct usb_device_id rtl8192c_usb_ids[] = {
+ 	{RTL_USB_DEVICE(0x07b8, 0x8178, rtl92cu_hal_cfg)}, /*Funai -Abocom*/
+ 	{RTL_USB_DEVICE(0x0846, 0x9021, rtl92cu_hal_cfg)}, /*Netgear-Sercomm*/
+ 	{RTL_USB_DEVICE(0x0b05, 0x17ab, rtl92cu_hal_cfg)}, /*ASUS-Edimax*/
++	{RTL_USB_DEVICE(0x0bda, 0x8186, rtl92cu_hal_cfg)}, /*Realtek 92CE-VAU*/
+ 	{RTL_USB_DEVICE(0x0df6, 0x0061, rtl92cu_hal_cfg)}, /*Sitecom-Edimax*/
+ 	{RTL_USB_DEVICE(0x0e66, 0x0019, rtl92cu_hal_cfg)}, /*Hawking-Edimax*/
+ 	{RTL_USB_DEVICE(0x2001, 0x3307, rtl92cu_hal_cfg)}, /*D-Link-Cameo*/
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0009-ath9k-enable-serialize_regmode-for-non-PCIE-AR9287.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0009-ath9k-enable-serialize_regmode-for-non-PCIE-AR9287.patch
new file mode 100644
index 0000000..383dda2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0009-ath9k-enable-serialize_regmode-for-non-PCIE-AR9287.patch
@@ -0,0 +1,34 @@
+From f65b74252f667d75391a86a6dee82aefb0e9b983 Mon Sep 17 00:00:00 2001
+From: Panayiotis Karabassis <panayk@gmail.com>
+Date: Tue, 26 Jun 2012 23:37:17 +0300
+Subject: [PATCH 09/49] ath9k: enable serialize_regmode for non-PCIE AR9287
+
+commit 7508b657967cf664b5aa0f6367d05016e7e3bc2a upstream.
+
+https://bugzilla.kernel.org/show_bug.cgi?id=42903
+
+Based on the work of <fynivx@gmail.com>
+
+Signed-off-by: Panayiotis Karabassis <panayk@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath9k/hw.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
+index 6973620..7f97164 100644
+--- a/drivers/net/wireless/ath/ath9k/hw.c
++++ b/drivers/net/wireless/ath/ath9k/hw.c
+@@ -557,7 +557,7 @@ static int __ath9k_hw_init(struct ath_hw *ah)
+ 
+ 	if (ah->config.serialize_regmode == SER_REG_MODE_AUTO) {
+ 		if (ah->hw_version.macVersion == AR_SREV_VERSION_5416_PCI ||
+-		    ((AR_SREV_9160(ah) || AR_SREV_9280(ah)) &&
++		    ((AR_SREV_9160(ah) || AR_SREV_9280(ah) || AR_SREV_9287(ah)) &&
+ 		     !ah->is_pciexpress)) {
+ 			ah->config.serialize_regmode =
+ 				SER_REG_MODE_ON;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0010-mac80211-correct-behaviour-on-unrecognised-action-fr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0010-mac80211-correct-behaviour-on-unrecognised-action-fr.patch
new file mode 100644
index 0000000..3aafce8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0010-mac80211-correct-behaviour-on-unrecognised-action-fr.patch
@@ -0,0 +1,48 @@
+From 21cdc703702f7ffbf440dc29b68044ac13363078 Mon Sep 17 00:00:00 2001
+From: Johannes Berg <johannes.berg@intel.com>
+Date: Wed, 27 Jun 2012 15:38:56 +0200
+Subject: [PATCH 10/49] mac80211: correct behaviour on unrecognised action
+ frames
+
+commit 4b5ebccc40843104d980f0714bc86bfcd5568941 upstream.
+
+When receiving an "individually addressed" action frame, the
+receiver is required to return it to the sender. mac80211
+gets this wrong as it also returns group addressed (mcast)
+frames to the sender. Fix this and update the reference to
+the new 802.11 standards version since things were shuffled
+around significantly.
+
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/mac80211/rx.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
+index 064d20f..cda4875 100644
+--- a/net/mac80211/rx.c
++++ b/net/mac80211/rx.c
+@@ -2389,7 +2389,7 @@ ieee80211_rx_h_action_return(struct ieee80211_rx_data *rx)
+ 	 * frames that we didn't handle, including returning unknown
+ 	 * ones. For all other modes we will return them to the sender,
+ 	 * setting the 0x80 bit in the action category, as required by
+-	 * 802.11-2007 7.3.1.11.
++	 * 802.11-2012 9.24.4.
+ 	 * Newer versions of hostapd shall also use the management frame
+ 	 * registration mechanisms, but older ones still use cooked
+ 	 * monitor interfaces so push all frames there.
+@@ -2399,6 +2399,9 @@ ieee80211_rx_h_action_return(struct ieee80211_rx_data *rx)
+ 	     sdata->vif.type == NL80211_IFTYPE_AP_VLAN))
+ 		return RX_DROP_MONITOR;
+ 
++	if (is_multicast_ether_addr(mgmt->da))
++		return RX_DROP_MONITOR;
++
+ 	/* do not return rejected action frames */
+ 	if (mgmt->u.action.category & 0x80)
+ 		return RX_DROP_UNUSABLE;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0011-ASoC-tlv320aic3x-Fix-codec-pll-configure-bug.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0011-ASoC-tlv320aic3x-Fix-codec-pll-configure-bug.patch
new file mode 100644
index 0000000..29139a1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0011-ASoC-tlv320aic3x-Fix-codec-pll-configure-bug.patch
@@ -0,0 +1,62 @@
+From 8ba42ffb182648185f9f5f924d26cf97b6be721f Mon Sep 17 00:00:00 2001
+From: "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
+Date: Tue, 26 Jun 2012 19:25:11 +0530
+Subject: [PATCH 11/49] ASoC: tlv320aic3x: Fix codec pll configure bug
+
+commit c9fe573a6584034670c1a55ee8162d623519cbbf upstream.
+
+In sound/soc/codecs/tlv320aic3x.c
+
+        data = snd_soc_read(codec, AIC3X_PLL_PROGA_REG);
+        snd_soc_write(codec, AIC3X_PLL_PROGA_REG,
+                      data | (pll_p << PLLP_SHIFT));
+
+In the above code, pll-p value is OR'ed with previous value without
+clearing it. Bug is not seen if pll-p value doesn't change across
+Sampling frequency.
+
+However on some platforms (like AM335x EVM-SK), pll-p may have different
+values across different sampling frequencies. In such case, above code
+configures the pll with a wrong value.
+Because of this bug, when a audio stream is played with pll value
+different from previous stream, audio is heard as differently(like its
+stretched).
+
+Signed-off-by: Hebbar, Gururaja <gururaja.hebbar@ti.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/soc/codecs/tlv320aic3x.c |    4 +---
+ sound/soc/codecs/tlv320aic3x.h |    1 +
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
+index d0dbac1..cdb473c 100644
+--- a/sound/soc/codecs/tlv320aic3x.c
++++ b/sound/soc/codecs/tlv320aic3x.c
+@@ -963,9 +963,7 @@ static int aic3x_hw_params(struct snd_pcm_substream *substream,
+ 	}
+ 
+ found:
+-	data = snd_soc_read(codec, AIC3X_PLL_PROGA_REG);
+-	snd_soc_write(codec, AIC3X_PLL_PROGA_REG,
+-		      data | (pll_p << PLLP_SHIFT));
++	snd_soc_update_bits(codec, AIC3X_PLL_PROGA_REG, PLLP_MASK, pll_p);
+ 	snd_soc_write(codec, AIC3X_OVRF_STATUS_AND_PLLR_REG,
+ 		      pll_r << PLLR_SHIFT);
+ 	snd_soc_write(codec, AIC3X_PLL_PROGB_REG, pll_j << PLLJ_SHIFT);
+diff --git a/sound/soc/codecs/tlv320aic3x.h b/sound/soc/codecs/tlv320aic3x.h
+index 06a1978..16d9999 100644
+--- a/sound/soc/codecs/tlv320aic3x.h
++++ b/sound/soc/codecs/tlv320aic3x.h
+@@ -166,6 +166,7 @@
+ 
+ /* PLL registers bitfields */
+ #define PLLP_SHIFT		0
++#define PLLP_MASK		7
+ #define PLLQ_SHIFT		3
+ #define PLLR_SHIFT		0
+ #define PLLJ_SHIFT		2
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0012-powerpc-xmon-Use-cpumask-iterator-to-avoid-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0012-powerpc-xmon-Use-cpumask-iterator-to-avoid-warning.patch
new file mode 100644
index 0000000..217ab5d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0012-powerpc-xmon-Use-cpumask-iterator-to-avoid-warning.patch
@@ -0,0 +1,56 @@
+From 6d7506b0391c86ac347dce94f2c4642ce126cf45 Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@samba.org>
+Date: Thu, 28 Jun 2012 19:28:57 +0000
+Subject: [PATCH 12/49] powerpc/xmon: Use cpumask iterator to avoid warning
+
+commit bc1d7702910c7c7e88eb60b58429dbfe293683ce upstream.
+
+We have a bug report where the kernel hits a warning in the cpumask
+code:
+
+WARNING: at include/linux/cpumask.h:107
+
+Which is:
+        WARN_ON_ONCE(cpu >= nr_cpumask_bits);
+
+The backtrace is:
+        cpu_cmd
+        cmds
+        xmon_core
+        xmon
+        die
+
+xmon is iterating through 0 to NR_CPUS. I'm not sure why we are still
+open coding this but iterating above nr_cpu_ids is definitely a bug.
+
+This patch iterates through all possible cpus, in case we issue a
+system reset and CPUs in an offline state call in.
+
+Perhaps the old code was trying to handle CPUs that were in the
+partition but were never started (eg kexec into a kernel with an
+nr_cpus= boot option). They are going to die way before we get into
+xmon since we haven't set any kernel state up for them.
+
+Signed-off-by: Anton Blanchard <anton@samba.org>
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/powerpc/xmon/xmon.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
+index 03a217a..b7e63d8 100644
+--- a/arch/powerpc/xmon/xmon.c
++++ b/arch/powerpc/xmon/xmon.c
+@@ -975,7 +975,7 @@ static int cpu_cmd(void)
+ 		/* print cpus waiting or in xmon */
+ 		printf("cpus stopped:");
+ 		count = 0;
+-		for (cpu = 0; cpu < NR_CPUS; ++cpu) {
++		for_each_possible_cpu(cpu) {
+ 			if (cpumask_test_cpu(cpu, &cpus_in_xmon)) {
+ 				if (count == 0)
+ 					printf(" %x", cpu);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0013-powerpc-kvm-sldi-should-be-sld.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0013-powerpc-kvm-sldi-should-be-sld.patch
new file mode 100644
index 0000000..9f77ca5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0013-powerpc-kvm-sldi-should-be-sld.patch
@@ -0,0 +1,40 @@
+From af803001738a2e5609dbbe767f8f7a61bef3cf9c Mon Sep 17 00:00:00 2001
+From: Michael Neuling <mikey@neuling.org>
+Date: Mon, 25 Jun 2012 13:33:11 +0000
+Subject: [PATCH 13/49] powerpc/kvm: sldi should be sld
+
+commit 2f584a146a2965b82fce89b8d2f95dc5cfe468d0 upstream.
+
+Since we are taking a registers, this should never have been an sldi.
+Talking to paulus offline, this is the correct fix.
+
+Was introduced by:
+ commit 19ccb76a1938ab364a412253daec64613acbf3df
+ Author: Paul Mackerras <paulus@samba.org>
+ Date:   Sat Jul 23 17:42:46 2011 +1000
+
+Talking to paulus, this shouldn't be a literal.
+
+Signed-off-by: Michael Neuling <mikey@neuling.org>
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/powerpc/kvm/book3s_hv_rmhandlers.S |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+index 44d8829..5e8dc08 100644
+--- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
++++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
+@@ -763,7 +763,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_201)
+ 	lwz	r3,VCORE_NAPPING_THREADS(r5)
+ 	lwz	r4,VCPU_PTID(r9)
+ 	li	r0,1
+-	sldi	r0,r0,r4
++	sld	r0,r0,r4
+ 	andc.	r3,r3,r0		/* no sense IPI'ing ourselves */
+ 	beq	43f
+ 	mulli	r4,r4,PACA_SIZE		/* get paca for thread 0 */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0014-md-raid10-Don-t-try-to-recovery-unmatched-and-unused.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0014-md-raid10-Don-t-try-to-recovery-unmatched-and-unused.patch
new file mode 100644
index 0000000..e6c64f5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0014-md-raid10-Don-t-try-to-recovery-unmatched-and-unused.patch
@@ -0,0 +1,50 @@
+From 8002ce8e1b7a0ef6b60567ed63ed12fe6780b98a Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Tue, 3 Jul 2012 10:37:30 +1000
+Subject: [PATCH 14/49] md/raid10: Don't try to recovery unmatched (and
+ unused) chunks.
+
+commit fc448a18ae6219af9a73257b1fbcd009efab4a81 upstream.
+
+If a RAID10 has an odd number of chunks - as might happen when there
+are an odd number of devices - the last chunk has no pair and so is
+not mirrored.  We don't store data there, but when recovering the last
+device in an array we retry to recover that last chunk from a
+non-existent location.  This results in an error, and the recovery
+aborts.
+
+When we get to that last chunk we should just stop - there is nothing
+more to do anyway.
+
+This bug has been present since the introduction of RAID10, so the
+patch is appropriate for any -stable kernel.
+
+Reported-by: Christian Balzer <chibi@gol.com>
+Tested-by: Christian Balzer <chibi@gol.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid10.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
+index b219449..3b67566 100644
+--- a/drivers/md/raid10.c
++++ b/drivers/md/raid10.c
+@@ -2436,6 +2436,12 @@ static sector_t sync_request(struct mddev *mddev, sector_t sector_nr,
+ 			/* want to reconstruct this device */
+ 			rb2 = r10_bio;
+ 			sect = raid10_find_virt(conf, sector_nr, i);
++			if (sect >= mddev->resync_max_sectors) {
++				/* last stripe is not complete - don't
++				 * try to recover this sector.
++				 */
++				continue;
++			}
+ 			/* Unless we are doing a full sync, we only need
+ 			 * to recover the block if it is set in the bitmap
+ 			 */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0015-md-raid5-Do-not-add-data_offset-before-call-to-is_ba.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0015-md-raid5-Do-not-add-data_offset-before-call-to-is_ba.patch
new file mode 100644
index 0000000..953b3b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0015-md-raid5-Do-not-add-data_offset-before-call-to-is_ba.patch
@@ -0,0 +1,54 @@
+From 2afec61845b4c0bed64c257a0acc2612e1862885 Mon Sep 17 00:00:00 2001
+From: majianpeng <majianpeng@gmail.com>
+Date: Tue, 12 Jun 2012 08:31:10 +0800
+Subject: [PATCH 15/49] md/raid5: Do not add data_offset before call to
+ is_badblock
+
+commit 6c0544e255dd6582a9899572e120fb55d9f672a4 upstream.
+
+In chunk_aligned_read() we are adding data_offset before calling
+is_badblock.  But is_badblock also adds data_offset, so that is bad.
+
+So move the addition of data_offset to after the call to
+is_badblock.
+
+This bug was introduced by commit 31c176ecdf3563140e639
+     md/raid5: avoid reading from known bad blocks.
+which first appeared in 3.0.  So that patch is suitable for any
+-stable kernel from 3.0.y onwards.  However it will need minor
+revision for most of those (as the comment didn't appear until
+recently).
+
+Signed-off-by: majianpeng <majianpeng@gmail.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+[bwh: Backported to 3.2: ignored missing comment]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid5.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
+index 858fdbb..d423c7e 100644
+--- a/drivers/md/raid5.c
++++ b/drivers/md/raid5.c
+@@ -3621,7 +3621,6 @@ static int chunk_aligned_read(struct mddev *mddev, struct bio * raid_bio)
+ 		raid_bio->bi_next = (void*)rdev;
+ 		align_bi->bi_bdev =  rdev->bdev;
+ 		align_bi->bi_flags &= ~(1 << BIO_SEG_VALID);
+-		align_bi->bi_sector += rdev->data_offset;
+ 
+ 		if (!bio_fits_rdev(align_bi) ||
+ 		    is_badblock(rdev, align_bi->bi_sector, align_bi->bi_size>>9,
+@@ -3632,6 +3631,9 @@ static int chunk_aligned_read(struct mddev *mddev, struct bio * raid_bio)
+ 			return 0;
+ 		}
+ 
++		/* No reshape active, so we can trust rdev->data_offset */
++		align_bi->bi_sector += rdev->data_offset;
++
+ 		spin_lock_irq(&conf->device_lock);
+ 		wait_event_lock_irq(conf->wait_for_stripe,
+ 				    conf->quiesce == 0,
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0016-md-raid5-In-ops_run_io-inc-nr_pending-before-calling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0016-md-raid5-In-ops_run_io-inc-nr_pending-before-calling.patch
new file mode 100644
index 0000000..493b6be
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0016-md-raid5-In-ops_run_io-inc-nr_pending-before-calling.patch
@@ -0,0 +1,45 @@
+From 1e6a8f24c1ff905a8bae6dd5222bc128eb60f886 Mon Sep 17 00:00:00 2001
+From: majianpeng <majianpeng@gmail.com>
+Date: Tue, 3 Jul 2012 12:11:54 +1000
+Subject: [PATCH 16/49] md/raid5: In ops_run_io, inc nr_pending before calling
+ md_wait_for_blocked_rdev
+
+commit 1850753d2e6d9ca7856581ca5d3cf09521e6a5d7 upstream.
+
+In ops_run_io(), the call to md_wait_for_blocked_rdev will decrement
+nr_pending so we lose the reference we hold on the rdev.
+So atomic_inc it first to maintain the reference.
+
+This bug was introduced by commit  73e92e51b7969ef5477d
+    md/raid5.  Don't write to known bad block on doubtful devices.
+
+which appeared in 3.0, so patch is suitable for stable kernels since
+then.
+
+Signed-off-by: majianpeng <majianpeng@gmail.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid5.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
+index d423c7e..6ba4954 100644
+--- a/drivers/md/raid5.c
++++ b/drivers/md/raid5.c
+@@ -542,6 +542,12 @@ static void ops_run_io(struct stripe_head *sh, struct stripe_head_state *s)
+ 					 * a chance*/
+ 					md_check_recovery(conf->mddev);
+ 				}
++				/*
++				 * Because md_wait_for_blocked_rdev
++				 * will dec nr_pending, we must
++				 * increment it first.
++				 */
++				atomic_inc(&rdev->nr_pending);
+ 				md_wait_for_blocked_rdev(rdev, conf->mddev);
+ 			} else {
+ 				/* Acknowledged bad block - skip the write */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0017-md-raid10-fix-failure-when-trying-to-repair-a-read-e.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0017-md-raid10-fix-failure-when-trying-to-repair-a-read-e.patch
new file mode 100644
index 0000000..1f96efa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0017-md-raid10-fix-failure-when-trying-to-repair-a-read-e.patch
@@ -0,0 +1,61 @@
+From 4c1df6ee8b798576a23b25ab391cd7f3b5835bcd Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Tue, 3 Jul 2012 15:55:33 +1000
+Subject: [PATCH 17/49] md/raid10: fix failure when trying to repair a read
+ error.
+
+commit 055d3747dbf00ce85c6872ecca4d466638e80c22 upstream.
+
+commit 58c54fcca3bac5bf9290cfed31c76e4c4bfbabaf
+     md/raid10: handle further errors during fix_read_error better.
+
+in 3.1 added "r10_sync_page_io" which takes an IO size in sectors.
+But we were passing the IO size in bytes!!!
+This resulting in bio_add_page failing, and empty request being sent
+down, and a consequent BUG_ON in scsi_lib.
+
+[fix missing space in error message at same time]
+
+This fix is suitable for 3.1.y and later.
+
+Reported-by: Christian Balzer <chibi@gol.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid10.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
+index 3b67566..7a9eef6 100644
+--- a/drivers/md/raid10.c
++++ b/drivers/md/raid10.c
+@@ -1919,7 +1919,7 @@ static void fix_read_error(struct r10conf *conf, struct mddev *mddev, struct r10
+ 			if (r10_sync_page_io(rdev,
+ 					     r10_bio->devs[sl].addr +
+ 					     sect,
+-					     s<<9, conf->tmppage, WRITE)
++					     s, conf->tmppage, WRITE)
+ 			    == 0) {
+ 				/* Well, this device is dead */
+ 				printk(KERN_NOTICE
+@@ -1956,7 +1956,7 @@ static void fix_read_error(struct r10conf *conf, struct mddev *mddev, struct r10
+ 			switch (r10_sync_page_io(rdev,
+ 					     r10_bio->devs[sl].addr +
+ 					     sect,
+-					     s<<9, conf->tmppage,
++					     s, conf->tmppage,
+ 						 READ)) {
+ 			case 0:
+ 				/* Well, this device is dead */
+@@ -2119,7 +2119,7 @@ read_more:
+ 	rdev = conf->mirrors[mirror].rdev;
+ 	printk_ratelimited(
+ 		KERN_ERR
+-		"md/raid10:%s: %s: redirecting"
++		"md/raid10:%s: %s: redirecting "
+ 		"sector %llu to another mirror\n",
+ 		mdname(mddev),
+ 		bdevname(rdev->bdev, b),
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0018-drm-i915-kick-any-firmware-framebuffers-before-claim.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0018-drm-i915-kick-any-firmware-framebuffers-before-claim.patch
new file mode 100644
index 0000000..ab9e976
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0018-drm-i915-kick-any-firmware-framebuffers-before-claim.patch
@@ -0,0 +1,118 @@
+From 3426f0a75320d87b4fd5a63263ff4f1a7574fd90 Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Sun, 1 Jul 2012 17:09:42 +0200
+Subject: [PATCH 18/49] drm/i915: kick any firmware framebuffers before
+ claiming the gtt
+
+commit 9f846a16d213523fbe6daea17e20df6b8ac5a1e5 upstream.
+
+Especially vesafb likes to map everything as uc- (yikes), and if that
+mapping hangs around still while we try to map the gtt as wc the
+kernel will downgrade our request to uc-, resulting in abyssal
+performance.
+
+Unfortunately we can't do this as early as readon does (i.e. as the
+first thing we do when initializing the hw) because our fb/mmio space
+region moves around on a per-gen basis. So I've had to move it below
+the gtt initialization, but that seems to work, too. The important
+thing is that we do this before we set up the gtt wc mapping.
+
+Now an altogether different question is why people compile their
+kernels with vesafb enabled, but I guess making things just work isn't
+bad per se ...
+
+v2:
+- s/radeondrmfb/inteldrmfb/
+- fix up error handling
+
+v3: Kill #ifdef X86, this is Intel after all. Noticed by Ben Widawsky.
+
+v4: Jani Nikula complained about the pointless bool primary
+initialization.
+
+v5: Don't oops if we can't allocate, noticed by Chris Wilson.
+
+v6: Resolve conflicts with agp rework and fixup whitespace.
+
+This is commit e188719a2891f01b3100d in drm-next.
+
+Backport to 3.5 -fixes queue requested by Dave Airlie - due to grub
+using vesa on fedora their initrd seems to load vesafb before loading
+the real kms driver. So tons more people actually experience a
+dead-slow gpu. Hence also the Cc: stable.
+
+Reported-and-tested-by: "Kilarski, Bernard R" <bernard.r.kilarski@intel.com>
+Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/i915_dma.c |   37 ++++++++++++++++++++++++++++++-------
+ 1 file changed, 30 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
+index c4da951..ca67338 100644
+--- a/drivers/gpu/drm/i915/i915_dma.c
++++ b/drivers/gpu/drm/i915/i915_dma.c
+@@ -1890,6 +1890,27 @@ ips_ping_for_i915_load(void)
+ 	}
+ }
+ 
++static void i915_kick_out_firmware_fb(struct drm_i915_private *dev_priv)
++{
++	struct apertures_struct *ap;
++	struct pci_dev *pdev = dev_priv->dev->pdev;
++	bool primary;
++
++	ap = alloc_apertures(1);
++	if (!ap)
++		return;
++
++	ap->ranges[0].base = dev_priv->dev->agp->base;
++	ap->ranges[0].size =
++		dev_priv->mm.gtt->gtt_mappable_entries << PAGE_SHIFT;
++	primary =
++		pdev->resource[PCI_ROM_RESOURCE].flags & IORESOURCE_ROM_SHADOW;
++
++	remove_conflicting_framebuffers(ap, "inteldrmfb", primary);
++
++	kfree(ap);
++}
++
+ /**
+  * i915_driver_load - setup chip and create an initial config
+  * @dev: DRM device
+@@ -1927,6 +1948,15 @@ int i915_driver_load(struct drm_device *dev, unsigned long flags)
+ 		goto free_priv;
+ 	}
+ 
++	dev_priv->mm.gtt = intel_gtt_get();
++	if (!dev_priv->mm.gtt) {
++		DRM_ERROR("Failed to initialize GTT\n");
++		ret = -ENODEV;
++		goto put_bridge;
++	}
++
++	i915_kick_out_firmware_fb(dev_priv);
++
+ 	/* overlay on gen2 is broken and can't address above 1G */
+ 	if (IS_GEN2(dev))
+ 		dma_set_coherent_mask(&dev->pdev->dev, DMA_BIT_MASK(30));
+@@ -1950,13 +1980,6 @@ int i915_driver_load(struct drm_device *dev, unsigned long flags)
+ 		goto put_bridge;
+ 	}
+ 
+-	dev_priv->mm.gtt = intel_gtt_get();
+-	if (!dev_priv->mm.gtt) {
+-		DRM_ERROR("Failed to initialize GTT\n");
+-		ret = -ENODEV;
+-		goto out_rmmap;
+-	}
+-
+ 	agp_size = dev_priv->mm.gtt->gtt_mappable_entries << PAGE_SHIFT;
+ 
+ 	dev_priv->mm.gtt_mapping =
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0019-dm-persistent-data-fix-shadow_info_leak-on-dm_tm_des.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0019-dm-persistent-data-fix-shadow_info_leak-on-dm_tm_des.patch
new file mode 100644
index 0000000..9ac2fb5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0019-dm-persistent-data-fix-shadow_info_leak-on-dm_tm_des.patch
@@ -0,0 +1,37 @@
+From 97bbf28874e2f7467c0d05db53041e556488087a Mon Sep 17 00:00:00 2001
+From: Mike Snitzer <snitzer@redhat.com>
+Date: Tue, 3 Jul 2012 12:55:33 +0100
+Subject: [PATCH 19/49] dm persistent data: fix shadow_info_leak on
+ dm_tm_destroy
+
+commit 25d7cd6faa7ae6ed2565617c3ee2500ccb8a9f7f upstream.
+
+Cleanup the shadow table before destroying the transaction manager.
+
+Reference: leak was identified with kmemleak when running
+test_discard_random_sectors in the thinp-test-suite.
+
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/persistent-data/dm-transaction-manager.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/drivers/md/persistent-data/dm-transaction-manager.c b/drivers/md/persistent-data/dm-transaction-manager.c
+index 6f8d387..e5902d1 100644
+--- a/drivers/md/persistent-data/dm-transaction-manager.c
++++ b/drivers/md/persistent-data/dm-transaction-manager.c
+@@ -138,6 +138,9 @@ EXPORT_SYMBOL_GPL(dm_tm_create_non_blocking_clone);
+ 
+ void dm_tm_destroy(struct dm_transaction_manager *tm)
+ {
++	if (!tm->is_clone)
++		wipe_shadow_table(tm);
++
+ 	kfree(tm);
+ }
+ EXPORT_SYMBOL_GPL(dm_tm_destroy);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0020-dm-persistent-data-handle-space-map-checker-creation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0020-dm-persistent-data-handle-space-map-checker-creation.patch
new file mode 100644
index 0000000..f186538
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0020-dm-persistent-data-handle-space-map-checker-creation.patch
@@ -0,0 +1,182 @@
+From 5ac62b535b410eb5bfbb5457703fd42f5b517088 Mon Sep 17 00:00:00 2001
+From: Mike Snitzer <snitzer@redhat.com>
+Date: Tue, 3 Jul 2012 12:55:35 +0100
+Subject: [PATCH 20/49] dm persistent data: handle space map checker creation
+ failure
+
+commit 62662303e7f590fdfbb0070ab820a0ad4267c119 upstream.
+
+If CONFIG_DM_DEBUG_SPACE_MAPS is enabled and dm_sm_checker_create()
+fails, dm_tm_create_internal() would still return success even though it
+cleaned up all resources it was supposed to have created.  This will
+lead to a kernel crash:
+
+general protection fault: 0000 [#1] SMP DEBUG_PAGEALLOC
+...
+RIP: 0010:[<ffffffff81593659>]  [<ffffffff81593659>] dm_bufio_get_block_size+0x9/0x20
+Call Trace:
+  [<ffffffff81599bae>] dm_bm_block_size+0xe/0x10
+  [<ffffffff8159b8b8>] sm_ll_init+0x78/0xd0
+  [<ffffffff8159c1a6>] sm_ll_new_disk+0x16/0xa0
+  [<ffffffff8159c98e>] dm_sm_disk_create+0xfe/0x160
+  [<ffffffff815abf6e>] dm_pool_metadata_open+0x16e/0x6a0
+  [<ffffffff815aa010>] pool_ctr+0x3f0/0x900
+  [<ffffffff8158d565>] dm_table_add_target+0x195/0x450
+  [<ffffffff815904c4>] table_load+0xe4/0x330
+  [<ffffffff815917ea>] ctl_ioctl+0x15a/0x2c0
+  [<ffffffff81591963>] dm_ctl_ioctl+0x13/0x20
+  [<ffffffff8116a4f8>] do_vfs_ioctl+0x98/0x560
+  [<ffffffff8116aa51>] sys_ioctl+0x91/0xa0
+  [<ffffffff81869f52>] system_call_fastpath+0x16/0x1b
+
+Fix the space map checker code to return an appropriate ERR_PTR and have
+dm_sm_disk_create() and dm_tm_create_internal() check for it with
+IS_ERR.
+
+Reported-by: Vivek Goyal <vgoyal@redhat.com>
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/persistent-data/dm-space-map-checker.c  |   24 ++++++++++----------
+ drivers/md/persistent-data/dm-space-map-disk.c     |   11 ++++++++-
+ .../md/persistent-data/dm-transaction-manager.c    |    8 +++++--
+ 3 files changed, 28 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/md/persistent-data/dm-space-map-checker.c b/drivers/md/persistent-data/dm-space-map-checker.c
+index 50ed53b..6d7c832 100644
+--- a/drivers/md/persistent-data/dm-space-map-checker.c
++++ b/drivers/md/persistent-data/dm-space-map-checker.c
+@@ -343,25 +343,25 @@ struct dm_space_map *dm_sm_checker_create(struct dm_space_map *sm)
+ 	int r;
+ 	struct sm_checker *smc;
+ 
+-	if (!sm)
+-		return NULL;
++	if (IS_ERR_OR_NULL(sm))
++		return ERR_PTR(-EINVAL);
+ 
+ 	smc = kmalloc(sizeof(*smc), GFP_KERNEL);
+ 	if (!smc)
+-		return NULL;
++		return ERR_PTR(-ENOMEM);
+ 
+ 	memcpy(&smc->sm, &ops_, sizeof(smc->sm));
+ 	r = ca_create(&smc->old_counts, sm);
+ 	if (r) {
+ 		kfree(smc);
+-		return NULL;
++		return ERR_PTR(r);
+ 	}
+ 
+ 	r = ca_create(&smc->counts, sm);
+ 	if (r) {
+ 		ca_destroy(&smc->old_counts);
+ 		kfree(smc);
+-		return NULL;
++		return ERR_PTR(r);
+ 	}
+ 
+ 	smc->real_sm = sm;
+@@ -371,7 +371,7 @@ struct dm_space_map *dm_sm_checker_create(struct dm_space_map *sm)
+ 		ca_destroy(&smc->counts);
+ 		ca_destroy(&smc->old_counts);
+ 		kfree(smc);
+-		return NULL;
++		return ERR_PTR(r);
+ 	}
+ 
+ 	r = ca_commit(&smc->old_counts, &smc->counts);
+@@ -379,7 +379,7 @@ struct dm_space_map *dm_sm_checker_create(struct dm_space_map *sm)
+ 		ca_destroy(&smc->counts);
+ 		ca_destroy(&smc->old_counts);
+ 		kfree(smc);
+-		return NULL;
++		return ERR_PTR(r);
+ 	}
+ 
+ 	return &smc->sm;
+@@ -391,25 +391,25 @@ struct dm_space_map *dm_sm_checker_create_fresh(struct dm_space_map *sm)
+ 	int r;
+ 	struct sm_checker *smc;
+ 
+-	if (!sm)
+-		return NULL;
++	if (IS_ERR_OR_NULL(sm))
++		return ERR_PTR(-EINVAL);
+ 
+ 	smc = kmalloc(sizeof(*smc), GFP_KERNEL);
+ 	if (!smc)
+-		return NULL;
++		return ERR_PTR(-ENOMEM);
+ 
+ 	memcpy(&smc->sm, &ops_, sizeof(smc->sm));
+ 	r = ca_create(&smc->old_counts, sm);
+ 	if (r) {
+ 		kfree(smc);
+-		return NULL;
++		return ERR_PTR(r);
+ 	}
+ 
+ 	r = ca_create(&smc->counts, sm);
+ 	if (r) {
+ 		ca_destroy(&smc->old_counts);
+ 		kfree(smc);
+-		return NULL;
++		return ERR_PTR(r);
+ 	}
+ 
+ 	smc->real_sm = sm;
+diff --git a/drivers/md/persistent-data/dm-space-map-disk.c b/drivers/md/persistent-data/dm-space-map-disk.c
+index fc469ba..3d0ed53 100644
+--- a/drivers/md/persistent-data/dm-space-map-disk.c
++++ b/drivers/md/persistent-data/dm-space-map-disk.c
+@@ -290,7 +290,16 @@ struct dm_space_map *dm_sm_disk_create(struct dm_transaction_manager *tm,
+ 				       dm_block_t nr_blocks)
+ {
+ 	struct dm_space_map *sm = dm_sm_disk_create_real(tm, nr_blocks);
+-	return dm_sm_checker_create_fresh(sm);
++	struct dm_space_map *smc;
++
++	if (IS_ERR_OR_NULL(sm))
++		return sm;
++
++	smc = dm_sm_checker_create_fresh(sm);
++	if (IS_ERR(smc))
++		dm_sm_destroy(sm);
++
++	return smc;
+ }
+ EXPORT_SYMBOL_GPL(dm_sm_disk_create);
+ 
+diff --git a/drivers/md/persistent-data/dm-transaction-manager.c b/drivers/md/persistent-data/dm-transaction-manager.c
+index e5902d1..ba54aac 100644
+--- a/drivers/md/persistent-data/dm-transaction-manager.c
++++ b/drivers/md/persistent-data/dm-transaction-manager.c
+@@ -345,8 +345,10 @@ static int dm_tm_create_internal(struct dm_block_manager *bm,
+ 		}
+ 
+ 		*sm = dm_sm_checker_create(inner);
+-		if (!*sm)
++		if (IS_ERR(*sm)) {
++			r = PTR_ERR(*sm);
+ 			goto bad2;
++		}
+ 
+ 	} else {
+ 		r = dm_bm_write_lock(dm_tm_get_bm(*tm), sb_location,
+@@ -365,8 +367,10 @@ static int dm_tm_create_internal(struct dm_block_manager *bm,
+ 		}
+ 
+ 		*sm = dm_sm_checker_create(inner);
+-		if (!*sm)
++		if (IS_ERR(*sm)) {
++			r = PTR_ERR(*sm);
+ 			goto bad2;
++		}
+ 	}
+ 
+ 	return 0;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0021-dm-persistent-data-fix-allocation-failure-in-space-m.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0021-dm-persistent-data-fix-allocation-failure-in-space-m.patch
new file mode 100644
index 0000000..b8121c8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0021-dm-persistent-data-fix-allocation-failure-in-space-m.patch
@@ -0,0 +1,95 @@
+From d93e7e98bbff07495ac95fd10c02c2e0d5392079 Mon Sep 17 00:00:00 2001
+From: Mike Snitzer <snitzer@redhat.com>
+Date: Tue, 3 Jul 2012 12:55:37 +0100
+Subject: [PATCH 21/49] dm persistent data: fix allocation failure in space
+ map checker init
+
+commit b0239faaf87c38bb419c9264bf20817438ddc3a9 upstream.
+
+If CONFIG_DM_DEBUG_SPACE_MAPS is enabled and memory is fragmented and a
+sufficiently-large metadata device is used in a thin pool then the space
+map checker will fail to allocate the memory it requires.
+
+Switch from kmalloc to vmalloc to allow larger virtually contiguous
+allocations for the space map checker's internal count arrays.
+
+Reported-by: Vivek Goyal <vgoyal@redhat.com>
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/persistent-data/dm-space-map-checker.c |   30 +++++++++++++--------
+ 1 file changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/md/persistent-data/dm-space-map-checker.c b/drivers/md/persistent-data/dm-space-map-checker.c
+index 6d7c832..fc90c11 100644
+--- a/drivers/md/persistent-data/dm-space-map-checker.c
++++ b/drivers/md/persistent-data/dm-space-map-checker.c
+@@ -8,6 +8,7 @@
+ 
+ #include <linux/device-mapper.h>
+ #include <linux/export.h>
++#include <linux/vmalloc.h>
+ 
+ #ifdef CONFIG_DM_DEBUG_SPACE_MAPS
+ 
+@@ -89,13 +90,23 @@ static int ca_create(struct count_array *ca, struct dm_space_map *sm)
+ 
+ 	ca->nr = nr_blocks;
+ 	ca->nr_free = nr_blocks;
+-	ca->counts = kzalloc(sizeof(*ca->counts) * nr_blocks, GFP_KERNEL);
+-	if (!ca->counts)
+-		return -ENOMEM;
++
++	if (!nr_blocks)
++		ca->counts = NULL;
++	else {
++		ca->counts = vzalloc(sizeof(*ca->counts) * nr_blocks);
++		if (!ca->counts)
++			return -ENOMEM;
++	}
+ 
+ 	return 0;
+ }
+ 
++static void ca_destroy(struct count_array *ca)
++{
++	vfree(ca->counts);
++}
++
+ static int ca_load(struct count_array *ca, struct dm_space_map *sm)
+ {
+ 	int r;
+@@ -126,12 +137,14 @@ static int ca_load(struct count_array *ca, struct dm_space_map *sm)
+ static int ca_extend(struct count_array *ca, dm_block_t extra_blocks)
+ {
+ 	dm_block_t nr_blocks = ca->nr + extra_blocks;
+-	uint32_t *counts = kzalloc(sizeof(*counts) * nr_blocks, GFP_KERNEL);
++	uint32_t *counts = vzalloc(sizeof(*counts) * nr_blocks);
+ 	if (!counts)
+ 		return -ENOMEM;
+ 
+-	memcpy(counts, ca->counts, sizeof(*counts) * ca->nr);
+-	kfree(ca->counts);
++	if (ca->counts) {
++		memcpy(counts, ca->counts, sizeof(*counts) * ca->nr);
++		ca_destroy(ca);
++	}
+ 	ca->nr = nr_blocks;
+ 	ca->nr_free += extra_blocks;
+ 	ca->counts = counts;
+@@ -151,11 +164,6 @@ static int ca_commit(struct count_array *old, struct count_array *new)
+ 	return 0;
+ }
+ 
+-static void ca_destroy(struct count_array *ca)
+-{
+-	kfree(ca->counts);
+-}
+-
+ /*----------------------------------------------------------------*/
+ 
+ struct sm_checker {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0022-ALSA-hda-Fix-power-map-regression-for-HP-dv6-co.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0022-ALSA-hda-Fix-power-map-regression-for-HP-dv6-co.patch
new file mode 100644
index 0000000..3b85ba7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0022-ALSA-hda-Fix-power-map-regression-for-HP-dv6-co.patch
@@ -0,0 +1,49 @@
+From 6411ef218c12f6719597631d388f2b13945a5251 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Tue, 26 Jun 2012 17:35:10 +0200
+Subject: [PATCH 22/49] ALSA: hda - Fix power-map regression for HP dv6 & co
+
+commit 6e1c39c6b00d9141a82c231ba7c5e5b1716974b2 upstream.
+
+The recent fix for power-map controls (commit b0791dda813) caused
+regressions on some other HP laptops.  They have fixed pins but these
+pins are exposed as jack-detectable.  Thus the driver tries to control
+the power-map dynamically per jack detection where it never gets on.
+
+This patch adds the check of connection and it assumes the no jack
+detection is available for fixed pins no matter what pin capability
+says.
+
+BugLink: http://bugs.launchpad.net/bugs/1013183
+Reported-by: Luis Henriques <luis.henriques@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_sigmatel.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sound/pci/hda/patch_sigmatel.c b/sound/pci/hda/patch_sigmatel.c
+index 7b7a516..2b973f5 100644
+--- a/sound/pci/hda/patch_sigmatel.c
++++ b/sound/pci/hda/patch_sigmatel.c
+@@ -4457,7 +4457,7 @@ static int stac92xx_init(struct hda_codec *codec)
+ 					 AC_PINCTL_IN_EN);
+ 	for (i = 0; i < spec->num_pwrs; i++)  {
+ 		hda_nid_t nid = spec->pwr_nids[i];
+-		int pinctl, def_conf;
++		unsigned int pinctl, def_conf;
+ 
+ 		/* power on when no jack detection is available */
+ 		/* or when the VREF is used for controlling LED */
+@@ -4484,7 +4484,7 @@ static int stac92xx_init(struct hda_codec *codec)
+ 		def_conf = get_defcfg_connect(def_conf);
+ 		/* skip any ports that don't have jacks since presence
+  		 * detection is useless */
+-		if (def_conf != AC_JACK_PORT_NONE &&
++		if (def_conf != AC_JACK_PORT_COMPLEX ||
+ 		    !is_jack_detectable(codec, nid)) {
+ 			stac_toggle_power_map(codec, nid, 1);
+ 			continue;
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0023-tracing-change-CPU-ring-buffer-state-from-tracing_cp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0023-tracing-change-CPU-ring-buffer-state-from-tracing_cp.patch
new file mode 100644
index 0000000..eb84795
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0023-tracing-change-CPU-ring-buffer-state-from-tracing_cp.patch
@@ -0,0 +1,56 @@
+From 04098d77869c04c5bf703846783cb89b4297b2bb Mon Sep 17 00:00:00 2001
+From: Vaibhav Nagarnaik <vnagarnaik@google.com>
+Date: Thu, 3 May 2012 18:59:52 -0700
+Subject: [PATCH 23/49] tracing: change CPU ring buffer state from
+ tracing_cpumask
+
+commit 71babb2705e2203a64c27ede13ae3508a0d2c16c upstream.
+
+According to Documentation/trace/ftrace.txt:
+
+tracing_cpumask:
+
+        This is a mask that lets the user only trace
+        on specified CPUS. The format is a hex string
+        representing the CPUS.
+
+The tracing_cpumask currently doesn't affect the tracing state of
+per-CPU ring buffers.
+
+This patch enables/disables CPU recording as its corresponding bit in
+tracing_cpumask is set/unset.
+
+Link: http://lkml.kernel.org/r/1336096792-25373-3-git-send-email-vnagarnaik@google.com
+
+Cc: Frederic Weisbecker <fweisbec@gmail.com>
+Cc: Ingo Molnar <mingo@redhat.com>
+Cc: Laurent Chavey <chavey@google.com>
+Cc: Justin Teravest <teravest@google.com>
+Cc: David Sharp <dhsharp@google.com>
+Signed-off-by: Vaibhav Nagarnaik <vnagarnaik@google.com>
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/trace/trace.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
+index 7e4edd3..5638104 100644
+--- a/kernel/trace/trace.c
++++ b/kernel/trace/trace.c
+@@ -2541,10 +2541,12 @@ tracing_cpumask_write(struct file *filp, const char __user *ubuf,
+ 		if (cpumask_test_cpu(cpu, tracing_cpumask) &&
+ 				!cpumask_test_cpu(cpu, tracing_cpumask_new)) {
+ 			atomic_inc(&global_trace.data[cpu]->disabled);
++			ring_buffer_record_disable_cpu(global_trace.buffer, cpu);
+ 		}
+ 		if (!cpumask_test_cpu(cpu, tracing_cpumask) &&
+ 				cpumask_test_cpu(cpu, tracing_cpumask_new)) {
+ 			atomic_dec(&global_trace.data[cpu]->disabled);
++			ring_buffer_record_enable_cpu(global_trace.buffer, cpu);
+ 		}
+ 	}
+ 	arch_spin_unlock(&ftrace_max_lock);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0024-mwifiex-fix-wrong-return-values-in-add_virtual_intf-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0024-mwifiex-fix-wrong-return-values-in-add_virtual_intf-.patch
new file mode 100644
index 0000000..e7cb513
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0024-mwifiex-fix-wrong-return-values-in-add_virtual_intf-.patch
@@ -0,0 +1,93 @@
+From 0b53b4fb097d5d599a3a3fcd0ac10ad140bdf9c4 Mon Sep 17 00:00:00 2001
+From: Bing Zhao <bzhao@marvell.com>
+Date: Tue, 3 Jul 2012 20:43:56 -0700
+Subject: [PATCH 24/49] mwifiex: fix wrong return values in add_virtual_intf()
+ error cases
+
+commit 858faa57dd9e2b91f3f870fbb1185982e42f5a2b upstream
+
+backported for linux-3.2.y, linux-3.3.y, linux-3.4.y
+
+add_virtual_intf() needs to return an ERR_PTR(), instead of NULL,
+on errors, otherwise cfg80211 will crash.
+
+Reported-by: Johannes Berg <johannes@sipsolutions.net>
+Signed-off-by: Bing Zhao <bzhao@marvell.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/mwifiex/cfg80211.c |   21 +++++++++------------
+ 1 file changed, 9 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/net/wireless/mwifiex/cfg80211.c b/drivers/net/wireless/mwifiex/cfg80211.c
+index 462c710..01dcb1a 100644
+--- a/drivers/net/wireless/mwifiex/cfg80211.c
++++ b/drivers/net/wireless/mwifiex/cfg80211.c
+@@ -1177,11 +1177,11 @@ struct net_device *mwifiex_add_virtual_intf(struct wiphy *wiphy,
+ 	void *mdev_priv;
+ 
+ 	if (!priv)
+-		return NULL;
++		return ERR_PTR(-EFAULT);
+ 
+ 	adapter = priv->adapter;
+ 	if (!adapter)
+-		return NULL;
++		return ERR_PTR(-EFAULT);
+ 
+ 	switch (type) {
+ 	case NL80211_IFTYPE_UNSPECIFIED:
+@@ -1190,7 +1190,7 @@ struct net_device *mwifiex_add_virtual_intf(struct wiphy *wiphy,
+ 		if (priv->bss_mode) {
+ 			wiphy_err(wiphy, "cannot create multiple"
+ 					" station/adhoc interfaces\n");
+-			return NULL;
++			return ERR_PTR(-EINVAL);
+ 		}
+ 
+ 		if (type == NL80211_IFTYPE_UNSPECIFIED)
+@@ -1208,14 +1208,15 @@ struct net_device *mwifiex_add_virtual_intf(struct wiphy *wiphy,
+ 		break;
+ 	default:
+ 		wiphy_err(wiphy, "type not supported\n");
+-		return NULL;
++		return ERR_PTR(-EINVAL);
+ 	}
+ 
+ 	dev = alloc_netdev_mq(sizeof(struct mwifiex_private *), name,
+ 			      ether_setup, 1);
+ 	if (!dev) {
+ 		wiphy_err(wiphy, "no memory available for netdevice\n");
+-		goto error;
++		priv->bss_mode = NL80211_IFTYPE_UNSPECIFIED;
++		return ERR_PTR(-ENOMEM);
+ 	}
+ 
+ 	dev_net_set(dev, wiphy_net(wiphy));
+@@ -1240,7 +1241,9 @@ struct net_device *mwifiex_add_virtual_intf(struct wiphy *wiphy,
+ 	/* Register network device */
+ 	if (register_netdevice(dev)) {
+ 		wiphy_err(wiphy, "cannot register virtual network device\n");
+-		goto error;
++		free_netdev(dev);
++		priv->bss_mode = NL80211_IFTYPE_UNSPECIFIED;
++		return ERR_PTR(-EFAULT);
+ 	}
+ 
+ 	sema_init(&priv->async_sem, 1);
+@@ -1252,12 +1255,6 @@ struct net_device *mwifiex_add_virtual_intf(struct wiphy *wiphy,
+ 	mwifiex_dev_debugfs_init(priv);
+ #endif
+ 	return dev;
+-error:
+-	if (dev && (dev->reg_state == NETREG_UNREGISTERED))
+-		free_netdev(dev);
+-	priv->bss_mode = NL80211_IFTYPE_UNSPECIFIED;
+-
+-	return NULL;
+ }
+ EXPORT_SYMBOL_GPL(mwifiex_add_virtual_intf);
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0025-udf-Use-ret-instead-of-abusing-i-in-udf_load_logical.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0025-udf-Use-ret-instead-of-abusing-i-in-udf_load_logical.patch
new file mode 100644
index 0000000..0d5c179
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0025-udf-Use-ret-instead-of-abusing-i-in-udf_load_logical.patch
@@ -0,0 +1,35 @@
+From 4d7257d8f5c970ce0f699d893f6050fd8bd11f3c Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Wed, 27 Jun 2012 20:08:44 +0200
+Subject: [PATCH 25/49] udf: Use 'ret' instead of abusing 'i' in
+ udf_load_logicalvol()
+
+commit cb14d340ef1737c24125dd663eff77734a482d47 upstream.
+
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/udf/super.c |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/fs/udf/super.c b/fs/udf/super.c
+index 87cb24a..eea2bfe 100644
+--- a/fs/udf/super.c
++++ b/fs/udf/super.c
+@@ -1235,11 +1235,9 @@ static int udf_load_logicalvol(struct super_block *sb, sector_t block,
+ 	BUG_ON(ident != TAG_IDENT_LVD);
+ 	lvd = (struct logicalVolDesc *)bh->b_data;
+ 
+-	i = udf_sb_alloc_partition_maps(sb, le32_to_cpu(lvd->numPartitionMaps));
+-	if (i != 0) {
+-		ret = i;
++	ret = udf_sb_alloc_partition_maps(sb, le32_to_cpu(lvd->numPartitionMaps));
++	if (ret)
+ 		goto out_bh;
+-	}
+ 
+ 	for (i = 0, offset = 0;
+ 	     i < sbi->s_partitions && offset < le32_to_cpu(lvd->mapTableLength);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0026-udf-Avoid-run-away-loop-when-partition-table-length-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0026-udf-Avoid-run-away-loop-when-partition-table-length-.patch
new file mode 100644
index 0000000..b9fb57a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0026-udf-Avoid-run-away-loop-when-partition-table-length-.patch
@@ -0,0 +1,54 @@
+From 0a9d08974ed753d12541081ae062e5f69298d791 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Wed, 27 Jun 2012 20:20:22 +0200
+Subject: [PATCH 26/49] udf: Avoid run away loop when partition table length
+ is corrupted
+
+commit adee11b2085bee90bd8f4f52123ffb07882d6256 upstream.
+
+Check provided length of partition table so that (possibly maliciously)
+corrupted partition table cannot cause accessing data beyond current buffer.
+
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/udf/super.c |   10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/fs/udf/super.c b/fs/udf/super.c
+index eea2bfe..800e839 100644
+--- a/fs/udf/super.c
++++ b/fs/udf/super.c
+@@ -1227,6 +1227,7 @@ static int udf_load_logicalvol(struct super_block *sb, sector_t block,
+ 	struct genericPartitionMap *gpm;
+ 	uint16_t ident;
+ 	struct buffer_head *bh;
++	unsigned int table_len;
+ 	int ret = 0;
+ 
+ 	bh = udf_read_tagged(sb, block, block, &ident);
+@@ -1234,13 +1235,20 @@ static int udf_load_logicalvol(struct super_block *sb, sector_t block,
+ 		return 1;
+ 	BUG_ON(ident != TAG_IDENT_LVD);
+ 	lvd = (struct logicalVolDesc *)bh->b_data;
++	table_len = le32_to_cpu(lvd->mapTableLength);
++	if (sizeof(*lvd) + table_len > sb->s_blocksize) {
++		udf_err(sb, "error loading logical volume descriptor: "
++			"Partition table too long (%u > %lu)\n", table_len,
++			sb->s_blocksize - sizeof(*lvd));
++		goto out_bh;
++	}
+ 
+ 	ret = udf_sb_alloc_partition_maps(sb, le32_to_cpu(lvd->numPartitionMaps));
+ 	if (ret)
+ 		goto out_bh;
+ 
+ 	for (i = 0, offset = 0;
+-	     i < sbi->s_partitions && offset < le32_to_cpu(lvd->mapTableLength);
++	     i < sbi->s_partitions && offset < table_len;
+ 	     i++, offset += gpm->partitionMapLength) {
+ 		struct udf_part_map *map = &sbi->s_partmaps[i];
+ 		gpm = (struct genericPartitionMap *)
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0027-udf-Fortify-loading-of-sparing-table.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0027-udf-Fortify-loading-of-sparing-table.patch
new file mode 100644
index 0000000..2c4b706
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0027-udf-Fortify-loading-of-sparing-table.patch
@@ -0,0 +1,134 @@
+From 9db7244bafd8f99123cf5fe816e4961115831ca9 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Wed, 27 Jun 2012 21:23:07 +0200
+Subject: [PATCH 27/49] udf: Fortify loading of sparing table
+
+commit 1df2ae31c724e57be9d7ac00d78db8a5dabdd050 upstream.
+
+Add sanity checks when loading sparing table from disk to avoid accessing
+unallocated memory or writing to it.
+
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/udf/super.c |   86 ++++++++++++++++++++++++++++++++++----------------------
+ 1 file changed, 53 insertions(+), 33 deletions(-)
+
+diff --git a/fs/udf/super.c b/fs/udf/super.c
+index 800e839..270e135 100644
+--- a/fs/udf/super.c
++++ b/fs/udf/super.c
+@@ -56,6 +56,7 @@
+ #include <linux/seq_file.h>
+ #include <linux/bitmap.h>
+ #include <linux/crc-itu-t.h>
++#include <linux/log2.h>
+ #include <asm/byteorder.h>
+ 
+ #include "udf_sb.h"
+@@ -1217,11 +1218,59 @@ out_bh:
+ 	return ret;
+ }
+ 
++static int udf_load_sparable_map(struct super_block *sb,
++				 struct udf_part_map *map,
++				 struct sparablePartitionMap *spm)
++{
++	uint32_t loc;
++	uint16_t ident;
++	struct sparingTable *st;
++	struct udf_sparing_data *sdata = &map->s_type_specific.s_sparing;
++	int i;
++	struct buffer_head *bh;
++
++	map->s_partition_type = UDF_SPARABLE_MAP15;
++	sdata->s_packet_len = le16_to_cpu(spm->packetLength);
++	if (!is_power_of_2(sdata->s_packet_len)) {
++		udf_err(sb, "error loading logical volume descriptor: "
++			"Invalid packet length %u\n",
++			(unsigned)sdata->s_packet_len);
++		return -EIO;
++	}
++	if (spm->numSparingTables > 4) {
++		udf_err(sb, "error loading logical volume descriptor: "
++			"Too many sparing tables (%d)\n",
++			(int)spm->numSparingTables);
++		return -EIO;
++	}
++
++	for (i = 0; i < spm->numSparingTables; i++) {
++		loc = le32_to_cpu(spm->locSparingTable[i]);
++		bh = udf_read_tagged(sb, loc, loc, &ident);
++		if (!bh)
++			continue;
++
++		st = (struct sparingTable *)bh->b_data;
++		if (ident != 0 ||
++		    strncmp(st->sparingIdent.ident, UDF_ID_SPARING,
++			    strlen(UDF_ID_SPARING)) ||
++		    sizeof(*st) + le16_to_cpu(st->reallocationTableLen) >
++							sb->s_blocksize) {
++			brelse(bh);
++			continue;
++		}
++
++		sdata->s_spar_map[i] = bh;
++	}
++	map->s_partition_func = udf_get_pblock_spar15;
++	return 0;
++}
++
+ static int udf_load_logicalvol(struct super_block *sb, sector_t block,
+ 			       struct kernel_lb_addr *fileset)
+ {
+ 	struct logicalVolDesc *lvd;
+-	int i, j, offset;
++	int i, offset;
+ 	uint8_t type;
+ 	struct udf_sb_info *sbi = UDF_SB(sb);
+ 	struct genericPartitionMap *gpm;
+@@ -1283,38 +1332,9 @@ static int udf_load_logicalvol(struct super_block *sb, sector_t block,
+ 			} else if (!strncmp(upm2->partIdent.ident,
+ 						UDF_ID_SPARABLE,
+ 						strlen(UDF_ID_SPARABLE))) {
+-				uint32_t loc;
+-				struct sparingTable *st;
+-				struct sparablePartitionMap *spm =
+-					(struct sparablePartitionMap *)gpm;
+-
+-				map->s_partition_type = UDF_SPARABLE_MAP15;
+-				map->s_type_specific.s_sparing.s_packet_len =
+-						le16_to_cpu(spm->packetLength);
+-				for (j = 0; j < spm->numSparingTables; j++) {
+-					struct buffer_head *bh2;
+-
+-					loc = le32_to_cpu(
+-						spm->locSparingTable[j]);
+-					bh2 = udf_read_tagged(sb, loc, loc,
+-							     &ident);
+-					map->s_type_specific.s_sparing.
+-							s_spar_map[j] = bh2;
+-
+-					if (bh2 == NULL)
+-						continue;
+-
+-					st = (struct sparingTable *)bh2->b_data;
+-					if (ident != 0 || strncmp(
+-						st->sparingIdent.ident,
+-						UDF_ID_SPARING,
+-						strlen(UDF_ID_SPARING))) {
+-						brelse(bh2);
+-						map->s_type_specific.s_sparing.
+-							s_spar_map[j] = NULL;
+-					}
+-				}
+-				map->s_partition_func = udf_get_pblock_spar15;
++				if (udf_load_sparable_map(sb, map,
++				    (struct sparablePartitionMap *)gpm) < 0)
++					goto out_bh;
+ 			} else if (!strncmp(upm2->partIdent.ident,
+ 						UDF_ID_METADATA,
+ 						strlen(UDF_ID_METADATA))) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch
new file mode 100644
index 0000000..4187adc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch
@@ -0,0 +1,68 @@
+From cb4aa2ef6f748fa3a3e6cd3889153c191e63d48e Mon Sep 17 00:00:00 2001
+From: Russell King <rmk+kernel@arm.linux.org.uk>
+Date: Thu, 19 Jan 2012 15:20:58 +0000
+Subject: [PATCH 28/49] ARM: fix rcu stalls on SMP platforms
+
+commit 7deabca0acfe02b8e18f59a4c95676012f49a304 upstream.
+
+We can stall RCU processing on SMP platforms if a CPU sits in its idle
+loop for a long time.  This happens because we don't call irq_enter()
+and irq_exit() around generic_smp_call_function_interrupt() and
+friends.  Add the necessary calls, and remove the one from within
+ipi_timer(), so that they're all in a common place.
+
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/kernel/smp.c |   10 ++++++++--
+ 1 file changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
+index e10e59a..1d1710e 100644
+--- a/arch/arm/kernel/smp.c
++++ b/arch/arm/kernel/smp.c
+@@ -471,9 +471,7 @@ static DEFINE_PER_CPU(struct clock_event_device, percpu_clockevent);
+ static void ipi_timer(void)
+ {
+ 	struct clock_event_device *evt = &__get_cpu_var(percpu_clockevent);
+-	irq_enter();
+ 	evt->event_handler(evt);
+-	irq_exit();
+ }
+ 
+ #ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
+@@ -572,7 +570,9 @@ void handle_IPI(int ipinr, struct pt_regs *regs)
+ 
+ 	switch (ipinr) {
+ 	case IPI_TIMER:
++		irq_enter();
+ 		ipi_timer();
++		irq_exit();
+ 		break;
+ 
+ 	case IPI_RESCHEDULE:
+@@ -580,15 +580,21 @@ void handle_IPI(int ipinr, struct pt_regs *regs)
+ 		break;
+ 
+ 	case IPI_CALL_FUNC:
++		irq_enter();
+ 		generic_smp_call_function_interrupt();
++		irq_exit();
+ 		break;
+ 
+ 	case IPI_CALL_FUNC_SINGLE:
++		irq_enter();
+ 		generic_smp_call_function_single_interrupt();
++		irq_exit();
+ 		break;
+ 
+ 	case IPI_CPU_STOP:
++		irq_enter();
+ 		ipi_cpu_stop(cpu);
++		irq_exit();
+ 		break;
+ 
+ 	default:
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0029-net-sock-validate-data_len-before-allocating-skb-in-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0029-net-sock-validate-data_len-before-allocating-skb-in-.patch
new file mode 100644
index 0000000..7ede727
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0029-net-sock-validate-data_len-before-allocating-skb-in-.patch
@@ -0,0 +1,53 @@
+From 9e88f1e8bf3f7dbc0cb410a09c003180052bd7d4 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 30 May 2012 21:18:10 +0000
+Subject: [PATCH 29/49] net: sock: validate data_len before allocating skb in
+ sock_alloc_send_pskb()
+
+[ Upstream commit cc9b17ad29ecaa20bfe426a8d4dbfb94b13ff1cc ]
+
+We need to validate the number of pages consumed by data_len, otherwise frags
+array could be overflowed by userspace. So this patch validate data_len and
+return -EMSGSIZE when data_len may occupies more frags than MAX_SKB_FRAGS.
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/sock.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/net/core/sock.c b/net/core/sock.c
+index b23f174..8d095b9 100644
+--- a/net/core/sock.c
++++ b/net/core/sock.c
+@@ -1497,6 +1497,11 @@ struct sk_buff *sock_alloc_send_pskb(struct sock *sk, unsigned long header_len,
+ 	gfp_t gfp_mask;
+ 	long timeo;
+ 	int err;
++	int npages = (data_len + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
++
++	err = -EMSGSIZE;
++	if (npages > MAX_SKB_FRAGS)
++		goto failure;
+ 
+ 	gfp_mask = sk->sk_allocation;
+ 	if (gfp_mask & __GFP_WAIT)
+@@ -1515,14 +1520,12 @@ struct sk_buff *sock_alloc_send_pskb(struct sock *sk, unsigned long header_len,
+ 		if (atomic_read(&sk->sk_wmem_alloc) < sk->sk_sndbuf) {
+ 			skb = alloc_skb(header_len, gfp_mask);
+ 			if (skb) {
+-				int npages;
+ 				int i;
+ 
+ 				/* No pages, we're done... */
+ 				if (!data_len)
+ 					break;
+ 
+-				npages = (data_len + (PAGE_SIZE - 1)) >> PAGE_SHIFT;
+ 				skb->truesize += data_len;
+ 				skb_shinfo(skb)->nr_frags = npages;
+ 				for (i = 0; i < npages; i++) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0030-cipso-handle-CIPSO-options-correctly-when-NetLabel-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0030-cipso-handle-CIPSO-options-correctly-when-NetLabel-i.patch
new file mode 100644
index 0000000..8310ad9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0030-cipso-handle-CIPSO-options-correctly-when-NetLabel-i.patch
@@ -0,0 +1,80 @@
+From e3e2beb00731e994722f01a1c284e3bcc69264ba Mon Sep 17 00:00:00 2001
+From: Paul Moore <pmoore@redhat.com>
+Date: Fri, 1 Jun 2012 05:54:56 +0000
+Subject: [PATCH 30/49] cipso: handle CIPSO options correctly when NetLabel is
+ disabled
+
+[ Upstream commit 20e2a86485967c385d7c7befc1646e4d1d39362e ]
+
+When NetLabel is not enabled, e.g. CONFIG_NETLABEL=n, and the system
+receives a CIPSO tagged packet it is dropped (cipso_v4_validate()
+returns non-zero).  In most cases this is the correct and desired
+behavior, however, in the case where we are simply forwarding the
+traffic, e.g. acting as a network bridge, this becomes a problem.
+
+This patch fixes the forwarding problem by providing the basic CIPSO
+validation code directly in ip_options_compile() without the need for
+the NetLabel or CIPSO code.  The new validation code can not perform
+any of the CIPSO option label/value verification that
+cipso_v4_validate() does, but it can verify the basic CIPSO option
+format.
+
+The behavior when NetLabel is enabled is unchanged.
+
+Signed-off-by: Paul Moore <pmoore@redhat.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/net/cipso_ipv4.h |   29 ++++++++++++++++++++++++++++-
+ 1 file changed, 28 insertions(+), 1 deletion(-)
+
+diff --git a/include/net/cipso_ipv4.h b/include/net/cipso_ipv4.h
+index 9808877..a7a683e 100644
+--- a/include/net/cipso_ipv4.h
++++ b/include/net/cipso_ipv4.h
+@@ -42,6 +42,7 @@
+ #include <net/netlabel.h>
+ #include <net/request_sock.h>
+ #include <linux/atomic.h>
++#include <asm/unaligned.h>
+ 
+ /* known doi values */
+ #define CIPSO_V4_DOI_UNKNOWN          0x00000000
+@@ -285,7 +286,33 @@ static inline int cipso_v4_skbuff_getattr(const struct sk_buff *skb,
+ static inline int cipso_v4_validate(const struct sk_buff *skb,
+ 				    unsigned char **option)
+ {
+-	return -ENOSYS;
++	unsigned char *opt = *option;
++	unsigned char err_offset = 0;
++	u8 opt_len = opt[1];
++	u8 opt_iter;
++
++	if (opt_len < 8) {
++		err_offset = 1;
++		goto out;
++	}
++
++	if (get_unaligned_be32(&opt[2]) == 0) {
++		err_offset = 2;
++		goto out;
++	}
++
++	for (opt_iter = 6; opt_iter < opt_len;) {
++		if (opt[opt_iter + 1] > (opt_len - opt_iter)) {
++			err_offset = opt_iter + 1;
++			goto out;
++		}
++		opt_iter += opt[opt_iter + 1];
++	}
++
++out:
++	*option = opt + err_offset;
++	return err_offset;
++
+ }
+ #endif /* CONFIG_NETLABEL */
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0031-net-l2tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0031-net-l2tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch
new file mode 100644
index 0000000..27a349b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0031-net-l2tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch
@@ -0,0 +1,43 @@
+From b5ad3a0c0628afa77ab9de116e252fbac91f6db2 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Thu, 7 Jun 2012 00:07:20 +0000
+Subject: [PATCH 31/49] net: l2tp_eth: fix kernel panic on rmmod l2tp_eth
+
+[ Upstream commit a06998b88b1651c5f71c0e35f528bf2057188ead ]
+
+We must prevent module unloading if some devices are still attached to
+l2tp_eth driver.
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Reported-by: Denys Fedoryshchenko <denys@visp.net.lb>
+Tested-by: Denys Fedoryshchenko <denys@visp.net.lb>
+Cc: James Chapman <jchapman@katalix.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/l2tp/l2tp_eth.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/net/l2tp/l2tp_eth.c b/net/l2tp/l2tp_eth.c
+index d2726a7..3c55f63 100644
+--- a/net/l2tp/l2tp_eth.c
++++ b/net/l2tp/l2tp_eth.c
+@@ -167,6 +167,7 @@ static void l2tp_eth_delete(struct l2tp_session *session)
+ 		if (dev) {
+ 			unregister_netdev(dev);
+ 			spriv->dev = NULL;
++			module_put(THIS_MODULE);
+ 		}
+ 	}
+ }
+@@ -254,6 +255,7 @@ static int l2tp_eth_create(struct net *net, u32 tunnel_id, u32 session_id, u32 p
+ 	if (rc < 0)
+ 		goto out_del_dev;
+ 
++	__module_get(THIS_MODULE);
+ 	/* Must be done after register_netdev() */
+ 	strlcpy(session->ifname, dev->name, IFNAMSIZ);
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch
new file mode 100644
index 0000000..60f8a9d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch
@@ -0,0 +1,53 @@
+From a2ee8c14e43a7432b50a050cd07c06d43caa9314 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Fri, 8 Jun 2012 06:25:00 +0000
+Subject: [PATCH 32/49] l2tp: fix a race in l2tp_ip_sendmsg()
+
+[ Upstream commit 4399a4df98a63e30fd16e9d0cecc46ea92269e8f ]
+
+Commit 081b1b1bb27f (l2tp: fix l2tp_ip_sendmsg() route handling) added
+a race, in case IP route cache is disabled.
+
+In this case, we should not do the dst_release(&rt->dst), since it'll
+free the dst immediately, instead of waiting a RCU grace period.
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Cc: James Chapman <jchapman@katalix.com>
+Cc: Denys Fedoryshchenko <denys@visp.net.lb>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/l2tp/l2tp_ip.c |    9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/net/l2tp/l2tp_ip.c b/net/l2tp/l2tp_ip.c
+index 2fbbe1f..6c7e609 100644
+--- a/net/l2tp/l2tp_ip.c
++++ b/net/l2tp/l2tp_ip.c
+@@ -515,10 +515,12 @@ static int l2tp_ip_sendmsg(struct kiocb *iocb, struct sock *sk, struct msghdr *m
+ 					   sk->sk_bound_dev_if);
+ 		if (IS_ERR(rt))
+ 			goto no_route;
+-		if (connected)
++		if (connected) {
+ 			sk_setup_caps(sk, &rt->dst);
+-		else
+-			dst_release(&rt->dst); /* safe since we hold rcu_read_lock */
++		} else {
++			skb_dst_set(skb, &rt->dst);
++			goto xmit;
++		}
+ 	}
+ 
+ 	/* We dont need to clone dst here, it is guaranteed to not disappear.
+@@ -526,6 +528,7 @@ static int l2tp_ip_sendmsg(struct kiocb *iocb, struct sock *sk, struct msghdr *m
+ 	 */
+ 	skb_dst_set_noref(skb, &rt->dst);
+ 
++xmit:
+ 	/* Queue the packet to IP for output */
+ 	rc = ip_queue_xmit(skb, &inet->cork.fl);
+ 	rcu_read_unlock();
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0033-sky2-fix-checksum-bit-management-on-some-chips.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0033-sky2-fix-checksum-bit-management-on-some-chips.patch
new file mode 100644
index 0000000..f1d1fb6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0033-sky2-fix-checksum-bit-management-on-some-chips.patch
@@ -0,0 +1,47 @@
+From f13b66c5fac7aa65e68a960806d6c5e97df723eb Mon Sep 17 00:00:00 2001
+From: stephen hemminger <shemminger@vyatta.com>
+Date: Wed, 6 Jun 2012 10:01:30 +0000
+Subject: [PATCH 33/49] sky2: fix checksum bit management on some chips
+
+[ Upstream commit 5ff0feac88ced864f44adb145142269196fa79d9 ]
+
+The newer flavors of Yukon II use a different method for receive
+checksum offload. This is indicated in the driver by the SKY2_HW_NEW_LE
+flag. On these newer chips, the BMU_ENA_RX_CHKSUM should not be set.
+
+The driver would get incorrectly toggle the bit, enabling the old
+checksum logic on these chips and cause a BUG_ON() assertion. If
+receive checksum was toggled via ethtool.
+
+Reported-by: Kirill Smelkov <kirr@mns.spb.ru>
+Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/marvell/sky2.c |   10 ++++++----
+ 1 file changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
+index 65c51ff..11ddd838 100644
+--- a/drivers/net/ethernet/marvell/sky2.c
++++ b/drivers/net/ethernet/marvell/sky2.c
+@@ -4361,10 +4361,12 @@ static int sky2_set_features(struct net_device *dev, u32 features)
+ 	struct sky2_port *sky2 = netdev_priv(dev);
+ 	u32 changed = dev->features ^ features;
+ 
+-	if (changed & NETIF_F_RXCSUM) {
+-		u32 on = features & NETIF_F_RXCSUM;
+-		sky2_write32(sky2->hw, Q_ADDR(rxqaddr[sky2->port], Q_CSR),
+-			     on ? BMU_ENA_RX_CHKSUM : BMU_DIS_RX_CHKSUM);
++	if ((changed & NETIF_F_RXCSUM) &&
++	    !(sky2->hw->flags & SKY2_HW_NEW_LE)) {
++		sky2_write32(sky2->hw,
++			     Q_ADDR(rxqaddr[sky2->port], Q_CSR),
++			     (features & NETIF_F_RXCSUM)
++			     ? BMU_ENA_RX_CHKSUM : BMU_DIS_RX_CHKSUM);
+ 	}
+ 
+ 	if (changed & NETIF_F_RXHASH)
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch
new file mode 100644
index 0000000..c67c72a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch
@@ -0,0 +1,44 @@
+From 5588c981e9bc21ca9bd050a8e15feb4adb1215b9 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Thu, 7 Jun 2012 22:59:59 +0000
+Subject: [PATCH 34/49] be2net: fix a race in be_xmit()
+
+[ Upstream commit cd8f76c0a0c6fce0b2cf23c9bd0123f91453f46d ]
+
+As soon as hardware is notified of a transmit, we no longer can assume
+skb can be dereferenced, as TX completion might have freed the packet.
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Cc: Sathya Perla <sathya.perla@emulex.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/emulex/benet/be_main.c |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/ethernet/emulex/benet/be_main.c b/drivers/net/ethernet/emulex/benet/be_main.c
+index bf266a0..36c7c4e 100644
+--- a/drivers/net/ethernet/emulex/benet/be_main.c
++++ b/drivers/net/ethernet/emulex/benet/be_main.c
+@@ -696,6 +696,8 @@ static netdev_tx_t be_xmit(struct sk_buff *skb,
+ 
+ 	copied = make_tx_wrbs(adapter, txq, skb, wrb_cnt, dummy_wrb);
+ 	if (copied) {
++		int gso_segs = skb_shinfo(skb)->gso_segs;
++
+ 		/* record the sent skb in the sent_skb table */
+ 		BUG_ON(txo->sent_skb_list[start]);
+ 		txo->sent_skb_list[start] = skb;
+@@ -713,8 +715,7 @@ static netdev_tx_t be_xmit(struct sk_buff *skb,
+ 
+ 		be_txq_notify(adapter, txq->id, wrb_cnt);
+ 
+-		be_tx_stats_update(txo, wrb_cnt, copied,
+-				skb_shinfo(skb)->gso_segs, stopped);
++		be_tx_stats_update(txo, wrb_cnt, copied, gso_segs, stopped);
+ 	} else {
+ 		txq->head = start;
+ 		dev_kfree_skb_any(skb);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0035-dummy-fix-rcu_sched-self-detected-stalls.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0035-dummy-fix-rcu_sched-self-detected-stalls.patch
new file mode 100644
index 0000000..33f9ffa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0035-dummy-fix-rcu_sched-self-detected-stalls.patch
@@ -0,0 +1,49 @@
+From 6e4b4fb46ccc49cacb3258764f2414ecd4fb27a4 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Sun, 10 Jun 2012 21:11:57 +0000
+Subject: [PATCH 35/49] dummy: fix rcu_sched self-detected stalls
+
+[ Upstream commit 16b0dc29c1af9df341428f4c49ada4f626258082 ]
+
+Trying to "modprobe dummy numdummies=30000" triggers :
+
+INFO: rcu_sched self-detected stall on CPU { 8} (t=60000 jiffies)
+
+After this splat, RTNL is locked and reboot is needed.
+
+We must call cond_resched() to avoid this, even holding RTNL.
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/dummy.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/dummy.c b/drivers/net/dummy.c
+index eeac9ca..68fe73c 100644
+--- a/drivers/net/dummy.c
++++ b/drivers/net/dummy.c
+@@ -37,6 +37,7 @@
+ #include <linux/rtnetlink.h>
+ #include <net/rtnetlink.h>
+ #include <linux/u64_stats_sync.h>
++#include <linux/sched.h>
+ 
+ static int numdummies = 1;
+ 
+@@ -186,8 +187,10 @@ static int __init dummy_init_module(void)
+ 	rtnl_lock();
+ 	err = __rtnl_link_register(&dummy_link_ops);
+ 
+-	for (i = 0; i < numdummies && !err; i++)
++	for (i = 0; i < numdummies && !err; i++) {
+ 		err = dummy_init_one();
++		cond_resched();
++	}
+ 	if (err < 0)
+ 		__rtnl_link_unregister(&dummy_link_ops);
+ 	rtnl_unlock();
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0036-bonding-Fix-corrupted-queue_mapping.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0036-bonding-Fix-corrupted-queue_mapping.patch
new file mode 100644
index 0000000..6f9681c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0036-bonding-Fix-corrupted-queue_mapping.patch
@@ -0,0 +1,117 @@
+From 218ae95441a945d2a474b2277156749f416b8859 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Tue, 12 Jun 2012 06:03:51 +0000
+Subject: [PATCH 36/49] bonding: Fix corrupted queue_mapping
+
+[ Upstream commit 5ee31c6898ea5537fcea160999d60dc63bc0c305 ]
+
+In the transmit path of the bonding driver, skb->cb is used to
+stash the skb->queue_mapping so that the bonding device can set its
+own queue mapping.  This value becomes corrupted since the skb->cb is
+also used in __dev_xmit_skb.
+
+When transmitting through bonding driver, bond_select_queue is
+called from dev_queue_xmit.  In bond_select_queue the original
+skb->queue_mapping is copied into skb->cb (via bond_queue_mapping)
+and skb->queue_mapping is overwritten with the bond driver queue.
+
+Subsequently in dev_queue_xmit, __dev_xmit_skb is called which writes
+the packet length into skb->cb, thereby overwriting the stashed
+queue mappping.  In bond_dev_queue_xmit (called from hard_start_xmit),
+the queue mapping for the skb is set to the stashed value which is now
+the skb length and hence is an invalid queue for the slave device.
+
+If we want to save skb->queue_mapping into skb->cb[], best place is to
+add a field in struct qdisc_skb_cb, to make sure it wont conflict with
+other layers (eg : Qdiscc, Infiniband...)
+
+This patchs also makes sure (struct qdisc_skb_cb)->data is aligned on 8
+bytes :
+
+netem qdisc for example assumes it can store an u64 in it, without
+misalignment penalty.
+
+Note : we only have 20 bytes left in (struct qdisc_skb_cb)->data[].
+The largest user is CHOKe and it fills it.
+
+Based on a previous patch from Tom Herbert.
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Reported-by: Tom Herbert <therbert@google.com>
+Cc: John Fastabend <john.r.fastabend@intel.com>
+Cc: Roland Dreier <roland@kernel.org>
+Acked-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/bonding/bond_main.c |    9 +++++----
+ include/net/sch_generic.h       |    7 +++++--
+ 2 files changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
+index f65e0b9..1a88e38 100644
+--- a/drivers/net/bonding/bond_main.c
++++ b/drivers/net/bonding/bond_main.c
+@@ -77,6 +77,7 @@
+ #include <net/route.h>
+ #include <net/net_namespace.h>
+ #include <net/netns/generic.h>
++#include <net/pkt_sched.h>
+ #include "bonding.h"
+ #include "bond_3ad.h"
+ #include "bond_alb.h"
+@@ -382,8 +383,6 @@ struct vlan_entry *bond_next_vlan(struct bonding *bond, struct vlan_entry *curr)
+ 	return next;
+ }
+ 
+-#define bond_queue_mapping(skb) (*(u16 *)((skb)->cb))
+-
+ /**
+  * bond_dev_queue_xmit - Prepare skb for xmit.
+  *
+@@ -396,7 +395,9 @@ int bond_dev_queue_xmit(struct bonding *bond, struct sk_buff *skb,
+ {
+ 	skb->dev = slave_dev;
+ 
+-	skb->queue_mapping = bond_queue_mapping(skb);
++	BUILD_BUG_ON(sizeof(skb->queue_mapping) !=
++		     sizeof(qdisc_skb_cb(skb)->bond_queue_mapping));
++	skb->queue_mapping = qdisc_skb_cb(skb)->bond_queue_mapping;
+ 
+ 	if (unlikely(netpoll_tx_running(slave_dev)))
+ 		bond_netpoll_send_skb(bond_get_slave_by_dev(bond, slave_dev), skb);
+@@ -4151,7 +4152,7 @@ static u16 bond_select_queue(struct net_device *dev, struct sk_buff *skb)
+ 	/*
+ 	 * Save the original txq to restore before passing to the driver
+ 	 */
+-	bond_queue_mapping(skb) = skb->queue_mapping;
++	qdisc_skb_cb(skb)->bond_queue_mapping = skb->queue_mapping;
+ 
+ 	if (unlikely(txq >= dev->real_num_tx_queues)) {
+ 		do {
+diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
+index 55ce96b..9d7d54a 100644
+--- a/include/net/sch_generic.h
++++ b/include/net/sch_generic.h
+@@ -220,13 +220,16 @@ struct tcf_proto {
+ 
+ struct qdisc_skb_cb {
+ 	unsigned int		pkt_len;
+-	unsigned char		data[24];
++	u16			bond_queue_mapping;
++	u16			_pad;
++	unsigned char		data[20];
+ };
+ 
+ static inline void qdisc_cb_private_validate(const struct sk_buff *skb, int sz)
+ {
+ 	struct qdisc_skb_cb *qcb;
+-	BUILD_BUG_ON(sizeof(skb->cb) < sizeof(unsigned int) + sz);
++
++	BUILD_BUG_ON(sizeof(skb->cb) < offsetof(struct qdisc_skb_cb, data) + sz);
+ 	BUILD_BUG_ON(sizeof(qcb->data) < sz);
+ }
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0037-ethtool-allow-ETHTOOL_GSSET_INFO-for-users.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0037-ethtool-allow-ETHTOOL_GSSET_INFO-for-users.patch
new file mode 100644
index 0000000..6e02ce1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0037-ethtool-allow-ETHTOOL_GSSET_INFO-for-users.patch
@@ -0,0 +1,36 @@
+From 7d1a3b73b1d85f034aeb9e5c1e4eb44ce56658be Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
+Date: Sun, 22 Jan 2012 00:20:40 +0000
+Subject: [PATCH 37/49] ethtool: allow ETHTOOL_GSSET_INFO for users
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[ Upstream commit f80400a26a2e8bff541de12834a1134358bb6642 ]
+
+Allow ETHTOOL_GSSET_INFO ethtool ioctl() for unprivileged users.
+ETHTOOL_GSTRINGS is already allowed, but is unusable without this one.
+
+Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
+Acked-by: Ben Hutchings <bhutchings@solarflare.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/ethtool.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/core/ethtool.c b/net/core/ethtool.c
+index 2b587ec..2367246 100644
+--- a/net/core/ethtool.c
++++ b/net/core/ethtool.c
+@@ -1672,6 +1672,7 @@ int dev_ethtool(struct net *net, struct ifreq *ifr)
+ 	case ETHTOOL_GRXCSUM:
+ 	case ETHTOOL_GTXCSUM:
+ 	case ETHTOOL_GSG:
++	case ETHTOOL_GSSET_INFO:
+ 	case ETHTOOL_GSTRINGS:
+ 	case ETHTOOL_GTSO:
+ 	case ETHTOOL_GPERMADDR:
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0038-netpoll-fix-netpoll_send_udp-bugs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0038-netpoll-fix-netpoll_send_udp-bugs.patch
new file mode 100644
index 0000000..e906246
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0038-netpoll-fix-netpoll_send_udp-bugs.patch
@@ -0,0 +1,77 @@
+From 1757946f8c246a1b46bf27d40716d4f78145f4a1 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Tue, 12 Jun 2012 19:30:21 +0000
+Subject: [PATCH 38/49] netpoll: fix netpoll_send_udp() bugs
+
+[ Upstream commit 954fba0274058d27c7c07b5ea07c41b3b7477894 ]
+
+Bogdan Hamciuc diagnosed and fixed following bug in netpoll_send_udp() :
+
+"skb->len += len;" instead of "skb_put(skb, len);"
+
+Meaning that _if_ a network driver needs to call skb_realloc_headroom(),
+only packet headers would be copied, leaving garbage in the payload.
+
+However the skb_realloc_headroom() must be avoided as much as possible
+since it requires memory and netpoll tries hard to work even if memory
+is exhausted (using a pool of preallocated skbs)
+
+It appears netpoll_send_udp() reserved 16 bytes for the ethernet header,
+which happens to work for typicall drivers but not all.
+
+Right thing is to use LL_RESERVED_SPACE(dev)
+(And also add dev->needed_tailroom of tailroom)
+
+This patch combines both fixes.
+
+Many thanks to Bogdan for raising this issue.
+
+Reported-by: Bogdan Hamciuc <bogdan.hamciuc@freescale.com>
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Tested-by: Bogdan Hamciuc <bogdan.hamciuc@freescale.com>
+Cc: Herbert Xu <herbert@gondor.apana.org.au>
+Cc: Neil Horman <nhorman@tuxdriver.com>
+Reviewed-by: Neil Horman <nhorman@tuxdriver.com>
+Reviewed-by: Cong Wang <xiyou.wangcong@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/netpoll.c |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/net/core/netpoll.c b/net/core/netpoll.c
+index ab0633f..db4bb7a 100644
+--- a/net/core/netpoll.c
++++ b/net/core/netpoll.c
+@@ -351,22 +351,23 @@ EXPORT_SYMBOL(netpoll_send_skb_on_dev);
+ 
+ void netpoll_send_udp(struct netpoll *np, const char *msg, int len)
+ {
+-	int total_len, eth_len, ip_len, udp_len;
++	int total_len, ip_len, udp_len;
+ 	struct sk_buff *skb;
+ 	struct udphdr *udph;
+ 	struct iphdr *iph;
+ 	struct ethhdr *eth;
+ 
+ 	udp_len = len + sizeof(*udph);
+-	ip_len = eth_len = udp_len + sizeof(*iph);
+-	total_len = eth_len + ETH_HLEN + NET_IP_ALIGN;
++	ip_len = udp_len + sizeof(*iph);
++	total_len = ip_len + LL_RESERVED_SPACE(np->dev);
+ 
+-	skb = find_skb(np, total_len, total_len - len);
++	skb = find_skb(np, total_len + np->dev->needed_tailroom,
++		       total_len - len);
+ 	if (!skb)
+ 		return;
+ 
+ 	skb_copy_to_linear_data(skb, msg, len);
+-	skb->len += len;
++	skb_put(skb, len);
+ 
+ 	skb_push(skb, sizeof(*udph));
+ 	skb_reset_transport_header(skb);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0039-ipv6-Move-ipv6-proc-file-registration-to-end-of-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0039-ipv6-Move-ipv6-proc-file-registration-to-end-of-init.patch
new file mode 100644
index 0000000..202fca3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0039-ipv6-Move-ipv6-proc-file-registration-to-end-of-init.patch
@@ -0,0 +1,126 @@
+From 0991f9681e1142099a36959648a920e9ee9dda33 Mon Sep 17 00:00:00 2001
+From: Thomas Graf <tgraf@suug.ch>
+Date: Mon, 18 Jun 2012 12:08:33 +0000
+Subject: [PATCH 39/49] ipv6: Move ipv6 proc file registration to end of init
+ order
+
+[ Upstream commit d189634ecab947c10f6f832258b103d0bbfe73cc ]
+
+/proc/net/ipv6_route reflects the contents of fib_table_hash. The proc
+handler is installed in ip6_route_net_init() whereas fib_table_hash is
+allocated in fib6_net_init() _after_ the proc handler has been installed.
+
+This opens up a short time frame to access fib_table_hash with its pants
+down.
+
+Move the registration of the proc files to a later point in the init
+order to avoid the race.
+
+Tested :-)
+
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/ipv6/route.c |   41 +++++++++++++++++++++++++++++++----------
+ 1 file changed, 31 insertions(+), 10 deletions(-)
+
+diff --git a/net/ipv6/route.c b/net/ipv6/route.c
+index 059b9d9..2e21751 100644
+--- a/net/ipv6/route.c
++++ b/net/ipv6/route.c
+@@ -2881,10 +2881,6 @@ static int __net_init ip6_route_net_init(struct net *net)
+ 	net->ipv6.sysctl.ip6_rt_mtu_expires = 10*60*HZ;
+ 	net->ipv6.sysctl.ip6_rt_min_advmss = IPV6_MIN_MTU - 20 - 40;
+ 
+-#ifdef CONFIG_PROC_FS
+-	proc_net_fops_create(net, "ipv6_route", 0, &ipv6_route_proc_fops);
+-	proc_net_fops_create(net, "rt6_stats", S_IRUGO, &rt6_stats_seq_fops);
+-#endif
+ 	net->ipv6.ip6_rt_gc_expire = 30*HZ;
+ 
+ 	ret = 0;
+@@ -2905,10 +2901,6 @@ out_ip6_dst_ops:
+ 
+ static void __net_exit ip6_route_net_exit(struct net *net)
+ {
+-#ifdef CONFIG_PROC_FS
+-	proc_net_remove(net, "ipv6_route");
+-	proc_net_remove(net, "rt6_stats");
+-#endif
+ 	kfree(net->ipv6.ip6_null_entry);
+ #ifdef CONFIG_IPV6_MULTIPLE_TABLES
+ 	kfree(net->ipv6.ip6_prohibit_entry);
+@@ -2917,11 +2909,33 @@ static void __net_exit ip6_route_net_exit(struct net *net)
+ 	dst_entries_destroy(&net->ipv6.ip6_dst_ops);
+ }
+ 
++static int __net_init ip6_route_net_init_late(struct net *net)
++{
++#ifdef CONFIG_PROC_FS
++	proc_net_fops_create(net, "ipv6_route", 0, &ipv6_route_proc_fops);
++	proc_net_fops_create(net, "rt6_stats", S_IRUGO, &rt6_stats_seq_fops);
++#endif
++	return 0;
++}
++
++static void __net_exit ip6_route_net_exit_late(struct net *net)
++{
++#ifdef CONFIG_PROC_FS
++	proc_net_remove(net, "ipv6_route");
++	proc_net_remove(net, "rt6_stats");
++#endif
++}
++
+ static struct pernet_operations ip6_route_net_ops = {
+ 	.init = ip6_route_net_init,
+ 	.exit = ip6_route_net_exit,
+ };
+ 
++static struct pernet_operations ip6_route_net_late_ops = {
++	.init = ip6_route_net_init_late,
++	.exit = ip6_route_net_exit_late,
++};
++
+ static struct notifier_block ip6_route_dev_notifier = {
+ 	.notifier_call = ip6_route_dev_notify,
+ 	.priority = 0,
+@@ -2971,19 +2985,25 @@ int __init ip6_route_init(void)
+ 	if (ret)
+ 		goto xfrm6_init;
+ 
++	ret = register_pernet_subsys(&ip6_route_net_late_ops);
++	if (ret)
++		goto fib6_rules_init;
++
+ 	ret = -ENOBUFS;
+ 	if (__rtnl_register(PF_INET6, RTM_NEWROUTE, inet6_rtm_newroute, NULL, NULL) ||
+ 	    __rtnl_register(PF_INET6, RTM_DELROUTE, inet6_rtm_delroute, NULL, NULL) ||
+ 	    __rtnl_register(PF_INET6, RTM_GETROUTE, inet6_rtm_getroute, NULL, NULL))
+-		goto fib6_rules_init;
++		goto out_register_late_subsys;
+ 
+ 	ret = register_netdevice_notifier(&ip6_route_dev_notifier);
+ 	if (ret)
+-		goto fib6_rules_init;
++		goto out_register_late_subsys;
+ 
+ out:
+ 	return ret;
+ 
++out_register_late_subsys:
++	unregister_pernet_subsys(&ip6_route_net_late_ops);
+ fib6_rules_init:
+ 	fib6_rules_cleanup();
+ xfrm6_init:
+@@ -3002,6 +3022,7 @@ out_kmem_cache:
+ void ip6_route_cleanup(void)
+ {
+ 	unregister_netdevice_notifier(&ip6_route_dev_notifier);
++	unregister_pernet_subsys(&ip6_route_net_late_ops);
+ 	fib6_rules_cleanup();
+ 	xfrm6_fini();
+ 	fib6_gc_cleanup();
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0040-bridge-Assign-rtnl_link_ops-to-bridge-devices-create.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0040-bridge-Assign-rtnl_link_ops-to-bridge-devices-create.patch
new file mode 100644
index 0000000..bacca53
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0040-bridge-Assign-rtnl_link_ops-to-bridge-devices-create.patch
@@ -0,0 +1,62 @@
+From e310ae5ff49ec77b2c991cffe288ac766e5f5203 Mon Sep 17 00:00:00 2001
+From: stephen hemminger <shemminger@vyatta.com>
+Date: Tue, 26 Jun 2012 05:48:45 +0000
+Subject: [PATCH 40/49] bridge: Assign rtnl_link_ops to bridge devices created
+ via ioctl (v2)
+
+[ Upstream commit 149ddd83a92b02c658d6c61f3276eb6500d585e8 ]
+
+This ensures that bridges created with brctl(8) or ioctl(2) directly
+also carry IFLA_LINKINFO when dumped over netlink. This also allows
+to create a bridge with ioctl(2) and delete it with RTM_DELLINK.
+
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/bridge/br_if.c      |    1 +
+ net/bridge/br_netlink.c |    2 +-
+ net/bridge/br_private.h |    1 +
+ 3 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/net/bridge/br_if.c b/net/bridge/br_if.c
+index f603e5b..f3f75ad 100644
+--- a/net/bridge/br_if.c
++++ b/net/bridge/br_if.c
+@@ -240,6 +240,7 @@ int br_add_bridge(struct net *net, const char *name)
+ 		return -ENOMEM;
+ 
+ 	dev_net_set(dev, net);
++	dev->rtnl_link_ops = &br_link_ops;
+ 
+ 	res = register_netdev(dev);
+ 	if (res)
+diff --git a/net/bridge/br_netlink.c b/net/bridge/br_netlink.c
+index a1daf82..cbf9ccd 100644
+--- a/net/bridge/br_netlink.c
++++ b/net/bridge/br_netlink.c
+@@ -211,7 +211,7 @@ static int br_validate(struct nlattr *tb[], struct nlattr *data[])
+ 	return 0;
+ }
+ 
+-static struct rtnl_link_ops br_link_ops __read_mostly = {
++struct rtnl_link_ops br_link_ops __read_mostly = {
+ 	.kind		= "bridge",
+ 	.priv_size	= sizeof(struct net_bridge),
+ 	.setup		= br_dev_setup,
+diff --git a/net/bridge/br_private.h b/net/bridge/br_private.h
+index 93264df..b9bba8f 100644
+--- a/net/bridge/br_private.h
++++ b/net/bridge/br_private.h
+@@ -536,6 +536,7 @@ extern int (*br_fdb_test_addr_hook)(struct net_device *dev, unsigned char *addr)
+ #endif
+ 
+ /* br_netlink.c */
++extern struct rtnl_link_ops br_link_ops;
+ extern int br_netlink_init(void);
+ extern void br_netlink_fini(void);
+ extern void br_ifinfo_notify(int event, struct net_bridge_port *port);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0041-Btrfs-run-delayed-directory-updates-during-log-repla.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0041-Btrfs-run-delayed-directory-updates-during-log-repla.patch
new file mode 100644
index 0000000..c6b1663
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0041-Btrfs-run-delayed-directory-updates-during-log-repla.patch
@@ -0,0 +1,56 @@
+From 478ed8ce8490d599e1bb8e79007b85d6a9e7f1a0 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@fusionio.com>
+Date: Mon, 2 Jul 2012 15:29:53 -0400
+Subject: [PATCH 41/49] Btrfs: run delayed directory updates during log replay
+
+commit b6305567e7d31b0bec1b8cb9ec0cadd7f7086f5f upstream.
+
+While we are resolving directory modifications in the
+tree log, we are triggering delayed metadata updates to
+the filesystem btrees.
+
+This commit forces the delayed updates to run so the
+replay code can find any modifications done.  It stops
+us from crashing because the directory deleltion replay
+expects items to be removed immediately from the tree.
+
+Signed-off-by: Chris Mason <chris.mason@fusionio.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/btrfs/tree-log.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/fs/btrfs/tree-log.c b/fs/btrfs/tree-log.c
+index 3568374..19b127c 100644
+--- a/fs/btrfs/tree-log.c
++++ b/fs/btrfs/tree-log.c
+@@ -692,6 +692,8 @@ static noinline int drop_one_dir_item(struct btrfs_trans_handle *trans,
+ 	kfree(name);
+ 
+ 	iput(inode);
++
++	btrfs_run_delayed_items(trans, root);
+ 	return ret;
+ }
+ 
+@@ -897,6 +899,7 @@ again:
+ 				ret = btrfs_unlink_inode(trans, root, dir,
+ 							 inode, victim_name,
+ 							 victim_name_len);
++				btrfs_run_delayed_items(trans, root);
+ 			}
+ 			kfree(victim_name);
+ 			ptr = (unsigned long)(victim_ref + 1) + victim_name_len;
+@@ -1477,6 +1480,9 @@ again:
+ 			ret = btrfs_unlink_inode(trans, root, dir, inode,
+ 						 name, name_len);
+ 			BUG_ON(ret);
++
++			btrfs_run_delayed_items(trans, root);
++
+ 			kfree(name);
+ 			iput(inode);
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0042-cifs-when-server-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0042-cifs-when-server-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch
new file mode 100644
index 0000000..435c9cb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0042-cifs-when-server-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch
@@ -0,0 +1,60 @@
+From 3ef708aec9359ad6b05d8ae43663cf5e73c58e9d Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Mon, 2 Jul 2012 07:24:25 -0400
+Subject: [PATCH 42/49] cifs: when server doesn't set CAP_LARGE_READ_X, cap
+ default rsize at MaxBufferSize
+
+commit ec01d738a1691dfc85b96b9f796020267a7be577 upstream.
+
+When the server doesn't advertise CAP_LARGE_READ_X, then MS-CIFS states
+that you must cap the size of the read at the client's MaxBufferSize.
+Unfortunately, testing with many older servers shows that they often
+can't service a read larger than their own MaxBufferSize.
+
+Since we can't assume what the server will do in this situation, we must
+be conservative here for the default. When the server can't do large
+reads, then assume that it can't satisfy any read larger than its
+MaxBufferSize either.
+
+Luckily almost all modern servers can do large reads, so this won't
+affect them. This is really just for older win9x and OS/2 era servers.
+Also, note that this patch just governs the default rsize. The admin can
+always override this if he so chooses.
+
+Reported-by: David H. Durgee <dhdurgee@acm.org>
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steven French <sfrench@w500smf.(none)>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/cifs/connect.c |    9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
+index 9e0675a..b21670c 100644
+--- a/fs/cifs/connect.c
++++ b/fs/cifs/connect.c
+@@ -2975,18 +2975,15 @@ cifs_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *pvolume_info)
+ 	 * MS-CIFS indicates that servers are only limited by the client's
+ 	 * bufsize for reads, testing against win98se shows that it throws
+ 	 * INVALID_PARAMETER errors if you try to request too large a read.
++	 * OS/2 just sends back short reads.
+ 	 *
+-	 * If the server advertises a MaxBufferSize of less than one page,
+-	 * assume that it also can't satisfy reads larger than that either.
+-	 *
+-	 * FIXME: Is there a better heuristic for this?
++	 * If the server doesn't advertise CAP_LARGE_READ_X, then assume that
++	 * it can't handle a read request larger than its MaxBufferSize either.
+ 	 */
+ 	if (tcon->unix_ext && (unix_cap & CIFS_UNIX_LARGE_READ_CAP))
+ 		defsize = CIFS_DEFAULT_IOSIZE;
+ 	else if (server->capabilities & CAP_LARGE_READ_X)
+ 		defsize = CIFS_DEFAULT_NON_POSIX_RSIZE;
+-	else if (server->maxBuf >= PAGE_CACHE_SIZE)
+-		defsize = CIFSMaxBufSize;
+ 	else
+ 		defsize = server->maxBuf - sizeof(READ_RSP);
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0043-ocfs2-clear-unaligned-io-flag-when-dio-fails.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0043-ocfs2-clear-unaligned-io-flag-when-dio-fails.patch
new file mode 100644
index 0000000..c07be0d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0043-ocfs2-clear-unaligned-io-flag-when-dio-fails.patch
@@ -0,0 +1,38 @@
+From 605e639247e5f40be06b013748769bd2cc252e04 Mon Sep 17 00:00:00 2001
+From: Junxiao Bi <junxiao.bi@oracle.com>
+Date: Wed, 27 Jun 2012 17:09:55 +0800
+Subject: [PATCH 43/49] ocfs2: clear unaligned io flag when dio fails
+
+commit 3e5d3c35a68c9a933bdbdd8685bd1a205b57e806 upstream.
+
+The unaligned io flag is set in the kiocb when an unaligned
+dio is issued, it should be cleared even when the dio fails,
+or it may affect the following io which are using the same
+kiocb.
+
+Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
+Signed-off-by: Joel Becker <jlbec@evilplan.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ocfs2/file.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
+index 6e39668..07ee5b4 100644
+--- a/fs/ocfs2/file.c
++++ b/fs/ocfs2/file.c
+@@ -2422,8 +2422,10 @@ out_dio:
+ 		unaligned_dio = 0;
+ 	}
+ 
+-	if (unaligned_dio)
++	if (unaligned_dio) {
++		ocfs2_iocb_clear_unaligned_aio(iocb);
+ 		atomic_dec(&OCFS2_I(inode)->ip_unaligned_aio);
++	}
+ 
+ out:
+ 	if (rw_level != -1)
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0044-aio-make-kiocb-private-NUll-in-init_sync_kiocb.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0044-aio-make-kiocb-private-NUll-in-init_sync_kiocb.patch
new file mode 100644
index 0000000..1084fef
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0044-aio-make-kiocb-private-NUll-in-init_sync_kiocb.patch
@@ -0,0 +1,39 @@
+From 21dbeb828448f788ffb3590cf6706c074bb1048f Mon Sep 17 00:00:00 2001
+From: Junxiao Bi <junxiao.bi@oracle.com>
+Date: Wed, 27 Jun 2012 17:09:54 +0800
+Subject: [PATCH 44/49] aio: make kiocb->private NUll in init_sync_kiocb()
+
+commit 2dfd06036ba7ae8e7be2daf5a2fff1dac42390bf upstream.
+
+Ocfs2 uses kiocb.*private as a flag of unsigned long size. In
+commit a11f7e6 ocfs2: serialize unaligned aio, the unaligned
+io flag is involved in it to serialize the unaligned aio. As
+*private is not initialized in init_sync_kiocb() of do_sync_write(),
+this unaligned io flag may be unexpectly set in an aligned dio.
+And this will cause OCFS2_I(inode)->ip_unaligned_aio decreased
+to -1 in ocfs2_dio_end_io(), thus the following unaligned dio
+will hang forever at ocfs2_aiodio_wait() in ocfs2_file_aio_write().
+
+Signed-off-by: Junxiao Bi <junxiao.bi@oracle.com>
+Acked-by: Jeff Moyer <jmoyer@redhat.com>
+Signed-off-by: Joel Becker <jlbec@evilplan.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/aio.h |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/include/linux/aio.h b/include/linux/aio.h
+index 2314ad8..b1a520e 100644
+--- a/include/linux/aio.h
++++ b/include/linux/aio.h
+@@ -140,6 +140,7 @@ struct kiocb {
+ 		(x)->ki_dtor = NULL;			\
+ 		(x)->ki_obj.tsk = tsk;			\
+ 		(x)->ki_user_data = 0;                  \
++		(x)->private = NULL;			\
+ 	} while (0)
+ 
+ #define AIO_RING_MAGIC			0xa10a10a1
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0045-mtd-cafe_nand-fix-an-vs-mistake.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0045-mtd-cafe_nand-fix-an-vs-mistake.patch
new file mode 100644
index 0000000..9003be4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0045-mtd-cafe_nand-fix-an-vs-mistake.patch
@@ -0,0 +1,39 @@
+From e48907a3c090265dcbe0965537bbe9b510a1f7ef Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Sat, 9 Jun 2012 19:08:25 +0300
+Subject: [PATCH 45/49] mtd: cafe_nand: fix an & vs | mistake
+
+commit 48f8b641297df49021093763a3271119a84990a2 upstream.
+
+The intent here was clearly to set result to true if the 0x40000000 flag
+was set.  But instead there was a | vs & typo and we always set result
+to true.
+
+Artem: check the spec at
+wiki.laptop.org/images/5/5c/88ALP01_Datasheet_July_2007.pdf
+and this fix looks correct.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/mtd/nand/cafe_nand.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/nand/cafe_nand.c b/drivers/mtd/nand/cafe_nand.c
+index 72d3f23..68ecf48 100644
+--- a/drivers/mtd/nand/cafe_nand.c
++++ b/drivers/mtd/nand/cafe_nand.c
+@@ -102,7 +102,7 @@ static const char *part_probes[] = { "cmdlinepart", "RedBoot", NULL };
+ static int cafe_device_ready(struct mtd_info *mtd)
+ {
+ 	struct cafe_priv *cafe = mtd->priv;
+-	int result = !!(cafe_readl(cafe, NAND_STATUS) | 0x40000000);
++	int result = !!(cafe_readl(cafe, NAND_STATUS) & 0x40000000);
+ 	uint32_t irqs = cafe_readl(cafe, NAND_IRQ);
+ 
+ 	cafe_writel(cafe, irqs, NAND_IRQ);
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0046-mm-Hold-a-file-reference-in-madvise_remove.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0046-mm-Hold-a-file-reference-in-madvise_remove.patch
new file mode 100644
index 0000000..82bb8b1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0046-mm-Hold-a-file-reference-in-madvise_remove.patch
@@ -0,0 +1,80 @@
+From 565460286859b1512972fc637f2c653cf648d622 Mon Sep 17 00:00:00 2001
+From: Andy Lutomirski <luto@amacapital.net>
+Date: Thu, 5 Jul 2012 16:00:11 -0700
+Subject: [PATCH 46/49] mm: Hold a file reference in madvise_remove
+
+commit 9ab4233dd08036fe34a89c7dc6f47a8bf2eb29eb upstream.
+
+Otherwise the code races with munmap (causing a use-after-free
+of the vma) or with close (causing a use-after-free of the struct
+file).
+
+The bug was introduced by commit 90ed52ebe481 ("[PATCH] holepunch: fix
+mmap_sem i_mutex deadlock")
+
+Cc: Hugh Dickins <hugh@veritas.com>
+Cc: Miklos Szeredi <mszeredi@suse.cz>
+Cc: Badari Pulavarty <pbadari@us.ibm.com>
+Cc: Nick Piggin <npiggin@suse.de>
+Signed-off-by: Andy Lutomirski <luto@amacapital.net>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+[bwh: Backported to 3.2:
+ - Adjust context
+ - madvise_remove() calls vmtruncate_range(), not do_fallocate()]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/madvise.c |   16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/mm/madvise.c b/mm/madvise.c
+index 74bf193..23d3a6b 100644
+--- a/mm/madvise.c
++++ b/mm/madvise.c
+@@ -13,6 +13,7 @@
+ #include <linux/hugetlb.h>
+ #include <linux/sched.h>
+ #include <linux/ksm.h>
++#include <linux/file.h>
+ 
+ /*
+  * Any behaviour which results in changes to the vma->vm_flags needs to
+@@ -197,14 +198,16 @@ static long madvise_remove(struct vm_area_struct *vma,
+ 	struct address_space *mapping;
+ 	loff_t offset, endoff;
+ 	int error;
++	struct file *f;
+ 
+ 	*prev = NULL;	/* tell sys_madvise we drop mmap_sem */
+ 
+ 	if (vma->vm_flags & (VM_LOCKED|VM_NONLINEAR|VM_HUGETLB))
+ 		return -EINVAL;
+ 
+-	if (!vma->vm_file || !vma->vm_file->f_mapping
+-		|| !vma->vm_file->f_mapping->host) {
++	f = vma->vm_file;
++
++	if (!f || !f->f_mapping || !f->f_mapping->host) {
+ 			return -EINVAL;
+ 	}
+ 
+@@ -218,9 +221,16 @@ static long madvise_remove(struct vm_area_struct *vma,
+ 	endoff = (loff_t)(end - vma->vm_start - 1)
+ 			+ ((loff_t)vma->vm_pgoff << PAGE_SHIFT);
+ 
+-	/* vmtruncate_range needs to take i_mutex */
++	/*
++	 * vmtruncate_range may need to take i_mutex.  We need to
++	 * explicitly grab a reference because the vma (and hence the
++	 * vma's reference to the file) can go away as soon as we drop
++	 * mmap_sem.
++	 */
++	get_file(f);
+ 	up_read(&current->mm->mmap_sem);
+ 	error = vmtruncate_range(mapping->host, offset, endoff);
++	fput(f);
+ 	down_read(&current->mm->mmap_sem);
+ 	return error;
+ }
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0047-tcm_fc-Resolve-suspicious-RCU-usage-warnings.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0047-tcm_fc-Resolve-suspicious-RCU-usage-warnings.patch
new file mode 100644
index 0000000..e0373e0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0047-tcm_fc-Resolve-suspicious-RCU-usage-warnings.patch
@@ -0,0 +1,36 @@
+From 7b764186beda304507cde2161d84f4e9b16c8ce6 Mon Sep 17 00:00:00 2001
+From: Mark Rustad <mark.d.rustad@intel.com>
+Date: Tue, 26 Jun 2012 15:57:30 -0700
+Subject: [PATCH 47/49] tcm_fc: Resolve suspicious RCU usage warnings
+
+commit 863555be0c81558b1af277addcf68acb8f778860 upstream.
+
+Use rcu_dereference_protected to tell rcu that the ft_lport_lock
+is held during ft_lport_create. This resolved "suspicious RCU usage"
+warnings when debugging options are turned on.
+
+Signed-off-by: Mark Rustad <mark.d.rustad@intel.com>
+Tested-by: Ross Brattain <ross.b.brattain@intel.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/tcm_fc/tfc_sess.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/target/tcm_fc/tfc_sess.c b/drivers/target/tcm_fc/tfc_sess.c
+index 3269213..64ddb63 100644
+--- a/drivers/target/tcm_fc/tfc_sess.c
++++ b/drivers/target/tcm_fc/tfc_sess.c
+@@ -61,7 +61,8 @@ static struct ft_tport *ft_tport_create(struct fc_lport *lport)
+ 	struct ft_tport *tport;
+ 	int i;
+ 
+-	tport = rcu_dereference(lport->prov[FC_TYPE_FCP]);
++	tport = rcu_dereference_protected(lport->prov[FC_TYPE_FCP],
++					  lockdep_is_held(&ft_lport_lock));
+ 	if (tport && tport->tpg)
+ 		return tport;
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0048-vfs-make-O_PATH-file-descriptors-usable-for-fchdir.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0048-vfs-make-O_PATH-file-descriptors-usable-for-fchdir.patch
new file mode 100644
index 0000000..eb450c1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0048-vfs-make-O_PATH-file-descriptors-usable-for-fchdir.patch
@@ -0,0 +1,56 @@
+From 7c0f859e15ad91f6d6921970fc9d48f1f7804bf9 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Sat, 7 Jul 2012 10:17:00 -0700
+Subject: [PATCH 48/49] vfs: make O_PATH file descriptors usable for
+ 'fchdir()'
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 332a2e1244bd08b9e3ecd378028513396a004a24 upstream.
+
+We already use them for openat() and friends, but fchdir() also wants to
+be able to use O_PATH file descriptors.  This should make it comparable
+to the O_SEARCH of Solaris.  In particular, O_PATH allows you to access
+(not-quite-open) a directory you don't have read persmission to, only
+execute permission.
+
+Noticed during development of multithread support for ksh93.
+
+Reported-by: ольга крыжановская <olga.kryzhanovska@gmail.com>
+Cc: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/open.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/fs/open.c b/fs/open.c
+index 22c41b5..e2b5d51 100644
+--- a/fs/open.c
++++ b/fs/open.c
+@@ -396,10 +396,10 @@ SYSCALL_DEFINE1(fchdir, unsigned int, fd)
+ {
+ 	struct file *file;
+ 	struct inode *inode;
+-	int error;
++	int error, fput_needed;
+ 
+ 	error = -EBADF;
+-	file = fget(fd);
++	file = fget_raw_light(fd, &fput_needed);
+ 	if (!file)
+ 		goto out;
+ 
+@@ -413,7 +413,7 @@ SYSCALL_DEFINE1(fchdir, unsigned int, fd)
+ 	if (!error)
+ 		set_fs_pwd(current->fs, &file->f_path);
+ out_putf:
+-	fput(file);
++	fput_light(file, fput_needed);
+ out:
+ 	return error;
+ }
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0049-Linux-3.2.23.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0049-Linux-3.2.23.patch
new file mode 100644
index 0000000..6fa83d1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.23/0049-Linux-3.2.23.patch
@@ -0,0 +1,24 @@
+From 70aac971ed12a5a23e0b10035df743f2ada81151 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Thu, 12 Jul 2012 04:32:21 +0100
+Subject: [PATCH 49/49] Linux 3.2.23
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 9a7d921..40d1e3b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 22
++SUBLEVEL = 23
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
index a76d5c1..ce72ebd 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
@@ -1,12 +1,12 @@
-From 0a8e60a2f92c5507739e84cdbe5fb3de3f4ee1b6 Mon Sep 17 00:00:00 2001
+From 87fae6477f8987244e2331dc60001c79e5421e80 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 7 Oct 2011 15:29:28 +0200
-Subject: [PATCH 01/56] f_rndis: HACK around undefined variables
+Subject: [PATCH 01/79] f_rndis: HACK around undefined variables
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/usb/gadget/f_rndis.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/usb/gadget/f_rndis.c b/drivers/usb/gadget/f_rndis.c
 index 6614490..d2f1b6f 100644
@@ -27,5 +27,5 @@ index 6614490..d2f1b6f 100644
  	 * the network link ... which is unavailable to this code
  	 * until we're activated via set_alt().
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
index b227e64..158ed0c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -1,12 +1,12 @@
-From 7db7d9b0c2ca8aea0ae522b7fc30c7ac034edfe2 Mon Sep 17 00:00:00 2001
+From 30dcf1f8efb223e5b6fc3c049bc8ce3236ec17a0 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 3 Nov 2011 17:35:50 +0100
-Subject: [PATCH 02/56] da8xx-fb: add DVI support for beaglebone
+Subject: [PATCH 02/79] da8xx-fb: add DVI support for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/video/da8xx-fb.c |   14 ++++++++++++++
- 1 files changed, 14 insertions(+), 0 deletions(-)
+ 1 file changed, 14 insertions(+)
 
 diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
 index 2e69278..b01f15b 100644
@@ -34,5 +34,5 @@ index 2e69278..b01f15b 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
index 680fa6a..53f7355 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -1,13 +1,13 @@
-From 8ba62500dc8a2a033099ddcf85fd765b09c47f6d Mon Sep 17 00:00:00 2001
+From 482ed8f98b87299bf77298b86871b4af74334751 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 30 Jan 2012 21:30:09 +0100
-Subject: [PATCH 03/56] beaglebone: rebase everything onto 3.2 - WARNING
+Subject: [PATCH 03/79] beaglebone: rebase everything onto 3.2 - WARNING
  MEGAPATCH
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |  426 ++++++++++++++++++++++++++++++++-
- 1 files changed, 415 insertions(+), 11 deletions(-)
+ 1 file changed, 415 insertions(+), 11 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 563bdf1..2741431 100644
@@ -559,5 +559,5 @@ index 563bdf1..2741431 100644
  	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
  	am335x_mmc[0].gpio_wp = -EINVAL;
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
index 1672a11..9e3186d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
@@ -1,12 +1,12 @@
-From b5158f58ced19e39423d3f12b01f67435a1029b0 Mon Sep 17 00:00:00 2001
+From e495bd4f47ad3b8f48916582b12ec0bf0a7e7134 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:04:03 +0100
-Subject: [PATCH 04/56] more beaglebone merges
+Subject: [PATCH 04/79] more beaglebone merges
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   52 +++++++++++++++++++++++++++++++-
- 1 files changed, 50 insertions(+), 2 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   52 +++++++++++++++++++++++++++++++--
+ 1 file changed, 50 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 2741431..ffbecae 100644
@@ -103,5 +103,5 @@ index 2741431..ffbecae 100644
  	} else if (!strncmp("1.0", config.version, 3)) {
  		gp_evm_revision = GP_EVM_REV_IS_1_0;
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
index 6d8fdb8..5cd6f46 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
@@ -1,12 +1,12 @@
-From 590219f8dedc88345dff5e2fcac3c63501333aba Mon Sep 17 00:00:00 2001
+From fd6ae50df7aee160e23cce68bf5c0fd223f2700a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:09:06 +0100
-Subject: [PATCH 05/56] beaglebone: disable tsadc
+Subject: [PATCH 05/79] beaglebone: disable tsadc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index ffbecae..ba611c0 100644
@@ -27,5 +27,5 @@ index ffbecae..ba611c0 100644
  
  static u8 am335x_iis_serializer_direction1[] = {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
index 3dbd5d1..d0f7194 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -1,7 +1,7 @@
-From d15ac41429630a7065e409079370efc4cfcb3e65 Mon Sep 17 00:00:00 2001
+From d434e8f8c1fec1f10d2475a014ed26d4e5bc8579 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:00:40 +0100
-Subject: [PATCH 06/56] tscadc: Add general purpose mode, untested with
+Subject: [PATCH 06/79] tscadc: Add general purpose mode, untested with
  touchscreen functionality
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
@@ -402,5 +402,5 @@ index 2c547bb..850cd4b 100644
 +	int mode;
  };
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
index 6852fc6..787d426 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -1,7 +1,7 @@
-From 5275f0cc4c9f541711ab49e7e179a153fb61cda5 Mon Sep 17 00:00:00 2001
+From dc7ef10b1e755f188cfc92f4e1d8a43c8e661392 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:02:17 +0100
-Subject: [PATCH 07/56] tscadc: Add board file mfd support, fix warning
+Subject: [PATCH 07/79] tscadc: Add board file mfd support, fix warning
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -40,5 +40,5 @@ index c6dc6f0..b50a08c 100644
  	int				clk_value;
  	int				clock_rate, irqenable, ctrl;
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
index fe1db5c..9434c57 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -1,12 +1,12 @@
-From e9aa7ff6f36d532d2268cd3b91555cbeb72fda4f Mon Sep 17 00:00:00 2001
+From b67913c3de1b8789c9d1881391b9bfb0beaa00ee Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:03:59 +0100
-Subject: [PATCH 08/56] AM335X: init tsc bone style for new boards
+Subject: [PATCH 08/79] AM335X: init tsc bone style for new boards
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 64a0c0a..6b78ae6 100644
@@ -22,5 +22,5 @@ index 64a0c0a..6b78ae6 100644
  };
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
index 8d73637..5f43ac4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
@@ -1,12 +1,12 @@
-From 7042bb10731908812bc3b248b963899898773c4b Mon Sep 17 00:00:00 2001
+From 3b70f6dd0dd6f6c1fbd71b7090a3340382b3c77e Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 18:18:04 -0600
-Subject: [PATCH 09/56] tscadc: make stepconfig channel-configurable
+Subject: [PATCH 09/79] tscadc: make stepconfig channel-configurable
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  drivers/input/touchscreen/ti_tscadc.c |    8 +++++---
- 1 files changed, 5 insertions(+), 3 deletions(-)
+ 1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index b50a08c..6083de7 100644
@@ -42,5 +42,5 @@ index b50a08c..6083de7 100644
  		irqenable = TSCADC_IRQENB_FIFO0THRES;
  	}
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
index 27052fc..6afca79 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
@@ -1,7 +1,7 @@
-From 23f1ea4e1324704d36381cf1a2b6d4578c5f3fb4 Mon Sep 17 00:00:00 2001
+From 19415df67c6e3802c007832e356933d33435558b Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:55:25 -0600
-Subject: [PATCH 10/56] tscadc: Trigger through sysfs
+Subject: [PATCH 10/79] tscadc: Trigger through sysfs
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -145,5 +145,5 @@ index 850cd4b..fc239c6 100644
  #define TI_TSCADC_TSCMODE 0
  #define TI_TSCADC_GENMODE 1
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
index d6d6a8f..1bd64b4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -1,12 +1,12 @@
-From 44e604188006ae23fb48fe27b68b20cc9e3b20cb Mon Sep 17 00:00:00 2001
+From 956815a5ce5d2708ad3f14bdd0c6aaee056febbb Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:56:48 -0600
-Subject: [PATCH 11/56] meta-ti: Remove debug messages for meta-ti
+Subject: [PATCH 11/79] meta-ti: Remove debug messages for meta-ti
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  drivers/input/touchscreen/ti_tscadc.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index d6aec8c..da48bcd 100644
@@ -30,5 +30,5 @@ index d6aec8c..da48bcd 100644
  		for (i = 0; i < fifo1count; i++) {
  			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
index 86ef82e..d9fd2a7 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -1,12 +1,12 @@
-From 04b4ae6caf9912acb99b294ab946ca88146ec6a9 Mon Sep 17 00:00:00 2001
+From 393a7b11a2819b5149c909a801b1f8be4d781771 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Tue, 29 Nov 2011 09:44:22 -0600
-Subject: [PATCH 12/56] tscadc: switch to polling instead of interrupts
+Subject: [PATCH 12/79] tscadc: switch to polling instead of interrupts
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
  drivers/input/touchscreen/ti_tscadc.c |   16 ++++++++++++++--
- 1 files changed, 14 insertions(+), 2 deletions(-)
+ 1 file changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index da48bcd..4fd2e18 100644
@@ -50,5 +50,5 @@ index da48bcd..4fd2e18 100644
  	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
index b15e894..3db4f7d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
@@ -1,12 +1,12 @@
-From 14830f07a752e8c2d643a307ebb5e268008d9c04 Mon Sep 17 00:00:00 2001
+From 33bbdc8dfb22170f7be9286c653fbac9d9c8f196 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 14:50:55 +0100
-Subject: [PATCH 13/56] beaglebone: fix ADC init
+Subject: [PATCH 13/79] beaglebone: fix ADC init
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    6 ++----
- 1 files changed, 2 insertions(+), 4 deletions(-)
+ 1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 6b78ae6..ffbecae 100644
@@ -43,5 +43,5 @@ index 6b78ae6..ffbecae 100644
  };
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
index 3fec092..489c64e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
@@ -1,12 +1,12 @@
-From ae3da1ea2d7c8b915e8eebec7d5f3524f53bf510 Mon Sep 17 00:00:00 2001
+From 10099d6354fc3c61306788e4070cfbd20722fb80 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 16:49:52 +0100
-Subject: [PATCH 14/56] AM335x: MUX: add ehrpwm1A
+Subject: [PATCH 14/79] AM335x: MUX: add ehrpwm1A
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/mux33xx.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
 index 572ed16..0f71646 100644
@@ -22,5 +22,5 @@ index 572ed16..0f71646 100644
  		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
  		NULL, NULL, NULL, "gpio1_19"),
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
index e20d320..0d645ff 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
@@ -1,13 +1,13 @@
-From 8930849074cc11163a2f176927d4e76072d4fb80 Mon Sep 17 00:00:00 2001
+From 33182602bad8a5aec644e69d800f5bc5c6604419 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 17:02:10 +0100
-Subject: [PATCH 15/56] beaglebone: enable PWM for lcd backlight <- backlight
+Subject: [PATCH 15/79] beaglebone: enable PWM for lcd backlight <- backlight
  is inverted
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   51 +++++++++++++++++++++++++++------
- 1 files changed, 42 insertions(+), 9 deletions(-)
+ 1 file changed, 42 insertions(+), 9 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index ffbecae..43a83ca 100644
@@ -119,5 +119,5 @@ index ffbecae..43a83ca 100644
  	}
  	
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
index 0ef109c..120f59f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -1,7 +1,7 @@
-From e099fdb60eae41faea813fd1098af28b38f050d1 Mon Sep 17 00:00:00 2001
+From ec0ef23dd64de808f7e9d827ee82ac4734d8a003 Mon Sep 17 00:00:00 2001
 From: Steve Sakoman <steve@sakoman.com>
 Date: Mon, 18 Jul 2011 23:13:41 -0500
-Subject: [PATCH 16/56] omap_hsmmc: Set dto to max value of 14 to avoid SD
+Subject: [PATCH 16/79] omap_hsmmc: Set dto to max value of 14 to avoid SD
  Card timeouts
 
 This fixes MMC errors due to timeouts on certain SD Cards following suggestions
@@ -13,13 +13,13 @@ http://talk.maemo.org/showthread.php?p=1000707#post1000707
 This fix was originally proposed by Sukumar Ghoral of TI.
 ---
  drivers/mmc/host/omap_hsmmc.c |    3 +++
- 1 files changed, 3 insertions(+), 0 deletions(-)
+ 1 file changed, 3 insertions(+)
 
 diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
-index 1f938d9..ace26f7 100644
+index 22da8f2..adbc4d1 100644
 --- a/drivers/mmc/host/omap_hsmmc.c
 +++ b/drivers/mmc/host/omap_hsmmc.c
-@@ -1542,6 +1542,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host)
+@@ -1554,6 +1554,9 @@ static void set_data_timeout(struct omap_hsmmc_host *host)
  	/* Use the maximum timeout value allowed in the standard of 14 or 0xE */
  	dto = 14;
  
@@ -30,5 +30,5 @@ index 1f938d9..ace26f7 100644
  	reg |= dto << DTO_SHIFT;
  	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
index 3ad8b52..ed19d76 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
@@ -1,13 +1,13 @@
-From 8de8f4d2da1d92847f27babbf3a91ca960afdbc9 Mon Sep 17 00:00:00 2001
+From 5ef54fcdbb6f2cee36b88ed04ea7c3d604702659 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 1 Feb 2012 14:10:38 +0100
-Subject: [PATCH 17/56] beaglebone: set default brightness to 50% for pwm
+Subject: [PATCH 17/79] beaglebone: set default brightness to 50% for pwm
  backlights
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 43a83ca..97b069f 100644
@@ -23,5 +23,5 @@ index 43a83ca..97b069f 100644
  
  #define PWM_DEVICE_ID   "ecap.0"
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
index d6a06f1..de1854b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
@@ -1,7 +1,7 @@
-From 4d3af135dec5fcd7119e62c17d5db6d678ad68d5 Mon Sep 17 00:00:00 2001
+From b54647b2f6825845e678995cf9a9824f763b6eb1 Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Mon, 21 Nov 2011 12:55:23 -0500
-Subject: [PATCH 18/56] st7735fb: WIP framebuffer driver supporting Adafruit
+Subject: [PATCH 18/79] st7735fb: WIP framebuffer driver supporting Adafruit
  1.8" SPI LCD
 
 Signed-off-by: Matt Porter <mporter@ti.com>
@@ -11,7 +11,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  drivers/video/Makefile   |    1 +
  drivers/video/st7735fb.c |  516 ++++++++++++++++++++++++++++++++++++++++++++++
  include/video/st7735fb.h |   86 ++++++++
- 4 files changed, 614 insertions(+), 0 deletions(-)
+ 4 files changed, 614 insertions(+)
  create mode 100644 drivers/video/st7735fb.c
  create mode 100644 include/video/st7735fb.h
 
@@ -664,5 +664,5 @@ index 0000000..250f036
 +
 +
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
index 96390aa..6751e96 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
@@ -1,12 +1,12 @@
-From 6a862f51ac8eca5e4e00acdc13a73db521eb74fa Mon Sep 17 00:00:00 2001
+From 1fcc4aabf4fa4ffe4ebfbfe4adbce3913389a0a0 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 7 Feb 2012 11:01:13 +0100
-Subject: [PATCH 19/56] beaglebone: use P8_6 (gpio1_3) as w1 bus
+Subject: [PATCH 19/79] beaglebone: use P8_6 (gpio1_3) as w1 bus
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   31 +++++++++++++++++++++++++++++++
- 1 files changed, 31 insertions(+), 0 deletions(-)
+ 1 file changed, 31 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 97b069f..3ba4bbc 100644
@@ -79,5 +79,5 @@ index 97b069f..3ba4bbc 100644
  };
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
index 80e2b1e..1a63942 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
@@ -1,13 +1,13 @@
-From fc2a970788a0181b495f79a78b35e6bdd6987aa8 Mon Sep 17 00:00:00 2001
+From c57ec6cbf0fc195c3253b9db23dab08554377cd5 Mon Sep 17 00:00:00 2001
 From: Alessandro Zummo <a.zummo@towertech.it>
 Date: Thu, 9 Feb 2012 12:46:52 +0100
-Subject: [PATCH 20/56] beaglebone: add support for Towertech TT3201 CAN cape
+Subject: [PATCH 20/79] beaglebone: add support for Towertech TT3201 CAN cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   54 ++++++++++++++++++++++++++++++++-
- arch/arm/mach-omap2/mux33xx.c         |    8 ++--
- drivers/net/can/dev.c                 |    8 ++--
+ arch/arm/mach-omap2/mux33xx.c         |    8 ++---
+ drivers/net/can/dev.c                 |    8 ++---
  drivers/net/can/mcp251x.c             |   47 ++++++++++++++++++++++------
  4 files changed, 98 insertions(+), 19 deletions(-)
 
@@ -316,5 +316,5 @@ index 330140e..b3e231c 100644
  	}
  error_probe:
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
index b242789..607d3c8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -1,12 +1,12 @@
-From b7bcc2d2d68f0683ee25027fa33afd43357912cb Mon Sep 17 00:00:00 2001
+From 3d11cccc72d7ec50c8da319e45cafb4f02431211 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 12:01:35 +0100
-Subject: [PATCH 21/56] beaglebone: add more beagleboardtoys cape partnumbers
+Subject: [PATCH 21/79] beaglebone: add more beagleboardtoys cape partnumbers
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   25 ++++++++++++++++++++++++-
- 1 files changed, 24 insertions(+), 1 deletions(-)
+ 1 file changed, 24 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index a8dfcdf..f854329 100644
@@ -49,5 +49,5 @@ index a8dfcdf..f854329 100644
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
  		bone_tsc_init(0,0);
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
index e29a568..4eaefff 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -1,13 +1,13 @@
-From 7d829ebc289c6e311171cb3974e428ed2562c0ad Mon Sep 17 00:00:00 2001
+From bc8957c4a563945781b0e3c41f5a8068d88122f9 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 13:32:43 +0100
-Subject: [PATCH 22/56] beaglebone: add gpio-keys for lcd7, add notes for
+Subject: [PATCH 22/79] beaglebone: add gpio-keys for lcd7, add notes for
  missing functionality for other capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   79 +++++++++++++++++++++++++++++++++
- 1 files changed, 79 insertions(+), 0 deletions(-)
+ 1 file changed, 79 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index f854329..9e9cf5b 100644
@@ -126,5 +126,5 @@ index f854329..9e9cf5b 100644
  	}
  	
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
index 4b8faef..25a73d4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
@@ -1,12 +1,12 @@
-From d7eecab57e0c72ef16663b45d2e1498368cfe9fe Mon Sep 17 00:00:00 2001
+From 1fb7daa57c2079ec42cff0d26336e430fad7946f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 14:26:37 +0100
-Subject: [PATCH 23/56] beaglebone: add enter key for lcd7 cape
+Subject: [PATCH 23/79] beaglebone: add enter key for lcd7 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
+ 1 file changed, 9 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 9e9cf5b..8c78eb5 100644
@@ -36,5 +36,5 @@ index 9e9cf5b..8c78eb5 100644
  
  static struct gpio_keys_platform_data beaglebone_lcd7_gpio_key_info = {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
index 3fb1d9d..49ef146 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
@@ -1,12 +1,12 @@
-From 15f9d6c3d2ea7b9c932b311e7b615735bb940f01 Mon Sep 17 00:00:00 2001
+From 5bc55512fb72b331c09769036da6b754430fd399 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 15:15:06 +0100
-Subject: [PATCH 24/56] beaglebone: add gpio-keys for lcd
+Subject: [PATCH 24/79] beaglebone: add gpio-keys for lcd
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   82 +++++++++++++++++++++++++++++++--
- 1 files changed, 78 insertions(+), 4 deletions(-)
+ 1 file changed, 78 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 8c78eb5..5266f78 100644
@@ -109,5 +109,5 @@ index 8c78eb5..5266f78 100644
  	
  	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
index 39f255b..e0d5c0c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
@@ -1,12 +1,12 @@
-From 9ae51575e2d99c806ee5caabb4a11a380e5e9b7b Mon Sep 17 00:00:00 2001
+From a9f029372abbaef2e9f55e2be728ae8bbc54bdaa Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 26 Mar 2012 20:28:56 +0200
-Subject: [PATCH 25/56] beaglebone: fix direction of gpio-keys
+Subject: [PATCH 25/79] beaglebone: fix direction of gpio-keys
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   20 ++++++++++----------
- 1 files changed, 10 insertions(+), 10 deletions(-)
+ 1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 5266f78..36b0c85 100644
@@ -103,5 +103,5 @@ index 5266f78..36b0c85 100644
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
index 879920d..bb2f002 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
@@ -1,7 +1,7 @@
-From 1979148439115875ee92c370e369a28ba3b5f37c Mon Sep 17 00:00:00 2001
+From 6f82ce8b4cd239aa7b262e0a0b62d42545b9d21b Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 29 Feb 2012 17:25:22 +0100
-Subject: [PATCH 26/56] beaglebone: fix 3.5" lcd cape support
+Subject: [PATCH 26/79] beaglebone: fix 3.5" lcd cape support
 
 * proper timings
 * fix gpio conflict
@@ -10,7 +10,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
  drivers/video/da8xx-fb.c              |   14 +++++++++++
- 2 files changed, 55 insertions(+), 1 deletions(-)
+ 2 files changed, 55 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 36b0c85..127516f 100644
@@ -105,5 +105,5 @@ index b01f15b..86b19ac 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
index 414a958..05439e6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
@@ -1,13 +1,13 @@
-From 07553571e947d49d906d5f12fd0cb4eac6a8c4e5 Mon Sep 17 00:00:00 2001
+From b199c282abaee2188141c0885198466e8028f181 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 11:25:00 +0200
-Subject: [PATCH 27/56] beaglebone: decrease PWM frequency to old value, LCD7
+Subject: [PATCH 27/79] beaglebone: decrease PWM frequency to old value, LCD7
  doesn't like it
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 127516f..4d5238d 100644
@@ -23,5 +23,5 @@ index 127516f..4d5238d 100644
  #define PWM_DEVICE_ID   "ecap.0"
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
index 42e945f..066d499 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
@@ -1,12 +1,12 @@
-From 1ca68f8e87f5825a54c41f5d1fbf90fc2c09496c Mon Sep 17 00:00:00 2001
+From 4456663edfc37d478da19c13683b9e58833ca997 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 12:35:01 +0200
-Subject: [PATCH 28/56] beaglebone: fix ehrpwm backlight
+Subject: [PATCH 28/79] beaglebone: fix ehrpwm backlight
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ 1 file changed, 1 insertion(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 4d5238d..24ed0b6 100644
@@ -21,5 +21,5 @@ index 4d5238d..24ed0b6 100644
  
  /* Setup pwm-backlight for bbtoys7lcd */
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
index 6dc4a4b..03676a6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
@@ -1,12 +1,12 @@
-From 247ab0d5d63145121e94afaee1b221545d37eb20 Mon Sep 17 00:00:00 2001
+From d79d7b027fa6f411a64d65d56d0421cde619f43c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 12:57:38 +0200
-Subject: [PATCH 29/56] beaglebone: also report cape revision
+Subject: [PATCH 29/79] beaglebone: also report cape revision
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 24ed0b6..a4e113c 100644
@@ -32,5 +32,5 @@ index 24ed0b6..a4e113c 100644
  	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
index 7af3073..a4409d1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
@@ -1,13 +1,13 @@
-From e33f195b5e929944ce6934c38a135821f8206a1a Mon Sep 17 00:00:00 2001
+From bb7bebd5eb51467ff920773cc8dd321102b8d528 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 07:55:55 +0200
-Subject: [PATCH 30/56] beaglebone: don't compare undefined characters, it
+Subject: [PATCH 30/79] beaglebone: don't compare undefined characters, it
  makes strncomp fail
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index a4e113c..f2f03b6 100644
@@ -23,5 +23,5 @@ index a4e113c..f2f03b6 100644
  		dvi_init(0,0);
  	}
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
index f7e47de..4a91e71 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
@@ -1,12 +1,12 @@
-From 138b017b71191f87a5f00f94995f144e432b8d9f Mon Sep 17 00:00:00 2001
+From 46f31bc6d2e3c44f0591216db3151408a0d97133 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 14:33:53 +0200
-Subject: [PATCH 31/56] beaglebone: fix 3.5" cape support
+Subject: [PATCH 31/79] beaglebone: fix 3.5" cape support
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
- 1 files changed, 41 insertions(+), 1 deletions(-)
+ 1 file changed, 41 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index f2f03b6..3adc4ac 100644
@@ -69,5 +69,5 @@ index f2f03b6..3adc4ac 100644
  	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
  	if (conf_disp_pll(16000000)) {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
index 7f922d8..6fe7c89 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
@@ -1,12 +1,12 @@
-From dbae54fe993315205d8415ef78e83f149c829a9b Mon Sep 17 00:00:00 2001
+From d8f8e88b0ea9cf4e94a601d5ee2601ee8f1b6d52 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 25 Apr 2012 12:35:07 +0200
-Subject: [PATCH 32/56] beaglebone: connect batterycape GPIO to gpio-charger
+Subject: [PATCH 32/79] beaglebone: connect batterycape GPIO to gpio-charger
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   46 ++++++++++++++++++++++++++++++++-
- 1 files changed, 45 insertions(+), 1 deletions(-)
+ 1 file changed, 45 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 3adc4ac..717bb8c 100644
@@ -80,5 +80,5 @@ index 3adc4ac..717bb8c 100644
  	
  	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
index 6d8b646..a4eaf50 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
@@ -1,12 +1,12 @@
-From 2345361d8188eb3a946f2a0ab9e648eba2cc9c27 Mon Sep 17 00:00:00 2001
+From f9b6989bb732e354c174da80052abbba49f238dd Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 4 May 2012 13:19:45 +0200
-Subject: [PATCH 33/56] beaglebone: add support for CAN and RS232 cape
+Subject: [PATCH 33/79] beaglebone: add support for CAN and RS232 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++-----
- 1 files changed, 30 insertions(+), 6 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++------
+ 1 file changed, 30 insertions(+), 6 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 717bb8c..6e7b203 100644
@@ -63,5 +63,5 @@ index 717bb8c..6e7b203 100644
  	}
  	
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
index 14e7cd6..6eceb51 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-add-support-for-DVI-rev.-A2-capes.patch
@@ -1,12 +1,12 @@
-From 64918c14ce7c12660cdf3b7650d6992a4eb7a69e Mon Sep 17 00:00:00 2001
+From 79504e3e113ac68335eb899322a56f3a72462b08 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 14:23:06 +0200
-Subject: [PATCH 34/56] beaglebone: add support for DVI rev. A2 capes
+Subject: [PATCH 34/79] beaglebone: add support for DVI rev. A2 capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |  150 ++++++++-------------------------
- 1 files changed, 35 insertions(+), 115 deletions(-)
+ 1 file changed, 35 insertions(+), 115 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 6e7b203..e02c0b6 100644
@@ -238,5 +238,5 @@ index 6e7b203..e02c0b6 100644
  	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
  		pr_info("BeagleBone cape: initializing LCD cape\n");
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
index 3d05376..622d76b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-enable-LEDs-for-DVI-LCD3-and-LCD7-capes.patch
@@ -1,12 +1,12 @@
-From 11a78ddde39b0ae90c718b724426e01b6af3f8e1 Mon Sep 17 00:00:00 2001
+From d54dc11ed06da5b83c2c99b404483eefd13d2074 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 11 May 2012 13:08:24 +0200
-Subject: [PATCH 35/56] beaglebone: enable LEDs for DVI, LCD3 and LCD7 capes
+Subject: [PATCH 35/79] beaglebone: enable LEDs for DVI, LCD3 and LCD7 capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |  140 ++++++++++++++++++++++++++++++--
- 1 files changed, 131 insertions(+), 9 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |  140 ++++++++++++++++++++++++++++++---
+ 1 file changed, 131 insertions(+), 9 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index e02c0b6..8db33b9 100644
@@ -236,5 +236,5 @@ index e02c0b6..8db33b9 100644
  	{NULL, 0, 0},
  };
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
index c576682..e4bc851 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0036-Beaglebone-Fixed-compiletime-warnings.patch
@@ -1,12 +1,12 @@
-From b038926e4aa0feeeb20bbcf5bb24765ae40162f5 Mon Sep 17 00:00:00 2001
+From 402cc5ad4f97373171cd7e1cfe17ad5165a8c42c Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:06:24 +0200
-Subject: [PATCH 36/56] Beaglebone: Fixed compiletime warnings.
+Subject: [PATCH 36/79] Beaglebone: Fixed compiletime warnings.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 8db33b9..b48e0fd 100644
@@ -44,5 +44,5 @@ index 8db33b9..b48e0fd 100644
  	ret = mem_acc->read(mem_acc, (char *)&cape_config, 0, sizeof(cape_config));
  	if (ret != sizeof(cape_config)) {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
index e40cd63..a042216 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0037-Beaglebone-Added-missing-termination-record-to-bone_.patch
@@ -1,13 +1,13 @@
-From 387e0633f95924f2e70dd48651720c6718e0ff2f Mon Sep 17 00:00:00 2001
+From ae194fe34a83ae3198010fe20b60308e03e46c61 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:18:52 +0200
-Subject: [PATCH 37/56] Beaglebone: Added missing termination record to
+Subject: [PATCH 37/79] Beaglebone: Added missing termination record to
  bone_pin_mux data.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ 1 file changed, 1 insertion(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index b48e0fd..7dbeac6 100644
@@ -22,5 +22,5 @@ index b48e0fd..7dbeac6 100644
  
  /* Module pin mux for eCAP0 */
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
index cf0730e..3615878 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0038-board-am335xevm.c-Beaglebone-expose-all-pwms-through.patch
@@ -1,12 +1,12 @@
-From adcb99ec934a692e4bdeb993901f5df89188a32c Mon Sep 17 00:00:00 2001
+From 3bfb8f832b4fb3685755ba893a464865ba1cb824 Mon Sep 17 00:00:00 2001
 From: Rob Kellett <r-kellett@ti.com>
 Date: Mon, 14 May 2012 09:35:35 +0100
-Subject: [PATCH 38/56] board-am335xevm.c: Beaglebone - expose all pwms
+Subject: [PATCH 38/79] board-am335xevm.c: Beaglebone - expose all pwms
  through sysfs
 
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   20 +++++++++++++++++++-
- 1 files changed, 19 insertions(+), 1 deletions(-)
+ 1 file changed, 19 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 7dbeac6..c9ee0a2 100644
@@ -54,5 +54,5 @@ index 7dbeac6..c9ee0a2 100644
  
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
index d4240cf..4ba9cf8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0039-ARM-OMAP-Mux-Fixed-debugfs-mux-output-always-reporti.patch
@@ -1,14 +1,14 @@
-From d38171c24019061250e120d554ad89199c58ad53 Mon Sep 17 00:00:00 2001
+From e8f558360cca470b15e95e0620aa0eb6e4cc7980 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:09:57 +0200
-Subject: [PATCH 39/56] ARM: OMAP: Mux: Fixed debugfs mux output (always
+Subject: [PATCH 39/79] ARM: OMAP: Mux: Fixed debugfs mux output (always
  reporting pins as output)
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/mux.c |   62 +++++++++++++++++++++++++++-----------------
- 1 files changed, 38 insertions(+), 24 deletions(-)
+ arch/arm/mach-omap2/mux.c |   62 +++++++++++++++++++++++++++------------------
+ 1 file changed, 38 insertions(+), 24 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/mux.c b/arch/arm/mach-omap2/mux.c
 index e1cc75d..5899266 100644
@@ -95,5 +95,5 @@ index e1cc75d..5899266 100644
  
  	do {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
index 3fe08e4..f44ac53 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0040-beaglebone-export-SPI2-as-spidev-when-no-capes-are-u.patch
@@ -1,13 +1,13 @@
-From b42299b9cd05cb162cd2364fa41e7307515b8a55 Mon Sep 17 00:00:00 2001
+From 0bbf782ac6c97d57990886959838a6f7ed296b3a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 14 May 2012 14:23:45 +0200
-Subject: [PATCH 40/56] beaglebone: export SPI2 as spidev when no capes are
+Subject: [PATCH 40/79] beaglebone: export SPI2 as spidev when no capes are
  using SPI
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   25 +++++++++++++++++++++----
- 1 files changed, 21 insertions(+), 4 deletions(-)
+ 1 file changed, 21 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index c9ee0a2..a0fa53a 100644
@@ -79,5 +79,5 @@ index c9ee0a2..a0fa53a 100644
  {
  	phydev->supported &= ~(SUPPORTED_100baseT_Half |
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
index da872b1..ffbcb6f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0041-st7735fb-Working-WIP-changes-to-make-DMA-safe-and-ad.patch
@@ -1,7 +1,7 @@
-From eef1e8089f452606aa32ee57b6a39783bd26e51f Mon Sep 17 00:00:00 2001
+From 7f97d002d17f8de8cde7f248bb1c194172360efe Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Wed, 28 Mar 2012 23:35:44 -0400
-Subject: [PATCH 41/56] st7735fb: Working WIP changes to make DMA safe and add
+Subject: [PATCH 41/79] st7735fb: Working WIP changes to make DMA safe and add
  endian fix
 
 This removes the "from the stack" allocation of 1 byte buffers
@@ -18,7 +18,7 @@ with the driver.
 Signed-off-by: Matt Porter <mporter@ti.com>
 ---
  drivers/video/st7735fb.c |   49 ++++++++++++++++++++++++++++++----------------
- include/video/st7735fb.h |    2 +
+ include/video/st7735fb.h |    2 ++
  2 files changed, 34 insertions(+), 17 deletions(-)
 
 diff --git a/drivers/video/st7735fb.c b/drivers/video/st7735fb.c
@@ -139,5 +139,5 @@ index 250f036..e99cd05 100644
  
  struct st7735fb_platform_data {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch
index d29624c..0f2477d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0042-omap-hwmod-silence-st_shift-error.patch
@@ -1,7 +1,7 @@
-From 60182b1efd893c0e8c4c6176d2ce0e766d702abb Mon Sep 17 00:00:00 2001
+From e2542efb1a4a61334eace382a2a4c6d5874cc078 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 16 May 2012 17:57:31 +0200
-Subject: [PATCH 42/56] omap hwmod: silence st_shift error
+Subject: [PATCH 42/79] omap hwmod: silence st_shift error
 
 During boot the following error is shown:
 
@@ -12,7 +12,7 @@ Since this PSP tree will never run on omap4 remove the print so people will stop
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/omap_hwmod.c |    3 ---
- 1 files changed, 0 insertions(+), 3 deletions(-)
+ 1 file changed, 3 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/omap_hwmod.c b/arch/arm/mach-omap2/omap_hwmod.c
 index bc14f9f..a050699 100644
@@ -29,5 +29,5 @@ index bc14f9f..a050699 100644
  				  oh->clkdm->pwrdm.ptr->prcm_partition,
  				  oh->clkdm->pwrdm.ptr->prcm_offs,
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch
index 09160ba..b9fb74d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0043-cpsw-phy_device-demote-PHY-message-to-INFO.patch
@@ -1,7 +1,7 @@
-From e846fa8a57d5f050fdb382e8d5599d9b0341a111 Mon Sep 17 00:00:00 2001
+From f37fa162020846da5950eba704e58e41889b9d3a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 17 May 2012 10:59:18 +0200
-Subject: [PATCH 43/56] cpsw,phy_device: demote PHY message to INFO
+Subject: [PATCH 43/79] cpsw,phy_device: demote PHY message to INFO
 
 This keeps them from appearing on the screen when booting with 'quiet'
 
@@ -47,5 +47,5 @@ index 83a5a5a..8b84789 100644
  	}
  	phydev = to_phy_device(d);
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch
index c3697bc..749df75 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0044-beaglebone-add-support-for-7-LCD-cape-revision-A2.patch
@@ -1,12 +1,12 @@
-From 994f87a816d1bd28483e34df8dfa68950eb70c72 Mon Sep 17 00:00:00 2001
+From ff466659529efbbc2d01f1461fe461dc0fdea135 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 18 May 2012 12:17:12 +0200
-Subject: [PATCH 44/56] beaglebone: add support for 7" LCD cape revision A2
+Subject: [PATCH 44/79] beaglebone: add support for 7" LCD cape revision A2
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   24 +++++++++++++++++++++---
- 1 files changed, 21 insertions(+), 3 deletions(-)
+ 1 file changed, 21 insertions(+), 3 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index a0fa53a..5bb71b1 100644
@@ -62,5 +62,5 @@ index a0fa53a..5bb71b1 100644
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch
index 7d12172..165a68a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0045-beaglebone-allow-capes-to-disable-w1-gpio.patch
@@ -1,12 +1,12 @@
-From bddb03181fef4172d529717ff1c613a1770d737c Mon Sep 17 00:00:00 2001
+From 1b32708444a02b6e42cdd76272a2f09768a3474a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 18 May 2012 12:39:25 +0200
-Subject: [PATCH 45/56] beaglebone: allow capes to disable w1-gpio
+Subject: [PATCH 45/79] beaglebone: allow capes to disable w1-gpio
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    7 +++++--
- 1 files changed, 5 insertions(+), 2 deletions(-)
+ 1 file changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 5bb71b1..5c89494 100644
@@ -48,5 +48,5 @@ index 5bb71b1..5c89494 100644
  };
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch
index 5726f2f..91d86a3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0046-beaglebone-add-stub-for-the-camera-cape-to-disable-w.patch
@@ -1,13 +1,13 @@
-From d338dc3eff341be3e3c038e300e1636c1b667b0c Mon Sep 17 00:00:00 2001
+From b1a945344e6abd9bb9f33e9a8dadb8ac22ed2422 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 18 May 2012 12:58:16 +0200
-Subject: [PATCH 46/56] beaglebone: add stub for the camera cape to disable
+Subject: [PATCH 46/79] beaglebone: add stub for the camera cape to disable
  w1-gpio
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    5 +++++
- 1 files changed, 5 insertions(+), 0 deletions(-)
+ 1 file changed, 5 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 5c89494..ece4e46 100644
@@ -26,5 +26,5 @@ index 5c89494..ece4e46 100644
  	if ((capecount > 3) && (beaglebone_tsadcpins_free == 1)) {
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch
index f20aa6c..6a13c13 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0047-Adding-many-of-the-missing-signals-to-the-mux-table.patch
@@ -1,12 +1,12 @@
-From 6d5deaa1b63e1b6fc5c72c98cf44bcc5bd919974 Mon Sep 17 00:00:00 2001
+From 023eed8b578f4b3ccc992ade8344277f9f9e08d6 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:16:34 +0200
-Subject: [PATCH 47/56] Adding many of the missing signals to the mux table.
+Subject: [PATCH 47/79] Adding many of the missing signals to the mux table.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
 ---
  arch/arm/mach-omap2/mux33xx.c |  197 +++++++++++++++++++++--------------------
- 1 files changed, 101 insertions(+), 96 deletions(-)
+ 1 file changed, 101 insertions(+), 96 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
 index 25dcedb..26ecd66 100644
@@ -306,5 +306,5 @@ index 25dcedb..26ecd66 100644
  		NULL, NULL, NULL, NULL),
  	{ .reg_offset = OMAP_MUX_TERMINATOR },
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch
index a82c17f..50f1dd3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0048-Fixed-reversed-part-of-LCD-bus.-Added-even-more-miss.patch
@@ -1,12 +1,12 @@
-From 122136b42459ab34853157fb5de1691e890f8f88 Mon Sep 17 00:00:00 2001
+From 3813937b8337eb49978dfe8e4b938f937b11db37 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Mon, 14 May 2012 18:26:12 +0200
-Subject: [PATCH 48/56] Fixed reversed part of LCD bus. Added even more
+Subject: [PATCH 48/79] Fixed reversed part of LCD bus. Added even more
  missing entries (TBC).
 
 ---
- arch/arm/mach-omap2/mux33xx.c |   56 ++++++++++++++++++++--------------------
- 1 files changed, 28 insertions(+), 28 deletions(-)
+ arch/arm/mach-omap2/mux33xx.c |   56 ++++++++++++++++++++---------------------
+ 1 file changed, 28 insertions(+), 28 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
 index 26ecd66..72ac899 100644
@@ -109,5 +109,5 @@ index 26ecd66..72ac899 100644
  		"lcd_data2", "gpmc_a2", "pr1_mii0_txd3", "ehrpwm2_tripzone_input",
  		NULL, "pr1_pru1_pru_r30_2", "pr1_pru1_pru_r31_2", "gpio2_8"),
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch
index 96aae36..ad1ad73 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0049-ts_tscadc-add-defines-for-4x-and-16x-oversampling.patch
@@ -1,12 +1,12 @@
-From b0977ddac55066159dc227585cf6c682fbb8f1a4 Mon Sep 17 00:00:00 2001
+From e55b5da533e82e6f61c7ccd947623bce7a45ebf9 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sat, 19 May 2012 11:29:14 +0200
-Subject: [PATCH 49/56] ts_tscadc: add defines for 4x and 16x oversampling
+Subject: [PATCH 49/79] ts_tscadc: add defines for 4x and 16x oversampling
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/input/touchscreen/ti_tscadc.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
+ 1 file changed, 2 insertions(+)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index 4fd2e18..acb62d1 100644
@@ -22,5 +22,5 @@ index 4fd2e18..acb62d1 100644
  #define TSCADC_STEPCONFIG_XPP		BIT(5)
  #define TSCADC_STEPCONFIG_XNN		BIT(6)
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch
index 8c562fd..60c527a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0050-ts_tscadc-switch-to-4x-oversampling.patch
@@ -1,12 +1,12 @@
-From fb76db075eb565d152d99b734e3fe9d84b4fe495 Mon Sep 17 00:00:00 2001
+From 4ec4eca3d419986b16b226d1ebdd2c103077ae07 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Sat, 19 May 2012 11:37:21 +0200
-Subject: [PATCH 50/56] ts_tscadc: switch to 4x oversampling
+Subject: [PATCH 50/79] ts_tscadc: switch to 4x oversampling
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/input/touchscreen/ti_tscadc.c |   10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
+ 1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index acb62d1..7df7bb2 100644
@@ -54,5 +54,5 @@ index acb62d1..7df7bb2 100644
  				TSCADC_STEPCONFIG_YPN | TSCADC_STEPCONFIG_INM;
  	stepconfigz2 = stepconfigz1 | TSCADC_STEPCONFIG_Z1 |
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch
index aba0afa..711c663 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0051-Fixed-size-of-pinmux-data-array-in-EEPROM-data-struc.patch
@@ -1,13 +1,13 @@
-From 32fc1a1006035b1c05e45e962b89efe7f9c43182 Mon Sep 17 00:00:00 2001
+From a765d50c30374795b0d421a25a65516d6a66e990 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:07:59 +0200
-Subject: [PATCH 51/56] Fixed size of pinmux data array in EEPROM data struct.
+Subject: [PATCH 51/79] Fixed size of pinmux data array in EEPROM data struct.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index ece4e46..c6ec997 100644
@@ -23,5 +23,5 @@ index ece4e46..c6ec997 100644
  	u16  current_vdd5v;
  	u16  current_sys5v;
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch
index f0a3b77..15b428e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0052-Implemented-Bone-Cape-configuration-from-EEPROM.-Onl.patch
@@ -1,7 +1,7 @@
-From ef6c0767e7c4337f45080906cda46a2c05e000f8 Mon Sep 17 00:00:00 2001
+From 2ab55bf6a97122999e0cd6cbe18869fb89b59c0a Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Sun, 13 May 2012 18:14:22 +0200
-Subject: [PATCH 52/56] Implemented Bone Cape configuration from EEPROM. Only
+Subject: [PATCH 52/79] Implemented Bone Cape configuration from EEPROM. Only
  used for BEBOPR cape for now.
 
 Signed-off-by: Bas Laarhoven <sjml@xs4all.nl>
@@ -9,7 +9,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |  304 +++++++++++++++++++++++++++++++++
  arch/arm/mach-omap2/mux33xx.c         |   14 ++
- 2 files changed, 318 insertions(+), 0 deletions(-)
+ 2 files changed, 318 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index c6ec997..7fb8295 100644
@@ -359,5 +359,5 @@ index 72ac899..43c8989 100644
  int __init am33xx_mux_init(struct omap_board_mux *board_subset)
  {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch
index 175468f..28024ee 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0053-Replaced-conditional-debug-code-by-pr_debug-statemen.patch
@@ -1,13 +1,13 @@
-From 3df22c4c4db479f189d892bcbf009102855bbd05 Mon Sep 17 00:00:00 2001
+From 15a5705cf271c9571719d6e5e09e33efba9576b4 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Mon, 14 May 2012 14:31:37 +0200
-Subject: [PATCH 53/56] Replaced conditional debug code by pr_debug statements
+Subject: [PATCH 53/79] Replaced conditional debug code by pr_debug statements
  for cleaner code.
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   91 +++++++++++++--------------------
- 1 files changed, 36 insertions(+), 55 deletions(-)
+ 1 file changed, 36 insertions(+), 55 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 7fb8295..d6a607a 100644
@@ -184,5 +184,5 @@ index 7fb8295..d6a607a 100644
  			}
  		} else {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch
index 028fe81..8957bbe 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0054-Workaround-for-boards-with-mistaken-ASCII-interpreta.patch
@@ -1,13 +1,13 @@
-From bf49a3539e82539d8d347f7d88626c308662ed62 Mon Sep 17 00:00:00 2001
+From 0d56e585afe2e1cf32a55e93e6a4aa8d659bccf4 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Mon, 14 May 2012 14:36:23 +0200
-Subject: [PATCH 54/56] Workaround for boards with (mistaken) ASCII
+Subject: [PATCH 54/79] Workaround for boards with (mistaken) ASCII
  interpretation for the numpins field.
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    6 ++++++
- 1 files changed, 6 insertions(+), 0 deletions(-)
+ 1 file changed, 6 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index d6a607a..0a1738a 100644
@@ -27,5 +27,5 @@ index d6a607a..0a1738a 100644
  		 cnt, NR_ITEMS( cape_config.muxdata));
  	RULER( NR_ITEMS( cape_config.muxdata));
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch
index fa23ece..1275fa5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0055-Workaround-for-EEPROM-contents-blocking-further-I2C-.patch
@@ -1,13 +1,13 @@
-From 2dc46dbcb68848a670dbe877f954835980cf8d66 Mon Sep 17 00:00:00 2001
+From 8d8ad2973b9d062763f51f1bee0652a6647033a5 Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Mon, 14 May 2012 15:07:43 +0200
-Subject: [PATCH 55/56] Workaround for EEPROM contents blocking further I2C
+Subject: [PATCH 55/79] Workaround for EEPROM contents blocking further I2C
  bus access.
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 0a1738a..0fa8a32 100644
@@ -26,5 +26,5 @@ index 0a1738a..0fa8a32 100644
  			case 0:	 status[ i] = 'i'; break;
  			case 1:	 status[ i] = 'o'; break;
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch
index 239e993..abdaabe 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0056-Added-check-on-EEPROM-revision-to-prevent-interpreti.patch
@@ -1,13 +1,13 @@
-From 8c79cdf0bbe2bff8043cf81da7b8793c21f64f17 Mon Sep 17 00:00:00 2001
+From ae7ecbfa459730344eeb559ce0352662c540289c Mon Sep 17 00:00:00 2001
 From: Bas Laarhoven <sjml@xs4all.nl>
 Date: Tue, 15 May 2012 10:00:47 +0200
-Subject: [PATCH 56/56] Added check on EEPROM revision to prevent interpreting
+Subject: [PATCH 56/79] Added check on EEPROM revision to prevent interpreting
  unknown formats.
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   16 +++++++++++++---
- 1 files changed, 13 insertions(+), 3 deletions(-)
+ 1 file changed, 13 insertions(+), 3 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 0fa8a32..68ddfe2 100644
@@ -56,5 +56,5 @@ index 0fa8a32..68ddfe2 100644
  
  static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0057-i2c-prescalar-fix-i2c-fixed-prescalar-setting-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0057-i2c-prescalar-fix-i2c-fixed-prescalar-setting-issue.patch
index da75695..feb27c5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0057-i2c-prescalar-fix-i2c-fixed-prescalar-setting-issue.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0057-i2c-prescalar-fix-i2c-fixed-prescalar-setting-issue.patch
@@ -1,7 +1,7 @@
-From 2436d7177f75ffa852dc008ce5fe63e92cec963a Mon Sep 17 00:00:00 2001
+From 3c530584c31f8e61a47a931dedca2f9e75165b9f Mon Sep 17 00:00:00 2001
 From: Al Pacifico <adpacifico@users.sourceforge.net>
 Date: Mon, 21 May 2012 11:50:32 -0700
-Subject: [PATCH 57/61] i2c-prescalar-fix: i2c: fixed prescalar setting issue
+Subject: [PATCH 57/79] i2c-prescalar-fix: i2c: fixed prescalar setting issue
 
 Applied Steve's i2c prescalar fix patches.
 See https://groups.google.com/d/msg/beagleboard/Q1pDr1lT7Gk/jvxOxgg8_2MJ
@@ -12,7 +12,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  arch/arm/mach-omap2/omap_hwmod_33xx_data.c |    3 ++-
  drivers/i2c/busses/i2c-omap.c              |    2 ++
  include/linux/i2c-omap.h                   |    1 +
- 3 files changed, 5 insertions(+), 1 deletions(-)
+ 3 files changed, 5 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
 index 9d3c9a5..946e6b5 100644
@@ -54,5 +54,5 @@ index fd38249..818f5bf 100644
  #define OMAP_I2C_FLAG_BUS_SHIFT_NONE 0
  #define OMAP_I2C_FLAG_BUS_SHIFT_1		BIT(7)
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0058-beaglebone-annotate-default-beaglebone-pinmux.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0058-beaglebone-annotate-default-beaglebone-pinmux.patch
index 66fb0de..92b6d48 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0058-beaglebone-annotate-default-beaglebone-pinmux.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0058-beaglebone-annotate-default-beaglebone-pinmux.patch
@@ -1,12 +1,12 @@
-From 178d60b5a56c1f8eff29d23c27cc14bc6c0a9e4c Mon Sep 17 00:00:00 2001
+From fe280a351fe71d5f1ade1aa3b8f9edc08e201ec1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 22 May 2012 10:58:53 +0200
-Subject: [PATCH 58/61] beaglebone: annotate default beaglebone pinmux
+Subject: [PATCH 58/79] beaglebone: annotate default beaglebone pinmux
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 68ddfe2..b079279 100644
@@ -28,5 +28,5 @@ index 68ddfe2..b079279 100644
      {"gpmc_ad6.gpio1_6", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
  	{NULL, 0},
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0059-beaglebone-fix-pin-free-thinko-this-method-doesn-t-g.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0059-beaglebone-fix-pin-free-thinko-this-method-doesn-t-g.patch
index 1b55abf..32d9b25 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0059-beaglebone-fix-pin-free-thinko-this-method-doesn-t-g.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0059-beaglebone-fix-pin-free-thinko-this-method-doesn-t-g.patch
@@ -1,13 +1,13 @@
-From f0f728e400d0512788e59a2d7a17e3aa8584c033 Mon Sep 17 00:00:00 2001
+From 1b74058d12afa7d51ef84316ec4ede88c565161f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 22 May 2012 11:00:00 +0200
-Subject: [PATCH 59/61] beaglebone: fix pin-free thinko, this method doesn't
+Subject: [PATCH 59/79] beaglebone: fix pin-free thinko, this method doesn't
  get called when there's a cape at 0x57
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   46 +++++++++++++++------------------
- 1 files changed, 21 insertions(+), 25 deletions(-)
+ 1 file changed, 21 insertions(+), 25 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index b079279..dfe8df5 100644
@@ -74,5 +74,5 @@ index b079279..dfe8df5 100644
  	return;
  out:
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0060-beaglebone-switch-RS232-cape-to-ttyO2.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0060-beaglebone-switch-RS232-cape-to-ttyO2.patch
index 063b2b3..abe82a3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0060-beaglebone-switch-RS232-cape-to-ttyO2.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0060-beaglebone-switch-RS232-cape-to-ttyO2.patch
@@ -1,12 +1,12 @@
-From b594d005ab1e622b9c3cbf45c2699dde4af3706f Mon Sep 17 00:00:00 2001
+From 77f8e93f7baf85dfab7cdf8b04c320f460a119cd Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 22 May 2012 11:00:35 +0200
-Subject: [PATCH 60/61] beaglebone: switch RS232 cape to ttyO2
+Subject: [PATCH 60/79] beaglebone: switch RS232 cape to ttyO2
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    5 +++--
- 1 files changed, 3 insertions(+), 2 deletions(-)
+ 1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index dfe8df5..5902df0 100644
@@ -25,5 +25,5 @@ index dfe8df5..5902df0 100644
  		if (!strncmp("BB-BONE-SERL-04", cape_config.partnumber, 15)) {
  		pr_info("BeagleBone cape: not initializing RS485 cape\n");
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch
index 91f324c..84c5545 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0061-beaglebone-make-uart2-pinmux-match-the-uart0-pinmux.patch
@@ -1,12 +1,12 @@
-From 9c7b14dcac75a1c6456e2cd4ae3e1737ed1c5f47 Mon Sep 17 00:00:00 2001
+From f138b1ab42cb36c13926e1cee6ed3cd429d1c91b Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 22 May 2012 12:25:33 +0200
-Subject: [PATCH 61/61] beaglebone: make uart2 pinmux match the uart0 pinmux
+Subject: [PATCH 61/79] beaglebone: make uart2 pinmux match the uart0 pinmux
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    7 ++-----
- 1 files changed, 2 insertions(+), 5 deletions(-)
+ 1 file changed, 2 insertions(+), 5 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 5902df0..e8ce381 100644
@@ -27,5 +27,5 @@ index 5902df0..e8ce381 100644
  };
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch
index f6860cb..c3cd8e1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0062-da8xx-fb-Rounding-FB-size-to-satisfy-SGX-buffer-requ.patch
@@ -1,7 +1,7 @@
-From 02ad70ea366cb2946cc7d7c14ddcbd0dabf3d3ff Mon Sep 17 00:00:00 2001
+From c9201ef3a2d12a49b5070620a204f66eef5017e0 Mon Sep 17 00:00:00 2001
 From: Aditya Nellutla <aditya.n@ti.com>
 Date: Thu, 29 Mar 2012 15:45:39 +0530
-Subject: [PATCH 62/63] da8xx-fb: Rounding FB size to satisfy SGX buffer
+Subject: [PATCH 62/79] da8xx-fb: Rounding FB size to satisfy SGX buffer
  requirements
 
 In the real time use-case when SGX is used for rendering to FB buffers it has been
@@ -22,7 +22,7 @@ This patch makes sure that FB allocates buffers aligned to above formula.
 Signed-off-by: Aditya Nellutla <aditya.n@ti.com>
 ---
  drivers/video/da8xx-fb.c |    5 ++++-
- 1 files changed, 4 insertions(+), 1 deletions(-)
+ 1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
 index 86b19ac..9aaca5d 100644
@@ -55,5 +55,5 @@ index 86b19ac..9aaca5d 100644
  
  	par->vram_virt = dma_alloc_coherent(NULL,
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch
index 184d168..f429e74 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch
@@ -1,13 +1,13 @@
-From 4c0991689b1e22f28d4827b218e31131f9f56be7 Mon Sep 17 00:00:00 2001
+From 81ca4844089a80e1b1a285ce661f662a04312e81 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 23 May 2012 15:51:12 +0200
-Subject: [PATCH 63/63] beaglebone: dvi cape audio hacks
+Subject: [PATCH 63/79] beaglebone: dvi cape audio hacks
 
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   72 ++++++++++++++++++++++++++------
+ arch/arm/mach-omap2/board-am335xevm.c |   72 ++++++++++++++++++++++++++-------
  arch/arm/mach-omap2/devices.c         |    2 +-
  sound/soc/codecs/tlv320aic3x.c        |    2 +-
- sound/soc/davinci/davinci-evm.c       |    7 ++-
+ sound/soc/davinci/davinci-evm.c       |    7 ++--
  4 files changed, 64 insertions(+), 19 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
@@ -173,7 +173,7 @@ index 9e029da..41c9b0f 100644
  }
  
 diff --git a/sound/soc/codecs/tlv320aic3x.c b/sound/soc/codecs/tlv320aic3x.c
-index d0dbac1..fc32b7f 100644
+index cdb473c..5567756 100644
 --- a/sound/soc/codecs/tlv320aic3x.c
 +++ b/sound/soc/codecs/tlv320aic3x.c
 @@ -52,7 +52,7 @@
@@ -213,5 +213,5 @@ index f6a62c3..7ad7b37 100644
  	platform_set_drvdata(evm_snd_device, evm_snd_dev_data);
  	ret = platform_device_add(evm_snd_device);
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
index e6f696e..2c2b12c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch
@@ -1,14 +1,14 @@
-From 2b000164f7bd77838ec5c9ad5d392282a4e27b3f Mon Sep 17 00:00:00 2001
+From b7349f4b517f8736efcc1a2c1469b07d7361ee5f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 23 May 2012 17:39:12 +0200
-Subject: [PATCH 64/64] beaglebone: always execute the pin free checks
+Subject: [PATCH 64/79] beaglebone: always execute the pin free checks
 
 This code needs to run when there are no capes and when there are capes present.
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   26 +++++++++++++-------------
- 1 files changed, 13 insertions(+), 13 deletions(-)
+ 1 file changed, 13 insertions(+), 13 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
 index 1f2d1fd..da6020b 100644
@@ -64,5 +64,5 @@ index 1f2d1fd..da6020b 100644
  
  static struct at24_platform_data cape_eeprom_info = {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch
index ae5a4f9..5bdf161 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch
@@ -1,12 +1,12 @@
-From 979f76376236287b2e4d4b4505ed34b1f9c9d389 Mon Sep 17 00:00:00 2001
+From bd18b67644c8107920db6911aa16be680af23cf1 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 28 May 2012 09:56:45 +0200
-Subject: [PATCH 65/68] ti_tscadc: switch to 16x averaging
+Subject: [PATCH 65/79] ti_tscadc: switch to 16x averaging
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/input/touchscreen/ti_tscadc.c |    8 ++++----
- 1 files changed, 4 insertions(+), 4 deletions(-)
+ 1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
 index 7df7bb2..ae6c4c4 100644
@@ -49,5 +49,5 @@ index 7df7bb2..ae6c4c4 100644
  				TSCADC_STEPCONFIG_YPN | TSCADC_STEPCONFIG_INM;
  	stepconfigz2 = stepconfigz1 | TSCADC_STEPCONFIG_Z1 |
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
new file mode 100644
index 0000000..ed494ec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0066-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
@@ -0,0 +1,45 @@
+From b3830f85231a530a9a83a5f8f6ff893aa0be2d60 Mon Sep 17 00:00:00 2001
+From: "Patil, Rachna" <rachna@ti.com>
+Date: Thu, 26 Apr 2012 15:20:20 +0530
+Subject: [PATCH 66/79] video: da8xx-fb: Add Newhaven LCD Panel details
+
+This patch adds details for Newhaven display Panel.
+This panel is used on AM335x EVM-SK An upcoming TI EVM.
+
+Signed-off-by: Patil, Rachna <rachna@ti.com>
+
+Conflicts:
+
+	drivers/video/da8xx-fb.c
+---
+ drivers/video/da8xx-fb.c |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
+index 9aaca5d..010a8bc 100644
+--- a/drivers/video/da8xx-fb.c
++++ b/drivers/video/da8xx-fb.c
+@@ -301,6 +301,20 @@ static struct da8xx_panel known_lcd_panels[] = {
+ 		.pxl_clk = 8000000,
+ 		.invert_pxl_clk = 0,
+ 	},	
++	/* Newhaven Display */
++	[5] = {
++		.name = "NHD-4.3-ATXI#-T-1",
++		.width = 480,
++		.height = 272,
++		.hfp = 8,
++		.hbp = 43,
++		.hsw = 4,
++		.vfp = 4,
++		.vbp = 12,
++		.vsw = 10,
++		.pxl_clk = 9000000,
++		.invert_pxl_clk = 0,
++	},
+ };
+ 
+ /* Enable the Raster Engine of the LCD Controller */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
new file mode 100644
index 0000000..cf39615
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
@@ -0,0 +1,94 @@
+From 8652d1a5b1a191a460de6b7214168dc77b6ceeb1 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 29 May 2012 14:12:44 +0200
+Subject: [PATCH 67/79] beaglebone: add support for the 4.3" lcd cape with
+ resistive touchscreen
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   48 +++++++++++++++++++++++++++------
+ 1 file changed, 40 insertions(+), 8 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index da6020b..e360b22 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -272,6 +272,12 @@ struct da8xx_lcdc_platform_data bbtoys35_pdata = {
+ 	.type			= "CDTech_S035Q01",
+ };
+ 
++struct da8xx_lcdc_platform_data bbtoys43_pdata = {
++	.manu_name		= "BBToys",
++	.controller_data	= &lcd_cfg,
++	.type			= "NHD-4.3-ATXI#-T-1",
++};
++
+ static const struct display_panel dvi_panel = {
+ 	WVGA,
+ 	16,
+@@ -562,14 +568,14 @@ static struct pinmux_config batterycape_pin_mux[] = {
+ 	
+ /* Module pin mux for LCDC */
+ static struct pinmux_config lcdc_pin_mux[] = {
+-	{"gpmc_ad8.lcd_data16",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad9.lcd_data17",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad10.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad11.lcd_data19",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad12.lcd_data20",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad13.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad14.lcd_data22",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+-	{"gpmc_ad15.lcd_data23",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad8.lcd_data23",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad9.lcd_data22",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad10.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad11.lcd_data20",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad12.lcd_data19",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad13.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad14.lcd_data17",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
++	{"gpmc_ad15.lcd_data16",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
+ 	{NULL, 0},
+ };
+ 
+@@ -1659,6 +1665,24 @@ static void bbtoys35lcd_init(int evm_id, int profile)
+ 	return;
+ }
+ 
++static void bbtoys43lcd_init(int evm_id, int profile)
++{
++	setup_pin_mux(lcdc16_pin_mux);
++	setup_pin_mux(lcdc_pin_mux);
++	
++	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
++	if (conf_disp_pll(18000000)) {
++		pr_info("Failed to set pixclock to 18000000, not attempting to"
++				"register LCD cape\n");
++		return;
++	}
++	
++	if (am33xx_register_lcdc(&bbtoys43_pdata))
++		pr_info("Failed to register Beagleboardtoys 4.3\" LCD cape device\n");
++	
++	return;
++}
++
+ #define BEAGLEBONEDVI_PDn_A1  GPIO_TO_PIN(1, 7)
+ #define BEAGLEBONEDVI_PDn_A2  GPIO_TO_PIN(1, 31)
+ 
+@@ -2672,6 +2696,14 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		beaglebone_leds_free = 0;
+ 		lcd3leds_init(0,0);
+ 	}
++
++	if (!strncmp("BB-BONE-LCD4-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing LCD cape\n");
++		bbtoys43lcd_init(0,0);
++		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
++		tsc_init(0,0);
++		beaglebone_tsadcpins_free = 0;
++	}
+ 	
+ 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 14)) {
+ 		pr_info("BeagleBone cape: initializing VGA cape\n");
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
deleted file mode 100644
index 27431b8..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 3f166417b837d6fb44e1003a2286876cb5c682b4 Mon Sep 17 00:00:00 2001
-From: "Patil, Rachna" <rachna@ti.com>
-Date: Thu, 26 Apr 2012 15:20:20 +0530
-Subject: [PATCH 67/68] video: da8xx-fb: Add Newhaven LCD Panel details
-
-This patch adds details for Newhaven display Panel.
-This panel is used on AM335x EVM-SK An upcoming TI EVM.
-
-Signed-off-by: Patil, Rachna <rachna@ti.com>
-
-Conflicts:
-
-	drivers/video/da8xx-fb.c
----
- drivers/video/da8xx-fb.c |   14 ++++++++++++++
- 1 files changed, 14 insertions(+), 0 deletions(-)
-
-diff --git a/drivers/video/da8xx-fb.c b/drivers/video/da8xx-fb.c
-index 9aaca5d..010a8bc 100644
---- a/drivers/video/da8xx-fb.c
-+++ b/drivers/video/da8xx-fb.c
-@@ -301,6 +301,20 @@ static struct da8xx_panel known_lcd_panels[] = {
- 		.pxl_clk = 8000000,
- 		.invert_pxl_clk = 0,
- 	},	
-+	/* Newhaven Display */
-+	[5] = {
-+		.name = "NHD-4.3-ATXI#-T-1",
-+		.width = 480,
-+		.height = 272,
-+		.hfp = 8,
-+		.hbp = 43,
-+		.hsw = 4,
-+		.vfp = 4,
-+		.vbp = 12,
-+		.vsw = 10,
-+		.pxl_clk = 9000000,
-+		.invert_pxl_clk = 0,
-+	},
- };
- 
- /* Enable the Raster Engine of the LCD Controller */
--- 
-1.7.7.6
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-LCD3-rev-A1.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-LCD3-rev-A1.patch
new file mode 100644
index 0000000..1f22cd7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-LCD3-rev-A1.patch
@@ -0,0 +1,132 @@
+From 590a240f4bb7c6eeda5d11c9040821a71edefc53 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Mon, 4 Jun 2012 14:38:02 +0200
+Subject: [PATCH 68/79] beaglebone: add support for LCD3 rev A1
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   94 +++++++++++++++++++++++++++++----
+ 1 file changed, 83 insertions(+), 11 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index e360b22..d83431a 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1136,7 +1136,7 @@ static struct pinmux_config lcd3_keys_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
+-/* Configure GPIOs for lcd3 keys */
++/* Configure GPIOs for lcd3 rev A or earlier keys */
+ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+ 	{
+ 		.code                   = KEY_LEFT,
+@@ -1193,14 +1193,72 @@ static struct platform_device beaglebone_lcd3_keys = {
+ 	},
+ };
+ 
+-static void beaglebone_lcd3_keys_init(int evm_id, int profile)
+-{
+-	int err;
+-	setup_pin_mux(lcd3_keys_pin_mux);
+-	err = platform_device_register(&beaglebone_lcd3_keys);
+-	if (err)
+-		pr_err("failed to register gpio keys for LCD3 cape\n");
+-}
++/* pinmux for lcd3 A1 or newer keys */
++static struct pinmux_config lcd3a1_keys_pin_mux[] = {
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Left
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Right
++	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Up
++	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Down
++	{"mcasp0_fsr.gpio3_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Enter
++	{NULL, 0},
++};
++
++/* Configure GPIOs for lcd3 rev A1 or newer keys */
++static struct gpio_keys_button lcd3a1_gpio_keys[] = {
++	{
++		.code                   = KEY_LEFT,
++		.gpio                   = GPIO_TO_PIN(1, 16),
++		.active_low             = true,
++		.desc                   = "left",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_RIGHT,
++		.gpio                   = GPIO_TO_PIN(1, 17),
++		.active_low             = true,
++		.desc                   = "right",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_UP,
++		.gpio                   = GPIO_TO_PIN(1, 19),
++		.active_low             = true,
++		.desc                   = "up",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_DOWN,
++		.gpio                   = GPIO_TO_PIN(3, 16),
++		.active_low             = true,
++		.desc                   = "down",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++	{
++		.code                   = KEY_ENTER,
++		.gpio                   = GPIO_TO_PIN(3, 19),
++		.active_low             = true,
++		.desc                   = "enter",
++		.type                   = EV_KEY,
++		.wakeup                 = 1,
++	},
++};
++
++static struct gpio_keys_platform_data lcd3a1_gpio_key_info = {
++	.buttons        = lcd3a1_gpio_keys,
++	.nbuttons       = ARRAY_SIZE(lcd3a1_gpio_keys),
++};
++
++static struct platform_device lcd3a1_keys = {
++	.name   = "gpio-keys",
++	.id     = -1,
++	.dev    = {
++		.platform_data  = &lcd3a1_gpio_key_info,
++	},
++};
+ 
+ /*
+ * @evm_id - evm id which needs to be configured
+@@ -2691,8 +2749,22 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
+ 		tsc_init(0,0);
+ 		beaglebone_tsadcpins_free = 0;
+-		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+-		beaglebone_lcd3_keys_init(0,0);
++		
++		if (!strncmp("00A0", cape_config.version, 4)) {
++			pr_info("BeagleBone cape: Registering gpio-keys for LCD3 rev A or earlier cape\n");
++			int err;
++			setup_pin_mux(lcd3_keys_pin_mux);
++			err = platform_device_register(&beaglebone_lcd3_keys);
++			if (err)
++				pr_err("failed to register gpio keys for LCD3 rev A or earlier cape\n");
++		} else {
++			pr_info("BeagleBone cape: Registering gpio-keys for LCD rev A1 or later cape\n");
++			int err;
++			setup_pin_mux(lcd3a1_keys_pin_mux);
++			err = platform_device_register(&lcd3a1_keys);
++			if (err)
++				pr_err("failed to register gpio keys for LCD3 rev A1 or later cape\n");
++		}
+ 		beaglebone_leds_free = 0;
+ 		lcd3leds_init(0,0);
+ 	}
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
deleted file mode 100644
index 6d2ab2a..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 6b69dbc7cee48dfa9ff281ae918cc468ed38a537 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 29 May 2012 14:12:44 +0200
-Subject: [PATCH 68/68] beaglebone: add support for the 4.3" lcd cape with
- resistive touchscreen
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/board-am335xevm.c |   48 +++++++++++++++++++++++++++-----
- 1 files changed, 40 insertions(+), 8 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 58c2754..bb6049a 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -272,6 +272,12 @@ struct da8xx_lcdc_platform_data bbtoys35_pdata = {
- 	.type			= "CDTech_S035Q01",
- };
- 
-+struct da8xx_lcdc_platform_data bbtoys43_pdata = {
-+	.manu_name		= "BBToys",
-+	.controller_data	= &lcd_cfg,
-+	.type			= "NHD-4.3-ATXI#-T-1",
-+};
-+
- static const struct display_panel dvi_panel = {
- 	WVGA,
- 	16,
-@@ -562,14 +568,14 @@ static struct pinmux_config batterycape_pin_mux[] = {
- 	
- /* Module pin mux for LCDC */
- static struct pinmux_config lcdc_pin_mux[] = {
--	{"gpmc_ad8.lcd_data16",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad9.lcd_data17",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad10.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad11.lcd_data19",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad12.lcd_data20",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad13.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad14.lcd_data22",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
--	{"gpmc_ad15.lcd_data23",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad8.lcd_data23",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad9.lcd_data22",		OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad10.lcd_data21",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad11.lcd_data20",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad12.lcd_data19",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad13.lcd_data18",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad14.lcd_data17",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_ad15.lcd_data16",	OMAP_MUX_MODE1 | AM33XX_PIN_OUTPUT},
- 	{NULL, 0},
- };
- 
-@@ -1659,6 +1665,24 @@ static void bbtoys35lcd_init(int evm_id, int profile)
- 	return;
- }
- 
-+static void bbtoys43lcd_init(int evm_id, int profile)
-+{
-+	setup_pin_mux(lcdc16_pin_mux);
-+	setup_pin_mux(lcdc_pin_mux);
-+	
-+	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
-+	if (conf_disp_pll(18000000)) {
-+		pr_info("Failed to set pixclock to 18000000, not attempting to"
-+				"register LCD cape\n");
-+		return;
-+	}
-+	
-+	if (am33xx_register_lcdc(&bbtoys43_pdata))
-+		pr_info("Failed to register Beagleboardtoys 4.3\" LCD cape device\n");
-+	
-+	return;
-+}
-+
- #define BEAGLEBONEDVI_PDn_A1  GPIO_TO_PIN(1, 7)
- #define BEAGLEBONEDVI_PDn_A2  GPIO_TO_PIN(1, 31)
- 
-@@ -2672,6 +2696,14 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 		beaglebone_leds_free = 0;
- 		lcd3leds_init(0,0);
- 	}
-+
-+	if (!strncmp("BB-BONE-LCD4-01", cape_config.partnumber, 15)) {
-+		pr_info("BeagleBone cape: initializing LCD cape\n");
-+		bbtoys43lcd_init(0,0);
-+		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
-+		tsc_init(0,0);
-+		beaglebone_tsadcpins_free = 0;
-+	}
- 	
- 	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 14)) {
- 		pr_info("BeagleBone cape: initializing VGA cape\n");
--- 
-1.7.7.6
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch
deleted file mode 100644
index d9bc2b5..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From b61b89f98ac85ccd8d503a902bad208343ed0aba Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Mon, 4 Jun 2012 14:38:02 +0200
-Subject: [PATCH] beaglebone: add support for LCD3 rev A1
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/board-am335xevm.c |   94 +++++++++++++++++++++++++++++----
- 1 files changed, 83 insertions(+), 11 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index bb6049a..51bfa8b 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1136,7 +1136,7 @@ static struct pinmux_config lcd3_keys_pin_mux[] = {
- 	{NULL, 0},
- };
- 
--/* Configure GPIOs for lcd3 keys */
-+/* Configure GPIOs for lcd3 rev A or earlier keys */
- static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
- 	{
- 		.code                   = KEY_LEFT,
-@@ -1193,14 +1193,72 @@ static struct platform_device beaglebone_lcd3_keys = {
- 	},
- };
- 
--static void beaglebone_lcd3_keys_init(int evm_id, int profile)
--{
--	int err;
--	setup_pin_mux(lcd3_keys_pin_mux);
--	err = platform_device_register(&beaglebone_lcd3_keys);
--	if (err)
--		pr_err("failed to register gpio keys for LCD3 cape\n");
--}
-+/* pinmux for lcd3 A1 or newer keys */
-+static struct pinmux_config lcd3a1_keys_pin_mux[] = {
-+	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Left
-+	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Right
-+	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Up
-+	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Down
-+	{"mcasp0_fsr.gpio3_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Enter
-+	{NULL, 0},
-+};
-+
-+/* Configure GPIOs for lcd3 rev A1 or newer keys */
-+static struct gpio_keys_button lcd3a1_gpio_keys[] = {
-+	{
-+		.code                   = KEY_LEFT,
-+		.gpio                   = GPIO_TO_PIN(1, 16),
-+		.active_low             = true,
-+		.desc                   = "left",
-+		.type                   = EV_KEY,
-+		.wakeup                 = 1,
-+	},
-+	{
-+		.code                   = KEY_RIGHT,
-+		.gpio                   = GPIO_TO_PIN(1, 17),
-+		.active_low             = true,
-+		.desc                   = "right",
-+		.type                   = EV_KEY,
-+		.wakeup                 = 1,
-+	},
-+	{
-+		.code                   = KEY_UP,
-+		.gpio                   = GPIO_TO_PIN(1, 19),
-+		.active_low             = true,
-+		.desc                   = "up",
-+		.type                   = EV_KEY,
-+		.wakeup                 = 1,
-+	},
-+	{
-+		.code                   = KEY_DOWN,
-+		.gpio                   = GPIO_TO_PIN(3, 16),
-+		.active_low             = true,
-+		.desc                   = "down",
-+		.type                   = EV_KEY,
-+		.wakeup                 = 1,
-+	},
-+	{
-+		.code                   = KEY_ENTER,
-+		.gpio                   = GPIO_TO_PIN(3, 19),
-+		.active_low             = true,
-+		.desc                   = "enter",
-+		.type                   = EV_KEY,
-+		.wakeup                 = 1,
-+	},
-+};
-+
-+static struct gpio_keys_platform_data lcd3a1_gpio_key_info = {
-+	.buttons        = lcd3a1_gpio_keys,
-+	.nbuttons       = ARRAY_SIZE(lcd3a1_gpio_keys),
-+};
-+
-+static struct platform_device lcd3a1_keys = {
-+	.name   = "gpio-keys",
-+	.id     = -1,
-+	.dev    = {
-+		.platform_data  = &lcd3a1_gpio_key_info,
-+	},
-+};
- 
- /*
- * @evm_id - evm id which needs to be configured
-@@ -2691,8 +2749,22 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
- 		tsc_init(0,0);
- 		beaglebone_tsadcpins_free = 0;
--		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
--		beaglebone_lcd3_keys_init(0,0);
-+		
-+		if (!strncmp("00A0", cape_config.version, 4)) {
-+			pr_info("BeagleBone cape: Registering gpio-keys for LCD3 rev A or earlier cape\n");
-+			int err;
-+			setup_pin_mux(lcd3_keys_pin_mux);
-+			err = platform_device_register(&beaglebone_lcd3_keys);
-+			if (err)
-+				pr_err("failed to register gpio keys for LCD3 rev A or earlier cape\n");
-+		} else {
-+			pr_info("BeagleBone cape: Registering gpio-keys for LCD rev A1 or later cape\n");
-+			int err;
-+			setup_pin_mux(lcd3a1_keys_pin_mux);
-+			err = platform_device_register(&lcd3a1_keys);
-+			if (err)
-+				pr_err("failed to register gpio keys for LCD3 rev A1 or later cape\n");
-+		}
- 		beaglebone_leds_free = 0;
- 		lcd3leds_init(0,0);
- 	}
--- 
-1.7.7.6
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
new file mode 100644
index 0000000..08330a0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0069-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
@@ -0,0 +1,52 @@
+From dbe62e3346ee4423a2d3c83e6390ef39c2a0a0bf Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 6 Jun 2012 11:20:21 +0200
+Subject: [PATCH 69/79] beaglebone: fix buttons/spidev clash when using
+ mcasp0_axr0.gpio3_16
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   13 +++++++------
+ 1 file changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index d83431a..15ee8af 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -1051,12 +1051,11 @@ static void volume_keys_init(int evm_id, int profile)
+ 
+ /* pinmux for lcd7 keys */
+ static struct pinmux_config lcd7_keys_pin_mux[] = {
+-	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
+-	{"gpmc_ben1.gpio1_28",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
++	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //left
++	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //right
++	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //up
++	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //down
++	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //enter
+ 	{NULL, 0},
+ };
+ 
+@@ -2738,6 +2737,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
+ 		beaglebone_lcd7_keys_init(0,0);
+ 		
++		beaglebone_spi1_free = 0;
+ 		// A1 or newer
+ 		beaglebone_leds_free = 0;
+ 		lcd7leds_init(0,0);
+@@ -2765,6 +2765,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			if (err)
+ 				pr_err("failed to register gpio keys for LCD3 rev A1 or later cape\n");
+ 		}
++		beaglebone_spi1_free = 0;
+ 		beaglebone_leds_free = 0;
+ 		lcd3leds_init(0,0);
+ 	}
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-LCD3-led-key-overlap.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-LCD3-led-key-overlap.patch
new file mode 100644
index 0000000..942ab61
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-LCD3-led-key-overlap.patch
@@ -0,0 +1,54 @@
+From 2a148ebd4606ed6a5d24287aa7e5701de3259057 Mon Sep 17 00:00:00 2001
+From: Damian <damian.eppel@teleca.com>
+Date: Tue, 5 Jun 2012 23:14:58 +0200
+Subject: [PATCH 70/79] beaglebone: fix LCD3 led/key overlap
+
+Signed-off-by: Koen Kooi <koen@circuitco.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    9 +--------
+ 1 file changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 15ee8af..9a56a769 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -639,7 +639,6 @@ static struct pinmux_config dvia2_pin_mux[] = {
+ /* Module pin mux for Beagleboardtoys 3.5" LCD cape */
+ static struct pinmux_config bbtoys35_pin_mux[] = {
+ 	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
+-	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
+ 	{NULL, 0},
+ };
+ 
+@@ -1196,7 +1195,7 @@ static struct platform_device beaglebone_lcd3_keys = {
+ static struct pinmux_config lcd3a1_keys_pin_mux[] = {
+ 	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Left
+ 	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Right
+-	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Up
++	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Up
+ 	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Down
+ 	{"mcasp0_fsr.gpio3_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Enter
+ 	{NULL, 0},
+@@ -1424,7 +1423,6 @@ static struct platform_device dvi_leds_gpio = {
+ };
+ 
+ #define BEAGLEBONELCD3_USR0_LED  GPIO_TO_PIN(1, 18)
+-#define BEAGLEBONELCD3_USR1_LED  GPIO_TO_PIN(1, 19)
+ 
+ static struct gpio_led lcd3_gpio_leds[] = {
+ 	{
+@@ -1450,11 +1448,6 @@ static struct gpio_led lcd3_gpio_leds[] = {
+ 		.default_trigger	= "heartbeat",
+ 		.gpio			= BEAGLEBONELCD3_USR0_LED,
+ 	},
+-	{
+-		.name			= "lcd3::usr1",
+-		.default_trigger	= "mmc0",
+-		.gpio			= BEAGLEBONELCD3_USR1_LED,
+-	},
+ };
+ 
+ static struct gpio_led_platform_data lcd3_gpio_led_info = {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
deleted file mode 100644
index ae277fa..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From d99bad03ee2f3cc3d9a61879e53e4795a05eaed3 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Wed, 6 Jun 2012 11:20:21 +0200
-Subject: [PATCH 70/70] beaglebone: fix buttons/spidev clash when using
- mcasp0_axr0.gpio3_16
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/board-am335xevm.c |   13 +++++++------
- 1 files changed, 7 insertions(+), 6 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 51bfa8b..7fd611f 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1051,12 +1051,11 @@ static void volume_keys_init(int evm_id, int profile)
- 
- /* pinmux for lcd7 keys */
- static struct pinmux_config lcd7_keys_pin_mux[] = {
--	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
--	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
--	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
--	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
--	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
--	{"gpmc_ben1.gpio1_28",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT},
-+	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //left
-+	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //right
-+	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //up
-+	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //down
-+	{"mcasp0_fsr.gpio3_19",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //enter
- 	{NULL, 0},
- };
- 
-@@ -2738,6 +2737,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 		pr_info("BeagleBone cape: Registering gpio-keys for LCD cape\n");
- 		beaglebone_lcd7_keys_init(0,0);
- 		
-+		beaglebone_spi1_free = 0;
- 		// A1 or newer
- 		beaglebone_leds_free = 0;
- 		lcd7leds_init(0,0);
-@@ -2765,6 +2765,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 			if (err)
- 				pr_err("failed to register gpio keys for LCD3 rev A1 or later cape\n");
- 		}
-+		beaglebone_spi1_free = 0;
- 		beaglebone_leds_free = 0;
- 		lcd3leds_init(0,0);
- 	}
--- 
-1.7.7.6
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch
deleted file mode 100644
index 7d796a7..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From fa18ca5c896696066349e2803dfeeda1fcd4a4e3 Mon Sep 17 00:00:00 2001
-From: Damian <damian.eppel@teleca.com>
-Date: Tue, 5 Jun 2012 23:14:58 +0200
-Subject: [PATCH 1/2] beaglebone: fix LCD3 led/key overlap
-
-Signed-off-by: Koen Kooi <koen@circuitco.com>
----
- arch/arm/mach-omap2/board-am335xevm.c |    9 +--------
- 1 file changed, 1 insertion(+), 8 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 7fd611f..a337bb3 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -639,7 +639,6 @@ static struct pinmux_config dvia2_pin_mux[] = {
- /* Module pin mux for Beagleboardtoys 3.5" LCD cape */
- static struct pinmux_config bbtoys35_pin_mux[] = {
- 	{"gpmc_a2.gpio1_18", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR0 LED
--	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // USR1 LED
- 	{NULL, 0},
- };
- 
-@@ -1196,7 +1195,7 @@ static struct platform_device beaglebone_lcd3_keys = {
- static struct pinmux_config lcd3a1_keys_pin_mux[] = {
- 	{"gpmc_a0.gpio1_16",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Left
- 	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Right
--	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT}, // Up
-+	{"gpmc_a3.gpio1_19", OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Up
- 	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, //Down
- 	{"mcasp0_fsr.gpio3_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT}, // Enter
- 	{NULL, 0},
-@@ -1424,7 +1423,6 @@ static struct platform_device dvi_leds_gpio = {
- };
- 
- #define BEAGLEBONELCD3_USR0_LED  GPIO_TO_PIN(1, 18)
--#define BEAGLEBONELCD3_USR1_LED  GPIO_TO_PIN(1, 19)
- 
- static struct gpio_led lcd3_gpio_leds[] = {
- 	{
-@@ -1450,11 +1448,6 @@ static struct gpio_led lcd3_gpio_leds[] = {
- 		.default_trigger	= "heartbeat",
- 		.gpio			= BEAGLEBONELCD3_USR0_LED,
- 	},
--	{
--		.name			= "lcd3::usr1",
--		.default_trigger	= "mmc0",
--		.gpio			= BEAGLEBONELCD3_USR1_LED,
--	},
- };
- 
- static struct gpio_led_platform_data lcd3_gpio_led_info = {
--- 
-1.7.10
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-audio-spi-clash.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-audio-spi-clash.patch
new file mode 100644
index 0000000..02bf495
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0071-beaglebone-fix-audio-spi-clash.patch
@@ -0,0 +1,25 @@
+From 1ec20c05453acf20b9d5d385ac9574e9ab64347d Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 26 Jun 2012 08:39:04 +0200
+Subject: [PATCH 71/79] beaglebone: fix audio/spi clash
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 9a56a769..d2481af 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2691,6 +2691,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		
+ 		beaglebone_leds_free = 0;
+ 		dvileds_init(0,0);
++		beaglebone_spi1_free = 0;
+ 		mcasp0_init(0,0);
+ 	
+ 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch
new file mode 100644
index 0000000..724c3dd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch
@@ -0,0 +1,1612 @@
+From e3a4f83627a111ae21ea8c6521ad98201f55eacc Mon Sep 17 00:00:00 2001
+From: Dan Aizenstros <daizenstros@quicklogic.com>
+Date: Fri, 29 Jun 2012 13:57:49 -0400
+Subject: [PATCH 72/79] beaglebone: add support for QuickLogic Camera
+ interface on camera cape
+
+Signed-off-by: Dan Aizenstros <daizenstros@quicklogic.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c         |  205 ++++-
+ arch/arm/mach-omap2/devices.c                 |    2 +-
+ arch/arm/plat-omap/include/plat/dma-33xx.h    |    1 +
+ drivers/media/video/Kconfig                   |    7 +
+ drivers/media/video/Makefile                  |    2 +
+ drivers/media/video/cssp_camera/Makefile      |    3 +
+ drivers/media/video/cssp_camera/cssp_camera.c | 1119 +++++++++++++++++++++++++
+ drivers/media/video/cssp_camera/cssp_camera.h |  148 ++++
+ 8 files changed, 1478 insertions(+), 9 deletions(-)
+ create mode 100644 drivers/media/video/cssp_camera/Makefile
+ create mode 100644 drivers/media/video/cssp_camera/cssp_camera.c
+ create mode 100644 drivers/media/video/cssp_camera/cssp_camera.h
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index d2481af..22a740f 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -65,6 +65,10 @@
+ #include <plat/mmc.h>
+ #include <plat/emif.h>
+ #include <plat/nand.h>
++#include <plat/dma-33xx.h>
++
++#include <media/soc_camera.h>
++#include <media/mt9t112.h>
+ 
+ #include "board-flash.h"
+ #include "cpuidle33xx.h"
+@@ -803,6 +807,42 @@ static struct pinmux_config i2c1_pin_mux[] = {
+ 	{NULL, 0},
+ };
+ 
++/* Pin mux for GPMC bus */
++static struct pinmux_config gpmc_pin_mux[] = {
++	{"gpmc_ad0.gpmc_ad0",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad1.gpmc_ad1",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad2.gpmc_ad2",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad3.gpmc_ad3",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad4.gpmc_ad4",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad5.gpmc_ad5",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad6.gpmc_ad6",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad7.gpmc_ad7",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad8.gpmc_ad8",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad9.gpmc_ad9",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad10.gpmc_ad10",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad11.gpmc_ad11",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad12.gpmc_ad12",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad13.gpmc_ad13",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad14.gpmc_ad14",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_ad15.gpmc_ad15",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_wait0.gpmc_wait0", OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_wpn.gpmc_wpn",	  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
++	{"gpmc_csn1.gpmc_csn1",	  OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
++	{"gpmc_advn_ale.gpmc_advn_ale",  OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
++	{"gpmc_oen_ren.gpmc_oen_ren",	 OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
++	{"gpmc_wen.gpmc_wen",     OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
++	{"gpmc_ben0_cle.gpmc_ben0_cle",	 OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
++	{"gpmc_clk.gpmc_clk",	 OMAP_MUX_MODE0 | AM33XX_PIN_INPUT},
++	{"ecap0_in_pwm0_out.xdma_event_intr2", OMAP_MUX_MODE6 | AM33XX_PIN_INPUT}, // DMAREQ
++	{NULL, 0},
++};
++
++static struct pinmux_config camera_cape_pin_mux[] = {
++	{"spi0_d1.gpio0_4",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT },		// QL CSSP and Camera Sensor Reset
++	{"spi0_cs0.gpio0_5",   OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT_PULLUP },	// 1V8 and 2V8 Power Enable
++	{NULL, 0},
++};
++
+ static struct pinmux_config i2c2_pin_mux[] = {
+ 	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
+ 					AM33XX_PIN_INPUT_PULLUP},
+@@ -1802,6 +1842,156 @@ static void dvileds_init(int evm_id, int profile )
+ 		pr_err("failed to register BeagleBone DVI cape LEDS\n");
+ }
+ 
++static struct resource cssp_camera_resources[] = {
++	{
++		.name = "gpmc_phys_mem_slot",
++		.flags = IORESOURCE_MEM,
++	},
++};
++
++static struct mt9t112_camera_info mt9t111_cam_info = {
++	/* divider calculated for 32Mhz CAM_MCLK */
++	.divider = {
++		.m = 24, .n = 1,
++		.p1 = 0, .p2 = 7, .p3 = 0, .p4 = 11, .p5 = 15, .p6 = 7, .p7 = 0,
++	},
++};
++
++static struct soc_camera_link mt9t111_camera_link =  {
++	.priv = &mt9t111_cam_info,
++	.i2c_adapter_id = 3,
++};
++
++static struct i2c_board_info i2c_camera = {
++	I2C_BOARD_INFO("mt9t112", 0x3c),
++	.platform_data = &mt9t111_camera_link,
++};
++
++struct cssp_cam_platform_data {
++	struct i2c_board_info *cam_i2c_board_info;
++	const char *cam_clk_name;
++	int dma_ch;
++	int cssp_reset_pin;
++};
++
++static struct cssp_cam_platform_data cssp_cam_platform_data = {
++	.cam_i2c_board_info = &i2c_camera,
++	.cam_clk_name = "clkout2_ck",
++	.dma_ch = AM33XX_DMA_XDMA_EVENT_INTR2,
++	.cssp_reset_pin = GPIO_TO_PIN(0, 4),
++};
++
++static struct platform_device cssp_camera = {
++	.name  = "cssp-camera",
++	.id    = -1,
++	.dev   = {
++		.platform_data = &cssp_cam_platform_data,
++	},
++	.num_resources = sizeof(cssp_camera_resources) / sizeof(cssp_camera_resources[0]),
++	.resource = cssp_camera_resources,
++};
++
++static struct gpmc_timings cssp_timings = {
++	/* Minimum clock period for synchronous mode (in picoseconds) */
++	.sync_clk = 10000,
++
++	.cs_on = 0,
++	.cs_rd_off = 23 * 10,		/* Read deassertion time */
++	.cs_wr_off = 23 * 10,		/* Write deassertion time */
++
++	/* ADV signal timings corresponding to GPMC_CONFIG3 */
++	.adv_on = 0,			/* Assertion time */
++	.adv_rd_off = 2 * 10,		/* Read deassertion time */
++	.adv_wr_off = 2 * 10,		/* Write deassertion time */
++
++	/* WE signals timings corresponding to GPMC_CONFIG4 */
++	.we_on = 3 * 10,		/* WE assertion time */
++	.we_off = 23 * 10,		/* WE deassertion time */
++
++	/* OE signals timings corresponding to GPMC_CONFIG4 */
++	.oe_on = 3 * 10,		/* OE assertion time */
++	.oe_off = 23 * 10,		/* OE deassertion time */
++
++	/* Access time and cycle time timings corresponding to GPMC_CONFIG5 */
++	.page_burst_access = 1 * 10,	/* Multiple access word delay */
++	.access = 7 * 10,		/* Start-cycle to first data valid delay */
++	.rd_cycle = 23 * 10,		/* Total read cycle time */
++	.wr_cycle = 23 * 10,		/* Total write cycle time */
++
++	/* The following are only on OMAP3430 */
++	.wr_access = 7 * 10,		/* WRACCESSTIME */
++	.wr_data_mux_bus = 3 * 10,	/* WRDATAONADMUXBUS */
++};
++
++static int gpmc_cssp_init(void)
++{
++	int cs = 1; /* Chip Select on GPMC bus */
++	int val;
++	long unsigned int cssp_gpmc_mem_base_phys;
++
++	if (gpmc_cs_request(cs, SZ_16M, &cssp_gpmc_mem_base_phys) < 0) {
++			printk(KERN_ERR "[cssp_cam platform init]: gpmc_cs_request failed\n");
++			return -1;
++	}
++
++	cssp_camera_resources[0].start = cssp_gpmc_mem_base_phys;
++	cssp_camera_resources[0].end = cssp_gpmc_mem_base_phys + 0x1ffff;
++
++	if (gpmc_cs_configure(cs, GPMC_CONFIG_DEV_TYPE, GPMC_DEVICETYPE_NOR) < 0) {
++			printk(KERN_ERR "[cssp_cam platform init]: gpmc_cs_configure failed\n");
++			return -1;
++	}
++
++	val = GPMC_CONFIG1_READMULTIPLE_SUPP;
++	val |= GPMC_CONFIG1_READTYPE_SYNC;
++	val |= GPMC_CONFIG1_WRITETYPE_SYNC;
++	val |= GPMC_CONFIG1_CLKACTIVATIONTIME(1);
++	val |= GPMC_CONFIG1_PAGE_LEN(2);
++	val |= GPMC_CONFIG1_DEVICESIZE_16;
++	val |= GPMC_CONFIG1_DEVICETYPE_NOR;
++	val |= GPMC_CONFIG1_MUXADDDATA;
++	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, val);
++
++	if (gpmc_cs_set_timings(cs, &cssp_timings) < 0) {
++		printk(KERN_ERR "Failed gpmc_cs_set_timings for QuickLogic CAMIF device\n");
++		goto free;
++	}
++
++	val = gpmc_cs_read_reg(cs, GPMC_CS_CONFIG6);
++	val &= 0xe0f0f030;
++	val |= 0x07030481;
++	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG6, val);
++
++	printk(KERN_INFO "gpmc_cssp_init for QuickLogic CAMIF device succeeded\n");
++
++	return 0;
++
++free:
++	gpmc_cs_free(cs);
++
++	printk(KERN_ERR "Could not initialize QuickLogic CAMIF device\n");
++
++	return -1;
++}
++
++static void cssp_gpmc_init(void)
++{
++	struct gpmc_devices_info gpmc_device[2] = {
++			{ NULL, GPMC_DEVICE_NOR },
++		};
++
++	setup_pin_mux(camera_cape_pin_mux);
++	setup_pin_mux(gpmc_pin_mux);
++
++	omap_init_gpmc(gpmc_device, sizeof(gpmc_device));
++	gpmc_cssp_init();
++
++	platform_device_register(&cssp_camera);
++
++	printk(KERN_INFO "[cssp_cam platform init]: cssp_gpmc_init: DONE\n");
++}
++
++
+ static void lcd3leds_init(int evm_id, int profile )
+ {
+ 	int err;
+@@ -2821,6 +3011,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 	if (!strncmp("BB-BONE-CAM-01", cape_config.partnumber, 14)) {
+ 		pr_info("BeagleBone cape: recognized Camera cape\n");
+ 		beaglebone_w1gpio_free = 0;
++		cssp_gpmc_init();
+ 	}
+ 
+ 	goto out2;
+@@ -3729,15 +3920,13 @@ static struct pinmux_config clkout2_pin_mux[] = {
+ 
+ static void __init clkout2_enable(void)
+ {
+-	struct clk *ck_32;
+-
+-	ck_32 = clk_get(NULL, "clkout2_ck");
+-	if (IS_ERR(ck_32)) {
+-		pr_err("Cannot clk_get ck_32\n");
+-		return;
+-	}
++	void __iomem *base;
++	unsigned int val;
+ 
+-	clk_enable(ck_32);
++	base = ioremap(0x44E00700, SZ_4K);
++	val = (5 << 3) | (3 << 0); //32 MHz
++	writel(val, base);
++	iounmap(base);
+ 
+ 	setup_pin_mux(clkout2_pin_mux);
+ }
+diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
+index 41c9b0f..3ef045e 100644
+--- a/arch/arm/mach-omap2/devices.c
++++ b/arch/arm/mach-omap2/devices.c
+@@ -968,7 +968,7 @@ static struct event_to_channel_map am33xx_xbar_event_mapping[] = {
+ 	{27, -1},
+ 	{28, -1},
+ 	{29, -1},
+-	{30, -1},
++	{30, 20},	/* XDMA_EVENT_INTR2 */
+ 	{31, -1},
+ 	{-1, -1}
+ };
+diff --git a/arch/arm/plat-omap/include/plat/dma-33xx.h b/arch/arm/plat-omap/include/plat/dma-33xx.h
+index bebdaa7..ded00aa 100644
+--- a/arch/arm/plat-omap/include/plat/dma-33xx.h
++++ b/arch/arm/plat-omap/include/plat/dma-33xx.h
+@@ -83,5 +83,6 @@
+ #define AM33XX_DMA_PWMSS2_EPW				63
+ #define AM33XX_DMA_MMCHS2_W				64	/* xBar */
+ #define AM33XX_DMA_MMCHS2_R				65	/* xBar */
++#define AM33XX_DMA_XDMA_EVENT_INTR2			93	/* xBar */
+ 
+ #endif
+diff --git a/drivers/media/video/Kconfig b/drivers/media/video/Kconfig
+index b303a3f..a31723f 100644
+--- a/drivers/media/video/Kconfig
++++ b/drivers/media/video/Kconfig
+@@ -1002,6 +1002,13 @@ config VIDEO_S5P_MIPI_CSIS
+ 
+ source "drivers/media/video/s5p-tv/Kconfig"
+ 
++config VIDEO_QL_CAMIF
++	tristate "QuickLogic Camera Interface support (EXPERIMENTAL)"
++	depends on VIDEO_DEV && SOC_CAMERA && SOC_OMAPAM33XX && EXPERIMENTAL
++	select VIDEOBUF2_DMA_CONTIG
++	---help---
++	  This is a v4l2 driver for the QuickLogic CAMIF controller.
++
+ #
+ # USB Multimedia device configuration
+ #
+diff --git a/drivers/media/video/Makefile b/drivers/media/video/Makefile
+index 117f9c4..af7af692 100644
+--- a/drivers/media/video/Makefile
++++ b/drivers/media/video/Makefile
+@@ -195,6 +195,8 @@ obj-y	+= davinci/
+ 
+ obj-$(CONFIG_ARCH_OMAP)	+= omap/
+ 
++obj-$(CONFIG_VIDEO_QL_CAMIF)	+= cssp_camera/
++
+ ccflags-y += -Idrivers/media/dvb/dvb-core
+ ccflags-y += -Idrivers/media/dvb/frontends
+ ccflags-y += -Idrivers/media/common/tuners
+diff --git a/drivers/media/video/cssp_camera/Makefile b/drivers/media/video/cssp_camera/Makefile
+new file mode 100644
+index 0000000..d85a84e
+--- /dev/null
++++ b/drivers/media/video/cssp_camera/Makefile
+@@ -0,0 +1,3 @@
++# cssp_camera
++
++obj-$(CONFIG_VIDEO_QL_CAMIF) += cssp_camera.o
+diff --git a/drivers/media/video/cssp_camera/cssp_camera.c b/drivers/media/video/cssp_camera/cssp_camera.c
+new file mode 100644
+index 0000000..39aa003
+--- /dev/null
++++ b/drivers/media/video/cssp_camera/cssp_camera.c
+@@ -0,0 +1,1119 @@
++/*
++ * cssp-camera driver
++ *
++ * Based on Vivi driver
++ *
++ * Copyright (C) 2012 QuickLogic Corp.
++ *
++ * Developed for QuickLogic by:
++ * Damian Eppel <damian.eppel@teleca.com>
++ * Przemek Szewczyk <przemek.szewczyk@teleca.com>
++ * Dan Aizenstros <daizenstros@quicklogic.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++
++#include <linux/init.h>
++#include <linux/module.h>
++#include <linux/gpio.h>
++#include <linux/i2c.h>
++#include <linux/delay.h>
++#include <linux/spinlock.h>
++#include <linux/dma-mapping.h>
++#include <linux/interrupt.h>
++#include <mach/edma.h>
++#include <linux/clk.h>
++// V4L2 Interface *********************
++#include <media/soc_camera.h>
++#include <media/v4l2-mediabus.h>
++#include <media/videobuf2-dma-contig.h>
++#include <media/v4l2-ioctl.h>
++#include <media/v4l2-event.h>
++//*************************************
++#include "cssp_camera.h"
++
++
++/*
++ * ---------------------------------------------------------------------------
++ *  QuickLoigc Camera Interface registers
++ * ---------------------------------------------------------------------------
++ */
++
++#define REG_MODE		0x00000
++#define REG_DATA		0x10000
++
++/* MODE bit shifts */
++#define FMT_2X8_EN		BIT(15) /* Enable 2 byte format on CAMIF bus (0 - 10 bit, 1 - 16 bit 2x8) */
++#define PCLK_POL		BIT(14) /* PCLK polarity (0 - rising edge, 1 - falling edge */
++#define HS_EN			BIT(13) /* High speed bus (0 =< 50 MHz, 1 > 50 MHz) */
++#define ENABLE			BIT(12)
++
++
++static struct cssp_cam_fmt formats[] = {
++	{
++		.name	= "4:2:2, packed, YUYV",
++		.fourcc	= V4L2_PIX_FMT_YUYV,
++		.depth	= 16,
++		.code	= V4L2_MBUS_FMT_YUYV8_2X8,
++	},
++	{
++		.name	= "4:2:2, packed, UYVY",
++		.fourcc	= V4L2_PIX_FMT_UYVY,
++		.depth	= 16,
++		.code	= V4L2_MBUS_FMT_UYVY8_2X8,
++	},
++	{
++		.name	= "4:2:2, packed, VYUY",
++		.fourcc	= V4L2_PIX_FMT_VYUY,
++		.depth	= 16,
++		.code	= V4L2_MBUS_FMT_VYUY8_2X8,
++	},
++	{
++		.name	= "4:2:2, packed, YVYU",
++		.fourcc	= V4L2_PIX_FMT_YVYU,
++		.depth	= 16,
++		.code	= V4L2_MBUS_FMT_YVYU8_2X8,
++	},
++	{
++		.name	= "RGB565 (LE)",
++		.fourcc	= V4L2_PIX_FMT_RGB565,
++		.depth	= 16,
++		.code	= V4L2_MBUS_FMT_RGB565_2X8_LE,
++	},
++	{
++		.name	= "RGB555 (LE)",
++		.fourcc	= V4L2_PIX_FMT_RGB555,
++		.depth	= 16,
++		.code	= V4L2_MBUS_FMT_RGB555_2X8_PADHI_LE,
++	},
++};
++
++
++/***************************************************************************/
++
++
++static int configure_gpio(int nr, int val, const char *name)
++{
++	unsigned long flags = val ? GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
++	int ret;
++	if (!gpio_is_valid(nr))
++		return 0;
++	ret = gpio_request_one(nr, flags, name);
++	if (!ret)
++		gpio_export(nr, 0);
++	return ret;
++}
++
++static int reset_cssp(struct cssp_cam_dev *cam)
++{
++	struct platform_device *pdev = cam->pdev;
++	int err;
++
++	cam->reset_pin = ((struct cssp_cam_platform_data *)pdev->dev.platform_data)->gpio_reset_pin;
++
++	err = configure_gpio(cam->reset_pin, 0, "cssp_reset");
++	if (err) {
++		printk(KERN_ERR "[%s]: failed to configure cssp reset pin\n", pdev->name);
++		return -1;
++	}
++
++	mdelay(1);
++
++	gpio_direction_output(cam->reset_pin, 1);
++
++	return err;
++}
++
++static int trigger_dma_transfer_to_buf(struct cssp_cam_dev *dev, struct vb2_buffer *vb)
++{
++	dma_addr_t dma_buf = vb2_dma_contig_plane_dma_addr(vb, 0);
++
++	if (!dma_buf) {
++		/* Is this possible? Release the vb2_buffer with an error here, */
++		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
++		dev->current_vb = NULL;
++		return -ENOMEM;
++	}
++
++	dev->dma_tr_params.dst = dma_buf;
++
++	// Enable DMA
++	edma_write_slot(dev->dma_ch, &dev->dma_tr_params);
++
++	// Enable data capture
++	dev->mode |= ENABLE;
++	writew(dev->mode, dev->reg_base_virt + REG_MODE);
++	readw(dev->reg_base_virt + REG_MODE);
++
++	dev->current_vb = vb;
++
++	return 0;
++}
++
++static void dequeue_buffer_for_dma(struct cssp_cam_dev *dev)
++{
++	struct cssp_cam_dmaqueue *dma_q = &dev->vidq;
++	unsigned long flags = 0;
++
++	spin_lock_irqsave(&dev->slock, flags);
++	if (!list_empty(&dma_q->active)) {
++		struct cssp_cam_buffer *buf;
++
++		buf = list_entry(dma_q->active.next, struct cssp_cam_buffer, list);
++		list_del(&buf->list);
++		spin_unlock_irqrestore(&dev->slock, flags);
++
++		buf->fmt = dev->fmt;
++
++		trigger_dma_transfer_to_buf(dev, &buf->vb);
++	} else {
++		spin_unlock_irqrestore(&dev->slock, flags);
++	}
++}
++
++static void dma_callback(unsigned lch, u16 ch_status, void *data)
++{
++	struct cssp_cam_dev *dev = (struct cssp_cam_dev *)data;
++
++	// Disable data capture
++	dev->mode &= ~ENABLE;
++	writew(dev->mode, dev->reg_base_virt + REG_MODE);
++	readw(dev->reg_base_virt + REG_MODE);
++
++	if (ch_status == DMA_COMPLETE) {
++		struct vb2_buffer *vb = dev->current_vb;
++		struct timeval ts;
++
++		vb->v4l2_buf.field = dev->field;
++		dev->field_count++;
++		vb->v4l2_buf.sequence = dev->field_count >> 1;
++		do_gettimeofday(&ts);
++		vb->v4l2_buf.timestamp = ts;
++		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
++		dev->current_vb = NULL;
++		dev->frame_cnt++;
++
++		/* check if we have new buffer queued */
++		dequeue_buffer_for_dma(dev);
++	} else {
++		printk(KERN_ERR "[cssp_camera]: EDMA error (ch_status = %d)\n", ch_status);
++		/* we got a missed interrupt so just start a new DMA with the existing buffer */
++		if (dev->current_vb != NULL)
++			trigger_dma_transfer_to_buf(dev, dev->current_vb);
++	}
++}
++
++static int configure_edma(struct cssp_cam_dev *cam)
++{
++	struct platform_device *pdev = cam->pdev;
++	int dma_channel;
++
++	dma_channel = ((struct cssp_cam_platform_data *)pdev->dev.platform_data)->dma_ch;
++
++	pdev->dev.dma_mask = &cam->dma_mask;
++
++	pdev->dev.coherent_dma_mask = (u32)~0;
++
++	if (dma_set_mask(&pdev->dev, (u32)~0)) {
++		printk(KERN_ERR "[%s]: failed setting mask for DMA\n", pdev->name);
++		return -1;
++	}
++
++	cam->dma_ch = edma_alloc_channel(dma_channel, dma_callback, cam, EVENTQ_1);
++	if (cam->dma_ch < 0) {
++		printk(KERN_ERR "[%s]: allocating channel for DMA failed\n", pdev->name);
++		return -EBUSY;
++	} else {
++		printk(KERN_ERR "[%s]: allocating channel for DMA succeeded, chan=%d\n", pdev->name, cam->dma_ch);
++	}
++
++	cam->dma_tr_params.opt = TCINTEN | TCC(cam->dma_ch);
++	cam->dma_tr_params.src = cam->reg_base_phys + REG_DATA;
++	cam->dma_tr_params.a_b_cnt = ACNT(BYTES_PER_DMA_EVT) | BCNT((VGA_WIDTH * BYTES_PER_PIXEL) / BYTES_PER_DMA_EVT);
++	cam->dma_tr_params.src_dst_bidx = SRCBIDX(0) | DSTBIDX(BYTES_PER_DMA_EVT);
++	cam->dma_tr_params.link_bcntrld = BCNTRLD((VGA_WIDTH * BYTES_PER_PIXEL) / BYTES_PER_DMA_EVT) | LINK(0xffff);
++	cam->dma_tr_params.src_dst_cidx = SRCCIDX(0) | DSTCIDX(BYTES_PER_DMA_EVT);
++	cam->dma_tr_params.ccnt = CCNT(VGA_HEIGHT);
++
++	return 0;
++}
++
++static int configure_cssp(struct cssp_cam_dev *cam)
++{
++	struct platform_device *pdev = cam->pdev;
++	int ret = 0;
++	unsigned int val;
++	struct resource *res;
++
++	ret = reset_cssp(cam);
++	if (ret)
++		return ret;
++
++	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpmc_phys_mem_slot");
++	if (res == NULL) {
++		printk(KERN_ERR "[%s]: failed to get gpmc_phys_mem_slot resource\n", pdev->name);
++		return -ENODEV;
++	}
++
++	/*
++	 * Request the region.
++	 */
++	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
++		return -EBUSY;
++	}
++
++	cam->reg_base_phys = res->start;
++	cam->reg_size = resource_size(res);
++
++	cam->reg_base_virt = (unsigned int)ioremap(cam->reg_base_phys, cam->reg_size);
++	if (cam->reg_base_virt == 0) {
++		printk(KERN_ERR "[%s]: ioremap of registers region failed\n", pdev->name);
++		release_mem_region(cam->reg_base_phys, cam->reg_size);
++		return -ENOMEM;
++	}
++
++	printk(KERN_INFO "[%s]: reg_base_virt = 0x%x\n", pdev->name, cam->reg_base_virt);
++
++	val = readw(cam->reg_base_virt + REG_MODE);
++	printk(KERN_INFO "[%s]: reading register address=0x0 returns 0x%x\n", pdev->name, val);
++
++	return 0;
++}
++
++static int configure_camera_sensor(struct cssp_cam_dev *cam)
++{
++	struct i2c_board_info *info = cam->camera_board_info;
++	struct i2c_client *client;
++	struct i2c_adapter *adapter;
++	struct v4l2_subdev *subdev;
++	struct v4l2_mbus_framefmt f_format = {
++			.width = VGA_WIDTH,
++			.height = VGA_HEIGHT,
++			.code = V4L2_MBUS_FMT_YUYV8_2X8,
++			.colorspace = V4L2_COLORSPACE_JPEG,
++	};
++
++	/* Enable the clock just for the time of loading the camera driver and disable after that */
++	/* It is going to be be re-enabled later, when camera will be in use */
++	clk_enable(cam->camera_clk);
++	udelay(5); // let the clock stabilize
++
++	adapter	= i2c_get_adapter(((struct soc_camera_link *)(info->platform_data))->i2c_adapter_id);
++	if (!adapter) {
++		printk(KERN_INFO "[%s]: failed to get adapter...\n", __func__);
++		return -ENODEV;
++	}
++
++	client = i2c_new_device(adapter, info);
++	i2c_put_adapter(adapter);
++
++	if (client == NULL) {
++		return -ENODEV;
++	}
++
++	printk(KERN_INFO "[%s]: client's name is: %s\n", __func__, client->name);
++
++	subdev = (struct v4l2_subdev *)i2c_get_clientdata(client);
++	if (subdev == NULL) {
++		i2c_unregister_device(client);
++		return -ENODEV;
++	}
++
++	cam->subdev = subdev;
++
++	v4l2_subdev_call(subdev, video, s_mbus_fmt, &f_format);
++
++	clk_disable(cam->camera_clk);
++
++	return 0;
++}
++
++static int start_camera_sensor(struct cssp_cam_dev *cam)
++{
++	clk_enable(cam->camera_clk);
++	udelay(5); /* let the clock stabilize */
++
++	v4l2_subdev_call(cam->subdev, video, s_stream, 1);
++
++	return 0;
++}
++
++static void stop_camera_sensor(struct cssp_cam_dev *cam)
++{
++	v4l2_subdev_call(cam->subdev, video, s_stream, 0);
++
++	clk_disable(cam->camera_clk);
++
++	return;
++}
++
++
++/************************************************
++ * 				Video4Linux2
++ */
++
++static struct cssp_cam_fmt *get_format(struct v4l2_format *f)
++{
++	struct cssp_cam_fmt *fmt;
++	unsigned int k;
++
++	for (k = 0; k < ARRAY_SIZE(formats); k++) {
++		fmt = &formats[k];
++		if (fmt->fourcc == f->fmt.pix.pixelformat)
++			break;
++	}
++
++	if (k == ARRAY_SIZE(formats))
++		return NULL;
++
++	return &formats[k];
++}
++
++
++/* ------------------------------------------------------------------
++	Videobuf operations
++   ------------------------------------------------------------------*/
++
++static int queue_setup(struct vb2_queue *vq, const struct v4l2_format *fmt,
++				unsigned int *nbuffers, unsigned int *nplanes,
++				unsigned int sizes[], void *alloc_ctxs[])
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
++	unsigned long size;
++
++	size = dev->sizeimage;
++
++	if (0 == *nbuffers)
++		*nbuffers = 32;
++
++	while (size * *nbuffers > vid_limit * 1024 * 1024)
++		(*nbuffers)--;
++
++	*nplanes = 1;
++
++	sizes[0] = size;
++
++	alloc_ctxs[0] = dev->dma_cont_ctx;
++
++	dprintk(dev, 1, "%s, count=%d, size=%ld\n", __func__, *nbuffers, size);
++
++	return 0;
++}
++
++static int buffer_init(struct vb2_buffer *vb)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
++
++	BUG_ON(NULL == dev->fmt);
++
++	/*
++	 * This callback is called once per buffer, after its allocation.
++	 *
++	 * Vivi does not allow changing format during streaming, but it is
++	 * possible to do so when streaming is paused (i.e. in streamoff state).
++	 * Buffers however are not freed when going into streamoff and so
++	 * buffer size verification has to be done in buffer_prepare, on each
++	 * qbuf.
++	 * It would be best to move verification code here to buf_init and
++	 * s_fmt though.
++	 */
++
++	return 0;
++}
++
++static int buffer_prepare(struct vb2_buffer *vb)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
++	struct cssp_cam_buffer *buf = container_of(vb, struct cssp_cam_buffer, vb);
++	unsigned long size;
++
++	dprintk(dev, 1, "%s, field=%d\n", __func__, vb->v4l2_buf.field);
++
++	BUG_ON(NULL == dev->fmt);
++
++	/*
++	 * Theses properties only change when queue is idle, see s_fmt.
++	 * The below checks should not be performed here, on each
++	 * buffer_prepare (i.e. on each qbuf). Most of the code in this function
++	 * should thus be moved to buffer_init and s_fmt.
++	 */
++	if (dev->width  < 48 || dev->width  > MAX_WIDTH ||
++	    dev->height < 32 || dev->height > MAX_HEIGHT)
++		return -EINVAL;
++
++	size = dev->sizeimage;
++	if (vb2_plane_size(vb, 0) < size) {
++		dprintk(dev, 1, "%s data will not fit into plane (%lu < %lu)\n",
++				__func__, vb2_plane_size(vb, 0), size);
++		return -EINVAL;
++	}
++
++	vb2_set_plane_payload(&buf->vb, 0, size);
++
++	buf->fmt = dev->fmt;
++
++	return 0;
++}
++
++static int buffer_finish(struct vb2_buffer *vb)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
++	dprintk(dev, 1, "%s\n", __func__);
++	return 0;
++}
++
++static void buffer_cleanup(struct vb2_buffer *vb)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
++	dprintk(dev, 1, "%s\n", __func__);
++}
++
++static void buffer_queue(struct vb2_buffer *vb)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
++	struct cssp_cam_buffer *buf = container_of(vb, struct cssp_cam_buffer, vb);
++	struct cssp_cam_dmaqueue *vidq = &dev->vidq;
++	unsigned long flags = 0;
++
++	dprintk(dev, 1, "%s\n", __func__);
++
++	if (dev->streaming_started && !dev->current_vb) {
++		trigger_dma_transfer_to_buf(dev, &buf->vb);
++	} else {
++		spin_lock_irqsave(&dev->slock, flags);
++		list_add_tail(&buf->list, &vidq->active);
++		spin_unlock_irqrestore(&dev->slock, flags);
++	}
++}
++
++static int start_streaming(struct vb2_queue *vq, unsigned int count)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
++	int ret;
++
++	dprintk(dev, 1, "%s\n", __func__);
++
++	ret = start_camera_sensor(dev);
++	if (ret != 0)
++		return ret;
++
++	// Enable DMA
++	edma_start(dev->dma_ch);
++
++	dev->streaming_started = 1;
++
++	/* check if we have new buffer queued */
++	dequeue_buffer_for_dma(dev);
++
++	return 0;
++}
++
++/* abort streaming and wait for last buffer */
++static int stop_streaming(struct vb2_queue *vq)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
++	struct cssp_cam_dmaqueue *dma_q = &dev->vidq;
++
++	dprintk(dev, 1, "%s\n", __func__);
++
++	// Disable DMA
++	edma_stop(dev->dma_ch);
++
++	// Disable data capture
++	dev->mode &= ~ENABLE;
++	writew(dev->mode, dev->reg_base_virt + REG_MODE);
++	readw(dev->reg_base_virt + REG_MODE);
++
++	stop_camera_sensor(dev);
++
++	dev->streaming_started = 0;
++
++	/* Release all active buffers */
++	while (!list_empty(&dma_q->active)) {
++		struct cssp_cam_buffer *buf;
++
++		buf = list_entry(dma_q->active.next, struct cssp_cam_buffer, list);
++		list_del(&buf->list);
++		vb2_buffer_done(&buf->vb, VB2_BUF_STATE_ERROR);
++		dprintk(dev, 2, "[%p/%d] done\n", buf, buf->vb.v4l2_buf.index);
++	}
++
++	dev->current_vb = NULL;
++
++	return 0;
++}
++
++static void cssp_cam_lock(struct vb2_queue *vq)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
++	mutex_lock(&dev->mutex);
++}
++
++static void cssp_cam_unlock(struct vb2_queue *vq)
++{
++	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
++	mutex_unlock(&dev->mutex);
++}
++
++static struct vb2_ops cssp_cam_video_qops = {
++	.queue_setup		= queue_setup,
++	.buf_init		= buffer_init,
++	.buf_prepare		= buffer_prepare,
++	.buf_finish		= buffer_finish,
++	.buf_cleanup		= buffer_cleanup,
++	.buf_queue		= buffer_queue,
++	.start_streaming	= start_streaming,
++	.stop_streaming		= stop_streaming,
++	.wait_prepare		= cssp_cam_unlock,
++	.wait_finish		= cssp_cam_lock,
++};
++
++
++/* ------------------------------------------------------------------
++	IOCTL vidioc handling
++   ------------------------------------------------------------------*/
++
++static int vidioc_querycap(struct file *file, void *priv,
++					struct v4l2_capability *cap)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++
++	strcpy(cap->driver, "cssp_camera");
++	strcpy(cap->card, "cssp_camera");
++	strlcpy(cap->bus_info, dev->v4l2_dev.name, sizeof(cap->bus_info));
++	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
++			    V4L2_CAP_READWRITE;
++	return 0;
++}
++
++static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
++					struct v4l2_fmtdesc *f)
++{
++	struct cssp_cam_fmt *fmt;
++
++	if (f->index >= ARRAY_SIZE(formats))
++		return -EINVAL;
++
++	fmt = &formats[f->index];
++
++	strlcpy(f->description, fmt->name, sizeof(f->description));
++	f->pixelformat = fmt->fourcc;
++	return 0;
++}
++
++static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
++					struct v4l2_format *f)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++
++	f->fmt.pix.width	= dev->width;
++	f->fmt.pix.height	= dev->height;
++	f->fmt.pix.field	= dev->field;
++	f->fmt.pix.pixelformat	= dev->fmt->fourcc;
++	f->fmt.pix.bytesperline	= dev->bytesperline;
++	f->fmt.pix.sizeimage	= dev->sizeimage;
++	f->fmt.pix.colorspace	= dev->colorspace;
++
++	return 0;
++}
++
++static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
++			struct v4l2_format *f)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	struct cssp_cam_fmt *fmt;
++	struct v4l2_mbus_framefmt mbus_fmt;
++	struct v4l2_pix_format *pix = &f->fmt.pix;
++
++	fmt = get_format(f);
++	if (!fmt) {
++		dprintk(dev, 1, "Fourcc format (0x%08x) invalid.\n",
++			f->fmt.pix.pixelformat);
++		return -EINVAL;
++	}
++
++	v4l2_fill_mbus_format(&mbus_fmt, pix, fmt->code);
++	v4l2_subdev_call(dev->subdev, video, try_mbus_fmt, &mbus_fmt);
++	v4l2_fill_pix_format(pix, &mbus_fmt);
++	pix->bytesperline = (pix->width * fmt->depth) >> 3;
++	pix->sizeimage = pix->height * pix->bytesperline;
++
++	return 0;
++}
++
++static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
++					struct v4l2_format *f)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	struct vb2_queue *q = &dev->vb_vidq;
++	struct v4l2_pix_format *pix = &f->fmt.pix;
++	struct v4l2_mbus_framefmt mbus_fmt;
++
++	int ret = vidioc_try_fmt_vid_cap(file, priv, f);
++	if (ret < 0)
++		return ret;
++
++	if (vb2_is_streaming(q)) {
++		dprintk(dev, 1, "%s device busy\n", __func__);
++		return -EBUSY;
++	}
++
++	dev->fmt = get_format(f);
++	dev->width = f->fmt.pix.width;
++	dev->height = f->fmt.pix.height;
++	dev->field = f->fmt.pix.field;
++	dev->colorspace = f->fmt.pix.colorspace;
++	dev->bytesperline = f->fmt.pix.bytesperline;
++	dev->sizeimage = f->fmt.pix.sizeimage;
++
++	/* Set the sensor into the new format */
++	v4l2_fill_mbus_format(&mbus_fmt, pix, dev->fmt->code);
++	v4l2_subdev_call(dev->subdev, video, s_mbus_fmt, &mbus_fmt);
++
++	/* Set the EDMA for the new resolution */
++	dev->dma_tr_params.a_b_cnt = ACNT(BYTES_PER_DMA_EVT) | BCNT(dev->bytesperline / BYTES_PER_DMA_EVT);
++	dev->dma_tr_params.link_bcntrld = BCNTRLD(dev->bytesperline / BYTES_PER_DMA_EVT) | LINK(0xffff);
++	dev->dma_tr_params.ccnt = CCNT(dev->height);
++
++	return 0;
++}
++
++static int vidioc_reqbufs(struct file *file, void *priv,
++			  struct v4l2_requestbuffers *p)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	return vb2_reqbufs(&dev->vb_vidq, p);
++}
++
++static int vidioc_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	return vb2_querybuf(&dev->vb_vidq, p);
++}
++
++static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	return vb2_qbuf(&dev->vb_vidq, p);
++}
++
++static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	return vb2_dqbuf(&dev->vb_vidq, p, file->f_flags & O_NONBLOCK);
++}
++
++static int vidioc_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	return vb2_streamon(&dev->vb_vidq, i);
++}
++
++static int vidioc_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	return vb2_streamoff(&dev->vb_vidq, i);
++}
++
++static int vidioc_log_status(struct file *file, void *priv)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++
++	v4l2_ctrl_handler_log_status(&dev->ctrl_handler, dev->v4l2_dev.name);
++	return 0;
++}
++
++static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id *i)
++{
++	return 0;
++}
++
++/* only one input in this sample driver */
++static int vidioc_enum_input(struct file *file, void *priv,
++				struct v4l2_input *inp)
++{
++	return -EINVAL;
++
++	inp->type = V4L2_INPUT_TYPE_CAMERA;
++	inp->std = V4L2_STD_525_60;
++	sprintf(inp->name, "Camera %u", inp->index);
++	return 0;
++}
++
++static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++
++	*i = dev->input;
++
++	return 0;
++}
++
++static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++
++	return -EINVAL;
++
++	if (i == dev->input)
++		return 0;
++
++	dev->input = i;
++
++	return 0;
++}
++
++static int vidioc_subscribe_event(struct v4l2_fh *fh,
++				struct v4l2_event_subscription *sub)
++{
++	switch (sub->type) {
++	case V4L2_EVENT_CTRL:
++		return v4l2_event_subscribe(fh, sub, 0);
++	default:
++		return -EINVAL;
++	}
++}
++
++static const struct v4l2_ioctl_ops cssp_cam_ioctl_ops = {
++	.vidioc_querycap		= vidioc_querycap,
++	.vidioc_enum_fmt_vid_cap	= vidioc_enum_fmt_vid_cap,
++	.vidioc_g_fmt_vid_cap		= vidioc_g_fmt_vid_cap,
++	.vidioc_try_fmt_vid_cap		= vidioc_try_fmt_vid_cap,
++	.vidioc_s_fmt_vid_cap		= vidioc_s_fmt_vid_cap,
++	.vidioc_reqbufs			= vidioc_reqbufs,
++	.vidioc_querybuf		= vidioc_querybuf,
++	.vidioc_qbuf			= vidioc_qbuf,
++	.vidioc_dqbuf			= vidioc_dqbuf,
++	.vidioc_s_std			= vidioc_s_std,
++	.vidioc_enum_input		= vidioc_enum_input,
++	.vidioc_g_input			= vidioc_g_input,
++	.vidioc_s_input			= vidioc_s_input,
++	.vidioc_streamon		= vidioc_streamon,
++	.vidioc_streamoff		= vidioc_streamoff,
++	.vidioc_log_status		= vidioc_log_status,
++	.vidioc_subscribe_event		= vidioc_subscribe_event,
++	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
++};
++
++
++/* ------------------------------------------------------------------
++	File operations
++   ------------------------------------------------------------------*/
++
++static unsigned int video_poll(struct file *file, struct poll_table_struct *wait)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	struct v4l2_fh *fh = file->private_data;
++	struct vb2_queue *q = &dev->vb_vidq;
++	unsigned int res;
++
++	dprintk(dev, 1, "%s\n", __func__);
++	res = vb2_poll(q, file, wait);
++	if (v4l2_event_pending(fh))
++		res |= POLLPRI;
++	else
++		poll_wait(file, &fh->wait, wait);
++	return res;
++}
++
++static int video_mmap(struct file *file, struct vm_area_struct *vma)
++{
++	struct cssp_cam_dev *dev = video_drvdata(file);
++	int ret;
++
++	dprintk(dev, 1, "mmap called, vma=0x%08lx\n", (unsigned long)vma);
++
++	ret = vb2_mmap(&dev->vb_vidq, vma);
++	dprintk(dev, 1, "vma start=0x%08lx, size=%ld, ret=%d\n",
++		(unsigned long)vma->vm_start,
++		(unsigned long)vma->vm_end - (unsigned long)vma->vm_start,
++		ret);
++	return ret;
++}
++
++static ssize_t video_read(struct file *file, char __user *buf, size_t size, loff_t *offset)
++{
++	struct cssp_cam_dev *cam_dev = video_drvdata(file);
++
++	dprintk(cam_dev, 1, "read called\n");
++	return vb2_read(&cam_dev->vb_vidq, buf, size, offset, file->f_flags & O_NONBLOCK);
++}
++
++static int video_close(struct file *file)
++{
++	struct video_device *vdev = video_devdata(file);
++	struct cssp_cam_dev *cam_dev = video_drvdata(file);
++
++	dprintk(cam_dev, 1, "close called (dev=%s), file %p\n",
++		video_device_node_name(vdev), file);
++
++	if (v4l2_fh_is_singular_file(file))
++		vb2_queue_release(&cam_dev->vb_vidq);
++	return v4l2_fh_release(file);
++}
++
++static const struct v4l2_file_operations cssp_cam_fops = {
++	.owner		= THIS_MODULE,
++	.open		= v4l2_fh_open,
++	.release	= video_close,
++	.read		= video_read,
++	.poll		= video_poll,
++	.unlocked_ioctl	= video_ioctl2,
++	.mmap		= video_mmap,
++};
++
++
++/* ------------------------------------------------------------------
++	Driver initialization
++   ------------------------------------------------------------------*/
++
++static struct video_device cssp_cam_template = {
++	.name		= "cssp_camera",
++	.fops		= &cssp_cam_fops,
++	.ioctl_ops	= &cssp_cam_ioctl_ops,
++	.minor		= -1,
++	.release	= video_device_release,
++	.tvnorms	= V4L2_STD_525_60,
++	.current_norm	= V4L2_STD_NTSC_M,
++};
++
++static int __init  video_probe(struct cssp_cam_dev *cam_dev)
++{
++	struct video_device *vfd;
++	struct v4l2_ctrl_handler *hdl;
++	struct vb2_queue *q;
++	int ret = 0;
++
++	snprintf(cam_dev->v4l2_dev.name, sizeof(cam_dev->v4l2_dev.name),
++			"%s-%03d", "cssp_camera", 0);
++	ret = v4l2_device_register(NULL, &cam_dev->v4l2_dev);
++	if (ret)
++		goto free_dev;
++
++	cam_dev->fmt = &formats[0];
++	cam_dev->width = VGA_WIDTH;
++	cam_dev->height = VGA_HEIGHT;
++	cam_dev->sizeimage = VGA_WIDTH * VGA_HEIGHT * BYTES_PER_PIXEL;
++	hdl = &cam_dev->ctrl_handler;
++	v4l2_ctrl_handler_init(hdl, 0);
++
++	if (hdl->error) {
++		ret = hdl->error;
++		goto unreg_dev;
++	}
++	cam_dev->v4l2_dev.ctrl_handler = hdl;
++
++	/* initialize locks */
++	spin_lock_init(&cam_dev->slock);
++
++	/* initialize queue */
++	q = &cam_dev->vb_vidq;
++	memset(q, 0, sizeof(cam_dev->vb_vidq));
++	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
++	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
++	q->drv_priv = cam_dev;
++	q->buf_struct_size = sizeof(struct cssp_cam_buffer);
++	q->ops = &cssp_cam_video_qops;
++	q->mem_ops = &vb2_dma_contig_memops;
++
++	vb2_queue_init(q);
++
++	mutex_init(&cam_dev->mutex);
++
++	/* init video dma queues */
++	INIT_LIST_HEAD(&cam_dev->vidq.active);
++
++	ret = -ENOMEM;
++	vfd = video_device_alloc();
++	if (!vfd)
++		goto unreg_dev;
++
++	*vfd = cssp_cam_template;
++	vfd->debug = debug;
++	vfd->v4l2_dev = &cam_dev->v4l2_dev;
++	set_bit(V4L2_FL_USE_FH_PRIO, &vfd->flags);
++
++	/*
++	 * Provide a mutex to v4l2 core. It will be used to protect
++	 * all fops and v4l2 ioctls.
++	 */
++	vfd->lock = &cam_dev->mutex;
++
++	ret = video_register_device(vfd, VFL_TYPE_GRABBER, video_nr);
++	if (ret < 0)
++		goto rel_vdev;
++
++	video_set_drvdata(vfd, cam_dev);
++
++	if (video_nr != -1)
++		video_nr++;
++
++	cam_dev->vdev = vfd;
++	v4l2_info(&cam_dev->v4l2_dev, "V4L2 device registered as %s\n",
++	video_device_node_name(vfd));
++
++	return 0;
++
++rel_vdev:
++	video_device_release(vfd);
++unreg_dev:
++	v4l2_ctrl_handler_free(hdl);
++	v4l2_device_unregister(&cam_dev->v4l2_dev);
++free_dev:
++	return ret;
++}
++
++static int video_remove(struct cssp_cam_dev *cam_dev)
++{
++	if (cam_dev->dma_cont_ctx != NULL)
++		vb2_dma_contig_cleanup_ctx(cam_dev->dma_cont_ctx);
++
++	v4l2_info(&cam_dev->v4l2_dev, "unregistering %s\n",
++			video_device_node_name(cam_dev->vdev));
++	video_unregister_device(cam_dev->vdev);
++	v4l2_device_unregister(&cam_dev->v4l2_dev);
++	v4l2_ctrl_handler_free(&cam_dev->ctrl_handler);
++
++	return 0;
++}
++
++static int __init  cssp_cam_probe(struct platform_device *pdev)
++{
++	struct cssp_cam_dev *cam_dev;
++	int ret = 0;
++	struct cssp_cam_platform_data *cssp_cam_platform_data;
++
++	cssp_cam_platform_data = (struct cssp_cam_platform_data *) pdev->dev.platform_data;
++	if (cssp_cam_platform_data == NULL) {
++		printk(KERN_ERR "[%s]: missing platform data\n", pdev->name);
++		return -ENODEV;
++	}
++
++	if (cssp_cam_platform_data->cam_i2c_board_info == NULL) {
++		printk(KERN_ERR "[%s]: missing camera i2c board info\n", pdev->name);
++		return -ENODEV;
++	}
++
++	cam_dev = kzalloc(sizeof(*cam_dev), GFP_KERNEL);
++	if (!cam_dev)
++		return -ENOMEM;
++
++	cam_dev->pdev = pdev;
++	platform_set_drvdata(pdev, cam_dev);
++
++	cam_dev->camera_board_info = cssp_cam_platform_data->cam_i2c_board_info;
++
++	cam_dev->camera_clk = clk_get(&pdev->dev, cssp_cam_platform_data->cam_clk_name);
++	if (IS_ERR(cam_dev->camera_clk)) {
++		ret = PTR_ERR(cam_dev->camera_clk);
++		printk(KERN_ERR "[%s]: cannot clk_get %s\n", pdev->name, cssp_cam_platform_data->cam_clk_name);
++		goto fail0;
++	}
++
++	ret = configure_cssp(cam_dev);
++	if (ret)
++		goto fail1;
++
++	ret = configure_edma(cam_dev);
++	if (ret)
++		goto fail2;
++
++	cam_dev->mode = FMT_2X8_EN | PCLK_POL | HS_EN;
++
++	ret = configure_camera_sensor(cam_dev);
++	if (ret) {
++		printk(KERN_ERR "[%s]: camera sensor configuration failed\n", pdev->name);
++		goto fail3;
++	}
++
++	cam_dev->dma_cont_ctx = vb2_dma_contig_init_ctx(&pdev->dev);
++	if (IS_ERR(cam_dev->dma_cont_ctx)) {
++		ret = PTR_ERR(cam_dev->dma_cont_ctx);
++		goto fail3;
++	}
++
++	ret = video_probe(cam_dev);
++	if (ret)
++		goto fail4;
++
++	return ret;
++
++fail4:
++	vb2_dma_contig_cleanup_ctx(cam_dev->dma_cont_ctx);
++
++fail3:
++	edma_free_channel(cam_dev->dma_ch);
++
++fail2:
++	gpio_free(cam_dev->reset_pin);
++	iounmap((void *)cam_dev->reg_base_virt);
++	release_mem_region(cam_dev->reg_base_phys, cam_dev->reg_size);
++
++fail1:
++	clk_put(cam_dev->camera_clk);
++
++fail0:
++	kfree(cam_dev);
++
++	return ret;
++}
++
++static int cssp_cam_remove(struct platform_device *pdev)
++{
++	struct cssp_cam_dev *cam = platform_get_drvdata(pdev);
++
++	iounmap((void *)cam->reg_base_virt);
++
++	release_mem_region(cam->reg_base_phys, cam->reg_size);
++
++	gpio_free(cam->reset_pin);
++
++	edma_free_channel(cam->dma_ch);
++
++	video_remove(cam);
++
++	clk_put(cam->camera_clk);
++
++	kfree(cam);
++
++	printk(KERN_INFO "[%s]: removed\n", pdev->name);
++
++	return 0;
++}
++
++
++static struct platform_driver cssp_cam_driver = {
++	.probe		= cssp_cam_probe,
++	.remove		= __devexit_p(cssp_cam_remove),
++	.driver		= {
++		.name	= "cssp-camera",
++		.owner	= THIS_MODULE,
++	},
++};
++
++
++static int __init cssp_cam_init(void)
++{
++	return platform_driver_register(&cssp_cam_driver);
++}
++
++static void __exit cssp_cam_exit(void)
++{
++	platform_driver_unregister(&cssp_cam_driver);
++}
++
++
++module_init(cssp_cam_init);
++module_exit(cssp_cam_exit);
++
++/*
++ * Macros sets license, author and description
++ */
++MODULE_LICENSE("GPLv2");
++MODULE_AUTHOR("Dan Aizenstros, Damian Eppel, Przemek Szewczyk");
++MODULE_DESCRIPTION("QuickLogic Camera Interface driver");
++
+diff --git a/drivers/media/video/cssp_camera/cssp_camera.h b/drivers/media/video/cssp_camera/cssp_camera.h
+new file mode 100644
+index 0000000..d018ca1
+--- /dev/null
++++ b/drivers/media/video/cssp_camera/cssp_camera.h
+@@ -0,0 +1,148 @@
++/*
++ * cssp-camera driver
++ *
++ * Based on Vivi driver
++ *
++ * Copyright (C) 2012 QuickLogic Corp.
++ *
++ * Developed for QuickLogic by:
++ * Damian Eppel <damian.eppel@teleca.com>
++ * Przemek Szewczyk <przemek.szewczyk@teleca.com>
++ * Dan Aizenstros <daizenstros@quicklogic.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ *
++ */
++
++#ifndef CSSP_CAMERA_H
++#define CSSP_CAMERA_H
++
++
++static unsigned video_nr = -1;
++module_param(video_nr, uint, 0644);
++MODULE_PARM_DESC(video_nr, "videoX start number, -1 is autodetect");
++
++static unsigned debug;
++module_param(debug, uint, 0644);
++MODULE_PARM_DESC(debug, "activates debug info");
++
++static unsigned int vid_limit = 1;
++module_param(vid_limit, uint, 0644);
++MODULE_PARM_DESC(vid_limit, "capture memory limit in megabytes");
++
++#define dprintk(dev, level, fmt, arg...) \
++	v4l2_dbg(level, debug, &dev->v4l2_dev, fmt, ## arg)
++
++#define VGA_WIDTH 640
++#define VGA_HEIGHT 480
++
++#define MAX_WIDTH 2048
++#define MAX_HEIGHT 1536
++
++#define VGA_RES (VGA_WIDTH * VGA_HEIGHT)
++#define BYTES_PER_PIXEL 2
++#define BYTES_PER_DMA_EVT 32
++
++/* PaRAM.opt: */
++#define TCC(v) (((v) & 0x3f) << 12)
++/* PaRAM.a_b_cnt: */
++#define ACNT(v) ((v) & 0xffff)
++#define BCNT(v) (((v) & 0xffff) << 16)
++/* PaRAM.src_dst_bidx: */
++#define SRCBIDX(v) ((v) & 0xffff)
++#define DSTBIDX(v) (((v) & 0xffff) << 16)
++/* PaRAM.link_bcntrld: */
++#define LINK(v) ((v) & 0xffff)
++#define BCNTRLD(v) (((v) & 0xffff) << 16)
++/* PaRAM.src_dst_cidx: */
++#define SRCCIDX(v) ((v) & 0xffff)
++#define DSTCIDX(v) (((v) & 0xffff) << 16)
++/* PaRAM.ccnt: */
++#define CCNT(v) ((v) & 0xffff)
++
++
++struct cssp_cam_platform_data {
++	struct i2c_board_info *cam_i2c_board_info;
++	const char *cam_clk_name;
++	int dma_ch;
++	int gpio_reset_pin;
++};
++
++
++/* ------------------------------------------------------------------
++	video Basic structures
++   ------------------------------------------------------------------*/
++
++struct cssp_cam_fmt {
++	char	*name;
++	u32	fourcc;          /* v4l2 format id */
++	int	depth;
++	enum v4l2_mbus_pixelcode code;
++};
++
++/* buffer for one video frame */
++struct cssp_cam_buffer {
++	/* common v4l buffer stuff -- must be first */
++	struct vb2_buffer	vb;
++	struct list_head	list;
++	struct cssp_cam_fmt	*fmt;
++};
++
++struct cssp_cam_dmaqueue {
++	struct list_head	active;
++};
++
++struct cssp_cam_dev {
++	struct v4l2_device		v4l2_dev;
++	struct v4l2_ctrl_handler	ctrl_handler;
++	struct v4l2_subdev		*subdev;
++
++	spinlock_t			slock;
++	struct mutex			mutex;
++
++	/* various device info */
++	struct video_device		*vdev;
++	struct platform_device		*pdev;
++
++	struct cssp_cam_dmaqueue	vidq;
++	void				*dma_cont_ctx;
++	int				streaming_started;
++	struct vb2_buffer		*current_vb;
++
++	/* Input Number */
++	int				input;
++
++	/* video capture */
++	struct cssp_cam_fmt		*fmt;
++	u32				width;
++	u32				height;
++	u32				bytesperline;
++	u32				sizeimage;
++	enum v4l2_colorspace		colorspace;
++	struct vb2_queue		vb_vidq;
++	enum v4l2_field			field;
++	unsigned int			field_count;
++
++
++	/* Camera Sensor */
++	struct i2c_board_info		*camera_board_info;
++	struct clk			*camera_clk;
++
++	unsigned int			reg_base_virt;
++	unsigned int			reg_base_phys;
++	resource_size_t			reg_size;
++	u16				mode;
++
++	struct edmacc_param		dma_tr_params;
++	int				dma_ch;
++	u64				dma_mask;
++
++	int				frame_cnt;
++
++	int				reset_pin;
++};
++
++
++#endif /* CSSP_CAMERA_H */
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
deleted file mode 100644
index a916ad5..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0072-beaglebone-fix-audio-spi-clash.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 45ddec832968e3c1e31cf38a891372ba80027e2d Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 26 Jun 2012 08:39:04 +0200
-Subject: [PATCH] beaglebone: fix audio/spi clash
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/board-am335xevm.c |    3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index f6559b6..d0681a2 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2910,6 +2910,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 		
- 		beaglebone_leds_free = 0;
- 		dvileds_init(0,0);
-+		beaglebone_spi1_free = 0;
- 		mcasp0_init(0,0);
- 	
- 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
--- 
-1.7.10
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
new file mode 100644
index 0000000..051a727
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
@@ -0,0 +1,64 @@
+From 040c37e89e6a7a7311a470bda281e1163559173c Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 3 Jul 2012 08:45:47 +0200
+Subject: [PATCH 73/79] beaglebone: add support for DVI+audio and audio-only
+ capes
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |   32 ++++++++++++++++++++++++++++++--
+ 1 file changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 22a740f..bf40ac9 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2881,8 +2881,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		
+ 		beaglebone_leds_free = 0;
+ 		dvileds_init(0,0);
+-		beaglebone_spi1_free = 0;
+-		mcasp0_init(0,0);
++
++		// Uncomment these for custom DVI capes with audio populated
++		//beaglebone_spi1_free = 0;
++		//mcasp0_init(0,0);
+ 	
+ 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
+ 			pr_info("BeagleBone cape: DVI init for revision A1 or older\n");
+@@ -2898,6 +2900,32 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 			dvi_init(0,0);
+ 		}
+ 	}
++
++	if (!strncmp("BB-BONE-DVID-02", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing DVI+audio cape\n");
++
++		beaglebone_leds_free = 0;
++		dvileds_init(0,0);
++
++		beaglebone_spi1_free = 0;
++		mcasp0_init(0,0);
++	
++		setup_pin_mux(dvia2_pin_mux);
++		gpio_request(BEAGLEBONEDVI_PDn_A2, "DVI_PDn");
++		gpio_direction_output(BEAGLEBONEDVI_PDn_A2, 1);
++		dvi_init(0,0);
++	}
++
++	if (!strncmp("BB-BONE-AUDI-01", cape_config.partnumber, 15)) {
++		pr_info("BeagleBone cape: initializing audio cape\n");
++
++		beaglebone_leds_free = 0;
++		dvileds_init(0,0);
++
++		beaglebone_spi1_free = 0;
++		mcasp0_init(0,0);
++	}
++
+ 	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
+ 		pr_info("BeagleBone cape: initializing LCD cape\n");
+ 
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch
deleted file mode 100644
index 48ac34b..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch
+++ /dev/null
@@ -1,1612 +0,0 @@
-From cf35e6b861c3c7d4d9c9db1557ba27b5578e8aa2 Mon Sep 17 00:00:00 2001
-From: Dan Aizenstros <daizenstros@quicklogic.com>
-Date: Fri, 29 Jun 2012 13:57:49 -0400
-Subject: [PATCH] beaglebone: add support for QuickLogic Camera interface on
- camera cape
-
-Signed-off-by: Dan Aizenstros <daizenstros@quicklogic.com>
----
- arch/arm/mach-omap2/board-am335xevm.c         |  205 ++++-
- arch/arm/mach-omap2/devices.c                 |    2 +-
- arch/arm/plat-omap/include/plat/dma-33xx.h    |    1 +
- drivers/media/video/Kconfig                   |    7 +
- drivers/media/video/Makefile                  |    2 +
- drivers/media/video/cssp_camera/Makefile      |    3 +
- drivers/media/video/cssp_camera/cssp_camera.c | 1119 +++++++++++++++++++++++++
- drivers/media/video/cssp_camera/cssp_camera.h |  148 ++++
- 8 files changed, 1478 insertions(+), 9 deletions(-)
- create mode 100644 drivers/media/video/cssp_camera/Makefile
- create mode 100644 drivers/media/video/cssp_camera/cssp_camera.c
- create mode 100644 drivers/media/video/cssp_camera/cssp_camera.h
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index dc78b4a..1680612 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -66,6 +66,10 @@
- #include <plat/mmc.h>
- #include <plat/emif.h>
- #include <plat/nand.h>
-+#include <plat/dma-33xx.h>
-+
-+#include <media/soc_camera.h>
-+#include <media/mt9t112.h>
- 
- #include "board-flash.h"
- #include "cpuidle33xx.h"
-@@ -804,6 +808,42 @@ static struct pinmux_config i2c1_pin_mux[] = {
- 	{NULL, 0},
- };
- 
-+/* Pin mux for GPMC bus */
-+static struct pinmux_config gpmc_pin_mux[] = {
-+	{"gpmc_ad0.gpmc_ad0",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad1.gpmc_ad1",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad2.gpmc_ad2",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad3.gpmc_ad3",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad4.gpmc_ad4",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad5.gpmc_ad5",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad6.gpmc_ad6",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad7.gpmc_ad7",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad8.gpmc_ad8",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad9.gpmc_ad9",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad10.gpmc_ad10",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad11.gpmc_ad11",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad12.gpmc_ad12",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad13.gpmc_ad13",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad14.gpmc_ad14",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_ad15.gpmc_ad15",	  OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_wait0.gpmc_wait0", OMAP_MUX_MODE0 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_wpn.gpmc_wpn",	  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT_PULLUP},
-+	{"gpmc_csn1.gpmc_csn1",	  OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
-+	{"gpmc_advn_ale.gpmc_advn_ale",  OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
-+	{"gpmc_oen_ren.gpmc_oen_ren",	 OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
-+	{"gpmc_wen.gpmc_wen",     OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
-+	{"gpmc_ben0_cle.gpmc_ben0_cle",	 OMAP_MUX_MODE0 | AM33XX_PULL_DISA},
-+	{"gpmc_clk.gpmc_clk",	 OMAP_MUX_MODE0 | AM33XX_PIN_INPUT},
-+	{"ecap0_in_pwm0_out.xdma_event_intr2", OMAP_MUX_MODE6 | AM33XX_PIN_INPUT}, // DMAREQ
-+	{NULL, 0},
-+};
-+
-+static struct pinmux_config camera_cape_pin_mux[] = {
-+	{"spi0_d1.gpio0_4",    OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT },		// QL CSSP and Camera Sensor Reset
-+	{"spi0_cs0.gpio0_5",   OMAP_MUX_MODE7 | AM33XX_PIN_OUTPUT_PULLUP },	// 1V8 and 2V8 Power Enable
-+	{NULL, 0},
-+};
-+
- static struct pinmux_config i2c2_pin_mux[] = {
- 	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
- 					AM33XX_PIN_INPUT_PULLUP},
-@@ -1803,6 +1843,156 @@ static void dvileds_init(int evm_id, int profile )
- 		pr_err("failed to register BeagleBone DVI cape LEDS\n");
- }
- 
-+static struct resource cssp_camera_resources[] = {
-+	{
-+		.name = "gpmc_phys_mem_slot",
-+		.flags = IORESOURCE_MEM,
-+	},
-+};
-+
-+static struct mt9t112_camera_info mt9t111_cam_info = {
-+	/* divider calculated for 32Mhz CAM_MCLK */
-+	.divider = {
-+		.m = 24, .n = 1,
-+		.p1 = 0, .p2 = 7, .p3 = 0, .p4 = 11, .p5 = 15, .p6 = 7, .p7 = 0,
-+	},
-+};
-+
-+static struct soc_camera_link mt9t111_camera_link =  {
-+	.priv = &mt9t111_cam_info,
-+	.i2c_adapter_id = 3,
-+};
-+
-+static struct i2c_board_info i2c_camera = {
-+	I2C_BOARD_INFO("mt9t112", 0x3c),
-+	.platform_data = &mt9t111_camera_link,
-+};
-+
-+struct cssp_cam_platform_data {
-+	struct i2c_board_info *cam_i2c_board_info;
-+	const char *cam_clk_name;
-+	int dma_ch;
-+	int cssp_reset_pin;
-+};
-+
-+static struct cssp_cam_platform_data cssp_cam_platform_data = {
-+	.cam_i2c_board_info = &i2c_camera,
-+	.cam_clk_name = "clkout2_ck",
-+	.dma_ch = AM33XX_DMA_XDMA_EVENT_INTR2,
-+	.cssp_reset_pin = GPIO_TO_PIN(0, 4),
-+};
-+
-+static struct platform_device cssp_camera = {
-+	.name  = "cssp-camera",
-+	.id    = -1,
-+	.dev   = {
-+		.platform_data = &cssp_cam_platform_data,
-+	},
-+	.num_resources = sizeof(cssp_camera_resources) / sizeof(cssp_camera_resources[0]),
-+	.resource = cssp_camera_resources,
-+};
-+
-+static struct gpmc_timings cssp_timings = {
-+	/* Minimum clock period for synchronous mode (in picoseconds) */
-+	.sync_clk = 10000,
-+
-+	.cs_on = 0,
-+	.cs_rd_off = 23 * 10,		/* Read deassertion time */
-+	.cs_wr_off = 23 * 10,		/* Write deassertion time */
-+
-+	/* ADV signal timings corresponding to GPMC_CONFIG3 */
-+	.adv_on = 0,			/* Assertion time */
-+	.adv_rd_off = 2 * 10,		/* Read deassertion time */
-+	.adv_wr_off = 2 * 10,		/* Write deassertion time */
-+
-+	/* WE signals timings corresponding to GPMC_CONFIG4 */
-+	.we_on = 3 * 10,		/* WE assertion time */
-+	.we_off = 23 * 10,		/* WE deassertion time */
-+
-+	/* OE signals timings corresponding to GPMC_CONFIG4 */
-+	.oe_on = 3 * 10,		/* OE assertion time */
-+	.oe_off = 23 * 10,		/* OE deassertion time */
-+
-+	/* Access time and cycle time timings corresponding to GPMC_CONFIG5 */
-+	.page_burst_access = 1 * 10,	/* Multiple access word delay */
-+	.access = 7 * 10,		/* Start-cycle to first data valid delay */
-+	.rd_cycle = 23 * 10,		/* Total read cycle time */
-+	.wr_cycle = 23 * 10,		/* Total write cycle time */
-+
-+	/* The following are only on OMAP3430 */
-+	.wr_access = 7 * 10,		/* WRACCESSTIME */
-+	.wr_data_mux_bus = 3 * 10,	/* WRDATAONADMUXBUS */
-+};
-+
-+static int gpmc_cssp_init(void)
-+{
-+	int cs = 1; /* Chip Select on GPMC bus */
-+	int val;
-+	long unsigned int cssp_gpmc_mem_base_phys;
-+
-+	if (gpmc_cs_request(cs, SZ_16M, &cssp_gpmc_mem_base_phys) < 0) {
-+			printk(KERN_ERR "[cssp_cam platform init]: gpmc_cs_request failed\n");
-+			return -1;
-+	}
-+
-+	cssp_camera_resources[0].start = cssp_gpmc_mem_base_phys;
-+	cssp_camera_resources[0].end = cssp_gpmc_mem_base_phys + 0x1ffff;
-+
-+	if (gpmc_cs_configure(cs, GPMC_CONFIG_DEV_TYPE, GPMC_DEVICETYPE_NOR) < 0) {
-+			printk(KERN_ERR "[cssp_cam platform init]: gpmc_cs_configure failed\n");
-+			return -1;
-+	}
-+
-+	val = GPMC_CONFIG1_READMULTIPLE_SUPP;
-+	val |= GPMC_CONFIG1_READTYPE_SYNC;
-+	val |= GPMC_CONFIG1_WRITETYPE_SYNC;
-+	val |= GPMC_CONFIG1_CLKACTIVATIONTIME(1);
-+	val |= GPMC_CONFIG1_PAGE_LEN(2);
-+	val |= GPMC_CONFIG1_DEVICESIZE_16;
-+	val |= GPMC_CONFIG1_DEVICETYPE_NOR;
-+	val |= GPMC_CONFIG1_MUXADDDATA;
-+	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, val);
-+
-+	if (gpmc_cs_set_timings(cs, &cssp_timings) < 0) {
-+		printk(KERN_ERR "Failed gpmc_cs_set_timings for QuickLogic CAMIF device\n");
-+		goto free;
-+	}
-+
-+	val = gpmc_cs_read_reg(cs, GPMC_CS_CONFIG6);
-+	val &= 0xe0f0f030;
-+	val |= 0x07030481;
-+	gpmc_cs_write_reg(cs, GPMC_CS_CONFIG6, val);
-+
-+	printk(KERN_INFO "gpmc_cssp_init for QuickLogic CAMIF device succeeded\n");
-+
-+	return 0;
-+
-+free:
-+	gpmc_cs_free(cs);
-+
-+	printk(KERN_ERR "Could not initialize QuickLogic CAMIF device\n");
-+
-+	return -1;
-+}
-+
-+static void cssp_gpmc_init(void)
-+{
-+	struct gpmc_devices_info gpmc_device[2] = {
-+			{ NULL, GPMC_DEVICE_NOR },
-+		};
-+
-+	setup_pin_mux(camera_cape_pin_mux);
-+	setup_pin_mux(gpmc_pin_mux);
-+
-+	omap_init_gpmc(gpmc_device, sizeof(gpmc_device));
-+	gpmc_cssp_init();
-+
-+	platform_device_register(&cssp_camera);
-+
-+	printk(KERN_INFO "[cssp_cam platform init]: cssp_gpmc_init: DONE\n");
-+}
-+
-+
- static void lcd3leds_init(int evm_id, int profile )
- {
- 	int err;
-@@ -2851,6 +3041,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 	if (!strncmp("BB-BONE-CAM-01", cape_config.partnumber, 14)) {
- 		pr_info("BeagleBone cape: recognized Camera cape\n");
- 		beaglebone_w1gpio_free = 0;
-+		cssp_gpmc_init();
- 	}
- 
- 	goto out2;
-@@ -3762,15 +3953,13 @@ static struct pinmux_config clkout2_pin_mux[] = {
- 
- static void __init clkout2_enable(void)
- {
--	struct clk *ck_32;
--
--	ck_32 = clk_get(NULL, "clkout2_ck");
--	if (IS_ERR(ck_32)) {
--		pr_err("Cannot clk_get ck_32\n");
--		return;
--	}
-+	void __iomem *base;
-+	unsigned int val;
- 
--	clk_enable(ck_32);
-+	base = ioremap(0x44E00700, SZ_4K);
-+	val = (5 << 3) | (3 << 0); //32 MHz
-+	writel(val, base);
-+	iounmap(base);
- 
- 	setup_pin_mux(clkout2_pin_mux);
- }
-diff --git a/arch/arm/mach-omap2/devices.c b/arch/arm/mach-omap2/devices.c
-index 41c9b0f..3ef045e 100644
---- a/arch/arm/mach-omap2/devices.c
-+++ b/arch/arm/mach-omap2/devices.c
-@@ -968,7 +968,7 @@ static struct event_to_channel_map am33xx_xbar_event_mapping[] = {
- 	{27, -1},
- 	{28, -1},
- 	{29, -1},
--	{30, -1},
-+	{30, 20},	/* XDMA_EVENT_INTR2 */
- 	{31, -1},
- 	{-1, -1}
- };
-diff --git a/arch/arm/plat-omap/include/plat/dma-33xx.h b/arch/arm/plat-omap/include/plat/dma-33xx.h
-index bebdaa7..ded00aa 100644
---- a/arch/arm/plat-omap/include/plat/dma-33xx.h
-+++ b/arch/arm/plat-omap/include/plat/dma-33xx.h
-@@ -83,5 +83,6 @@
- #define AM33XX_DMA_PWMSS2_EPW				63
- #define AM33XX_DMA_MMCHS2_W				64	/* xBar */
- #define AM33XX_DMA_MMCHS2_R				65	/* xBar */
-+#define AM33XX_DMA_XDMA_EVENT_INTR2			93	/* xBar */
- 
- #endif
-diff --git a/drivers/media/video/Kconfig b/drivers/media/video/Kconfig
-index b303a3f..a31723f 100644
---- a/drivers/media/video/Kconfig
-+++ b/drivers/media/video/Kconfig
-@@ -1002,6 +1002,13 @@ config VIDEO_S5P_MIPI_CSIS
- 
- source "drivers/media/video/s5p-tv/Kconfig"
- 
-+config VIDEO_QL_CAMIF
-+	tristate "QuickLogic Camera Interface support (EXPERIMENTAL)"
-+	depends on VIDEO_DEV && SOC_CAMERA && SOC_OMAPAM33XX && EXPERIMENTAL
-+	select VIDEOBUF2_DMA_CONTIG
-+	---help---
-+	  This is a v4l2 driver for the QuickLogic CAMIF controller.
-+
- #
- # USB Multimedia device configuration
- #
-diff --git a/drivers/media/video/Makefile b/drivers/media/video/Makefile
-index 117f9c4..af7af692 100644
---- a/drivers/media/video/Makefile
-+++ b/drivers/media/video/Makefile
-@@ -195,6 +195,8 @@ obj-y	+= davinci/
- 
- obj-$(CONFIG_ARCH_OMAP)	+= omap/
- 
-+obj-$(CONFIG_VIDEO_QL_CAMIF)	+= cssp_camera/
-+
- ccflags-y += -Idrivers/media/dvb/dvb-core
- ccflags-y += -Idrivers/media/dvb/frontends
- ccflags-y += -Idrivers/media/common/tuners
-diff --git a/drivers/media/video/cssp_camera/Makefile b/drivers/media/video/cssp_camera/Makefile
-new file mode 100644
-index 0000000..d85a84e
---- /dev/null
-+++ b/drivers/media/video/cssp_camera/Makefile
-@@ -0,0 +1,3 @@
-+# cssp_camera
-+
-+obj-$(CONFIG_VIDEO_QL_CAMIF) += cssp_camera.o
-diff --git a/drivers/media/video/cssp_camera/cssp_camera.c b/drivers/media/video/cssp_camera/cssp_camera.c
-new file mode 100644
-index 0000000..39aa003
---- /dev/null
-+++ b/drivers/media/video/cssp_camera/cssp_camera.c
-@@ -0,0 +1,1119 @@
-+/*
-+ * cssp-camera driver
-+ *
-+ * Based on Vivi driver
-+ *
-+ * Copyright (C) 2012 QuickLogic Corp.
-+ *
-+ * Developed for QuickLogic by:
-+ * Damian Eppel <damian.eppel@teleca.com>
-+ * Przemek Szewczyk <przemek.szewczyk@teleca.com>
-+ * Dan Aizenstros <daizenstros@quicklogic.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ *
-+ */
-+
-+
-+#include <linux/init.h>
-+#include <linux/module.h>
-+#include <linux/gpio.h>
-+#include <linux/i2c.h>
-+#include <linux/delay.h>
-+#include <linux/spinlock.h>
-+#include <linux/dma-mapping.h>
-+#include <linux/interrupt.h>
-+#include <mach/edma.h>
-+#include <linux/clk.h>
-+// V4L2 Interface *********************
-+#include <media/soc_camera.h>
-+#include <media/v4l2-mediabus.h>
-+#include <media/videobuf2-dma-contig.h>
-+#include <media/v4l2-ioctl.h>
-+#include <media/v4l2-event.h>
-+//*************************************
-+#include "cssp_camera.h"
-+
-+
-+/*
-+ * ---------------------------------------------------------------------------
-+ *  QuickLoigc Camera Interface registers
-+ * ---------------------------------------------------------------------------
-+ */
-+
-+#define REG_MODE		0x00000
-+#define REG_DATA		0x10000
-+
-+/* MODE bit shifts */
-+#define FMT_2X8_EN		BIT(15) /* Enable 2 byte format on CAMIF bus (0 - 10 bit, 1 - 16 bit 2x8) */
-+#define PCLK_POL		BIT(14) /* PCLK polarity (0 - rising edge, 1 - falling edge */
-+#define HS_EN			BIT(13) /* High speed bus (0 =< 50 MHz, 1 > 50 MHz) */
-+#define ENABLE			BIT(12)
-+
-+
-+static struct cssp_cam_fmt formats[] = {
-+	{
-+		.name	= "4:2:2, packed, YUYV",
-+		.fourcc	= V4L2_PIX_FMT_YUYV,
-+		.depth	= 16,
-+		.code	= V4L2_MBUS_FMT_YUYV8_2X8,
-+	},
-+	{
-+		.name	= "4:2:2, packed, UYVY",
-+		.fourcc	= V4L2_PIX_FMT_UYVY,
-+		.depth	= 16,
-+		.code	= V4L2_MBUS_FMT_UYVY8_2X8,
-+	},
-+	{
-+		.name	= "4:2:2, packed, VYUY",
-+		.fourcc	= V4L2_PIX_FMT_VYUY,
-+		.depth	= 16,
-+		.code	= V4L2_MBUS_FMT_VYUY8_2X8,
-+	},
-+	{
-+		.name	= "4:2:2, packed, YVYU",
-+		.fourcc	= V4L2_PIX_FMT_YVYU,
-+		.depth	= 16,
-+		.code	= V4L2_MBUS_FMT_YVYU8_2X8,
-+	},
-+	{
-+		.name	= "RGB565 (LE)",
-+		.fourcc	= V4L2_PIX_FMT_RGB565,
-+		.depth	= 16,
-+		.code	= V4L2_MBUS_FMT_RGB565_2X8_LE,
-+	},
-+	{
-+		.name	= "RGB555 (LE)",
-+		.fourcc	= V4L2_PIX_FMT_RGB555,
-+		.depth	= 16,
-+		.code	= V4L2_MBUS_FMT_RGB555_2X8_PADHI_LE,
-+	},
-+};
-+
-+
-+/***************************************************************************/
-+
-+
-+static int configure_gpio(int nr, int val, const char *name)
-+{
-+	unsigned long flags = val ? GPIOF_OUT_INIT_HIGH : GPIOF_OUT_INIT_LOW;
-+	int ret;
-+	if (!gpio_is_valid(nr))
-+		return 0;
-+	ret = gpio_request_one(nr, flags, name);
-+	if (!ret)
-+		gpio_export(nr, 0);
-+	return ret;
-+}
-+
-+static int reset_cssp(struct cssp_cam_dev *cam)
-+{
-+	struct platform_device *pdev = cam->pdev;
-+	int err;
-+
-+	cam->reset_pin = ((struct cssp_cam_platform_data *)pdev->dev.platform_data)->gpio_reset_pin;
-+
-+	err = configure_gpio(cam->reset_pin, 0, "cssp_reset");
-+	if (err) {
-+		printk(KERN_ERR "[%s]: failed to configure cssp reset pin\n", pdev->name);
-+		return -1;
-+	}
-+
-+	mdelay(1);
-+
-+	gpio_direction_output(cam->reset_pin, 1);
-+
-+	return err;
-+}
-+
-+static int trigger_dma_transfer_to_buf(struct cssp_cam_dev *dev, struct vb2_buffer *vb)
-+{
-+	dma_addr_t dma_buf = vb2_dma_contig_plane_dma_addr(vb, 0);
-+
-+	if (!dma_buf) {
-+		/* Is this possible? Release the vb2_buffer with an error here, */
-+		vb2_buffer_done(vb, VB2_BUF_STATE_ERROR);
-+		dev->current_vb = NULL;
-+		return -ENOMEM;
-+	}
-+
-+	dev->dma_tr_params.dst = dma_buf;
-+
-+	// Enable DMA
-+	edma_write_slot(dev->dma_ch, &dev->dma_tr_params);
-+
-+	// Enable data capture
-+	dev->mode |= ENABLE;
-+	writew(dev->mode, dev->reg_base_virt + REG_MODE);
-+	readw(dev->reg_base_virt + REG_MODE);
-+
-+	dev->current_vb = vb;
-+
-+	return 0;
-+}
-+
-+static void dequeue_buffer_for_dma(struct cssp_cam_dev *dev)
-+{
-+	struct cssp_cam_dmaqueue *dma_q = &dev->vidq;
-+	unsigned long flags = 0;
-+
-+	spin_lock_irqsave(&dev->slock, flags);
-+	if (!list_empty(&dma_q->active)) {
-+		struct cssp_cam_buffer *buf;
-+
-+		buf = list_entry(dma_q->active.next, struct cssp_cam_buffer, list);
-+		list_del(&buf->list);
-+		spin_unlock_irqrestore(&dev->slock, flags);
-+
-+		buf->fmt = dev->fmt;
-+
-+		trigger_dma_transfer_to_buf(dev, &buf->vb);
-+	} else {
-+		spin_unlock_irqrestore(&dev->slock, flags);
-+	}
-+}
-+
-+static void dma_callback(unsigned lch, u16 ch_status, void *data)
-+{
-+	struct cssp_cam_dev *dev = (struct cssp_cam_dev *)data;
-+
-+	// Disable data capture
-+	dev->mode &= ~ENABLE;
-+	writew(dev->mode, dev->reg_base_virt + REG_MODE);
-+	readw(dev->reg_base_virt + REG_MODE);
-+
-+	if (ch_status == DMA_COMPLETE) {
-+		struct vb2_buffer *vb = dev->current_vb;
-+		struct timeval ts;
-+
-+		vb->v4l2_buf.field = dev->field;
-+		dev->field_count++;
-+		vb->v4l2_buf.sequence = dev->field_count >> 1;
-+		do_gettimeofday(&ts);
-+		vb->v4l2_buf.timestamp = ts;
-+		vb2_buffer_done(vb, VB2_BUF_STATE_DONE);
-+		dev->current_vb = NULL;
-+		dev->frame_cnt++;
-+
-+		/* check if we have new buffer queued */
-+		dequeue_buffer_for_dma(dev);
-+	} else {
-+		printk(KERN_ERR "[cssp_camera]: EDMA error (ch_status = %d)\n", ch_status);
-+		/* we got a missed interrupt so just start a new DMA with the existing buffer */
-+		if (dev->current_vb != NULL)
-+			trigger_dma_transfer_to_buf(dev, dev->current_vb);
-+	}
-+}
-+
-+static int configure_edma(struct cssp_cam_dev *cam)
-+{
-+	struct platform_device *pdev = cam->pdev;
-+	int dma_channel;
-+
-+	dma_channel = ((struct cssp_cam_platform_data *)pdev->dev.platform_data)->dma_ch;
-+
-+	pdev->dev.dma_mask = &cam->dma_mask;
-+
-+	pdev->dev.coherent_dma_mask = (u32)~0;
-+
-+	if (dma_set_mask(&pdev->dev, (u32)~0)) {
-+		printk(KERN_ERR "[%s]: failed setting mask for DMA\n", pdev->name);
-+		return -1;
-+	}
-+
-+	cam->dma_ch = edma_alloc_channel(dma_channel, dma_callback, cam, EVENTQ_1);
-+	if (cam->dma_ch < 0) {
-+		printk(KERN_ERR "[%s]: allocating channel for DMA failed\n", pdev->name);
-+		return -EBUSY;
-+	} else {
-+		printk(KERN_ERR "[%s]: allocating channel for DMA succeeded, chan=%d\n", pdev->name, cam->dma_ch);
-+	}
-+
-+	cam->dma_tr_params.opt = TCINTEN | TCC(cam->dma_ch);
-+	cam->dma_tr_params.src = cam->reg_base_phys + REG_DATA;
-+	cam->dma_tr_params.a_b_cnt = ACNT(BYTES_PER_DMA_EVT) | BCNT((VGA_WIDTH * BYTES_PER_PIXEL) / BYTES_PER_DMA_EVT);
-+	cam->dma_tr_params.src_dst_bidx = SRCBIDX(0) | DSTBIDX(BYTES_PER_DMA_EVT);
-+	cam->dma_tr_params.link_bcntrld = BCNTRLD((VGA_WIDTH * BYTES_PER_PIXEL) / BYTES_PER_DMA_EVT) | LINK(0xffff);
-+	cam->dma_tr_params.src_dst_cidx = SRCCIDX(0) | DSTCIDX(BYTES_PER_DMA_EVT);
-+	cam->dma_tr_params.ccnt = CCNT(VGA_HEIGHT);
-+
-+	return 0;
-+}
-+
-+static int configure_cssp(struct cssp_cam_dev *cam)
-+{
-+	struct platform_device *pdev = cam->pdev;
-+	int ret = 0;
-+	unsigned int val;
-+	struct resource *res;
-+
-+	ret = reset_cssp(cam);
-+	if (ret)
-+		return ret;
-+
-+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "gpmc_phys_mem_slot");
-+	if (res == NULL) {
-+		printk(KERN_ERR "[%s]: failed to get gpmc_phys_mem_slot resource\n", pdev->name);
-+		return -ENODEV;
-+	}
-+
-+	/*
-+	 * Request the region.
-+	 */
-+	if (!request_mem_region(res->start, resource_size(res), pdev->name)) {
-+		return -EBUSY;
-+	}
-+
-+	cam->reg_base_phys = res->start;
-+	cam->reg_size = resource_size(res);
-+
-+	cam->reg_base_virt = (unsigned int)ioremap(cam->reg_base_phys, cam->reg_size);
-+	if (cam->reg_base_virt == 0) {
-+		printk(KERN_ERR "[%s]: ioremap of registers region failed\n", pdev->name);
-+		release_mem_region(cam->reg_base_phys, cam->reg_size);
-+		return -ENOMEM;
-+	}
-+
-+	printk(KERN_INFO "[%s]: reg_base_virt = 0x%x\n", pdev->name, cam->reg_base_virt);
-+
-+	val = readw(cam->reg_base_virt + REG_MODE);
-+	printk(KERN_INFO "[%s]: reading register address=0x0 returns 0x%x\n", pdev->name, val);
-+
-+	return 0;
-+}
-+
-+static int configure_camera_sensor(struct cssp_cam_dev *cam)
-+{
-+	struct i2c_board_info *info = cam->camera_board_info;
-+	struct i2c_client *client;
-+	struct i2c_adapter *adapter;
-+	struct v4l2_subdev *subdev;
-+	struct v4l2_mbus_framefmt f_format = {
-+			.width = VGA_WIDTH,
-+			.height = VGA_HEIGHT,
-+			.code = V4L2_MBUS_FMT_YUYV8_2X8,
-+			.colorspace = V4L2_COLORSPACE_JPEG,
-+	};
-+
-+	/* Enable the clock just for the time of loading the camera driver and disable after that */
-+	/* It is going to be be re-enabled later, when camera will be in use */
-+	clk_enable(cam->camera_clk);
-+	udelay(5); // let the clock stabilize
-+
-+	adapter	= i2c_get_adapter(((struct soc_camera_link *)(info->platform_data))->i2c_adapter_id);
-+	if (!adapter) {
-+		printk(KERN_INFO "[%s]: failed to get adapter...\n", __func__);
-+		return -ENODEV;
-+	}
-+
-+	client = i2c_new_device(adapter, info);
-+	i2c_put_adapter(adapter);
-+
-+	if (client == NULL) {
-+		return -ENODEV;
-+	}
-+
-+	printk(KERN_INFO "[%s]: client's name is: %s\n", __func__, client->name);
-+
-+	subdev = (struct v4l2_subdev *)i2c_get_clientdata(client);
-+	if (subdev == NULL) {
-+		i2c_unregister_device(client);
-+		return -ENODEV;
-+	}
-+
-+	cam->subdev = subdev;
-+
-+	v4l2_subdev_call(subdev, video, s_mbus_fmt, &f_format);
-+
-+	clk_disable(cam->camera_clk);
-+
-+	return 0;
-+}
-+
-+static int start_camera_sensor(struct cssp_cam_dev *cam)
-+{
-+	clk_enable(cam->camera_clk);
-+	udelay(5); /* let the clock stabilize */
-+
-+	v4l2_subdev_call(cam->subdev, video, s_stream, 1);
-+
-+	return 0;
-+}
-+
-+static void stop_camera_sensor(struct cssp_cam_dev *cam)
-+{
-+	v4l2_subdev_call(cam->subdev, video, s_stream, 0);
-+
-+	clk_disable(cam->camera_clk);
-+
-+	return;
-+}
-+
-+
-+/************************************************
-+ * 				Video4Linux2
-+ */
-+
-+static struct cssp_cam_fmt *get_format(struct v4l2_format *f)
-+{
-+	struct cssp_cam_fmt *fmt;
-+	unsigned int k;
-+
-+	for (k = 0; k < ARRAY_SIZE(formats); k++) {
-+		fmt = &formats[k];
-+		if (fmt->fourcc == f->fmt.pix.pixelformat)
-+			break;
-+	}
-+
-+	if (k == ARRAY_SIZE(formats))
-+		return NULL;
-+
-+	return &formats[k];
-+}
-+
-+
-+/* ------------------------------------------------------------------
-+	Videobuf operations
-+   ------------------------------------------------------------------*/
-+
-+static int queue_setup(struct vb2_queue *vq, const struct v4l2_format *fmt,
-+				unsigned int *nbuffers, unsigned int *nplanes,
-+				unsigned int sizes[], void *alloc_ctxs[])
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
-+	unsigned long size;
-+
-+	size = dev->sizeimage;
-+
-+	if (0 == *nbuffers)
-+		*nbuffers = 32;
-+
-+	while (size * *nbuffers > vid_limit * 1024 * 1024)
-+		(*nbuffers)--;
-+
-+	*nplanes = 1;
-+
-+	sizes[0] = size;
-+
-+	alloc_ctxs[0] = dev->dma_cont_ctx;
-+
-+	dprintk(dev, 1, "%s, count=%d, size=%ld\n", __func__, *nbuffers, size);
-+
-+	return 0;
-+}
-+
-+static int buffer_init(struct vb2_buffer *vb)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
-+
-+	BUG_ON(NULL == dev->fmt);
-+
-+	/*
-+	 * This callback is called once per buffer, after its allocation.
-+	 *
-+	 * Vivi does not allow changing format during streaming, but it is
-+	 * possible to do so when streaming is paused (i.e. in streamoff state).
-+	 * Buffers however are not freed when going into streamoff and so
-+	 * buffer size verification has to be done in buffer_prepare, on each
-+	 * qbuf.
-+	 * It would be best to move verification code here to buf_init and
-+	 * s_fmt though.
-+	 */
-+
-+	return 0;
-+}
-+
-+static int buffer_prepare(struct vb2_buffer *vb)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
-+	struct cssp_cam_buffer *buf = container_of(vb, struct cssp_cam_buffer, vb);
-+	unsigned long size;
-+
-+	dprintk(dev, 1, "%s, field=%d\n", __func__, vb->v4l2_buf.field);
-+
-+	BUG_ON(NULL == dev->fmt);
-+
-+	/*
-+	 * Theses properties only change when queue is idle, see s_fmt.
-+	 * The below checks should not be performed here, on each
-+	 * buffer_prepare (i.e. on each qbuf). Most of the code in this function
-+	 * should thus be moved to buffer_init and s_fmt.
-+	 */
-+	if (dev->width  < 48 || dev->width  > MAX_WIDTH ||
-+	    dev->height < 32 || dev->height > MAX_HEIGHT)
-+		return -EINVAL;
-+
-+	size = dev->sizeimage;
-+	if (vb2_plane_size(vb, 0) < size) {
-+		dprintk(dev, 1, "%s data will not fit into plane (%lu < %lu)\n",
-+				__func__, vb2_plane_size(vb, 0), size);
-+		return -EINVAL;
-+	}
-+
-+	vb2_set_plane_payload(&buf->vb, 0, size);
-+
-+	buf->fmt = dev->fmt;
-+
-+	return 0;
-+}
-+
-+static int buffer_finish(struct vb2_buffer *vb)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
-+	dprintk(dev, 1, "%s\n", __func__);
-+	return 0;
-+}
-+
-+static void buffer_cleanup(struct vb2_buffer *vb)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
-+	dprintk(dev, 1, "%s\n", __func__);
-+}
-+
-+static void buffer_queue(struct vb2_buffer *vb)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vb->vb2_queue);
-+	struct cssp_cam_buffer *buf = container_of(vb, struct cssp_cam_buffer, vb);
-+	struct cssp_cam_dmaqueue *vidq = &dev->vidq;
-+	unsigned long flags = 0;
-+
-+	dprintk(dev, 1, "%s\n", __func__);
-+
-+	if (dev->streaming_started && !dev->current_vb) {
-+		trigger_dma_transfer_to_buf(dev, &buf->vb);
-+	} else {
-+		spin_lock_irqsave(&dev->slock, flags);
-+		list_add_tail(&buf->list, &vidq->active);
-+		spin_unlock_irqrestore(&dev->slock, flags);
-+	}
-+}
-+
-+static int start_streaming(struct vb2_queue *vq, unsigned int count)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
-+	int ret;
-+
-+	dprintk(dev, 1, "%s\n", __func__);
-+
-+	ret = start_camera_sensor(dev);
-+	if (ret != 0)
-+		return ret;
-+
-+	// Enable DMA
-+	edma_start(dev->dma_ch);
-+
-+	dev->streaming_started = 1;
-+
-+	/* check if we have new buffer queued */
-+	dequeue_buffer_for_dma(dev);
-+
-+	return 0;
-+}
-+
-+/* abort streaming and wait for last buffer */
-+static int stop_streaming(struct vb2_queue *vq)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
-+	struct cssp_cam_dmaqueue *dma_q = &dev->vidq;
-+
-+	dprintk(dev, 1, "%s\n", __func__);
-+
-+	// Disable DMA
-+	edma_stop(dev->dma_ch);
-+
-+	// Disable data capture
-+	dev->mode &= ~ENABLE;
-+	writew(dev->mode, dev->reg_base_virt + REG_MODE);
-+	readw(dev->reg_base_virt + REG_MODE);
-+
-+	stop_camera_sensor(dev);
-+
-+	dev->streaming_started = 0;
-+
-+	/* Release all active buffers */
-+	while (!list_empty(&dma_q->active)) {
-+		struct cssp_cam_buffer *buf;
-+
-+		buf = list_entry(dma_q->active.next, struct cssp_cam_buffer, list);
-+		list_del(&buf->list);
-+		vb2_buffer_done(&buf->vb, VB2_BUF_STATE_ERROR);
-+		dprintk(dev, 2, "[%p/%d] done\n", buf, buf->vb.v4l2_buf.index);
-+	}
-+
-+	dev->current_vb = NULL;
-+
-+	return 0;
-+}
-+
-+static void cssp_cam_lock(struct vb2_queue *vq)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
-+	mutex_lock(&dev->mutex);
-+}
-+
-+static void cssp_cam_unlock(struct vb2_queue *vq)
-+{
-+	struct cssp_cam_dev *dev = vb2_get_drv_priv(vq);
-+	mutex_unlock(&dev->mutex);
-+}
-+
-+static struct vb2_ops cssp_cam_video_qops = {
-+	.queue_setup		= queue_setup,
-+	.buf_init		= buffer_init,
-+	.buf_prepare		= buffer_prepare,
-+	.buf_finish		= buffer_finish,
-+	.buf_cleanup		= buffer_cleanup,
-+	.buf_queue		= buffer_queue,
-+	.start_streaming	= start_streaming,
-+	.stop_streaming		= stop_streaming,
-+	.wait_prepare		= cssp_cam_unlock,
-+	.wait_finish		= cssp_cam_lock,
-+};
-+
-+
-+/* ------------------------------------------------------------------
-+	IOCTL vidioc handling
-+   ------------------------------------------------------------------*/
-+
-+static int vidioc_querycap(struct file *file, void *priv,
-+					struct v4l2_capability *cap)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+
-+	strcpy(cap->driver, "cssp_camera");
-+	strcpy(cap->card, "cssp_camera");
-+	strlcpy(cap->bus_info, dev->v4l2_dev.name, sizeof(cap->bus_info));
-+	cap->capabilities = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
-+			    V4L2_CAP_READWRITE;
-+	return 0;
-+}
-+
-+static int vidioc_enum_fmt_vid_cap(struct file *file, void *priv,
-+					struct v4l2_fmtdesc *f)
-+{
-+	struct cssp_cam_fmt *fmt;
-+
-+	if (f->index >= ARRAY_SIZE(formats))
-+		return -EINVAL;
-+
-+	fmt = &formats[f->index];
-+
-+	strlcpy(f->description, fmt->name, sizeof(f->description));
-+	f->pixelformat = fmt->fourcc;
-+	return 0;
-+}
-+
-+static int vidioc_g_fmt_vid_cap(struct file *file, void *priv,
-+					struct v4l2_format *f)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+
-+	f->fmt.pix.width	= dev->width;
-+	f->fmt.pix.height	= dev->height;
-+	f->fmt.pix.field	= dev->field;
-+	f->fmt.pix.pixelformat	= dev->fmt->fourcc;
-+	f->fmt.pix.bytesperline	= dev->bytesperline;
-+	f->fmt.pix.sizeimage	= dev->sizeimage;
-+	f->fmt.pix.colorspace	= dev->colorspace;
-+
-+	return 0;
-+}
-+
-+static int vidioc_try_fmt_vid_cap(struct file *file, void *priv,
-+			struct v4l2_format *f)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	struct cssp_cam_fmt *fmt;
-+	struct v4l2_mbus_framefmt mbus_fmt;
-+	struct v4l2_pix_format *pix = &f->fmt.pix;
-+
-+	fmt = get_format(f);
-+	if (!fmt) {
-+		dprintk(dev, 1, "Fourcc format (0x%08x) invalid.\n",
-+			f->fmt.pix.pixelformat);
-+		return -EINVAL;
-+	}
-+
-+	v4l2_fill_mbus_format(&mbus_fmt, pix, fmt->code);
-+	v4l2_subdev_call(dev->subdev, video, try_mbus_fmt, &mbus_fmt);
-+	v4l2_fill_pix_format(pix, &mbus_fmt);
-+	pix->bytesperline = (pix->width * fmt->depth) >> 3;
-+	pix->sizeimage = pix->height * pix->bytesperline;
-+
-+	return 0;
-+}
-+
-+static int vidioc_s_fmt_vid_cap(struct file *file, void *priv,
-+					struct v4l2_format *f)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	struct vb2_queue *q = &dev->vb_vidq;
-+	struct v4l2_pix_format *pix = &f->fmt.pix;
-+	struct v4l2_mbus_framefmt mbus_fmt;
-+
-+	int ret = vidioc_try_fmt_vid_cap(file, priv, f);
-+	if (ret < 0)
-+		return ret;
-+
-+	if (vb2_is_streaming(q)) {
-+		dprintk(dev, 1, "%s device busy\n", __func__);
-+		return -EBUSY;
-+	}
-+
-+	dev->fmt = get_format(f);
-+	dev->width = f->fmt.pix.width;
-+	dev->height = f->fmt.pix.height;
-+	dev->field = f->fmt.pix.field;
-+	dev->colorspace = f->fmt.pix.colorspace;
-+	dev->bytesperline = f->fmt.pix.bytesperline;
-+	dev->sizeimage = f->fmt.pix.sizeimage;
-+
-+	/* Set the sensor into the new format */
-+	v4l2_fill_mbus_format(&mbus_fmt, pix, dev->fmt->code);
-+	v4l2_subdev_call(dev->subdev, video, s_mbus_fmt, &mbus_fmt);
-+
-+	/* Set the EDMA for the new resolution */
-+	dev->dma_tr_params.a_b_cnt = ACNT(BYTES_PER_DMA_EVT) | BCNT(dev->bytesperline / BYTES_PER_DMA_EVT);
-+	dev->dma_tr_params.link_bcntrld = BCNTRLD(dev->bytesperline / BYTES_PER_DMA_EVT) | LINK(0xffff);
-+	dev->dma_tr_params.ccnt = CCNT(dev->height);
-+
-+	return 0;
-+}
-+
-+static int vidioc_reqbufs(struct file *file, void *priv,
-+			  struct v4l2_requestbuffers *p)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	return vb2_reqbufs(&dev->vb_vidq, p);
-+}
-+
-+static int vidioc_querybuf(struct file *file, void *priv, struct v4l2_buffer *p)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	return vb2_querybuf(&dev->vb_vidq, p);
-+}
-+
-+static int vidioc_qbuf(struct file *file, void *priv, struct v4l2_buffer *p)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	return vb2_qbuf(&dev->vb_vidq, p);
-+}
-+
-+static int vidioc_dqbuf(struct file *file, void *priv, struct v4l2_buffer *p)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	return vb2_dqbuf(&dev->vb_vidq, p, file->f_flags & O_NONBLOCK);
-+}
-+
-+static int vidioc_streamon(struct file *file, void *priv, enum v4l2_buf_type i)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	return vb2_streamon(&dev->vb_vidq, i);
-+}
-+
-+static int vidioc_streamoff(struct file *file, void *priv, enum v4l2_buf_type i)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	return vb2_streamoff(&dev->vb_vidq, i);
-+}
-+
-+static int vidioc_log_status(struct file *file, void *priv)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+
-+	v4l2_ctrl_handler_log_status(&dev->ctrl_handler, dev->v4l2_dev.name);
-+	return 0;
-+}
-+
-+static int vidioc_s_std(struct file *file, void *priv, v4l2_std_id *i)
-+{
-+	return 0;
-+}
-+
-+/* only one input in this sample driver */
-+static int vidioc_enum_input(struct file *file, void *priv,
-+				struct v4l2_input *inp)
-+{
-+	return -EINVAL;
-+
-+	inp->type = V4L2_INPUT_TYPE_CAMERA;
-+	inp->std = V4L2_STD_525_60;
-+	sprintf(inp->name, "Camera %u", inp->index);
-+	return 0;
-+}
-+
-+static int vidioc_g_input(struct file *file, void *priv, unsigned int *i)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+
-+	*i = dev->input;
-+
-+	return 0;
-+}
-+
-+static int vidioc_s_input(struct file *file, void *priv, unsigned int i)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+
-+	return -EINVAL;
-+
-+	if (i == dev->input)
-+		return 0;
-+
-+	dev->input = i;
-+
-+	return 0;
-+}
-+
-+static int vidioc_subscribe_event(struct v4l2_fh *fh,
-+				struct v4l2_event_subscription *sub)
-+{
-+	switch (sub->type) {
-+	case V4L2_EVENT_CTRL:
-+		return v4l2_event_subscribe(fh, sub, 0);
-+	default:
-+		return -EINVAL;
-+	}
-+}
-+
-+static const struct v4l2_ioctl_ops cssp_cam_ioctl_ops = {
-+	.vidioc_querycap		= vidioc_querycap,
-+	.vidioc_enum_fmt_vid_cap	= vidioc_enum_fmt_vid_cap,
-+	.vidioc_g_fmt_vid_cap		= vidioc_g_fmt_vid_cap,
-+	.vidioc_try_fmt_vid_cap		= vidioc_try_fmt_vid_cap,
-+	.vidioc_s_fmt_vid_cap		= vidioc_s_fmt_vid_cap,
-+	.vidioc_reqbufs			= vidioc_reqbufs,
-+	.vidioc_querybuf		= vidioc_querybuf,
-+	.vidioc_qbuf			= vidioc_qbuf,
-+	.vidioc_dqbuf			= vidioc_dqbuf,
-+	.vidioc_s_std			= vidioc_s_std,
-+	.vidioc_enum_input		= vidioc_enum_input,
-+	.vidioc_g_input			= vidioc_g_input,
-+	.vidioc_s_input			= vidioc_s_input,
-+	.vidioc_streamon		= vidioc_streamon,
-+	.vidioc_streamoff		= vidioc_streamoff,
-+	.vidioc_log_status		= vidioc_log_status,
-+	.vidioc_subscribe_event		= vidioc_subscribe_event,
-+	.vidioc_unsubscribe_event	= v4l2_event_unsubscribe,
-+};
-+
-+
-+/* ------------------------------------------------------------------
-+	File operations
-+   ------------------------------------------------------------------*/
-+
-+static unsigned int video_poll(struct file *file, struct poll_table_struct *wait)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	struct v4l2_fh *fh = file->private_data;
-+	struct vb2_queue *q = &dev->vb_vidq;
-+	unsigned int res;
-+
-+	dprintk(dev, 1, "%s\n", __func__);
-+	res = vb2_poll(q, file, wait);
-+	if (v4l2_event_pending(fh))
-+		res |= POLLPRI;
-+	else
-+		poll_wait(file, &fh->wait, wait);
-+	return res;
-+}
-+
-+static int video_mmap(struct file *file, struct vm_area_struct *vma)
-+{
-+	struct cssp_cam_dev *dev = video_drvdata(file);
-+	int ret;
-+
-+	dprintk(dev, 1, "mmap called, vma=0x%08lx\n", (unsigned long)vma);
-+
-+	ret = vb2_mmap(&dev->vb_vidq, vma);
-+	dprintk(dev, 1, "vma start=0x%08lx, size=%ld, ret=%d\n",
-+		(unsigned long)vma->vm_start,
-+		(unsigned long)vma->vm_end - (unsigned long)vma->vm_start,
-+		ret);
-+	return ret;
-+}
-+
-+static ssize_t video_read(struct file *file, char __user *buf, size_t size, loff_t *offset)
-+{
-+	struct cssp_cam_dev *cam_dev = video_drvdata(file);
-+
-+	dprintk(cam_dev, 1, "read called\n");
-+	return vb2_read(&cam_dev->vb_vidq, buf, size, offset, file->f_flags & O_NONBLOCK);
-+}
-+
-+static int video_close(struct file *file)
-+{
-+	struct video_device *vdev = video_devdata(file);
-+	struct cssp_cam_dev *cam_dev = video_drvdata(file);
-+
-+	dprintk(cam_dev, 1, "close called (dev=%s), file %p\n",
-+		video_device_node_name(vdev), file);
-+
-+	if (v4l2_fh_is_singular_file(file))
-+		vb2_queue_release(&cam_dev->vb_vidq);
-+	return v4l2_fh_release(file);
-+}
-+
-+static const struct v4l2_file_operations cssp_cam_fops = {
-+	.owner		= THIS_MODULE,
-+	.open		= v4l2_fh_open,
-+	.release	= video_close,
-+	.read		= video_read,
-+	.poll		= video_poll,
-+	.unlocked_ioctl	= video_ioctl2,
-+	.mmap		= video_mmap,
-+};
-+
-+
-+/* ------------------------------------------------------------------
-+	Driver initialization
-+   ------------------------------------------------------------------*/
-+
-+static struct video_device cssp_cam_template = {
-+	.name		= "cssp_camera",
-+	.fops		= &cssp_cam_fops,
-+	.ioctl_ops	= &cssp_cam_ioctl_ops,
-+	.minor		= -1,
-+	.release	= video_device_release,
-+	.tvnorms	= V4L2_STD_525_60,
-+	.current_norm	= V4L2_STD_NTSC_M,
-+};
-+
-+static int __init  video_probe(struct cssp_cam_dev *cam_dev)
-+{
-+	struct video_device *vfd;
-+	struct v4l2_ctrl_handler *hdl;
-+	struct vb2_queue *q;
-+	int ret = 0;
-+
-+	snprintf(cam_dev->v4l2_dev.name, sizeof(cam_dev->v4l2_dev.name),
-+			"%s-%03d", "cssp_camera", 0);
-+	ret = v4l2_device_register(NULL, &cam_dev->v4l2_dev);
-+	if (ret)
-+		goto free_dev;
-+
-+	cam_dev->fmt = &formats[0];
-+	cam_dev->width = VGA_WIDTH;
-+	cam_dev->height = VGA_HEIGHT;
-+	cam_dev->sizeimage = VGA_WIDTH * VGA_HEIGHT * BYTES_PER_PIXEL;
-+	hdl = &cam_dev->ctrl_handler;
-+	v4l2_ctrl_handler_init(hdl, 0);
-+
-+	if (hdl->error) {
-+		ret = hdl->error;
-+		goto unreg_dev;
-+	}
-+	cam_dev->v4l2_dev.ctrl_handler = hdl;
-+
-+	/* initialize locks */
-+	spin_lock_init(&cam_dev->slock);
-+
-+	/* initialize queue */
-+	q = &cam_dev->vb_vidq;
-+	memset(q, 0, sizeof(cam_dev->vb_vidq));
-+	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-+	q->io_modes = VB2_MMAP | VB2_USERPTR | VB2_READ;
-+	q->drv_priv = cam_dev;
-+	q->buf_struct_size = sizeof(struct cssp_cam_buffer);
-+	q->ops = &cssp_cam_video_qops;
-+	q->mem_ops = &vb2_dma_contig_memops;
-+
-+	vb2_queue_init(q);
-+
-+	mutex_init(&cam_dev->mutex);
-+
-+	/* init video dma queues */
-+	INIT_LIST_HEAD(&cam_dev->vidq.active);
-+
-+	ret = -ENOMEM;
-+	vfd = video_device_alloc();
-+	if (!vfd)
-+		goto unreg_dev;
-+
-+	*vfd = cssp_cam_template;
-+	vfd->debug = debug;
-+	vfd->v4l2_dev = &cam_dev->v4l2_dev;
-+	set_bit(V4L2_FL_USE_FH_PRIO, &vfd->flags);
-+
-+	/*
-+	 * Provide a mutex to v4l2 core. It will be used to protect
-+	 * all fops and v4l2 ioctls.
-+	 */
-+	vfd->lock = &cam_dev->mutex;
-+
-+	ret = video_register_device(vfd, VFL_TYPE_GRABBER, video_nr);
-+	if (ret < 0)
-+		goto rel_vdev;
-+
-+	video_set_drvdata(vfd, cam_dev);
-+
-+	if (video_nr != -1)
-+		video_nr++;
-+
-+	cam_dev->vdev = vfd;
-+	v4l2_info(&cam_dev->v4l2_dev, "V4L2 device registered as %s\n",
-+	video_device_node_name(vfd));
-+
-+	return 0;
-+
-+rel_vdev:
-+	video_device_release(vfd);
-+unreg_dev:
-+	v4l2_ctrl_handler_free(hdl);
-+	v4l2_device_unregister(&cam_dev->v4l2_dev);
-+free_dev:
-+	return ret;
-+}
-+
-+static int video_remove(struct cssp_cam_dev *cam_dev)
-+{
-+	if (cam_dev->dma_cont_ctx != NULL)
-+		vb2_dma_contig_cleanup_ctx(cam_dev->dma_cont_ctx);
-+
-+	v4l2_info(&cam_dev->v4l2_dev, "unregistering %s\n",
-+			video_device_node_name(cam_dev->vdev));
-+	video_unregister_device(cam_dev->vdev);
-+	v4l2_device_unregister(&cam_dev->v4l2_dev);
-+	v4l2_ctrl_handler_free(&cam_dev->ctrl_handler);
-+
-+	return 0;
-+}
-+
-+static int __init  cssp_cam_probe(struct platform_device *pdev)
-+{
-+	struct cssp_cam_dev *cam_dev;
-+	int ret = 0;
-+	struct cssp_cam_platform_data *cssp_cam_platform_data;
-+
-+	cssp_cam_platform_data = (struct cssp_cam_platform_data *) pdev->dev.platform_data;
-+	if (cssp_cam_platform_data == NULL) {
-+		printk(KERN_ERR "[%s]: missing platform data\n", pdev->name);
-+		return -ENODEV;
-+	}
-+
-+	if (cssp_cam_platform_data->cam_i2c_board_info == NULL) {
-+		printk(KERN_ERR "[%s]: missing camera i2c board info\n", pdev->name);
-+		return -ENODEV;
-+	}
-+
-+	cam_dev = kzalloc(sizeof(*cam_dev), GFP_KERNEL);
-+	if (!cam_dev)
-+		return -ENOMEM;
-+
-+	cam_dev->pdev = pdev;
-+	platform_set_drvdata(pdev, cam_dev);
-+
-+	cam_dev->camera_board_info = cssp_cam_platform_data->cam_i2c_board_info;
-+
-+	cam_dev->camera_clk = clk_get(&pdev->dev, cssp_cam_platform_data->cam_clk_name);
-+	if (IS_ERR(cam_dev->camera_clk)) {
-+		ret = PTR_ERR(cam_dev->camera_clk);
-+		printk(KERN_ERR "[%s]: cannot clk_get %s\n", pdev->name, cssp_cam_platform_data->cam_clk_name);
-+		goto fail0;
-+	}
-+
-+	ret = configure_cssp(cam_dev);
-+	if (ret)
-+		goto fail1;
-+
-+	ret = configure_edma(cam_dev);
-+	if (ret)
-+		goto fail2;
-+
-+	cam_dev->mode = FMT_2X8_EN | PCLK_POL | HS_EN;
-+
-+	ret = configure_camera_sensor(cam_dev);
-+	if (ret) {
-+		printk(KERN_ERR "[%s]: camera sensor configuration failed\n", pdev->name);
-+		goto fail3;
-+	}
-+
-+	cam_dev->dma_cont_ctx = vb2_dma_contig_init_ctx(&pdev->dev);
-+	if (IS_ERR(cam_dev->dma_cont_ctx)) {
-+		ret = PTR_ERR(cam_dev->dma_cont_ctx);
-+		goto fail3;
-+	}
-+
-+	ret = video_probe(cam_dev);
-+	if (ret)
-+		goto fail4;
-+
-+	return ret;
-+
-+fail4:
-+	vb2_dma_contig_cleanup_ctx(cam_dev->dma_cont_ctx);
-+
-+fail3:
-+	edma_free_channel(cam_dev->dma_ch);
-+
-+fail2:
-+	gpio_free(cam_dev->reset_pin);
-+	iounmap((void *)cam_dev->reg_base_virt);
-+	release_mem_region(cam_dev->reg_base_phys, cam_dev->reg_size);
-+
-+fail1:
-+	clk_put(cam_dev->camera_clk);
-+
-+fail0:
-+	kfree(cam_dev);
-+
-+	return ret;
-+}
-+
-+static int cssp_cam_remove(struct platform_device *pdev)
-+{
-+	struct cssp_cam_dev *cam = platform_get_drvdata(pdev);
-+
-+	iounmap((void *)cam->reg_base_virt);
-+
-+	release_mem_region(cam->reg_base_phys, cam->reg_size);
-+
-+	gpio_free(cam->reset_pin);
-+
-+	edma_free_channel(cam->dma_ch);
-+
-+	video_remove(cam);
-+
-+	clk_put(cam->camera_clk);
-+
-+	kfree(cam);
-+
-+	printk(KERN_INFO "[%s]: removed\n", pdev->name);
-+
-+	return 0;
-+}
-+
-+
-+static struct platform_driver cssp_cam_driver = {
-+	.probe		= cssp_cam_probe,
-+	.remove		= __devexit_p(cssp_cam_remove),
-+	.driver		= {
-+		.name	= "cssp-camera",
-+		.owner	= THIS_MODULE,
-+	},
-+};
-+
-+
-+static int __init cssp_cam_init(void)
-+{
-+	return platform_driver_register(&cssp_cam_driver);
-+}
-+
-+static void __exit cssp_cam_exit(void)
-+{
-+	platform_driver_unregister(&cssp_cam_driver);
-+}
-+
-+
-+module_init(cssp_cam_init);
-+module_exit(cssp_cam_exit);
-+
-+/*
-+ * Macros sets license, author and description
-+ */
-+MODULE_LICENSE("GPLv2");
-+MODULE_AUTHOR("Dan Aizenstros, Damian Eppel, Przemek Szewczyk");
-+MODULE_DESCRIPTION("QuickLogic Camera Interface driver");
-+
-diff --git a/drivers/media/video/cssp_camera/cssp_camera.h b/drivers/media/video/cssp_camera/cssp_camera.h
-new file mode 100644
-index 0000000..d018ca1
---- /dev/null
-+++ b/drivers/media/video/cssp_camera/cssp_camera.h
-@@ -0,0 +1,148 @@
-+/*
-+ * cssp-camera driver
-+ *
-+ * Based on Vivi driver
-+ *
-+ * Copyright (C) 2012 QuickLogic Corp.
-+ *
-+ * Developed for QuickLogic by:
-+ * Damian Eppel <damian.eppel@teleca.com>
-+ * Przemek Szewczyk <przemek.szewczyk@teleca.com>
-+ * Dan Aizenstros <daizenstros@quicklogic.com>
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License version 2 as
-+ * published by the Free Software Foundation.
-+ *
-+ */
-+
-+#ifndef CSSP_CAMERA_H
-+#define CSSP_CAMERA_H
-+
-+
-+static unsigned video_nr = -1;
-+module_param(video_nr, uint, 0644);
-+MODULE_PARM_DESC(video_nr, "videoX start number, -1 is autodetect");
-+
-+static unsigned debug;
-+module_param(debug, uint, 0644);
-+MODULE_PARM_DESC(debug, "activates debug info");
-+
-+static unsigned int vid_limit = 1;
-+module_param(vid_limit, uint, 0644);
-+MODULE_PARM_DESC(vid_limit, "capture memory limit in megabytes");
-+
-+#define dprintk(dev, level, fmt, arg...) \
-+	v4l2_dbg(level, debug, &dev->v4l2_dev, fmt, ## arg)
-+
-+#define VGA_WIDTH 640
-+#define VGA_HEIGHT 480
-+
-+#define MAX_WIDTH 2048
-+#define MAX_HEIGHT 1536
-+
-+#define VGA_RES (VGA_WIDTH * VGA_HEIGHT)
-+#define BYTES_PER_PIXEL 2
-+#define BYTES_PER_DMA_EVT 32
-+
-+/* PaRAM.opt: */
-+#define TCC(v) (((v) & 0x3f) << 12)
-+/* PaRAM.a_b_cnt: */
-+#define ACNT(v) ((v) & 0xffff)
-+#define BCNT(v) (((v) & 0xffff) << 16)
-+/* PaRAM.src_dst_bidx: */
-+#define SRCBIDX(v) ((v) & 0xffff)
-+#define DSTBIDX(v) (((v) & 0xffff) << 16)
-+/* PaRAM.link_bcntrld: */
-+#define LINK(v) ((v) & 0xffff)
-+#define BCNTRLD(v) (((v) & 0xffff) << 16)
-+/* PaRAM.src_dst_cidx: */
-+#define SRCCIDX(v) ((v) & 0xffff)
-+#define DSTCIDX(v) (((v) & 0xffff) << 16)
-+/* PaRAM.ccnt: */
-+#define CCNT(v) ((v) & 0xffff)
-+
-+
-+struct cssp_cam_platform_data {
-+	struct i2c_board_info *cam_i2c_board_info;
-+	const char *cam_clk_name;
-+	int dma_ch;
-+	int gpio_reset_pin;
-+};
-+
-+
-+/* ------------------------------------------------------------------
-+	video Basic structures
-+   ------------------------------------------------------------------*/
-+
-+struct cssp_cam_fmt {
-+	char	*name;
-+	u32	fourcc;          /* v4l2 format id */
-+	int	depth;
-+	enum v4l2_mbus_pixelcode code;
-+};
-+
-+/* buffer for one video frame */
-+struct cssp_cam_buffer {
-+	/* common v4l buffer stuff -- must be first */
-+	struct vb2_buffer	vb;
-+	struct list_head	list;
-+	struct cssp_cam_fmt	*fmt;
-+};
-+
-+struct cssp_cam_dmaqueue {
-+	struct list_head	active;
-+};
-+
-+struct cssp_cam_dev {
-+	struct v4l2_device		v4l2_dev;
-+	struct v4l2_ctrl_handler	ctrl_handler;
-+	struct v4l2_subdev		*subdev;
-+
-+	spinlock_t			slock;
-+	struct mutex			mutex;
-+
-+	/* various device info */
-+	struct video_device		*vdev;
-+	struct platform_device		*pdev;
-+
-+	struct cssp_cam_dmaqueue	vidq;
-+	void				*dma_cont_ctx;
-+	int				streaming_started;
-+	struct vb2_buffer		*current_vb;
-+
-+	/* Input Number */
-+	int				input;
-+
-+	/* video capture */
-+	struct cssp_cam_fmt		*fmt;
-+	u32				width;
-+	u32				height;
-+	u32				bytesperline;
-+	u32				sizeimage;
-+	enum v4l2_colorspace		colorspace;
-+	struct vb2_queue		vb_vidq;
-+	enum v4l2_field			field;
-+	unsigned int			field_count;
-+
-+
-+	/* Camera Sensor */
-+	struct i2c_board_info		*camera_board_info;
-+	struct clk			*camera_clk;
-+
-+	unsigned int			reg_base_virt;
-+	unsigned int			reg_base_phys;
-+	resource_size_t			reg_size;
-+	u16				mode;
-+
-+	struct edmacc_param		dma_tr_params;
-+	int				dma_ch;
-+	u64				dma_mask;
-+
-+	int				frame_cnt;
-+
-+	int				reset_pin;
-+};
-+
-+
-+#endif /* CSSP_CAMERA_H */
--- 
-1.7.10
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
deleted file mode 100644
index 60d5be0..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From d87e8e9379764451de06b3f6d13d19424836f64c Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 3 Jul 2012 08:45:47 +0200
-Subject: [PATCH] beaglebone: add support for DVI+audio and audio-only capes
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/board-am335xevm.c |   32 ++++++++++++++++++++++++++++++--
- 1 file changed, 30 insertions(+), 2 deletions(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 1680612..4b3f7d2 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2906,8 +2906,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 		
- 		beaglebone_leds_free = 0;
- 		dvileds_init(0,0);
--		beaglebone_spi1_free = 0;
--		mcasp0_init(0,0);
-+
-+		// Uncomment these for custom DVI capes with audio populated
-+		//beaglebone_spi1_free = 0;
-+		//mcasp0_init(0,0);
- 	
- 		if (!strncmp("00A1", cape_config.version, 4) || !strncmp("000A", cape_config.version, 4)) {
- 			pr_info("BeagleBone cape: DVI init for revision A1 or older\n");
-@@ -2923,6 +2925,32 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 			dvi_init(0,0);
- 		}
- 	}
-+
-+	if (!strncmp("BB-BONE-DVID-02", cape_config.partnumber, 15)) {
-+		pr_info("BeagleBone cape: initializing DVI+audio cape\n");
-+
-+		beaglebone_leds_free = 0;
-+		dvileds_init(0,0);
-+
-+		beaglebone_spi1_free = 0;
-+		mcasp0_init(0,0);
-+	
-+		setup_pin_mux(dvia2_pin_mux);
-+		gpio_request(BEAGLEBONEDVI_PDn_A2, "DVI_PDn");
-+		gpio_direction_output(BEAGLEBONEDVI_PDn_A2, 1);
-+		dvi_init(0,0);
-+	}
-+
-+	if (!strncmp("BB-BONE-AUDI-01", cape_config.partnumber, 15)) {
-+		pr_info("BeagleBone cape: initializing audio cape\n");
-+
-+		beaglebone_leds_free = 0;
-+		dvileds_init(0,0);
-+
-+		beaglebone_spi1_free = 0;
-+		mcasp0_init(0,0);
-+	}
-+
- 	if (!strncmp("BB-BONE-LCD7-01", cape_config.partnumber, 15)) {
- 		pr_info("BeagleBone cape: initializing LCD cape\n");
- 
--- 
-1.7.10
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-disable-LBO-GPIO-for-battery-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
new file mode 100644
index 0000000..02485c3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0074-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
@@ -0,0 +1,35 @@
+From f723bdf574163ced9a685783a475b254f6a981d5 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Tue, 3 Jul 2012 21:28:44 +0200
+Subject: [PATCH 74/79] beaglebone: disable LBO GPIO for battery cape
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index bf40ac9..6b4539e 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -2999,7 +2999,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		pr_info("BeagleBone cape: initializing battery cape\n");
+ 		// gpio1_6, P9_15 lowbat output
+ 		// AIN4, P9_33 vbat
+-		setup_pin_mux(batterycape_pin_mux);
++		/* LBO doesn't work, so disable it for now
++ 		setup_pin_mux(batterycape_pin_mux);
+ 		#if defined(CONFIG_CHARGER_GPIO)
+ 			int err;
+ 			err = platform_device_register(&beaglebone_charger_device);
+@@ -3007,6 +3008,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 				pr_err("failed to register BeagleBone battery cape gpio\n");
+ 		
+ 		#endif
++		*/
+ 	}
+ 	
+ 	if (!strncmp("BB-BONE-SERL-01", cape_config.partnumber, 15)) {
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
deleted file mode 100644
index 641db75..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 9332627ac6b70511742208d6fa7c7042c203f852 Mon Sep 17 00:00:00 2001
-From: Koen Kooi <koen@dominion.thruhere.net>
-Date: Tue, 3 Jul 2012 21:28:44 +0200
-Subject: [PATCH 75/75] beaglebone: disable LBO GPIO for battery cape
-
-Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
----
- arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index af75c88..7d6ac77 100644
---- a/arch/arm/mach-omap2/board-am335xevm.c
-+++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2999,7 +2999,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 		pr_info("BeagleBone cape: initializing battery cape\n");
- 		// gpio1_6, P9_15 lowbat output
- 		// AIN4, P9_33 vbat
--		setup_pin_mux(batterycape_pin_mux);
-+		/* LBO doesn't work, so disable it for now
-+ 		setup_pin_mux(batterycape_pin_mux);
- 		#if defined(CONFIG_CHARGER_GPIO)
- 			int err;
- 			err = platform_device_register(&beaglebone_charger_device);
-@@ -3007,6 +3008,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
- 				pr_err("failed to register BeagleBone battery cape gpio\n");
- 		
- 		#endif
-+		*/
- 	}
- 	
- 	if (!strncmp("BB-BONE-SERL-01", cape_config.partnumber, 15)) {
--- 
-1.7.10
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0080-vfs-Add-a-trace-point-in-the-mark_inode_dirty-functi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0080-vfs-Add-a-trace-point-in-the-mark_inode_dirty-functi.patch
new file mode 100644
index 0000000..f45178c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0080-vfs-Add-a-trace-point-in-the-mark_inode_dirty-functi.patch
@@ -0,0 +1,103 @@
+From a0a3563affbbebd9c7385586e1d6031de82c2a83 Mon Sep 17 00:00:00 2001
+From: Arjan van de Ven <arjan at linux.intel.com>
+Date: Fri, 26 Nov 2010 12:18:03 -0800
+Subject: [PATCH] vfs: Add a trace point in the mark_inode_dirty function
+
+PowerTOP would like to be able to show who is keeping the disk
+busy by dirtying data. The most logical spot for this is in the vfs
+in the mark_inode_dirty() function, doing this on the block level
+is not possible because by the time the IO hits the block layer the
+guilty party can no longer be found ("kjournald" and "pdflush" are not
+useful answers to "who caused this file to be dirty).
+
+The trace point follows the same logic/style as the block_dump code
+and pretty much dumps the same data, just not to dmesg (and thus to
+/var/log/messages) but via the trace events streams.
+
+Eventually we should be able to phase out the block dump code, but that's
+for later on after a transition time.
+---
+ fs/fs-writeback.c                |    3 +++
+ include/linux/fs.h               |   12 ++++++++++++
+ include/trace/events/writeback.h |   28 ++++++++++++++++++++++++++++
+ 3 files changed, 43 insertions(+)
+
+diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
+index 54f5786..981ec8c 100644
+--- a/fs/fs-writeback.c
++++ b/fs/fs-writeback.c
+@@ -1072,6 +1072,9 @@ void __mark_inode_dirty(struct inode *inode, int flags)
+ 	if ((inode->i_state & flags) == flags)
+ 		return;
+ 
++	if (flags & (I_DIRTY_SYNC | I_DIRTY_DATASYNC | I_DIRTY_PAGES))
++		trace_writeback_inode_dirty(inode, flags);
++
+ 	if (unlikely(block_dump))
+ 		block_dump___mark_inode_dirty(inode);
+ 
+diff --git a/include/linux/fs.h b/include/linux/fs.h
+index 43d36b7..a3e46ee 100644
+--- a/include/linux/fs.h
++++ b/include/linux/fs.h
+@@ -1759,6 +1759,18 @@ struct super_operations {
+ 
+ #define I_DIRTY (I_DIRTY_SYNC | I_DIRTY_DATASYNC | I_DIRTY_PAGES)
+ 
++#define INODE_DIRTY_FLAGS \
++	{ I_DIRTY_SYNC,		"DIRTY-SYNC" }, \
++	{ I_DIRTY_DATASYNC,	"DIRTY-DATASYNC" }, \
++	{ I_DIRTY_PAGES,	"DIRTY-PAGES" }, \
++	{ I_NEW,		"NEW" }, \
++	{ I_WILL_FREE,		"WILL-FREE" }, \
++	{ I_FREEING,		"FREEING" }, \
++	{ I_CLEAR,		"CLEAR" }, \
++	{ I_SYNC,		"SYNC" }, \
++	{ I_REFERENCED,		"REFERENCED" }
++
++
+ extern void __mark_inode_dirty(struct inode *, int);
+ static inline void mark_inode_dirty(struct inode *inode)
+ {
+diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
+index 1f48f14..8053e75 100644
+--- a/include/trace/events/writeback.h
++++ b/include/trace/events/writeback.h
+@@ -400,6 +400,34 @@ DEFINE_EVENT(writeback_congest_waited_template, writeback_wait_iff_congested,
+ 	TP_ARGS(usec_timeout, usec_delayed)
+ );
+ 
++/*
++ * Tracepoint for dirtying an inode; used by PowerTOP
++ */
++TRACE_EVENT(writeback_inode_dirty,
++
++	TP_PROTO(struct inode *inode, int flags),
++
++	TP_ARGS(inode, flags),
++
++	TP_STRUCT__entry(
++		__field(	__kernel_dev_t,	dev		)
++		__field(	ino_t,		ino		)
++		__field(	u32,		flags		)
++	),
++
++	TP_fast_assign(
++		__entry->dev	= inode->i_sb->s_dev;
++		__entry->ino	= inode->i_ino;
++		__entry->flags  = flags;
++	),
++
++	TP_printk("dev %d:%d ino %lu flags %d %s", MAJOR(__entry->dev), MINOR(__entry->dev),
++		  (unsigned long) __entry->ino,
++		  __entry->flags,
++		  __print_flags(__entry->flags, "|", INODE_DIRTY_FLAGS)
++	)
++);
++
+ DECLARE_EVENT_CLASS(writeback_single_inode_template,
+ 
+ 	TP_PROTO(struct inode *inode,
+-- 
+1.7.10
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index eab3127..c137e13 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 # the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
-PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.21", d)}"
+PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.23", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
@@ -1445,6 +1445,101 @@ PATCHES_OVER_PSP = " \
 	file://3.2.21/0065-swap-fix-shmem-swapping-when-more-than-8-areas.patch \
 	file://3.2.21/0066-drm-radeon-add-some-additional-6xx-7xx-EG-register-i.patch \
 	file://3.2.21/0067-Linux-3.2.21.patch \
+	file://3.2.22/0001-staging-iio-ad7606-Re-add-missing-scale-attribute.patch \
+	file://3.2.22/0002-Tools-hv-verify-origin-of-netlink-connector-message.patch \
+	file://3.2.22/0003-edac-avoid-mce-decoding-crash-after-edac-driver-unlo.patch \
+	file://3.2.22/0004-hwrng-atmel-rng-fix-data-valid-check.patch \
+	file://3.2.22/0005-staging-r8712u-Add-new-USB-IDs.patch \
+	file://3.2.22/0006-hwmon-applesmc-Limit-key-length-in-warning-messages.patch \
+	file://3.2.22/0007-mm-pmd_read_atomic-fix-32bit-PAE-pmd-walk-vs-pmd_pop.patch \
+	file://3.2.22/0008-thp-avoid-atomic64_read-in-pmd_read_atomic-for-32bit.patch \
+	file://3.2.22/0009-nilfs2-ensure-proper-cache-clearing-for-gc-inodes.patch \
+	file://3.2.22/0010-drm-i915-Finish-any-pending-operations-on-the-frameb.patch \
+	file://3.2.22/0011-drm-i915-Remove-use-of-the-autoreported-ringbuffer-H.patch \
+	file://3.2.22/0012-e1000e-Disable-ASPM-L1-on-82574.patch \
+	file://3.2.22/0013-e1000e-Remove-special-case-for-82573-82574-ASPM-L1-d.patch \
+	file://3.2.22/0014-drm-i915-Do-the-fallback-non-IRQ-wait-in-ring-thrott.patch \
+	file://3.2.22/0015-staging-rts_pstor-Fix-possible-panic-by-NULL-pointer.patch \
+	file://3.2.22/0016-gspca-core-Fix-buffers-staying-in-queued-state-after.patch \
+	file://3.2.22/0017-smsusb-add-autodetection-support-for-USB-ID-2040-f5a.patch \
+	file://3.2.22/0018-drm-edid-don-t-return-stack-garbage-from-supports_rb.patch \
+	file://3.2.22/0019-drm-nouveau-fbcon-using-nv_two_heads-is-not-a-good-i.patch \
+	file://3.2.22/0020-dm-thin-reinstate-missing-mempool_free-in-cell_relea.patch \
+	file://3.2.22/0021-ath9k-Fix-a-WARNING-on-suspend-resume-with-IBSS.patch \
+	file://3.2.22/0022-cfg80211-fix-potential-deadlock-in-regulatory.patch \
+	file://3.2.22/0023-ath9k-Fix-softlockup-in-AR9485.patch \
+	file://3.2.22/0024-can-c_can-precedence-error-in-c_can_chip_config.patch \
+	file://3.2.22/0025-ath9k-fix-a-tx-rate-duration-calculation-bug.patch \
+	file://3.2.22/0026-batman-adv-fix-skb-data-assignment.patch \
+	file://3.2.22/0027-ARM-SAMSUNG-Should-check-for-IS_ERR-clk-instead-of-N.patch \
+	file://3.2.22/0028-ath9k_hw-avoid-possible-infinite-loop-in-ar9003_get_.patch \
+	file://3.2.22/0029-iwlwifi-remove-log_event-debugfs-file-debugging-is-d.patch \
+	file://3.2.22/0030-ARM-SAMSUNG-Fix-for-S3C2412-EBI-memory-mapping.patch \
+	file://3.2.22/0031-USB-option-add-id-for-Cellient-MEN-200.patch \
+	file://3.2.22/0032-oprofile-perf-use-NR_CPUS-instead-or-nr_cpumask_bits.patch \
+	file://3.2.22/0033-drm-i915-Refactor-the-deferred-PM_IIR-handling-into-.patch \
+	file://3.2.22/0034-drm-i915-rip-out-the-PM_IIR-WARN.patch \
+	file://3.2.22/0035-drm-i915-Fix-eDP-blank-screen-after-S3-resume-on-HP-.patch \
+	file://3.2.22/0036-PM-Sleep-Prevent-waiting-forever-on-asynchronous-sus.patch \
+	file://3.2.22/0037-x86-cpufeature-Rename-X86_FEATURE_DTS-to-X86_FEATURE.patch \
+	file://3.2.22/0038-stable-Allow-merging-of-backports-for-serious-user-v.patch \
+	file://3.2.22/0039-ALSA-hda-Add-Realtek-ALC280-codec-support.patch \
+	file://3.2.22/0040-USB-option-Add-USB-ID-for-Novatel-Ovation-MC551.patch \
+	file://3.2.22/0041-USB-CP210x-Add-10-Device-IDs.patch \
+	file://3.2.22/0042-xen-netfront-teardown-the-device-before-unregisterin.patch \
+	file://3.2.22/0043-can-flexcan-use-be32_to_cpup-to-handle-the-value-of-.patch \
+	file://3.2.22/0044-acpi_pad-fix-power_saving-thread-deadlock.patch \
+	file://3.2.22/0045-batman-adv-only-drop-packets-of-known-wifi-clients.patch \
+	file://3.2.22/0046-Linux-3.2.22.patch \
+	file://3.2.23/0001-splice-fix-racy-pipe-buffers-uses.patch \
+	file://3.2.23/0002-umem-fix-up-unplugging.patch \
+	file://3.2.23/0003-mwifiex-fix-11n-rx-packet-drop-issue.patch \
+	file://3.2.23/0004-mwifiex-fix-WPS-eapol-handshake-failure.patch \
+	file://3.2.23/0005-NFC-Prevent-multiple-buffer-overflows-in-NCI.patch \
+	file://3.2.23/0006-ath9k-fix-dynamic-WEP-related-regression.patch \
+	file://3.2.23/0007-NFC-Return-from-rawsock_release-when-sk-is-NULL.patch \
+	file://3.2.23/0008-rtlwifi-rtl8192cu-New-USB-IDs.patch \
+	file://3.2.23/0009-ath9k-enable-serialize_regmode-for-non-PCIE-AR9287.patch \
+	file://3.2.23/0010-mac80211-correct-behaviour-on-unrecognised-action-fr.patch \
+	file://3.2.23/0011-ASoC-tlv320aic3x-Fix-codec-pll-configure-bug.patch \
+	file://3.2.23/0012-powerpc-xmon-Use-cpumask-iterator-to-avoid-warning.patch \
+	file://3.2.23/0013-powerpc-kvm-sldi-should-be-sld.patch \
+	file://3.2.23/0014-md-raid10-Don-t-try-to-recovery-unmatched-and-unused.patch \
+	file://3.2.23/0015-md-raid5-Do-not-add-data_offset-before-call-to-is_ba.patch \
+	file://3.2.23/0016-md-raid5-In-ops_run_io-inc-nr_pending-before-calling.patch \
+	file://3.2.23/0017-md-raid10-fix-failure-when-trying-to-repair-a-read-e.patch \
+	file://3.2.23/0018-drm-i915-kick-any-firmware-framebuffers-before-claim.patch \
+	file://3.2.23/0019-dm-persistent-data-fix-shadow_info_leak-on-dm_tm_des.patch \
+	file://3.2.23/0020-dm-persistent-data-handle-space-map-checker-creation.patch \
+	file://3.2.23/0021-dm-persistent-data-fix-allocation-failure-in-space-m.patch \
+	file://3.2.23/0022-ALSA-hda-Fix-power-map-regression-for-HP-dv6-co.patch \
+	file://3.2.23/0023-tracing-change-CPU-ring-buffer-state-from-tracing_cp.patch \
+	file://3.2.23/0024-mwifiex-fix-wrong-return-values-in-add_virtual_intf-.patch \
+	file://3.2.23/0025-udf-Use-ret-instead-of-abusing-i-in-udf_load_logical.patch \
+	file://3.2.23/0026-udf-Avoid-run-away-loop-when-partition-table-length-.patch \
+	file://3.2.23/0027-udf-Fortify-loading-of-sparing-table.patch \
+	file://3.2.23/0028-ARM-fix-rcu-stalls-on-SMP-platforms.patch \
+	file://3.2.23/0029-net-sock-validate-data_len-before-allocating-skb-in-.patch \
+	file://3.2.23/0030-cipso-handle-CIPSO-options-correctly-when-NetLabel-i.patch \
+	file://3.2.23/0031-net-l2tp_eth-fix-kernel-panic-on-rmmod-l2tp_eth.patch \
+	file://3.2.23/0032-l2tp-fix-a-race-in-l2tp_ip_sendmsg.patch \
+	file://3.2.23/0033-sky2-fix-checksum-bit-management-on-some-chips.patch \
+	file://3.2.23/0034-be2net-fix-a-race-in-be_xmit.patch \
+	file://3.2.23/0035-dummy-fix-rcu_sched-self-detected-stalls.patch \
+	file://3.2.23/0036-bonding-Fix-corrupted-queue_mapping.patch \
+	file://3.2.23/0037-ethtool-allow-ETHTOOL_GSSET_INFO-for-users.patch \
+	file://3.2.23/0038-netpoll-fix-netpoll_send_udp-bugs.patch \
+	file://3.2.23/0039-ipv6-Move-ipv6-proc-file-registration-to-end-of-init.patch \
+	file://3.2.23/0040-bridge-Assign-rtnl_link_ops-to-bridge-devices-create.patch \
+	file://3.2.23/0041-Btrfs-run-delayed-directory-updates-during-log-repla.patch \
+	file://3.2.23/0042-cifs-when-server-doesn-t-set-CAP_LARGE_READ_X-cap-de.patch \
+	file://3.2.23/0043-ocfs2-clear-unaligned-io-flag-when-dio-fails.patch \
+	file://3.2.23/0044-aio-make-kiocb-private-NUll-in-init_sync_kiocb.patch \
+	file://3.2.23/0045-mtd-cafe_nand-fix-an-vs-mistake.patch \
+	file://3.2.23/0046-mm-Hold-a-file-reference-in-madvise_remove.patch \
+	file://3.2.23/0047-tcm_fc-Resolve-suspicious-RCU-usage-warnings.patch \
+	file://3.2.23/0048-vfs-make-O_PATH-file-descriptors-usable-for-fchdir.patch \
+	file://3.2.23/0049-Linux-3.2.23.patch \
 	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
 	file://libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch \
 	file://libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch \
@@ -1530,18 +1625,19 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0063-beaglebone-dvi-cape-audio-hacks.patch \
 	file://beaglebone/0064-beaglebone-always-execute-the-pin-free-checks.patch \
 	file://beaglebone/0065-ti_tscadc-switch-to-16x-averaging.patch \
-	file://beaglebone/0067-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch \
-	file://beaglebone/0068-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch \
-	file://beaglebone/0069-beaglebone-add-support-for-LCD3-rev-A1.patch \
-	file://beaglebone/0070-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch \
-	file://beaglebone/0071-beaglebone-fix-LCD3-led-key-overlap.patch \
-	file://beaglebone/0072-beaglebone-fix-audio-spi-clash.patch \
-	file://beaglebone/0073-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch \
-	file://beaglebone/0074-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch \
-	file://beaglebone/0075-beaglebone-disable-LBO-GPIO-for-battery-cape.patch \
+	file://beaglebone/0066-video-da8xx-fb-Add-Newhaven-LCD-Panel-details.patch \
+	file://beaglebone/0067-beaglebone-add-support-for-the-4.3-lcd-cape-with-res.patch \
+	file://beaglebone/0068-beaglebone-add-support-for-LCD3-rev-A1.patch \
+	file://beaglebone/0069-beaglebone-fix-buttons-spidev-clash-when-using-mcasp.patch \
+	file://beaglebone/0070-beaglebone-fix-LCD3-led-key-overlap.patch \
+	file://beaglebone/0071-beaglebone-fix-audio-spi-clash.patch \
+	file://beaglebone/0072-beaglebone-add-support-for-QuickLogic-Camera-interfa.patch \
+	file://beaglebone/0073-beaglebone-add-support-for-DVI-audio-and-audio-only-.patch \
+	file://beaglebone/0074-beaglebone-disable-LBO-GPIO-for-battery-cape.patch \
 	file://beaglebone/0075-video-da8xx-fb-calculate-pixel-clock-period-for-the-.patch \
 	file://beaglebone/0076-beaglebone-improve-GPMC-bus-timings-for-camera-cape.patch \
 	file://beaglebone/0077-beaglebone-disable-UYVY-VYUY-and-YVYU-modes-in-camer.patch \
 	file://beaglebone/0078-beaglebone-error-handling-for-DMA-completion-in-cssp.patch \
 	file://beaglebone/0079-AM335X-errata-OPP50-on-MPU-domain-is-not-supported.patch \
+	file://beaglebone/0080-vfs-Add-a-trace-point-in-the-mark_inode_dirty-functi.patch \
 "
-- 
1.7.10


