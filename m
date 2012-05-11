Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 66247E01425
	for <meta-ti@yoctoproject.org>; Thu, 10 May 2012 18:55:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 5485752AA4; Fri, 11 May 2012 01:55:00 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120511015500.5485752AA4@arago-project.org>
Date: Fri, 11 May 2012 01:55:00 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: update to 3.2.16
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
X-List-Received-Date: Fri, 11 May 2012 01:55:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 1af87d9126c541cb890c46bb8fd98b4d8d796bd6
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=1af87d9126c541cb890c46bb8fd98b4d8d796bd6

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri May  4 11:05:58 2012 +0200

linux-ti335x-psp 3.2: update to 3.2.16

3.2.16 is the final release in the 3.2-stable series by Greg KH.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...-fix-a-bug-in-emitting-the-16-bit-immedia.patch |   36 +++
 ...002-tg3-Fix-5717-serdes-powerdown-problem.patch |   37 +++
 ...ont-overwrite-settings-for-PHY-Quick-link.patch |   42 +++
 ...ev-fix-memcpy-bug-in-rose_set_mac_address.patch |   41 +++
 .../3.2.15/0005-net-usb-cdc_eem-fix-mtu.patch      |   38 +++
 ...-PHY-access-a-bad-merge-undid-bug-fix-in-.patch |   49 ++++
 ...ASoC-wm8994-Update-WM8994-DCS-calibration.patch |   31 +++
 ...008-mtd-ixp4xx-oops-in-ixp4xx_flash_probe.patch |   52 ++++
 ...ntiq-reintroduce-support-for-cmdline-part.patch |   45 ++++
 ...mi-use-correct-member-for-checking-NAND_B.patch |   42 +++
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
 ...tmel-mci-correct-data-timeout-computation.patch |   42 +++
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
 ...revent-bitmap_daemon_work-running-while-i.patch |   42 +++
 ...0011-Bluetooth-uart-ldisc-Fix-memory-leak.patch |   51 ++++
 ...ci_ldisc-fix-NULL-pointer-dereference-on-.patch |  107 ++++++++
 ...s-scalability-issue-by-removing-extent-ca.patch |   93 +++++++
 ...14-ia64-fix-futex_atomic_cmpxchg_inatomic.patch |   58 +++++
 ...-rtc-pl031.c-enable-clock-on-all-ST-varia.patch |   39 +++
 ...getlb-fix-race-condition-in-hugetlb_fault.patch |   89 +++++++
 ...g-iio-hmc5843-Fix-crash-in-probe-function.patch |  107 ++++++++
 ...altera_uart-Check-for-NULL-platform_data-.patch |   42 +++
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
 .../0045-ath9k-fix-max-noise-floor-threshold.patch |   56 ++++
 ...0046-xhci-Fix-register-save-restore-order.patch |   62 +++++
 ...ci_core-fix-NULL-pointer-dereference-at-u.patch |  133 ++++++++++
 ...pport-new-device-LAPIS-Semiconductor-ML78.patch |   63 +++++
 ...missing-spin_lock_init-in-gpio-pch-driver.patch |   35 +++
 ...0-usb-gadget-pch_udc-Fix-disconnect-issue.patch |   42 +++
 ...usb-gadget-pch_udc-Fix-wrong-return-value.patch |   42 +++
 ...-usb-gadget-pch_udc-Fix-USB-suspend-issue.patch |   45 ++++
 ...pch_udc-Fix-usb-gadget-pch_udc-Fix-ether-.patch |  153 +++++++++++
 ...gadget-pch_udc-Reduce-redundant-interrupt.patch |   55 ++++
 ...to-allow-region-arguments-to-reference-ot.patch |   82 ++++++
 ...security-fix-compile-error-in-commoncap.c.patch |   37 +++
 ...057-pch_gbe-Do-not-abort-probe-on-bad-MAC.patch |   81 ++++++
 ...ory-corruption-calling-pch_gbe_validate_o.patch |   56 ++++
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
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  131 ++++++++++-
 131 files changed, 8773 insertions(+), 3 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=1af87d9126c541cb890c46bb8fd98b4d8d796bd6

