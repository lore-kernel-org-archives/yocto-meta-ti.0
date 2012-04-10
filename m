Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9D1BDE0044D
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:00:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6506252A93; Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120410200049.6506252A93@arago-project.org>
Date: Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: update to 3.2.14
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
X-List-Received-Date: Tue, 10 Apr 2012 20:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bb34e69f3d6b2a24e910c657e3385ece0a6e0f98
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb34e69f3d6b2a24e910c657e3385ece0a6e0f98

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Apr  9 18:06:40 2012 +0200

linux-ti335x-psp 3.2: update to 3.2.14

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...Add-MediaTek-MT6276M-modem-app-interfaces.patch |   45 ++
 ...driver-adding-support-for-Telit-CC864-SIN.patch |   44 ++
 ...ption-make-interface-blacklist-work-again.patch |   37 ++
 .../3.2.14/0004-USB-option-add-ZTE-MF820D.patch    |   37 ++
 ...ing-zcache-avoid-AB-BA-deadlock-condition.patch |   66 +++
 ...o-fix-problem-when-the-manufacture-is-a-N.patch |   36 ++
 ...tdi_sio-add-support-for-BeagleBone-rev-A5.patch |   35 ++
 ...ip-VID-mislabeled-as-Hornby-VID-in-ftdi_s.patch |   61 +++
 ...ftdi_sio-new-PID-Distortec-JTAG-lock-pick.patch |   46 ++
 ...i_sio-add-support-for-FT-X-series-devices.patch |  150 ++++++
 .../0011-USB-ftdi_sio-new-PID-LUMEL-PD12.patch     |   45 ++
 ...-fix-bug-of-kernel-hang-when-initializing.patch |   55 +++
 ...12u-Add-missing-initialization-and-remove.patch |  107 +++++
 ...12u-Fix-regression-introduced-by-commit-a.patch |   53 +++
 ...12u-Fix-regression-in-signal-level-after-.patch |   47 ++
 ...-fix-bogus-test-in-dwc3_gadget_start_isoc.patch |   54 +++
 ...e-proper-function-for-setting-endpoint-na.patch |   46 ++
 ...s-return-number-of-bytes-on-ep0-read-requ.patch |   37 ++
 ...t-Make-g_hid-device-class-conform-to-spec.patch |   39 ++
 ...-all-PI-opcodes-with-cmpxchg-enabled-chec.patch |   64 +++
 ...fs-Fix-memory-leak-in-sysfs_sd_setsecdata.patch |   92 ++++
 .../0022-tty-moxa-fix-bit-test-in-moxa_start.patch |   34 ++
 ...ng-unicode-value-copied-in-con_set_unimap.patch |  119 +++++
 ...24-USB-serial-fix-console-error-reporting.patch |   36 ++
 ...5-cdc-wdm-Fix-more-races-on-the-read-path.patch |   87 ++++
 ...-t-clear-WDM_READ-unless-entire-read-buff.patch |   36 ++
 ..._core-Fix-scheduling-while-atomic-dump-me.patch |  134 ++++++
 ...ld-error-due-to-dma_mask-is-not-at-pdev_a.patch |   49 ++
 ...ltek-do-not-use-stack-memory-for-DMA-in-_.patch |   51 ++
 ...B-qcserial-add-several-new-serial-devices.patch |   49 ++
 ...l-don-t-grab-QMI-port-on-Gobi-1000-device.patch |  177 +++++++
 ...Add-support-for-the-Sealevel-SeaLINK-8-20.patch |   51 ++
 ...Update-to-support-CP2105-and-multiple-int.patch |  155 +++++++
 ...mos7840-Fixed-MCS7820-device-attach-probl.patch |  148 ++++++
 ...d-support-for-D-Link-DWA-127-to-rt2800usb.patch |   33 ++
 ...8192c_common-rtl8192de-Check-for-allocati.patch |  102 +++++
 ...dle-previous-allocation-failures-when-fre.patch |   59 +++
 ...8192c-Prevent-sleeping-from-invalid-conte.patch |   56 +++
 ...rtl8192ce-Fix-loss-of-receive-performance.patch |   42 ++
 ...0-iwlwifi-always-monitor-for-stuck-queues.patch |   65 +++
 .../3.2.14/0041-math-Introduce-div64_long.patch    |   45 ++
 ...tp-Fix-integer-overflow-when-setting-time.patch |   39 ++
 ...-events-in-correct-order-according-to-seq.patch |   97 ++++
 ...long-term-regression-in-genirq-irq_set_ir.patch |   96 ++++
 ...incorrect-check-for-forced-IRQ-thread-han.patch |   35 ++
 ...-rtc-Disable-the-alarm-in-the-hardware-v2.patch |   76 +++
 ...ase-GPIO-lines-and-IRQ-on-error-in-p54spi.patch |   71 +++
 .../3.2.14/0048-rtnetlink-Fix-VF-IFLA-policy.patch |   38 ++
 ...t-initial-receive-buffers-before-sending-.patch |  143 ++++++
 .../3.2.14/0050-ima-fix-Kconfig-dependencies.patch |   49 ++
 ...Add-register-level-checks-to-detect-bogus.patch |  113 +++++
 ...pmd_bad-triggering-in-code-paths-holding-.patch |  480 ++++++++++++++++++++
 ...o-buffer-whole-after-copying-to-userspace.patch |   46 ++
 ...Fix-handling-of-wakeup-devices-during-sys.patch |   51 ++
 ...rsemem-remove-limit-constraint-in-alloc_b.patch |  147 ++++++
 ...-avoid-taking-i_mutex-from-hugetlbfs_read.patch |  140 ++++++
 ...022ds-tell-the-WM8776-codec-driver-that-i.patch |   89 ++++
 ...xa-ssp-atomically-set-stream-active-masks.patch |  122 +++++
 ...loop-Set-residual-field-for-SCSI-commands.patch |   51 ++
 ...rget-Fix-iscsit_alloc_buffs-failure-cases.patch |   62 +++
 ...t-Fix-dynamic-explict-NodeACL-pointer-ref.patch |   46 ++
 ...da-fix-printing-of-high-HDMI-sample-rates.patch |   43 ++
 ...fix-a-section-mismatch-when-compiling-g_f.patch |  190 ++++++++
 ...e-sysfs-framebuffer-device-with-USB-.disc.patch |  120 +++++
 ...fc_exch-memory-leak-in-ft_send_resp_statu.patch |   50 ++
 ...nsure-to-load-bitmap-when-creating-via-sy.patch |   37 ++
 ...n-t-set-md-arrays-to-readonly-on-shutdown.patch |   82 ++++
 ...id10-avoid-deadlock-during-resync-recover.patch |   97 ++++
 ...ring-of-the-changed-flags-for-the-bad-blo.patch |   55 +++
 ...ly-clear-the-GPU-domains-upon-a-successfu.patch |   64 +++
 ...Restrict-offset-for-legacy-hardware-curso.patch |  131 ++++++
 ...kms-fix-analog-load-detection-on-DVI-I-co.patch |   40 ++
 ...kms-add-connector-quirk-for-Fujitsu-D3003.patch |   48 ++
 ...t-set-WBUS16-or-SYNC-bits-in-INQUIRY-resp.patch |   41 ++
 ...-fix-use-after-free-in-target_report_luns.patch |   37 ++
 ...ent-NULL-pointer-dereference-in-target_re.patch |   37 ++
 ...16-bit-target-ports-for-SET-TARGET-PORT-G.patch |   54 +++
 ...ooth-Add-AR30XX-device-ID-on-Asus-laptops.patch |   67 +++
 ...D-add-extra-hotkeys-in-Asus-AIO-keyboards.patch |   71 +++
 ...ID-add-more-hotkeys-in-Asus-AIO-keyboards.patch |   34 ++
 ...-correctly-mask-recovery-field-for-HT6560.patch |   36 ++
 ...ci-fix-too-early-completion-of-IR-multich.patch |   55 +++
 ...end-struct-x86_emulate_ops-with-get_cpuid.patch |   82 ++++
 ...6-fix-missing-checks-in-syscall-emulation.patch |  148 ++++++
 ...y-handle-the-case-where-the-delegation-is.patch |  193 ++++++++
 ...n-the-delegation-if-the-server-returns-NF.patch |   77 ++++
 .../3.2.14/0087-xfs-fix-inode-lookup-race.patch    |  101 ++++
 .../0088-CIFS-Respect-negotiated-MaxMpxCount.patch |  212 +++++++++
 ...sue-mounting-of-DFS-ROOT-when-redirecting.patch |   55 +++
 ...a-spurious-error-in-cifs_push_posix_locks.patch |   70 +++
 .../0091-UBI-fix-error-handling-in-ubi_scan.patch  |   58 +++
 .../0092-UBI-fix-eraseblock-picking-criteria.patch |   57 +++
 ...ust-not-use-list_for_each_entry_safe-in-r.patch |   73 +++
 ...ease-URB-reference-count-before-usb_unlin.patch |   62 +++
 ...usbnet-don-t-clear-urb-dev-in-tx_complete.patch |   38 ++
 .../0096-e1000e-Avoid-wrong-check-on-TX-hang.patch |   98 ++++
 ...endless-loop-when-processing-signals-for-.patch |   85 ++++
 ...-d_set_d_op-API-to-set-dentry-ops-in-proc.patch |   49 ++
 ...ix-section-warning-for-prealloc_protectio.patch |   39 ++
 ...-protect-poll-in-entries-that-may-go-away.patch |   97 ++++
 ...h_power-Correct-sign-extension-of-running.patch |   36 ++
 ...x-signedness-error-in-i2c_read_demod_byte.patch |   53 +++
 ...-7MHz-8MHz-DVB-T-tuner-support-for-HVR190.patch |   51 ++
 ...x-error-on-stream-stop-in-mxl111sf_ep6_st.patch |   45 ++
 ...-limit-the-state-manager-warning-messages.patch |   78 ++++
 ...e-Enable-usermodehelpers-in-hibernate-err.patch |   55 +++
 ...BH_Delay-BH_Unwritten-in-journal_unmap_bu.patch |   49 ++
 ...-EXT4_INODE_JOURNAL_DATA-flag-with-delall.patch |  194 ++++++++
 ...ce-between-unwritten-extent-conversion-an.patch |   90 ++++
 ...x-race-between-sync-and-completed-io-work.patch |  119 +++++
 .../0111-ext4-check-for-zero-length-extent.patch   |   41 ++
 ...x-d_ancestor-case-in-d_materialize_unique.patch |   54 +++
 ...select-required-CPU-and-L2-errata-options.patch |   56 +++
 ...0114-udf-Fix-deadlock-in-udf_release_file.patch |   40 ++
 ...ap-fix-_set_gpio_irqenable-implementation.patch |   41 ++
 ...nci-fix-oops-on-unbanked-gpio-irq-request.patch |  152 ++++++
 ...o-davinci-fix-enabling-unbanked-GPIO-IRQs.patch |   65 +++
 .../0118-dm-crypt-fix-mempool-deadlock.patch       |   65 +++
 .../0119-dm-crypt-add-missing-error-handling.patch |  116 +++++
 ...20-dm-exception-store-fix-init-error-path.patch |   33 ++
 ...nt-data-fix-btree-rebalancing-after-remov.patch |  272 +++++++++++
 .../0122-dm-thin-fix-stacked-bi_next-usage.patch   |  233 ++++++++++
 .../0123-backlight-fix-typo-in-tosa_lcd.c.patch    |   34 ++
 ...s-on-IO-error-during-xlog_recover_process.patch |   84 ++++
 ...-hold-slub_lock-when-calling-sysfs_slab_a.patch |   51 ++
 ...-Fix-two-infinite-loops-in-the-mount-code.patch |   54 +++
 ...7-NFSv4.1-Fix-layoutcommit-error-handling.patch |   61 +++
 .../0128-module-Remove-module-size-limit.patch     |   38 ++
 ...tusb-fix-bInterval-for-high-super-speed-i.patch |   47 ++
 ...spend-fbdev-device-around-suspend-hiberna.patch |   95 ++++
 .../3.2.14/0131-Fix-pppol2tp-getsockname.patch     |   37 ++
 ...-fix-incorrent-ipv6-ipsec-packet-fragment.patch |   54 +++
 ...t-bpf_jit-fix-BPF_S_LDX_B_MSH-compilation.patch |   62 +++
 ...otential-rcu_read_lock-imbalance-in-rt6_f.patch |   50 ++
 .../0135-net-fix-napi_reuse_skb-skb-reserve.patch  |   39 ++
 .../0136-Remove-printk-from-rds_sendmsg.patch      |   31 ++
 ...-override-for-PCI-legacy-power-management.patch |   52 +++
 ...-the-replay-notify-functions-via-the-regi.patch |   54 +++
 ...-arg-parsing-for-grace_period-and-timeout.patch |   40 ++
 ...p-refined-tsc-calibration-on-systems-with.patch |   62 +++
 .../0141-x86-tls-Off-by-one-limit-check.patch      |   43 ++
 ...sys_sendfile64-implementation-for-sendfil.patch |   40 ++
 ...-flag-for-rtc-devices-that-don-t-support-.patch |   76 +++
 ...-allow-zero-length-strings-in-cache_parse.patch |   35 ++
 ...ci-fix-a-race-of-DMA-submit_tx-on-transfe.patch |   91 ++++
 ...M-Fix-pcie-devices-with-non-pcie-children.patch |   72 +++
 .../3.2.14/0147-Linux-3.2.14.patch                 |   24 +
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  149 ++++++-
 149 files changed, 11111 insertions(+), 2 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=bb34e69f3d6b2a24e910c657e3385ece0a6e0f98

