Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78E12E01206
	for <meta-ti@yoctoproject.org>; Mon,  7 May 2012 09:01:09 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so4057600wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 07 May 2012 09:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=oLb9yxhxEf1mBeDOzl2eAyXtT7qekFs0WznoRxC0ltA=;
	b=L1rzCCPqhtHUNwce8tNiXdm6u73Ez+yI44HwWCAquQrAhNsw5YBfSCgRbUJ6KvVJvc
	96OBX/9gKCm6FIapsAVMSKfuUDaYrCxSngDuJj5kTemTqgsTcdZYPuraz27MNvZa4DK2
	LdtEstJraF69VySTYnT0elb+Q8FY8v9sLxxKLZeOr9HnV8vZUYtXfRCbWIf1sSBxXQRM
	m3W4lY9xUL+IjqqSWupeM5uPwke36xPeqEzotF9TZsZdDlIO9BaD3N/ccb86wME+uOmq
	vYET/oqEk7SWKy7BEcbb+7cgSNqRHZSPaIkbrOcWoX/z3pNPmggzf/b7EsSCmaY/L3Ng
	KWgQ==
Received: by 10.180.81.166 with SMTP id b6mr36578213wiy.0.1336406468209;
	Mon, 07 May 2012 09:01:08 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id k6sm22542407wiy.7.2012.05.07.09.01.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 07 May 2012 09:01:04 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  7 May 2012 18:00:47 +0200
Message-Id: <1336406451-5345-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1336406451-5345-1-git-send-email-koen@dominion.thruhere.net>
References: <1336406451-5345-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnSAKeNOi9n6Q0AbuvreoMxZSJWYuvoR1zoC5e5Y6o9D/9BeG867r84tTUfOlJu++x05F6y
Cc: denys@ti.com
Subject: [PATCH v2 2/6] linux-ti335x-psp 3.2: update to 3.2.16
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
X-List-Received-Date: Mon, 07 May 2012 16:01:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

3.2.16 is the final release in the 3.2-stable series by Greg KH.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...-fix-a-bug-in-emitting-the-16-bit-immedia.patch |   36 +++
 ...002-tg3-Fix-5717-serdes-powerdown-problem.patch |   37 +++
 ...ont-overwrite-settings-for-PHY-Quick-link.patch |   42 ++++
 ...ev-fix-memcpy-bug-in-rose_set_mac_address.patch |   41 +++
 .../3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch      |   38 +++
 ...-PHY-access-a-bad-merge-undid-bug-fix-in-.patch |   49 ++++
 ...ASoC-wm8994-Update-WM8994-DCS-calibration.patch |   31 +++
 ...008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch |   52 ++++
 ...ntiq-reintroduce-support-for-cmdline-part.patch |   45 ++++
 ...mi-use-correct-member-for-checking-NAND_B.patch |   42 ++++
 .../0011-mtd-sst25l-initialize-writebufsize.patch  |   38 +++
 ...012-mtd-block2mtd-initialize-writebufsize.patch |   39 +++
 .../0013-mtd-lart-initialize-writebufsize.patch    |   37 +++
 .../3.2.15/0014-mtd-m25p80-set-writebufsize.patch  |   37 +++
 ...freq-clamping-for-throttling-per-package-.patch |  132 ++++++++++
 ...-Fix-device-ref-leaking-in-acpi_pnp_match.patch |   43 ++++
 ...CA-Fix-regression-in-FADT-revision-checks.patch |   69 +++++
 .../0018-modpost-fix-ALL_INIT_DATA_SECTIONS.patch  |   32 +++
 ...st-irq-thread-affinity-on-IRQ_SET_MASK_OK.patch |   55 ++++
 ...20-tracing-Fix-ftrace-stack-trace-entries.patch |   77 ++++++
 ...0021-tracing-Fix-ent_size-in-trace-output.patch |   58 +++++
 ...d-missing-platform-check-before-registeri.patch |   34 +++
 ...x-possible-tid_rx-reorder_timer-use-after.patch |   52 ++++
 ...8192ce-rtl8192cu-rtl8192de-Fix-low-gain-s.patch |   54 ++++
 ...e-requested-virtual-size-against-allocate.patch |   48 ++++
 ...0026-drm-radeon-kms-fix-fans-after-resume.patch |   75 ++++++
 .../0027-drm-i915-no-lvds-quirk-on-MSI-DC500.patch |   40 +++
 ...anitize-BIOS-debugging-bits-from-PIPECONF.patch |   62 +++++
 ...-Add-lock-on-drm_helper_resume_force_mode.patch |   37 +++
 ...0-drm-i915-quirk-away-broken-OpRegion-VBT.patch |   71 ++++++
 ...0031-r8169-runtime-resume-before-shutdown.patch |   57 +++++
 ...-Fix-unsupported-WRITE_SAME-sense-payload.patch |   54 ++++
 ...core-pass-the-breakpoint-struct-instead-o.patch |  180 +++++++++++++
 ...-Fix-kernel-oops-with-CONFIG_DEBUG_RODATA.patch |  121 +++++++++
 ...-2-fix-single-step-awareness-to-work-corr.patch |  212 ++++++++++++++++
 ...-2-fix-single-step-awareness-to-work-corr.patch |  266 ++++++++++++++++++++
 ...x-DEBUG_RODATA-limitation-using-text_poke.patch |  166 ++++++++++++
 ...IFS-Fix-VFS-lock-usage-for-oplocked-files.patch |   99 ++++++++
 ...-remove-Tegra30-errata-from-MACH_TEGRA_DT.patch |   40 +++
 ...ove-Fix-compile-error-by-including-module.patch |   36 +++
 ...tmel-mci-correct-data-timeout-computation.patch |   42 ++++
 ...abort-flag-for-gracefully-handling-exchan.patch |  102 ++++++++
 ...ot-free-tpg-structure-during-wq-allocatio.patch |   61 +++++
 ...write-access-to-dmesg_restrict-kptr_restr.patch |   72 ++++++
 ...Fix-modpost-license-checking-of-vmlinux.o.patch |   74 ++++++
 ...-use-host-bridge-_CRS-info-on-MSI-MS-7253.patch |   62 +++++
 ...not-tie-MSI-MS-7253-use_crs-quirk-to-BIOS.patch |   50 ++++
 ...048-TOMOYO-Fix-mount-flags-checking-order.patch |   91 +++++++
 ...ioapic-Add-register-level-checks-to-detec.patch |  100 ++++++++
 ...-acer-wmi-No-wifi-rfkill-on-Sony-machines.patch |   39 +++
 ...of-buffer-copied-in-__nfs4_get_acl_uncach.patch |   36 +++
 ...2-sched-x86-Fix-overflow-in-cyc2ns_offset.patch |   99 ++++++++
 ...ear-twl6030-IRQ-status-register-only-once.patch |   58 +++++
 ...orola-Rokr-E6-Id-to-the-USBNet-driver-zau.patch |   37 +++
 .../0055-ioat-fix-size-of-completion-for-Xen.patch |  209 +++++++++++++++
 .../0056-ASoC-ak4642-fixup-mute-needs-1-step.patch |   34 +++
 ...rocess-should-clear-child-replacement_ses.patch |   44 ++++
 ...ake-sure-IOMMU-interrupts-are-re-enabled-.patch |   76 ++++++
 ...h-Fix-l2cap-conn-failures-for-ssp-devices.patch |   43 ++++
 .../3.2.15/0060-Linux-3.2.15.patch                 |   24 ++
 ...sk-transcoder-select-bits-before-setting-.patch |   50 ++++
 ...deon-kms-fix-DVO-setup-on-some-r4xx-chips.patch |   39 +++
 ...ngbuffer-Exclude-last-2-cachlines-of-ring.patch |   34 +++
 ...only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch |   41 +++
 ...operly-compute-dp-dithering-for-user-crea.patch |  130 ++++++++++
 ...-i915-make-rc6-module-parameter-read-only.patch |   32 +++
 ...-missing-DMA-buffer-unmapping-for-PCI-dri.patch |   45 ++++
 ...79-1-DT-fix-atags_to_fdt-second-call-site.patch |   37 +++
 ...ThumbEE-Disable-userspace-TEEHBR-access-f.patch |   54 ++++
 ...revent-bitmap_daemon_work-running-while-i.patch |   42 ++++
 ...0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch |   51 ++++
 ...ci_ldisc-fix-NULL-pointer-dereference-on-.patch |  107 ++++++++
 ...s-scalability-issue-by-removing-extent-ca.patch |   93 +++++++
 ...14-ia64-fix-futex_atomic_cmpxchg_inatomic.patch |   58 +++++
 ...-rtc-pl031.c-enable-clock-on-all-ST-varia.patch |   39 +++
 ...getlb-fix-race-condition-in-hugetlb_fault.patch |   89 +++++++
 ...g-iio-hmc5843-Fix-crash-in-probe-function.patch |  107 ++++++++
 ...altera_uart-Check-for-NULL-platform_data-.patch |   42 ++++
 ...minate-obsolete-__handle_softirq-function.patch |   63 +++++
 .../0020-sparc64-Fix-bootup-crash-on-sun4v.patch   |   33 +++
 ...alize-scsi-host-max_sectors-for-tape-driv.patch |   35 +++
 ...csi-tape-io-with-more-than-255-scatter-ga.patch |   38 +++
 ...Catch-and-handle-out-of-date-hist-entry-m.patch |   59 +++++
 ...fb-Fix-oops-that-uvesafb-try-to-execute-N.patch |  118 +++++++++
 ...stale-jiffies-update-in-tick_nohz_restart.patch |   53 ++++
 .../0026-pch_uart-Fix-MSI-setting-issue.patch      |   43 ++++
 ...SB-serial-fix-race-between-probe-and-open.patch |   97 +++++++
 ...fix-DTR-RTS-being-raised-on-baud-rate-cha.patch |   37 +++
 ...re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch |   32 +++
 ...o-fix-status-line-change-handling-for-TIO.patch |   79 ++++++
 ...o-fix-race-condition-in-TIOCMIWAIT-and-ab.patch |  111 ++++++++
 ...ra-add-support-for-Sierra-Wireless-MC7710.patch |   30 +++
 ...t-clear-urb-dev-in-scatter-gather-library.patch |   85 +++++++
 ...don-t-ignore-suspend-errors-for-root-hubs.patch |   54 ++++
 .../0035-xhci-don-t-re-enable-IE-constantly.patch  |   58 +++++
 ...-t-write-zeroed-pointers-to-xHC-registers.patch |   78 ++++++
 ...tore-event-ring-dequeue-pointer-on-resume.patch |   39 +++
 ...-of-device-descriptor-got-from-superspeed.patch |   73 ++++++
 ...CI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch |   43 ++++
 ...orrect-the-define-XHCI_LEGACY_DISABLE_SMI.patch |   61 +++++
 ...041-fix-tlb-flushing-for-page-table-pages.patch |  240 ++++++++++++++++++
 ...042-serial-PL011-clear-pending-interrupts.patch |   82 ++++++
 ...0043-serial-PL011-move-interrupt-clearing.patch |   55 ++++
 ...-the-same-personality-flags-as-suid-when-.patch |   41 +++
 .../0045-ath9k-fix-max-noise-floor-threshold.patch |   56 +++++
 ...0046-xhci-Fix-register-save-restore-order.patch |   62 +++++
 ...ci_core-fix-NULL-pointer-dereference-at-u.patch |  133 ++++++++++
 ...pport-new-device-LAPIS-Semiconductor-ML78.patch |   63 +++++
 ...missing-spin_lock_init-in-gpio-pch-driver.patch |   35 +++
 ...0-usb-gadget-pch_udc-Fix-disconnect-issue.patch |   42 ++++
 ...usb-gadget-pch_udc-Fix-wrong-return-value.patch |   42 ++++
 ...-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch |   45 ++++
 ...pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch |  153 +++++++++++
 ...gadget-pch_udc-Reduce-redundant-interrupt.patch |   55 ++++
 ...to-allow-region-arguments-to-reference-ot.patch |   82 ++++++
 ...security-fix-compile-error-in-commoncap.c.patch |   37 +++
 ...057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch |   81 ++++++
 ...ory-corruption-calling-pch_gbe_validate_o.patch |   56 +++++
 ...port-new-device-LAPIS-Semiconductor-ML783.patch |   82 ++++++
 ...i-topcliff-pch-fix-Wuninitialized-warning.patch |   82 ++++++
 ...f-pch-Support-new-device-LAPIS-Semiconduc.patch |   76 ++++++
 ...dding-USB-device-13d3-3375-as-an-Atheros-.patch |   67 +++++
 ...etooth-Add-Atheros-maryann-PIDVID-support.patch |  119 +++++++++
 ...ooth-Add-support-for-BCM20702A0-0a5c-21e3.patch |   45 ++++
 ...t-leak-robust-list-to-unprivileged-proces.patch |  170 +++++++++++++
 ...kms-fix-the-regression-of-DVI-connector-c.patch |   39 +++
 .../0067-drm-radeon-disable-MSI-on-RV515.patch     |   37 +++
 ...fix-load-detect-on-rn50-with-hardcoded-ED.patch |   46 ++++
 .../3.2.16/0069-Linux-3.2.16.patch                 |   24 ++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  131 +++++++++-
 131 files changed, 8773 insertions(+), 3 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0001-x86-bpf_jit-fix-a-bug-in-emitting-the-16-bit-immedia.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0002-tg3-Fix-5717-serdes-powerdown-problem.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0003-sky2-dont-overwrite-settings-for-PHY-Quick-link.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0004-rose_dev-fix-memcpy-bug-in-rose_set_mac_address.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0006-Fix-non-TBI-PHY-access-a-bad-merge-undid-bug-fix-in-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0007-ASoC-wm8994-Update-WM8994-DCS-calibration.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0009-mtd-mips-lantiq-reintroduce-support-for-cmdline-part.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0010-mtd-nand-gpmi-use-correct-member-for-checking-NAND_B.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0011-mtd-sst25l-initialize-writebufsize.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0012-mtd-block2mtd-initialize-writebufsize.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0013-mtd-lart-initialize-writebufsize.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0014-mtd-m25p80-set-writebufsize.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0015-ACPI-Do-cpufreq-clamping-for-throttling-per-package-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0016-PNPACPI-Fix-device-ref-leaking-in-acpi_pnp_match.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0017-ACPICA-Fix-regression-in-FADT-revision-checks.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0018-modpost-fix-ALL_INIT_DATA_SECTIONS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0019-genirq-Adjust-irq-thread-affinity-on-IRQ_SET_MASK_OK.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0020-tracing-Fix-ftrace-stack-trace-entries.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0021-tracing-Fix-ent_size-in-trace-output.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0022-m68k-mac-Add-missing-platform-check-before-registeri.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0023-mac80211-fix-possible-tid_rx-reorder_timer-use-after.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0024-rtlwifi-rtl8192ce-rtl8192cu-rtl8192de-Fix-low-gain-s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0025-drm-Validate-requested-virtual-size-against-allocate.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0026-drm-radeon-kms-fix-fans-after-resume.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0027-drm-i915-no-lvds-quirk-on-MSI-DC500.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0028-drm-i915-Sanitize-BIOS-debugging-bits-from-PIPECONF.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0029-drm-i915-Add-lock-on-drm_helper_resume_force_mode.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0030-drm-i915-quirk-away-broken-OpRegion-VBT.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0031-r8169-runtime-resume-before-shutdown.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0032-target-Fix-unsupported-WRITE_SAME-sense-payload.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0033-kgdb-debug_core-pass-the-breakpoint-struct-instead-o.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0034-kgdbts-Fix-kernel-oops-with-CONFIG_DEBUG_RODATA.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0035-kgdbts-1-of-2-fix-single-step-awareness-to-work-corr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0036-kgdbts-2-of-2-fix-single-step-awareness-to-work-corr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0037-x86-kgdb-Fix-DEBUG_RODATA-limitation-using-text_poke.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0038-CIFS-Fix-VFS-lock-usage-for-oplocked-files.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0039-ARM-tegra-remove-Tegra30-errata-from-MACH_TEGRA_DT.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0040-mmc-sdhci-dove-Fix-compile-error-by-including-module.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0041-mmc-atmel-mci-correct-data-timeout-computation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0042-tcm_fc-Add-abort-flag-for-gracefully-handling-exchan.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0043-tcm_fc-Do-not-free-tpg-structure-during-wq-allocatio.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0044-sysctl-fix-write-access-to-dmesg_restrict-kptr_restr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0045-modpost-Fix-modpost-license-checking-of-vmlinux.o.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0046-x86-PCI-use-host-bridge-_CRS-info-on-MSI-MS-7253.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0047-x86-PCI-do-not-tie-MSI-MS-7253-use_crs-quirk-to-BIOS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0048-TOMOYO-Fix-mount-flags-checking-order.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0049-Revert-x86-ioapic-Add-register-level-checks-to-detec.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0050-acer-wmi-No-wifi-rfkill-on-Sony-machines.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0051-Fix-length-of-buffer-copied-in-__nfs4_get_acl_uncach.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0052-sched-x86-Fix-overflow-in-cyc2ns_offset.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0053-mfd-Clear-twl6030-IRQ-status-register-only-once.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0054-USB-Add-Motorola-Rokr-E6-Id-to-the-USBNet-driver-zau.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0055-ioat-fix-size-of-completion-for-Xen.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0056-ASoC-ak4642-fixup-mute-needs-1-step.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0057-cred-copy_process-should-clear-child-replacement_ses.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0058-iommu-amd-Make-sure-IOMMU-interrupts-are-re-enabled-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0059-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0060-Linux-3.2.15.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index c5926a8..e04da03 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r10"
+MACHINE_KERNEL_PR = "r11"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0001-x86-bpf_jit-fix-a-bug-in-emitting-the-16-bit-immedia.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0001-x86-bpf_jit-fix-a-bug-in-emitting-the-16-bit-immedia.patch
new file mode 100644
index 0000000..6ca5b96
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0001-x86-bpf_jit-fix-a-bug-in-emitting-the-16-bit-immedia.patch
@@ -0,0 +1,36 @@
+From 7e602bd1af2343c068cef31c272ffbb1f24e4569 Mon Sep 17 00:00:00 2001
+From: "zhuangfeiran@ict.ac.cn" <zhuangfeiran@ict.ac.cn>
+Date: Wed, 28 Mar 2012 23:27:00 +0000
+Subject: [PATCH 01/60] x86 bpf_jit: fix a bug in emitting the 16-bit
+ immediate operand of AND
+
+[ Upstream commit 1d24fb3684f347226747c6b11ea426b7b992694e ]
+
+When K >= 0xFFFF0000, AND needs the two least significant bytes of K as
+its operand, but EMIT2() gives it the least significant byte of K and
+0x2. EMIT() should be used here to replace EMIT2().
+
+Signed-off-by: Feiran Zhuang  <zhuangfeiran@ict.ac.cn>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/net/bpf_jit_comp.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
+index 5671752..5a5b6e4 100644
+--- a/arch/x86/net/bpf_jit_comp.c
++++ b/arch/x86/net/bpf_jit_comp.c
+@@ -289,7 +289,7 @@ void bpf_jit_compile(struct sk_filter *fp)
+ 					EMIT2(0x24, K & 0xFF); /* and imm8,%al */
+ 				} else if (K >= 0xFFFF0000) {
+ 					EMIT2(0x66, 0x25);	/* and imm16,%ax */
+-					EMIT2(K, 2);
++					EMIT(K, 2);
+ 				} else {
+ 					EMIT1_off32(0x25, K);	/* and imm32,%eax */
+ 				}
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0002-tg3-Fix-5717-serdes-powerdown-problem.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0002-tg3-Fix-5717-serdes-powerdown-problem.patch
new file mode 100644
index 0000000..1a703dc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0002-tg3-Fix-5717-serdes-powerdown-problem.patch
@@ -0,0 +1,37 @@
+From 1ac4686cd4465f081e95dc1f6de93bb6f5157a48 Mon Sep 17 00:00:00 2001
+From: Matt Carlson <mcarlson@broadcom.com>
+Date: Mon, 2 Apr 2012 09:01:40 +0000
+Subject: [PATCH 02/60] tg3: Fix 5717 serdes powerdown problem
+
+[ Upstream commit 085f1afc56619bda424941412fdeaff1e32c21dc ]
+
+If port 0 of a 5717 serdes device powers down, it hides the phy from
+port 1.  This patch works around the problem by keeping port 0's phy
+powered up.
+
+Signed-off-by: Matt Carlson <mcarlson@broadcom.com>
+Signed-off-by: Michael Chan <mchan@broadcom.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/broadcom/tg3.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
+index bf40741..3d55883 100644
+--- a/drivers/net/ethernet/broadcom/tg3.c
++++ b/drivers/net/ethernet/broadcom/tg3.c
+@@ -2794,7 +2794,9 @@ static void tg3_power_down_phy(struct tg3 *tp, bool do_low_power)
+ 	if (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5700 ||
+ 	    GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5704 ||
+ 	    (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5780 &&
+-	     (tp->phy_flags & TG3_PHYFLG_MII_SERDES)))
++	     (tp->phy_flags & TG3_PHYFLG_MII_SERDES)) ||
++	    (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5717 &&
++	     !tp->pci_fn))
+ 		return;
+ 
+ 	if (GET_CHIP_REV(tp->pci_chip_rev_id) == CHIPREV_5784_AX ||
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0003-sky2-dont-overwrite-settings-for-PHY-Quick-link.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0003-sky2-dont-overwrite-settings-for-PHY-Quick-link.patch
new file mode 100644
index 0000000..38890ec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0003-sky2-dont-overwrite-settings-for-PHY-Quick-link.patch
@@ -0,0 +1,42 @@
+From 52136862cecf42801481b683e0c316e9bc7658ee Mon Sep 17 00:00:00 2001
+From: Lino Sanfilippo <LinoSanfilippo@gmx.de>
+Date: Fri, 30 Mar 2012 07:28:59 +0000
+Subject: [PATCH 03/60] sky2: dont overwrite settings for PHY Quick link
+
+[ Upstream commit 2240eb4ae3dc4acff20d1a8947c441c451513e37 ]
+
+This patch corrects a bug in function sky2_open() of the Marvell Yukon 2 driver
+in which the settings for PHY quick link are overwritten.
+
+Signed-off-by: Lino Sanfilippo <LinoSanfilippo@gmx.de>
+Acked-by: Stephen Hemminger <shemminger@vyattta.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/marvell/sky2.c |    5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
+index f612b35..7eb8a00 100644
+--- a/drivers/net/ethernet/marvell/sky2.c
++++ b/drivers/net/ethernet/marvell/sky2.c
+@@ -1766,13 +1766,14 @@ static int sky2_open(struct net_device *dev)
+ 
+ 	sky2_hw_up(sky2);
+ 
++	/* Enable interrupts from phy/mac for port */
++	imask = sky2_read32(hw, B0_IMSK);
++
+ 	if (hw->chip_id == CHIP_ID_YUKON_OPT ||
+ 	    hw->chip_id == CHIP_ID_YUKON_PRM ||
+ 	    hw->chip_id == CHIP_ID_YUKON_OP_2)
+ 		imask |= Y2_IS_PHY_QLNK;	/* enable PHY Quick Link */
+ 
+-	/* Enable interrupts from phy/mac for port */
+-	imask = sky2_read32(hw, B0_IMSK);
+ 	imask |= portirq_msk[port];
+ 	sky2_write32(hw, B0_IMSK, imask);
+ 	sky2_read32(hw, B0_IMSK);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0004-rose_dev-fix-memcpy-bug-in-rose_set_mac_address.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0004-rose_dev-fix-memcpy-bug-in-rose_set_mac_address.patch
new file mode 100644
index 0000000..6e7fb2e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0004-rose_dev-fix-memcpy-bug-in-rose_set_mac_address.patch
@@ -0,0 +1,41 @@
+From 1ea3a4959cbe6145d661bd86ad83f70a61927974 Mon Sep 17 00:00:00 2001
+From: "danborkmann@iogearbox.net" <danborkmann@iogearbox.net>
+Date: Tue, 27 Mar 2012 22:47:43 +0000
+Subject: [PATCH 04/60] rose_dev: fix memcpy-bug in rose_set_mac_address
+
+[ Upstream commit 81213b5e8ae68e204aa7a3f83c4f9100405dbff9 ]
+
+If both addresses equal, nothing needs to be done. If the device is down,
+then we simply copy the new address to dev->dev_addr. If the device is up,
+then we add another loopback device with the new address, and if that does
+not fail, we remove the loopback device with the old address. And only
+then, we update the dev->dev_addr.
+
+Signed-off-by: Daniel Borkmann <daniel.borkmann@tik.ee.ethz.ch>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/rose/rose_dev.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/net/rose/rose_dev.c b/net/rose/rose_dev.c
+index 178ff4f..2679507 100644
+--- a/net/rose/rose_dev.c
++++ b/net/rose/rose_dev.c
+@@ -96,11 +96,11 @@ static int rose_set_mac_address(struct net_device *dev, void *addr)
+ 	struct sockaddr *sa = addr;
+ 	int err;
+ 
+-	if (!memcpy(dev->dev_addr, sa->sa_data, dev->addr_len))
++	if (!memcmp(dev->dev_addr, sa->sa_data, dev->addr_len))
+ 		return 0;
+ 
+ 	if (dev->flags & IFF_UP) {
+-		err = rose_add_loopback_node((rose_address *)dev->dev_addr);
++		err = rose_add_loopback_node((rose_address *)sa->sa_data);
+ 		if (err)
+ 			return err;
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch
new file mode 100644
index 0000000..42e8bde
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch
@@ -0,0 +1,38 @@
+From 1a9aa23e139f1305c1b8e1609e8275ed7456c9ba Mon Sep 17 00:00:00 2001
+From: Rabin Vincent <rabin@rab.in>
+Date: Thu, 29 Mar 2012 07:15:15 +0000
+Subject: [PATCH 05/60] net: usb: cdc_eem: fix mtu
+
+[ Upstream commit 78fb72f7936c01d5b426c03a691eca082b03f2b9 ]
+
+Make CDC EEM recalculate the hard_mtu after adjusting the
+hard_header_len.
+
+Without this, usbnet adjusts the MTU down to 1494 bytes, and the host is
+unable to receive standard 1500-byte frames from the device.
+
+Tested with the Linux USB Ethernet gadget.
+
+Cc: Oliver Neukum <oliver@neukum.name>
+Signed-off-by: Rabin Vincent <rabin@rab.in>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/usb/cdc_eem.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/net/usb/cdc_eem.c b/drivers/net/usb/cdc_eem.c
+index 882f53f..82d43b2 100644
+--- a/drivers/net/usb/cdc_eem.c
++++ b/drivers/net/usb/cdc_eem.c
+@@ -93,6 +93,7 @@ static int eem_bind(struct usbnet *dev, struct usb_interface *intf)
+ 	/* no jumbogram (16K) support for now */
+ 
+ 	dev->net->hard_header_len += EEM_HEAD + ETH_FCS_LEN;
++	dev->hard_mtu = dev->net->mtu + dev->net->hard_header_len;
+ 
+ 	return 0;
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0006-Fix-non-TBI-PHY-access-a-bad-merge-undid-bug-fix-in-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0006-Fix-non-TBI-PHY-access-a-bad-merge-undid-bug-fix-in-.patch
new file mode 100644
index 0000000..f4cf933
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0006-Fix-non-TBI-PHY-access-a-bad-merge-undid-bug-fix-in-.patch
@@ -0,0 +1,49 @@
+From 5d9449356576f8bb42022c55e966a6d00a27d810 Mon Sep 17 00:00:00 2001
+From: Kenth Eriksson <kenth.eriksson@transmode.com>
+Date: Tue, 27 Mar 2012 22:05:54 +0000
+Subject: [PATCH 06/60] Fix non TBI PHY access; a bad merge undid bug fix in a
+ previous commit.
+
+[ Upstream commit 464b57da56910c8737ede75ad820b9a7afc46b3e ]
+
+The merge done in commit b26e478f undid bug fix in commit c3e072f8
+("net: fsl_pq_mdio: fix non tbi phy access"), with the result that non
+TBI (e.g. MDIO) PHYs cannot be accessed.
+
+Signed-off-by: Kenth Eriksson <kenth.eriksson@transmode.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/freescale/fsl_pq_mdio.c |   13 ++++++-------
+ 1 file changed, 6 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/net/ethernet/freescale/fsl_pq_mdio.c b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
+index 4d9f84b..ada234a 100644
+--- a/drivers/net/ethernet/freescale/fsl_pq_mdio.c
++++ b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
+@@ -356,16 +356,15 @@ static int fsl_pq_mdio_probe(struct platform_device *ofdev)
+ 
+ 		if (prop)
+ 			tbiaddr = *prop;
+-	}
+-
+-	if (tbiaddr == -1) {
+-		err = -EBUSY;
+ 
+-		goto err_free_irqs;
++		if (tbiaddr == -1) {
++			err = -EBUSY;
++			goto err_free_irqs;
++		} else {
++			out_be32(tbipa, tbiaddr);
++		}
+ 	}
+ 
+-	out_be32(tbipa, tbiaddr);
+-
+ 	err = of_mdiobus_register(new_bus, np);
+ 	if (err) {
+ 		printk (KERN_ERR "%s: Cannot register as MDIO bus\n",
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0007-ASoC-wm8994-Update-WM8994-DCS-calibration.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0007-ASoC-wm8994-Update-WM8994-DCS-calibration.patch
new file mode 100644
index 0000000..b52abe1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0007-ASoC-wm8994-Update-WM8994-DCS-calibration.patch
@@ -0,0 +1,31 @@
+From be6768ee3f1d5ade04946ae2d9b9642e795b4dc3 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Wed, 21 Mar 2012 13:22:40 +0000
+Subject: [PATCH 07/60] ASoC: wm8994: Update WM8994 DCS calibration
+
+commit e16605855d58803fe0608417150c7a618b4f8243 upstream.
+
+Based on latest production information.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm8994.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
+index 6e502af..2f1f5f8 100644
+--- a/sound/soc/codecs/wm8994.c
++++ b/sound/soc/codecs/wm8994.c
+@@ -3190,7 +3190,7 @@ static int wm8994_codec_probe(struct snd_soc_codec *codec)
+ 		case 2:
+ 		case 3:
+ 			wm8994->hubs.dcs_codes_l = -9;
+-			wm8994->hubs.dcs_codes_r = -5;
++			wm8994->hubs.dcs_codes_r = -7;
+ 			break;
+ 		default:
+ 			break;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch
new file mode 100644
index 0000000..b704a97
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch
@@ -0,0 +1,52 @@
+From 5afee8ffbb086ee0d779cba829f1d0faa0f35b9c Mon Sep 17 00:00:00 2001
+From: Marc Kleine-Budde <mkl@blackshift.org>
+Date: Wed, 8 Feb 2012 20:24:29 +0100
+Subject: [PATCH 08/60] mtd: ixp4xx: oops in ixp4xx_flash_probe
+
+commit a3c1e3b732b3708a80e4035b9d845f3f7c7dd0c9 upstream.
+
+In commit "c797533 mtd: abstract last MTD partition parser argument" the
+third argument of "mtd_device_parse_register()" changed from start address
+of the MTD device to a pointer to a struct.
+
+The "ixp4xx_flash_probe()" function was not converted properly, causing
+an oops during boot.
+
+This patch fixes the problem by filling the needed information into a
+"struct mtd_part_parser_data" and passing it to
+"mtd_device_parse_register()".
+
+Signed-off-by: Marc Kleine-Budde <mkl@blackshift.org>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/maps/ixp4xx.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/maps/ixp4xx.c b/drivers/mtd/maps/ixp4xx.c
+index 3040901..696372f 100644
+--- a/drivers/mtd/maps/ixp4xx.c
++++ b/drivers/mtd/maps/ixp4xx.c
+@@ -182,6 +182,9 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
+ {
+ 	struct flash_platform_data *plat = dev->dev.platform_data;
+ 	struct ixp4xx_flash_info *info;
++	struct mtd_part_parser_data ppdata = {
++		.origin = dev->resource->start,
++	};
+ 	int err = -1;
+ 
+ 	if (!plat)
+@@ -247,7 +250,7 @@ static int ixp4xx_flash_probe(struct platform_device *dev)
+ 	/* Use the fast version */
+ 	info->map.write = ixp4xx_write16;
+ 
+-	err = mtd_device_parse_register(info->mtd, probes, dev->resource->start,
++	err = mtd_device_parse_register(info->mtd, probes, &ppdata,
+ 			plat->parts, plat->nr_parts);
+ 	if (err) {
+ 		printk(KERN_ERR "Could not parse partitions\n");
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0009-mtd-mips-lantiq-reintroduce-support-for-cmdline-part.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0009-mtd-mips-lantiq-reintroduce-support-for-cmdline-part.patch
new file mode 100644
index 0000000..5d9a1e6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0009-mtd-mips-lantiq-reintroduce-support-for-cmdline-part.patch
@@ -0,0 +1,45 @@
+From 1f6651f5448df6b40e8feafccceed942f192a430 Mon Sep 17 00:00:00 2001
+From: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
+Date: Thu, 23 Feb 2012 17:59:49 +0100
+Subject: [PATCH 09/60] mtd: mips: lantiq: reintroduce support for cmdline
+ partitions
+
+commit bf011f2ed53d587fdd8148c173c4f09ed77bdf1a upstream.
+
+Since commit ca97dec2ab5c87e9fbdf7e882e1820004a3966fa the
+command line parsing of MTD partitions does not work anymore.
+
+Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>
+Signed-off-by: John Crispin <blogic@openwrt.org>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Acked-by: John Crispin <blogic@openwrt.org>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/maps/lantiq-flash.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
+index 4f10e27..764d468 100644
+--- a/drivers/mtd/maps/lantiq-flash.c
++++ b/drivers/mtd/maps/lantiq-flash.c
+@@ -45,6 +45,7 @@ struct ltq_mtd {
+ };
+ 
+ static char ltq_map_name[] = "ltq_nor";
++static const char *ltq_probe_types[] __devinitconst = { "cmdlinepart", NULL };
+ 
+ static map_word
+ ltq_read16(struct map_info *map, unsigned long adr)
+@@ -168,7 +169,7 @@ ltq_mtd_probe(struct platform_device *pdev)
+ 	cfi->addr_unlock1 ^= 1;
+ 	cfi->addr_unlock2 ^= 1;
+ 
+-	err = mtd_device_parse_register(ltq_mtd->mtd, NULL, 0,
++	err = mtd_device_parse_register(ltq_mtd->mtd, ltq_probe_types, 0,
+ 			ltq_mtd_data->parts, ltq_mtd_data->nr_parts);
+ 	if (err) {
+ 		dev_err(&pdev->dev, "failed to add partitions\n");
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0010-mtd-nand-gpmi-use-correct-member-for-checking-NAND_B.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0010-mtd-nand-gpmi-use-correct-member-for-checking-NAND_B.patch
new file mode 100644
index 0000000..e7cbea3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0010-mtd-nand-gpmi-use-correct-member-for-checking-NAND_B.patch
@@ -0,0 +1,42 @@
+From a34ab661a8d66083d7e6bd4ff4e9d6758699d8ab Mon Sep 17 00:00:00 2001
+From: Wolfram Sang <w.sang@pengutronix.de>
+Date: Tue, 31 Jan 2012 13:10:43 +0100
+Subject: [PATCH 10/60] mtd: nand: gpmi: use correct member for checking
+ NAND_BBT_USE_FLASH
+
+commit 5289966ea576a062b80319975b31b661c196ff9d upstream.
+
+This has been moved from .options to .bbt_options meanwhile. So, it
+currently checks for something totally different (NAND_OWN_BUFFERS) and
+decides according to that.
+
+Artem Bityutskiy: the options were moved in
+a40f734 mtd: nand: consolidate redundant flash-based BBT flags
+
+Artem Bityutskiy: CCing -stable
+
+Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
+Acked-by: Huang Shijie <b32955@freescale.com>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/nand/gpmi-nand/gpmi-nand.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+index 493ec2f..f39f83e 100644
+--- a/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
++++ b/drivers/mtd/nand/gpmi-nand/gpmi-nand.c
+@@ -1124,7 +1124,7 @@ static int gpmi_block_markbad(struct mtd_info *mtd, loff_t ofs)
+ 		chip->bbt[block >> 2] |= 0x01 << ((block & 0x03) << 1);
+ 
+ 	/* Do we have a flash based bad block table ? */
+-	if (chip->options & NAND_BBT_USE_FLASH)
++	if (chip->bbt_options & NAND_BBT_USE_FLASH)
+ 		ret = nand_update_bbt(mtd, ofs);
+ 	else {
+ 		chipnr = (int)(ofs >> chip->chip_shift);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0011-mtd-sst25l-initialize-writebufsize.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0011-mtd-sst25l-initialize-writebufsize.patch
new file mode 100644
index 0000000..3fc3000
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0011-mtd-sst25l-initialize-writebufsize.patch
@@ -0,0 +1,38 @@
+From 187a3e03c6c3ddb6ec2a62402f9df4e26ea59d96 Mon Sep 17 00:00:00 2001
+From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Date: Fri, 3 Feb 2012 10:16:50 +0200
+Subject: [PATCH 11/60] mtd: sst25l: initialize writebufsize
+
+commit c4cc625ea5958d065c21cc0fcea29e9ed8f3d2bc upstream.
+
+The writebufsize concept was introduce by commit
+"0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
+the maximum amount of data the device writes to the media at a time. This is
+an important parameter for UBIFS which is used during recovery and which
+basically defines how big a corruption caused by a power cut can be.
+
+Set writebufsize to the flash page size because it is the maximum amount of
+data it writes at a time.
+
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/devices/sst25l.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/mtd/devices/sst25l.c b/drivers/mtd/devices/sst25l.c
+index d38ef3b..9c35250 100644
+--- a/drivers/mtd/devices/sst25l.c
++++ b/drivers/mtd/devices/sst25l.c
+@@ -402,6 +402,7 @@ static int __devinit sst25l_probe(struct spi_device *spi)
+ 	flash->mtd.flags	= MTD_CAP_NORFLASH;
+ 	flash->mtd.erasesize	= flash_info->erase_size;
+ 	flash->mtd.writesize	= flash_info->page_size;
++	flash->mtd.writebufsize	= flash_info->page_size;
+ 	flash->mtd.size		= flash_info->page_size * flash_info->nr_pages;
+ 	flash->mtd.erase	= sst25l_erase;
+ 	flash->mtd.read		= sst25l_read;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0012-mtd-block2mtd-initialize-writebufsize.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0012-mtd-block2mtd-initialize-writebufsize.patch
new file mode 100644
index 0000000..1a57dc3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0012-mtd-block2mtd-initialize-writebufsize.patch
@@ -0,0 +1,39 @@
+From e9ade583fc6f98a39805d5cb7eba7048eaf17575 Mon Sep 17 00:00:00 2001
+From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Date: Fri, 3 Feb 2012 09:32:44 +0200
+Subject: [PATCH 12/60] mtd: block2mtd: initialize writebufsize
+
+commit b604387411ec6a072e95910099262616edd2bd2f upstream.
+
+The writebufsize concept was introduce by commit
+"0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
+the maximum amount of data the device writes to the media at a time. This is
+an important parameter for UBIFS which is used during recovery and which
+basically defines how big a corruption caused by a power cut can be.
+
+However, we forgot to set this parameter for block2mtd. Set it to PAGE_SIZE
+because this is actually the amount of data we write at a time.
+
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Acked-by: Joern Engel <joern@lazybastard.org>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/devices/block2mtd.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/mtd/devices/block2mtd.c b/drivers/mtd/devices/block2mtd.c
+index b78f231..8cd983c 100644
+--- a/drivers/mtd/devices/block2mtd.c
++++ b/drivers/mtd/devices/block2mtd.c
+@@ -284,6 +284,7 @@ static struct block2mtd_dev *add_device(char *devname, int erase_size)
+ 	dev->mtd.size = dev->blkdev->bd_inode->i_size & PAGE_MASK;
+ 	dev->mtd.erasesize = erase_size;
+ 	dev->mtd.writesize = 1;
++	dev->mtd.writebufsize = PAGE_SIZE;
+ 	dev->mtd.type = MTD_RAM;
+ 	dev->mtd.flags = MTD_CAP_RAM;
+ 	dev->mtd.erase = block2mtd_erase;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0013-mtd-lart-initialize-writebufsize.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0013-mtd-lart-initialize-writebufsize.patch
new file mode 100644
index 0000000..12aaba0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0013-mtd-lart-initialize-writebufsize.patch
@@ -0,0 +1,37 @@
+From 377b1a9ee6412981a7c01ea196c81401ded07d97 Mon Sep 17 00:00:00 2001
+From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Date: Fri, 3 Feb 2012 09:53:28 +0200
+Subject: [PATCH 13/60] mtd: lart: initialize writebufsize
+
+commit fcc44a07dae0af16e84e93425fc8afe642ddc603 upstream.
+
+The writebufsize concept was introduce by commit
+"0e4ca7e mtd: add writebufsize field to mtd_info struct" and it represents
+the maximum amount of data the device writes to the media at a time. This is
+an important parameter for UBIFS which is used during recovery and which
+basically defines how big a corruption caused by a power cut can be.
+
+Set writebufsize to 4 because this drivers writes at max 4 bytes at a time.
+
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/devices/lart.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/mtd/devices/lart.c b/drivers/mtd/devices/lart.c
+index 3a11ea6..5f12668 100644
+--- a/drivers/mtd/devices/lart.c
++++ b/drivers/mtd/devices/lart.c
+@@ -630,6 +630,7 @@ static int __init lart_flash_init (void)
+    mtd.name = module_name;
+    mtd.type = MTD_NORFLASH;
+    mtd.writesize = 1;
++   mtd.writebufsize = 4;
+    mtd.flags = MTD_CAP_NORFLASH;
+    mtd.size = FLASH_BLOCKSIZE_PARAM * FLASH_NUMBLOCKS_16m_PARAM + FLASH_BLOCKSIZE_MAIN * FLASH_NUMBLOCKS_16m_MAIN;
+    mtd.erasesize = FLASH_BLOCKSIZE_MAIN;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0014-mtd-m25p80-set-writebufsize.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0014-mtd-m25p80-set-writebufsize.patch
new file mode 100644
index 0000000..6c7ac61
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0014-mtd-m25p80-set-writebufsize.patch
@@ -0,0 +1,37 @@
+From 60498eb2c6666663bf2d0f09d805048e32108fe8 Mon Sep 17 00:00:00 2001
+From: Brian Norris <computersforpeace@gmail.com>
+Date: Tue, 31 Jan 2012 00:06:03 -0800
+Subject: [PATCH 14/60] mtd: m25p80: set writebufsize
+
+commit b54f47c8bcfc5f766bf13ec31bd7dd1d4726d33b upstream.
+
+Using UBI on m25p80 can give messages like:
+
+    UBI error: io_init: bad write buffer size 0 for 1 min. I/O unit
+
+We need to initialize writebufsize; I think "page_size" is the correct
+"bufsize", although I'm not sure. Comments?
+
+Signed-off-by: Brian Norris <computersforpeace@gmail.com>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/devices/m25p80.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
+index 884904d..9f9982f 100644
+--- a/drivers/mtd/devices/m25p80.c
++++ b/drivers/mtd/devices/m25p80.c
+@@ -932,6 +932,7 @@ static int __devinit m25p_probe(struct spi_device *spi)
+ 	ppdata.of_node = spi->dev.of_node;
+ 	flash->mtd.dev.parent = &spi->dev;
+ 	flash->page_size = info->page_size;
++	flash->mtd.writebufsize = flash->page_size;
+ 
+ 	if (info->addr_width)
+ 		flash->addr_width = info->addr_width;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0015-ACPI-Do-cpufreq-clamping-for-throttling-per-package-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0015-ACPI-Do-cpufreq-clamping-for-throttling-per-package-.patch
new file mode 100644
index 0000000..5a9fe06
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0015-ACPI-Do-cpufreq-clamping-for-throttling-per-package-.patch
@@ -0,0 +1,132 @@
+From 74dd093eb7fe9227cbcf62d0d9467d679a46982b Mon Sep 17 00:00:00 2001
+From: Andi Kleen <andi@firstfloor.org>
+Date: Mon, 6 Feb 2012 08:17:11 -0800
+Subject: [PATCH 15/60] ACPI: Do cpufreq clamping for throttling per package
+ v2
+
+commit 2815ab92ba3ab27556212cc306288dc95692824b upstream.
+
+On Intel CPUs the processor typically uses the highest frequency
+set by any logical CPU. When the system overheats
+Linux first forces the frequency to the lowest available one
+to lower the temperature.
+
+However this was done only per logical CPU, which means all
+logical CPUs in a package would need to go through this before
+the frequency is actually lowered.
+
+Worse this delay actually prevents real throttling, because
+the real throttle code only proceeds when the lowest frequency
+is already reached.
+
+So when a throttle event happens force the lowest frequency
+for all CPUs in the package where it happened. The per CPU
+state is now kept per package, not per logical CPU. An alternative
+would be to do it per cpufreq unit, but since we want to bring
+down the temperature of the complete chip it's better
+to do it for all.
+
+In principle it may even make sense to do it for all CPUs,
+but I kept it on the package for now.
+
+With this change the frequency is actually lowered, which
+in terms also allows real throttling to proceed.
+
+I also removed an unnecessary per cpu variable initialization.
+
+v2: Fix package mapping
+
+Signed-off-by: Andi Kleen <ak@linux.intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/acpi/processor_thermal.c |   45 +++++++++++++++++++++++++++++++-------
+ 1 file changed, 37 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/acpi/processor_thermal.c b/drivers/acpi/processor_thermal.c
+index 870550d..4da7d9d 100644
+--- a/drivers/acpi/processor_thermal.c
++++ b/drivers/acpi/processor_thermal.c
+@@ -58,6 +58,27 @@ ACPI_MODULE_NAME("processor_thermal");
+ static DEFINE_PER_CPU(unsigned int, cpufreq_thermal_reduction_pctg);
+ static unsigned int acpi_thermal_cpufreq_is_init = 0;
+ 
++#define reduction_pctg(cpu) \
++	per_cpu(cpufreq_thermal_reduction_pctg, phys_package_first_cpu(cpu))
++
++/*
++ * Emulate "per package data" using per cpu data (which should really be
++ * provided elsewhere)
++ *
++ * Note we can lose a CPU on cpu hotunplug, in this case we forget the state
++ * temporarily. Fortunately that's not a big issue here (I hope)
++ */
++static int phys_package_first_cpu(int cpu)
++{
++	int i;
++	int id = topology_physical_package_id(cpu);
++
++	for_each_online_cpu(i)
++		if (topology_physical_package_id(i) == id)
++			return i;
++	return 0;
++}
++
+ static int cpu_has_cpufreq(unsigned int cpu)
+ {
+ 	struct cpufreq_policy policy;
+@@ -77,7 +98,7 @@ static int acpi_thermal_cpufreq_notifier(struct notifier_block *nb,
+ 
+ 	max_freq = (
+ 	    policy->cpuinfo.max_freq *
+-	    (100 - per_cpu(cpufreq_thermal_reduction_pctg, policy->cpu) * 20)
++	    (100 - reduction_pctg(policy->cpu) * 20)
+ 	) / 100;
+ 
+ 	cpufreq_verify_within_limits(policy, 0, max_freq);
+@@ -103,16 +124,28 @@ static int cpufreq_get_cur_state(unsigned int cpu)
+ 	if (!cpu_has_cpufreq(cpu))
+ 		return 0;
+ 
+-	return per_cpu(cpufreq_thermal_reduction_pctg, cpu);
++	return reduction_pctg(cpu);
+ }
+ 
+ static int cpufreq_set_cur_state(unsigned int cpu, int state)
+ {
++	int i;
++
+ 	if (!cpu_has_cpufreq(cpu))
+ 		return 0;
+ 
+-	per_cpu(cpufreq_thermal_reduction_pctg, cpu) = state;
+-	cpufreq_update_policy(cpu);
++	reduction_pctg(cpu) = state;
++
++	/*
++	 * Update all the CPUs in the same package because they all
++	 * contribute to the temperature and often share the same
++	 * frequency.
++	 */
++	for_each_online_cpu(i) {
++		if (topology_physical_package_id(i) ==
++		    topology_physical_package_id(cpu))
++			cpufreq_update_policy(i);
++	}
+ 	return 0;
+ }
+ 
+@@ -120,10 +153,6 @@ void acpi_thermal_cpufreq_init(void)
+ {
+ 	int i;
+ 
+-	for (i = 0; i < nr_cpu_ids; i++)
+-		if (cpu_present(i))
+-			per_cpu(cpufreq_thermal_reduction_pctg, i) = 0;
+-
+ 	i = cpufreq_register_notifier(&acpi_thermal_cpufreq_notifier_block,
+ 				      CPUFREQ_POLICY_NOTIFIER);
+ 	if (!i)
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0016-PNPACPI-Fix-device-ref-leaking-in-acpi_pnp_match.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0016-PNPACPI-Fix-device-ref-leaking-in-acpi_pnp_match.patch
new file mode 100644
index 0000000..3e12d94
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0016-PNPACPI-Fix-device-ref-leaking-in-acpi_pnp_match.patch
@@ -0,0 +1,43 @@
+From 2d081f28eff72e6dec19f1e720a03ee656e93902 Mon Sep 17 00:00:00 2001
+From: Yinghai Lu <yinghai@kernel.org>
+Date: Sat, 3 Mar 2012 13:29:20 -0800
+Subject: [PATCH 16/60] PNPACPI: Fix device ref leaking in acpi_pnp_match
+
+commit 89e96ada572fb216e582dbe3f64e1a6939a37f74 upstream.
+
+During testing pci root bus removal, found some root bus bridge is not freed.
+If booting with pnpacpi=off, those hostbridge could be freed without problem.
+It turns out that some devices reference are not released during acpi_pnp_match.
+that match should not hold one device ref during every calling.
+Add pu_device calling before returning.
+
+Signed-off-by: Yinghai Lu <yinghai@kernel.org>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/pnp/pnpacpi/core.c |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/pnp/pnpacpi/core.c b/drivers/pnp/pnpacpi/core.c
+index b00c176..d21e8f5 100644
+--- a/drivers/pnp/pnpacpi/core.c
++++ b/drivers/pnp/pnpacpi/core.c
+@@ -321,9 +321,14 @@ static int __init acpi_pnp_match(struct device *dev, void *_pnp)
+ {
+ 	struct acpi_device *acpi = to_acpi_device(dev);
+ 	struct pnp_dev *pnp = _pnp;
++	struct device *physical_device;
++
++	physical_device = acpi_get_physical_device(acpi->handle);
++	if (physical_device)
++		put_device(physical_device);
+ 
+ 	/* true means it matched */
+-	return !acpi_get_physical_device(acpi->handle)
++	return !physical_device
+ 	    && compare_pnp_id(pnp->id, acpi_device_hid(acpi));
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0017-ACPICA-Fix-regression-in-FADT-revision-checks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0017-ACPICA-Fix-regression-in-FADT-revision-checks.patch
new file mode 100644
index 0000000..05e05f3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0017-ACPICA-Fix-regression-in-FADT-revision-checks.patch
@@ -0,0 +1,69 @@
+From 3dc8e6e70444a964715bc72938d2a1f5330a0aff Mon Sep 17 00:00:00 2001
+From: Julian Anastasov <ja@ssi.bg>
+Date: Thu, 23 Feb 2012 22:40:43 +0200
+Subject: [PATCH 17/60] ACPICA: Fix regression in FADT revision checks
+
+commit 3e80acd1af40fcd91a200b0416a7616b20c5d647 upstream.
+
+	commit 64b3db22c04586997ab4be46dd5a5b99f8a2d390 (2.6.39),
+"Remove use of unreliable FADT revision field" causes regression
+for old P4 systems because now cst_control and other fields are
+not reset to 0.
+
+	The effect is that acpi_processor_power_init will notice
+cst_control != 0 and a write to CST_CNT register is performed
+that should not happen. As result, the system oopses after the
+"No _CST, giving up" message, sometimes in acpi_ns_internalize_name,
+sometimes in acpi_ns_get_type, usually at random places. May be
+during migration to CPU 1 in acpi_processor_get_throttling.
+
+	Every one of these settings help to avoid this problem:
+ - acpi=off
+ - processor.nocst=1
+ - maxcpus=1
+
+	The fix is to update acpi_gbl_FADT.header.length after
+the original value is used to check for old revisions.
+
+https://bugzilla.kernel.org/show_bug.cgi?id=42700
+https://bugzilla.redhat.com/show_bug.cgi?id=727865
+
+Signed-off-by: Julian Anastasov <ja@ssi.bg>
+Acked-by: Bob Moore <robert.moore@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Cc: Jonathan Nieder <jrnieder@gmail.com>
+Cc: Josh Boyer <jwboyer@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/acpi/acpica/tbfadt.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/acpi/acpica/tbfadt.c b/drivers/acpi/acpica/tbfadt.c
+index 6f5588e..4c531b4 100644
+--- a/drivers/acpi/acpica/tbfadt.c
++++ b/drivers/acpi/acpica/tbfadt.c
+@@ -350,10 +350,6 @@ static void acpi_tb_convert_fadt(void)
+ 	u32 address32;
+ 	u32 i;
+ 
+-	/* Update the local FADT table header length */
+-
+-	acpi_gbl_FADT.header.length = sizeof(struct acpi_table_fadt);
+-
+ 	/*
+ 	 * Expand the 32-bit FACS and DSDT addresses to 64-bit as necessary.
+ 	 * Later code will always use the X 64-bit field. Also, check for an
+@@ -395,6 +391,10 @@ static void acpi_tb_convert_fadt(void)
+ 		acpi_gbl_FADT.boot_flags = 0;
+ 	}
+ 
++	/* Update the local FADT table header length */
++
++	acpi_gbl_FADT.header.length = sizeof(struct acpi_table_fadt);
++
+ 	/*
+ 	 * Expand the ACPI 1.0 32-bit addresses to the ACPI 2.0 64-bit "X"
+ 	 * generic address structures as necessary. Later code will always use
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0018-modpost-fix-ALL_INIT_DATA_SECTIONS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0018-modpost-fix-ALL_INIT_DATA_SECTIONS.patch
new file mode 100644
index 0000000..7bd2cc2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0018-modpost-fix-ALL_INIT_DATA_SECTIONS.patch
@@ -0,0 +1,32 @@
+From 3d588be49327372d7c61bcf5e1c691031ecee200 Mon Sep 17 00:00:00 2001
+From: Jan Beulich <JBeulich@suse.com>
+Date: Thu, 8 Mar 2012 09:41:25 +0000
+Subject: [PATCH 18/60] modpost: fix ALL_INIT_DATA_SECTIONS
+
+commit 9aaf440f8fabcebf9ea79a62ccf4c212e6544b49 upstream.
+
+This was lacking a comma between two supposed to be separate strings.
+
+Signed-off-by: Jan Beulich <jbeulich@suse.com>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ scripts/mod/modpost.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
+index 2bd594e..159b4cc 100644
+--- a/scripts/mod/modpost.c
++++ b/scripts/mod/modpost.c
+@@ -849,7 +849,7 @@ static void check_section(const char *modname, struct elf_info *elf,
+ 
+ #define ALL_INIT_DATA_SECTIONS \
+ 	".init.setup$", ".init.rodata$", \
+-	".devinit.rodata$", ".cpuinit.rodata$", ".meminit.rodata$" \
++	".devinit.rodata$", ".cpuinit.rodata$", ".meminit.rodata$", \
+ 	".init.data$", ".devinit.data$", ".cpuinit.data$", ".meminit.data$"
+ #define ALL_EXIT_DATA_SECTIONS \
+ 	".exit.data$", ".devexit.data$", ".cpuexit.data$", ".memexit.data$"
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0019-genirq-Adjust-irq-thread-affinity-on-IRQ_SET_MASK_OK.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0019-genirq-Adjust-irq-thread-affinity-on-IRQ_SET_MASK_OK.patch
new file mode 100644
index 0000000..1bd3149
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0019-genirq-Adjust-irq-thread-affinity-on-IRQ_SET_MASK_OK.patch
@@ -0,0 +1,55 @@
+From a62ad6cb0e0456a184ba7678d456a14cd33dfeea Mon Sep 17 00:00:00 2001
+From: Jiang Liu <liuj97@gmail.com>
+Date: Fri, 30 Mar 2012 23:11:33 +0800
+Subject: [PATCH 19/60] genirq: Adjust irq thread affinity on
+ IRQ_SET_MASK_OK_NOCOPY return value
+
+commit f5cb92ac82d06cb583c1f66666314c5c0a4d7913 upstream.
+
+irq_move_masked_irq() checks the return code of
+chip->irq_set_affinity() only for 0, but IRQ_SET_MASK_OK_NOCOPY is
+also a valid return code, which is there to avoid a redundant copy of
+the cpumask. But in case of IRQ_SET_MASK_OK_NOCOPY we not only avoid
+the redundant copy, we also fail to adjust the thread affinity of an
+eventually threaded interrupt handler.
+
+Handle IRQ_SET_MASK_OK (==0) and IRQ_SET_MASK_OK_NOCOPY(==1) return
+values correctly by checking the valid return values seperately.
+
+Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
+Cc: Jiang Liu <liuj97@gmail.com>
+Cc: Keping Chen <chenkeping@huawei.com>
+Link: http://lkml.kernel.org/r/1333120296-13563-2-git-send-email-jiang.liu@huawei.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/irq/migration.c |   10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/kernel/irq/migration.c b/kernel/irq/migration.c
+index 4742090..c3c8975 100644
+--- a/kernel/irq/migration.c
++++ b/kernel/irq/migration.c
+@@ -43,12 +43,16 @@ void irq_move_masked_irq(struct irq_data *idata)
+ 	 * masking the irqs.
+ 	 */
+ 	if (likely(cpumask_any_and(desc->pending_mask, cpu_online_mask)
+-		   < nr_cpu_ids))
+-		if (!chip->irq_set_affinity(&desc->irq_data,
+-					    desc->pending_mask, false)) {
++		   < nr_cpu_ids)) {
++		int ret = chip->irq_set_affinity(&desc->irq_data,
++						 desc->pending_mask, false);
++		switch (ret) {
++		case IRQ_SET_MASK_OK:
+ 			cpumask_copy(desc->irq_data.affinity, desc->pending_mask);
++		case IRQ_SET_MASK_OK_NOCOPY:
+ 			irq_set_thread_affinity(desc);
+ 		}
++	}
+ 
+ 	cpumask_clear(desc->pending_mask);
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0020-tracing-Fix-ftrace-stack-trace-entries.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0020-tracing-Fix-ftrace-stack-trace-entries.patch
new file mode 100644
index 0000000..00288c5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0020-tracing-Fix-ftrace-stack-trace-entries.patch
@@ -0,0 +1,77 @@
+From fea2076685048df406c2fc4d6542837a4306c6fd Mon Sep 17 00:00:00 2001
+From: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
+Date: Thu, 22 Mar 2012 11:18:20 +0100
+Subject: [PATCH 20/60] tracing: Fix ftrace stack trace entries
+
+commit 01de982abf8c9e10fc3089e10585cd2cc914bdab upstream.
+
+8 hex characters tell only half the tale for 64 bit CPUs,
+so use the appropriate length.
+
+Link: http://lkml.kernel.org/r/1332411501-8059-2-git-send-email-wolfgang.mauerer@siemens.com
+
+Signed-off-by: Wolfgang Mauerer <wolfgang.mauerer@siemens.com>
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/trace/trace_entries.h |   16 ++++++++++++----
+ kernel/trace/trace_export.c  |    2 +-
+ 2 files changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/kernel/trace/trace_entries.h b/kernel/trace/trace_entries.h
+index 9336590..205dcac 100644
+--- a/kernel/trace/trace_entries.h
++++ b/kernel/trace/trace_entries.h
+@@ -156,6 +156,12 @@ FTRACE_ENTRY_DUP(wakeup, ctx_switch_entry,
+ 
+ #define FTRACE_STACK_ENTRIES	8
+ 
++#ifndef CONFIG_64BIT
++# define IP_FMT "%08lx"
++#else
++# define IP_FMT "%016lx"
++#endif
++
+ FTRACE_ENTRY(kernel_stack, stack_entry,
+ 
+ 	TRACE_STACK,
+@@ -165,8 +171,9 @@ FTRACE_ENTRY(kernel_stack, stack_entry,
+ 		__dynamic_array(unsigned long,	caller	)
+ 	),
+ 
+-	F_printk("\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n"
+-		 "\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n",
++	F_printk("\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n"
++		 "\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n"
++		 "\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n",
+ 		 __entry->caller[0], __entry->caller[1], __entry->caller[2],
+ 		 __entry->caller[3], __entry->caller[4], __entry->caller[5],
+ 		 __entry->caller[6], __entry->caller[7])
+@@ -181,8 +188,9 @@ FTRACE_ENTRY(user_stack, userstack_entry,
+ 		__array(	unsigned long,	caller, FTRACE_STACK_ENTRIES	)
+ 	),
+ 
+-	F_printk("\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n"
+-		 "\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n\t=> (%08lx)\n",
++	F_printk("\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n"
++		 "\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n"
++		 "\t=> (" IP_FMT ")\n\t=> (" IP_FMT ")\n",
+ 		 __entry->caller[0], __entry->caller[1], __entry->caller[2],
+ 		 __entry->caller[3], __entry->caller[4], __entry->caller[5],
+ 		 __entry->caller[6], __entry->caller[7])
+diff --git a/kernel/trace/trace_export.c b/kernel/trace/trace_export.c
+index bbeec31..ad4000c 100644
+--- a/kernel/trace/trace_export.c
++++ b/kernel/trace/trace_export.c
+@@ -150,7 +150,7 @@ ftrace_define_fields_##name(struct ftrace_event_call *event_call)	\
+ #define __dynamic_array(type, item)
+ 
+ #undef F_printk
+-#define F_printk(fmt, args...) #fmt ", "  __stringify(args)
++#define F_printk(fmt, args...) __stringify(fmt) ", "  __stringify(args)
+ 
+ #undef FTRACE_ENTRY
+ #define FTRACE_ENTRY(call, struct_name, etype, tstruct, print)		\
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0021-tracing-Fix-ent_size-in-trace-output.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0021-tracing-Fix-ent_size-in-trace-output.patch
new file mode 100644
index 0000000..d830db2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0021-tracing-Fix-ent_size-in-trace-output.patch
@@ -0,0 +1,58 @@
+From 23cc657edadf5b126485d90d9a6178478ccc7a9d Mon Sep 17 00:00:00 2001
+From: Steven Rostedt <srostedt@redhat.com>
+Date: Tue, 27 Mar 2012 10:43:28 -0400
+Subject: [PATCH 21/60] tracing: Fix ent_size in trace output
+
+commit 12b5da349a8b94c9dbc3430a6bc42eabd9eaf50b upstream.
+
+When reading the trace file, the records of each of the per_cpu buffers
+are examined to find the next event to print out. At the point of looking
+at the event, the size of the event is recorded. But if the first event is
+chosen, the other events in the other CPU buffers will reset the event size
+that is stored in the iterator descriptor, causing the event size passed to
+the output functions to be incorrect.
+
+In most cases this is not a problem, but for the case of stack traces, it
+is. With the change to the stack tracing to record a dynamic number of
+back traces, the output depends on the size of the entry instead of the
+fixed 8 back traces. When the entry size is not correct, the back traces
+would not be fully printed.
+
+Note, reading from the per-cpu trace files were not affected.
+
+Reported-by: Thomas Gleixner <tglx@linutronix.de>
+Tested-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/trace/trace.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
+index f2bd275..697e49d 100644
+--- a/kernel/trace/trace.c
++++ b/kernel/trace/trace.c
+@@ -1642,6 +1642,7 @@ __find_next_entry(struct trace_iterator *iter, int *ent_cpu,
+ 	int cpu_file = iter->cpu_file;
+ 	u64 next_ts = 0, ts;
+ 	int next_cpu = -1;
++	int next_size = 0;
+ 	int cpu;
+ 
+ 	/*
+@@ -1673,9 +1674,12 @@ __find_next_entry(struct trace_iterator *iter, int *ent_cpu,
+ 			next_cpu = cpu;
+ 			next_ts = ts;
+ 			next_lost = lost_events;
++			next_size = iter->ent_size;
+ 		}
+ 	}
+ 
++	iter->ent_size = next_size;
++
+ 	if (ent_cpu)
+ 		*ent_cpu = next_cpu;
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0022-m68k-mac-Add-missing-platform-check-before-registeri.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0022-m68k-mac-Add-missing-platform-check-before-registeri.patch
new file mode 100644
index 0000000..05958eb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0022-m68k-mac-Add-missing-platform-check-before-registeri.patch
@@ -0,0 +1,34 @@
+From fced6a21a4444111945939b57d4f274dcb9d0cdc Mon Sep 17 00:00:00 2001
+From: Geert Uytterhoeven <geert@linux-m68k.org>
+Date: Sun, 18 Mar 2012 13:21:38 +0100
+Subject: [PATCH 22/60] m68k/mac: Add missing platform check before
+ registering platform devices
+
+commit 6cfeba53911d6d2f17ebbd1246893557d5ff5aeb upstream.
+
+On multi-platform kernels, the Mac platform devices should be registered
+when running on Mac only. Else it may crash later.
+
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/m68k/mac/config.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/arch/m68k/mac/config.c b/arch/m68k/mac/config.c
+index c247de0..1918d76 100644
+--- a/arch/m68k/mac/config.c
++++ b/arch/m68k/mac/config.c
+@@ -950,6 +950,9 @@ int __init mac_platform_init(void)
+ {
+ 	u8 *swim_base;
+ 
++	if (!MACH_IS_MAC)
++		return -ENODEV;
++
+ 	/*
+ 	 * Serial devices
+ 	 */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0023-mac80211-fix-possible-tid_rx-reorder_timer-use-after.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0023-mac80211-fix-possible-tid_rx-reorder_timer-use-after.patch
new file mode 100644
index 0000000..52d26c3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0023-mac80211-fix-possible-tid_rx-reorder_timer-use-after.patch
@@ -0,0 +1,52 @@
+From 0cf704acf102ad1855f06ce26e56e34ebd63fc3c Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Mon, 19 Mar 2012 16:00:26 +0100
+Subject: [PATCH 23/60] mac80211: fix possible tid_rx->reorder_timer use after
+ free
+
+commit d72308bff5c2fa207949a5925b020bce74495e33 upstream.
+
+Is possible that we will arm the tid_rx->reorder_timer after
+del_timer_sync() in ___ieee80211_stop_rx_ba_session(). We need to stop
+timer after RCU grace period finish, so move it to
+ieee80211_free_tid_rx(). Timer will not be armed again, as
+rcu_dereference(sta->ampdu_mlme.tid_rx[tid]) will return NULL.
+
+Debug object detected problem with the following warning:
+ODEBUG: free active (active state 0) object type: timer_list hint: sta_rx_agg_reorder_timer_expired+0x0/0xf0 [mac80211]
+
+Bug report (with all warning messages):
+https://bugzilla.redhat.com/show_bug.cgi?id=804007
+
+Reported-by: "jan p. springer" <jsd@igroup.org>
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/mac80211/agg-rx.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
+index 41c2310..aea1559 100644
+--- a/net/mac80211/agg-rx.c
++++ b/net/mac80211/agg-rx.c
+@@ -49,6 +49,8 @@ static void ieee80211_free_tid_rx(struct rcu_head *h)
+ 		container_of(h, struct tid_ampdu_rx, rcu_head);
+ 	int i;
+ 
++	del_timer_sync(&tid_rx->reorder_timer);
++
+ 	for (i = 0; i < tid_rx->buf_size; i++)
+ 		dev_kfree_skb(tid_rx->reorder_buf[i]);
+ 	kfree(tid_rx->reorder_buf);
+@@ -88,7 +90,6 @@ void ___ieee80211_stop_rx_ba_session(struct sta_info *sta, u16 tid,
+ 				     tid, 0, reason);
+ 
+ 	del_timer_sync(&tid_rx->session_timer);
+-	del_timer_sync(&tid_rx->reorder_timer);
+ 
+ 	call_rcu(&tid_rx->rcu_head, ieee80211_free_tid_rx);
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0024-rtlwifi-rtl8192ce-rtl8192cu-rtl8192de-Fix-low-gain-s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0024-rtlwifi-rtl8192ce-rtl8192cu-rtl8192de-Fix-low-gain-s.patch
new file mode 100644
index 0000000..a6dfc46
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0024-rtlwifi-rtl8192ce-rtl8192cu-rtl8192de-Fix-low-gain-s.patch
@@ -0,0 +1,54 @@
+From 2e80dec6dad3b037b7b6499048c139436c6f0710 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Mon, 26 Mar 2012 09:59:48 -0500
+Subject: [PATCH 24/60] rtlwifi: rtl8192ce: rtl8192cu: rtl8192de: Fix low-gain
+ setting when scanning
+
+commit 643c61e119459e9d750087b7b34be94491efebf9 upstream.
+
+In https://bugzilla.redhat.com/show_bug.cgi?id=770207, slowdowns of driver
+rtl8192ce are reported. One fix (commit a9b89e2) has already been applied,
+and it helped, but the maximum RX speed would still drop to 1 Mbps. As in
+the previous fix, the initial gain was determined to be the problem; however,
+the problem arises from a setting of the gain when scans are started.
+
+Driver rtl8192de also has the same code structure - this one is fixed as well.
+
+Reported-and-Tested-by: Ivan Pesin <ivan.pesin@gmail.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rtlwifi/rtl8192c/phy_common.c |    2 +-
+ drivers/net/wireless/rtlwifi/rtl8192de/phy.c       |    2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192c/phy_common.c b/drivers/net/wireless/rtlwifi/rtl8192c/phy_common.c
+index 1f07558..f20678a 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192c/phy_common.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192c/phy_common.c
+@@ -1968,7 +1968,7 @@ void rtl92c_phy_set_io(struct ieee80211_hw *hw)
+ 		break;
+ 	case IO_CMD_PAUSE_DM_BY_SCAN:
+ 		rtlphy->initgain_backup.xaagccore1 = dm_digtable.cur_igvalue;
+-		dm_digtable.cur_igvalue = 0x17;
++		dm_digtable.cur_igvalue = 0x37;
+ 		rtl92c_dm_write_dig(hw);
+ 		break;
+ 	default:
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192de/phy.c b/drivers/net/wireless/rtlwifi/rtl8192de/phy.c
+index 0883349..2cf4c5f 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192de/phy.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192de/phy.c
+@@ -3192,7 +3192,7 @@ static void rtl92d_phy_set_io(struct ieee80211_hw *hw)
+ 		break;
+ 	case IO_CMD_PAUSE_DM_BY_SCAN:
+ 		rtlphy->initgain_backup.xaagccore1 = de_digtable.cur_igvalue;
+-		de_digtable.cur_igvalue = 0x17;
++		de_digtable.cur_igvalue = 0x37;
+ 		rtl92d_dm_write_dig(hw);
+ 		break;
+ 	default:
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0025-drm-Validate-requested-virtual-size-against-allocate.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0025-drm-Validate-requested-virtual-size-against-allocate.patch
new file mode 100644
index 0000000..f38c6fb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0025-drm-Validate-requested-virtual-size-against-allocate.patch
@@ -0,0 +1,48 @@
+From 604965714e342993a12bd7aff566b9d4dd531fe9 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Mon, 26 Mar 2012 21:15:53 +0100
+Subject: [PATCH 25/60] drm: Validate requested virtual size against allocated
+ fb size
+
+commit 62fb376e214d3c1bfdf6fbb77dac162f6da04d7e upstream.
+
+mplayer -vo fbdev tries to create a screen that is twice as tall as the
+allocated framebuffer for "doublebuffering". By default, and all in-tree
+users, only sufficient memory is allocated and mapped to satisfy the
+smallest framebuffer and the virtual size is no larger than the actual.
+For these users, we should therefore reject any userspace request to
+create a screen that requires a buffer larger than the framebuffer
+originally allocated.
+
+References: https://bugs.freedesktop.org/show_bug.cgi?id=38138
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/drm_fb_helper.c |    8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
+index 80fe39d..dd58373 100644
+--- a/drivers/gpu/drm/drm_fb_helper.c
++++ b/drivers/gpu/drm/drm_fb_helper.c
+@@ -610,9 +610,13 @@ int drm_fb_helper_check_var(struct fb_var_screeninfo *var,
+ 		return -EINVAL;
+ 
+ 	/* Need to resize the fb object !!! */
+-	if (var->bits_per_pixel > fb->bits_per_pixel || var->xres > fb->width || var->yres > fb->height) {
++	if (var->bits_per_pixel > fb->bits_per_pixel ||
++	    var->xres > fb->width || var->yres > fb->height ||
++	    var->xres_virtual > fb->width || var->yres_virtual > fb->height) {
+ 		DRM_DEBUG("fb userspace requested width/height/bpp is greater than current fb "
+-			  "object %dx%d-%d > %dx%d-%d\n", var->xres, var->yres, var->bits_per_pixel,
++			  "request %dx%d-%d (virtual %dx%d) > %dx%d-%d\n",
++			  var->xres, var->yres, var->bits_per_pixel,
++			  var->xres_virtual, var->yres_virtual,
+ 			  fb->width, fb->height, fb->bits_per_pixel);
+ 		return -EINVAL;
+ 	}
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0026-drm-radeon-kms-fix-fans-after-resume.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0026-drm-radeon-kms-fix-fans-after-resume.patch
new file mode 100644
index 0000000..44a92d2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0026-drm-radeon-kms-fix-fans-after-resume.patch
@@ -0,0 +1,75 @@
+From bfb12525292fbd7a9837de23fc1e8dda589b43a1 Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Thu, 29 Mar 2012 19:04:08 -0400
+Subject: [PATCH 26/60] drm/radeon/kms: fix fans after resume
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 402976fe51b2d1a58a29ba06fa1ca5ace3a4cdcd upstream.
+
+On pre-R600 asics, the SpeedFanControl table is not
+executed as part of ASIC_Init as it is on newer asics.
+
+Fixes:
+https://bugzilla.kernel.org/show_bug.cgi?id=29412
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/atom.c |   15 ++++++++++++++-
+ drivers/gpu/drm/radeon/atom.h |    1 +
+ 2 files changed, 15 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/radeon/atom.c b/drivers/gpu/drm/radeon/atom.c
+index 14cc88a..3a05cdb 100644
+--- a/drivers/gpu/drm/radeon/atom.c
++++ b/drivers/gpu/drm/radeon/atom.c
+@@ -1304,8 +1304,11 @@ struct atom_context *atom_parse(struct card_info *card, void *bios)
+ 
+ int atom_asic_init(struct atom_context *ctx)
+ {
++	struct radeon_device *rdev = ctx->card->dev->dev_private;
+ 	int hwi = CU16(ctx->data_table + ATOM_DATA_FWI_PTR);
+ 	uint32_t ps[16];
++	int ret;
++
+ 	memset(ps, 0, 64);
+ 
+ 	ps[0] = cpu_to_le32(CU32(hwi + ATOM_FWI_DEFSCLK_PTR));
+@@ -1315,7 +1318,17 @@ int atom_asic_init(struct atom_context *ctx)
+ 
+ 	if (!CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_INIT))
+ 		return 1;
+-	return atom_execute_table(ctx, ATOM_CMD_INIT, ps);
++	ret = atom_execute_table(ctx, ATOM_CMD_INIT, ps);
++	if (ret)
++		return ret;
++
++	memset(ps, 0, 64);
++
++	if (rdev->family < CHIP_R600) {
++		if (CU16(ctx->cmd_table + 4 + 2 * ATOM_CMD_SPDFANCNTL))
++			atom_execute_table(ctx, ATOM_CMD_SPDFANCNTL, ps);
++	}
++	return ret;
+ }
+ 
+ void atom_destroy(struct atom_context *ctx)
+diff --git a/drivers/gpu/drm/radeon/atom.h b/drivers/gpu/drm/radeon/atom.h
+index 93cfe20..25fea63 100644
+--- a/drivers/gpu/drm/radeon/atom.h
++++ b/drivers/gpu/drm/radeon/atom.h
+@@ -44,6 +44,7 @@
+ #define ATOM_CMD_SETSCLK	0x0A
+ #define ATOM_CMD_SETMCLK	0x0B
+ #define ATOM_CMD_SETPCLK	0x0C
++#define ATOM_CMD_SPDFANCNTL	0x39
+ 
+ #define ATOM_DATA_FWI_PTR	0xC
+ #define ATOM_DATA_IIO_PTR	0x32
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0027-drm-i915-no-lvds-quirk-on-MSI-DC500.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0027-drm-i915-no-lvds-quirk-on-MSI-DC500.patch
new file mode 100644
index 0000000..2fc0804
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0027-drm-i915-no-lvds-quirk-on-MSI-DC500.patch
@@ -0,0 +1,40 @@
+From 17729a991754faddaeec8880db9881a5bc4fab5e Mon Sep 17 00:00:00 2001
+From: Anisse Astier <anisse@astier.eu>
+Date: Wed, 7 Mar 2012 18:36:35 +0100
+Subject: [PATCH 27/60] drm/i915: no-lvds quirk on MSI DC500
+
+commit 97effadb65ed08809e1720c8d3ee80b73a93665c upstream.
+
+This hardware doesn't have an LVDS, it's a desktop box. Fix incorrect
+LVDS detection.
+
+Signed-off-by: Anisse Astier <anisse@astier.eu>
+Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_lvds.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/intel_lvds.c
+index b83f745..583c2d0 100644
+--- a/drivers/gpu/drm/i915/intel_lvds.c
++++ b/drivers/gpu/drm/i915/intel_lvds.c
+@@ -731,6 +731,14 @@ static const struct dmi_system_id intel_no_lvds[] = {
+ 			DMI_MATCH(DMI_BOARD_NAME, "AT5NM10T-I"),
+ 		},
+ 	},
++	{
++		.callback = intel_no_lvds_dmi_callback,
++		.ident = "MSI Wind Box DC500",
++		.matches = {
++			DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., LTD"),
++			DMI_MATCH(DMI_BOARD_NAME, "MS-7469"),
++		},
++	},
+ 
+ 	{ }	/* terminating entry */
+ };
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0028-drm-i915-Sanitize-BIOS-debugging-bits-from-PIPECONF.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0028-drm-i915-Sanitize-BIOS-debugging-bits-from-PIPECONF.patch
new file mode 100644
index 0000000..c70337a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0028-drm-i915-Sanitize-BIOS-debugging-bits-from-PIPECONF.patch
@@ -0,0 +1,62 @@
+From 2bb2e47c60f77b768affa48bf847526054143d81 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Thu, 22 Mar 2012 15:00:50 +0000
+Subject: [PATCH 28/60] drm/i915: Sanitize BIOS debugging bits from PIPECONF
+
+commit f47166d2b0001fcb752b40c5a2d4db986dfbea68 upstream.
+
+Quoting the BSpec from time immemorial:
+
+  PIPEACONF, bits 28:27: Frame Start Delay (Debug)
+
+  Used to delay the frame start signal that is sent to the display planes.
+  Care must be taken to insure that there are enough lines during VBLANK
+  to support this setting.
+
+An instance of the BIOS leaving these bits set was found in the wild,
+where it caused our modesetting to go all squiffy and skewiff.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=47271
+Reported-and-tested-by: Eva Wang <evawang@linpus.com>
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=43012
+Reported-and-tested-by: Carl Richell <carl@system76.com>
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_reg.h      |    1 +
+ drivers/gpu/drm/i915/intel_display.c |    6 ++++++
+ 2 files changed, 7 insertions(+)
+
+diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
+index 1608d2a..2f99fd4 100644
+--- a/drivers/gpu/drm/i915/i915_reg.h
++++ b/drivers/gpu/drm/i915/i915_reg.h
+@@ -2312,6 +2312,7 @@
+ #define   PIPECONF_DISABLE	0
+ #define   PIPECONF_DOUBLE_WIDE	(1<<30)
+ #define   I965_PIPECONF_ACTIVE	(1<<30)
++#define   PIPECONF_FRAME_START_DELAY_MASK (3<<27)
+ #define   PIPECONF_SINGLE_WIDE	0
+ #define   PIPECONF_PIPE_UNLOCKED 0
+ #define   PIPECONF_PIPE_LOCKED	(1<<25)
+diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
+index 9ec9755..9011f48 100644
+--- a/drivers/gpu/drm/i915/intel_display.c
++++ b/drivers/gpu/drm/i915/intel_display.c
+@@ -7278,6 +7278,12 @@ static void intel_sanitize_modesetting(struct drm_device *dev,
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
+ 	u32 reg, val;
+ 
++	/* Clear any frame start delays used for debugging left by the BIOS */
++	for_each_pipe(pipe) {
++		reg = PIPECONF(pipe);
++		I915_WRITE(reg, I915_READ(reg) & ~PIPECONF_FRAME_START_DELAY_MASK);
++	}
++
+ 	if (HAS_PCH_SPLIT(dev))
+ 		return;
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0029-drm-i915-Add-lock-on-drm_helper_resume_force_mode.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0029-drm-i915-Add-lock-on-drm_helper_resume_force_mode.patch
new file mode 100644
index 0000000..72dd824
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0029-drm-i915-Add-lock-on-drm_helper_resume_force_mode.patch
@@ -0,0 +1,37 @@
+From 4ab7c0a9a8f866f035d64d0b71dc7cad9bf59f51 Mon Sep 17 00:00:00 2001
+From: Sean Paul <seanpaul@chromium.org>
+Date: Fri, 23 Mar 2012 08:52:58 -0400
+Subject: [PATCH 29/60] drm/i915: Add lock on drm_helper_resume_force_mode
+
+commit 927a2f119e8235238a2fc64871051b16c9bdae75 upstream.
+
+i915_drm_thaw was not locking the mode_config lock when calling
+drm_helper_resume_force_mode. When there were multiple wake sources,
+this caused FDI training failure on SNB which in turn corrupted the
+display.
+
+Signed-off-by: Sean Paul <seanpaul@chromium.org>
+Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_drv.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
+index d04597d..e52b705 100644
+--- a/drivers/gpu/drm/i915/i915_drv.c
++++ b/drivers/gpu/drm/i915/i915_drv.c
+@@ -508,7 +508,9 @@ static int i915_drm_thaw(struct drm_device *dev)
+ 		drm_irq_install(dev);
+ 
+ 		/* Resume the modeset for every activated CRTC */
++		mutex_lock(&dev->mode_config.mutex);
+ 		drm_helper_resume_force_mode(dev);
++		mutex_unlock(&dev->mode_config.mutex);
+ 
+ 		if (IS_IRONLAKE_M(dev))
+ 			ironlake_enable_rc6(dev);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0030-drm-i915-quirk-away-broken-OpRegion-VBT.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0030-drm-i915-quirk-away-broken-OpRegion-VBT.patch
new file mode 100644
index 0000000..de8ad51
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0030-drm-i915-quirk-away-broken-OpRegion-VBT.patch
@@ -0,0 +1,71 @@
+From 58767bacea3aca7d03afa92650f014213ef1681d Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Sat, 24 Mar 2012 23:51:30 +0100
+Subject: [PATCH 30/60] drm/i915: quirk away broken OpRegion VBT
+
+commit 25e341cfc33d94435472983825163e97fe370a6c upstream.
+
+Somehow the BIOS manages to screw things up when copying the VBT
+around, because the one we scrap from the VBIOS rom actually works.
+
+Tested-by: Markus Heinz <markus.heinz@uni-dortmund.de>
+Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
+Reviewed-by: Rodrigo Vivi <rodrigo.vivi@gmail.com>
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=28812
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_bios.c |   23 ++++++++++++++++++++++-
+ 1 file changed, 22 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_bios.c b/drivers/gpu/drm/i915/intel_bios.c
+index 63880e2..22efb08 100644
+--- a/drivers/gpu/drm/i915/intel_bios.c
++++ b/drivers/gpu/drm/i915/intel_bios.c
+@@ -24,6 +24,7 @@
+  *    Eric Anholt <eric@anholt.net>
+  *
+  */
++#include <linux/dmi.h>
+ #include <drm/drm_dp_helper.h>
+ #include "drmP.h"
+ #include "drm.h"
+@@ -621,6 +622,26 @@ init_vbt_defaults(struct drm_i915_private *dev_priv)
+ 	dev_priv->edp.bpp = 18;
+ }
+ 
++static int __init intel_no_opregion_vbt_callback(const struct dmi_system_id *id)
++{
++	DRM_DEBUG_KMS("Falling back to manually reading VBT from "
++		      "VBIOS ROM for %s\n",
++		      id->ident);
++	return 1;
++}
++
++static const struct dmi_system_id intel_no_opregion_vbt[] = {
++	{
++		.callback = intel_no_opregion_vbt_callback,
++		.ident = "ThinkCentre A57",
++		.matches = {
++			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
++			DMI_MATCH(DMI_PRODUCT_NAME, "97027RG"),
++		},
++	},
++	{ }
++};
++
+ /**
+  * intel_parse_bios - find VBT and initialize settings from the BIOS
+  * @dev: DRM device
+@@ -641,7 +662,7 @@ intel_parse_bios(struct drm_device *dev)
+ 	init_vbt_defaults(dev_priv);
+ 
+ 	/* XXX Should this validation be moved to intel_opregion.c? */
+-	if (dev_priv->opregion.vbt) {
++	if (!dmi_check_system(intel_no_opregion_vbt) && dev_priv->opregion.vbt) {
+ 		struct vbt_header *vbt = dev_priv->opregion.vbt;
+ 		if (memcmp(vbt->signature, "$VBT", 4) == 0) {
+ 			DRM_DEBUG_KMS("Using VBT from OpRegion: %20s\n",
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0031-r8169-runtime-resume-before-shutdown.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0031-r8169-runtime-resume-before-shutdown.patch
new file mode 100644
index 0000000..b246c48
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0031-r8169-runtime-resume-before-shutdown.patch
@@ -0,0 +1,57 @@
+From 5cc5bed22b5a987cd388292e64b2b4d473ddef10 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?fran=C3=A7ois=20romieu?= <romieu@fr.zoreil.com>
+Date: Tue, 6 Mar 2012 01:14:12 +0000
+Subject: [PATCH 31/60] r8169: runtime resume before shutdown.
+
+commit 2a15cd2ff488a9fdb55e5e34060f499853b27c77 upstream.
+
+With runtime PM, if the ethernet cable is disconnected, the device is
+transitioned to D3 state to conserve energy. If the system is shutdown
+in this state, any register accesses in rtl_shutdown are dropped on
+the floor. As the device was programmed by .runtime_suspend() to wake
+on link changes, it is thus brought back up as soon as the link recovers.
+
+Resuming every suspended device through the driver core would slow things
+down and it is not clear how many devices really need it now.
+
+Original report and D0 transition patch by Sameer Nanda. Patch has been
+changed to comply with advices by Rafael J. Wysocki and the PM folks.
+
+Reported-by: Sameer Nanda <snanda@chromium.org>
+Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>
+Cc: Rafael J. Wysocki <rjw@sisk.pl>
+Cc: Hayes Wang <hayeswang@realtek.com>
+Cc: Alan Stern <stern@rowland.harvard.edu>
+Acked-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/realtek/r8169.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
+index 0cf2351..697cae3 100644
+--- a/drivers/net/ethernet/realtek/r8169.c
++++ b/drivers/net/ethernet/realtek/r8169.c
+@@ -6194,6 +6194,9 @@ static void rtl_shutdown(struct pci_dev *pdev)
+ {
+ 	struct net_device *dev = pci_get_drvdata(pdev);
+ 	struct rtl8169_private *tp = netdev_priv(dev);
++	struct device *d = &pdev->dev;
++
++	pm_runtime_get_sync(d);
+ 
+ 	rtl8169_net_suspend(dev);
+ 
+@@ -6215,6 +6218,8 @@ static void rtl_shutdown(struct pci_dev *pdev)
+ 		pci_wake_from_d3(pdev, true);
+ 		pci_set_power_state(pdev, PCI_D3hot);
+ 	}
++
++	pm_runtime_put_noidle(d);
+ }
+ 
+ static struct pci_driver rtl8169_pci_driver = {
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0032-target-Fix-unsupported-WRITE_SAME-sense-payload.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0032-target-Fix-unsupported-WRITE_SAME-sense-payload.patch
new file mode 100644
index 0000000..40f2252
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0032-target-Fix-unsupported-WRITE_SAME-sense-payload.patch
@@ -0,0 +1,54 @@
+From a66bf3e98840599c67fd1d60563bb1aaa0c0622f Mon Sep 17 00:00:00 2001
+From: Martin Svec <martin.svec@zoner.cz>
+Date: Mon, 6 Feb 2012 22:13:25 -0800
+Subject: [PATCH 32/60] target: Fix unsupported WRITE_SAME sense payload
+
+commit 67236c44741e250199ccd77f1115568e68cf8848 upstream.
+
+This patch fixes a bug in target-core where unsupported WRITE_SAME ops
+from a target_check_write_same_discard() failure was incorrectly
+returning CHECK_CONDITION w/ TCM_INVALID_CDB_FIELD sense data.
+This was causing some clients to not properly fall back, so go ahead
+and use the correct TCM_UNSUPPORTED_SCSI_OPCODE sense for this case.
+
+Reported-by: Martin Svec <martin.svec@zoner.cz>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_transport.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
+index cdb774b..5660916 100644
+--- a/drivers/target/target_core_transport.c
++++ b/drivers/target/target_core_transport.c
+@@ -2666,7 +2666,7 @@ static int transport_generic_cmd_sequencer(
+ 			cmd->se_cmd_flags |= SCF_SCSI_CONTROL_SG_IO_CDB;
+ 
+ 			if (target_check_write_same_discard(&cdb[10], dev) < 0)
+-				goto out_invalid_cdb_field;
++				goto out_unsupported_cdb;
+ 			if (!passthrough)
+ 				cmd->execute_task = target_emulate_write_same;
+ 			break;
+@@ -2949,7 +2949,7 @@ static int transport_generic_cmd_sequencer(
+ 		cmd->se_cmd_flags |= SCF_SCSI_CONTROL_SG_IO_CDB;
+ 
+ 		if (target_check_write_same_discard(&cdb[1], dev) < 0)
+-			goto out_invalid_cdb_field;
++			goto out_unsupported_cdb;
+ 		if (!passthrough)
+ 			cmd->execute_task = target_emulate_write_same;
+ 		break;
+@@ -2972,7 +2972,7 @@ static int transport_generic_cmd_sequencer(
+ 		 * of byte 1 bit 3 UNMAP instead of original reserved field
+ 		 */
+ 		if (target_check_write_same_discard(&cdb[1], dev) < 0)
+-			goto out_invalid_cdb_field;
++			goto out_unsupported_cdb;
+ 		if (!passthrough)
+ 			cmd->execute_task = target_emulate_write_same;
+ 		break;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0033-kgdb-debug_core-pass-the-breakpoint-struct-instead-o.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0033-kgdb-debug_core-pass-the-breakpoint-struct-instead-o.patch
new file mode 100644
index 0000000..310833f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0033-kgdb-debug_core-pass-the-breakpoint-struct-instead-o.patch
@@ -0,0 +1,180 @@
+From 69214d0d1b5f2f3e05dee62617d28c7e9daccc80 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Wed, 21 Mar 2012 10:17:03 -0500
+Subject: [PATCH 33/60] kgdb,debug_core: pass the breakpoint struct instead of
+ address and memory
+
+commit 98b54aa1a2241b59372468bd1e9c2d207bdba54b upstream.
+
+There is extra state information that needs to be exposed in the
+kgdb_bpt structure for tracking how a breakpoint was installed.  The
+debug_core only uses the the probe_kernel_write() to install
+breakpoints, but this is not enough for all the archs.  Some arch such
+as x86 need to use text_poke() in order to install a breakpoint into a
+read only page.
+
+Passing the kgdb_bpt structure to kgdb_arch_set_breakpoint() and
+kgdb_arch_remove_breakpoint() allows other archs to set the type
+variable which indicates how the breakpoint was installed.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/kgdb.h      |    4 ++--
+ kernel/debug/debug_core.c |   53 ++++++++++++++++++++-------------------------
+ 2 files changed, 26 insertions(+), 31 deletions(-)
+
+diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
+index fa39183..e5d689c 100644
+--- a/include/linux/kgdb.h
++++ b/include/linux/kgdb.h
+@@ -207,8 +207,8 @@ extern void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc);
+ 
+ /* Optional functions. */
+ extern int kgdb_validate_break_address(unsigned long addr);
+-extern int kgdb_arch_set_breakpoint(unsigned long addr, char *saved_instr);
+-extern int kgdb_arch_remove_breakpoint(unsigned long addr, char *bundle);
++extern int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt);
++extern int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt);
+ 
+ /**
+  *	kgdb_arch_late - Perform any architecture specific initalization.
+diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
+index 0d7c087..7fda904 100644
+--- a/kernel/debug/debug_core.c
++++ b/kernel/debug/debug_core.c
+@@ -157,37 +157,39 @@ early_param("nokgdbroundup", opt_nokgdbroundup);
+  * Weak aliases for breakpoint management,
+  * can be overriden by architectures when needed:
+  */
+-int __weak kgdb_arch_set_breakpoint(unsigned long addr, char *saved_instr)
++int __weak kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
+ {
+ 	int err;
+ 
+-	err = probe_kernel_read(saved_instr, (char *)addr, BREAK_INSTR_SIZE);
++	err = probe_kernel_read(bpt->saved_instr, (char *)bpt->bpt_addr,
++				BREAK_INSTR_SIZE);
+ 	if (err)
+ 		return err;
+-
+-	return probe_kernel_write((char *)addr, arch_kgdb_ops.gdb_bpt_instr,
+-				  BREAK_INSTR_SIZE);
++	err = probe_kernel_write((char *)bpt->bpt_addr,
++				 arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
++	return err;
+ }
+ 
+-int __weak kgdb_arch_remove_breakpoint(unsigned long addr, char *bundle)
++int __weak kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
+ {
+-	return probe_kernel_write((char *)addr,
+-				  (char *)bundle, BREAK_INSTR_SIZE);
++	return probe_kernel_write((char *)bpt->bpt_addr,
++				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
+ }
+ 
+ int __weak kgdb_validate_break_address(unsigned long addr)
+ {
+-	char tmp_variable[BREAK_INSTR_SIZE];
++	struct kgdb_bkpt tmp;
+ 	int err;
+-	/* Validate setting the breakpoint and then removing it.  In the
++	/* Validate setting the breakpoint and then removing it.  If the
+ 	 * remove fails, the kernel needs to emit a bad message because we
+ 	 * are deep trouble not being able to put things back the way we
+ 	 * found them.
+ 	 */
+-	err = kgdb_arch_set_breakpoint(addr, tmp_variable);
++	tmp.bpt_addr = addr;
++	err = kgdb_arch_set_breakpoint(&tmp);
+ 	if (err)
+ 		return err;
+-	err = kgdb_arch_remove_breakpoint(addr, tmp_variable);
++	err = kgdb_arch_remove_breakpoint(&tmp);
+ 	if (err)
+ 		printk(KERN_ERR "KGDB: Critical breakpoint error, kernel "
+ 		   "memory destroyed at: %lx", addr);
+@@ -231,7 +233,6 @@ static void kgdb_flush_swbreak_addr(unsigned long addr)
+  */
+ int dbg_activate_sw_breakpoints(void)
+ {
+-	unsigned long addr;
+ 	int error;
+ 	int ret = 0;
+ 	int i;
+@@ -240,16 +241,15 @@ int dbg_activate_sw_breakpoints(void)
+ 		if (kgdb_break[i].state != BP_SET)
+ 			continue;
+ 
+-		addr = kgdb_break[i].bpt_addr;
+-		error = kgdb_arch_set_breakpoint(addr,
+-				kgdb_break[i].saved_instr);
++		error = kgdb_arch_set_breakpoint(&kgdb_break[i]);
+ 		if (error) {
+ 			ret = error;
+-			printk(KERN_INFO "KGDB: BP install failed: %lx", addr);
++			printk(KERN_INFO "KGDB: BP install failed: %lx",
++			       kgdb_break[i].bpt_addr);
+ 			continue;
+ 		}
+ 
+-		kgdb_flush_swbreak_addr(addr);
++		kgdb_flush_swbreak_addr(kgdb_break[i].bpt_addr);
+ 		kgdb_break[i].state = BP_ACTIVE;
+ 	}
+ 	return ret;
+@@ -298,7 +298,6 @@ int dbg_set_sw_break(unsigned long addr)
+ 
+ int dbg_deactivate_sw_breakpoints(void)
+ {
+-	unsigned long addr;
+ 	int error;
+ 	int ret = 0;
+ 	int i;
+@@ -306,15 +305,14 @@ int dbg_deactivate_sw_breakpoints(void)
+ 	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+ 		if (kgdb_break[i].state != BP_ACTIVE)
+ 			continue;
+-		addr = kgdb_break[i].bpt_addr;
+-		error = kgdb_arch_remove_breakpoint(addr,
+-					kgdb_break[i].saved_instr);
++		error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
+ 		if (error) {
+-			printk(KERN_INFO "KGDB: BP remove failed: %lx\n", addr);
++			printk(KERN_INFO "KGDB: BP remove failed: %lx\n",
++			       kgdb_break[i].bpt_addr);
+ 			ret = error;
+ 		}
+ 
+-		kgdb_flush_swbreak_addr(addr);
++		kgdb_flush_swbreak_addr(kgdb_break[i].bpt_addr);
+ 		kgdb_break[i].state = BP_SET;
+ 	}
+ 	return ret;
+@@ -348,7 +346,6 @@ int kgdb_isremovedbreak(unsigned long addr)
+ 
+ int dbg_remove_all_break(void)
+ {
+-	unsigned long addr;
+ 	int error;
+ 	int i;
+ 
+@@ -356,12 +353,10 @@ int dbg_remove_all_break(void)
+ 	for (i = 0; i < KGDB_MAX_BREAKPOINTS; i++) {
+ 		if (kgdb_break[i].state != BP_ACTIVE)
+ 			goto setundefined;
+-		addr = kgdb_break[i].bpt_addr;
+-		error = kgdb_arch_remove_breakpoint(addr,
+-				kgdb_break[i].saved_instr);
++		error = kgdb_arch_remove_breakpoint(&kgdb_break[i]);
+ 		if (error)
+ 			printk(KERN_ERR "KGDB: breakpoint remove failed: %lx\n",
+-			   addr);
++			       kgdb_break[i].bpt_addr);
+ setundefined:
+ 		kgdb_break[i].state = BP_UNDEFINED;
+ 	}
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0034-kgdbts-Fix-kernel-oops-with-CONFIG_DEBUG_RODATA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0034-kgdbts-Fix-kernel-oops-with-CONFIG_DEBUG_RODATA.patch
new file mode 100644
index 0000000..38e88f1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0034-kgdbts-Fix-kernel-oops-with-CONFIG_DEBUG_RODATA.patch
@@ -0,0 +1,121 @@
+From 0c2fe32a76d9c3ab88685250abe3956f2ff555fe Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Mar 2012 06:55:44 -0500
+Subject: [PATCH 34/60] kgdbts: Fix kernel oops with CONFIG_DEBUG_RODATA
+
+commit 456ca7ff24841bf2d2a2dfd690fe7d42ef70d932 upstream.
+
+On x86 the kgdb test suite will oops when the kernel is compiled with
+CONFIG_DEBUG_RODATA and you run the tests after boot time. This is
+regression has existed since 2.6.26 by commit: b33cb815 (kgdbts: Use
+HW breakpoints with CONFIG_DEBUG_RODATA).
+
+The test suite can use hw breakpoints for all the tests, but it has to
+execute the hardware breakpoint specific tests first in order to
+determine that the hw breakpoints actually work.  Specifically the
+very first test causes an oops:
+
+# echo V1I1 > /sys/module/kgdbts/parameters/kgdbts
+kgdb: Registered I/O driver kgdbts.
+kgdbts:RUN plant and detach test
+
+Entering kdb (current=0xffff880017aa9320, pid 1078) on processor 0 due to Keyboard Entry
+[0]kdb> kgdbts: ERROR PUT: end of test buffer on 'plant_and_detach_test' line 1 expected OK got $E14#aa
+WARNING: at drivers/misc/kgdbts.c:730 run_simple_test+0x151/0x2c0()
+[...oops clipped...]
+
+This commit re-orders the running of the tests and puts the RODATA
+check into its own function so as to correctly avoid the kernel oops
+by detecting and using the hw breakpoints.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/misc/kgdbts.c |   52 ++++++++++++++++++++++++++-----------------------
+ 1 file changed, 28 insertions(+), 24 deletions(-)
+
+diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
+index 3f7ad83..997e94d 100644
+--- a/drivers/misc/kgdbts.c
++++ b/drivers/misc/kgdbts.c
+@@ -885,6 +885,22 @@ static void run_singlestep_break_test(void)
+ 	kgdbts_break_test();
+ }
+ 
++static void test_debug_rodata(void)
++{
++#ifdef CONFIG_DEBUG_RODATA
++	/* Until there is an api to write to read-only text segments, use
++	 * HW breakpoints for the remainder of any tests, else print a
++	 * failure message if hw breakpoints do not work.
++	 */
++	if (!(arch_kgdb_ops.flags & KGDB_HW_BREAKPOINT && hwbreaks_ok)) {
++		eprintk("kgdbts: HW breakpoints BROKEN, ending tests\n");
++		return;
++	}
++	force_hwbrks = 1;
++	v1printk("kgdbts:Using HW breakpoints for SW breakpoint tests\n");
++#endif /* CONFIG_DEBUG_RODATA */
++}
++
+ static void kgdbts_run_tests(void)
+ {
+ 	char *ptr;
+@@ -907,6 +923,18 @@ static void kgdbts_run_tests(void)
+ 	if (ptr)
+ 		sstep_test = simple_strtol(ptr+1, NULL, 10);
+ 
++	/* All HW break point tests */
++	if (arch_kgdb_ops.flags & KGDB_HW_BREAKPOINT) {
++		hwbreaks_ok = 1;
++		v1printk("kgdbts:RUN hw breakpoint test\n");
++		run_breakpoint_test(1);
++		v1printk("kgdbts:RUN hw write breakpoint test\n");
++		run_hw_break_test(1);
++		v1printk("kgdbts:RUN access write breakpoint test\n");
++		run_hw_break_test(0);
++	}
++	test_debug_rodata();
++
+ 	/* required internal KGDB tests */
+ 	v1printk("kgdbts:RUN plant and detach test\n");
+ 	run_plant_and_detach_test(0);
+@@ -924,35 +952,11 @@ static void kgdbts_run_tests(void)
+ 
+ 	/* ===Optional tests=== */
+ 
+-	/* All HW break point tests */
+-	if (arch_kgdb_ops.flags & KGDB_HW_BREAKPOINT) {
+-		hwbreaks_ok = 1;
+-		v1printk("kgdbts:RUN hw breakpoint test\n");
+-		run_breakpoint_test(1);
+-		v1printk("kgdbts:RUN hw write breakpoint test\n");
+-		run_hw_break_test(1);
+-		v1printk("kgdbts:RUN access write breakpoint test\n");
+-		run_hw_break_test(0);
+-	}
+-
+ 	if (nmi_sleep) {
+ 		v1printk("kgdbts:RUN NMI sleep %i seconds test\n", nmi_sleep);
+ 		run_nmi_sleep_test(nmi_sleep);
+ 	}
+ 
+-#ifdef CONFIG_DEBUG_RODATA
+-	/* Until there is an api to write to read-only text segments, use
+-	 * HW breakpoints for the remainder of any tests, else print a
+-	 * failure message if hw breakpoints do not work.
+-	 */
+-	if (!(arch_kgdb_ops.flags & KGDB_HW_BREAKPOINT && hwbreaks_ok)) {
+-		eprintk("kgdbts: HW breakpoints do not work,"
+-			"skipping remaining tests\n");
+-		return;
+-	}
+-	force_hwbrks = 1;
+-#endif /* CONFIG_DEBUG_RODATA */
+-
+ 	/* If the do_fork test is run it will be the last test that is
+ 	 * executed because a kernel thread will be spawned at the very
+ 	 * end to unregister the debug hooks.
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0035-kgdbts-1-of-2-fix-single-step-awareness-to-work-corr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0035-kgdbts-1-of-2-fix-single-step-awareness-to-work-corr.patch
new file mode 100644
index 0000000..d28b70c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0035-kgdbts-1-of-2-fix-single-step-awareness-to-work-corr.patch
@@ -0,0 +1,212 @@
+From ae549aeda351058e0df140fd174ac71911773ece Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Mar 2012 17:41:24 -0500
+Subject: [PATCH 35/60] kgdbts: (1 of 2) fix single step awareness to work
+ correctly with SMP
+
+commit 486c5987a00a89d56c2c04c506417ef8f823ca2e upstream.
+
+The do_fork and sys_open tests have never worked properly on anything
+other than a UP configuration with the kgdb test suite.  This is
+because the test suite did not fully implement the behavior of a real
+debugger.  A real debugger tracks the state of what thread it asked to
+single step and can correctly continue other threads of execution or
+conditionally stop while waiting for the original thread single step
+request to return.
+
+Below is a simple method to cause a fatal kernel oops with the kgdb
+test suite on a 4 processor x86 system:
+
+while [ 1 ] ; do ls > /dev/null 2> /dev/null; done&
+while [ 1 ] ; do ls > /dev/null 2> /dev/null; done&
+while [ 1 ] ; do ls > /dev/null 2> /dev/null; done&
+while [ 1 ] ; do ls > /dev/null 2> /dev/null; done&
+echo V1I1F1000 > /sys/module/kgdbts/parameters/kgdbts
+
+Very soon after starting the test the kernel will oops with a message like:
+
+kgdbts: BP mismatch 3b7da66480 expected ffffffff8106a590
+WARNING: at drivers/misc/kgdbts.c:303 check_and_rewind_pc+0xe0/0x100()
+Call Trace:
+ [<ffffffff812994a0>] check_and_rewind_pc+0xe0/0x100
+ [<ffffffff81298945>] validate_simple_test+0x25/0xc0
+ [<ffffffff81298f77>] run_simple_test+0x107/0x2c0
+ [<ffffffff81298a18>] kgdbts_put_char+0x18/0x20
+
+The warn will turn to a hard kernel crash shortly after that because
+the pc will not get properly rewound to the right value after hitting
+a breakpoint leading to a hard lockup.
+
+This change is broken up into 2 pieces because archs that have hw
+single stepping (2.6.26 and up) need different changes than archs that
+do not have hw single stepping (3.0 and up).  This change implements
+the correct behavior for an arch that supports hw single stepping.
+
+A minor defect was fixed where sys_open should be do_sys_open
+for the sys_open break point test.  This solves the problem of running
+a 64 bit with a 32 bit user space.  The sys_open() never gets called
+when using the 32 bit file system for the kgdb testsuite because the
+32 bit binaries invoke the compat_sys_open() call leading to the test
+never completing.
+
+In order to mimic a real debugger, the kgdb test suite now tracks the
+most recent thread that was continued (cont_thread_id), with the
+intent to single step just this thread.  When the response to the
+single step request stops in a different thread that hit the original
+break point that thread will now get continued, while the debugger
+waits for the thread with the single step pending.  Here is a high
+level description of the sequence of events.
+
+   cont_instead_of_sstep = 0;
+
+1) set breakpoint at do_fork
+2) continue
+3)   Save the thread id where we stop to cont_thread_id
+4) Remove breakpoint at do_fork
+5) Reset the PC if needed depending on kernel exception type
+6) if (cont_instead_of_sstep) { continue } else { single step }
+7)   Check where we stopped
+       if current thread != cont_thread_id {
+           cont_instead_of_sstep = 1;
+           goto step 5
+       } else {
+           cont_instead_of_sstep = 0;
+       }
+8) clean up and run test again if needed
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/misc/kgdbts.c |   54 +++++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 43 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
+index 997e94d..3cad9fc 100644
+--- a/drivers/misc/kgdbts.c
++++ b/drivers/misc/kgdbts.c
+@@ -134,6 +134,9 @@ static int force_hwbrks;
+ static int hwbreaks_ok;
+ static int hw_break_val;
+ static int hw_break_val2;
++static int cont_instead_of_sstep;
++static unsigned long cont_thread_id;
++static unsigned long sstep_thread_id;
+ #if defined(CONFIG_ARM) || defined(CONFIG_MIPS) || defined(CONFIG_SPARC)
+ static int arch_needs_sstep_emulation = 1;
+ #else
+@@ -211,7 +214,7 @@ static unsigned long lookup_addr(char *arg)
+ 	if (!strcmp(arg, "kgdbts_break_test"))
+ 		addr = (unsigned long)kgdbts_break_test;
+ 	else if (!strcmp(arg, "sys_open"))
+-		addr = (unsigned long)sys_open;
++		addr = (unsigned long)do_sys_open;
+ 	else if (!strcmp(arg, "do_fork"))
+ 		addr = (unsigned long)do_fork;
+ 	else if (!strcmp(arg, "hw_break_val"))
+@@ -283,6 +286,16 @@ static void hw_break_val_write(void)
+ 	hw_break_val++;
+ }
+ 
++static int get_thread_id_continue(char *put_str, char *arg)
++{
++	char *ptr = &put_str[11];
++
++	if (put_str[1] != 'T' || put_str[2] != '0')
++		return 1;
++	kgdb_hex2long(&ptr, &cont_thread_id);
++	return 0;
++}
++
+ static int check_and_rewind_pc(char *put_str, char *arg)
+ {
+ 	unsigned long addr = lookup_addr(arg);
+@@ -324,6 +337,18 @@ static int check_single_step(char *put_str, char *arg)
+ 	gdb_regs_to_pt_regs(kgdbts_gdb_regs, &kgdbts_regs);
+ 	v2printk("Singlestep stopped at IP: %lx\n",
+ 		   instruction_pointer(&kgdbts_regs));
++
++	if (sstep_thread_id != cont_thread_id && !arch_needs_sstep_emulation) {
++		/*
++		 * Ensure we stopped in the same thread id as before, else the
++		 * debugger should continue until the original thread that was
++		 * single stepped is scheduled again, emulating gdb's behavior.
++		 */
++		v2printk("ThrID does not match: %lx\n", cont_thread_id);
++		cont_instead_of_sstep = 1;
++		ts.idx -= 4;
++		return 0;
++	}
+ 	if (instruction_pointer(&kgdbts_regs) == addr) {
+ 		eprintk("kgdbts: SingleStep failed at %lx\n",
+ 			   instruction_pointer(&kgdbts_regs));
+@@ -368,7 +393,12 @@ static int got_break(char *put_str, char *arg)
+ static void emul_sstep_get(char *arg)
+ {
+ 	if (!arch_needs_sstep_emulation) {
+-		fill_get_buf(arg);
++		if (cont_instead_of_sstep) {
++			cont_instead_of_sstep = 0;
++			fill_get_buf("c");
++		} else {
++			fill_get_buf(arg);
++		}
+ 		return;
+ 	}
+ 	switch (sstep_state) {
+@@ -398,9 +428,11 @@ static void emul_sstep_get(char *arg)
+ static int emul_sstep_put(char *put_str, char *arg)
+ {
+ 	if (!arch_needs_sstep_emulation) {
+-		if (!strncmp(put_str+1, arg, 2))
+-			return 0;
+-		return 1;
++		char *ptr = &put_str[11];
++		if (put_str[1] != 'T' || put_str[2] != '0')
++			return 1;
++		kgdb_hex2long(&ptr, &sstep_thread_id);
++		return 0;
+ 	}
+ 	switch (sstep_state) {
+ 	case 1:
+@@ -502,10 +534,10 @@ static struct test_struct bad_read_test[] = {
+ static struct test_struct singlestep_break_test[] = {
+ 	{ "?", "S0*" }, /* Clear break points */
+ 	{ "kgdbts_break_test", "OK", sw_break, }, /* set sw breakpoint */
+-	{ "c", "T0*", }, /* Continue */
++	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
++	{ "kgdbts_break_test", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "g", "kgdbts_break_test", NULL, check_and_rewind_pc },
+ 	{ "write", "OK", write_regs }, /* Write registers */
+-	{ "kgdbts_break_test", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
+ 	{ "g", "kgdbts_break_test", NULL, check_single_step },
+ 	{ "kgdbts_break_test", "OK", sw_break, }, /* set sw breakpoint */
+@@ -523,10 +555,10 @@ static struct test_struct singlestep_break_test[] = {
+ static struct test_struct do_fork_test[] = {
+ 	{ "?", "S0*" }, /* Clear break points */
+ 	{ "do_fork", "OK", sw_break, }, /* set sw breakpoint */
+-	{ "c", "T0*", }, /* Continue */
++	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
++	{ "do_fork", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "g", "do_fork", NULL, check_and_rewind_pc }, /* check location */
+ 	{ "write", "OK", write_regs }, /* Write registers */
+-	{ "do_fork", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
+ 	{ "g", "do_fork", NULL, check_single_step },
+ 	{ "do_fork", "OK", sw_break, }, /* set sw breakpoint */
+@@ -541,10 +573,10 @@ static struct test_struct do_fork_test[] = {
+ static struct test_struct sys_open_test[] = {
+ 	{ "?", "S0*" }, /* Clear break points */
+ 	{ "sys_open", "OK", sw_break, }, /* set sw breakpoint */
+-	{ "c", "T0*", }, /* Continue */
++	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
++	{ "sys_open", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "g", "sys_open", NULL, check_and_rewind_pc }, /* check location */
+ 	{ "write", "OK", write_regs }, /* Write registers */
+-	{ "sys_open", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
+ 	{ "g", "sys_open", NULL, check_single_step },
+ 	{ "sys_open", "OK", sw_break, }, /* set sw breakpoint */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0036-kgdbts-2-of-2-fix-single-step-awareness-to-work-corr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0036-kgdbts-2-of-2-fix-single-step-awareness-to-work-corr.patch
new file mode 100644
index 0000000..640bc3e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0036-kgdbts-2-of-2-fix-single-step-awareness-to-work-corr.patch
@@ -0,0 +1,266 @@
+From 13053c284b41d7ca50da37f04c9940303b9d33e0 Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Thu, 29 Mar 2012 17:41:24 -0500
+Subject: [PATCH 36/60] kgdbts: (2 of 2) fix single step awareness to work
+ correctly with SMP
+
+commit 23bbd8e346f1ef3fc1219c79cea53d8d52b207d8 upstream.
+
+The do_fork and sys_open tests have never worked properly on anything
+other than a UP configuration with the kgdb test suite.  This is
+because the test suite did not fully implement the behavior of a real
+debugger.  A real debugger tracks the state of what thread it asked to
+single step and can correctly continue other threads of execution or
+conditionally stop while waiting for the original thread single step
+request to return.
+
+Below is a simple method to cause a fatal kernel oops with the kgdb
+test suite on a 2 processor ARM system:
+
+while [ 1 ] ; do ls > /dev/null 2> /dev/null; done&
+while [ 1 ] ; do ls > /dev/null 2> /dev/null; done&
+echo V1I1F100 > /sys/module/kgdbts/parameters/kgdbts
+
+Very soon after starting the test the kernel will start warning with
+messages like:
+
+kgdbts: BP mismatch c002487c expected c0024878
+------------[ cut here ]------------
+WARNING: at drivers/misc/kgdbts.c:317 check_and_rewind_pc+0x9c/0xc4()
+[<c01f6520>] (check_and_rewind_pc+0x9c/0xc4)
+[<c01f595c>] (validate_simple_test+0x3c/0xc4)
+[<c01f60d4>] (run_simple_test+0x1e8/0x274)
+
+The kernel will eventually recovers, but the test suite has completely
+failed to test anything useful.
+
+This patch implements behavior similar to a real debugger that does
+not rely on hardware single stepping by using only software planted
+breakpoints.
+
+In order to mimic a real debugger, the kgdb test suite now tracks the
+most recent thread that was continued (cont_thread_id), with the
+intent to single step just this thread.  When the response to the
+single step request stops in a different thread that hit the original
+break point that thread will now get continued, while the debugger
+waits for the thread with the single step pending.  Here is a high
+level description of the sequence of events.
+
+   cont_instead_of_sstep = 0;
+
+1) set breakpoint at do_fork
+2) continue
+3)   Save the thread id where we stop to cont_thread_id
+4) Remove breakpoint at do_fork
+5) Reset the PC if needed depending on kernel exception type
+6) soft single step
+7)   Check where we stopped
+       if current thread != cont_thread_id {
+           if (here for more than 2 times for the same thead) {
+              ### must be a really busy system, start test again ###
+	      goto step 1
+           }
+           goto step 5
+       } else {
+           cont_instead_of_sstep = 0;
+       }
+8) clean up and run test again if needed
+9) Clear out any threads that were waiting on a break point at the
+   point in time the test is ended with get_cont_catch().  This
+   happens sometimes because breakpoints are used in place of single
+   stepping and some threads could have been in the debugger exception
+   handling queue because breakpoints were hit concurrently on
+   different CPUs.  This also means we wait at least one second before
+   unplumbing the debugger connection at the very end, so as respond
+   to any debug threads waiting to be serviced.
+
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/misc/kgdbts.c |   73 +++++++++++++++++++++++++++++++++++++++++--------
+ 1 file changed, 62 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
+index 3cad9fc..d087456 100644
+--- a/drivers/misc/kgdbts.c
++++ b/drivers/misc/kgdbts.c
+@@ -142,7 +142,9 @@ static int arch_needs_sstep_emulation = 1;
+ #else
+ static int arch_needs_sstep_emulation;
+ #endif
++static unsigned long cont_addr;
+ static unsigned long sstep_addr;
++static int restart_from_top_after_write;
+ static int sstep_state;
+ 
+ /* Storage for the registers, in GDB format. */
+@@ -190,7 +192,8 @@ static int kgdbts_unreg_thread(void *ptr)
+ 	 */
+ 	while (!final_ack)
+ 		msleep_interruptible(1500);
+-
++	/* Pause for any other threads to exit after final ack. */
++	msleep_interruptible(1000);
+ 	if (configured)
+ 		kgdb_unregister_io_module(&kgdbts_io_ops);
+ 	configured = 0;
+@@ -312,13 +315,21 @@ static int check_and_rewind_pc(char *put_str, char *arg)
+ 	if (addr + BREAK_INSTR_SIZE == ip)
+ 		offset = -BREAK_INSTR_SIZE;
+ #endif
+-	if (strcmp(arg, "silent") && ip + offset != addr) {
++
++	if (arch_needs_sstep_emulation && sstep_addr &&
++	    ip + offset == sstep_addr &&
++	    ((!strcmp(arg, "sys_open") || !strcmp(arg, "do_fork")))) {
++		/* This is special case for emulated single step */
++		v2printk("Emul: rewind hit single step bp\n");
++		restart_from_top_after_write = 1;
++	} else if (strcmp(arg, "silent") && ip + offset != addr) {
+ 		eprintk("kgdbts: BP mismatch %lx expected %lx\n",
+ 			   ip + offset, addr);
+ 		return 1;
+ 	}
+ 	/* Readjust the instruction pointer if needed */
+ 	ip += offset;
++	cont_addr = ip;
+ #ifdef GDB_ADJUSTS_BREAK_OFFSET
+ 	instruction_pointer_set(&kgdbts_regs, ip);
+ #endif
+@@ -328,6 +339,8 @@ static int check_and_rewind_pc(char *put_str, char *arg)
+ static int check_single_step(char *put_str, char *arg)
+ {
+ 	unsigned long addr = lookup_addr(arg);
++	static int matched_id;
++
+ 	/*
+ 	 * From an arch indepent point of view the instruction pointer
+ 	 * should be on a different instruction
+@@ -338,17 +351,28 @@ static int check_single_step(char *put_str, char *arg)
+ 	v2printk("Singlestep stopped at IP: %lx\n",
+ 		   instruction_pointer(&kgdbts_regs));
+ 
+-	if (sstep_thread_id != cont_thread_id && !arch_needs_sstep_emulation) {
++	if (sstep_thread_id != cont_thread_id) {
+ 		/*
+ 		 * Ensure we stopped in the same thread id as before, else the
+ 		 * debugger should continue until the original thread that was
+ 		 * single stepped is scheduled again, emulating gdb's behavior.
+ 		 */
+ 		v2printk("ThrID does not match: %lx\n", cont_thread_id);
++		if (arch_needs_sstep_emulation) {
++			if (matched_id &&
++			    instruction_pointer(&kgdbts_regs) != addr)
++				goto continue_test;
++			matched_id++;
++			ts.idx -= 2;
++			sstep_state = 0;
++			return 0;
++		}
+ 		cont_instead_of_sstep = 1;
+ 		ts.idx -= 4;
+ 		return 0;
+ 	}
++continue_test:
++	matched_id = 0;
+ 	if (instruction_pointer(&kgdbts_regs) == addr) {
+ 		eprintk("kgdbts: SingleStep failed at %lx\n",
+ 			   instruction_pointer(&kgdbts_regs));
+@@ -390,6 +414,31 @@ static int got_break(char *put_str, char *arg)
+ 	return 1;
+ }
+ 
++static void get_cont_catch(char *arg)
++{
++	/* Always send detach because the test is completed at this point */
++	fill_get_buf("D");
++}
++
++static int put_cont_catch(char *put_str, char *arg)
++{
++	/* This is at the end of the test and we catch any and all input */
++	v2printk("kgdbts: cleanup task: %lx\n", sstep_thread_id);
++	ts.idx--;
++	return 0;
++}
++
++static int emul_reset(char *put_str, char *arg)
++{
++	if (strncmp(put_str, "$OK", 3))
++		return 1;
++	if (restart_from_top_after_write) {
++		restart_from_top_after_write = 0;
++		ts.idx = -1;
++	}
++	return 0;
++}
++
+ static void emul_sstep_get(char *arg)
+ {
+ 	if (!arch_needs_sstep_emulation) {
+@@ -443,8 +492,7 @@ static int emul_sstep_put(char *put_str, char *arg)
+ 		v2printk("Stopped at IP: %lx\n",
+ 			 instruction_pointer(&kgdbts_regs));
+ 		/* Want to stop at IP + break instruction size by default */
+-		sstep_addr = instruction_pointer(&kgdbts_regs) +
+-			BREAK_INSTR_SIZE;
++		sstep_addr = cont_addr + BREAK_INSTR_SIZE;
+ 		break;
+ 	case 2:
+ 		if (strncmp(put_str, "$OK", 3)) {
+@@ -456,6 +504,9 @@ static int emul_sstep_put(char *put_str, char *arg)
+ 		if (strncmp(put_str, "$T0", 3)) {
+ 			eprintk("kgdbts: failed continue sstep\n");
+ 			return 1;
++		} else {
++			char *ptr = &put_str[11];
++			kgdb_hex2long(&ptr, &sstep_thread_id);
+ 		}
+ 		break;
+ 	case 4:
+@@ -558,13 +609,13 @@ static struct test_struct do_fork_test[] = {
+ 	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
+ 	{ "do_fork", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "g", "do_fork", NULL, check_and_rewind_pc }, /* check location */
+-	{ "write", "OK", write_regs }, /* Write registers */
++	{ "write", "OK", write_regs, emul_reset }, /* Write registers */
+ 	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
+ 	{ "g", "do_fork", NULL, check_single_step },
+ 	{ "do_fork", "OK", sw_break, }, /* set sw breakpoint */
+ 	{ "7", "T0*", skip_back_repeat_test }, /* Loop based on repeat_test */
+ 	{ "D", "OK", NULL, final_ack_set }, /* detach and unregister I/O */
+-	{ "", "" },
++	{ "", "", get_cont_catch, put_cont_catch },
+ };
+ 
+ /* Test for hitting a breakpoint at sys_open for what ever the number
+@@ -576,13 +627,13 @@ static struct test_struct sys_open_test[] = {
+ 	{ "c", "T0*", NULL, get_thread_id_continue }, /* Continue */
+ 	{ "sys_open", "OK", sw_rem_break }, /*remove breakpoint */
+ 	{ "g", "sys_open", NULL, check_and_rewind_pc }, /* check location */
+-	{ "write", "OK", write_regs }, /* Write registers */
++	{ "write", "OK", write_regs, emul_reset }, /* Write registers */
+ 	{ "s", "T0*", emul_sstep_get, emul_sstep_put }, /* Single step */
+ 	{ "g", "sys_open", NULL, check_single_step },
+ 	{ "sys_open", "OK", sw_break, }, /* set sw breakpoint */
+ 	{ "7", "T0*", skip_back_repeat_test }, /* Loop based on repeat_test */
+ 	{ "D", "OK", NULL, final_ack_set }, /* detach and unregister I/O */
+-	{ "", "" },
++	{ "", "", get_cont_catch, put_cont_catch },
+ };
+ 
+ /*
+@@ -725,8 +776,8 @@ static int run_simple_test(int is_get_char, int chr)
+ 	/* This callback is a put char which is when kgdb sends data to
+ 	 * this I/O module.
+ 	 */
+-	if (ts.tst[ts.idx].get[0] == '\0' &&
+-		ts.tst[ts.idx].put[0] == '\0') {
++	if (ts.tst[ts.idx].get[0] == '\0' && ts.tst[ts.idx].put[0] == '\0' &&
++	    !ts.tst[ts.idx].get_handler) {
+ 		eprintk("kgdbts: ERROR: beyond end of test on"
+ 			   " '%s' line %i\n", ts.name, ts.idx);
+ 		return 0;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0037-x86-kgdb-Fix-DEBUG_RODATA-limitation-using-text_poke.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0037-x86-kgdb-Fix-DEBUG_RODATA-limitation-using-text_poke.patch
new file mode 100644
index 0000000..be07398
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0037-x86-kgdb-Fix-DEBUG_RODATA-limitation-using-text_poke.patch
@@ -0,0 +1,166 @@
+From d3b769924c0a3a98809ab60e0f7449fef154b26c Mon Sep 17 00:00:00 2001
+From: Jason Wessel <jason.wessel@windriver.com>
+Date: Fri, 23 Mar 2012 09:35:05 -0500
+Subject: [PATCH 37/60] x86,kgdb: Fix DEBUG_RODATA limitation using
+ text_poke()
+
+commit 3751d3e85cf693e10e2c47c03c8caa65e171099b upstream.
+
+There has long been a limitation using software breakpoints with a
+kernel compiled with CONFIG_DEBUG_RODATA going back to 2.6.26. For
+this particular patch, it will apply cleanly and has been tested all
+the way back to 2.6.36.
+
+The kprobes code uses the text_poke() function which accommodates
+writing a breakpoint into a read-only page.  The x86 kgdb code can
+solve the problem similarly by overriding the default breakpoint
+set/remove routines and using text_poke() directly.
+
+The x86 kgdb code will first attempt to use the traditional
+probe_kernel_write(), and next try using a the text_poke() function.
+The break point install method is tracked such that the correct break
+point removal routine will get called later on.
+
+Cc: x86@kernel.org
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Ingo Molnar <mingo@redhat.com>
+Cc: H. Peter Anvin <hpa@zytor.com>
+Inspried-by: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/kgdb.c |   60 ++++++++++++++++++++++++++++++++++++++++++++++++
+ drivers/misc/kgdbts.c  |   17 --------------
+ include/linux/kgdb.h   |    3 ++-
+ 3 files changed, 62 insertions(+), 18 deletions(-)
+
+diff --git a/arch/x86/kernel/kgdb.c b/arch/x86/kernel/kgdb.c
+index faba577..2f45c4c 100644
+--- a/arch/x86/kernel/kgdb.c
++++ b/arch/x86/kernel/kgdb.c
+@@ -43,6 +43,8 @@
+ #include <linux/smp.h>
+ #include <linux/nmi.h>
+ #include <linux/hw_breakpoint.h>
++#include <linux/uaccess.h>
++#include <linux/memory.h>
+ 
+ #include <asm/debugreg.h>
+ #include <asm/apicdef.h>
+@@ -740,6 +742,64 @@ void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long ip)
+ 	regs->ip = ip;
+ }
+ 
++int kgdb_arch_set_breakpoint(struct kgdb_bkpt *bpt)
++{
++	int err;
++	char opc[BREAK_INSTR_SIZE];
++
++	bpt->type = BP_BREAKPOINT;
++	err = probe_kernel_read(bpt->saved_instr, (char *)bpt->bpt_addr,
++				BREAK_INSTR_SIZE);
++	if (err)
++		return err;
++	err = probe_kernel_write((char *)bpt->bpt_addr,
++				 arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE);
++#ifdef CONFIG_DEBUG_RODATA
++	if (!err)
++		return err;
++	/*
++	 * It is safe to call text_poke() because normal kernel execution
++	 * is stopped on all cores, so long as the text_mutex is not locked.
++	 */
++	if (mutex_is_locked(&text_mutex))
++		return -EBUSY;
++	text_poke((void *)bpt->bpt_addr, arch_kgdb_ops.gdb_bpt_instr,
++		  BREAK_INSTR_SIZE);
++	err = probe_kernel_read(opc, (char *)bpt->bpt_addr, BREAK_INSTR_SIZE);
++	if (err)
++		return err;
++	if (memcmp(opc, arch_kgdb_ops.gdb_bpt_instr, BREAK_INSTR_SIZE))
++		return -EINVAL;
++	bpt->type = BP_POKE_BREAKPOINT;
++#endif /* CONFIG_DEBUG_RODATA */
++	return err;
++}
++
++int kgdb_arch_remove_breakpoint(struct kgdb_bkpt *bpt)
++{
++#ifdef CONFIG_DEBUG_RODATA
++	int err;
++	char opc[BREAK_INSTR_SIZE];
++
++	if (bpt->type != BP_POKE_BREAKPOINT)
++		goto knl_write;
++	/*
++	 * It is safe to call text_poke() because normal kernel execution
++	 * is stopped on all cores, so long as the text_mutex is not locked.
++	 */
++	if (mutex_is_locked(&text_mutex))
++		goto knl_write;
++	text_poke((void *)bpt->bpt_addr, bpt->saved_instr, BREAK_INSTR_SIZE);
++	err = probe_kernel_read(opc, (char *)bpt->bpt_addr, BREAK_INSTR_SIZE);
++	if (err || memcmp(opc, bpt->saved_instr, BREAK_INSTR_SIZE))
++		goto knl_write;
++	return err;
++knl_write:
++#endif /* CONFIG_DEBUG_RODATA */
++	return probe_kernel_write((char *)bpt->bpt_addr,
++				  (char *)bpt->saved_instr, BREAK_INSTR_SIZE);
++}
++
+ struct kgdb_arch arch_kgdb_ops = {
+ 	/* Breakpoint instruction: */
+ 	.gdb_bpt_instr		= { 0xcc },
+diff --git a/drivers/misc/kgdbts.c b/drivers/misc/kgdbts.c
+index d087456..3aa9a96 100644
+--- a/drivers/misc/kgdbts.c
++++ b/drivers/misc/kgdbts.c
+@@ -968,22 +968,6 @@ static void run_singlestep_break_test(void)
+ 	kgdbts_break_test();
+ }
+ 
+-static void test_debug_rodata(void)
+-{
+-#ifdef CONFIG_DEBUG_RODATA
+-	/* Until there is an api to write to read-only text segments, use
+-	 * HW breakpoints for the remainder of any tests, else print a
+-	 * failure message if hw breakpoints do not work.
+-	 */
+-	if (!(arch_kgdb_ops.flags & KGDB_HW_BREAKPOINT && hwbreaks_ok)) {
+-		eprintk("kgdbts: HW breakpoints BROKEN, ending tests\n");
+-		return;
+-	}
+-	force_hwbrks = 1;
+-	v1printk("kgdbts:Using HW breakpoints for SW breakpoint tests\n");
+-#endif /* CONFIG_DEBUG_RODATA */
+-}
+-
+ static void kgdbts_run_tests(void)
+ {
+ 	char *ptr;
+@@ -1016,7 +1000,6 @@ static void kgdbts_run_tests(void)
+ 		v1printk("kgdbts:RUN access write breakpoint test\n");
+ 		run_hw_break_test(0);
+ 	}
+-	test_debug_rodata();
+ 
+ 	/* required internal KGDB tests */
+ 	v1printk("kgdbts:RUN plant and detach test\n");
+diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
+index e5d689c..c4d2fc1 100644
+--- a/include/linux/kgdb.h
++++ b/include/linux/kgdb.h
+@@ -63,7 +63,8 @@ enum kgdb_bptype {
+ 	BP_HARDWARE_BREAKPOINT,
+ 	BP_WRITE_WATCHPOINT,
+ 	BP_READ_WATCHPOINT,
+-	BP_ACCESS_WATCHPOINT
++	BP_ACCESS_WATCHPOINT,
++	BP_POKE_BREAKPOINT,
+ };
+ 
+ enum kgdb_bpstate {
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0038-CIFS-Fix-VFS-lock-usage-for-oplocked-files.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0038-CIFS-Fix-VFS-lock-usage-for-oplocked-files.patch
new file mode 100644
index 0000000..2658ac8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0038-CIFS-Fix-VFS-lock-usage-for-oplocked-files.patch
@@ -0,0 +1,99 @@
+From bffd29387e64c0dfb9905f059ecd24bfcccbe572 Mon Sep 17 00:00:00 2001
+From: Pavel Shilovsky <piastry@etersoft.ru>
+Date: Wed, 28 Mar 2012 21:56:19 +0400
+Subject: [PATCH 38/60] CIFS: Fix VFS lock usage for oplocked files
+
+commit 66189be74ff5f9f3fd6444315b85be210d07cef2 upstream.
+
+We can deadlock if we have a write oplock and two processes
+use the same file handle. In this case the first process can't
+unlock its lock if the second process blocked on the lock in the
+same time.
+
+Fix it by using posix_lock_file rather than posix_lock_file_wait
+under cinode->lock_mutex. If we request a blocking lock and
+posix_lock_file indicates that there is another lock that prevents
+us, wait untill that lock is released and restart our call.
+
+Acked-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Pavel Shilovsky <piastry@etersoft.ru>
+Signed-off-by: Steve French <sfrench@us.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/file.c     |   10 +++++++++-
+ fs/locks.c         |    3 ++-
+ include/linux/fs.h |    5 +++++
+ 3 files changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/fs/cifs/file.c b/fs/cifs/file.c
+index 159fcc5..0f7dc22 100644
+--- a/fs/cifs/file.c
++++ b/fs/cifs/file.c
+@@ -835,13 +835,21 @@ cifs_posix_lock_set(struct file *file, struct file_lock *flock)
+ 	if ((flock->fl_flags & FL_POSIX) == 0)
+ 		return rc;
+ 
++try_again:
+ 	mutex_lock(&cinode->lock_mutex);
+ 	if (!cinode->can_cache_brlcks) {
+ 		mutex_unlock(&cinode->lock_mutex);
+ 		return rc;
+ 	}
+-	rc = posix_lock_file_wait(file, flock);
++
++	rc = posix_lock_file(file, flock, NULL);
+ 	mutex_unlock(&cinode->lock_mutex);
++	if (rc == FILE_LOCK_DEFERRED) {
++		rc = wait_event_interruptible(flock->fl_wait, !flock->fl_next);
++		if (!rc)
++			goto try_again;
++		locks_delete_block(flock);
++	}
+ 	return rc;
+ }
+ 
+diff --git a/fs/locks.c b/fs/locks.c
+index 637694b..0d68f1f 100644
+--- a/fs/locks.c
++++ b/fs/locks.c
+@@ -510,12 +510,13 @@ static void __locks_delete_block(struct file_lock *waiter)
+ 
+ /*
+  */
+-static void locks_delete_block(struct file_lock *waiter)
++void locks_delete_block(struct file_lock *waiter)
+ {
+ 	lock_flocks();
+ 	__locks_delete_block(waiter);
+ 	unlock_flocks();
+ }
++EXPORT_SYMBOL(locks_delete_block);
+ 
+ /* Insert waiter into blocker's block list.
+  * We use a circular list so that processes can be easily woken up in
+diff --git a/include/linux/fs.h b/include/linux/fs.h
+index 10b2288..11f1951 100644
+--- a/include/linux/fs.h
++++ b/include/linux/fs.h
+@@ -1203,6 +1203,7 @@ extern int vfs_setlease(struct file *, long, struct file_lock **);
+ extern int lease_modify(struct file_lock **, int);
+ extern int lock_may_read(struct inode *, loff_t start, unsigned long count);
+ extern int lock_may_write(struct inode *, loff_t start, unsigned long count);
++extern void locks_delete_block(struct file_lock *waiter);
+ extern void lock_flocks(void);
+ extern void unlock_flocks(void);
+ #else /* !CONFIG_FILE_LOCKING */
+@@ -1347,6 +1348,10 @@ static inline int lock_may_write(struct inode *inode, loff_t start,
+ 	return 1;
+ }
+ 
++static inline void locks_delete_block(struct file_lock *waiter)
++{
++}
++
+ static inline void lock_flocks(void)
+ {
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0039-ARM-tegra-remove-Tegra30-errata-from-MACH_TEGRA_DT.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0039-ARM-tegra-remove-Tegra30-errata-from-MACH_TEGRA_DT.patch
new file mode 100644
index 0000000..e43dada
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0039-ARM-tegra-remove-Tegra30-errata-from-MACH_TEGRA_DT.patch
@@ -0,0 +1,40 @@
+From 7255ae998bddcdfad51d059ae1c6acfe07221551 Mon Sep 17 00:00:00 2001
+From: Stephen Warren <swarren@nvidia.com>
+Date: Thu, 5 Apr 2012 16:50:05 -0600
+Subject: [PATCH 39/60] ARM: tegra: remove Tegra30 errata from MACH_TEGRA_DT
+
+[no upstream commit match, as this is a fix for a mis-applied patch in the
+previous 3.2-stable release. - gregkh]
+
+Commit 83e4194 "ARM: tegra: select required CPU and L2 errata options"
+contained two chunks; one was errata for Tegra20 (correctly applied)
+and the second errata for Tegra30. The latter was accidentally applied
+to the wrong config option; Tegra30 support wasn't added until v3.3,
+and so the second chunk should have just been dropped. This patch does
+so.
+
+Signed-off-by: Stephen Warren <swarren@nvidia.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mach-tegra/Kconfig |    5 -----
+ 1 file changed, 5 deletions(-)
+
+diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
+index dbc59fa..379cdc7 100644
+--- a/arch/arm/mach-tegra/Kconfig
++++ b/arch/arm/mach-tegra/Kconfig
+@@ -61,11 +61,6 @@ config MACH_SEABOARD
+ config MACH_TEGRA_DT
+ 	bool "Generic Tegra board (FDT support)"
+ 	select USE_OF
+-	select ARM_ERRATA_743622
+-	select ARM_ERRATA_751472
+-	select ARM_ERRATA_754322
+-	select ARM_ERRATA_764369
+-	select PL310_ERRATA_769419 if CACHE_L2X0
+ 	help
+ 	  Support for generic nVidia Tegra boards using Flattened Device Tree
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0040-mmc-sdhci-dove-Fix-compile-error-by-including-module.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0040-mmc-sdhci-dove-Fix-compile-error-by-including-module.patch
new file mode 100644
index 0000000..52f0244
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0040-mmc-sdhci-dove-Fix-compile-error-by-including-module.patch
@@ -0,0 +1,36 @@
+From 0055c53d221f32d89397630ae37a7310b5d974a0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Alf=20H=C3=B8gemark?= <alf@i100.no>
+Date: Wed, 4 Apr 2012 12:27:09 -0400
+Subject: [PATCH 40/60] mmc: sdhci-dove: Fix compile error by including
+ module.h
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 8c2fc8e413ecc2c96b696e28d4eb1bc6cee8dc84 upstream.
+
+This patch fixes a compile error in drivers/mmc/host/sdhci-dove.c
+by including the linux/module.h file.
+
+Signed-off-by: Alf Høgemark <alf@i100.no>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mmc/host/sdhci-dove.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/mmc/host/sdhci-dove.c b/drivers/mmc/host/sdhci-dove.c
+index a81312c..31acb70 100644
+--- a/drivers/mmc/host/sdhci-dove.c
++++ b/drivers/mmc/host/sdhci-dove.c
+@@ -20,6 +20,7 @@
+  */
+ 
+ #include <linux/io.h>
++#include <linux/module.h>
+ #include <linux/mmc/host.h>
+ 
+ #include "sdhci-pltfm.h"
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0041-mmc-atmel-mci-correct-data-timeout-computation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0041-mmc-atmel-mci-correct-data-timeout-computation.patch
new file mode 100644
index 0000000..c43c66a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0041-mmc-atmel-mci-correct-data-timeout-computation.patch
@@ -0,0 +1,42 @@
+From cd7bf853d4130f7b81d066e7760289e3485beb4b Mon Sep 17 00:00:00 2001
+From: Ludovic Desroches <ludovic.desroches@atmel.com>
+Date: Wed, 28 Mar 2012 12:28:33 +0200
+Subject: [PATCH 41/60] mmc: atmel-mci: correct data timeout computation
+
+commit 66292ad92c6d3f2f1c137a1c826b331ca8595dfd upstream.
+
+The HSMCI operates at a rate of up to Master Clock divided by two.
+Moreover previous calculation can cause overflows and so wrong
+timeouts.
+
+Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
+Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mmc/host/atmel-mci.c |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
+index 9896933..0932024 100644
+--- a/drivers/mmc/host/atmel-mci.c
++++ b/drivers/mmc/host/atmel-mci.c
+@@ -480,7 +480,14 @@ err:
+ static inline unsigned int atmci_ns_to_clocks(struct atmel_mci *host,
+ 					unsigned int ns)
+ {
+-	return (ns * (host->bus_hz / 1000000) + 999) / 1000;
++	/*
++	 * It is easier here to use us instead of ns for the timeout,
++	 * it prevents from overflows during calculation.
++	 */
++	unsigned int us = DIV_ROUND_UP(ns, 1000);
++
++	/* Maximum clock frequency is host->bus_hz/2 */
++	return us * (DIV_ROUND_UP(host->bus_hz, 2000000));
+ }
+ 
+ static void atmci_set_timeout(struct atmel_mci *host,
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0042-tcm_fc-Add-abort-flag-for-gracefully-handling-exchan.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0042-tcm_fc-Add-abort-flag-for-gracefully-handling-exchan.patch
new file mode 100644
index 0000000..d04f680
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0042-tcm_fc-Add-abort-flag-for-gracefully-handling-exchan.patch
@@ -0,0 +1,102 @@
+From 3d49fca1a4b93c2fad7a36f29c6e58e4126cad8e Mon Sep 17 00:00:00 2001
+From: Mark Rustad <mark.d.rustad@intel.com>
+Date: Tue, 3 Apr 2012 10:24:41 -0700
+Subject: [PATCH 42/60] tcm_fc: Add abort flag for gracefully handling
+ exchange timeout
+
+commit e1c4038282c7586c3544542b37872c434669d3ac upstream.
+
+Add abort flag and use it to terminate processing when an exchange
+is timed out or is reset. The abort flag is used in place of the
+transport_generic_free_cmd function call in the reset and timeout
+cases, because calling that function in that context would free
+memory that was in use. The aborted flag allows the lifetime to
+be managed in a more normal way, while truncating the processing.
+
+This change eliminates a source of memory corruption which
+manifested in a variety of ugly ways.
+
+(nab: Drop unused struct fc_exch *ep in ft_recv_seq)
+
+Signed-off-by: Mark Rustad <mark.d.rustad@intel.com>
+Acked-by: Kiran Patil <Kiran.patil@intel.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/tcm_fc/tcm_fc.h  |    1 +
+ drivers/target/tcm_fc/tfc_cmd.c |   10 ++++++++--
+ drivers/target/tcm_fc/tfc_io.c  |    2 ++
+ 3 files changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/target/tcm_fc/tcm_fc.h b/drivers/target/tcm_fc/tcm_fc.h
+index e05c551..be7ed12 100644
+--- a/drivers/target/tcm_fc/tcm_fc.h
++++ b/drivers/target/tcm_fc/tcm_fc.h
+@@ -124,6 +124,7 @@ struct ft_cmd {
+ 	/* Local sense buffer */
+ 	unsigned char ft_sense_buffer[TRANSPORT_SENSE_BUFFER];
+ 	u32 was_ddp_setup:1;		/* Set only if ddp is setup */
++	u32 aborted:1;			/* Set if aborted by reset or timeout */
+ 	struct scatterlist *sg;		/* Set only if DDP is setup */
+ 	u32 sg_cnt;			/* No. of item in scatterlist */
+ };
+diff --git a/drivers/target/tcm_fc/tfc_cmd.c b/drivers/target/tcm_fc/tfc_cmd.c
+index 754b669..d95cfe2 100644
+--- a/drivers/target/tcm_fc/tfc_cmd.c
++++ b/drivers/target/tcm_fc/tfc_cmd.c
+@@ -130,6 +130,8 @@ int ft_queue_status(struct se_cmd *se_cmd)
+ 	struct fc_exch *ep;
+ 	size_t len;
+ 
++	if (cmd->aborted)
++		return 0;
+ 	ft_dump_cmd(cmd, __func__);
+ 	ep = fc_seq_exch(cmd->seq);
+ 	lport = ep->lp;
+@@ -196,6 +198,8 @@ int ft_write_pending(struct se_cmd *se_cmd)
+ 
+ 	ft_dump_cmd(cmd, __func__);
+ 
++	if (cmd->aborted)
++		return 0;
+ 	ep = fc_seq_exch(cmd->seq);
+ 	lport = ep->lp;
+ 	fp = fc_frame_alloc(lport, sizeof(*txrdy));
+@@ -266,10 +270,10 @@ static void ft_recv_seq(struct fc_seq *sp, struct fc_frame *fp, void *arg)
+ 	struct ft_cmd *cmd = arg;
+ 	struct fc_frame_header *fh;
+ 
+-	if (IS_ERR(fp)) {
++	if (unlikely(IS_ERR(fp))) {
+ 		/* XXX need to find cmd if queued */
+ 		cmd->seq = NULL;
+-		transport_generic_free_cmd(&cmd->se_cmd, 0);
++		cmd->aborted = true;
+ 		return;
+ 	}
+ 
+@@ -447,6 +451,8 @@ int ft_queue_tm_resp(struct se_cmd *se_cmd)
+ 	struct se_tmr_req *tmr = se_cmd->se_tmr_req;
+ 	enum fcp_resp_rsp_codes code;
+ 
++	if (cmd->aborted)
++		return 0;
+ 	switch (tmr->response) {
+ 	case TMR_FUNCTION_COMPLETE:
+ 		code = FCP_TMF_CMPL;
+diff --git a/drivers/target/tcm_fc/tfc_io.c b/drivers/target/tcm_fc/tfc_io.c
+index 1369b1c..ada131c 100644
+--- a/drivers/target/tcm_fc/tfc_io.c
++++ b/drivers/target/tcm_fc/tfc_io.c
+@@ -84,6 +84,8 @@ int ft_queue_data_in(struct se_cmd *se_cmd)
+ 	void *from;
+ 	void *to = NULL;
+ 
++	if (cmd->aborted)
++		return 0;
+ 	ep = fc_seq_exch(cmd->seq);
+ 	lport = ep->lp;
+ 	cmd->seq = lport->tt.seq_start_next(cmd->seq);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0043-tcm_fc-Do-not-free-tpg-structure-during-wq-allocatio.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0043-tcm_fc-Do-not-free-tpg-structure-during-wq-allocatio.patch
new file mode 100644
index 0000000..79c921e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0043-tcm_fc-Do-not-free-tpg-structure-during-wq-allocatio.patch
@@ -0,0 +1,61 @@
+From dd64e41dfd092de59c1dc5c58ceb26837c16a17c Mon Sep 17 00:00:00 2001
+From: Mark Rustad <mark.d.rustad@intel.com>
+Date: Tue, 3 Apr 2012 10:24:52 -0700
+Subject: [PATCH 43/60] tcm_fc: Do not free tpg structure during wq allocation
+ failure
+
+commit 06383f10c49f507220594a455c6491ca6f8c94ab upstream.
+
+Avoid freeing a registered tpg structure if an alloc_workqueue call
+fails.  This fixes a bug where the failure was leaking memory associated
+with se_portal_group setup during the original core_tpg_register() call.
+
+Signed-off-by: Mark Rustad <mark.d.rustad@intel.com>
+Acked-by: Kiran Patil <Kiran.patil@intel.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/tcm_fc/tfc_conf.c |   13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/target/tcm_fc/tfc_conf.c b/drivers/target/tcm_fc/tfc_conf.c
+index 9402b73..7962325 100644
+--- a/drivers/target/tcm_fc/tfc_conf.c
++++ b/drivers/target/tcm_fc/tfc_conf.c
+@@ -304,6 +304,7 @@ static struct se_portal_group *ft_add_tpg(
+ {
+ 	struct ft_lport_acl *lacl;
+ 	struct ft_tpg *tpg;
++	struct workqueue_struct *wq;
+ 	unsigned long index;
+ 	int ret;
+ 
+@@ -325,18 +326,20 @@ static struct se_portal_group *ft_add_tpg(
+ 	tpg->lport_acl = lacl;
+ 	INIT_LIST_HEAD(&tpg->lun_list);
+ 
+-	ret = core_tpg_register(&ft_configfs->tf_ops, wwn, &tpg->se_tpg,
+-				tpg, TRANSPORT_TPG_TYPE_NORMAL);
+-	if (ret < 0) {
++	wq = alloc_workqueue("tcm_fc", 0, 1);
++	if (!wq) {
+ 		kfree(tpg);
+ 		return NULL;
+ 	}
+ 
+-	tpg->workqueue = alloc_workqueue("tcm_fc", 0, 1);
+-	if (!tpg->workqueue) {
++	ret = core_tpg_register(&ft_configfs->tf_ops, wwn, &tpg->se_tpg,
++				tpg, TRANSPORT_TPG_TYPE_NORMAL);
++	if (ret < 0) {
++		destroy_workqueue(wq);
+ 		kfree(tpg);
+ 		return NULL;
+ 	}
++	tpg->workqueue = wq;
+ 
+ 	mutex_lock(&ft_lport_lock);
+ 	list_add_tail(&tpg->list, &lacl->tpg_list);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0044-sysctl-fix-write-access-to-dmesg_restrict-kptr_restr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0044-sysctl-fix-write-access-to-dmesg_restrict-kptr_restr.patch
new file mode 100644
index 0000000..e9c6efd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0044-sysctl-fix-write-access-to-dmesg_restrict-kptr_restr.patch
@@ -0,0 +1,72 @@
+From 444559e0fe29e31b1a95a3668c530bd1aed732ce Mon Sep 17 00:00:00 2001
+From: Kees Cook <keescook@chromium.org>
+Date: Wed, 4 Apr 2012 11:40:19 -0700
+Subject: [PATCH 44/60] sysctl: fix write access to
+ dmesg_restrict/kptr_restrict
+
+commit 620f6e8e855d6d447688a5f67a4e176944a084e8 upstream.
+
+Commit bfdc0b4 adds code to restrict access to dmesg_restrict,
+however, it incorrectly alters kptr_restrict rather than
+dmesg_restrict.
+
+The original patch from Richard Weinberger
+(https://lkml.org/lkml/2011/3/14/362) alters dmesg_restrict as
+expected, and so the patch seems to have been misapplied.
+
+This adds the CAP_SYS_ADMIN check to both dmesg_restrict and
+kptr_restrict, since both are sensitive.
+
+Reported-by: Phillip Lougher <plougher@redhat.com>
+Signed-off-by: Kees Cook <keescook@chromium.org>
+Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
+Acked-by: Richard Weinberger <richard@nod.at>
+Signed-off-by: James Morris <james.l.morris@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/sysctl.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/kernel/sysctl.c b/kernel/sysctl.c
+index ae27196..ea7ec7f 100644
+--- a/kernel/sysctl.c
++++ b/kernel/sysctl.c
+@@ -166,7 +166,7 @@ static int proc_taint(struct ctl_table *table, int write,
+ #endif
+ 
+ #ifdef CONFIG_PRINTK
+-static int proc_dmesg_restrict(struct ctl_table *table, int write,
++static int proc_dointvec_minmax_sysadmin(struct ctl_table *table, int write,
+ 				void __user *buffer, size_t *lenp, loff_t *ppos);
+ #endif
+ 
+@@ -713,7 +713,7 @@ static struct ctl_table kern_table[] = {
+ 		.data		= &dmesg_restrict,
+ 		.maxlen		= sizeof(int),
+ 		.mode		= 0644,
+-		.proc_handler	= proc_dointvec_minmax,
++		.proc_handler	= proc_dointvec_minmax_sysadmin,
+ 		.extra1		= &zero,
+ 		.extra2		= &one,
+ 	},
+@@ -722,7 +722,7 @@ static struct ctl_table kern_table[] = {
+ 		.data		= &kptr_restrict,
+ 		.maxlen		= sizeof(int),
+ 		.mode		= 0644,
+-		.proc_handler	= proc_dmesg_restrict,
++		.proc_handler	= proc_dointvec_minmax_sysadmin,
+ 		.extra1		= &zero,
+ 		.extra2		= &two,
+ 	},
+@@ -2422,7 +2422,7 @@ static int proc_taint(struct ctl_table *table, int write,
+ }
+ 
+ #ifdef CONFIG_PRINTK
+-static int proc_dmesg_restrict(struct ctl_table *table, int write,
++static int proc_dointvec_minmax_sysadmin(struct ctl_table *table, int write,
+ 				void __user *buffer, size_t *lenp, loff_t *ppos)
+ {
+ 	if (write && !capable(CAP_SYS_ADMIN))
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0045-modpost-Fix-modpost-license-checking-of-vmlinux.o.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0045-modpost-Fix-modpost-license-checking-of-vmlinux.o.patch
new file mode 100644
index 0000000..8fcd35e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0045-modpost-Fix-modpost-license-checking-of-vmlinux.o.patch
@@ -0,0 +1,74 @@
+From ee1916e58deb327a1bbaba6fc344e593fc54764f Mon Sep 17 00:00:00 2001
+From: Frank Rowand <frank.rowand@am.sony.com>
+Date: Mon, 9 Apr 2012 17:59:03 -0700
+Subject: [PATCH 45/60] modpost: Fix modpost license checking of vmlinux.o
+
+commit 258f742635360175564e9470eb060ff4d4b984e7 upstream.
+
+Commit f02e8a6596b7 ("module: Sort exported symbols") sorts symbols
+placing each of them in its own elf section.  This sorting and merging
+into the canonical sections are done by the linker.
+
+Unfortunately modpost to generate Module.symvers file parses vmlinux.o
+(which is not linked yet) and all modules object files (which aren't
+linked yet).  These aren't sanitized by the linker yet.  That breaks
+modpost that can't detect license properly for modules.
+
+This patch makes modpost aware of the new exported symbols structure.
+
+[ This above is a slightly corrected version of the explanation of the
+  problem, copied from commit 62a2635610db ("modpost: Fix modpost's
+  license checking V3").  That commit fixed the problem for module
+  object files, but not for vmlinux.o.  This patch fixes modpost for
+  vmlinux.o. ]
+
+Signed-off-by: Frank Rowand <frank.rowand@am.sony.com>
+Signed-off-by: Alessio Igor Bogani <abogani@kernel.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ scripts/mod/modpost.c |    7 +++++--
+ scripts/mod/modpost.h |    1 +
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
+index 159b4cc..619228d 100644
+--- a/scripts/mod/modpost.c
++++ b/scripts/mod/modpost.c
+@@ -132,8 +132,10 @@ static struct module *new_module(char *modname)
+ 	/* strip trailing .o */
+ 	s = strrchr(p, '.');
+ 	if (s != NULL)
+-		if (strcmp(s, ".o") == 0)
++		if (strcmp(s, ".o") == 0) {
+ 			*s = '\0';
++			mod->is_dot_o = 1;
++		}
+ 
+ 	/* add to list */
+ 	mod->name = p;
+@@ -587,7 +589,8 @@ static void handle_modversions(struct module *mod, struct elf_info *info,
+ 	unsigned int crc;
+ 	enum export export;
+ 
+-	if (!is_vmlinux(mod->name) && strncmp(symname, "__ksymtab", 9) == 0)
++	if ((!is_vmlinux(mod->name) || mod->is_dot_o) &&
++	    strncmp(symname, "__ksymtab", 9) == 0)
+ 		export = export_from_secname(info, get_secindex(info, sym));
+ 	else
+ 		export = export_from_sec(info, get_secindex(info, sym));
+diff --git a/scripts/mod/modpost.h b/scripts/mod/modpost.h
+index 2031119..51207e4 100644
+--- a/scripts/mod/modpost.h
++++ b/scripts/mod/modpost.h
+@@ -113,6 +113,7 @@ struct module {
+ 	int has_cleanup;
+ 	struct buffer dev_table_buf;
+ 	char	     srcversion[25];
++	int is_dot_o;
+ };
+ 
+ struct elf_info {
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0046-x86-PCI-use-host-bridge-_CRS-info-on-MSI-MS-7253.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0046-x86-PCI-use-host-bridge-_CRS-info-on-MSI-MS-7253.patch
new file mode 100644
index 0000000..e122d2a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0046-x86-PCI-use-host-bridge-_CRS-info-on-MSI-MS-7253.patch
@@ -0,0 +1,62 @@
+From b8c4c0ffa982752ee73d7eb5afaf39635e86ee43 Mon Sep 17 00:00:00 2001
+From: Jonathan Nieder <jrnieder@gmail.com>
+Date: Tue, 28 Feb 2012 11:51:10 -0700
+Subject: [PATCH 46/60] x86/PCI: use host bridge _CRS info on MSI MS-7253
+
+commit 8411371709610c826bf65684f886bfdfb5780ca1 upstream.
+
+In the spirit of commit 29cf7a30f8a0 ("x86/PCI: use host bridge _CRS
+info on ASUS M2V-MX SE"), this DMI quirk turns on "pci_use_crs" by
+default on a board that needs it.
+
+This fixes boot failures and oopses introduced in 3e3da00c01d0
+("x86/pci: AMD one chain system to use pci read out res").  The quirk
+is quite targetted (to a specific board and BIOS version) for two
+reasons:
+
+ (1) to emphasize that this method of tackling the problem one quirk
+     at a time is a little insane
+
+ (2) to give BIOS vendors an opportunity to use simpler tables and
+     allow us to return to generic behavior (whatever that happens to
+     be) with a later BIOS update
+
+In other words, I am not at all happy with having quirks like this.
+But it is even worse for the kernel not to work out of the box on
+these machines, so...
+
+Reference: https://bugzilla.kernel.org/show_bug.cgi?id=42619
+Reported-by: Svante Signell <svante.signell@telia.com>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/pci/acpi.c |   11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/arch/x86/pci/acpi.c b/arch/x86/pci/acpi.c
+index f8348ab..dc00ad5 100644
+--- a/arch/x86/pci/acpi.c
++++ b/arch/x86/pci/acpi.c
+@@ -54,6 +54,17 @@ static const struct dmi_system_id pci_use_crs_table[] __initconst = {
+ 			DMI_MATCH(DMI_BIOS_VENDOR, "American Megatrends Inc."),
+ 		},
+ 	},
++	/* https://bugzilla.kernel.org/show_bug.cgi?id=42619 */
++	{
++		.callback = set_use_crs,
++		.ident = "MSI MS-7253",
++		.matches = {
++			DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., LTD"),
++			DMI_MATCH(DMI_BOARD_NAME, "MS-7253"),
++			DMI_MATCH(DMI_BIOS_VENDOR, "Phoenix Technologies, LTD"),
++			DMI_MATCH(DMI_BIOS_VERSION, "V1.6"),
++		},
++	},
+ 	{}
+ };
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0047-x86-PCI-do-not-tie-MSI-MS-7253-use_crs-quirk-to-BIOS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0047-x86-PCI-do-not-tie-MSI-MS-7253-use_crs-quirk-to-BIOS.patch
new file mode 100644
index 0000000..240d1be
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0047-x86-PCI-do-not-tie-MSI-MS-7253-use_crs-quirk-to-BIOS.patch
@@ -0,0 +1,50 @@
+From 6283a8eb02e48cf6f56470723c8b2f518dbe6554 Mon Sep 17 00:00:00 2001
+From: Jonathan Nieder <jrnieder@gmail.com>
+Date: Tue, 28 Feb 2012 15:31:35 -0600
+Subject: [PATCH 47/60] x86/PCI: do not tie MSI MS-7253 use_crs quirk to BIOS
+ version
+
+commit a97f4f5e524bcd09a85ef0b8821a14d35e69335f upstream.
+
+Carlos was getting
+
+	WARNING: at drivers/pci/pci.c:118 pci_ioremap_bar+0x24/0x52()
+
+when probing his sound card, and sound did not work.  After adding
+pci=use_crs to the kernel command line, no more trouble.
+
+Ok, we can add a quirk.  dmidecode output reveals that this is an MSI
+MS-7253, for which we already have a quirk, but the short-sighted
+author tied the quirk to a single BIOS version, making it not kick in
+on Carlos's machine with BIOS V1.2.  If a later BIOS update makes it
+no longer necessary to look at the _CRS info it will still be
+harmless, so let's stop trying to guess which versions have and don't
+have accurate _CRS tables.
+
+Addresses https://bugtrack.alsa-project.org/alsa-bug/view.php?id=5533
+Also see <https://bugzilla.kernel.org/show_bug.cgi?id=42619>.
+
+Reported-by: Carlos Luna <caralu74@gmail.com>
+Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/pci/acpi.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/arch/x86/pci/acpi.c b/arch/x86/pci/acpi.c
+index dc00ad5..0ed97d8 100644
+--- a/arch/x86/pci/acpi.c
++++ b/arch/x86/pci/acpi.c
+@@ -62,7 +62,6 @@ static const struct dmi_system_id pci_use_crs_table[] __initconst = {
+ 			DMI_MATCH(DMI_BOARD_VENDOR, "MICRO-STAR INTERNATIONAL CO., LTD"),
+ 			DMI_MATCH(DMI_BOARD_NAME, "MS-7253"),
+ 			DMI_MATCH(DMI_BIOS_VENDOR, "Phoenix Technologies, LTD"),
+-			DMI_MATCH(DMI_BIOS_VERSION, "V1.6"),
+ 		},
+ 	},
+ 	{}
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0048-TOMOYO-Fix-mount-flags-checking-order.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0048-TOMOYO-Fix-mount-flags-checking-order.patch
new file mode 100644
index 0000000..114b0a0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0048-TOMOYO-Fix-mount-flags-checking-order.patch
@@ -0,0 +1,91 @@
+From 94366efb1ed1a86595b8b1bd4f0d22f581b5a6c2 Mon Sep 17 00:00:00 2001
+From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
+Date: Wed, 29 Feb 2012 21:53:22 +0900
+Subject: [PATCH 48/60] TOMOYO: Fix mount flags checking order.
+
+commit df91e49477a9be15921cb2854e1d12a3bdb5e425 upstream.
+
+Userspace can pass in arbitrary combinations of MS_* flags to mount().
+
+If both MS_BIND and one of MS_SHARED/MS_PRIVATE/MS_SLAVE/MS_UNBINDABLE are
+passed, device name which should be checked for MS_BIND was not checked because
+MS_SHARED/MS_PRIVATE/MS_SLAVE/MS_UNBINDABLE had higher priority than MS_BIND.
+
+If both one of MS_BIND/MS_MOVE and MS_REMOUNT are passed, device name which
+should not be checked for MS_REMOUNT was checked because MS_BIND/MS_MOVE had
+higher priority than MS_REMOUNT.
+
+Fix these bugs by changing priority to MS_REMOUNT -> MS_BIND ->
+MS_SHARED/MS_PRIVATE/MS_SLAVE/MS_UNBINDABLE -> MS_MOVE as with do_mount() does.
+
+Also, unconditionally return -EINVAL if more than one of
+MS_SHARED/MS_PRIVATE/MS_SLAVE/MS_UNBINDABLE is passed so that TOMOYO will not
+generate inaccurate audit logs, for commit 7a2e8a8f "VFS: Sanity check mount
+flags passed to change_mnt_propagation()" clarified that these flags must be
+exclusively passed.
+
+Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
+Signed-off-by: James Morris <james.l.morris@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ security/tomoyo/mount.c |   38 ++++++++++++++++++++------------------
+ 1 file changed, 20 insertions(+), 18 deletions(-)
+
+diff --git a/security/tomoyo/mount.c b/security/tomoyo/mount.c
+index bee09d0..fe00cdf 100644
+--- a/security/tomoyo/mount.c
++++ b/security/tomoyo/mount.c
+@@ -199,30 +199,32 @@ int tomoyo_mount_permission(char *dev_name, struct path *path,
+ 	if (flags & MS_REMOUNT) {
+ 		type = tomoyo_mounts[TOMOYO_MOUNT_REMOUNT];
+ 		flags &= ~MS_REMOUNT;
+-	}
+-	if (flags & MS_MOVE) {
+-		type = tomoyo_mounts[TOMOYO_MOUNT_MOVE];
+-		flags &= ~MS_MOVE;
+-	}
+-	if (flags & MS_BIND) {
++	} else if (flags & MS_BIND) {
+ 		type = tomoyo_mounts[TOMOYO_MOUNT_BIND];
+ 		flags &= ~MS_BIND;
+-	}
+-	if (flags & MS_UNBINDABLE) {
+-		type = tomoyo_mounts[TOMOYO_MOUNT_MAKE_UNBINDABLE];
+-		flags &= ~MS_UNBINDABLE;
+-	}
+-	if (flags & MS_PRIVATE) {
++	} else if (flags & MS_SHARED) {
++		if (flags & (MS_PRIVATE | MS_SLAVE | MS_UNBINDABLE))
++			return -EINVAL;
++		type = tomoyo_mounts[TOMOYO_MOUNT_MAKE_SHARED];
++		flags &= ~MS_SHARED;
++	} else if (flags & MS_PRIVATE) {
++		if (flags & (MS_SHARED | MS_SLAVE | MS_UNBINDABLE))
++			return -EINVAL;
+ 		type = tomoyo_mounts[TOMOYO_MOUNT_MAKE_PRIVATE];
+ 		flags &= ~MS_PRIVATE;
+-	}
+-	if (flags & MS_SLAVE) {
++	} else if (flags & MS_SLAVE) {
++		if (flags & (MS_SHARED | MS_PRIVATE | MS_UNBINDABLE))
++			return -EINVAL;
+ 		type = tomoyo_mounts[TOMOYO_MOUNT_MAKE_SLAVE];
+ 		flags &= ~MS_SLAVE;
+-	}
+-	if (flags & MS_SHARED) {
+-		type = tomoyo_mounts[TOMOYO_MOUNT_MAKE_SHARED];
+-		flags &= ~MS_SHARED;
++	} else if (flags & MS_UNBINDABLE) {
++		if (flags & (MS_SHARED | MS_PRIVATE | MS_SLAVE))
++			return -EINVAL;
++		type = tomoyo_mounts[TOMOYO_MOUNT_MAKE_UNBINDABLE];
++		flags &= ~MS_UNBINDABLE;
++	} else if (flags & MS_MOVE) {
++		type = tomoyo_mounts[TOMOYO_MOUNT_MOVE];
++		flags &= ~MS_MOVE;
+ 	}
+ 	if (!type)
+ 		type = "<NULL>";
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0049-Revert-x86-ioapic-Add-register-level-checks-to-detec.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0049-Revert-x86-ioapic-Add-register-level-checks-to-detec.patch
new file mode 100644
index 0000000..505f91f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0049-Revert-x86-ioapic-Add-register-level-checks-to-detec.patch
@@ -0,0 +1,100 @@
+From 411c3c5e1a3ce763286c32ec38523f111d836fdc Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Tue, 10 Apr 2012 16:04:49 -0700
+Subject: [PATCH 49/60] Revert "x86/ioapic: Add register level checks to
+ detect bogus io-apic entries"
+
+This reverts commit 273fb194e86b795b08a724c7646d0f694949070b
+[73d63d038ee9f769f5e5b46792d227fe20e442c5 upstream]
+
+It causes problems, so needs to be reverted from 3.2-stable for now.
+
+Reported-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Cc: Jon Dufresne <jon@jondufresne.org>
+Cc: Suresh Siddha <suresh.b.siddha@intel.com>
+Cc: <yinghai@kernel.org>
+Cc: Josh Boyer <jwboyer@redhat.com>
+Cc: Ingo Molnar <mingo@elte.hu>
+Cc: Teck Choon Giam <giamteckchoon@gmail.com>
+Cc: Ben Guthro <ben@guthro.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/apic/io_apic.c |   40 ++++++++--------------------------------
+ 1 file changed, 8 insertions(+), 32 deletions(-)
+
+diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
+index a25e276..6d939d7 100644
+--- a/arch/x86/kernel/apic/io_apic.c
++++ b/arch/x86/kernel/apic/io_apic.c
+@@ -3963,36 +3963,18 @@ int mp_find_ioapic_pin(int ioapic, u32 gsi)
+ static __init int bad_ioapic(unsigned long address)
+ {
+ 	if (nr_ioapics >= MAX_IO_APICS) {
+-		pr_warn("WARNING: Max # of I/O APICs (%d) exceeded (found %d), skipping\n",
+-			MAX_IO_APICS, nr_ioapics);
++		printk(KERN_WARNING "WARNING: Max # of I/O APICs (%d) exceeded "
++		       "(found %d), skipping\n", MAX_IO_APICS, nr_ioapics);
+ 		return 1;
+ 	}
+ 	if (!address) {
+-		pr_warn("WARNING: Bogus (zero) I/O APIC address found in table, skipping!\n");
++		printk(KERN_WARNING "WARNING: Bogus (zero) I/O APIC address"
++		       " found in table, skipping!\n");
+ 		return 1;
+ 	}
+ 	return 0;
+ }
+ 
+-static __init int bad_ioapic_register(int idx)
+-{
+-	union IO_APIC_reg_00 reg_00;
+-	union IO_APIC_reg_01 reg_01;
+-	union IO_APIC_reg_02 reg_02;
+-
+-	reg_00.raw = io_apic_read(idx, 0);
+-	reg_01.raw = io_apic_read(idx, 1);
+-	reg_02.raw = io_apic_read(idx, 2);
+-
+-	if (reg_00.raw == -1 && reg_01.raw == -1 && reg_02.raw == -1) {
+-		pr_warn("I/O APIC 0x%x registers return all ones, skipping!\n",
+-			mpc_ioapic_addr(idx));
+-		return 1;
+-	}
+-
+-	return 0;
+-}
+-
+ void __init mp_register_ioapic(int id, u32 address, u32 gsi_base)
+ {
+ 	int idx = 0;
+@@ -4009,12 +3991,6 @@ void __init mp_register_ioapic(int id, u32 address, u32 gsi_base)
+ 	ioapics[idx].mp_config.apicaddr = address;
+ 
+ 	set_fixmap_nocache(FIX_IO_APIC_BASE_0 + idx, address);
+-
+-	if (bad_ioapic_register(idx)) {
+-		clear_fixmap(FIX_IO_APIC_BASE_0 + idx);
+-		return;
+-	}
+-
+ 	ioapics[idx].mp_config.apicid = io_apic_unique_id(id);
+ 	ioapics[idx].mp_config.apicver = io_apic_get_version(idx);
+ 
+@@ -4035,10 +4011,10 @@ void __init mp_register_ioapic(int id, u32 address, u32 gsi_base)
+ 	if (gsi_cfg->gsi_end >= gsi_top)
+ 		gsi_top = gsi_cfg->gsi_end + 1;
+ 
+-	pr_info("IOAPIC[%d]: apic_id %d, version %d, address 0x%x, GSI %d-%d\n",
+-		idx, mpc_ioapic_id(idx),
+-		mpc_ioapic_ver(idx), mpc_ioapic_addr(idx),
+-		gsi_cfg->gsi_base, gsi_cfg->gsi_end);
++	printk(KERN_INFO "IOAPIC[%d]: apic_id %d, version %d, address 0x%x, "
++	       "GSI %d-%d\n", idx, mpc_ioapic_id(idx),
++	       mpc_ioapic_ver(idx), mpc_ioapic_addr(idx),
++	       gsi_cfg->gsi_base, gsi_cfg->gsi_end);
+ 
+ 	nr_ioapics++;
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0050-acer-wmi-No-wifi-rfkill-on-Sony-machines.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0050-acer-wmi-No-wifi-rfkill-on-Sony-machines.patch
new file mode 100644
index 0000000..b564480
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0050-acer-wmi-No-wifi-rfkill-on-Sony-machines.patch
@@ -0,0 +1,39 @@
+From ad14133a305d5de3309f31b52c0e9456eb3310be Mon Sep 17 00:00:00 2001
+From: "Lee, Chun-Yi" <joeyli.kernel@gmail.com>
+Date: Fri, 23 Mar 2012 12:36:44 +0800
+Subject: [PATCH 50/60] acer-wmi: No wifi rfkill on Sony machines
+
+commit 5719b81988f3c24ff694dc3a37e35b35630a3966 upstream.
+
+The wireless rfkill should charged by sony-laptop but not acer-wmi.
+So, add Sony's SNY5001 acpi device to blacklist in acer-wmi.
+
+Tested on Sony Vaio
+
+Cc: Carlos Corbacho <carlos@strangeworlds.co.uk>
+Cc: Matthew Garrett <mjg@redhat.com>
+Cc: Mattia Dongili <malattia@linux.it>
+Cc: Dimitris N <ddarlac@gmail.com>
+Tested-by: Dimitris N <ddarlac@gmail.com>
+Signed-off-by: Lee, Chun-Yi <jlee@suse.com>
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/platform/x86/acer-wmi.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
+index 1e5290b..110e4af 100644
+--- a/drivers/platform/x86/acer-wmi.c
++++ b/drivers/platform/x86/acer-wmi.c
+@@ -692,6 +692,7 @@ static const struct acpi_device_id norfkill_ids[] = {
+ 	{ "VPC2004", 0},
+ 	{ "IBM0068", 0},
+ 	{ "LEN0068", 0},
++	{ "SNY5001", 0},	/* sony-laptop in charge */
+ 	{ "", 0},
+ };
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0051-Fix-length-of-buffer-copied-in-__nfs4_get_acl_uncach.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0051-Fix-length-of-buffer-copied-in-__nfs4_get_acl_uncach.patch
new file mode 100644
index 0000000..f755199
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0051-Fix-length-of-buffer-copied-in-__nfs4_get_acl_uncach.patch
@@ -0,0 +1,36 @@
+From 9f35dc6cc9f96e7a45b42dd5e4c8e2eee1e84e05 Mon Sep 17 00:00:00 2001
+From: Sachin Prabhu <sprabhu@redhat.com>
+Date: Thu, 22 Mar 2012 16:46:28 +0000
+Subject: [PATCH 51/60] Fix length of buffer copied in __nfs4_get_acl_uncached
+
+commit 20e0fa98b751facf9a1101edaefbc19c82616a68 upstream.
+
+_copy_from_pages() used to copy data from the temporary buffer to the
+user passed buffer is passed the wrong size parameter when copying
+data. res.acl_len contains both the bitmap and acl lenghts while
+acl_len contains the acl length after adjusting for the bitmap size.
+
+Signed-off-by: Sachin Prabhu <sprabhu@redhat.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Cc: Josh Boyer <jwboyer@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4proc.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index d945700..757293b 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -3618,7 +3618,7 @@ static ssize_t __nfs4_get_acl_uncached(struct inode *inode, void *buf, size_t bu
+ 		if (acl_len > buflen)
+ 			goto out_free;
+ 		_copy_from_pages(buf, pages, res.acl_data_offset,
+-				res.acl_len);
++				acl_len);
+ 	}
+ 	ret = acl_len;
+ out_free:
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0052-sched-x86-Fix-overflow-in-cyc2ns_offset.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0052-sched-x86-Fix-overflow-in-cyc2ns_offset.patch
new file mode 100644
index 0000000..0300631
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0052-sched-x86-Fix-overflow-in-cyc2ns_offset.patch
@@ -0,0 +1,99 @@
+From 844d37ab7b6069d15d096a879225ac1e71b51974 Mon Sep 17 00:00:00 2001
+From: Salman Qazi <sqazi@google.com>
+Date: Fri, 9 Mar 2012 16:41:01 -0800
+Subject: [PATCH 52/60] sched/x86: Fix overflow in cyc2ns_offset
+
+commit 9993bc635d01a6ee7f6b833b4ee65ce7c06350b1 upstream.
+
+When a machine boots up, the TSC generally gets reset.  However,
+when kexec is used to boot into a kernel, the TSC value would be
+carried over from the previous kernel.  The computation of
+cycns_offset in set_cyc2ns_scale is prone to an overflow, if the
+machine has been up more than 208 days prior to the kexec.  The
+overflow happens when we multiply *scale, even though there is
+enough room to store the final answer.
+
+We fix this issue by decomposing tsc_now into the quotient and
+remainder of division by CYC2NS_SCALE_FACTOR and then performing
+the multiplication separately on the two components.
+
+Refactor code to share the calculation with the previous
+fix in __cycles_2_ns().
+
+Signed-off-by: Salman Qazi <sqazi@google.com>
+Acked-by: John Stultz <john.stultz@linaro.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: Paul Turner <pjt@google.com>
+Cc: john stultz <johnstul@us.ibm.com>
+Link: http://lkml.kernel.org/r/20120310004027.19291.88460.stgit@dungbeetle.mtv.corp.google.com
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Cc: Mike Galbraith <efault@gmx.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/timer.h |    8 ++------
+ arch/x86/kernel/tsc.c        |    3 ++-
+ include/linux/kernel.h       |   13 +++++++++++++
+ 3 files changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/arch/x86/include/asm/timer.h b/arch/x86/include/asm/timer.h
+index 431793e..34baa0e 100644
+--- a/arch/x86/include/asm/timer.h
++++ b/arch/x86/include/asm/timer.h
+@@ -57,14 +57,10 @@ DECLARE_PER_CPU(unsigned long long, cyc2ns_offset);
+ 
+ static inline unsigned long long __cycles_2_ns(unsigned long long cyc)
+ {
+-	unsigned long long quot;
+-	unsigned long long rem;
+ 	int cpu = smp_processor_id();
+ 	unsigned long long ns = per_cpu(cyc2ns_offset, cpu);
+-	quot = (cyc >> CYC2NS_SCALE_FACTOR);
+-	rem = cyc & ((1ULL << CYC2NS_SCALE_FACTOR) - 1);
+-	ns += quot * per_cpu(cyc2ns, cpu) +
+-		((rem * per_cpu(cyc2ns, cpu)) >> CYC2NS_SCALE_FACTOR);
++	ns += mult_frac(cyc, per_cpu(cyc2ns, cpu),
++			(1UL << CYC2NS_SCALE_FACTOR));
+ 	return ns;
+ }
+ 
+diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
+index 3fe298a..1ec515b 100644
+--- a/arch/x86/kernel/tsc.c
++++ b/arch/x86/kernel/tsc.c
+@@ -622,7 +622,8 @@ static void set_cyc2ns_scale(unsigned long cpu_khz, int cpu)
+ 
+ 	if (cpu_khz) {
+ 		*scale = (NSEC_PER_MSEC << CYC2NS_SCALE_FACTOR)/cpu_khz;
+-		*offset = ns_now - (tsc_now * *scale >> CYC2NS_SCALE_FACTOR);
++		*offset = ns_now - mult_frac(tsc_now, *scale,
++					     (1UL << CYC2NS_SCALE_FACTOR));
+ 	}
+ 
+ 	sched_clock_idle_wakeup_event(0);
+diff --git a/include/linux/kernel.h b/include/linux/kernel.h
+index e8b1597..a70783d 100644
+--- a/include/linux/kernel.h
++++ b/include/linux/kernel.h
+@@ -85,6 +85,19 @@
+ }							\
+ )
+ 
++/*
++ * Multiplies an integer by a fraction, while avoiding unnecessary
++ * overflow or loss of precision.
++ */
++#define mult_frac(x, numer, denom)(			\
++{							\
++	typeof(x) quot = (x) / (denom);			\
++	typeof(x) rem  = (x) % (denom);			\
++	(quot * (numer)) + ((rem * (numer)) / (denom));	\
++}							\
++)
++
++
+ #define _RET_IP_		(unsigned long)__builtin_return_address(0)
+ #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0053-mfd-Clear-twl6030-IRQ-status-register-only-once.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0053-mfd-Clear-twl6030-IRQ-status-register-only-once.patch
new file mode 100644
index 0000000..02d849a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0053-mfd-Clear-twl6030-IRQ-status-register-only-once.patch
@@ -0,0 +1,58 @@
+From 84eaf07729408e49027beda2fb0861aad6f96bce Mon Sep 17 00:00:00 2001
+From: Nishanth Menon <nm@ti.com>
+Date: Wed, 22 Feb 2012 20:03:45 -0600
+Subject: [PATCH 53/60] mfd: Clear twl6030 IRQ status register only once
+
+commit 3f8349e6e98ba0455437724589072523865eae5e upstream.
+
+TWL6030 family of PMIC use a shadow interrupt status register
+while kernel processes the current interrupt event.
+However, any write(0 or 1) to register INT_STS_A, INT_STS_B or
+INT_STS_C clears all 3 interrupt status registers.
+
+Since clear of the interrupt is done on 32k clk, depending on I2C
+bus speed, we could in-adverently clear the status of a interrupt
+status pending on shadow register in the current implementation.
+This is due to the fact that multi-byte i2c write operation into
+three seperate status register could result in multiple load
+and clear of status and result in lost interrupts.
+
+Instead, doing a single byte write to INT_STS_A register with 0x0
+will clear all three interrupt status registers without the related
+risk.
+
+Acked-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Signed-off-by: Nishanth Menon <nm@ti.com>
+Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mfd/twl6030-irq.c |   13 +++++++++++--
+ 1 file changed, 11 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
+index 3eee45f..83f4988 100644
+--- a/drivers/mfd/twl6030-irq.c
++++ b/drivers/mfd/twl6030-irq.c
+@@ -187,8 +187,17 @@ static int twl6030_irq_thread(void *data)
+ 			}
+ 		local_irq_enable();
+ 		}
+-		ret = twl_i2c_write(TWL_MODULE_PIH, sts.bytes,
+-				REG_INT_STS_A, 3); /* clear INT_STS_A */
++
++		/*
++		 * NOTE:
++		 * Simulation confirms that documentation is wrong w.r.t the
++		 * interrupt status clear operation. A single *byte* write to
++		 * any one of STS_A to STS_C register results in all three
++		 * STS registers being reset. Since it does not matter which
++		 * value is written, all three registers are cleared on a
++		 * single byte write, so we just use 0x0 to clear.
++		 */
++		ret = twl_i2c_write_u8(TWL_MODULE_PIH, 0x00, REG_INT_STS_A);
+ 		if (ret)
+ 			pr_warning("twl6030: I2C error in clearing PIH ISR\n");
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0054-USB-Add-Motorola-Rokr-E6-Id-to-the-USBNet-driver-zau.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0054-USB-Add-Motorola-Rokr-E6-Id-to-the-USBNet-driver-zau.patch
new file mode 100644
index 0000000..5a194e9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0054-USB-Add-Motorola-Rokr-E6-Id-to-the-USBNet-driver-zau.patch
@@ -0,0 +1,37 @@
+From d784d12ff4ada66b51ad2f394ab6cd391859897c Mon Sep 17 00:00:00 2001
+From: Guan Xin <guanx.bac@gmail.com>
+Date: Mon, 26 Mar 2012 04:11:46 +0000
+Subject: [PATCH 54/60] USB: Add Motorola Rokr E6 Id to the USBNet driver
+ "zaurus"
+
+commit a2daf263107ba3eb6db33931881731fa51c95045 upstream.
+
+Added Vendor/Device Id of Motorola Rokr E6 (22b8:6027) so it can be
+recognized by the "zaurus" USBNet driver.
+Applies to Linux 3.2.13 and 2.6.39.4.
+Signed-off-by: Guan Xin <guanx.bac@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/usb/zaurus.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/drivers/net/usb/zaurus.c b/drivers/net/usb/zaurus.c
+index 246b3bb..c1e6a44 100644
+--- a/drivers/net/usb/zaurus.c
++++ b/drivers/net/usb/zaurus.c
+@@ -332,6 +332,11 @@ static const struct usb_device_id	products [] = {
+ 	.driver_info = ZAURUS_PXA_INFO,
+ },
+ {
++	/* Motorola Rokr E6 */
++	USB_DEVICE_AND_INTERFACE_INFO(0x22b8, 0x6027, USB_CLASS_COMM,
++			USB_CDC_SUBCLASS_MDLM, USB_CDC_PROTO_NONE),
++	.driver_info = (unsigned long) &bogus_mdlm_info,
++}, {
+ 	/* Motorola MOTOMAGX phones */
+ 	USB_DEVICE_AND_INTERFACE_INFO(0x22b8, 0x6425, USB_CLASS_COMM,
+ 			USB_CDC_SUBCLASS_MDLM, USB_CDC_PROTO_NONE),
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0055-ioat-fix-size-of-completion-for-Xen.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0055-ioat-fix-size-of-completion-for-Xen.patch
new file mode 100644
index 0000000..8dc9bec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0055-ioat-fix-size-of-completion-for-Xen.patch
@@ -0,0 +1,209 @@
+From 5c626e88cf0666b3663b56cdd9c43daff62153cd Mon Sep 17 00:00:00 2001
+From: Dan Williams <dan.j.williams@intel.com>
+Date: Fri, 23 Mar 2012 13:36:42 -0700
+Subject: [PATCH 55/60] ioat: fix size of 'completion' for Xen
+
+commit 275029353953c2117941ade84f02a2303912fad1 upstream.
+
+Starting with v3.2 Jonathan reports that Xen crashes loading the ioatdma
+driver.  A debug run shows:
+
+  ioatdma 0000:00:16.4: desc[0]: (0x300cc7000->0x300cc7040) cookie: 0 flags: 0x2 ctl: 0x29 (op: 0 int_en: 1 compl: 1)
+  ...
+  ioatdma 0000:00:16.4: ioat_get_current_completion: phys_complete: 0xcc7000
+
+...which shows that in this environment GFP_KERNEL memory may be backed
+by a 64-bit dma address.  This breaks the driver's assumption that an
+unsigned long should be able to contain the physical address for
+descriptor memory.  Switch to dma_addr_t which beyond being the right
+size, is the true type for the data i.e. an io-virtual address
+inidicating the engine's last processed descriptor.
+
+Reported-by: Jonathan Nieder <jrnieder@gmail.com>
+Reported-by: William Dauchy <wdauchy@gmail.com>
+Tested-by: William Dauchy <wdauchy@gmail.com>
+Tested-by: Dave Jiang <dave.jiang@intel.com>
+Signed-off-by: Dan Williams <dan.j.williams@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/dma/ioat/dma.c    |   16 ++++++++--------
+ drivers/dma/ioat/dma.h    |    6 +++---
+ drivers/dma/ioat/dma_v2.c |    8 ++++----
+ drivers/dma/ioat/dma_v3.c |    8 ++++----
+ 4 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/drivers/dma/ioat/dma.c b/drivers/dma/ioat/dma.c
+index a4d6cb0..6595180 100644
+--- a/drivers/dma/ioat/dma.c
++++ b/drivers/dma/ioat/dma.c
+@@ -548,9 +548,9 @@ void ioat_dma_unmap(struct ioat_chan_common *chan, enum dma_ctrl_flags flags,
+ 			   PCI_DMA_TODEVICE, flags, 0);
+ }
+ 
+-unsigned long ioat_get_current_completion(struct ioat_chan_common *chan)
++dma_addr_t ioat_get_current_completion(struct ioat_chan_common *chan)
+ {
+-	unsigned long phys_complete;
++	dma_addr_t phys_complete;
+ 	u64 completion;
+ 
+ 	completion = *chan->completion;
+@@ -571,7 +571,7 @@ unsigned long ioat_get_current_completion(struct ioat_chan_common *chan)
+ }
+ 
+ bool ioat_cleanup_preamble(struct ioat_chan_common *chan,
+-			   unsigned long *phys_complete)
++			   dma_addr_t *phys_complete)
+ {
+ 	*phys_complete = ioat_get_current_completion(chan);
+ 	if (*phys_complete == chan->last_completion)
+@@ -582,14 +582,14 @@ bool ioat_cleanup_preamble(struct ioat_chan_common *chan,
+ 	return true;
+ }
+ 
+-static void __cleanup(struct ioat_dma_chan *ioat, unsigned long phys_complete)
++static void __cleanup(struct ioat_dma_chan *ioat, dma_addr_t phys_complete)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+ 	struct list_head *_desc, *n;
+ 	struct dma_async_tx_descriptor *tx;
+ 
+-	dev_dbg(to_dev(chan), "%s: phys_complete: %lx\n",
+-		 __func__, phys_complete);
++	dev_dbg(to_dev(chan), "%s: phys_complete: %llx\n",
++		 __func__, (unsigned long long) phys_complete);
+ 	list_for_each_safe(_desc, n, &ioat->used_desc) {
+ 		struct ioat_desc_sw *desc;
+ 
+@@ -655,7 +655,7 @@ static void __cleanup(struct ioat_dma_chan *ioat, unsigned long phys_complete)
+ static void ioat1_cleanup(struct ioat_dma_chan *ioat)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+-	unsigned long phys_complete;
++	dma_addr_t phys_complete;
+ 
+ 	prefetch(chan->completion);
+ 
+@@ -701,7 +701,7 @@ static void ioat1_timer_event(unsigned long data)
+ 		mod_timer(&chan->timer, jiffies + COMPLETION_TIMEOUT);
+ 		spin_unlock_bh(&ioat->desc_lock);
+ 	} else if (test_bit(IOAT_COMPLETION_PENDING, &chan->state)) {
+-		unsigned long phys_complete;
++		dma_addr_t phys_complete;
+ 
+ 		spin_lock_bh(&ioat->desc_lock);
+ 		/* if we haven't made progress and we have already
+diff --git a/drivers/dma/ioat/dma.h b/drivers/dma/ioat/dma.h
+index 5216c8a..8bebddd 100644
+--- a/drivers/dma/ioat/dma.h
++++ b/drivers/dma/ioat/dma.h
+@@ -88,7 +88,7 @@ struct ioatdma_device {
+ struct ioat_chan_common {
+ 	struct dma_chan common;
+ 	void __iomem *reg_base;
+-	unsigned long last_completion;
++	dma_addr_t last_completion;
+ 	spinlock_t cleanup_lock;
+ 	dma_cookie_t completed_cookie;
+ 	unsigned long state;
+@@ -333,7 +333,7 @@ int __devinit ioat_dma_self_test(struct ioatdma_device *device);
+ void __devexit ioat_dma_remove(struct ioatdma_device *device);
+ struct dca_provider * __devinit ioat_dca_init(struct pci_dev *pdev,
+ 					      void __iomem *iobase);
+-unsigned long ioat_get_current_completion(struct ioat_chan_common *chan);
++dma_addr_t ioat_get_current_completion(struct ioat_chan_common *chan);
+ void ioat_init_channel(struct ioatdma_device *device,
+ 		       struct ioat_chan_common *chan, int idx);
+ enum dma_status ioat_dma_tx_status(struct dma_chan *c, dma_cookie_t cookie,
+@@ -341,7 +341,7 @@ enum dma_status ioat_dma_tx_status(struct dma_chan *c, dma_cookie_t cookie,
+ void ioat_dma_unmap(struct ioat_chan_common *chan, enum dma_ctrl_flags flags,
+ 		    size_t len, struct ioat_dma_descriptor *hw);
+ bool ioat_cleanup_preamble(struct ioat_chan_common *chan,
+-			   unsigned long *phys_complete);
++			   dma_addr_t *phys_complete);
+ void ioat_kobject_add(struct ioatdma_device *device, struct kobj_type *type);
+ void ioat_kobject_del(struct ioatdma_device *device);
+ extern const struct sysfs_ops ioat_sysfs_ops;
+diff --git a/drivers/dma/ioat/dma_v2.c b/drivers/dma/ioat/dma_v2.c
+index 5d65f83..cb8864d 100644
+--- a/drivers/dma/ioat/dma_v2.c
++++ b/drivers/dma/ioat/dma_v2.c
+@@ -126,7 +126,7 @@ static void ioat2_start_null_desc(struct ioat2_dma_chan *ioat)
+ 	spin_unlock_bh(&ioat->prep_lock);
+ }
+ 
+-static void __cleanup(struct ioat2_dma_chan *ioat, unsigned long phys_complete)
++static void __cleanup(struct ioat2_dma_chan *ioat, dma_addr_t phys_complete)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+ 	struct dma_async_tx_descriptor *tx;
+@@ -178,7 +178,7 @@ static void __cleanup(struct ioat2_dma_chan *ioat, unsigned long phys_complete)
+ static void ioat2_cleanup(struct ioat2_dma_chan *ioat)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+-	unsigned long phys_complete;
++	dma_addr_t phys_complete;
+ 
+ 	spin_lock_bh(&chan->cleanup_lock);
+ 	if (ioat_cleanup_preamble(chan, &phys_complete))
+@@ -259,7 +259,7 @@ int ioat2_reset_sync(struct ioat_chan_common *chan, unsigned long tmo)
+ static void ioat2_restart_channel(struct ioat2_dma_chan *ioat)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+-	unsigned long phys_complete;
++	dma_addr_t phys_complete;
+ 
+ 	ioat2_quiesce(chan, 0);
+ 	if (ioat_cleanup_preamble(chan, &phys_complete))
+@@ -274,7 +274,7 @@ void ioat2_timer_event(unsigned long data)
+ 	struct ioat_chan_common *chan = &ioat->base;
+ 
+ 	if (test_bit(IOAT_COMPLETION_PENDING, &chan->state)) {
+-		unsigned long phys_complete;
++		dma_addr_t phys_complete;
+ 		u64 status;
+ 
+ 		status = ioat_chansts(chan);
+diff --git a/drivers/dma/ioat/dma_v3.c b/drivers/dma/ioat/dma_v3.c
+index f519c93..2dbf32b 100644
+--- a/drivers/dma/ioat/dma_v3.c
++++ b/drivers/dma/ioat/dma_v3.c
+@@ -256,7 +256,7 @@ static bool desc_has_ext(struct ioat_ring_ent *desc)
+  * The difference from the dma_v2.c __cleanup() is that this routine
+  * handles extended descriptors and dma-unmapping raid operations.
+  */
+-static void __cleanup(struct ioat2_dma_chan *ioat, unsigned long phys_complete)
++static void __cleanup(struct ioat2_dma_chan *ioat, dma_addr_t phys_complete)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+ 	struct ioat_ring_ent *desc;
+@@ -314,7 +314,7 @@ static void __cleanup(struct ioat2_dma_chan *ioat, unsigned long phys_complete)
+ static void ioat3_cleanup(struct ioat2_dma_chan *ioat)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+-	unsigned long phys_complete;
++	dma_addr_t phys_complete;
+ 
+ 	spin_lock_bh(&chan->cleanup_lock);
+ 	if (ioat_cleanup_preamble(chan, &phys_complete))
+@@ -333,7 +333,7 @@ static void ioat3_cleanup_event(unsigned long data)
+ static void ioat3_restart_channel(struct ioat2_dma_chan *ioat)
+ {
+ 	struct ioat_chan_common *chan = &ioat->base;
+-	unsigned long phys_complete;
++	dma_addr_t phys_complete;
+ 
+ 	ioat2_quiesce(chan, 0);
+ 	if (ioat_cleanup_preamble(chan, &phys_complete))
+@@ -348,7 +348,7 @@ static void ioat3_timer_event(unsigned long data)
+ 	struct ioat_chan_common *chan = &ioat->base;
+ 
+ 	if (test_bit(IOAT_COMPLETION_PENDING, &chan->state)) {
+-		unsigned long phys_complete;
++		dma_addr_t phys_complete;
+ 		u64 status;
+ 
+ 		status = ioat_chansts(chan);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0056-ASoC-ak4642-fixup-mute-needs-1-step.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0056-ASoC-ak4642-fixup-mute-needs-1-step.patch
new file mode 100644
index 0000000..c534626
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0056-ASoC-ak4642-fixup-mute-needs-1-step.patch
@@ -0,0 +1,34 @@
+From ef89a7b5f82deaac432a4a797155b199d7d39c67 Mon Sep 17 00:00:00 2001
+From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+Date: Wed, 4 Apr 2012 23:28:01 -0700
+Subject: [PATCH 56/60] ASoC: ak4642: fixup: mute needs +1 step
+
+commit 1f99e44cf059d2ed43c5a0724fa738b83800f725 upstream.
+
+ak4642 out_tlv is +12.0dB to -115.0 dB, and it supports mute.
+But current settings didn't care +1 step for mute.
+This patch adds it
+
+Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/ak4642.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
+index 12c1bde..1c4999d 100644
+--- a/sound/soc/codecs/ak4642.c
++++ b/sound/soc/codecs/ak4642.c
+@@ -144,7 +144,7 @@
+  * min : 0xFE : -115.0 dB
+  * mute: 0xFF
+  */
+-static const DECLARE_TLV_DB_SCALE(out_tlv, -11500, 50, 1);
++static const DECLARE_TLV_DB_SCALE(out_tlv, -11550, 50, 1);
+ 
+ static const struct snd_kcontrol_new ak4642_snd_controls[] = {
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0057-cred-copy_process-should-clear-child-replacement_ses.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0057-cred-copy_process-should-clear-child-replacement_ses.patch
new file mode 100644
index 0000000..df101f8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0057-cred-copy_process-should-clear-child-replacement_ses.patch
@@ -0,0 +1,44 @@
+From 58063126ba5d427e0dae0e9319f5dabb5aeee22f Mon Sep 17 00:00:00 2001
+From: Oleg Nesterov <oleg@redhat.com>
+Date: Mon, 9 Apr 2012 21:03:50 +0200
+Subject: [PATCH 57/60] cred: copy_process() should clear
+ child->replacement_session_keyring
+
+commit 79549c6dfda0603dba9a70a53467ce62d9335c33 upstream.
+
+keyctl_session_to_parent(task) sets ->replacement_session_keyring,
+it should be processed and cleared by key_replace_session_keyring().
+
+However, this task can fork before it notices TIF_NOTIFY_RESUME and
+the new child gets the bogus ->replacement_session_keyring copied by
+dup_task_struct(). This is obviously wrong and, if nothing else, this
+leads to put_cred(already_freed_cred).
+
+change copy_creds() to clear this member. If copy_process() fails
+before this point the wrong ->replacement_session_keyring doesn't
+matter, exit_creds() won't be called.
+
+Signed-off-by: Oleg Nesterov <oleg@redhat.com>
+Acked-by: David Howells <dhowells@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/cred.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/kernel/cred.c b/kernel/cred.c
+index 5791612..48c6fd3 100644
+--- a/kernel/cred.c
++++ b/kernel/cred.c
+@@ -385,6 +385,8 @@ int copy_creds(struct task_struct *p, unsigned long clone_flags)
+ 	struct cred *new;
+ 	int ret;
+ 
++	p->replacement_session_keyring = NULL;
++
+ 	if (
+ #ifdef CONFIG_KEYS
+ 		!p->cred->thread_keyring &&
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0058-iommu-amd-Make-sure-IOMMU-interrupts-are-re-enabled-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0058-iommu-amd-Make-sure-IOMMU-interrupts-are-re-enabled-.patch
new file mode 100644
index 0000000..9b5e63a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0058-iommu-amd-Make-sure-IOMMU-interrupts-are-re-enabled-.patch
@@ -0,0 +1,76 @@
+From 94a56d3bf83bb9f3876415b7e6eea80877e10c16 Mon Sep 17 00:00:00 2001
+From: Joerg Roedel <joerg.roedel@amd.com>
+Date: Wed, 11 Apr 2012 18:40:38 +0200
+Subject: [PATCH 58/60] iommu/amd: Make sure IOMMU interrupts are re-enabled
+ on resume
+
+commit 9ddd592a191b32f2ee6c4b6ed2bd52665c3a49f5 upstream
+
+Unfortunatly the interrupts for the event log and the
+peripheral page-faults are only enabled at boot but not
+re-enabled at resume. Fix that for 3.2.
+
+Cc: stable@vger.kernel.org
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+---
+ drivers/iommu/amd_iommu_init.c |   24 +++++++++++++++++-------
+ 1 file changed, 17 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
+index 5c74179..20d5852 100644
+--- a/drivers/iommu/amd_iommu_init.c
++++ b/drivers/iommu/amd_iommu_init.c
+@@ -1033,8 +1033,9 @@ static int iommu_setup_msi(struct amd_iommu *iommu)
+ {
+ 	int r;
+ 
+-	if (pci_enable_msi(iommu->dev))
+-		return 1;
++	r = pci_enable_msi(iommu->dev);
++	if (r)
++		return r;
+ 
+ 	r = request_threaded_irq(iommu->dev->irq,
+ 				 amd_iommu_int_handler,
+@@ -1044,24 +1045,33 @@ static int iommu_setup_msi(struct amd_iommu *iommu)
+ 
+ 	if (r) {
+ 		pci_disable_msi(iommu->dev);
+-		return 1;
++		return r;
+ 	}
+ 
+ 	iommu->int_enabled = true;
+-	iommu_feature_enable(iommu, CONTROL_EVT_INT_EN);
+ 
+ 	return 0;
+ }
+ 
+ static int iommu_init_msi(struct amd_iommu *iommu)
+ {
++	int ret;
++
+ 	if (iommu->int_enabled)
+-		return 0;
++		goto enable_faults;
+ 
+ 	if (pci_find_capability(iommu->dev, PCI_CAP_ID_MSI))
+-		return iommu_setup_msi(iommu);
++		ret = iommu_setup_msi(iommu);
++	else
++		ret = -ENODEV;
+ 
+-	return 1;
++	if (ret)
++		return ret;
++
++enable_faults:
++	iommu_feature_enable(iommu, CONTROL_EVT_INT_EN);
++
++	return 0;
+ }
+ 
+ /****************************************************************************
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0059-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0059-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
new file mode 100644
index 0000000..673bcc9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0059-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
@@ -0,0 +1,43 @@
+From 263961fa56c27b335c9598d7204e004893480253 Mon Sep 17 00:00:00 2001
+From: Peter Hurley <peter@hurleysoftware.com>
+Date: Mon, 2 Apr 2012 13:44:56 +0200
+Subject: [PATCH 59/60] Bluetooth: Fix l2cap conn failures for ssp devices
+
+commit 18daf1644e634bae951a6e3d4d19d89170209762 upstream
+
+Commit 330605423c fixed l2cap conn establishment for non-ssp remote
+devices by not setting HCI_CONN_ENCRYPT_PEND every time conn security
+is tested (which was always returning failure on any subsequent
+security checks).
+
+However, this broke l2cap conn establishment for ssp remote devices
+when an ACL link was already established at SDP-level security. This
+fix ensures that encryption must be pending whenever authentication
+is also pending.
+
+Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
+Tested-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+---
+ net/bluetooth/hci_conn.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
+index c1c597e..98bfbd5 100644
+--- a/net/bluetooth/hci_conn.c
++++ b/net/bluetooth/hci_conn.c
+@@ -608,6 +608,10 @@ static int hci_conn_auth(struct hci_conn *conn, __u8 sec_level, __u8 auth_type)
+ 
+ 	if (!test_and_set_bit(HCI_CONN_AUTH_PEND, &conn->pend)) {
+ 		struct hci_cp_auth_requested cp;
++
++		/* encrypt must be pending if auth is also pending */
++		set_bit(HCI_CONN_ENCRYPT_PEND, &conn->pend);
++
+ 		cp.handle = cpu_to_le16(conn->handle);
+ 		hci_send_cmd(conn->hdev, HCI_OP_AUTH_REQUESTED,
+ 							sizeof(cp), &cp);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0060-Linux-3.2.15.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0060-Linux-3.2.15.patch
new file mode 100644
index 0000000..2127a27
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.15/0060-Linux-3.2.15.patch
@@ -0,0 +1,24 @@
+From f7e832912de7d193a1185b9f1440111cbd1dbc46 Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Fri, 13 Apr 2012 09:11:03 -0700
+Subject: [PATCH 60/60] Linux 3.2.15
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index afe4c7d..6195122 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 14
++SUBLEVEL = 15
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch
new file mode 100644
index 0000000..4dcea84
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch
@@ -0,0 +1,50 @@
+From 0e9a6694305d6e8a9afd0e0f67e9fa430f4a913d Mon Sep 17 00:00:00 2001
+From: Jesse Barnes <jbarnes@virtuousgeek.org>
+Date: Thu, 12 Jan 2012 14:51:17 -0800
+Subject: [PATCH 01/69] drm/i915: mask transcoder select bits before setting
+ them on LVDS
+
+commit 7885d2052bd94395e337709cfba093a41f273ff1 upstream.
+
+The transcoder port may changed from mode set to mode set, so make sure
+to mask out the selection bits before setting the right ones or we'll
+get black screens when going from transcoder B to A.
+
+Tested-by: Vincent Vanackere <vincent.vanackere@gmail.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Reviewed-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Cc: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_display.c |   13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
+index 9011f48..390768f 100644
+--- a/drivers/gpu/drm/i915/intel_display.c
++++ b/drivers/gpu/drm/i915/intel_display.c
+@@ -5646,12 +5646,15 @@ static int ironlake_crtc_mode_set(struct drm_crtc *crtc,
+ 	if (is_lvds) {
+ 		temp = I915_READ(PCH_LVDS);
+ 		temp |= LVDS_PORT_EN | LVDS_A0A2_CLKA_POWER_UP;
+-		if (HAS_PCH_CPT(dev))
++		if (HAS_PCH_CPT(dev)) {
++			temp &= ~PORT_TRANS_SEL_MASK;
+ 			temp |= PORT_TRANS_SEL_CPT(pipe);
+-		else if (pipe == 1)
+-			temp |= LVDS_PIPEB_SELECT;
+-		else
+-			temp &= ~LVDS_PIPEB_SELECT;
++		} else {
++			if (pipe == 1)
++				temp |= LVDS_PIPEB_SELECT;
++			else
++				temp &= ~LVDS_PIPEB_SELECT;
++		}
+ 
+ 		/* set the corresponsding LVDS_BORDER bit */
+ 		temp |= dev_priv->lvds_border_bits;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch
new file mode 100644
index 0000000..7ac071f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch
@@ -0,0 +1,39 @@
+From 039999fecc9cd2243a2322a5b2ba153f6bfe6703 Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Tue, 3 Apr 2012 17:05:41 -0400
+Subject: [PATCH 02/69] drm/radeon/kms: fix DVO setup on some r4xx chips
+
+commit afceb9319f21b18ee3bc15ee9a5f92e18ef8a8c9 upstream.
+
+Some r4xx chips have the wrong frev in the
+DVOEncoderControl table.  It should always be 1
+on r4xx.  Fixes modesetting on DVO on r4xx chips
+with the bad frev.
+
+Reported by twied on #radeon.
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/atombios_encoders.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/gpu/drm/radeon/atombios_encoders.c b/drivers/gpu/drm/radeon/atombios_encoders.c
+index 0f8eb48..5351ee1 100644
+--- a/drivers/gpu/drm/radeon/atombios_encoders.c
++++ b/drivers/gpu/drm/radeon/atombios_encoders.c
+@@ -246,6 +246,10 @@ atombios_dvo_setup(struct drm_encoder *encoder, int action)
+ 	if (!atom_parse_cmd_header(rdev->mode_info.atom_context, index, &frev, &crev))
+ 		return;
+ 
++	/* some R4xx chips have the wrong frev */
++	if (rdev->family <= CHIP_RV410)
++		frev = 1;
++
+ 	switch (frev) {
+ 	case 1:
+ 		switch (crev) {
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch
new file mode 100644
index 0000000..db337c4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch
@@ -0,0 +1,34 @@
+From 6905e24cc8b935ca1db7f0af4ec3fe95ffd30122 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Mon, 9 Apr 2012 13:59:46 +0100
+Subject: [PATCH 03/69] drm/i915/ringbuffer: Exclude last 2 cachlines of ring
+ on 845g
+
+commit 27c1cbd06a7620b354cbb363834f3bb8df4f410d upstream.
+
+The 845g shares the errata with i830 whereby executing a command
+within 2 cachelines of the end of the ringbuffer may cause a GPU hang.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_ringbuffer.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_ringbuffer.c b/drivers/gpu/drm/i915/intel_ringbuffer.c
+index 30a9af9..8673581 100644
+--- a/drivers/gpu/drm/i915/intel_ringbuffer.c
++++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
+@@ -1052,7 +1052,7 @@ int intel_init_ring_buffer(struct drm_device *dev,
+ 	 * of the buffer.
+ 	 */
+ 	ring->effective_size = ring->size;
+-	if (IS_I830(ring->dev))
++	if (IS_I830(ring->dev) || IS_845G(ring->dev))
+ 		ring->effective_size -= 128;
+ 
+ 	return 0;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch
new file mode 100644
index 0000000..323eb1b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch
@@ -0,0 +1,41 @@
+From 3168f6f46758c36d5b33ed5e77329bffed67033f Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Tue, 10 Apr 2012 12:14:27 -0400
+Subject: [PATCH 04/69] drm/radeon: only add the mm i2c bus if the hw_i2c
+ module param is set
+
+commit 46783150a6552f9513f08e62cfcc07125d6e502b upstream.
+
+It seems it can corrupt the monitor EDID in certain cases on certain
+boards when running sensors detect.  It's rarely used anyway outside
+of AIW boards.
+
+http://lists.lm-sensors.org/pipermail/lm-sensors/2012-April/035847.html
+http://lists.freedesktop.org/archives/xorg/2011-January/052239.html
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Acked-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_i2c.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_i2c.c b/drivers/gpu/drm/radeon/radeon_i2c.c
+index 7bb1b07..1441b00 100644
+--- a/drivers/gpu/drm/radeon/radeon_i2c.c
++++ b/drivers/gpu/drm/radeon/radeon_i2c.c
+@@ -890,6 +890,10 @@ struct radeon_i2c_chan *radeon_i2c_create(struct drm_device *dev,
+ 	struct radeon_i2c_chan *i2c;
+ 	int ret;
+ 
++	/* don't add the mm_i2c bus unless hw_i2c is enabled */
++	if (rec->mm_i2c && (radeon_hw_i2c == 0))
++		return NULL;
++
+ 	i2c = kzalloc(sizeof(struct radeon_i2c_chan), GFP_KERNEL);
+ 	if (i2c == NULL)
+ 		return NULL;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch
new file mode 100644
index 0000000..45e685a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch
@@ -0,0 +1,130 @@
+From 95523fb19e6eea48b9c0632b81780268f386b22f Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Tue, 10 Apr 2012 10:42:36 +0200
+Subject: [PATCH 05/69] drm/i915: properly compute dp dithering for
+ user-created modes
+
+commit c4867936474183332db4c19791a65fdad6474fd5 upstream.
+
+We've only computed whether we need to fall back to 6bpc due to dp
+link bandwidth constrains in mode_valid, but not mode_fixup. Under
+various circumstances X likes to create new modes which then lack
+proper 6bpc flags (if required), resulting in mode_fixup failures and
+ultimately black screens.
+
+Chris Wilson pointed out that we still get things wrong for bpp > 24,
+but that should be fixed in another patch (and it'll be easier because
+this patch consolidates the logic).
+
+The likely culprit for this regression is
+
+commit 3d794f87238f74d80e78a7611c7fbde8a54c85c2
+Author: Keith Packard <keithp@keithp.com>
+Date:   Wed Jan 25 08:16:25 2012 -0800
+
+    drm/i915: Force explicit bpp selection for intel_dp_link_required
+
+v2: Fix indentation and tune down the too bold claim that this should
+fix the world. Both noticed by Chris Wilson.
+
+v3: Try to really git add things.
+
+Reported-and-tested-by: Brice Goglin <Brice.Goglin@ens-lyon.org>
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=48170
+Cc: stable@kernel.org
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_dp.c |   49 ++++++++++++++++++++++++++++-----------
+ 1 file changed, 35 insertions(+), 14 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
+index 94f860c..12eb789 100644
+--- a/drivers/gpu/drm/i915/intel_dp.c
++++ b/drivers/gpu/drm/i915/intel_dp.c
+@@ -219,14 +219,38 @@ intel_dp_max_data_rate(int max_link_clock, int max_lanes)
+ 	return (max_link_clock * max_lanes * 8) / 10;
+ }
+ 
++static bool
++intel_dp_adjust_dithering(struct intel_dp *intel_dp,
++			  struct drm_display_mode *mode,
++			  struct drm_display_mode *adjusted_mode)
++{
++	int max_link_clock = intel_dp_link_clock(intel_dp_max_link_bw(intel_dp));
++	int max_lanes = intel_dp_max_lane_count(intel_dp);
++	int max_rate, mode_rate;
++
++	mode_rate = intel_dp_link_required(mode->clock, 24);
++	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
++
++	if (mode_rate > max_rate) {
++		mode_rate = intel_dp_link_required(mode->clock, 18);
++		if (mode_rate > max_rate)
++			return false;
++
++		if (adjusted_mode)
++			adjusted_mode->private_flags
++				|= INTEL_MODE_DP_FORCE_6BPC;
++
++		return true;
++	}
++
++	return true;
++}
++
+ static int
+ intel_dp_mode_valid(struct drm_connector *connector,
+ 		    struct drm_display_mode *mode)
+ {
+ 	struct intel_dp *intel_dp = intel_attached_dp(connector);
+-	int max_link_clock = intel_dp_link_clock(intel_dp_max_link_bw(intel_dp));
+-	int max_lanes = intel_dp_max_lane_count(intel_dp);
+-	int max_rate, mode_rate;
+ 
+ 	if (is_edp(intel_dp) && intel_dp->panel_fixed_mode) {
+ 		if (mode->hdisplay > intel_dp->panel_fixed_mode->hdisplay)
+@@ -236,16 +260,8 @@ intel_dp_mode_valid(struct drm_connector *connector,
+ 			return MODE_PANEL;
+ 	}
+ 
+-	mode_rate = intel_dp_link_required(mode->clock, 24);
+-	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
+-
+-	if (mode_rate > max_rate) {
+-			mode_rate = intel_dp_link_required(mode->clock, 18);
+-			if (mode_rate > max_rate)
+-				return MODE_CLOCK_HIGH;
+-			else
+-				mode->private_flags |= INTEL_MODE_DP_FORCE_6BPC;
+-	}
++	if (!intel_dp_adjust_dithering(intel_dp, mode, NULL))
++		return MODE_CLOCK_HIGH;
+ 
+ 	if (mode->clock < 10000)
+ 		return MODE_CLOCK_LOW;
+@@ -673,7 +689,7 @@ intel_dp_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
+ 	int lane_count, clock;
+ 	int max_lane_count = intel_dp_max_lane_count(intel_dp);
+ 	int max_clock = intel_dp_max_link_bw(intel_dp) == DP_LINK_BW_2_7 ? 1 : 0;
+-	int bpp = mode->private_flags & INTEL_MODE_DP_FORCE_6BPC ? 18 : 24;
++	int bpp;
+ 	static int bws[2] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7 };
+ 
+ 	if (is_edp(intel_dp) && intel_dp->panel_fixed_mode) {
+@@ -687,6 +703,11 @@ intel_dp_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
+ 		mode->clock = intel_dp->panel_fixed_mode->clock;
+ 	}
+ 
++	if (!intel_dp_adjust_dithering(intel_dp, mode, adjusted_mode))
++		return false;
++
++	bpp = adjusted_mode->private_flags & INTEL_MODE_DP_FORCE_6BPC ? 18 : 24;
++
+ 	for (lane_count = 1; lane_count <= max_lane_count; lane_count <<= 1) {
+ 		for (clock = 0; clock <= max_clock; clock++) {
+ 			int link_avail = intel_dp_max_data_rate(intel_dp_link_clock(bws[clock]), lane_count);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch
new file mode 100644
index 0000000..79340e1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch
@@ -0,0 +1,32 @@
+From f6810569f5eea5dd63a4be4fdcf052ab08d4f7fa Mon Sep 17 00:00:00 2001
+From: Jesse Barnes <jbarnes@virtuousgeek.org>
+Date: Wed, 11 Apr 2012 09:39:02 -0700
+Subject: [PATCH 06/69] drm/i915: make rc6 module parameter read-only
+
+commit f57f9c167af7cb3fd315e6a8ebe194a8aea0832a upstream.
+
+People have been getting confused and thinking this is a runtime control.
+
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_drv.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
+index e52b705..d0f8830 100644
+--- a/drivers/gpu/drm/i915/i915_drv.c
++++ b/drivers/gpu/drm/i915/i915_drv.c
+@@ -64,7 +64,7 @@ MODULE_PARM_DESC(semaphores,
+ 		"Use semaphores for inter-ring sync (default: -1 (use per-chip defaults))");
+ 
+ int i915_enable_rc6 __read_mostly = -1;
+-module_param_named(i915_enable_rc6, i915_enable_rc6, int, 0600);
++module_param_named(i915_enable_rc6, i915_enable_rc6, int, 0400);
+ MODULE_PARM_DESC(i915_enable_rc6,
+ 		"Enable power-saving render C-state 6 (default: -1 (use per-chip default)");
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch
new file mode 100644
index 0000000..550db2e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch
@@ -0,0 +1,45 @@
+From a8c85bb6818c1e5d3fec8904cae9a851ed700bb6 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Mon, 26 Mar 2012 10:48:20 -0500
+Subject: [PATCH 07/69] rtlwifi: Add missing DMA buffer unmapping for PCI
+ drivers
+
+commit 673f7786e205c87b5d978c62827b9a66d097bebb upstream.
+
+In https://bugzilla.kernel.org/show_bug.cgi?id=42976, a system with driver
+rtl8192se used as an AP suffers from "Out of SW-IOMMU space" errors. These
+are caused by the DMA buffers used for beacons never being unmapped.
+
+This bug was also reported at
+https://bugs.launchpad.net/ubuntu/+source/linux/+bug/961618
+
+Reported-and-Tested-by: Da Xue <da@lessconfused.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rtlwifi/pci.c |    7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/pci.c b/drivers/net/wireless/rtlwifi/pci.c
+index 9afcad3..d44d398 100644
+--- a/drivers/net/wireless/rtlwifi/pci.c
++++ b/drivers/net/wireless/rtlwifi/pci.c
+@@ -926,8 +926,13 @@ static void _rtl_pci_prepare_bcn_tasklet(struct ieee80211_hw *hw)
+ 	memset(&tcb_desc, 0, sizeof(struct rtl_tcb_desc));
+ 	ring = &rtlpci->tx_ring[BEACON_QUEUE];
+ 	pskb = __skb_dequeue(&ring->queue);
+-	if (pskb)
++	if (pskb) {
++		struct rtl_tx_desc *entry = &ring->desc[ring->idx];
++		pci_unmap_single(rtlpci->pdev, rtlpriv->cfg->ops->get_desc(
++				 (u8 *) entry, true, HW_DESC_TXBUFF_ADDR),
++				 pskb->len, PCI_DMA_TODEVICE);
+ 		kfree_skb(pskb);
++	}
+ 
+ 	/*NB: the beacon data buffer must be 32-bit aligned. */
+ 	pskb = ieee80211_beacon_get(hw, mac->vif);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch
new file mode 100644
index 0000000..4f0dc10
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch
@@ -0,0 +1,37 @@
+From a1e9b9702554dae713f7344f8d357ac261a3a0d7 Mon Sep 17 00:00:00 2001
+From: Marc Zyngier <Marc.Zyngier@arm.com>
+Date: Wed, 11 Apr 2012 14:52:55 +0100
+Subject: [PATCH 08/69] ARM: 7379/1: DT: fix atags_to_fdt() second call site
+
+commit 9c5fd9e85f574d9d0361b2b878f55732290afe5b upstream.
+
+atags_to_fdt() returns 1 when it fails to find a valid FDT signature.
+The CONFIG_ARM_ATAG_DTB_COMPAT code is supposed to retry with another
+location, but only does so when the initial call doesn't fail.
+
+Fix this by using the correct condition in the assembly code.
+
+Acked-by: Nicolas Pitre <nicolas.pitre@linaro.org>
+Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/boot/compressed/head.S |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/boot/compressed/head.S b/arch/arm/boot/compressed/head.S
+index c2effc9..9c18ebd 100644
+--- a/arch/arm/boot/compressed/head.S
++++ b/arch/arm/boot/compressed/head.S
+@@ -273,7 +273,7 @@ restart:	adr	r0, LC0
+ 		add	r0, r0, #0x100
+ 		mov	r1, r6
+ 		sub	r2, sp, r6
+-		blne	atags_to_fdt
++		bleq	atags_to_fdt
+ 
+ 		ldmfd	sp!, {r0-r3, ip, lr}
+ 		sub	sp, sp, #0x10000
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch
new file mode 100644
index 0000000..19d9a23
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch
@@ -0,0 +1,54 @@
+From f57d472183a16e61832110d6cdb7a410802c0c34 Mon Sep 17 00:00:00 2001
+From: Jonathan Austin <Jonathan.Austin@arm.com>
+Date: Thu, 12 Apr 2012 17:45:25 +0100
+Subject: [PATCH 09/69] ARM: 7384/1: ThumbEE: Disable userspace TEEHBR access
+ for !CONFIG_ARM_THUMBEE
+
+commit 078c04545ba56da21567728a909a496df5ff730d upstream.
+
+Currently when ThumbEE is not enabled (!CONFIG_ARM_THUMBEE) the ThumbEE
+register states are not saved/restored at context switch. The default state
+of the ThumbEE Ctrl register (TEECR) allows userspace accesses to the
+ThumbEE Base Handler register (TEEHBR). This can cause unexpected behaviour
+when people use ThumbEE on !CONFIG_ARM_THUMBEE kernels, as well as allowing
+covert communication - eg between userspace tasks running inside chroot
+jails.
+
+This patch sets up TEECR in order to prevent user-space access to TEEHBR
+when !CONFIG_ARM_THUMBEE. In this case, tasks are sent SIGILL if they try to
+access TEEHBR.
+
+Reviewed-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Jonathan Austin <jonathan.austin@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mm/proc-v7.S |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/arch/arm/mm/proc-v7.S b/arch/arm/mm/proc-v7.S
+index 82ef81d..785365e 100644
+--- a/arch/arm/mm/proc-v7.S
++++ b/arch/arm/mm/proc-v7.S
+@@ -382,6 +382,18 @@ __v7_setup:
+ 	mcr	p15, 0, r5, c10, c2, 0		@ write PRRR
+ 	mcr	p15, 0, r6, c10, c2, 1		@ write NMRR
+ #endif
++#ifndef CONFIG_ARM_THUMBEE
++	mrc	p15, 0, r0, c0, c1, 0		@ read ID_PFR0 for ThumbEE
++	and	r0, r0, #(0xf << 12)		@ ThumbEE enabled field
++	teq	r0, #(1 << 12)			@ check if ThumbEE is present
++	bne	1f
++	mov	r5, #0
++	mcr	p14, 6, r5, c1, c0, 0		@ Initialize TEEHBR to 0
++	mrc	p14, 6, r0, c0, c0, 0		@ load TEECR
++	orr	r0, r0, #1			@ set the 1st bit in order to
++	mcr	p14, 6, r0, c0, c0, 0		@ stop userspace TEEHBR access
++1:
++#endif
+ 	adr	r5, v7_crval
+ 	ldmia	r5, {r5, r6}
+ #ifdef CONFIG_CPU_ENDIAN_BE8
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch
new file mode 100644
index 0000000..a80aa00
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch
@@ -0,0 +1,42 @@
+From 814a0921c841d7bb82d27dfccdafea9982420c24 Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Thu, 12 Apr 2012 16:05:06 +1000
+Subject: [PATCH 10/69] md/bitmap: prevent bitmap_daemon_work running while
+ initialising bitmap
+
+commit afbaa90b80b1ec66e5137cc3824746bfdf559b18 upstream.
+
+If a bitmap is added while the array is active, it is possible
+for bitmap_daemon_work to run while the bitmap is being
+initialised.
+This is particularly a problem if bitmap_daemon_work sees
+bitmap->filemap as non-NULL before it has been filled in properly.
+So hold bitmap_info.mutex while filling in ->filemap
+to prevent problems.
+
+This patch is suitable for any -stable kernel, though it might not
+apply cleanly before about 3.1.
+
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/bitmap.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
+index 2a8722b..62a8e68 100644
+--- a/drivers/md/bitmap.c
++++ b/drivers/md/bitmap.c
+@@ -1819,7 +1819,9 @@ int bitmap_load(struct mddev *mddev)
+ 		 * re-add of a missing device */
+ 		start = mddev->recovery_cp;
+ 
++	mutex_lock(&mddev->bitmap_info.mutex);
+ 	err = bitmap_init_from_disk(bitmap, start);
++	mutex_unlock(&mddev->bitmap_info.mutex);
+ 
+ 	if (err)
+ 		goto out;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch
new file mode 100644
index 0000000..a6ef289
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch
@@ -0,0 +1,51 @@
+From afeb2c0d484fb63fc8de83308f3ae74c9a607ad0 Mon Sep 17 00:00:00 2001
+From: Johan Hovold <jhovold@gmail.com>
+Date: Wed, 11 Apr 2012 11:24:35 +0200
+Subject: [PATCH 11/69] Bluetooth: uart-ldisc: Fix memory leak
+
+This is a partial, self-contained, minimal backport of commit
+797fe796c4335b35d95d5326824513befdb5d1e9 upstream which fixes the memory
+leak:
+
+Bluetooth: uart-ldisc: Fix memory leak and remove destruct cb
+
+We currently leak the hci_uart object if HCI_UART_PROTO_SET is never set
+because the hci-destruct callback will then never be called.  This fix
+removes the hci-destruct callback and frees the driver internal private
+hci_uart object directly on tty-close. We call hci_unregister_dev() here
+so the hci-core will never call our callbacks again (except destruct).
+Therefore, we can safely free the driver internal data right away and
+set the destruct callback to NULL.
+
+Signed-off-by: David Herrmann <dh.herrmann@googlemail.com>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+Signed-off-by: Johan Hovold <jhovold@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/hci_ldisc.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
+index 48ad2a7..36dafef 100644
+--- a/drivers/bluetooth/hci_ldisc.c
++++ b/drivers/bluetooth/hci_ldisc.c
+@@ -237,7 +237,6 @@ static void hci_uart_destruct(struct hci_dev *hdev)
+ 		return;
+ 
+ 	BT_DBG("%s", hdev->name);
+-	kfree(hdev->driver_data);
+ }
+ 
+ /* ------ LDISC part ------ */
+@@ -316,6 +315,7 @@ static void hci_uart_tty_close(struct tty_struct *tty)
+ 				hci_free_dev(hdev);
+ 			}
+ 		}
++		kfree(hu);
+ 	}
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch
new file mode 100644
index 0000000..fdf5235
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch
@@ -0,0 +1,107 @@
+From 96e70b85a81d0c38ed66c1861711855a15428870 Mon Sep 17 00:00:00 2001
+From: Johan Hovold <jhovold@gmail.com>
+Date: Thu, 15 Mar 2012 14:48:40 +0100
+Subject: [PATCH 12/69] Bluetooth: hci_ldisc: fix NULL-pointer dereference on
+ tty_close
+
+commit 33b69bf80a3704d45341928e4ff68b6ebd470686 upstream.
+
+Do not close protocol driver until device has been unregistered.
+
+This fixes a race between tty_close and hci_dev_open which can result in
+a NULL-pointer dereference.
+
+The line discipline closes the protocol driver while we may still have
+hci_dev_open sleeping on the req_lock mutex resulting in a NULL-pointer
+dereference when lock is acquired and hci_init_req called.
+
+Bug is 100% reproducible using hciattach and a disconnected serial port:
+
+0. # hciattach -n ttyO1 any noflow
+
+1. hci_dev_open called from hci_power_on grabs req lock
+2. hci_init_req executes but device fails to initialise (times out
+   eventually)
+3. hci_dev_open is called from hci_sock_ioctl and sleeps on req lock
+4. hci_uart_tty_close detaches protocol driver and cancels init req
+5. hci_dev_open (1) releases req lock
+6. hci_dev_open (3) grabs req lock, calls hci_init_req, which triggers oops
+   when request is prepared in hci_uart_send_frame
+
+[  137.201263] Unable to handle kernel NULL pointer dereference at virtual address 00000028
+[  137.209838] pgd = c0004000
+[  137.212677] [00000028] *pgd=00000000
+[  137.216430] Internal error: Oops: 17 [#1]
+[  137.220642] Modules linked in:
+[  137.223846] CPU: 0    Tainted: G        W     (3.3.0-rc6-dirty #406)
+[  137.230529] PC is at __lock_acquire+0x5c/0x1ab0
+[  137.235290] LR is at lock_acquire+0x9c/0x128
+[  137.239776] pc : [<c0071490>]    lr : [<c00733f8>]    psr: 20000093
+[  137.239776] sp : cf869dd8  ip : c0529554  fp : c051c730
+[  137.251800] r10: 00000000  r9 : cf8673c0  r8 : 00000080
+[  137.257293] r7 : 00000028  r6 : 00000002  r5 : 00000000  r4 : c053fd70
+[  137.264129] r3 : 00000000  r2 : 00000000  r1 : 00000000  r0 : 00000001
+[  137.270965] Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
+[  137.278717] Control: 10c5387d  Table: 8f0f4019  DAC: 00000015
+[  137.284729] Process kworker/u:1 (pid: 7, stack limit = 0xcf8682e8)
+[  137.291229] Stack: (0xcf869dd8 to 0xcf86a000)
+[  137.295776] 9dc0:                                                       c0529554 00000000
+[  137.304351] 9de0: cf8673c0 cf868000 d03ea1ef cf868000 000001ef 00000470 00000000 00000002
+[  137.312927] 9e00: cf8673c0 00000001 c051c730 c00716ec 0000000c 00000440 c0529554 00000001
+[  137.321533] 9e20: c051c730 cf868000 d03ea1f3 00000000 c053b978 00000000 00000028 cf868000
+[  137.330078] 9e40: 00000000 00000000 00000002 00000000 00000000 c00733f8 00000002 00000080
+[  137.338684] 9e60: 00000000 c02a1d50 00000000 00000001 60000013 c0969a1c 60000093 c053b96c
+[  137.347259] 9e80: 00000002 00000018 20000013 c02a1d50 cf0ac000 00000000 00000002 cf868000
+[  137.355834] 9ea0: 00000089 c0374130 00000002 00000000 c02a1d50 cf0ac000 0000000c cf0fc540
+[  137.364410] 9ec0: 00000018 c02a1d50 cf0fc540 00000000 cf0fc540 c0282238 c028220c cf178d80
+[  137.372985] 9ee0: 127525d8 c02821cc 9a1fa451 c032727c 9a1fa451 127525d8 cf0fc540 cf0ac4ec
+[  137.381561] 9f00: cf0ac000 cf0fc540 cf0ac584 c03285f4 c0328580 cf0ac4ec cf85c740 c05510cc
+[  137.390136] 9f20: ce825400 c004c914 00000002 00000000 c004c884 ce8254f5 cf869f48 00000000
+[  137.398712] 9f40: c0328580 ce825415 c0a7f914 c061af64 00000000 c048cf3c cf8673c0 cf85c740
+[  137.407287] 9f60: c05510cc c051a66c c05510ec c05510c4 cf85c750 cf868000 00000089 c004d6ac
+[  137.415863] 9f80: 00000000 c0073d14 00000001 cf853ed8 cf85c740 c004d558 00000013 00000000
+[  137.424438] 9fa0: 00000000 00000000 00000000 c00516b0 00000000 00000000 cf85c740 00000000
+[  137.433013] 9fc0: 00000001 dead4ead ffffffff ffffffff c0551674 00000000 00000000 c0450aa4
+[  137.441589] 9fe0: cf869fe0 cf869fe0 cf853ed8 c005162c c0013b30 c0013b30 00ffff00 00ffff00
+[  137.450164] [<c0071490>] (__lock_acquire+0x5c/0x1ab0) from [<c00733f8>] (lock_acquire+0x9c/0x128)
+[  137.459503] [<c00733f8>] (lock_acquire+0x9c/0x128) from [<c0374130>] (_raw_spin_lock_irqsave+0x44/0x58)
+[  137.469360] [<c0374130>] (_raw_spin_lock_irqsave+0x44/0x58) from [<c02a1d50>] (skb_queue_tail+0x18/0x48)
+[  137.479339] [<c02a1d50>] (skb_queue_tail+0x18/0x48) from [<c0282238>] (h4_enqueue+0x2c/0x34)
+[  137.488189] [<c0282238>] (h4_enqueue+0x2c/0x34) from [<c02821cc>] (hci_uart_send_frame+0x34/0x68)
+[  137.497497] [<c02821cc>] (hci_uart_send_frame+0x34/0x68) from [<c032727c>] (hci_send_frame+0x50/0x88)
+[  137.507171] [<c032727c>] (hci_send_frame+0x50/0x88) from [<c03285f4>] (hci_cmd_work+0x74/0xd4)
+[  137.516204] [<c03285f4>] (hci_cmd_work+0x74/0xd4) from [<c004c914>] (process_one_work+0x1a0/0x4ec)
+[  137.525604] [<c004c914>] (process_one_work+0x1a0/0x4ec) from [<c004d6ac>] (worker_thread+0x154/0x344)
+[  137.535278] [<c004d6ac>] (worker_thread+0x154/0x344) from [<c00516b0>] (kthread+0x84/0x90)
+[  137.543975] [<c00516b0>] (kthread+0x84/0x90) from [<c0013b30>] (kernel_thread_exit+0x0/0x8)
+[  137.552734] Code: e59f4e5c e5941000 e3510000 0a000031 (e5971000)
+[  137.559234] ---[ end trace 1b75b31a2719ed1e ]---
+
+Signed-off-by: Johan Hovold <jhovold@gmail.com>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/hci_ldisc.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/bluetooth/hci_ldisc.c b/drivers/bluetooth/hci_ldisc.c
+index 36dafef..8f3d6db 100644
+--- a/drivers/bluetooth/hci_ldisc.c
++++ b/drivers/bluetooth/hci_ldisc.c
+@@ -309,11 +309,11 @@ static void hci_uart_tty_close(struct tty_struct *tty)
+ 			hci_uart_close(hdev);
+ 
+ 		if (test_and_clear_bit(HCI_UART_PROTO_SET, &hu->flags)) {
+-			hu->proto->close(hu);
+ 			if (hdev) {
+ 				hci_unregister_dev(hdev);
+ 				hci_free_dev(hdev);
+ 			}
++			hu->proto->close(hu);
+ 		}
+ 		kfree(hu);
+ 	}
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch
new file mode 100644
index 0000000..f084adc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch
@@ -0,0 +1,93 @@
+From f1c04355902ab71e60c67f39ea29822d0eea062f Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Mon, 16 Apr 2012 12:16:20 -0400
+Subject: [PATCH 13/69] ext4: address scalability issue by removing extent
+ cache statistics
+
+commit 9cd70b347e9761ea2d2ac3d758c529a48a8193e6 upstream.
+
+Andi Kleen and Tim Chen have reported that under certain circumstances
+the extent cache statistics are causing scalability problems due to
+cache line bounces.
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ext4/ext4.h    |    3 ---
+ fs/ext4/extents.c |    4 ----
+ fs/ext4/super.c   |   16 ----------------
+ 3 files changed, 23 deletions(-)
+
+diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
+index dbae4d9..7b1cd5c 100644
+--- a/fs/ext4/ext4.h
++++ b/fs/ext4/ext4.h
+@@ -1185,9 +1185,6 @@ struct ext4_sb_info {
+ 	unsigned long s_ext_blocks;
+ 	unsigned long s_ext_extents;
+ #endif
+-	/* ext4 extent cache stats */
+-	unsigned long extent_cache_hits;
+-	unsigned long extent_cache_misses;
+ 
+ 	/* for buddy allocator */
+ 	struct ext4_group_info ***s_group_info;
+diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
+index 7507036..c2a2012 100644
+--- a/fs/ext4/extents.c
++++ b/fs/ext4/extents.c
+@@ -2052,10 +2052,6 @@ static int ext4_ext_check_cache(struct inode *inode, ext4_lblk_t block,
+ 		ret = 1;
+ 	}
+ errout:
+-	if (!ret)
+-		sbi->extent_cache_misses++;
+-	else
+-		sbi->extent_cache_hits++;
+ 	trace_ext4_ext_in_cache(inode, block, ret);
+ 	spin_unlock(&EXT4_I(inode)->i_block_reservation_lock);
+ 	return ret;
+diff --git a/fs/ext4/super.c b/fs/ext4/super.c
+index 9281dbe..961059b 100644
+--- a/fs/ext4/super.c
++++ b/fs/ext4/super.c
+@@ -2504,18 +2504,6 @@ static ssize_t lifetime_write_kbytes_show(struct ext4_attr *a,
+ 			  EXT4_SB(sb)->s_sectors_written_start) >> 1)));
+ }
+ 
+-static ssize_t extent_cache_hits_show(struct ext4_attr *a,
+-				      struct ext4_sb_info *sbi, char *buf)
+-{
+-	return snprintf(buf, PAGE_SIZE, "%lu\n", sbi->extent_cache_hits);
+-}
+-
+-static ssize_t extent_cache_misses_show(struct ext4_attr *a,
+-					struct ext4_sb_info *sbi, char *buf)
+-{
+-	return snprintf(buf, PAGE_SIZE, "%lu\n", sbi->extent_cache_misses);
+-}
+-
+ static ssize_t inode_readahead_blks_store(struct ext4_attr *a,
+ 					  struct ext4_sb_info *sbi,
+ 					  const char *buf, size_t count)
+@@ -2573,8 +2561,6 @@ static struct ext4_attr ext4_attr_##name = __ATTR(name, mode, show, store)
+ EXT4_RO_ATTR(delayed_allocation_blocks);
+ EXT4_RO_ATTR(session_write_kbytes);
+ EXT4_RO_ATTR(lifetime_write_kbytes);
+-EXT4_RO_ATTR(extent_cache_hits);
+-EXT4_RO_ATTR(extent_cache_misses);
+ EXT4_ATTR_OFFSET(inode_readahead_blks, 0644, sbi_ui_show,
+ 		 inode_readahead_blks_store, s_inode_readahead_blks);
+ EXT4_RW_ATTR_SBI_UI(inode_goal, s_inode_goal);
+@@ -2590,8 +2576,6 @@ static struct attribute *ext4_attrs[] = {
+ 	ATTR_LIST(delayed_allocation_blocks),
+ 	ATTR_LIST(session_write_kbytes),
+ 	ATTR_LIST(lifetime_write_kbytes),
+-	ATTR_LIST(extent_cache_hits),
+-	ATTR_LIST(extent_cache_misses),
+ 	ATTR_LIST(inode_readahead_blks),
+ 	ATTR_LIST(inode_goal),
+ 	ATTR_LIST(mb_stats),
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch
new file mode 100644
index 0000000..ac9d27d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch
@@ -0,0 +1,58 @@
+From 31a9ac5149ad2b11b591eb704f3132d0d344e7e0 Mon Sep 17 00:00:00 2001
+From: "Luck, Tony" <tony.luck@intel.com>
+Date: Mon, 16 Apr 2012 16:28:01 -0700
+Subject: [PATCH 14/69] ia64: fix futex_atomic_cmpxchg_inatomic()
+
+commit c76f39bddb84f93f70a5520d9253ec0317bec216 upstream.
+
+Michel Lespinasse cleaned up the futex calling conventions in commit
+37a9d912b24f ("futex: Sanitize cmpxchg_futex_value_locked API").
+
+But the ia64 implementation was subtly broken.  Gcc does not know that
+register "r8" will be updated by the fault handler if the cmpxchg
+instruction takes an exception.  So it feels safe in letting the
+initialization of r8 slide to after the cmpxchg.  Result: we always
+return 0 whether the user address faulted or not.
+
+Fix by moving the initialization of r8 into the __asm__ code so gcc
+won't move it.
+
+Reported-by: <emeric.maschino@gmail.com>
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=42757
+Tested-by: <emeric.maschino@gmail.com>
+Acked-by: Michel Lespinasse <walken@google.com>
+Signed-off-by: Tony Luck <tony.luck@intel.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/ia64/include/asm/futex.h |    9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/arch/ia64/include/asm/futex.h b/arch/ia64/include/asm/futex.h
+index 8428525..21ab376 100644
+--- a/arch/ia64/include/asm/futex.h
++++ b/arch/ia64/include/asm/futex.h
+@@ -107,15 +107,16 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
+ 		return -EFAULT;
+ 
+ 	{
+-		register unsigned long r8 __asm ("r8") = 0;
++		register unsigned long r8 __asm ("r8");
+ 		unsigned long prev;
+ 		__asm__ __volatile__(
+ 			"	mf;;					\n"
+-			"	mov ar.ccv=%3;;				\n"
+-			"[1:]	cmpxchg4.acq %0=[%1],%2,ar.ccv		\n"
++			"	mov %0=r0				\n"
++			"	mov ar.ccv=%4;;				\n"
++			"[1:]	cmpxchg4.acq %1=[%2],%3,ar.ccv		\n"
+ 			"	.xdata4 \"__ex_table\", 1b-., 2f-.	\n"
+ 			"[2:]"
+-			: "=r" (prev)
++			: "=r" (r8), "=r" (prev)
+ 			: "r" (uaddr), "r" (newval),
+ 			  "rO" ((long) (unsigned) oldval)
+ 			: "memory");
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch
new file mode 100644
index 0000000..7990dfe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch
@@ -0,0 +1,39 @@
+From a5333b50b8a4297f3b9959366fb26ad9b9c55314 Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Thu, 12 Apr 2012 12:49:16 -0700
+Subject: [PATCH 15/69] drivers/rtc/rtc-pl031.c: enable clock on all ST
+ variants
+
+commit 2f3972168353d355854d6381f1f360ce83b723e5 upstream.
+
+The ST variants of the PL031 all require bit 26 in the control register
+to be set before they work properly.  Discovered this when testing on
+the Nomadik board where it would suprisingly just stand still.
+
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+Cc: Mian Yousaf Kaukab <mian.yousaf.kaukab@stericsson.com>
+Cc: Alessandro Rubini <rubini@unipv.it>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/rtc/rtc-pl031.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/drivers/rtc/rtc-pl031.c b/drivers/rtc/rtc-pl031.c
+index ff1b84b..e86edfc 100644
+--- a/drivers/rtc/rtc-pl031.c
++++ b/drivers/rtc/rtc-pl031.c
+@@ -339,8 +339,7 @@ static int pl031_probe(struct amba_device *adev, const struct amba_id *id)
+ 	dev_dbg(&adev->dev, "revision = 0x%01x\n", ldata->hw_revision);
+ 
+ 	/* Enable the clockwatch on ST Variants */
+-	if ((ldata->hw_designer == AMBA_VENDOR_ST) &&
+-	    (ldata->hw_revision > 1))
++	if (ldata->hw_designer == AMBA_VENDOR_ST)
+ 		writel(readl(ldata->base + RTC_CR) | RTC_CR_CWEN,
+ 		       ldata->base + RTC_CR);
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch
new file mode 100644
index 0000000..5b93b53
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch
@@ -0,0 +1,89 @@
+From 7295297274cc9506d1600eb09ab93f203e860f48 Mon Sep 17 00:00:00 2001
+From: Chris Metcalf <cmetcalf@tilera.com>
+Date: Thu, 12 Apr 2012 12:49:15 -0700
+Subject: [PATCH 16/69] hugetlb: fix race condition in hugetlb_fault()
+
+commit 66aebce747eaf9bc456bf1f1b217d8db843031d0 upstream.
+
+The race is as follows:
+
+Suppose a multi-threaded task forks a new process (on cpu A), thus
+bumping up the ref count on all the pages.  While the fork is occurring
+(and thus we have marked all the PTEs as read-only), another thread in
+the original process (on cpu B) tries to write to a huge page, taking an
+access violation from the write-protect and calling hugetlb_cow().  Now,
+suppose the fork() fails.  It will undo the COW and decrement the ref
+count on the pages, so the ref count on the huge page drops back to 1.
+Meanwhile hugetlb_cow() also decrements the ref count by one on the
+original page, since the original address space doesn't need it any
+more, having copied a new page to replace the original page.  This
+leaves the ref count at zero, and when we call unlock_page(), we panic.
+
+	fork on CPU A				fault on CPU B
+	=============				==============
+	...
+	down_write(&parent->mmap_sem);
+	down_write_nested(&child->mmap_sem);
+	...
+	while duplicating vmas
+		if error
+			break;
+	...
+	up_write(&child->mmap_sem);
+	up_write(&parent->mmap_sem);		...
+						down_read(&parent->mmap_sem);
+						...
+						lock_page(page);
+						handle COW
+						page_mapcount(old_page) == 2
+						alloc and prepare new_page
+	...
+	handle error
+	page_remove_rmap(page);
+	put_page(page);
+	...
+						fold new_page into pte
+						page_remove_rmap(page);
+						put_page(page);
+						...
+				oops ==>	unlock_page(page);
+						up_read(&parent->mmap_sem);
+
+The solution is to take an extra reference to the page while we are
+holding the lock on it.
+
+Signed-off-by: Chris Metcalf <cmetcalf@tilera.com>
+Cc: Hillf Danton <dhillf@gmail.com>
+Cc: Michal Hocko <mhocko@suse.cz>
+Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Hugh Dickins <hughd@google.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/hugetlb.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mm/hugetlb.c b/mm/hugetlb.c
+index 2316840..bd936ed 100644
+--- a/mm/hugetlb.c
++++ b/mm/hugetlb.c
+@@ -2686,6 +2686,7 @@ int hugetlb_fault(struct mm_struct *mm, struct vm_area_struct *vma,
+ 	 * so no worry about deadlock.
+ 	 */
+ 	page = pte_page(entry);
++	get_page(page);
+ 	if (page != pagecache_page)
+ 		lock_page(page);
+ 
+@@ -2717,6 +2718,7 @@ out_page_table_lock:
+ 	}
+ 	if (page != pagecache_page)
+ 		unlock_page(page);
++	put_page(page);
+ 
+ out_mutex:
+ 	mutex_unlock(&hugetlb_instantiation_mutex);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch
new file mode 100644
index 0000000..0bd5305
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch
@@ -0,0 +1,107 @@
+From 67d0ef228b571d53087923471cdd9de8281b7545 Mon Sep 17 00:00:00 2001
+From: Marek Belisko <marek.belisko@open-nandra.com>
+Date: Thu, 12 Apr 2012 21:48:03 +0200
+Subject: [PATCH 17/69] staging: iio: hmc5843: Fix crash in probe function.
+
+commit 62d2feb9803f18c4e3c8a1a2c7e30a54df8a1d72 upstream.
+
+Fix crash after issuing:
+	echo hmc5843 0x1e > /sys/class/i2c-dev/i2c-2/device/new_device
+
+	[   37.180999] device: '2-001e': device_add
+	[   37.188293] bus: 'i2c': add device 2-001e
+	[   37.194549] PM: Adding info for i2c:2-001e
+	[   37.200958] bus: 'i2c': driver_probe_device: matched device 2-001e with driver hmc5843
+	[   37.210815] bus: 'i2c': really_probe: probing driver hmc5843 with device 2-001e
+	[   37.224884] HMC5843 initialized
+	[   37.228759] ------------[ cut here ]------------
+	[   37.233612] kernel BUG at mm/slab.c:505!
+	[   37.237701] Internal error: Oops - BUG: 0 [#1] PREEMPT
+	[   37.243103] Modules linked in:
+	[   37.246337] CPU: 0    Not tainted  (3.3.1-gta04+ #28)
+	[   37.251647] PC is at kfree+0x84/0x144
+	[   37.255493] LR is at kfree+0x20/0x144
+	[   37.259338] pc : [<c00b408c>]    lr : [<c00b4028>]    psr: 40000093
+	[   37.259368] sp : de249cd8  ip : 0000000c  fp : 00000090
+	[   37.271362] r10: 0000000a  r9 : de229eac  r8 : c0236274
+	[   37.276855] r7 : c09d6490  r6 : a0000013  r5 : de229c00  r4 : de229c10
+	[   37.283691] r3 : c0f00218  r2 : 00000400  r1 : c0eea000  r0 : c00b4028
+	[   37.290527] Flags: nZcv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
+	[   37.298095] Control: 10c5387d  Table: 9e1d0019  DAC: 00000015
+	[   37.304107] Process sh (pid: 91, stack limit = 0xde2482f0)
+	[   37.309844] Stack: (0xde249cd8 to 0xde24a000)
+	[   37.314422] 9cc0:                                                       de229c10 de229c00
+	[   37.322998] 9ce0: de229c10 ffffffea 00000005 c0236274 de140a80 c00b4798 dec00080 de140a80
+	[   37.331573] 9d00: c032f37c dec00080 000080d0 00000001 de229c00 de229c10 c048d578 00000005
+	[   37.340148] 9d20: de229eac 0000000a 00000090 c032fa40 00000001 00000000 00000001 de229c10
+	[   37.348724] 9d40: de229eac 00000029 c075b558 00000001 00000003 00000004 de229c10 c048d594
+	[   37.357299] 9d60: 00000000 60000013 00000018 205b0007 37332020 3432322e 5d343838 c0060020
+	[   37.365905] 9d80: de251600 00000001 00000000 de251600 00000001 c0065a84 de229c00 de229c48
+	[   37.374481] 9da0: 00000006 0048d62c de229c38 de229c00 de229c00 de1f6c00 de1f6c20 00000001
+	[   37.383056] 9dc0: 00000000 c048d62c 00000000 de229c00 de229c00 de1f6c00 de1f6c20 00000001
+	[   37.391632] 9de0: 00000000 c048d62c 00000000 c0330164 00000000 de1f6c20 c048d62c de1f6c00
+	[   37.400207] 9e00: c0330078 de1f6c04 c078d714 de189b58 00000000 c02ccfd8 de1f6c20 c0795f40
+	[   37.408782] 9e20: c0238330 00000000 00000000 c02381a8 de1b9fc0 de1f6c20 de1f6c20 de249e48
+	[   37.417358] 9e40: c0238330 c0236bb0 decdbed8 de7d0f14 de1f6c20 de1f6c20 de1f6c54 de1f6c20
+	[   37.425933] 9e60: 00000000 c0238030 de1f6c20 c078d7bc de1f6c20 c02377ec de1f6c20 de1f6c28
+	[   37.434509] 9e80: dee64cb0 c0236138 c047c554 de189b58 00000000 c004b45c de1f6c20 de1f6cd8
+	[   37.443084] 9ea0: c0edfa6c de1f6c00 dee64c68 de1f6c04 de1f6c20 dee64cb8 c047c554 de189b58
+	[   37.451690] 9ec0: 00000000 c02cd634 dee64c68 de249ef4 de23b008 dee64cb0 0000000d de23b000
+	[   37.460266] 9ee0: de23b007 c02cd78c 00000002 00000000 00000000 35636d68 00333438 00000000
+	[   37.468841] 9f00: 00000000 00000000 001e0000 00000000 00000000 00000000 00000000 0a10cec0
+	[   37.477416] 9f20: 00000002 de249f80 0000000d dee62990 de189b40 c0234d88 0000000d c010c354
+	[   37.485992] 9f40: 0000000d de210f28 000acc88 de249f80 0000000d de248000 00000000 c00b7bf8
+	[   37.494567] 9f60: de210f28 000acc88 de210f28 000acc88 00000000 00000000 0000000d c00b7ed8
+	[   37.503143] 9f80: 00000000 00000000 0000000d 00000000 0007fa28 0000000d 000acc88 00000004
+	[   37.511718] 9fa0: c000e544 c000e380 0007fa28 0000000d 00000001 000acc88 0000000d 00000000
+	[   37.520294] 9fc0: 0007fa28 0000000d 000acc88 00000004 00000001 00000020 00000002 00000000
+	[   37.528869] 9fe0: 00000000 beab8624 0000ea05 b6eaebac 600d0010 00000001 00000000 00000000
+	[   37.537475] [<c00b408c>] (kfree+0x84/0x144) from [<c0236274>] (device_add+0x530/0x57c)
+	[   37.545806] [<c0236274>] (device_add+0x530/0x57c) from [<c032fa40>] (iio_device_register+0x8c8/0x990)
+	[   37.555480] [<c032fa40>] (iio_device_register+0x8c8/0x990) from [<c0330164>] (hmc5843_probe+0xec/0x114)
+	[   37.565338] [<c0330164>] (hmc5843_probe+0xec/0x114) from [<c02ccfd8>] (i2c_device_probe+0xc4/0xf8)
+	[   37.574737] [<c02ccfd8>] (i2c_device_probe+0xc4/0xf8) from [<c02381a8>] (driver_probe_device+0x118/0x218)
+	[   37.584777] [<c02381a8>] (driver_probe_device+0x118/0x218) from [<c0236bb0>] (bus_for_each_drv+0x4c/0x84)
+	[   37.594818] [<c0236bb0>] (bus_for_each_drv+0x4c/0x84) from [<c0238030>] (device_attach+0x78/0xa4)
+	[   37.604125] [<c0238030>] (device_attach+0x78/0xa4) from [<c02377ec>] (bus_probe_device+0x28/0x9c)
+	[   37.613433] [<c02377ec>] (bus_probe_device+0x28/0x9c) from [<c0236138>] (device_add+0x3f4/0x57c)
+	[   37.622650] [<c0236138>] (device_add+0x3f4/0x57c) from [<c02cd634>] (i2c_new_device+0xf8/0x19c)
+	[   37.631805] [<c02cd634>] (i2c_new_device+0xf8/0x19c) from [<c02cd78c>] (i2c_sysfs_new_device+0xb4/0x130)
+	[   37.641754] [<c02cd78c>] (i2c_sysfs_new_device+0xb4/0x130) from [<c0234d88>] (dev_attr_store+0x18/0x24)
+	[   37.651611] [<c0234d88>] (dev_attr_store+0x18/0x24) from [<c010c354>] (sysfs_write_file+0x10c/0x140)
+	[   37.661193] [<c010c354>] (sysfs_write_file+0x10c/0x140) from [<c00b7bf8>] (vfs_write+0xb0/0x178)
+	[   37.670410] [<c00b7bf8>] (vfs_write+0xb0/0x178) from [<c00b7ed8>] (sys_write+0x3c/0x68)
+	[   37.678833] [<c00b7ed8>] (sys_write+0x3c/0x68) from [<c000e380>] (ret_fast_syscall+0x0/0x3c)
+	[   37.687683] Code: 1593301c e5932000 e3120080 1a000000 (e7f001f2)
+	[   37.700775] ---[ end trace aaf805debdb69390 ]---
+
+Client data was assigned to iio_dev structure in probe but in
+hmc5843_init_client function casted to private driver data structure which
+is wrong. Possibly calling mutex_init(&data->lock); corrupt data
+which the lead to above crash.
+
+Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
+Acked-by: Jonathan Cameron <jic23@kernel.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/iio/magnetometer/hmc5843.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/staging/iio/magnetometer/hmc5843.c b/drivers/staging/iio/magnetometer/hmc5843.c
+index fc9ee97..870db4f 100644
+--- a/drivers/staging/iio/magnetometer/hmc5843.c
++++ b/drivers/staging/iio/magnetometer/hmc5843.c
+@@ -521,7 +521,9 @@ static int hmc5843_detect(struct i2c_client *client,
+ /* Called when we have found a new HMC5843. */
+ static void hmc5843_init_client(struct i2c_client *client)
+ {
+-	struct hmc5843_data *data = i2c_get_clientdata(client);
++	struct iio_dev *indio_dev = i2c_get_clientdata(client);
++	struct hmc5843_data *data = iio_priv(indio_dev);
++
+ 	hmc5843_set_meas_conf(client, data->meas_conf);
+ 	hmc5843_set_rate(client, data->rate);
+ 	hmc5843_configure(client, data->operating_mode);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch
new file mode 100644
index 0000000..e24a472
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch
@@ -0,0 +1,42 @@
+From da80dc7cc4c7ed0823fe75f54cefabc42ac56996 Mon Sep 17 00:00:00 2001
+From: Yuriy Kozlov <ykozlov@ptcusa.com>
+Date: Thu, 29 Mar 2012 09:55:27 +0200
+Subject: [PATCH 18/69] tty: serial: altera_uart: Check for NULL platform_data
+ in probe.
+
+commit acede70d6561f2d042d9dbb153d9a3469479c0ed upstream.
+
+Follow altera_jtag_uart.  This fixes a crash if there is a mistake in the DTS.
+
+Signed-off-by: Yuriy Kozlov <ykozlov@ptcusa.com>
+Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/serial/altera_uart.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/tty/serial/altera_uart.c b/drivers/tty/serial/altera_uart.c
+index 1d04c50..5ba0898 100644
+--- a/drivers/tty/serial/altera_uart.c
++++ b/drivers/tty/serial/altera_uart.c
+@@ -555,7 +555,7 @@ static int __devinit altera_uart_probe(struct platform_device *pdev)
+ 	res_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+ 	if (res_mem)
+ 		port->mapbase = res_mem->start;
+-	else if (platp->mapbase)
++	else if (platp)
+ 		port->mapbase = platp->mapbase;
+ 	else
+ 		return -EINVAL;
+@@ -563,7 +563,7 @@ static int __devinit altera_uart_probe(struct platform_device *pdev)
+ 	res_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
+ 	if (res_irq)
+ 		port->irq = res_irq->start;
+-	else if (platp->irq)
++	else if (platp)
+ 		port->irq = platp->irq;
+ 
+ 	/* Check platform data first so we can override device node data */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch
new file mode 100644
index 0000000..d81ec8e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch
@@ -0,0 +1,63 @@
+From d219e7abf51d7e4784a127d79d5806b9c49c672b Mon Sep 17 00:00:00 2001
+From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
+Date: Fri, 13 Apr 2012 03:35:13 +0000
+Subject: [PATCH 19/69] sparc64: Eliminate obsolete __handle_softirq()
+ function
+
+commit 3d3eeb2ef26112a200785e5fca58ec58dd33bf1e upstream.
+
+The invocation of softirq is now handled by irq_exit(), so there is no
+need for sparc64 to invoke it on the trap-return path.  In fact, doing so
+is a bug because if the trap occurred in the idle loop, this invocation
+can result in lockdep-RCU failures.  The problem is that RCU ignores idle
+CPUs, and the sparc64 trap-return path to the softirq handlers fails to
+tell RCU that the CPU must be considered non-idle while those handlers
+are executing.  This means that RCU is ignoring any RCU read-side critical
+sections in those handlers, which in turn means that RCU-protected data
+can be yanked out from under those read-side critical sections.
+
+The shiny new lockdep-RCU ability to detect RCU read-side critical sections
+that RCU is ignoring located this problem.
+
+The fix is straightforward: Make sparc64 stop manually invoking the
+softirq handlers.
+
+Reported-by: Meelis Roos <mroos@linux.ee>
+Suggested-by: David Miller <davem@davemloft.net>
+Signed-off-by: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
+Tested-by: Meelis Roos <mroos@linux.ee>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/sparc/kernel/rtrap_64.S |    7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/arch/sparc/kernel/rtrap_64.S b/arch/sparc/kernel/rtrap_64.S
+index 77f1b95..9171fc2 100644
+--- a/arch/sparc/kernel/rtrap_64.S
++++ b/arch/sparc/kernel/rtrap_64.S
+@@ -20,11 +20,6 @@
+ 
+ 		.text
+ 		.align			32
+-__handle_softirq:
+-		call			do_softirq
+-		 nop
+-		ba,a,pt			%xcc, __handle_softirq_continue
+-		 nop
+ __handle_preemption:
+ 		call			schedule
+ 		 wrpr			%g0, RTRAP_PSTATE, %pstate
+@@ -89,9 +84,7 @@ rtrap:
+ 		cmp			%l1, 0
+ 
+ 		/* mm/ultra.S:xcall_report_regs KNOWS about this load. */
+-		bne,pn			%icc, __handle_softirq
+ 		 ldx			[%sp + PTREGS_OFF + PT_V9_TSTATE], %l1
+-__handle_softirq_continue:
+ rtrap_xcall:
+ 		sethi			%hi(0xf << 20), %l4
+ 		and			%l1, %l4, %l4
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch
new file mode 100644
index 0000000..9aa5993
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch
@@ -0,0 +1,33 @@
+From 19e418644c8801bf98b7c058825bd632f2a92f1f Mon Sep 17 00:00:00 2001
+From: "David S. Miller" <davem@davemloft.net>
+Date: Fri, 13 Apr 2012 11:56:22 -0700
+Subject: [PATCH 20/69] sparc64: Fix bootup crash on sun4v.
+
+commit 9e0daff30fd7ecf698e5d20b0fa7f851e427cca5 upstream.
+
+The DS driver registers as a subsys_initcall() but this can be too
+early, in particular this risks registering before we've had a chance
+to allocate and setup module_kset in kernel/params.c which is
+performed also as a subsyts_initcall().
+
+Register DS using device_initcall() insteal.
+
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/sparc/kernel/ds.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sparc/kernel/ds.c b/arch/sparc/kernel/ds.c
+index 381edcd..27728e1 100644
+--- a/arch/sparc/kernel/ds.c
++++ b/arch/sparc/kernel/ds.c
+@@ -1267,4 +1267,4 @@ static int __init ds_init(void)
+ 	return vio_register_driver(&ds_driver);
+ }
+ 
+-subsys_initcall(ds_init);
++fs_initcall(ds_init);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch
new file mode 100644
index 0000000..3291bc5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch
@@ -0,0 +1,35 @@
+From c8b1bb9d2383126d121f36795771ca734bc73003 Mon Sep 17 00:00:00 2001
+From: "Stephen M. Cameron" <scameron@beardog.cce.hp.com>
+Date: Thu, 22 Mar 2012 21:40:08 +0100
+Subject: [PATCH 21/69] cciss: Initialize scsi host max_sectors for tape drive
+ support
+
+commit 395d287526bb60411ff37b19ad9dd38b58ba8732 upstream.
+
+The default is too small (1024 blocks), use h->cciss_max_sectors (8192 blocks)
+Without this change, if you try to set the block size of a tape drive above
+512*1024, via "mt -f /dev/st0 setblk nnn" where nnn is greater than 524288,
+it won't work right.
+
+Signed-off-by: Stephen M. Cameron <scameron@beardog.cce.hp.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/block/cciss_scsi.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
+index e820b68..f510a9c 100644
+--- a/drivers/block/cciss_scsi.c
++++ b/drivers/block/cciss_scsi.c
+@@ -866,6 +866,7 @@ cciss_scsi_detect(ctlr_info_t *h)
+ 	sh->can_queue = cciss_tape_cmds;
+ 	sh->sg_tablesize = h->maxsgentries;
+ 	sh->max_cmd_len = MAX_COMMAND_SIZE;
++	sh->max_sectors = h->cciss_max_sectors;
+ 
+ 	((struct cciss_scsi_adapter_data_t *) 
+ 		h->scsi_ctlr)->scsi_host = sh;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch
new file mode 100644
index 0000000..df9a8fe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch
@@ -0,0 +1,38 @@
+From 80461d138d8963f19b97fda7126455f12ba70bc8 Mon Sep 17 00:00:00 2001
+From: "Stephen M. Cameron" <scameron@beardog.cce.hp.com>
+Date: Thu, 22 Mar 2012 21:40:09 +0100
+Subject: [PATCH 22/69] cciss: Fix scsi tape io with more than 255 scatter
+ gather elements
+
+commit bc67f63650fad6b3478d9ddfd5406d45a95987c9 upstream.
+
+The total number of scatter gather elements in the CISS command
+used by the scsi tape code was being cast to a u8, which can hold
+at most 255 scatter gather elements.  It should have been cast to
+a u16.  Without this patch the command gets rejected by the controller
+since the total scatter gather count did not add up to the right
+value resulting in an i/o error.
+
+Signed-off-by: Stephen M. Cameron <scameron@beardog.cce.hp.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/block/cciss_scsi.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/block/cciss_scsi.c b/drivers/block/cciss_scsi.c
+index f510a9c..acda773 100644
+--- a/drivers/block/cciss_scsi.c
++++ b/drivers/block/cciss_scsi.c
+@@ -1411,7 +1411,7 @@ static void cciss_scatter_gather(ctlr_info_t *h, CommandList_struct *c,
+ 	/* track how many SG entries we are using */
+ 	if (request_nsgs > h->maxSG)
+ 		h->maxSG = request_nsgs;
+-	c->Header.SGTotal = (__u8) request_nsgs + chained;
++	c->Header.SGTotal = (u16) request_nsgs + chained;
+ 	if (request_nsgs > h->max_cmd_sgentries)
+ 		c->Header.SGList = h->max_cmd_sgentries;
+ 	else
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch
new file mode 100644
index 0000000..42495dd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0023-perf-hists-Catch-and-handle-out-of-date-hist-entry-m.patch
@@ -0,0 +1,59 @@
+From 49bb9ef1ae7951ed1a193e4473cb617d7a89fbdb Mon Sep 17 00:00:00 2001
+From: David Miller <davem@davemloft.net>
+Date: Tue, 27 Mar 2012 03:14:18 -0400
+Subject: [PATCH 23/69] perf hists: Catch and handle out-of-date hist entry
+ maps.
+
+commit 63fa471dd49e9c9ce029d910d1024330d9b1b145 upstream.
+
+When a process exec()'s, all the maps are retired, but we keep the hist
+entries around which hold references to those outdated maps.
+
+If the same library gets mapped in for which we have hist entries, a new
+map will be created.  But when we take a perf entry hit within that map,
+we'll find the existing hist entry with the older map.
+
+This causes symbol translations to be done incorrectly.  For example,
+the perf entry processing will lookup the correct uptodate map entry and
+use that to calculate the symbol and DSO relative address.  But later
+when we update the histogram we'll translate the address using the
+outdated map file instead leading to conditions such as out-of-range
+offsets in symbol__inc_addr_samples().
+
+Therefore, update the map of the hist_entry dynamically at lookup/
+creation time.
+
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Link: http://lkml.kernel.org/r/20120327.031418.1220315351537060808.davem@davemloft.net
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/util/hist.c |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
+index 216e33a..adb372d 100644
+--- a/tools/perf/util/hist.c
++++ b/tools/perf/util/hist.c
+@@ -230,6 +230,18 @@ struct hist_entry *__hists__add_entry(struct hists *hists,
+ 		if (!cmp) {
+ 			he->period += period;
+ 			++he->nr_events;
++
++			/* If the map of an existing hist_entry has
++			 * become out-of-date due to an exec() or
++			 * similar, update it.  Otherwise we will
++			 * mis-adjust symbol addresses when computing
++			 * the history counter to increment.
++			 */
++			if (he->ms.map != entry->ms.map) {
++				he->ms.map = entry->ms.map;
++				if (he->ms.map)
++					he->ms.map->referenced = true;
++			}
+ 			goto out;
+ 		}
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
new file mode 100644
index 0000000..bfe3ac5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch
@@ -0,0 +1,118 @@
+From c89ee4a69b7ed875adac55c2929903acc5001d3b Mon Sep 17 00:00:00 2001
+From: Wang YanQing <udknight@gmail.com>
+Date: Sun, 1 Apr 2012 08:54:02 +0800
+Subject: [PATCH 24/69] video:uvesafb: Fix oops that uvesafb try to execute
+ NX-protected page
+
+commit b78f29ca0516266431688c5eb42d39ce42ec039a upstream.
+
+This patch fix the oops below that catched in my machine
+
+[   81.560602] uvesafb: NVIDIA Corporation, GT216 Board - 0696a290, Chip Rev   , OEM: NVIDIA, VBE v3.0
+[   81.609384] uvesafb: protected mode interface info at c000:d350
+[   81.609388] uvesafb: pmi: set display start = c00cd3b3, set palette = c00cd40e
+[   81.609390] uvesafb: pmi: ports = 3b4 3b5 3ba 3c0 3c1 3c4 3c5 3c6 3c7 3c8 3c9 3cc 3ce 3cf 3d0 3d1 3d2 3d3 3d4 3d5 3da
+[   81.614558] uvesafb: VBIOS/hardware doesn't support DDC transfers
+[   81.614562] uvesafb: no monitor limits have been set, default refresh rate will be used
+[   81.614994] uvesafb: scrolling: ypan using protected mode interface, yres_virtual=4915
+[   81.744147] kernel tried to execute NX-protected page - exploit attempt? (uid: 0)
+[   81.744153] BUG: unable to handle kernel paging request at c00cd3b3
+[   81.744159] IP: [<c00cd3b3>] 0xc00cd3b2
+[   81.744167] *pdpt = 00000000016d6001 *pde = 0000000001c7b067 *pte = 80000000000cd163
+[   81.744171] Oops: 0011 [#1] SMP
+[   81.744174] Modules linked in: uvesafb(+) cfbcopyarea cfbimgblt cfbfillrect
+[   81.744178]
+[   81.744181] Pid: 3497, comm: modprobe Not tainted 3.3.0-rc4NX+ #71 Acer            Aspire 4741                    /Aspire 4741
+[   81.744185] EIP: 0060:[<c00cd3b3>] EFLAGS: 00010246 CPU: 0
+[   81.744187] EIP is at 0xc00cd3b3
+[   81.744189] EAX: 00004f07 EBX: 00000000 ECX: 00000000 EDX: 00000000
+[   81.744191] ESI: f763f000 EDI: f763f6e8 EBP: f57f3a0c ESP: f57f3a00
+[   81.744192]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
+[   81.744195] Process modprobe (pid: 3497, ti=f57f2000 task=f748c600 task.ti=f57f2000)
+[   81.744196] Stack:
+[   81.744197]  f82512c5 f759341c 00000000 f57f3a30 c124a9bc 00000001 00000001 000001e0
+[   81.744202]  f8251280 f763f000 f7593400 00000000 f57f3a40 c12598dd f5c0c000 00000000
+[   81.744206]  f57f3b10 c1255efe c125a21a 00000006 f763f09c 00000000 c1c6cb60 f7593400
+[   81.744210] Call Trace:
+[   81.744215]  [<f82512c5>] ? uvesafb_pan_display+0x45/0x60 [uvesafb]
+[   81.744222]  [<c124a9bc>] fb_pan_display+0x10c/0x160
+[   81.744226]  [<f8251280>] ? uvesafb_vbe_find_mode+0x180/0x180 [uvesafb]
+[   81.744230]  [<c12598dd>] bit_update_start+0x1d/0x50
+[   81.744232]  [<c1255efe>] fbcon_switch+0x39e/0x550
+[   81.744235]  [<c125a21a>] ? bit_cursor+0x4ea/0x560
+[   81.744240]  [<c129b6cb>] redraw_screen+0x12b/0x220
+[   81.744245]  [<c128843b>] ? tty_do_resize+0x3b/0xc0
+[   81.744247]  [<c129ef42>] vc_do_resize+0x3d2/0x3e0
+[   81.744250]  [<c129efb4>] vc_resize+0x14/0x20
+[   81.744253]  [<c12586bd>] fbcon_init+0x29d/0x500
+[   81.744255]  [<c12984c4>] ? set_inverse_trans_unicode+0xe4/0x110
+[   81.744258]  [<c129b378>] visual_init+0xb8/0x150
+[   81.744261]  [<c129c16c>] bind_con_driver+0x16c/0x360
+[   81.744264]  [<c129b47e>] ? register_con_driver+0x6e/0x190
+[   81.744267]  [<c129c3a1>] take_over_console+0x41/0x50
+[   81.744269]  [<c1257b7a>] fbcon_takeover+0x6a/0xd0
+[   81.744272]  [<c12594b8>] fbcon_event_notify+0x758/0x790
+[   81.744277]  [<c10929e2>] notifier_call_chain+0x42/0xb0
+[   81.744280]  [<c1092d30>] __blocking_notifier_call_chain+0x60/0x90
+[   81.744283]  [<c1092d7a>] blocking_notifier_call_chain+0x1a/0x20
+[   81.744285]  [<c124a5a1>] fb_notifier_call_chain+0x11/0x20
+[   81.744288]  [<c124b759>] register_framebuffer+0x1d9/0x2b0
+[   81.744293]  [<c1061c73>] ? ioremap_wc+0x33/0x40
+[   81.744298]  [<f82537c6>] uvesafb_probe+0xaba/0xc40 [uvesafb]
+[   81.744302]  [<c12bb81f>] platform_drv_probe+0xf/0x20
+[   81.744306]  [<c12ba558>] driver_probe_device+0x68/0x170
+[   81.744309]  [<c12ba731>] __device_attach+0x41/0x50
+[   81.744313]  [<c12b9088>] bus_for_each_drv+0x48/0x70
+[   81.744316]  [<c12ba7f3>] device_attach+0x83/0xa0
+[   81.744319]  [<c12ba6f0>] ? __driver_attach+0x90/0x90
+[   81.744321]  [<c12b991f>] bus_probe_device+0x6f/0x90
+[   81.744324]  [<c12b8a45>] device_add+0x5e5/0x680
+[   81.744329]  [<c122a1a3>] ? kvasprintf+0x43/0x60
+[   81.744332]  [<c121e6e4>] ? kobject_set_name_vargs+0x64/0x70
+[   81.744335]  [<c121e6e4>] ? kobject_set_name_vargs+0x64/0x70
+[   81.744339]  [<c12bbe9f>] platform_device_add+0xff/0x1b0
+[   81.744343]  [<f8252906>] uvesafb_init+0x50/0x9b [uvesafb]
+[   81.744346]  [<c100111f>] do_one_initcall+0x2f/0x170
+[   81.744350]  [<f82528b6>] ? uvesafb_is_valid_mode+0x66/0x66 [uvesafb]
+[   81.744355]  [<c10c6994>] sys_init_module+0xf4/0x1410
+[   81.744359]  [<c1157fc0>] ? vfsmount_lock_local_unlock_cpu+0x30/0x30
+[   81.744363]  [<c144cb10>] sysenter_do_call+0x12/0x36
+[   81.744365] Code: f5 00 00 00 32 f6 66 8b da 66 d1 e3 66 ba d4 03 8a e3 b0 1c 66 ef b0 1e 66 ef 8a e7 b0 1d 66 ef b0 1f 66 ef e8 fa 00 00 00 61 c3 <60> e8 c8 00 00 00 66 8b f3 66 8b da 66 ba d4 03 b0 0c 8a e5 66
+[   81.744388] EIP: [<c00cd3b3>] 0xc00cd3b3 SS:ESP 0068:f57f3a00
+[   81.744391] CR2: 00000000c00cd3b3
+[   81.744393] ---[ end trace 18b2c87c925b54d6 ]---
+
+Signed-off-by: Wang YanQing <udknight@gmail.com>
+Cc: Michal Januszewski <spock@gentoo.org>
+Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>
+Signed-off-by: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/video/uvesafb.c |   11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/video/uvesafb.c b/drivers/video/uvesafb.c
+index 7f8472c..8813588 100644
+--- a/drivers/video/uvesafb.c
++++ b/drivers/video/uvesafb.c
+@@ -815,8 +815,15 @@ static int __devinit uvesafb_vbe_init(struct fb_info *info)
+ 	par->pmi_setpal = pmi_setpal;
+ 	par->ypan = ypan;
+ 
+-	if (par->pmi_setpal || par->ypan)
+-		uvesafb_vbe_getpmi(task, par);
++	if (par->pmi_setpal || par->ypan) {
++		if (__supported_pte_mask & _PAGE_NX) {
++			par->pmi_setpal = par->ypan = 0;
++			printk(KERN_WARNING "uvesafb: NX protection is actively."
++				"We have better not to use the PMI.\n");
++		} else {
++			uvesafb_vbe_getpmi(task, par);
++		}
++	}
+ #else
+ 	/* The protected mode interface is not available on non-x86. */
+ 	par->pmi_setpal = par->ypan = 0;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
new file mode 100644
index 0000000..1d5dcca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch
@@ -0,0 +1,53 @@
+From dd19a09c7530975d86328c8eaf082626dd1d4fe1 Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Tue, 27 Mar 2012 15:09:37 -0400
+Subject: [PATCH 25/69] nohz: Fix stale jiffies update in tick_nohz_restart()
+
+commit 6f103929f8979d2638e58d7f7fda0beefcb8ee7e upstream.
+
+Fix tick_nohz_restart() to not use a stale ktime_t "now" value when
+calling tick_do_update_jiffies64(now).
+
+If we reach this point in the loop it means that we crossed a tick
+boundary since we grabbed the "now" timestamp, so at this point "now"
+refers to a time in the old jiffy, so using the old value for "now" is
+incorrect, and is likely to give us a stale jiffies value.
+
+In particular, the first time through the loop the
+tick_do_update_jiffies64(now) call is always a no-op, since the
+caller, tick_nohz_restart_sched_tick(), will have already called
+tick_do_update_jiffies64(now) with that "now" value.
+
+Note that tick_nohz_stop_sched_tick() already uses the correct
+approach: when we notice we cross a jiffy boundary, grab a new
+timestamp with ktime_get(), and *then* update jiffies.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Cc: Ben Segall <bsegall@google.com>
+Cc: Ingo Molnar <mingo@elte.hu>
+Link: http://lkml.kernel.org/r/1332875377-23014-1-git-send-email-ncardwell@google.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/time/tick-sched.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
+index 4042064..c923640 100644
+--- a/kernel/time/tick-sched.c
++++ b/kernel/time/tick-sched.c
+@@ -508,9 +508,9 @@ static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
+ 				hrtimer_get_expires(&ts->sched_timer), 0))
+ 				break;
+ 		}
+-		/* Update jiffies and reread time */
+-		tick_do_update_jiffies64(now);
++		/* Reread time and update jiffies */
+ 		now = ktime_get();
++		tick_do_update_jiffies64(now);
+ 	}
+ }
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch
new file mode 100644
index 0000000..3792b6f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch
@@ -0,0 +1,43 @@
+From 701cb5c2dbbe57b09a0585ea3a983540a29106c6 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Mon, 2 Apr 2012 14:36:22 +0900
+Subject: [PATCH 26/69] pch_uart: Fix MSI setting issue
+
+commit 867c902e07d5677e2a5b54c0435e589513abde48 upstream.
+
+The following patch (MSI setting) is not enough.
+
+commit e463595fd9c752fa4bf06b47df93ef9ade3c7cf0
+Author: Alexander Stein <alexander.stein@systec-electronic.com>
+Date:   Mon Jul 4 08:58:31 2011 +0200
+
+    pch_uart: Add MSI support
+
+    Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>
+    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
+
+To enable MSI mode, PCI bus-mastering must be enabled.
+This patch enables the setting.
+
+cc: Alexander Stein <alexander.stein@systec-electronic.com>
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/serial/pch_uart.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
+index d6aba8c..da776a0 100644
+--- a/drivers/tty/serial/pch_uart.c
++++ b/drivers/tty/serial/pch_uart.c
+@@ -1438,6 +1438,7 @@ static struct eg20t_port *pch_uart_init_port(struct pci_dev *pdev,
+ 	}
+ 
+ 	pci_enable_msi(pdev);
++	pci_set_master(pdev);
+ 
+ 	iobase = pci_resource_start(pdev, 0);
+ 	mapbase = pci_resource_start(pdev, 1);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch
new file mode 100644
index 0000000..53ef398
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch
@@ -0,0 +1,97 @@
+From fe3ac85bc01bebcbfd24255f567c18d0d609661b Mon Sep 17 00:00:00 2001
+From: Johan Hovold <jhovold@gmail.com>
+Date: Tue, 20 Mar 2012 16:59:33 +0100
+Subject: [PATCH 27/69] USB: serial: fix race between probe and open
+
+commit a65a6f14dc24a90bde3f5d0073ba2364476200bf upstream.
+
+Fix race between probe and open by making sure that the disconnected
+flag is not cleared until all ports have been registered.
+
+A call to tty_open while probe is running may get a reference to the
+serial structure in serial_install before its ports have been
+registered. This may lead to usb_serial_core calling driver open before
+port is fully initialised.
+
+With ftdi_sio this result in the following NULL-pointer dereference as
+the private data has not been initialised at open:
+
+[  199.698286] IP: [<f811a089>] ftdi_open+0x59/0xe0 [ftdi_sio]
+[  199.698297] *pde = 00000000
+[  199.698303] Oops: 0000 [#1] PREEMPT SMP
+[  199.698313] Modules linked in: ftdi_sio usbserial
+[  199.698323]
+[  199.698327] Pid: 1146, comm: ftdi_open Not tainted 3.2.11 #70 Dell Inc. Vostro 1520/0T816J
+[  199.698339] EIP: 0060:[<f811a089>] EFLAGS: 00010286 CPU: 0
+[  199.698344] EIP is at ftdi_open+0x59/0xe0 [ftdi_sio]
+[  199.698348] EAX: 0000003e EBX: f5067000 ECX: 00000000 EDX: 80000600
+[  199.698352] ESI: f48d8800 EDI: 00000001 EBP: f515dd54 ESP: f515dcfc
+[  199.698356]  DS: 007b ES: 007b FS: 00d8 GS: 0033 SS: 0068
+[  199.698361] Process ftdi_open (pid: 1146, ti=f515c000 task=f481e040 task.ti=f515c000)
+[  199.698364] Stack:
+[  199.698368]  f811a9fe f811a9e0 f811b3ef 00000000 00000000 00001388 00000000 f4a86800
+[  199.698387]  00000002 00000000 f806e68e 00000000 f532765c f481e040 00000246 22222222
+[  199.698479]  22222222 22222222 22222222 f5067004 f5327600 f5327638 f515dd74 f806e6ab
+[  199.698496] Call Trace:
+[  199.698504]  [<f806e68e>] ? serial_activate+0x2e/0x70 [usbserial]
+[  199.698511]  [<f806e6ab>] serial_activate+0x4b/0x70 [usbserial]
+[  199.698521]  [<c126380c>] tty_port_open+0x7c/0xd0
+[  199.698527]  [<f806e660>] ? serial_set_termios+0xa0/0xa0 [usbserial]
+[  199.698534]  [<f806e76f>] serial_open+0x2f/0x70 [usbserial]
+[  199.698540]  [<c125d07c>] tty_open+0x20c/0x510
+[  199.698546]  [<c10e9eb7>] chrdev_open+0xe7/0x230
+[  199.698553]  [<c10e48f2>] __dentry_open+0x1f2/0x390
+[  199.698559]  [<c144bfec>] ? _raw_spin_unlock+0x2c/0x50
+[  199.698565]  [<c10e4b76>] nameidata_to_filp+0x66/0x80
+[  199.698570]  [<c10e9dd0>] ? cdev_put+0x20/0x20
+[  199.698576]  [<c10f3e08>] do_last+0x198/0x730
+[  199.698581]  [<c10f4440>] path_openat+0xa0/0x350
+[  199.698587]  [<c10f47d5>] do_filp_open+0x35/0x80
+[  199.698593]  [<c144bfec>] ? _raw_spin_unlock+0x2c/0x50
+[  199.698599]  [<c10ff110>] ? alloc_fd+0xc0/0x100
+[  199.698605]  [<c10f0b72>] ? getname_flags+0x72/0x120
+[  199.698611]  [<c10e4450>] do_sys_open+0xf0/0x1c0
+[  199.698617]  [<c11fcc08>] ? trace_hardirqs_on_thunk+0xc/0x10
+[  199.698623]  [<c10e458e>] sys_open+0x2e/0x40
+[  199.698628]  [<c144c990>] sysenter_do_call+0x12/0x36
+[  199.698632] Code: 85 89 00 00 00 8b 16 8b 4d c0 c1 e2 08 c7 44 24 14 88 13 00 00 81 ca 00 00 00 80 c7 44 24 10 00 00 00 00 c7 44 24 0c 00 00 00 00 <0f> b7 41 78 31 c9 89 44 24 08 c7 44 24 04 00 00 00 00 c7 04 24
+[  199.698884] EIP: [<f811a089>] ftdi_open+0x59/0xe0 [ftdi_sio] SS:ESP 0068:f515dcfc
+[  199.698893] CR2: 0000000000000078
+[  199.698925] ---[ end trace 77c43ec023940cff ]---
+
+Reported-and-tested-by: Ken Huang <csuhgw@gmail.com>
+Signed-off-by: Johan Hovold <jhovold@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/usb-serial.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
+index cc274fd..38d7ebd 100644
+--- a/drivers/usb/serial/usb-serial.c
++++ b/drivers/usb/serial/usb-serial.c
+@@ -1059,6 +1059,12 @@ int usb_serial_probe(struct usb_interface *interface,
+ 		serial->attached = 1;
+ 	}
+ 
++	/* Avoid race with tty_open and serial_install by setting the
++	 * disconnected flag and not clearing it until all ports have been
++	 * registered.
++	 */
++	serial->disconnected = 1;
++
+ 	if (get_free_serial(serial, num_ports, &minor) == NULL) {
+ 		dev_err(&interface->dev, "No more free serial devices\n");
+ 		goto probe_error;
+@@ -1083,6 +1089,8 @@ int usb_serial_probe(struct usb_interface *interface,
+ 		}
+ 	}
+ 
++	serial->disconnected = 0;
++
+ 	usb_serial_console_init(debug, minor);
+ 
+ exit:
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
new file mode 100644
index 0000000..48e31f1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch
@@ -0,0 +1,37 @@
+From fa3bc47f28470076336a7f3cfedcf67837224a71 Mon Sep 17 00:00:00 2001
+From: Johan Hovold <jhovold@gmail.com>
+Date: Fri, 23 Mar 2012 15:23:18 +0100
+Subject: [PATCH 28/69] USB: pl2303: fix DTR/RTS being raised on baud rate
+ change
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit ce5c9851855bab190c9a142761d54ba583ab094c upstream.
+
+DTR/RTS should only be raised when changing baudrate from B0 and not on
+any baud rate change (> B0).
+
+Reported-by: Søren Holm <sgh@sgh.dk>
+Signed-off-by: Johan Hovold <jhovold@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/pl2303.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/usb/serial/pl2303.c b/drivers/usb/serial/pl2303.c
+index fc2d66f..5532ea5 100644
+--- a/drivers/usb/serial/pl2303.c
++++ b/drivers/usb/serial/pl2303.c
+@@ -421,7 +421,7 @@ static void pl2303_set_termios(struct tty_struct *tty,
+ 	control = priv->line_control;
+ 	if ((cflag & CBAUD) == B0)
+ 		priv->line_control &= ~(CONTROL_DTR | CONTROL_RTS);
+-	else
++	else if ((old_termios->c_cflag & CBAUD) == B0)
+ 		priv->line_control |= (CONTROL_DTR | CONTROL_RTS);
+ 	if (control != priv->line_control) {
+ 		control = priv->line_control;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
new file mode 100644
index 0000000..17b3947
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch
@@ -0,0 +1,32 @@
+From 1b71d0901a340fb7f1acfa39053b5baa7d22b8e5 Mon Sep 17 00:00:00 2001
+From: Santiago Garcia Mantinan <manty@debian.org>
+Date: Mon, 19 Mar 2012 18:17:00 +0100
+Subject: [PATCH 29/69] USB: option: re-add
+ NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED to option_id
+ array
+
+commit 9ac2feb22b5b821d81463bef92698ef7682a3145 upstream.
+
+Re-add NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED to option_id array
+
+Signed-off-by: Santiago Garcia Mantinan <manty@debian.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 54898c9..cbe3451 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -708,6 +708,7 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EVDO_EMBEDDED_FULLSPEED) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_EMBEDDED_FULLSPEED) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_EVDO_HIGHSPEED) },
++	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED3) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED4) },
+ 	{ USB_DEVICE(NOVATELWIRELESS_VENDOR_ID, NOVATELWIRELESS_PRODUCT_HSPA_HIGHSPEED5) },
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
new file mode 100644
index 0000000..9681068
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch
@@ -0,0 +1,79 @@
+From f3a53ff9baee1e730f4332eccf3d5feb3245e7a9 Mon Sep 17 00:00:00 2001
+From: Simon Arlott <simon@fire.lp0.eu>
+Date: Mon, 26 Mar 2012 21:19:40 +0100
+Subject: [PATCH 30/69] USB: ftdi_sio: fix status line change handling for
+ TIOCMIWAIT and TIOCGICOUNT
+
+commit fca5430d48d53eaf103498c33fd0d1984b9f448b upstream.
+
+Handling of TIOCMIWAIT was changed by commit 1d749f9afa657f6ee9336b2bc1fcd750a647d157
+ USB: ftdi_sio.c: Use ftdi async_icount structure for TIOCMIWAIT, as in other drivers
+
+FTDI_STATUS_B0_MASK does not indicate the changed modem status lines,
+it indicates the value of the current modem status lines. An xor is
+still required to determine which lines have changed.
+
+The count was only being incremented if the line was high. The only
+reason TIOCMIWAIT still worked was because the status packet is
+repeated every 1ms, so the count was always changing. The wakeup
+itself still ran based on the status lines changing.
+
+This change fixes handling of updates to the modem status lines and
+allows multiple processes to use TIOCMIWAIT concurrently.
+
+Tested with two processes waiting on different status lines being
+toggled independently.
+
+Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
+Cc: Uwe Bonnes <bon@elektron.ikp.physik.tu-darmstadt.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c |   24 +++++++++++++-----------
+ 1 file changed, 13 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index f2c9ef7..cfc8e59 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -75,7 +75,7 @@ struct ftdi_private {
+ 	unsigned long last_dtr_rts;	/* saved modem control outputs */
+ 	struct async_icount	icount;
+ 	wait_queue_head_t delta_msr_wait; /* Used for TIOCMIWAIT */
+-	char prev_status, diff_status;        /* Used for TIOCMIWAIT */
++	char prev_status;        /* Used for TIOCMIWAIT */
+ 	char transmit_empty;	/* If transmitter is empty or not */
+ 	struct usb_serial_port *port;
+ 	__u16 interface;	/* FT2232C, FT2232H or FT4232H port interface
+@@ -1979,17 +1979,19 @@ static int ftdi_process_packet(struct tty_struct *tty,
+ 	   N.B. packet may be processed more than once, but differences
+ 	   are only processed once.  */
+ 	status = packet[0] & FTDI_STATUS_B0_MASK;
+-	if (status & FTDI_RS0_CTS)
+-		priv->icount.cts++;
+-	if (status & FTDI_RS0_DSR)
+-		priv->icount.dsr++;
+-	if (status & FTDI_RS0_RI)
+-		priv->icount.rng++;
+-	if (status & FTDI_RS0_RLSD)
+-		priv->icount.dcd++;
+ 	if (status != priv->prev_status) {
+-		priv->diff_status |= status ^ priv->prev_status;
+-		wake_up_interruptible(&priv->delta_msr_wait);
++		char diff_status = status ^ priv->prev_status;
++
++		if (diff_status & FTDI_RS0_CTS)
++			priv->icount.cts++;
++		if (diff_status & FTDI_RS0_DSR)
++			priv->icount.dsr++;
++		if (diff_status & FTDI_RS0_RI)
++			priv->icount.rng++;
++		if (diff_status & FTDI_RS0_RLSD)
++			priv->icount.dcd++;
++
++		wake_up_interruptible_all(&priv->delta_msr_wait);
+ 		priv->prev_status = status;
+ 	}
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
new file mode 100644
index 0000000..189b598
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch
@@ -0,0 +1,111 @@
+From 9290ee7d767163efb842c578e20c74164dddb350 Mon Sep 17 00:00:00 2001
+From: Simon Arlott <simon@fire.lp0.eu>
+Date: Mon, 26 Mar 2012 23:27:59 +0100
+Subject: [PATCH 31/69] USB: ftdi_sio: fix race condition in TIOCMIWAIT, and
+ abort of TIOCMIWAIT when the device is removed
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 876ae50d94b02f3f523aa451b45ec5fb9c25d221 upstream.
+
+There are two issues here, one is that the device is generating
+spurious very fast modem status line changes somewhere:
+
+CTS becomes high then low 18µs later:
+[121226.924373] ftdi_process_packet: prev rng=0 dsr=10 dcd=0 cts=6
+[121226.924378] ftdi_process_packet: status=10 prev=00 diff=10
+[121226.924382] ftdi_process_packet: now rng=0 dsr=10 dcd=0 cts=7
+(wake_up_interruptible is called)
+[121226.924391] ftdi_process_packet: prev rng=0 dsr=10 dcd=0 cts=7
+[121226.924394] ftdi_process_packet: status=00 prev=10 diff=10
+[121226.924397] ftdi_process_packet: now rng=0 dsr=10 dcd=0 cts=8
+(wake_up_interruptible is called)
+
+This wakes up the task in TIOCMIWAIT:
+[121226.924405] ftdi_ioctl: 19451 rng=0->0 dsr=10->10 dcd=0->0 cts=6->8
+(wait from 20:51:46 returns and observes both changes)
+
+Which then calls TIOCMIWAIT again:
+20:51:46.400239 ioctl(3, TIOCMIWAIT, 0x20) = 0
+22:11:09.441818 ioctl(3, TIOCMGET, [TIOCM_DTR|TIOCM_RTS]) = 0
+22:11:09.442812 ioctl(3, TIOCMIWAIT, 0x20) = -1 EIO (Input/output error)
+(the second wake_up_interruptible takes effect and an I/O error occurs)
+
+The other issue is that TIOCMIWAIT will wait forever (unless the task is
+interrupted) if the device is removed.
+
+This change removes the -EIO return that occurs if the counts don't
+appear to have changed. Multiple counts may have been processed as
+one or the waiting task may have started waiting after recording the
+current count.
+
+It adds a bool to indicate that the device has been removed so that
+TIOCMIWAIT doesn't wait forever, and wakes up any tasks so that they can
+return -EIO.
+
+Signed-off-by: Simon Arlott <simon@fire.lp0.eu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c |   12 +++++++-----
+ 1 file changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index cfc8e59..c4cf3f3 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -76,6 +76,7 @@ struct ftdi_private {
+ 	struct async_icount	icount;
+ 	wait_queue_head_t delta_msr_wait; /* Used for TIOCMIWAIT */
+ 	char prev_status;        /* Used for TIOCMIWAIT */
++	bool dev_gone;        /* Used to abort TIOCMIWAIT */
+ 	char transmit_empty;	/* If transmitter is empty or not */
+ 	struct usb_serial_port *port;
+ 	__u16 interface;	/* FT2232C, FT2232H or FT4232H port interface
+@@ -1679,6 +1680,7 @@ static int ftdi_sio_port_probe(struct usb_serial_port *port)
+ 	init_waitqueue_head(&priv->delta_msr_wait);
+ 
+ 	priv->flags = ASYNC_LOW_LATENCY;
++	priv->dev_gone = false;
+ 
+ 	if (quirk && quirk->port_probe)
+ 		quirk->port_probe(priv);
+@@ -1836,6 +1838,9 @@ static int ftdi_sio_port_remove(struct usb_serial_port *port)
+ 
+ 	dbg("%s", __func__);
+ 
++	priv->dev_gone = true;
++	wake_up_interruptible_all(&priv->delta_msr_wait);
++
+ 	remove_sysfs_attrs(port);
+ 
+ 	kref_put(&priv->kref, ftdi_sio_priv_release);
+@@ -2390,15 +2395,12 @@ static int ftdi_ioctl(struct tty_struct *tty,
+ 	 */
+ 	case TIOCMIWAIT:
+ 		cprev = priv->icount;
+-		while (1) {
++		while (!priv->dev_gone) {
+ 			interruptible_sleep_on(&priv->delta_msr_wait);
+ 			/* see if a signal did it */
+ 			if (signal_pending(current))
+ 				return -ERESTARTSYS;
+ 			cnow = priv->icount;
+-			if (cnow.rng == cprev.rng && cnow.dsr == cprev.dsr &&
+-			    cnow.dcd == cprev.dcd && cnow.cts == cprev.cts)
+-				return -EIO; /* no change => error */
+ 			if (((arg & TIOCM_RNG) && (cnow.rng != cprev.rng)) ||
+ 			    ((arg & TIOCM_DSR) && (cnow.dsr != cprev.dsr)) ||
+ 			    ((arg & TIOCM_CD)  && (cnow.dcd != cprev.dcd)) ||
+@@ -2407,7 +2409,7 @@ static int ftdi_ioctl(struct tty_struct *tty,
+ 			}
+ 			cprev = cnow;
+ 		}
+-		/* not reached */
++		return -EIO;
+ 		break;
+ 	case TIOCSERGETLSR:
+ 		return get_lsr_info(port, (struct serial_struct __user *)arg);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
new file mode 100644
index 0000000..b13cff3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch
@@ -0,0 +1,30 @@
+From fa17e1b79bef42fa178918e05b7a38d69caa13d7 Mon Sep 17 00:00:00 2001
+From: Anton Samokhvalov <pg83@yandex.ru>
+Date: Wed, 4 Apr 2012 22:26:01 +0400
+Subject: [PATCH 32/69] USB: sierra: add support for Sierra Wireless MC7710
+
+commit c5d703dcc776cb542b41665f2b7e2ba054efb4a7 upstream.
+
+Just add new device id. 3G works fine, LTE not tested.
+
+Signed-off-by: Anton Samokhvalov <pg83@yandex.ru>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/sierra.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/usb/serial/sierra.c b/drivers/usb/serial/sierra.c
+index b18179b..7c3ec9e 100644
+--- a/drivers/usb/serial/sierra.c
++++ b/drivers/usb/serial/sierra.c
+@@ -289,6 +289,7 @@ static const struct usb_device_id id_table[] = {
+ 	{ USB_DEVICE(0x1199, 0x6856) },	/* Sierra Wireless AirCard 881 U */
+ 	{ USB_DEVICE(0x1199, 0x6859) },	/* Sierra Wireless AirCard 885 E */
+ 	{ USB_DEVICE(0x1199, 0x685A) },	/* Sierra Wireless AirCard 885 E */
++	{ USB_DEVICE(0x1199, 0x68A2) }, /* Sierra Wireless MC7710 */
+ 	/* Sierra Wireless C885 */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(0x1199, 0x6880, 0xFF, 0xFF, 0xFF)},
+ 	/* Sierra Wireless C888, Air Card 501, USB 303, USB 304 */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
new file mode 100644
index 0000000..9ff10f9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch
@@ -0,0 +1,85 @@
+From cd107339d3370b39dcaafd354a0c658b207dcaf0 Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Thu, 22 Mar 2012 11:00:21 -0400
+Subject: [PATCH 33/69] USB: don't clear urb->dev in scatter-gather library
+
+commit bcf398537630bf20b4dbe59ba855b69f404c93cf upstream.
+
+This patch (as1517b) fixes an error in the USB scatter-gather library.
+The library code uses urb->dev to determine whether or nor an URB is
+currently active; the completion handler sets urb->dev to NULL.
+However the core unlinking routines need to use urb->dev.  Since
+unlinking always racing with completion, the completion handler must
+not clear urb->dev -- it can lead to invalid memory accesses when a
+transfer has to be cancelled.
+
+This patch fixes the problem by getting rid of the lines that clear
+urb->dev after urb has been submitted.  As a result we may end up
+trying to unlink an URB that failed in submission or that has already
+completed, so an extra check is added after each unlink to avoid
+printing an error message when this happens.  The checks are updated
+in both sg_complete() and sg_cancel(), and the second is updated to
+match the first (currently it prints out unnecessary warning messages
+if a device is unplugged while a transfer is in progress).
+
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Reported-and-tested-by: Illia Zaitsev <I.Zaitsev@adbglobal.com>
+CC: Ming Lei <tom.leiming@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/core/message.c |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
+index b3bdfed..aed3e07 100644
+--- a/drivers/usb/core/message.c
++++ b/drivers/usb/core/message.c
+@@ -308,7 +308,8 @@ static void sg_complete(struct urb *urb)
+ 				retval = usb_unlink_urb(io->urbs [i]);
+ 				if (retval != -EINPROGRESS &&
+ 				    retval != -ENODEV &&
+-				    retval != -EBUSY)
++				    retval != -EBUSY &&
++				    retval != -EIDRM)
+ 					dev_err(&io->dev->dev,
+ 						"%s, unlink --> %d\n",
+ 						__func__, retval);
+@@ -317,7 +318,6 @@ static void sg_complete(struct urb *urb)
+ 		}
+ 		spin_lock(&io->lock);
+ 	}
+-	urb->dev = NULL;
+ 
+ 	/* on the last completion, signal usb_sg_wait() */
+ 	io->bytes += urb->actual_length;
+@@ -524,7 +524,6 @@ void usb_sg_wait(struct usb_sg_request *io)
+ 		case -ENXIO:	/* hc didn't queue this one */
+ 		case -EAGAIN:
+ 		case -ENOMEM:
+-			io->urbs[i]->dev = NULL;
+ 			retval = 0;
+ 			yield();
+ 			break;
+@@ -542,7 +541,6 @@ void usb_sg_wait(struct usb_sg_request *io)
+ 
+ 			/* fail any uncompleted urbs */
+ 		default:
+-			io->urbs[i]->dev = NULL;
+ 			io->urbs[i]->status = retval;
+ 			dev_dbg(&io->dev->dev, "%s, submit --> %d\n",
+ 				__func__, retval);
+@@ -593,7 +591,10 @@ void usb_sg_cancel(struct usb_sg_request *io)
+ 			if (!io->urbs [i]->dev)
+ 				continue;
+ 			retval = usb_unlink_urb(io->urbs [i]);
+-			if (retval != -EINPROGRESS && retval != -EBUSY)
++			if (retval != -EINPROGRESS
++					&& retval != -ENODEV
++					&& retval != -EBUSY
++					&& retval != -EIDRM)
+ 				dev_warn(&io->dev->dev, "%s, unlink --> %d\n",
+ 					__func__, retval);
+ 		}
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
new file mode 100644
index 0000000..019927d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch
@@ -0,0 +1,54 @@
+From 2bfec5e16aa5c74b8c5934059f3e32595ef95214 Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Wed, 28 Mar 2012 15:56:17 -0400
+Subject: [PATCH 34/69] USB: don't ignore suspend errors for root hubs
+
+commit cd4376e23a59a2adf3084cb5f4a523e6d5fd4e49 upstream.
+
+This patch (as1532) fixes a mistake in the USB suspend code.  When the
+system is going to sleep, we should ignore errors in powering down USB
+devices, because they don't really matter.  The devices will go to low
+power anyway when the entire USB bus gets suspended (except for
+SuperSpeed devices; maybe they will need special treatment later).
+
+However we should not ignore errors in suspending root hubs,
+especially if the error indicates that the suspend raced with a wakeup
+request.  Doing so might leave the bus powered on while the system was
+supposed to be asleep, or it might cause the suspend of the root hub's
+parent controller device to fail, or it might cause a wakeup request
+to be ignored.
+
+The patch fixes the problem by ignoring errors only when the device in
+question is not a root hub.
+
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Reported-by: Chen Peter <B29397@freescale.com>
+Tested-by: Chen Peter <peter.chen@freescale.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/core/driver.c |    9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
+index 45887a0..c77f0d6 100644
+--- a/drivers/usb/core/driver.c
++++ b/drivers/usb/core/driver.c
+@@ -1198,8 +1198,13 @@ static int usb_suspend_both(struct usb_device *udev, pm_message_t msg)
+ 	if (status == 0) {
+ 		status = usb_suspend_device(udev, msg);
+ 
+-		/* Again, ignore errors during system sleep transitions */
+-		if (!PMSG_IS_AUTO(msg))
++		/*
++		 * Ignore errors from non-root-hub devices during
++		 * system sleep transitions.  For the most part,
++		 * these devices should go to low power anyway when
++		 * the entire bus is suspended.
++		 */
++		if (udev->parent && !PMSG_IS_AUTO(msg))
+ 			status = 0;
+ 	}
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch
new file mode 100644
index 0000000..0643790
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch
@@ -0,0 +1,58 @@
+From 36e9ddc88d64edf5a78006753b3ec306384008d7 Mon Sep 17 00:00:00 2001
+From: Felipe Balbi <balbi@ti.com>
+Date: Thu, 15 Mar 2012 16:37:08 +0200
+Subject: [PATCH 35/69] xhci: don't re-enable IE constantly
+
+commit 4e833c0b87a30798e67f06120cecebef6ee9644c upstream.
+
+While we're at that, define IMAN bitfield to aid readability.
+
+The interrupt enable bit should be set once on driver init, and we
+shouldn't need to continually re-enable it.  Commit c21599a3 introduced
+a read of the irq_pending register, and that allows us to preserve the
+state of the IE bit.  Before that commit, we were blindly writing 0x3 to
+the register.
+
+This patch should be backported to kernels as old as 2.6.36, or ones
+that contain the commit c21599a36165dbc78b380846b254017a548b9de5 "USB:
+xhci: Reduce reads and writes of interrupter registers".
+
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci-ring.c |    2 +-
+ drivers/usb/host/xhci.h      |    4 ++++
+ 2 files changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/host/xhci-ring.c b/drivers/usb/host/xhci-ring.c
+index ae92dc4..43b3447 100644
+--- a/drivers/usb/host/xhci-ring.c
++++ b/drivers/usb/host/xhci-ring.c
+@@ -2343,7 +2343,7 @@ hw_died:
+ 		u32 irq_pending;
+ 		/* Acknowledge the PCI interrupt */
+ 		irq_pending = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+-		irq_pending |= 0x3;
++		irq_pending |= IMAN_IP;
+ 		xhci_writel(xhci, irq_pending, &xhci->ir_set->irq_pending);
+ 	}
+ 
+diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
+index 09eda3a..4850c4d 100644
+--- a/drivers/usb/host/xhci.h
++++ b/drivers/usb/host/xhci.h
+@@ -205,6 +205,10 @@ struct xhci_op_regs {
+ #define CMD_PM_INDEX	(1 << 11)
+ /* bits 12:31 are reserved (and should be preserved on writes). */
+ 
++/* IMAN - Interrupt Management Register */
++#define IMAN_IP		(1 << 1)
++#define IMAN_IE		(1 << 0)
++
+ /* USBSTS - USB status - status bitmasks */
+ /* HC not running - set to 1 when run/stop bit is cleared. */
+ #define STS_HALT	XHCI_STS_HALT
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
new file mode 100644
index 0000000..9eb5447
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch
@@ -0,0 +1,78 @@
+From f8d0987af5d135d8eb54e7b525e985328f0e8bd5 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Fri, 16 Mar 2012 13:09:39 -0700
+Subject: [PATCH 36/69] xhci: Don't write zeroed pointers to xHC registers.
+
+commit 159e1fcc9a60fc7daba23ee8fcdb99799de3fe84 upstream.
+
+When xhci_mem_cleanup() is called, we can't be sure if the xHC is
+actually halted.  We can ask the xHC to halt by writing to the RUN bit
+in the command register, but that might timeout due to a HW hang.
+
+If the host controller is still running, we should not write zeroed
+values to the event ring dequeue pointers or base tables, the DCBAA
+pointers, or the command ring pointers.  Eric Fu reports his VIA VL800
+host accesses the event ring pointers after a failed register restore on
+resume from suspend.  The hypothesis is that the host never actually
+halted before the register write to change the event ring pointer to
+zero.
+
+Remove all writes of zeroed values to pointer registers in
+xhci_mem_cleanup().  Instead, make all callers of the function reset the
+host controller first, which will reset those registers to zero.
+xhci_mem_init() is the only caller that doesn't first halt and reset the
+host controller before calling xhci_mem_cleanup().
+
+This should be backported to kernels as old as 2.6.32.
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Tested-by: Elric Fu <elricfu1@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci-mem.c |    9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
+index c69cf54..01c3800 100644
+--- a/drivers/usb/host/xhci-mem.c
++++ b/drivers/usb/host/xhci-mem.c
+@@ -1704,11 +1704,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
+ 	int i;
+ 
+ 	/* Free the Event Ring Segment Table and the actual Event Ring */
+-	if (xhci->ir_set) {
+-		xhci_writel(xhci, 0, &xhci->ir_set->erst_size);
+-		xhci_write_64(xhci, 0, &xhci->ir_set->erst_base);
+-		xhci_write_64(xhci, 0, &xhci->ir_set->erst_dequeue);
+-	}
+ 	size = sizeof(struct xhci_erst_entry)*(xhci->erst.num_entries);
+ 	if (xhci->erst.entries)
+ 		dma_free_coherent(&pdev->dev, size,
+@@ -1720,7 +1715,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
+ 	xhci->event_ring = NULL;
+ 	xhci_dbg(xhci, "Freed event ring\n");
+ 
+-	xhci_write_64(xhci, 0, &xhci->op_regs->cmd_ring);
+ 	if (xhci->cmd_ring)
+ 		xhci_ring_free(xhci, xhci->cmd_ring);
+ 	xhci->cmd_ring = NULL;
+@@ -1749,7 +1743,6 @@ void xhci_mem_cleanup(struct xhci_hcd *xhci)
+ 	xhci->medium_streams_pool = NULL;
+ 	xhci_dbg(xhci, "Freed medium stream array pool\n");
+ 
+-	xhci_write_64(xhci, 0, &xhci->op_regs->dcbaa_ptr);
+ 	if (xhci->dcbaa)
+ 		dma_free_coherent(&pdev->dev, sizeof(*xhci->dcbaa),
+ 				xhci->dcbaa, xhci->dcbaa->dma);
+@@ -2358,6 +2351,8 @@ int xhci_mem_init(struct xhci_hcd *xhci, gfp_t flags)
+ 
+ fail:
+ 	xhci_warn(xhci, "Couldn't initialize memory\n");
++	xhci_halt(xhci);
++	xhci_reset(xhci);
+ 	xhci_mem_cleanup(xhci);
+ 	return -ENOMEM;
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
new file mode 100644
index 0000000..cadc929
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch
@@ -0,0 +1,39 @@
+From 375a67105a521c7ae75a529509218c4bda02c612 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Fri, 16 Mar 2012 13:27:39 -0700
+Subject: [PATCH 37/69] xhci: Restore event ring dequeue pointer on resume.
+
+commit fb3d85bc7193f23c9a564502df95564c49a32c91 upstream.
+
+The xhci_save_registers() function saved the event ring dequeue pointer
+in the s3 register structure, but xhci_restore_registers() never
+restored it.  No other code in the xHCI successful resume path would
+ever restore it either.  Fix that.
+
+This should be backported to kernels as old as 2.6.37, that contain the
+commit 5535b1d5f8885695c6ded783c692e3c0d0eda8ca "USB: xHCI: PCI power
+management implementation".
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Tested-by: Elric Fu <elricfu1@gmail.com>
+Cc: Andiry Xu <andiry.xu@amd.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
+index 034f554..4d44713 100644
+--- a/drivers/usb/host/xhci.c
++++ b/drivers/usb/host/xhci.c
+@@ -681,6 +681,7 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
+ 	xhci_writel(xhci, xhci->s3.irq_control, &xhci->ir_set->irq_control);
+ 	xhci_writel(xhci, xhci->s3.erst_size, &xhci->ir_set->erst_size);
+ 	xhci_write_64(xhci, xhci->s3.erst_base, &xhci->ir_set->erst_base);
++	xhci_write_64(xhci, xhci->s3.erst_dequeue, &xhci->ir_set->erst_dequeue);
+ }
+ 
+ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
new file mode 100644
index 0000000..a48a25d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch
@@ -0,0 +1,73 @@
+From 75b1fa981bf0fcddcc4a6c8916d6995a273dcfad Mon Sep 17 00:00:00 2001
+From: Elric Fu <elricfu1@gmail.com>
+Date: Mon, 26 Mar 2012 21:16:02 +0800
+Subject: [PATCH 38/69] USB: fix bug of device descriptor got from superspeed
+ device
+
+commit d8aec3dbdfd02627e198e7956ab4aaeba2a349fa upstream.
+
+When the Seagate Goflex USB3.0 device is attached to VIA xHCI
+host, sometimes the device will downgrade mode to high speed.
+By the USB analyzer, I found the device finished the link
+training process and worked at superspeed mode. But the device
+descriptor got from the device shows the device works at 2.1.
+It is very strange and seems like the device controller of
+Seagate Goflex has a little confusion.
+
+The first 8 bytes of device descriptor should be:
+12 01 00 03 00 00 00 09
+
+But the first 8 bytes of wrong device descriptor are:
+12 01 10 02 00 00 00 40
+
+The wrong device descriptor caused the initialization of mass
+storage failed. After a while, the device would be recognized
+as a high speed device and works fine.
+
+This patch will warm reset the device to fix the issue after
+finding the bcdUSB field of device descriptor isn't 0x0300
+but the speed mode of device is superspeed.
+
+This patch should be backported to kernels as old as 3.2, or ones that
+contain the commit 75d7cf72ab9fa01dc70877aa5c68e8ef477229dc "usbcore:
+refine warm reset logic".
+
+Signed-off-by: Elric Fu <elricfu1@gmail.com>
+Acked-by: Andiry Xu <Andiry.Xu@amd.com>
+Acked-by: Sergei Shtylyov <sshtylyov@mvista.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/core/hub.c |   16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
+index f982eeb..18373ec 100644
+--- a/drivers/usb/core/hub.c
++++ b/drivers/usb/core/hub.c
+@@ -3072,6 +3072,22 @@ hub_port_init (struct usb_hub *hub, struct usb_device *udev, int port1,
+ 	if (retval)
+ 		goto fail;
+ 
++	/*
++	 * Some superspeed devices have finished the link training process
++	 * and attached to a superspeed hub port, but the device descriptor
++	 * got from those devices show they aren't superspeed devices. Warm
++	 * reset the port attached by the devices can fix them.
++	 */
++	if ((udev->speed == USB_SPEED_SUPER) &&
++			(le16_to_cpu(udev->descriptor.bcdUSB) < 0x0300)) {
++		dev_err(&udev->dev, "got a wrong device descriptor, "
++				"warm reset device\n");
++		hub_port_reset(hub, port1, udev,
++				HUB_BH_RESET_TIME, true);
++		retval = -EINVAL;
++		goto fail;
++	}
++
+ 	if (udev->descriptor.bMaxPacketSize0 == 0xff ||
+ 			udev->speed == USB_SPEED_SUPER)
+ 		i = 512;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
new file mode 100644
index 0000000..9229f08
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch
@@ -0,0 +1,43 @@
+From f9cce3fb45a90fffc8d2bb59a65ebdbfc881d5a8 Mon Sep 17 00:00:00 2001
+From: Elric Fu <elricfu1@gmail.com>
+Date: Thu, 29 Mar 2012 15:47:50 +0800
+Subject: [PATCH 39/69] xHCI: add XHCI_RESET_ON_RESUME quirk for VIA xHCI host
+
+commit 457a4f61f9bfc3ae76e5b49f30f25d86bb696f67 upstream.
+
+The suspend operation of VIA xHCI host have some issues and
+hibernate operation works fine, so The XHCI_RESET_ON_RESUME
+quirk is added for it.
+
+This patch should base on "xHCI: Don't write zeroed pointer
+to xHC registers" that is released by Sarah. Otherwise, the
+host system error will ocurr in the hibernate operation
+process.
+
+This should be backported to stable kernels as old as 2.6.37,
+that contain the commit c877b3b2ad5cb9d4fe523c5496185cc328ff3ae9
+"xhci: Add reset on resume quirk for asrock p67 host".
+
+Signed-off-by: Elric Fu <elricfu1@gmail.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci-pci.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
+index ef98b38..211296a 100644
+--- a/drivers/usb/host/xhci-pci.c
++++ b/drivers/usb/host/xhci-pci.c
+@@ -95,6 +95,8 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
+ 		xhci->quirks |= XHCI_RESET_ON_RESUME;
+ 		xhci_dbg(xhci, "QUIRK: Resetting on resume\n");
+ 	}
++	if (pdev->vendor == PCI_VENDOR_ID_VIA)
++		xhci->quirks |= XHCI_RESET_ON_RESUME;
+ }
+ 
+ /* called during probe() after chip reset completes */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
new file mode 100644
index 0000000..5a3f5bc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch
@@ -0,0 +1,61 @@
+From 84ff902a342b34de5c637eccde339aa7bd644c2b Mon Sep 17 00:00:00 2001
+From: Alex He <alex.he@amd.com>
+Date: Fri, 30 Mar 2012 10:21:38 +0800
+Subject: [PATCH 40/69] xHCI: Correct the #define XHCI_LEGACY_DISABLE_SMI
+
+commit 95018a53f7653e791bba1f54c8d75d9cb700d1bd upstream.
+
+Re-define XHCI_LEGACY_DISABLE_SMI and used it in right way. All SMI enable
+bits will be cleared to zero and flag bits 29:31 are also cleared to zero.
+Other bits should be presvered as Table 146.
+
+This patch should be backported to kernels as old as 2.6.31.
+
+Signed-off-by: Alex He <alex.he@amd.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/pci-quirks.c    |   10 +++++++---
+ drivers/usb/host/xhci-ext-caps.h |    5 +++--
+ 2 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
+index 7732d69..2afff88 100644
+--- a/drivers/usb/host/pci-quirks.c
++++ b/drivers/usb/host/pci-quirks.c
+@@ -825,9 +825,13 @@ static void __devinit quirk_usb_handoff_xhci(struct pci_dev *pdev)
+ 		}
+ 	}
+ 
+-	/* Disable any BIOS SMIs */
+-	writel(XHCI_LEGACY_DISABLE_SMI,
+-			base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
++	val = readl(base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
++	/* Mask off (turn off) any enabled SMIs */
++	val &= XHCI_LEGACY_DISABLE_SMI;
++	/* Mask all SMI events bits, RW1C */
++	val |= XHCI_LEGACY_SMI_EVENTS;
++	/* Disable any BIOS SMIs and clear all SMI events*/
++	writel(val, base + ext_cap_offset + XHCI_LEGACY_CONTROL_OFFSET);
+ 
+ 	if (usb_is_intel_switchable_xhci(pdev))
+ 		usb_enable_xhci_ports(pdev);
+diff --git a/drivers/usb/host/xhci-ext-caps.h b/drivers/usb/host/xhci-ext-caps.h
+index c7f3312..377f424 100644
+--- a/drivers/usb/host/xhci-ext-caps.h
++++ b/drivers/usb/host/xhci-ext-caps.h
+@@ -62,8 +62,9 @@
+ /* USB Legacy Support Control and Status Register  - section 7.1.2 */
+ /* Add this offset, plus the value of xECP in HCCPARAMS to the base address */
+ #define XHCI_LEGACY_CONTROL_OFFSET	(0x04)
+-/* bits 1:2, 5:12, and 17:19 need to be preserved; bits 21:28 should be zero */
+-#define	XHCI_LEGACY_DISABLE_SMI		((0x3 << 1) + (0xff << 5) + (0x7 << 17))
++/* bits 1:3, 5:12, and 17:19 need to be preserved; bits 21:28 should be zero */
++#define	XHCI_LEGACY_DISABLE_SMI		((0x7 << 1) + (0xff << 5) + (0x7 << 17))
++#define XHCI_LEGACY_SMI_EVENTS		(0x7 << 29)
+ 
+ /* USB 2.0 xHCI 0.96 L1C capability - section 7.2.2.1.3.2 */
+ #define XHCI_L1C               (1 << 16)
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch
new file mode 100644
index 0000000..350e9d7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch
@@ -0,0 +1,240 @@
+From 0110a55b4db1e1f84f4980aef2528e2cfe6875af Mon Sep 17 00:00:00 2001
+From: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Date: Wed, 11 Apr 2012 14:28:07 +0200
+Subject: [PATCH 41/69] fix tlb flushing for page table pages
+
+commit cd94154cc6a28dd9dc271042c1a59c08d26da886 upstream.
+
+Git commit 36409f6353fc2d7b6516e631415f938eadd92ffa "use generic RCU
+page-table freeing code" introduced a tlb flushing bug. Partially revert
+the above git commit and go back to s390 specific page table flush code.
+
+For s390 the TLB can contain three types of entries, "normal" TLB
+page-table entries, TLB combined region-and-segment-table (CRST) entries
+and real-space entries. Linux does not use real-space entries which
+leaves normal TLB entries and CRST entries. The CRST entries are
+intermediate steps in the page-table translation called translation paths.
+For example a 4K page access in a three-level page table setup will
+create two CRST TLB entries and one page-table TLB entry. The advantage
+of that approach is that a page access next to the previous one can reuse
+the CRST entries and needs just a single read from memory to create the
+page-table TLB entry. The disadvantage is that the TLB flushing rules are
+more complicated, before any page-table may be freed the TLB needs to be
+flushed.
+
+In short: the generic RCU page-table freeing code is incorrect for the
+CRST entries, in particular the check for mm_users < 2 is troublesome.
+
+This is applicable to 3.0+ kernels.
+
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/s390/Kconfig               |    1 -
+ arch/s390/include/asm/pgalloc.h |    3 --
+ arch/s390/include/asm/tlb.h     |   22 +-------------
+ arch/s390/mm/pgtable.c          |   63 +++++++++++++++++++++++++++++++++++++--
+ 4 files changed, 61 insertions(+), 28 deletions(-)
+
+diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
+index f929db9..a3c40e8 100644
+--- a/arch/s390/Kconfig
++++ b/arch/s390/Kconfig
+@@ -90,7 +90,6 @@ config S390
+ 	select HAVE_GET_USER_PAGES_FAST
+ 	select HAVE_ARCH_MUTEX_CPU_RELAX
+ 	select HAVE_ARCH_JUMP_LABEL if !MARCH_G5
+-	select HAVE_RCU_TABLE_FREE if SMP
+ 	select ARCH_SAVE_PAGE_KEYS if HIBERNATION
+ 	select ARCH_INLINE_SPIN_TRYLOCK
+ 	select ARCH_INLINE_SPIN_TRYLOCK_BH
+diff --git a/arch/s390/include/asm/pgalloc.h b/arch/s390/include/asm/pgalloc.h
+index 8eef9b5..78e3041 100644
+--- a/arch/s390/include/asm/pgalloc.h
++++ b/arch/s390/include/asm/pgalloc.h
+@@ -22,10 +22,7 @@ void crst_table_free(struct mm_struct *, unsigned long *);
+ 
+ unsigned long *page_table_alloc(struct mm_struct *, unsigned long);
+ void page_table_free(struct mm_struct *, unsigned long *);
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ void page_table_free_rcu(struct mmu_gather *, unsigned long *);
+-void __tlb_remove_table(void *_table);
+-#endif
+ 
+ static inline void clear_table(unsigned long *s, unsigned long val, size_t n)
+ {
+diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
+index c687a2c..775a5ee 100644
+--- a/arch/s390/include/asm/tlb.h
++++ b/arch/s390/include/asm/tlb.h
+@@ -30,14 +30,10 @@
+ 
+ struct mmu_gather {
+ 	struct mm_struct *mm;
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ 	struct mmu_table_batch *batch;
+-#endif
+ 	unsigned int fullmm;
+-	unsigned int need_flush;
+ };
+ 
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ struct mmu_table_batch {
+ 	struct rcu_head		rcu;
+ 	unsigned int		nr;
+@@ -49,7 +45,6 @@ struct mmu_table_batch {
+ 
+ extern void tlb_table_flush(struct mmu_gather *tlb);
+ extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
+-#endif
+ 
+ static inline void tlb_gather_mmu(struct mmu_gather *tlb,
+ 				  struct mm_struct *mm,
+@@ -57,29 +52,20 @@ static inline void tlb_gather_mmu(struct mmu_gather *tlb,
+ {
+ 	tlb->mm = mm;
+ 	tlb->fullmm = full_mm_flush;
+-	tlb->need_flush = 0;
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ 	tlb->batch = NULL;
+-#endif
+ 	if (tlb->fullmm)
+ 		__tlb_flush_mm(mm);
+ }
+ 
+ static inline void tlb_flush_mmu(struct mmu_gather *tlb)
+ {
+-	if (!tlb->need_flush)
+-		return;
+-	tlb->need_flush = 0;
+-	__tlb_flush_mm(tlb->mm);
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ 	tlb_table_flush(tlb);
+-#endif
+ }
+ 
+ static inline void tlb_finish_mmu(struct mmu_gather *tlb,
+ 				  unsigned long start, unsigned long end)
+ {
+-	tlb_flush_mmu(tlb);
++	tlb_table_flush(tlb);
+ }
+ 
+ /*
+@@ -105,10 +91,8 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
+ static inline void pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
+ 				unsigned long address)
+ {
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ 	if (!tlb->fullmm)
+ 		return page_table_free_rcu(tlb, (unsigned long *) pte);
+-#endif
+ 	page_table_free(tlb->mm, (unsigned long *) pte);
+ }
+ 
+@@ -125,10 +109,8 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
+ #ifdef __s390x__
+ 	if (tlb->mm->context.asce_limit <= (1UL << 31))
+ 		return;
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ 	if (!tlb->fullmm)
+ 		return tlb_remove_table(tlb, pmd);
+-#endif
+ 	crst_table_free(tlb->mm, (unsigned long *) pmd);
+ #endif
+ }
+@@ -146,10 +128,8 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
+ #ifdef __s390x__
+ 	if (tlb->mm->context.asce_limit <= (1UL << 42))
+ 		return;
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+ 	if (!tlb->fullmm)
+ 		return tlb_remove_table(tlb, pud);
+-#endif
+ 	crst_table_free(tlb->mm, (unsigned long *) pud);
+ #endif
+ }
+diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
+index 301c84d..f8ceac4 100644
+--- a/arch/s390/mm/pgtable.c
++++ b/arch/s390/mm/pgtable.c
+@@ -687,8 +687,6 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
+ 	}
+ }
+ 
+-#ifdef CONFIG_HAVE_RCU_TABLE_FREE
+-
+ static void __page_table_free_rcu(void *table, unsigned bit)
+ {
+ 	struct page *page;
+@@ -742,7 +740,66 @@ void __tlb_remove_table(void *_table)
+ 		free_pages((unsigned long) table, ALLOC_ORDER);
+ }
+ 
+-#endif
++static void tlb_remove_table_smp_sync(void *arg)
++{
++	/* Simply deliver the interrupt */
++}
++
++static void tlb_remove_table_one(void *table)
++{
++	/*
++	 * This isn't an RCU grace period and hence the page-tables cannot be
++	 * assumed to be actually RCU-freed.
++	 *
++	 * It is however sufficient for software page-table walkers that rely
++	 * on IRQ disabling. See the comment near struct mmu_table_batch.
++	 */
++	smp_call_function(tlb_remove_table_smp_sync, NULL, 1);
++	__tlb_remove_table(table);
++}
++
++static void tlb_remove_table_rcu(struct rcu_head *head)
++{
++	struct mmu_table_batch *batch;
++	int i;
++
++	batch = container_of(head, struct mmu_table_batch, rcu);
++
++	for (i = 0; i < batch->nr; i++)
++		__tlb_remove_table(batch->tables[i]);
++
++	free_page((unsigned long)batch);
++}
++
++void tlb_table_flush(struct mmu_gather *tlb)
++{
++	struct mmu_table_batch **batch = &tlb->batch;
++
++	if (*batch) {
++		__tlb_flush_mm(tlb->mm);
++		call_rcu_sched(&(*batch)->rcu, tlb_remove_table_rcu);
++		*batch = NULL;
++	}
++}
++
++void tlb_remove_table(struct mmu_gather *tlb, void *table)
++{
++	struct mmu_table_batch **batch = &tlb->batch;
++
++	if (*batch == NULL) {
++		*batch = (struct mmu_table_batch *)
++			__get_free_page(GFP_NOWAIT | __GFP_NOWARN);
++		if (*batch == NULL) {
++			__tlb_flush_mm(tlb->mm);
++			tlb_remove_table_one(table);
++			return;
++		}
++		(*batch)->nr = 0;
++	}
++	(*batch)->tables[(*batch)->nr++] = table;
++	if ((*batch)->nr == MAX_TABLE_BATCH)
++		tlb_table_flush(tlb);
++}
+ 
+ /*
+  * switch on pgstes for its userspace process (for kvm)
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch
new file mode 100644
index 0000000..ecece35
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0042-serial-PL011-clear-pending-interrupts.patch
@@ -0,0 +1,82 @@
+From 6408483ea69660e6ad8a2a8852edb9cd539cd51d Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Tue, 13 Mar 2012 13:27:23 +0100
+Subject: [PATCH 42/69] serial: PL011: clear pending interrupts
+
+commit 9b96fbacda34079dea0638ee1e92c56286f6114a upstream.
+
+Chanho Min reported that when the boot loader transfers
+control to the kernel, there may be pending interrupts
+causing the UART to lock up in an eternal loop trying to
+pick tokens from the FIFO (since the RX interrupt flag
+indicates there are tokens) while in practice there are
+no tokens - in fact there is only a pending IRQ flag.
+
+This patch address the issue with a combination of two
+patches suggested by Russell King that clears and mask
+all interrupts at probe() and clears any pending error
+and RX interrupts at port startup time.
+
+We suspect the spurious interrupts are a side-effect of
+switching the UART from FIFO to non-FIFO mode.
+
+Cc: Shreshtha Kumar Sahu <shreshthakumar.sahu@stericsson.com>
+Reported-by: Chanho Min <chanho0207@gmail.com>
+Suggested-by: Russell King <linux@arm.linux.org.uk>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+Reviewed-by: Jong-Sung Kim <neidhard.kim@lge.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/serial/amba-pl011.c |   15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
+index 8e00926..dddc3f2 100644
+--- a/drivers/tty/serial/amba-pl011.c
++++ b/drivers/tty/serial/amba-pl011.c
+@@ -1380,6 +1380,10 @@ static int pl011_startup(struct uart_port *port)
+ 
+ 	uap->port.uartclk = clk_get_rate(uap->clk);
+ 
++	/* Clear pending error and receive interrupts */
++	writew(UART011_OEIS | UART011_BEIS | UART011_PEIS | UART011_FEIS |
++	       UART011_RTIS | UART011_RXIS, uap->port.membase + UART011_ICR);
++
+ 	/*
+ 	 * Allocate the IRQ
+ 	 */
+@@ -1414,10 +1418,6 @@ static int pl011_startup(struct uart_port *port)
+ 	cr = UART01x_CR_UARTEN | UART011_CR_RXE | UART011_CR_TXE;
+ 	writew(cr, uap->port.membase + UART011_CR);
+ 
+-	/* Clear pending error interrupts */
+-	writew(UART011_OEIS | UART011_BEIS | UART011_PEIS | UART011_FEIS,
+-	       uap->port.membase + UART011_ICR);
+-
+ 	/*
+ 	 * initialise the old status of the modem signals
+ 	 */
+@@ -1432,6 +1432,9 @@ static int pl011_startup(struct uart_port *port)
+ 	 * as well.
+ 	 */
+ 	spin_lock_irq(&uap->port.lock);
++	/* Clear out any spuriously appearing RX interrupts */
++	 writew(UART011_RTIS | UART011_RXIS,
++		uap->port.membase + UART011_ICR);
+ 	uap->im = UART011_RTIM;
+ 	if (!pl011_dma_rx_running(uap))
+ 		uap->im |= UART011_RXIM;
+@@ -1916,6 +1919,10 @@ static int pl011_probe(struct amba_device *dev, const struct amba_id *id)
+ 		goto unmap;
+ 	}
+ 
++	/* Ensure interrupts from this UART are masked and cleared */
++	writew(0, uap->port.membase + UART011_IMSC);
++	writew(0xffff, uap->port.membase + UART011_ICR);
++
+ 	uap->vendor = vendor;
+ 	uap->lcrh_rx = vendor->lcrh_rx;
+ 	uap->lcrh_tx = vendor->lcrh_tx;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch
new file mode 100644
index 0000000..bc47af0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0043-serial-PL011-move-interrupt-clearing.patch
@@ -0,0 +1,55 @@
+From 02822f5ea52d9c9c4d197187b1a2553fe70f106c Mon Sep 17 00:00:00 2001
+From: Linus Walleij <linus.walleij@linaro.org>
+Date: Wed, 21 Mar 2012 20:15:18 +0100
+Subject: [PATCH 43/69] serial: PL011: move interrupt clearing
+
+commit c3d8b76f61586714cdc5f219ba45592a54caaa55 upstream.
+
+Commit 360f748b204275229f8398cb2f9f53955db1503b
+"serial: PL011: clear pending interrupts"
+attempts to clear interrupts by writing to a
+yet-unassigned memory address. This fixes the issue.
+
+The breaking patch is marked for stable so should be
+carried along with the other patch.
+
+Cc: Shreshtha Kumar Sahu <shreshthakumar.sahu@stericsson.com>
+Cc: Russell King <linux@arm.linux.org.uk>
+Cc: Nicolas Pitre <nico@fluxnic.net>
+Reported-by: Viresh Kumar <viresh.kumar@st.com>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+Tested-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/serial/amba-pl011.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/tty/serial/amba-pl011.c b/drivers/tty/serial/amba-pl011.c
+index dddc3f2..6da8cf8 100644
+--- a/drivers/tty/serial/amba-pl011.c
++++ b/drivers/tty/serial/amba-pl011.c
+@@ -1919,10 +1919,6 @@ static int pl011_probe(struct amba_device *dev, const struct amba_id *id)
+ 		goto unmap;
+ 	}
+ 
+-	/* Ensure interrupts from this UART are masked and cleared */
+-	writew(0, uap->port.membase + UART011_IMSC);
+-	writew(0xffff, uap->port.membase + UART011_ICR);
+-
+ 	uap->vendor = vendor;
+ 	uap->lcrh_rx = vendor->lcrh_rx;
+ 	uap->lcrh_tx = vendor->lcrh_tx;
+@@ -1939,6 +1935,10 @@ static int pl011_probe(struct amba_device *dev, const struct amba_id *id)
+ 	uap->port.line = i;
+ 	pl011_dma_probe(uap);
+ 
++	/* Ensure interrupts from this UART are masked and cleared */
++	writew(0, uap->port.membase + UART011_IMSC);
++	writew(0xffff, uap->port.membase + UART011_ICR);
++
+ 	snprintf(uap->type, sizeof(uap->type), "PL011 rev%u", amba_rev(dev));
+ 
+ 	amba_ports[i] = uap;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
new file mode 100644
index 0000000..b2e4de6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch
@@ -0,0 +1,41 @@
+From 0acc120610478e7f4b80e0d1379bd927c90eaff4 Mon Sep 17 00:00:00 2001
+From: Eric Paris <eparis@redhat.com>
+Date: Tue, 17 Apr 2012 16:26:54 -0400
+Subject: [PATCH 44/69] fcaps: clear the same personality flags as suid when
+ fcaps are used
+
+commit d52fc5dde171f030170a6cb78034d166b13c9445 upstream.
+
+If a process increases permissions using fcaps all of the dangerous
+personality flags which are cleared for suid apps should also be cleared.
+Thus programs given priviledge with fcaps will continue to have address space
+randomization enabled even if the parent tried to disable it to make it
+easier to attack.
+
+Signed-off-by: Eric Paris <eparis@redhat.com>
+Reviewed-by: Serge Hallyn <serge.hallyn@canonical.com>
+Signed-off-by: James Morris <james.l.morris@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ security/commoncap.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/security/commoncap.c b/security/commoncap.c
+index ee4f848..0aee106 100644
+--- a/security/commoncap.c
++++ b/security/commoncap.c
+@@ -514,6 +514,11 @@ int cap_bprm_set_creds(struct linux_binprm *bprm)
+ 	}
+ skip:
+ 
++	/* if we have fs caps, clear dangerous personality flags */
++	if (!cap_issubset(new->cap_permitted, old->cap_permitted))
++		bprm->per_clear |= PER_CLEAR_ON_SETID;
++
++
+ 	/* Don't let someone trace a set[ug]id/setpcap binary with the revised
+ 	 * credentials unless they have the appropriate permit
+ 	 */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch
new file mode 100644
index 0000000..618a68a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch
@@ -0,0 +1,56 @@
+From ffdc1eb0a3c60111912b7bfe80c3a9358edd6b42 Mon Sep 17 00:00:00 2001
+From: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
+Date: Thu, 15 Mar 2012 06:08:04 +0530
+Subject: [PATCH 45/69] ath9k: fix max noise floor threshold
+
+commit 2ee0a07028d2cde6e131b73f029dae2b93c50f3a upstream.
+
+Currently the maximum noise floor limit is set as too high (-60dB). The
+assumption of having a higher threshold limit is that it would help
+de-sensitize the receiver (reduce phy errors) from continuous
+interference. But when we have a bursty interference where there are
+collisions and then free air time and if the receiver is desensitized too
+much, it will miss the normal packets too. Lets make use of chips
+specific min, nom and max limits always. This patch helps to improve the
+connection stability in congested networks.
+
+Cc: Paul Stewart <pstew@google.com>
+Tested-by: Gary Morain <gmorain@google.com>
+Signed-off-by: Madhan Jaganathan <madhanj@qca.qualcomm.com>
+Signed-off-by: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.0/3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/ath/ath9k/calib.c |    5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/calib.c b/drivers/net/wireless/ath/ath9k/calib.c
+index 8ddef3e..d771de5 100644
+--- a/drivers/net/wireless/ath/ath9k/calib.c
++++ b/drivers/net/wireless/ath/ath9k/calib.c
+@@ -20,7 +20,6 @@
+ 
+ /* Common calibration code */
+ 
+-#define ATH9K_NF_TOO_HIGH	-60
+ 
+ static int16_t ath9k_hw_get_nf_hist_mid(int16_t *nfCalBuffer)
+ {
+@@ -348,10 +347,10 @@ static void ath9k_hw_nf_sanitize(struct ath_hw *ah, s16 *nf)
+ 			"NF calibrated [%s] [chain %d] is %d\n",
+ 			(i >= 3 ? "ext" : "ctl"), i % 3, nf[i]);
+ 
+-		if (nf[i] > ATH9K_NF_TOO_HIGH) {
++		if (nf[i] > limit->max) {
+ 			ath_dbg(common, ATH_DBG_CALIBRATE,
+ 				"NF[%d] (%d) > MAX (%d), correcting to MAX\n",
+-				i, nf[i], ATH9K_NF_TOO_HIGH);
++				i, nf[i], limit->max);
+ 			nf[i] = limit->max;
+ 		} else if (nf[i] < limit->min) {
+ 			ath_dbg(common, ATH_DBG_CALIBRATE,
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch
new file mode 100644
index 0000000..2fe2c5e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0046-xhci-Fix-register-save-restore-order.patch
@@ -0,0 +1,62 @@
+From d4e6ce02459552a127973c9c204509136b940671 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Fri, 16 Mar 2012 13:19:35 -0700
+Subject: [PATCH 46/69] xhci: Fix register save/restore order.
+
+commit c7713e736526d8c9f6f87716fb90562a8ffaff2c upstream.
+
+The xHCI 1.0 spec errata released on June 13, 2011, changes the ordering
+that the xHCI registers are saved and restored in.  It moves the
+interrupt pending (IMAN) and interrupt control (IMOD) registers to be
+saved and restored last.  I believe that's because the host controller
+may attempt to fetch the event ring table when interrupts are
+re-enabled.  Therefore we need to restore the event ring registers
+before we re-enable interrupts.
+
+This should be backported to kernels as old as 2.6.37, that contain the
+commit 5535b1d5f8885695c6ded783c692e3c0d0eda8ca "USB: xHCI: PCI power
+management implementation"
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Tested-by: Elric Fu <elricfu1@gmail.com>
+Cc: Andiry Xu <andiry.xu@amd.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
+index 4d44713..4c00606 100644
+--- a/drivers/usb/host/xhci.c
++++ b/drivers/usb/host/xhci.c
+@@ -664,11 +664,11 @@ static void xhci_save_registers(struct xhci_hcd *xhci)
+ 	xhci->s3.dev_nt = xhci_readl(xhci, &xhci->op_regs->dev_notification);
+ 	xhci->s3.dcbaa_ptr = xhci_read_64(xhci, &xhci->op_regs->dcbaa_ptr);
+ 	xhci->s3.config_reg = xhci_readl(xhci, &xhci->op_regs->config_reg);
+-	xhci->s3.irq_pending = xhci_readl(xhci, &xhci->ir_set->irq_pending);
+-	xhci->s3.irq_control = xhci_readl(xhci, &xhci->ir_set->irq_control);
+ 	xhci->s3.erst_size = xhci_readl(xhci, &xhci->ir_set->erst_size);
+ 	xhci->s3.erst_base = xhci_read_64(xhci, &xhci->ir_set->erst_base);
+ 	xhci->s3.erst_dequeue = xhci_read_64(xhci, &xhci->ir_set->erst_dequeue);
++	xhci->s3.irq_pending = xhci_readl(xhci, &xhci->ir_set->irq_pending);
++	xhci->s3.irq_control = xhci_readl(xhci, &xhci->ir_set->irq_control);
+ }
+ 
+ static void xhci_restore_registers(struct xhci_hcd *xhci)
+@@ -677,11 +677,11 @@ static void xhci_restore_registers(struct xhci_hcd *xhci)
+ 	xhci_writel(xhci, xhci->s3.dev_nt, &xhci->op_regs->dev_notification);
+ 	xhci_write_64(xhci, xhci->s3.dcbaa_ptr, &xhci->op_regs->dcbaa_ptr);
+ 	xhci_writel(xhci, xhci->s3.config_reg, &xhci->op_regs->config_reg);
+-	xhci_writel(xhci, xhci->s3.irq_pending, &xhci->ir_set->irq_pending);
+-	xhci_writel(xhci, xhci->s3.irq_control, &xhci->ir_set->irq_control);
+ 	xhci_writel(xhci, xhci->s3.erst_size, &xhci->ir_set->erst_size);
+ 	xhci_write_64(xhci, xhci->s3.erst_base, &xhci->ir_set->erst_base);
+ 	xhci_write_64(xhci, xhci->s3.erst_dequeue, &xhci->ir_set->erst_dequeue);
++	xhci_writel(xhci, xhci->s3.irq_pending, &xhci->ir_set->irq_pending);
++	xhci_writel(xhci, xhci->s3.irq_control, &xhci->ir_set->irq_control);
+ }
+ 
+ static void xhci_set_cmd_ring_deq(struct xhci_hcd *xhci)
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
new file mode 100644
index 0000000..4e3ff35
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch
@@ -0,0 +1,133 @@
+From 1eb32b0dc5c5286345e96240894af14de856e515 Mon Sep 17 00:00:00 2001
+From: Johan Hovold <jhovold@gmail.com>
+Date: Thu, 15 Mar 2012 14:48:41 +0100
+Subject: [PATCH 47/69] Bluetooth: hci_core: fix NULL-pointer dereference at
+ unregister
+
+commit 94324962066231a938564bebad0f941cd2d06bb2 upstream.
+
+Make sure hci_dev_open returns immediately if hci_dev_unregister has
+been called.
+
+This fixes a race between hci_dev_open and hci_dev_unregister which can
+lead to a NULL-pointer dereference.
+
+Bug is 100% reproducible using hciattach and a disconnected serial port:
+
+0. # hciattach -n /dev/ttyO1 any noflow
+
+1. hci_dev_open called from hci_power_on grabs req lock
+2. hci_init_req executes but device fails to initialise (times out
+   eventually)
+3. hci_dev_open is called from hci_sock_ioctl and sleeps on req lock
+4. hci_uart_tty_close calls hci_dev_unregister and sleeps on req lock in
+   hci_dev_do_close
+5. hci_dev_open (1) releases req lock
+6. hci_dev_do_close grabs req lock and returns as device is not up
+7. hci_dev_unregister sleeps in destroy_workqueue
+8. hci_dev_open (3) grabs req lock, calls hci_init_req and eventually sleeps
+9. hci_dev_unregister finishes, while hci_dev_open is still running...
+
+[   79.627136] INFO: trying to register non-static key.
+[   79.632354] the code is fine but needs lockdep annotation.
+[   79.638122] turning off the locking correctness validator.
+[   79.643920] [<c00188bc>] (unwind_backtrace+0x0/0xf8) from [<c00729c4>] (__lock_acquire+0x1590/0x1ab0)
+[   79.653594] [<c00729c4>] (__lock_acquire+0x1590/0x1ab0) from [<c00733f8>] (lock_acquire+0x9c/0x128)
+[   79.663085] [<c00733f8>] (lock_acquire+0x9c/0x128) from [<c0040a88>] (run_timer_softirq+0x150/0x3ac)
+[   79.672668] [<c0040a88>] (run_timer_softirq+0x150/0x3ac) from [<c003a3b8>] (__do_softirq+0xd4/0x22c)
+[   79.682281] [<c003a3b8>] (__do_softirq+0xd4/0x22c) from [<c003a924>] (irq_exit+0x8c/0x94)
+[   79.690856] [<c003a924>] (irq_exit+0x8c/0x94) from [<c0013a50>] (handle_IRQ+0x34/0x84)
+[   79.699157] [<c0013a50>] (handle_IRQ+0x34/0x84) from [<c0008530>] (omap3_intc_handle_irq+0x48/0x4c)
+[   79.708648] [<c0008530>] (omap3_intc_handle_irq+0x48/0x4c) from [<c037499c>] (__irq_usr+0x3c/0x60)
+[   79.718048] Exception stack(0xcf281fb0 to 0xcf281ff8)
+[   79.723358] 1fa0:                                     0001e6a0 be8dab00 0001e698 00036698
+[   79.731933] 1fc0: 0002df98 0002df38 0000001f 00000000 b6f234d0 00000000 00000004 00000000
+[   79.740509] 1fe0: 0001e6f8 be8d6aa0 be8dac50 0000aab8 80000010 ffffffff
+[   79.747497] Unable to handle kernel NULL pointer dereference at virtual address 00000000
+[   79.756011] pgd = cf3b4000
+[   79.758850] [00000000] *pgd=8f0c7831, *pte=00000000, *ppte=00000000
+[   79.765502] Internal error: Oops: 80000007 [#1]
+[   79.770294] Modules linked in:
+[   79.773529] CPU: 0    Tainted: G        W     (3.3.0-rc6-00002-gb5d5c87 #421)
+[   79.781066] PC is at 0x0
+[   79.783721] LR is at run_timer_softirq+0x16c/0x3ac
+[   79.788787] pc : [<00000000>]    lr : [<c0040aa4>]    psr: 60000113
+[   79.788787] sp : cf281ee0  ip : 00000000  fp : cf280000
+[   79.800903] r10: 00000004  r9 : 00000100  r8 : b6f234d0
+[   79.806427] r7 : c0519c28  r6 : cf093488  r5 : c0561a00  r4 : 00000000
+[   79.813323] r3 : 00000000  r2 : c054eee0  r1 : 00000001  r0 : 00000000
+[   79.820190] Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment user
+[   79.827728] Control: 10c5387d  Table: 8f3b4019  DAC: 00000015
+[   79.833801] Process gpsd (pid: 1265, stack limit = 0xcf2802e8)
+[   79.839965] Stack: (0xcf281ee0 to 0xcf282000)
+[   79.844573] 1ee0: 00000002 00000000 c0040a24 00000000 00000002 cf281f08 00200200 00000000
+[   79.853210] 1f00: 00000000 cf281f18 cf281f08 00000000 00000000 00000000 cf281f18 cf281f18
+[   79.861816] 1f20: 00000000 00000001 c056184c 00000000 00000001 b6f234d0 c0561848 00000004
+[   79.870452] 1f40: cf280000 c003a3b8 c051e79c 00000001 00000000 00000100 3fa9e7b8 0000000a
+[   79.879089] 1f60: 00000025 cf280000 00000025 00000000 00000000 b6f234d0 00000000 00000004
+[   79.887756] 1f80: 00000000 c003a924 c053ad38 c0013a50 fa200000 cf281fb0 ffffffff c0008530
+[   79.896362] 1fa0: 0001e6a0 0000aab8 80000010 c037499c 0001e6a0 be8dab00 0001e698 00036698
+[   79.904998] 1fc0: 0002df98 0002df38 0000001f 00000000 b6f234d0 00000000 00000004 00000000
+[   79.913665] 1fe0: 0001e6f8 be8d6aa0 be8dac50 0000aab8 80000010 ffffffff 00fbf700 04ffff00
+[   79.922302] [<c0040aa4>] (run_timer_softirq+0x16c/0x3ac) from [<c003a3b8>] (__do_softirq+0xd4/0x22c)
+[   79.931945] [<c003a3b8>] (__do_softirq+0xd4/0x22c) from [<c003a924>] (irq_exit+0x8c/0x94)
+[   79.940582] [<c003a924>] (irq_exit+0x8c/0x94) from [<c0013a50>] (handle_IRQ+0x34/0x84)
+[   79.948913] [<c0013a50>] (handle_IRQ+0x34/0x84) from [<c0008530>] (omap3_intc_handle_irq+0x48/0x4c)
+[   79.958404] [<c0008530>] (omap3_intc_handle_irq+0x48/0x4c) from [<c037499c>] (__irq_usr+0x3c/0x60)
+[   79.967773] Exception stack(0xcf281fb0 to 0xcf281ff8)
+[   79.973083] 1fa0:                                     0001e6a0 be8dab00 0001e698 00036698
+[   79.981658] 1fc0: 0002df98 0002df38 0000001f 00000000 b6f234d0 00000000 00000004 00000000
+[   79.990234] 1fe0: 0001e6f8 be8d6aa0 be8dac50 0000aab8 80000010 ffffffff
+[   79.997161] Code: bad PC value
+[   80.000396] ---[ end trace 6f6739840475f9ee ]---
+[   80.005279] Kernel panic - not syncing: Fatal exception in interrupt
+
+Signed-off-by: Johan Hovold <jhovold@gmail.com>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/net/bluetooth/hci.h |    1 +
+ net/bluetooth/hci_core.c    |    7 +++++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/net/bluetooth/hci.h b/include/net/bluetooth/hci.h
+index aaf79af..a7e13bf 100644
+--- a/include/net/bluetooth/hci.h
++++ b/include/net/bluetooth/hci.h
+@@ -84,6 +84,7 @@ enum {
+ 	HCI_SERVICE_CACHE,
+ 	HCI_LINK_KEYS,
+ 	HCI_DEBUG_KEYS,
++	HCI_UNREGISTER,
+ 
+ 	HCI_RESET,
+ };
+diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
+index b84458d..857dc88 100644
+--- a/net/bluetooth/hci_core.c
++++ b/net/bluetooth/hci_core.c
+@@ -510,6 +510,11 @@ int hci_dev_open(__u16 dev)
+ 
+ 	hci_req_lock(hdev);
+ 
++	if (test_bit(HCI_UNREGISTER, &hdev->flags)) {
++		ret = -ENODEV;
++		goto done;
++	}
++
+ 	if (hdev->rfkill && rfkill_blocked(hdev->rfkill)) {
+ 		ret = -ERFKILL;
+ 		goto done;
+@@ -1540,6 +1545,8 @@ int hci_unregister_dev(struct hci_dev *hdev)
+ 
+ 	BT_DBG("%p name %s bus %d", hdev, hdev->name, hdev->bus);
+ 
++	set_bit(HCI_UNREGISTER, &hdev->flags);
++
+ 	write_lock_bh(&hci_dev_list_lock);
+ 	list_del(&hdev->list);
+ 	write_unlock_bh(&hci_dev_list_lock);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
new file mode 100644
index 0000000..1f78b92
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch
@@ -0,0 +1,63 @@
+From 02f5e653d3083265e70a5cc00f050b6ec394fb83 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
+Date: Fri, 28 Oct 2011 09:23:32 +0900
+Subject: [PATCH 48/69] pch_gpio: Support new device LAPIS Semiconductor
+ ML7831 IOH
+
+commit 868fea0507308b6548bba7debe5f5c2d5ca47fca upstream.
+
+ML7831 is companion chip for Intel Atom E6xx series.
+
+Signed-off-by: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
+Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpio/Kconfig    |   11 ++++++-----
+ drivers/gpio/gpio-pch.c |    1 +
+ 2 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
+index 8482a23..4e04157 100644
+--- a/drivers/gpio/Kconfig
++++ b/drivers/gpio/Kconfig
+@@ -387,7 +387,7 @@ config GPIO_LANGWELL
+ 	  Say Y here to support Intel Langwell/Penwell GPIO.
+ 
+ config GPIO_PCH
+-	tristate "Intel EG20T PCH / OKI SEMICONDUCTOR ML7223 IOH GPIO"
++	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH(ML7223/ML7831) GPIO"
+ 	depends on PCI && X86
+ 	select GENERIC_IRQ_CHIP
+ 	help
+@@ -395,11 +395,12 @@ config GPIO_PCH
+ 	  which is an IOH(Input/Output Hub) for x86 embedded processor.
+ 	  This driver can access PCH GPIO device.
+ 
+-	  This driver also can be used for OKI SEMICONDUCTOR IOH(Input/
+-	  Output Hub), ML7223.
++	  This driver also can be used for LAPIS Semiconductor IOH(Input/
++	  Output Hub), ML7223 and ML7831.
+ 	  ML7223 IOH is for MP(Media Phone) use.
+-	  ML7223 is companion chip for Intel Atom E6xx series.
+-	  ML7223 is completely compatible for Intel EG20T PCH.
++	  ML7831 IOH is for general purpose use.
++	  ML7223/ML7831 is companion chip for Intel Atom E6xx series.
++	  ML7223/ML7831 is completely compatible for Intel EG20T PCH.
+ 
+ config GPIO_ML_IOH
+ 	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
+diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
+index a6008e1..eb574f2 100644
+--- a/drivers/gpio/gpio-pch.c
++++ b/drivers/gpio/gpio-pch.c
+@@ -524,6 +524,7 @@ static DEFINE_PCI_DEVICE_TABLE(pch_gpio_pcidev_id) = {
+ 	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x8803) },
+ 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8014) },
+ 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8043) },
++	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x8803) },
+ 	{ 0, }
+ };
+ MODULE_DEVICE_TABLE(pci, pch_gpio_pcidev_id);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
new file mode 100644
index 0000000..23824a7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch
@@ -0,0 +1,35 @@
+From 9fb55b40aa4e085f86bfce237a482b13847fdc01 Mon Sep 17 00:00:00 2001
+From: Axel Lin <axel.lin@gmail.com>
+Date: Wed, 1 Feb 2012 10:51:53 +0800
+Subject: [PATCH 49/69] gpio: Add missing spin_lock_init in gpio-pch driver
+
+commit d166370ad86b33b1111af3a0cdd7de94e03789a6 upstream.
+
+This bug was introduced by commit d568a681
+"gpio-pch: add spinlock in suspend/resume processing"
+which adds a spinlock to struct pch_gpio but never init the spinlock.
+
+Reported-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Axel Lin <axel.lin@gmail.com>
+Acked-by: Linus Walleij <linus.walleij@linaro.org>
+Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpio/gpio-pch.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
+index eb574f2..779ff70 100644
+--- a/drivers/gpio/gpio-pch.c
++++ b/drivers/gpio/gpio-pch.c
+@@ -392,6 +392,7 @@ static int __devinit pch_gpio_probe(struct pci_dev *pdev,
+ 	chip->reg = chip->base;
+ 	pci_set_drvdata(pdev, chip);
+ 	mutex_init(&chip->lock);
++	spin_lock_init(&chip->spinlock);
+ 	pch_gpio_setup(chip);
+ 	ret = gpiochip_add(&chip->gpio);
+ 	if (ret) {
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch
new file mode 100644
index 0000000..6588e3c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch
@@ -0,0 +1,42 @@
+From 51d31aff64b1ebc13cab146aea7e34e0b9deec9a Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Thu, 12 Jan 2012 11:27:05 +0900
+Subject: [PATCH 50/69] usb: gadget: pch_udc: Fix disconnect issue
+
+commit c50a3bff0edb0acd49d8033a12ea4668e09a31ad upstream.
+
+ISSUE:
+When the driver notifies a gadget of a disconnect event, a system
+rarely freezes.
+
+CAUSE:
+When the driver calls dev->driver->disconnect(), it is not calling
+spin_unlock().
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/pch_udc.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
+index dd2313c..521e995 100644
+--- a/drivers/usb/gadget/pch_udc.c
++++ b/drivers/usb/gadget/pch_udc.c
+@@ -2335,8 +2335,11 @@ static void pch_udc_svc_ur_interrupt(struct pch_udc_dev *dev)
+ 		/* Complete request queue */
+ 		empty_req_queue(ep);
+ 	}
+-	if (dev->driver && dev->driver->disconnect)
++	if (dev->driver && dev->driver->disconnect) {
++		spin_unlock(&dev->lock);
+ 		dev->driver->disconnect(&dev->gadget);
++		spin_lock(&dev->lock);
++	}
+ }
+ 
+ /**
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch
new file mode 100644
index 0000000..decab7b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch
@@ -0,0 +1,42 @@
+From 8fd36443bed52de1ac27dade568e7a3d94158d13 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Thu, 12 Jan 2012 11:27:06 +0900
+Subject: [PATCH 51/69] usb: gadget: pch_udc: Fix wrong return value
+
+commit c802672cd36cd063bfd54d54c8c34825ab5b2357 upstream.
+
+ISSUE:
+If the return value of pch_udc_pcd_init() is False, the return value of
+this function is unsettled.
+Since pch_udc_pcd_init() always returns 0, there is not actually the issue.
+
+CAUSE:
+If pch_udc_pcd_init() is True, the variable, retval, is not set for an
+appropriate value.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/pch_udc.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
+index 521e995..a9a7d8a 100644
+--- a/drivers/usb/gadget/pch_udc.c
++++ b/drivers/usb/gadget/pch_udc.c
+@@ -2915,8 +2915,10 @@ static int pch_udc_probe(struct pci_dev *pdev,
+ 	}
+ 	pch_udc = dev;
+ 	/* initialize the hardware */
+-	if (pch_udc_pcd_init(dev))
++	if (pch_udc_pcd_init(dev)) {
++		retval = -ENODEV;
+ 		goto finished;
++	}
+ 	if (request_irq(pdev->irq, pch_udc_isr, IRQF_SHARED, KBUILD_MODNAME,
+ 			dev)) {
+ 		dev_err(&pdev->dev, "%s: request_irq(%d) fail\n", __func__,
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
new file mode 100644
index 0000000..fda0ca9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch
@@ -0,0 +1,45 @@
+From c0aaf320ddf17688ad75ab9f024f789b4cb89365 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Thu, 12 Jan 2012 11:27:07 +0900
+Subject: [PATCH 52/69] usb: gadget: pch_udc: Fix USB suspend issue
+
+commit 84566abba058b2aae8d603dfa90b5a3778a6714f upstream.
+
+ISSUE:
+After USB Suspend, a system rarely freezes.
+
+CAUSE:
+When USB Suspend occurred, the driver is not notifying
+a gadget of the event.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/pch_udc.c |    9 ++++++++-
+ 1 file changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
+index a9a7d8a..3ab799c 100644
+--- a/drivers/usb/gadget/pch_udc.c
++++ b/drivers/usb/gadget/pch_udc.c
+@@ -2475,8 +2475,15 @@ static void pch_udc_dev_isr(struct pch_udc_dev *dev, u32 dev_intr)
+ 	if (dev_intr & UDC_DEVINT_SC)
+ 		pch_udc_svc_cfg_interrupt(dev);
+ 	/* USB Suspend interrupt */
+-	if (dev_intr & UDC_DEVINT_US)
++	if (dev_intr & UDC_DEVINT_US) {
++		if (dev->driver
++			&& dev->driver->suspend) {
++			spin_unlock(&dev->lock);
++			dev->driver->suspend(&dev->gadget);
++			spin_lock(&dev->lock);
++		}
+ 		dev_dbg(&dev->pdev->dev, "USB_SUSPEND\n");
++	}
+ 	/* Clear the SOF interrupt, if enabled */
+ 	if (dev_intr & UDC_DEVINT_SOF)
+ 		dev_dbg(&dev->pdev->dev, "SOF\n");
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
new file mode 100644
index 0000000..379b748
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch
@@ -0,0 +1,153 @@
+From 9200ef1704e7415a883be5ff751f486da1df7212 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Thu, 12 Jan 2012 11:27:08 +0900
+Subject: [PATCH 53/69] usb: gadget: pch_udc: Fix usb/gadget/pch_udc: Fix
+ ether gadget connect/disconnect issue
+
+commit 1c575d2d2e3ff2a7cb3c2e2165064199cfd8ad32 upstream.
+
+ISSUE:
+After a USB cable is connect/disconnected, the system rarely freezes.
+
+CAUSE:
+Since the USB device controller cannot know to disconnect the USB cable, when
+it is used without detecting VBUS by GPIO, the UDC driver does not notify to
+USB Gadget.
+
+Since USB Gadget cannot know to disconnect, a false setting occurred when the
+USB cable is connected/disconnect repeatedly.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/pch_udc.c |   70 +++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 66 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
+index 3ab799c..f232e65 100644
+--- a/drivers/usb/gadget/pch_udc.c
++++ b/drivers/usb/gadget/pch_udc.c
+@@ -311,6 +311,7 @@ struct pch_udc_ep {
+  * @registered:		driver regsitered with system
+  * @suspended:		driver in suspended state
+  * @connected:		gadget driver associated
++ * @vbus_session:	required vbus_session state
+  * @set_cfg_not_acked:	pending acknowledgement 4 setup
+  * @waiting_zlp_ack:	pending acknowledgement 4 ZLP
+  * @data_requests:	DMA pool for data requests
+@@ -337,6 +338,7 @@ struct pch_udc_dev {
+ 			registered:1,
+ 			suspended:1,
+ 			connected:1,
++			vbus_session:1,
+ 			set_cfg_not_acked:1,
+ 			waiting_zlp_ack:1;
+ 	struct pci_pool		*data_requests;
+@@ -554,6 +556,31 @@ static void pch_udc_clear_disconnect(struct pch_udc_dev *dev)
+ }
+ 
+ /**
++ * pch_udc_reconnect() - This API initializes usb device controller,
++ *						and clear the disconnect status.
++ * @dev:		Reference to pch_udc_regs structure
++ */
++static void pch_udc_init(struct pch_udc_dev *dev);
++static void pch_udc_reconnect(struct pch_udc_dev *dev)
++{
++	pch_udc_init(dev);
++
++	/* enable device interrupts */
++	/* pch_udc_enable_interrupts() */
++	pch_udc_bit_clr(dev, UDC_DEVIRQMSK_ADDR,
++			UDC_DEVINT_UR | UDC_DEVINT_US |
++			UDC_DEVINT_ENUM |
++			UDC_DEVINT_SI | UDC_DEVINT_SC);
++
++	/* Clear the disconnect */
++	pch_udc_bit_set(dev, UDC_DEVCTL_ADDR, UDC_DEVCTL_RES);
++	pch_udc_bit_clr(dev, UDC_DEVCTL_ADDR, UDC_DEVCTL_SD);
++	mdelay(1);
++	/* Resume USB signalling */
++	pch_udc_bit_clr(dev, UDC_DEVCTL_ADDR, UDC_DEVCTL_RES);
++}
++
++/**
+  * pch_udc_vbus_session() - set or clearr the disconnect status.
+  * @dev:	Reference to pch_udc_regs structure
+  * @is_active:	Parameter specifying the action
+@@ -563,10 +590,18 @@ static void pch_udc_clear_disconnect(struct pch_udc_dev *dev)
+ static inline void pch_udc_vbus_session(struct pch_udc_dev *dev,
+ 					  int is_active)
+ {
+-	if (is_active)
+-		pch_udc_clear_disconnect(dev);
+-	else
++	if (is_active) {
++		pch_udc_reconnect(dev);
++		dev->vbus_session = 1;
++	} else {
++		if (dev->driver && dev->driver->disconnect) {
++			spin_unlock(&dev->lock);
++			dev->driver->disconnect(&dev->gadget);
++			spin_lock(&dev->lock);
++		}
+ 		pch_udc_set_disconnect(dev);
++		dev->vbus_session = 0;
++	}
+ }
+ 
+ /**
+@@ -1126,7 +1161,17 @@ static int pch_udc_pcd_pullup(struct usb_gadget *gadget, int is_on)
+ 	if (!gadget)
+ 		return -EINVAL;
+ 	dev = container_of(gadget, struct pch_udc_dev, gadget);
+-	pch_udc_vbus_session(dev, is_on);
++	if (is_on) {
++		pch_udc_reconnect(dev);
++	} else {
++		if (dev->driver && dev->driver->disconnect) {
++			spin_unlock(&dev->lock);
++			dev->driver->disconnect(&dev->gadget);
++			spin_lock(&dev->lock);
++		}
++		pch_udc_set_disconnect(dev);
++	}
++
+ 	return 0;
+ }
+ 
+@@ -2482,6 +2527,15 @@ static void pch_udc_dev_isr(struct pch_udc_dev *dev, u32 dev_intr)
+ 			dev->driver->suspend(&dev->gadget);
+ 			spin_lock(&dev->lock);
+ 		}
++
++		if (dev->vbus_session == 0) {
++			if (dev->driver && dev->driver->disconnect) {
++				spin_unlock(&dev->lock);
++				dev->driver->disconnect(&dev->gadget);
++				spin_lock(&dev->lock);
++			}
++			pch_udc_reconnect(dev);
++		}
+ 		dev_dbg(&dev->pdev->dev, "USB_SUSPEND\n");
+ 	}
+ 	/* Clear the SOF interrupt, if enabled */
+@@ -2509,6 +2563,14 @@ static irqreturn_t pch_udc_isr(int irq, void *pdev)
+ 	dev_intr = pch_udc_read_device_interrupts(dev);
+ 	ep_intr = pch_udc_read_ep_interrupts(dev);
+ 
++	/* For a hot plug, this find that the controller is hung up. */
++	if (dev_intr == ep_intr)
++		if (dev_intr == pch_udc_readl(dev, UDC_DEVCFG_ADDR)) {
++			dev_dbg(&dev->pdev->dev, "UDC: Hung up\n");
++			/* The controller is reset */
++			pch_udc_writel(dev, UDC_SRST, UDC_SRST_ADDR);
++			return IRQ_HANDLED;
++		}
+ 	if (dev_intr)
+ 		/* Clear device interrupts */
+ 		pch_udc_write_device_interrupts(dev, dev_intr);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
new file mode 100644
index 0000000..3322abf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch
@@ -0,0 +1,55 @@
+From 841c06ccc583055a42b0546efb5e6b448f26d5fd Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Thu, 12 Jan 2012 11:27:09 +0900
+Subject: [PATCH 54/69] usb: gadget: pch_udc: Reduce redundant interrupt
+
+commit 833310402c54ad9b676b465fc53ad276b13d36be upstream.
+
+ISSUE:
+USB Suspend interrupts occur frequently.
+
+CAUSE:
+When it is called pch_udc_reconnect() in USB Suspend, it repeats reset and
+Suspend.
+
+SOLUTION:
+pch_udc_reconnect() does not enable all interrupts.  When an enumeration event
+occurred the driver enables all interrupts.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/pch_udc.c |    9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/gadget/pch_udc.c b/drivers/usb/gadget/pch_udc.c
+index f232e65..870897ac 100644
+--- a/drivers/usb/gadget/pch_udc.c
++++ b/drivers/usb/gadget/pch_udc.c
+@@ -568,9 +568,7 @@ static void pch_udc_reconnect(struct pch_udc_dev *dev)
+ 	/* enable device interrupts */
+ 	/* pch_udc_enable_interrupts() */
+ 	pch_udc_bit_clr(dev, UDC_DEVIRQMSK_ADDR,
+-			UDC_DEVINT_UR | UDC_DEVINT_US |
+-			UDC_DEVINT_ENUM |
+-			UDC_DEVINT_SI | UDC_DEVINT_SC);
++			UDC_DEVINT_UR | UDC_DEVINT_ENUM);
+ 
+ 	/* Clear the disconnect */
+ 	pch_udc_bit_set(dev, UDC_DEVCTL_ADDR, UDC_DEVCTL_RES);
+@@ -2419,6 +2417,11 @@ static void pch_udc_svc_enum_interrupt(struct pch_udc_dev *dev)
+ 	pch_udc_set_dma(dev, DMA_DIR_TX);
+ 	pch_udc_set_dma(dev, DMA_DIR_RX);
+ 	pch_udc_ep_set_rrdy(&(dev->ep[UDC_EP0OUT_IDX]));
++
++	/* enable device interrupts */
++	pch_udc_enable_interrupts(dev, UDC_DEVINT_UR | UDC_DEVINT_US |
++					UDC_DEVINT_ES | UDC_DEVINT_ENUM |
++					UDC_DEVINT_SI | UDC_DEVINT_SC);
+ }
+ 
+ /**
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
new file mode 100644
index 0000000..996c5fd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch
@@ -0,0 +1,82 @@
+From 0584e8b8127ffeb0de3d56313113727fab87aff5 Mon Sep 17 00:00:00 2001
+From: Lin Ming <ming.m.lin@intel.com>
+Date: Mon, 28 Nov 2011 09:46:02 +0800
+Subject: [PATCH 55/69] ACPICA: Fix to allow region arguments to reference
+ other scopes
+
+commit 8931d9ea78848b073bf299594f148b83abde4a5e upstream.
+
+Allow referenced objects to be in a different scope.
+
+http://www.acpica.org/bugzilla/show_bug.cgi?id=937
+http://marc.info/?l=linux-acpi&m=131636632718222&w=2
+
+ACPI Error: [RAMB] Namespace lookup failure, AE_NOT_FOUND (20110112/psargs-359)
+ACPI Exception: AE_NOT_FOUND, Could not execute arguments for [RAMW] (Region) (20110112/nsinit-349)
+
+    Scope (_SB)
+    {
+        Name (RAMB, 0xDF5A1018)
+        OperationRegion (\RAMW, SystemMemory, RAMB, 0x00010000)
+    }
+
+For above ASL code, we need to save scope node(\_SB) to lookup
+the argument node(\_SB.RAMB).
+
+Reported-by: Jim Green <student.northwestern@gmail.com>
+Signed-off-by: Lin Ming <ming.m.lin@intel.com>
+Signed-off-by: Bob Moore <robert.moore@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Cc: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/acpi/acpica/acobject.h |    1 +
+ drivers/acpi/acpica/dsargs.c   |    2 +-
+ drivers/acpi/acpica/excreate.c |    6 ++++++
+ 3 files changed, 8 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/acpi/acpica/acobject.h b/drivers/acpi/acpica/acobject.h
+index 1055769..6d276c2 100644
+--- a/drivers/acpi/acpica/acobject.h
++++ b/drivers/acpi/acpica/acobject.h
+@@ -358,6 +358,7 @@ typedef enum {
+  */
+ struct acpi_object_extra {
+ 	ACPI_OBJECT_COMMON_HEADER struct acpi_namespace_node *method_REG;	/* _REG method for this region (if any) */
++	struct acpi_namespace_node *scope_node;
+ 	void *region_context;	/* Region-specific data */
+ 	u8 *aml_start;
+ 	u32 aml_length;
+diff --git a/drivers/acpi/acpica/dsargs.c b/drivers/acpi/acpica/dsargs.c
+index 42163d8..d69e4a5 100644
+--- a/drivers/acpi/acpica/dsargs.c
++++ b/drivers/acpi/acpica/dsargs.c
+@@ -384,7 +384,7 @@ acpi_status acpi_ds_get_region_arguments(union acpi_operand_object *obj_desc)
+ 
+ 	/* Execute the argument AML */
+ 
+-	status = acpi_ds_execute_arguments(node, node->parent,
++	status = acpi_ds_execute_arguments(node, extra_desc->extra.scope_node,
+ 					   extra_desc->extra.aml_length,
+ 					   extra_desc->extra.aml_start);
+ 	if (ACPI_FAILURE(status)) {
+diff --git a/drivers/acpi/acpica/excreate.c b/drivers/acpi/acpica/excreate.c
+index 110711a..8a06dc5 100644
+--- a/drivers/acpi/acpica/excreate.c
++++ b/drivers/acpi/acpica/excreate.c
+@@ -330,6 +330,12 @@ acpi_ex_create_region(u8 * aml_start,
+ 	region_obj2 = obj_desc->common.next_object;
+ 	region_obj2->extra.aml_start = aml_start;
+ 	region_obj2->extra.aml_length = aml_length;
++	if (walk_state->scope_info) {
++		region_obj2->extra.scope_node =
++		    walk_state->scope_info->scope.node;
++	} else {
++		region_obj2->extra.scope_node = node;
++	}
+ 
+ 	/* Init the region from the operands */
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch
new file mode 100644
index 0000000..e40edbe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch
@@ -0,0 +1,37 @@
+From c44baf116ced749a5017ab4f36a808c4aad7c39c Mon Sep 17 00:00:00 2001
+From: Jonghwan Choi <jhbird.choi@samsung.com>
+Date: Wed, 18 Apr 2012 17:23:04 -0400
+Subject: [PATCH 56/69] security: fix compile error in commoncap.c
+
+commit 51b79bee627d526199b2f6a6bef8ee0c0739b6d1 upstream.
+
+Add missing "personality.h"
+security/commoncap.c: In function 'cap_bprm_set_creds':
+security/commoncap.c:510: error: 'PER_CLEAR_ON_SETID' undeclared (first use in this function)
+security/commoncap.c:510: error: (Each undeclared identifier is reported only once
+security/commoncap.c:510: error: for each function it appears in.)
+
+Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
+Acked-by: Serge Hallyn <serge.hallyn@canonical.com>
+Signed-off-by: James Morris <james.l.morris@oracle.com>
+Cc: Eric Paris <eparis@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ security/commoncap.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/security/commoncap.c b/security/commoncap.c
+index 0aee106..12440ee 100644
+--- a/security/commoncap.c
++++ b/security/commoncap.c
+@@ -28,6 +28,7 @@
+ #include <linux/prctl.h>
+ #include <linux/securebits.h>
+ #include <linux/user_namespace.h>
++#include <linux/personality.h>
+ 
+ /*
+  * If a non-root user executes a setuid-root binary in
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
new file mode 100644
index 0000000..0b69021
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch
@@ -0,0 +1,81 @@
+From 56bfb17ce9aba57b7bd205d7828d4f3d9935276e Mon Sep 17 00:00:00 2001
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Mon, 16 Jan 2012 09:50:19 +0000
+Subject: [PATCH 57/69] pch_gbe: Do not abort probe on bad MAC
+
+commit 2b53d07891630dead46d65c8f896955fd3ae0302 upstream.
+
+If the MAC is invalid or not implemented, do not abort the probe. Issue
+a warning and prevent bringing the interface up until a MAC is set manually
+(via ifconfig $IFACE hw ether $MAC).
+
+Tested on two platforms, one with a valid MAC, the other without a MAC. The real
+MAC is used if present, the interface fails to come up until the MAC is set on
+the other. They successfully get an IP over DHCP and pass a simple ping and
+login over ssh test.
+
+This is meant to allow the Inforce SYS940X development board:
+http://www.inforcecomputing.com/SYS940X_ECX.html
+(and others suffering from a missing MAC) to work with the mainline kernel.
+Without this patch, the probe will fail and the interface will not be created,
+preventing the user from configuring the MAC manually.
+
+This does not make any attempt to address a missing or invalid MAC for the
+pch_phub driver.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+CC: Arjan van de Ven <arjan@linux.intel.com>
+CC: Alan Cox <alan@linux.intel.com>
+CC: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+CC: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+CC: "David S. Miller" <davem@davemloft.net>
+CC: Paul Gortmaker <paul.gortmaker@windriver.com>
+CC: Jon Mason <jdmason@kudzu.us>
+CC: Mark Brown <broonie@opensource.wolfsonmicro.com>
+CC: David Laight <David.Laight@ACULAB.COM>
+CC: Joe Perches <joe@perches.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ .../net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c   |   17 ++++++++++++++---
+ 1 file changed, 14 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+index 48406ca..43c7b25 100644
+--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
++++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_main.c
+@@ -1745,6 +1745,12 @@ int pch_gbe_up(struct pch_gbe_adapter *adapter)
+ 	struct pch_gbe_rx_ring *rx_ring = adapter->rx_ring;
+ 	int err;
+ 
++	/* Ensure we have a valid MAC */
++	if (!is_valid_ether_addr(adapter->hw.mac.addr)) {
++		pr_err("Error: Invalid MAC address\n");
++		return -EINVAL;
++	}
++
+ 	/* hardware has been reset, we need to reload some things */
+ 	pch_gbe_set_multi(netdev);
+ 
+@@ -2467,9 +2473,14 @@ static int pch_gbe_probe(struct pci_dev *pdev,
+ 
+ 	memcpy(netdev->dev_addr, adapter->hw.mac.addr, netdev->addr_len);
+ 	if (!is_valid_ether_addr(netdev->dev_addr)) {
+-		dev_err(&pdev->dev, "Invalid MAC Address\n");
+-		ret = -EIO;
+-		goto err_free_adapter;
++		/*
++		 * If the MAC is invalid (or just missing), display a warning
++		 * but do not abort setting up the device. pch_gbe_up will
++		 * prevent the interface from being brought up until a valid MAC
++		 * is set.
++		 */
++		dev_err(&pdev->dev, "Invalid MAC address, "
++		                    "interface disabled.\n");
+ 	}
+ 	setup_timer(&adapter->watchdog_timer, pch_gbe_watchdog,
+ 		    (unsigned long)adapter);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
new file mode 100644
index 0000000..1c4d0da
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch
@@ -0,0 +1,56 @@
+From aa636350865960bf05da0427e6129a09787b9a8e Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Wed, 29 Feb 2012 21:17:08 +0000
+Subject: [PATCH 58/69] pch_gbe: memory corruption calling
+ pch_gbe_validate_option()
+
+commit 73f98eab9b9e0bab492ca06add5657d9e702ddb1 upstream.
+
+pch_gbe_validate_option() modifies 32 bits of memory but we pass
+&hw->phy.autoneg_advertised which only has 16 bits and &hw->mac.fc
+which only has 8 bits.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ .../net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c  |   15 ++++++++-------
+ 1 file changed, 8 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c
+index 9cb5f91..29e23be 100644
+--- a/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c
++++ b/drivers/net/ethernet/oki-semi/pch_gbe/pch_gbe_param.c
+@@ -321,10 +321,10 @@ static void pch_gbe_check_copper_options(struct pch_gbe_adapter *adapter)
+ 			pr_debug("AutoNeg specified along with Speed or Duplex, AutoNeg parameter ignored\n");
+ 			hw->phy.autoneg_advertised = opt.def;
+ 		} else {
+-			hw->phy.autoneg_advertised = AutoNeg;
+-			pch_gbe_validate_option(
+-				(int *)(&hw->phy.autoneg_advertised),
+-				&opt, adapter);
++			int tmp = AutoNeg;
++
++			pch_gbe_validate_option(&tmp, &opt, adapter);
++			hw->phy.autoneg_advertised = tmp;
+ 		}
+ 	}
+ 
+@@ -495,9 +495,10 @@ void pch_gbe_check_options(struct pch_gbe_adapter *adapter)
+ 			.arg  = { .l = { .nr = (int)ARRAY_SIZE(fc_list),
+ 					 .p = fc_list } }
+ 		};
+-		hw->mac.fc = FlowControl;
+-		pch_gbe_validate_option((int *)(&hw->mac.fc),
+-						&opt, adapter);
++		int tmp = FlowControl;
++
++		pch_gbe_validate_option(&tmp, &opt, adapter);
++		hw->mac.fc = tmp;
+ 	}
+ 
+ 	pch_gbe_check_copper_options(adapter);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
new file mode 100644
index 0000000..dd77d52
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch
@@ -0,0 +1,82 @@
+From b9ec954fcea6867cd78e33f003ce6c11a8c1b217 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Thu, 17 Nov 2011 16:14:23 +0900
+Subject: [PATCH 59/69] pch_dma: Support new device LAPIS Semiconductor ML7831
+ IOH
+
+commit ca7fe2db892dcf91b2c72ee352eda4ff867903a7 upstream.
+
+ML7831 is companion chip for Intel Atom E6xx series.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Vinod Koul <vinod.koul@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/dma/Kconfig   |   13 ++++++-------
+ drivers/dma/pch_dma.c |    8 ++++++--
+ 2 files changed, 12 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
+index 5a99bb3..da85c0d 100644
+--- a/drivers/dma/Kconfig
++++ b/drivers/dma/Kconfig
+@@ -201,18 +201,17 @@ config PL330_DMA
+ 	  platform_data for a dma-pl330 device.
+ 
+ config PCH_DMA
+-	tristate "Intel EG20T PCH / OKI Semi IOH(ML7213/ML7223) DMA support"
++	tristate "Intel EG20T PCH / OKI Semi IOH(ML7213/ML7223/ML7831) DMA support"
+ 	depends on PCI && X86
+ 	select DMA_ENGINE
+ 	help
+ 	  Enable support for Intel EG20T PCH DMA engine.
+-
+ 	  This driver also can be used for OKI SEMICONDUCTOR IOH(Input/
+-	  Output Hub), ML7213 and ML7223.
+-	  ML7213 IOH is for IVI(In-Vehicle Infotainment) use and ML7223 IOH is
+-	  for MP(Media Phone) use.
+-	  ML7213/ML7223 is companion chip for Intel Atom E6xx series.
+-	  ML7213/ML7223 is completely compatible for Intel EG20T PCH.
++	  Output Hub), ML7213, ML7223 and ML7831.
++	  ML7213 IOH is for IVI(In-Vehicle Infotainment) use, ML7223 IOH is
++	  for MP(Media Phone) use and ML7831 IOH is for general purpose use.
++	  ML7213/ML7223/ML7831 is companion chip for Intel Atom E6xx series.
++	  ML7213/ML7223/ML7831 is completely compatible for Intel EG20T PCH.
+ 
+ config IMX_SDMA
+ 	tristate "i.MX SDMA support"
+diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
+index a6d0e3d..629c430 100644
+--- a/drivers/dma/pch_dma.c
++++ b/drivers/dma/pch_dma.c
+@@ -1018,6 +1018,8 @@ static void __devexit pch_dma_remove(struct pci_dev *pdev)
+ #define PCI_DEVICE_ID_ML7223_DMA2_4CH	0x800E
+ #define PCI_DEVICE_ID_ML7223_DMA3_4CH	0x8017
+ #define PCI_DEVICE_ID_ML7223_DMA4_4CH	0x803B
++#define PCI_DEVICE_ID_ML7831_DMA1_8CH	0x8810
++#define PCI_DEVICE_ID_ML7831_DMA2_4CH	0x8815
+ 
+ DEFINE_PCI_DEVICE_TABLE(pch_dma_id_table) = {
+ 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_EG20T_PCH_DMA_8CH), 8 },
+@@ -1030,6 +1032,8 @@ DEFINE_PCI_DEVICE_TABLE(pch_dma_id_table) = {
+ 	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA2_4CH), 4}, /* Video SPI */
+ 	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA3_4CH), 4}, /* Security */
+ 	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_DMA4_4CH), 4}, /* FPGA */
++	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA1_8CH), 8}, /* UART */
++	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_DMA2_4CH), 4}, /* SPI */
+ 	{ 0, },
+ };
+ 
+@@ -1057,7 +1061,7 @@ static void __exit pch_dma_exit(void)
+ module_init(pch_dma_init);
+ module_exit(pch_dma_exit);
+ 
+-MODULE_DESCRIPTION("Intel EG20T PCH / OKI SEMICONDUCTOR ML7213 IOH "
+-		   "DMA controller driver");
++MODULE_DESCRIPTION("Intel EG20T PCH / OKI SEMICON ML7213/ML7223/ML7831 IOH"
++			"DMA controller driver");
+ MODULE_AUTHOR("Yong Wang <yong.y.wang@intel.com>");
+ MODULE_LICENSE("GPL v2");
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch
new file mode 100644
index 0000000..9b5bc86
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch
@@ -0,0 +1,82 @@
+From 799b889232ef93a544b5b580bc8fb1178c27adbe Mon Sep 17 00:00:00 2001
+From: Danny Kukawka <danny.kukawka@bisect.de>
+Date: Tue, 14 Feb 2012 15:35:03 +0100
+Subject: [PATCH 60/69] spi-topcliff-pch: fix -Wuninitialized warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit de3bd7e6de25141c466773c2e0fa319b2fa93655 upstream.
+
+Fix for:
+drivers/spi/spi-topcliff-pch.c: In function ‘pch_spi_handler_sub’:
+drivers/spi/spi-topcliff-pch.c:325:17: warning: ‘bpw_len’ may be
+  used uninitialized in this function [-Wuninitialized]
+drivers/spi/spi-topcliff-pch.c:325:42: warning: ‘rx_index’ may be
+  used uninitialized in this function [-Wuninitialized]
+drivers/spi/spi-topcliff-pch.c:325:42: warning: ‘tx_index’ may be
+  used uninitialized in this function [-Wuninitialized]
+
+Move usage of tx_index, rx_index and bpw_len into the same
+block as where they are set to prevent uninitialized usage.
+
+v2: instead of init variables with 0 move the whole block
+
+[This patch title "warnings" makes you think "This patch is not
+for bug fix".  However, this patch surely patch for bug fix.]
+
+Signed-off-by: Danny Kukawka <danny.kukawka@bisect.de>
+Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/spi/spi-topcliff-pch.c |   33 +++++++++++++++++----------------
+ 1 file changed, 17 insertions(+), 16 deletions(-)
+
+diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
+index 027b6d0..ec50541 100644
+--- a/drivers/spi/spi-topcliff-pch.c
++++ b/drivers/spi/spi-topcliff-pch.c
+@@ -315,22 +315,23 @@ static void pch_spi_handler_sub(struct pch_spi_data *data, u32 reg_spsr_val,
+ 		data->tx_index = tx_index;
+ 		data->rx_index = rx_index;
+ 
+-	}
+-
+-	/* if transfer complete interrupt */
+-	if (reg_spsr_val & SPSR_FI_BIT) {
+-		if ((tx_index == bpw_len) && (rx_index == tx_index)) {
+-			/* disable interrupts */
+-			pch_spi_setclr_reg(data->master, PCH_SPCR, 0, PCH_ALL);
+-
+-			/* transfer is completed;
+-			   inform pch_spi_process_messages */
+-			data->transfer_complete = true;
+-			data->transfer_active = false;
+-			wake_up(&data->wait);
+-		} else {
+-			dev_err(&data->master->dev,
+-				"%s : Transfer is not completed", __func__);
++		/* if transfer complete interrupt */
++		if (reg_spsr_val & SPSR_FI_BIT) {
++			if ((tx_index == bpw_len) && (rx_index == tx_index)) {
++				/* disable interrupts */
++				pch_spi_setclr_reg(data->master, PCH_SPCR, 0,
++						   PCH_ALL);
++
++				/* transfer is completed;
++				   inform pch_spi_process_messages */
++				data->transfer_complete = true;
++				data->transfer_active = false;
++				wake_up(&data->wait);
++			} else {
++				dev_err(&data->master->dev,
++					"%s : Transfer is not completed",
++					__func__);
++			}
+ 		}
+ 	}
+ }
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
new file mode 100644
index 0000000..0bef575
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch
@@ -0,0 +1,76 @@
+From 77fac631e9296a678208e031ca3b47a644a64bb8 Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
+Date: Fri, 28 Oct 2011 09:35:21 +0900
+Subject: [PATCH 61/69] spi-topcliff-pch: Support new device LAPIS
+ Semiconductor ML7831 IOH
+
+commit 92b3a5c1bc3c7da1ae4675d014124f4a97ddb632 upstream.
+
+ML7831 is companion chip for Intel Atom E6xx series.
+
+Signed-off-by: Tomoya MORINAGA <tomoya-linux@dsn.lapis-semi.com>
+Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/spi/Kconfig            |    6 +++---
+ drivers/spi/spi-topcliff-pch.c |    5 ++++-
+ 2 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
+index 8ba4510..7587796 100644
+--- a/drivers/spi/Kconfig
++++ b/drivers/spi/Kconfig
+@@ -346,14 +346,14 @@ config SPI_TI_SSP
+ 	  serial port.
+ 
+ config SPI_TOPCLIFF_PCH
+-	tristate "Intel EG20T PCH/OKI SEMICONDUCTOR ML7213 IOH SPI controller"
++	tristate "Intel EG20T PCH/LAPIS Semicon IOH(ML7213/ML7223/ML7831) SPI"
+ 	depends on PCI
+ 	help
+ 	  SPI driver for the Topcliff PCH (Platform Controller Hub) SPI bus
+ 	  used in some x86 embedded processors.
+ 
+-	  This driver also supports the ML7213, a companion chip for the
+-	  Atom E6xx series and compatible with the Intel EG20T PCH.
++	  This driver also supports the ML7213/ML7223/ML7831, a companion chip
++	  for the Atom E6xx series and compatible with the Intel EG20T PCH.
+ 
+ config SPI_TXX9
+ 	tristate "Toshiba TXx9 SPI controller"
+diff --git a/drivers/spi/spi-topcliff-pch.c b/drivers/spi/spi-topcliff-pch.c
+index ec50541..54b9d2e 100644
+--- a/drivers/spi/spi-topcliff-pch.c
++++ b/drivers/spi/spi-topcliff-pch.c
+@@ -95,16 +95,18 @@
+ #define PCH_CLOCK_HZ		50000000
+ #define PCH_MAX_SPBR		1023
+ 
+-/* Definition for ML7213 by OKI SEMICONDUCTOR */
++/* Definition for ML7213/ML7831 by OKI SEMICONDUCTOR */
+ #define PCI_VENDOR_ID_ROHM		0x10DB
+ #define PCI_DEVICE_ID_ML7213_SPI	0x802c
+ #define PCI_DEVICE_ID_ML7223_SPI	0x800F
++#define PCI_DEVICE_ID_ML7831_SPI	0x8816
+ 
+ /*
+  * Set the number of SPI instance max
+  * Intel EG20T PCH :		1ch
+  * OKI SEMICONDUCTOR ML7213 IOH :	2ch
+  * OKI SEMICONDUCTOR ML7223 IOH :	1ch
++ * OKI SEMICONDUCTOR ML7831 IOH :	1ch
+ */
+ #define PCH_SPI_MAX_DEV			2
+ 
+@@ -218,6 +220,7 @@ static struct pci_device_id pch_spi_pcidev_id[] = {
+ 	{ PCI_VDEVICE(INTEL, PCI_DEVICE_ID_GE_SPI),    1, },
+ 	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7213_SPI), 2, },
+ 	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7223_SPI), 1, },
++	{ PCI_VDEVICE(ROHM, PCI_DEVICE_ID_ML7831_SPI), 1, },
+ 	{ }
+ };
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
new file mode 100644
index 0000000..471914c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch
@@ -0,0 +1,67 @@
+From efa82e03e24743425f4cb3d3632f29756b70d5b5 Mon Sep 17 00:00:00 2001
+From: Eran <eran@over-here.org>
+Date: Mon, 5 Dec 2011 22:15:29 +0000
+Subject: [PATCH 62/69] Bluetooth: Adding USB device 13d3:3375 as an Atheros
+ AR3012.
+
+commit 9498ba7a1d38d42eef4ef6d906ab1743c9f0fd6f upstream.
+
+The bluetooth module in the Asus UX31/UX21 is based on Atheros AR3012
+and requires a firmware to be uploaded before it's usable.
+
+output of usb-devices for this module:
+T:  Bus=01 Lev=02 Prnt=02 Port=07 Cnt=03 Dev#=  6 Spd=12  MxCh= 0
+D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
+P:  Vendor=13d3 ProdID=3375 Rev=00.02
+S:  Manufacturer=Atheros Communications
+S:  Product=Bluetooth USB Host Controller
+S:  SerialNumber=Alaska Day 2006
+C:  #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
+I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+
+Signed-off-by: Eran <eran@over-here.org>
+Tested-by: Michal Labedzki <michal.labedzki@tieto.com>
+Signed-off-by: Gustavo F. Padovan <padovan@profusion.mobi>
+Cc: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/ath3k.c |    2 ++
+ drivers/bluetooth/btusb.c |    1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/drivers/bluetooth/ath3k.c b/drivers/bluetooth/ath3k.c
+index db811d2..67a79b0 100644
+--- a/drivers/bluetooth/ath3k.c
++++ b/drivers/bluetooth/ath3k.c
+@@ -71,6 +71,7 @@ static struct usb_device_id ath3k_table[] = {
+ 
+ 	/* Atheros AR3012 with sflash firmware*/
+ 	{ USB_DEVICE(0x0CF3, 0x3004) },
++	{ USB_DEVICE(0x13d3, 0x3375) },
+ 
+ 	/* Atheros AR5BBU12 with sflash firmware */
+ 	{ USB_DEVICE(0x0489, 0xE02C) },
+@@ -87,6 +88,7 @@ static struct usb_device_id ath3k_blist_tbl[] = {
+ 
+ 	/* Atheros AR3012 with sflash firmware*/
+ 	{ USB_DEVICE(0x0cf3, 0x3004), .driver_info = BTUSB_ATH3012 },
++	{ USB_DEVICE(0x13d3, 0x3375), .driver_info = BTUSB_ATH3012 },
+ 
+ 	{ }	/* Terminating entry */
+ };
+diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
+index c16c750..df0331a 100644
+--- a/drivers/bluetooth/btusb.c
++++ b/drivers/bluetooth/btusb.c
+@@ -126,6 +126,7 @@ static struct usb_device_id blacklist_table[] = {
+ 
+ 	/* Atheros 3012 with sflash firmware */
+ 	{ USB_DEVICE(0x0cf3, 0x3004), .driver_info = BTUSB_ATH3012 },
++	{ USB_DEVICE(0x13d3, 0x3375), .driver_info = BTUSB_ATH3012 },
+ 
+ 	/* Atheros AR5BBU12 with sflash firmware */
+ 	{ USB_DEVICE(0x0489, 0xe02c), .driver_info = BTUSB_IGNORE },
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
new file mode 100644
index 0000000..4ae57d9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch
@@ -0,0 +1,119 @@
+From cf0a0312929eb18f55e95db15f2129fd28a0adb3 Mon Sep 17 00:00:00 2001
+From: "Cho, Yu-Chen" <acho@suse.com>
+Date: Wed, 14 Mar 2012 22:01:21 +0200
+Subject: [PATCH 63/69] Bluetooth: Add Atheros maryann PIDVID support
+
+commit 07c0ea874d43c299d185948452945a361052b6e3 upstream.
+
+Add Atheros maryann 0cf3:311d PIDVID support
+This module is AR3012 Series.
+
+Include /sys/kernel/debug/usb/devices output here for reference
+
+before:
+T:  Bus=04 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
+D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
+P:  Vendor=0cf3 ProdID=311d Rev= 0.01
+S:  Manufacturer=Atheros Communications
+S:  Product=Bluetooth USB Host Controller
+S:  SerialNumber=Alaska Day 2006
+C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
+I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
+E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
+E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
+I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
+I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
+I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
+I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
+I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
+I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
+
+after:
+T:  Bus=04 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=12   MxCh= 0
+D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
+P:  Vendor=0cf3 ProdID=311d Rev= 0.02
+S:  Manufacturer=Atheros Communications
+S:  Product=Bluetooth USB Host Controller
+S:  SerialNumber=Alaska Day 2006
+C:* #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
+I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=1ms
+E:  Ad=82(I) Atr=02(Bulk) MxPS=  64 Ivl=0ms
+E:  Ad=02(O) Atr=02(Bulk) MxPS=  64 Ivl=0ms
+I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
+I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
+I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
+I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
+I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
+I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
+E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
+
+Signed-off-by: Cho, Yu-Chen <acho@suse.com>
+cked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+Cc: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/ath3k.c |    2 ++
+ drivers/bluetooth/btusb.c |    1 +
+ 2 files changed, 3 insertions(+)
+
+diff --git a/drivers/bluetooth/ath3k.c b/drivers/bluetooth/ath3k.c
+index 67a79b0..003cd8d 100644
+--- a/drivers/bluetooth/ath3k.c
++++ b/drivers/bluetooth/ath3k.c
+@@ -71,6 +71,7 @@ static struct usb_device_id ath3k_table[] = {
+ 
+ 	/* Atheros AR3012 with sflash firmware*/
+ 	{ USB_DEVICE(0x0CF3, 0x3004) },
++	{ USB_DEVICE(0x0CF3, 0x311D) },
+ 	{ USB_DEVICE(0x13d3, 0x3375) },
+ 
+ 	/* Atheros AR5BBU12 with sflash firmware */
+@@ -88,6 +89,7 @@ static struct usb_device_id ath3k_blist_tbl[] = {
+ 
+ 	/* Atheros AR3012 with sflash firmware*/
+ 	{ USB_DEVICE(0x0cf3, 0x3004), .driver_info = BTUSB_ATH3012 },
++	{ USB_DEVICE(0x0cf3, 0x311D), .driver_info = BTUSB_ATH3012 },
+ 	{ USB_DEVICE(0x13d3, 0x3375), .driver_info = BTUSB_ATH3012 },
+ 
+ 	{ }	/* Terminating entry */
+diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
+index df0331a..5a87b2e 100644
+--- a/drivers/bluetooth/btusb.c
++++ b/drivers/bluetooth/btusb.c
+@@ -126,6 +126,7 @@ static struct usb_device_id blacklist_table[] = {
+ 
+ 	/* Atheros 3012 with sflash firmware */
+ 	{ USB_DEVICE(0x0cf3, 0x3004), .driver_info = BTUSB_ATH3012 },
++	{ USB_DEVICE(0x0cf3, 0x311d), .driver_info = BTUSB_ATH3012 },
+ 	{ USB_DEVICE(0x13d3, 0x3375), .driver_info = BTUSB_ATH3012 },
+ 
+ 	/* Atheros AR5BBU12 with sflash firmware */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
new file mode 100644
index 0000000..85b6c13
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch
@@ -0,0 +1,45 @@
+From 876f46c3f8fe8b612d1892941785c52c3f1d0012 Mon Sep 17 00:00:00 2001
+From: Jesse Sung <jesse.sung@canonical.com>
+Date: Thu, 22 Dec 2011 10:48:47 +0800
+Subject: [PATCH 64/69] Bluetooth: Add support for BCM20702A0 [0a5c:21e3]
+
+commit c0190925dacd976a67044f4382d4effbed568dce upstream.
+
+Add another vendor specific ID for BCM20702A0.
+
+output of usb-devices:
+T: Bus=06 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 4 Spd=12 MxCh= 0
+D: Ver= 2.00 Cls=ff(vend.) Sub=01 Prot=01 MxPS=64 #Cfgs= 1
+P: Vendor=0a5c ProdID=21e3 Rev=01.12
+S: Manufacturer=Broadcom Corp
+S: Product=BCM20702A0
+S: SerialNumber=9439E5CBF66C
+C: #Ifs= 4 Cfg#= 1 Atr=e0 MxPwr=0mA
+I: If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=01 Prot=01 Driver=(none)
+I: If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=01 Prot=01 Driver=(none)
+I: If#= 2 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)
+I: If#= 3 Alt= 0 #EPs= 0 Cls=fe(app. ) Sub=01 Prot=01 Driver=(none)
+
+Signed-off-by: Wen-chien Jesse Sung <jesse.sung@canonical.com>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Gustavo F. Padovan <padovan@profusion.mobi>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/btusb.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
+index 5a87b2e..db44ad5 100644
+--- a/drivers/bluetooth/btusb.c
++++ b/drivers/bluetooth/btusb.c
+@@ -101,6 +101,7 @@ static struct usb_device_id btusb_table[] = {
+ 	{ USB_DEVICE(0x0c10, 0x0000) },
+ 
+ 	/* Broadcom BCM20702A0 */
++	{ USB_DEVICE(0x0a5c, 0x21e3) },
+ 	{ USB_DEVICE(0x413c, 0x8197) },
+ 
+ 	{ }	/* Terminating entry */
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
new file mode 100644
index 0000000..d39ffb4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch
@@ -0,0 +1,170 @@
+From 39bc94c8c5909dc1047dad45c14ba96ff54e5654 Mon Sep 17 00:00:00 2001
+From: Kees Cook <keescook@chromium.org>
+Date: Mon, 19 Mar 2012 16:12:53 -0700
+Subject: [PATCH 65/69] futex: Do not leak robust list to unprivileged process
+
+commit bdbb776f882f5ad431aa1e694c69c1c3d6a4a5b8 upstream.
+
+It was possible to extract the robust list head address from a setuid
+process if it had used set_robust_list(), allowing an ASLR info leak. This
+changes the permission checks to be the same as those used for similar
+info that comes out of /proc.
+
+Running a setuid program that uses robust futexes would have had:
+  cred->euid != pcred->euid
+  cred->euid == pcred->uid
+so the old permissions check would allow it. I'm not aware of any setuid
+programs that use robust futexes, so this is just a preventative measure.
+
+(This patch is based on changes from grsecurity.)
+
+Signed-off-by: Kees Cook <keescook@chromium.org>
+Cc: Darren Hart <dvhart@linux.intel.com>
+Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: Jiri Kosina <jkosina@suse.cz>
+Cc: Eric W. Biederman <ebiederm@xmission.com>
+Cc: David Howells <dhowells@redhat.com>
+Cc: Serge E. Hallyn <serge.hallyn@canonical.com>
+Cc: kernel-hardening@lists.openwall.com
+Cc: spender@grsecurity.net
+Link: http://lkml.kernel.org/r/20120319231253.GA20893@www.outflux.net
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/futex.c        |   36 +++++++++++++-----------------------
+ kernel/futex_compat.c |   36 +++++++++++++-----------------------
+ 2 files changed, 26 insertions(+), 46 deletions(-)
+
+diff --git a/kernel/futex.c b/kernel/futex.c
+index 0677023..866c9d5 100644
+--- a/kernel/futex.c
++++ b/kernel/futex.c
+@@ -59,6 +59,7 @@
+ #include <linux/magic.h>
+ #include <linux/pid.h>
+ #include <linux/nsproxy.h>
++#include <linux/ptrace.h>
+ 
+ #include <asm/futex.h>
+ 
+@@ -2443,40 +2444,29 @@ SYSCALL_DEFINE3(get_robust_list, int, pid,
+ {
+ 	struct robust_list_head __user *head;
+ 	unsigned long ret;
+-	const struct cred *cred = current_cred(), *pcred;
++	struct task_struct *p;
+ 
+ 	if (!futex_cmpxchg_enabled)
+ 		return -ENOSYS;
+ 
++	rcu_read_lock();
++
++	ret = -ESRCH;
+ 	if (!pid)
+-		head = current->robust_list;
++		p = current;
+ 	else {
+-		struct task_struct *p;
+-
+-		ret = -ESRCH;
+-		rcu_read_lock();
+ 		p = find_task_by_vpid(pid);
+ 		if (!p)
+ 			goto err_unlock;
+-		ret = -EPERM;
+-		pcred = __task_cred(p);
+-		/* If victim is in different user_ns, then uids are not
+-		   comparable, so we must have CAP_SYS_PTRACE */
+-		if (cred->user->user_ns != pcred->user->user_ns) {
+-			if (!ns_capable(pcred->user->user_ns, CAP_SYS_PTRACE))
+-				goto err_unlock;
+-			goto ok;
+-		}
+-		/* If victim is in same user_ns, then uids are comparable */
+-		if (cred->euid != pcred->euid &&
+-		    cred->euid != pcred->uid &&
+-		    !ns_capable(pcred->user->user_ns, CAP_SYS_PTRACE))
+-			goto err_unlock;
+-ok:
+-		head = p->robust_list;
+-		rcu_read_unlock();
+ 	}
+ 
++	ret = -EPERM;
++	if (!ptrace_may_access(p, PTRACE_MODE_READ))
++		goto err_unlock;
++
++	head = p->robust_list;
++	rcu_read_unlock();
++
+ 	if (put_user(sizeof(*head), len_ptr))
+ 		return -EFAULT;
+ 	return put_user(head, head_ptr);
+diff --git a/kernel/futex_compat.c b/kernel/futex_compat.c
+index 5f9e689..a9642d5 100644
+--- a/kernel/futex_compat.c
++++ b/kernel/futex_compat.c
+@@ -10,6 +10,7 @@
+ #include <linux/compat.h>
+ #include <linux/nsproxy.h>
+ #include <linux/futex.h>
++#include <linux/ptrace.h>
+ 
+ #include <asm/uaccess.h>
+ 
+@@ -136,40 +137,29 @@ compat_sys_get_robust_list(int pid, compat_uptr_t __user *head_ptr,
+ {
+ 	struct compat_robust_list_head __user *head;
+ 	unsigned long ret;
+-	const struct cred *cred = current_cred(), *pcred;
++	struct task_struct *p;
+ 
+ 	if (!futex_cmpxchg_enabled)
+ 		return -ENOSYS;
+ 
++	rcu_read_lock();
++
++	ret = -ESRCH;
+ 	if (!pid)
+-		head = current->compat_robust_list;
++		p = current;
+ 	else {
+-		struct task_struct *p;
+-
+-		ret = -ESRCH;
+-		rcu_read_lock();
+ 		p = find_task_by_vpid(pid);
+ 		if (!p)
+ 			goto err_unlock;
+-		ret = -EPERM;
+-		pcred = __task_cred(p);
+-		/* If victim is in different user_ns, then uids are not
+-		   comparable, so we must have CAP_SYS_PTRACE */
+-		if (cred->user->user_ns != pcred->user->user_ns) {
+-			if (!ns_capable(pcred->user->user_ns, CAP_SYS_PTRACE))
+-				goto err_unlock;
+-			goto ok;
+-		}
+-		/* If victim is in same user_ns, then uids are comparable */
+-		if (cred->euid != pcred->euid &&
+-		    cred->euid != pcred->uid &&
+-		    !ns_capable(pcred->user->user_ns, CAP_SYS_PTRACE))
+-			goto err_unlock;
+-ok:
+-		head = p->compat_robust_list;
+-		rcu_read_unlock();
+ 	}
+ 
++	ret = -EPERM;
++	if (!ptrace_may_access(p, PTRACE_MODE_READ))
++		goto err_unlock;
++
++	head = p->compat_robust_list;
++	rcu_read_unlock();
++
+ 	if (put_user(sizeof(*head), len_ptr))
+ 		return -EFAULT;
+ 	return put_user(ptr_to_compat(head), head_ptr);
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
new file mode 100644
index 0000000..78e16f8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch
@@ -0,0 +1,39 @@
+From 8bfeb0bfde94ba70986c03d0a8ca9ab876073e35 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Wed, 18 Apr 2012 15:21:07 +0200
+Subject: [PATCH 66/69] drm/radeon/kms: fix the regression of DVI connector
+ check
+
+commit e36325071832f1ba96ac54fb8ba1459f08b05dd8 upstream.
+
+The check of the encoder type in the commit [e00e8b5e: drm/radeon/kms:
+fix analog load detection on DVI-I connectors] is obviously wrong, and
+it's the culprit of the regression on my workstation with DVI-analog
+connection resulting in the blank output.
+
+Fixed the typo now.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_connectors.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
+index f7d39ac..f19ea2e 100644
+--- a/drivers/gpu/drm/radeon/radeon_connectors.c
++++ b/drivers/gpu/drm/radeon/radeon_connectors.c
+@@ -946,7 +946,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
+ 
+ 			encoder = obj_to_encoder(obj);
+ 
+-			if (encoder->encoder_type != DRM_MODE_ENCODER_DAC ||
++			if (encoder->encoder_type != DRM_MODE_ENCODER_DAC &&
+ 			    encoder->encoder_type != DRM_MODE_ENCODER_TVDAC)
+ 				continue;
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch
new file mode 100644
index 0000000..6bf8650
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch
@@ -0,0 +1,37 @@
+From 0532e1f8a710f011e839ad1ad0d83c6f3a1d2d74 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Fri, 13 Apr 2012 11:14:50 +0100
+Subject: [PATCH 67/69] drm/radeon: disable MSI on RV515
+
+commit 16a5e32b83fd946312b9b13590c75d20c95c5202 upstream.
+
+My rv515 card is very flaky with msi enabled. Every so often it loses a rearm
+and never comes back, manually banging the rearm brings it back.
+
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_irq_kms.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
+index e7ddb49..baa019e 100644
+--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
++++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
+@@ -143,6 +143,12 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
+ 	    (rdev->pdev->subsystem_device == 0x01fd))
+ 		return true;
+ 
++	/* RV515 seems to have MSI issues where it loses
++	 * MSI rearms occasionally. This leads to lockups and freezes.
++	 * disable it by default.
++	 */
++	if (rdev->family == CHIP_RV515)
++		return false;
+ 	if (rdev->flags & RADEON_IS_IGP) {
+ 		/* APUs work fine with MSIs */
+ 		if (rdev->family >= CHIP_PALM)
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
new file mode 100644
index 0000000..ee262ca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch
@@ -0,0 +1,46 @@
+From 29e2a67065f74d9a1f31a61d4466976551d9bed4 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Thu, 19 Apr 2012 15:42:58 +0100
+Subject: [PATCH 68/69] drm/radeon: fix load detect on rn50 with hardcoded
+ EDIDs.
+
+commit a09d431f344d854e4fe9cfac44f78cb8202f3eb7 upstream.
+
+When the force changes went in back in 3.3.0, we ended up returning
+disconnected in the !force case, and the connected in when forced,
+as it hit the hardcoded check.
+
+Fix it so all exits go via the hardcoded check and stop spurious
+modesets on platforms with hardcoded EDIDs.
+
+Reported-by: Evan McNabb (Red Hat)
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_connectors.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
+index f19ea2e..4a4493f 100644
+--- a/drivers/gpu/drm/radeon/radeon_connectors.c
++++ b/drivers/gpu/drm/radeon/radeon_connectors.c
+@@ -976,6 +976,7 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
+ 	 * cases the DVI port is actually a virtual KVM port connected to the service
+ 	 * processor.
+ 	 */
++out:
+ 	if ((!rdev->is_atom_bios) &&
+ 	    (ret == connector_status_disconnected) &&
+ 	    rdev->mode_info.bios_hardcoded_edid_size) {
+@@ -983,7 +984,6 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
+ 		ret = connector_status_connected;
+ 	}
+ 
+-out:
+ 	/* updated in get modes as well since we need to know if it's analog or digital */
+ 	radeon_connector_update_scratch_regs(connector, ret);
+ 	return ret;
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch
new file mode 100644
index 0000000..261d355
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.16/0069-Linux-3.2.16.patch
@@ -0,0 +1,24 @@
+From 206e830feaa561615d9ea721a7e4a0f8d3708e81 Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Sun, 22 Apr 2012 15:31:32 -0700
+Subject: [PATCH 69/69] Linux 3.2.16
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 6195122..3da29cb 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 15
++SUBLEVEL = 16
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.9.5
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 35d1b26..70dd7be 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "0d0567b6c1a61a374120b985559768077c511a6d"
-MACHINE_KERNEL_PR_append = "e+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -796,6 +796,134 @@ PATCHES_OVER_PSP = " \
 	file://3.2.14/0145-serial-sh-sci-fix-a-race-of-DMA-submit_tx-on-transfe.patch \
 	file://3.2.14/0146-ASPM-Fix-pcie-devices-with-non-pcie-children.patch \
 	file://3.2.14/0147-Linux-3.2.14.patch \
+	file://3.2.15/0001-x86-bpf_jit-fix-a-bug-in-emitting-the-16-bit-immedia.patch \
+	file://3.2.15/0002-tg3-Fix-5717-serdes-powerdown-problem.patch \
+	file://3.2.15/0003-sky2-dont-overwrite-settings-for-PHY-Quick-link.patch \
+	file://3.2.15/0004-rose_dev-fix-memcpy-bug-in-rose_set_mac_address.patch \
+	file://3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch \
+	file://3.2.15/0006-Fix-non-TBI-PHY-access-a-bad-merge-undid-bug-fix-in-.patch \
+	file://3.2.15/0007-ASoC-wm8994-Update-WM8994-DCS-calibration.patch \
+	file://3.2.15/0008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch \
+	file://3.2.15/0009-mtd-mips-lantiq-reintroduce-support-for-cmdline-part.patch \
+	file://3.2.15/0010-mtd-nand-gpmi-use-correct-member-for-checking-NAND_B.patch \
+	file://3.2.15/0011-mtd-sst25l-initialize-writebufsize.patch \
+	file://3.2.15/0012-mtd-block2mtd-initialize-writebufsize.patch \
+	file://3.2.15/0013-mtd-lart-initialize-writebufsize.patch \
+	file://3.2.15/0014-mtd-m25p80-set-writebufsize.patch \
+	file://3.2.15/0015-ACPI-Do-cpufreq-clamping-for-throttling-per-package-.patch \
+	file://3.2.15/0016-PNPACPI-Fix-device-ref-leaking-in-acpi_pnp_match.patch \
+	file://3.2.15/0017-ACPICA-Fix-regression-in-FADT-revision-checks.patch \
+	file://3.2.15/0018-modpost-fix-ALL_INIT_DATA_SECTIONS.patch \
+	file://3.2.15/0019-genirq-Adjust-irq-thread-affinity-on-IRQ_SET_MASK_OK.patch \
+	file://3.2.15/0020-tracing-Fix-ftrace-stack-trace-entries.patch \
+	file://3.2.15/0021-tracing-Fix-ent_size-in-trace-output.patch \
+	file://3.2.15/0022-m68k-mac-Add-missing-platform-check-before-registeri.patch \
+	file://3.2.15/0023-mac80211-fix-possible-tid_rx-reorder_timer-use-after.patch \
+	file://3.2.15/0024-rtlwifi-rtl8192ce-rtl8192cu-rtl8192de-Fix-low-gain-s.patch \
+	file://3.2.15/0025-drm-Validate-requested-virtual-size-against-allocate.patch \
+	file://3.2.15/0026-drm-radeon-kms-fix-fans-after-resume.patch \
+	file://3.2.15/0027-drm-i915-no-lvds-quirk-on-MSI-DC500.patch \
+	file://3.2.15/0028-drm-i915-Sanitize-BIOS-debugging-bits-from-PIPECONF.patch \
+	file://3.2.15/0029-drm-i915-Add-lock-on-drm_helper_resume_force_mode.patch \
+	file://3.2.15/0030-drm-i915-quirk-away-broken-OpRegion-VBT.patch \
+	file://3.2.15/0031-r8169-runtime-resume-before-shutdown.patch \
+	file://3.2.15/0032-target-Fix-unsupported-WRITE_SAME-sense-payload.patch \
+	file://3.2.15/0033-kgdb-debug_core-pass-the-breakpoint-struct-instead-o.patch \
+	file://3.2.15/0034-kgdbts-Fix-kernel-oops-with-CONFIG_DEBUG_RODATA.patch \
+	file://3.2.15/0035-kgdbts-1-of-2-fix-single-step-awareness-to-work-corr.patch \
+	file://3.2.15/0036-kgdbts-2-of-2-fix-single-step-awareness-to-work-corr.patch \
+	file://3.2.15/0037-x86-kgdb-Fix-DEBUG_RODATA-limitation-using-text_poke.patch \
+	file://3.2.15/0038-CIFS-Fix-VFS-lock-usage-for-oplocked-files.patch \
+	file://3.2.15/0039-ARM-tegra-remove-Tegra30-errata-from-MACH_TEGRA_DT.patch \
+	file://3.2.15/0040-mmc-sdhci-dove-Fix-compile-error-by-including-module.patch \
+	file://3.2.15/0041-mmc-atmel-mci-correct-data-timeout-computation.patch \
+	file://3.2.15/0042-tcm_fc-Add-abort-flag-for-gracefully-handling-exchan.patch \
+	file://3.2.15/0043-tcm_fc-Do-not-free-tpg-structure-during-wq-allocatio.patch \
+	file://3.2.15/0044-sysctl-fix-write-access-to-dmesg_restrict-kptr_restr.patch \
+	file://3.2.15/0045-modpost-Fix-modpost-license-checking-of-vmlinux.o.patch \
+	file://3.2.15/0046-x86-PCI-use-host-bridge-_CRS-info-on-MSI-MS-7253.patch \
+	file://3.2.15/0047-x86-PCI-do-not-tie-MSI-MS-7253-use_crs-quirk-to-BIOS.patch \
+	file://3.2.15/0048-TOMOYO-Fix-mount-flags-checking-order.patch \
+	file://3.2.15/0049-Revert-x86-ioapic-Add-register-level-checks-to-detec.patch \
+	file://3.2.15/0050-acer-wmi-No-wifi-rfkill-on-Sony-machines.patch \
+	file://3.2.15/0051-Fix-length-of-buffer-copied-in-__nfs4_get_acl_uncach.patch \
+	file://3.2.15/0052-sched-x86-Fix-overflow-in-cyc2ns_offset.patch \
+	file://3.2.15/0053-mfd-Clear-twl6030-IRQ-status-register-only-once.patch \
+	file://3.2.15/0054-USB-Add-Motorola-Rokr-E6-Id-to-the-USBNet-driver-zau.patch \
+	file://3.2.15/0055-ioat-fix-size-of-completion-for-Xen.patch \
+	file://3.2.15/0056-ASoC-ak4642-fixup-mute-needs-1-step.patch \
+	file://3.2.15/0057-cred-copy_process-should-clear-child-replacement_ses.patch \
+	file://3.2.15/0058-iommu-amd-Make-sure-IOMMU-interrupts-are-re-enabled-.patch \
+	file://3.2.15/0059-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
+	file://3.2.15/0060-Linux-3.2.15.patch \
+	file://3.2.16/0001-drm-i915-mask-transcoder-select-bits-before-setting-.patch \
+	file://3.2.16/0002-drm-radeon-kms-fix-DVO-setup-on-some-r4xx-chips.patch \
+	file://3.2.16/0003-drm-i915-ringbuffer-Exclude-last-2-cachlines-of-ring.patch \
+	file://3.2.16/0004-drm-radeon-only-add-the-mm-i2c-bus-if-the-hw_i2c-mod.patch \
+	file://3.2.16/0005-drm-i915-properly-compute-dp-dithering-for-user-crea.patch \
+	file://3.2.16/0006-drm-i915-make-rc6-module-parameter-read-only.patch \
+	file://3.2.16/0007-rtlwifi-Add-missing-DMA-buffer-unmapping-for-PCI-dri.patch \
+	file://3.2.16/0008-ARM-7379-1-DT-fix-atags_to_fdt-second-call-site.patch \
+	file://3.2.16/0009-ARM-7384-1-ThumbEE-Disable-userspace-TEEHBR-access-f.patch \
+	file://3.2.16/0010-md-bitmap-prevent-bitmap_daemon_work-running-while-i.patch \
+	file://3.2.16/0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch \
+	file://3.2.16/0012-Bluetooth-hci_ldisc-fix-NULL-pointer-dereference-on-.patch \
+	file://3.2.16/0013-ext4-address-scalability-issue-by-removing-extent-ca.patch \
+	file://3.2.16/0014-ia64-fix-futex_atomic_cmpxchg_inatomic.patch \
+	file://3.2.16/0015-drivers-rtc-rtc-pl031.c-enable-clock-on-all-ST-varia.patch \
+	file://3.2.16/0016-hugetlb-fix-race-condition-in-hugetlb_fault.patch \
+	file://3.2.16/0017-staging-iio-hmc5843-Fix-crash-in-probe-function.patch \
+	file://3.2.16/0018-tty-serial-altera_uart-Check-for-NULL-platform_data-.patch \
+	file://3.2.16/0019-sparc64-Eliminate-obsolete-__handle_softirq-function.patch \
+	file://3.2.16/0020-sparc64-Fix-bootup-crash-on-sun4v.patch \
+	file://3.2.16/0021-cciss-Initialize-scsi-host-max_sectors-for-tape-driv.patch \
+	file://3.2.16/0022-cciss-Fix-scsi-tape-io-with-more-than-255-scatter-ga.patch \
+	file://3.2.16/0024-video-uvesafb-Fix-oops-that-uvesafb-try-to-execute-N.patch \
+	file://3.2.16/0025-nohz-Fix-stale-jiffies-update-in-tick_nohz_restart.patch \
+	file://3.2.16/0026-pch_uart-Fix-MSI-setting-issue.patch \
+	file://3.2.16/0027-USB-serial-fix-race-between-probe-and-open.patch \
+	file://3.2.16/0028-USB-pl2303-fix-DTR-RTS-being-raised-on-baud-rate-cha.patch \
+	file://3.2.16/0029-USB-option-re-add-NOVATELWIRELESS_PRODUCT_HSPA_HIGHS.patch \
+	file://3.2.16/0030-USB-ftdi_sio-fix-status-line-change-handling-for-TIO.patch \
+	file://3.2.16/0031-USB-ftdi_sio-fix-race-condition-in-TIOCMIWAIT-and-ab.patch \
+	file://3.2.16/0032-USB-sierra-add-support-for-Sierra-Wireless-MC7710.patch \
+	file://3.2.16/0033-USB-don-t-clear-urb-dev-in-scatter-gather-library.patch \
+	file://3.2.16/0034-USB-don-t-ignore-suspend-errors-for-root-hubs.patch \
+	file://3.2.16/0035-xhci-don-t-re-enable-IE-constantly.patch \
+	file://3.2.16/0036-xhci-Don-t-write-zeroed-pointers-to-xHC-registers.patch \
+	file://3.2.16/0037-xhci-Restore-event-ring-dequeue-pointer-on-resume.patch \
+	file://3.2.16/0038-USB-fix-bug-of-device-descriptor-got-from-superspeed.patch \
+	file://3.2.16/0039-xHCI-add-XHCI_RESET_ON_RESUME-quirk-for-VIA-xHCI-hos.patch \
+	file://3.2.16/0040-xHCI-Correct-the-define-XHCI_LEGACY_DISABLE_SMI.patch \
+	file://3.2.16/0041-fix-tlb-flushing-for-page-table-pages.patch \
+	file://3.2.16/0042-serial-PL011-clear-pending-interrupts.patch \
+	file://3.2.16/0043-serial-PL011-move-interrupt-clearing.patch \
+	file://3.2.16/0044-fcaps-clear-the-same-personality-flags-as-suid-when-.patch \
+	file://3.2.16/0045-ath9k-fix-max-noise-floor-threshold.patch \
+	file://3.2.16/0046-xhci-Fix-register-save-restore-order.patch \
+	file://3.2.16/0047-Bluetooth-hci_core-fix-NULL-pointer-dereference-at-u.patch \
+	file://3.2.16/0048-pch_gpio-Support-new-device-LAPIS-Semiconductor-ML78.patch \
+	file://3.2.16/0049-gpio-Add-missing-spin_lock_init-in-gpio-pch-driver.patch \
+	file://3.2.16/0050-usb-gadget-pch_udc-Fix-disconnect-issue.patch \
+	file://3.2.16/0051-usb-gadget-pch_udc-Fix-wrong-return-value.patch \
+	file://3.2.16/0052-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch \
+	file://3.2.16/0053-usb-gadget-pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch \
+	file://3.2.16/0054-usb-gadget-pch_udc-Reduce-redundant-interrupt.patch \
+	file://3.2.16/0055-ACPICA-Fix-to-allow-region-arguments-to-reference-ot.patch \
+	file://3.2.16/0056-security-fix-compile-error-in-commoncap.c.patch \
+	file://3.2.16/0057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch \
+	file://3.2.16/0058-pch_gbe-memory-corruption-calling-pch_gbe_validate_o.patch \
+	file://3.2.16/0059-pch_dma-Support-new-device-LAPIS-Semiconductor-ML783.patch \
+	file://3.2.16/0060-spi-topcliff-pch-fix-Wuninitialized-warning.patch \
+	file://3.2.16/0061-spi-topcliff-pch-Support-new-device-LAPIS-Semiconduc.patch \
+	file://3.2.16/0062-Bluetooth-Adding-USB-device-13d3-3375-as-an-Atheros-.patch \
+	file://3.2.16/0063-Bluetooth-Add-Atheros-maryann-PIDVID-support.patch \
+	file://3.2.16/0064-Bluetooth-Add-support-for-BCM20702A0-0a5c-21e3.patch \
+	file://3.2.16/0065-futex-Do-not-leak-robust-list-to-unprivileged-proces.patch \
+	file://3.2.16/0066-drm-radeon-kms-fix-the-regression-of-DVI-connector-c.patch \
+	file://3.2.16/0067-drm-radeon-disable-MSI-on-RV515.patch \
+	file://3.2.16/0068-drm-radeon-fix-load-detect-on-rn50-with-hardcoded-ED.patch \
+	file://3.2.16/0069-Linux-3.2.16.patch \
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
@@ -829,4 +957,3 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0031-omap2-irq-process-all-4-irq-banks-for-am335x.patch \
 	file://beaglebone/0032-omap2-irqs.h-increase-number-or-irq-banks.patch \
 "
-
-- 
1.7.10


