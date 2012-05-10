Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8D1BEE0140E
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:19 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id fg15so937547wgb.11
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 02:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=Sns+wAhk/JI3sNNwHU3NFYyG/UpNn47WAv10ONnAhV8=;
	b=fk3dtDJF78lKGXCsuUXw66bxCm3WmfoMDaCBVcP0r/CDvEzMmHwjmI74rG94pBOp9Y
	/zHGPGNPd+C3+8sqqbD7T5448dK+N1KhODgri0RNoMOTFXhW8CzCFV1QE3ckPEEhSeWj
	Vu3WE/SGd5ilEQRxx1eVckD9/iRGgahOP+cdnl9bkoh+2ildRPc0vqVgcs/s0Ye5MpOp
	zgzCiDpeZmqv/N19Q4BsPjEQDeDE7TbcryAtDGzL9wn/07zgxNj/YYSmO88my8xn+66F
	6jqPctD0/VazbTdjJJt7jdF1vGC4Pd5I4j7Vr5rlA5TBcMTnTOpd5psHKStIjsOC9lW3
	oKtg==
Received: by 10.180.24.7 with SMTP id q7mr14325688wif.11.1336640418716;
	Thu, 10 May 2012 02:00:18 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id fm1sm1934846wib.10.2012.05.10.02.00.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 May 2012 02:00:17 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 10 May 2012 10:59:34 +0200
Message-Id: <1336640375-20418-12-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
References: <1336640375-20418-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkgNn1+xMeAfaDNdnQoSFaqmeIVO1+A/mjEQ1HdTkQ//zSJEQLg4tdu57kAAChej/cy0X5o
Cc: denys@ti.com
Subject: [PATCH v3 12/13] linux-ti33x-psp 3.2: rebase patches onto latest git
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
X-List-Received-Date: Thu, 10 May 2012 09:00:20 -0000

The psp tree added a patch to limit the beaglebone to 500MHz when powered by USB, which triggered conflicts in the patches. The 3.2.16 series has been rediffed as well, no functional changes.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 ...sk-transcoder-select-bits-before-setting-.patch |    6 +-
 ...deon-kms-fix-DVO-setup-on-some-r4xx-chips.patch |    6 +-
 ...ngbuffer-Exclude-last-2-cachlines-of-ring.patch |    6 +-
 ...only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch |    6 +-
 ...operly-compute-dp-dithering-for-user-crea.patch |    6 +-
 ...-i915-make-rc6-module-parameter-read-only.patch |    6 +-
 ...-missing-DMA-buffer-unmapping-for-PCI-dri.patch |    6 +-
 ...79-1-DT-fix-atags_to_fdt-second-call-site.patch |    6 +-
 ...ThumbEE-Disable-userspace-TEEHBR-access-f.patch |    6 +-
 ...revent-bitmap_daemon_work-running-while-i.patch |    6 +-
 ...0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch |    6 +-
 ...ci_ldisc-fix-NULL-pointer-dereference-on-.patch |    6 +-
 ...s-scalability-issue-by-removing-extent-ca.patch |    6 +-
 ...14-ia64-fix-futex_atomic_cmpxchg_inatomic.patch |    6 +-
 ...-rtc-pl031.c-enable-clock-on-all-ST-varia.patch |    6 +-
 ...getlb-fix-race-condition-in-hugetlb_fault.patch |    6 +-
 ...g-iio-hmc5843-Fix-crash-in-probe-function.patch |    6 +-
 ...altera_uart-Check-for-NULL-platform_data-.patch |    6 +-
 ...minate-obsolete-__handle_softirq-function.patch |    6 +-
 .../0020-sparc64-Fix-bootup-crash-on-sun4v.patch   |    6 +-
 ...alize-scsi-host-max_sectors-for-tape-driv.patch |    6 +-
 ...csi-tape-io-with-more-than-255-scatter-ga.patch |    6 +-
 ...Catch-and-handle-out-of-date-hist-entry-m.patch |   59 -----------
 ...b-Fix-oops-that-uvesafb-try-to-execute-N.patch} |    6 +-
 ...tale-jiffies-update-in-tick_nohz_restart.patch} |    6 +-
 ...h => 0025-pch_uart-Fix-MSI-setting-issue.patch} |    6 +-
 ...B-serial-fix-race-between-probe-and-open.patch} |    6 +-
 ...ix-DTR-RTS-being-raised-on-baud-rate-cha.patch} |    6 +-
 ...e-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch} |    6 +-
 ...-fix-status-line-change-handling-for-TIO.patch} |    6 +-
 ...-fix-race-condition-in-TIOCMIWAIT-and-ab.patch} |    6 +-
 ...a-add-support-for-Sierra-Wireless-MC7710.patch} |    6 +-
 ...-clear-urb-dev-in-scatter-gather-library.patch} |    6 +-
 ...on-t-ignore-suspend-errors-for-root-hubs.patch} |    6 +-
 ... 0034-xhci-don-t-re-enable-IE-constantly.patch} |    6 +-
 ...t-write-zeroed-pointers-to-xHC-registers.patch} |    6 +-
 ...ore-event-ring-dequeue-pointer-on-resume.patch} |    6 +-
 ...of-device-descriptor-got-from-superspeed.patch} |    6 +-
 ...I_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch} |    6 +-
 ...rrect-the-define-XHCI_LEGACY_DISABLE_SMI.patch} |    6 +-
 ...40-fix-tlb-flushing-for-page-table-pages.patch} |    6 +-
 ...41-serial-PL011-clear-pending-interrupts.patch} |    6 +-
 ...042-serial-PL011-move-interrupt-clearing.patch} |    6 +-
 ...the-same-personality-flags-as-suid-when-.patch} |    6 +-
 ...0044-ath9k-fix-max-noise-floor-threshold.patch} |    6 +-
 ...045-xhci-Fix-register-save-restore-order.patch} |    6 +-
 ...i_core-fix-NULL-pointer-dereference-at-u.patch} |    6 +-
 ...port-new-device-LAPIS-Semiconductor-ML78.patch} |    6 +-
 ...issing-spin_lock_init-in-gpio-pch-driver.patch} |    6 +-
 ...-usb-gadget-pch_udc-Fix-disconnect-issue.patch} |    6 +-
 ...sb-gadget-pch_udc-Fix-wrong-return-value.patch} |    6 +-
 ...usb-gadget-pch_udc-Fix-USB-suspend-issue.patch} |    6 +-
 ...ch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch} |    6 +-
 ...adget-pch_udc-Reduce-redundant-interrupt.patch} |    6 +-
 ...o-allow-region-arguments-to-reference-ot.patch} |    6 +-
 ...ecurity-fix-compile-error-in-commoncap.c.patch} |    6 +-
 ...56-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch} |    8 +-
 ...ry-corruption-calling-pch_gbe_validate_o.patch} |    8 +-
 ...ort-new-device-LAPIS-Semiconductor-ML783.patch} |    6 +-
 ...-topcliff-pch-fix-Wuninitialized-warning.patch} |    6 +-
 ...-pch-Support-new-device-LAPIS-Semiconduc.patch} |    6 +-
 ...ding-USB-device-13d3-3375-as-an-Atheros-.patch} |    6 +-
 ...tooth-Add-Atheros-maryann-PIDVID-support.patch} |    6 +-
 ...oth-Add-support-for-BCM20702A0-0a5c-21e3.patch} |    6 +-
 ...-leak-robust-list-to-unprivileged-proces.patch} |    6 +-
 ...ms-fix-the-regression-of-DVI-connector-c.patch} |    6 +-
 ... => 0066-drm-radeon-disable-MSI-on-RV515.patch} |    6 +-
 ...ix-load-detect-on-rn50-with-hardcoded-ED.patch} |    6 +-
 ...-Linux-3.2.16.patch => 0068-Linux-3.2.16.patch} |    6 +-
 ...1-f_rndis-HACK-around-undefined-variables.patch |    6 +-
 ...2-da8xx-fb-add-DVI-support-for-beaglebone.patch |    6 +-
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |   34 +++----
 .../beaglebone/0004-more-beaglebone-merges.patch   |   18 ++--
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |   10 +-
 ...general-purpose-mode-untested-with-touchs.patch |   32 +++---
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   14 +--
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   10 +-
 ...cadc-make-stepconfig-channel-configurable.patch |   14 +--
 .../0010-tscadc-Trigger-through-sysfs.patch        |   20 ++--
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   10 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |   14 +--
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |   14 +--
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    6 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |   22 ++---
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |    6 +-
 ...set-default-brightness-to-50-for-pwm-back.patch |   10 +-
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    6 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |   20 ++--
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   18 ++--
 ...add-more-beagleboardtoys-cape-partnumbers.patch |   10 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |   16 +--
 ...23-beaglebone-add-enter-key-for-lcd7-cape.patch |   12 +--
 .../0024-beaglebone-add-gpio-keys-for-lcd.patch    |   12 +--
 ...025-beaglebone-fix-direction-of-gpio-keys.patch |   28 +++---
 .../0026-beaglebone-fix-3.5-lcd-cape-support.patch |   14 +--
 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |   12 +--
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |   12 +--
 ...0029-beaglebone-also-report-cape-revision.patch |   14 +--
 ...don-t-compare-undefined-characters-it-mak.patch |   13 +--
 ... => 0031-beaglebone-fix-3.5-cape-support.patch} |   14 +--
 ...connect-batterycape-GPIO-to-gpio-charger.patch} |   16 +--
 ...ebone-add-support-for-CAN-and-RS232-cape.patch} |   16 +--
 ...eartbeat-stop-on-shutdown-reboot-or-panic.patch |    4 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  102 ++++++++++----------
 104 files changed, 499 insertions(+), 557 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch => 0023-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch => 0024-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0026-pch_uart-Fix-MSI-setting-issue.patch => 0025-pch_uart-Fix-MSI-setting-issue.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0027-USB-serial-fix-race-between-probe-and-open.patch => 0026-USB-serial-fix-race-between-probe-and-open.patch} (96%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch => 0027-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch} (89%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch => 0028-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch => 0029-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch => 0030-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch} (96%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch => 0031-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch} (88%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch => 0032-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch => 0033-USB-don-t-ignore-suspend-errors-for-root-hubs.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0035-xhci-don-t-re-enable-IE-constantly.patch => 0034-xhci-don-t-re-enable-IE-constantly.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch => 0035-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch => 0036-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch} (91%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch => 0037-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch => 0038-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch} (91%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch => 0039-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0041-fix-tlb-flushing-for-page-table-pages.patch => 0040-fix-tlb-flushing-for-page-table-pages.patch} (98%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0042-serial-PL011-clear-pending-interrupts.patch => 0041-serial-PL011-clear-pending-interrupts.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0043-serial-PL011-move-interrupt-clearing.patch => 0042-serial-PL011-move-interrupt-clearing.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch => 0043-fcaps-clear-the-same-personality-flags-as-suid-when-.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0045-ath9k-fix-max-noise-floor-threshold.patch => 0044-ath9k-fix-max-noise-floor-threshold.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0046-xhci-Fix-register-save-restore-order.patch => 0045-xhci-Fix-register-save-restore-order.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch => 0046-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch => 0047-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch => 0048-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch} (88%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch => 0049-usb-gadget-pch_udc-Fix-disconnect-issue.patch} (89%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch => 0050-usb-gadget-pch_udc-Fix-wrong-return-value.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch => 0051-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch => 0052-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch => 0053-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch => 0054-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0056-security-fix-compile-error-in-commoncap.c.patch => 0055-security-fix-compile-error-in-commoncap.c.patch} (89%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch => 0056-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch} (93%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch => 0057-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch} (89%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch => 0058-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch => 0059-spi-topcliff-pch-fix-Wuninitialized-warning.patch} (95%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch => 0060-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch => 0061-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch} (94%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch => 0062-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch => 0063-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch} (91%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch => 0064-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch} (97%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch => 0065-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0067-drm-radeon-disable-MSI-on-RV515.patch => 0066-drm-radeon-disable-MSI-on-RV515.patch} (90%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch => 0067-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch} (92%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/{0069-Linux-3.2.16.patch => 0068-Linux-3.2.16.patch} (78%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0033-beaglebone-fix-3.5-cape-support.patch => 0031-beaglebone-fix-3.5-cape-support.patch} (88%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch => 0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch} (83%)
 rename recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/{0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch => 0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch} (84%)

diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch
index 4dcea84..2aae432 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch
@@ -1,7 +1,7 @@
-From 0e9a6694305d6e8a9afd0e0f67e9fa430f4a913d Mon Sep 17 00:00:00 2001
+From 23bf11c621c4c3acfdf83cf7f5587a2463d039ec Mon Sep 17 00:00:00 2001
 From: Jesse Barnes <jbarnes@virtuousgeek.org>
 Date: Thu, 12 Jan 2012 14:51:17 -0800
-Subject: [PATCH 01/69] drm/i915: mask transcoder select bits before setting
+Subject: [PATCH 01/68] drm/i915: mask transcoder select bits before setting
  them on LVDS
 
 commit 7885d2052bd94395e337709cfba093a41f273ff1 upstream.
@@ -46,5 +46,5 @@ index 9011f48..390768f 100644
  		/* set the corresponsding LVDS_BORDER bit */
  		temp |= dev_priv->lvds_border_bits;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch
index 7ac071f..aa7ef08 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch
@@ -1,7 +1,7 @@
-From 039999fecc9cd2243a2322a5b2ba153f6bfe6703 Mon Sep 17 00:00:00 2001
+From 7943d755c7abd153158d25f50e2d35cec9bf7e73 Mon Sep 17 00:00:00 2001
 From: Alex Deucher <alexander.deucher@amd.com>
 Date: Tue, 3 Apr 2012 17:05:41 -0400
-Subject: [PATCH 02/69] drm/radeon/kms: fix DVO setup on some r4xx chips
+Subject: [PATCH 02/68] drm/radeon/kms: fix DVO setup on some r4xx chips
 
 commit afceb9319f21b18ee3bc15ee9a5f92e18ef8a8c9 upstream.
 
@@ -35,5 +35,5 @@ index 0f8eb48..5351ee1 100644
  	case 1:
  		switch (crev) {
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch
index db337c4..a4d9528 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch
@@ -1,7 +1,7 @@
-From 6905e24cc8b935ca1db7f0af4ec3fe95ffd30122 Mon Sep 17 00:00:00 2001
+From 283aa265f1ec642ce070bb3f1d3d69777b544144 Mon Sep 17 00:00:00 2001
 From: Chris Wilson <chris@chris-wilson.co.uk>
 Date: Mon, 9 Apr 2012 13:59:46 +0100
-Subject: [PATCH 03/69] drm/i915/ringbuffer: Exclude last 2 cachlines of ring
+Subject: [PATCH 03/68] drm/i915/ringbuffer: Exclude last 2 cachlines of ring
  on 845g
 
 commit 27c1cbd06a7620b354cbb363834f3bb8df4f410d upstream.
@@ -30,5 +30,5 @@ index 30a9af9..8673581 100644
  
  	return 0;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch
index 323eb1b..ff612c5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch
@@ -1,7 +1,7 @@
-From 3168f6f46758c36d5b33ed5e77329bffed67033f Mon Sep 17 00:00:00 2001
+From 40d10e38c38f6f39e29b78688a4bcb368e265b5c Mon Sep 17 00:00:00 2001
 From: Alex Deucher <alexander.deucher@amd.com>
 Date: Tue, 10 Apr 2012 12:14:27 -0400
-Subject: [PATCH 04/69] drm/radeon: only add the mm i2c bus if the hw_i2c
+Subject: [PATCH 04/68] drm/radeon: only add the mm i2c bus if the hw_i2c
  module param is set
 
 commit 46783150a6552f9513f08e62cfcc07125d6e502b upstream.
@@ -37,5 +37,5 @@ index 7bb1b07..1441b00 100644
  	if (i2c == NULL)
  		return NULL;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch
index 45e685a..d1b02ef 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch
@@ -1,7 +1,7 @@
-From 95523fb19e6eea48b9c0632b81780268f386b22f Mon Sep 17 00:00:00 2001
+From bfbf01f9468232ac6856b46665b6998afa45e4a6 Mon Sep 17 00:00:00 2001
 From: Daniel Vetter <daniel.vetter@ffwll.ch>
 Date: Tue, 10 Apr 2012 10:42:36 +0200
-Subject: [PATCH 05/69] drm/i915: properly compute dp dithering for
+Subject: [PATCH 05/68] drm/i915: properly compute dp dithering for
  user-created modes
 
 commit c4867936474183332db4c19791a65fdad6474fd5 upstream.
@@ -126,5 +126,5 @@ index 94f860c..12eb789 100644
  		for (clock = 0; clock <= max_clock; clock++) {
  			int link_avail = intel_dp_max_data_rate(intel_dp_link_clock(bws[clock]), lane_count);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch
index 79340e1..12db79c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch
@@ -1,7 +1,7 @@
-From f6810569f5eea5dd63a4be4fdcf052ab08d4f7fa Mon Sep 17 00:00:00 2001
+From c4e630199ffb5b9fd2b25dbb222316f092915a14 Mon Sep 17 00:00:00 2001
 From: Jesse Barnes <jbarnes@virtuousgeek.org>
 Date: Wed, 11 Apr 2012 09:39:02 -0700
-Subject: [PATCH 06/69] drm/i915: make rc6 module parameter read-only
+Subject: [PATCH 06/68] drm/i915: make rc6 module parameter read-only
 
 commit f57f9c167af7cb3fd315e6a8ebe194a8aea0832a upstream.
 
@@ -28,5 +28,5 @@ index e52b705..d0f8830 100644
  		"Enable power-saving render C-state 6 (default: -1 (use per-chip default)");
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch
index 550db2e..2c7668c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch
@@ -1,7 +1,7 @@
-From a8c85bb6818c1e5d3fec8904cae9a851ed700bb6 Mon Sep 17 00:00:00 2001
+From 98861c7257e3ce6dd351c07abed856e73add7858 Mon Sep 17 00:00:00 2001
 From: Larry Finger <Larry.Finger@lwfinger.net>
 Date: Mon, 26 Mar 2012 10:48:20 -0500
-Subject: [PATCH 07/69] rtlwifi: Add missing DMA buffer unmapping for PCI
+Subject: [PATCH 07/68] rtlwifi: Add missing DMA buffer unmapping for PCI
  drivers
 
 commit 673f7786e205c87b5d978c62827b9a66d097bebb upstream.
@@ -41,5 +41,5 @@ index 9afcad3..d44d398 100644
  	/*NB: the beacon data buffer must be 32-bit aligned. */
  	pskb = ieee80211_beacon_get(hw, mac->vif);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch
index 4f0dc10..77b44ae 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch
@@ -1,7 +1,7 @@
-From a1e9b9702554dae713f7344f8d357ac261a3a0d7 Mon Sep 17 00:00:00 2001
+From 2c1b118701f57e31e048458bae612029472c768d Mon Sep 17 00:00:00 2001
 From: Marc Zyngier <Marc.Zyngier@arm.com>
 Date: Wed, 11 Apr 2012 14:52:55 +0100
-Subject: [PATCH 08/69] ARM: 7379/1: DT: fix atags_to_fdt() second call site
+Subject: [PATCH 08/68] ARM: 7379/1: DT: fix atags_to_fdt() second call site
 
 commit 9c5fd9e85f574d9d0361b2b878f55732290afe5b upstream.
 
@@ -33,5 +33,5 @@ index c2effc9..9c18ebd 100644
  		ldmfd	sp!, {r0-r3, ip, lr}
  		sub	sp, sp, #0x10000
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch
index 19d9a23..d4c1734 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch
@@ -1,7 +1,7 @@
-From f57d472183a16e61832110d6cdb7a410802c0c34 Mon Sep 17 00:00:00 2001
+From a950b5b3f82c7cfd682ccc62b65b269268772fff Mon Sep 17 00:00:00 2001
 From: Jonathan Austin <Jonathan.Austin@arm.com>
 Date: Thu, 12 Apr 2012 17:45:25 +0100
-Subject: [PATCH 09/69] ARM: 7384/1: ThumbEE: Disable userspace TEEHBR access
+Subject: [PATCH 09/68] ARM: 7384/1: ThumbEE: Disable userspace TEEHBR access
  for !CONFIG_ARM_THUMBEE
 
 commit 078c04545ba56da21567728a909a496df5ff730d upstream.
@@ -50,5 +50,5 @@ index 82ef81d..785365e 100644
  	ldmia	r5, {r5, r6}
  #ifdef CONFIG_CPU_ENDIAN_BE8
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch
index a80aa00..4970e44 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch
@@ -1,7 +1,7 @@
-From 814a0921c841d7bb82d27dfccdafea9982420c24 Mon Sep 17 00:00:00 2001
+From b694e091929929c8b56fcb1fbf28cba81dc2fe04 Mon Sep 17 00:00:00 2001
 From: NeilBrown <neilb@suse.de>
 Date: Thu, 12 Apr 2012 16:05:06 +1000
-Subject: [PATCH 10/69] md/bitmap: prevent bitmap_daemon_work running while
+Subject: [PATCH 10/68] md/bitmap: prevent bitmap_daemon_work running while
  initialising bitmap
 
 commit afbaa90b80b1ec66e5137cc3824746bfdf559b18 upstream.
@@ -38,5 +38,5 @@ index 2a8722b..62a8e68 100644
  	if (err)
  		goto out;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch
index a6ef289..7efdc23 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch
@@ -1,7 +1,7 @@
-From afeb2c0d484fb63fc8de83308f3ae74c9a607ad0 Mon Sep 17 00:00:00 2001
+From b69f7a1d24573678da4e44e9f2f7028640a6d592 Mon Sep 17 00:00:00 2001
 From: Johan Hovold <jhovold@gmail.com>
 Date: Wed, 11 Apr 2012 11:24:35 +0200
-Subject: [PATCH 11/69] Bluetooth: uart-ldisc: Fix memory leak
+Subject: [PATCH 11/68] Bluetooth: uart-ldisc: Fix memory leak
 
 This is a partial, self-contained, minimal backport of commit
 797fe796c4335b35d95d5326824513befdb5d1e9 upstream which fixes the memory
@@ -47,5 +47,5 @@ index 48ad2a7..36dafef 100644
  }
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch
index fdf5235..bf4047a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch
@@ -1,7 +1,7 @@
-From 96e70b85a81d0c38ed66c1861711855a15428870 Mon Sep 17 00:00:00 2001
+From 37a8e3758523b47f282d19502ea361f1d5c2a033 Mon Sep 17 00:00:00 2001
 From: Johan Hovold <jhovold@gmail.com>
 Date: Thu, 15 Mar 2012 14:48:40 +0100
-Subject: [PATCH 12/69] Bluetooth: hci_ldisc: fix NULL-pointer dereference on
+Subject: [PATCH 12/68] Bluetooth: hci_ldisc: fix NULL-pointer dereference on
  tty_close
 
 commit 33b69bf80a3704d45341928e4ff68b6ebd470686 upstream.
@@ -103,5 +103,5 @@ index 36dafef..8f3d6db 100644
  		kfree(hu);
  	}
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch
index f084adc..cbf03c5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch
@@ -1,7 +1,7 @@
-From f1c04355902ab71e60c67f39ea29822d0eea062f Mon Sep 17 00:00:00 2001
+From bc445f05f44d9e21294eaa8686837b588a27a66a Mon Sep 17 00:00:00 2001
 From: Theodore Ts'o <tytso@mit.edu>
 Date: Mon, 16 Apr 2012 12:16:20 -0400
-Subject: [PATCH 13/69] ext4: address scalability issue by removing extent
+Subject: [PATCH 13/68] ext4: address scalability issue by removing extent
  cache statistics
 
 commit 9cd70b347e9761ea2d2ac3d758c529a48a8193e6 upstream.
@@ -89,5 +89,5 @@ index 9281dbe..961059b 100644
  	ATTR_LIST(inode_goal),
  	ATTR_LIST(mb_stats),
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch
index ac9d27d..9175698 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch
@@ -1,7 +1,7 @@
-From 31a9ac5149ad2b11b591eb704f3132d0d344e7e0 Mon Sep 17 00:00:00 2001
+From 75d50bfacb4322a1259307cfa50aa0f87a02f160 Mon Sep 17 00:00:00 2001
 From: "Luck, Tony" <tony.luck@intel.com>
 Date: Mon, 16 Apr 2012 16:28:01 -0700
-Subject: [PATCH 14/69] ia64: fix futex_atomic_cmpxchg_inatomic()
+Subject: [PATCH 14/68] ia64: fix futex_atomic_cmpxchg_inatomic()
 
 commit c76f39bddb84f93f70a5520d9253ec0317bec216 upstream.
 
@@ -54,5 +54,5 @@ index 8428525..21ab376 100644
  			  "rO" ((long) (unsigned) oldval)
  			: "memory");
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch
index 7990dfe..a861101 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch
@@ -1,7 +1,7 @@
-From a5333b50b8a4297f3b9959366fb26ad9b9c55314 Mon Sep 17 00:00:00 2001
+From 4886a34fc21445895de3bc2584c46792d1a11bec Mon Sep 17 00:00:00 2001
 From: Linus Walleij <linus.walleij@linaro.org>
 Date: Thu, 12 Apr 2012 12:49:16 -0700
-Subject: [PATCH 15/69] drivers/rtc/rtc-pl031.c: enable clock on all ST
+Subject: [PATCH 15/68] drivers/rtc/rtc-pl031.c: enable clock on all ST
  variants
 
 commit 2f3972168353d355854d6381f1f360ce83b723e5 upstream.
@@ -35,5 +35,5 @@ index ff1b84b..e86edfc 100644
  		       ldata->base + RTC_CR);
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch
index 5b93b53..2b5f8b1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch
@@ -1,7 +1,7 @@
-From 7295297274cc9506d1600eb09ab93f203e860f48 Mon Sep 17 00:00:00 2001
+From cabab70ca89f34dacc965ea927f0f67706fcc22b Mon Sep 17 00:00:00 2001
 From: Chris Metcalf <cmetcalf@tilera.com>
 Date: Thu, 12 Apr 2012 12:49:15 -0700
-Subject: [PATCH 16/69] hugetlb: fix race condition in hugetlb_fault()
+Subject: [PATCH 16/68] hugetlb: fix race condition in hugetlb_fault()
 
 commit 66aebce747eaf9bc456bf1f1b217d8db843031d0 upstream.
 
@@ -85,5 +85,5 @@ index 2316840..bd936ed 100644
  out_mutex:
  	mutex_unlock(&hugetlb_instantiation_mutex);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch
index 0bd5305..a1b99a9 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch
@@ -1,7 +1,7 @@
-From 67d0ef228b571d53087923471cdd9de8281b7545 Mon Sep 17 00:00:00 2001
+From 0bc2590c85b786aa29761b2471415c7b159c142c Mon Sep 17 00:00:00 2001
 From: Marek Belisko <marek.belisko@open-nandra.com>
 Date: Thu, 12 Apr 2012 21:48:03 +0200
-Subject: [PATCH 17/69] staging: iio: hmc5843: Fix crash in probe function.
+Subject: [PATCH 17/68] staging: iio: hmc5843: Fix crash in probe function.
 
 commit 62d2feb9803f18c4e3c8a1a2c7e30a54df8a1d72 upstream.
 
@@ -103,5 +103,5 @@ index fc9ee97..870db4f 100644
  	hmc5843_set_rate(client, data->rate);
  	hmc5843_configure(client, data->operating_mode);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch
index e24a472..3a39598 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch
@@ -1,7 +1,7 @@
-From da80dc7cc4c7ed0823fe75f54cefabc42ac56996 Mon Sep 17 00:00:00 2001
+From 33fbe982ec60fd99d02c6bf3cca78e10ad49a46a Mon Sep 17 00:00:00 2001
 From: Yuriy Kozlov <ykozlov@ptcusa.com>
 Date: Thu, 29 Mar 2012 09:55:27 +0200
-Subject: [PATCH 18/69] tty: serial: altera_uart: Check for NULL platform_data
+Subject: [PATCH 18/68] tty: serial: altera_uart: Check for NULL platform_data
  in probe.
 
 commit acede70d6561f2d042d9dbb153d9a3469479c0ed upstream.
@@ -38,5 +38,5 @@ index 1d04c50..5ba0898 100644
  
  	/* Check platform data first so we can override device node data */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch
index d81ec8e..f974fd9 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch
@@ -1,7 +1,7 @@
-From d219e7abf51d7e4784a127d79d5806b9c49c672b Mon Sep 17 00:00:00 2001
+From 05ab1d059eb55460d5bafab622493a9c7d2b879f Mon Sep 17 00:00:00 2001
 From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
 Date: Fri, 13 Apr 2012 03:35:13 +0000
-Subject: [PATCH 19/69] sparc64: Eliminate obsolete __handle_softirq()
+Subject: [PATCH 19/68] sparc64: Eliminate obsolete __handle_softirq()
  function
 
 commit 3d3eeb2ef26112a200785e5fca58ec58dd33bf1e upstream.
@@ -59,5 +59,5 @@ index 77f1b95..9171fc2 100644
  		sethi			%hi(0xf << 20), %l4
  		and			%l1, %l4, %l4
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch
index 9aa5993..ef06859 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch
@@ -1,7 +1,7 @@
-From 19e418644c8801bf98b7c058825bd632f2a92f1f Mon Sep 17 00:00:00 2001
+From bfc4ac59222dd446f647b3d38cd706a55a3f2320 Mon Sep 17 00:00:00 2001
 From: "David S. Miller" <davem@davemloft.net>
 Date: Fri, 13 Apr 2012 11:56:22 -0700
-Subject: [PATCH 20/69] sparc64: Fix bootup crash on sun4v.
+Subject: [PATCH 20/68] sparc64: Fix bootup crash on sun4v.
 
 commit 9e0daff30fd7ecf698e5d20b0fa7f851e427cca5 upstream.
 
@@ -29,5 +29,5 @@ index 381edcd..27728e1 100644
 -subsys_initcall(ds_init);
 +fs_initcall(ds_init);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch
index 3291bc5..0d950ee 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch
@@ -1,7 +1,7 @@
-From c8b1bb9d2383126d121f36795771ca734bc73003 Mon Sep 17 00:00:00 2001
+From 21ffb8a828b59cb70af522e6560a975c0e5ddae4 Mon Sep 17 00:00:00 2001
 From: "Stephen M. Cameron" <scameron@beardog.cce.hp.com>
 Date: Thu, 22 Mar 2012 21:40:08 +0100
-Subject: [PATCH 21/69] cciss: Initialize scsi host max_sectors for tape drive
+Subject: [PATCH 21/68] cciss: Initialize scsi host max_sectors for tape drive
  support
 
 commit 395d287526bb60411ff37b19ad9dd38b58ba8732 upstream.
@@ -31,5 +31,5 @@ index e820b68..f510a9c 100644
  	((struct cciss_scsi_adapter_data_t *) 
  		h->scsi_ctlr)->scsi_host = sh;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch
index df9a8fe..6ab9a4e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch
@@ -1,7 +1,7 @@
-From 80461d138d8963f19b97fda7126455f12ba70bc8 Mon Sep 17 00:00:00 2001
+From 3c8f69ec2a543e0b0c3f0f2a84663629ea0a1711 Mon Sep 17 00:00:00 2001
 From: "Stephen M. Cameron" <scameron@beardog.cce.hp.com>
 Date: Thu, 22 Mar 2012 21:40:09 +0100
-Subject: [PATCH 22/69] cciss: Fix scsi tape io with more than 255 scatter
+Subject: [PATCH 22/68] cciss: Fix scsi tape io with more than 255 scatter
  gather elements
 
 commit bc67f63650fad6b3478d9ddfd5406d45a95987c9 upstream.
@@ -34,5 +34,5 @@ index f510a9c..acda773 100644
  		c->Header.SGList = h->max_cmd_sgentries;
  	else
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch
deleted file mode 100644
index 42495dd..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 49bb9ef1ae7951ed1a193e4473cb617d7a89fbdb Mon Sep 17 00:00:00 2001
-From: David Miller <davem@davemloft.net>
-Date: Tue, 27 Mar 2012 03:14:18 -0400
-Subject: [PATCH 23/69] perf hists: Catch and handle out-of-date hist entry
- maps.
-
-commit 63fa471dd49e9c9ce029d910d1024330d9b1b145 upstream.
-
-When a process exec()'s, all the maps are retired, but we keep the hist
-entries around which hold references to those outdated maps.
-
-If the same library gets mapped in for which we have hist entries, a new
-map will be created.  But when we take a perf entry hit within that map,
-we'll find the existing hist entry with the older map.
-
-This causes symbol translations to be done incorrectly.  For example,
-the perf entry processing will lookup the correct uptodate map entry and
-use that to calculate the symbol and DSO relative address.  But later
-when we update the histogram we'll translate the address using the
-outdated map file instead leading to conditions such as out-of-range
-offsets in symbol__inc_addr_samples().
-
-Therefore, update the map of the hist_entry dynamically at lookup/
-creation time.
-
-Signed-off-by: David S. Miller <davem@davemloft.net>
-Link: http://lkml.kernel.org/r/20120327.031418.1220315351537060808.davem@davemloft.net
-Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
-Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
----
- tools/perf/util/hist.c |   12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
-index 216e33a..adb372d 100644
---- a/tools/perf/util/hist.c
-+++ b/tools/perf/util/hist.c
-@@ -230,6 +230,18 @@ struct hist_entry *__hists__add_entry(struct hists *hists,
- 		if (!cmp) {
- 			he->period += period;
- 			++he->nr_events;
-+
-+			/* If the map of an existing hist_entry has
-+			 * become out-of-date due to an exec() or
-+			 * similar, update it.  Otherwise we will
-+			 * mis-adjust symbol addresses when computing
-+			 * the history counter to increment.
-+			 */
-+			if (he->ms.map != entry->ms.map) {
-+				he->ms.map = entry->ms.map;
-+				if (he->ms.map)
-+					he->ms.map->referenced = true;
-+			}
- 			goto out;
- 		}
- 
--- 
-1.7.9.5
-
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
index bfe3ac5..6fe1c74 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
@@ -1,7 +1,7 @@
-From c89ee4a69b7ed875adac55c2929903acc5001d3b Mon Sep 17 00:00:00 2001
+From f60922f4d15cda62654f28c209b6123e7abe0b69 Mon Sep 17 00:00:00 2001
 From: Wang YanQing <udknight@gmail.com>
 Date: Sun, 1 Apr 2012 08:54:02 +0800
-Subject: [PATCH 24/69] video:uvesafb: Fix oops that uvesafb try to execute
+Subject: [PATCH 23/68] video:uvesafb: Fix oops that uvesafb try to execute
  NX-protected page
 
 commit b78f29ca0516266431688c5eb42d39ce42ec039a upstream.
@@ -114,5 +114,5 @@ index 7f8472c..8813588 100644
  	/* The protected mode interface is not available on non-x86. */
  	par->pmi_setpal = par->ypan = 0;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
index 1d5dcca..a2cf91f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
@@ -1,7 +1,7 @@
-From dd19a09c7530975d86328c8eaf082626dd1d4fe1 Mon Sep 17 00:00:00 2001
+From 5e1fb3da35cd1e7b3bf1aa1f3384b5d3735c8fa8 Mon Sep 17 00:00:00 2001
 From: Neal Cardwell <ncardwell@google.com>
 Date: Tue, 27 Mar 2012 15:09:37 -0400
-Subject: [PATCH 25/69] nohz: Fix stale jiffies update in tick_nohz_restart()
+Subject: [PATCH 24/68] nohz: Fix stale jiffies update in tick_nohz_restart()
 
 commit 6f103929f8979d2638e58d7f7fda0beefcb8ee7e upstream.
 
@@ -49,5 +49,5 @@ index 4042064..c923640 100644
  }
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-pch_uart-Fix-MSI-setting-issue.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-pch_uart-Fix-MSI-setting-issue.patch
index 3792b6f..b0f9df5 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-pch_uart-Fix-MSI-setting-issue.patch
@@ -1,7 +1,7 @@
-From 701cb5c2dbbe57b09a0585ea3a983540a29106c6 Mon Sep 17 00:00:00 2001
+From 4390c4afeff1688398e91fa58626daa4c476426a Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Mon, 2 Apr 2012 14:36:22 +0900
-Subject: [PATCH 26/69] pch_uart: Fix MSI setting issue
+Subject: [PATCH 25/68] pch_uart: Fix MSI setting issue
 
 commit 867c902e07d5677e2a5b54c0435e589513abde48 upstream.
 
@@ -39,5 +39,5 @@ index d6aba8c..da776a0 100644
  	iobase = pci_resource_start(pdev, 0);
  	mapbase = pci_resource_start(pdev, 1);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-USB-serial-fix-race-between-probe-and-open.patch
similarity index 96%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-USB-serial-fix-race-between-probe-and-open.patch
index 53ef398..60b1ca1 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-USB-serial-fix-race-between-probe-and-open.patch
@@ -1,7 +1,7 @@
-From fe3ac85bc01bebcbfd24255f567c18d0d609661b Mon Sep 17 00:00:00 2001
+From 2c3a918f01cceefb6b25eda48f8703c0f07d316d Mon Sep 17 00:00:00 2001
 From: Johan Hovold <jhovold@gmail.com>
 Date: Tue, 20 Mar 2012 16:59:33 +0100
-Subject: [PATCH 27/69] USB: serial: fix race between probe and open
+Subject: [PATCH 26/68] USB: serial: fix race between probe and open
 
 commit a65a6f14dc24a90bde3f5d0073ba2364476200bf upstream.
 
@@ -93,5 +93,5 @@ index cc274fd..38d7ebd 100644
  
  exit:
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
similarity index 89%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
index 48e31f1..139d5eb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
@@ -1,7 +1,7 @@
-From fa3bc47f28470076336a7f3cfedcf67837224a71 Mon Sep 17 00:00:00 2001
+From 759454c93c1d1532f9a9c76e16741d8b09f3fefd Mon Sep 17 00:00:00 2001
 From: Johan Hovold <jhovold@gmail.com>
 Date: Fri, 23 Mar 2012 15:23:18 +0100
-Subject: [PATCH 28/69] USB: pl2303: fix DTR/RTS being raised on baud rate
+Subject: [PATCH 27/68] USB: pl2303: fix DTR/RTS being raised on baud rate
  change
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -33,5 +33,5 @@ index fc2d66f..5532ea5 100644
  	if (control != priv->line_control) {
  		control = priv->line_control;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
index 17b3947..c3736bb 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
@@ -1,7 +1,7 @@
-From 1b71d0901a340fb7f1acfa39053b5baa7d22b8e5 Mon Sep 17 00:00:00 2001
+From 64b66ecdf795206abc8fe6ed8df7b34f581fb4cc Mon Sep 17 00:00:00 2001
 From: Santiago Garcia Mantinan <manty@debian.org>
 Date: Mon, 19 Mar 2012 18:17:00 +0100
-Subject: [PATCH 29/69] USB: option: re-add
+Subject: [PATCH 28/68] USB: option: re-add
  NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED to option_id
  array
 
@@ -28,5 +28,5 @@ index 54898c9..cbe3451 100644
  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED4) },
  	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED5) },
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
index 9681068..55a36f8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
@@ -1,7 +1,7 @@
-From f3a53ff9baee1e730f4332eccf3d5feb3245e7a9 Mon Sep 17 00:00:00 2001
+From 8c15eaa2462cd32b7e2aebf64e4692ed6f6bd775 Mon Sep 17 00:00:00 2001
 From: Simon Arlott <simon@fire.lp0.eu>
 Date: Mon, 26 Mar 2012 21:19:40 +0100
-Subject: [PATCH 30/69] USB: ftdi_sio: fix status line change handling for
+Subject: [PATCH 29/68] USB: ftdi_sio: fix status line change handling for
  TIOCMIWAIT and TIOCGICOUNT
 
 commit fca5430d48d53eaf103498c33fd0d1984b9f448b upstream.
@@ -75,5 +75,5 @@ index f2c9ef7..cfc8e59 100644
  	}
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
similarity index 96%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
index 189b598..1f825a8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
@@ -1,7 +1,7 @@
-From 9290ee7d767163efb842c578e20c74164dddb350 Mon Sep 17 00:00:00 2001
+From 7a6e307dd338f12c1a9ece87fdd962f48b5a56a7 Mon Sep 17 00:00:00 2001
 From: Simon Arlott <simon@fire.lp0.eu>
 Date: Mon, 26 Mar 2012 23:27:59 +0100
-Subject: [PATCH 31/69] USB: ftdi_sio: fix race condition in TIOCMIWAIT, and
+Subject: [PATCH 30/68] USB: ftdi_sio: fix race condition in TIOCMIWAIT, and
  abort of TIOCMIWAIT when the device is removed
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
@@ -107,5 +107,5 @@ index cfc8e59..c4cf3f3 100644
  	case TIOCSERGETLSR:
  		return get_lsr_info(port, (struct serial_struct __user *)arg);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
similarity index 88%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
index b13cff3..9de7930 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
@@ -1,7 +1,7 @@
-From fa17e1b79bef42fa178918e05b7a38d69caa13d7 Mon Sep 17 00:00:00 2001
+From 6f304009cc2e6546ded2d677953ad5e43c8dce88 Mon Sep 17 00:00:00 2001
 From: Anton Samokhvalov <pg83@yandex.ru>
 Date: Wed, 4 Apr 2012 22:26:01 +0400
-Subject: [PATCH 32/69] USB: sierra: add support for Sierra Wireless MC7710
+Subject: [PATCH 31/68] USB: sierra: add support for Sierra Wireless MC7710
 
 commit c5d703dcc776cb542b41665f2b7e2ba054efb4a7 upstream.
 
@@ -26,5 +26,5 @@ index b18179b..7c3ec9e 100644
  	{ USB_DEVICE_AND_INTERFACE_INFO(0x1199, 0x6880, 0xFF, 0xFF, 0xFF)},
  	/* Sierra Wireless C888, Air Card 501, USB 303, USB 304 */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
index 9ff10f9..02e6915 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
@@ -1,7 +1,7 @@
-From cd107339d3370b39dcaafd354a0c658b207dcaf0 Mon Sep 17 00:00:00 2001
+From aa2fe95f433d360d0625752971b99e30ecde56bf Mon Sep 17 00:00:00 2001
 From: Alan Stern <stern@rowland.harvard.edu>
 Date: Thu, 22 Mar 2012 11:00:21 -0400
-Subject: [PATCH 33/69] USB: don't clear urb->dev in scatter-gather library
+Subject: [PATCH 32/68] USB: don't clear urb->dev in scatter-gather library
 
 commit bcf398537630bf20b4dbe59ba855b69f404c93cf upstream.
 
@@ -81,5 +81,5 @@ index b3bdfed..aed3e07 100644
  					__func__, retval);
  		}
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
index 019927d..0d9190f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
@@ -1,7 +1,7 @@
-From 2bfec5e16aa5c74b8c5934059f3e32595ef95214 Mon Sep 17 00:00:00 2001
+From 76cec389c13edcc348d13a0efc7351752c3f71e3 Mon Sep 17 00:00:00 2001
 From: Alan Stern <stern@rowland.harvard.edu>
 Date: Wed, 28 Mar 2012 15:56:17 -0400
-Subject: [PATCH 34/69] USB: don't ignore suspend errors for root hubs
+Subject: [PATCH 33/68] USB: don't ignore suspend errors for root hubs
 
 commit cd4376e23a59a2adf3084cb5f4a523e6d5fd4e49 upstream.
 
@@ -50,5 +50,5 @@ index 45887a0..c77f0d6 100644
  	}
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-xhci-don-t-re-enable-IE-constantly.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-xhci-don-t-re-enable-IE-constantly.patch
index 0643790..590fa5b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-xhci-don-t-re-enable-IE-constantly.patch
@@ -1,7 +1,7 @@
-From 36e9ddc88d64edf5a78006753b3ec306384008d7 Mon Sep 17 00:00:00 2001
+From 4baf16baa7693c3ef1083347dfc02d92050ee34b Mon Sep 17 00:00:00 2001
 From: Felipe Balbi <balbi@ti.com>
 Date: Thu, 15 Mar 2012 16:37:08 +0200
-Subject: [PATCH 35/69] xhci: don't re-enable IE constantly
+Subject: [PATCH 34/68] xhci: don't re-enable IE constantly
 
 commit 4e833c0b87a30798e67f06120cecebef6ee9644c upstream.
 
@@ -54,5 +54,5 @@ index 09eda3a..4850c4d 100644
  /* HC not running - set to 1 when run/stop bit is cleared. */
  #define STS_HALT	XHCI_STS_HALT
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
index 9eb5447..47e7b05 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
@@ -1,7 +1,7 @@
-From f8d0987af5d135d8eb54e7b525e985328f0e8bd5 Mon Sep 17 00:00:00 2001
+From eefbd6d2849f7b6a48865e9946d80f2d08fbda44 Mon Sep 17 00:00:00 2001
 From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
 Date: Fri, 16 Mar 2012 13:09:39 -0700
-Subject: [PATCH 36/69] xhci: Don't write zeroed pointers to xHC registers.
+Subject: [PATCH 35/68] xhci: Don't write zeroed pointers to xHC registers.
 
 commit 159e1fcc9a60fc7daba23ee8fcdb99799de3fe84 upstream.
 
@@ -74,5 +74,5 @@ index c69cf54..01c3800 100644
  	return -ENOMEM;
  }
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
index cadc929..3b16ebd 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
@@ -1,7 +1,7 @@
-From 375a67105a521c7ae75a529509218c4bda02c612 Mon Sep 17 00:00:00 2001
+From f8f150a7dd5f865281c14bff1e2260ecc60e9f3f Mon Sep 17 00:00:00 2001
 From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
 Date: Fri, 16 Mar 2012 13:27:39 -0700
-Subject: [PATCH 37/69] xhci: Restore event ring dequeue pointer on resume.
+Subject: [PATCH 36/68] xhci: Restore event ring dequeue pointer on resume.
 
 commit fb3d85bc7193f23c9a564502df95564c49a32c91 upstream.
 
@@ -35,5 +35,5 @@ index 034f554..4d44713 100644
  
  static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
index a48a25d..6e94e7b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
@@ -1,7 +1,7 @@
-From 75b1fa981bf0fcddcc4a6c8916d6995a273dcfad Mon Sep 17 00:00:00 2001
+From 0060609ba317d6efd3584b4f0ad260944049dc69 Mon Sep 17 00:00:00 2001
 From: Elric Fu <elricfu1@gmail.com>
 Date: Mon, 26 Mar 2012 21:16:02 +0800
-Subject: [PATCH 38/69] USB: fix bug of device descriptor got from superspeed
+Subject: [PATCH 37/68] USB: fix bug of device descriptor got from superspeed
  device
 
 commit d8aec3dbdfd02627e198e7956ab4aaeba2a349fa upstream.
@@ -69,5 +69,5 @@ index f982eeb..18373ec 100644
  			udev->speed == USB_SPEED_SUPER)
  		i = 512;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
index 9229f08..0e54897 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
@@ -1,7 +1,7 @@
-From f9cce3fb45a90fffc8d2bb59a65ebdbfc881d5a8 Mon Sep 17 00:00:00 2001
+From 8f4c9c4038bbc8e334790983712c1492e292d7f2 Mon Sep 17 00:00:00 2001
 From: Elric Fu <elricfu1@gmail.com>
 Date: Thu, 29 Mar 2012 15:47:50 +0800
-Subject: [PATCH 39/69] xHCI: add XHCI_RESET_ON_RESUME quirk for VIA xHCI host
+Subject: [PATCH 38/68] xHCI: add XHCI_RESET_ON_RESUME quirk for VIA xHCI host
 
 commit 457a4f61f9bfc3ae76e5b49f30f25d86bb696f67 upstream.
 
@@ -39,5 +39,5 @@ index ef98b38..211296a 100644
  
  /* called during probe() after chip reset completes */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
index 5a3f5bc..b184894 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
@@ -1,7 +1,7 @@
-From 84ff902a342b34de5c637eccde339aa7bd644c2b Mon Sep 17 00:00:00 2001
+From f7dd4f23cd64f64dbed76c7cca31533f3ed11037 Mon Sep 17 00:00:00 2001
 From: Alex He <alex.he@amd.com>
 Date: Fri, 30 Mar 2012 10:21:38 +0800
-Subject: [PATCH 40/69] xHCI: Correct the #define XHCI_LEGACY_DISABLE_SMI
+Subject: [PATCH 39/68] xHCI: Correct the #define XHCI_LEGACY_DISABLE_SMI
 
 commit 95018a53f7653e791bba1f54c8d75d9cb700d1bd upstream.
 
@@ -57,5 +57,5 @@ index c7f3312..377f424 100644
  /* USB 2.0 xHCI 0.96 L1C capability - section 7.2.2.1.3.2 */
  #define XHCI_L1C               (1 << 16)
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-fix-tlb-flushing-for-page-table-pages.patch
similarity index 98%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-fix-tlb-flushing-for-page-table-pages.patch
index 350e9d7..1a6e44c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-fix-tlb-flushing-for-page-table-pages.patch
@@ -1,7 +1,7 @@
-From 0110a55b4db1e1f84f4980aef2528e2cfe6875af Mon Sep 17 00:00:00 2001
+From d0cba3dd900c1420176693c3f10ec11ada4553af Mon Sep 17 00:00:00 2001
 From: Martin Schwidefsky <schwidefsky@de.ibm.com>
 Date: Wed, 11 Apr 2012 14:28:07 +0200
-Subject: [PATCH 41/69] fix tlb flushing for page table pages
+Subject: [PATCH 40/68] fix tlb flushing for page table pages
 
 commit cd94154cc6a28dd9dc271042c1a59c08d26da886 upstream.
 
@@ -236,5 +236,5 @@ index 301c84d..f8ceac4 100644
  /*
   * switch on pgstes for its userspace process (for kvm)
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-serial-PL011-clear-pending-interrupts.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-serial-PL011-clear-pending-interrupts.patch
index ecece35..3b17d2c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-serial-PL011-clear-pending-interrupts.patch
@@ -1,7 +1,7 @@
-From 6408483ea69660e6ad8a2a8852edb9cd539cd51d Mon Sep 17 00:00:00 2001
+From 83b1f68d0e0fdc6993be1ebf4ef51a439b71180f Mon Sep 17 00:00:00 2001
 From: Linus Walleij <linus.walleij@linaro.org>
 Date: Tue, 13 Mar 2012 13:27:23 +0100
-Subject: [PATCH 42/69] serial: PL011: clear pending interrupts
+Subject: [PATCH 41/68] serial: PL011: clear pending interrupts
 
 commit 9b96fbacda34079dea0638ee1e92c56286f6114a upstream.
 
@@ -78,5 +78,5 @@ index 8e00926..dddc3f2 100644
  	uap->lcrh_rx = vendor->lcrh_rx;
  	uap->lcrh_tx = vendor->lcrh_tx;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-move-interrupt-clearing.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-move-interrupt-clearing.patch
index bc47af0..8ecc1bd 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-move-interrupt-clearing.patch
@@ -1,7 +1,7 @@
-From 02822f5ea52d9c9c4d197187b1a2553fe70f106c Mon Sep 17 00:00:00 2001
+From 39f2e7d1ec34222f7e7262c87425b18964d16b25 Mon Sep 17 00:00:00 2001
 From: Linus Walleij <linus.walleij@linaro.org>
 Date: Wed, 21 Mar 2012 20:15:18 +0100
-Subject: [PATCH 43/69] serial: PL011: move interrupt clearing
+Subject: [PATCH 42/68] serial: PL011: move interrupt clearing
 
 commit c3d8b76f61586714cdc5f219ba45592a54caaa55 upstream.
 
@@ -51,5 +51,5 @@ index dddc3f2..6da8cf8 100644
  
  	amba_ports[i] = uap;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
index b2e4de6..3901682 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
@@ -1,7 +1,7 @@
-From 0acc120610478e7f4b80e0d1379bd927c90eaff4 Mon Sep 17 00:00:00 2001
+From 131deceebcd7239f193e6f9fef1fe30df267e1c4 Mon Sep 17 00:00:00 2001
 From: Eric Paris <eparis@redhat.com>
 Date: Tue, 17 Apr 2012 16:26:54 -0400
-Subject: [PATCH 44/69] fcaps: clear the same personality flags as suid when
+Subject: [PATCH 43/68] fcaps: clear the same personality flags as suid when
  fcaps are used
 
 commit d52fc5dde171f030170a6cb78034d166b13c9445 upstream.
@@ -37,5 +37,5 @@ index ee4f848..0aee106 100644
  	 * credentials unless they have the appropriate permit
  	 */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-ath9k-fix-max-noise-floor-threshold.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-ath9k-fix-max-noise-floor-threshold.patch
index 618a68a..2fde047 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-ath9k-fix-max-noise-floor-threshold.patch
@@ -1,7 +1,7 @@
-From ffdc1eb0a3c60111912b7bfe80c3a9358edd6b42 Mon Sep 17 00:00:00 2001
+From dd47cb2da9c6045068d6677d27b4a8acffa9d1a6 Mon Sep 17 00:00:00 2001
 From: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
 Date: Thu, 15 Mar 2012 06:08:04 +0530
-Subject: [PATCH 45/69] ath9k: fix max noise floor threshold
+Subject: [PATCH 44/68] ath9k: fix max noise floor threshold
 
 commit 2ee0a07028d2cde6e131b73f029dae2b93c50f3a upstream.
 
@@ -52,5 +52,5 @@ index 8ddef3e..d771de5 100644
  		} else if (nf[i] < limit->min) {
  			ath_dbg(common, ATH_DBG_CALIBRATE,
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-xhci-Fix-register-save-restore-order.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-xhci-Fix-register-save-restore-order.patch
index 2fe2c5e..b7de663 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-xhci-Fix-register-save-restore-order.patch
@@ -1,7 +1,7 @@
-From d4e6ce02459552a127973c9c204509136b940671 Mon Sep 17 00:00:00 2001
+From 5d1eb145d8bd522d7e6fbbd0ee566417535f5291 Mon Sep 17 00:00:00 2001
 From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
 Date: Fri, 16 Mar 2012 13:19:35 -0700
-Subject: [PATCH 46/69] xhci: Fix register save/restore order.
+Subject: [PATCH 45/68] xhci: Fix register save/restore order.
 
 commit c7713e736526d8c9f6f87716fb90562a8ffaff2c upstream.
 
@@ -58,5 +58,5 @@ index 4d44713..4c00606 100644
  
  static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
index 4e3ff35..5d271e9 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
@@ -1,7 +1,7 @@
-From 1eb32b0dc5c5286345e96240894af14de856e515 Mon Sep 17 00:00:00 2001
+From 5cfa510424e3901b81a0dd9579d078b56f5bca05 Mon Sep 17 00:00:00 2001
 From: Johan Hovold <jhovold@gmail.com>
 Date: Thu, 15 Mar 2012 14:48:41 +0100
-Subject: [PATCH 47/69] Bluetooth: hci_core: fix NULL-pointer dereference at
+Subject: [PATCH 46/68] Bluetooth: hci_core: fix NULL-pointer dereference at
  unregister
 
 commit 94324962066231a938564bebad0f941cd2d06bb2 upstream.
@@ -129,5 +129,5 @@ index b84458d..857dc88 100644
  	list_del(&hdev->list);
  	write_unlock_bh(&hci_dev_list_lock);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
index 1f78b92..68cfa64 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
@@ -1,7 +1,7 @@
-From 02f5e653d3083265e70a5cc00f050b6ec394fb83 Mon Sep 17 00:00:00 2001
+From d1d630c1d03f1b6c860fb0f7019aad8df08f4511 Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
 Date: Fri, 28 Oct 2011 09:23:32 +0900
-Subject: [PATCH 48/69] pch_gpio: Support new device LAPIS Semiconductor
+Subject: [PATCH 47/68] pch_gpio: Support new device LAPIS Semiconductor
  ML7831 IOH
 
 commit 868fea0507308b6548bba7debe5f5c2d5ca47fca upstream.
@@ -59,5 +59,5 @@ index a6008e1..eb574f2 100644
  };
  MODULE_DEVICE_TABLE(pci, pch_gpio_pcidev_id);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
similarity index 88%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
index 23824a7..f3d980f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
@@ -1,7 +1,7 @@
-From 9fb55b40aa4e085f86bfce237a482b13847fdc01 Mon Sep 17 00:00:00 2001
+From d318ceeea315d2005b914345b86e62c43a6f37b8 Mon Sep 17 00:00:00 2001
 From: Axel Lin <axel.lin@gmail.com>
 Date: Wed, 1 Feb 2012 10:51:53 +0800
-Subject: [PATCH 49/69] gpio: Add missing spin_lock_init in gpio-pch driver
+Subject: [PATCH 48/68] gpio: Add missing spin_lock_init in gpio-pch driver
 
 commit d166370ad86b33b1111af3a0cdd7de94e03789a6 upstream.
 
@@ -31,5 +31,5 @@ index eb574f2..779ff70 100644
  	ret = gpiochip_add(&chip->gpio);
  	if (ret) {
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-usb-gadget-pch_udc-Fix-disconnect-issue.patch
similarity index 89%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-usb-gadget-pch_udc-Fix-disconnect-issue.patch
index 6588e3c..a594419 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-usb-gadget-pch_udc-Fix-disconnect-issue.patch
@@ -1,7 +1,7 @@
-From 51d31aff64b1ebc13cab146aea7e34e0b9deec9a Mon Sep 17 00:00:00 2001
+From 71f57b2818d96219c94e582efd23fc0d16186424 Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Thu, 12 Jan 2012 11:27:05 +0900
-Subject: [PATCH 50/69] usb: gadget: pch_udc: Fix disconnect issue
+Subject: [PATCH 49/68] usb: gadget: pch_udc: Fix disconnect issue
 
 commit c50a3bff0edb0acd49d8033a12ea4668e09a31ad upstream.
 
@@ -38,5 +38,5 @@ index dd2313c..521e995 100644
  
  /**
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-wrong-return-value.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-wrong-return-value.patch
index decab7b..7f86508 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-wrong-return-value.patch
@@ -1,7 +1,7 @@
-From 8fd36443bed52de1ac27dade568e7a3d94158d13 Mon Sep 17 00:00:00 2001
+From f081bd91f871a44ac4bf6035aaacfd666024b30a Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Thu, 12 Jan 2012 11:27:06 +0900
-Subject: [PATCH 51/69] usb: gadget: pch_udc: Fix wrong return value
+Subject: [PATCH 50/68] usb: gadget: pch_udc: Fix wrong return value
 
 commit c802672cd36cd063bfd54d54c8c34825ab5b2357 upstream.
 
@@ -38,5 +38,5 @@ index 521e995..a9a7d8a 100644
  			dev)) {
  		dev_err(&pdev->dev, "%s: request_irq(%d) fail\n", __func__,
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
index fda0ca9..52ae325 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
@@ -1,7 +1,7 @@
-From c0aaf320ddf17688ad75ab9f024f789b4cb89365 Mon Sep 17 00:00:00 2001
+From d99b719a9a857340a246bfd51b329ba5bc09a7ea Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Thu, 12 Jan 2012 11:27:07 +0900
-Subject: [PATCH 52/69] usb: gadget: pch_udc: Fix USB suspend issue
+Subject: [PATCH 51/68] usb: gadget: pch_udc: Fix USB suspend issue
 
 commit 84566abba058b2aae8d603dfa90b5a3778a6714f upstream.
 
@@ -41,5 +41,5 @@ index a9a7d8a..3ab799c 100644
  	if (dev_intr & UDC_DEVINT_SOF)
  		dev_dbg(&dev->pdev->dev, "SOF\n");
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
index 379b748..061b331 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
@@ -1,7 +1,7 @@
-From 9200ef1704e7415a883be5ff751f486da1df7212 Mon Sep 17 00:00:00 2001
+From f6fb5ed067a0dc147a7ffe713ad3cffbcf7733b9 Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Thu, 12 Jan 2012 11:27:08 +0900
-Subject: [PATCH 53/69] usb: gadget: pch_udc: Fix usb/gadget/pch_udc: Fix
+Subject: [PATCH 52/68] usb: gadget: pch_udc: Fix usb/gadget/pch_udc: Fix
  ether gadget connect/disconnect issue
 
 commit 1c575d2d2e3ff2a7cb3c2e2165064199cfd8ad32 upstream.
@@ -149,5 +149,5 @@ index 3ab799c..f232e65 100644
  		/* Clear device interrupts */
  		pch_udc_write_device_interrupts(dev, dev_intr);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
index 3322abf..681f166 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
@@ -1,7 +1,7 @@
-From 841c06ccc583055a42b0546efb5e6b448f26d5fd Mon Sep 17 00:00:00 2001
+From e7a01f05195272844be9a3e9abae0d18086cbc69 Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Thu, 12 Jan 2012 11:27:09 +0900
-Subject: [PATCH 54/69] usb: gadget: pch_udc: Reduce redundant interrupt
+Subject: [PATCH 53/68] usb: gadget: pch_udc: Reduce redundant interrupt
 
 commit 833310402c54ad9b676b465fc53ad276b13d36be upstream.
 
@@ -51,5 +51,5 @@ index f232e65..870897ac 100644
  
  /**
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
index 996c5fd..bcc8661 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
@@ -1,7 +1,7 @@
-From 0584e8b8127ffeb0de3d56313113727fab87aff5 Mon Sep 17 00:00:00 2001
+From 5326c71bbfb0de3fef65c9f702ffdb8589e8e6df Mon Sep 17 00:00:00 2001
 From: Lin Ming <ming.m.lin@intel.com>
 Date: Mon, 28 Nov 2011 09:46:02 +0800
-Subject: [PATCH 55/69] ACPICA: Fix to allow region arguments to reference
+Subject: [PATCH 54/68] ACPICA: Fix to allow region arguments to reference
  other scopes
 
 commit 8931d9ea78848b073bf299594f148b83abde4a5e upstream.
@@ -78,5 +78,5 @@ index 110711a..8a06dc5 100644
  	/* Init the region from the operands */
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-security-fix-compile-error-in-commoncap.c.patch
similarity index 89%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-security-fix-compile-error-in-commoncap.c.patch
index e40edbe..cc78b79 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-security-fix-compile-error-in-commoncap.c.patch
@@ -1,7 +1,7 @@
-From c44baf116ced749a5017ab4f36a808c4aad7c39c Mon Sep 17 00:00:00 2001
+From 1a4f70eea080bfa569723eb1c16ca46956cebd25 Mon Sep 17 00:00:00 2001
 From: Jonghwan Choi <jhbird.choi@samsung.com>
 Date: Wed, 18 Apr 2012 17:23:04 -0400
-Subject: [PATCH 56/69] security: fix compile error in commoncap.c
+Subject: [PATCH 55/68] security: fix compile error in commoncap.c
 
 commit 51b79bee627d526199b2f6a6bef8ee0c0739b6d1 upstream.
 
@@ -33,5 +33,5 @@ index 0aee106..12440ee 100644
  /*
   * If a non-root user executes a setuid-root binary in
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
similarity index 93%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
index 0b69021..2759af4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
@@ -1,7 +1,7 @@
-From 56bfb17ce9aba57b7bd205d7828d4f3d9935276e Mon Sep 17 00:00:00 2001
+From aebee39c4e129dbeccd9485f8375b7e59a4b7b26 Mon Sep 17 00:00:00 2001
 From: Darren Hart <dvhart@linux.intel.com>
 Date: Mon, 16 Jan 2012 09:50:19 +0000
-Subject: [PATCH 57/69] pch_gbe: Do not abort probe on bad MAC
+Subject: [PATCH 56/68] pch_gbe: Do not abort probe on bad MAC
 
 commit 2b53d07891630dead46d65c8f896955fd3ae0302 upstream.
 
@@ -38,7 +38,7 @@ Signed-off-by: David S. Miller <davem@davemloft.net>
 Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 ---
- .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |   17 ++++++++++++++---
+ drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c |   17 ++++++++++++++---
  1 file changed, 14 insertions(+), 3 deletions(-)
 
 diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
@@ -77,5 +77,5 @@ index 48406ca..43c7b25 100644
  	setup_timer(&adapter->watchdog_timer, pch_gbe_watchdog,
  		    (unsigned long)adapter);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
similarity index 89%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
index 1c4d0da..07cc85b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
@@ -1,7 +1,7 @@
-From aa636350865960bf05da0427e6129a09787b9a8e Mon Sep 17 00:00:00 2001
+From 39ac4e9f39a308616c42f055e6eb61883171826c Mon Sep 17 00:00:00 2001
 From: Dan Carpenter <dan.carpenter@oracle.com>
 Date: Wed, 29 Feb 2012 21:17:08 +0000
-Subject: [PATCH 58/69] pch_gbe: memory corruption calling
+Subject: [PATCH 57/68] pch_gbe: memory corruption calling
  pch_gbe_validate_option()
 
 commit 73f98eab9b9e0bab492ca06add5657d9e702ddb1 upstream.
@@ -15,7 +15,7 @@ Signed-off-by: David S. Miller <davem@davemloft.net>
 Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 ---
- .../net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c  |   15 ++++++++-------
+ drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c |   15 ++++++++-------
  1 file changed, 8 insertions(+), 7 deletions(-)
 
 diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c
@@ -52,5 +52,5 @@ index 9cb5f91..29e23be 100644
  
  	pch_gbe_check_copper_options(adapter);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
index dd77d52..dbf592c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
@@ -1,7 +1,7 @@
-From b9ec954fcea6867cd78e33f003ce6c11a8c1b217 Mon Sep 17 00:00:00 2001
+From 0e69eca9d7e396d17ee6350491cb53b68b11f18a Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
 Date: Thu, 17 Nov 2011 16:14:23 +0900
-Subject: [PATCH 59/69] pch_dma: Support new device LAPIS Semiconductor ML7831
+Subject: [PATCH 58/68] pch_dma: Support new device LAPIS Semiconductor ML7831
  IOH
 
 commit ca7fe2db892dcf91b2c72ee352eda4ff867903a7 upstream.
@@ -78,5 +78,5 @@ index a6d0e3d..629c430 100644
  MODULE_AUTHOR("Yong Wang <yong.y.wang@intel.com>");
  MODULE_LICENSE("GPL v2");
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-spi-topcliff-pch-fix-Wuninitialized-warning.patch
similarity index 95%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-spi-topcliff-pch-fix-Wuninitialized-warning.patch
index 9b5bc86..fe20c45 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-spi-topcliff-pch-fix-Wuninitialized-warning.patch
@@ -1,7 +1,7 @@
-From 799b889232ef93a544b5b580bc8fb1178c27adbe Mon Sep 17 00:00:00 2001
+From 82a52f9ef76f612159cc947961ce36687ab1d58e Mon Sep 17 00:00:00 2001
 From: Danny Kukawka <danny.kukawka@bisect.de>
 Date: Tue, 14 Feb 2012 15:35:03 +0100
-Subject: [PATCH 60/69] spi-topcliff-pch: fix -Wuninitialized warning
+Subject: [PATCH 59/68] spi-topcliff-pch: fix -Wuninitialized warning
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -78,5 +78,5 @@ index 027b6d0..ec50541 100644
  	}
  }
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
index 0bef575..2014e74 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
@@ -1,7 +1,7 @@
-From 77fac631e9296a678208e031ca3b47a644a64bb8 Mon Sep 17 00:00:00 2001
+From 743c46c92827cc3cd7bd1fa7b0e9e7ca84e7463a Mon Sep 17 00:00:00 2001
 From: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
 Date: Fri, 28 Oct 2011 09:35:21 +0900
-Subject: [PATCH 61/69] spi-topcliff-pch: Support new device LAPIS
+Subject: [PATCH 60/68] spi-topcliff-pch: Support new device LAPIS
  Semiconductor ML7831 IOH
 
 commit 92b3a5c1bc3c7da1ae4675d014124f4a97ddb632 upstream.
@@ -72,5 +72,5 @@ index ec50541..54b9d2e 100644
  };
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
similarity index 94%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
index 471914c..53132fc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
@@ -1,7 +1,7 @@
-From efa82e03e24743425f4cb3d3632f29756b70d5b5 Mon Sep 17 00:00:00 2001
+From 3100f55ea5eeb7e5c2c03ccf26fffdbcaa29dae7 Mon Sep 17 00:00:00 2001
 From: Eran <eran@over-here.org>
 Date: Mon, 5 Dec 2011 22:15:29 +0000
-Subject: [PATCH 62/69] Bluetooth: Adding USB device 13d3:3375 as an Atheros
+Subject: [PATCH 61/68] Bluetooth: Adding USB device 13d3:3375 as an Atheros
  AR3012.
 
 commit 9498ba7a1d38d42eef4ef6d906ab1743c9f0fd6f upstream.
@@ -63,5 +63,5 @@ index c16c750..df0331a 100644
  	/* Atheros AR5BBU12 with sflash firmware */
  	{ USB_DEVICE(0x0489, 0xe02c), .driver_info = BTUSB_IGNORE },
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
index 4ae57d9..2fd5762 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
@@ -1,7 +1,7 @@
-From cf0a0312929eb18f55e95db15f2129fd28a0adb3 Mon Sep 17 00:00:00 2001
+From 44d3b492e84ea02e1edd019490f1eeb39c9ab3e6 Mon Sep 17 00:00:00 2001
 From: "Cho, Yu-Chen" <acho@suse.com>
 Date: Wed, 14 Mar 2012 22:01:21 +0200
-Subject: [PATCH 63/69] Bluetooth: Add Atheros maryann PIDVID support
+Subject: [PATCH 62/68] Bluetooth: Add Atheros maryann PIDVID support
 
 commit 07c0ea874d43c299d185948452945a361052b6e3 upstream.
 
@@ -115,5 +115,5 @@ index df0331a..5a87b2e 100644
  
  	/* Atheros AR5BBU12 with sflash firmware */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
similarity index 91%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
index 85b6c13..cb6c36c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
@@ -1,7 +1,7 @@
-From 876f46c3f8fe8b612d1892941785c52c3f1d0012 Mon Sep 17 00:00:00 2001
+From 8931ca8a3317ab71c85168b05664efa171563f59 Mon Sep 17 00:00:00 2001
 From: Jesse Sung <jesse.sung@canonical.com>
 Date: Thu, 22 Dec 2011 10:48:47 +0800
-Subject: [PATCH 64/69] Bluetooth: Add support for BCM20702A0 [0a5c:21e3]
+Subject: [PATCH 63/68] Bluetooth: Add support for BCM20702A0 [0a5c:21e3]
 
 commit c0190925dacd976a67044f4382d4effbed568dce upstream.
 
@@ -41,5 +41,5 @@ index 5a87b2e..db44ad5 100644
  
  	{ }	/* Terminating entry */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
similarity index 97%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
index d39ffb4..0d9c410 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
@@ -1,7 +1,7 @@
-From 39bc94c8c5909dc1047dad45c14ba96ff54e5654 Mon Sep 17 00:00:00 2001
+From 7480d9953ded1b970bb05c7585e2a08001ae8565 Mon Sep 17 00:00:00 2001
 From: Kees Cook <keescook@chromium.org>
 Date: Mon, 19 Mar 2012 16:12:53 -0700
-Subject: [PATCH 65/69] futex: Do not leak robust list to unprivileged process
+Subject: [PATCH 64/68] futex: Do not leak robust list to unprivileged process
 
 commit bdbb776f882f5ad431aa1e694c69c1c3d6a4a5b8 upstream.
 
@@ -166,5 +166,5 @@ index 5f9e689..a9642d5 100644
  		return -EFAULT;
  	return put_user(ptr_to_compat(head), head_ptr);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
index 78e16f8..8bbc092 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
@@ -1,7 +1,7 @@
-From 8bfeb0bfde94ba70986c03d0a8ca9ab876073e35 Mon Sep 17 00:00:00 2001
+From 53b833e3b2bc7382175c75d982087cf6b03a3753 Mon Sep 17 00:00:00 2001
 From: Takashi Iwai <tiwai@suse.de>
 Date: Wed, 18 Apr 2012 15:21:07 +0200
-Subject: [PATCH 66/69] drm/radeon/kms: fix the regression of DVI connector
+Subject: [PATCH 65/68] drm/radeon/kms: fix the regression of DVI connector
  check
 
 commit e36325071832f1ba96ac54fb8ba1459f08b05dd8 upstream.
@@ -35,5 +35,5 @@ index f7d39ac..f19ea2e 100644
  				continue;
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-disable-MSI-on-RV515.patch
similarity index 90%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-disable-MSI-on-RV515.patch
index 6bf8650..624a8ab 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-disable-MSI-on-RV515.patch
@@ -1,7 +1,7 @@
-From 0532e1f8a710f011e839ad1ad0d83c6f3a1d2d74 Mon Sep 17 00:00:00 2001
+From 4c47e0570154691338fd2e670109120a8e99184c Mon Sep 17 00:00:00 2001
 From: Dave Airlie <airlied@redhat.com>
 Date: Fri, 13 Apr 2012 11:14:50 +0100
-Subject: [PATCH 67/69] drm/radeon: disable MSI on RV515
+Subject: [PATCH 66/68] drm/radeon: disable MSI on RV515
 
 commit 16a5e32b83fd946312b9b13590c75d20c95c5202 upstream.
 
@@ -33,5 +33,5 @@ index e7ddb49..baa019e 100644
  		/* APUs work fine with MSIs */
  		if (rdev->family >= CHIP_PALM)
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
similarity index 92%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
index ee262ca..d026278 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
@@ -1,7 +1,7 @@
-From 29e2a67065f74d9a1f31a61d4466976551d9bed4 Mon Sep 17 00:00:00 2001
+From cfcbd4d6d2b7604aee1daa122663bbdfa5743fd1 Mon Sep 17 00:00:00 2001
 From: Dave Airlie <airlied@redhat.com>
 Date: Thu, 19 Apr 2012 15:42:58 +0100
-Subject: [PATCH 68/69] drm/radeon: fix load detect on rn50 with hardcoded
+Subject: [PATCH 67/68] drm/radeon: fix load detect on rn50 with hardcoded
  EDIDs.
 
 commit a09d431f344d854e4fe9cfac44f78cb8202f3eb7 upstream.
@@ -42,5 +42,5 @@ index f19ea2e..4a4493f 100644
  	radeon_connector_update_scratch_regs(connector, ret);
  	return ret;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-Linux-3.2.16.patch
similarity index 78%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-Linux-3.2.16.patch
index 261d355..94f1f5f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-Linux-3.2.16.patch
@@ -1,7 +1,7 @@
-From 206e830feaa561615d9ea721a7e4a0f8d3708e81 Mon Sep 17 00:00:00 2001
+From 45902e2bad446ada74fea7c6b467828211e49430 Mon Sep 17 00:00:00 2001
 From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
 Date: Sun, 22 Apr 2012 15:31:32 -0700
-Subject: [PATCH 69/69] Linux 3.2.16
+Subject: [PATCH 68/68] Linux 3.2.16
 
 ---
  Makefile |    2 +-
@@ -20,5 +20,5 @@ index 6195122..3da29cb 100644
  NAME = Saber-toothed Squirrel
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
index 6676539..9045bb6 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch
@@ -1,7 +1,7 @@
-From 0a4a06fdba20b76d03dde619a4dec0e88cdad6c3 Mon Sep 17 00:00:00 2001
+From 4999df64c677cd0a32e87ccea5c1405331576d3d Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 7 Oct 2011 15:29:28 +0200
-Subject: [PATCH 01/26] f_rndis: HACK around undefined variables
+Subject: [PATCH 01/33] f_rndis: HACK around undefined variables
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -27,5 +27,5 @@ index 6614490..d2f1b6f 100644
  	 * the network link ... which is unavailable to this code
  	 * until we're activated via set_alt().
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
index 23b7aaf..9414a32 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch
@@ -1,7 +1,7 @@
-From a89b2d3cdef2af0baa57f31da5e39537d22c247c Mon Sep 17 00:00:00 2001
+From 831a092f5cad298cb9d7d3f2d1a2d08cec82e733 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 3 Nov 2011 17:35:50 +0100
-Subject: [PATCH 02/26] da8xx-fb: add DVI support for beaglebone
+Subject: [PATCH 02/33] da8xx-fb: add DVI support for beaglebone
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -34,5 +34,5 @@ index 2e69278..b01f15b 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
index 4b682c5..c29cfa7 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch
@@ -1,7 +1,7 @@
-From 5b5413023290ed7f79ef3018eeee046c7736d7d0 Mon Sep 17 00:00:00 2001
+From 83111bdeba0ddfd16b409e8c1cacd77a756507c9 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 30 Jan 2012 21:30:09 +0100
-Subject: [PATCH 03/26] beaglebone: rebase everything onto 3.2 - WARNING
+Subject: [PATCH 03/33] beaglebone: rebase everything onto 3.2 - WARNING
  MEGAPATCH
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -10,7 +10,7 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 415 insertions(+), 11 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 70aa3a9..12a269f 100644
+index 563bdf1..2741431 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
 @@ -19,6 +19,7 @@
@@ -28,8 +28,8 @@ index 70aa3a9..12a269f 100644
 -#include <linux/input/ti_tscadc.h>
  #include <linux/reboot.h>
  #include <linux/pwm/pwm.h>
- 
-@@ -172,6 +172,68 @@ struct da8xx_lcdc_platform_data TFC_S9700RTWV35TR_01B_pdata = {
+ #include <linux/opp.h>
+@@ -174,6 +174,68 @@ struct da8xx_lcdc_platform_data TFC_S9700RTWV35TR_01B_pdata = {
  
  #include "common.h"
  
@@ -98,7 +98,7 @@ index 70aa3a9..12a269f 100644
  #include <linux/lis3lv02d.h>
  
  /* TSc controller */
-@@ -340,9 +402,34 @@ static struct am335x_evm_eeprom_config config;
+@@ -342,9 +404,34 @@ static struct am335x_evm_eeprom_config config;
  static struct am335x_eeprom_config1 config1;
  static bool daughter_brd_detected;
  
@@ -133,7 +133,7 @@ index 70aa3a9..12a269f 100644
  static unsigned int gp_evm_revision = GP_EVM_REV_IS_UNKNOWN;
  
  unsigned int gigabit_enable = 1;
-@@ -425,11 +512,102 @@ static struct pinmux_config lcdc_pin_mux[] = {
+@@ -427,11 +514,102 @@ static struct pinmux_config lcdc_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -236,7 +236,7 @@ index 70aa3a9..12a269f 100644
  	{"vrefp.vrefp",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{"vrefn.vrefn",         OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{NULL, 0},
-@@ -564,9 +742,9 @@ static struct pinmux_config i2c1_pin_mux[] = {
+@@ -566,9 +744,9 @@ static struct pinmux_config i2c1_pin_mux[] = {
  
  static struct pinmux_config i2c2_pin_mux[] = {
  	{"uart1_ctsn.i2c2_sda",    OMAP_MUX_MODE3 | AM33XX_SLEWCTRL_SLOW |
@@ -248,7 +248,7 @@ index 70aa3a9..12a269f 100644
  	{NULL, 0},
  };
  
-@@ -844,6 +1022,64 @@ static struct pinmux_config profibus_pin_mux[] = {
+@@ -846,6 +1024,64 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -313,7 +313,7 @@ index 70aa3a9..12a269f 100644
  /* Module pin mux for eCAP0 */
  static struct pinmux_config ecap0_pin_mux[] = {
  	{"ecap0_in_pwm0_out.ecap0_in_pwm0_out",
-@@ -966,6 +1202,51 @@ static void lcdc_init(int evm_id, int profile)
+@@ -968,6 +1204,51 @@ static void lcdc_init(int evm_id, int profile)
  	return;
  }
  
@@ -365,7 +365,7 @@ index 70aa3a9..12a269f 100644
  static void tsc_init(int evm_id, int profile)
  {
  	int err;
-@@ -973,10 +1254,15 @@ static void tsc_init(int evm_id, int profile)
+@@ -975,10 +1256,15 @@ static void tsc_init(int evm_id, int profile)
  	if (gp_evm_revision == GP_EVM_REV_IS_1_1A) {
  		am335x_touchscreen_data.analog_input = 1;
  		pr_info("TSC connected to beta GP EVM\n");
@@ -382,7 +382,7 @@ index 70aa3a9..12a269f 100644
  	setup_pin_mux(tsc_pin_mux);
  
  	err = am33xx_register_tsc(&am335x_touchscreen_data);
-@@ -984,6 +1270,33 @@ static void tsc_init(int evm_id, int profile)
+@@ -986,6 +1272,33 @@ static void tsc_init(int evm_id, int profile)
  		pr_err("failed to register touchscreen device\n");
  }
  
@@ -416,7 +416,7 @@ index 70aa3a9..12a269f 100644
  static void rgmii1_init(int evm_id, int profile)
  {
  	setup_pin_mux(rgmii1_pin_mux);
-@@ -1429,18 +1742,106 @@ static void i2c1_init(int evm_id, int profile)
+@@ -1431,18 +1744,106 @@ static void i2c1_init(int evm_id, int profile)
  	return;
  }
  
@@ -528,7 +528,7 @@ index 70aa3a9..12a269f 100644
  /* Setup McASP 1 */
  static void mcasp1_init(int evm_id, int profile)
  {
-@@ -1794,8 +2195,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -1826,8 +2227,9 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{rmii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
@@ -539,7 +539,7 @@ index 70aa3a9..12a269f 100644
  	{NULL, 0, 0},
  };
  
-@@ -1805,8 +2207,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -1837,8 +2239,9 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{mii1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{usb1_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
@@ -550,7 +550,7 @@ index 70aa3a9..12a269f 100644
  	{NULL, 0, 0},
  };
  
-@@ -1893,6 +2296,7 @@ static void setup_beaglebone_old(void)
+@@ -1925,6 +2328,7 @@ static void setup_beaglebone_old(void)
  static void setup_beaglebone(void)
  {
  	pr_info("The board is a AM335x Beaglebone.\n");
@@ -559,5 +559,5 @@ index 70aa3a9..12a269f 100644
  	/* Beagle Bone has Micro-SD slot which doesn't have Write Protect pin */
  	am335x_mmc[0].gpio_wp = -EINVAL;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
index e8ef8ee..3b4b05c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0004-more-beaglebone-merges.patch
@@ -1,7 +1,7 @@
-From f5d99c334bedef5b0213118590ea2ad7dbc2e29a Mon Sep 17 00:00:00 2001
+From fda651d1a17eba23bae75e22a811a9f45c96da16 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:04:03 +0100
-Subject: [PATCH 04/26] more beaglebone merges
+Subject: [PATCH 04/33] more beaglebone merges
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 50 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 12a269f..3c67e94 100644
+index 2741431..ffbecae 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -240,6 +240,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
+@@ -242,6 +242,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
  static struct tsc_data am335x_touchscreen_data  = {
  	.wires  = 4,
  	.x_plate_resistance = 200,
@@ -24,7 +24,7 @@ index 12a269f..3c67e94 100644
  };
  
  static u8 am335x_iis_serializer_direction1[] = {
-@@ -427,6 +432,7 @@ static bool beaglebone_tsadcpins_free = 1;
+@@ -429,6 +434,7 @@ static bool beaglebone_tsadcpins_free = 1;
  
  
  #define GP_EVM_REV_IS_1_0		0x1
@@ -32,7 +32,7 @@ index 12a269f..3c67e94 100644
  #define GP_EVM_REV_IS_1_1A		0x2
  #define GP_EVM_REV_IS_UNKNOWN		0xFF
  #define GP_EVM_ACTUALLY_BEAGLEBONE  0xBB
-@@ -1022,6 +1028,47 @@ static struct pinmux_config profibus_pin_mux[] = {
+@@ -1024,6 +1030,47 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -80,7 +80,7 @@ index 12a269f..3c67e94 100644
  
  #define BEAGLEBONEDVI_USR0_LED  GPIO_TO_PIN(1, 18)
  #define BEAGLEBONEDVI_USR1_LED  GPIO_TO_PIN(1, 19)
-@@ -1775,11 +1822,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1777,11 +1824,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	snprintf(tmp, sizeof(cape_config.partnumber) + 1, "%s", cape_config.partnumber);
  	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
  
@@ -94,7 +94,7 @@ index 12a269f..3c67e94 100644
  		pr_info("BeagleBone cape: initializing LCD cape\n");
  		bbtoys7lcd_init(0,0);
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
-@@ -2226,6 +2273,7 @@ static void setup_general_purpose_evm(void)
+@@ -2258,6 +2305,7 @@ static void setup_general_purpose_evm(void)
  	pr_info("The board is general purpose EVM in profile %d\n", prof_sel);
  
  	if (!strncmp("1.1A", config.version, 4)) {
@@ -103,5 +103,5 @@ index 12a269f..3c67e94 100644
  	} else if (!strncmp("1.0", config.version, 3)) {
  		gp_evm_revision = GP_EVM_REV_IS_1_0;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
index a7f5385..dc8843f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0005-beaglebone-disable-tsadc.patch
@@ -1,7 +1,7 @@
-From ca13fa5f840198db430a21a643f3df4788f21b85 Mon Sep 17 00:00:00 2001
+From 182bdf186f6dfde9d97faea406bc9d1925f18353 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 10:09:06 +0100
-Subject: [PATCH 05/26] beaglebone: disable tsadc
+Subject: [PATCH 05/33] beaglebone: disable tsadc
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 3c67e94..b0f5ce3 100644
+index ffbecae..ba611c0 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -240,11 +240,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
+@@ -242,11 +242,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
  static struct tsc_data am335x_touchscreen_data  = {
  	.wires  = 4,
  	.x_plate_resistance = 200,
@@ -27,5 +27,5 @@ index 3c67e94..b0f5ce3 100644
  
  static u8 am335x_iis_serializer_direction1[] = {
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
index 01c309d..720dc18 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0006-tscadc-Add-general-purpose-mode-untested-with-touchs.patch
@@ -1,7 +1,7 @@
-From 529eb4be71f6387842a1823c7dcac803cc31d8f9 Mon Sep 17 00:00:00 2001
+From 9b99753d6e4324b98bedd6289993e57c93dbe59d Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:00:40 +0100
-Subject: [PATCH 06/26] tscadc: Add general purpose mode, untested with
+Subject: [PATCH 06/33] tscadc: Add general purpose mode, untested with
  touchscreen functionality
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
@@ -19,10 +19,10 @@ Conflicts:
  5 files changed, 178 insertions(+), 49 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index b0f5ce3..5ab9c18 100644
+index ba611c0..8f7ee0b 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2245,6 +2245,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -2277,6 +2277,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -30,7 +30,7 @@ index b0f5ce3..5ab9c18 100644
  	{NULL, 0, 0},
  };
  
-@@ -2257,6 +2258,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2289,6 +2290,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -77,7 +77,7 @@ index 70a3012..348c8e5 100644
  #define AM33XX_CONTROL_PADCONF_AIN2_OFFSET			0x0B24
  #define AM33XX_CONTROL_PADCONF_AIN1_OFFSET			0x0B28
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 950c07f..2f38c0c 100644
+index 835a0ba..c6dc6f0 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
 @@ -28,6 +28,8 @@
@@ -109,7 +109,7 @@ index 950c07f..2f38c0c 100644
  #define TSCADC_STEPCONFIG_XPP		BIT(5)
  #define TSCADC_STEPCONFIG_XNN		BIT(6)
  #define TSCADC_STEPCONFIG_YPP		BIT(7)
-@@ -108,6 +117,7 @@ struct tscadc {
+@@ -109,6 +118,7 @@ struct tscadc {
  	int			wires;
  	int			analog_input;
  	int			x_plate_resistance;
@@ -117,7 +117,7 @@ index 950c07f..2f38c0c 100644
  	int			irq;
  	void __iomem		*tsc_base;
  	unsigned int		ctrl;
-@@ -124,6 +134,86 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
+@@ -125,6 +135,86 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
  	writel(val, tsc->tsc_base + reg);
  }
  
@@ -204,7 +204,7 @@ index 950c07f..2f38c0c 100644
  static void tsc_step_config(struct tscadc *ts_dev)
  {
  	unsigned int	stepconfigx = 0, stepconfigy = 0;
-@@ -228,7 +318,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
+@@ -229,7 +319,7 @@ static void tsc_step_config(struct tscadc *ts_dev)
  	tscadc_writel(ts_dev, TSCADC_REG_STEPCONFIG14, stepconfigz2);
  	tscadc_writel(ts_dev, TSCADC_REG_STEPDELAY14, delay);
  
@@ -213,7 +213,7 @@ index 950c07f..2f38c0c 100644
  }
  
  static void tsc_idle_config(struct tscadc *ts_config)
-@@ -246,7 +336,7 @@ static void tsc_idle_config(struct tscadc *ts_config)
+@@ -247,7 +337,7 @@ static void tsc_idle_config(struct tscadc *ts_config)
  	tscadc_writel(ts_config, TSCADC_REG_IDLECONFIG, idleconfig);
  }
  
@@ -222,7 +222,7 @@ index 950c07f..2f38c0c 100644
  {
  	struct tscadc		*ts_dev = (struct tscadc *)dev;
  	struct input_dev	*input_dev = ts_dev->input;
-@@ -367,7 +457,7 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
+@@ -368,7 +458,7 @@ static irqreturn_t tscadc_interrupt(int irq, void *dev)
  	/* check pending interrupts */
  	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
  
@@ -231,7 +231,7 @@ index 950c07f..2f38c0c 100644
  	return IRQ_HANDLED;
  }
  
-@@ -405,13 +495,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -406,13 +496,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  		return -ENODEV;
  	}
  
@@ -253,7 +253,7 @@ index 950c07f..2f38c0c 100644
  
  	res =  request_mem_region(res->start, resource_size(res), pdev->name);
  	if (!res) {
-@@ -427,8 +519,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -428,8 +520,15 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  		goto err_release_mem;
  	}
  
@@ -271,7 +271,7 @@ index 950c07f..2f38c0c 100644
  	if (err) {
  		dev_err(&pdev->dev, "failed to allocate irq.\n");
  		goto err_unmap_regs;
-@@ -444,12 +543,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -445,12 +544,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  		goto err_free_irq;
  	}
  	clock_rate = clk_get_rate(clk);
@@ -290,7 +290,7 @@ index 950c07f..2f38c0c 100644
  	/* TSCADC_CLKDIV needs to be configured to the value minus 1 */
  	clk_value = clk_value - 1;
  	tscadc_writel(ts_dev, TSCADC_REG_CLKDIV, clk_value);
-@@ -457,53 +562,55 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -458,53 +563,55 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  	ts_dev->wires = pdata->wires;
  	ts_dev->analog_input = pdata->analog_input;
  	ts_dev->x_plate_resistance = pdata->x_plate_resistance;
@@ -402,5 +402,5 @@ index 2c547bb..850cd4b 100644
 +	int mode;
  };
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
index 8119270..3b747f8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0007-tscadc-Add-board-file-mfd-support-fix-warning.patch
@@ -1,7 +1,7 @@
-From 3d2d69999a7de330c9c1e85fcedb094d4f160e16 Mon Sep 17 00:00:00 2001
+From 2c10000ff1538c2cfb91ebfb27054b262584ce1c Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:02:17 +0100
-Subject: [PATCH 07/26] tscadc: Add board file mfd support, fix warning
+Subject: [PATCH 07/33] tscadc: Add board file mfd support, fix warning
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -14,10 +14,10 @@ Conflicts:
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 5ab9c18..2597650 100644
+index 8f7ee0b..64a0c0a 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2245,7 +2245,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -2277,7 +2277,7 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -27,10 +27,10 @@ index 5ab9c18..2597650 100644
  };
  
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 2f38c0c..5070450 100644
+index c6dc6f0..b50a08c 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -468,7 +468,7 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
+@@ -469,7 +469,7 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
  static	int __devinit tscadc_probe(struct platform_device *pdev)
  {
  	struct tscadc			*ts_dev;
@@ -40,5 +40,5 @@ index 2f38c0c..5070450 100644
  	int				clk_value;
  	int				clock_rate, irqenable, ctrl;
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
index 2cf1fec..023b6ab 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0008-AM335X-init-tsc-bone-style-for-new-boards.patch
@@ -1,7 +1,7 @@
-From 165b0cfffef915ca0efc4f55bc7078c55893ef3e Mon Sep 17 00:00:00 2001
+From 8b4f4ecc8c831a5bfa87ee66faada2d9d28c5fb4 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Wed, 30 Nov 2011 15:03:59 +0100
-Subject: [PATCH 08/26] AM335X: init tsc bone style for new boards
+Subject: [PATCH 08/33] AM335X: init tsc bone style for new boards
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 2597650..5bac604 100644
+index 64a0c0a..6b78ae6 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2258,7 +2258,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2290,7 +2290,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -22,5 +22,5 @@ index 2597650..5bac604 100644
  };
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
index d1dadf2..f100a6d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0009-tscadc-make-stepconfig-channel-configurable.patch
@@ -1,7 +1,7 @@
-From f7e890d43fd383c48e75bbdc363e5ce44bd5eb04 Mon Sep 17 00:00:00 2001
+From fb47de51034c21646d79aef0605a7a84b9fb6dcf Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 18:18:04 -0600
-Subject: [PATCH 09/26] tscadc: make stepconfig channel-configurable
+Subject: [PATCH 09/33] tscadc: make stepconfig channel-configurable
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 5 insertions(+), 3 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 5070450..3950696 100644
+index b50a08c..6083de7 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -134,7 +134,9 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
+@@ -135,7 +135,9 @@ static void tscadc_writel(struct tscadc *tsc, unsigned int reg,
  	writel(val, tsc->tsc_base + reg);
  }
  
@@ -23,7 +23,7 @@ index 5070450..3950696 100644
  {
  	unsigned int	stepconfig = 0, delay = 0, chargeconfig = 0;
  
-@@ -146,7 +148,7 @@ static void tsc_adc_step_config(struct tscadc *ts_dev)
+@@ -147,7 +149,7 @@ static void tsc_adc_step_config(struct tscadc *ts_dev)
   	 */
  	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
  		TSCADC_STEPCONFIG_2SAMPLES_AVG |
@@ -32,7 +32,7 @@ index 5070450..3950696 100644
  
  	delay = TSCADC_STEPCONFIG_SAMPLEDLY | TSCADC_STEPCONFIG_OPENDLY;
  
-@@ -603,7 +605,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -604,7 +606,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  			goto err_fail;
  	}
  	else {
@@ -42,5 +42,5 @@ index 5070450..3950696 100644
  		irqenable = TSCADC_IRQENB_FIFO0THRES;
  	}
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
index a076542..50407fa 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0010-tscadc-Trigger-through-sysfs.patch
@@ -1,7 +1,7 @@
-From 50c698d37ac59a4ba4cec9d6b844444e312e1a26 Mon Sep 17 00:00:00 2001
+From a45b9634ecd2d8251c86ff2111e7202471f3f842 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:55:25 -0600
-Subject: [PATCH 10/26] tscadc: Trigger through sysfs
+Subject: [PATCH 10/33] tscadc: Trigger through sysfs
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 
@@ -14,7 +14,7 @@ Conflicts:
  2 files changed, 56 insertions(+), 5 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 3950696..8661b3a 100644
+index 6083de7..d6aec8c 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
 @@ -26,8 +26,19 @@
@@ -37,7 +37,7 @@ index 3950696..8661b3a 100644
  /* Memory mapped registers here have incorrect offsets!
   * Correct after referring TRM */
  #define TSCADC_REG_IRQEOI		0x020
-@@ -149,12 +160,12 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
+@@ -150,12 +161,12 @@ static void tsc_adc_step_config(struct tscadc *ts_dev, int channel)
  	stepconfig = TSCADC_STEPCONFIG_MODE_SWONESHOT |
  		TSCADC_STEPCONFIG_2SAMPLES_AVG |
  		((channel-1) << 19);
@@ -52,7 +52,7 @@ index 3950696..8661b3a 100644
  	/* Get the ball rolling, this will trigger the FSM to step through
   	 * as soon as TSC_ADC_SS is turned on */
  	tscadc_writel(ts_dev, TSCADC_REG_SE, TSCADC_STPENB_STEPENB_GENERAL);
-@@ -204,7 +215,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+@@ -205,7 +216,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
  		irqclr |= TSCADC_IRQENB_FIFO1THRES;
  	}
  
@@ -61,7 +61,7 @@ index 3950696..8661b3a 100644
  
  	tscadc_writel(ts_dev, TSCADC_REG_IRQSTATUS, irqclr);
  
-@@ -212,7 +223,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+@@ -213,7 +224,7 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
  	tscadc_writel(ts_dev, TSCADC_REG_IRQEOI, 0x0);
  
  	/* Turn on Step 1 again */
@@ -70,7 +70,7 @@ index 3950696..8661b3a 100644
  	return IRQ_HANDLED;
  }
  
-@@ -467,6 +478,34 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
+@@ -468,6 +479,34 @@ static irqreturn_t tsc_interrupt(int irq, void *dev)
  * The functions for inserting/removing driver as a module.
  */
  
@@ -105,7 +105,7 @@ index 3950696..8661b3a 100644
  static	int __devinit tscadc_probe(struct platform_device *pdev)
  {
  	struct tscadc			*ts_dev;
-@@ -478,6 +517,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -479,6 +518,18 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  	struct resource			*res;
  	struct clk			*clk;
  
@@ -124,7 +124,7 @@ index 3950696..8661b3a 100644
  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  	if (!res) {
  		dev_err(&pdev->dev, "no memory resource defined.\n");
-@@ -605,7 +656,6 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -606,7 +657,6 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  			goto err_fail;
  	}
  	else {
@@ -145,5 +145,5 @@ index 850cd4b..fc239c6 100644
  #define TI_TSCADC_TSCMODE 0
  #define TI_TSCADC_GENMODE 1
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
index c7c1c37..5ecb48c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0011-meta-ti-Remove-debug-messages-for-meta-ti.patch
@@ -1,7 +1,7 @@
-From 92c8dd2fe6e62db7bcb07a9010c5eb9b757f2446 Mon Sep 17 00:00:00 2001
+From a893b2486f36716a3196fa58fae5b7d973976b5a Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Mon, 28 Nov 2011 20:56:48 -0600
-Subject: [PATCH 11/26] meta-ti: Remove debug messages for meta-ti
+Subject: [PATCH 11/33] meta-ti: Remove debug messages for meta-ti
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index 8661b3a..c82f9bf 100644
+index d6aec8c..da48bcd 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -186,14 +186,14 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
+@@ -187,14 +187,14 @@ static irqreturn_t tsc_adc_interrupt(int irq, void *dev)
  
  	status = tscadc_readl(ts_dev, TSCADC_REG_IRQSTATUS);
  
@@ -30,5 +30,5 @@ index 8661b3a..c82f9bf 100644
  		for (i = 0; i < fifo1count; i++) {
  			read_sample = tscadc_readl(ts_dev, TSCADC_REG_FIFO0);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
index d08d8d5..92375cc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0012-tscadc-switch-to-polling-instead-of-interrupts.patch
@@ -1,7 +1,7 @@
-From a1bedb47197c154069710b8f0f2258a7651cc05c Mon Sep 17 00:00:00 2001
+From f0963a18454ca4943c436432300d310b6f4ebd16 Mon Sep 17 00:00:00 2001
 From: Joel A Fernandes <joelagnel@ti.com>
 Date: Tue, 29 Nov 2011 09:44:22 -0600
-Subject: [PATCH 12/26] tscadc: switch to polling instead of interrupts
+Subject: [PATCH 12/33] tscadc: switch to polling instead of interrupts
 
 Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
  1 file changed, 14 insertions(+), 2 deletions(-)
 
 diff --git a/drivers/input/touchscreen/ti_tscadc.c b/drivers/input/touchscreen/ti_tscadc.c
-index c82f9bf..3082e5c 100644
+index da48bcd..4fd2e18 100644
 --- a/drivers/input/touchscreen/ti_tscadc.c
 +++ b/drivers/input/touchscreen/ti_tscadc.c
-@@ -483,6 +483,8 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
+@@ -484,6 +484,8 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
  	struct device *dev;
  	struct tscadc *ts_dev;
  	int channel_num;
@@ -21,7 +21,7 @@ index c82f9bf..3082e5c 100644
  
  	pdev = (struct platform_device *)container_of(kobj, struct device, kobj);
  	dev = &pdev->dev;
-@@ -502,7 +504,17 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
+@@ -503,7 +505,17 @@ size_t do_adc_sample(struct kobject *kobj, struct attribute *attr, char *buf) {
  
  	tsc_adc_step_config(ts_dev, channel_num);
  
@@ -40,7 +40,7 @@ index c82f9bf..3082e5c 100644
  	return strlen(attr->name);
  }
  
-@@ -657,7 +669,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
+@@ -658,7 +670,7 @@ static	int __devinit tscadc_probe(struct platform_device *pdev)
  	}
  	else {
  		tscadc_writel(ts_dev, TSCADC_REG_FIFO0THR, 0);
@@ -50,5 +50,5 @@ index c82f9bf..3082e5c 100644
  	tscadc_writel(ts_dev, TSCADC_REG_IRQENABLE, irqenable);
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
index 5931829..6e3a9ce 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0013-beaglebone-fix-ADC-init.patch
@@ -1,7 +1,7 @@
-From 1d54ffc655a7d22e1477e3bc0d72c0593049d83b Mon Sep 17 00:00:00 2001
+From a1dabedca0bb4b1e016036368fa1888e21514570 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 14:50:55 +0100
-Subject: [PATCH 13/26] beaglebone: fix ADC init
+Subject: [PATCH 13/33] beaglebone: fix ADC init
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 2 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 5bac604..3c67e94 100644
+index 6b78ae6..ffbecae 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -240,11 +240,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
+@@ -242,11 +242,11 @@ struct da8xx_lcdc_platform_data dvi_pdata = {
  static struct tsc_data am335x_touchscreen_data  = {
  	.wires  = 4,
  	.x_plate_resistance = 200,
@@ -26,7 +26,7 @@ index 5bac604..3c67e94 100644
  };
  
  static u8 am335x_iis_serializer_direction1[] = {
-@@ -2245,7 +2245,6 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
+@@ -2277,7 +2277,6 @@ static struct evm_dev_cfg beaglebone_old_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -34,7 +34,7 @@ index 5bac604..3c67e94 100644
  	{NULL, 0, 0},
  };
  
-@@ -2258,7 +2257,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2290,7 +2289,6 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -43,5 +43,5 @@ index 5bac604..3c67e94 100644
  };
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
index 44c5052..d50acc2 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch
@@ -1,7 +1,7 @@
-From c150d02db78ceb0ec05774b834bf2001c6427552 Mon Sep 17 00:00:00 2001
+From 32868ed9e44bf2cf9193e4bb8a903c20ca5a8d93 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 16:49:52 +0100
-Subject: [PATCH 14/26] AM335x: MUX: add ehrpwm1A
+Subject: [PATCH 14/33] AM335x: MUX: add ehrpwm1A
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -22,5 +22,5 @@ index 572ed16..0f71646 100644
  		"gpmc_a3", "mii2_txd2", "rgmii2_td2", "mmc2_dat2",
  		NULL, NULL, NULL, "gpio1_19"),
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
index ba2b306..f70e898 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0015-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch
@@ -1,7 +1,7 @@
-From 46c7fc0ed1ad0e5da431d15a4333a4fb5bb0ff0e Mon Sep 17 00:00:00 2001
+From 28cbad5cd7338d27e6f440c26b508a171640df85 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 31 Jan 2012 17:02:10 +0100
-Subject: [PATCH 15/26] beaglebone: enable PWM for lcd backlight <- backlight
+Subject: [PATCH 15/33] beaglebone: enable PWM for lcd backlight <- backlight
  is inverted
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -10,10 +10,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 42 insertions(+), 9 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 3c67e94..23b59c2 100644
+index ffbecae..43a83ca 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -179,6 +179,16 @@ static const struct display_panel bbtoys7_panel = {
+@@ -181,6 +181,16 @@ static const struct display_panel bbtoys7_panel = {
  	COLOR_ACTIVE,
  };
  
@@ -30,7 +30,7 @@ index 3c67e94..23b59c2 100644
  static struct lcd_ctrl_config bbtoys7_cfg = {
  	&bbtoys7_panel,
  	.ac_bias		= 255,
-@@ -599,9 +609,9 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
+@@ -601,9 +611,9 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
  	{"lcd_vsync.lcd_vsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
  	{"lcd_hsync.lcd_hsync",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
  	{"lcd_pclk.lcd_pclk",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT},
@@ -42,7 +42,7 @@ index 3c67e94..23b59c2 100644
  	{NULL, 0},
  };
  
-@@ -1134,6 +1144,7 @@ static struct pinmux_config ecap0_pin_mux[] = {
+@@ -1136,6 +1146,7 @@ static struct pinmux_config ecap0_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -50,7 +50,7 @@ index 3c67e94..23b59c2 100644
  static int backlight_enable;
  
  #define AM335XEVM_WLAN_PMENA_GPIO	GPIO_TO_PIN(1, 30)
-@@ -1216,6 +1227,30 @@ static int __init ecap0_init(void)
+@@ -1218,6 +1229,30 @@ static int __init ecap0_init(void)
  }
  late_initcall(ecap0_init);
  
@@ -81,7 +81,7 @@ index 3c67e94..23b59c2 100644
  static int __init conf_disp_pll(int rate)
  {
  	struct clk *disp_pll;
-@@ -1250,11 +1285,12 @@ static void lcdc_init(int evm_id, int profile)
+@@ -1252,11 +1287,12 @@ static void lcdc_init(int evm_id, int profile)
  }
  
  #define BEAGLEBONE_LCD_AVDD_EN GPIO_TO_PIN(0, 7)
@@ -95,7 +95,7 @@ index 3c67e94..23b59c2 100644
  
  	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
  	if (conf_disp_pll(300000000)) {
-@@ -1265,12 +1301,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+@@ -1267,12 +1303,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
  	
  	if (am33xx_register_lcdc(&bbtoys7_pdata))
  		pr_info("Failed to register Beagleboardtoys 7\" LCD cape device\n");
@@ -109,7 +109,7 @@ index 3c67e94..23b59c2 100644
  	return;
  }
  
-@@ -1831,6 +1862,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1833,6 +1864,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		bbtoys7lcd_init(0,0);
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
@@ -119,5 +119,5 @@ index 3c67e94..23b59c2 100644
  	}
  	
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
index 42e342b..d3e8e0e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0016-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch
@@ -1,7 +1,7 @@
-From 96debb4a5199afb9ad47e8c94292540e99d4050f Mon Sep 17 00:00:00 2001
+From ba233d60909b0b895c28f88c5714ebcb68b87617 Mon Sep 17 00:00:00 2001
 From: Steve Sakoman <steve@sakoman.com>
 Date: Mon, 18 Jul 2011 23:13:41 -0500
-Subject: [PATCH 16/26] omap_hsmmc: Set dto to max value of 14 to avoid SD
+Subject: [PATCH 16/33] omap_hsmmc: Set dto to max value of 14 to avoid SD
  Card timeouts
 
 This fixes MMC errors due to timeouts on certain SD Cards following suggestions
@@ -30,5 +30,5 @@ index 1f938d9..ace26f7 100644
  	reg |= dto << DTO_SHIFT;
  	OMAP_HSMMC_WRITE(host->base, SYSCTL, reg);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
index a52ff8c..2c2c455 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0017-beaglebone-set-default-brightness-to-50-for-pwm-back.patch
@@ -1,7 +1,7 @@
-From 55315e3442ea08e4bd0d676921f968dc1fccf588 Mon Sep 17 00:00:00 2001
+From 2d746bba72e5334bbf6269e1063dea891ad58394 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 1 Feb 2012 14:10:38 +0100
-Subject: [PATCH 17/26] beaglebone: set default brightness to 50% for pwm
+Subject: [PATCH 17/33] beaglebone: set default brightness to 50% for pwm
  backlights
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -10,10 +10,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 23b59c2..9294af5 100644
+index 43a83ca..97b069f 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -133,7 +133,7 @@ static const struct display_panel disp_panel = {
+@@ -135,7 +135,7 @@ static const struct display_panel disp_panel = {
  
  /* LCD backlight platform Data */
  #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
@@ -23,5 +23,5 @@ index 23b59c2..9294af5 100644
  
  #define PWM_DEVICE_ID   "ecap.0"
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
index 9f60391..46fafa0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0018-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch
@@ -1,7 +1,7 @@
-From 87a3d78cceff02796574ec9c0e5ee9c81372cd29 Mon Sep 17 00:00:00 2001
+From 5d3a23267ebf757159b1dce032505d0c15683909 Mon Sep 17 00:00:00 2001
 From: Matt Porter <mporter@ti.com>
 Date: Mon, 21 Nov 2011 12:55:23 -0500
-Subject: [PATCH 18/26] st7735fb: WIP framebuffer driver supporting Adafruit
+Subject: [PATCH 18/33] st7735fb: WIP framebuffer driver supporting Adafruit
  1.8" SPI LCD
 
 Signed-off-by: Matt Porter <mporter@ti.com>
@@ -664,5 +664,5 @@ index 0000000..250f036
 +
 +
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
index c165721..d5b6a27 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch
@@ -1,7 +1,7 @@
-From 4f40b3e2d3fa97add575cfd398fc76595d2c2141 Mon Sep 17 00:00:00 2001
+From f70a6f936227f65da0e5bff0e72ad59fe2c9b36f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 7 Feb 2012 11:01:13 +0100
-Subject: [PATCH 19/26] beaglebone: use P8_6 (gpio1_3) as w1 bus
+Subject: [PATCH 19/33] beaglebone: use P8_6 (gpio1_3) as w1 bus
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,18 +9,18 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 31 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 9294af5..88f07e3 100644
+index 97b069f..3ba4bbc 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -38,6 +38,7 @@
- #include <linux/pwm_backlight.h>
+@@ -39,6 +39,7 @@
  #include <linux/reboot.h>
  #include <linux/pwm/pwm.h>
+ #include <linux/opp.h>
 +#include <linux/w1-gpio.h>
  
  /* LCD controller is similar to DA850 */
  #include <video/da8xx-fb.h>
-@@ -615,6 +616,11 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
+@@ -617,6 +618,11 @@ static struct pinmux_config bbtoys7_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -32,7 +32,7 @@ index 9294af5..88f07e3 100644
  static struct pinmux_config tsc_pin_mux[] = {
  	{"ain0.ain0",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
  	{"ain1.ain1",           OMAP_MUX_MODE0 | AM33XX_INPUT_EN},
-@@ -1038,6 +1044,19 @@ static struct pinmux_config profibus_pin_mux[] = {
+@@ -1040,6 +1046,19 @@ static struct pinmux_config profibus_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -52,7 +52,7 @@ index 9294af5..88f07e3 100644
  /* LEDS - gpio1_21 -> gpio1_24 */
  
  #define BEAGLEBONE_USR1_LED  GPIO_TO_PIN(1, 21)
-@@ -1375,6 +1394,17 @@ static void dvileds_init(int evm_id, int profile )
+@@ -1377,6 +1396,17 @@ static void dvileds_init(int evm_id, int profile )
  		pr_err("failed to register BeagleBone DVI cape LEDS\n");
  }
  
@@ -70,7 +70,7 @@ index 9294af5..88f07e3 100644
  static void rgmii1_init(int evm_id, int profile)
  {
  	setup_pin_mux(rgmii1_pin_mux);
-@@ -2290,6 +2320,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
+@@ -2322,6 +2352,7 @@ static struct evm_dev_cfg beaglebone_dev_cfg[] = {
  	{i2c2_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{mmc0_init,	DEV_ON_BASEBOARD, PROFILE_NONE},
  	{boneleds_init,	DEV_ON_BASEBOARD, PROFILE_ALL},
@@ -79,5 +79,5 @@ index 9294af5..88f07e3 100644
  };
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
index 59b8607..313d140 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0020-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch
@@ -1,7 +1,7 @@
-From 89028c4350be00850cb58b9dcb82d93dcb6373c4 Mon Sep 17 00:00:00 2001
+From 3554b72659f168b6b699a02a57e9d91471ad7c32 Mon Sep 17 00:00:00 2001
 From: Alessandro Zummo <a.zummo@towertech.it>
 Date: Thu, 9 Feb 2012 12:46:52 +0100
-Subject: [PATCH 20/26] beaglebone: add support for Towertech TT3201 CAN cape
+Subject: [PATCH 20/33] beaglebone: add support for Towertech TT3201 CAN cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -12,18 +12,18 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  4 files changed, 98 insertions(+), 19 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 88f07e3..a30689f 100644
+index 3ba4bbc..a8dfcdf 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -39,6 +39,7 @@
- #include <linux/reboot.h>
+@@ -40,6 +40,7 @@
  #include <linux/pwm/pwm.h>
+ #include <linux/opp.h>
  #include <linux/w1-gpio.h>
 +#include <linux/can/platform/mcp251x.h>
  
  /* LCD controller is similar to DA850 */
  #include <video/da8xx-fb.h>
-@@ -841,6 +842,15 @@ static struct pinmux_config d_can_ia_pin_mux[] = {
+@@ -843,6 +844,15 @@ static struct pinmux_config d_can_ia_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -39,7 +39,7 @@ index 88f07e3..a30689f 100644
  /* Module pin mux for uart2 */
  static struct pinmux_config uart2_pin_mux[] = {
  	{"spi0_sclk.uart2_rxd", OMAP_MUX_MODE1 | AM33XX_SLEWCTRL_SLOW |
-@@ -1850,6 +1860,44 @@ static void i2c1_init(int evm_id, int profile)
+@@ -1852,6 +1862,44 @@ static void i2c1_init(int evm_id, int profile)
  	return;
  }
  
@@ -84,7 +84,7 @@ index 88f07e3..a30689f 100644
  static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context)
  {
  	capecount++;
-@@ -1897,7 +1945,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1899,7 +1947,11 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		beaglebone_tsadcpins_free = 0;
  	}
  	
@@ -316,5 +316,5 @@ index 330140e..b3e231c 100644
  	}
  error_probe:
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
index 0067a5e..937c03a 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0021-beaglebone-add-more-beagleboardtoys-cape-partnumbers.patch
@@ -1,7 +1,7 @@
-From 6f8cb102c35b2770f11da5fc4ad9585b529c0bf2 Mon Sep 17 00:00:00 2001
+From 33f4b51e615b9550acdb99de61427e1aa46db4b3 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 12:01:35 +0100
-Subject: [PATCH 21/26] beaglebone: add more beagleboardtoys cape partnumbers
+Subject: [PATCH 21/33] beaglebone: add more beagleboardtoys cape partnumbers
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 24 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index a30689f..73d9dd9 100644
+index a8dfcdf..f854329 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1945,11 +1945,34 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1947,11 +1947,34 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		beaglebone_tsadcpins_free = 0;
  	}
  	
@@ -49,5 +49,5 @@ index a30689f..73d9dd9 100644
  		pr_info("BeagleBone cape: exporting ADC pins to sysfs\n");
  		bone_tsc_init(0,0);
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
index 7b8d242..d219f97 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0022-beaglebone-add-gpio-keys-for-lcd7-add-notes-for-miss.patch
@@ -1,7 +1,7 @@
-From fd358035f83d5edab1130ea569be580960a0dce7 Mon Sep 17 00:00:00 2001
+From 73da74ec5becc06d598a1ddcc435ed9fb277d0ce Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 13:32:43 +0100
-Subject: [PATCH 22/26] beaglebone: add gpio-keys for lcd7, add notes for
+Subject: [PATCH 22/33] beaglebone: add gpio-keys for lcd7, add notes for
  missing functionality for other capes
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
@@ -10,10 +10,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 79 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 73d9dd9..a3d7846 100644
+index f854329..9e9cf5b 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -992,6 +992,73 @@ static void volume_keys_init(int evm_id, int profile)
+@@ -994,6 +994,73 @@ static void volume_keys_init(int evm_id, int profile)
  		pr_err("failed to register matrix keypad (2x3) device\n");
  }
  
@@ -87,7 +87,7 @@ index 73d9dd9..a3d7846 100644
  /*
  * @evm_id - evm id which needs to be configured
  * @dev_cfg - single evm structure which includes
-@@ -1943,6 +2010,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1945,6 +2012,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: Registering PWM backlight for LCD cape\n");
  		enable_ehrpwm1(0,0);
  		beaglebone_tsadcpins_free = 0;
@@ -96,7 +96,7 @@ index 73d9dd9..a3d7846 100644
  	}
  	
  	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
-@@ -1951,6 +2020,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1953,6 +2022,10 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
  		beaglebone_tsadcpins_free = 0;
@@ -107,7 +107,7 @@ index 73d9dd9..a3d7846 100644
  	}
  	
  	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
-@@ -1960,11 +2033,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -1962,11 +2035,17 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	
  	if (!strncmp("BB-BONE-BATT-01", cape_config.partnumber, 15)) {
  		pr_info("BeagleBone cape: initializing battery cape\n");
@@ -126,5 +126,5 @@ index 73d9dd9..a3d7846 100644
  	}
  	
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
index 332b862..6d0d3d3 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0023-beaglebone-add-enter-key-for-lcd7-cape.patch
@@ -1,7 +1,7 @@
-From 2eb2e497cb55889497801ac263d7aa309656ff89 Mon Sep 17 00:00:00 2001
+From 47651bc2ba05d4d5f8a7d10a9c55ad915a4e3500 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 14:26:37 +0100
-Subject: [PATCH 23/26] beaglebone: add enter key for lcd7 cape
+Subject: [PATCH 23/33] beaglebone: add enter key for lcd7 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 9 insertions(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index a3d7846..e77bcd6 100644
+index 9e9cf5b..8c78eb5 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -998,6 +998,7 @@ static struct pinmux_config lcd7_keys_pin_mux[] = {
+@@ -1000,6 +1000,7 @@ static struct pinmux_config lcd7_keys_pin_mux[] = {
  	{"gpmc_a1.gpio1_17",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
  	{"gpmc_a3.gpio1_19",  OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
  	{"mcasp0_axr0.gpio3_16",    OMAP_MUX_MODE7 | AM33XX_PIN_INPUT},
@@ -20,7 +20,7 @@ index a3d7846..e77bcd6 100644
  	{NULL, 0},
  };
  
-@@ -1035,6 +1036,14 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1037,6 +1038,14 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
  	},
@@ -36,5 +36,5 @@ index a3d7846..e77bcd6 100644
  
  static struct gpio_keys_platform_data beaglebone_lcd7_gpio_key_info = {
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
index 44ebfda..7de222e 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0024-beaglebone-add-gpio-keys-for-lcd.patch
@@ -1,7 +1,7 @@
-From d76d09ea8918a1aa315b44d4e12b71a522545da8 Mon Sep 17 00:00:00 2001
+From 555493dc65a5f0ff80bfb8fc60a10bb8c0fef0de Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 19 Mar 2012 15:15:06 +0100
-Subject: [PATCH 24/26] beaglebone: add gpio-keys for lcd
+Subject: [PATCH 24/33] beaglebone: add gpio-keys for lcd
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 78 insertions(+), 4 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index e77bcd6..ed2ea68 100644
+index 8c78eb5..5266f78 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1068,6 +1068,82 @@ static void beaglebone_lcd7_keys_init(int evm_id, int profile)
+@@ -1070,6 +1070,82 @@ static void beaglebone_lcd7_keys_init(int evm_id, int profile)
  		pr_err("failed to register gpio keys for LCD7 cape\n");
  }
  
@@ -95,7 +95,7 @@ index e77bcd6..ed2ea68 100644
  /*
  * @evm_id - evm id which needs to be configured
  * @dev_cfg - single evm structure which includes
-@@ -2029,10 +2105,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2031,10 +2107,8 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: initializing LCD cape touchscreen\n");
  		tsc_init(0,0);
  		beaglebone_tsadcpins_free = 0;
@@ -109,5 +109,5 @@ index e77bcd6..ed2ea68 100644
  	
  	if (!strncmp("BB-BONE-VGA-01", cape_config.partnumber, 15)) {
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
index 8fa656a..4edc4c8 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0025-beaglebone-fix-direction-of-gpio-keys.patch
@@ -1,7 +1,7 @@
-From e979180175348c0118f7e461fefa44dcc78e124a Mon Sep 17 00:00:00 2001
+From c33d25585e467ab54b3db2d3c5b403e071150751 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Mon, 26 Mar 2012 20:28:56 +0200
-Subject: [PATCH 25/26] beaglebone: fix direction of gpio-keys
+Subject: [PATCH 25/33] beaglebone: fix direction of gpio-keys
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
@@ -9,10 +9,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  1 file changed, 10 insertions(+), 10 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index ed2ea68..ed03e14 100644
+index 5266f78..36b0c85 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1007,7 +1007,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1009,7 +1009,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_LEFT,
  		.gpio                   = GPIO_TO_PIN(1, 16),
@@ -21,7 +21,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "left",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1015,7 +1015,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1017,7 +1017,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_RIGHT,
  		.gpio                   = GPIO_TO_PIN(1, 17),
@@ -30,7 +30,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "right",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1023,7 +1023,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1025,7 +1025,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_UP,
  		.gpio                   = GPIO_TO_PIN(1, 19),
@@ -39,7 +39,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "up",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1031,7 +1031,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1033,7 +1033,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_DOWN,
  		.gpio                   = GPIO_TO_PIN(3, 16),
@@ -48,7 +48,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "down",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1039,7 +1039,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
+@@ -1041,7 +1041,7 @@ static struct gpio_keys_button beaglebone_lcd7_gpio_keys[] = {
  	{
  		.code                   = KEY_ENTER,
  		.gpio                   = GPIO_TO_PIN(3, 19),
@@ -57,7 +57,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "enter",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1083,7 +1083,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1085,7 +1085,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_LEFT,
  		.gpio                   = GPIO_TO_PIN(1, 16),
@@ -66,7 +66,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "left",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1091,7 +1091,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1093,7 +1093,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_RIGHT,
  		.gpio                   = GPIO_TO_PIN(1, 17),
@@ -75,7 +75,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "right",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1099,7 +1099,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1101,7 +1101,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_UP,
  		.gpio                   = GPIO_TO_PIN(3, 19),
@@ -84,7 +84,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "up",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1107,7 +1107,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1109,7 +1109,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_DOWN,
  		.gpio                   = GPIO_TO_PIN(1, 28),
@@ -93,7 +93,7 @@ index ed2ea68..ed03e14 100644
  		.desc                   = "down",
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
-@@ -1115,7 +1115,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
+@@ -1117,7 +1117,7 @@ static struct gpio_keys_button beaglebone_lcd3_gpio_keys[] = {
  	{
  		.code                   = KEY_ENTER,
  		.gpio                   = GPIO_TO_PIN(0, 7),
@@ -103,5 +103,5 @@ index ed2ea68..ed03e14 100644
  		.type                   = EV_KEY,
  		.wakeup                 = 1,
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
index ecae4d6..60ea055 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0026-beaglebone-fix-3.5-lcd-cape-support.patch
@@ -1,7 +1,7 @@
-From a40eb4d0e3ca83642a3035f7385de0ddf9421b08 Mon Sep 17 00:00:00 2001
+From 23c8aaf1d86378c6d4325b88ec85ac7d8130e86a Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 29 Feb 2012 17:25:22 +0100
-Subject: [PATCH 26/26] beaglebone: fix 3.5" lcd cape support
+Subject: [PATCH 26/33] beaglebone: fix 3.5" lcd cape support
 
 * proper timings
 * fix gpio conflict
@@ -13,10 +13,10 @@ Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
  2 files changed, 55 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index ed03e14..74a7e91 100644
+index 36b0c85..127516f 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -214,6 +214,29 @@ struct da8xx_lcdc_platform_data bbtoys7_pdata = {
+@@ -216,6 +216,29 @@ struct da8xx_lcdc_platform_data bbtoys7_pdata = {
  	.type			= "TFC_S9700RTWV35TR_01B",
  };
  
@@ -46,7 +46,7 @@ index ed03e14..74a7e91 100644
  static const struct display_panel dvi_panel = {
  	WVGA,
  	16,
-@@ -1486,6 +1509,23 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+@@ -1488,6 +1511,23 @@ static void bbtoys7lcd_init(int evm_id, int profile)
  	return;
  }
  
@@ -70,7 +70,7 @@ index ed03e14..74a7e91 100644
  #define BEAGLEBONEDVI_PDn  GPIO_TO_PIN(1, 7)
  
  static void dvi_init(int evm_id, int profile)
-@@ -2101,7 +2141,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2103,7 +2143,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	
  	if (!strncmp("BB-BONE-LCD3-01", cape_config.partnumber, 15)) {
  		pr_info("BeagleBone cape: initializing LCD cape\n");
@@ -105,5 +105,5 @@ index b01f15b..86b19ac 100644
  
  /* Enable the Raster Engine of the LCD Controller */
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
index 59c1371..0b99d3b 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0027-beaglebone-decrease-PWM-frequency-to-old-value-LCD7-.patch
@@ -1,19 +1,19 @@
-From 22560ed5c9c2a4e693adf5981e47f3b5f363676d Mon Sep 17 00:00:00 2001
+From 91190bb0f7c8b075011701e44daffc0f1a8ca766 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 11:25:00 +0200
-Subject: [PATCH 27/29] beaglebone: decrease PWM frequency to old value, LCD7
+Subject: [PATCH 27/33] beaglebone: decrease PWM frequency to old value, LCD7
  doesn't like it
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 74a7e91..b0ee67e 100644
+index 127516f..4d5238d 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -136,7 +136,7 @@ static const struct display_panel disp_panel = {
+@@ -138,7 +138,7 @@ static const struct display_panel disp_panel = {
  /* LCD backlight platform Data */
  #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
  #define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    50
@@ -23,5 +23,5 @@ index 74a7e91..b0ee67e 100644
  #define PWM_DEVICE_ID   "ecap.0"
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
index 543c274..3d725d0 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch
@@ -1,18 +1,18 @@
-From 2ade67b1a3c53567ea131902c3631f7d57b4332f Mon Sep 17 00:00:00 2001
+From 61314ea39f2f7cbf5e72efa93350820b83b95fd9 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 12:35:01 +0200
-Subject: [PATCH 28/29] beaglebone: fix ehrpwm backlight
+Subject: [PATCH 28/33] beaglebone: fix ehrpwm backlight
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    1 +
- 1 files changed, 1 insertions(+), 0 deletions(-)
+ 1 file changed, 1 insertion(+)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index b0ee67e..0d20bb1 100644
+index 4d5238d..24ed0b6 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -1434,6 +1434,7 @@ late_initcall(ecap0_init);
+@@ -1436,6 +1436,7 @@ late_initcall(ecap0_init);
  static void enable_ehrpwm1(int evm_id, int profile)
  {
  	ehrpwm_backlight_enable = true;
@@ -21,5 +21,5 @@ index b0ee67e..0d20bb1 100644
  
  /* Setup pwm-backlight for bbtoys7lcd */
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
index de75a57..86db3fc 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0029-beaglebone-also-report-cape-revision.patch
@@ -1,18 +1,18 @@
-From e6865fbe71c47846a528986effd6b21e4fe3f84b Mon Sep 17 00:00:00 2001
+From dc1f8ab451ceb72da5d6d2bf8418dc0b0043723c Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Tue, 17 Apr 2012 12:57:38 +0200
-Subject: [PATCH 29/29] beaglebone: also report cape revision
+Subject: [PATCH 29/33] beaglebone: also report cape revision
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    4 +++-
- 1 files changed, 3 insertions(+), 1 deletions(-)
+ 1 file changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 0d20bb1..bfcccd9 100644
+index 24ed0b6..a4e113c 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2097,6 +2097,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2099,6 +2099,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  	int ret;
  	char tmp[32];
  	char name[32];
@@ -20,7 +20,7 @@ index 0d20bb1..bfcccd9 100644
  	char manufacturer[32];
  
  	/* get cape specific data */
-@@ -2119,8 +2120,9 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2121,8 +2122,9 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  
  	pr_info("BeagleBone cape EEPROM: found eeprom at address 0x%x\n", capecount + 0x53);
  	snprintf(name, sizeof(cape_config.name) + 1, "%s", cape_config.name);
@@ -32,5 +32,5 @@ index 0d20bb1..bfcccd9 100644
  	pr_info("BeagleBone cape partnumber: %s\n", tmp);   
  
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
index 48e8c53..7e4168f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch
@@ -1,18 +1,19 @@
-From 6e14ab85bd71ec3831169d665c4e79f646a60df8 Mon Sep 17 00:00:00 2001
+From 7757a6ad6989fc4baeb7fcd8a1784531cdfc76c8 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 07:55:55 +0200
-Subject: [PATCH 30/30] beaglebone: don't compare undefined characters, it makes strncomp fail
+Subject: [PATCH 30/33] beaglebone: don't compare undefined characters, it
+ makes strncomp fail
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
+ 1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index bfcccd9..08a0425 100644
+index a4e113c..f2f03b6 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -2152,7 +2152,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2154,7 +2154,7 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		beaglebone_lcd3_keys_init(0,0);
  	}
  	
@@ -22,5 +23,5 @@ index bfcccd9..08a0425 100644
  		dvi_init(0,0);
  	}
 -- 
-1.7.2.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
similarity index 88%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
index caee6fc..72df38c 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-fix-3.5-cape-support.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0031-beaglebone-fix-3.5-cape-support.patch
@@ -1,18 +1,18 @@
-From d698dff8ded6583a447d81362534bacf77b8cbe5 Mon Sep 17 00:00:00 2001
+From 6114856631437ebac4469713e5b7ec2b1094f536 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Thu, 19 Apr 2012 14:33:53 +0200
-Subject: [PATCH 33/35] beaglebone: fix 3.5" cape support
+Subject: [PATCH 31/33] beaglebone: fix 3.5" cape support
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   42 ++++++++++++++++++++++++++++++++-
- 1 files changed, 41 insertions(+), 1 deletions(-)
+ 1 file changed, 41 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 08a0425..7a4b766 100644
+index f2f03b6..3adc4ac 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -597,6 +597,46 @@ static struct pinmux_config dvi_pin_mux[] = {
+@@ -599,6 +599,46 @@ static struct pinmux_config dvi_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -59,7 +59,7 @@ index 08a0425..7a4b766 100644
  /* Module pin mux for Beagleboardtoys 7" LCD cape */
  static struct pinmux_config bbtoys7_pin_mux[] = {
  	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
-@@ -1512,7 +1552,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
+@@ -1514,7 +1554,7 @@ static void bbtoys7lcd_init(int evm_id, int profile)
  
  static void bbtoys35lcd_init(int evm_id, int profile)
  {
@@ -69,5 +69,5 @@ index 08a0425..7a4b766 100644
  	// we are being stupid and setting pixclock from here instead of da8xx-fb.c
  	if (conf_disp_pll(16000000)) {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
similarity index 83%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
index 0a3c70a..8eb4233 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch
@@ -1,18 +1,18 @@
-From 759b49957081a1ccecf7302efc85c5141d00fe69 Mon Sep 17 00:00:00 2001
+From b81fd612ad4d08415df513e2627b35439cd921e5 Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Wed, 25 Apr 2012 12:35:07 +0200
-Subject: [PATCH 34/35] beaglebone: connect batterycape GPIO to gpio-charger
+Subject: [PATCH 32/33] beaglebone: connect batterycape GPIO to gpio-charger
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  arch/arm/mach-omap2/board-am335xevm.c |   46 ++++++++++++++++++++++++++++++++-
- 1 files changed, 45 insertions(+), 1 deletions(-)
+ 1 file changed, 45 insertions(+), 1 deletion(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 7a4b766..2bc9b14 100644
+index 3adc4ac..717bb8c 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -133,6 +133,36 @@ static const struct display_panel disp_panel = {
+@@ -135,6 +135,36 @@ static const struct display_panel disp_panel = {
  	COLOR_ACTIVE,
  };
  
@@ -49,7 +49,7 @@ index 7a4b766..2bc9b14 100644
  /* LCD backlight platform Data */
  #define AM335X_BACKLIGHT_MAX_BRIGHTNESS        100
  #define AM335X_BACKLIGHT_DEFAULT_BRIGHTNESS    50
-@@ -504,6 +534,13 @@ static struct pinmux_config haptics_pin_mux[] = {
+@@ -506,6 +536,13 @@ static struct pinmux_config haptics_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -63,7 +63,7 @@ index 7a4b766..2bc9b14 100644
  /* Module pin mux for LCDC */
  static struct pinmux_config lcdc_pin_mux[] = {
  	{"lcd_data0.lcd_data0",		OMAP_MUX_MODE0 | AM33XX_PIN_OUTPUT
-@@ -2201,7 +2238,14 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2203,7 +2240,14 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		pr_info("BeagleBone cape: initializing battery cape\n");
  		// gpio1_6, P9_15 lowbat output
  		// AIN4, P9_33 vbat
@@ -80,5 +80,5 @@ index 7a4b766..2bc9b14 100644
  	
  	if (!strncmp("BB-BONE-SERL", cape_config.partnumber, 12)) {
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
similarity index 84%
rename from recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch
rename to recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
index caf5ad3..e70ebd4 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch
@@ -1,18 +1,18 @@
-From caa3254ea2054e6b5cf6a5c52002dfeba6aa3f4c Mon Sep 17 00:00:00 2001
+From 0bed6db60e5a5bf78931b7da0376676a14bfce6f Mon Sep 17 00:00:00 2001
 From: Koen Kooi <koen@dominion.thruhere.net>
 Date: Fri, 4 May 2012 13:19:45 +0200
-Subject: [PATCH 35/35] beaglebone: add support for CAN and RS232 cape
+Subject: [PATCH 33/33] beaglebone: add support for CAN and RS232 cape
 
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
- arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++-----
- 1 files changed, 30 insertions(+), 6 deletions(-)
+ arch/arm/mach-omap2/board-am335xevm.c |   36 +++++++++++++++++++++++++++------
+ 1 file changed, 30 insertions(+), 6 deletions(-)
 
 diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
-index 2bc9b14..66d7613 100644
+index 717bb8c..6e7b203 100644
 --- a/arch/arm/mach-omap2/board-am335xevm.c
 +++ b/arch/arm/mach-omap2/board-am335xevm.c
-@@ -951,6 +951,18 @@ static struct pinmux_config tt3201_pin_mux[] = {
+@@ -953,6 +953,18 @@ static struct pinmux_config tt3201_pin_mux[] = {
  	{NULL, 0},
  };
  
@@ -31,7 +31,7 @@ index 2bc9b14..66d7613 100644
  /* Module pin mux for uart2 */
  static struct pinmux_config uart2_pin_mux[] = {
  	{"spi0_sclk.uart2_rxd", OMAP_MUX_MODE1 | AM33XX_SLEWCTRL_SLOW |
-@@ -2248,12 +2260,24 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+@@ -2250,12 +2262,24 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
  		#endif
  	}
  	
@@ -63,5 +63,5 @@ index 2bc9b14..66d7613 100644
  	}
  	
 -- 
-1.7.7.6
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
index 009f8fa..87b7741 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
@@ -1,4 +1,4 @@
-From fa1fff60e0f18032378fa97a6951c6f79e24507d Mon Sep 17 00:00:00 2001
+From 59d23a375a752abc6a6a8ddd935d1b367f69ed3d Mon Sep 17 00:00:00 2001
 From: Alexander Holler <hol...@ahsoftware.de>
 Date: Wed, 25 Apr 2012 00:50:03 +0200
 Subject: [PATCH] leds: heartbeat: stop on shutdown, reboot or panic
@@ -63,5 +63,5 @@ index 759c0bb..31c234c 100644
  }
  
 -- 
-1.7.9.5
+1.7.10
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 593d6e7..63c0532 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,8 +11,8 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
-SRCREV = "baaa0c0425528486efcc70b7696dd6359f10b5bd"
-MACHINE_KERNEL_PR_append = "g+gitr${SRCREV}"
+SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -878,52 +878,52 @@ PATCHES_OVER_PSP = " \
 	file://3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch \
 	file://3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch \
 	file://3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch \
-	file://3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch \
-	file://3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch \
-	file://3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch \
-	file://3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch \
-	file://3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch \
-	file://3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch \
-	file://3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch \
-	file://3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch \
-	file://3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch \
-	file://3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch \
-	file://3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch \
-	file://3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch \
-	file://3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch \
-	file://3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch \
-	file://3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch \
-	file://3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch \
-	file://3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch \
-	file://3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch \
-	file://3.2.16/0042-serial-PL011-clear-pending-interrupts.patch \
-	file://3.2.16/0043-serial-PL011-move-interrupt-clearing.patch \
-	file://3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch \
-	file://3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch \
-	file://3.2.16/0046-xhci-Fix-register-save-restore-order.patch \
-	file://3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch \
-	file://3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch \
-	file://3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch \
-	file://3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch \
-	file://3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch \
-	file://3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch \
-	file://3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch \
-	file://3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch \
-	file://3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch \
-	file://3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch \
-	file://3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch \
-	file://3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch \
-	file://3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch \
-	file://3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch \
-	file://3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch \
-	file://3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch \
-	file://3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch \
-	file://3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch \
-	file://3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch \
-	file://3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch \
-	file://3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch \
-	file://3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch \
-	file://3.2.16/0069-Linux-3.2.16.patch \
+	file://3.2.16/0023-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch \
+	file://3.2.16/0024-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch \
+	file://3.2.16/0025-pch_uart-Fix-MSI-setting-issue.patch \
+	file://3.2.16/0026-USB-serial-fix-race-between-probe-and-open.patch \
+	file://3.2.16/0027-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch \
+	file://3.2.16/0028-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch \
+	file://3.2.16/0029-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch \
+	file://3.2.16/0030-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch \
+	file://3.2.16/0031-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch \
+	file://3.2.16/0032-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch \
+	file://3.2.16/0033-USB-don-t-ignore-suspend-errors-for-root-hubs.patch \
+	file://3.2.16/0034-xhci-don-t-re-enable-IE-constantly.patch \
+	file://3.2.16/0035-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch \
+	file://3.2.16/0036-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch \
+	file://3.2.16/0037-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch \
+	file://3.2.16/0038-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch \
+	file://3.2.16/0039-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch \
+	file://3.2.16/0040-fix-tlb-flushing-for-page-table-pages.patch \
+	file://3.2.16/0041-serial-PL011-clear-pending-interrupts.patch \
+	file://3.2.16/0042-serial-PL011-move-interrupt-clearing.patch \
+	file://3.2.16/0043-fcaps-clear-the-same-personality-flags-as-suid-when-.patch \
+	file://3.2.16/0044-ath9k-fix-max-noise-floor-threshold.patch \
+	file://3.2.16/0045-xhci-Fix-register-save-restore-order.patch \
+	file://3.2.16/0046-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch \
+	file://3.2.16/0047-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch \
+	file://3.2.16/0048-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch \
+	file://3.2.16/0049-usb-gadget-pch_udc-Fix-disconnect-issue.patch \
+	file://3.2.16/0050-usb-gadget-pch_udc-Fix-wrong-return-value.patch \
+	file://3.2.16/0051-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch \
+	file://3.2.16/0052-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch \
+	file://3.2.16/0053-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch \
+	file://3.2.16/0054-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch \
+	file://3.2.16/0055-security-fix-compile-error-in-commoncap.c.patch \
+	file://3.2.16/0056-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch \
+	file://3.2.16/0057-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch \
+	file://3.2.16/0058-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch \
+	file://3.2.16/0059-spi-topcliff-pch-fix-Wuninitialized-warning.patch \
+	file://3.2.16/0060-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch \
+	file://3.2.16/0061-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch \
+	file://3.2.16/0062-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch \
+	file://3.2.16/0063-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch \
+	file://3.2.16/0064-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch \
+	file://3.2.16/0065-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch \
+	file://3.2.16/0066-drm-radeon-disable-MSI-on-RV515.patch \
+	file://3.2.16/0067-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch \
+	file://3.2.16/0068-Linux-3.2.16.patch \
 	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
@@ -955,7 +955,7 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0028-beaglebone-fix-ehrpwm-backlight.patch \
 	file://beaglebone/0029-beaglebone-also-report-cape-revision.patch \
 	file://beaglebone/0030-beaglebone-don-t-compare-undefined-characters-it-mak.patch \
-	file://beaglebone/0033-beaglebone-fix-3.5-cape-support.patch \
-	file://beaglebone/0034-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch \
-	file://beaglebone/0035-beaglebone-add-support-for-CAN-and-RS232-cape.patch \
+	file://beaglebone/0031-beaglebone-fix-3.5-cape-support.patch \
+	file://beaglebone/0032-beaglebone-connect-batterycape-GPIO-to-gpio-charger.patch \
+	file://beaglebone/0033-beaglebone-add-support-for-CAN-and-RS232-cape.patch \
 "
-- 
1.7.10


