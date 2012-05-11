Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C80ADE01424
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7414C52A73; Fri, 11 May 2012 01:55:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015501.7414C52A73@arago-project.org>
Date: Fri, 11 May 2012 01:55:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: rebase patches onto latest git
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
X-List-Received-Date: Fri, 11 May 2012 01:55:02 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: aefc6c8c3c2d49ef0338004ed90da987f7cf6101
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=aefc6c8c3c2d49ef0338004ed90da987f7cf6101

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue May  8 16:29:09 2012 +0200

linux-ti33x-psp 3.2: rebase patches onto latest git

The psp tree added a patch to limit the beaglebone to 500MHz when powered by USB, which triggered conflicts in the patches. The 3.2.16 series has been rediffed as well, no functional changes.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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
 ...rebase-everything-onto-3.2-WARNING-MEGAPA.patch |   34 ++++----
 .../beaglebone/0004-more-beaglebone-merges.patch   |   18 ++--
 .../beaglebone/0005-beaglebone-disable-tsadc.patch |   10 +-
 ...general-purpose-mode-untested-with-touchs.patch |   32 +++---
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   14 ++--
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   10 +-
 ...cadc-make-stepconfig-channel-configurable.patch |   14 ++--
 .../0010-tscadc-Trigger-through-sysfs.patch        |   20 ++--
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   10 +-
 ...c-switch-to-polling-instead-of-interrupts.patch |   14 ++--
 .../beaglebone/0013-beaglebone-fix-ADC-init.patch  |   14 ++--
 .../beaglebone/0014-AM335x-MUX-add-ehrpwm1A.patch  |    6 +-
 ...enable-PWM-for-lcd-backlight-backlight-is.patch |   22 ++--
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |    6 +-
 ...set-default-brightness-to-50-for-pwm-back.patch |   10 +-
 ...P-framebuffer-driver-supporting-Adafruit-.patch |    6 +-
 ...019-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch |   20 ++--
 ...add-support-for-Towertech-TT3201-CAN-cape.patch |   18 ++--
 ...add-more-beagleboardtoys-cape-partnumbers.patch |   10 +-
 ...add-gpio-keys-for-lcd7-add-notes-for-miss.patch |   16 ++--
 ...23-beaglebone-add-enter-key-for-lcd7-cape.patch |   12 +-
 .../0024-beaglebone-add-gpio-keys-for-lcd.patch    |   12 +-
 ...025-beaglebone-fix-direction-of-gpio-keys.patch |   28 +++---
 .../0026-beaglebone-fix-3.5-lcd-cape-support.patch |   14 ++--
 ...decrease-PWM-frequency-to-old-value-LCD7-.patch |   12 +-
 .../0028-beaglebone-fix-ehrpwm-backlight.patch     |   12 +-
 ...0029-beaglebone-also-report-cape-revision.patch |   14 ++--
 ...don-t-compare-undefined-characters-it-mak.patch |   13 ++-
 ... => 0031-beaglebone-fix-3.5-cape-support.patch} |   14 ++--
 ...connect-batterycape-GPIO-to-gpio-charger.patch} |   16 ++--
 ...ebone-add-support-for-CAN-and-RS232-cape.patch} |   16 ++--
 ...eartbeat-stop-on-shutdown-reboot-or-panic.patch |    4 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  102 ++++++++++----------
 104 files changed, 499 insertions(+), 557 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=aefc6c8c3c2d49ef0338004ed90da987f7cf6101

