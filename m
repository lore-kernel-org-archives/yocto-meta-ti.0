Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 46262E0044D
	for <meta-ti@yoctoproject.org>; Mon,  9 Apr 2012 09:06:51 -0700 (PDT)
Received: by werc1 with SMTP id c1so3503536wer.35
	for <meta-ti@yoctoproject.org>; Mon, 09 Apr 2012 09:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=dBsj5cHaPipkdkGv60J0GKZHme2hp/8bdDhe9C2t2cQ=;
	b=T5/YKkOnxkT2eobbUO42EzbwPq7viJXnCDukiLLdVqRioOYRkMhytwwrBQkbNhlPRW
	Kj6eEdF8OrIjyUq0Xd5UCIjkNrimhpmfLqbBGkElmAf7GbHF/Mr0WPvVF8ZxJgrDEYjF
	2sxUEzqukMaMvbZGatve0bRSS/WJOqvCL1Bb9jzNNBjvOitfrKg14mtmwsgLsMULAXAi
	zcFdpcqKNrmFa1hjWIj9rJUIHsI0cSxaOzXEGm6w4WepPX2VVw9Na6segFXevNjejqRj
	gTC+HjT/APNHNIsN4qZCVhfEiOmx7RGR9T6nISyZNWKZQAA43I+/IvflWxNMj3l26TPx
	wg1A==
Received: by 10.180.24.7 with SMTP id q7mr17163221wif.11.1333987609784;
	Mon, 09 Apr 2012 09:06:49 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id k6sm31253190wie.9.2012.04.09.09.06.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 09 Apr 2012 09:06:47 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Mon,  9 Apr 2012 18:06:40 +0200
Message-Id: <1333987604-1614-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQm7IKP9dXljAFQQpV7nv1zuitMzqOdaHI2KvHzDHl2s9l8e/Db110zjlDkviwaO7tIOYX1D
Cc: denys@ti.com
Subject: [PATCH 1/5] linux-ti335x-psp 3.2: update to 3.2.14
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
X-List-Received-Date: Mon, 09 Apr 2012 16:06:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0001-USB-option-Add-MediaTek-MT6276M-modem-app-interfaces.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0002-USB-option-driver-adding-support-for-Telit-CC864-SIN.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0003-USB-option-make-interface-blacklist-work-again.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0004-USB-option-add-ZTE-MF820D.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0005-staging-zcache-avoid-AB-BA-deadlock-condition.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0006-USB-ftdi_sio-fix-problem-when-the-manufacture-is-a-N.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0007-USB-ftdi_sio-add-support-for-BeagleBone-rev-A5.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0008-USB-Microchip-VID-mislabeled-as-Hornby-VID-in-ftdi_s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0009-USB-ftdi_sio-new-PID-Distortec-JTAG-lock-pick.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0010-USB-ftdi_sio-add-support-for-FT-X-series-devices.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0011-USB-ftdi_sio-new-PID-LUMEL-PD12.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0012-powerpc-usb-fix-bug-of-kernel-hang-when-initializing.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0013-staging-r8712u-Add-missing-initialization-and-remove.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0014-staging-r8712u-Fix-regression-introduced-by-commit-a.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0015-staging-r8712u-Fix-regression-in-signal-level-after-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0016-usb-dwc3-fix-bogus-test-in-dwc3_gadget_start_isoc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0017-usb-dwc3-use-proper-function-for-setting-endpoint-na.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0018-usb-gadgetfs-return-number-of-bytes-on-ep0-read-requ.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0019-USB-gadget-Make-g_hid-device-class-conform-to-spec.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0020-futex-Cover-all-PI-opcodes-with-cmpxchg-enabled-chec.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0021-sysfs-Fix-memory-leak-in-sysfs_sd_setsecdata.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0022-tty-moxa-fix-bit-test-in-moxa_start.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0023-TTY-Wrong-unicode-value-copied-in-con_set_unimap.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0024-USB-serial-fix-console-error-reporting.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0025-cdc-wdm-Fix-more-races-on-the-read-path.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0026-cdc-wdm-Don-t-clear-WDM_READ-unless-entire-read-buff.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0027-usb-fsl_udc_core-Fix-scheduling-while-atomic-dump-me.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0028-usb-Fix-build-error-due-to-dma_mask-is-not-at-pdev_a.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0029-USB-ums_realtek-do-not-use-stack-memory-for-DMA-in-_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0030-USB-qcserial-add-several-new-serial-devices.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0031-USB-qcserial-don-t-grab-QMI-port-on-Gobi-1000-device.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0032-usb-serial-Add-support-for-the-Sealevel-SeaLINK-8-20.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0033-usb-cp210x-Update-to-support-CP2105-and-multiple-int.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0034-USB-serial-mos7840-Fixed-MCS7820-device-attach-probl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0035-rt2x00-Add-support-for-D-Link-DWA-127-to-rt2800usb.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0036-rtlwifi-rtl8192c_common-rtl8192de-Check-for-allocati.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0037-rtlwifi-Handle-previous-allocation-failures-when-fre.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0038-rtlwifi-rtl8192c-Prevent-sleeping-from-invalid-conte.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0039-rtlwifi-rtl8192ce-Fix-loss-of-receive-performance.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0040-iwlwifi-always-monitor-for-stuck-queues.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0041-math-Introduce-div64_long.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0042-ntp-Fix-integer-overflow-when-setting-time.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0043-uevent-send-events-in-correct-order-according-to-seq.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0044-genirq-Fix-long-term-regression-in-genirq-irq_set_ir.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0045-genirq-Fix-incorrect-check-for-forced-IRQ-thread-han.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0046-rtc-Disable-the-alarm-in-the-hardware-v2.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0047-p54spi-Release-GPIO-lines-and-IRQ-on-error-in-p54spi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0048-rtnetlink-Fix-VF-IFLA-policy.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0049-IB-iser-Post-initial-receive-buffers-before-sending-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0050-ima-fix-Kconfig-dependencies.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0051-x86-ioapic-Add-register-level-checks-to-detect-bogus.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0052-mm-thp-fix-pmd_bad-triggering-in-code-paths-holding-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0053-TPM-Zero-buffer-whole-after-copying-to-userspace.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0054-PM-Domains-Fix-handling-of-wakeup-devices-during-sys.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0055-bootmem-sparsemem-remove-limit-constraint-in-alloc_b.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0056-hugetlbfs-avoid-taking-i_mutex-from-hugetlbfs_read.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0057-ASoC-fsl-p1022ds-tell-the-WM8776-codec-driver-that-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0058-ASoC-pxa-ssp-atomically-set-stream-active-masks.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0059-tcm_loop-Set-residual-field-for-SCSI-commands.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0060-iscsi-target-Fix-iscsit_alloc_buffs-failure-cases.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0061-iscsi-target-Fix-dynamic-explict-NodeACL-pointer-ref.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0062-ALSA-hda-fix-printing-of-high-HDMI-sample-rates.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0063-usb-gadget-fix-a-section-mismatch-when-compiling-g_f.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0064-udlfb-remove-sysfs-framebuffer-device-with-USB-.disc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0065-tcm_fc-Fix-fc_exch-memory-leak-in-ft_send_resp_statu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0066-md-bitmap-ensure-to-load-bitmap-when-creating-via-sy.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0067-md-don-t-set-md-arrays-to-readonly-on-shutdown.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0068-md-raid1-raid10-avoid-deadlock-during-resync-recover.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0069-md-fix-clearing-of-the-changed-flags-for-the-bad-blo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0070-drm-i915-Only-clear-the-GPU-domains-upon-a-successfu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0071-drm-radeon-Restrict-offset-for-legacy-hardware-curso.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0072-drm-radeon-kms-fix-analog-load-detection-on-DVI-I-co.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0073-drm-radeon-kms-add-connector-quirk-for-Fujitsu-D3003.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0074-target-Don-t-set-WBUS16-or-SYNC-bits-in-INQUIRY-resp.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0075-target-fix-use-after-free-in-target_report_luns.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0076-target-prevent-NULL-pointer-dereference-in-target_re.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0077-target-Fix-16-bit-target-ports-for-SET-TARGET-PORT-G.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0078-Bluetooth-Add-AR30XX-device-ID-on-Asus-laptops.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0079-HID-add-extra-hotkeys-in-Asus-AIO-keyboards.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0080-HID-add-more-hotkeys-in-Asus-AIO-keyboards.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0081-pata_legacy-correctly-mask-recovery-field-for-HT6560.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0082-firewire-ohci-fix-too-early-completion-of-IR-multich.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0083-KVM-x86-extend-struct-x86_emulate_ops-with-get_cpuid.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0084-KVM-x86-fix-missing-checks-in-syscall-emulation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0085-NFS-Properly-handle-the-case-where-the-delegation-is.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0086-NFSv4-Return-the-delegation-if-the-server-returns-NF.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0087-xfs-fix-inode-lookup-race.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0088-CIFS-Respect-negotiated-MaxMpxCount.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0089-cifs-fix-issue-mounting-of-DFS-ROOT-when-redirecting.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0090-CIFS-Fix-a-spurious-error-in-cifs_push_posix_locks.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0091-UBI-fix-error-handling-in-ubi_scan.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0092-UBI-fix-eraseblock-picking-criteria.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0093-SUNRPC-We-must-not-use-list_for_each_entry_safe-in-r.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0094-usbnet-increase-URB-reference-count-before-usb_unlin.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0095-usbnet-don-t-clear-urb-dev-in-tx_complete.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0096-e1000e-Avoid-wrong-check-on-TX-hang.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0097-x86-32-Fix-endless-loop-when-processing-signals-for-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0098-proc-ns-use-d_set_d_op-API-to-set-dentry-ops-in-proc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0099-iommu-amd-Fix-section-warning-for-prealloc_protectio.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0100-sysctl-protect-poll-in-entries-that-may-go-away.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0101-hwmon-fam15h_power-Correct-sign-extension-of-running.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0102-lgdt330x-fix-signedness-error-in-i2c_read_demod_byte.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0103-pvrusb2-fix-7MHz-8MHz-DVB-T-tuner-support-for-HVR190.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0104-mxl111sf-fix-error-on-stream-stop-in-mxl111sf_ep6_st.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0105-NFSv4-Rate-limit-the-state-manager-warning-messages.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0106-PM-Hibernate-Enable-usermodehelpers-in-hibernate-err.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0107-jbd2-clear-BH_Delay-BH_Unwritten-in-journal_unmap_bu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0108-ext4-ignore-EXT4_INODE_JOURNAL_DATA-flag-with-delall.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0109-ext4-fix-race-between-unwritten-extent-conversion-an.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0110-ext4-fix-race-between-sync-and-completed-io-work.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0111-ext4-check-for-zero-length-extent.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0112-vfs-fix-d_ancestor-case-in-d_materialize_unique.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0113-ARM-tegra-select-required-CPU-and-L2-errata-options.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0114-udf-Fix-deadlock-in-udf_release_file.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0115-gpio-omap-fix-_set_gpio_irqenable-implementation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0116-gpio-davinci-fix-oops-on-unbanked-gpio-irq-request.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0117-gpio-davinci-fix-enabling-unbanked-GPIO-IRQs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0118-dm-crypt-fix-mempool-deadlock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0119-dm-crypt-add-missing-error-handling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0120-dm-exception-store-fix-init-error-path.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0121-dm-persistent-data-fix-btree-rebalancing-after-remov.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0122-dm-thin-fix-stacked-bi_next-usage.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0123-backlight-fix-typo-in-tosa_lcd.c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0124-xfs-Fix-oops-on-IO-error-during-xlog_recover_process.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0125-slub-Do-not-hold-slub_lock-when-calling-sysfs_slab_a.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0126-NFSv4-Fix-two-infinite-loops-in-the-mount-code.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0127-NFSv4.1-Fix-layoutcommit-error-handling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0128-module-Remove-module-size-limit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0129-Bluetooth-btusb-fix-bInterval-for-high-super-speed-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0130-drm-i915-suspend-fbdev-device-around-suspend-hiberna.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0131-Fix-pppol2tp-getsockname.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0132-ipv6-fix-incorrent-ipv6-ipsec-packet-fragment.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0133-net-bpf_jit-fix-BPF_S_LDX_B_MSH-compilation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0134-net-fix-a-potential-rcu_read_lock-imbalance-in-rt6_f.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0135-net-fix-napi_reuse_skb-skb-reserve.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0136-Remove-printk-from-rds_sendmsg.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0137-sky2-override-for-PCI-legacy-power-management.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0138-xfrm-Access-the-replay-notify-functions-via-the-regi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0139-lockd-fix-arg-parsing-for-grace_period-and-timeout.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0140-x86-tsc-Skip-refined-tsc-calibration-on-systems-with.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0141-x86-tls-Off-by-one-limit-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0142-compat-use-sys_sendfile64-implementation-for-sendfil.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0143-rtc-Provide-flag-for-rtc-devices-that-don-t-support-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0144-nfsd-don-t-allow-zero-length-strings-in-cache_parse.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0145-serial-sh-sci-fix-a-race-of-DMA-submit_tx-on-transfe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0146-ASPM-Fix-pcie-devices-with-non-pcie-children.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0147-Linux-3.2.14.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 39cc130..df92c93 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r7"
+MACHINE_KERNEL_PR = "r8"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0001-USB-option-Add-MediaTek-MT6276M-modem-app-interfaces.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0001-USB-option-Add-MediaTek-MT6276M-modem-app-interfaces.patch
new file mode 100644
index 0000000..f523a33
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0001-USB-option-Add-MediaTek-MT6276M-modem-app-interfaces.patch
@@ -0,0 +1,45 @@
+From cc33a57bd7f9104a9c2f77f11dc3e7f9c22b9340 Mon Sep 17 00:00:00 2001
+From: Meng Zhang <meng.zhang@mediatek.com>
+Date: Mon, 27 Feb 2012 08:24:19 +0100
+Subject: [PATCH 001/147] USB: option: Add MediaTek MT6276M modem&app
+ interfaces
+
+commit 0d8520a1d7f43328bc7085d4244d93c595064157 upstream.
+
+Add MEDIATEK products to Option driver
+
+Signed-off-by: Meng Zhang <meng.zhang@mediatek.com>
+Signed-off-by: Matthias Urlichs <matthias@urlichs.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |    7 +++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 68fa8c7..547c9b9 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -484,6 +484,9 @@ static void option_instat_callback(struct urb *urb);
+ #define LG_VENDOR_ID				0x1004
+ #define LG_PRODUCT_L02C				0x618f
+ 
++/* MediaTek products */
++#define MEDIATEK_VENDOR_ID			0x0e8d
++
+ /* some devices interfaces need special handling due to a number of reasons */
+ enum option_blacklist_reason {
+ 		OPTION_BLACKLIST_NONE = 0,
+@@ -1198,6 +1201,10 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(VIETTEL_VENDOR_ID, VIETTEL_PRODUCT_VT1000, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZD_VENDOR_ID, ZD_PRODUCT_7000, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE(LG_VENDOR_ID, LG_PRODUCT_L02C) }, /* docomo L-02C modem */
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a1, 0xff, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a1, 0xff, 0x02, 0x01) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x02, 0x01) },        /* MediaTek MT6276M modem & app port */
+ 	{ } /* Terminating entry */
+ };
+ MODULE_DEVICE_TABLE(usb, option_ids);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0002-USB-option-driver-adding-support-for-Telit-CC864-SIN.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0002-USB-option-driver-adding-support-for-Telit-CC864-SIN.patch
new file mode 100644
index 0000000..2ee506a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0002-USB-option-driver-adding-support-for-Telit-CC864-SIN.patch
@@ -0,0 +1,44 @@
+From 17ad305add28a63e155a74678178a6ce6a6a5998 Mon Sep 17 00:00:00 2001
+From: Daniele Palmas <dnlplm@gmail.com>
+Date: Wed, 29 Feb 2012 15:32:05 +0100
+Subject: [PATCH 002/147] USB: option driver: adding support for Telit
+ CC864-SINGLE, CC864-DUAL and DE910-DUAL modems
+
+commit 7204cf584836c24b4b06e4ad4a8e6bb8ea84908e upstream.
+
+Adding PID for Telit CC864-SINGLE, CC864-DUAL and DE910-DUAL
+modems
+
+Signed-off-by: Daniele Palmas <dnlplm@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 547c9b9..3c4b7df 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -307,6 +307,9 @@ static void option_instat_callback(struct urb *urb);
+ #define TELIT_VENDOR_ID				0x1bc7
+ #define TELIT_PRODUCT_UC864E			0x1003
+ #define TELIT_PRODUCT_UC864G			0x1004
++#define TELIT_PRODUCT_CC864_DUAL		0x1005
++#define TELIT_PRODUCT_CC864_SINGLE		0x1006
++#define TELIT_PRODUCT_DE910_DUAL		0x1010
+ 
+ /* ZTE PRODUCTS */
+ #define ZTE_VENDOR_ID				0x19d2
+@@ -771,6 +774,9 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE(CMOTECH_VENDOR_ID, CMOTECH_PRODUCT_6008) },
+ 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_UC864E) },
+ 	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_UC864G) },
++	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_CC864_DUAL) },
++	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_CC864_SINGLE) },
++	{ USB_DEVICE(TELIT_VENDOR_ID, TELIT_PRODUCT_DE910_DUAL) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF622, 0xff, 0xff, 0xff) }, /* ZTE WCDMA products */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0002, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf1_blacklist },
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0003-USB-option-make-interface-blacklist-work-again.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0003-USB-option-make-interface-blacklist-work-again.patch
new file mode 100644
index 0000000..96d3243
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0003-USB-option-make-interface-blacklist-work-again.patch
@@ -0,0 +1,37 @@
+From ebdc22267ac3cd3aef9e300a553c0f32ac5da6f2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
+Date: Fri, 16 Mar 2012 12:56:44 +0100
+Subject: [PATCH 003/147] USB: option: make interface blacklist work again
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 963940cf472d76eca2d36296e461202cc6997352 upstream.
+
+commit 0d905fd "USB: option: convert Huawei K3765, K4505, K4605
+reservered interface to blacklist" accidentally ANDed two
+blacklist tests by leaving out a return.  This was not noticed
+because the two consecutive bracketless if statements made it
+syntactically correct.
+
+Signed-off-by: Bjørn Mork <bjorn@mork.no>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 3c4b7df..6410935 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -1373,6 +1373,7 @@ static int option_probe(struct usb_serial *serial,
+ 		serial->interface->cur_altsetting->desc.bInterfaceNumber,
+ 		OPTION_BLACKLIST_RESERVED_IF,
+ 		(const struct option_blacklist_info *) id->driver_info))
++		return -ENODEV;
+ 
+ 	/* Don't bind network interface on Samsung GT-B3730, it is handled by a separate module */
+ 	if (serial->dev->descriptor.idVendor == SAMSUNG_VENDOR_ID &&
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0004-USB-option-add-ZTE-MF820D.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0004-USB-option-add-ZTE-MF820D.patch
new file mode 100644
index 0000000..e8ceacb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0004-USB-option-add-ZTE-MF820D.patch
@@ -0,0 +1,37 @@
+From 0b49c52b5b44e5db6fe288173faec7136ea18c68 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
+Date: Fri, 16 Mar 2012 15:41:26 +0100
+Subject: [PATCH 004/147] USB: option: add ZTE MF820D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 5889d3d4209c1050b4a3c96c41faf6c0976a4acf upstream.
+
+This device presents a total of 5 interfaces with ff/ff/ff
+class/subclass/protocol. The last one of these is verified
+to be a QMI/wwan combined interface which should be handled
+by the qmi_wwan driver, so we blacklist it here.
+
+Signed-off-by: Bjørn Mork <bjorn@mork.no>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 6410935..54898c9 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -901,6 +901,8 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0162, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0164, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0165, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0167, 0xff, 0xff, 0xff),
++	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1012, 0xff, 0xff, 0xff) },
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0005-staging-zcache-avoid-AB-BA-deadlock-condition.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0005-staging-zcache-avoid-AB-BA-deadlock-condition.patch
new file mode 100644
index 0000000..fb8bfe2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0005-staging-zcache-avoid-AB-BA-deadlock-condition.patch
@@ -0,0 +1,66 @@
+From 24c8eaa136cf3193f2719e9d04cc4efea3b2b732 Mon Sep 17 00:00:00 2001
+From: Andrea Righi <andrea@betterlinux.com>
+Date: Mon, 20 Feb 2012 13:11:49 +0100
+Subject: [PATCH 005/147] staging: zcache: avoid AB-BA deadlock condition
+
+commit cfbc6a92212e74b07aa76c9e2f20c542e36077fb upstream.
+
+Commit 9256a47 fixed a deadlock condition, being sure that the buddy
+list spinlock is always taken before the page spinlock.
+
+However in zbud_free_and_delist() locking order is the opposite
+(page lock -> list lock).
+
+Possible unsafe locking scenario (reported by lockdep):
+
+        CPU0                    CPU1
+        ----                    ----
+   lock(&(&zbpg->lock)->rlock);
+                                lock(zbud_budlists_spinlock);
+                                lock(&(&zbpg->lock)->rlock);
+   lock(zbud_budlists_spinlock);
+
+Fix by grabbing the locks in opposite order in zbud_free_and_delist().
+
+Signed-off-by: Andrea Righi <andrea@betterlinux.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/zcache/zcache-main.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/staging/zcache/zcache-main.c b/drivers/staging/zcache/zcache-main.c
+index f5e469d..16ad9fe 100644
+--- a/drivers/staging/zcache/zcache-main.c
++++ b/drivers/staging/zcache/zcache-main.c
+@@ -299,10 +299,12 @@ static void zbud_free_and_delist(struct zbud_hdr *zh)
+ 	struct zbud_page *zbpg =
+ 		container_of(zh, struct zbud_page, buddy[budnum]);
+ 
++	spin_lock(&zbud_budlists_spinlock);
+ 	spin_lock(&zbpg->lock);
+ 	if (list_empty(&zbpg->bud_list)) {
+ 		/* ignore zombie page... see zbud_evict_pages() */
+ 		spin_unlock(&zbpg->lock);
++		spin_unlock(&zbud_budlists_spinlock);
+ 		return;
+ 	}
+ 	size = zbud_free(zh);
+@@ -310,7 +312,6 @@ static void zbud_free_and_delist(struct zbud_hdr *zh)
+ 	zh_other = &zbpg->buddy[(budnum == 0) ? 1 : 0];
+ 	if (zh_other->size == 0) { /* was unbuddied: unlist and free */
+ 		chunks = zbud_size_to_chunks(size) ;
+-		spin_lock(&zbud_budlists_spinlock);
+ 		BUG_ON(list_empty(&zbud_unbuddied[chunks].list));
+ 		list_del_init(&zbpg->bud_list);
+ 		zbud_unbuddied[chunks].count--;
+@@ -318,7 +319,6 @@ static void zbud_free_and_delist(struct zbud_hdr *zh)
+ 		zbud_free_raw_page(zbpg);
+ 	} else { /* was buddied: move remaining buddy to unbuddied list */
+ 		chunks = zbud_size_to_chunks(zh_other->size) ;
+-		spin_lock(&zbud_budlists_spinlock);
+ 		list_del_init(&zbpg->bud_list);
+ 		zcache_zbud_buddied_count--;
+ 		list_add_tail(&zbpg->bud_list, &zbud_unbuddied[chunks].list);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0006-USB-ftdi_sio-fix-problem-when-the-manufacture-is-a-N.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0006-USB-ftdi_sio-fix-problem-when-the-manufacture-is-a-N.patch
new file mode 100644
index 0000000..b22cdfb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0006-USB-ftdi_sio-fix-problem-when-the-manufacture-is-a-N.patch
@@ -0,0 +1,36 @@
+From 662c920fb175331db0c7813edd168390b51d3e31 Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Tue, 28 Feb 2012 09:20:09 -0800
+Subject: [PATCH 006/147] USB: ftdi_sio: fix problem when the manufacture is a
+ NULL string
+
+commit 656d2b3964a9d0f9864d472f8dfa2dd7dd42e6c0 upstream.
+
+On some misconfigured ftdi_sio devices, if the manufacturer string is
+NULL, the kernel will oops when the device is plugged in.  This patch
+fixes the problem.
+
+Reported-by: Wojciech M Zabolotny <W.Zabolotny@elka.pw.edu.pl>
+Tested-by: Wojciech M Zabolotny <W.Zabolotny@elka.pw.edu.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index f030471..d170b2a 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -1763,7 +1763,8 @@ static int ftdi_8u2232c_probe(struct usb_serial *serial)
+ 
+ 	dbg("%s", __func__);
+ 
+-	if (strcmp(udev->manufacturer, "CALAO Systems") == 0)
++	if ((udev->manufacturer) &&
++	    (strcmp(udev->manufacturer, "CALAO Systems") == 0))
+ 		return ftdi_jtag_probe(serial);
+ 
+ 	return 0;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0007-USB-ftdi_sio-add-support-for-BeagleBone-rev-A5.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0007-USB-ftdi_sio-add-support-for-BeagleBone-rev-A5.patch
new file mode 100644
index 0000000..f87f426
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0007-USB-ftdi_sio-add-support-for-BeagleBone-rev-A5.patch
@@ -0,0 +1,35 @@
+From 5cabeb029a6230a2ade6a4e6821f444cc40816dd Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <jacmet@sunsite.dk>
+Date: Wed, 29 Feb 2012 10:05:37 +0100
+Subject: [PATCH 007/147] USB: ftdi_sio: add support for BeagleBone rev A5+
+
+commit 444aa7fa9bd752d19ce472d3e02558b987c3cc67 upstream.
+
+BeagleBone changed to the default FTDI 0403:6010 id in rev A5 to make life
+easier for Windows users, so we need a similar workaround as the Calao
+board to support it.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index d170b2a..30839d4 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -1763,8 +1763,8 @@ static int ftdi_8u2232c_probe(struct usb_serial *serial)
+ 
+ 	dbg("%s", __func__);
+ 
+-	if ((udev->manufacturer) &&
+-	    (strcmp(udev->manufacturer, "CALAO Systems") == 0))
++	if ((udev->manufacturer && !strcmp(udev->manufacturer, "CALAO Systems")) ||
++	    (udev->product && !strcmp(udev->product, "BeagleBone/XDS100")))
+ 		return ftdi_jtag_probe(serial);
+ 
+ 	return 0;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0008-USB-Microchip-VID-mislabeled-as-Hornby-VID-in-ftdi_s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0008-USB-Microchip-VID-mislabeled-as-Hornby-VID-in-ftdi_s.patch
new file mode 100644
index 0000000..7278bdd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0008-USB-Microchip-VID-mislabeled-as-Hornby-VID-in-ftdi_s.patch
@@ -0,0 +1,61 @@
+From f2f8f7f7d9dfc406b8e5a9a1b89e904318c8ac0f Mon Sep 17 00:00:00 2001
+From: Bruno Thomsen <bruno.thomsen@gmail.com>
+Date: Sun, 4 Mar 2012 15:19:14 +0100
+Subject: [PATCH 008/147] USB: Microchip VID mislabeled as Hornby VID in
+ ftdi_sio.
+
+commit c1cee1d84001815a1b4321c49b995254c0df3100 upstream.
+
+Microchip VID (0x04d8) was mislabeled as Hornby VID according to USB-IDs.
+
+A Full Speed USB Demo Board PID (0x000a) was mislabeled as
+Hornby Elite (an Digital Command Controller Console for model railways).
+
+Most likely the Hornby based their design on
+PIC18F87J50 Full Speed USB Demo Board.
+
+Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c     |    2 +-
+ drivers/usb/serial/ftdi_sio_ids.h |   10 +++++++---
+ 2 files changed, 8 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index 30839d4..363e995 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -797,7 +797,7 @@ static struct usb_device_id id_table_combined [] = {
+ 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+ 	{ USB_DEVICE(ADI_VID, ADI_GNICEPLUS_PID),
+ 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+-	{ USB_DEVICE(HORNBY_VID, HORNBY_ELITE_PID) },
++	{ USB_DEVICE(MICROCHIP_VID, MICROCHIP_USB_BOARD_PID) },
+ 	{ USB_DEVICE(JETI_VID, JETI_SPC1201_PID) },
+ 	{ USB_DEVICE(MARVELL_VID, MARVELL_SHEEVAPLUG_PID),
+ 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
+index 4eb7715..df87939 100644
+--- a/drivers/usb/serial/ftdi_sio_ids.h
++++ b/drivers/usb/serial/ftdi_sio_ids.h
+@@ -532,10 +532,14 @@
+ #define ADI_GNICEPLUS_PID	0xF001
+ 
+ /*
+- * Hornby Elite
++ * Microchip Technology, Inc.
++ *
++ * MICROCHIP_VID (0x04D8) and MICROCHIP_USB_BOARD_PID (0x000A) are also used by:
++ * Hornby Elite - Digital Command Control Console
++ * http://www.hornby.com/hornby-dcc/controllers/
+  */
+-#define HORNBY_VID		0x04D8
+-#define HORNBY_ELITE_PID	0x000A
++#define MICROCHIP_VID		0x04D8
++#define MICROCHIP_USB_BOARD_PID	0x000A /* CDC RS-232 Emulation Demo */
+ 
+ /*
+  * RATOC REX-USB60F
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0009-USB-ftdi_sio-new-PID-Distortec-JTAG-lock-pick.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0009-USB-ftdi_sio-new-PID-Distortec-JTAG-lock-pick.patch
new file mode 100644
index 0000000..38a990a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0009-USB-ftdi_sio-new-PID-Distortec-JTAG-lock-pick.patch
@@ -0,0 +1,46 @@
+From 42eb98a4b9dc721f8565ce0d3063db8d141f516b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20Wr=C3=B3bel?= <michal.wrobel@flytronic.pl>
+Date: Fri, 9 Mar 2012 14:40:18 +0100
+Subject: [PATCH 009/147] USB: ftdi_sio: new PID: Distortec JTAG-lock-pick
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 47594d5528f28a4c025c2955c68104c75815637c upstream.
+
+Signed-off-by: Michał Wróbel <michal.wrobel@flytronic.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c     |    2 ++
+ drivers/usb/serial/ftdi_sio_ids.h |    2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index 363e995..a319eaa 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -846,6 +846,8 @@ static struct usb_device_id id_table_combined [] = {
+ 	{ USB_DEVICE(ST_VID, ST_STMCLT1030_PID),
+ 		.driver_info = (kernel_ulong_t)&ftdi_stmclite_quirk },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_RF_R106) },
++	{ USB_DEVICE(FTDI_VID, FTDI_DISTORTEC_JTAG_LOCK_PICK_PID),
++		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+ 	{ },					/* Optional parameter entry */
+ 	{ }					/* Terminating entry */
+ };
+diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
+index df87939..bed1b1f 100644
+--- a/drivers/usb/serial/ftdi_sio_ids.h
++++ b/drivers/usb/serial/ftdi_sio_ids.h
+@@ -97,6 +97,8 @@
+ #define FTDI_TACTRIX_OPENPORT_13S_PID	0xCC49	/* OpenPort 1.3 Subaru */
+ #define FTDI_TACTRIX_OPENPORT_13U_PID	0xCC4A	/* OpenPort 1.3 Universal */
+ 
++#define FTDI_DISTORTEC_JTAG_LOCK_PICK_PID	0xCFF8
++
+ /* SCS HF Radio Modems PID's (http://www.scs-ptc.com) */
+ /* the VID is the standard ftdi vid (FTDI_VID) */
+ #define FTDI_SCS_DEVICE_0_PID 0xD010    /* SCS PTC-IIusb */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0010-USB-ftdi_sio-add-support-for-FT-X-series-devices.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0010-USB-ftdi_sio-add-support-for-FT-X-series-devices.patch
new file mode 100644
index 0000000..37f665b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0010-USB-ftdi_sio-add-support-for-FT-X-series-devices.patch
@@ -0,0 +1,150 @@
+From a1460f8a00ab8864ee14c39d4dfaa0dea4cff95e Mon Sep 17 00:00:00 2001
+From: Jim Paris <jim@jtan.com>
+Date: Wed, 14 Mar 2012 17:54:25 -0400
+Subject: [PATCH 010/147] USB: ftdi_sio: add support for FT-X series devices
+
+commit dc0827c128c0ee5a58b822b99d662b59f4b8e970 upstream.
+
+Add PID 0x6015, corresponding to the new series of FT-X chips
+(FT220XD, FT201X, FT220X, FT221X, FT230X, FT231X, FT240X).  They all
+appear as serial devices, and seem indistinguishable except for the
+default product string stored in their EEPROM.  The baudrate
+generation matches FT232RL devices.
+
+Tested with a FT201X and FT230X at various baudrates (100 - 3000000).
+
+Sample dmesg:
+    ftdi_sio: v1.6.0:USB FTDI Serial Converters Driver
+    usb 2-1: new full-speed USB device number 6 using ohci_hcd
+    usb 2-1: New USB device found, idVendor=0403, idProduct=6015
+    usb 2-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
+    usb 2-1: Product: FT230X USB Half UART
+    usb 2-1: Manufacturer: FTDI
+    usb 2-1: SerialNumber: DC001WI6
+    ftdi_sio 2-1:1.0: FTDI USB Serial Device converter detected
+    drivers/usb/serial/ftdi_sio.c: ftdi_sio_port_probe
+    drivers/usb/serial/ftdi_sio.c: ftdi_determine_type: bcdDevice = 0x1000, bNumInterfaces = 1
+    usb 2-1: Detected FT-X
+    usb 2-1: Number of endpoints 2
+    usb 2-1: Endpoint 1 MaxPacketSize 64
+    usb 2-1: Endpoint 2 MaxPacketSize 64
+    usb 2-1: Setting MaxPacketSize 64
+    drivers/usb/serial/ftdi_sio.c: read_latency_timer
+    drivers/usb/serial/ftdi_sio.c: write_latency_timer: setting latency timer = 1
+    drivers/usb/serial/ftdi_sio.c: create_sysfs_attrs
+    drivers/usb/serial/ftdi_sio.c: sysfs attributes for FT-X
+    usb 2-1: FTDI USB Serial Device converter now attached to ttyUSB0
+
+Signed-off-by: Jim Paris <jim@jtan.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c     |   20 +++++++++++++++-----
+ drivers/usb/serial/ftdi_sio.h     |    3 ++-
+ drivers/usb/serial/ftdi_sio_ids.h |    1 +
+ 3 files changed, 18 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index a319eaa..b64fddc 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -188,6 +188,7 @@ static struct usb_device_id id_table_combined [] = {
+ 		.driver_info = (kernel_ulong_t)&ftdi_8u2232c_quirk },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_4232H_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_232H_PID) },
++	{ USB_DEVICE(FTDI_VID, FTDI_FTX_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_MICRO_CHAMELEON_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_RELAIS_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_OPENDCC_PID) },
+@@ -870,7 +871,8 @@ static const char *ftdi_chip_name[] = {
+ 	[FT232RL] = "FT232RL",
+ 	[FT2232H] = "FT2232H",
+ 	[FT4232H] = "FT4232H",
+-	[FT232H]  = "FT232H"
++	[FT232H]  = "FT232H",
++	[FTX]     = "FT-X"
+ };
+ 
+ 
+@@ -1171,7 +1173,8 @@ static __u32 get_ftdi_divisor(struct tty_struct *tty,
+ 		break;
+ 	case FT232BM: /* FT232BM chip */
+ 	case FT2232C: /* FT2232C chip */
+-	case FT232RL:
++	case FT232RL: /* FT232RL chip */
++	case FTX:     /* FT-X series */
+ 		if (baud <= 3000000) {
+ 			__u16 product_id = le16_to_cpu(
+ 				port->serial->dev->descriptor.idProduct);
+@@ -1460,10 +1463,14 @@ static void ftdi_determine_type(struct usb_serial_port *port)
+ 	} else if (version < 0x900) {
+ 		/* Assume it's an FT232RL */
+ 		priv->chip_type = FT232RL;
+-	} else {
++	} else if (version < 0x1000) {
+ 		/* Assume it's an FT232H */
+ 		priv->chip_type = FT232H;
++	} else {
++		/* Assume it's an FT-X series device */
++		priv->chip_type = FTX;
+ 	}
++
+ 	dev_info(&udev->dev, "Detected %s\n", ftdi_chip_name[priv->chip_type]);
+ }
+ 
+@@ -1591,7 +1598,8 @@ static int create_sysfs_attrs(struct usb_serial_port *port)
+ 		     priv->chip_type == FT232RL ||
+ 		     priv->chip_type == FT2232H ||
+ 		     priv->chip_type == FT4232H ||
+-		     priv->chip_type == FT232H)) {
++		     priv->chip_type == FT232H ||
++		     priv->chip_type == FTX)) {
+ 			retval = device_create_file(&port->dev,
+ 						    &dev_attr_latency_timer);
+ 		}
+@@ -1613,7 +1621,8 @@ static void remove_sysfs_attrs(struct usb_serial_port *port)
+ 		    priv->chip_type == FT232RL ||
+ 		    priv->chip_type == FT2232H ||
+ 		    priv->chip_type == FT4232H ||
+-                    priv->chip_type == FT232H) {
++		    priv->chip_type == FT232H ||
++		    priv->chip_type == FTX) {
+ 			device_remove_file(&port->dev, &dev_attr_latency_timer);
+ 		}
+ 	}
+@@ -2287,6 +2296,7 @@ static int ftdi_tiocmget(struct tty_struct *tty)
+ 	case FT2232H:
+ 	case FT4232H:
+ 	case FT232H:
++	case FTX:
+ 		len = 2;
+ 		break;
+ 	default:
+diff --git a/drivers/usb/serial/ftdi_sio.h b/drivers/usb/serial/ftdi_sio.h
+index 19584fa..ed58c6f 100644
+--- a/drivers/usb/serial/ftdi_sio.h
++++ b/drivers/usb/serial/ftdi_sio.h
+@@ -157,7 +157,8 @@ enum ftdi_chip_type {
+ 	FT232RL = 5,
+ 	FT2232H = 6,
+ 	FT4232H = 7,
+-	FT232H  = 8
++	FT232H  = 8,
++	FTX     = 9,
+ };
+ 
+ enum ftdi_sio_baudrate {
+diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
+index bed1b1f..ac1c42e 100644
+--- a/drivers/usb/serial/ftdi_sio_ids.h
++++ b/drivers/usb/serial/ftdi_sio_ids.h
+@@ -23,6 +23,7 @@
+ #define FTDI_8U2232C_PID 0x6010 /* Dual channel device */
+ #define FTDI_4232H_PID 0x6011 /* Quad channel hi-speed device */
+ #define FTDI_232H_PID  0x6014 /* Single channel hi-speed device */
++#define FTDI_FTX_PID   0x6015 /* FT-X series (FT201X, FT230X, FT231X, etc) */
+ #define FTDI_SIO_PID	0x8372	/* Product Id SIO application of 8U100AX */
+ #define FTDI_232RL_PID  0xFBFA  /* Product ID for FT232RL */
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0011-USB-ftdi_sio-new-PID-LUMEL-PD12.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0011-USB-ftdi_sio-new-PID-LUMEL-PD12.patch
new file mode 100644
index 0000000..035c7eb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0011-USB-ftdi_sio-new-PID-LUMEL-PD12.patch
@@ -0,0 +1,45 @@
+From f1a77f929e5e9c5399bf0e0a589280719f96654c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Micha=C5=82=20Wr=C3=B3bel?= <michal.wrobel@flytronic.pl>
+Date: Thu, 15 Mar 2012 17:24:04 +0100
+Subject: [PATCH 011/147] USB: ftdi_sio: new PID: LUMEL PD12
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 57e596f3af88ef52dea9640ed5e34ecd38893a02 upstream.
+
+Signed-off-by: Michał Wróbel <michal.wrobel@flytronic.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c     |    1 +
+ drivers/usb/serial/ftdi_sio_ids.h |    2 ++
+ 2 files changed, 3 insertions(+)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index b64fddc..3f3ccf6 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -849,6 +849,7 @@ static struct usb_device_id id_table_combined [] = {
+ 	{ USB_DEVICE(FTDI_VID, FTDI_RF_R106) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_DISTORTEC_JTAG_LOCK_PICK_PID),
+ 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
++	{ USB_DEVICE(FTDI_VID, FTDI_LUMEL_PD12_PID) },
+ 	{ },					/* Optional parameter entry */
+ 	{ }					/* Terminating entry */
+ };
+diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
+index ac1c42e..abf6bbc 100644
+--- a/drivers/usb/serial/ftdi_sio_ids.h
++++ b/drivers/usb/serial/ftdi_sio_ids.h
+@@ -30,6 +30,8 @@
+ 
+ /*** third-party PIDs (using FTDI_VID) ***/
+ 
++#define FTDI_LUMEL_PD12_PID	0x6002
++
+ /*
+  * Marvell OpenRD Base, Client
+  * http://www.open-rd.org
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0012-powerpc-usb-fix-bug-of-kernel-hang-when-initializing.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0012-powerpc-usb-fix-bug-of-kernel-hang-when-initializing.patch
new file mode 100644
index 0000000..f40aa0f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0012-powerpc-usb-fix-bug-of-kernel-hang-when-initializing.patch
@@ -0,0 +1,55 @@
+From 9091aa838fdba8fef22a629f43cd039daa714da6 Mon Sep 17 00:00:00 2001
+From: Shengzhou Liu <Shengzhou.Liu@freescale.com>
+Date: Thu, 16 Feb 2012 18:02:20 +0800
+Subject: [PATCH 012/147] powerpc/usb: fix bug of kernel hang when
+ initializing usb
+
+commit 28c56ea1431421dec51b7b229369e991481453df upstream.
+
+If USB UTMI PHY is not enable, writing to portsc register will lead to
+kernel hang during boot up.
+
+Signed-off-by: Shengzhou Liu <Shengzhou.Liu@freescale.com>
+Reported-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/ehci-fsl.c |    4 ++++
+ drivers/usb/host/ehci-fsl.h |    1 +
+ 2 files changed, 5 insertions(+)
+
+diff --git a/drivers/usb/host/ehci-fsl.c b/drivers/usb/host/ehci-fsl.c
+index b556a72..da487fd 100644
+--- a/drivers/usb/host/ehci-fsl.c
++++ b/drivers/usb/host/ehci-fsl.c
+@@ -216,6 +216,8 @@ static void ehci_fsl_setup_phy(struct ehci_hcd *ehci,
+ 			       unsigned int port_offset)
+ {
+ 	u32 portsc;
++	struct usb_hcd *hcd = ehci_to_hcd(ehci);
++	void __iomem *non_ehci = hcd->regs;
+ 
+ 	portsc = ehci_readl(ehci, &ehci->regs->port_status[port_offset]);
+ 	portsc &= ~(PORT_PTS_MSK | PORT_PTS_PTW);
+@@ -231,6 +233,8 @@ static void ehci_fsl_setup_phy(struct ehci_hcd *ehci,
+ 		portsc |= PORT_PTS_PTW;
+ 		/* fall through */
+ 	case FSL_USB2_PHY_UTMI:
++		/* enable UTMI PHY */
++		setbits32(non_ehci + FSL_SOC_USB_CTRL, CTRL_UTMI_PHY_EN);
+ 		portsc |= PORT_PTS_UTMI;
+ 		break;
+ 	case FSL_USB2_PHY_NONE:
+diff --git a/drivers/usb/host/ehci-fsl.h b/drivers/usb/host/ehci-fsl.h
+index 4918062..bea5013 100644
+--- a/drivers/usb/host/ehci-fsl.h
++++ b/drivers/usb/host/ehci-fsl.h
+@@ -45,5 +45,6 @@
+ #define FSL_SOC_USB_PRICTRL	0x40c	/* NOTE: big-endian */
+ #define FSL_SOC_USB_SICTRL	0x410	/* NOTE: big-endian */
+ #define FSL_SOC_USB_CTRL	0x500	/* NOTE: big-endian */
++#define CTRL_UTMI_PHY_EN	(1<<9)
+ #define SNOOP_SIZE_2GB		0x1e
+ #endif				/* _EHCI_FSL_H */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0013-staging-r8712u-Add-missing-initialization-and-remove.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0013-staging-r8712u-Add-missing-initialization-and-remove.patch
new file mode 100644
index 0000000..a659fd5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0013-staging-r8712u-Add-missing-initialization-and-remove.patch
@@ -0,0 +1,107 @@
+From 737186258370f25f44b7aa152ae1bef1e308a929 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Thu, 9 Feb 2012 16:37:17 -0600
+Subject: [PATCH 013/147] staging: r8712u: Add missing initialization and
+ remove configuration parameter CONFIG_R8712_AP
+
+commit 073863432f7eaa23c7c09733414d4be2eabf5eef upstream.
+
+When this driver was upgraded to the vendor 20100831 version in
+commit 93c55dda092c7 et al,, one listhead initialization was missed.
+This broke complete operation of the driver whenever AP mode was
+enabled. This fixes https://bugs.archlinux.org/task/27996.
+
+The configuration parameter R8712_AP is misleading as the driver cannot
+function as an AP without a heavily hacked version of hostapd. Thus, it
+makes sense to remove the parameter; however the code and data configured
+for the option is left in.
+
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/rtl8712/Kconfig           |    7 -------
+ drivers/staging/rtl8712/rtl871x_sta_mgt.c |    5 +----
+ drivers/staging/rtl8712/sta_info.h        |    4 ----
+ 3 files changed, 1 insertion(+), 15 deletions(-)
+
+diff --git a/drivers/staging/rtl8712/Kconfig b/drivers/staging/rtl8712/Kconfig
+index ea37473..6a43312 100644
+--- a/drivers/staging/rtl8712/Kconfig
++++ b/drivers/staging/rtl8712/Kconfig
+@@ -9,13 +9,6 @@ config R8712U
+ 	This option adds the Realtek RTL8712 USB device such as the D-Link DWA-130.
+ 	If built as a module, it will be called r8712u.
+ 
+-config R8712_AP
+-	bool "Realtek RTL8712U AP code"
+-	depends on R8712U
+-	default N
+-	---help---
+-	This option allows the Realtek RTL8712 USB device to be an Access Point.
+-
+ config R8712_TX_AGGR
+ 	bool "Realtek RTL8712U Transmit Aggregation code"
+ 	depends on R8712U && BROKEN
+diff --git a/drivers/staging/rtl8712/rtl871x_sta_mgt.c b/drivers/staging/rtl8712/rtl871x_sta_mgt.c
+index 64f5696..1247b3d 100644
+--- a/drivers/staging/rtl8712/rtl871x_sta_mgt.c
++++ b/drivers/staging/rtl8712/rtl871x_sta_mgt.c
+@@ -42,9 +42,8 @@ static void _init_stainfo(struct sta_info *psta)
+ 	_init_listhead(&psta->hash_list);
+ 	_r8712_init_sta_xmit_priv(&psta->sta_xmitpriv);
+ 	_r8712_init_sta_recv_priv(&psta->sta_recvpriv);
+-#ifdef CONFIG_R8712_AP
++	_init_listhead(&psta->asoc_list);
+ 	_init_listhead(&psta->auth_list);
+-#endif
+ }
+ 
+ u32 _r8712_init_sta_priv(struct	sta_priv *pstapriv)
+@@ -71,10 +70,8 @@ u32 _r8712_init_sta_priv(struct	sta_priv *pstapriv)
+ 				 get_list_head(&pstapriv->free_sta_queue));
+ 		psta++;
+ 	}
+-#ifdef CONFIG_R8712_AP
+ 	_init_listhead(&pstapriv->asoc_list);
+ 	_init_listhead(&pstapriv->auth_list);
+-#endif
+ 	return _SUCCESS;
+ }
+ 
+diff --git a/drivers/staging/rtl8712/sta_info.h b/drivers/staging/rtl8712/sta_info.h
+index 48d6a14..f8016e9 100644
+--- a/drivers/staging/rtl8712/sta_info.h
++++ b/drivers/staging/rtl8712/sta_info.h
+@@ -90,7 +90,6 @@ struct sta_info {
+ 	 * curr_network(mlme_priv/security_priv/qos/ht) : AP CAP/INFO
+ 	 * sta_info: (AP & STA) CAP/INFO
+ 	 */
+-#ifdef CONFIG_R8712_AP
+ 	struct list_head asoc_list;
+ 	struct list_head auth_list;
+ 	unsigned int expire_to;
+@@ -98,7 +97,6 @@ struct sta_info {
+ 	unsigned int authalg;
+ 	unsigned char chg_txt[128];
+ 	unsigned int tx_ra_bitmap;
+-#endif
+ };
+ 
+ struct	sta_priv {
+@@ -111,13 +109,11 @@ struct	sta_priv {
+ 	struct  __queue sleep_q;
+ 	struct  __queue wakeup_q;
+ 	struct _adapter *padapter;
+-#ifdef CONFIG_R8712_AP
+ 	struct list_head asoc_list;
+ 	struct list_head auth_list;
+ 	unsigned int auth_to;  /* sec, time to expire in authenticating. */
+ 	unsigned int assoc_to; /* sec, time to expire before associating. */
+ 	unsigned int expire_to; /* sec , time to expire after associated. */
+-#endif
+ };
+ 
+ static inline u32 wifi_mac_hash(u8 *mac)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0014-staging-r8712u-Fix-regression-introduced-by-commit-a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0014-staging-r8712u-Fix-regression-introduced-by-commit-a.patch
new file mode 100644
index 0000000..8a983e9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0014-staging-r8712u-Fix-regression-introduced-by-commit-a.patch
@@ -0,0 +1,53 @@
+From 10fcebe06f12c7f87ad05084848c51d69f118505 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Sat, 25 Feb 2012 18:10:20 -0600
+Subject: [PATCH 014/147] staging: r8712u: Fix regression introduced by commit
+ a5ee652
+
+commit 9f4bc8cf3fe750ed093856a5f5d41c11cc12ad22 upstream.
+
+In commit a5ee652 "staging: r8712u: Interface-state not fully tracked",
+the private boolean "bup" was set false when the interface was brought down,
+as that seemed appropriate. This change has not caused any problems when
+using NetworkManager or manual control of the device; however, when wicd
+control is used, there is a locking problem in wpa_supplicant, as shown in
+https://bugzilla.kernel.org/show_bug.cgi?id=42818.
+
+This fix reverts the only code change in commit a5ee652. My
+analysis is that "bup" is badly named. In its present form, it
+seems to indicate the up/down state of the device, but its usage
+is more consistent with an initialized/uninitialized state. That
+problem will be addressed in a later patch.
+
+Note: Commit 8c213fa, which introdued asynchronous firmware loading
+for this driver, exposed this bug to a greater extent. That bug
+is addressed in the next patch in this series.
+
+This bug is also responsible for the bug in
+https://bugzilla.kernel.org/show_bug.cgi?id=42815. and this bug is
+also part of the problems discussed at https://bugs.archlinux.org/task/27996#comment89950.
+
+Tested-by: Alberto Lago Ballesteros <saniukeokusainaya@gmail.com>
+Tested-by: Adrian <agib@gmx.de>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/rtl8712/os_intfs.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
+index 98a3d68..fb11743 100644
+--- a/drivers/staging/rtl8712/os_intfs.c
++++ b/drivers/staging/rtl8712/os_intfs.c
+@@ -476,8 +476,6 @@ static int netdev_close(struct net_device *pnetdev)
+ 	r8712_free_assoc_resources(padapter);
+ 	/*s2-4.*/
+ 	r8712_free_network_queue(padapter);
+-	/* The interface is no longer Up: */
+-	padapter->bup = false;
+ 	release_firmware(padapter->fw);
+ 	/* never exit with a firmware callback pending */
+ 	wait_for_completion(&padapter->rtl8712_fw_ready);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0015-staging-r8712u-Fix-regression-in-signal-level-after-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0015-staging-r8712u-Fix-regression-in-signal-level-after-.patch
new file mode 100644
index 0000000..9cf3b16
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0015-staging-r8712u-Fix-regression-in-signal-level-after-.patch
@@ -0,0 +1,47 @@
+From a8385f8f3089aba9d0d9b0faf580e89510648367 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Sun, 26 Feb 2012 22:08:36 -0600
+Subject: [PATCH 015/147] staging: r8712u: Fix regression in signal level
+ after commit c6dc001
+
+commit da3e6ec2f443ac00aa623c5921e3521f5f38efe4 upstream.
+
+In commit c6dc001 "staging: r8712u: Merging Realtek's latest (v2.6.6).
+Various fixes", the returned qual.qual member of the iw_statistics
+struct was changed. For strong signals, this change made no difference;
+however for medium and weak signals it results in a low signal that
+shows considerable fluctuation, When using wicd for a medium-strength
+AP, the value reported in the status line is reduced from 100% to 60% by
+this bug.
+
+This problem is reported in https://bugzilla.kernel.org/show_bug.cgi?id=42826.
+
+Reported-and-tested-by: Robert Crawford <wrc1944@gmail.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/rtl8712/rtl871x_ioctl_linux.c |    8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+index 507584b8..ef35bc2 100644
+--- a/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
++++ b/drivers/staging/rtl8712/rtl871x_ioctl_linux.c
+@@ -2380,13 +2380,7 @@ static struct iw_statistics *r871x_get_wireless_stats(struct net_device *dev)
+ 		tmp_qual = padapter->recvpriv.signal;
+ 		tmp_noise = padapter->recvpriv.noise;
+ 		piwstats->qual.level = tmp_level;
+-		/*piwstats->qual.qual = tmp_qual;
+-		 * The NetworkManager of Fedora 10, 13 will use the link
+-		 * quality for its display.
+-		 * So, use the fw_rssi on link quality variable because
+-		 * fw_rssi will be updated per 2 seconds.
+-		 */
+-		piwstats->qual.qual = tmp_level;
++		piwstats->qual.qual = tmp_qual;
+ 		piwstats->qual.noise = tmp_noise;
+ 	}
+ 	piwstats->qual.updated = IW_QUAL_ALL_UPDATED;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0016-usb-dwc3-fix-bogus-test-in-dwc3_gadget_start_isoc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0016-usb-dwc3-fix-bogus-test-in-dwc3_gadget_start_isoc.patch
new file mode 100644
index 0000000..22a9c5c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0016-usb-dwc3-fix-bogus-test-in-dwc3_gadget_start_isoc.patch
@@ -0,0 +1,54 @@
+From 0a7695bc47ddfdeaaa1b30b88912f38a481e3abd Mon Sep 17 00:00:00 2001
+From: Paul Zimmerman <Paul.Zimmerman@synopsys.com>
+Date: Fri, 17 Feb 2012 14:10:16 -0800
+Subject: [PATCH 016/147] usb: dwc3: fix bogus test in dwc3_gadget_start_isoc
+
+commit 9bafa56c7cee5c6fa68de5924220abb220c7e229 upstream.
+
+Zero is a valid value for a microframe number. So remove the bogus
+test for non-zero in dwc3_gadget_start_isoc().
+
+Signed-off-by: Paul Zimmerman <paulz@synopsys.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/dwc3/gadget.c |   16 +++++-----------
+ 1 file changed, 5 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
+index 5802720..41a2ea6 100644
+--- a/drivers/usb/dwc3/gadget.c
++++ b/drivers/usb/dwc3/gadget.c
+@@ -1405,7 +1405,7 @@ static void dwc3_endpoint_transfer_complete(struct dwc3 *dwc,
+ static void dwc3_gadget_start_isoc(struct dwc3 *dwc,
+ 		struct dwc3_ep *dep, const struct dwc3_event_depevt *event)
+ {
+-	u32 uf;
++	u32 uf, mask;
+ 
+ 	if (list_empty(&dep->request_list)) {
+ 		dev_vdbg(dwc->dev, "ISOC ep %s run out for requests.\n",
+@@ -1413,16 +1413,10 @@ static void dwc3_gadget_start_isoc(struct dwc3 *dwc,
+ 		return;
+ 	}
+ 
+-	if (event->parameters) {
+-		u32 mask;
+-
+-		mask = ~(dep->interval - 1);
+-		uf = event->parameters & mask;
+-		/* 4 micro frames in the future */
+-		uf += dep->interval * 4;
+-	} else {
+-		uf = 0;
+-	}
++	mask = ~(dep->interval - 1);
++	uf = event->parameters & mask;
++	/* 4 micro frames in the future */
++	uf += dep->interval * 4;
+ 
+ 	__dwc3_gadget_kick_transfer(dep, uf, 1);
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0017-usb-dwc3-use-proper-function-for-setting-endpoint-na.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0017-usb-dwc3-use-proper-function-for-setting-endpoint-na.patch
new file mode 100644
index 0000000..582b9f9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0017-usb-dwc3-use-proper-function-for-setting-endpoint-na.patch
@@ -0,0 +1,46 @@
+From cdbcc2f017a258caca6390e7353709a6603bc452 Mon Sep 17 00:00:00 2001
+From: Anton Tikhomirov <av.tikhomirov@samsung.com>
+Date: Thu, 23 Feb 2012 15:38:46 +0900
+Subject: [PATCH 017/147] usb: dwc3: use proper function for setting endpoint
+ name
+
+commit 27a78d6a283d6782438f72306746afe4bf44c215 upstream.
+
+It's wrong to use the size of array as an argument for strncat.
+Memory corruption is possible. strlcat is exactly what we need here.
+
+Signed-off-by: Anton Tikhomirov <av.tikhomirov@samsung.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/dwc3/gadget.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/usb/dwc3/gadget.c b/drivers/usb/dwc3/gadget.c
+index 41a2ea6..dfcda94 100644
+--- a/drivers/usb/dwc3/gadget.c
++++ b/drivers/usb/dwc3/gadget.c
+@@ -449,16 +449,16 @@ static int dwc3_gadget_ep_enable(struct usb_ep *ep,
+ 
+ 	switch (usb_endpoint_type(desc)) {
+ 	case USB_ENDPOINT_XFER_CONTROL:
+-		strncat(dep->name, "-control", sizeof(dep->name));
++		strlcat(dep->name, "-control", sizeof(dep->name));
+ 		break;
+ 	case USB_ENDPOINT_XFER_ISOC:
+-		strncat(dep->name, "-isoc", sizeof(dep->name));
++		strlcat(dep->name, "-isoc", sizeof(dep->name));
+ 		break;
+ 	case USB_ENDPOINT_XFER_BULK:
+-		strncat(dep->name, "-bulk", sizeof(dep->name));
++		strlcat(dep->name, "-bulk", sizeof(dep->name));
+ 		break;
+ 	case USB_ENDPOINT_XFER_INT:
+-		strncat(dep->name, "-int", sizeof(dep->name));
++		strlcat(dep->name, "-int", sizeof(dep->name));
+ 		break;
+ 	default:
+ 		dev_err(dwc->dev, "invalid endpoint transfer type\n");
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0018-usb-gadgetfs-return-number-of-bytes-on-ep0-read-requ.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0018-usb-gadgetfs-return-number-of-bytes-on-ep0-read-requ.patch
new file mode 100644
index 0000000..c226f85
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0018-usb-gadgetfs-return-number-of-bytes-on-ep0-read-requ.patch
@@ -0,0 +1,37 @@
+From 868208aaab0df10df8bff2cb3bc2ccae0fa0a16d Mon Sep 17 00:00:00 2001
+From: Thomas Faber <thfabba@gmx.de>
+Date: Fri, 2 Mar 2012 09:41:50 +0100
+Subject: [PATCH 018/147] usb: gadgetfs: return number of bytes on ep0 read
+ request
+
+commit 85b4b3c8c189e0159101f7628a71411af072ff69 upstream.
+
+A read from GadgetFS endpoint 0 during the data stage of a control
+request would always return 0 on success (as returned by
+wait_event_interruptible) despite having written data into the user
+buffer.
+This patch makes it correctly set the return value to the number of
+bytes read.
+
+Signed-off-by: Thomas Faber <thfabba@gmx.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/inode.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/usb/gadget/inode.c b/drivers/usb/gadget/inode.c
+index 9361251..2a96f57 100644
+--- a/drivers/usb/gadget/inode.c
++++ b/drivers/usb/gadget/inode.c
+@@ -1043,6 +1043,8 @@ ep0_read (struct file *fd, char __user *buf, size_t len, loff_t *ptr)
+ // FIXME don't call this with the spinlock held ...
+ 				if (copy_to_user (buf, dev->req->buf, len))
+ 					retval = -EFAULT;
++				else
++					retval = len;
+ 				clean_req (dev->gadget->ep0, dev->req);
+ 				/* NOTE userspace can't yet choose to stall */
+ 			}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0019-USB-gadget-Make-g_hid-device-class-conform-to-spec.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0019-USB-gadget-Make-g_hid-device-class-conform-to-spec.patch
new file mode 100644
index 0000000..4751b7f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0019-USB-gadget-Make-g_hid-device-class-conform-to-spec.patch
@@ -0,0 +1,39 @@
+From 68f1d29a63c33ab9478d1d5b11d4ba522fa3d167 Mon Sep 17 00:00:00 2001
+From: Orjan Friberg <of@flatfrog.com>
+Date: Wed, 7 Mar 2012 17:16:14 +0100
+Subject: [PATCH 019/147] USB: gadget: Make g_hid device class conform to
+ spec.
+
+commit 33d2832ab0149a26418d360af3c444969a63fb28 upstream.
+
+HID devices should specify this in their interface descriptors, not in the
+device descriptor. This fixes a "missing hardware id" bug under Windows 7 with
+a VIA VL800 (3.0) controller.
+
+Signed-off-by: Orjan Friberg <of@flatfrog.com>
+Cc: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/hid.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/gadget/hid.c b/drivers/usb/gadget/hid.c
+index f888c3e..3493adf 100644
+--- a/drivers/usb/gadget/hid.c
++++ b/drivers/usb/gadget/hid.c
+@@ -60,9 +60,9 @@ static struct usb_device_descriptor device_desc = {
+ 	/* .bDeviceClass =		USB_CLASS_COMM, */
+ 	/* .bDeviceSubClass =	0, */
+ 	/* .bDeviceProtocol =	0, */
+-	.bDeviceClass =		0xEF,
+-	.bDeviceSubClass =	2,
+-	.bDeviceProtocol =	1,
++	.bDeviceClass =		USB_CLASS_PER_INTERFACE,
++	.bDeviceSubClass =	0,
++	.bDeviceProtocol =	0,
+ 	/* .bMaxPacketSize0 = f(hardware) */
+ 
+ 	/* Vendor and product id can be overridden by module parameters.  */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0020-futex-Cover-all-PI-opcodes-with-cmpxchg-enabled-chec.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0020-futex-Cover-all-PI-opcodes-with-cmpxchg-enabled-chec.patch
new file mode 100644
index 0000000..878a9a5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0020-futex-Cover-all-PI-opcodes-with-cmpxchg-enabled-chec.patch
@@ -0,0 +1,64 @@
+From 67cc4b87ba54c6101c7fd5dbde9b2547463339d1 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Wed, 15 Feb 2012 12:08:34 +0100
+Subject: [PATCH 020/147] futex: Cover all PI opcodes with cmpxchg enabled
+ check
+
+commit 59263b513c11398cd66a52d4c5b2b118ce1e0359 upstream.
+
+Some of the newer futex PI opcodes do not check the cmpxchg enabled
+variable and call unconditionally into the handling functions. Cover
+all PI opcodes in a separate check.
+
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Darren Hart <dvhart@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/futex.c |   19 +++++++++++++------
+ 1 file changed, 13 insertions(+), 6 deletions(-)
+
+diff --git a/kernel/futex.c b/kernel/futex.c
+index 1614be2..0677023 100644
+--- a/kernel/futex.c
++++ b/kernel/futex.c
+@@ -2641,6 +2641,16 @@ long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
+ 	}
+ 
+ 	switch (cmd) {
++	case FUTEX_LOCK_PI:
++	case FUTEX_UNLOCK_PI:
++	case FUTEX_TRYLOCK_PI:
++	case FUTEX_WAIT_REQUEUE_PI:
++	case FUTEX_CMP_REQUEUE_PI:
++		if (!futex_cmpxchg_enabled)
++			return -ENOSYS;
++	}
++
++	switch (cmd) {
+ 	case FUTEX_WAIT:
+ 		val3 = FUTEX_BITSET_MATCH_ANY;
+ 	case FUTEX_WAIT_BITSET:
+@@ -2661,16 +2671,13 @@ long do_futex(u32 __user *uaddr, int op, u32 val, ktime_t *timeout,
+ 		ret = futex_wake_op(uaddr, flags, uaddr2, val, val2, val3);
+ 		break;
+ 	case FUTEX_LOCK_PI:
+-		if (futex_cmpxchg_enabled)
+-			ret = futex_lock_pi(uaddr, flags, val, timeout, 0);
++		ret = futex_lock_pi(uaddr, flags, val, timeout, 0);
+ 		break;
+ 	case FUTEX_UNLOCK_PI:
+-		if (futex_cmpxchg_enabled)
+-			ret = futex_unlock_pi(uaddr, flags);
++		ret = futex_unlock_pi(uaddr, flags);
+ 		break;
+ 	case FUTEX_TRYLOCK_PI:
+-		if (futex_cmpxchg_enabled)
+-			ret = futex_lock_pi(uaddr, flags, 0, timeout, 1);
++		ret = futex_lock_pi(uaddr, flags, 0, timeout, 1);
+ 		break;
+ 	case FUTEX_WAIT_REQUEUE_PI:
+ 		val3 = FUTEX_BITSET_MATCH_ANY;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0021-sysfs-Fix-memory-leak-in-sysfs_sd_setsecdata.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0021-sysfs-Fix-memory-leak-in-sysfs_sd_setsecdata.patch
new file mode 100644
index 0000000..5f58a38
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0021-sysfs-Fix-memory-leak-in-sysfs_sd_setsecdata.patch
@@ -0,0 +1,92 @@
+From 58d245d715be41e6b0d736466a9589d75156f0ff Mon Sep 17 00:00:00 2001
+From: Masami Ichikawa <masami256@gmail.com>
+Date: Tue, 21 Feb 2012 07:43:50 +0900
+Subject: [PATCH 021/147] sysfs: Fix memory leak in sysfs_sd_setsecdata().
+
+commit 93518dd2ebafcc761a8637b2877008cfd748c202 upstream.
+
+This patch fixies follwing two memory leak patterns that reported by kmemleak.
+sysfs_sd_setsecdata() is called during sys_lsetxattr() operation.
+It checks sd->s_iattr is NULL or not. Then if it is NULL, it calls
+sysfs_init_inode_attrs() to allocate memory.
+That code is this.
+
+iattrs = sd->s_iattr;
+if (!iattrs)
+                iattrs = sysfs_init_inode_attrs(sd);
+
+The iattrs recieves sysfs_init_inode_attrs()'s result,  but sd->s_iattr
+doesn't know the address. so it needs to set correct address to
+sd->s_iattr to free memory in other function.
+
+unreferenced object 0xffff880250b73e60 (size 32):
+  comm "systemd", pid 1, jiffies 4294683888 (age 94.553s)
+  hex dump (first 32 bytes):
+    73 79 73 74 65 6d 5f 75 3a 6f 62 6a 65 63 74 5f  system_u:object_
+    72 3a 73 79 73 66 73 5f 74 3a 73 30 00 00 00 00  r:sysfs_t:s0....
+  backtrace:
+    [<ffffffff814cb1d0>] kmemleak_alloc+0x73/0x98
+    [<ffffffff811270ab>] __kmalloc+0x100/0x12c
+    [<ffffffff8120775a>] context_struct_to_string+0x106/0x210
+    [<ffffffff81207cc1>] security_sid_to_context_core+0x10b/0x129
+    [<ffffffff812090ef>] security_sid_to_context+0x10/0x12
+    [<ffffffff811fb0da>] selinux_inode_getsecurity+0x7d/0xa8
+    [<ffffffff811fb127>] selinux_inode_getsecctx+0x22/0x2e
+    [<ffffffff811f4d62>] security_inode_getsecctx+0x16/0x18
+    [<ffffffff81191dad>] sysfs_setxattr+0x96/0x117
+    [<ffffffff811542f0>] __vfs_setxattr_noperm+0x73/0xd9
+    [<ffffffff811543d9>] vfs_setxattr+0x83/0xa1
+    [<ffffffff811544c6>] setxattr+0xcf/0x101
+    [<ffffffff81154745>] sys_lsetxattr+0x6a/0x8f
+    [<ffffffff814efda9>] system_call_fastpath+0x16/0x1b
+    [<ffffffffffffffff>] 0xffffffffffffffff
+unreferenced object 0xffff88024163c5a0 (size 96):
+  comm "systemd", pid 1, jiffies 4294683888 (age 94.553s)
+  hex dump (first 32 bytes):
+    00 00 00 00 ed 41 00 00 00 00 00 00 00 00 00 00  .....A..........
+    00 00 00 00 00 00 00 00 0c 64 42 4f 00 00 00 00  .........dBO....
+  backtrace:
+    [<ffffffff814cb1d0>] kmemleak_alloc+0x73/0x98
+    [<ffffffff81127402>] kmem_cache_alloc_trace+0xc4/0xee
+    [<ffffffff81191cbe>] sysfs_init_inode_attrs+0x2a/0x83
+    [<ffffffff81191dd6>] sysfs_setxattr+0xbf/0x117
+    [<ffffffff811542f0>] __vfs_setxattr_noperm+0x73/0xd9
+    [<ffffffff811543d9>] vfs_setxattr+0x83/0xa1
+    [<ffffffff811544c6>] setxattr+0xcf/0x101
+    [<ffffffff81154745>] sys_lsetxattr+0x6a/0x8f
+    [<ffffffff814efda9>] system_call_fastpath+0x16/0x1b
+    [<ffffffffffffffff>] 0xffffffffffffffff
+`
+
+Signed-off-by: Masami Ichikawa <masami256@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/sysfs/inode.c |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/fs/sysfs/inode.c b/fs/sysfs/inode.c
+index deb804b..9db61a4 100644
+--- a/fs/sysfs/inode.c
++++ b/fs/sysfs/inode.c
+@@ -136,12 +136,13 @@ static int sysfs_sd_setsecdata(struct sysfs_dirent *sd, void **secdata, u32 *sec
+ 	void *old_secdata;
+ 	size_t old_secdata_len;
+ 
+-	iattrs = sd->s_iattr;
+-	if (!iattrs)
+-		iattrs = sysfs_init_inode_attrs(sd);
+-	if (!iattrs)
+-		return -ENOMEM;
++	if (!sd->s_iattr) {
++		sd->s_iattr = sysfs_init_inode_attrs(sd);
++		if (!sd->s_iattr)
++			return -ENOMEM;
++	}
+ 
++	iattrs = sd->s_iattr;
+ 	old_secdata = iattrs->ia_secdata;
+ 	old_secdata_len = iattrs->ia_secdata_len;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0022-tty-moxa-fix-bit-test-in-moxa_start.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0022-tty-moxa-fix-bit-test-in-moxa_start.patch
new file mode 100644
index 0000000..201e2b1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0022-tty-moxa-fix-bit-test-in-moxa_start.patch
@@ -0,0 +1,34 @@
+From 94f82d523fc497167379eb0624420a2bd535103d Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Wed, 7 Mar 2012 13:05:00 +0300
+Subject: [PATCH 022/147] tty: moxa: fix bit test in moxa_start()
+
+commit 58112dfbfe02d803566a2c6c8bd97b5fa3c62cdc upstream.
+
+This is supposed to be doing a shift before the comparison instead of
+just doing a bitwise AND directly.  The current code means the start()
+just returns without doing anything.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Acked-by: Jiri Slaby <jslaby@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/moxa.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/tty/moxa.c b/drivers/tty/moxa.c
+index d15a071..0174d2d 100644
+--- a/drivers/tty/moxa.c
++++ b/drivers/tty/moxa.c
+@@ -1331,7 +1331,7 @@ static void moxa_start(struct tty_struct *tty)
+ 	if (ch == NULL)
+ 		return;
+ 
+-	if (!(ch->statusflags & TXSTOPPED))
++	if (!test_bit(TXSTOPPED, &ch->statusflags))
+ 		return;
+ 
+ 	MoxaPortTxEnable(ch);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0023-TTY-Wrong-unicode-value-copied-in-con_set_unimap.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0023-TTY-Wrong-unicode-value-copied-in-con_set_unimap.patch
new file mode 100644
index 0000000..c688faa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0023-TTY-Wrong-unicode-value-copied-in-con_set_unimap.patch
@@ -0,0 +1,119 @@
+From 7d00c6261eadb39ffffd02141aa566deda4d7cb3 Mon Sep 17 00:00:00 2001
+From: Liz Clark <liz.clark@hp.com>
+Date: Thu, 15 Mar 2012 10:33:29 -0700
+Subject: [PATCH 023/147] TTY: Wrong unicode value copied in con_set_unimap()
+
+commit 4a4c61b7ce26bfc9d49ea4bd121d52114bad9f99 upstream.
+
+Bugzilla 40012: PIO_UNIMAP bug: error updating Unicode-to-font map
+https://bugzilla.kernel.org/show_bug.cgi?id=40012
+
+The unicode font map for the virtual console is a 32x32x64 table which
+allocates rows dynamically as entries are added.  The unicode value
+increases sequentially and should count all entries even in empty
+rows.  The defect is when copying the unicode font map in con_set_unimap(),
+the unicode value is not incremented properly.  The wrong unicode value
+is entered in the new font map.
+
+Signed-off-by: Liz Clark <liz.clark@hp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/vt/consolemap.c |   51 ++++++++++++++++++++++++++++++++++++-------
+ 1 file changed, 43 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/tty/vt/consolemap.c b/drivers/tty/vt/consolemap.c
+index 45d3e80..f343808 100644
+--- a/drivers/tty/vt/consolemap.c
++++ b/drivers/tty/vt/consolemap.c
+@@ -516,6 +516,7 @@ int con_set_unimap(struct vc_data *vc, ushort ct, struct unipair __user *list)
+ 	int err = 0, err1, i;
+ 	struct uni_pagedir *p, *q;
+ 
++	/* Save original vc_unipagdir_loc in case we allocate a new one */
+ 	p = (struct uni_pagedir *)*vc->vc_uni_pagedir_loc;
+ 	if (p->readonly) return -EIO;
+ 	
+@@ -528,26 +529,57 @@ int con_set_unimap(struct vc_data *vc, ushort ct, struct unipair __user *list)
+ 		err1 = con_clear_unimap(vc, NULL);
+ 		if (err1) return err1;
+ 		
++		/*
++		 * Since refcount was > 1, con_clear_unimap() allocated a
++		 * a new uni_pagedir for this vc.  Re: p != q
++		 */
+ 		q = (struct uni_pagedir *)*vc->vc_uni_pagedir_loc;
+-		for (i = 0, l = 0; i < 32; i++)
++
++		/*
++		 * uni_pgdir is a 32*32*64 table with rows allocated
++		 * when its first entry is added.  The unicode value must
++		 * still be incremented for empty rows.  We are copying
++		 * entries from "p" (old) to "q" (new).
++		 */
++		l = 0;		/* unicode value */
++		for (i = 0; i < 32; i++)
+ 		if ((p1 = p->uni_pgdir[i]))
+ 			for (j = 0; j < 32; j++)
+-			if ((p2 = p1[j]))
++			if ((p2 = p1[j])) {
+ 				for (k = 0; k < 64; k++, l++)
+ 				if (p2[k] != 0xffff) {
++					/*
++					 * Found one, copy entry for unicode
++					 * l with fontpos value p2[k].
++					 */
+ 					err1 = con_insert_unipair(q, l, p2[k]);
+ 					if (err1) {
+ 						p->refcount++;
+ 						*vc->vc_uni_pagedir_loc = (unsigned long)p;
+ 						con_release_unimap(q);
+ 						kfree(q);
+-						return err1; 
++						return err1;
+ 					}
+-              			}
+-              	p = q;
+-	} else if (p == dflt)
++				}
++			} else {
++				/* Account for row of 64 empty entries */
++				l += 64;
++			}
++		else
++			/* Account for empty table */
++			l += 32 * 64;
++
++		/*
++		 * Finished copying font table, set vc_uni_pagedir to new table
++		 */
++		p = q;
++	} else if (p == dflt) {
+ 		dflt = NULL;
+-	
++	}
++
++	/*
++	 * Insert user specified unicode pairs into new table.
++	 */
+ 	while (ct--) {
+ 		unsigned short unicode, fontpos;
+ 		__get_user(unicode, &list->unicode);
+@@ -557,11 +589,14 @@ int con_set_unimap(struct vc_data *vc, ushort ct, struct unipair __user *list)
+ 		list++;
+ 	}
+ 	
++	/*
++	 * Merge with fontmaps of any other virtual consoles.
++	 */
+ 	if (con_unify_unimap(vc, p))
+ 		return err;
+ 
+ 	for (i = 0; i <= 3; i++)
+-		set_inverse_transl(vc, p, i); /* Update all inverse translations */
++		set_inverse_transl(vc, p, i); /* Update inverse translations */
+ 	set_inverse_trans_unicode(vc, p);
+   
+ 	return err;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0024-USB-serial-fix-console-error-reporting.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0024-USB-serial-fix-console-error-reporting.patch
new file mode 100644
index 0000000..3d057d3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0024-USB-serial-fix-console-error-reporting.patch
@@ -0,0 +1,36 @@
+From 6a49ff9d91721997f9c625b79e70b9a37bfdf10f Mon Sep 17 00:00:00 2001
+From: Johan Hovold <jhovold@gmail.com>
+Date: Fri, 10 Feb 2012 13:20:49 +0100
+Subject: [PATCH 024/147] USB: serial: fix console error reporting
+
+commit 548dd4b6da8a8e428453d55f7fa7b8a46498d147 upstream.
+
+Do not report errors in write path if port is used as a console as this
+may trigger the same error (and error report) resulting in a loop.
+
+Reported-by: Stephen Hemminger <shemminger@vyatta.com>
+Signed-off-by: Johan Hovold <jhovold@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/generic.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/serial/generic.c b/drivers/usb/serial/generic.c
+index e4db5ad..9f0b2bf 100644
+--- a/drivers/usb/serial/generic.c
++++ b/drivers/usb/serial/generic.c
+@@ -215,8 +215,10 @@ retry:
+ 	clear_bit(i, &port->write_urbs_free);
+ 	result = usb_submit_urb(urb, GFP_ATOMIC);
+ 	if (result) {
+-		dev_err(&port->dev, "%s - error submitting urb: %d\n",
++		if (!port->port.console) {
++			dev_err(&port->dev, "%s - error submitting urb: %d\n",
+ 						__func__, result);
++		}
+ 		set_bit(i, &port->write_urbs_free);
+ 		spin_lock_irqsave(&port->lock, flags);
+ 		port->tx_bytes -= count;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0025-cdc-wdm-Fix-more-races-on-the-read-path.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0025-cdc-wdm-Fix-more-races-on-the-read-path.patch
new file mode 100644
index 0000000..1ab8925
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0025-cdc-wdm-Fix-more-races-on-the-read-path.patch
@@ -0,0 +1,87 @@
+From 028d778c63336663590f673854c0e128e1b8fa34 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sun, 12 Feb 2012 06:00:41 +0000
+Subject: [PATCH 025/147] cdc-wdm: Fix more races on the read path
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 711c68b3c0f7a924ffbee4aa962d8f62b85188ff upstream.
+
+We must not allow the input buffer length to change while we're
+shuffling the buffer contents.  We also mustn't clear the WDM_READ
+flag after more data might have arrived.  Therefore move both of these
+into the spinlocked region at the bottom of wdm_read().
+
+When reading desc->length without holding the iuspin lock, use
+ACCESS_ONCE() to ensure the compiler doesn't re-read it with
+inconsistent results.
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Tested-by: Bjørn Mork <bjorn@mork.no>
+Cc: Oliver Neukum <oliver@neukum.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/class/cdc-wdm.c |   16 +++++++++++-----
+ 1 file changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
+index fd4aee1..eb650b7 100644
+--- a/drivers/usb/class/cdc-wdm.c
++++ b/drivers/usb/class/cdc-wdm.c
+@@ -397,7 +397,7 @@ outnl:
+ static ssize_t wdm_read
+ (struct file *file, char __user *buffer, size_t count, loff_t *ppos)
+ {
+-	int rv, cntr = 0;
++	int rv, cntr;
+ 	int i = 0;
+ 	struct wdm_device *desc = file->private_data;
+ 
+@@ -406,7 +406,8 @@ static ssize_t wdm_read
+ 	if (rv < 0)
+ 		return -ERESTARTSYS;
+ 
+-	if (desc->length == 0) {
++	cntr = ACCESS_ONCE(desc->length);
++	if (cntr == 0) {
+ 		desc->read = 0;
+ retry:
+ 		if (test_bit(WDM_DISCONNECTING, &desc->flags)) {
+@@ -457,25 +458,30 @@ retry:
+ 			goto retry;
+ 		}
+ 		clear_bit(WDM_READ, &desc->flags);
++		cntr = desc->length;
+ 		spin_unlock_irq(&desc->iuspin);
+ 	}
+ 
+-	cntr = count > desc->length ? desc->length : count;
++	if (cntr > count)
++		cntr = count;
+ 	rv = copy_to_user(buffer, desc->ubuf, cntr);
+ 	if (rv > 0) {
+ 		rv = -EFAULT;
+ 		goto err;
+ 	}
+ 
++	spin_lock_irq(&desc->iuspin);
++
+ 	for (i = 0; i < desc->length - cntr; i++)
+ 		desc->ubuf[i] = desc->ubuf[i + cntr];
+ 
+-	spin_lock_irq(&desc->iuspin);
+ 	desc->length -= cntr;
+-	spin_unlock_irq(&desc->iuspin);
+ 	/* in case we had outstanding data */
+ 	if (!desc->length)
+ 		clear_bit(WDM_READ, &desc->flags);
++
++	spin_unlock_irq(&desc->iuspin);
++
+ 	rv = cntr;
+ 
+ err:
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0026-cdc-wdm-Don-t-clear-WDM_READ-unless-entire-read-buff.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0026-cdc-wdm-Don-t-clear-WDM_READ-unless-entire-read-buff.patch
new file mode 100644
index 0000000..c9356f7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0026-cdc-wdm-Don-t-clear-WDM_READ-unless-entire-read-buff.patch
@@ -0,0 +1,36 @@
+From 77094c1a611d4c874a2903e9a702d35a4f5a6be9 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sun, 12 Feb 2012 06:02:43 +0000
+Subject: [PATCH 026/147] cdc-wdm: Don't clear WDM_READ unless entire read
+ buffer is emptied
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit b7a205545345578712611106b371538992e142ff upstream.
+
+The WDM_READ flag is cleared later iff desc->length is reduced to 0.
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Tested-by: Bjørn Mork <bjorn@mork.no>
+Cc: Oliver Neukum <oliver@neukum.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/class/cdc-wdm.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
+index eb650b7..9eb71d8 100644
+--- a/drivers/usb/class/cdc-wdm.c
++++ b/drivers/usb/class/cdc-wdm.c
+@@ -457,7 +457,6 @@ retry:
+ 			spin_unlock_irq(&desc->iuspin);
+ 			goto retry;
+ 		}
+-		clear_bit(WDM_READ, &desc->flags);
+ 		cntr = desc->length;
+ 		spin_unlock_irq(&desc->iuspin);
+ 	}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0027-usb-fsl_udc_core-Fix-scheduling-while-atomic-dump-me.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0027-usb-fsl_udc_core-Fix-scheduling-while-atomic-dump-me.patch
new file mode 100644
index 0000000..b2cc8cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0027-usb-fsl_udc_core-Fix-scheduling-while-atomic-dump-me.patch
@@ -0,0 +1,134 @@
+From 0e5ef14de4874bc31ca8ab4bd1759ead8151950e Mon Sep 17 00:00:00 2001
+From: Peter Chen <peter.chen@freescale.com>
+Date: Thu, 16 Feb 2012 09:36:25 +0800
+Subject: [PATCH 027/147] usb: fsl_udc_core: Fix scheduling while atomic dump
+ message
+
+commit c5cc5ed86667d4ae74fe40ee4ed893f4b46aba05 upstream.
+
+When loading g_ether gadget, there is below message:
+
+Backtrace:
+[<80012248>] (dump_backtrace+0x0/0x10c) from [<803cb42c>] (dump_stack+0x18/0x1c)
+r7:00000000 r6:80512000 r5:8052bef8 r4:80513f30
+[<803cb414>] (dump_stack+0x0/0x1c) from [<8000feb4>] (show_regs+0x44/0x50)
+[<8000fe70>] (show_regs+0x0/0x50) from [<8004c840>] (__schedule_bug+0x68/0x84)
+r5:8052bef8 r4:80513f30
+[<8004c7d8>] (__schedule_bug+0x0/0x84) from [<803cd0e4>] (__schedule+0x4b0/0x528)
+r5:8052bef8 r4:809aad00
+[<803ccc34>] (__schedule+0x0/0x528) from [<803cd214>] (_cond_resched+0x44/0x58)
+[<803cd1d0>] (_cond_resched+0x0/0x58) from [<800a9488>] (dma_pool_alloc+0x184/0x250)
+ r5:9f9b4000 r4:9fb4fb80
+ [<800a9304>] (dma_pool_alloc+0x0/0x250) from [<802a8ad8>] (fsl_req_to_dtd+0xac/0x180)
+[<802a8a2c>] (fsl_req_to_dtd+0x0/0x180) from [<802a8ce4>] (fsl_ep_queue+0x138/0x274)
+[<802a8bac>] (fsl_ep_queue+0x0/0x274) from [<7f004328>] (composite_setup+0x2d4/0xfac [g_ether])
+[<7f004054>] (composite_setup+0x0/0xfac [g_ether]) from [<802a9bb4>] (fsl_udc_irq+0x8dc/0xd38)
+[<802a92d8>] (fsl_udc_irq+0x0/0xd38) from [<800704f8>] (handle_irq_event_percpu+0x54/0x188)
+[<800704a4>] (handle_irq_event_percpu+0x0/0x188) from [<80070674>] (handle_irq_event+0x48/0x68)
+[<8007062c>] (handle_irq_event+0x0/0x68) from [<800738ec>] (handle_level_irq+0xb4/0x138)
+ r5:80514f94 r4:80514f40
+ [<80073838>] (handle_level_irq+0x0/0x138) from [<8006ffa4>] (generic_handle_irq+0x38/0x44)
+ r7:00000012 r6:80510b1c r5:80529860 r4:80512000
+ [<8006ff6c>] (generic_handle_irq+0x0/0x44) from [<8000f4c4>] (handle_IRQ+0x54/0xb4)
+[<8000f470>] (handle_IRQ+0x0/0xb4) from [<800085b8>] (tzic_handle_irq+0x64/0x94)
+ r9:412fc085 r8:00000000 r7:80513f30 r6:00000001 r5:00000000
+ r4:00000000
+ [<80008554>] (tzic_handle_irq+0x0/0x94) from [<8000e680>] (__irq_svc+0x40/0x60)
+
+The reason of above dump message is calling dma_poll_alloc with can-schedule
+mem_flags at atomic context.
+
+To fix this problem, below changes are made:
+- fsl_req_to_dtd doesn't need to be protected by spin_lock_irqsave,
+as struct usb_request can be access at process context. Move lock
+to beginning of hardware visit (fsl_queue_td).
+- Change the memory flag which using to allocate dTD descriptor buffer,
+the memory flag can be from gadget layer.
+
+It is tested at i.mx51 bbg board with g_mass_storage, g_ether, g_serial.
+
+Signed-off-by: Peter Chen <peter.chen@freescale.com>
+Acked-by: Li Yang <leoli@freescale.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/fsl_udc_core.c |   18 ++++++++----------
+ 1 file changed, 8 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/usb/gadget/fsl_udc_core.c b/drivers/usb/gadget/fsl_udc_core.c
+index d7ea6c0..9085d14 100644
+--- a/drivers/usb/gadget/fsl_udc_core.c
++++ b/drivers/usb/gadget/fsl_udc_core.c
+@@ -768,7 +768,7 @@ static void fsl_queue_td(struct fsl_ep *ep, struct fsl_req *req)
+  * @is_last: return flag if it is the last dTD of the request
+  * return: pointer to the built dTD */
+ static struct ep_td_struct *fsl_build_dtd(struct fsl_req *req, unsigned *length,
+-		dma_addr_t *dma, int *is_last)
++		dma_addr_t *dma, int *is_last, gfp_t gfp_flags)
+ {
+ 	u32 swap_temp;
+ 	struct ep_td_struct *dtd;
+@@ -777,7 +777,7 @@ static struct ep_td_struct *fsl_build_dtd(struct fsl_req *req, unsigned *length,
+ 	*length = min(req->req.length - req->req.actual,
+ 			(unsigned)EP_MAX_LENGTH_TRANSFER);
+ 
+-	dtd = dma_pool_alloc(udc_controller->td_pool, GFP_KERNEL, dma);
++	dtd = dma_pool_alloc(udc_controller->td_pool, gfp_flags, dma);
+ 	if (dtd == NULL)
+ 		return dtd;
+ 
+@@ -827,7 +827,7 @@ static struct ep_td_struct *fsl_build_dtd(struct fsl_req *req, unsigned *length,
+ }
+ 
+ /* Generate dtd chain for a request */
+-static int fsl_req_to_dtd(struct fsl_req *req)
++static int fsl_req_to_dtd(struct fsl_req *req, gfp_t gfp_flags)
+ {
+ 	unsigned	count;
+ 	int		is_last;
+@@ -836,7 +836,7 @@ static int fsl_req_to_dtd(struct fsl_req *req)
+ 	dma_addr_t dma;
+ 
+ 	do {
+-		dtd = fsl_build_dtd(req, &count, &dma, &is_last);
++		dtd = fsl_build_dtd(req, &count, &dma, &is_last, gfp_flags);
+ 		if (dtd == NULL)
+ 			return -ENOMEM;
+ 
+@@ -910,13 +910,11 @@ fsl_ep_queue(struct usb_ep *_ep, struct usb_request *_req, gfp_t gfp_flags)
+ 	req->req.actual = 0;
+ 	req->dtd_count = 0;
+ 
+-	spin_lock_irqsave(&udc->lock, flags);
+-
+ 	/* build dtds and push them to device queue */
+-	if (!fsl_req_to_dtd(req)) {
++	if (!fsl_req_to_dtd(req, gfp_flags)) {
++		spin_lock_irqsave(&udc->lock, flags);
+ 		fsl_queue_td(ep, req);
+ 	} else {
+-		spin_unlock_irqrestore(&udc->lock, flags);
+ 		return -ENOMEM;
+ 	}
+ 
+@@ -1295,7 +1293,7 @@ static int ep0_prime_status(struct fsl_udc *udc, int direction)
+ 			ep_is_in(ep) ? DMA_TO_DEVICE : DMA_FROM_DEVICE);
+ 	req->mapped = 1;
+ 
+-	if (fsl_req_to_dtd(req) == 0)
++	if (fsl_req_to_dtd(req, GFP_ATOMIC) == 0)
+ 		fsl_queue_td(ep, req);
+ 	else
+ 		return -ENOMEM;
+@@ -1379,7 +1377,7 @@ static void ch9getstatus(struct fsl_udc *udc, u8 request_type, u16 value,
+ 	req->mapped = 1;
+ 
+ 	/* prime the data phase */
+-	if ((fsl_req_to_dtd(req) == 0))
++	if ((fsl_req_to_dtd(req, GFP_ATOMIC) == 0))
+ 		fsl_queue_td(ep, req);
+ 	else			/* no mem */
+ 		goto stall;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0028-usb-Fix-build-error-due-to-dma_mask-is-not-at-pdev_a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0028-usb-Fix-build-error-due-to-dma_mask-is-not-at-pdev_a.patch
new file mode 100644
index 0000000..2010a38
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0028-usb-Fix-build-error-due-to-dma_mask-is-not-at-pdev_a.patch
@@ -0,0 +1,49 @@
+From 14449b27e92835504278ce397b02ca2b183cbd31 Mon Sep 17 00:00:00 2001
+From: Peter Chen <peter.chen@freescale.com>
+Date: Thu, 16 Feb 2012 09:41:52 +0800
+Subject: [PATCH 028/147] usb: Fix build error due to dma_mask is not at
+ pdev_archdata at ARM
+
+commit e90fc3cb087ce5c5f81e814358222cd6d197b5db upstream.
+
+When build i.mx platform with imx_v6_v7_defconfig, and after adding
+USB Gadget support, it has below build error:
+
+CC      drivers/usb/host/fsl-mph-dr-of.o
+drivers/usb/host/fsl-mph-dr-of.c: In function 'fsl_usb2_device_register':
+drivers/usb/host/fsl-mph-dr-of.c:97: error: 'struct pdev_archdata'
+has no member named 'dma_mask'
+
+It has discussed at: http://www.spinics.net/lists/linux-usb/msg57302.html
+
+For PowerPC, there is dma_mask at struct pdev_archdata, but there is
+no dma_mask at struct pdev_archdata for ARM. The pdev_archdata is
+related to specific platform, it should NOT be accessed by
+cross platform drivers, like USB.
+
+The code for pdev_archdata should be useless, as for PowerPC,
+it has already gotten the value for pdev->dev.dma_mask at function
+arch_setup_pdev_archdata of arch/powerpc/kernel/setup-common.c.
+
+Tested-by: Ramneek Mehresh <ramneek.mehresh@freescale.com>
+Signed-off-by: Peter Chen <peter.chen@freescale.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/fsl-mph-dr-of.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/usb/host/fsl-mph-dr-of.c b/drivers/usb/host/fsl-mph-dr-of.c
+index 9037035..5a42cf0 100644
+--- a/drivers/usb/host/fsl-mph-dr-of.c
++++ b/drivers/usb/host/fsl-mph-dr-of.c
+@@ -94,7 +94,6 @@ struct platform_device * __devinit fsl_usb2_device_register(
+ 	pdev->dev.parent = &ofdev->dev;
+ 
+ 	pdev->dev.coherent_dma_mask = ofdev->dev.coherent_dma_mask;
+-	pdev->dev.dma_mask = &pdev->archdata.dma_mask;
+ 	*pdev->dev.dma_mask = *ofdev->dev.dma_mask;
+ 
+ 	retval = platform_device_add_data(pdev, pdata, sizeof(*pdata));
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0029-USB-ums_realtek-do-not-use-stack-memory-for-DMA-in-_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0029-USB-ums_realtek-do-not-use-stack-memory-for-DMA-in-_.patch
new file mode 100644
index 0000000..f14cf50
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0029-USB-ums_realtek-do-not-use-stack-memory-for-DMA-in-_.patch
@@ -0,0 +1,51 @@
+From 1ae819c56089722e15e3fe2d84125e4f5aa32d4e Mon Sep 17 00:00:00 2001
+From: Josh Boyer <jwboyer@redhat.com>
+Date: Mon, 20 Feb 2012 15:34:34 -0500
+Subject: [PATCH 029/147] USB: ums_realtek: do not use stack memory for DMA in
+ __do_config_autodelink
+
+commit 4898e07174b79013afd2b422ef6c4336ef8e6783 upstream.
+
+__do_config_autodelink passes the data variable to the transport function.
+If the calling functions pass a stack variable, this will eventually trigger
+a DMA-API debug backtrace for mapping stack memory in the DMA buffer.  Fix
+this by calling kmemdup for the passed data instead.
+
+Signed-off-by: Josh Boyer <jwboyer@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/storage/realtek_cr.c |    8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/usb/storage/realtek_cr.c b/drivers/usb/storage/realtek_cr.c
+index 32c93d7..e39b188 100644
+--- a/drivers/usb/storage/realtek_cr.c
++++ b/drivers/usb/storage/realtek_cr.c
+@@ -509,9 +509,14 @@ static int __do_config_autodelink(struct us_data *us, u8 *data, u16 len)
+ 	int retval;
+ 	u16 addr = 0xFE47;
+ 	u8 cmnd[12] = {0};
++	u8 *buf;
+ 
+ 	US_DEBUGP("%s, addr = 0x%x, len = %d\n", __FUNCTION__, addr, len);
+ 
++	buf = kmemdup(data, len, GFP_NOIO);
++	if (!buf)
++		return USB_STOR_TRANSPORT_ERROR;
++
+ 	cmnd[0] = 0xF0;
+ 	cmnd[1] = 0x0E;
+ 	cmnd[2] = (u8)(addr >> 8);
+@@ -519,7 +524,8 @@ static int __do_config_autodelink(struct us_data *us, u8 *data, u16 len)
+ 	cmnd[4] = (u8)(len >> 8);
+ 	cmnd[5] = (u8)len;
+ 
+-	retval = rts51x_bulk_transport_special(us, 0, cmnd, 12, data, len, DMA_TO_DEVICE, NULL);
++	retval = rts51x_bulk_transport_special(us, 0, cmnd, 12, buf, len, DMA_TO_DEVICE, NULL);
++	kfree(buf);
+ 	if (retval != USB_STOR_TRANSPORT_GOOD) {
+ 		return -EIO;
+ 	}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0030-USB-qcserial-add-several-new-serial-devices.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0030-USB-qcserial-add-several-new-serial-devices.patch
new file mode 100644
index 0000000..15bcffc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0030-USB-qcserial-add-several-new-serial-devices.patch
@@ -0,0 +1,49 @@
+From e3ed8846e20e35e9a94c80270d72b20befec0859 Mon Sep 17 00:00:00 2001
+From: Thomas Tuttle <ttuttle@chromium.org>
+Date: Wed, 1 Feb 2012 16:07:17 -0500
+Subject: [PATCH 030/147] USB: qcserial: add several new serial devices
+
+commit 2db4d87070e87d198ab630e66a898b45eff316d9 upstream.
+
+Signed-off-by: Thomas Tuttle <ttuttle@chromium.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
+---
+ drivers/usb/serial/qcserial.c |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
+index aa9367f..1e87d49 100644
+--- a/drivers/usb/serial/qcserial.c
++++ b/drivers/usb/serial/qcserial.c
+@@ -36,6 +36,11 @@ static const struct usb_device_id id_table[] = {
+ 	{USB_DEVICE(0x413c, 0x8171)},	/* Dell Gobi QDL device */
+ 	{USB_DEVICE(0x1410, 0xa001)},	/* Novatel Gobi Modem device */
+ 	{USB_DEVICE(0x1410, 0xa008)},	/* Novatel Gobi QDL device */
++	{USB_DEVICE(0x1410, 0xa010)},	/* Novatel Gobi QDL device */
++	{USB_DEVICE(0x1410, 0xa011)},	/* Novatel Gobi QDL device */
++	{USB_DEVICE(0x1410, 0xa012)},	/* Novatel Gobi QDL device */
++	{USB_DEVICE(0x1410, 0xa013)},	/* Novatel Gobi QDL device */
++	{USB_DEVICE(0x1410, 0xa014)},	/* Novatel Gobi QDL device */
+ 	{USB_DEVICE(0x0b05, 0x1776)},	/* Asus Gobi Modem device */
+ 	{USB_DEVICE(0x0b05, 0x1774)},	/* Asus Gobi QDL device */
+ 	{USB_DEVICE(0x19d2, 0xfff3)},	/* ONDA Gobi Modem device */
+@@ -86,7 +91,16 @@ static const struct usb_device_id id_table[] = {
+ 	{USB_DEVICE(0x16d8, 0x8002)},	/* CMDTech Gobi 2000 Modem device (VU922) */
+ 	{USB_DEVICE(0x05c6, 0x9204)},	/* Gobi 2000 QDL device */
+ 	{USB_DEVICE(0x05c6, 0x9205)},	/* Gobi 2000 Modem device */
++
++	{USB_DEVICE(0x05c6, 0x920c)},	/* Gobi 3000 QDL */
++	{USB_DEVICE(0x05c6, 0x920d)},	/* Gobi 3000 Composite */
++	{USB_DEVICE(0x1410, 0xa020)},   /* Novatel Gobi 3000 QDL */
++	{USB_DEVICE(0x1410, 0xa021)},	/* Novatel Gobi 3000 Composite */
++	{USB_DEVICE(0x413c, 0x8193)},	/* Dell Gobi 3000 QDL */
++	{USB_DEVICE(0x413c, 0x8194)},	/* Dell Gobi 3000 Composite */
+ 	{USB_DEVICE(0x1199, 0x9013)},	/* Sierra Wireless Gobi 3000 Modem device (MC8355) */
++	{USB_DEVICE(0x12D1, 0x14F0)},	/* Sony Gobi 3000 QDL */
++	{USB_DEVICE(0x12D1, 0x14F1)},	/* Sony Gobi 3000 Composite */
+ 	{ }				/* Terminating entry */
+ };
+ MODULE_DEVICE_TABLE(usb, id_table);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0031-USB-qcserial-don-t-grab-QMI-port-on-Gobi-1000-device.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0031-USB-qcserial-don-t-grab-QMI-port-on-Gobi-1000-device.patch
new file mode 100644
index 0000000..55df1d5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0031-USB-qcserial-don-t-grab-QMI-port-on-Gobi-1000-device.patch
@@ -0,0 +1,177 @@
+From 8544c3691b838f3377a752b88365bb522eb04b72 Mon Sep 17 00:00:00 2001
+From: Dan Williams <dcbw@redhat.com>
+Date: Fri, 24 Feb 2012 13:08:43 -0600
+Subject: [PATCH 031/147] USB: qcserial: don't grab QMI port on Gobi 1000
+ devices
+
+commit c192c8e71a2ded01170c1a992cd21aaedc822756 upstream.
+
+Gobi 1000 devices have a different port layout, which wasn't respected
+by the current driver, and thus it grabbed the QMI/net port.  In the
+near future we'll be attaching another driver to the QMI/net port for
+these devices (cdc-wdm and qmi_wwan) so make sure the qcserial driver
+doesn't claim them.  This patch also prevents qcserial from binding to
+interfaces 0 and 1 on 1K devices because those interfaces do not
+respond.
+
+Signed-off-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/qcserial.c |  105 ++++++++++++++++++++++++-----------------
+ 1 file changed, 62 insertions(+), 43 deletions(-)
+
+diff --git a/drivers/usb/serial/qcserial.c b/drivers/usb/serial/qcserial.c
+index 1e87d49..3187d8b 100644
+--- a/drivers/usb/serial/qcserial.c
++++ b/drivers/usb/serial/qcserial.c
+@@ -24,39 +24,44 @@
+ 
+ static int debug;
+ 
++#define DEVICE_G1K(v, p) \
++	USB_DEVICE(v, p), .driver_info = 1
++
+ static const struct usb_device_id id_table[] = {
+-	{USB_DEVICE(0x05c6, 0x9211)},	/* Acer Gobi QDL device */
+-	{USB_DEVICE(0x05c6, 0x9212)},	/* Acer Gobi Modem Device */
+-	{USB_DEVICE(0x03f0, 0x1f1d)},	/* HP un2400 Gobi Modem Device */
+-	{USB_DEVICE(0x03f0, 0x201d)},	/* HP un2400 Gobi QDL Device */
+-	{USB_DEVICE(0x03f0, 0x371d)},	/* HP un2430 Mobile Broadband Module */
+-	{USB_DEVICE(0x04da, 0x250d)},	/* Panasonic Gobi Modem device */
+-	{USB_DEVICE(0x04da, 0x250c)},	/* Panasonic Gobi QDL device */
+-	{USB_DEVICE(0x413c, 0x8172)},	/* Dell Gobi Modem device */
+-	{USB_DEVICE(0x413c, 0x8171)},	/* Dell Gobi QDL device */
+-	{USB_DEVICE(0x1410, 0xa001)},	/* Novatel Gobi Modem device */
+-	{USB_DEVICE(0x1410, 0xa008)},	/* Novatel Gobi QDL device */
+-	{USB_DEVICE(0x1410, 0xa010)},	/* Novatel Gobi QDL device */
+-	{USB_DEVICE(0x1410, 0xa011)},	/* Novatel Gobi QDL device */
+-	{USB_DEVICE(0x1410, 0xa012)},	/* Novatel Gobi QDL device */
+-	{USB_DEVICE(0x1410, 0xa013)},	/* Novatel Gobi QDL device */
+-	{USB_DEVICE(0x1410, 0xa014)},	/* Novatel Gobi QDL device */
+-	{USB_DEVICE(0x0b05, 0x1776)},	/* Asus Gobi Modem device */
+-	{USB_DEVICE(0x0b05, 0x1774)},	/* Asus Gobi QDL device */
+-	{USB_DEVICE(0x19d2, 0xfff3)},	/* ONDA Gobi Modem device */
+-	{USB_DEVICE(0x19d2, 0xfff2)},	/* ONDA Gobi QDL device */
+-	{USB_DEVICE(0x1557, 0x0a80)},	/* OQO Gobi QDL device */
+-	{USB_DEVICE(0x05c6, 0x9001)},   /* Generic Gobi Modem device */
+-	{USB_DEVICE(0x05c6, 0x9002)},	/* Generic Gobi Modem device */
+-	{USB_DEVICE(0x05c6, 0x9202)},	/* Generic Gobi Modem device */
+-	{USB_DEVICE(0x05c6, 0x9203)},	/* Generic Gobi Modem device */
+-	{USB_DEVICE(0x05c6, 0x9222)},	/* Generic Gobi Modem device */
+-	{USB_DEVICE(0x05c6, 0x9008)},	/* Generic Gobi QDL device */
+-	{USB_DEVICE(0x05c6, 0x9009)},	/* Generic Gobi Modem device */
+-	{USB_DEVICE(0x05c6, 0x9201)},	/* Generic Gobi QDL device */
+-	{USB_DEVICE(0x05c6, 0x9221)},	/* Generic Gobi QDL device */
+-	{USB_DEVICE(0x05c6, 0x9231)},	/* Generic Gobi QDL device */
+-	{USB_DEVICE(0x1f45, 0x0001)},	/* Unknown Gobi QDL device */
++	/* Gobi 1000 devices */
++	{DEVICE_G1K(0x05c6, 0x9211)},	/* Acer Gobi QDL device */
++	{DEVICE_G1K(0x05c6, 0x9212)},	/* Acer Gobi Modem Device */
++	{DEVICE_G1K(0x03f0, 0x1f1d)},	/* HP un2400 Gobi Modem Device */
++	{DEVICE_G1K(0x03f0, 0x201d)},	/* HP un2400 Gobi QDL Device */
++	{DEVICE_G1K(0x04da, 0x250d)},	/* Panasonic Gobi Modem device */
++	{DEVICE_G1K(0x04da, 0x250c)},	/* Panasonic Gobi QDL device */
++	{DEVICE_G1K(0x413c, 0x8172)},	/* Dell Gobi Modem device */
++	{DEVICE_G1K(0x413c, 0x8171)},	/* Dell Gobi QDL device */
++	{DEVICE_G1K(0x1410, 0xa001)},	/* Novatel Gobi Modem device */
++	{DEVICE_G1K(0x1410, 0xa008)},	/* Novatel Gobi QDL device */
++	{DEVICE_G1K(0x0b05, 0x1776)},	/* Asus Gobi Modem device */
++	{DEVICE_G1K(0x0b05, 0x1774)},	/* Asus Gobi QDL device */
++	{DEVICE_G1K(0x19d2, 0xfff3)},	/* ONDA Gobi Modem device */
++	{DEVICE_G1K(0x19d2, 0xfff2)},	/* ONDA Gobi QDL device */
++	{DEVICE_G1K(0x1557, 0x0a80)},	/* OQO Gobi QDL device */
++	{DEVICE_G1K(0x05c6, 0x9001)},   /* Generic Gobi Modem device */
++	{DEVICE_G1K(0x05c6, 0x9002)},	/* Generic Gobi Modem device */
++	{DEVICE_G1K(0x05c6, 0x9202)},	/* Generic Gobi Modem device */
++	{DEVICE_G1K(0x05c6, 0x9203)},	/* Generic Gobi Modem device */
++	{DEVICE_G1K(0x05c6, 0x9222)},	/* Generic Gobi Modem device */
++	{DEVICE_G1K(0x05c6, 0x9008)},	/* Generic Gobi QDL device */
++	{DEVICE_G1K(0x05c6, 0x9009)},	/* Generic Gobi Modem device */
++	{DEVICE_G1K(0x05c6, 0x9201)},	/* Generic Gobi QDL device */
++	{DEVICE_G1K(0x05c6, 0x9221)},	/* Generic Gobi QDL device */
++	{DEVICE_G1K(0x05c6, 0x9231)},	/* Generic Gobi QDL device */
++	{DEVICE_G1K(0x1f45, 0x0001)},	/* Unknown Gobi QDL device */
++
++	/* Gobi 2000 devices */
++	{USB_DEVICE(0x1410, 0xa010)},	/* Novatel Gobi 2000 QDL device */
++	{USB_DEVICE(0x1410, 0xa011)},	/* Novatel Gobi 2000 QDL device */
++	{USB_DEVICE(0x1410, 0xa012)},	/* Novatel Gobi 2000 QDL device */
++	{USB_DEVICE(0x1410, 0xa013)},	/* Novatel Gobi 2000 QDL device */
++	{USB_DEVICE(0x1410, 0xa014)},	/* Novatel Gobi 2000 QDL device */
+ 	{USB_DEVICE(0x413c, 0x8185)},	/* Dell Gobi 2000 QDL device (N0218, VU936) */
+ 	{USB_DEVICE(0x413c, 0x8186)},	/* Dell Gobi 2000 Modem device (N0218, VU936) */
+ 	{USB_DEVICE(0x05c6, 0x9208)},	/* Generic Gobi 2000 QDL device */
+@@ -92,6 +97,8 @@ static const struct usb_device_id id_table[] = {
+ 	{USB_DEVICE(0x05c6, 0x9204)},	/* Gobi 2000 QDL device */
+ 	{USB_DEVICE(0x05c6, 0x9205)},	/* Gobi 2000 Modem device */
+ 
++	/* Gobi 3000 devices */
++	{USB_DEVICE(0x03f0, 0x371d)},	/* HP un2430 Gobi 3000 QDL */
+ 	{USB_DEVICE(0x05c6, 0x920c)},	/* Gobi 3000 QDL */
+ 	{USB_DEVICE(0x05c6, 0x920d)},	/* Gobi 3000 Composite */
+ 	{USB_DEVICE(0x1410, 0xa020)},   /* Novatel Gobi 3000 QDL */
+@@ -122,8 +129,10 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
+ 	int retval = -ENODEV;
+ 	__u8 nintf;
+ 	__u8 ifnum;
++	bool is_gobi1k = id->driver_info ? true : false;
+ 
+ 	dbg("%s", __func__);
++	dbg("Is Gobi 1000 = %d", is_gobi1k);
+ 
+ 	nintf = serial->dev->actconfig->desc.bNumInterfaces;
+ 	dbg("Num Interfaces = %d", nintf);
+@@ -171,15 +180,25 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
+ 
+ 	case 3:
+ 	case 4:
+-		/* Composite mode */
+-		/* ifnum == 0 is a broadband network adapter */
+-		if (ifnum == 1) {
+-			/*
+-			 * Diagnostics Monitor (serial line 9600 8N1)
+-			 * Qualcomm DM protocol
+-			 * use "libqcdm" (ModemManager) for communication
+-			 */
+-			dbg("Diagnostics Monitor found");
++		/* Composite mode; don't bind to the QMI/net interface as that
++		 * gets handled by other drivers.
++		 */
++
++		/* Gobi 1K USB layout:
++		 * 0: serial port (doesn't respond)
++		 * 1: serial port (doesn't respond)
++		 * 2: AT-capable modem port
++		 * 3: QMI/net
++		 *
++		 * Gobi 2K+ USB layout:
++		 * 0: QMI/net
++		 * 1: DM/DIAG (use libqcdm from ModemManager for communication)
++		 * 2: AT-capable modem port
++		 * 3: NMEA
++		 */
++
++		if (ifnum == 1 && !is_gobi1k) {
++			dbg("Gobi 2K+ DM/DIAG interface found");
+ 			retval = usb_set_interface(serial->dev, ifnum, 0);
+ 			if (retval < 0) {
+ 				dev_err(&serial->dev->dev,
+@@ -198,13 +217,13 @@ static int qcprobe(struct usb_serial *serial, const struct usb_device_id *id)
+ 				retval = -ENODEV;
+ 				kfree(data);
+ 			}
+-		} else if (ifnum==3) {
++		} else if (ifnum==3 && !is_gobi1k) {
+ 			/*
+ 			 * NMEA (serial line 9600 8N1)
+ 			 * # echo "\$GPS_START" > /dev/ttyUSBx
+ 			 * # echo "\$GPS_STOP"  > /dev/ttyUSBx
+ 			 */
+-			dbg("NMEA GPS interface found");
++			dbg("Gobi 2K+ NMEA GPS interface found");
+ 			retval = usb_set_interface(serial->dev, ifnum, 0);
+ 			if (retval < 0) {
+ 				dev_err(&serial->dev->dev,
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0032-usb-serial-Add-support-for-the-Sealevel-SeaLINK-8-20.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0032-usb-serial-Add-support-for-the-Sealevel-SeaLINK-8-20.patch
new file mode 100644
index 0000000..f1e4d7f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0032-usb-serial-Add-support-for-the-Sealevel-SeaLINK-8-20.patch
@@ -0,0 +1,51 @@
+From 94b027170f277f8d39aa3e6b2fe0ec2d01ad90f9 Mon Sep 17 00:00:00 2001
+From: Scott Dial <scott.dial@scientiallc.com>
+Date: Fri, 24 Feb 2012 19:04:09 -0500
+Subject: [PATCH 032/147] usb-serial: Add support for the Sealevel SeaLINK+8
+ 2038-ROHS device
+
+commit 6d161b99f875269ad4ffa44375e1e54bca6fd02e upstream.
+
+This patch adds new device IDs to the ftdi_sio module to support
+the new Sealevel SeaLINK+8 2038-ROHS device.
+
+Signed-off-by: Scott Dial <scott.dial@scientiallc.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c     |    4 ++++
+ drivers/usb/serial/ftdi_sio_ids.h |    4 ++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index 3f3ccf6..f2c9ef7 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -537,6 +537,10 @@ static struct usb_device_id id_table_combined [] = {
+ 	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803_6_PID) },
+ 	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803_7_PID) },
+ 	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803_8_PID) },
++	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803R_1_PID) },
++	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803R_2_PID) },
++	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803R_3_PID) },
++	{ USB_DEVICE(SEALEVEL_VID, SEALEVEL_2803R_4_PID) },
+ 	{ USB_DEVICE(IDTECH_VID, IDTECH_IDT1221U_PID) },
+ 	{ USB_DEVICE(OCT_VID, OCT_US101_PID) },
+ 	{ USB_DEVICE(OCT_VID, OCT_DK201_PID) },
+diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
+index abf6bbc..c6dd18e 100644
+--- a/drivers/usb/serial/ftdi_sio_ids.h
++++ b/drivers/usb/serial/ftdi_sio_ids.h
+@@ -689,6 +689,10 @@
+ #define SEALEVEL_2803_6_PID	0X2863	/* SeaLINK+8 (2803) Port 6 */
+ #define SEALEVEL_2803_7_PID	0X2873	/* SeaLINK+8 (2803) Port 7 */
+ #define SEALEVEL_2803_8_PID	0X2883	/* SeaLINK+8 (2803) Port 8 */
++#define SEALEVEL_2803R_1_PID	0Xa02a	/* SeaLINK+8 (2803-ROHS) Port 1+2 */
++#define SEALEVEL_2803R_2_PID	0Xa02b	/* SeaLINK+8 (2803-ROHS) Port 3+4 */
++#define SEALEVEL_2803R_3_PID	0Xa02c	/* SeaLINK+8 (2803-ROHS) Port 5+6 */
++#define SEALEVEL_2803R_4_PID	0Xa02d	/* SeaLINK+8 (2803-ROHS) Port 7+8 */
+ 
+ /*
+  * JETI SPECTROMETER SPECBOS 1201
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0033-usb-cp210x-Update-to-support-CP2105-and-multiple-int.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0033-usb-cp210x-Update-to-support-CP2105-and-multiple-int.patch
new file mode 100644
index 0000000..4d50b8d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0033-usb-cp210x-Update-to-support-CP2105-and-multiple-int.patch
@@ -0,0 +1,155 @@
+From 4d2e98ccb5f7c69868760e889389c5ba01a89bf5 Mon Sep 17 00:00:00 2001
+From: Preston Fick <preston.fick@silabs.com>
+Date: Fri, 24 Feb 2012 13:42:39 -0600
+Subject: [PATCH 033/147] usb: cp210x: Update to support CP2105 and multiple
+ interface devices
+
+commit a5360a53a7ccad5ed9ccef210b94fef13c6e5529 upstream.
+
+This patch updates the cp210x driver to support CP210x multiple
+interface devices devices from Silicon Labs. The existing driver
+always sends control requests to interface 0, which is hardcoded in
+the usb_control_msg function calls. This only allows for single
+interface devices to be used, and causes a bug when using ports on an
+interface other than 0 in the multiple interface devices.
+
+Here are the changes included in this patch:
+- Updated the device list to contain the Silicon Labs factory default
+  VID/PID for multiple interface CP210x devices
+- Created a cp210x_port_private struct created for each port on
+  startup, this struct holds the interface number
+- Added a cp210x_release function to clean up the cp210x_port_private
+  memory created on startup
+- Modified usb_get_config and usb_set_config to get a pointer to the
+  cp210x_port_private struct, and use the interface number there in the
+  usb_control_message wIndex param
+
+Signed-off-by: Preston Fick <preston.fick@silabs.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/cp210x.c |   44 ++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 41 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
+index 33d25d4..4c12404 100644
+--- a/drivers/usb/serial/cp210x.c
++++ b/drivers/usb/serial/cp210x.c
+@@ -49,6 +49,7 @@ static int cp210x_tiocmset_port(struct usb_serial_port *port,
+ 		unsigned int, unsigned int);
+ static void cp210x_break_ctl(struct tty_struct *, int);
+ static int cp210x_startup(struct usb_serial *);
++static void cp210x_release(struct usb_serial *);
+ static void cp210x_dtr_rts(struct usb_serial_port *p, int on);
+ 
+ static int debug;
+@@ -121,6 +122,8 @@ static const struct usb_device_id id_table[] = {
+ 	{ USB_DEVICE(0x10C4, 0x8665) }, /* AC-Services OBD-IF */
+ 	{ USB_DEVICE(0x10C4, 0xEA60) }, /* Silicon Labs factory default */
+ 	{ USB_DEVICE(0x10C4, 0xEA61) }, /* Silicon Labs factory default */
++	{ USB_DEVICE(0x10C4, 0xEA70) }, /* Silicon Labs factory default */
++	{ USB_DEVICE(0x10C4, 0xEA80) }, /* Silicon Labs factory default */
+ 	{ USB_DEVICE(0x10C4, 0xEA71) }, /* Infinity GPS-MIC-1 Radio Monophone */
+ 	{ USB_DEVICE(0x10C4, 0xF001) }, /* Elan Digital Systems USBscope50 */
+ 	{ USB_DEVICE(0x10C4, 0xF002) }, /* Elan Digital Systems USBwave12 */
+@@ -149,6 +152,10 @@ static const struct usb_device_id id_table[] = {
+ 
+ MODULE_DEVICE_TABLE(usb, id_table);
+ 
++struct cp210x_port_private {
++	__u8			bInterfaceNumber;
++};
++
+ static struct usb_driver cp210x_driver = {
+ 	.name		= "cp210x",
+ 	.probe		= usb_serial_probe,
+@@ -174,6 +181,7 @@ static struct usb_serial_driver cp210x_device = {
+ 	.tiocmget 		= cp210x_tiocmget,
+ 	.tiocmset		= cp210x_tiocmset,
+ 	.attach			= cp210x_startup,
++	.release		= cp210x_release,
+ 	.dtr_rts		= cp210x_dtr_rts
+ };
+ 
+@@ -261,6 +269,7 @@ static int cp210x_get_config(struct usb_serial_port *port, u8 request,
+ 		unsigned int *data, int size)
+ {
+ 	struct usb_serial *serial = port->serial;
++	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+ 	__le32 *buf;
+ 	int result, i, length;
+ 
+@@ -276,7 +285,7 @@ static int cp210x_get_config(struct usb_serial_port *port, u8 request,
+ 	/* Issue the request, attempting to read 'size' bytes */
+ 	result = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
+ 				request, REQTYPE_DEVICE_TO_HOST, 0x0000,
+-				0, buf, size, 300);
++				port_priv->bInterfaceNumber, buf, size, 300);
+ 
+ 	/* Convert data into an array of integers */
+ 	for (i = 0; i < length; i++)
+@@ -304,6 +313,7 @@ static int cp210x_set_config(struct usb_serial_port *port, u8 request,
+ 		unsigned int *data, int size)
+ {
+ 	struct usb_serial *serial = port->serial;
++	struct cp210x_port_private *port_priv = usb_get_serial_port_data(port);
+ 	__le32 *buf;
+ 	int result, i, length;
+ 
+@@ -325,12 +335,12 @@ static int cp210x_set_config(struct usb_serial_port *port, u8 request,
+ 		result = usb_control_msg(serial->dev,
+ 				usb_sndctrlpipe(serial->dev, 0),
+ 				request, REQTYPE_HOST_TO_DEVICE, 0x0000,
+-				0, buf, size, 300);
++				port_priv->bInterfaceNumber, buf, size, 300);
+ 	} else {
+ 		result = usb_control_msg(serial->dev,
+ 				usb_sndctrlpipe(serial->dev, 0),
+ 				request, REQTYPE_HOST_TO_DEVICE, data[0],
+-				0, NULL, 0, 300);
++				port_priv->bInterfaceNumber, NULL, 0, 300);
+ 	}
+ 
+ 	kfree(buf);
+@@ -830,11 +840,39 @@ static void cp210x_break_ctl (struct tty_struct *tty, int break_state)
+ 
+ static int cp210x_startup(struct usb_serial *serial)
+ {
++	struct cp210x_port_private *port_priv;
++	int i;
++
+ 	/* cp210x buffers behave strangely unless device is reset */
+ 	usb_reset_device(serial->dev);
++
++	for (i = 0; i < serial->num_ports; i++) {
++		port_priv = kzalloc(sizeof(*port_priv), GFP_KERNEL);
++		if (!port_priv)
++			return -ENOMEM;
++
++		memset(port_priv, 0x00, sizeof(*port_priv));
++		port_priv->bInterfaceNumber =
++		    serial->interface->cur_altsetting->desc.bInterfaceNumber;
++
++		usb_set_serial_port_data(serial->port[i], port_priv);
++	}
++
+ 	return 0;
+ }
+ 
++static void cp210x_release(struct usb_serial *serial)
++{
++	struct cp210x_port_private *port_priv;
++	int i;
++
++	for (i = 0; i < serial->num_ports; i++) {
++		port_priv = usb_get_serial_port_data(serial->port[i]);
++		kfree(port_priv);
++		usb_set_serial_port_data(serial->port[i], NULL);
++	}
++}
++
+ static int __init cp210x_init(void)
+ {
+ 	int retval;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0034-USB-serial-mos7840-Fixed-MCS7820-device-attach-probl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0034-USB-serial-mos7840-Fixed-MCS7820-device-attach-probl.patch
new file mode 100644
index 0000000..6c878a9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0034-USB-serial-mos7840-Fixed-MCS7820-device-attach-probl.patch
@@ -0,0 +1,148 @@
+From 7121306391cac4f482edc239e2c8b0f8ac310f92 Mon Sep 17 00:00:00 2001
+From: Donald Lee <donald@asix.com.tw>
+Date: Wed, 14 Mar 2012 15:26:33 +0800
+Subject: [PATCH 034/147] USB: serial: mos7840: Fixed MCS7820 device attach
+ problem
+
+commit 093ea2d3a766cb8a4c4de57efec6c0a127a58792 upstream.
+
+A MCS7820 device supports two serial ports and a MCS7840 device supports
+four serial ports. Both devices use the same driver, but the attach function
+in driver was unable to correctly handle the port numbers for MCS7820
+device. This problem has been fixed in this patch and this fix has been
+verified on x86 Linux kernel 3.2.9 with both MCS7820 and MCS7840 devices.
+
+Signed-off-by: Donald Lee <donald@asix.com.tw>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/mos7840.c |   83 +++++++++++++++++++++++++++++-------------
+ 1 file changed, 57 insertions(+), 26 deletions(-)
+
+diff --git a/drivers/usb/serial/mos7840.c b/drivers/usb/serial/mos7840.c
+index c72abd5..5c7d654 100644
+--- a/drivers/usb/serial/mos7840.c
++++ b/drivers/usb/serial/mos7840.c
+@@ -174,6 +174,7 @@
+ 
+ #define CLK_MULTI_REGISTER         ((__u16)(0x02))
+ #define CLK_START_VALUE_REGISTER   ((__u16)(0x03))
++#define GPIO_REGISTER              ((__u16)(0x07))
+ 
+ #define SERIAL_LCR_DLAB            ((__u16)(0x0080))
+ 
+@@ -1103,14 +1104,25 @@ static int mos7840_open(struct tty_struct *tty, struct usb_serial_port *port)
+ 	mos7840_port->read_urb = port->read_urb;
+ 
+ 	/* set up our bulk in urb */
+-
+-	usb_fill_bulk_urb(mos7840_port->read_urb,
+-			  serial->dev,
+-			  usb_rcvbulkpipe(serial->dev,
+-					  port->bulk_in_endpointAddress),
+-			  port->bulk_in_buffer,
+-			  mos7840_port->read_urb->transfer_buffer_length,
+-			  mos7840_bulk_in_callback, mos7840_port);
++	if ((serial->num_ports == 2)
++		&& ((((__u16)port->number -
++			(__u16)(port->serial->minor)) % 2) != 0)) {
++		usb_fill_bulk_urb(mos7840_port->read_urb,
++			serial->dev,
++			usb_rcvbulkpipe(serial->dev,
++				(port->bulk_in_endpointAddress) + 2),
++			port->bulk_in_buffer,
++			mos7840_port->read_urb->transfer_buffer_length,
++			mos7840_bulk_in_callback, mos7840_port);
++	} else {
++		usb_fill_bulk_urb(mos7840_port->read_urb,
++			serial->dev,
++			usb_rcvbulkpipe(serial->dev,
++				port->bulk_in_endpointAddress),
++			port->bulk_in_buffer,
++			mos7840_port->read_urb->transfer_buffer_length,
++			mos7840_bulk_in_callback, mos7840_port);
++	}
+ 
+ 	dbg("mos7840_open: bulkin endpoint is %d",
+ 	    port->bulk_in_endpointAddress);
+@@ -1521,13 +1533,25 @@ static int mos7840_write(struct tty_struct *tty, struct usb_serial_port *port,
+ 	memcpy(urb->transfer_buffer, current_position, transfer_size);
+ 
+ 	/* fill urb with data and submit  */
+-	usb_fill_bulk_urb(urb,
+-			  serial->dev,
+-			  usb_sndbulkpipe(serial->dev,
+-					  port->bulk_out_endpointAddress),
+-			  urb->transfer_buffer,
+-			  transfer_size,
+-			  mos7840_bulk_out_data_callback, mos7840_port);
++	if ((serial->num_ports == 2)
++		&& ((((__u16)port->number -
++			(__u16)(port->serial->minor)) % 2) != 0)) {
++		usb_fill_bulk_urb(urb,
++			serial->dev,
++			usb_sndbulkpipe(serial->dev,
++				(port->bulk_out_endpointAddress) + 2),
++			urb->transfer_buffer,
++			transfer_size,
++			mos7840_bulk_out_data_callback, mos7840_port);
++	} else {
++		usb_fill_bulk_urb(urb,
++			serial->dev,
++			usb_sndbulkpipe(serial->dev,
++				port->bulk_out_endpointAddress),
++			urb->transfer_buffer,
++			transfer_size,
++			mos7840_bulk_out_data_callback, mos7840_port);
++	}
+ 
+ 	data1 = urb->transfer_buffer;
+ 	dbg("bulkout endpoint is %d", port->bulk_out_endpointAddress);
+@@ -1840,7 +1864,7 @@ static int mos7840_send_cmd_write_baud_rate(struct moschip_port *mos7840_port,
+ 
+ 	} else {
+ #ifdef HW_flow_control
+-		/ *setting h/w flow control bit to 0 */
++		/* setting h/w flow control bit to 0 */
+ 		Data = 0xb;
+ 		mos7840_port->shadowMCR = Data;
+ 		status = mos7840_set_uart_reg(port, MODEM_CONTROL_REGISTER,
+@@ -2309,19 +2333,26 @@ static int mos7840_ioctl(struct tty_struct *tty,
+ 
+ static int mos7840_calc_num_ports(struct usb_serial *serial)
+ {
+-	int mos7840_num_ports = 0;
+-
+-	dbg("numberofendpoints: cur %d, alt %d",
+-	    (int)serial->interface->cur_altsetting->desc.bNumEndpoints,
+-	    (int)serial->interface->altsetting->desc.bNumEndpoints);
+-	if (serial->interface->cur_altsetting->desc.bNumEndpoints == 5) {
+-		mos7840_num_ports = serial->num_ports = 2;
+-	} else if (serial->interface->cur_altsetting->desc.bNumEndpoints == 9) {
++	__u16 Data = 0x00;
++	int ret = 0;
++	int mos7840_num_ports;
++
++	ret = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
++		MCS_RDREQ, MCS_RD_RTYPE, 0, GPIO_REGISTER, &Data,
++		VENDOR_READ_LENGTH, MOS_WDR_TIMEOUT);
++
++	if ((Data & 0x01) == 0) {
++		mos7840_num_ports = 2;
++		serial->num_bulk_in = 2;
++		serial->num_bulk_out = 2;
++		serial->num_ports = 2;
++	} else {
++		mos7840_num_ports = 4;
+ 		serial->num_bulk_in = 4;
+ 		serial->num_bulk_out = 4;
+-		mos7840_num_ports = serial->num_ports = 4;
++		serial->num_ports = 4;
+ 	}
+-	dbg ("mos7840_num_ports = %d", mos7840_num_ports);
++
+ 	return mos7840_num_ports;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0035-rt2x00-Add-support-for-D-Link-DWA-127-to-rt2800usb.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0035-rt2x00-Add-support-for-D-Link-DWA-127-to-rt2800usb.patch
new file mode 100644
index 0000000..2805c1f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0035-rt2x00-Add-support-for-D-Link-DWA-127-to-rt2800usb.patch
@@ -0,0 +1,33 @@
+From bdab95dd61b9879afe660d0f5d97bf5b6ab0533e Mon Sep 17 00:00:00 2001
+From: Gertjan van Wingerde <gwingerde@gmail.com>
+Date: Sat, 11 Feb 2012 21:58:09 +0100
+Subject: [PATCH 035/147] rt2x00: Add support for D-Link DWA-127 to rt2800usb.
+
+commit d42a179b941a9e4cc6cf41d0f3cbadd75fc48a89 upstream.
+
+This is an RT3070 based device.
+
+Reported-by: Mikhail Kryshen <mikhail@kryshen.net>
+Signed-off-by: Gertjan van Wingerde <gwingerde@gmail.com>
+Acked-by: Ivo van Doorn <IvDoorn@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rt2x00/rt2800usb.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2800usb.c b/drivers/net/wireless/rt2x00/rt2800usb.c
+index 3265b34..cb71e88 100644
+--- a/drivers/net/wireless/rt2x00/rt2800usb.c
++++ b/drivers/net/wireless/rt2x00/rt2800usb.c
+@@ -935,6 +935,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x07d1, 0x3c0f) },
+ 	{ USB_DEVICE(0x07d1, 0x3c11) },
+ 	{ USB_DEVICE(0x07d1, 0x3c16) },
++	{ USB_DEVICE(0x2001, 0x3c1b) },
+ 	/* Draytek */
+ 	{ USB_DEVICE(0x07fa, 0x7712) },
+ 	/* DVICO */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0036-rtlwifi-rtl8192c_common-rtl8192de-Check-for-allocati.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0036-rtlwifi-rtl8192c_common-rtl8192de-Check-for-allocati.patch
new file mode 100644
index 0000000..11a4531
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0036-rtlwifi-rtl8192c_common-rtl8192de-Check-for-allocati.patch
@@ -0,0 +1,102 @@
+From a28aa8ba24d7303a4d8677ebf8b159014f19dca0 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Sat, 7 Jan 2012 20:46:40 -0600
+Subject: [PATCH 036/147] rtlwifi: rtl8192c_common: rtl8192de: Check for
+ allocation failures
+
+commit 76a92be537f1c8c259e393632301446257ca3ea9 upstream.
+
+In https://bugzilla.redhat.com/show_bug.cgi?id=771656, a kernel bug was
+triggered due to a failed skb allocation that was not checked. This event
+lead to an audit of all memory allocations in the complete rtlwifi family
+of drivers. This patch fixes the rest.
+
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rtlwifi/pci.c                |    2 ++
+ drivers/net/wireless/rtlwifi/rtl8192c/fw_common.c |    2 ++
+ drivers/net/wireless/rtlwifi/rtl8192de/fw.c       |   14 +++++++++-----
+ drivers/net/wireless/rtlwifi/usb.c                |   12 +++++++-----
+ 4 files changed, 20 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/pci.c b/drivers/net/wireless/rtlwifi/pci.c
+index eb61061..19bb550 100644
+--- a/drivers/net/wireless/rtlwifi/pci.c
++++ b/drivers/net/wireless/rtlwifi/pci.c
+@@ -657,6 +657,8 @@ static void _rtl_receive_one(struct ieee80211_hw *hw, struct sk_buff *skb,
+ 		return;
+ 
+ 	uskb = dev_alloc_skb(skb->len + 128);
++	if (!uskb)
++		return;		/* exit if allocation failed */
+ 	memcpy(IEEE80211_SKB_RXCB(uskb), &rx_status, sizeof(rx_status));
+ 	pdata = (u8 *)skb_put(uskb, skb->len);
+ 	memcpy(pdata, skb->data, skb->len);
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192c/fw_common.c b/drivers/net/wireless/rtlwifi/rtl8192c/fw_common.c
+index 950c65a..13fc0f9 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192c/fw_common.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192c/fw_common.c
+@@ -752,6 +752,8 @@ void rtl92c_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
+ 
+ 
+ 	skb = dev_alloc_skb(totalpacketlen);
++	if (!skb)
++		return;
+ 	memcpy((u8 *) skb_put(skb, totalpacketlen),
+ 	       &reserved_page_packet, totalpacketlen);
+ 
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192de/fw.c b/drivers/net/wireless/rtlwifi/rtl8192de/fw.c
+index 82f060b..c44757f 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192de/fw.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192de/fw.c
+@@ -763,12 +763,16 @@ void rtl92d_set_fw_rsvdpagepkt(struct ieee80211_hw *hw, bool dl_finished)
+ 		      "rtl92d_set_fw_rsvdpagepkt(): HW_VAR_SET_TX_CMD: ALL\n",
+ 		      u1RsvdPageLoc, 3);
+ 	skb = dev_alloc_skb(totalpacketlen);
+-	memcpy((u8 *) skb_put(skb, totalpacketlen), &reserved_page_packet,
+-		totalpacketlen);
+-	rtstatus = _rtl92d_cmd_send_packet(hw, skb);
++	if (!skb) {
++		dlok = false;
++	} else {
++		memcpy((u8 *) skb_put(skb, totalpacketlen),
++			&reserved_page_packet, totalpacketlen);
++		rtstatus = _rtl92d_cmd_send_packet(hw, skb);
+ 
+-	if (rtstatus)
+-		dlok = true;
++		if (rtstatus)
++			dlok = true;
++	}
+ 	if (dlok) {
+ 		RT_TRACE(rtlpriv, COMP_POWER, DBG_LOUD,
+ 			("Set RSVD page location to Fw.\n"));
+diff --git a/drivers/net/wireless/rtlwifi/usb.c b/drivers/net/wireless/rtlwifi/usb.c
+index 54cb8a6..2b7bcc8 100644
+--- a/drivers/net/wireless/rtlwifi/usb.c
++++ b/drivers/net/wireless/rtlwifi/usb.c
+@@ -481,12 +481,14 @@ static void _rtl_usb_rx_process_noagg(struct ieee80211_hw *hw,
+ 			u8 *pdata;
+ 
+ 			uskb = dev_alloc_skb(skb->len + 128);
+-			memcpy(IEEE80211_SKB_RXCB(uskb), &rx_status,
+-			       sizeof(rx_status));
+-			pdata = (u8 *)skb_put(uskb, skb->len);
+-			memcpy(pdata, skb->data, skb->len);
++			if (uskb) {	/* drop packet on allocation failure */
++				memcpy(IEEE80211_SKB_RXCB(uskb), &rx_status,
++				       sizeof(rx_status));
++				pdata = (u8 *)skb_put(uskb, skb->len);
++				memcpy(pdata, skb->data, skb->len);
++				ieee80211_rx_irqsafe(hw, uskb);
++			}
+ 			dev_kfree_skb_any(skb);
+-			ieee80211_rx_irqsafe(hw, uskb);
+ 		} else {
+ 			dev_kfree_skb_any(skb);
+ 		}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0037-rtlwifi-Handle-previous-allocation-failures-when-fre.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0037-rtlwifi-Handle-previous-allocation-failures-when-fre.patch
new file mode 100644
index 0000000..c30c85d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0037-rtlwifi-Handle-previous-allocation-failures-when-fre.patch
@@ -0,0 +1,59 @@
+From 80ee9108bee3d22e90191a67036133de09faf7cc Mon Sep 17 00:00:00 2001
+From: Simon Graham <simon.graham@virtualcomputer.com>
+Date: Tue, 7 Feb 2012 18:07:38 -0600
+Subject: [PATCH 037/147] rtlwifi: Handle previous allocation failures when
+ freeing device memory
+
+commit 7f66c2f93e5779625c10d262c84537427a2673ca upstream.
+
+Handle previous allocation failures when freeing device memory
+
+Signed-off-by: Simon Graham <simon.graham@virtualcomputer.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rtlwifi/pci.c |   16 ++++++++++------
+ 1 file changed, 10 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/pci.c b/drivers/net/wireless/rtlwifi/pci.c
+index 19bb550..9afcad3 100644
+--- a/drivers/net/wireless/rtlwifi/pci.c
++++ b/drivers/net/wireless/rtlwifi/pci.c
+@@ -1155,10 +1155,12 @@ static void _rtl_pci_free_tx_ring(struct ieee80211_hw *hw,
+ 		ring->idx = (ring->idx + 1) % ring->entries;
+ 	}
+ 
+-	pci_free_consistent(rtlpci->pdev,
+-			    sizeof(*ring->desc) * ring->entries,
+-			    ring->desc, ring->dma);
+-	ring->desc = NULL;
++	if (ring->desc) {
++		pci_free_consistent(rtlpci->pdev,
++				    sizeof(*ring->desc) * ring->entries,
++				    ring->desc, ring->dma);
++		ring->desc = NULL;
++	}
+ }
+ 
+ static void _rtl_pci_free_rx_ring(struct rtl_pci *rtlpci)
+@@ -1182,12 +1184,14 @@ static void _rtl_pci_free_rx_ring(struct rtl_pci *rtlpci)
+ 			kfree_skb(skb);
+ 		}
+ 
+-		pci_free_consistent(rtlpci->pdev,
++		if (rtlpci->rx_ring[rx_queue_idx].desc) {
++			pci_free_consistent(rtlpci->pdev,
+ 				    sizeof(*rtlpci->rx_ring[rx_queue_idx].
+ 					   desc) * rtlpci->rxringcount,
+ 				    rtlpci->rx_ring[rx_queue_idx].desc,
+ 				    rtlpci->rx_ring[rx_queue_idx].dma);
+-		rtlpci->rx_ring[rx_queue_idx].desc = NULL;
++			rtlpci->rx_ring[rx_queue_idx].desc = NULL;
++		}
+ 	}
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0038-rtlwifi-rtl8192c-Prevent-sleeping-from-invalid-conte.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0038-rtlwifi-rtl8192c-Prevent-sleeping-from-invalid-conte.patch
new file mode 100644
index 0000000..cec2e0f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0038-rtlwifi-rtl8192c-Prevent-sleeping-from-invalid-conte.patch
@@ -0,0 +1,56 @@
+From 9d3a0177f72e20f06c844ede994dc3541bdae01b Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Fri, 2 Mar 2012 15:23:36 -0600
+Subject: [PATCH 038/147] rtlwifi: rtl8192c: Prevent sleeping from invalid
+ context in rtl8192cu
+
+commit ebecdcc12fed5d3c81853dea61a0a78a5aefab52 upstream.
+
+When driver rtl8192cu is used with the debug level set to 3 or greater,
+the result is "sleeping function called from invalid context" due to
+an rcu_read_lock() call in the DM refresh routine in driver rtl8192c.
+This lock is not necessary as the USB driver does not use the struct
+being protected, thus the lock is set only when a PCI interface is
+active.
+
+This bug is reported in https://bugzilla.kernel.org/show_bug.cgi?id=42775.
+
+Reported-by: Ronald Wahl <ronald.wahl@raritan.com>
+Tested-by: Ronald Wahl <ronald.wahl@raritan.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Cc: Ronald Wahl <ronald.wahl@raritan.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c |   11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c b/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c
+index 72a98ca..4de6b78 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c
+@@ -1219,13 +1219,18 @@ static void rtl92c_dm_refresh_rate_adaptive_mask(struct ieee80211_hw *hw)
+ 				 ("PreState = %d, CurState = %d\n",
+ 				  p_ra->pre_ratr_state, p_ra->ratr_state));
+ 
+-			rcu_read_lock();
+-			sta = ieee80211_find_sta(mac->vif, mac->bssid);
++			/* Only the PCI card uses sta in the update rate table
++			 * callback routine */
++			if (rtlhal->interface == INTF_PCI) {
++				rcu_read_lock();
++				sta = ieee80211_find_sta(mac->vif, mac->bssid);
++			}
+ 			rtlpriv->cfg->ops->update_rate_tbl(hw, sta,
+ 					p_ra->ratr_state);
+ 
+ 			p_ra->pre_ratr_state = p_ra->ratr_state;
+-			rcu_read_unlock();
++			if (rtlhal->interface == INTF_PCI)
++				rcu_read_unlock();
+ 		}
+ 	}
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0039-rtlwifi-rtl8192ce-Fix-loss-of-receive-performance.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0039-rtlwifi-rtl8192ce-Fix-loss-of-receive-performance.patch
new file mode 100644
index 0000000..1df8ca9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0039-rtlwifi-rtl8192ce-Fix-loss-of-receive-performance.patch
@@ -0,0 +1,42 @@
+From 83d83582d1097f305c41838a2ca01dde71d608a1 Mon Sep 17 00:00:00 2001
+From: Jingjun Wu <jingjun_wu@realsil.com.cn>
+Date: Fri, 2 Mar 2012 20:52:14 -0600
+Subject: [PATCH 039/147] rtlwifi: rtl8192ce: Fix loss of receive performance
+
+commit a9b89e2567c743483e6354f64d7a7e3a8c101e9e upstream.
+
+Driver rtl8192ce when used with the RTL8188CE device would start at about
+20 Mbps on a 54 Mbps connection, but quickly drop to 1 Mbps. One of the
+symptoms is that the AP would need to retransmit each packet 4 of 5 times
+before the driver would acknowledge it. Recovery is possible only by
+unloading and reloading the driver. This problem was reported at
+https://bugzilla.redhat.com/show_bug.cgi?id=770207.
+
+The problem is due to a missing update of the gain setting.
+
+Signed-off-by: Jingjun Wu <jingjun_wu@realsil.com.cn>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c b/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c
+index 4de6b78..a004ad7 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192c/dm_common.c
+@@ -524,6 +524,10 @@ void rtl92c_dm_write_dig(struct ieee80211_hw *hw)
+ 		  dm_digtable.cur_igvalue, dm_digtable.pre_igvalue,
+ 		  dm_digtable.backoff_val));
+ 
++	dm_digtable.cur_igvalue += 2;
++	if (dm_digtable.cur_igvalue > 0x3f)
++		dm_digtable.cur_igvalue = 0x3f;
++
+ 	if (dm_digtable.pre_igvalue != dm_digtable.cur_igvalue) {
+ 		rtl_set_bbreg(hw, ROFDM0_XAAGCCORE1, 0x7f,
+ 			      dm_digtable.cur_igvalue);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0040-iwlwifi-always-monitor-for-stuck-queues.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0040-iwlwifi-always-monitor-for-stuck-queues.patch
new file mode 100644
index 0000000..2e4e29f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0040-iwlwifi-always-monitor-for-stuck-queues.patch
@@ -0,0 +1,65 @@
+From 3d581df915fb46fe7929371df85da52ec6d65d69 Mon Sep 17 00:00:00 2001
+From: Johannes Berg <johannes.berg@intel.com>
+Date: Sun, 4 Mar 2012 08:50:46 -0800
+Subject: [PATCH 040/147] iwlwifi: always monitor for stuck queues
+
+commit 342bbf3fee2fa9a18147e74b2e3c4229a4564912 upstream.
+
+If we only monitor while associated, the following
+can happen:
+ - we're associated, and the queue stuck check
+   runs, setting the queue "touch" time to X
+ - we disassociate, stopping the monitoring,
+   which leaves the time set to X
+ - almost 2s later, we associate, and enqueue
+   a frame
+ - before the frame is transmitted, we monitor
+   for stuck queues, and find the time set to
+   X, although it is now later than X + 2000ms,
+   so we decide that the queue is stuck and
+   erroneously restart the device
+
+It happens more with P2P because there we can
+go between associated/unassociated frequently.
+
+Reported-by: Ben Cahill <ben.m.cahill@intel.com>
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: Wey-Yi Guy <wey-yi.w.guy@intel.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/iwlwifi/iwl-core.c |   18 ++++--------------
+ 1 file changed, 4 insertions(+), 14 deletions(-)
+
+diff --git a/drivers/net/wireless/iwlwifi/iwl-core.c b/drivers/net/wireless/iwlwifi/iwl-core.c
+index fcf5416..3d75d4c 100644
+--- a/drivers/net/wireless/iwlwifi/iwl-core.c
++++ b/drivers/net/wireless/iwlwifi/iwl-core.c
+@@ -1787,20 +1787,10 @@ void iwl_bg_watchdog(unsigned long data)
+ 	if (timeout == 0)
+ 		return;
+ 
+-	/* monitor and check for stuck cmd queue */
+-	if (iwl_check_stuck_queue(priv, priv->shrd->cmd_queue))
+-		return;
+-
+-	/* monitor and check for other stuck queues */
+-	if (iwl_is_any_associated(priv)) {
+-		for (cnt = 0; cnt < hw_params(priv).max_txq_num; cnt++) {
+-			/* skip as we already checked the command queue */
+-			if (cnt == priv->shrd->cmd_queue)
+-				continue;
+-			if (iwl_check_stuck_queue(priv, cnt))
+-				return;
+-		}
+-	}
++	/* monitor and check for stuck queues */
++	for (cnt = 0; cnt < hw_params(priv).max_txq_num; cnt++)
++		if (iwl_check_stuck_queue(priv, cnt))
++			return;
+ 
+ 	mod_timer(&priv->watchdog, jiffies +
+ 		  msecs_to_jiffies(IWL_WD_TICK(timeout)));
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0041-math-Introduce-div64_long.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0041-math-Introduce-div64_long.patch
new file mode 100644
index 0000000..e46ab87
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0041-math-Introduce-div64_long.patch
@@ -0,0 +1,45 @@
+From 0041e471301214d86b8d15b4da69899f47161df6 Mon Sep 17 00:00:00 2001
+From: Sasha Levin <levinsasha928@gmail.com>
+Date: Thu, 15 Mar 2012 12:36:13 -0400
+Subject: [PATCH 041/147] math: Introduce div64_long
+
+commit f910381a55cdaa097030291f272f6e6e4380c39a upstream.
+
+Add a div64_long macro which is used to devide a 64bit number by a long (which
+can be 4 bytes on 32bit systems and 8 bytes on 64bit systems).
+
+Suggested-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Sasha Levin <levinsasha928@gmail.com>
+Cc: johnstul@us.ibm.com
+Link: http://lkml.kernel.org/r/1331829374-31543-1-git-send-email-levinsasha928@gmail.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/math64.h |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/include/linux/math64.h b/include/linux/math64.h
+index 23fcdfc..b8ba855 100644
+--- a/include/linux/math64.h
++++ b/include/linux/math64.h
+@@ -6,6 +6,8 @@
+ 
+ #if BITS_PER_LONG == 64
+ 
++#define div64_long(x,y) div64_s64((x),(y))
++
+ /**
+  * div_u64_rem - unsigned 64bit divide with 32bit divisor with remainder
+  *
+@@ -45,6 +47,8 @@ static inline s64 div64_s64(s64 dividend, s64 divisor)
+ 
+ #elif BITS_PER_LONG == 32
+ 
++#define div64_long(x,y) div_s64((x),(y))
++
+ #ifndef div_u64_rem
+ static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
+ {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0042-ntp-Fix-integer-overflow-when-setting-time.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0042-ntp-Fix-integer-overflow-when-setting-time.patch
new file mode 100644
index 0000000..f8e3d0d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0042-ntp-Fix-integer-overflow-when-setting-time.patch
@@ -0,0 +1,39 @@
+From c763173b9ab87b7413e63a82be88987250677b89 Mon Sep 17 00:00:00 2001
+From: Sasha Levin <levinsasha928@gmail.com>
+Date: Thu, 15 Mar 2012 12:36:14 -0400
+Subject: [PATCH 042/147] ntp: Fix integer overflow when setting time
+
+commit a078c6d0e6288fad6d83fb6d5edd91ddb7b6ab33 upstream.
+
+'long secs' is passed as divisor to div_s64, which accepts a 32bit
+divisor. On 64bit machines that value is trimmed back from 8 bytes
+back to 4, causing a divide by zero when the number is bigger than
+(1 << 32) - 1 and all 32 lower bits are 0.
+
+Use div64_long() instead.
+
+Signed-off-by: Sasha Levin <levinsasha928@gmail.com>
+Cc: johnstul@us.ibm.com
+Link: http://lkml.kernel.org/r/1331829374-31543-2-git-send-email-levinsasha928@gmail.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/time/ntp.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
+index f6117a4..4b85a7a 100644
+--- a/kernel/time/ntp.c
++++ b/kernel/time/ntp.c
+@@ -275,7 +275,7 @@ static inline s64 ntp_update_offset_fll(s64 offset64, long secs)
+ 
+ 	time_status |= STA_MODE;
+ 
+-	return div_s64(offset64 << (NTP_SCALE_SHIFT - SHIFT_FLL), secs);
++	return div64_long(offset64 << (NTP_SCALE_SHIFT - SHIFT_FLL), secs);
+ }
+ 
+ static void ntp_update_offset(long offset)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0043-uevent-send-events-in-correct-order-according-to-seq.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0043-uevent-send-events-in-correct-order-according-to-seq.patch
new file mode 100644
index 0000000..8105aca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0043-uevent-send-events-in-correct-order-according-to-seq.patch
@@ -0,0 +1,97 @@
+From 30890ccb8ef54dedb2569535dbb781fa2f10a119 Mon Sep 17 00:00:00 2001
+From: Andrew Vagin <avagin@openvz.org>
+Date: Wed, 7 Mar 2012 14:49:56 +0400
+Subject: [PATCH 043/147] uevent: send events in correct order according to
+ seqnum (v3)
+
+commit 7b60a18da393ed70db043a777fd9e6d5363077c4 upstream.
+
+The queue handling in the udev daemon assumes that the events are
+ordered.
+
+Before this patch uevent_seqnum is incremented under sequence_lock,
+than an event is send uner uevent_sock_mutex. I want to say that code
+contained a window between incrementing seqnum and sending an event.
+
+This patch locks uevent_sock_mutex before incrementing uevent_seqnum.
+
+v2: delete sequence_lock, uevent_seqnum is protected by uevent_sock_mutex
+v3: unlock the mutex before the goto exit
+
+Thanks for Kay for the comments.
+
+Signed-off-by: Andrew Vagin <avagin@openvz.org>
+Tested-By: Kay Sievers <kay.sievers@vrfy.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ lib/kobject_uevent.c |   19 +++++++++----------
+ 1 file changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
+index ad72a03..6d40244 100644
+--- a/lib/kobject_uevent.c
++++ b/lib/kobject_uevent.c
+@@ -29,16 +29,17 @@
+ 
+ u64 uevent_seqnum;
+ char uevent_helper[UEVENT_HELPER_PATH_LEN] = CONFIG_UEVENT_HELPER_PATH;
+-static DEFINE_SPINLOCK(sequence_lock);
+ #ifdef CONFIG_NET
+ struct uevent_sock {
+ 	struct list_head list;
+ 	struct sock *sk;
+ };
+ static LIST_HEAD(uevent_sock_list);
+-static DEFINE_MUTEX(uevent_sock_mutex);
+ #endif
+ 
++/* This lock protects uevent_seqnum and uevent_sock_list */
++static DEFINE_MUTEX(uevent_sock_mutex);
++
+ /* the strings here must match the enum in include/linux/kobject.h */
+ static const char *kobject_actions[] = {
+ 	[KOBJ_ADD] =		"add",
+@@ -136,7 +137,6 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
+ 	struct kobject *top_kobj;
+ 	struct kset *kset;
+ 	const struct kset_uevent_ops *uevent_ops;
+-	u64 seq;
+ 	int i = 0;
+ 	int retval = 0;
+ #ifdef CONFIG_NET
+@@ -243,17 +243,16 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
+ 	else if (action == KOBJ_REMOVE)
+ 		kobj->state_remove_uevent_sent = 1;
+ 
++	mutex_lock(&uevent_sock_mutex);
+ 	/* we will send an event, so request a new sequence number */
+-	spin_lock(&sequence_lock);
+-	seq = ++uevent_seqnum;
+-	spin_unlock(&sequence_lock);
+-	retval = add_uevent_var(env, "SEQNUM=%llu", (unsigned long long)seq);
+-	if (retval)
++	retval = add_uevent_var(env, "SEQNUM=%llu", (unsigned long long)++uevent_seqnum);
++	if (retval) {
++		mutex_unlock(&uevent_sock_mutex);
+ 		goto exit;
++	}
+ 
+ #if defined(CONFIG_NET)
+ 	/* send netlink message */
+-	mutex_lock(&uevent_sock_mutex);
+ 	list_for_each_entry(ue_sk, &uevent_sock_list, list) {
+ 		struct sock *uevent_sock = ue_sk->sk;
+ 		struct sk_buff *skb;
+@@ -287,8 +286,8 @@ int kobject_uevent_env(struct kobject *kobj, enum kobject_action action,
+ 		} else
+ 			retval = -ENOMEM;
+ 	}
+-	mutex_unlock(&uevent_sock_mutex);
+ #endif
++	mutex_unlock(&uevent_sock_mutex);
+ 
+ 	/* call uevent_helper, usually only enabled during early boot */
+ 	if (uevent_helper[0] && !kobj_usermode_filter(kobj)) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0044-genirq-Fix-long-term-regression-in-genirq-irq_set_ir.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0044-genirq-Fix-long-term-regression-in-genirq-irq_set_ir.patch
new file mode 100644
index 0000000..a19b4b0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0044-genirq-Fix-long-term-regression-in-genirq-irq_set_ir.patch
@@ -0,0 +1,96 @@
+From 30baeed7abf879cdb6abc168307abd194d0d2668 Mon Sep 17 00:00:00 2001
+From: Russell King <linux@arm.linux.org.uk>
+Date: Mon, 5 Mar 2012 15:07:25 -0800
+Subject: [PATCH 044/147] genirq: Fix long-term regression in genirq
+ irq_set_irq_type() handling
+
+commit a09b659cd68c10ec6a30cb91ebd2c327fcd5bfe5 upstream.
+
+In 2008, commit 0c5d1eb77a8be ("genirq: record trigger type") modified the
+way set_irq_type() handles the 'no trigger' condition.  However, this has
+an adverse effect on PCMCIA support on Intel StrongARM and probably PXA
+platforms.
+
+PCMCIA has several status signals on the socket which can trigger
+interrupts; some of these status signals depend on the card's mode
+(whether it is configured in memory or IO mode).  For example, cards have
+a 'Ready/IRQ' signal: in memory mode, this provides an indication to
+PCMCIA that the card has finished its power up initialization.  In IO
+mode, it provides the device interrupt signal.  Other status signals
+switch between on-board battery status and loud speaker output.
+
+In classical PCMCIA implementations, where you have a specific socket
+controller, the controller provides a method to mask interrupts from the
+socket, and importantly ignore any state transitions on the pins which
+correspond with interrupts once masked.  This masking prevents unwanted
+events caused by the removal and application of socket power being
+forwarded.
+
+However, on platforms where there is no socket controller, the PCMCIA
+status and interrupt signals are routed to standard edge-triggered GPIOs.
+These GPIOs can be configured to interrupt on rising edge, falling edge,
+or never.  This is where the problems start.
+
+Edge triggered interrupts are required to record events while disabled via
+the usual methods of {free,request,disable,enable}_irq() to prevent
+problems with dropped interrupts (eg, the 8390 driver uses disable_irq()
+to defer the delivery of interrupts).  As a result, these interfaces can
+not be used to implement the desired behaviour.
+
+The side effect of this is that if the 'Ready/IRQ' GPIO is disabled via
+disable_irq() on suspend, and enabled via enable_irq() after resume, we
+will record the state transitions caused by powering events as valid
+interrupts, and foward them to the card driver, which may attempt to
+access a card which is not powered up.
+
+This leads delays resume while drivers spin in their interrupt handlers,
+and complaints from drivers before they realize what's happened.
+
+Moreover, in the case of the 'Ready/IRQ' signal, this is requested and
+freed by the card driver itself; the PCMCIA core has no idea whether the
+interrupt is requested, and, therefore, whether a call to disable_irq()
+would be valid.  (We tried this around 2.4.17 / 2.5.1 kernel era, and
+ended up throwing it out because of this problem.)
+
+Therefore, it was decided back in around 2002 to disable the edge
+triggering instead, resulting in all state transitions on the GPIO being
+ignored.  That's what we actually need the hardware to do.
+
+The commit above changes this behaviour; it explicitly prevents the 'no
+trigger' state being selected.
+
+The reason that request_irq() does not accept the 'no trigger' state is
+for compatibility with existing drivers which do not provide their desired
+triggering configuration.  The set_irq_type() function is 'new' and not
+used by non-trigger aware drivers.
+
+Therefore, revert this change, and restore previously working platforms
+back to their former state.
+
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Cc: linux@arm.linux.org.uk
+Cc: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/irq/chip.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
+index fb7db75..25784d6 100644
+--- a/kernel/irq/chip.c
++++ b/kernel/irq/chip.c
+@@ -61,8 +61,7 @@ int irq_set_irq_type(unsigned int irq, unsigned int type)
+ 		return -EINVAL;
+ 
+ 	type &= IRQ_TYPE_SENSE_MASK;
+-	if (type != IRQ_TYPE_NONE)
+-		ret = __irq_set_trigger(desc, irq, type);
++	ret = __irq_set_trigger(desc, irq, type);
+ 	irq_put_desc_busunlock(desc, flags);
+ 	return ret;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0045-genirq-Fix-incorrect-check-for-forced-IRQ-thread-han.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0045-genirq-Fix-incorrect-check-for-forced-IRQ-thread-han.patch
new file mode 100644
index 0000000..16059a0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0045-genirq-Fix-incorrect-check-for-forced-IRQ-thread-han.patch
@@ -0,0 +1,35 @@
+From 8cc03040447868b0c8ca3f6ca027fdf45216f493 Mon Sep 17 00:00:00 2001
+From: Alexander Gordeev <agordeev@redhat.com>
+Date: Fri, 9 Mar 2012 14:59:13 +0100
+Subject: [PATCH 045/147] genirq: Fix incorrect check for forced IRQ thread
+ handler
+
+commit 540b60e24f3f4781d80e47122f0c4486a03375b8 upstream.
+
+We do not want a bitwise AND between boolean operands
+
+Signed-off-by: Alexander Gordeev <agordeev@redhat.com>
+Cc: Oleg Nesterov <oleg@redhat.com>
+Link: http://lkml.kernel.org/r/20120309135912.GA2114@dhcp-26-207.brq.redhat.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/irq/manage.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
+index ae95cd2..7600092 100644
+--- a/kernel/irq/manage.c
++++ b/kernel/irq/manage.c
+@@ -773,7 +773,7 @@ static int irq_thread(void *data)
+ 			struct irqaction *action);
+ 	int wake;
+ 
+-	if (force_irqthreads & test_bit(IRQTF_FORCED_THREAD,
++	if (force_irqthreads && test_bit(IRQTF_FORCED_THREAD,
+ 					&action->thread_flags))
+ 		handler_fn = irq_forced_thread_fn;
+ 	else
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0046-rtc-Disable-the-alarm-in-the-hardware-v2.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0046-rtc-Disable-the-alarm-in-the-hardware-v2.patch
new file mode 100644
index 0000000..c7db9c6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0046-rtc-Disable-the-alarm-in-the-hardware-v2.patch
@@ -0,0 +1,76 @@
+From 7d3eb8bf92abead3bd005400d600f32ea4bf9d63 Mon Sep 17 00:00:00 2001
+From: Rabin Vincent <rabin.vincent@stericsson.com>
+Date: Tue, 22 Nov 2011 11:03:14 +0100
+Subject: [PATCH 046/147] rtc: Disable the alarm in the hardware (v2)
+
+commit 41c7f7424259ff11009449f87c95656f69f9b186 upstream.
+
+Currently, the RTC code does not disable the alarm in the hardware.
+
+This means that after a sequence such as the one below (the files are in the
+RTC sysfs), the box will boot up after 2 minutes even though we've
+asked for the alarm to be turned off.
+
+	# echo $((`cat since_epoch`)+120) > wakealarm
+	# echo 0 > wakealarm
+	# poweroff
+
+Fix this by disabling the alarm when there are no timers to run.
+
+The original version of this patch was reverted. This version
+disables the irq directly instead of setting a disabled timer
+in the future.
+
+Cc: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Rabin Vincent <rabin.vincent@stericsson.com>
+[Merged in the second revision from Rabin]
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/rtc/interface.c |   15 +++++++++++++--
+ 1 file changed, 13 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
+index 8a1c031..c1edbf8 100644
+--- a/drivers/rtc/interface.c
++++ b/drivers/rtc/interface.c
+@@ -763,6 +763,14 @@ static int rtc_timer_enqueue(struct rtc_device *rtc, struct rtc_timer *timer)
+ 	return 0;
+ }
+ 
++static void rtc_alarm_disable(struct rtc_device *rtc)
++{
++	if (!rtc->ops || !rtc->ops->alarm_irq_enable)
++		return;
++
++	rtc->ops->alarm_irq_enable(rtc->dev.parent, false);
++}
++
+ /**
+  * rtc_timer_remove - Removes a rtc_timer from the rtc_device timerqueue
+  * @rtc rtc device
+@@ -784,8 +792,10 @@ static void rtc_timer_remove(struct rtc_device *rtc, struct rtc_timer *timer)
+ 		struct rtc_wkalrm alarm;
+ 		int err;
+ 		next = timerqueue_getnext(&rtc->timerqueue);
+-		if (!next)
++		if (!next) {
++			rtc_alarm_disable(rtc);
+ 			return;
++		}
+ 		alarm.time = rtc_ktime_to_tm(next->expires);
+ 		alarm.enabled = 1;
+ 		err = __rtc_set_alarm(rtc, &alarm);
+@@ -847,7 +857,8 @@ again:
+ 		err = __rtc_set_alarm(rtc, &alarm);
+ 		if (err == -ETIME)
+ 			goto again;
+-	}
++	} else
++		rtc_alarm_disable(rtc);
+ 
+ 	mutex_unlock(&rtc->ops_lock);
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0047-p54spi-Release-GPIO-lines-and-IRQ-on-error-in-p54spi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0047-p54spi-Release-GPIO-lines-and-IRQ-on-error-in-p54spi.patch
new file mode 100644
index 0000000..2ecd9fe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0047-p54spi-Release-GPIO-lines-and-IRQ-on-error-in-p54spi.patch
@@ -0,0 +1,71 @@
+From 4a8252cb16f69ca39f21e3bf65064d70046adf38 Mon Sep 17 00:00:00 2001
+From: Max Filippov <jcmvbkbc@gmail.com>
+Date: Thu, 1 Mar 2012 00:40:08 +0400
+Subject: [PATCH 047/147] p54spi: Release GPIO lines and IRQ on error in
+ p54spi_probe
+
+commit 62ebeed8d00aef75eac4fd6c161cae75a41965ca upstream.
+
+This makes it possible to reload driver if insmod has failed due to
+missing firmware.
+
+Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
+Acked-by: Christian Lamparter <chunkeey@googlemail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/p54/p54spi.c |   14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/wireless/p54/p54spi.c b/drivers/net/wireless/p54/p54spi.c
+index 78d0d69..428401b 100644
+--- a/drivers/net/wireless/p54/p54spi.c
++++ b/drivers/net/wireless/p54/p54spi.c
+@@ -622,19 +622,19 @@ static int __devinit p54spi_probe(struct spi_device *spi)
+ 	ret = spi_setup(spi);
+ 	if (ret < 0) {
+ 		dev_err(&priv->spi->dev, "spi_setup failed");
+-		goto err_free_common;
++		goto err_free;
+ 	}
+ 
+ 	ret = gpio_request(p54spi_gpio_power, "p54spi power");
+ 	if (ret < 0) {
+ 		dev_err(&priv->spi->dev, "power GPIO request failed: %d", ret);
+-		goto err_free_common;
++		goto err_free;
+ 	}
+ 
+ 	ret = gpio_request(p54spi_gpio_irq, "p54spi irq");
+ 	if (ret < 0) {
+ 		dev_err(&priv->spi->dev, "irq GPIO request failed: %d", ret);
+-		goto err_free_common;
++		goto err_free_gpio_power;
+ 	}
+ 
+ 	gpio_direction_output(p54spi_gpio_power, 0);
+@@ -645,7 +645,7 @@ static int __devinit p54spi_probe(struct spi_device *spi)
+ 			  priv->spi);
+ 	if (ret < 0) {
+ 		dev_err(&priv->spi->dev, "request_irq() failed");
+-		goto err_free_common;
++		goto err_free_gpio_irq;
+ 	}
+ 
+ 	irq_set_irq_type(gpio_to_irq(p54spi_gpio_irq), IRQ_TYPE_EDGE_RISING);
+@@ -677,6 +677,12 @@ static int __devinit p54spi_probe(struct spi_device *spi)
+ 	return 0;
+ 
+ err_free_common:
++	free_irq(gpio_to_irq(p54spi_gpio_irq), spi);
++err_free_gpio_irq:
++	gpio_free(p54spi_gpio_irq);
++err_free_gpio_power:
++	gpio_free(p54spi_gpio_power);
++err_free:
+ 	p54_free_common(priv->hw);
+ 	return ret;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0048-rtnetlink-Fix-VF-IFLA-policy.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0048-rtnetlink-Fix-VF-IFLA-policy.patch
new file mode 100644
index 0000000..f938d1c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0048-rtnetlink-Fix-VF-IFLA-policy.patch
@@ -0,0 +1,38 @@
+From cf7eecb4e8e024ff0de45c29a63241a518ddf4a0 Mon Sep 17 00:00:00 2001
+From: Greg Rose <gregory.v.rose@intel.com>
+Date: Wed, 8 Feb 2012 00:45:00 +0000
+Subject: [PATCH 048/147] rtnetlink: Fix VF IFLA policy
+
+commit 48752f6513012a1b078da08b145d5c40a644f058 upstream.
+
+Add VF spoof check to IFLA policy.  The original patch I submitted to
+add the spoof checking feature to rtnl failed to add the proper policy
+rule that identifies the data type and len.  This patch corrects that
+oversight.  No bugs have been reported against this but it may cause
+some problem for the netlink message parsing that uses the policy
+table.
+
+Signed-off-by: Greg Rose <gregory.v.rose@intel.com>
+Tested-by: Sibai Li <sibai.li@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/core/rtnetlink.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
+index 9083e82..2ef859a 100644
+--- a/net/core/rtnetlink.c
++++ b/net/core/rtnetlink.c
+@@ -1116,6 +1116,8 @@ static const struct nla_policy ifla_vf_policy[IFLA_VF_MAX+1] = {
+ 				    .len = sizeof(struct ifla_vf_vlan) },
+ 	[IFLA_VF_TX_RATE]	= { .type = NLA_BINARY,
+ 				    .len = sizeof(struct ifla_vf_tx_rate) },
++	[IFLA_VF_SPOOFCHK]	= { .type = NLA_BINARY,
++				    .len = sizeof(struct ifla_vf_spoofchk) },
+ };
+ 
+ static const struct nla_policy ifla_port_policy[IFLA_PORT_MAX+1] = {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0049-IB-iser-Post-initial-receive-buffers-before-sending-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0049-IB-iser-Post-initial-receive-buffers-before-sending-.patch
new file mode 100644
index 0000000..8d3cd74
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0049-IB-iser-Post-initial-receive-buffers-before-sending-.patch
@@ -0,0 +1,143 @@
+From de960f13b12a65cff5f74f1f7bb6871fbd9ac432 Mon Sep 17 00:00:00 2001
+From: Or Gerlitz <ogerlitz@mellanox.com>
+Date: Mon, 5 Mar 2012 18:21:44 +0200
+Subject: [PATCH 049/147] IB/iser: Post initial receive buffers before sending
+ the final login request
+
+commit 89e984e2c2cd14f77ccb26c47726ac7f13b70ae8 upstream.
+
+An iser target may send iscsi NO-OP PDUs as soon as it marks the iSER
+iSCSI session as fully operative.  This means that there is window
+where there are no posted receive buffers on the initiator side, so
+it's possible for the iSER RC connection to break because of RNR NAK /
+retry errors.  To fix this, rely on the flags bits in the login
+request to have FFP (0x3) in the lower nibble as a marker for the
+final login request, and post an initial chunk of receive buffers
+before sending that login request instead of after getting the login
+response.
+
+Signed-off-by: Or Gerlitz <ogerlitz@mellanox.com>
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/infiniband/ulp/iser/iscsi_iser.c     |   18 ++++------------
+ drivers/infiniband/ulp/iser/iscsi_iser.h     |    1 +
+ drivers/infiniband/ulp/iser/iser_initiator.c |   30 +++++++++++++++-----------
+ 3 files changed, 22 insertions(+), 27 deletions(-)
+
+diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.c b/drivers/infiniband/ulp/iser/iscsi_iser.c
+index 7e7373a..d5f3b69 100644
+--- a/drivers/infiniband/ulp/iser/iscsi_iser.c
++++ b/drivers/infiniband/ulp/iser/iscsi_iser.c
+@@ -364,6 +364,9 @@ iscsi_iser_conn_bind(struct iscsi_cls_session *cls_session,
+ 	}
+ 	ib_conn = ep->dd_data;
+ 
++	if (iser_alloc_rx_descriptors(ib_conn))
++		return -ENOMEM;
++
+ 	/* binds the iSER connection retrieved from the previously
+ 	 * connected ep_handle to the iSCSI layer connection. exchanges
+ 	 * connection pointers */
+@@ -398,19 +401,6 @@ iscsi_iser_conn_stop(struct iscsi_cls_conn *cls_conn, int flag)
+ 	iser_conn->ib_conn = NULL;
+ }
+ 
+-static int
+-iscsi_iser_conn_start(struct iscsi_cls_conn *cls_conn)
+-{
+-	struct iscsi_conn *conn = cls_conn->dd_data;
+-	int err;
+-
+-	err = iser_conn_set_full_featured_mode(conn);
+-	if (err)
+-		return err;
+-
+-	return iscsi_conn_start(cls_conn);
+-}
+-
+ static void iscsi_iser_session_destroy(struct iscsi_cls_session *cls_session)
+ {
+ 	struct Scsi_Host *shost = iscsi_session_to_shost(cls_session);
+@@ -724,7 +714,7 @@ static struct iscsi_transport iscsi_iser_transport = {
+ 	.get_conn_param		= iscsi_conn_get_param,
+ 	.get_ep_param		= iscsi_iser_get_ep_param,
+ 	.get_session_param	= iscsi_session_get_param,
+-	.start_conn             = iscsi_iser_conn_start,
++	.start_conn             = iscsi_conn_start,
+ 	.stop_conn              = iscsi_iser_conn_stop,
+ 	/* iscsi host params */
+ 	.get_host_param		= iscsi_host_get_param,
+diff --git a/drivers/infiniband/ulp/iser/iscsi_iser.h b/drivers/infiniband/ulp/iser/iscsi_iser.h
+index db7ea37..296be43 100644
+--- a/drivers/infiniband/ulp/iser/iscsi_iser.h
++++ b/drivers/infiniband/ulp/iser/iscsi_iser.h
+@@ -366,4 +366,5 @@ int iser_dma_map_task_data(struct iscsi_iser_task *iser_task,
+ void iser_dma_unmap_task_data(struct iscsi_iser_task *iser_task);
+ int  iser_initialize_task_headers(struct iscsi_task *task,
+ 			struct iser_tx_desc *tx_desc);
++int iser_alloc_rx_descriptors(struct iser_conn *ib_conn);
+ #endif
+diff --git a/drivers/infiniband/ulp/iser/iser_initiator.c b/drivers/infiniband/ulp/iser/iser_initiator.c
+index a607542..738a149 100644
+--- a/drivers/infiniband/ulp/iser/iser_initiator.c
++++ b/drivers/infiniband/ulp/iser/iser_initiator.c
+@@ -170,7 +170,7 @@ static void iser_create_send_desc(struct iser_conn	*ib_conn,
+ }
+ 
+ 
+-static int iser_alloc_rx_descriptors(struct iser_conn *ib_conn)
++int iser_alloc_rx_descriptors(struct iser_conn *ib_conn)
+ {
+ 	int i, j;
+ 	u64 dma_addr;
+@@ -242,23 +242,24 @@ void iser_free_rx_descriptors(struct iser_conn *ib_conn)
+ 	kfree(ib_conn->rx_descs);
+ }
+ 
+-/**
+- *  iser_conn_set_full_featured_mode - (iSER API)
+- */
+-int iser_conn_set_full_featured_mode(struct iscsi_conn *conn)
++static int iser_post_rx_bufs(struct iscsi_conn *conn, struct iscsi_hdr *req)
+ {
+ 	struct iscsi_iser_conn *iser_conn = conn->dd_data;
+ 
+-	iser_dbg("Initially post: %d\n", ISER_MIN_POSTED_RX);
+-
+-	/* Check that there is no posted recv or send buffers left - */
+-	/* they must be consumed during the login phase */
+-	BUG_ON(iser_conn->ib_conn->post_recv_buf_count != 0);
+-	BUG_ON(atomic_read(&iser_conn->ib_conn->post_send_buf_count) != 0);
++	iser_dbg("req op %x flags %x\n", req->opcode, req->flags);
++	/* check if this is the last login - going to full feature phase */
++	if ((req->flags & ISCSI_FULL_FEATURE_PHASE) != ISCSI_FULL_FEATURE_PHASE)
++		return 0;
+ 
+-	if (iser_alloc_rx_descriptors(iser_conn->ib_conn))
+-		return -ENOMEM;
++	/*
++	 * Check that there is one posted recv buffer (for the last login
++	 * response) and no posted send buffers left - they must have been
++	 * consumed during previous login phases.
++	 */
++	WARN_ON(iser_conn->ib_conn->post_recv_buf_count != 1);
++	WARN_ON(atomic_read(&iser_conn->ib_conn->post_send_buf_count) != 0);
+ 
++	iser_dbg("Initially post: %d\n", ISER_MIN_POSTED_RX);
+ 	/* Initial post receive buffers */
+ 	if (iser_post_recvm(iser_conn->ib_conn, ISER_MIN_POSTED_RX))
+ 		return -ENOMEM;
+@@ -438,6 +439,9 @@ int iser_send_control(struct iscsi_conn *conn,
+ 		err = iser_post_recvl(iser_conn->ib_conn);
+ 		if (err)
+ 			goto send_control_error;
++		err = iser_post_rx_bufs(conn, task->hdr);
++		if (err)
++			goto send_control_error;
+ 	}
+ 
+ 	err = iser_post_send(iser_conn->ib_conn, mdesc);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0050-ima-fix-Kconfig-dependencies.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0050-ima-fix-Kconfig-dependencies.patch
new file mode 100644
index 0000000..d1add07
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0050-ima-fix-Kconfig-dependencies.patch
@@ -0,0 +1,49 @@
+From 48128d2a875a34aeef5b89ed93e2887179534b33 Mon Sep 17 00:00:00 2001
+From: Fabio Estevam <festevam@gmail.com>
+Date: Thu, 5 Jan 2012 12:49:54 -0200
+Subject: [PATCH 050/147] ima: fix Kconfig dependencies
+
+commit f4a0391dfa91155bd961673b31eb42d9d45c799d upstream.
+
+Fix the following build warning:
+warning: (IMA) selects TCG_TPM which has unmet direct dependencies
+(HAS_IOMEM && EXPERIMENTAL)
+
+Suggested-by: Rajiv Andrade <srajiv@linux.vnet.ibm.com>
+Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
+Signed-off-by: Rajiv Andrade <srajiv@linux.vnet.ibm.com>
+Signed-off-by: Mimi Zohar <zohar@us.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/char/tpm/Kconfig       |    1 -
+ security/integrity/ima/Kconfig |    2 +-
+ 2 files changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/drivers/char/tpm/Kconfig b/drivers/char/tpm/Kconfig
+index fa567f1..c9e045c 100644
+--- a/drivers/char/tpm/Kconfig
++++ b/drivers/char/tpm/Kconfig
+@@ -5,7 +5,6 @@
+ menuconfig TCG_TPM
+ 	tristate "TPM Hardware Support"
+ 	depends on HAS_IOMEM
+-	depends on EXPERIMENTAL
+ 	select SECURITYFS
+ 	---help---
+ 	  If you have a TPM security chip in your system, which
+diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
+index 4f554f2..063298a 100644
+--- a/security/integrity/ima/Kconfig
++++ b/security/integrity/ima/Kconfig
+@@ -9,7 +9,7 @@ config IMA
+ 	select CRYPTO_HMAC
+ 	select CRYPTO_MD5
+ 	select CRYPTO_SHA1
+-	select TCG_TPM if !S390 && !UML
++	select TCG_TPM if HAS_IOMEM && !UML
+ 	select TCG_TIS if TCG_TPM
+ 	help
+ 	  The Trusted Computing Group(TCG) runtime Integrity
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0051-x86-ioapic-Add-register-level-checks-to-detect-bogus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0051-x86-ioapic-Add-register-level-checks-to-detect-bogus.patch
new file mode 100644
index 0000000..6e74c54
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0051-x86-ioapic-Add-register-level-checks-to-detect-bogus.patch
@@ -0,0 +1,113 @@
+From 817b882783a89bae08689d9eff2b5af91f44c4e1 Mon Sep 17 00:00:00 2001
+From: Suresh Siddha <suresh.b.siddha@intel.com>
+Date: Mon, 12 Mar 2012 11:36:33 -0700
+Subject: [PATCH 051/147] x86/ioapic: Add register level checks to detect
+ bogus io-apic entries
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 73d63d038ee9f769f5e5b46792d227fe20e442c5 upstream.
+
+With the recent changes to clear_IO_APIC_pin() which tries to
+clear remoteIRR bit explicitly, some of the users started to see
+"Unable to reset IRR for apic .." messages.
+
+Close look shows that these are related to bogus IO-APIC entries
+which return's all 1's for their io-apic registers. And the
+above mentioned error messages are benign. But kernel should
+have ignored such io-apic's in the first place.
+
+Check if register 0, 1, 2 of the listed io-apic are all 1's and
+ignore such io-apic.
+
+Reported-by: Álvaro Castillo <midgoon@gmail.com>
+Tested-by: Jon Dufresne <jon@jondufresne.org>
+Signed-off-by: Suresh Siddha <suresh.b.siddha@intel.com>
+Cc: yinghai@kernel.org
+Cc: kernel-team@fedoraproject.org
+Cc: Josh Boyer <jwboyer@redhat.com>
+Link: http://lkml.kernel.org/r/1331577393.31585.94.camel@sbsiddha-desk.sc.intel.com
+[ Performed minor cleanup of affected code. ]
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/apic/io_apic.c |   40 ++++++++++++++++++++++++++++++++--------
+ 1 file changed, 32 insertions(+), 8 deletions(-)
+
+diff --git a/arch/x86/kernel/apic/io_apic.c b/arch/x86/kernel/apic/io_apic.c
+index 6d939d7..a25e276 100644
+--- a/arch/x86/kernel/apic/io_apic.c
++++ b/arch/x86/kernel/apic/io_apic.c
+@@ -3963,18 +3963,36 @@ int mp_find_ioapic_pin(int ioapic, u32 gsi)
+ static __init int bad_ioapic(unsigned long address)
+ {
+ 	if (nr_ioapics >= MAX_IO_APICS) {
+-		printk(KERN_WARNING "WARNING: Max # of I/O APICs (%d) exceeded "
+-		       "(found %d), skipping\n", MAX_IO_APICS, nr_ioapics);
++		pr_warn("WARNING: Max # of I/O APICs (%d) exceeded (found %d), skipping\n",
++			MAX_IO_APICS, nr_ioapics);
+ 		return 1;
+ 	}
+ 	if (!address) {
+-		printk(KERN_WARNING "WARNING: Bogus (zero) I/O APIC address"
+-		       " found in table, skipping!\n");
++		pr_warn("WARNING: Bogus (zero) I/O APIC address found in table, skipping!\n");
+ 		return 1;
+ 	}
+ 	return 0;
+ }
+ 
++static __init int bad_ioapic_register(int idx)
++{
++	union IO_APIC_reg_00 reg_00;
++	union IO_APIC_reg_01 reg_01;
++	union IO_APIC_reg_02 reg_02;
++
++	reg_00.raw = io_apic_read(idx, 0);
++	reg_01.raw = io_apic_read(idx, 1);
++	reg_02.raw = io_apic_read(idx, 2);
++
++	if (reg_00.raw == -1 && reg_01.raw == -1 && reg_02.raw == -1) {
++		pr_warn("I/O APIC 0x%x registers return all ones, skipping!\n",
++			mpc_ioapic_addr(idx));
++		return 1;
++	}
++
++	return 0;
++}
++
+ void __init mp_register_ioapic(int id, u32 address, u32 gsi_base)
+ {
+ 	int idx = 0;
+@@ -3991,6 +4009,12 @@ void __init mp_register_ioapic(int id, u32 address, u32 gsi_base)
+ 	ioapics[idx].mp_config.apicaddr = address;
+ 
+ 	set_fixmap_nocache(FIX_IO_APIC_BASE_0 + idx, address);
++
++	if (bad_ioapic_register(idx)) {
++		clear_fixmap(FIX_IO_APIC_BASE_0 + idx);
++		return;
++	}
++
+ 	ioapics[idx].mp_config.apicid = io_apic_unique_id(id);
+ 	ioapics[idx].mp_config.apicver = io_apic_get_version(idx);
+ 
+@@ -4011,10 +4035,10 @@ void __init mp_register_ioapic(int id, u32 address, u32 gsi_base)
+ 	if (gsi_cfg->gsi_end >= gsi_top)
+ 		gsi_top = gsi_cfg->gsi_end + 1;
+ 
+-	printk(KERN_INFO "IOAPIC[%d]: apic_id %d, version %d, address 0x%x, "
+-	       "GSI %d-%d\n", idx, mpc_ioapic_id(idx),
+-	       mpc_ioapic_ver(idx), mpc_ioapic_addr(idx),
+-	       gsi_cfg->gsi_base, gsi_cfg->gsi_end);
++	pr_info("IOAPIC[%d]: apic_id %d, version %d, address 0x%x, GSI %d-%d\n",
++		idx, mpc_ioapic_id(idx),
++		mpc_ioapic_ver(idx), mpc_ioapic_addr(idx),
++		gsi_cfg->gsi_base, gsi_cfg->gsi_end);
+ 
+ 	nr_ioapics++;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0052-mm-thp-fix-pmd_bad-triggering-in-code-paths-holding-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0052-mm-thp-fix-pmd_bad-triggering-in-code-paths-holding-.patch
new file mode 100644
index 0000000..d281a10
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0052-mm-thp-fix-pmd_bad-triggering-in-code-paths-holding-.patch
@@ -0,0 +1,480 @@
+From 11c78e244603f384d1f8cebc627823cc01e952eb Mon Sep 17 00:00:00 2001
+From: Andrea Arcangeli <aarcange@redhat.com>
+Date: Wed, 21 Mar 2012 16:33:42 -0700
+Subject: [PATCH 052/147] mm: thp: fix pmd_bad() triggering in code paths
+ holding mmap_sem read mode
+
+commit 1a5a9906d4e8d1976b701f889d8f35d54b928f25 upstream.
+
+In some cases it may happen that pmd_none_or_clear_bad() is called with
+the mmap_sem hold in read mode.  In those cases the huge page faults can
+allocate hugepmds under pmd_none_or_clear_bad() and that can trigger a
+false positive from pmd_bad() that will not like to see a pmd
+materializing as trans huge.
+
+It's not khugepaged causing the problem, khugepaged holds the mmap_sem
+in write mode (and all those sites must hold the mmap_sem in read mode
+to prevent pagetables to go away from under them, during code review it
+seems vm86 mode on 32bit kernels requires that too unless it's
+restricted to 1 thread per process or UP builds).  The race is only with
+the huge pagefaults that can convert a pmd_none() into a
+pmd_trans_huge().
+
+Effectively all these pmd_none_or_clear_bad() sites running with
+mmap_sem in read mode are somewhat speculative with the page faults, and
+the result is always undefined when they run simultaneously.  This is
+probably why it wasn't common to run into this.  For example if the
+madvise(MADV_DONTNEED) runs zap_page_range() shortly before the page
+fault, the hugepage will not be zapped, if the page fault runs first it
+will be zapped.
+
+Altering pmd_bad() not to error out if it finds hugepmds won't be enough
+to fix this, because zap_pmd_range would then proceed to call
+zap_pte_range (which would be incorrect if the pmd become a
+pmd_trans_huge()).
+
+The simplest way to fix this is to read the pmd in the local stack
+(regardless of what we read, no need of actual CPU barriers, only
+compiler barrier needed), and be sure it is not changing under the code
+that computes its value.  Even if the real pmd is changing under the
+value we hold on the stack, we don't care.  If we actually end up in
+zap_pte_range it means the pmd was not none already and it was not huge,
+and it can't become huge from under us (khugepaged locking explained
+above).
+
+All we need is to enforce that there is no way anymore that in a code
+path like below, pmd_trans_huge can be false, but pmd_none_or_clear_bad
+can run into a hugepmd.  The overhead of a barrier() is just a compiler
+tweak and should not be measurable (I only added it for THP builds).  I
+don't exclude different compiler versions may have prevented the race
+too by caching the value of *pmd on the stack (that hasn't been
+verified, but it wouldn't be impossible considering
+pmd_none_or_clear_bad, pmd_bad, pmd_trans_huge, pmd_none are all inlines
+and there's no external function called in between pmd_trans_huge and
+pmd_none_or_clear_bad).
+
+		if (pmd_trans_huge(*pmd)) {
+			if (next-addr != HPAGE_PMD_SIZE) {
+				VM_BUG_ON(!rwsem_is_locked(&tlb->mm->mmap_sem));
+				split_huge_page_pmd(vma->vm_mm, pmd);
+			} else if (zap_huge_pmd(tlb, vma, pmd, addr))
+				continue;
+			/* fall through */
+		}
+		if (pmd_none_or_clear_bad(pmd))
+
+Because this race condition could be exercised without special
+privileges this was reported in CVE-2012-1179.
+
+The race was identified and fully explained by Ulrich who debugged it.
+I'm quoting his accurate explanation below, for reference.
+
+====== start quote =======
+      mapcount 0 page_mapcount 1
+      kernel BUG at mm/huge_memory.c:1384!
+
+    At some point prior to the panic, a "bad pmd ..." message similar to the
+    following is logged on the console:
+
+      mm/memory.c:145: bad pmd ffff8800376e1f98(80000000314000e7).
+
+    The "bad pmd ..." message is logged by pmd_clear_bad() before it clears
+    the page's PMD table entry.
+
+        143 void pmd_clear_bad(pmd_t *pmd)
+        144 {
+    ->  145         pmd_ERROR(*pmd);
+        146         pmd_clear(pmd);
+        147 }
+
+    After the PMD table entry has been cleared, there is an inconsistency
+    between the actual number of PMD table entries that are mapping the page
+    and the page's map count (_mapcount field in struct page). When the page
+    is subsequently reclaimed, __split_huge_page() detects this inconsistency.
+
+       1381         if (mapcount != page_mapcount(page))
+       1382                 printk(KERN_ERR "mapcount %d page_mapcount %d\n",
+       1383                        mapcount, page_mapcount(page));
+    -> 1384         BUG_ON(mapcount != page_mapcount(page));
+
+    The root cause of the problem is a race of two threads in a multithreaded
+    process. Thread B incurs a page fault on a virtual address that has never
+    been accessed (PMD entry is zero) while Thread A is executing an madvise()
+    system call on a virtual address within the same 2 MB (huge page) range.
+
+               virtual address space
+              .---------------------.
+              |                     |
+              |                     |
+            .-|---------------------|
+            | |                     |
+            | |                     |<-- B(fault)
+            | |                     |
+      2 MB  | |/////////////////////|-.
+      huge <  |/////////////////////|  > A(range)
+      page  | |/////////////////////|-'
+            | |                     |
+            | |                     |
+            '-|---------------------|
+              |                     |
+              |                     |
+              '---------------------'
+
+    - Thread A is executing an madvise(..., MADV_DONTNEED) system call
+      on the virtual address range "A(range)" shown in the picture.
+
+    sys_madvise
+      // Acquire the semaphore in shared mode.
+      down_read(&current->mm->mmap_sem)
+      ...
+      madvise_vma
+        switch (behavior)
+        case MADV_DONTNEED:
+             madvise_dontneed
+               zap_page_range
+                 unmap_vmas
+                   unmap_page_range
+                     zap_pud_range
+                       zap_pmd_range
+                         //
+                         // Assume that this huge page has never been accessed.
+                         // I.e. content of the PMD entry is zero (not mapped).
+                         //
+                         if (pmd_trans_huge(*pmd)) {
+                             // We don't get here due to the above assumption.
+                         }
+                         //
+                         // Assume that Thread B incurred a page fault and
+             .---------> // sneaks in here as shown below.
+             |           //
+             |           if (pmd_none_or_clear_bad(pmd))
+             |               {
+             |                 if (unlikely(pmd_bad(*pmd)))
+             |                     pmd_clear_bad
+             |                     {
+             |                       pmd_ERROR
+             |                         // Log "bad pmd ..." message here.
+             |                       pmd_clear
+             |                         // Clear the page's PMD entry.
+             |                         // Thread B incremented the map count
+             |                         // in page_add_new_anon_rmap(), but
+             |                         // now the page is no longer mapped
+             |                         // by a PMD entry (-> inconsistency).
+             |                     }
+             |               }
+             |
+             v
+    - Thread B is handling a page fault on virtual address "B(fault)" shown
+      in the picture.
+
+    ...
+    do_page_fault
+      __do_page_fault
+        // Acquire the semaphore in shared mode.
+        down_read_trylock(&mm->mmap_sem)
+        ...
+        handle_mm_fault
+          if (pmd_none(*pmd) && transparent_hugepage_enabled(vma))
+              // We get here due to the above assumption (PMD entry is zero).
+              do_huge_pmd_anonymous_page
+                alloc_hugepage_vma
+                  // Allocate a new transparent huge page here.
+                ...
+                __do_huge_pmd_anonymous_page
+                  ...
+                  spin_lock(&mm->page_table_lock)
+                  ...
+                  page_add_new_anon_rmap
+                    // Here we increment the page's map count (starts at -1).
+                    atomic_set(&page->_mapcount, 0)
+                  set_pmd_at
+                    // Here we set the page's PMD entry which will be cleared
+                    // when Thread A calls pmd_clear_bad().
+                  ...
+                  spin_unlock(&mm->page_table_lock)
+
+    The mmap_sem does not prevent the race because both threads are acquiring
+    it in shared mode (down_read).  Thread B holds the page_table_lock while
+    the page's map count and PMD table entry are updated.  However, Thread A
+    does not synchronize on that lock.
+
+====== end quote =======
+
+[akpm@linux-foundation.org: checkpatch fixes]
+Reported-by: Ulrich Obergfell <uobergfe@redhat.com>
+Signed-off-by: Andrea Arcangeli <aarcange@redhat.com>
+Acked-by: Johannes Weiner <hannes@cmpxchg.org>
+Cc: Mel Gorman <mgorman@suse.de>
+Cc: Hugh Dickins <hughd@google.com>
+Cc: Dave Jones <davej@redhat.com>
+Acked-by: Larry Woodman <lwoodman@redhat.com>
+Acked-by: Rik van Riel <riel@redhat.com>
+Cc: Mark Salter <msalter@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/vm86_32.c     |    2 ++
+ fs/proc/task_mmu.c            |    9 ++++++
+ include/asm-generic/pgtable.h |   61 +++++++++++++++++++++++++++++++++++++++++
+ mm/memcontrol.c               |    4 +++
+ mm/memory.c                   |   16 ++++++++---
+ mm/mempolicy.c                |    2 +-
+ mm/mincore.c                  |    2 +-
+ mm/pagewalk.c                 |    2 +-
+ mm/swapfile.c                 |    4 +--
+ 9 files changed, 92 insertions(+), 10 deletions(-)
+
+diff --git a/arch/x86/kernel/vm86_32.c b/arch/x86/kernel/vm86_32.c
+index 863f875..04b8726 100644
+--- a/arch/x86/kernel/vm86_32.c
++++ b/arch/x86/kernel/vm86_32.c
+@@ -172,6 +172,7 @@ static void mark_screen_rdonly(struct mm_struct *mm)
+ 	spinlock_t *ptl;
+ 	int i;
+ 
++	down_write(&mm->mmap_sem);
+ 	pgd = pgd_offset(mm, 0xA0000);
+ 	if (pgd_none_or_clear_bad(pgd))
+ 		goto out;
+@@ -190,6 +191,7 @@ static void mark_screen_rdonly(struct mm_struct *mm)
+ 	}
+ 	pte_unmap_unlock(pte, ptl);
+ out:
++	up_write(&mm->mmap_sem);
+ 	flush_tlb();
+ }
+ 
+diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
+index 7dcd2a2..3efa725 100644
+--- a/fs/proc/task_mmu.c
++++ b/fs/proc/task_mmu.c
+@@ -409,6 +409,9 @@ static int smaps_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+ 	} else {
+ 		spin_unlock(&walk->mm->page_table_lock);
+ 	}
++
++	if (pmd_trans_unstable(pmd))
++		return 0;
+ 	/*
+ 	 * The mmap_sem held all the way back in m_start() is what
+ 	 * keeps khugepaged out of here and from collapsing things
+@@ -507,6 +510,8 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
+ 	struct page *page;
+ 
+ 	split_huge_page_pmd(walk->mm, pmd);
++	if (pmd_trans_unstable(pmd))
++		return 0;
+ 
+ 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
+ 	for (; addr != end; pte++, addr += PAGE_SIZE) {
+@@ -670,6 +675,8 @@ static int pagemap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+ 	int err = 0;
+ 
+ 	split_huge_page_pmd(walk->mm, pmd);
++	if (pmd_trans_unstable(pmd))
++		return 0;
+ 
+ 	/* find the first VMA at or above 'addr' */
+ 	vma = find_vma(walk->mm, addr);
+@@ -961,6 +968,8 @@ static int gather_pte_stats(pmd_t *pmd, unsigned long addr,
+ 		spin_unlock(&walk->mm->page_table_lock);
+ 	}
+ 
++	if (pmd_trans_unstable(pmd))
++		return 0;
+ 	orig_pte = pte = pte_offset_map_lock(walk->mm, pmd, addr, &ptl);
+ 	do {
+ 		struct page *page = can_gather_numa_stats(*pte, md->vma, addr);
+diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
+index 76bff2b..a03c098 100644
+--- a/include/asm-generic/pgtable.h
++++ b/include/asm-generic/pgtable.h
+@@ -425,6 +425,8 @@ extern void untrack_pfn_vma(struct vm_area_struct *vma, unsigned long pfn,
+ 				unsigned long size);
+ #endif
+ 
++#ifdef CONFIG_MMU
++
+ #ifndef CONFIG_TRANSPARENT_HUGEPAGE
+ static inline int pmd_trans_huge(pmd_t pmd)
+ {
+@@ -441,7 +443,66 @@ static inline int pmd_write(pmd_t pmd)
+ 	return 0;
+ }
+ #endif /* __HAVE_ARCH_PMD_WRITE */
++#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
++
++/*
++ * This function is meant to be used by sites walking pagetables with
++ * the mmap_sem hold in read mode to protect against MADV_DONTNEED and
++ * transhuge page faults. MADV_DONTNEED can convert a transhuge pmd
++ * into a null pmd and the transhuge page fault can convert a null pmd
++ * into an hugepmd or into a regular pmd (if the hugepage allocation
++ * fails). While holding the mmap_sem in read mode the pmd becomes
++ * stable and stops changing under us only if it's not null and not a
++ * transhuge pmd. When those races occurs and this function makes a
++ * difference vs the standard pmd_none_or_clear_bad, the result is
++ * undefined so behaving like if the pmd was none is safe (because it
++ * can return none anyway). The compiler level barrier() is critically
++ * important to compute the two checks atomically on the same pmdval.
++ */
++static inline int pmd_none_or_trans_huge_or_clear_bad(pmd_t *pmd)
++{
++	/* depend on compiler for an atomic pmd read */
++	pmd_t pmdval = *pmd;
++	/*
++	 * The barrier will stabilize the pmdval in a register or on
++	 * the stack so that it will stop changing under the code.
++	 */
++#ifdef CONFIG_TRANSPARENT_HUGEPAGE
++	barrier();
++#endif
++	if (pmd_none(pmdval))
++		return 1;
++	if (unlikely(pmd_bad(pmdval))) {
++		if (!pmd_trans_huge(pmdval))
++			pmd_clear_bad(pmd);
++		return 1;
++	}
++	return 0;
++}
++
++/*
++ * This is a noop if Transparent Hugepage Support is not built into
++ * the kernel. Otherwise it is equivalent to
++ * pmd_none_or_trans_huge_or_clear_bad(), and shall only be called in
++ * places that already verified the pmd is not none and they want to
++ * walk ptes while holding the mmap sem in read mode (write mode don't
++ * need this). If THP is not enabled, the pmd can't go away under the
++ * code even if MADV_DONTNEED runs, but if THP is enabled we need to
++ * run a pmd_trans_unstable before walking the ptes after
++ * split_huge_page_pmd returns (because it may have run when the pmd
++ * become null, but then a page fault can map in a THP and not a
++ * regular page).
++ */
++static inline int pmd_trans_unstable(pmd_t *pmd)
++{
++#ifdef CONFIG_TRANSPARENT_HUGEPAGE
++	return pmd_none_or_trans_huge_or_clear_bad(pmd);
++#else
++	return 0;
+ #endif
++}
++
++#endif /* CONFIG_MMU */
+ 
+ #endif /* !__ASSEMBLY__ */
+ 
+diff --git a/mm/memcontrol.c b/mm/memcontrol.c
+index de67e91..778554f 100644
+--- a/mm/memcontrol.c
++++ b/mm/memcontrol.c
+@@ -5237,6 +5237,8 @@ static int mem_cgroup_count_precharge_pte_range(pmd_t *pmd,
+ 	spinlock_t *ptl;
+ 
+ 	split_huge_page_pmd(walk->mm, pmd);
++	if (pmd_trans_unstable(pmd))
++		return 0;
+ 
+ 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
+ 	for (; addr != end; pte++, addr += PAGE_SIZE)
+@@ -5398,6 +5400,8 @@ static int mem_cgroup_move_charge_pte_range(pmd_t *pmd,
+ 	spinlock_t *ptl;
+ 
+ 	split_huge_page_pmd(walk->mm, pmd);
++	if (pmd_trans_unstable(pmd))
++		return 0;
+ retry:
+ 	pte = pte_offset_map_lock(vma->vm_mm, pmd, addr, &ptl);
+ 	for (; addr != end; addr += PAGE_SIZE) {
+diff --git a/mm/memory.c b/mm/memory.c
+index 829d437..1b1ca17 100644
+--- a/mm/memory.c
++++ b/mm/memory.c
+@@ -1228,16 +1228,24 @@ static inline unsigned long zap_pmd_range(struct mmu_gather *tlb,
+ 	do {
+ 		next = pmd_addr_end(addr, end);
+ 		if (pmd_trans_huge(*pmd)) {
+-			if (next-addr != HPAGE_PMD_SIZE) {
++			if (next - addr != HPAGE_PMD_SIZE) {
+ 				VM_BUG_ON(!rwsem_is_locked(&tlb->mm->mmap_sem));
+ 				split_huge_page_pmd(vma->vm_mm, pmd);
+ 			} else if (zap_huge_pmd(tlb, vma, pmd))
+-				continue;
++				goto next;
+ 			/* fall through */
+ 		}
+-		if (pmd_none_or_clear_bad(pmd))
+-			continue;
++		/*
++		 * Here there can be other concurrent MADV_DONTNEED or
++		 * trans huge page faults running, and if the pmd is
++		 * none or trans huge it can change under us. This is
++		 * because MADV_DONTNEED holds the mmap_sem in read
++		 * mode.
++		 */
++		if (pmd_none_or_trans_huge_or_clear_bad(pmd))
++			goto next;
+ 		next = zap_pte_range(tlb, vma, pmd, addr, next, details);
++next:
+ 		cond_resched();
+ 	} while (pmd++, addr = next, addr != end);
+ 
+diff --git a/mm/mempolicy.c b/mm/mempolicy.c
+index c3fdbcb..b26aae2 100644
+--- a/mm/mempolicy.c
++++ b/mm/mempolicy.c
+@@ -512,7 +512,7 @@ static inline int check_pmd_range(struct vm_area_struct *vma, pud_t *pud,
+ 	do {
+ 		next = pmd_addr_end(addr, end);
+ 		split_huge_page_pmd(vma->vm_mm, pmd);
+-		if (pmd_none_or_clear_bad(pmd))
++		if (pmd_none_or_trans_huge_or_clear_bad(pmd))
+ 			continue;
+ 		if (check_pte_range(vma, pmd, addr, next, nodes,
+ 				    flags, private))
+diff --git a/mm/mincore.c b/mm/mincore.c
+index 636a868..936b4ce 100644
+--- a/mm/mincore.c
++++ b/mm/mincore.c
+@@ -164,7 +164,7 @@ static void mincore_pmd_range(struct vm_area_struct *vma, pud_t *pud,
+ 			}
+ 			/* fall through */
+ 		}
+-		if (pmd_none_or_clear_bad(pmd))
++		if (pmd_none_or_trans_huge_or_clear_bad(pmd))
+ 			mincore_unmapped_range(vma, addr, next, vec);
+ 		else
+ 			mincore_pte_range(vma, pmd, addr, next, vec);
+diff --git a/mm/pagewalk.c b/mm/pagewalk.c
+index 2f5cf10..aa9701e 100644
+--- a/mm/pagewalk.c
++++ b/mm/pagewalk.c
+@@ -59,7 +59,7 @@ again:
+ 			continue;
+ 
+ 		split_huge_page_pmd(walk->mm, pmd);
+-		if (pmd_none_or_clear_bad(pmd))
++		if (pmd_none_or_trans_huge_or_clear_bad(pmd))
+ 			goto again;
+ 		err = walk_pte_range(pmd, addr, next, walk);
+ 		if (err)
+diff --git a/mm/swapfile.c b/mm/swapfile.c
+index b1cd120..2015a1e 100644
+--- a/mm/swapfile.c
++++ b/mm/swapfile.c
+@@ -931,9 +931,7 @@ static inline int unuse_pmd_range(struct vm_area_struct *vma, pud_t *pud,
+ 	pmd = pmd_offset(pud, addr);
+ 	do {
+ 		next = pmd_addr_end(addr, end);
+-		if (unlikely(pmd_trans_huge(*pmd)))
+-			continue;
+-		if (pmd_none_or_clear_bad(pmd))
++		if (pmd_none_or_trans_huge_or_clear_bad(pmd))
+ 			continue;
+ 		ret = unuse_pte_range(vma, pmd, addr, next, entry, page);
+ 		if (ret)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0053-TPM-Zero-buffer-whole-after-copying-to-userspace.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0053-TPM-Zero-buffer-whole-after-copying-to-userspace.patch
new file mode 100644
index 0000000..026e58d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0053-TPM-Zero-buffer-whole-after-copying-to-userspace.patch
@@ -0,0 +1,46 @@
+From 6afa33c872ff109ed854c7dcec52130732f9e62e Mon Sep 17 00:00:00 2001
+From: Tim Gardner <tim.gardner@canonical.com>
+Date: Tue, 6 Dec 2011 11:29:20 -0700
+Subject: [PATCH 053/147] TPM: Zero buffer whole after copying to userspace
+
+commit 3ab1aff89477dafb1aaeafe8c8669114a02b7226 upstream.
+
+Commit 3321c07ae5068568cd61ac9f4ba749006a7185c9 correctly clears the TPM
+buffer if the user specified read length is >= the TPM buffer length. However,
+if the user specified read length is < the TPM buffer length, then part of the
+TPM buffer is left uncleared.
+
+Reported-by: Seth Forshee <seth.forshee@canonical.com>
+Cc: Debora Velarde <debora@linux.vnet.ibm.com>
+Cc: Rajiv Andrade <srajiv@linux.vnet.ibm.com>
+Cc: Marcel Selhorst <m.selhorst@sirrix.com>
+Cc: tpmdd-devel@lists.sourceforge.net
+Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
+Signed-off-by: Rajiv Andrade <srajiv@linux.vnet.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/char/tpm/tpm.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/char/tpm/tpm.c b/drivers/char/tpm/tpm.c
+index 361a1df..b366b34 100644
+--- a/drivers/char/tpm/tpm.c
++++ b/drivers/char/tpm/tpm.c
+@@ -1115,12 +1115,13 @@ ssize_t tpm_read(struct file *file, char __user *buf,
+ 	ret_size = atomic_read(&chip->data_pending);
+ 	atomic_set(&chip->data_pending, 0);
+ 	if (ret_size > 0) {	/* relay data */
++		ssize_t orig_ret_size = ret_size;
+ 		if (size < ret_size)
+ 			ret_size = size;
+ 
+ 		mutex_lock(&chip->buffer_mutex);
+ 		rc = copy_to_user(buf, chip->data_buffer, ret_size);
+-		memset(chip->data_buffer, 0, ret_size);
++		memset(chip->data_buffer, 0, orig_ret_size);
+ 		if (rc)
+ 			ret_size = -EFAULT;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0054-PM-Domains-Fix-handling-of-wakeup-devices-during-sys.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0054-PM-Domains-Fix-handling-of-wakeup-devices-during-sys.patch
new file mode 100644
index 0000000..5541122
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0054-PM-Domains-Fix-handling-of-wakeup-devices-during-sys.patch
@@ -0,0 +1,51 @@
+From 51962c5f291ab2abb638e6121c36fbaa93a9567c Mon Sep 17 00:00:00 2001
+From: "Rafael J. Wysocki" <rjw@sisk.pl>
+Date: Tue, 13 Mar 2012 22:39:31 +0100
+Subject: [PATCH 054/147] PM / Domains: Fix handling of wakeup devices during
+ system resume
+
+commit cc85b20780562d404e18a47b9b55b4a5102ae53e upstream.
+
+During system suspend pm_genpd_suspend_noirq() checks if the given
+device is in a wakeup path (i.e. it appears to be needed for one or
+more wakeup devices to work or is a wakeup device itself) and if it
+needs to be "active" for wakeup to work.  If that is the case, the
+function returns 0 without incrementing the device domain's counter
+of suspended devices and without executing genpd_stop_dev() for the
+device.  In consequence, the device is not stopped (e.g. its clock
+isn't disabled) and power is always supplied to its domain in the
+resulting system sleep state.
+
+However, pm_genpd_resume_noirq() doesn't repeat that check and it
+runs genpd_start_dev() and decrements the domain's counter of
+suspended devices even for the wakeup device that weren't stopped by
+pm_genpd_suspend_noirq().  As a result, the start callback may be run
+unnecessarily for them and their domains' counters of suspended
+devices may become negative.  Both outcomes aren't desirable, so fix
+pm_genpd_resume_noirq() to look for wakeup devices that might not be
+stopped by during system suspend.
+
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Tested-by: Simon Horman <horms@verge.net.au>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/base/power/domain.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/base/power/domain.c b/drivers/base/power/domain.c
+index 6790cf7..79038e5 100644
+--- a/drivers/base/power/domain.c
++++ b/drivers/base/power/domain.c
+@@ -751,7 +751,8 @@ static int pm_genpd_resume_noirq(struct device *dev)
+ 	if (IS_ERR(genpd))
+ 		return -EINVAL;
+ 
+-	if (genpd->suspend_power_off)
++	if (genpd->suspend_power_off
++	    || (dev->power.wakeup_path && genpd_dev_active_wakeup(genpd, dev)))
+ 		return 0;
+ 
+ 	/*
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0055-bootmem-sparsemem-remove-limit-constraint-in-alloc_b.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0055-bootmem-sparsemem-remove-limit-constraint-in-alloc_b.patch
new file mode 100644
index 0000000..0ec6e15
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0055-bootmem-sparsemem-remove-limit-constraint-in-alloc_b.patch
@@ -0,0 +1,147 @@
+From ad2b33f9aee5de482d4077bcd81d6afde2935336 Mon Sep 17 00:00:00 2001
+From: Nishanth Aravamudan <nacc@linux.vnet.ibm.com>
+Date: Wed, 21 Mar 2012 16:34:07 -0700
+Subject: [PATCH 055/147] bootmem/sparsemem: remove limit constraint in
+ alloc_bootmem_section
+
+commit f5bf18fa22f8c41a13eb8762c7373eb3a93a7333 upstream.
+
+While testing AMS (Active Memory Sharing) / CMO (Cooperative Memory
+Overcommit) on powerpc, we tripped the following:
+
+  kernel BUG at mm/bootmem.c:483!
+  cpu 0x0: Vector: 700 (Program Check) at [c000000000c03940]
+      pc: c000000000a62bd8: .alloc_bootmem_core+0x90/0x39c
+      lr: c000000000a64bcc: .sparse_early_usemaps_alloc_node+0x84/0x29c
+      sp: c000000000c03bc0
+     msr: 8000000000021032
+    current = 0xc000000000b0cce0
+    paca    = 0xc000000001d80000
+      pid   = 0, comm = swapper
+  kernel BUG at mm/bootmem.c:483!
+  enter ? for help
+  [c000000000c03c80] c000000000a64bcc
+  .sparse_early_usemaps_alloc_node+0x84/0x29c
+  [c000000000c03d50] c000000000a64f10 .sparse_init+0x12c/0x28c
+  [c000000000c03e20] c000000000a474f4 .setup_arch+0x20c/0x294
+  [c000000000c03ee0] c000000000a4079c .start_kernel+0xb4/0x460
+  [c000000000c03f90] c000000000009670 .start_here_common+0x1c/0x2c
+
+This is
+
+        BUG_ON(limit && goal + size > limit);
+
+and after some debugging, it seems that
+
+	goal = 0x7ffff000000
+	limit = 0x80000000000
+
+and sparse_early_usemaps_alloc_node ->
+sparse_early_usemaps_alloc_pgdat_section calls
+
+	return alloc_bootmem_section(usemap_size() * count, section_nr);
+
+This is on a system with 8TB available via the AMS pool, and as a quirk
+of AMS in firmware, all of that memory shows up in node 0.  So, we end
+up with an allocation that will fail the goal/limit constraints.
+
+In theory, we could "fall-back" to alloc_bootmem_node() in
+sparse_early_usemaps_alloc_node(), but since we actually have HOTREMOVE
+defined, we'll BUG_ON() instead.  A simple solution appears to be to
+unconditionally remove the limit condition in alloc_bootmem_section,
+meaning allocations are allowed to cross section boundaries (necessary
+for systems of this size).
+
+Johannes Weiner pointed out that if alloc_bootmem_section() no longer
+guarantees section-locality, we need check_usemap_section_nr() to print
+possible cross-dependencies between node descriptors and the usemaps
+allocated through it.  That makes the two loops in
+sparse_early_usemaps_alloc_node() identical, so re-factor the code a
+bit.
+
+[akpm@linux-foundation.org: code simplification]
+Signed-off-by: Nishanth Aravamudan <nacc@us.ibm.com>
+Cc: Dave Hansen <haveblue@us.ibm.com>
+Cc: Anton Blanchard <anton@au1.ibm.com>
+Cc: Paul Mackerras <paulus@samba.org>
+Cc: Ben Herrenschmidt <benh@kernel.crashing.org>
+Cc: Robert Jennings <rcj@linux.vnet.ibm.com>
+Acked-by: Johannes Weiner <hannes@cmpxchg.org>
+Acked-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/bootmem.c |    5 ++---
+ mm/sparse.c  |   30 +++++++++++-------------------
+ 2 files changed, 13 insertions(+), 22 deletions(-)
+
+diff --git a/mm/bootmem.c b/mm/bootmem.c
+index 1a77012..b863822 100644
+--- a/mm/bootmem.c
++++ b/mm/bootmem.c
+@@ -768,14 +768,13 @@ void * __init alloc_bootmem_section(unsigned long size,
+ 				    unsigned long section_nr)
+ {
+ 	bootmem_data_t *bdata;
+-	unsigned long pfn, goal, limit;
++	unsigned long pfn, goal;
+ 
+ 	pfn = section_nr_to_pfn(section_nr);
+ 	goal = pfn << PAGE_SHIFT;
+-	limit = section_nr_to_pfn(section_nr + 1) << PAGE_SHIFT;
+ 	bdata = &bootmem_node_data[early_pfn_to_nid(pfn)];
+ 
+-	return alloc_bootmem_core(bdata, size, SMP_CACHE_BYTES, goal, limit);
++	return alloc_bootmem_core(bdata, size, SMP_CACHE_BYTES, goal, 0);
+ }
+ #endif
+ 
+diff --git a/mm/sparse.c b/mm/sparse.c
+index 61d7cde..a8bc7d3 100644
+--- a/mm/sparse.c
++++ b/mm/sparse.c
+@@ -353,29 +353,21 @@ static void __init sparse_early_usemaps_alloc_node(unsigned long**usemap_map,
+ 
+ 	usemap = sparse_early_usemaps_alloc_pgdat_section(NODE_DATA(nodeid),
+ 								 usemap_count);
+-	if (usemap) {
+-		for (pnum = pnum_begin; pnum < pnum_end; pnum++) {
+-			if (!present_section_nr(pnum))
+-				continue;
+-			usemap_map[pnum] = usemap;
+-			usemap += size;
++	if (!usemap) {
++		usemap = alloc_bootmem_node(NODE_DATA(nodeid), size * usemap_count);
++		if (!usemap) {
++			printk(KERN_WARNING "%s: allocation failed\n", __func__);
++			return;
+ 		}
+-		return;
+ 	}
+ 
+-	usemap = alloc_bootmem_node(NODE_DATA(nodeid), size * usemap_count);
+-	if (usemap) {
+-		for (pnum = pnum_begin; pnum < pnum_end; pnum++) {
+-			if (!present_section_nr(pnum))
+-				continue;
+-			usemap_map[pnum] = usemap;
+-			usemap += size;
+-			check_usemap_section_nr(nodeid, usemap_map[pnum]);
+-		}
+-		return;
++	for (pnum = pnum_begin; pnum < pnum_end; pnum++) {
++		if (!present_section_nr(pnum))
++			continue;
++		usemap_map[pnum] = usemap;
++		usemap += size;
++		check_usemap_section_nr(nodeid, usemap_map[pnum]);
+ 	}
+-
+-	printk(KERN_WARNING "%s: allocation failed\n", __func__);
+ }
+ 
+ #ifndef CONFIG_SPARSEMEM_VMEMMAP
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0056-hugetlbfs-avoid-taking-i_mutex-from-hugetlbfs_read.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0056-hugetlbfs-avoid-taking-i_mutex-from-hugetlbfs_read.patch
new file mode 100644
index 0000000..d5cfc26
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0056-hugetlbfs-avoid-taking-i_mutex-from-hugetlbfs_read.patch
@@ -0,0 +1,140 @@
+From 2bc105d9e4132f8a07cec0b5df3d308c1b99455f Mon Sep 17 00:00:00 2001
+From: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
+Date: Wed, 21 Mar 2012 16:34:08 -0700
+Subject: [PATCH 056/147] hugetlbfs: avoid taking i_mutex from
+ hugetlbfs_read()
+
+commit a05b0855fd15504972dba2358e5faa172a1e50ba upstream.
+
+Taking i_mutex in hugetlbfs_read() can result in deadlock with mmap as
+explained below
+
+ Thread A:
+  read() on hugetlbfs
+   hugetlbfs_read() called
+    i_mutex grabbed
+     hugetlbfs_read_actor() called
+      __copy_to_user() called
+       page fault is triggered
+ Thread B, sharing address space with A:
+  mmap() the same file
+   ->mmap_sem is grabbed on task_B->mm->mmap_sem
+    hugetlbfs_file_mmap() is called
+     attempt to grab ->i_mutex and block waiting for A to give it up
+ Thread A:
+  pagefault handled blocked on attempt to grab task_A->mm->mmap_sem,
+ which happens to be the same thing as task_B->mm->mmap_sem.  Block waiting
+ for B to give it up.
+
+AFAIU the i_mutex locking was added to hugetlbfs_read() as per
+http://lkml.indiana.edu/hypermail/linux/kernel/0707.2/3066.html to take
+care of the race between truncate and read.  This patch fixes this by
+looking at page->mapping under lock_page() (find_lock_page()) to ensure
+that the inode didn't get truncated in the range during a parallel read.
+
+Ideally we can extend the patch to make sure we don't increase i_size in
+mmap.  But that will break userspace, because applications will now have
+to use truncate(2) to increase i_size in hugetlbfs.
+
+Based on the original patch from Hillf Danton.
+
+Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.vnet.ibm.com>
+Cc: Hillf Danton <dhillf@gmail.com>
+Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Al Viro <viro@zeniv.linux.org.uk>
+Cc: Hugh Dickins <hughd@google.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/hugetlbfs/inode.c |   25 +++++++++----------------
+ 1 file changed, 9 insertions(+), 16 deletions(-)
+
+diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
+index 0be5a78..2d0ca24 100644
+--- a/fs/hugetlbfs/inode.c
++++ b/fs/hugetlbfs/inode.c
+@@ -238,17 +238,10 @@ static ssize_t hugetlbfs_read(struct file *filp, char __user *buf,
+ 	loff_t isize;
+ 	ssize_t retval = 0;
+ 
+-	mutex_lock(&inode->i_mutex);
+-
+ 	/* validate length */
+ 	if (len == 0)
+ 		goto out;
+ 
+-	isize = i_size_read(inode);
+-	if (!isize)
+-		goto out;
+-
+-	end_index = (isize - 1) >> huge_page_shift(h);
+ 	for (;;) {
+ 		struct page *page;
+ 		unsigned long nr, ret;
+@@ -256,18 +249,21 @@ static ssize_t hugetlbfs_read(struct file *filp, char __user *buf,
+ 
+ 		/* nr is the maximum number of bytes to copy from this page */
+ 		nr = huge_page_size(h);
++		isize = i_size_read(inode);
++		if (!isize)
++			goto out;
++		end_index = (isize - 1) >> huge_page_shift(h);
+ 		if (index >= end_index) {
+ 			if (index > end_index)
+ 				goto out;
+ 			nr = ((isize - 1) & ~huge_page_mask(h)) + 1;
+-			if (nr <= offset) {
++			if (nr <= offset)
+ 				goto out;
+-			}
+ 		}
+ 		nr = nr - offset;
+ 
+ 		/* Find the page */
+-		page = find_get_page(mapping, index);
++		page = find_lock_page(mapping, index);
+ 		if (unlikely(page == NULL)) {
+ 			/*
+ 			 * We have a HOLE, zero out the user-buffer for the
+@@ -279,17 +275,18 @@ static ssize_t hugetlbfs_read(struct file *filp, char __user *buf,
+ 			else
+ 				ra = 0;
+ 		} else {
++			unlock_page(page);
++
+ 			/*
+ 			 * We have the page, copy it to user space buffer.
+ 			 */
+ 			ra = hugetlbfs_read_actor(page, offset, buf, len, nr);
+ 			ret = ra;
++			page_cache_release(page);
+ 		}
+ 		if (ra < 0) {
+ 			if (retval == 0)
+ 				retval = ra;
+-			if (page)
+-				page_cache_release(page);
+ 			goto out;
+ 		}
+ 
+@@ -299,16 +296,12 @@ static ssize_t hugetlbfs_read(struct file *filp, char __user *buf,
+ 		index += offset >> huge_page_shift(h);
+ 		offset &= ~huge_page_mask(h);
+ 
+-		if (page)
+-			page_cache_release(page);
+-
+ 		/* short read or no more work */
+ 		if ((ret != nr) || (len == 0))
+ 			break;
+ 	}
+ out:
+ 	*ppos = ((loff_t)index << huge_page_shift(h)) + offset;
+-	mutex_unlock(&inode->i_mutex);
+ 	return retval;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0057-ASoC-fsl-p1022ds-tell-the-WM8776-codec-driver-that-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0057-ASoC-fsl-p1022ds-tell-the-WM8776-codec-driver-that-i.patch
new file mode 100644
index 0000000..a4c39dd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0057-ASoC-fsl-p1022ds-tell-the-WM8776-codec-driver-that-i.patch
@@ -0,0 +1,89 @@
+From a7338f169446baa4311a9248017ab75ed417a46c Mon Sep 17 00:00:00 2001
+From: Timur Tabi <timur@freescale.com>
+Date: Fri, 16 Mar 2012 16:32:52 -0500
+Subject: [PATCH 057/147] ASoC: fsl: p1022ds: tell the WM8776 codec driver
+ that it's the master
+
+commit 70ac07bb633dee75ac554195b9a4d69adfa7803c upstream.
+
+The WM8776 codec driver requires the machine driver to set one of the
+SND_SOC_DAIFMT_CBx_xxx values.  The P1022DS machine driver should be setting
+SND_SOC_DAIFMT_CBM_CFM, but since that value was zero, no one noticed.
+
+Commit 75d9ac46 ("ASoC: Allow DAI formats to be specified in the
+dai_link"), however, changed the value of SND_SOC_DAIFMT_CBM_CFM from zero
+to a non-zero value, which means that it now needs to be specifically set
+by the machine driver.
+
+We also set SND_SOC_DAIFMT_NB_NF, for the same reason.
+
+Signed-off-by: Timur Tabi <timur@freescale.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/fsl/p1022_ds.c |   24 ++++++++++++++++--------
+ 1 file changed, 16 insertions(+), 8 deletions(-)
+
+diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
+index 2c064a9..075677c 100644
+--- a/sound/soc/fsl/p1022_ds.c
++++ b/sound/soc/fsl/p1022_ds.c
+@@ -392,7 +392,8 @@ static int p1022_ds_probe(struct platform_device *pdev)
+ 	}
+ 
+ 	if (strcasecmp(sprop, "i2s-slave") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_I2S;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBM_CFM;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
+ 
+@@ -409,31 +410,38 @@ static int p1022_ds_probe(struct platform_device *pdev)
+ 		}
+ 		mdata->clk_frequency = be32_to_cpup(iprop);
+ 	} else if (strcasecmp(sprop, "i2s-master") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_I2S;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBS_CFS;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
+ 	} else if (strcasecmp(sprop, "lj-slave") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_LEFT_J;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBM_CFM;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
+ 	} else if (strcasecmp(sprop, "lj-master") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_LEFT_J;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_LEFT_J | SND_SOC_DAIFMT_CBS_CFS;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
+ 	} else if (strcasecmp(sprop, "rj-slave") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_RIGHT_J;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBM_CFM;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
+ 	} else if (strcasecmp(sprop, "rj-master") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_RIGHT_J;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_RIGHT_J | SND_SOC_DAIFMT_CBS_CFS;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
+ 	} else if (strcasecmp(sprop, "ac97-slave") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_AC97;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBM_CFM;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_OUT;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_IN;
+ 	} else if (strcasecmp(sprop, "ac97-master") == 0) {
+-		mdata->dai_format = SND_SOC_DAIFMT_AC97;
++		mdata->dai_format = SND_SOC_DAIFMT_NB_NF |
++			SND_SOC_DAIFMT_AC97 | SND_SOC_DAIFMT_CBS_CFS;
+ 		mdata->codec_clk_direction = SND_SOC_CLOCK_IN;
+ 		mdata->cpu_clk_direction = SND_SOC_CLOCK_OUT;
+ 	} else {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0058-ASoC-pxa-ssp-atomically-set-stream-active-masks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0058-ASoC-pxa-ssp-atomically-set-stream-active-masks.patch
new file mode 100644
index 0000000..295a909
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0058-ASoC-pxa-ssp-atomically-set-stream-active-masks.patch
@@ -0,0 +1,122 @@
+From ab7d4a1c2c58f17a777947ef7e0ae242fea985e4 Mon Sep 17 00:00:00 2001
+From: Daniel Mack <zonque@gmail.com>
+Date: Mon, 19 Mar 2012 09:12:53 +0100
+Subject: [PATCH 058/147] ASoC: pxa-ssp: atomically set stream active masks
+
+commit 273b72c8ce6b28df6b49423d775c3e59072c73c5 upstream.
+
+PXA's SSP engine fails to take its current channel phase into account
+when enabling a stream while the engine is already running. This
+results in randomly swapped left/right channels on either the record
+or the playback side, depending on which one was enabled first.
+
+The following patch fixes this by factoring out the bit field
+modifications in question to a separate function that pauses the
+engine temporarily, modifies the bits and kicks it off again
+afterwards. Appearantly, a transition of SSCR0_SSE syncs both
+directions properly.
+
+The patch has been rolled out to quite a number of devices over the
+last weeks and seems to fix the issue reliably.
+
+Signed-off-by: Daniel Mack <zonque@gmail.com>
+Reported-and-tested-by: Sven Neumann <s.neumann@raumfeld.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/pxa/pxa-ssp.c |   61 ++++++++++++++++++++++++++++-------------------
+ 1 file changed, 36 insertions(+), 25 deletions(-)
+
+diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
+index 8ad93ee..b583e60 100644
+--- a/sound/soc/pxa/pxa-ssp.c
++++ b/sound/soc/pxa/pxa-ssp.c
+@@ -668,6 +668,38 @@ static int pxa_ssp_hw_params(struct snd_pcm_substream *substream,
+ 	return 0;
+ }
+ 
++static void pxa_ssp_set_running_bit(struct snd_pcm_substream *substream,
++				    struct ssp_device *ssp, int value)
++{
++	uint32_t sscr0 = pxa_ssp_read_reg(ssp, SSCR0);
++	uint32_t sscr1 = pxa_ssp_read_reg(ssp, SSCR1);
++	uint32_t sspsp = pxa_ssp_read_reg(ssp, SSPSP);
++	uint32_t sssr = pxa_ssp_read_reg(ssp, SSSR);
++
++	if (value && (sscr0 & SSCR0_SSE))
++		pxa_ssp_write_reg(ssp, SSCR0, sscr0 & ~SSCR0_SSE);
++
++	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
++		if (value)
++			sscr1 |= SSCR1_TSRE;
++		else
++			sscr1 &= ~SSCR1_TSRE;
++	} else {
++		if (value)
++			sscr1 |= SSCR1_RSRE;
++		else
++			sscr1 &= ~SSCR1_RSRE;
++	}
++
++	pxa_ssp_write_reg(ssp, SSCR1, sscr1);
++
++	if (value) {
++		pxa_ssp_write_reg(ssp, SSSR, sssr);
++		pxa_ssp_write_reg(ssp, SSPSP, sspsp);
++		pxa_ssp_write_reg(ssp, SSCR0, sscr0 | SSCR0_SSE);
++	}
++}
++
+ static int pxa_ssp_trigger(struct snd_pcm_substream *substream, int cmd,
+ 			   struct snd_soc_dai *cpu_dai)
+ {
+@@ -681,42 +713,21 @@ static int pxa_ssp_trigger(struct snd_pcm_substream *substream, int cmd,
+ 		pxa_ssp_enable(ssp);
+ 		break;
+ 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+-		val = pxa_ssp_read_reg(ssp, SSCR1);
+-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+-			val |= SSCR1_TSRE;
+-		else
+-			val |= SSCR1_RSRE;
+-		pxa_ssp_write_reg(ssp, SSCR1, val);
++		pxa_ssp_set_running_bit(substream, ssp, 1);
+ 		val = pxa_ssp_read_reg(ssp, SSSR);
+ 		pxa_ssp_write_reg(ssp, SSSR, val);
+ 		break;
+ 	case SNDRV_PCM_TRIGGER_START:
+-		val = pxa_ssp_read_reg(ssp, SSCR1);
+-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+-			val |= SSCR1_TSRE;
+-		else
+-			val |= SSCR1_RSRE;
+-		pxa_ssp_write_reg(ssp, SSCR1, val);
+-		pxa_ssp_enable(ssp);
++		pxa_ssp_set_running_bit(substream, ssp, 1);
+ 		break;
+ 	case SNDRV_PCM_TRIGGER_STOP:
+-		val = pxa_ssp_read_reg(ssp, SSCR1);
+-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+-			val &= ~SSCR1_TSRE;
+-		else
+-			val &= ~SSCR1_RSRE;
+-		pxa_ssp_write_reg(ssp, SSCR1, val);
++		pxa_ssp_set_running_bit(substream, ssp, 0);
+ 		break;
+ 	case SNDRV_PCM_TRIGGER_SUSPEND:
+ 		pxa_ssp_disable(ssp);
+ 		break;
+ 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+-		val = pxa_ssp_read_reg(ssp, SSCR1);
+-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+-			val &= ~SSCR1_TSRE;
+-		else
+-			val &= ~SSCR1_RSRE;
+-		pxa_ssp_write_reg(ssp, SSCR1, val);
++		pxa_ssp_set_running_bit(substream, ssp, 0);
+ 		break;
+ 
+ 	default:
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0059-tcm_loop-Set-residual-field-for-SCSI-commands.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0059-tcm_loop-Set-residual-field-for-SCSI-commands.patch
new file mode 100644
index 0000000..367ed76
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0059-tcm_loop-Set-residual-field-for-SCSI-commands.patch
@@ -0,0 +1,51 @@
+From eb6dc69e78c98c8c61faba348a6eaf6cee1439d9 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Tue, 14 Feb 2012 15:30:31 -0800
+Subject: [PATCH 059/147] tcm_loop: Set residual field for SCSI commands
+
+commit 6cf3fa6918baab0c447f1206f1cef9166ad04864 upstream.
+
+If the target core signals an over- or under-run, tcm_loop should call
+scsi_set_resid() to tell the SCSI midlayer about the residual data length.
+
+The difference can be seen by doing something like
+
+    strace -eioctl sg_raw -r 1024 /dev/sda 8 0 0 0 1 0 > /dev/null
+
+and looking at the "resid=" part of the SG_IO ioctl -- after this patch,
+the field is correctly reported as 512.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/loopback/tcm_loop.c |    6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/drivers/target/loopback/tcm_loop.c b/drivers/target/loopback/tcm_loop.c
+index 81d5832..5d1d4f2 100644
+--- a/drivers/target/loopback/tcm_loop.c
++++ b/drivers/target/loopback/tcm_loop.c
+@@ -866,6 +866,9 @@ static int tcm_loop_queue_data_in(struct se_cmd *se_cmd)
+ 
+ 	sc->result = SAM_STAT_GOOD;
+ 	set_host_byte(sc, DID_OK);
++	if ((se_cmd->se_cmd_flags & SCF_OVERFLOW_BIT) ||
++	    (se_cmd->se_cmd_flags & SCF_UNDERFLOW_BIT))
++		scsi_set_resid(sc, se_cmd->residual_count);
+ 	sc->scsi_done(sc);
+ 	return 0;
+ }
+@@ -891,6 +894,9 @@ static int tcm_loop_queue_status(struct se_cmd *se_cmd)
+ 		sc->result = se_cmd->scsi_status;
+ 
+ 	set_host_byte(sc, DID_OK);
++	if ((se_cmd->se_cmd_flags & SCF_OVERFLOW_BIT) ||
++	    (se_cmd->se_cmd_flags & SCF_UNDERFLOW_BIT))
++		scsi_set_resid(sc, se_cmd->residual_count);
+ 	sc->scsi_done(sc);
+ 	return 0;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0060-iscsi-target-Fix-iscsit_alloc_buffs-failure-cases.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0060-iscsi-target-Fix-iscsit_alloc_buffs-failure-cases.patch
new file mode 100644
index 0000000..c4cbbea
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0060-iscsi-target-Fix-iscsit_alloc_buffs-failure-cases.patch
@@ -0,0 +1,62 @@
+From eeb9b513b81a2ebbb3812150c091ff26ee28d912 Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Thu, 23 Feb 2012 17:28:43 -0800
+Subject: [PATCH 060/147] iscsi-target: Fix iscsit_alloc_buffs() failure cases
+
+commit d335e6054db616bce3f040e659fa38440518ad1d upstream.
+
+Make iscsit_alloc_buffs() failure case for page_alloc_failed use correct
+__free_page() SGL pointer, and return -ENOMEM for iscsit_allocate_iovecs
+failure to push se_cmd->t_mem_sg release into iscsit_release_cmd()
+callback during iscsit_add_reject_from_cmd() connection reset.
+
+Also drop cmd->t_mem_sg = NULL assignment from page_alloc_failed
+failure case.
+
+Reported-by: Roland Dreier <roland@purestorage.com>
+Cc: Andy Grover <agrover@redhat.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/iscsi/iscsi_target.c |   14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
+index 03d3528..0842cc7 100644
+--- a/drivers/target/iscsi/iscsi_target.c
++++ b/drivers/target/iscsi/iscsi_target.c
+@@ -781,7 +781,7 @@ static int iscsit_alloc_buffs(struct iscsi_cmd *cmd)
+ 	struct scatterlist *sgl;
+ 	u32 length = cmd->se_cmd.data_length;
+ 	int nents = DIV_ROUND_UP(length, PAGE_SIZE);
+-	int i = 0, ret;
++	int i = 0, j = 0, ret;
+ 	/*
+ 	 * If no SCSI payload is present, allocate the default iovecs used for
+ 	 * iSCSI PDU Header
+@@ -822,17 +822,15 @@ static int iscsit_alloc_buffs(struct iscsi_cmd *cmd)
+ 	 */
+         ret = iscsit_allocate_iovecs(cmd);
+         if (ret < 0)
+-		goto page_alloc_failed;
++		return -ENOMEM;
+ 
+ 	return 0;
+ 
+ page_alloc_failed:
+-	while (i >= 0) {
+-		__free_page(sg_page(&sgl[i]));
+-		i--;
+-	}
+-	kfree(cmd->t_mem_sg);
+-	cmd->t_mem_sg = NULL;
++	while (j < i)
++		__free_page(sg_page(&sgl[j++]));
++
++	kfree(sgl);
+ 	return -ENOMEM;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0061-iscsi-target-Fix-dynamic-explict-NodeACL-pointer-ref.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0061-iscsi-target-Fix-dynamic-explict-NodeACL-pointer-ref.patch
new file mode 100644
index 0000000..016bab4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0061-iscsi-target-Fix-dynamic-explict-NodeACL-pointer-ref.patch
@@ -0,0 +1,46 @@
+From 43d63ac69fcc86c6b92dc1b923a3b0e5bd59dab5 Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Sun, 26 Feb 2012 22:16:07 -0800
+Subject: [PATCH 061/147] iscsi-target: Fix dynamic -> explict NodeACL pointer
+ reference
+
+commit d06283341aee9e48eff1b068779d340785c635ce upstream.
+
+This patch fixes a free after use in lio_target_make_nodeacl() where
+iscsi_node_acl was referenced from the original se_nacl_new allocation,
+instead of from core_tpg_add_initiator_node_acl() in the case of dynamic
+-> explict NodeACL conversion.
+
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/iscsi/iscsi_target_configfs.c |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target_configfs.c b/drivers/target/iscsi/iscsi_target_configfs.c
+index db32784..83dcf49 100644
+--- a/drivers/target/iscsi/iscsi_target_configfs.c
++++ b/drivers/target/iscsi/iscsi_target_configfs.c
+@@ -816,9 +816,6 @@ static struct se_node_acl *lio_target_make_nodeacl(
+ 	if (!se_nacl_new)
+ 		return ERR_PTR(-ENOMEM);
+ 
+-	acl = container_of(se_nacl_new, struct iscsi_node_acl,
+-				se_node_acl);
+-
+ 	cmdsn_depth = ISCSI_TPG_ATTRIB(tpg)->default_cmdsn_depth;
+ 	/*
+ 	 * se_nacl_new may be released by core_tpg_add_initiator_node_acl()
+@@ -829,7 +826,8 @@ static struct se_node_acl *lio_target_make_nodeacl(
+ 	if (IS_ERR(se_nacl))
+ 		return se_nacl;
+ 
+-	stats_cg = &acl->se_node_acl.acl_fabric_stat_group;
++	acl = container_of(se_nacl, struct iscsi_node_acl, se_node_acl);
++	stats_cg = &se_nacl->acl_fabric_stat_group;
+ 
+ 	stats_cg->default_groups = kzalloc(sizeof(struct config_group) * 2,
+ 				GFP_KERNEL);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0062-ALSA-hda-fix-printing-of-high-HDMI-sample-rates.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0062-ALSA-hda-fix-printing-of-high-HDMI-sample-rates.patch
new file mode 100644
index 0000000..0eef1c0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0062-ALSA-hda-fix-printing-of-high-HDMI-sample-rates.patch
@@ -0,0 +1,43 @@
+From 6b3759def25d01a00d3a88701e97cb397f3aa805 Mon Sep 17 00:00:00 2001
+From: Anssi Hannula <anssi.hannula@iki.fi>
+Date: Tue, 13 Mar 2012 17:43:02 +0200
+Subject: [PATCH 062/147] ALSA: hda - fix printing of high HDMI sample rates
+
+commit 25dc16f69892182192b1234594fd3cf342ad4195 upstream.
+
+A previous commit af65cbf296 (ALSA: hdmi: fix printout of SAD sampling
+rates) fixed the sample rates shown in /proc/asound/cardX/eldY and
+kernel log to not be entirely wrong. However, a missing rate from the
+array added in the patch causes HDMI rates 88.2 kHz, 96 kHz, 176.4 kHz,
+and 192 kHz to be shown as 96 kHz, 176.4 kHz, 192 kHz, and 384 kHz,
+respectively.
+
+Fix the reporting by adding the ALSA rate 64 kHz into the conversion
+array between 48 kHz and 88.2 kHz.
+
+Signed-off-by: Anssi Hannula <anssi.hannula@iki.fi>
+Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/hda_eld.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sound/pci/hda/hda_eld.c b/sound/pci/hda/hda_eld.c
+index c1da422..b58b4b1 100644
+--- a/sound/pci/hda/hda_eld.c
++++ b/sound/pci/hda/hda_eld.c
+@@ -385,8 +385,8 @@ error:
+ static void hdmi_print_pcm_rates(int pcm, char *buf, int buflen)
+ {
+ 	static unsigned int alsa_rates[] = {
+-		5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 88200,
+-		96000, 176400, 192000, 384000
++		5512, 8000, 11025, 16000, 22050, 32000, 44100, 48000, 64000,
++		88200, 96000, 176400, 192000, 384000
+ 	};
+ 	int i, j;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0063-usb-gadget-fix-a-section-mismatch-when-compiling-g_f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0063-usb-gadget-fix-a-section-mismatch-when-compiling-g_f.patch
new file mode 100644
index 0000000..4fa1b84
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0063-usb-gadget-fix-a-section-mismatch-when-compiling-g_f.patch
@@ -0,0 +1,190 @@
+From 7086d25802a86ade70baa0edfa830e10ad7cd434 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Lothar=20Wa=C3=9Fmann?= <LW@KARO-electronics.de>
+Date: Sun, 11 Mar 2012 15:08:46 +0100
+Subject: [PATCH 063/147] usb gadget: fix a section mismatch when compiling
+ g_ffs with CONFIG_USB_FUNCTIONFS_ETH
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 8d0698428822ce63f7269e7fe81fc4580807b9ac upstream.
+
+ commit 28824b18ac4705e876a282a15ea0de8fc957551f:
+ |Author: Michal Nazarewicz <m.nazarewicz@samsung.com>
+ |Date:   Wed May 5 12:53:13 2010 +0200
+ |
+ |    USB: gadget: __init and __exit tags removed
+ |
+ |    __init, __initdata and __exit tags have have been removed from
+ |    various files to make it possible for gadgets that do not use
+ |    the __init/__exit tags to use those.
+ obviously missed (at least) this case leading to a section mismatch in
+ g_ffs.c when compiling with CONFIG_USB_FUNCTIONFS_ETH enabled.
+
+Signed-off-by: Lothar Waßmann <LW@KARO-electronics.de>
+Acked-by: Michal Nazarewicz <mina86@mina86.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/f_subset.c |   34 +++++++++++++++++-----------------
+ 1 file changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_subset.c b/drivers/usb/gadget/f_subset.c
+index 85bd9bd..160ba02 100644
+--- a/drivers/usb/gadget/f_subset.c
++++ b/drivers/usb/gadget/f_subset.c
+@@ -74,7 +74,7 @@ static inline struct f_gether *func_to_geth(struct usb_function *f)
+ 
+ /* interface descriptor: */
+ 
+-static struct usb_interface_descriptor subset_data_intf __initdata = {
++static struct usb_interface_descriptor subset_data_intf = {
+ 	.bLength =		sizeof subset_data_intf,
+ 	.bDescriptorType =	USB_DT_INTERFACE,
+ 
+@@ -87,7 +87,7 @@ static struct usb_interface_descriptor subset_data_intf __initdata = {
+ 	/* .iInterface = DYNAMIC */
+ };
+ 
+-static struct usb_cdc_header_desc mdlm_header_desc __initdata = {
++static struct usb_cdc_header_desc mdlm_header_desc = {
+ 	.bLength =		sizeof mdlm_header_desc,
+ 	.bDescriptorType =	USB_DT_CS_INTERFACE,
+ 	.bDescriptorSubType =	USB_CDC_HEADER_TYPE,
+@@ -95,7 +95,7 @@ static struct usb_cdc_header_desc mdlm_header_desc __initdata = {
+ 	.bcdCDC =		cpu_to_le16(0x0110),
+ };
+ 
+-static struct usb_cdc_mdlm_desc mdlm_desc __initdata = {
++static struct usb_cdc_mdlm_desc mdlm_desc = {
+ 	.bLength =		sizeof mdlm_desc,
+ 	.bDescriptorType =	USB_DT_CS_INTERFACE,
+ 	.bDescriptorSubType =	USB_CDC_MDLM_TYPE,
+@@ -111,7 +111,7 @@ static struct usb_cdc_mdlm_desc mdlm_desc __initdata = {
+  * can't really use its struct.  All we do here is say that we're using
+  * the submode of "SAFE" which directly matches the CDC Subset.
+  */
+-static u8 mdlm_detail_desc[] __initdata = {
++static u8 mdlm_detail_desc[] = {
+ 	6,
+ 	USB_DT_CS_INTERFACE,
+ 	USB_CDC_MDLM_DETAIL_TYPE,
+@@ -121,7 +121,7 @@ static u8 mdlm_detail_desc[] __initdata = {
+ 	0,	/* network data capabilities ("raw" encapsulation) */
+ };
+ 
+-static struct usb_cdc_ether_desc ether_desc __initdata = {
++static struct usb_cdc_ether_desc ether_desc = {
+ 	.bLength =		sizeof ether_desc,
+ 	.bDescriptorType =	USB_DT_CS_INTERFACE,
+ 	.bDescriptorSubType =	USB_CDC_ETHERNET_TYPE,
+@@ -136,7 +136,7 @@ static struct usb_cdc_ether_desc ether_desc __initdata = {
+ 
+ /* full speed support: */
+ 
+-static struct usb_endpoint_descriptor fs_subset_in_desc __initdata = {
++static struct usb_endpoint_descriptor fs_subset_in_desc = {
+ 	.bLength =		USB_DT_ENDPOINT_SIZE,
+ 	.bDescriptorType =	USB_DT_ENDPOINT,
+ 
+@@ -144,7 +144,7 @@ static struct usb_endpoint_descriptor fs_subset_in_desc __initdata = {
+ 	.bmAttributes =		USB_ENDPOINT_XFER_BULK,
+ };
+ 
+-static struct usb_endpoint_descriptor fs_subset_out_desc __initdata = {
++static struct usb_endpoint_descriptor fs_subset_out_desc = {
+ 	.bLength =		USB_DT_ENDPOINT_SIZE,
+ 	.bDescriptorType =	USB_DT_ENDPOINT,
+ 
+@@ -152,7 +152,7 @@ static struct usb_endpoint_descriptor fs_subset_out_desc __initdata = {
+ 	.bmAttributes =		USB_ENDPOINT_XFER_BULK,
+ };
+ 
+-static struct usb_descriptor_header *fs_eth_function[] __initdata = {
++static struct usb_descriptor_header *fs_eth_function[] = {
+ 	(struct usb_descriptor_header *) &subset_data_intf,
+ 	(struct usb_descriptor_header *) &mdlm_header_desc,
+ 	(struct usb_descriptor_header *) &mdlm_desc,
+@@ -165,7 +165,7 @@ static struct usb_descriptor_header *fs_eth_function[] __initdata = {
+ 
+ /* high speed support: */
+ 
+-static struct usb_endpoint_descriptor hs_subset_in_desc __initdata = {
++static struct usb_endpoint_descriptor hs_subset_in_desc = {
+ 	.bLength =		USB_DT_ENDPOINT_SIZE,
+ 	.bDescriptorType =	USB_DT_ENDPOINT,
+ 
+@@ -173,7 +173,7 @@ static struct usb_endpoint_descriptor hs_subset_in_desc __initdata = {
+ 	.wMaxPacketSize =	cpu_to_le16(512),
+ };
+ 
+-static struct usb_endpoint_descriptor hs_subset_out_desc __initdata = {
++static struct usb_endpoint_descriptor hs_subset_out_desc = {
+ 	.bLength =		USB_DT_ENDPOINT_SIZE,
+ 	.bDescriptorType =	USB_DT_ENDPOINT,
+ 
+@@ -181,7 +181,7 @@ static struct usb_endpoint_descriptor hs_subset_out_desc __initdata = {
+ 	.wMaxPacketSize =	cpu_to_le16(512),
+ };
+ 
+-static struct usb_descriptor_header *hs_eth_function[] __initdata = {
++static struct usb_descriptor_header *hs_eth_function[] = {
+ 	(struct usb_descriptor_header *) &subset_data_intf,
+ 	(struct usb_descriptor_header *) &mdlm_header_desc,
+ 	(struct usb_descriptor_header *) &mdlm_desc,
+@@ -194,7 +194,7 @@ static struct usb_descriptor_header *hs_eth_function[] __initdata = {
+ 
+ /* super speed support: */
+ 
+-static struct usb_endpoint_descriptor ss_subset_in_desc __initdata = {
++static struct usb_endpoint_descriptor ss_subset_in_desc = {
+ 	.bLength =		USB_DT_ENDPOINT_SIZE,
+ 	.bDescriptorType =	USB_DT_ENDPOINT,
+ 
+@@ -202,7 +202,7 @@ static struct usb_endpoint_descriptor ss_subset_in_desc __initdata = {
+ 	.wMaxPacketSize =	cpu_to_le16(1024),
+ };
+ 
+-static struct usb_endpoint_descriptor ss_subset_out_desc __initdata = {
++static struct usb_endpoint_descriptor ss_subset_out_desc = {
+ 	.bLength =		USB_DT_ENDPOINT_SIZE,
+ 	.bDescriptorType =	USB_DT_ENDPOINT,
+ 
+@@ -210,7 +210,7 @@ static struct usb_endpoint_descriptor ss_subset_out_desc __initdata = {
+ 	.wMaxPacketSize =	cpu_to_le16(1024),
+ };
+ 
+-static struct usb_ss_ep_comp_descriptor ss_subset_bulk_comp_desc __initdata = {
++static struct usb_ss_ep_comp_descriptor ss_subset_bulk_comp_desc = {
+ 	.bLength =		sizeof ss_subset_bulk_comp_desc,
+ 	.bDescriptorType =	USB_DT_SS_ENDPOINT_COMP,
+ 
+@@ -219,7 +219,7 @@ static struct usb_ss_ep_comp_descriptor ss_subset_bulk_comp_desc __initdata = {
+ 	/* .bmAttributes =	0, */
+ };
+ 
+-static struct usb_descriptor_header *ss_eth_function[] __initdata = {
++static struct usb_descriptor_header *ss_eth_function[] = {
+ 	(struct usb_descriptor_header *) &subset_data_intf,
+ 	(struct usb_descriptor_header *) &mdlm_header_desc,
+ 	(struct usb_descriptor_header *) &mdlm_desc,
+@@ -290,7 +290,7 @@ static void geth_disable(struct usb_function *f)
+ 
+ /* serial function driver setup/binding */
+ 
+-static int __init
++static int
+ geth_bind(struct usb_configuration *c, struct usb_function *f)
+ {
+ 	struct usb_composite_dev *cdev = c->cdev;
+@@ -405,7 +405,7 @@ geth_unbind(struct usb_configuration *c, struct usb_function *f)
+  * Caller must have called @gether_setup().  Caller is also responsible
+  * for calling @gether_cleanup() before module unload.
+  */
+-int __init geth_bind_config(struct usb_configuration *c, u8 ethaddr[ETH_ALEN])
++int geth_bind_config(struct usb_configuration *c, u8 ethaddr[ETH_ALEN])
+ {
+ 	struct f_gether	*geth;
+ 	int		status;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0064-udlfb-remove-sysfs-framebuffer-device-with-USB-.disc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0064-udlfb-remove-sysfs-framebuffer-device-with-USB-.disc.patch
new file mode 100644
index 0000000..42684c7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0064-udlfb-remove-sysfs-framebuffer-device-with-USB-.disc.patch
@@ -0,0 +1,120 @@
+From 65fc28a302c7d7220dbe8609899724edb9687162 Mon Sep 17 00:00:00 2001
+From: Kay Sievers <kay.sievers@vrfy.org>
+Date: Sat, 28 Jan 2012 19:57:46 +0000
+Subject: [PATCH 064/147] udlfb: remove sysfs framebuffer device with USB
+ .disconnect()
+
+commit ce880cb860f36694d2cdebfac9e6ae18176fe4c4 upstream.
+
+The USB graphics card driver delays the unregistering of the framebuffer
+device to a workqueue, which breaks the userspace visible remove uevent
+sequence. Recent userspace tools started to support USB graphics card
+hotplug out-of-the-box and rely on proper events sent by the kernel.
+
+The framebuffer device is a direct child of the USB interface which is
+removed immediately after the USB .disconnect() callback. But the fb device
+in /sys stays around until its final cleanup, at a time where all the parent
+devices have been removed already.
+
+To work around that, we remove the sysfs fb device directly in the USB
+.disconnect() callback and leave only the cleanup of the internal fb
+data to the delayed work.
+
+Before:
+ add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2 (usb)
+ add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0 (usb)
+ add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0/graphics/fb0 (graphics)
+ remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0 (usb)
+ remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2 (usb)
+ remove   /2-1.2:1.0/graphics/fb0 (graphics)
+
+After:
+ add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2 (usb)
+ add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0 (usb)
+ add      /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0/graphics/fb1 (graphics)
+ remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0/graphics/fb1 (graphics)
+ remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2/2-1.2:1.0 (usb)
+ remove   /devices/pci0000:00/0000:00:1d.0/usb2/2-1/2-1.2 (usb)
+
+Tested-by: Bernie Thompson <bernie@plugable.com>
+Acked-by: Bernie Thompson <bernie@plugable.com>
+Signed-off-by: Kay Sievers <kay.sievers@vrfy.org>
+Signed-off-by: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/video/fbmem.c |   18 +++++++++++++++++-
+ drivers/video/udlfb.c |    2 +-
+ include/linux/fb.h    |    1 +
+ 3 files changed, 19 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/video/fbmem.c b/drivers/video/fbmem.c
+index ad93629..7a41220 100644
+--- a/drivers/video/fbmem.c
++++ b/drivers/video/fbmem.c
+@@ -1651,6 +1651,7 @@ static int do_unregister_framebuffer(struct fb_info *fb_info)
+ 	if (ret)
+ 		return -EINVAL;
+ 
++	unlink_framebuffer(fb_info);
+ 	if (fb_info->pixmap.addr &&
+ 	    (fb_info->pixmap.flags & FB_PIXMAP_DEFAULT))
+ 		kfree(fb_info->pixmap.addr);
+@@ -1658,7 +1659,6 @@ static int do_unregister_framebuffer(struct fb_info *fb_info)
+ 	registered_fb[i] = NULL;
+ 	num_registered_fb--;
+ 	fb_cleanup_device(fb_info);
+-	device_destroy(fb_class, MKDEV(FB_MAJOR, i));
+ 	event.info = fb_info;
+ 	fb_notifier_call_chain(FB_EVENT_FB_UNREGISTERED, &event);
+ 
+@@ -1667,6 +1667,22 @@ static int do_unregister_framebuffer(struct fb_info *fb_info)
+ 	return 0;
+ }
+ 
++int unlink_framebuffer(struct fb_info *fb_info)
++{
++	int i;
++
++	i = fb_info->node;
++	if (i < 0 || i >= FB_MAX || registered_fb[i] != fb_info)
++		return -EINVAL;
++
++	if (fb_info->dev) {
++		device_destroy(fb_class, MKDEV(FB_MAJOR, i));
++		fb_info->dev = NULL;
++	}
++	return 0;
++}
++EXPORT_SYMBOL(unlink_framebuffer);
++
+ void remove_conflicting_framebuffers(struct apertures_struct *a,
+ 				     const char *name, bool primary)
+ {
+diff --git a/drivers/video/udlfb.c b/drivers/video/udlfb.c
+index 3473e75..41746bb 100644
+--- a/drivers/video/udlfb.c
++++ b/drivers/video/udlfb.c
+@@ -1739,7 +1739,7 @@ static void dlfb_usb_disconnect(struct usb_interface *interface)
+ 	for (i = 0; i < ARRAY_SIZE(fb_device_attrs); i++)
+ 		device_remove_file(info->dev, &fb_device_attrs[i]);
+ 	device_remove_bin_file(info->dev, &edid_attr);
+-
++	unlink_framebuffer(info);
+ 	usb_set_intfdata(interface, NULL);
+ 
+ 	/* if clients still have us open, will be freed on last close */
+diff --git a/include/linux/fb.h b/include/linux/fb.h
+index 1d6836c..73845ce 100644
+--- a/include/linux/fb.h
++++ b/include/linux/fb.h
+@@ -997,6 +997,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
+ /* drivers/video/fbmem.c */
+ extern int register_framebuffer(struct fb_info *fb_info);
+ extern int unregister_framebuffer(struct fb_info *fb_info);
++extern int unlink_framebuffer(struct fb_info *fb_info);
+ extern void remove_conflicting_framebuffers(struct apertures_struct *a,
+ 				const char *name, bool primary);
+ extern int fb_prepare_logo(struct fb_info *fb_info, int rotate);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0065-tcm_fc-Fix-fc_exch-memory-leak-in-ft_send_resp_statu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0065-tcm_fc-Fix-fc_exch-memory-leak-in-ft_send_resp_statu.patch
new file mode 100644
index 0000000..e4311b4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0065-tcm_fc-Fix-fc_exch-memory-leak-in-ft_send_resp_statu.patch
@@ -0,0 +1,50 @@
+From a38ce1660f9b3f6abec9206118adc0a33bda9730 Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Fri, 9 Mar 2012 23:45:38 -0800
+Subject: [PATCH 065/147] tcm_fc: Fix fc_exch memory leak in
+ ft_send_resp_status
+
+commit 031ed4d565b31880a4136bb7366bc89f5b1dba7d upstream.
+
+This patch fixes a bug in tcm_fc where fc_exch memory from fc_exch_mgr->ep_pool
+is currently being leaked by ft_send_resp_status() usage.  Following current
+code in ft_queue_status() response path, using lport->tt.seq_send() needs to be
+followed by a lport->tt.exch_done() in order to release fc_exch memory back into
+libfc_em kmem_cache.
+
+ft_send_resp_status() code is currently used in pre submit se_cmd ft_send_work()
+error exceptions, TM request setup exceptions, and main TM response callback
+path in ft_queue_tm_resp().  This bugfix addresses the leak in these cases.
+
+Cc: Mark D Rustad <mark.d.rustad@intel.com>
+Cc: Kiran Patil <kiran.patil@intel.com>
+Cc: Robert Love <robert.w.love@intel.com>
+Cc: Andy Grover <agrover@redhat.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/tcm_fc/tfc_cmd.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/target/tcm_fc/tfc_cmd.c b/drivers/target/tcm_fc/tfc_cmd.c
+index 71fc9ce..754b669 100644
+--- a/drivers/target/tcm_fc/tfc_cmd.c
++++ b/drivers/target/tcm_fc/tfc_cmd.c
+@@ -329,10 +329,12 @@ static void ft_send_resp_status(struct fc_lport *lport,
+ 
+ 	fc_fill_reply_hdr(fp, rx_fp, FC_RCTL_DD_CMD_STATUS, 0);
+ 	sp = fr_seq(fp);
+-	if (sp)
++	if (sp) {
+ 		lport->tt.seq_send(lport, sp, fp);
+-	else
++		lport->tt.exch_done(sp);
++	} else {
+ 		lport->tt.frame_send(lport, fp);
++	}
+ }
+ 
+ /*
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0066-md-bitmap-ensure-to-load-bitmap-when-creating-via-sy.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0066-md-bitmap-ensure-to-load-bitmap-when-creating-via-sy.patch
new file mode 100644
index 0000000..03c666b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0066-md-bitmap-ensure-to-load-bitmap-when-creating-via-sy.patch
@@ -0,0 +1,37 @@
+From 850bfe24a75251acf10ad9dbacd4bc750005fd1b Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Mon, 19 Mar 2012 12:46:37 +1100
+Subject: [PATCH 066/147] md/bitmap: ensure to load bitmap when creating via
+ sysfs.
+
+commit 4474ca42e2577563a919fd3ed782e2ec55bf11a2 upstream.
+
+When commit 69e51b449d383e (md/bitmap:  separate out loading a bitmap...)
+created bitmap_load, it missed calling it after bitmap_create when a
+bitmap is created through the sysfs interface.
+So if a bitmap is added this way, we don't allocate memory properly
+and can crash.
+
+This is suitable for any -stable release since 2.6.35.
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/bitmap.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/md/bitmap.c b/drivers/md/bitmap.c
+index 6d03774..2a8722b 100644
+--- a/drivers/md/bitmap.c
++++ b/drivers/md/bitmap.c
+@@ -1904,6 +1904,8 @@ location_store(struct mddev *mddev, const char *buf, size_t len)
+ 			if (mddev->pers) {
+ 				mddev->pers->quiesce(mddev, 1);
+ 				rv = bitmap_create(mddev);
++				if (!rv)
++					rv = bitmap_load(mddev);
+ 				if (rv) {
+ 					bitmap_destroy(mddev);
+ 					mddev->bitmap_info.offset = 0;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0067-md-don-t-set-md-arrays-to-readonly-on-shutdown.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0067-md-don-t-set-md-arrays-to-readonly-on-shutdown.patch
new file mode 100644
index 0000000..93145a1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0067-md-don-t-set-md-arrays-to-readonly-on-shutdown.patch
@@ -0,0 +1,82 @@
+From c52810052a2cbfeb2b8768081f8a22240c0d0abe Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Mon, 19 Mar 2012 12:46:37 +1100
+Subject: [PATCH 067/147] md: don't set md arrays to readonly on shutdown.
+
+commit c744a65c1e2d59acc54333ce80a5b0702a98010b upstream.
+
+It seems that with recent kernel, writeback can still be happening
+while shutdown is happening, and consequently data can be written
+after the md reboot notifier switches all arrays to read-only.
+This causes a BUG.
+
+So don't switch them to read-only - just mark them clean and
+set 'safemode' to '2' which mean that immediately after any
+write the array will be switch back to 'clean'.
+
+This could result in the shutdown happening when array is marked
+dirty, thus forcing a resync on reboot.  However if you reboot
+without performing a "sync" first, you get to keep both halves.
+
+This is suitable for any stable kernel (though there might be some
+conflicts with obvious fixes in earlier kernels).
+
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/md.c |   37 +++++++++++++++----------------------
+ 1 file changed, 15 insertions(+), 22 deletions(-)
+
+diff --git a/drivers/md/md.c b/drivers/md/md.c
+index f47f1f8..65d552a 100644
+--- a/drivers/md/md.c
++++ b/drivers/md/md.c
+@@ -8097,30 +8097,23 @@ static int md_notify_reboot(struct notifier_block *this,
+ 	struct mddev *mddev;
+ 	int need_delay = 0;
+ 
+-	if ((code == SYS_DOWN) || (code == SYS_HALT) || (code == SYS_POWER_OFF)) {
+-
+-		printk(KERN_INFO "md: stopping all md devices.\n");
+-
+-		for_each_mddev(mddev, tmp) {
+-			if (mddev_trylock(mddev)) {
+-				/* Force a switch to readonly even array
+-				 * appears to still be in use.  Hence
+-				 * the '100'.
+-				 */
+-				md_set_readonly(mddev, 100);
+-				mddev_unlock(mddev);
+-			}
+-			need_delay = 1;
++	for_each_mddev(mddev, tmp) {
++		if (mddev_trylock(mddev)) {
++			__md_stop_writes(mddev);
++			mddev->safemode = 2;
++			mddev_unlock(mddev);
+ 		}
+-		/*
+-		 * certain more exotic SCSI devices are known to be
+-		 * volatile wrt too early system reboots. While the
+-		 * right place to handle this issue is the given
+-		 * driver, we do want to have a safe RAID driver ...
+-		 */
+-		if (need_delay)
+-			mdelay(1000*1);
++		need_delay = 1;
+ 	}
++	/*
++	 * certain more exotic SCSI devices are known to be
++	 * volatile wrt too early system reboots. While the
++	 * right place to handle this issue is the given
++	 * driver, we do want to have a safe RAID driver ...
++	 */
++	if (need_delay)
++		mdelay(1000*1);
++
+ 	return NOTIFY_DONE;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0068-md-raid1-raid10-avoid-deadlock-during-resync-recover.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0068-md-raid1-raid10-avoid-deadlock-during-resync-recover.patch
new file mode 100644
index 0000000..0fe819c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0068-md-raid1-raid10-avoid-deadlock-during-resync-recover.patch
@@ -0,0 +1,97 @@
+From 250082bf56c6157c888f21df27d73475cb6f0065 Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Mon, 19 Mar 2012 12:46:38 +1100
+Subject: [PATCH 068/147] md/raid1,raid10: avoid deadlock during
+ resync/recovery.
+
+commit d6b42dcb995e6acd7cc276774e751ffc9f0ef4bf upstream.
+
+If RAID1 or RAID10 is used under LVM or some other stacking
+block device, it is possible to enter a deadlock during
+resync or recovery.
+This can happen if the upper level block device creates
+two requests to the RAID1 or RAID10.  The first request gets
+processed, blocks recovery and queue requests for underlying
+requests in current->bio_list.  A resync request then starts
+which will wait for those requests and block new IO.
+
+But then the second request to the RAID1/10 will be attempted
+and it cannot progress until the resync request completes,
+which cannot progress until the underlying device requests complete,
+which are on a queue behind that second request.
+
+So allow that second request to proceed even though there is
+a resync request about to start.
+
+This is suitable for any -stable kernel.
+
+Reported-by: Ray Morris <support@bettercgi.com>
+Tested-by: Ray Morris <support@bettercgi.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/raid1.c  |   17 +++++++++++++++--
+ drivers/md/raid10.c |   17 +++++++++++++++--
+ 2 files changed, 30 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
+index 7d9e071..7af60ec 100644
+--- a/drivers/md/raid1.c
++++ b/drivers/md/raid1.c
+@@ -731,9 +731,22 @@ static void wait_barrier(struct r1conf *conf)
+ 	spin_lock_irq(&conf->resync_lock);
+ 	if (conf->barrier) {
+ 		conf->nr_waiting++;
+-		wait_event_lock_irq(conf->wait_barrier, !conf->barrier,
++		/* Wait for the barrier to drop.
++		 * However if there are already pending
++		 * requests (preventing the barrier from
++		 * rising completely), and the
++		 * pre-process bio queue isn't empty,
++		 * then don't wait, as we need to empty
++		 * that queue to get the nr_pending
++		 * count down.
++		 */
++		wait_event_lock_irq(conf->wait_barrier,
++				    !conf->barrier ||
++				    (conf->nr_pending &&
++				     current->bio_list &&
++				     !bio_list_empty(current->bio_list)),
+ 				    conf->resync_lock,
+-				    );
++			);
+ 		conf->nr_waiting--;
+ 	}
+ 	conf->nr_pending++;
+diff --git a/drivers/md/raid10.c b/drivers/md/raid10.c
+index 685ddf3..b219449 100644
+--- a/drivers/md/raid10.c
++++ b/drivers/md/raid10.c
+@@ -790,9 +790,22 @@ static void wait_barrier(struct r10conf *conf)
+ 	spin_lock_irq(&conf->resync_lock);
+ 	if (conf->barrier) {
+ 		conf->nr_waiting++;
+-		wait_event_lock_irq(conf->wait_barrier, !conf->barrier,
++		/* Wait for the barrier to drop.
++		 * However if there are already pending
++		 * requests (preventing the barrier from
++		 * rising completely), and the
++		 * pre-process bio queue isn't empty,
++		 * then don't wait, as we need to empty
++		 * that queue to get the nr_pending
++		 * count down.
++		 */
++		wait_event_lock_irq(conf->wait_barrier,
++				    !conf->barrier ||
++				    (conf->nr_pending &&
++				     current->bio_list &&
++				     !bio_list_empty(current->bio_list)),
+ 				    conf->resync_lock,
+-				    );
++			);
+ 		conf->nr_waiting--;
+ 	}
+ 	conf->nr_pending++;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0069-md-fix-clearing-of-the-changed-flags-for-the-bad-blo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0069-md-fix-clearing-of-the-changed-flags-for-the-bad-blo.patch
new file mode 100644
index 0000000..9dda708
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0069-md-fix-clearing-of-the-changed-flags-for-the-bad-blo.patch
@@ -0,0 +1,55 @@
+From c1566b5f4f2d8cbc8badc75b774fa79d6c03477b Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Mon, 19 Mar 2012 12:46:41 +1100
+Subject: [PATCH 069/147] md: fix clearing of the 'changed' flags for the bad
+ blocks list.
+
+commit d0962936bff659d20522555b517582a2715fd23f upstream.
+
+In super_1_sync (the first hunk) we need to clear 'changed' before
+checking read_seqretry(), otherwise we might race with other code
+adding a bad block and so won't retry later.
+
+In md_update_sb (the second hunk), in the case where there is no
+metadata (neither persistent nor external), we treat any bad blocks as
+an error.  However we need to clear the 'changed' flag before calling
+md_ack_all_badblocks, else it won't do anything.
+
+This patch is suitable for -stable release 3.0 and later.
+
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/md.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/md/md.c b/drivers/md/md.c
+index 65d552a..6f37aa4 100644
+--- a/drivers/md/md.c
++++ b/drivers/md/md.c
+@@ -1801,13 +1801,13 @@ retry:
+ 						| BB_LEN(internal_bb));
+ 				*bbp++ = cpu_to_le64(store_bb);
+ 			}
++			bb->changed = 0;
+ 			if (read_seqretry(&bb->lock, seq))
+ 				goto retry;
+ 
+ 			bb->sector = (rdev->sb_start +
+ 				      (int)le32_to_cpu(sb->bblog_offset));
+ 			bb->size = le16_to_cpu(sb->bblog_size);
+-			bb->changed = 0;
+ 		}
+ 	}
+ 
+@@ -2362,6 +2362,7 @@ repeat:
+ 			clear_bit(MD_CHANGE_PENDING, &mddev->flags);
+ 			list_for_each_entry(rdev, &mddev->disks, same_set) {
+ 				if (rdev->badblocks.changed) {
++					rdev->badblocks.changed = 0;
+ 					md_ack_all_badblocks(&rdev->badblocks);
+ 					md_error(mddev, rdev);
+ 				}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0070-drm-i915-Only-clear-the-GPU-domains-upon-a-successfu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0070-drm-i915-Only-clear-the-GPU-domains-upon-a-successfu.patch
new file mode 100644
index 0000000..197506c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0070-drm-i915-Only-clear-the-GPU-domains-upon-a-successfu.patch
@@ -0,0 +1,64 @@
+From bee686c633c4875d2910e0559b7ce4bba5da1911 Mon Sep 17 00:00:00 2001
+From: Chris Wilson <chris@chris-wilson.co.uk>
+Date: Wed, 14 Dec 2011 13:57:23 +0100
+Subject: [PATCH 070/147] drm/i915: Only clear the GPU domains upon a
+ successful finish
+
+commit c501ae7f332cdaf42e31af30b72b4b66cbbb1604 upstream.
+
+By clearing the GPU read domains before waiting upon the buffer, we run
+the risk of the wait being interrupted and the domains prematurely
+cleared. The next time we attempt to wait upon the buffer (after
+userspace handles the signal), we believe that the buffer is idle and so
+skip the wait.
+
+There are a number of bugs across all generations which show signs of an
+overly haste reuse of active buffers.
+
+Such as:
+
+  https://bugs.freedesktop.org/show_bug.cgi?id=29046
+  https://bugs.freedesktop.org/show_bug.cgi?id=35863
+  https://bugs.freedesktop.org/show_bug.cgi?id=38952
+  https://bugs.freedesktop.org/show_bug.cgi?id=40282
+  https://bugs.freedesktop.org/show_bug.cgi?id=41098
+  https://bugs.freedesktop.org/show_bug.cgi?id=41102
+  https://bugs.freedesktop.org/show_bug.cgi?id=41284
+  https://bugs.freedesktop.org/show_bug.cgi?id=42141
+
+A couple of those pre-date i915_gem_object_finish_gpu(), so may be
+unrelated (such as a wild write from a userspace command buffer), but
+this does look like a convincing cause for most of those bugs.
+
+Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
+Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Reviewed-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_gem.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
+index 8359dc7..3e7c478 100644
+--- a/drivers/gpu/drm/i915/i915_gem.c
++++ b/drivers/gpu/drm/i915/i915_gem.c
+@@ -3084,10 +3084,13 @@ i915_gem_object_finish_gpu(struct drm_i915_gem_object *obj)
+ 			return ret;
+ 	}
+ 
++	ret = i915_gem_object_wait_rendering(obj);
++	if (ret)
++		return ret;
++
+ 	/* Ensure that we invalidate the GPU's caches and TLBs. */
+ 	obj->base.read_domains &= ~I915_GEM_GPU_DOMAINS;
+-
+-	return i915_gem_object_wait_rendering(obj);
++	return 0;
+ }
+ 
+ /**
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0071-drm-radeon-Restrict-offset-for-legacy-hardware-curso.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0071-drm-radeon-Restrict-offset-for-legacy-hardware-curso.patch
new file mode 100644
index 0000000..e9041aa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0071-drm-radeon-Restrict-offset-for-legacy-hardware-curso.patch
@@ -0,0 +1,131 @@
+From 37e7d6645532f78e279da5f5257faf0ee0c0f8f3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>
+Date: Wed, 14 Mar 2012 17:12:41 +0100
+Subject: [PATCH 071/147] drm/radeon: Restrict offset for legacy hardware
+ cursor.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit c4353016dac10133fa5d8535af83f0c4845a2915 upstream.
+
+The hardware only takes 27 bits for the offset, so larger offsets are
+truncated, and the hardware cursor shows random bits other than the intended
+ones.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=46796
+
+Signed-off-by: Michel Dänzer <michel.daenzer@amd.com>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+---
+ drivers/gpu/drm/radeon/radeon_cursor.c |   13 +++++++++++--
+ drivers/gpu/drm/radeon/radeon_object.c |   18 +++++++++++++++++-
+ drivers/gpu/drm/radeon/radeon_object.h |    2 ++
+ 3 files changed, 30 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
+index fde25c0..986d608 100644
+--- a/drivers/gpu/drm/radeon/radeon_cursor.c
++++ b/drivers/gpu/drm/radeon/radeon_cursor.c
+@@ -151,7 +151,9 @@ int radeon_crtc_cursor_set(struct drm_crtc *crtc,
+ 			   uint32_t height)
+ {
+ 	struct radeon_crtc *radeon_crtc = to_radeon_crtc(crtc);
++	struct radeon_device *rdev = crtc->dev->dev_private;
+ 	struct drm_gem_object *obj;
++	struct radeon_bo *robj;
+ 	uint64_t gpu_addr;
+ 	int ret;
+ 
+@@ -173,7 +175,15 @@ int radeon_crtc_cursor_set(struct drm_crtc *crtc,
+ 		return -ENOENT;
+ 	}
+ 
+-	ret = radeon_gem_object_pin(obj, RADEON_GEM_DOMAIN_VRAM, &gpu_addr);
++	robj = gem_to_radeon_bo(obj);
++	ret = radeon_bo_reserve(robj, false);
++	if (unlikely(ret != 0))
++		goto fail;
++	/* Only 27 bit offset for legacy cursor */
++	ret = radeon_bo_pin_restricted(robj, RADEON_GEM_DOMAIN_VRAM,
++				       ASIC_IS_AVIVO(rdev) ? 0 : 1 << 27,
++				       &gpu_addr);
++	radeon_bo_unreserve(robj);
+ 	if (ret)
+ 		goto fail;
+ 
+@@ -181,7 +191,6 @@ int radeon_crtc_cursor_set(struct drm_crtc *crtc,
+ 	radeon_crtc->cursor_height = height;
+ 
+ 	radeon_lock_cursor(crtc, true);
+-	/* XXX only 27 bit offset for legacy cursor */
+ 	radeon_set_cursor(crtc, obj, gpu_addr);
+ 	radeon_show_cursor(crtc);
+ 	radeon_lock_cursor(crtc, false);
+diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
+index 1c85152..f3ae607 100644
+--- a/drivers/gpu/drm/radeon/radeon_object.c
++++ b/drivers/gpu/drm/radeon/radeon_object.c
+@@ -204,7 +204,8 @@ void radeon_bo_unref(struct radeon_bo **bo)
+ 		*bo = NULL;
+ }
+ 
+-int radeon_bo_pin(struct radeon_bo *bo, u32 domain, u64 *gpu_addr)
++int radeon_bo_pin_restricted(struct radeon_bo *bo, u32 domain, u64 max_offset,
++			     u64 *gpu_addr)
+ {
+ 	int r, i;
+ 
+@@ -212,6 +213,7 @@ int radeon_bo_pin(struct radeon_bo *bo, u32 domain, u64 *gpu_addr)
+ 		bo->pin_count++;
+ 		if (gpu_addr)
+ 			*gpu_addr = radeon_bo_gpu_offset(bo);
++		WARN_ON_ONCE(max_offset != 0);
+ 		return 0;
+ 	}
+ 	radeon_ttm_placement_from_domain(bo, domain);
+@@ -219,6 +221,15 @@ int radeon_bo_pin(struct radeon_bo *bo, u32 domain, u64 *gpu_addr)
+ 		/* force to pin into visible video ram */
+ 		bo->placement.lpfn = bo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
+ 	}
++	if (max_offset) {
++		u64 lpfn = max_offset >> PAGE_SHIFT;
++
++		if (!bo->placement.lpfn)
++			bo->placement.lpfn = bo->rdev->mc.gtt_size >> PAGE_SHIFT;
++
++		if (lpfn < bo->placement.lpfn)
++			bo->placement.lpfn = lpfn;
++	}
+ 	for (i = 0; i < bo->placement.num_placement; i++)
+ 		bo->placements[i] |= TTM_PL_FLAG_NO_EVICT;
+ 	r = ttm_bo_validate(&bo->tbo, &bo->placement, false, false, false);
+@@ -232,6 +243,11 @@ int radeon_bo_pin(struct radeon_bo *bo, u32 domain, u64 *gpu_addr)
+ 	return r;
+ }
+ 
++int radeon_bo_pin(struct radeon_bo *bo, u32 domain, u64 *gpu_addr)
++{
++	return radeon_bo_pin_restricted(bo, domain, 0, gpu_addr);
++}
++
+ int radeon_bo_unpin(struct radeon_bo *bo)
+ {
+ 	int r, i;
+diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
+index b07f0f9..fb3f433 100644
+--- a/drivers/gpu/drm/radeon/radeon_object.h
++++ b/drivers/gpu/drm/radeon/radeon_object.h
+@@ -108,6 +108,8 @@ extern int radeon_bo_kmap(struct radeon_bo *bo, void **ptr);
+ extern void radeon_bo_kunmap(struct radeon_bo *bo);
+ extern void radeon_bo_unref(struct radeon_bo **bo);
+ extern int radeon_bo_pin(struct radeon_bo *bo, u32 domain, u64 *gpu_addr);
++extern int radeon_bo_pin_restricted(struct radeon_bo *bo, u32 domain,
++				    u64 max_offset, u64 *gpu_addr);
+ extern int radeon_bo_unpin(struct radeon_bo *bo);
+ extern int radeon_bo_evict_vram(struct radeon_device *rdev);
+ extern void radeon_bo_force_delete(struct radeon_device *rdev);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0072-drm-radeon-kms-fix-analog-load-detection-on-DVI-I-co.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0072-drm-radeon-kms-fix-analog-load-detection-on-DVI-I-co.patch
new file mode 100644
index 0000000..db377d3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0072-drm-radeon-kms-fix-analog-load-detection-on-DVI-I-co.patch
@@ -0,0 +1,40 @@
+From de31bb0d8975b5a6b55c0c0fb10fb7f84ca15c5d Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Fri, 16 Mar 2012 12:22:09 -0400
+Subject: [PATCH 072/147] drm/radeon/kms: fix analog load detection on DVI-I
+ connectors
+
+commit e00e8b5e760cbbe9067daeae5454d67c44c8d035 upstream.
+
+We digital encoders have a detect function as well (for
+DP to VGA bridges), so we make sure we choose the analog
+one here.
+
+Fixes:
+https://bugs.freedesktop.org/show_bug.cgi?id=47007
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_connectors.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
+index e7cb3ab..f7d39ac 100644
+--- a/drivers/gpu/drm/radeon/radeon_connectors.c
++++ b/drivers/gpu/drm/radeon/radeon_connectors.c
+@@ -946,6 +946,10 @@ radeon_dvi_detect(struct drm_connector *connector, bool force)
+ 
+ 			encoder = obj_to_encoder(obj);
+ 
++			if (encoder->encoder_type != DRM_MODE_ENCODER_DAC ||
++			    encoder->encoder_type != DRM_MODE_ENCODER_TVDAC)
++				continue;
++
+ 			encoder_funcs = encoder->helper_private;
+ 			if (encoder_funcs->detect) {
+ 				if (ret != connector_status_connected) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0073-drm-radeon-kms-add-connector-quirk-for-Fujitsu-D3003.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0073-drm-radeon-kms-add-connector-quirk-for-Fujitsu-D3003.patch
new file mode 100644
index 0000000..a48a485
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0073-drm-radeon-kms-add-connector-quirk-for-Fujitsu-D3003.patch
@@ -0,0 +1,48 @@
+From 5efedf1eea47c18e516e55bbfb417e447e76fc0d Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Fri, 16 Mar 2012 12:22:10 -0400
+Subject: [PATCH 073/147] drm/radeon/kms: add connector quirk for Fujitsu
+ D3003-S2 board
+
+commit 4c1b2d2da3451f5c8dd59bd7e05bd9729d2aee05 upstream.
+
+vbios lists DVI-I port as VGA and DVI-D.
+
+Fixes:
+https://bugs.freedesktop.org/show_bug.cgi?id=47007
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_atombios.c |   14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_atombios.c b/drivers/gpu/drm/radeon/radeon_atombios.c
+index 5082d17..8e1532f 100644
+--- a/drivers/gpu/drm/radeon/radeon_atombios.c
++++ b/drivers/gpu/drm/radeon/radeon_atombios.c
+@@ -442,6 +442,20 @@ static bool radeon_atom_apply_quirks(struct drm_device *dev,
+ 		struct radeon_device *rdev = dev->dev_private;
+ 		*i2c_bus = radeon_lookup_i2c_gpio(rdev, 0x93);
+ 	}
++
++	/* Fujitsu D3003-S2 board lists DVI-I as DVI-D and VGA */
++	if ((dev->pdev->device == 0x9802) &&
++	    (dev->pdev->subsystem_vendor == 0x1734) &&
++	    (dev->pdev->subsystem_device == 0x11bd)) {
++		if (*connector_type == DRM_MODE_CONNECTOR_VGA) {
++			*connector_type = DRM_MODE_CONNECTOR_DVII;
++			*line_mux = 0x3103;
++		} else if (*connector_type == DRM_MODE_CONNECTOR_DVID) {
++			*connector_type = DRM_MODE_CONNECTOR_DVII;
++		}
++	}
++
++
+ 	return true;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0074-target-Don-t-set-WBUS16-or-SYNC-bits-in-INQUIRY-resp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0074-target-Don-t-set-WBUS16-or-SYNC-bits-in-INQUIRY-resp.patch
new file mode 100644
index 0000000..c1eac73
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0074-target-Don-t-set-WBUS16-or-SYNC-bits-in-INQUIRY-resp.patch
@@ -0,0 +1,41 @@
+From 7f95ff0ee05801dd087ec704be16aae6383f0076 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 13 Feb 2012 16:18:16 -0800
+Subject: [PATCH 074/147] target: Don't set WBUS16 or SYNC bits in INQUIRY
+ response
+
+commit effc6cc8828257c32c37635e737f14fd6e19ecd7 upstream.
+
+SPC-4 says about the WBUS16 and SYNC bits:
+
+    The meanings of these fields are specific to SPI-5 (see 6.4.3).
+    For SCSI transport protocols other than the SCSI Parallel
+    Interface, these fields are reserved.
+
+We don't have a SPI fabric module, so we should never set these bits.
+(The comment was misleading, since it only mentioned Sync but the
+actual code set WBUS16 too).
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_cdb.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 8facd33..65ea65a 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -116,7 +116,7 @@ target_emulate_inquiry_std(struct se_cmd *cmd)
+ 		goto out;
+ 	}
+ 
+-	buf[7] = 0x32; /* Sync=1 and CmdQue=1 */
++	buf[7] = 0x2; /* CmdQue=1 */
+ 
+ 	/*
+ 	 * Do not include vendor, product, reversion info in INQUIRY
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0075-target-fix-use-after-free-in-target_report_luns.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0075-target-fix-use-after-free-in-target_report_luns.patch
new file mode 100644
index 0000000..af27825
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0075-target-fix-use-after-free-in-target_report_luns.patch
@@ -0,0 +1,37 @@
+From 679e28aac79ff6dc71e84679bcd97e5246697ccf Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>
+Date: Wed, 15 Feb 2012 16:51:32 -0500
+Subject: [PATCH 075/147] target: fix use after free in target_report_luns
+
+commit 382436f8804fe1cb20b9a2a811a10eb2d8554721 upstream.
+
+Fix possible NULL pointer dereference in target_report_luns failure path.
+
+Signed-off-by: Joern Engel <joern@logfs.org>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_device.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
+index 19f8aca..097178b 100644
+--- a/drivers/target/target_core_device.c
++++ b/drivers/target/target_core_device.c
+@@ -696,12 +696,12 @@ int target_report_luns(struct se_task *se_task)
+ 	 * See SPC3 r07, page 159.
+ 	 */
+ done:
+-	transport_kunmap_data_sg(se_cmd);
+ 	lun_count *= 8;
+ 	buf[0] = ((lun_count >> 24) & 0xff);
+ 	buf[1] = ((lun_count >> 16) & 0xff);
+ 	buf[2] = ((lun_count >> 8) & 0xff);
+ 	buf[3] = (lun_count & 0xff);
++	transport_kunmap_data_sg(se_cmd);
+ 
+ 	se_task->task_scsi_status = GOOD;
+ 	transport_complete_task(se_task, 1);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0076-target-prevent-NULL-pointer-dereference-in-target_re.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0076-target-prevent-NULL-pointer-dereference-in-target_re.patch
new file mode 100644
index 0000000..1899a81
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0076-target-prevent-NULL-pointer-dereference-in-target_re.patch
@@ -0,0 +1,37 @@
+From 238ac5c459c0204f5134a324f95588aed557b41c Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=B6rn=20Engel?= <joern@logfs.org>
+Date: Wed, 15 Feb 2012 16:52:11 -0500
+Subject: [PATCH 076/147] target: prevent NULL pointer dereference in
+ target_report_luns
+
+commit 47f1b8803e1e358ebbf4f82bfdb98971c912a2c3 upstream.
+
+transport_kmap_data_sg can return NULL.  I never saw this trigger, but
+returning -ENOMEM seems better than a crash.  Also removes a pointless
+case while at it.
+
+Signed-off-by: Joern Engel <joern@logfs.org>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_device.c |    4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
+index 097178b..f8773ae 100644
+--- a/drivers/target/target_core_device.c
++++ b/drivers/target/target_core_device.c
+@@ -658,7 +658,9 @@ int target_report_luns(struct se_task *se_task)
+ 	unsigned char *buf;
+ 	u32 cdb_offset = 0, lun_count = 0, offset = 8, i;
+ 
+-	buf = (unsigned char *) transport_kmap_data_sg(se_cmd);
++	buf = transport_kmap_data_sg(se_cmd);
++	if (!buf)
++		return -ENOMEM;
+ 
+ 	/*
+ 	 * If no struct se_session pointer is present, this struct se_cmd is
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0077-target-Fix-16-bit-target-ports-for-SET-TARGET-PORT-G.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0077-target-Fix-16-bit-target-ports-for-SET-TARGET-PORT-G.patch
new file mode 100644
index 0000000..ec49efc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0077-target-Fix-16-bit-target-ports-for-SET-TARGET-PORT-G.patch
@@ -0,0 +1,54 @@
+From 407e1b9350ad2124952f769ade034023a9155c71 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Thu, 23 Feb 2012 17:22:12 -0800
+Subject: [PATCH 077/147] target: Fix 16-bit target ports for SET TARGET PORT
+ GROUPS emulation
+
+commit 33395fb8a13731c7ef7b175dbf5a4d8a6738fe6c upstream.
+
+The old code did (MSB << 8) & 0xff, which always evaluates to 0.  Just use
+get_unaligned_be16() so we don't have to worry about whether our open-coded
+version is correct or not.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_alua.c |    7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
+index 1d24512..5b05744 100644
+--- a/drivers/target/target_core_alua.c
++++ b/drivers/target/target_core_alua.c
+@@ -30,6 +30,7 @@
+ #include <linux/export.h>
+ #include <scsi/scsi.h>
+ #include <scsi/scsi_cmnd.h>
++#include <asm/unaligned.h>
+ 
+ #include <target/target_core_base.h>
+ #include <target/target_core_device.h>
+@@ -268,8 +269,7 @@ int target_emulate_set_target_port_groups(struct se_task *task)
+ 		 * changed.
+ 		 */
+ 		if (primary) {
+-			tg_pt_id = ((ptr[2] << 8) & 0xff);
+-			tg_pt_id |= (ptr[3] & 0xff);
++			tg_pt_id = get_unaligned_be16(ptr + 2);
+ 			/*
+ 			 * Locate the matching target port group ID from
+ 			 * the global tg_pt_gp list
+@@ -313,8 +313,7 @@ int target_emulate_set_target_port_groups(struct se_task *task)
+ 			 * the Target Port in question for the the incoming
+ 			 * SET_TARGET_PORT_GROUPS op.
+ 			 */
+-			rtpi = ((ptr[2] << 8) & 0xff);
+-			rtpi |= (ptr[3] & 0xff);
++			rtpi = get_unaligned_be16(ptr + 2);
+ 			/*
+ 			 * Locate the matching relative target port identifer
+ 			 * for the struct se_device storage object.
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0078-Bluetooth-Add-AR30XX-device-ID-on-Asus-laptops.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0078-Bluetooth-Add-AR30XX-device-ID-on-Asus-laptops.patch
new file mode 100644
index 0000000..b0094d1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0078-Bluetooth-Add-AR30XX-device-ID-on-Asus-laptops.patch
@@ -0,0 +1,67 @@
+From d559faa856c1c6f84dc400b9e77af843d3b79c10 Mon Sep 17 00:00:00 2001
+From: Keng-Yu Lin <kengyu@canonical.com>
+Date: Wed, 30 Nov 2011 18:32:37 +0800
+Subject: [PATCH 078/147] Bluetooth: Add AR30XX device ID on Asus laptops
+
+commit 6b6ba88b5bb8779156b21bb957520a448c3642e2 upstream.
+
+The ID is found on Asus K54HR and K53U.
+Blacklist the AR3011-based device ID [0489:e03d]
+and add to ath3k.c for firmware loading.
+
+Below is the output of usb-devices script:
+
+Before the fiwmware loading:
+
+T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  3 Spd=12  MxCh= 0
+D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
+P:  Vendor=0489 ProdID=e03d Rev=00.01
+C:  #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
+I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+
+After the fiwmware loading:
+
+T:  Bus=01 Lev=02 Prnt=02 Port=00 Cnt=01 Dev#=  5 Spd=12  MxCh= 0
+D:  Ver= 1.10 Cls=e0(wlcon) Sub=01 Prot=01 MxPS=64 #Cfgs=  1
+P:  Vendor=0cf3 ProdID=3005 Rev=00.01
+C:  #Ifs= 2 Cfg#= 1 Atr=e0 MxPwr=100mA
+I:  If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+I:  If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
+
+Signed-off-by: Keng-Yu Lin <kengyu@canonical.com>
+Signed-off-by: Gustavo F. Padovan <padovan@profusion.mobi>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/ath3k.c |    1 +
+ drivers/bluetooth/btusb.c |    1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/drivers/bluetooth/ath3k.c b/drivers/bluetooth/ath3k.c
+index 106beb1..db811d2 100644
+--- a/drivers/bluetooth/ath3k.c
++++ b/drivers/bluetooth/ath3k.c
+@@ -64,6 +64,7 @@ static struct usb_device_id ath3k_table[] = {
+ 	{ USB_DEVICE(0x0CF3, 0x3002) },
+ 	{ USB_DEVICE(0x13d3, 0x3304) },
+ 	{ USB_DEVICE(0x0930, 0x0215) },
++	{ USB_DEVICE(0x0489, 0xE03D) },
+ 
+ 	/* Atheros AR9285 Malbec with sflash firmware */
+ 	{ USB_DEVICE(0x03F0, 0x311D) },
+diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
+index eabc437..11a925c 100644
+--- a/drivers/bluetooth/btusb.c
++++ b/drivers/bluetooth/btusb.c
+@@ -119,6 +119,7 @@ static struct usb_device_id blacklist_table[] = {
+ 	{ USB_DEVICE(0x0cf3, 0x3002), .driver_info = BTUSB_IGNORE },
+ 	{ USB_DEVICE(0x13d3, 0x3304), .driver_info = BTUSB_IGNORE },
+ 	{ USB_DEVICE(0x0930, 0x0215), .driver_info = BTUSB_IGNORE },
++	{ USB_DEVICE(0x0489, 0xe03d), .driver_info = BTUSB_IGNORE },
+ 
+ 	/* Atheros AR9285 Malbec with sflash firmware */
+ 	{ USB_DEVICE(0x03f0, 0x311d), .driver_info = BTUSB_IGNORE },
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0079-HID-add-extra-hotkeys-in-Asus-AIO-keyboards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0079-HID-add-extra-hotkeys-in-Asus-AIO-keyboards.patch
new file mode 100644
index 0000000..47434eb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0079-HID-add-extra-hotkeys-in-Asus-AIO-keyboards.patch
@@ -0,0 +1,71 @@
+From 5c473125260020cedb5e4285eea74fc4528eee85 Mon Sep 17 00:00:00 2001
+From: Keng-Yu Lin <kengyu@canonical.com>
+Date: Thu, 2 Feb 2012 10:31:26 +0100
+Subject: [PATCH 079/147] HID: add extra hotkeys in Asus AIO keyboards
+
+commit 3596bb929f2abd3433c2eaa5755fad48ac207af1 upstream.
+
+The Asus All-In-One PC has a wireless keyboard with wifi toggle,
+brightness up, brightness down and display off hotkeys.
+
+This patch adds suppoort for these hotkeys.
+
+Signed-off-by: Keng-Yu Lin <kengyu@canonical.com>
+Signed-off-by: Jiri Kosina <jkosina@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hid/hid-chicony.c |    5 +++++
+ drivers/hid/hid-core.c    |    1 +
+ drivers/hid/hid-ids.h     |    1 +
+ 3 files changed, 7 insertions(+)
+
+diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
+index 8965ad9..4162505 100644
+--- a/drivers/hid/hid-chicony.c
++++ b/drivers/hid/hid-chicony.c
+@@ -45,6 +45,10 @@ static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+ 	case 0xff09: ch_map_key_clear(BTN_9);	break;
+ 	case 0xff0a: ch_map_key_clear(BTN_A);	break;
+ 	case 0xff0b: ch_map_key_clear(BTN_B);	break;
++	case 0x00f1: ch_map_key_clear(KEY_WLAN);	break;
++	case 0x00f2: ch_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
++	case 0x00f3: ch_map_key_clear(KEY_BRIGHTNESSUP);	break;
++	case 0x00f4: ch_map_key_clear(KEY_DISPLAY_OFF);	break;
+ 	default:
+ 		return 0;
+ 	}
+@@ -53,6 +57,7 @@ static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+ 
+ static const struct hid_device_id ch_devices[] = {
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_TACTICAL_PAD) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
+ 	{ }
+ };
+ MODULE_DEVICE_TABLE(hid, ch_devices);
+diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
+index bb656d8..c27b402 100644
+--- a/drivers/hid/hid-core.c
++++ b/drivers/hid/hid-core.c
+@@ -1394,6 +1394,7 @@ static const struct hid_device_id hid_have_special_driver[] = {
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHERRY, USB_DEVICE_ID_CHERRY_CYMOTION_SOLAR) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_TACTICAL_PAD) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_CHICONY, USB_DEVICE_ID_CHICONY_WIRELESS2) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CHUNGHWAT, USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CREATIVELABS, USB_DEVICE_ID_PRODIKEYS_PCMIDI) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_CVTOUCH, USB_DEVICE_ID_CVTOUCH_SCREEN) },
+diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
+index 3c3daec..fba3fc4 100644
+--- a/drivers/hid/hid-ids.h
++++ b/drivers/hid/hid-ids.h
+@@ -192,6 +192,7 @@
+ #define USB_DEVICE_ID_CHICONY_TACTICAL_PAD	0x0418
+ #define USB_DEVICE_ID_CHICONY_MULTI_TOUCH	0xb19d
+ #define USB_DEVICE_ID_CHICONY_WIRELESS	0x0618
++#define USB_DEVICE_ID_CHICONY_WIRELESS2	0x1123
+ 
+ #define USB_VENDOR_ID_CHUNGHWAT		0x2247
+ #define USB_DEVICE_ID_CHUNGHWAT_MULTITOUCH	0x0001
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0080-HID-add-more-hotkeys-in-Asus-AIO-keyboards.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0080-HID-add-more-hotkeys-in-Asus-AIO-keyboards.patch
new file mode 100644
index 0000000..0543141
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0080-HID-add-more-hotkeys-in-Asus-AIO-keyboards.patch
@@ -0,0 +1,34 @@
+From 236648a7e4f6330831cb031c7c970b07db3cf39f Mon Sep 17 00:00:00 2001
+From: Keng-Yu Lin <kengyu@canonical.com>
+Date: Mon, 30 Jan 2012 14:25:45 +0800
+Subject: [PATCH 080/147] HID: add more hotkeys in Asus AIO keyboards
+
+commit 6c30d5a53229aad22bb675e0bd6eb518ecaa4316 upstream.
+
+Add support for the camera key. The hotkey for
+Asus S.H.E(Super Hybrid Engine) mode is mapped to KEY_KEY_PROG1
+just for notifying the userspace.
+
+Signed-off-by: Keng-Yu Lin <kengyu@canonical.com>
+Signed-off-by: Jiri Kosina <jkosina@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hid/hid-chicony.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/hid/hid-chicony.c b/drivers/hid/hid-chicony.c
+index 4162505..b99af34 100644
+--- a/drivers/hid/hid-chicony.c
++++ b/drivers/hid/hid-chicony.c
+@@ -49,6 +49,8 @@ static int ch_input_mapping(struct hid_device *hdev, struct hid_input *hi,
+ 	case 0x00f2: ch_map_key_clear(KEY_BRIGHTNESSDOWN);	break;
+ 	case 0x00f3: ch_map_key_clear(KEY_BRIGHTNESSUP);	break;
+ 	case 0x00f4: ch_map_key_clear(KEY_DISPLAY_OFF);	break;
++	case 0x00f7: ch_map_key_clear(KEY_CAMERA);	break;
++	case 0x00f8: ch_map_key_clear(KEY_PROG1);	break;
+ 	default:
+ 		return 0;
+ 	}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0081-pata_legacy-correctly-mask-recovery-field-for-HT6560.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0081-pata_legacy-correctly-mask-recovery-field-for-HT6560.patch
new file mode 100644
index 0000000..daf2cc7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0081-pata_legacy-correctly-mask-recovery-field-for-HT6560.patch
@@ -0,0 +1,36 @@
+From 9d312025d223d521d0f5a46ab994323646114050 Mon Sep 17 00:00:00 2001
+From: Sergei Shtylyov <sshtylyov@ru.mvista.com>
+Date: Thu, 19 Jan 2012 19:09:56 +0300
+Subject: [PATCH 081/147] pata_legacy: correctly mask recovery field for
+ HT6560B
+
+commit 9716387311c790de381214c03e7f1b72b91a8189 upstream.
+
+According to the HT6560H datasheet, the recovery timing field is 4-bit wide,
+with a value of 0 meaning 16 cycles. Correct obvious thinko in the recovery
+field mask.
+
+Signed-off-by: Sergei Shtylyov <sshtylyov@ru.mvista.com>
+Signed-off-by: Jeff Garzik <jgarzik@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/ata/pata_legacy.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/drivers/ata/pata_legacy.c b/drivers/ata/pata_legacy.c
+index 35aca7d..4fe9d21 100644
+--- a/drivers/ata/pata_legacy.c
++++ b/drivers/ata/pata_legacy.c
+@@ -401,8 +401,7 @@ static void ht6560b_set_piomode(struct ata_port *ap, struct ata_device *adev)
+ 	ata_timing_compute(adev, adev->pio_mode, &t, 20000, 1000);
+ 
+ 	active = clamp_val(t.active, 2, 15);
+-	recover = clamp_val(t.recover, 2, 16);
+-	recover &= 0x15;
++	recover = clamp_val(t.recover, 2, 16) & 0x0F;
+ 
+ 	inb(0x3E6);
+ 	inb(0x3E6);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0082-firewire-ohci-fix-too-early-completion-of-IR-multich.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0082-firewire-ohci-fix-too-early-completion-of-IR-multich.patch
new file mode 100644
index 0000000..0eefc06
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0082-firewire-ohci-fix-too-early-completion-of-IR-multich.patch
@@ -0,0 +1,55 @@
+From d98908a17ece4ec33e477158112adc527c365b83 Mon Sep 17 00:00:00 2001
+From: Clemens Ladisch <clemens@ladisch.de>
+Date: Mon, 12 Mar 2012 21:45:47 +0100
+Subject: [PATCH 082/147] firewire: ohci: fix too-early completion of IR
+ multichannel buffers
+
+commit 0c0efbacab8d70700d13301e0ae7975783c0cb0a upstream.
+
+handle_ir_buffer_fill() assumed that a completed descriptor would be
+indicated by a non-zero transfer_status (as in most other descriptors).
+However, this field is written by the controller as soon as (the end of)
+the first packet has been written into the buffer.  As a consequence, if
+we happen to run into such a descriptor when the interrupt handler is
+executed after such a packet has completed, the descriptor would be
+taken out of the list of active descriptors as soon as the buffer had
+been partially filled, so the event for the buffer being completely
+filled would never be sent.
+
+To fix this, handle descriptors only when they have been completely
+filled, i.e., when res_count == 0.  (This also matches the condition
+that is reported by the controller with an interrupt.)
+
+Signed-off-by: Clemens Ladisch <clemens@ladisch.de>
+Signed-off-by: Stefan Richter <stefanr@s5r6.in-berlin.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/firewire/ohci.c |    5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
+index 7f5f0da..0a0225a 100644
+--- a/drivers/firewire/ohci.c
++++ b/drivers/firewire/ohci.c
+@@ -2748,7 +2748,7 @@ static int handle_ir_buffer_fill(struct context *context,
+ 		container_of(context, struct iso_context, context);
+ 	u32 buffer_dma;
+ 
+-	if (!last->transfer_status)
++	if (last->res_count != 0)
+ 		/* Descriptor(s) not done yet, stop iteration */
+ 		return 0;
+ 
+@@ -2762,8 +2762,7 @@ static int handle_ir_buffer_fill(struct context *context,
+ 	if (le16_to_cpu(last->control) & DESCRIPTOR_IRQ_ALWAYS)
+ 		ctx->base.callback.mc(&ctx->base,
+ 				      le32_to_cpu(last->data_address) +
+-				      le16_to_cpu(last->req_count) -
+-				      le16_to_cpu(last->res_count),
++				      le16_to_cpu(last->req_count),
+ 				      ctx->base.callback_data);
+ 
+ 	return 1;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0083-KVM-x86-extend-struct-x86_emulate_ops-with-get_cpuid.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0083-KVM-x86-extend-struct-x86_emulate_ops-with-get_cpuid.patch
new file mode 100644
index 0000000..8e4c572
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0083-KVM-x86-extend-struct-x86_emulate_ops-with-get_cpuid.patch
@@ -0,0 +1,82 @@
+From d76b5f6c352194eaec8afbe8397b43f1ee4130d0 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stephan=20B=C3=A4rwolf?= <stephan.baerwolf@tu-ilmenau.de>
+Date: Thu, 12 Jan 2012 16:43:03 +0100
+Subject: [PATCH 083/147] KVM: x86: extend "struct x86_emulate_ops" with
+ "get_cpuid"
+
+commit bdb42f5afebe208eae90406959383856ae2caf2b upstream.
+
+In order to be able to proceed checks on CPU-specific properties
+within the emulator, function "get_cpuid" is introduced.
+With "get_cpuid" it is possible to virtually call the guests
+"cpuid"-opcode without changing the VM's context.
+
+[mtosatti: cleanup/beautify code]
+
+Signed-off-by: Stephan Baerwolf <stephan.baerwolf@tu-ilmenau.de>
+Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/kvm_emulate.h |    3 +++
+ arch/x86/kvm/x86.c                 |   23 +++++++++++++++++++++++
+ 2 files changed, 26 insertions(+)
+
+diff --git a/arch/x86/include/asm/kvm_emulate.h b/arch/x86/include/asm/kvm_emulate.h
+index a026507..a440a7f 100644
+--- a/arch/x86/include/asm/kvm_emulate.h
++++ b/arch/x86/include/asm/kvm_emulate.h
+@@ -189,6 +189,9 @@ struct x86_emulate_ops {
+ 	int (*intercept)(struct x86_emulate_ctxt *ctxt,
+ 			 struct x86_instruction_info *info,
+ 			 enum x86_intercept_stage stage);
++
++	bool (*get_cpuid)(struct x86_emulate_ctxt *ctxt,
++			 u32 *eax, u32 *ebx, u32 *ecx, u32 *edx);
+ };
+ 
+ typedef u32 __attribute__((vector_size(16))) sse128_t;
+diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
+index 4c938da..e04cae1 100644
+--- a/arch/x86/kvm/x86.c
++++ b/arch/x86/kvm/x86.c
+@@ -4655,6 +4655,28 @@ static int emulator_intercept(struct x86_emulate_ctxt *ctxt,
+ 	return kvm_x86_ops->check_intercept(emul_to_vcpu(ctxt), info, stage);
+ }
+ 
++static bool emulator_get_cpuid(struct x86_emulate_ctxt *ctxt,
++			       u32 *eax, u32 *ebx, u32 *ecx, u32 *edx)
++{
++	struct kvm_cpuid_entry2 *cpuid = NULL;
++
++	if (eax && ecx)
++		cpuid = kvm_find_cpuid_entry(emul_to_vcpu(ctxt),
++					    *eax, *ecx);
++
++	if (cpuid) {
++		*eax = cpuid->eax;
++		*ecx = cpuid->ecx;
++		if (ebx)
++			*ebx = cpuid->ebx;
++		if (edx)
++			*edx = cpuid->edx;
++		return true;
++	}
++
++	return false;
++}
++
+ static struct x86_emulate_ops emulate_ops = {
+ 	.read_std            = kvm_read_guest_virt_system,
+ 	.write_std           = kvm_write_guest_virt_system,
+@@ -4685,6 +4707,7 @@ static struct x86_emulate_ops emulate_ops = {
+ 	.get_fpu             = emulator_get_fpu,
+ 	.put_fpu             = emulator_put_fpu,
+ 	.intercept           = emulator_intercept,
++	.get_cpuid           = emulator_get_cpuid,
+ };
+ 
+ static void cache_all_regs(struct kvm_vcpu *vcpu)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0084-KVM-x86-fix-missing-checks-in-syscall-emulation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0084-KVM-x86-fix-missing-checks-in-syscall-emulation.patch
new file mode 100644
index 0000000..bc72a83
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0084-KVM-x86-fix-missing-checks-in-syscall-emulation.patch
@@ -0,0 +1,148 @@
+From 9dab57c31c4146a8d1118a8c833fb8a3e788fec6 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Stephan=20B=C3=A4rwolf?= <stephan.baerwolf@tu-ilmenau.de>
+Date: Thu, 12 Jan 2012 16:43:04 +0100
+Subject: [PATCH 084/147] KVM: x86: fix missing checks in syscall emulation
+
+commit c2226fc9e87ba3da060e47333657cd6616652b84 upstream.
+
+On hosts without this patch, 32bit guests will crash (and 64bit guests
+may behave in a wrong way) for example by simply executing following
+nasm-demo-application:
+
+    [bits 32]
+    global _start
+    SECTION .text
+    _start: syscall
+
+(I tested it with winxp and linux - both always crashed)
+
+    Disassembly of section .text:
+
+    00000000 <_start>:
+       0:   0f 05                   syscall
+
+The reason seems a missing "invalid opcode"-trap (int6) for the
+syscall opcode "0f05", which is not available on Intel CPUs
+within non-longmodes, as also on some AMD CPUs within legacy-mode.
+(depending on CPU vendor, MSR_EFER and cpuid)
+
+Because previous mentioned OSs may not engage corresponding
+syscall target-registers (STAR, LSTAR, CSTAR), they remain
+NULL and (non trapping) syscalls are leading to multiple
+faults and finally crashs.
+
+Depending on the architecture (AMD or Intel) pretended by
+guests, various checks according to vendor's documentation
+are implemented to overcome the current issue and behave
+like the CPUs physical counterparts.
+
+[mtosatti: cleanup/beautify code]
+
+Signed-off-by: Stephan Baerwolf <stephan.baerwolf@tu-ilmenau.de>
+Signed-off-by: Marcelo Tosatti <mtosatti@redhat.com>
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/kvm_emulate.h |   13 +++++++++
+ arch/x86/kvm/emulate.c             |   51 ++++++++++++++++++++++++++++++++++++
+ 2 files changed, 64 insertions(+)
+
+diff --git a/arch/x86/include/asm/kvm_emulate.h b/arch/x86/include/asm/kvm_emulate.h
+index a440a7f..70ea6fd 100644
+--- a/arch/x86/include/asm/kvm_emulate.h
++++ b/arch/x86/include/asm/kvm_emulate.h
+@@ -300,6 +300,19 @@ struct x86_emulate_ctxt {
+ #define X86EMUL_MODE_PROT     (X86EMUL_MODE_PROT16|X86EMUL_MODE_PROT32| \
+ 			       X86EMUL_MODE_PROT64)
+ 
++/* CPUID vendors */
++#define X86EMUL_CPUID_VENDOR_AuthenticAMD_ebx 0x68747541
++#define X86EMUL_CPUID_VENDOR_AuthenticAMD_ecx 0x444d4163
++#define X86EMUL_CPUID_VENDOR_AuthenticAMD_edx 0x69746e65
++
++#define X86EMUL_CPUID_VENDOR_AMDisbetterI_ebx 0x69444d41
++#define X86EMUL_CPUID_VENDOR_AMDisbetterI_ecx 0x21726574
++#define X86EMUL_CPUID_VENDOR_AMDisbetterI_edx 0x74656273
++
++#define X86EMUL_CPUID_VENDOR_GenuineIntel_ebx 0x756e6547
++#define X86EMUL_CPUID_VENDOR_GenuineIntel_ecx 0x6c65746e
++#define X86EMUL_CPUID_VENDOR_GenuineIntel_edx 0x49656e69
++
+ enum x86_intercept_stage {
+ 	X86_ICTP_NONE = 0,   /* Allow zero-init to not match anything */
+ 	X86_ICPT_PRE_EXCEPT,
+diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
+index f1e3be18..f5302da 100644
+--- a/arch/x86/kvm/emulate.c
++++ b/arch/x86/kvm/emulate.c
+@@ -1877,6 +1877,51 @@ setup_syscalls_segments(struct x86_emulate_ctxt *ctxt,
+ 	ss->p = 1;
+ }
+ 
++static bool em_syscall_is_enabled(struct x86_emulate_ctxt *ctxt)
++{
++	struct x86_emulate_ops *ops = ctxt->ops;
++	u32 eax, ebx, ecx, edx;
++
++	/*
++	 * syscall should always be enabled in longmode - so only become
++	 * vendor specific (cpuid) if other modes are active...
++	 */
++	if (ctxt->mode == X86EMUL_MODE_PROT64)
++		return true;
++
++	eax = 0x00000000;
++	ecx = 0x00000000;
++	if (ops->get_cpuid(ctxt, &eax, &ebx, &ecx, &edx)) {
++		/*
++		 * Intel ("GenuineIntel")
++		 * remark: Intel CPUs only support "syscall" in 64bit
++		 * longmode. Also an 64bit guest with a
++		 * 32bit compat-app running will #UD !! While this
++		 * behaviour can be fixed (by emulating) into AMD
++		 * response - CPUs of AMD can't behave like Intel.
++		 */
++		if (ebx == X86EMUL_CPUID_VENDOR_GenuineIntel_ebx &&
++		    ecx == X86EMUL_CPUID_VENDOR_GenuineIntel_ecx &&
++		    edx == X86EMUL_CPUID_VENDOR_GenuineIntel_edx)
++			return false;
++
++		/* AMD ("AuthenticAMD") */
++		if (ebx == X86EMUL_CPUID_VENDOR_AuthenticAMD_ebx &&
++		    ecx == X86EMUL_CPUID_VENDOR_AuthenticAMD_ecx &&
++		    edx == X86EMUL_CPUID_VENDOR_AuthenticAMD_edx)
++			return true;
++
++		/* AMD ("AMDisbetter!") */
++		if (ebx == X86EMUL_CPUID_VENDOR_AMDisbetterI_ebx &&
++		    ecx == X86EMUL_CPUID_VENDOR_AMDisbetterI_ecx &&
++		    edx == X86EMUL_CPUID_VENDOR_AMDisbetterI_edx)
++			return true;
++	}
++
++	/* default: (not Intel, not AMD), apply Intel's stricter rules... */
++	return false;
++}
++
+ static int em_syscall(struct x86_emulate_ctxt *ctxt)
+ {
+ 	struct x86_emulate_ops *ops = ctxt->ops;
+@@ -1890,9 +1935,15 @@ static int em_syscall(struct x86_emulate_ctxt *ctxt)
+ 	    ctxt->mode == X86EMUL_MODE_VM86)
+ 		return emulate_ud(ctxt);
+ 
++	if (!(em_syscall_is_enabled(ctxt)))
++		return emulate_ud(ctxt);
++
+ 	ops->get_msr(ctxt, MSR_EFER, &efer);
+ 	setup_syscalls_segments(ctxt, &cs, &ss);
+ 
++	if (!(efer & EFER_SCE))
++		return emulate_ud(ctxt);
++
+ 	ops->get_msr(ctxt, MSR_STAR, &msr_data);
+ 	msr_data >>= 32;
+ 	cs_sel = (u16)(msr_data & 0xfffc);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0085-NFS-Properly-handle-the-case-where-the-delegation-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0085-NFS-Properly-handle-the-case-where-the-delegation-is.patch
new file mode 100644
index 0000000..ac42054
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0085-NFS-Properly-handle-the-case-where-the-delegation-is.patch
@@ -0,0 +1,193 @@
+From 3876d640cb4c4f09bdc26a8befea1df94fd4e71e Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Mon, 5 Mar 2012 19:56:44 -0500
+Subject: [PATCH 085/147] NFS: Properly handle the case where the delegation
+ is revoked
+
+commit a1d0b5eebc4fd6e0edb02688b35f17f67f42aea5 upstream.
+
+If we know that the delegation stateid is bad or revoked, we need to
+remove that delegation as soon as possible, and then mark all the
+stateids that relied on that delegation for recovery. We cannot use
+the delegation as part of the recovery process.
+
+Also note that NFSv4.1 uses a different error code (NFS4ERR_DELEG_REVOKED)
+to indicate that the delegation was revoked.
+
+Finally, ensure that setlk() and setattr() can both recover safely from
+a revoked delegation.
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/delegation.c |   11 +++++++++++
+ fs/nfs/delegation.h |    1 +
+ fs/nfs/nfs4_fs.h    |    2 ++
+ fs/nfs/nfs4proc.c   |   18 ++++++++++++++++--
+ fs/nfs/nfs4state.c  |   29 +++++++++++++++++++++++++++--
+ 5 files changed, 57 insertions(+), 4 deletions(-)
+
+diff --git a/fs/nfs/delegation.c b/fs/nfs/delegation.c
+index 7f26540..ac889af 100644
+--- a/fs/nfs/delegation.c
++++ b/fs/nfs/delegation.c
+@@ -466,6 +466,17 @@ static void nfs_delegation_run_state_manager(struct nfs_client *clp)
+ 		nfs4_schedule_state_manager(clp);
+ }
+ 
++void nfs_remove_bad_delegation(struct inode *inode)
++{
++	struct nfs_delegation *delegation;
++
++	delegation = nfs_detach_delegation(NFS_I(inode), NFS_SERVER(inode));
++	if (delegation) {
++		nfs_inode_find_state_and_recover(inode, &delegation->stateid);
++		nfs_free_delegation(delegation);
++	}
++}
++
+ /**
+  * nfs_expire_all_delegation_types
+  * @clp: client to process
+diff --git a/fs/nfs/delegation.h b/fs/nfs/delegation.h
+index d9322e4..691a796 100644
+--- a/fs/nfs/delegation.h
++++ b/fs/nfs/delegation.h
+@@ -45,6 +45,7 @@ void nfs_expire_unreferenced_delegations(struct nfs_client *clp);
+ void nfs_handle_cb_pathdown(struct nfs_client *clp);
+ int nfs_client_return_marked_delegations(struct nfs_client *clp);
+ int nfs_delegations_present(struct nfs_client *clp);
++void nfs_remove_bad_delegation(struct inode *inode);
+ 
+ void nfs_delegation_mark_reclaim(struct nfs_client *clp);
+ void nfs_delegation_reap_unclaimed(struct nfs_client *clp);
+diff --git a/fs/nfs/nfs4_fs.h b/fs/nfs/nfs4_fs.h
+index 693ae22..d6ba137f 100644
+--- a/fs/nfs/nfs4_fs.h
++++ b/fs/nfs/nfs4_fs.h
+@@ -324,6 +324,8 @@ extern void nfs4_put_open_state(struct nfs4_state *);
+ extern void nfs4_close_state(struct nfs4_state *, fmode_t);
+ extern void nfs4_close_sync(struct nfs4_state *, fmode_t);
+ extern void nfs4_state_set_mode_locked(struct nfs4_state *, fmode_t);
++extern void nfs_inode_find_state_and_recover(struct inode *inode,
++		const nfs4_stateid *stateid);
+ extern void nfs4_schedule_lease_recovery(struct nfs_client *);
+ extern void nfs4_schedule_state_manager(struct nfs_client *);
+ extern void nfs4_schedule_path_down_recovery(struct nfs_client *clp);
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index e527030..a51e1dd 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -263,8 +263,11 @@ static int nfs4_handle_exception(struct nfs_server *server, int errorcode, struc
+ 	switch(errorcode) {
+ 		case 0:
+ 			return 0;
++		case -NFS4ERR_DELEG_REVOKED:
+ 		case -NFS4ERR_ADMIN_REVOKED:
+ 		case -NFS4ERR_BAD_STATEID:
++			if (state != NULL)
++				nfs_remove_bad_delegation(state->inode);
+ 		case -NFS4ERR_OPENMODE:
+ 			if (state == NULL)
+ 				break;
+@@ -1316,8 +1319,11 @@ int nfs4_open_delegation_recall(struct nfs_open_context *ctx, struct nfs4_state
+ 				 * The show must go on: exit, but mark the
+ 				 * stateid as needing recovery.
+ 				 */
++			case -NFS4ERR_DELEG_REVOKED:
+ 			case -NFS4ERR_ADMIN_REVOKED:
+ 			case -NFS4ERR_BAD_STATEID:
++				nfs_inode_find_state_and_recover(state->inode,
++						stateid);
+ 				nfs4_schedule_stateid_recovery(server, state);
+ 			case -EKEYEXPIRED:
+ 				/*
+@@ -1893,7 +1899,9 @@ static int nfs4_do_setattr(struct inode *inode, struct rpc_cred *cred,
+ 			   struct nfs4_state *state)
+ {
+ 	struct nfs_server *server = NFS_SERVER(inode);
+-	struct nfs4_exception exception = { };
++	struct nfs4_exception exception = {
++		.state = state,
++	};
+ 	int err;
+ 	do {
+ 		err = nfs4_handle_exception(server,
+@@ -3707,8 +3715,11 @@ nfs4_async_handle_error(struct rpc_task *task, const struct nfs_server *server,
+ 	if (task->tk_status >= 0)
+ 		return 0;
+ 	switch(task->tk_status) {
++		case -NFS4ERR_DELEG_REVOKED:
+ 		case -NFS4ERR_ADMIN_REVOKED:
+ 		case -NFS4ERR_BAD_STATEID:
++			if (state != NULL)
++				nfs_remove_bad_delegation(state->inode);
+ 		case -NFS4ERR_OPENMODE:
+ 			if (state == NULL)
+ 				break;
+@@ -4526,7 +4537,9 @@ out:
+ 
+ static int nfs4_proc_setlk(struct nfs4_state *state, int cmd, struct file_lock *request)
+ {
+-	struct nfs4_exception exception = { };
++	struct nfs4_exception exception = {
++		.state = state,
++	};
+ 	int err;
+ 
+ 	do {
+@@ -4619,6 +4632,7 @@ int nfs4_lock_delegation_recall(struct nfs4_state *state, struct file_lock *fl)
+ 				 * The show must go on: exit, but mark the
+ 				 * stateid as needing recovery.
+ 				 */
++			case -NFS4ERR_DELEG_REVOKED:
+ 			case -NFS4ERR_ADMIN_REVOKED:
+ 			case -NFS4ERR_BAD_STATEID:
+ 			case -NFS4ERR_OPENMODE:
+diff --git a/fs/nfs/nfs4state.c b/fs/nfs/nfs4state.c
+index a58eed7..0596fd6 100644
+--- a/fs/nfs/nfs4state.c
++++ b/fs/nfs/nfs4state.c
+@@ -1071,12 +1071,37 @@ void nfs4_schedule_stateid_recovery(const struct nfs_server *server, struct nfs4
+ {
+ 	struct nfs_client *clp = server->nfs_client;
+ 
+-	if (test_and_clear_bit(NFS_DELEGATED_STATE, &state->flags))
+-		nfs_async_inode_return_delegation(state->inode, &state->stateid);
+ 	nfs4_state_mark_reclaim_nograce(clp, state);
+ 	nfs4_schedule_state_manager(clp);
+ }
+ 
++void nfs_inode_find_state_and_recover(struct inode *inode,
++		const nfs4_stateid *stateid)
++{
++	struct nfs_client *clp = NFS_SERVER(inode)->nfs_client;
++	struct nfs_inode *nfsi = NFS_I(inode);
++	struct nfs_open_context *ctx;
++	struct nfs4_state *state;
++	bool found = false;
++
++	spin_lock(&inode->i_lock);
++	list_for_each_entry(ctx, &nfsi->open_files, list) {
++		state = ctx->state;
++		if (state == NULL)
++			continue;
++		if (!test_bit(NFS_DELEGATED_STATE, &state->flags))
++			continue;
++		if (memcmp(state->stateid.data, stateid->data, sizeof(state->stateid.data)) != 0)
++			continue;
++		nfs4_state_mark_reclaim_nograce(clp, state);
++		found = true;
++	}
++	spin_unlock(&inode->i_lock);
++	if (found)
++		nfs4_schedule_state_manager(clp);
++}
++
++
+ static int nfs4_reclaim_locks(struct nfs4_state *state, const struct nfs4_state_recovery_ops *ops)
+ {
+ 	struct inode *inode = state->inode;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0086-NFSv4-Return-the-delegation-if-the-server-returns-NF.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0086-NFSv4-Return-the-delegation-if-the-server-returns-NF.patch
new file mode 100644
index 0000000..ee59f30
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0086-NFSv4-Return-the-delegation-if-the-server-returns-NF.patch
@@ -0,0 +1,77 @@
+From f56543c626d44b8ca33f2d37ee4758d1faab0e74 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Wed, 7 Mar 2012 16:39:06 -0500
+Subject: [PATCH 086/147] NFSv4: Return the delegation if the server returns
+ NFS4ERR_OPENMODE
+
+commit 3114ea7a24d3264c090556a2444fc6d2c06176d4 upstream.
+
+If a setattr() fails because of an NFS4ERR_OPENMODE error, it is
+probably due to us holding a read delegation. Ensure that the
+recovery routines return that delegation in this case.
+
+Reported-by: Miklos Szeredi <miklos@szeredi.hu>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4_fs.h  |    1 +
+ fs/nfs/nfs4proc.c |   13 ++++++++++++-
+ 2 files changed, 13 insertions(+), 1 deletion(-)
+
+diff --git a/fs/nfs/nfs4_fs.h b/fs/nfs/nfs4_fs.h
+index d6ba137f..0983b25 100644
+--- a/fs/nfs/nfs4_fs.h
++++ b/fs/nfs/nfs4_fs.h
+@@ -191,6 +191,7 @@ struct nfs4_exception {
+ 	long timeout;
+ 	int retry;
+ 	struct nfs4_state *state;
++	struct inode *inode;
+ };
+ 
+ struct nfs4_state_recovery_ops {
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index a51e1dd..758e809 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -257,18 +257,28 @@ static int nfs4_handle_exception(struct nfs_server *server, int errorcode, struc
+ {
+ 	struct nfs_client *clp = server->nfs_client;
+ 	struct nfs4_state *state = exception->state;
++	struct inode *inode = exception->inode;
+ 	int ret = errorcode;
+ 
+ 	exception->retry = 0;
+ 	switch(errorcode) {
+ 		case 0:
+ 			return 0;
++		case -NFS4ERR_OPENMODE:
++			if (nfs_have_delegation(inode, FMODE_READ)) {
++				nfs_inode_return_delegation(inode);
++				exception->retry = 1;
++				return 0;
++			}
++			if (state == NULL)
++				break;
++			nfs4_schedule_stateid_recovery(server, state);
++			goto wait_on_recovery;
+ 		case -NFS4ERR_DELEG_REVOKED:
+ 		case -NFS4ERR_ADMIN_REVOKED:
+ 		case -NFS4ERR_BAD_STATEID:
+ 			if (state != NULL)
+ 				nfs_remove_bad_delegation(state->inode);
+-		case -NFS4ERR_OPENMODE:
+ 			if (state == NULL)
+ 				break;
+ 			nfs4_schedule_stateid_recovery(server, state);
+@@ -1901,6 +1911,7 @@ static int nfs4_do_setattr(struct inode *inode, struct rpc_cred *cred,
+ 	struct nfs_server *server = NFS_SERVER(inode);
+ 	struct nfs4_exception exception = {
+ 		.state = state,
++		.inode = inode,
+ 	};
+ 	int err;
+ 	do {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0087-xfs-fix-inode-lookup-race.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0087-xfs-fix-inode-lookup-race.patch
new file mode 100644
index 0000000..0f9e210
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0087-xfs-fix-inode-lookup-race.patch
@@ -0,0 +1,101 @@
+From e5d6f5ef25f0e67126092de0837e7c8f2ecfbc86 Mon Sep 17 00:00:00 2001
+From: Dave Chinner <dchinner@redhat.com>
+Date: Wed, 7 Mar 2012 04:50:25 +0000
+Subject: [PATCH 087/147] xfs: fix inode lookup race
+
+commit f30d500f809eca67a21704347ab14bb35877b5ee upstream.
+
+When we get concurrent lookups of the same inode that is not in the
+per-AG inode cache, there is a race condition that triggers warnings
+in unlock_new_inode() indicating that we are initialising an inode
+that isn't in a the correct state for a new inode.
+
+When we do an inode lookup via a file handle or a bulkstat, we don't
+serialise lookups at a higher level through the dentry cache (i.e.
+pathless lookup), and so we can get concurrent lookups of the same
+inode.
+
+The race condition is between the insertion of the inode into the
+cache in the case of a cache miss and a concurrently lookup:
+
+Thread 1			Thread 2
+xfs_iget()
+  xfs_iget_cache_miss()
+    xfs_iread()
+    lock radix tree
+    radix_tree_insert()
+				rcu_read_lock
+				radix_tree_lookup
+				lock inode flags
+				XFS_INEW not set
+				igrab()
+				unlock inode flags
+				rcu_read_unlock
+				use uninitialised inode
+				.....
+    lock inode flags
+    set XFS_INEW
+    unlock inode flags
+    unlock radix tree
+  xfs_setup_inode()
+    inode flags = I_NEW
+    unlock_new_inode()
+      WARNING as inode flags != I_NEW
+
+This can lead to inode corruption, inode list corruption, etc, and
+is generally a bad thing to occur.
+
+Fix this by setting XFS_INEW before inserting the inode into the
+radix tree. This will ensure any concurrent lookup will find the new
+inode with XFS_INEW set and that forces the lookup to wait until the
+XFS_INEW flag is removed before allowing the lookup to succeed.
+
+Signed-off-by: Dave Chinner <dchinner@redhat.com>
+Reviewed-by: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Ben Myers <bpm@sgi.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/xfs/xfs_iget.c |   18 ++++++++++++------
+ 1 file changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/fs/xfs/xfs_iget.c b/fs/xfs/xfs_iget.c
+index 0fa98b1..cfc4277 100644
+--- a/fs/xfs/xfs_iget.c
++++ b/fs/xfs/xfs_iget.c
+@@ -353,9 +353,20 @@ xfs_iget_cache_miss(
+ 			BUG();
+ 	}
+ 
+-	spin_lock(&pag->pag_ici_lock);
++	/*
++	 * These values must be set before inserting the inode into the radix
++	 * tree as the moment it is inserted a concurrent lookup (allowed by the
++	 * RCU locking mechanism) can find it and that lookup must see that this
++	 * is an inode currently under construction (i.e. that XFS_INEW is set).
++	 * The ip->i_flags_lock that protects the XFS_INEW flag forms the
++	 * memory barrier that ensures this detection works correctly at lookup
++	 * time.
++	 */
++	ip->i_udquot = ip->i_gdquot = NULL;
++	xfs_iflags_set(ip, XFS_INEW);
+ 
+ 	/* insert the new inode */
++	spin_lock(&pag->pag_ici_lock);
+ 	error = radix_tree_insert(&pag->pag_ici_root, agino, ip);
+ 	if (unlikely(error)) {
+ 		WARN_ON(error != -EEXIST);
+@@ -363,11 +374,6 @@ xfs_iget_cache_miss(
+ 		error = EAGAIN;
+ 		goto out_preload_end;
+ 	}
+-
+-	/* These values _must_ be set before releasing the radix tree lock! */
+-	ip->i_udquot = ip->i_gdquot = NULL;
+-	xfs_iflags_set(ip, XFS_INEW);
+-
+ 	spin_unlock(&pag->pag_ici_lock);
+ 	radix_tree_preload_end();
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0088-CIFS-Respect-negotiated-MaxMpxCount.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0088-CIFS-Respect-negotiated-MaxMpxCount.patch
new file mode 100644
index 0000000..5f2a0dd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0088-CIFS-Respect-negotiated-MaxMpxCount.patch
@@ -0,0 +1,212 @@
+From 8ceb94d9185c4640cf49d48a06ddfb9ef94ec16d Mon Sep 17 00:00:00 2001
+From: Pavel Shilovsky <piastry@etersoft.ru>
+Date: Tue, 20 Mar 2012 12:55:09 +0300
+Subject: [PATCH 088/147] CIFS: Respect negotiated MaxMpxCount
+
+commit 10b9b98e41ba248a899f6175ce96ee91431b6194 upstream.
+
+Some servers sets this value less than 50 that was hardcoded and
+we lost the connection if when we exceed this limit. Fix this by
+respecting this value - not sending more than the server allows.
+
+Reviewed-by: Jeff Layton <jlayton@samba.org>
+Signed-off-by: Pavel Shilovsky <piastry@etersoft.ru>
+Signed-off-by: Steve French <sfrench@us.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/cifsfs.c    |    8 ++++----
+ fs/cifs/cifsglob.h  |   10 +++-------
+ fs/cifs/cifssmb.c   |    9 +++++++--
+ fs/cifs/connect.c   |   11 ++++-------
+ fs/cifs/dir.c       |    6 ++++--
+ fs/cifs/file.c      |    4 ++--
+ fs/cifs/transport.c |    4 ++--
+ 7 files changed, 26 insertions(+), 26 deletions(-)
+
+diff --git a/fs/cifs/cifsfs.c b/fs/cifs/cifsfs.c
+index 8f1fe32..b4c2c99 100644
+--- a/fs/cifs/cifsfs.c
++++ b/fs/cifs/cifsfs.c
+@@ -76,7 +76,7 @@ MODULE_PARM_DESC(cifs_min_small, "Small network buffers in pool. Default: 30 "
+ unsigned int cifs_max_pending = CIFS_MAX_REQ;
+ module_param(cifs_max_pending, int, 0444);
+ MODULE_PARM_DESC(cifs_max_pending, "Simultaneous requests to server. "
+-				   "Default: 50 Range: 2 to 256");
++				   "Default: 32767 Range: 2 to 32767.");
+ unsigned short echo_retries = 5;
+ module_param(echo_retries, ushort, 0644);
+ MODULE_PARM_DESC(echo_retries, "Number of echo attempts before giving up and "
+@@ -1116,9 +1116,9 @@ init_cifs(void)
+ 	if (cifs_max_pending < 2) {
+ 		cifs_max_pending = 2;
+ 		cFYI(1, "cifs_max_pending set to min of 2");
+-	} else if (cifs_max_pending > 256) {
+-		cifs_max_pending = 256;
+-		cFYI(1, "cifs_max_pending set to max of 256");
++	} else if (cifs_max_pending > CIFS_MAX_REQ) {
++		cifs_max_pending = CIFS_MAX_REQ;
++		cFYI(1, "cifs_max_pending set to max of %u", CIFS_MAX_REQ);
+ 	}
+ 
+ 	rc = cifs_fscache_register();
+diff --git a/fs/cifs/cifsglob.h b/fs/cifs/cifsglob.h
+index 8238aa1..c467ac8 100644
+--- a/fs/cifs/cifsglob.h
++++ b/fs/cifs/cifsglob.h
+@@ -55,14 +55,9 @@
+ 
+ /*
+  * MAX_REQ is the maximum number of requests that WE will send
+- * on one socket concurrently. It also matches the most common
+- * value of max multiplex returned by servers.  We may
+- * eventually want to use the negotiated value (in case
+- * future servers can handle more) when we are more confident that
+- * we will not have problems oveloading the socket with pending
+- * write data.
++ * on one socket concurrently.
+  */
+-#define CIFS_MAX_REQ 50
++#define CIFS_MAX_REQ 32767
+ 
+ #define RFC1001_NAME_LEN 15
+ #define RFC1001_NAME_LEN_WITH_NULL (RFC1001_NAME_LEN + 1)
+@@ -263,6 +258,7 @@ struct TCP_Server_Info {
+ 	bool session_estab; /* mark when very first sess is established */
+ 	u16 dialect; /* dialect index that server chose */
+ 	enum securityEnum secType;
++	bool oplocks:1; /* enable oplocks */
+ 	unsigned int maxReq;	/* Clients should submit no more */
+ 	/* than maxReq distinct unanswered SMBs to the server when using  */
+ 	/* multiplexed reads or writes */
+diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
+index 6600aa2..0e6adac 100644
+--- a/fs/cifs/cifssmb.c
++++ b/fs/cifs/cifssmb.c
+@@ -458,7 +458,10 @@ CIFSSMBNegotiate(unsigned int xid, struct cifs_ses *ses)
+ 			goto neg_err_exit;
+ 		}
+ 		server->sec_mode = (__u8)le16_to_cpu(rsp->SecurityMode);
+-		server->maxReq = le16_to_cpu(rsp->MaxMpxCount);
++		server->maxReq = min_t(unsigned int,
++				       le16_to_cpu(rsp->MaxMpxCount),
++				       cifs_max_pending);
++		server->oplocks = server->maxReq > 1 ? enable_oplocks : false;
+ 		server->maxBuf = le16_to_cpu(rsp->MaxBufSize);
+ 		server->max_vcs = le16_to_cpu(rsp->MaxNumberVcs);
+ 		/* even though we do not use raw we might as well set this
+@@ -564,7 +567,9 @@ CIFSSMBNegotiate(unsigned int xid, struct cifs_ses *ses)
+ 
+ 	/* one byte, so no need to convert this or EncryptionKeyLen from
+ 	   little endian */
+-	server->maxReq = le16_to_cpu(pSMBr->MaxMpxCount);
++	server->maxReq = min_t(unsigned int, le16_to_cpu(pSMBr->MaxMpxCount),
++			       cifs_max_pending);
++	server->oplocks = server->maxReq > 1 ? enable_oplocks : false;
+ 	/* probably no need to store and check maxvcs */
+ 	server->maxBuf = le32_to_cpu(pSMBr->MaxBufferSize);
+ 	server->max_rw = le32_to_cpu(pSMBr->MaxRawSize);
+diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
+index 720edf5..a26b98f 100644
+--- a/fs/cifs/connect.c
++++ b/fs/cifs/connect.c
+@@ -625,14 +625,10 @@ static void clean_demultiplex_info(struct TCP_Server_Info *server)
+ 	spin_unlock(&GlobalMid_Lock);
+ 	wake_up_all(&server->response_q);
+ 
+-	/*
+-	 * Check if we have blocked requests that need to free. Note that
+-	 * cifs_max_pending is normally 50, but can be set at module install
+-	 * time to as little as two.
+-	 */
++	/* Check if we have blocked requests that need to free. */
+ 	spin_lock(&GlobalMid_Lock);
+-	if (atomic_read(&server->inFlight) >= cifs_max_pending)
+-		atomic_set(&server->inFlight, cifs_max_pending - 1);
++	if (atomic_read(&server->inFlight) >= server->maxReq)
++		atomic_set(&server->inFlight, server->maxReq - 1);
+ 	/*
+ 	 * We do not want to set the max_pending too low or we could end up
+ 	 * with the counter going negative.
+@@ -1890,6 +1886,7 @@ cifs_get_tcp_session(struct smb_vol *volume_info)
+ 	tcp_ses->noautotune = volume_info->noautotune;
+ 	tcp_ses->tcp_nodelay = volume_info->sockopt_tcp_nodelay;
+ 	atomic_set(&tcp_ses->inFlight, 0);
++	tcp_ses->maxReq = 1; /* enough to send negotiate request */
+ 	init_waitqueue_head(&tcp_ses->response_q);
+ 	init_waitqueue_head(&tcp_ses->request_q);
+ 	INIT_LIST_HEAD(&tcp_ses->pending_mid_q);
+diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
+index bf68b4f..6937e7c 100644
+--- a/fs/cifs/dir.c
++++ b/fs/cifs/dir.c
+@@ -171,7 +171,7 @@ cifs_create(struct inode *inode, struct dentry *direntry, int mode,
+ 	}
+ 	tcon = tlink_tcon(tlink);
+ 
+-	if (enable_oplocks)
++	if (tcon->ses->server->oplocks)
+ 		oplock = REQ_OPLOCK;
+ 
+ 	if (nd)
+@@ -492,7 +492,7 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
+ {
+ 	int xid;
+ 	int rc = 0; /* to get around spurious gcc warning, set to zero here */
+-	__u32 oplock = enable_oplocks ? REQ_OPLOCK : 0;
++	__u32 oplock;
+ 	__u16 fileHandle = 0;
+ 	bool posix_open = false;
+ 	struct cifs_sb_info *cifs_sb;
+@@ -518,6 +518,8 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
+ 	}
+ 	pTcon = tlink_tcon(tlink);
+ 
++	oplock = pTcon->ses->server->oplocks ? REQ_OPLOCK : 0;
++
+ 	/*
+ 	 * Don't allow the separator character in a path component.
+ 	 * The VFS will not allow "/", but "\" is allowed by posix.
+diff --git a/fs/cifs/file.c b/fs/cifs/file.c
+index 5e64748..4aa6080 100644
+--- a/fs/cifs/file.c
++++ b/fs/cifs/file.c
+@@ -380,7 +380,7 @@ int cifs_open(struct inode *inode, struct file *file)
+ 	cFYI(1, "inode = 0x%p file flags are 0x%x for %s",
+ 		 inode, file->f_flags, full_path);
+ 
+-	if (enable_oplocks)
++	if (tcon->ses->server->oplocks)
+ 		oplock = REQ_OPLOCK;
+ 	else
+ 		oplock = 0;
+@@ -505,7 +505,7 @@ static int cifs_reopen_file(struct cifsFileInfo *pCifsFile, bool can_flush)
+ 	cFYI(1, "inode = 0x%p file flags 0x%x for %s",
+ 		 inode, pCifsFile->f_flags, full_path);
+ 
+-	if (enable_oplocks)
++	if (tcon->ses->server->oplocks)
+ 		oplock = REQ_OPLOCK;
+ 	else
+ 		oplock = 0;
+diff --git a/fs/cifs/transport.c b/fs/cifs/transport.c
+index 0cc9584..99a27cf 100644
+--- a/fs/cifs/transport.c
++++ b/fs/cifs/transport.c
+@@ -265,12 +265,12 @@ static int wait_for_free_request(struct TCP_Server_Info *server,
+ 
+ 	spin_lock(&GlobalMid_Lock);
+ 	while (1) {
+-		if (atomic_read(&server->inFlight) >= cifs_max_pending) {
++		if (atomic_read(&server->inFlight) >= server->maxReq) {
+ 			spin_unlock(&GlobalMid_Lock);
+ 			cifs_num_waiters_inc(server);
+ 			wait_event(server->request_q,
+ 				   atomic_read(&server->inFlight)
+-				     < cifs_max_pending);
++				     < server->maxReq);
+ 			cifs_num_waiters_dec(server);
+ 			spin_lock(&GlobalMid_Lock);
+ 		} else {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0089-cifs-fix-issue-mounting-of-DFS-ROOT-when-redirecting.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0089-cifs-fix-issue-mounting-of-DFS-ROOT-when-redirecting.patch
new file mode 100644
index 0000000..a07d8d8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0089-cifs-fix-issue-mounting-of-DFS-ROOT-when-redirecting.patch
@@ -0,0 +1,55 @@
+From bf2a3ba7a460d3f1904077d790028269f468d7c1 Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Wed, 21 Mar 2012 06:30:40 -0400
+Subject: [PATCH 089/147] cifs: fix issue mounting of DFS ROOT when
+ redirecting from one domain controller to the next
+
+commit 1daaae8fa4afe3df78ca34e724ed7e8187e4eb32 upstream.
+
+This patch fixes an issue when cifs_mount receives a
+STATUS_BAD_NETWORK_NAME error during cifs_get_tcon but is able to
+continue after an DFS ROOT referral. In this case, the return code
+variable is not reset prior to trying to mount from the system referred
+to. Thus, is_path_accessible is not executed and the final DFS referral
+is not performed causing a mount error.
+
+Use case: In DNS, example.com  resolves to the secondary AD server
+ad2.example.com Our primary domain controller is ad1.example.com and has
+a DFS redirection set up from \\ad1\share\Users to \\files\share\Users.
+Mounting \\example.com\share\Users fails.
+
+Regression introduced by commit 724d9f1.
+
+Reviewed-by: Pavel Shilovsky <piastry@etersoft.ru
+Signed-off-by: Thomas Hadig <thomas@intapp.com>
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steve French <sfrench@us.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/connect.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
+index a26b98f..9e0675a 100644
+--- a/fs/cifs/connect.c
++++ b/fs/cifs/connect.c
+@@ -3217,7 +3217,7 @@ cifs_ra_pages(struct cifs_sb_info *cifs_sb)
+ int
+ cifs_mount(struct cifs_sb_info *cifs_sb, struct smb_vol *volume_info)
+ {
+-	int rc = 0;
++	int rc;
+ 	int xid;
+ 	struct cifs_ses *pSesInfo;
+ 	struct cifs_tcon *tcon;
+@@ -3244,6 +3244,7 @@ try_mount_again:
+ 		FreeXid(xid);
+ 	}
+ #endif
++	rc = 0;
+ 	tcon = NULL;
+ 	pSesInfo = NULL;
+ 	srvTcp = NULL;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0090-CIFS-Fix-a-spurious-error-in-cifs_push_posix_locks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0090-CIFS-Fix-a-spurious-error-in-cifs_push_posix_locks.patch
new file mode 100644
index 0000000..db43c40
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0090-CIFS-Fix-a-spurious-error-in-cifs_push_posix_locks.patch
@@ -0,0 +1,70 @@
+From 456290dcbf936c8883bf84492b7c3f04e73efa1a Mon Sep 17 00:00:00 2001
+From: Pavel Shilovsky <piastry@etersoft.ru>
+Date: Sat, 17 Mar 2012 09:46:55 +0300
+Subject: [PATCH 090/147] CIFS: Fix a spurious error in cifs_push_posix_locks
+
+commit ce85852b90a214cf577fc1b4f49d99fd7e98784a upstream.
+
+Signed-off-by: Pavel Shilovsky <piastry@etersoft.ru>
+Reviewed-by: Jeff Layton <jlayton@redhat.com>
+Reported-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Steve French <sfrench@us.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/file.c |   19 ++++++++++---------
+ 1 file changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/fs/cifs/file.c b/fs/cifs/file.c
+index 4aa6080..159fcc5 100644
+--- a/fs/cifs/file.c
++++ b/fs/cifs/file.c
+@@ -960,9 +960,9 @@ cifs_push_posix_locks(struct cifsFileInfo *cfile)
+ 	INIT_LIST_HEAD(&locks_to_send);
+ 
+ 	/*
+-	 * Allocating count locks is enough because no locks can be added to
+-	 * the list while we are holding cinode->lock_mutex that protects
+-	 * locking operations of this inode.
++	 * Allocating count locks is enough because no FL_POSIX locks can be
++	 * added to the list while we are holding cinode->lock_mutex that
++	 * protects locking operations of this inode.
+ 	 */
+ 	for (; i < count; i++) {
+ 		lck = kmalloc(sizeof(struct lock_to_push), GFP_KERNEL);
+@@ -973,18 +973,20 @@ cifs_push_posix_locks(struct cifsFileInfo *cfile)
+ 		list_add_tail(&lck->llist, &locks_to_send);
+ 	}
+ 
+-	i = 0;
+ 	el = locks_to_send.next;
+ 	lock_flocks();
+ 	cifs_for_each_lock(cfile->dentry->d_inode, before) {
++		flock = *before;
++		if ((flock->fl_flags & FL_POSIX) == 0)
++			continue;
+ 		if (el == &locks_to_send) {
+-			/* something is really wrong */
++			/*
++			 * The list ended. We don't have enough allocated
++			 * structures - something is really wrong.
++			 */
+ 			cERROR(1, "Can't push all brlocks!");
+ 			break;
+ 		}
+-		flock = *before;
+-		if ((flock->fl_flags & FL_POSIX) == 0)
+-			continue;
+ 		length = 1 + flock->fl_end - flock->fl_start;
+ 		if (flock->fl_type == F_RDLCK || flock->fl_type == F_SHLCK)
+ 			type = CIFS_RDLCK;
+@@ -996,7 +998,6 @@ cifs_push_posix_locks(struct cifsFileInfo *cfile)
+ 		lck->length = length;
+ 		lck->type = type;
+ 		lck->offset = flock->fl_start;
+-		i++;
+ 		el = el->next;
+ 	}
+ 	unlock_flocks();
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0091-UBI-fix-error-handling-in-ubi_scan.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0091-UBI-fix-error-handling-in-ubi_scan.patch
new file mode 100644
index 0000000..1b0619f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0091-UBI-fix-error-handling-in-ubi_scan.patch
@@ -0,0 +1,58 @@
+From a3dcecf0adebe74332981c56c453556e3a4ebd5b Mon Sep 17 00:00:00 2001
+From: Richard Weinberger <richard@nod.at>
+Date: Mon, 30 Jan 2012 18:20:13 +0100
+Subject: [PATCH 091/147] UBI: fix error handling in ubi_scan()
+
+commit a29852be492d61001d86c6ebf5fff9b93d7b4be9 upstream.
+
+Two bad things can happen in ubi_scan():
+1. If kmem_cache_create() fails we jump to out_si and call
+   ubi_scan_destroy_si() which calls kmem_cache_destroy().
+   But si->scan_leb_slab is NULL.
+2. If process_eb() fails we jump to out_vidh, call
+   kmem_cache_destroy() and ubi_scan_destroy_si() which calls
+   again kmem_cache_destroy().
+
+Signed-off-by: Richard Weinberger <richard@nod.at>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/ubi/scan.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/mtd/ubi/scan.c b/drivers/mtd/ubi/scan.c
+index 0cb17d9..b99318e 100644
+--- a/drivers/mtd/ubi/scan.c
++++ b/drivers/mtd/ubi/scan.c
+@@ -1174,7 +1174,7 @@ struct ubi_scan_info *ubi_scan(struct ubi_device *ubi)
+ 
+ 	ech = kzalloc(ubi->ec_hdr_alsize, GFP_KERNEL);
+ 	if (!ech)
+-		goto out_slab;
++		goto out_si;
+ 
+ 	vidh = ubi_zalloc_vid_hdr(ubi, GFP_KERNEL);
+ 	if (!vidh)
+@@ -1235,8 +1235,6 @@ out_vidh:
+ 	ubi_free_vid_hdr(ubi, vidh);
+ out_ech:
+ 	kfree(ech);
+-out_slab:
+-	kmem_cache_destroy(si->scan_leb_slab);
+ out_si:
+ 	ubi_scan_destroy_si(si);
+ 	return ERR_PTR(err);
+@@ -1325,7 +1323,9 @@ void ubi_scan_destroy_si(struct ubi_scan_info *si)
+ 		}
+ 	}
+ 
+-	kmem_cache_destroy(si->scan_leb_slab);
++	if (si->scan_leb_slab)
++		kmem_cache_destroy(si->scan_leb_slab);
++
+ 	kfree(si);
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0092-UBI-fix-eraseblock-picking-criteria.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0092-UBI-fix-eraseblock-picking-criteria.patch
new file mode 100644
index 0000000..ce317e4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0092-UBI-fix-eraseblock-picking-criteria.patch
@@ -0,0 +1,57 @@
+From 7abbe27ba63bb9559ea47b8449c4f0a50d98073e Mon Sep 17 00:00:00 2001
+From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Date: Wed, 7 Mar 2012 19:08:36 +0200
+Subject: [PATCH 092/147] UBI: fix eraseblock picking criteria
+
+commit 7eb3aa65853e1b223bfc786b023b702018cb76c0 upstream.
+
+The 'find_wl_entry()' function expects the maximum difference as the second
+argument, not the maximum absolute value. So the "unknown" eraseblock picking
+was incorrect, as Shmulik Ladkani spotted. This patch fixes the issue.
+
+Reported-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Reviewed-by: Shmulik Ladkani <shmulik.ladkani@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/ubi/wl.c |   10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/mtd/ubi/wl.c b/drivers/mtd/ubi/wl.c
+index 0696e36..cf42971 100644
+--- a/drivers/mtd/ubi/wl.c
++++ b/drivers/mtd/ubi/wl.c
+@@ -389,7 +389,7 @@ static struct ubi_wl_entry *find_wl_entry(struct rb_root *root, int max)
+  */
+ int ubi_wl_get_peb(struct ubi_device *ubi, int dtype)
+ {
+-	int err, medium_ec;
++	int err;
+ 	struct ubi_wl_entry *e, *first, *last;
+ 
+ 	ubi_assert(dtype == UBI_LONGTERM || dtype == UBI_SHORTTERM ||
+@@ -427,7 +427,7 @@ retry:
+ 		 * For unknown data we pick a physical eraseblock with medium
+ 		 * erase counter. But we by no means can pick a physical
+ 		 * eraseblock with erase counter greater or equivalent than the
+-		 * lowest erase counter plus %WL_FREE_MAX_DIFF.
++		 * lowest erase counter plus %WL_FREE_MAX_DIFF/2.
+ 		 */
+ 		first = rb_entry(rb_first(&ubi->free), struct ubi_wl_entry,
+ 					u.rb);
+@@ -436,10 +436,8 @@ retry:
+ 		if (last->ec - first->ec < WL_FREE_MAX_DIFF)
+ 			e = rb_entry(ubi->free.rb_node,
+ 					struct ubi_wl_entry, u.rb);
+-		else {
+-			medium_ec = (first->ec + WL_FREE_MAX_DIFF)/2;
+-			e = find_wl_entry(&ubi->free, medium_ec);
+-		}
++		else
++			e = find_wl_entry(&ubi->free, WL_FREE_MAX_DIFF/2);
+ 		break;
+ 	case UBI_SHORTTERM:
+ 		/*
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0093-SUNRPC-We-must-not-use-list_for_each_entry_safe-in-r.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0093-SUNRPC-We-must-not-use-list_for_each_entry_safe-in-r.patch
new file mode 100644
index 0000000..3b45654
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0093-SUNRPC-We-must-not-use-list_for_each_entry_safe-in-r.patch
@@ -0,0 +1,73 @@
+From cdc2a3f4e2494e413531264d3949ce6801123ad9 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Mon, 19 Mar 2012 13:39:35 -0400
+Subject: [PATCH 093/147] SUNRPC: We must not use list_for_each_entry_safe()
+ in rpc_wake_up()
+
+commit 540a0f7584169651f485e8ab67461fcb06934e38 upstream.
+
+The problem is that for the case of priority queues, we
+have to assume that __rpc_remove_wait_queue_priority will move new
+elements from the tk_wait.links lists into the queue->tasks[] list.
+We therefore cannot use list_for_each_entry_safe() on queue->tasks[],
+since that will skip these new tasks that __rpc_remove_wait_queue_priority
+is adding.
+
+Without this fix, rpc_wake_up and rpc_wake_up_status will both fail
+to wake up all functions on priority wait queues, which can result
+in some nasty hangs.
+
+Reported-by: Andy Adamson <andros@netapp.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/sunrpc/sched.c |   15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/net/sunrpc/sched.c b/net/sunrpc/sched.c
+index 00a1a2a..4e2b3b4 100644
+--- a/net/sunrpc/sched.c
++++ b/net/sunrpc/sched.c
+@@ -500,14 +500,18 @@ EXPORT_SYMBOL_GPL(rpc_wake_up_next);
+  */
+ void rpc_wake_up(struct rpc_wait_queue *queue)
+ {
+-	struct rpc_task *task, *next;
+ 	struct list_head *head;
+ 
+ 	spin_lock_bh(&queue->lock);
+ 	head = &queue->tasks[queue->maxpriority];
+ 	for (;;) {
+-		list_for_each_entry_safe(task, next, head, u.tk_wait.list)
++		while (!list_empty(head)) {
++			struct rpc_task *task;
++			task = list_first_entry(head,
++					struct rpc_task,
++					u.tk_wait.list);
+ 			rpc_wake_up_task_queue_locked(queue, task);
++		}
+ 		if (head == &queue->tasks[0])
+ 			break;
+ 		head--;
+@@ -525,13 +529,16 @@ EXPORT_SYMBOL_GPL(rpc_wake_up);
+  */
+ void rpc_wake_up_status(struct rpc_wait_queue *queue, int status)
+ {
+-	struct rpc_task *task, *next;
+ 	struct list_head *head;
+ 
+ 	spin_lock_bh(&queue->lock);
+ 	head = &queue->tasks[queue->maxpriority];
+ 	for (;;) {
+-		list_for_each_entry_safe(task, next, head, u.tk_wait.list) {
++		while (!list_empty(head)) {
++			struct rpc_task *task;
++			task = list_first_entry(head,
++					struct rpc_task,
++					u.tk_wait.list);
+ 			task->tk_status = status;
+ 			rpc_wake_up_task_queue_locked(queue, task);
+ 		}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0094-usbnet-increase-URB-reference-count-before-usb_unlin.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0094-usbnet-increase-URB-reference-count-before-usb_unlin.patch
new file mode 100644
index 0000000..0538503
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0094-usbnet-increase-URB-reference-count-before-usb_unlin.patch
@@ -0,0 +1,62 @@
+From 25aa7a79e5be3c393eee41e3939d8eefa9672fc7 Mon Sep 17 00:00:00 2001
+From: "tom.leiming@gmail.com" <tom.leiming@gmail.com>
+Date: Thu, 22 Mar 2012 03:22:18 +0000
+Subject: [PATCH 094/147] usbnet: increase URB reference count before
+ usb_unlink_urb
+
+commit 0956a8c20b23d429e79ff86d4325583fc06f9eb4 upstream.
+
+Commit 4231d47e6fe69f061f96c98c30eaf9fb4c14b96d(net/usbnet: avoid
+recursive locking in usbnet_stop()) fixes the recursive locking
+problem by releasing the skb queue lock, but it makes usb_unlink_urb
+racing with defer_bh, and the URB to being unlinked may be freed before
+or during calling usb_unlink_urb, so use-after-free problem may be
+triggerd inside usb_unlink_urb.
+
+The patch fixes the use-after-free problem by increasing URB
+reference count with skb queue lock held before calling
+usb_unlink_urb, so the URB won't be freed until return from
+usb_unlink_urb.
+
+Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
+Cc: Alan Stern <stern@rowland.harvard.edu>
+Cc: Oliver Neukum <oliver@neukum.org>
+Reported-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Ming Lei <tom.leiming@gmail.com>
+Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/usb/usbnet.c |    9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
+index 81b96e3..cf6a515 100644
+--- a/drivers/net/usb/usbnet.c
++++ b/drivers/net/usb/usbnet.c
+@@ -589,6 +589,14 @@ static int unlink_urbs (struct usbnet *dev, struct sk_buff_head *q)
+ 		entry = (struct skb_data *) skb->cb;
+ 		urb = entry->urb;
+ 
++		/*
++		 * Get reference count of the URB to avoid it to be
++		 * freed during usb_unlink_urb, which may trigger
++		 * use-after-free problem inside usb_unlink_urb since
++		 * usb_unlink_urb is always racing with .complete
++		 * handler(include defer_bh).
++		 */
++		usb_get_urb(urb);
+ 		spin_unlock_irqrestore(&q->lock, flags);
+ 		// during some PM-driven resume scenarios,
+ 		// these (async) unlinks complete immediately
+@@ -597,6 +605,7 @@ static int unlink_urbs (struct usbnet *dev, struct sk_buff_head *q)
+ 			netdev_dbg(dev->net, "unlink urb err, %d\n", retval);
+ 		else
+ 			count++;
++		usb_put_urb(urb);
+ 		spin_lock_irqsave(&q->lock, flags);
+ 	}
+ 	spin_unlock_irqrestore (&q->lock, flags);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0095-usbnet-don-t-clear-urb-dev-in-tx_complete.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0095-usbnet-don-t-clear-urb-dev-in-tx_complete.patch
new file mode 100644
index 0000000..71c9db0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0095-usbnet-don-t-clear-urb-dev-in-tx_complete.patch
@@ -0,0 +1,38 @@
+From 31dcb2223cbb8ca92371811a9d59ed6f721e6d5d Mon Sep 17 00:00:00 2001
+From: "tom.leiming@gmail.com" <tom.leiming@gmail.com>
+Date: Thu, 22 Mar 2012 03:22:38 +0000
+Subject: [PATCH 095/147] usbnet: don't clear urb->dev in tx_complete
+
+commit 5d5440a835710d09f0ef18da5000541ec98b537a upstream.
+
+URB unlinking is always racing with its completion and tx_complete
+may be called before or during running usb_unlink_urb, so tx_complete
+must not clear urb->dev since it will be used in unlink path,
+otherwise invalid memory accesses or usb device leak may be caused
+inside usb_unlink_urb.
+
+Cc: Alan Stern <stern@rowland.harvard.edu>
+Cc: Oliver Neukum <oliver@neukum.org>
+Signed-off-by: Ming Lei <tom.leiming@gmail.com>
+Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/usb/usbnet.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
+index cf6a515..750e330 100644
+--- a/drivers/net/usb/usbnet.c
++++ b/drivers/net/usb/usbnet.c
+@@ -1037,7 +1037,6 @@ static void tx_complete (struct urb *urb)
+ 	}
+ 
+ 	usb_autopm_put_interface_async(dev->intf);
+-	urb->dev = NULL;
+ 	entry->state = tx_done;
+ 	defer_bh(dev, skb, &dev->txq);
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0096-e1000e-Avoid-wrong-check-on-TX-hang.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0096-e1000e-Avoid-wrong-check-on-TX-hang.patch
new file mode 100644
index 0000000..23f6a5b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0096-e1000e-Avoid-wrong-check-on-TX-hang.patch
@@ -0,0 +1,98 @@
+From 4c14b8afd02d6923243bf2e2f14bd8ad750741d3 Mon Sep 17 00:00:00 2001
+From: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Date: Fri, 18 Nov 2011 14:25:00 +0000
+Subject: [PATCH 096/147] e1000e: Avoid wrong check on TX hang
+
+commit 09357b00255c233705b1cf6d76a8d147340545b8 upstream.
+
+Based on the original patch submitted my Michael Wang
+<wangyun@linux.vnet.ibm.com>.
+Descriptors may not be write-back while checking TX hang with flag
+FLAG2_DMA_BURST on.
+So when we detect hang, we just flush the descriptor and detect
+again for once.
+
+-v2 change 1 to true and 0 to false and remove extra ()
+
+CC: Michael Wang <wangyun@linux.vnet.ibm.com>
+CC: Flavio Leitner <fbl@redhat.com>
+Acked-by: Jesse Brandeburg <jesse.brandeburg@intel.com>
+Tested-by: Aaron Brown <aaron.f.brown@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/intel/e1000e/e1000.h  |    1 +
+ drivers/net/ethernet/intel/e1000e/netdev.c |   23 ++++++++++++++++++++---
+ 2 files changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/e1000e/e1000.h b/drivers/net/ethernet/intel/e1000e/e1000.h
+index 9fe18d1..f478a22 100644
+--- a/drivers/net/ethernet/intel/e1000e/e1000.h
++++ b/drivers/net/ethernet/intel/e1000e/e1000.h
+@@ -309,6 +309,7 @@ struct e1000_adapter {
+ 	u32 txd_cmd;
+ 
+ 	bool detect_tx_hung;
++	bool tx_hang_recheck;
+ 	u8 tx_timeout_factor;
+ 
+ 	u32 tx_int_delay;
+diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
+index a855db1..4e933d1 100644
+--- a/drivers/net/ethernet/intel/e1000e/netdev.c
++++ b/drivers/net/ethernet/intel/e1000e/netdev.c
+@@ -1030,6 +1030,7 @@ static void e1000_print_hw_hang(struct work_struct *work)
+ 	struct e1000_adapter *adapter = container_of(work,
+ 	                                             struct e1000_adapter,
+ 	                                             print_hang_task);
++	struct net_device *netdev = adapter->netdev;
+ 	struct e1000_ring *tx_ring = adapter->tx_ring;
+ 	unsigned int i = tx_ring->next_to_clean;
+ 	unsigned int eop = tx_ring->buffer_info[i].next_to_watch;
+@@ -1041,6 +1042,21 @@ static void e1000_print_hw_hang(struct work_struct *work)
+ 	if (test_bit(__E1000_DOWN, &adapter->state))
+ 		return;
+ 
++	if (!adapter->tx_hang_recheck &&
++	    (adapter->flags2 & FLAG2_DMA_BURST)) {
++		/* May be block on write-back, flush and detect again
++		 * flush pending descriptor writebacks to memory
++		 */
++		ew32(TIDV, adapter->tx_int_delay | E1000_TIDV_FPD);
++		/* execute the writes immediately */
++		e1e_flush();
++		adapter->tx_hang_recheck = true;
++		return;
++	}
++	/* Real hang detected */
++	adapter->tx_hang_recheck = false;
++	netif_stop_queue(netdev);
++
+ 	e1e_rphy(hw, PHY_STATUS, &phy_status);
+ 	e1e_rphy(hw, PHY_1000T_STATUS, &phy_1000t_status);
+ 	e1e_rphy(hw, PHY_EXT_STATUS, &phy_ext_status);
+@@ -1154,10 +1170,10 @@ static bool e1000_clean_tx_irq(struct e1000_adapter *adapter)
+ 		if (tx_ring->buffer_info[i].time_stamp &&
+ 		    time_after(jiffies, tx_ring->buffer_info[i].time_stamp
+ 			       + (adapter->tx_timeout_factor * HZ)) &&
+-		    !(er32(STATUS) & E1000_STATUS_TXOFF)) {
++		    !(er32(STATUS) & E1000_STATUS_TXOFF))
+ 			schedule_work(&adapter->print_hang_task);
+-			netif_stop_queue(netdev);
+-		}
++		else
++			adapter->tx_hang_recheck = false;
+ 	}
+ 	adapter->total_tx_bytes += total_tx_bytes;
+ 	adapter->total_tx_packets += total_tx_packets;
+@@ -3782,6 +3798,7 @@ static int e1000_open(struct net_device *netdev)
+ 
+ 	e1000_irq_enable(adapter);
+ 
++	adapter->tx_hang_recheck = false;
+ 	netif_start_queue(netdev);
+ 
+ 	adapter->idle_check = true;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0097-x86-32-Fix-endless-loop-when-processing-signals-for-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0097-x86-32-Fix-endless-loop-when-processing-signals-for-.patch
new file mode 100644
index 0000000..0b817ed
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0097-x86-32-Fix-endless-loop-when-processing-signals-for-.patch
@@ -0,0 +1,85 @@
+From 37d297b39726f3284da2f83d235c94b0d224e047 Mon Sep 17 00:00:00 2001
+From: Dmitry Adamushko <dmitry.adamushko@gmail.com>
+Date: Thu, 22 Mar 2012 21:39:25 +0100
+Subject: [PATCH 097/147] x86-32: Fix endless loop when processing signals for
+ kernel tasks
+
+commit 29a2e2836ff9ea65a603c89df217f4198973a74f upstream.
+
+The problem occurs on !CONFIG_VM86 kernels [1] when a kernel-mode task
+returns from a system call with a pending signal.
+
+A real-life scenario is a child of 'khelper' returning from a failed
+kernel_execve() in ____call_usermodehelper() [ kernel/kmod.c ].
+kernel_execve() fails due to a pending SIGKILL, which is the result of
+"kill -9 -1" (at least, busybox's init does it upon reboot).
+
+The loop is as follows:
+
+* syscall_exit_work:
+ - work_pending:            // start_of_the_loop
+ - work_notify_sig:
+   - do_notify_resume()
+     - do_signal()
+       - if (!user_mode(regs)) return;
+ - resume_userspace         // TIF_SIGPENDING is still set
+ - work_pending             // so we call work_pending => goto
+                            // start_of_the_loop
+
+More information can be found in another LKML thread:
+http://www.serverphorums.com/read.php?12,457826
+
+[1] the problem was also seen on MIPS.
+
+Signed-off-by: Dmitry Adamushko <dmitry.adamushko@gmail.com>
+Link: http://lkml.kernel.org/r/1332448765.2299.68.camel@dimm
+Cc: Oleg Nesterov <oleg@redhat.com>
+Cc: Roland McGrath <roland@hack.frob.com>
+Cc: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/entry_32.S |   17 ++++++++++-------
+ 1 file changed, 10 insertions(+), 7 deletions(-)
+
+diff --git a/arch/x86/kernel/entry_32.S b/arch/x86/kernel/entry_32.S
+index f3f6f53..bcda816 100644
+--- a/arch/x86/kernel/entry_32.S
++++ b/arch/x86/kernel/entry_32.S
+@@ -99,12 +99,6 @@
+ #endif
+ .endm
+ 
+-#ifdef CONFIG_VM86
+-#define resume_userspace_sig	check_userspace
+-#else
+-#define resume_userspace_sig	resume_userspace
+-#endif
+-
+ /*
+  * User gs save/restore
+  *
+@@ -328,10 +322,19 @@ ret_from_exception:
+ 	preempt_stop(CLBR_ANY)
+ ret_from_intr:
+ 	GET_THREAD_INFO(%ebp)
+-check_userspace:
++resume_userspace_sig:
++#ifdef CONFIG_VM86
+ 	movl PT_EFLAGS(%esp), %eax	# mix EFLAGS and CS
+ 	movb PT_CS(%esp), %al
+ 	andl $(X86_EFLAGS_VM | SEGMENT_RPL_MASK), %eax
++#else
++	/*
++	 * We can be coming here from a syscall done in the kernel space,
++	 * e.g. a failed kernel_execve().
++	 */
++	movl PT_CS(%esp), %eax
++	andl $SEGMENT_RPL_MASK, %eax
++#endif
+ 	cmpl $USER_RPL, %eax
+ 	jb resume_kernel		# not returning to v8086 or userspace
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0098-proc-ns-use-d_set_d_op-API-to-set-dentry-ops-in-proc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0098-proc-ns-use-d_set_d_op-API-to-set-dentry-ops-in-proc.patch
new file mode 100644
index 0000000..d32e4a6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0098-proc-ns-use-d_set_d_op-API-to-set-dentry-ops-in-proc.patch
@@ -0,0 +1,49 @@
+From 0b21a3eba2629ca8e573e5b0cd7d1627d17c7cf6 Mon Sep 17 00:00:00 2001
+From: Pravin B Shelar <pshelar@nicira.com>
+Date: Fri, 23 Mar 2012 15:02:55 -0700
+Subject: [PATCH 098/147] proc-ns: use d_set_d_op() API to set dentry ops in
+ proc_ns_instantiate().
+
+commit 1b26c9b334044cff6d1d2698f2be41bc7d9a0864 upstream.
+
+The namespace cleanup path leaks a dentry which holds a reference count
+on a network namespace.  Keeping that network namespace from being freed
+when the last user goes away.  Leaving things like vlan devices in the
+leaked network namespace.
+
+If you use ip netns add for much real work this problem becomes apparent
+pretty quickly.  It light testing the problem hides because frequently
+you simply don't notice the leak.
+
+Use d_set_d_op() so that DCACHE_OP_* flags are set correctly.
+
+This issue exists back to 3.0.
+
+Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
+Reported-by: Justin Pettit <jpettit@nicira.com>
+Signed-off-by: Pravin B Shelar <pshelar@nicira.com>
+Signed-off-by: Jesse Gross <jesse@nicira.com>
+Cc: David Miller <davem@davemloft.net>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/proc/namespaces.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/proc/namespaces.c b/fs/proc/namespaces.c
+index be177f7..d6c078e 100644
+--- a/fs/proc/namespaces.c
++++ b/fs/proc/namespaces.c
+@@ -54,7 +54,7 @@ static struct dentry *proc_ns_instantiate(struct inode *dir,
+ 	ei->ns_ops    = ns_ops;
+ 	ei->ns	      = ns;
+ 
+-	dentry->d_op = &pid_dentry_operations;
++	d_set_d_op(dentry, &pid_dentry_operations);
+ 	d_add(dentry, inode);
+ 	/* Close the race of the process dying before we return the dentry */
+ 	if (pid_revalidate(dentry, NULL))
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0099-iommu-amd-Fix-section-warning-for-prealloc_protectio.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0099-iommu-amd-Fix-section-warning-for-prealloc_protectio.patch
new file mode 100644
index 0000000..daafc4e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0099-iommu-amd-Fix-section-warning-for-prealloc_protectio.patch
@@ -0,0 +1,39 @@
+From fd9b78dce7a6acf7a69902d69c82980634cd7136 Mon Sep 17 00:00:00 2001
+From: Steffen Persvold <sp@numascale.com>
+Date: Thu, 15 Mar 2012 15:20:29 +0100
+Subject: [PATCH 099/147] iommu/amd: Fix section warning for
+ prealloc_protection_domains
+
+commit cebd5fa4d3046d5b43ce1836a0120612822a7fb0 upstream.
+
+Fix the following section warning in drivers/iommu/amd_iommu.c :
+
+WARNING: vmlinux.o(.text+0x526e77): Section mismatch in reference from the function prealloc_protection_domains() to the function .init.text:alloc_passthrough_domain()
+The function prealloc_protection_domains() references
+the function __init alloc_passthrough_domain().
+This is often because prealloc_protection_domains lacks a __init
+annotation or the annotation of alloc_passthrough_domain is wrong.
+
+Signed-off-by: Steffen Persvold <sp@numascale.com>
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/iommu/amd_iommu.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
+index e0b3e33..966a6e7 100644
+--- a/drivers/iommu/amd_iommu.c
++++ b/drivers/iommu/amd_iommu.c
+@@ -2432,7 +2432,7 @@ static int amd_iommu_dma_supported(struct device *dev, u64 mask)
+  * we don't need to preallocate the protection domains anymore.
+  * For now we have to.
+  */
+-static void prealloc_protection_domains(void)
++static void __init prealloc_protection_domains(void)
+ {
+ 	struct pci_dev *dev = NULL;
+ 	struct dma_ops_domain *dma_dom;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0100-sysctl-protect-poll-in-entries-that-may-go-away.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0100-sysctl-protect-poll-in-entries-that-may-go-away.patch
new file mode 100644
index 0000000..15fc99d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0100-sysctl-protect-poll-in-entries-that-may-go-away.patch
@@ -0,0 +1,97 @@
+From 55d8b2b2ea9545b29091216b9875c4e119215b63 Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.demarchi@profusion.mobi>
+Date: Thu, 22 Mar 2012 14:42:22 -0700
+Subject: [PATCH 100/147] sysctl: protect poll() in entries that may go away
+
+commit 4e474a00d7ff746ed177ddae14fa8b2d4bad7a00 upstream.
+
+Protect code accessing ctl_table by grabbing the header with grab_header()
+and after releasing with sysctl_head_finish().  This is needed if poll()
+is called in entries created by modules: currently only hostname and
+domainname support poll(), but this bug may be triggered when/if modules
+use it and if user called poll() in a file that doesn't support it.
+
+Dave Jones reported the following when using a syscall fuzzer while
+hibernating/resuming:
+
+RIP: 0010:[<ffffffff81233e3e>]  [<ffffffff81233e3e>] proc_sys_poll+0x4e/0x90
+RAX: 0000000000000145 RBX: ffff88020cab6940 RCX: 0000000000000000
+RDX: ffffffff81233df0 RSI: 6b6b6b6b6b6b6b6b RDI: ffff88020cab6940
+[ ... ]
+Code: 00 48 89 fb 48 89 f1 48 8b 40 30 4c 8b 60 e8 b8 45 01 00 00 49 83
+7c 24 28 00 74 2e 49 8b 74 24 30 48 85 f6 74 24 48 85 c9 75 32 <8b> 16
+b8 45 01 00 00 48 63 d2 49 39 d5 74 10 8b 06 48 98 48 89
+
+If an entry goes away while we are polling() it, ctl_table may not exist
+anymore.
+
+Reported-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Lucas De Marchi <lucas.demarchi@profusion.mobi>
+Cc: Al Viro <viro@zeniv.linux.org.uk>
+Cc: Linus Torvalds <torvalds@linux-foundation.org>
+Cc: Alexey Dobriyan <adobriyan@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Eric W. Biederman <ebiederm@xmission.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/proc/proc_sysctl.c |   17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/fs/proc/proc_sysctl.c b/fs/proc/proc_sysctl.c
+index a6b6217..53c3bce 100644
+--- a/fs/proc/proc_sysctl.c
++++ b/fs/proc/proc_sysctl.c
+@@ -188,20 +188,32 @@ static ssize_t proc_sys_write(struct file *filp, const char __user *buf,
+ 
+ static int proc_sys_open(struct inode *inode, struct file *filp)
+ {
++	struct ctl_table_header *head = grab_header(inode);
+ 	struct ctl_table *table = PROC_I(inode)->sysctl_entry;
+ 
++	/* sysctl was unregistered */
++	if (IS_ERR(head))
++		return PTR_ERR(head);
++
+ 	if (table->poll)
+ 		filp->private_data = proc_sys_poll_event(table->poll);
+ 
++	sysctl_head_finish(head);
++
+ 	return 0;
+ }
+ 
+ static unsigned int proc_sys_poll(struct file *filp, poll_table *wait)
+ {
+ 	struct inode *inode = filp->f_path.dentry->d_inode;
++	struct ctl_table_header *head = grab_header(inode);
+ 	struct ctl_table *table = PROC_I(inode)->sysctl_entry;
+-	unsigned long event = (unsigned long)filp->private_data;
+ 	unsigned int ret = DEFAULT_POLLMASK;
++	unsigned long event;
++
++	/* sysctl was unregistered */
++	if (IS_ERR(head))
++		return POLLERR | POLLHUP;
+ 
+ 	if (!table->proc_handler)
+ 		goto out;
+@@ -209,6 +221,7 @@ static unsigned int proc_sys_poll(struct file *filp, poll_table *wait)
+ 	if (!table->poll)
+ 		goto out;
+ 
++	event = (unsigned long)filp->private_data;
+ 	poll_wait(filp, &table->poll->wait, wait);
+ 
+ 	if (event != atomic_read(&table->poll->event)) {
+@@ -217,6 +230,8 @@ static unsigned int proc_sys_poll(struct file *filp, poll_table *wait)
+ 	}
+ 
+ out:
++	sysctl_head_finish(head);
++
+ 	return ret;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0101-hwmon-fam15h_power-Correct-sign-extension-of-running.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0101-hwmon-fam15h_power-Correct-sign-extension-of-running.patch
new file mode 100644
index 0000000..552723d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0101-hwmon-fam15h_power-Correct-sign-extension-of-running.patch
@@ -0,0 +1,36 @@
+From c1642ad65f83a61ba5c49a36e0f0e24f71c3dd9a Mon Sep 17 00:00:00 2001
+From: Andreas Herrmann <andreas.herrmann3@amd.com>
+Date: Fri, 23 Mar 2012 10:02:17 +0100
+Subject: [PATCH 101/147] hwmon: (fam15h_power) Correct sign extension of
+ running_avg_capture
+
+commit fc0900cbda9243957d812cd6b4cc87965f9fe75f upstream.
+
+Wrong bit was used for sign extension which caused wrong end results.
+Thanks to Andre for spotting this bug.
+
+Reported-by: Andre Przywara <andre.przywara@amd.com>
+Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
+Acked-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Signed-off-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/fam15h_power.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
+index 523f8fb..930370d 100644
+--- a/drivers/hwmon/fam15h_power.c
++++ b/drivers/hwmon/fam15h_power.c
+@@ -60,7 +60,7 @@ static ssize_t show_power(struct device *dev,
+ 	pci_bus_read_config_dword(f4->bus, PCI_DEVFN(PCI_SLOT(f4->devfn), 5),
+ 				  REG_TDP_RUNNING_AVERAGE, &val);
+ 	running_avg_capture = (val >> 4) & 0x3fffff;
+-	running_avg_capture = sign_extend32(running_avg_capture, 22);
++	running_avg_capture = sign_extend32(running_avg_capture, 21);
+ 	running_avg_range = val & 0xf;
+ 
+ 	pci_bus_read_config_dword(f4->bus, PCI_DEVFN(PCI_SLOT(f4->devfn), 5),
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0102-lgdt330x-fix-signedness-error-in-i2c_read_demod_byte.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0102-lgdt330x-fix-signedness-error-in-i2c_read_demod_byte.patch
new file mode 100644
index 0000000..ae14ffb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0102-lgdt330x-fix-signedness-error-in-i2c_read_demod_byte.patch
@@ -0,0 +1,53 @@
+From 02bdf6aaea4932d896b0a9c8648ae6aa8255eb2b Mon Sep 17 00:00:00 2001
+From: Xi Wang <xi.wang@gmail.com>
+Date: Tue, 14 Feb 2012 14:32:41 -0300
+Subject: [PATCH 102/147] lgdt330x: fix signedness error in
+ i2c_read_demod_bytes()
+
+commit 34817174fca0c5512c2d5b6ea0fc37a0337ce1d8 upstream.
+
+The error handling in lgdt3303_read_status() and lgdt330x_read_ucblocks()
+doesn't work, because i2c_read_demod_bytes() returns a u8 and (err < 0)
+is always false.
+
+        err = i2c_read_demod_bytes(state, 0x58, buf, 1);
+        if (err < 0)
+                return err;
+
+Change the return type of i2c_read_demod_bytes() to int.  Also change
+the return value on error to -EIO to make (err < 0) work.
+
+Signed-off-by: Xi Wang <xi.wang@gmail.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/media/dvb/frontends/lgdt330x.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/media/dvb/frontends/lgdt330x.c b/drivers/media/dvb/frontends/lgdt330x.c
+index 43971e6..aa63d68 100644
+--- a/drivers/media/dvb/frontends/lgdt330x.c
++++ b/drivers/media/dvb/frontends/lgdt330x.c
+@@ -104,8 +104,8 @@ static int i2c_write_demod_bytes (struct lgdt330x_state* state,
+  * then reads the data returned for (len) bytes.
+  */
+ 
+-static u8 i2c_read_demod_bytes (struct lgdt330x_state* state,
+-			       enum I2C_REG reg, u8* buf, int len)
++static int i2c_read_demod_bytes(struct lgdt330x_state *state,
++				enum I2C_REG reg, u8 *buf, int len)
+ {
+ 	u8 wr [] = { reg };
+ 	struct i2c_msg msg [] = {
+@@ -118,6 +118,8 @@ static u8 i2c_read_demod_bytes (struct lgdt330x_state* state,
+ 	ret = i2c_transfer(state->i2c, msg, 2);
+ 	if (ret != 2) {
+ 		printk(KERN_WARNING "lgdt330x: %s: addr 0x%02x select 0x%02x error (ret == %i)\n", __func__, state->config->demod_address, reg, ret);
++		if (ret >= 0)
++			ret = -EIO;
+ 	} else {
+ 		ret = 0;
+ 	}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0103-pvrusb2-fix-7MHz-8MHz-DVB-T-tuner-support-for-HVR190.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0103-pvrusb2-fix-7MHz-8MHz-DVB-T-tuner-support-for-HVR190.patch
new file mode 100644
index 0000000..974e49d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0103-pvrusb2-fix-7MHz-8MHz-DVB-T-tuner-support-for-HVR190.patch
@@ -0,0 +1,51 @@
+From c0c8df72a8880f19b3d9631dc8c2298a533eeba0 Mon Sep 17 00:00:00 2001
+From: Michael Krufky <mkrufky@linuxtv.org>
+Date: Tue, 7 Feb 2012 13:28:33 -0300
+Subject: [PATCH 103/147] pvrusb2: fix 7MHz & 8MHz DVB-T tuner support for
+ HVR1900 rev D1F5
+
+commit 9ab2393fc3e460cd2040de1483918eb17abb822f upstream.
+
+The D1F5 revision of the WinTV HVR-1900 uses a tda18271c2 tuner
+instead of a tda18271c1 tuner as used in revision D1E9. To
+account for this, we must hardcode the frontend configuration
+to use the same IF frequency configuration for both revisions
+of the device.
+
+6MHz DVB-T is unaffected by this issue, as the recommended
+IF Frequency configuration for 6MHz DVB-T is the same on both
+c1 and c2 revisions of the tda18271 tuner.
+
+Signed-off-by: Michael Krufky <mkrufky@linuxtv.org>
+Cc: Mike Isely <isely@pobox.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/media/video/pvrusb2/pvrusb2-devattr.c |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/drivers/media/video/pvrusb2/pvrusb2-devattr.c b/drivers/media/video/pvrusb2/pvrusb2-devattr.c
+index c6da8f7..d8c8982 100644
+--- a/drivers/media/video/pvrusb2/pvrusb2-devattr.c
++++ b/drivers/media/video/pvrusb2/pvrusb2-devattr.c
+@@ -320,7 +320,17 @@ static struct tda829x_config tda829x_no_probe = {
+ 	.probe_tuner = TDA829X_DONT_PROBE,
+ };
+ 
++static struct tda18271_std_map hauppauge_tda18271_dvbt_std_map = {
++        .dvbt_6   = { .if_freq = 3300, .agc_mode = 3, .std = 4,
++                      .if_lvl = 1, .rfagc_top = 0x37, },
++        .dvbt_7   = { .if_freq = 3800, .agc_mode = 3, .std = 5,
++                      .if_lvl = 1, .rfagc_top = 0x37, },
++        .dvbt_8   = { .if_freq = 4300, .agc_mode = 3, .std = 6,
++                      .if_lvl = 1, .rfagc_top = 0x37, },
++};
++
+ static struct tda18271_config hauppauge_tda18271_dvb_config = {
++	.std_map = &hauppauge_tda18271_dvbt_std_map,
+ 	.gate    = TDA18271_GATE_ANALOG,
+ 	.output_opt = TDA18271_OUTPUT_LT_OFF,
+ };
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0104-mxl111sf-fix-error-on-stream-stop-in-mxl111sf_ep6_st.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0104-mxl111sf-fix-error-on-stream-stop-in-mxl111sf_ep6_st.patch
new file mode 100644
index 0000000..2233e9a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0104-mxl111sf-fix-error-on-stream-stop-in-mxl111sf_ep6_st.patch
@@ -0,0 +1,45 @@
+From 9b9105c08669b50ea9735b26116b0b094cdb2fbe Mon Sep 17 00:00:00 2001
+From: Michael Krufky <mkrufky@linuxtv.org>
+Date: Sun, 18 Mar 2012 14:35:57 -0300
+Subject: [PATCH 104/147] mxl111sf: fix error on stream stop in
+ mxl111sf_ep6_streaming_ctrl()
+
+commit 3be5bb71fbf18f83cb88b54a62a78e03e5a4f30a upstream.
+
+Remove unnecessary register access in mxl111sf_ep6_streaming_ctrl()
+
+This code breaks driver operation in kernel 3.3 and later, although
+it works properly in 3.2  Disable register access to 0x12 for now.
+
+Signed-off-by: Michael Krufky <mkrufky@linuxtv.org>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/media/dvb/dvb-usb/mxl111sf.c |    6 ++----
+ 1 file changed, 2 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/media/dvb/dvb-usb/mxl111sf.c b/drivers/media/dvb/dvb-usb/mxl111sf.c
+index b5c98da..bc6ea9f 100644
+--- a/drivers/media/dvb/dvb-usb/mxl111sf.c
++++ b/drivers/media/dvb/dvb-usb/mxl111sf.c
+@@ -351,15 +351,13 @@ static int mxl111sf_ep6_streaming_ctrl(struct dvb_usb_adapter *adap, int onoff)
+ 					      adap_state->ep6_clockphase,
+ 					      0, 0);
+ 		mxl_fail(ret);
++#if 0
+ 	} else {
+ 		ret = mxl111sf_disable_656_port(state);
+ 		mxl_fail(ret);
++#endif
+ 	}
+ 
+-	mxl111sf_read_reg(state, 0x12, &tmp);
+-	tmp &= ~0x04;
+-	mxl111sf_write_reg(state, 0x12, tmp);
+-
+ 	return ret;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0105-NFSv4-Rate-limit-the-state-manager-warning-messages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0105-NFSv4-Rate-limit-the-state-manager-warning-messages.patch
new file mode 100644
index 0000000..f006520
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0105-NFSv4-Rate-limit-the-state-manager-warning-messages.patch
@@ -0,0 +1,78 @@
+From 44612d69c516879d31f7b6a4a49d00dfc49caf06 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Mon, 12 Mar 2012 18:01:48 -0400
+Subject: [PATCH 105/147] NFSv4: Rate limit the state manager warning messages
+
+commit 9a3ba432330e504ac61ff0043dbdaba7cea0e35a upstream.
+
+Prevent the state manager from filling up system logs when recovery
+fails on the server.
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/callback_xdr.c |    4 +++-
+ fs/nfs/nfs4proc.c     |    2 +-
+ fs/nfs/nfs4state.c    |    4 ++--
+ 3 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/fs/nfs/callback_xdr.c b/fs/nfs/callback_xdr.c
+index 726e59a..168cb93 100644
+--- a/fs/nfs/callback_xdr.c
++++ b/fs/nfs/callback_xdr.c
+@@ -9,6 +9,8 @@
+ #include <linux/sunrpc/svc.h>
+ #include <linux/nfs4.h>
+ #include <linux/nfs_fs.h>
++#include <linux/ratelimit.h>
++#include <linux/printk.h>
+ #include <linux/slab.h>
+ #include <linux/sunrpc/bc_xprt.h>
+ #include "nfs4_fs.h"
+@@ -167,7 +169,7 @@ static __be32 decode_compound_hdr_arg(struct xdr_stream *xdr, struct cb_compound
+ 	if (hdr->minorversion <= 1) {
+ 		hdr->cb_ident = ntohl(*p++); /* ignored by v4.1 */
+ 	} else {
+-		printk(KERN_WARNING "%s: NFSv4 server callback with "
++		pr_warn_ratelimited("NFS: %s: NFSv4 server callback with "
+ 			"illegal minor version %u!\n",
+ 			__func__, hdr->minorversion);
+ 		return htonl(NFS4ERR_MINOR_VERS_MISMATCH);
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index 758e809..c9e2d9e 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -1838,7 +1838,7 @@ static struct nfs4_state *nfs4_do_open(struct inode *dir, struct dentry *dentry,
+ 		 * the user though...
+ 		 */
+ 		if (status == -NFS4ERR_BAD_SEQID) {
+-			printk(KERN_WARNING "NFS: v4 server %s "
++			pr_warn_ratelimited("NFS: v4 server %s "
+ 					" returned a bad sequence-id error!\n",
+ 					NFS_SERVER(dir)->nfs_client->cl_hostname);
+ 			exception.retry = 1;
+diff --git a/fs/nfs/nfs4state.c b/fs/nfs/nfs4state.c
+index 0596fd6..66020ac 100644
+--- a/fs/nfs/nfs4state.c
++++ b/fs/nfs/nfs4state.c
+@@ -935,7 +935,7 @@ static void nfs_increment_seqid(int status, struct nfs_seqid *seqid)
+ 		case -NFS4ERR_BAD_SEQID:
+ 			if (seqid->sequence->flags & NFS_SEQID_CONFIRMED)
+ 				return;
+-			printk(KERN_WARNING "NFS: v4 server returned a bad"
++			pr_warn_ratelimited("NFS: v4 server returned a bad"
+ 					" sequence-id error on an"
+ 					" unconfirmed sequence %p!\n",
+ 					seqid->sequence);
+@@ -1764,7 +1764,7 @@ static void nfs4_state_manager(struct nfs_client *clp)
+ 	} while (atomic_read(&clp->cl_count) > 1);
+ 	return;
+ out_error:
+-	printk(KERN_WARNING "Error: state manager failed on NFSv4 server %s"
++	pr_warn_ratelimited("NFS: state manager failed on NFSv4 server %s"
+ 			" with error %d\n", clp->cl_hostname, -status);
+ 	nfs4_end_drain_session(clp);
+ 	nfs4_clear_state_manager_bit(clp);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0106-PM-Hibernate-Enable-usermodehelpers-in-hibernate-err.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0106-PM-Hibernate-Enable-usermodehelpers-in-hibernate-err.patch
new file mode 100644
index 0000000..8cd543c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0106-PM-Hibernate-Enable-usermodehelpers-in-hibernate-err.patch
@@ -0,0 +1,55 @@
+From 17b1d0787c9eea1fffe5432c14f53066ad2ff0c6 Mon Sep 17 00:00:00 2001
+From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
+Date: Fri, 17 Feb 2012 23:39:51 +0100
+Subject: [PATCH 106/147] PM / Hibernate: Enable usermodehelpers in
+ hibernate() error path
+
+commit 05b4877f6a4f1ba4952d1222213d262bf8c132b7 upstream.
+
+If create_basic_memory_bitmaps() fails, usermodehelpers are not re-enabled
+before returning. Fix this. And while at it, reword the goto labels so that
+they look more meaningful.
+
+Signed-off-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/power/hibernate.c |    7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
+index 624538a..7c0d578 100644
+--- a/kernel/power/hibernate.c
++++ b/kernel/power/hibernate.c
+@@ -648,7 +648,7 @@ int hibernate(void)
+ 	/* Allocate memory management structures */
+ 	error = create_basic_memory_bitmaps();
+ 	if (error)
+-		goto Exit;
++		goto Enable_umh;
+ 
+ 	printk(KERN_INFO "PM: Syncing filesystems ... ");
+ 	sys_sync();
+@@ -656,7 +656,7 @@ int hibernate(void)
+ 
+ 	error = prepare_processes();
+ 	if (error)
+-		goto Finish;
++		goto Free_bitmaps;
+ 
+ 	error = hibernation_snapshot(hibernation_mode == HIBERNATION_PLATFORM);
+ 	if (error)
+@@ -689,8 +689,9 @@ int hibernate(void)
+ 
+  Thaw:
+ 	thaw_processes();
+- Finish:
++ Free_bitmaps:
+ 	free_basic_memory_bitmaps();
++ Enable_umh:
+ 	usermodehelper_enable();
+  Exit:
+ 	pm_notifier_call_chain(PM_POST_HIBERNATION);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0107-jbd2-clear-BH_Delay-BH_Unwritten-in-journal_unmap_bu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0107-jbd2-clear-BH_Delay-BH_Unwritten-in-journal_unmap_bu.patch
new file mode 100644
index 0000000..f105047
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0107-jbd2-clear-BH_Delay-BH_Unwritten-in-journal_unmap_bu.patch
@@ -0,0 +1,49 @@
+From aa127d5abf17393b4f75c53be45124307b230542 Mon Sep 17 00:00:00 2001
+From: Eric Sandeen <sandeen@redhat.com>
+Date: Mon, 20 Feb 2012 17:53:01 -0500
+Subject: [PATCH 107/147] jbd2: clear BH_Delay & BH_Unwritten in
+ journal_unmap_buffer
+
+commit 15291164b22a357cb211b618adfef4fa82fc0de3 upstream.
+
+journal_unmap_buffer()'s zap_buffer: code clears a lot of buffer head
+state ala discard_buffer(), but does not touch _Delay or _Unwritten as
+discard_buffer() does.
+
+This can be problematic in some areas of the ext4 code which assume
+that if they have found a buffer marked unwritten or delay, then it's
+a live one.  Perhaps those spots should check whether it is mapped
+as well, but if jbd2 is going to tear down a buffer, let's really
+tear it down completely.
+
+Without this I get some fsx failures on sub-page-block filesystems
+up until v3.2, at which point 4e96b2dbbf1d7e81f22047a50f862555a6cb87cb
+and 189e868fa8fdca702eb9db9d8afc46b5cb9144c9 make the failures go
+away, because buried within that large change is some more flag
+clearing.  I still think it's worth doing in jbd2, since
+->invalidatepage leads here directly, and it's the right place
+to clear away these flags.
+
+Signed-off-by: Eric Sandeen <sandeen@redhat.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/jbd2/transaction.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/fs/jbd2/transaction.c b/fs/jbd2/transaction.c
+index a0e41a4..8267de5 100644
+--- a/fs/jbd2/transaction.c
++++ b/fs/jbd2/transaction.c
+@@ -1948,6 +1948,8 @@ zap_buffer_unlocked:
+ 	clear_buffer_mapped(bh);
+ 	clear_buffer_req(bh);
+ 	clear_buffer_new(bh);
++	clear_buffer_delay(bh);
++	clear_buffer_unwritten(bh);
+ 	bh->b_bdev = NULL;
+ 	return may_free;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0108-ext4-ignore-EXT4_INODE_JOURNAL_DATA-flag-with-delall.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0108-ext4-ignore-EXT4_INODE_JOURNAL_DATA-flag-with-delall.patch
new file mode 100644
index 0000000..3837be5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0108-ext4-ignore-EXT4_INODE_JOURNAL_DATA-flag-with-delall.patch
@@ -0,0 +1,194 @@
+From 9a02204e0d49b5a0717822d1919f90768cef64ff Mon Sep 17 00:00:00 2001
+From: Lukas Czerner <lczerner@redhat.com>
+Date: Mon, 20 Feb 2012 17:53:00 -0500
+Subject: [PATCH 108/147] ext4: ignore EXT4_INODE_JOURNAL_DATA flag with
+ delalloc
+
+commit 3d2b158262826e8b75bbbfb7b97010838dd92ac7 upstream.
+
+Ext4 does not support data journalling with delayed allocation enabled.
+We even do not allow to mount the file system with delayed allocation
+and data journalling enabled, however it can be set via FS_IOC_SETFLAGS
+so we can hit the inode with EXT4_INODE_JOURNAL_DATA set even on file
+system mounted with delayed allocation (default) and that's where
+problem arises. The easies way to reproduce this problem is with the
+following set of commands:
+
+ mkfs.ext4 /dev/sdd
+ mount /dev/sdd /mnt/test1
+ dd if=/dev/zero of=/mnt/test1/file bs=1M count=4
+ chattr +j /mnt/test1/file
+ dd if=/dev/zero of=/mnt/test1/file bs=1M count=4 conv=notrunc
+ chattr -j /mnt/test1/file
+
+Additionally it can be reproduced quite reliably with xfstests 272 and
+269. In fact the above reproducer is a part of test 272.
+
+To fix this we should ignore the EXT4_INODE_JOURNAL_DATA inode flag if
+the file system is mounted with delayed allocation. This can be easily
+done by fixing ext4_should_*_data() functions do ignore data journal
+flag when delalloc is set (suggested by Ted). We also have to set the
+appropriate address space operations for the inode (again, ignoring data
+journal flag if delalloc enabled).
+
+Additionally this commit introduces ext4_inode_journal_mode() function
+because ext4_should_*_data() has already had a lot of common code and
+this change is putting it all into one function so it is easier to
+read.
+
+Successfully tested with xfstests in following configurations:
+
+delalloc + data=ordered
+delalloc + data=writeback
+data=journal
+nodelalloc + data=ordered
+nodelalloc + data=writeback
+nodelalloc + data=journal
+
+Signed-off-by: Lukas Czerner <lczerner@redhat.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ext4/ext4_jbd2.h |   56 ++++++++++++++++++++++++++-------------------------
+ fs/ext4/inode.c     |   36 ++++++++++++++++++++-------------
+ 2 files changed, 51 insertions(+), 41 deletions(-)
+
+diff --git a/fs/ext4/ext4_jbd2.h b/fs/ext4/ext4_jbd2.h
+index 5802fa1..95af6f8 100644
+--- a/fs/ext4/ext4_jbd2.h
++++ b/fs/ext4/ext4_jbd2.h
+@@ -261,43 +261,45 @@ static inline void ext4_update_inode_fsync_trans(handle_t *handle,
+ /* super.c */
+ int ext4_force_commit(struct super_block *sb);
+ 
+-static inline int ext4_should_journal_data(struct inode *inode)
++/*
++ * Ext4 inode journal modes
++ */
++#define EXT4_INODE_JOURNAL_DATA_MODE	0x01 /* journal data mode */
++#define EXT4_INODE_ORDERED_DATA_MODE	0x02 /* ordered data mode */
++#define EXT4_INODE_WRITEBACK_DATA_MODE	0x04 /* writeback data mode */
++
++static inline int ext4_inode_journal_mode(struct inode *inode)
+ {
+ 	if (EXT4_JOURNAL(inode) == NULL)
+-		return 0;
+-	if (!S_ISREG(inode->i_mode))
+-		return 1;
+-	if (test_opt(inode->i_sb, DATA_FLAGS) == EXT4_MOUNT_JOURNAL_DATA)
+-		return 1;
+-	if (ext4_test_inode_flag(inode, EXT4_INODE_JOURNAL_DATA))
+-		return 1;
+-	return 0;
++		return EXT4_INODE_WRITEBACK_DATA_MODE;	/* writeback */
++	/* We do not support data journalling with delayed allocation */
++	if (!S_ISREG(inode->i_mode) ||
++	    test_opt(inode->i_sb, DATA_FLAGS) == EXT4_MOUNT_JOURNAL_DATA)
++		return EXT4_INODE_JOURNAL_DATA_MODE;	/* journal data */
++	if (ext4_test_inode_flag(inode, EXT4_INODE_JOURNAL_DATA) &&
++	    !test_opt(inode->i_sb, DELALLOC))
++		return EXT4_INODE_JOURNAL_DATA_MODE;	/* journal data */
++	if (test_opt(inode->i_sb, DATA_FLAGS) == EXT4_MOUNT_ORDERED_DATA)
++		return EXT4_INODE_ORDERED_DATA_MODE;	/* ordered */
++	if (test_opt(inode->i_sb, DATA_FLAGS) == EXT4_MOUNT_WRITEBACK_DATA)
++		return EXT4_INODE_WRITEBACK_DATA_MODE;	/* writeback */
++	else
++		BUG();
++}
++
++static inline int ext4_should_journal_data(struct inode *inode)
++{
++	return ext4_inode_journal_mode(inode) & EXT4_INODE_JOURNAL_DATA_MODE;
+ }
+ 
+ static inline int ext4_should_order_data(struct inode *inode)
+ {
+-	if (EXT4_JOURNAL(inode) == NULL)
+-		return 0;
+-	if (!S_ISREG(inode->i_mode))
+-		return 0;
+-	if (ext4_test_inode_flag(inode, EXT4_INODE_JOURNAL_DATA))
+-		return 0;
+-	if (test_opt(inode->i_sb, DATA_FLAGS) == EXT4_MOUNT_ORDERED_DATA)
+-		return 1;
+-	return 0;
++	return ext4_inode_journal_mode(inode) & EXT4_INODE_ORDERED_DATA_MODE;
+ }
+ 
+ static inline int ext4_should_writeback_data(struct inode *inode)
+ {
+-	if (EXT4_JOURNAL(inode) == NULL)
+-		return 1;
+-	if (!S_ISREG(inode->i_mode))
+-		return 0;
+-	if (ext4_test_inode_flag(inode, EXT4_INODE_JOURNAL_DATA))
+-		return 0;
+-	if (test_opt(inode->i_sb, DATA_FLAGS) == EXT4_MOUNT_WRITEBACK_DATA)
+-		return 1;
+-	return 0;
++	return ext4_inode_journal_mode(inode) & EXT4_INODE_WRITEBACK_DATA_MODE;
+ }
+ 
+ /*
+diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
+index 9df447f..fbd2ea4 100644
+--- a/fs/ext4/inode.c
++++ b/fs/ext4/inode.c
+@@ -2480,13 +2480,14 @@ static int ext4_da_write_end(struct file *file,
+ 	int write_mode = (int)(unsigned long)fsdata;
+ 
+ 	if (write_mode == FALL_BACK_TO_NONDELALLOC) {
+-		if (ext4_should_order_data(inode)) {
++		switch (ext4_inode_journal_mode(inode)) {
++		case EXT4_INODE_ORDERED_DATA_MODE:
+ 			return ext4_ordered_write_end(file, mapping, pos,
+ 					len, copied, page, fsdata);
+-		} else if (ext4_should_writeback_data(inode)) {
++		case EXT4_INODE_WRITEBACK_DATA_MODE:
+ 			return ext4_writeback_write_end(file, mapping, pos,
+ 					len, copied, page, fsdata);
+-		} else {
++		default:
+ 			BUG();
+ 		}
+ 	}
+@@ -3084,18 +3085,25 @@ static const struct address_space_operations ext4_da_aops = {
+ 
+ void ext4_set_aops(struct inode *inode)
+ {
+-	if (ext4_should_order_data(inode) &&
+-		test_opt(inode->i_sb, DELALLOC))
+-		inode->i_mapping->a_ops = &ext4_da_aops;
+-	else if (ext4_should_order_data(inode))
+-		inode->i_mapping->a_ops = &ext4_ordered_aops;
+-	else if (ext4_should_writeback_data(inode) &&
+-		 test_opt(inode->i_sb, DELALLOC))
+-		inode->i_mapping->a_ops = &ext4_da_aops;
+-	else if (ext4_should_writeback_data(inode))
+-		inode->i_mapping->a_ops = &ext4_writeback_aops;
+-	else
++	switch (ext4_inode_journal_mode(inode)) {
++	case EXT4_INODE_ORDERED_DATA_MODE:
++		if (test_opt(inode->i_sb, DELALLOC))
++			inode->i_mapping->a_ops = &ext4_da_aops;
++		else
++			inode->i_mapping->a_ops = &ext4_ordered_aops;
++		break;
++	case EXT4_INODE_WRITEBACK_DATA_MODE:
++		if (test_opt(inode->i_sb, DELALLOC))
++			inode->i_mapping->a_ops = &ext4_da_aops;
++		else
++			inode->i_mapping->a_ops = &ext4_writeback_aops;
++		break;
++	case EXT4_INODE_JOURNAL_DATA_MODE:
+ 		inode->i_mapping->a_ops = &ext4_journalled_aops;
++		break;
++	default:
++		BUG();
++	}
+ }
+ 
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0109-ext4-fix-race-between-unwritten-extent-conversion-an.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0109-ext4-fix-race-between-unwritten-extent-conversion-an.patch
new file mode 100644
index 0000000..7dd5d50
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0109-ext4-fix-race-between-unwritten-extent-conversion-an.patch
@@ -0,0 +1,90 @@
+From 650bb7d911ba40c634964921badb10e175276089 Mon Sep 17 00:00:00 2001
+From: Jeff Moyer <jmoyer@redhat.com>
+Date: Mon, 20 Feb 2012 17:59:24 -0500
+Subject: [PATCH 109/147] ext4: fix race between unwritten extent conversion
+ and truncate
+
+commit 266991b13890049ee1a6bb95b9817f06339ee3d7 upstream.
+
+The following comment in ext4_end_io_dio caught my attention:
+
+	/* XXX: probably should move into the real I/O completion handler */
+        inode_dio_done(inode);
+
+The truncate code takes i_mutex, then calls inode_dio_wait.  Because the
+ext4 code path above will end up dropping the mutex before it is
+reacquired by the worker thread that does the extent conversion, it
+seems to me that the truncate can happen out of order.  Jan Kara
+mentioned that this might result in error messages in the system logs,
+but that should be the extent of the "damage."
+
+The fix is pretty straight-forward: don't call inode_dio_done until the
+extent conversion is complete.
+
+Reviewed-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Jeff Moyer <jmoyer@redhat.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ext4/ext4.h    |    1 +
+ fs/ext4/inode.c   |   10 +++++-----
+ fs/ext4/page-io.c |    2 ++
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
+index 5b0e26a..655d942 100644
+--- a/fs/ext4/ext4.h
++++ b/fs/ext4/ext4.h
+@@ -184,6 +184,7 @@ struct mpage_da_data {
+ #define	EXT4_IO_END_UNWRITTEN	0x0001
+ #define EXT4_IO_END_ERROR	0x0002
+ #define EXT4_IO_END_QUEUED	0x0004
++#define EXT4_IO_END_DIRECT	0x0008
+ 
+ struct ext4_io_page {
+ 	struct page	*p_page;
+diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
+index fbd2ea4..d0dc109 100644
+--- a/fs/ext4/inode.c
++++ b/fs/ext4/inode.c
+@@ -2794,9 +2794,6 @@ out:
+ 
+ 	/* queue the work to convert unwritten extents to written */
+ 	queue_work(wq, &io_end->work);
+-
+-	/* XXX: probably should move into the real I/O completion handler */
+-	inode_dio_done(inode);
+ }
+ 
+ static void ext4_end_io_buffer_write(struct buffer_head *bh, int uptodate)
+@@ -2920,9 +2917,12 @@ static ssize_t ext4_ext_direct_IO(int rw, struct kiocb *iocb,
+ 		iocb->private = NULL;
+ 		EXT4_I(inode)->cur_aio_dio = NULL;
+ 		if (!is_sync_kiocb(iocb)) {
+-			iocb->private = ext4_init_io_end(inode, GFP_NOFS);
+-			if (!iocb->private)
++			ext4_io_end_t *io_end =
++				ext4_init_io_end(inode, GFP_NOFS);
++			if (!io_end)
+ 				return -ENOMEM;
++			io_end->flag |= EXT4_IO_END_DIRECT;
++			iocb->private = io_end;
+ 			/*
+ 			 * we save the io structure for current async
+ 			 * direct IO, so that later ext4_map_blocks()
+diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
+index 7e106c8..924298a 100644
+--- a/fs/ext4/page-io.c
++++ b/fs/ext4/page-io.c
+@@ -111,6 +111,8 @@ int ext4_end_io_nolock(ext4_io_end_t *io)
+ 	if (io->iocb)
+ 		aio_complete(io->iocb, io->result, 0);
+ 
++	if (io->flag & EXT4_IO_END_DIRECT)
++		inode_dio_done(inode);
+ 	/* Wake up anyone waiting on unwritten extent conversion */
+ 	if (atomic_dec_and_test(&EXT4_I(inode)->i_aiodio_unwritten))
+ 		wake_up_all(ext4_ioend_wq(io->inode));
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0110-ext4-fix-race-between-sync-and-completed-io-work.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0110-ext4-fix-race-between-sync-and-completed-io-work.patch
new file mode 100644
index 0000000..fa0f39e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0110-ext4-fix-race-between-sync-and-completed-io-work.patch
@@ -0,0 +1,119 @@
+From 4eb9698d0d2e5fb6c0cd910ed3e86154b4d1ea92 Mon Sep 17 00:00:00 2001
+From: Jeff Moyer <jmoyer@redhat.com>
+Date: Mon, 5 Mar 2012 10:29:52 -0500
+Subject: [PATCH 110/147] ext4: fix race between sync and completed io work
+
+commit 491caa43639abcffaa645fbab372a7ef4ce2975c upstream.
+
+The following command line will leave the aio-stress process unkillable
+on an ext4 file system (in my case, mounted on /mnt/test):
+
+aio-stress -t 20 -s 10 -O -S -o 2 -I 1000 /mnt/test/aiostress.3561.4 /mnt/test/aiostress.3561.4.20 /mnt/test/aiostress.3561.4.19 /mnt/test/aiostress.3561.4.18 /mnt/test/aiostress.3561.4.17 /mnt/test/aiostress.3561.4.16 /mnt/test/aiostress.3561.4.15 /mnt/test/aiostress.3561.4.14 /mnt/test/aiostress.3561.4.13 /mnt/test/aiostress.3561.4.12 /mnt/test/aiostress.3561.4.11 /mnt/test/aiostress.3561.4.10 /mnt/test/aiostress.3561.4.9 /mnt/test/aiostress.3561.4.8 /mnt/test/aiostress.3561.4.7 /mnt/test/aiostress.3561.4.6 /mnt/test/aiostress.3561.4.5 /mnt/test/aiostress.3561.4.4 /mnt/test/aiostress.3561.4.3 /mnt/test/aiostress.3561.4.2
+
+This is using the aio-stress program from the xfstests test suite.
+That particular command line tells aio-stress to do random writes to
+20 files from 20 threads (one thread per file).  The files are NOT
+preallocated, so you will get writes to random offsets within the
+file, thus creating holes and extending i_size.  It also opens the
+file with O_DIRECT and O_SYNC.
+
+On to the problem.  When an I/O requires unwritten extent conversion,
+it is queued onto the completed_io_list for the ext4 inode.  Two code
+paths will pull work items from this list.  The first is the
+ext4_end_io_work routine, and the second is ext4_flush_completed_IO,
+which is called via the fsync path (and O_SYNC handling, as well).
+There are two issues I've found in these code paths.  First, if the
+fsync path beats the work routine to a particular I/O, the work
+routine will free the io_end structure!  It does not take into account
+the fact that the io_end may still be in use by the fsync path.  I've
+fixed this issue by adding yet another IO_END flag, indicating that
+the io_end is being processed by the fsync path.
+
+The second problem is that the work routine will make an assignment to
+io->flag outside of the lock.  I have witnessed this result in a hang
+at umount.  Moving the flag setting inside the lock resolved that
+problem.
+
+The problem was introduced by commit b82e384c7b ("ext4: optimize
+locking for end_io extent conversion"), which first appeared in 3.2.
+As such, the fix should be backported to that release (probably along
+with the unwritten extent conversion race fix).
+
+Signed-off-by: Jeff Moyer <jmoyer@redhat.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ext4/ext4.h    |    1 +
+ fs/ext4/fsync.c   |    2 ++
+ fs/ext4/page-io.c |    9 +++++++--
+ 3 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
+index 655d942..dbae4d9 100644
+--- a/fs/ext4/ext4.h
++++ b/fs/ext4/ext4.h
+@@ -185,6 +185,7 @@ struct mpage_da_data {
+ #define EXT4_IO_END_ERROR	0x0002
+ #define EXT4_IO_END_QUEUED	0x0004
+ #define EXT4_IO_END_DIRECT	0x0008
++#define EXT4_IO_END_IN_FSYNC	0x0010
+ 
+ struct ext4_io_page {
+ 	struct page	*p_page;
+diff --git a/fs/ext4/fsync.c b/fs/ext4/fsync.c
+index 00a2cb7..bb6c7d8 100644
+--- a/fs/ext4/fsync.c
++++ b/fs/ext4/fsync.c
+@@ -89,6 +89,7 @@ int ext4_flush_completed_IO(struct inode *inode)
+ 		io = list_entry(ei->i_completed_io_list.next,
+ 				ext4_io_end_t, list);
+ 		list_del_init(&io->list);
++		io->flag |= EXT4_IO_END_IN_FSYNC;
+ 		/*
+ 		 * Calling ext4_end_io_nolock() to convert completed
+ 		 * IO to written.
+@@ -108,6 +109,7 @@ int ext4_flush_completed_IO(struct inode *inode)
+ 		if (ret < 0)
+ 			ret2 = ret;
+ 		spin_lock_irqsave(&ei->i_completed_io_lock, flags);
++		io->flag &= ~EXT4_IO_END_IN_FSYNC;
+ 	}
+ 	spin_unlock_irqrestore(&ei->i_completed_io_lock, flags);
+ 	return (ret2 < 0) ? ret2 : 0;
+diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
+index 924298a..24feb1c 100644
+--- a/fs/ext4/page-io.c
++++ b/fs/ext4/page-io.c
+@@ -130,12 +130,18 @@ static void ext4_end_io_work(struct work_struct *work)
+ 	unsigned long		flags;
+ 
+ 	spin_lock_irqsave(&ei->i_completed_io_lock, flags);
++	if (io->flag & EXT4_IO_END_IN_FSYNC)
++		goto requeue;
+ 	if (list_empty(&io->list)) {
+ 		spin_unlock_irqrestore(&ei->i_completed_io_lock, flags);
+ 		goto free;
+ 	}
+ 
+ 	if (!mutex_trylock(&inode->i_mutex)) {
++		bool was_queued;
++requeue:
++		was_queued = !!(io->flag & EXT4_IO_END_QUEUED);
++		io->flag |= EXT4_IO_END_QUEUED;
+ 		spin_unlock_irqrestore(&ei->i_completed_io_lock, flags);
+ 		/*
+ 		 * Requeue the work instead of waiting so that the work
+@@ -148,9 +154,8 @@ static void ext4_end_io_work(struct work_struct *work)
+ 		 * yield the cpu if it sees an end_io request that has already
+ 		 * been requeued.
+ 		 */
+-		if (io->flag & EXT4_IO_END_QUEUED)
++		if (was_queued)
+ 			yield();
+-		io->flag |= EXT4_IO_END_QUEUED;
+ 		return;
+ 	}
+ 	list_del_init(&io->list);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0111-ext4-check-for-zero-length-extent.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0111-ext4-check-for-zero-length-extent.patch
new file mode 100644
index 0000000..4a83f03
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0111-ext4-check-for-zero-length-extent.patch
@@ -0,0 +1,41 @@
+From 3a71b922c02de36168d14ec55a97582f3fec2e07 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Sun, 11 Mar 2012 23:30:16 -0400
+Subject: [PATCH 111/147] ext4: check for zero length extent
+
+commit 31d4f3a2f3c73f279ff96a7135d7202ef6833f12 upstream.
+
+Explicitly test for an extent whose length is zero, and flag that as a
+corrupted extent.
+
+This avoids a kernel BUG_ON assertion failure.
+
+Tested: Without this patch, the file system image found in
+tests/f_ext_zero_len/image.gz in the latest e2fsprogs sources causes a
+kernel panic.  With this patch, an ext4 file system error is noted
+instead, and the file system is marked as being corrupted.
+
+https://bugzilla.kernel.org/show_bug.cgi?id=42859
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ext4/extents.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
+index 607b155..7507036 100644
+--- a/fs/ext4/extents.c
++++ b/fs/ext4/extents.c
+@@ -301,6 +301,8 @@ static int ext4_valid_extent(struct inode *inode, struct ext4_extent *ext)
+ 	ext4_fsblk_t block = ext4_ext_pblock(ext);
+ 	int len = ext4_ext_get_actual_len(ext);
+ 
++	if (len == 0)
++		return 0;
+ 	return ext4_data_block_valid(EXT4_SB(inode->i_sb), block, len);
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0112-vfs-fix-d_ancestor-case-in-d_materialize_unique.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0112-vfs-fix-d_ancestor-case-in-d_materialize_unique.patch
new file mode 100644
index 0000000..333e3bd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0112-vfs-fix-d_ancestor-case-in-d_materialize_unique.patch
@@ -0,0 +1,54 @@
+From 1287e09097b8199407c64d26e9a3ce1a1b25da74 Mon Sep 17 00:00:00 2001
+From: Michel Lespinasse <walken@google.com>
+Date: Mon, 26 Mar 2012 17:32:44 -0700
+Subject: [PATCH 112/147] vfs: fix d_ancestor() case in d_materialize_unique
+
+commit b18dafc86bb879d2f38a1743985d7ceb283c2f4d upstream.
+
+In d_materialise_unique() there are 3 subcases to the 'aliased dentry'
+case; in two subcases the inode i_lock is properly released but this
+does not occur in the -ELOOP subcase.
+
+This seems to have been introduced by commit 1836750115f2 ("fix loop
+checks in d_materialise_unique()").
+
+Signed-off-by: Michel Lespinasse <walken@google.com>
+[ Added a comment, and moved the unlock to where we generate the -ELOOP,
+  which seems to be more natural.
+
+  You probably can't actually trigger this without a buggy network file
+  server - d_materialize_unique() is for finding aliases on non-local
+  filesystems, and the d_ancestor() case is for a hardlinked directory
+  loop.
+
+  But we should be robust in the case of such buggy servers anyway. ]
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/dcache.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/fs/dcache.c b/fs/dcache.c
+index f7908ae..eb723d3 100644
+--- a/fs/dcache.c
++++ b/fs/dcache.c
+@@ -2357,6 +2357,7 @@ struct dentry *d_materialise_unique(struct dentry *dentry, struct inode *inode)
+ 			if (d_ancestor(alias, dentry)) {
+ 				/* Check for loops */
+ 				actual = ERR_PTR(-ELOOP);
++				spin_unlock(&inode->i_lock);
+ 			} else if (IS_ROOT(alias)) {
+ 				/* Is this an anonymous mountpoint that we
+ 				 * could splice into our tree? */
+@@ -2366,7 +2367,7 @@ struct dentry *d_materialise_unique(struct dentry *dentry, struct inode *inode)
+ 				goto found;
+ 			} else {
+ 				/* Nope, but we must(!) avoid directory
+-				 * aliasing */
++				 * aliasing. This drops inode->i_lock */
+ 				actual = __d_unalias(inode, dentry, alias);
+ 			}
+ 			write_sequnlock(&rename_lock);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0113-ARM-tegra-select-required-CPU-and-L2-errata-options.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0113-ARM-tegra-select-required-CPU-and-L2-errata-options.patch
new file mode 100644
index 0000000..88fa555
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0113-ARM-tegra-select-required-CPU-and-L2-errata-options.patch
@@ -0,0 +1,56 @@
+From b125bf4a63e80e83526c1e1f775446078c91374f Mon Sep 17 00:00:00 2001
+From: Stephen Warren <swarren@nvidia.com>
+Date: Tue, 14 Feb 2012 13:39:39 -0700
+Subject: [PATCH 113/147] ARM: tegra: select required CPU and L2 errata
+ options
+
+commit f35b431dde39fb40944d1024f08d88fbf04a3193 upstream.
+
+The ARM IP revisions in Tegra are:
+Tegra20: CPU r1p1, PL310 r2p0
+Tegra30: CPU A01=r2p7/>=A02=r2p9, NEON r2p3-50, PL310 r3p1-50
+
+Based on work by Olof Johansson, although the actual list of errata is
+somewhat different here, since I added a bunch more and removed one PL310
+erratum that doesn't seem applicable.
+
+Signed-off-by: Stephen Warren <swarren@nvidia.com>
+Signed-off-by: Olof Johansson <olof@lixom.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mach-tegra/Kconfig |   12 ++++++++++++
+ 1 file changed, 12 insertions(+)
+
+diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
+index 91aff7c..dbc59fa 100644
+--- a/arch/arm/mach-tegra/Kconfig
++++ b/arch/arm/mach-tegra/Kconfig
+@@ -13,6 +13,13 @@ config ARCH_TEGRA_2x_SOC
+ 	select USB_ARCH_HAS_EHCI if USB_SUPPORT
+ 	select USB_ULPI if USB_SUPPORT
+ 	select USB_ULPI_VIEWPORT if USB_SUPPORT
++	select ARM_ERRATA_720789
++	select ARM_ERRATA_742230
++	select ARM_ERRATA_751472
++	select ARM_ERRATA_754327
++	select ARM_ERRATA_764369
++	select PL310_ERRATA_727915 if CACHE_L2X0
++	select PL310_ERRATA_769419 if CACHE_L2X0
+ 	help
+ 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
+ 	  ARM CortexA9MP CPU and the ARM PL310 L2 cache controller
+@@ -54,6 +61,11 @@ config MACH_SEABOARD
+ config MACH_TEGRA_DT
+ 	bool "Generic Tegra board (FDT support)"
+ 	select USE_OF
++	select ARM_ERRATA_743622
++	select ARM_ERRATA_751472
++	select ARM_ERRATA_754322
++	select ARM_ERRATA_764369
++	select PL310_ERRATA_769419 if CACHE_L2X0
+ 	help
+ 	  Support for generic nVidia Tegra boards using Flattened Device Tree
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0114-udf-Fix-deadlock-in-udf_release_file.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0114-udf-Fix-deadlock-in-udf_release_file.patch
new file mode 100644
index 0000000..ae80b76
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0114-udf-Fix-deadlock-in-udf_release_file.patch
@@ -0,0 +1,40 @@
+From e812277ff9241a705c2a789f889aab4d1c26c31c Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Mon, 20 Feb 2012 17:49:56 +0100
+Subject: [PATCH 114/147] udf: Fix deadlock in udf_release_file()
+
+commit a0391a3ae91d301c0e59368531a4de5f0b122bcf upstream.
+
+udf_release_file() can be called from munmap() path with mmap_sem held.  Thus
+we cannot take i_mutex there because that ranks above mmap_sem. Luckily,
+i_mutex is not needed in udf_release_file() anymore since protection by
+i_data_sem is enough to protect from races with write and truncate.
+
+Reported-by: Al Viro <viro@ZenIV.linux.org.uk>
+Reviewed-by: Namjae Jeon <linkinjeon@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/udf/file.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/fs/udf/file.c b/fs/udf/file.c
+index dca0c38..d567b84 100644
+--- a/fs/udf/file.c
++++ b/fs/udf/file.c
+@@ -201,12 +201,10 @@ out:
+ static int udf_release_file(struct inode *inode, struct file *filp)
+ {
+ 	if (filp->f_mode & FMODE_WRITE) {
+-		mutex_lock(&inode->i_mutex);
+ 		down_write(&UDF_I(inode)->i_data_sem);
+ 		udf_discard_prealloc(inode);
+ 		udf_truncate_tail_extent(inode);
+ 		up_write(&UDF_I(inode)->i_data_sem);
+-		mutex_unlock(&inode->i_mutex);
+ 	}
+ 	return 0;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0115-gpio-omap-fix-_set_gpio_irqenable-implementation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0115-gpio-omap-fix-_set_gpio_irqenable-implementation.patch
new file mode 100644
index 0000000..03e2035
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0115-gpio-omap-fix-_set_gpio_irqenable-implementation.patch
@@ -0,0 +1,41 @@
+From 5f5e1bcdbe3347e680007e30b5848a8a3826f68b Mon Sep 17 00:00:00 2001
+From: Tarun Kanti DebBarma <tarun.kanti@ti.com>
+Date: Fri, 25 Nov 2011 15:27:37 +0530
+Subject: [PATCH 115/147] gpio/omap: fix _set_gpio_irqenable implementation
+
+commit 8276536cec38bc6bde30d0aa67716f22b9b9705a upstream.
+
+This function should be capable of both enabling and disabling interrupts
+based upon the *enable* parameter. Right now the function only enables
+the interrupt and *enable* is not used at all. So add the interrupt
+disable capability also using the parameter.
+
+Signed-off-by: Tarun Kanti DebBarma <tarun.kanti@ti.com>
+Reviewed-by: Santosh Shilimkar <santosh.shilimkar@ti.com>
+Acked-by: Felipe Balbi <balbi@ti.com>
+Reviewed-by: Kevin Hilman <khilman@ti.com>
+Signed-off-by: Kevin Hilman <khilman@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpio/gpio-omap.c |    5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
+index 4b172446..7fe6897 100644
+--- a/drivers/gpio/gpio-omap.c
++++ b/drivers/gpio/gpio-omap.c
+@@ -511,7 +511,10 @@ static void _disable_gpio_irqbank(struct gpio_bank *bank, int gpio_mask)
+ 
+ static inline void _set_gpio_irqenable(struct gpio_bank *bank, int gpio, int enable)
+ {
+-	_enable_gpio_irqbank(bank, GPIO_BIT(bank, gpio));
++	if (enable)
++		_enable_gpio_irqbank(bank, GPIO_BIT(bank, gpio));
++	else
++		_disable_gpio_irqbank(bank, GPIO_BIT(bank, gpio));
+ }
+ 
+ /*
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0116-gpio-davinci-fix-oops-on-unbanked-gpio-irq-request.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0116-gpio-davinci-fix-oops-on-unbanked-gpio-irq-request.patch
new file mode 100644
index 0000000..a6cd5ec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0116-gpio-davinci-fix-oops-on-unbanked-gpio-irq-request.patch
@@ -0,0 +1,152 @@
+From e91fedbcc83a758adab48636c9ba73338326a3b7 Mon Sep 17 00:00:00 2001
+From: Sekhar Nori <nsekhar@ti.com>
+Date: Sun, 11 Mar 2012 18:16:11 +0530
+Subject: [PATCH 116/147] gpio/davinci: fix oops on unbanked gpio irq request
+
+commit ab2dde9924dd1ddb791fa8b14aa52e1df681e20c upstream.
+
+Unbanked GPIO irq setup code was overwriting chip_data leading
+to the following oops on request_irq()
+
+Unable to handle kernel paging request at virtual address febfffff
+pgd = c22dc000
+[febfffff] *pgd=00000000
+Internal error: Oops: 801 [#1] PREEMPT
+Modules linked in: mcu(+) edmak irqk cmemk
+CPU: 0    Not tainted  (3.0.0-rc7+ #93)
+PC is at irq_gc_mask_set_bit+0x68/0x7c
+LR is at vprintk+0x22c/0x484
+pc : [<c0080c0c>]    lr : [<c00457e0>]    psr: 60000093
+sp : c33e3ba0  ip : c33e3af0  fp : c33e3bc4
+r10: c04555bc  r9 : c33d4340  r8 : 60000013
+r7 : 0000002d  r6 : c04555bc  r5 : fec67010  r4 : 00000000
+r3 : c04734c8  r2 : fec00000  r1 : ffffffff  r0 : 00000026
+Flags: nZCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment user
+Control: 0005317f  Table: 822dc000  DAC: 00000015
+Process modprobe (pid: 526, stack limit = 0xc33e2270)
+Stack: (0xc33e3ba0 to 0xc33e4000)
+3ba0: 00000000 c007d3d4 c33e3bcc c04555bc c04555bc c33d4340 c33e3bdc c33e3bc8
+3bc0: c007f5f8 c0080bb4 00000000 c04555bc c33e3bf4 c33e3be0 c007f654 c007f5c0
+3be0: 00000000 c04555bc c33e3c24 c33e3bf8 c007e6e8 c007f618 c01f2284 c0350af8
+3c00: c0405214 bf016c98 00000001 00000000 c33dc008 0000002d c33e3c54 c33e3c28
+3c20: c007e888 c007e408 00000001 c23ef880 c33dc000 00000000 c33dc080 c25caa00
+3c40: c0487498 bf017078 c33e3c94 c33e3c58 bf016b44 c007e7d4 bf017078 c33dc008
+3c60: c25caa08 c33dc008 c33e3c84 bf017484 c25caa00 c25caa00 c01f5f48 c25caa08
+3c80: c0496d60 bf017484 c33e3ca4 c33e3c98 c022a698 bf01692c c33e3cd4 c33e3ca8
+3ca0: c01f5d88 c022a688 00000000 bf017484 c25caa00 c25caa00 c01f5f48 c25caa08
+3cc0: c0496d60 00000000 c33e3cec c33e3cd8 c01f5f8c c01f5d10 00000000 c33e3cf0
+3ce0: c33e3d14 c33e3cf0 c01f5210 c01f5f58 c303cb48 c25ecf94 c25caa00 c25caa00
+3d00: c25caa34 c33e3dd8 c33e3d34 c33e3d18 c01f6044 c01f51b8 c0496d3c c25caa00
+3d20: c044e918 c33e3dd8 c33e3d44 c33e3d38 c01f4ff4 c01f5fcc c33e3d94 c33e3d48
+3d40: c01f3d10 c01f4fd8 00000000 c044e918 00000000 00000000 c01f52c0 c034d570
+3d60: c33e3d84 c33e3d70 c022bf84 c25caa00 00000000 c044e918 c33e3dd8 c25c2e00
+3d80: c0496d60 bf01763c c33e3db4 c33e3d98 c022b1a0 c01f384c c25caa00 c33e3dd8
+3da0: 00000000 c33e3dd8 c33e3dd4 c33e3db8 c022b27c c022b0e8 00000000 bf01763c
+3dc0: c0451c80 c33e3dd8 c33e3e34 c33e3dd8 bf016f60 c022b210 5f75636d 746e6f63
+3de0: 006c6f72 00000000 00000000 00000000 00000000 00000000 00000000 bf0174bc
+3e00: 00000000 00989680 00000000 00000020 c0451c80 c0451c80 bf0174dc c01f5eb0
+3e20: c33f0f00 bf0174dc c33e3e44 c33e3e38 c01f72f4 bf016e2c c33e3e74 c33e3e48
+3e40: c01f5d88 c01f72e4 00000000 c0451c80 c0451cb4 bf0174dc c01f5eb0 c33f0f00
+3e60: c0473100 00000000 c33e3e94 c33e3e78 c01f5f44 c01f5d10 00000000 c33e3e98
+3e80: bf0174dc c01f5eb0 c33e3ebc c33e3e98 c01f5534 c01f5ec0 c303c038 c3061c30
+3ea0: 00003cd8 00098258 bf0174dc c0462ac8 c33e3ecc c33e3ec0 c01f5bec c01f54dc
+3ec0: c33e3efc c33e3ed0 c01f4d30 c01f5bdc bf0173a0 c33e2000 00003cd8 00098258
+3ee0: bf0174dc c33e2000 c00301a4 bf019000 c33e3f1c c33e3f00 c01f6588 c01f4c8c
+3f00: 00003cd8 00098258 00000000 c33e2000 c33e3f2c c33e3f20 c01f777c c01f6524
+3f20: c33e3f3c c33e3f30 bf019014 c01f7740 c33e3f7c c33e3f40 c002f3ec bf019010
+3f40: 00000000 00003cd8 00098258 bf017518 00000000 00003cd8 00098258 bf017518
+3f60: 00000000 c00301a4 c33e2000 00000000 c33e3fa4 c33e3f80 c007b934 c002f3c4
+3f80: c00b307c c00b2f48 00003cd8 00000000 00000003 00000080 00000000 c33e3fa8
+3fa0: c0030020 c007b8b8 00003cd8 00000000 00098288 00003cd8 00098258 00098240
+3fc0: 00003cd8 00000000 00000003 00000080 00098008 00098028 00098288 00000001
+3fe0: be892998 be892988 00013d7c 40178740 60000010 00098288 09089041 00200845
+Backtrace:
+[<c0080ba4>] (irq_gc_mask_set_bit+0x0/0x7c) from [<c007f5f8>] (irq_enable+0x48/0x58)
+ r6:c33d4340 r5:c04555bc r4:c04555bc
+[<c007f5b0>] (irq_enable+0x0/0x58) from [<c007f654>] (irq_startup+0x4c/0x54)
+ r5:c04555bc r4:00000000
+[<c007f608>] (irq_startup+0x0/0x54) from [<c007e6e8>] (__setup_irq+0x2f0/0x3cc)
+ r5:c04555bc r4:00000000
+[<c007e3f8>] (__setup_irq+0x0/0x3cc) from [<c007e888>] (request_threaded_irq+0xc4/0x110)
+ r8:0000002d r7:c33dc008 r6:00000000 r5:00000001 r4:bf016c98
+[<c007e7c4>] (request_threaded_irq+0x0/0x110) from [<bf016b44>] (mcu_spi_probe+0x228/0x37c [mcu])
+[<bf01691c>] (mcu_spi_probe+0x0/0x37c [mcu]) from [<c022a698>] (spi_drv_probe+0x20/0x24)
+[<c022a678>] (spi_drv_probe+0x0/0x24) from [<c01f5d88>] (driver_probe_device+0x88/0x1b0)
+[<c01f5d00>] (driver_probe_device+0x0/0x1b0) from [<c01f5f8c>] (__device_attach+0x44/0x48)
+[<c01f5f48>] (__device_attach+0x0/0x48) from [<c01f5210>] (bus_for_each_drv+0x68/0x94)
+ r5:c33e3cf0 r4:00000000
+[<c01f51a8>] (bus_for_each_drv+0x0/0x94) from [<c01f6044>] (device_attach+0x88/0xa0)
+ r7:c33e3dd8 r6:c25caa34 r5:c25caa00 r4:c25caa00
+[<c01f5fbc>] (device_attach+0x0/0xa0) from [<c01f4ff4>] (bus_probe_device+0x2c/0x4c)
+ r7:c33e3dd8 r6:c044e918 r5:c25caa00 r4:c0496d3c
+[<c01f4fc8>] (bus_probe_device+0x0/0x4c) from [<c01f3d10>] (device_add+0x4d4/0x648)
+[<c01f383c>] (device_add+0x0/0x648) from [<c022b1a0>] (spi_add_device+0xc8/0x128)
+[<c022b0d8>] (spi_add_device+0x0/0x128) from [<c022b27c>] (spi_new_device+0x7c/0xb4)
+ r7:c33e3dd8 r6:00000000 r5:c33e3dd8 r4:c25caa00
+[<c022b200>] (spi_new_device+0x0/0xb4) from [<bf016f60>] (mcu_probe+0x144/0x224 [mcu])
+ r7:c33e3dd8 r6:c0451c80 r5:bf01763c r4:00000000
+[<bf016e1c>] (mcu_probe+0x0/0x224 [mcu]) from [<c01f72f4>] (platform_drv_probe+0x20/0x24)
+[<c01f72d4>] (platform_drv_probe+0x0/0x24) from [<c01f5d88>] (driver_probe_device+0x88/0x1b0)
+[<c01f5d00>] (driver_probe_device+0x0/0x1b0) from [<c01f5f44>] (__driver_attach+0x94/0x98)
+[<c01f5eb0>] (__driver_attach+0x0/0x98) from [<c01f5534>] (bus_for_each_dev+0x68/0x94)
+ r7:c01f5eb0 r6:bf0174dc r5:c33e3e98 r4:00000000
+[<c01f54cc>] (bus_for_each_dev+0x0/0x94) from [<c01f5bec>] (driver_attach+0x20/0x28)
+ r7:c0462ac8 r6:bf0174dc r5:00098258 r4:00003cd8
+[<c01f5bcc>] (driver_attach+0x0/0x28) from [<c01f4d30>] (bus_add_driver+0xb4/0x258)
+[<c01f4c7c>] (bus_add_driver+0x0/0x258) from [<c01f6588>] (driver_register+0x74/0x158)
+[<c01f6514>] (driver_register+0x0/0x158) from [<c01f777c>] (platform_driver_register+0x4c/0x60)
+ r7:c33e2000 r6:00000000 r5:00098258 r4:00003cd8
+[<c01f7730>] (platform_driver_register+0x0/0x60) from [<bf019014>] (mcu_init+0x14/0x20 [mcu])
+[<bf019000>] (mcu_init+0x0/0x20 [mcu]) from [<c002f3ec>] (do_one_initcall+0x38/0x170)
+[<c002f3b4>] (do_one_initcall+0x0/0x170) from [<c007b934>] (sys_init_module+0x8c/0x1a4)
+[<c007b8a8>] (sys_init_module+0x0/0x1a4) from [<c0030020>] (ret_fast_syscall+0x0/0x2c)
+ r7:00000080 r6:00000003 r5:00000000 r4:00003cd8
+Code: e1844003 e585400c e596300c e5932064 (e7814002)
+
+Fix the issue.
+
+Reported-by: Jon Povey <Jon.Povey@racelogic.co.uk>
+Signed-off-by: Sekhar Nori <nsekhar@ti.com>
+Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpio/gpio-davinci.c |   15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
+index df0d595..a6777e5 100644
+--- a/drivers/gpio/gpio-davinci.c
++++ b/drivers/gpio/gpio-davinci.c
+@@ -313,10 +313,16 @@ static int gpio_to_irq_unbanked(struct gpio_chip *chip, unsigned offset)
+ 		return -ENODEV;
+ }
+ 
+-static int gpio_irq_type_unbanked(struct irq_data *d, unsigned trigger)
++static int gpio_irq_type_unbanked(struct irq_data *data, unsigned trigger)
+ {
+-	struct davinci_gpio_regs __iomem *g = irq2regs(d->irq);
+-	u32 mask = (u32) irq_data_get_irq_handler_data(d);
++	struct davinci_gpio_controller *d;
++	struct davinci_gpio_regs __iomem *g;
++	struct davinci_soc_info *soc_info = &davinci_soc_info;
++	u32 mask;
++
++	d = (struct davinci_gpio_controller *)data->handler_data;
++	g = (struct davinci_gpio_regs __iomem *)d->regs;
++	mask = __gpio_mask(data->irq - soc_info->gpio_irq);
+ 
+ 	if (trigger & ~(IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
+ 		return -EINVAL;
+@@ -400,8 +406,7 @@ static int __init davinci_gpio_irq_setup(void)
+ 		/* set the direct IRQs up to use that irqchip */
+ 		for (gpio = 0; gpio < soc_info->gpio_unbanked; gpio++, irq++) {
+ 			irq_set_chip(irq, &gpio_irqchip_unbanked);
+-			irq_set_handler_data(irq, (void *)__gpio_mask(gpio));
+-			irq_set_chip_data(irq, (__force void *)g);
++			irq_set_handler_data(irq, &chips[gpio / 32]);
+ 			irq_set_status_flags(irq, IRQ_TYPE_EDGE_BOTH);
+ 		}
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0117-gpio-davinci-fix-enabling-unbanked-GPIO-IRQs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0117-gpio-davinci-fix-enabling-unbanked-GPIO-IRQs.patch
new file mode 100644
index 0000000..2a1370e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0117-gpio-davinci-fix-enabling-unbanked-GPIO-IRQs.patch
@@ -0,0 +1,65 @@
+From a61e7db31913671e7951ed217dc0012f8578c977 Mon Sep 17 00:00:00 2001
+From: Sekhar Nori <nsekhar@ti.com>
+Date: Sun, 11 Mar 2012 18:16:12 +0530
+Subject: [PATCH 117/147] gpio/davinci: fix enabling unbanked GPIO IRQs
+
+commit 81b279d80a63628e580c71a31d30a8c3b3047ad4 upstream.
+
+Unbanked GPIO IRQ handling code made a copy of just
+the irq_chip structure for GPIO IRQ lines which caused
+problems after the generic IRQ chip conversion because
+there was no valid irq_chip_type structure with the
+right "regs" populated. irq_gc_mask_set_bit() was
+therefore accessing random addresses.
+
+Fix it by making a copy of irq_chip_type structure
+instead. This will ensure sane register offsets.
+
+Reported-by: Jon Povey <Jon.Povey@racelogic.co.uk>
+Tested-by: Jon Povey <Jon.Povey@racelogic.co.uk>
+Signed-off-by: Sekhar Nori <nsekhar@ti.com>
+Signed-off-by: Grant Likely <grant.likely@secretlab.ca>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpio/gpio-davinci.c |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
+index a6777e5..3d00016 100644
+--- a/drivers/gpio/gpio-davinci.c
++++ b/drivers/gpio/gpio-davinci.c
+@@ -386,7 +386,7 @@ static int __init davinci_gpio_irq_setup(void)
+ 	 * IRQ mux conflicts; gpio_irq_type_unbanked() is only for GPIOs.
+ 	 */
+ 	if (soc_info->gpio_unbanked) {
+-		static struct irq_chip gpio_irqchip_unbanked;
++		static struct irq_chip_type gpio_unbanked;
+ 
+ 		/* pass "bank 0" GPIO IRQs to AINTC */
+ 		chips[0].chip.to_irq = gpio_to_irq_unbanked;
+@@ -394,9 +394,10 @@ static int __init davinci_gpio_irq_setup(void)
+ 
+ 		/* AINTC handles mask/unmask; GPIO handles triggering */
+ 		irq = bank_irq;
+-		gpio_irqchip_unbanked = *irq_get_chip(irq);
+-		gpio_irqchip_unbanked.name = "GPIO-AINTC";
+-		gpio_irqchip_unbanked.irq_set_type = gpio_irq_type_unbanked;
++		gpio_unbanked = *container_of(irq_get_chip(irq),
++					      struct irq_chip_type, chip);
++		gpio_unbanked.chip.name = "GPIO-AINTC";
++		gpio_unbanked.chip.irq_set_type = gpio_irq_type_unbanked;
+ 
+ 		/* default trigger: both edges */
+ 		g = gpio2regs(0);
+@@ -405,7 +406,7 @@ static int __init davinci_gpio_irq_setup(void)
+ 
+ 		/* set the direct IRQs up to use that irqchip */
+ 		for (gpio = 0; gpio < soc_info->gpio_unbanked; gpio++, irq++) {
+-			irq_set_chip(irq, &gpio_irqchip_unbanked);
++			irq_set_chip(irq, &gpio_unbanked.chip);
+ 			irq_set_handler_data(irq, &chips[gpio / 32]);
+ 			irq_set_status_flags(irq, IRQ_TYPE_EDGE_BOTH);
+ 		}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0118-dm-crypt-fix-mempool-deadlock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0118-dm-crypt-fix-mempool-deadlock.patch
new file mode 100644
index 0000000..3f33596
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0118-dm-crypt-fix-mempool-deadlock.patch
@@ -0,0 +1,65 @@
+From 27573d35b38cf9f8b2bb9f1f258bcac632ef4e0e Mon Sep 17 00:00:00 2001
+From: Mikulas Patocka <mpatocka@redhat.com>
+Date: Wed, 28 Mar 2012 18:41:22 +0100
+Subject: [PATCH 118/147] dm crypt: fix mempool deadlock
+
+commit aeb2deae2660a1773c83d3c6e9e6575daa3855d6 upstream.
+
+This patch fixes a possible deadlock in dm-crypt's mempool use.
+
+Currently, dm-crypt reserves a mempool of MIN_BIO_PAGES reserved pages.
+It allocates first MIN_BIO_PAGES with non-failing allocation (the allocation
+cannot fail and waits until the mempool is refilled). Further pages are
+allocated with different gfp flags that allow failing.
+
+Because allocations may be done in parallel, this code can deadlock. Example:
+There are two processes, each tries to allocate MIN_BIO_PAGES and the processes
+run simultaneously.
+It may end up in a situation where each process allocates (MIN_BIO_PAGES / 2)
+pages. The mempool is exhausted. Each process waits for more pages to be freed
+to the mempool, which never happens.
+
+To avoid this deadlock scenario, this patch changes the code so that only
+the first page is allocated with non-failing gfp mask. Allocation of further
+pages may fail.
+
+Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
+Signed-off-by: Milan Broz <mbroz@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/dm-crypt.c |   10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
+index 8c2a000..c75d947 100644
+--- a/drivers/md/dm-crypt.c
++++ b/drivers/md/dm-crypt.c
+@@ -176,7 +176,6 @@ struct crypt_config {
+ 
+ #define MIN_IOS        16
+ #define MIN_POOL_PAGES 32
+-#define MIN_BIO_PAGES  8
+ 
+ static struct kmem_cache *_crypt_io_pool;
+ 
+@@ -848,12 +847,11 @@ static struct bio *crypt_alloc_buffer(struct dm_crypt_io *io, unsigned size,
+ 		}
+ 
+ 		/*
+-		 * if additional pages cannot be allocated without waiting,
+-		 * return a partially allocated bio, the caller will then try
+-		 * to allocate additional bios while submitting this partial bio
++		 * If additional pages cannot be allocated without waiting,
++		 * return a partially-allocated bio.  The caller will then try
++		 * to allocate more bios while submitting this partial bio.
+ 		 */
+-		if (i == (MIN_BIO_PAGES - 1))
+-			gfp_mask = (gfp_mask | __GFP_NOWARN) & ~__GFP_WAIT;
++		gfp_mask = (gfp_mask | __GFP_NOWARN) & ~__GFP_WAIT;
+ 
+ 		len = (size > PAGE_SIZE) ? PAGE_SIZE : size;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0119-dm-crypt-add-missing-error-handling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0119-dm-crypt-add-missing-error-handling.patch
new file mode 100644
index 0000000..c2dfbf3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0119-dm-crypt-add-missing-error-handling.patch
@@ -0,0 +1,116 @@
+From 94b46b475866eb637578cd9302cb047fea4be03b Mon Sep 17 00:00:00 2001
+From: Mikulas Patocka <mpatocka@redhat.com>
+Date: Wed, 28 Mar 2012 18:41:22 +0100
+Subject: [PATCH 119/147] dm crypt: add missing error handling
+
+commit 72c6e7afc43e19f68a31dea204fc366624d6eee9 upstream.
+
+Always set io->error to -EIO when an error is detected in dm-crypt.
+
+There were cases where an error code would be set only if we finish
+processing the last sector. If there were other encryption operations in
+flight, the error would be ignored and bio would be returned with
+success as if no error happened.
+
+This bug is present in kcryptd_crypt_write_convert, kcryptd_crypt_read_convert
+and kcryptd_async_done.
+
+Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
+Reviewed-by: Milan Broz <mbroz@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/dm-crypt.c |   28 ++++++++++++++++------------
+ 1 file changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/md/dm-crypt.c b/drivers/md/dm-crypt.c
+index c75d947..58d8c6d 100644
+--- a/drivers/md/dm-crypt.c
++++ b/drivers/md/dm-crypt.c
+@@ -1044,16 +1044,14 @@ static void kcryptd_queue_io(struct dm_crypt_io *io)
+ 	queue_work(cc->io_queue, &io->work);
+ }
+ 
+-static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io,
+-					  int error, int async)
++static void kcryptd_crypt_write_io_submit(struct dm_crypt_io *io, int async)
+ {
+ 	struct bio *clone = io->ctx.bio_out;
+ 	struct crypt_config *cc = io->target->private;
+ 
+-	if (unlikely(error < 0)) {
++	if (unlikely(io->error < 0)) {
+ 		crypt_free_buffer_pages(cc, clone);
+ 		bio_put(clone);
+-		io->error = -EIO;
+ 		crypt_dec_pending(io);
+ 		return;
+ 	}
+@@ -1104,12 +1102,16 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
+ 		sector += bio_sectors(clone);
+ 
+ 		crypt_inc_pending(io);
++
+ 		r = crypt_convert(cc, &io->ctx);
++		if (r < 0)
++			io->error = -EIO;
++
+ 		crypt_finished = atomic_dec_and_test(&io->ctx.pending);
+ 
+ 		/* Encryption was already finished, submit io now */
+ 		if (crypt_finished) {
+-			kcryptd_crypt_write_io_submit(io, r, 0);
++			kcryptd_crypt_write_io_submit(io, 0);
+ 
+ 			/*
+ 			 * If there was an error, do not try next fragments.
+@@ -1160,11 +1162,8 @@ static void kcryptd_crypt_write_convert(struct dm_crypt_io *io)
+ 	crypt_dec_pending(io);
+ }
+ 
+-static void kcryptd_crypt_read_done(struct dm_crypt_io *io, int error)
++static void kcryptd_crypt_read_done(struct dm_crypt_io *io)
+ {
+-	if (unlikely(error < 0))
+-		io->error = -EIO;
+-
+ 	crypt_dec_pending(io);
+ }
+ 
+@@ -1179,9 +1178,11 @@ static void kcryptd_crypt_read_convert(struct dm_crypt_io *io)
+ 			   io->sector);
+ 
+ 	r = crypt_convert(cc, &io->ctx);
++	if (r < 0)
++		io->error = -EIO;
+ 
+ 	if (atomic_dec_and_test(&io->ctx.pending))
+-		kcryptd_crypt_read_done(io, r);
++		kcryptd_crypt_read_done(io);
+ 
+ 	crypt_dec_pending(io);
+ }
+@@ -1202,15 +1203,18 @@ static void kcryptd_async_done(struct crypto_async_request *async_req,
+ 	if (!error && cc->iv_gen_ops && cc->iv_gen_ops->post)
+ 		error = cc->iv_gen_ops->post(cc, iv_of_dmreq(cc, dmreq), dmreq);
+ 
++	if (error < 0)
++		io->error = -EIO;
++
+ 	mempool_free(req_of_dmreq(cc, dmreq), cc->req_pool);
+ 
+ 	if (!atomic_dec_and_test(&ctx->pending))
+ 		return;
+ 
+ 	if (bio_data_dir(io->base_bio) == READ)
+-		kcryptd_crypt_read_done(io, error);
++		kcryptd_crypt_read_done(io);
+ 	else
+-		kcryptd_crypt_write_io_submit(io, error, 1);
++		kcryptd_crypt_write_io_submit(io, 1);
+ }
+ 
+ static void kcryptd_crypt(struct work_struct *work)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0120-dm-exception-store-fix-init-error-path.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0120-dm-exception-store-fix-init-error-path.patch
new file mode 100644
index 0000000..5bb414b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0120-dm-exception-store-fix-init-error-path.patch
@@ -0,0 +1,33 @@
+From 24d0229ad2f723a746bbc36919b87e15a239075f Mon Sep 17 00:00:00 2001
+From: Andrei Warkentin <andrey.warkentin@gmail.com>
+Date: Wed, 28 Mar 2012 18:41:22 +0100
+Subject: [PATCH 120/147] dm exception store: fix init error path
+
+commit aadbe266f2f89ccc68b52f4effc7b3a8b29521ef upstream.
+
+Call the correct exit function on failure in dm_exception_store_init.
+
+Signed-off-by: Andrei Warkentin <andrey.warkentin@gmail.com>
+Acked-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/dm-exception-store.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/md/dm-exception-store.c b/drivers/md/dm-exception-store.c
+index 042e719..aa70f7d 100644
+--- a/drivers/md/dm-exception-store.c
++++ b/drivers/md/dm-exception-store.c
+@@ -283,7 +283,7 @@ int dm_exception_store_init(void)
+ 	return 0;
+ 
+ persistent_fail:
+-	dm_persistent_snapshot_exit();
++	dm_transient_snapshot_exit();
+ transient_fail:
+ 	return r;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0121-dm-persistent-data-fix-btree-rebalancing-after-remov.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0121-dm-persistent-data-fix-btree-rebalancing-after-remov.patch
new file mode 100644
index 0000000..f393174
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0121-dm-persistent-data-fix-btree-rebalancing-after-remov.patch
@@ -0,0 +1,272 @@
+From 94c63ce73eda68e07380ef495c19c9f87f4655ba Mon Sep 17 00:00:00 2001
+From: Joe Thornber <ejt@redhat.com>
+Date: Wed, 28 Mar 2012 18:41:23 +0100
+Subject: [PATCH 121/147] dm persistent data: fix btree rebalancing after
+ remove
+
+commit b0988900bae9ecf968a8a8d086a9eec671a9517a upstream.
+
+When we remove an entry from a node we sometimes rebalance with it's
+two neighbours.  This wasn't being done correctly; in some cases
+entries have to move all the way from the right neighbour to the left
+neighbour, or vice versa.  This patch pretty much re-writes the
+balancing code to fix it.
+
+This code is barely used currently; only when you delete a thin
+device, and then only if you have hundreds of them in the same pool.
+Once we have discard support, which removes mappings, this will be used
+much more heavily.
+
+Signed-off-by: Joe Thornber <ejt@redhat.com>
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/persistent-data/dm-btree-remove.c |  174 +++++++++++++++-----------
+ 1 file changed, 99 insertions(+), 75 deletions(-)
+
+diff --git a/drivers/md/persistent-data/dm-btree-remove.c b/drivers/md/persistent-data/dm-btree-remove.c
+index 023fbc2..1a35caf 100644
+--- a/drivers/md/persistent-data/dm-btree-remove.c
++++ b/drivers/md/persistent-data/dm-btree-remove.c
+@@ -128,18 +128,9 @@ static void delete_at(struct node *n, unsigned index)
+ 	n->header.nr_entries = cpu_to_le32(nr_entries - 1);
+ }
+ 
+-static unsigned del_threshold(struct node *n)
+-{
+-	return le32_to_cpu(n->header.max_entries) / 3;
+-}
+-
+ static unsigned merge_threshold(struct node *n)
+ {
+-	/*
+-	 * The extra one is because we know we're potentially going to
+-	 * delete an entry.
+-	 */
+-	return 2 * (le32_to_cpu(n->header.max_entries) / 3) + 1;
++	return le32_to_cpu(n->header.max_entries) / 3;
+ }
+ 
+ struct child {
+@@ -188,6 +179,15 @@ static int exit_child(struct dm_btree_info *info, struct child *c)
+ 
+ static void shift(struct node *left, struct node *right, int count)
+ {
++	uint32_t nr_left = le32_to_cpu(left->header.nr_entries);
++	uint32_t nr_right = le32_to_cpu(right->header.nr_entries);
++	uint32_t max_entries = le32_to_cpu(left->header.max_entries);
++	uint32_t r_max_entries = le32_to_cpu(right->header.max_entries);
++
++	BUG_ON(max_entries != r_max_entries);
++	BUG_ON(nr_left - count > max_entries);
++	BUG_ON(nr_right + count > max_entries);
++
+ 	if (!count)
+ 		return;
+ 
+@@ -199,13 +199,8 @@ static void shift(struct node *left, struct node *right, int count)
+ 		node_shift(right, count);
+ 	}
+ 
+-	left->header.nr_entries =
+-		cpu_to_le32(le32_to_cpu(left->header.nr_entries) - count);
+-	BUG_ON(le32_to_cpu(left->header.nr_entries) > le32_to_cpu(left->header.max_entries));
+-
+-	right->header.nr_entries =
+-		cpu_to_le32(le32_to_cpu(right->header.nr_entries) + count);
+-	BUG_ON(le32_to_cpu(right->header.nr_entries) > le32_to_cpu(right->header.max_entries));
++	left->header.nr_entries = cpu_to_le32(nr_left - count);
++	right->header.nr_entries = cpu_to_le32(nr_right + count);
+ }
+ 
+ static void __rebalance2(struct dm_btree_info *info, struct node *parent,
+@@ -215,8 +210,9 @@ static void __rebalance2(struct dm_btree_info *info, struct node *parent,
+ 	struct node *right = r->n;
+ 	uint32_t nr_left = le32_to_cpu(left->header.nr_entries);
+ 	uint32_t nr_right = le32_to_cpu(right->header.nr_entries);
++	unsigned threshold = 2 * merge_threshold(left) + 1;
+ 
+-	if (nr_left + nr_right <= merge_threshold(left)) {
++	if (nr_left + nr_right < threshold) {
+ 		/*
+ 		 * Merge
+ 		 */
+@@ -234,9 +230,6 @@ static void __rebalance2(struct dm_btree_info *info, struct node *parent,
+ 		 * Rebalance.
+ 		 */
+ 		unsigned target_left = (nr_left + nr_right) / 2;
+-		unsigned shift_ = nr_left - target_left;
+-		BUG_ON(le32_to_cpu(left->header.max_entries) <= nr_left - shift_);
+-		BUG_ON(le32_to_cpu(right->header.max_entries) <= nr_right + shift_);
+ 		shift(left, right, nr_left - target_left);
+ 		*key_ptr(parent, r->index) = right->keys[0];
+ 	}
+@@ -272,6 +265,84 @@ static int rebalance2(struct shadow_spine *s, struct dm_btree_info *info,
+ 	return exit_child(info, &right);
+ }
+ 
++/*
++ * We dump as many entries from center as possible into left, then the rest
++ * in right, then rebalance2.  This wastes some cpu, but I want something
++ * simple atm.
++ */
++static void delete_center_node(struct dm_btree_info *info, struct node *parent,
++			       struct child *l, struct child *c, struct child *r,
++			       struct node *left, struct node *center, struct node *right,
++			       uint32_t nr_left, uint32_t nr_center, uint32_t nr_right)
++{
++	uint32_t max_entries = le32_to_cpu(left->header.max_entries);
++	unsigned shift = min(max_entries - nr_left, nr_center);
++
++	BUG_ON(nr_left + shift > max_entries);
++	node_copy(left, center, -shift);
++	left->header.nr_entries = cpu_to_le32(nr_left + shift);
++
++	if (shift != nr_center) {
++		shift = nr_center - shift;
++		BUG_ON((nr_right + shift) > max_entries);
++		node_shift(right, shift);
++		node_copy(center, right, shift);
++		right->header.nr_entries = cpu_to_le32(nr_right + shift);
++	}
++	*key_ptr(parent, r->index) = right->keys[0];
++
++	delete_at(parent, c->index);
++	r->index--;
++
++	dm_tm_dec(info->tm, dm_block_location(c->block));
++	__rebalance2(info, parent, l, r);
++}
++
++/*
++ * Redistributes entries among 3 sibling nodes.
++ */
++static void redistribute3(struct dm_btree_info *info, struct node *parent,
++			  struct child *l, struct child *c, struct child *r,
++			  struct node *left, struct node *center, struct node *right,
++			  uint32_t nr_left, uint32_t nr_center, uint32_t nr_right)
++{
++	int s;
++	uint32_t max_entries = le32_to_cpu(left->header.max_entries);
++	unsigned target = (nr_left + nr_center + nr_right) / 3;
++	BUG_ON(target > max_entries);
++
++	if (nr_left < nr_right) {
++		s = nr_left - target;
++
++		if (s < 0 && nr_center < -s) {
++			/* not enough in central node */
++			shift(left, center, nr_center);
++			s = nr_center - target;
++			shift(left, right, s);
++			nr_right += s;
++		} else
++			shift(left, center, s);
++
++		shift(center, right, target - nr_right);
++
++	} else {
++		s = target - nr_right;
++		if (s > 0 && nr_center < s) {
++			/* not enough in central node */
++			shift(center, right, nr_center);
++			s = target - nr_center;
++			shift(left, right, s);
++			nr_left -= s;
++		} else
++			shift(center, right, s);
++
++		shift(left, center, nr_left - target);
++	}
++
++	*key_ptr(parent, c->index) = center->keys[0];
++	*key_ptr(parent, r->index) = right->keys[0];
++}
++
+ static void __rebalance3(struct dm_btree_info *info, struct node *parent,
+ 			 struct child *l, struct child *c, struct child *r)
+ {
+@@ -282,62 +353,18 @@ static void __rebalance3(struct dm_btree_info *info, struct node *parent,
+ 	uint32_t nr_left = le32_to_cpu(left->header.nr_entries);
+ 	uint32_t nr_center = le32_to_cpu(center->header.nr_entries);
+ 	uint32_t nr_right = le32_to_cpu(right->header.nr_entries);
+-	uint32_t max_entries = le32_to_cpu(left->header.max_entries);
+ 
+-	unsigned target;
++	unsigned threshold = merge_threshold(left) * 4 + 1;
+ 
+ 	BUG_ON(left->header.max_entries != center->header.max_entries);
+ 	BUG_ON(center->header.max_entries != right->header.max_entries);
+ 
+-	if (((nr_left + nr_center + nr_right) / 2) < merge_threshold(center)) {
+-		/*
+-		 * Delete center node:
+-		 *
+-		 * We dump as many entries from center as possible into
+-		 * left, then the rest in right, then rebalance2.  This
+-		 * wastes some cpu, but I want something simple atm.
+-		 */
+-		unsigned shift = min(max_entries - nr_left, nr_center);
+-
+-		BUG_ON(nr_left + shift > max_entries);
+-		node_copy(left, center, -shift);
+-		left->header.nr_entries = cpu_to_le32(nr_left + shift);
+-
+-		if (shift != nr_center) {
+-			shift = nr_center - shift;
+-			BUG_ON((nr_right + shift) >= max_entries);
+-			node_shift(right, shift);
+-			node_copy(center, right, shift);
+-			right->header.nr_entries = cpu_to_le32(nr_right + shift);
+-		}
+-		*key_ptr(parent, r->index) = right->keys[0];
+-
+-		delete_at(parent, c->index);
+-		r->index--;
+-
+-		dm_tm_dec(info->tm, dm_block_location(c->block));
+-		__rebalance2(info, parent, l, r);
+-
+-		return;
+-	}
+-
+-	/*
+-	 * Rebalance
+-	 */
+-	target = (nr_left + nr_center + nr_right) / 3;
+-	BUG_ON(target > max_entries);
+-
+-	/*
+-	 * Adjust the left node
+-	 */
+-	shift(left, center, nr_left - target);
+-
+-	/*
+-	 * Adjust the right node
+-	 */
+-	shift(center, right, target - nr_right);
+-	*key_ptr(parent, c->index) = center->keys[0];
+-	*key_ptr(parent, r->index) = right->keys[0];
++	if ((nr_left + nr_center + nr_right) < threshold)
++		delete_center_node(info, parent, l, c, r, left, center, right,
++				   nr_left, nr_center, nr_right);
++	else
++		redistribute3(info, parent, l, c, r, left, center, right,
++			      nr_left, nr_center, nr_right);
+ }
+ 
+ static int rebalance3(struct shadow_spine *s, struct dm_btree_info *info,
+@@ -441,9 +468,6 @@ static int rebalance_children(struct shadow_spine *s,
+ 	if (r)
+ 		return r;
+ 
+-	if (child_entries > del_threshold(n))
+-		return 0;
+-
+ 	has_left_sibling = i > 0;
+ 	has_right_sibling = i < (le32_to_cpu(n->header.nr_entries) - 1);
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0122-dm-thin-fix-stacked-bi_next-usage.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0122-dm-thin-fix-stacked-bi_next-usage.patch
new file mode 100644
index 0000000..4d9f54d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0122-dm-thin-fix-stacked-bi_next-usage.patch
@@ -0,0 +1,233 @@
+From e2326264ad383c7611301ccad5f1cb1f90d87f8f Mon Sep 17 00:00:00 2001
+From: Joe Thornber <ejt@redhat.com>
+Date: Wed, 28 Mar 2012 18:41:23 +0100
+Subject: [PATCH 122/147] dm thin: fix stacked bi_next usage
+
+commit 6f94a4c45a6f744383f9f695dde019998db3df55 upstream.
+
+Avoid using the bi_next field for the holder of a cell when deferring
+bios because a stacked device below might change it.  Store the
+holder in a new field in struct cell instead.
+
+When a cell is created, the bio that triggered creation (the holder) was
+added to the same bio list as subsequent bios.  In some cases we pass
+this holder bio directly to devices underneath.  If those devices use
+the bi_next field there will be trouble...
+
+This also simplifies some code that had to work out which bio was the
+holder.
+
+Signed-off-by: Joe Thornber <ejt@redhat.com>
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/md/dm-thin.c |  124 +++++++++++++++++++++++++++++---------------------
+ 1 file changed, 73 insertions(+), 51 deletions(-)
+
+diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
+index c308757..da2f021 100644
+--- a/drivers/md/dm-thin.c
++++ b/drivers/md/dm-thin.c
+@@ -124,7 +124,7 @@ struct cell {
+ 	struct hlist_node list;
+ 	struct bio_prison *prison;
+ 	struct cell_key key;
+-	unsigned count;
++	struct bio *holder;
+ 	struct bio_list bios;
+ };
+ 
+@@ -220,55 +220,60 @@ static struct cell *__search_bucket(struct hlist_head *bucket,
+  * This may block if a new cell needs allocating.  You must ensure that
+  * cells will be unlocked even if the calling thread is blocked.
+  *
+- * Returns the number of entries in the cell prior to the new addition
+- * or < 0 on failure.
++ * Returns 1 if the cell was already held, 0 if @inmate is the new holder.
+  */
+ static int bio_detain(struct bio_prison *prison, struct cell_key *key,
+ 		      struct bio *inmate, struct cell **ref)
+ {
+-	int r;
++	int r = 1;
+ 	unsigned long flags;
+ 	uint32_t hash = hash_key(prison, key);
+-	struct cell *uninitialized_var(cell), *cell2 = NULL;
++	struct cell *cell, *cell2;
+ 
+ 	BUG_ON(hash > prison->nr_buckets);
+ 
+ 	spin_lock_irqsave(&prison->lock, flags);
++
+ 	cell = __search_bucket(prison->cells + hash, key);
++	if (cell) {
++		bio_list_add(&cell->bios, inmate);
++		goto out;
++	}
+ 
+-	if (!cell) {
+-		/*
+-		 * Allocate a new cell
+-		 */
+-		spin_unlock_irqrestore(&prison->lock, flags);
+-		cell2 = mempool_alloc(prison->cell_pool, GFP_NOIO);
+-		spin_lock_irqsave(&prison->lock, flags);
++	/*
++	 * Allocate a new cell
++	 */
++	spin_unlock_irqrestore(&prison->lock, flags);
++	cell2 = mempool_alloc(prison->cell_pool, GFP_NOIO);
++	spin_lock_irqsave(&prison->lock, flags);
+ 
+-		/*
+-		 * We've been unlocked, so we have to double check that
+-		 * nobody else has inserted this cell in the meantime.
+-		 */
+-		cell = __search_bucket(prison->cells + hash, key);
++	/*
++	 * We've been unlocked, so we have to double check that
++	 * nobody else has inserted this cell in the meantime.
++	 */
++	cell = __search_bucket(prison->cells + hash, key);
++	if (cell) {
++		mempool_free(cell2, prison->cell_pool);
++		bio_list_add(&cell->bios, inmate);
++		goto out;
++	}
++
++	/*
++	 * Use new cell.
++	 */
++	cell = cell2;
+ 
+-		if (!cell) {
+-			cell = cell2;
+-			cell2 = NULL;
++	cell->prison = prison;
++	memcpy(&cell->key, key, sizeof(cell->key));
++	cell->holder = inmate;
++	bio_list_init(&cell->bios);
++	hlist_add_head(&cell->list, prison->cells + hash);
+ 
+-			cell->prison = prison;
+-			memcpy(&cell->key, key, sizeof(cell->key));
+-			cell->count = 0;
+-			bio_list_init(&cell->bios);
+-			hlist_add_head(&cell->list, prison->cells + hash);
+-		}
+-	}
++	r = 0;
+ 
+-	r = cell->count++;
+-	bio_list_add(&cell->bios, inmate);
++out:
+ 	spin_unlock_irqrestore(&prison->lock, flags);
+ 
+-	if (cell2)
+-		mempool_free(cell2, prison->cell_pool);
+-
+ 	*ref = cell;
+ 
+ 	return r;
+@@ -283,8 +288,8 @@ static void __cell_release(struct cell *cell, struct bio_list *inmates)
+ 
+ 	hlist_del(&cell->list);
+ 
+-	if (inmates)
+-		bio_list_merge(inmates, &cell->bios);
++	bio_list_add(inmates, cell->holder);
++	bio_list_merge(inmates, &cell->bios);
+ 
+ 	mempool_free(cell, prison->cell_pool);
+ }
+@@ -305,22 +310,44 @@ static void cell_release(struct cell *cell, struct bio_list *bios)
+  * bio may be in the cell.  This function releases the cell, and also does
+  * a sanity check.
+  */
++static void __cell_release_singleton(struct cell *cell, struct bio *bio)
++{
++	hlist_del(&cell->list);
++	BUG_ON(cell->holder != bio);
++	BUG_ON(!bio_list_empty(&cell->bios));
++}
++
+ static void cell_release_singleton(struct cell *cell, struct bio *bio)
+ {
+-	struct bio_prison *prison = cell->prison;
+-	struct bio_list bios;
+-	struct bio *b;
+ 	unsigned long flags;
+-
+-	bio_list_init(&bios);
++	struct bio_prison *prison = cell->prison;
+ 
+ 	spin_lock_irqsave(&prison->lock, flags);
+-	__cell_release(cell, &bios);
++	__cell_release_singleton(cell, bio);
+ 	spin_unlock_irqrestore(&prison->lock, flags);
++}
++
++/*
++ * Sometimes we don't want the holder, just the additional bios.
++ */
++static void __cell_release_no_holder(struct cell *cell, struct bio_list *inmates)
++{
++	struct bio_prison *prison = cell->prison;
+ 
+-	b = bio_list_pop(&bios);
+-	BUG_ON(b != bio);
+-	BUG_ON(!bio_list_empty(&bios));
++	hlist_del(&cell->list);
++	bio_list_merge(inmates, &cell->bios);
++
++	mempool_free(cell, prison->cell_pool);
++}
++
++static void cell_release_no_holder(struct cell *cell, struct bio_list *inmates)
++{
++	unsigned long flags;
++	struct bio_prison *prison = cell->prison;
++
++	spin_lock_irqsave(&prison->lock, flags);
++	__cell_release_no_holder(cell, inmates);
++	spin_unlock_irqrestore(&prison->lock, flags);
+ }
+ 
+ static void cell_error(struct cell *cell)
+@@ -800,21 +827,16 @@ static void cell_defer(struct thin_c *tc, struct cell *cell,
+  * Same as cell_defer above, except it omits one particular detainee,
+  * a write bio that covers the block and has already been processed.
+  */
+-static void cell_defer_except(struct thin_c *tc, struct cell *cell,
+-			      struct bio *exception)
++static void cell_defer_except(struct thin_c *tc, struct cell *cell)
+ {
+ 	struct bio_list bios;
+-	struct bio *bio;
+ 	struct pool *pool = tc->pool;
+ 	unsigned long flags;
+ 
+ 	bio_list_init(&bios);
+-	cell_release(cell, &bios);
+ 
+ 	spin_lock_irqsave(&pool->lock, flags);
+-	while ((bio = bio_list_pop(&bios)))
+-		if (bio != exception)
+-			bio_list_add(&pool->deferred_bios, bio);
++	cell_release_no_holder(cell, &pool->deferred_bios);
+ 	spin_unlock_irqrestore(&pool->lock, flags);
+ 
+ 	wake_worker(pool);
+@@ -854,7 +876,7 @@ static void process_prepared_mapping(struct new_mapping *m)
+ 	 * the bios in the cell.
+ 	 */
+ 	if (bio) {
+-		cell_defer_except(tc, m->cell, bio);
++		cell_defer_except(tc, m->cell);
+ 		bio_endio(bio, 0);
+ 	} else
+ 		cell_defer(tc, m->cell, m->data_block);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0123-backlight-fix-typo-in-tosa_lcd.c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0123-backlight-fix-typo-in-tosa_lcd.c.patch
new file mode 100644
index 0000000..2f369f7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0123-backlight-fix-typo-in-tosa_lcd.c.patch
@@ -0,0 +1,34 @@
+From 97f236081bafdb80cac73ef005a6df79d4b2c803 Mon Sep 17 00:00:00 2001
+From: Masanari Iida <standby24x7@gmail.com>
+Date: Wed, 28 Mar 2012 14:42:56 -0700
+Subject: [PATCH 123/147] backlight: fix typo in tosa_lcd.c
+
+commit 8da00edc1069f01c34510fa405dc15d96c090a3f upstream.
+
+Fix typo in drivers/video/backlight/tosa_lcd.c
+"tosa_lcd_reume" should be "tosa_lcd_resume".
+
+Signed-off-by: Masanari Iida <standby24x7@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/video/backlight/tosa_lcd.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/video/backlight/tosa_lcd.c b/drivers/video/backlight/tosa_lcd.c
+index 772f601..6f54f74 100644
+--- a/drivers/video/backlight/tosa_lcd.c
++++ b/drivers/video/backlight/tosa_lcd.c
+@@ -271,7 +271,7 @@ static int tosa_lcd_resume(struct spi_device *spi)
+ }
+ #else
+ #define tosa_lcd_suspend	NULL
+-#define tosa_lcd_reume NULL
++#define tosa_lcd_resume NULL
+ #endif
+ 
+ static struct spi_driver tosa_lcd_driver = {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0124-xfs-Fix-oops-on-IO-error-during-xlog_recover_process.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0124-xfs-Fix-oops-on-IO-error-during-xlog_recover_process.patch
new file mode 100644
index 0000000..85a6e21
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0124-xfs-Fix-oops-on-IO-error-during-xlog_recover_process.patch
@@ -0,0 +1,84 @@
+From 2b91e04fb1c28cce172844b2519c4bbedd9849c2 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Thu, 15 Mar 2012 09:34:02 +0000
+Subject: [PATCH 124/147] xfs: Fix oops on IO error during
+ xlog_recover_process_iunlinks()
+
+commit d97d32edcd732110758799ae60af725e5110b3dc upstream.
+
+When an IO error happens during inode deletion run from
+xlog_recover_process_iunlinks() filesystem gets shutdown. Thus any subsequent
+attempt to read buffers fails. Code in xlog_recover_process_iunlinks() does not
+count with the fact that read of a buffer which was read a while ago can
+really fail which results in the oops on
+  agi = XFS_BUF_TO_AGI(agibp);
+
+Fix the problem by cleaning up the buffer handling in
+xlog_recover_process_iunlinks() as suggested by Dave Chinner. We release buffer
+lock but keep buffer reference to AG buffer. That is enough for buffer to stay
+pinned in memory and we don't have to call xfs_read_agi() all the time.
+
+Signed-off-by: Jan Kara <jack@suse.cz>
+Reviewed-by: Dave Chinner <dchinner@redhat.com>
+Signed-off-by: Ben Myers <bpm@sgi.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/xfs/xfs_log_recover.c |   33 +++++++++++----------------------
+ 1 file changed, 11 insertions(+), 22 deletions(-)
+
+diff --git a/fs/xfs/xfs_log_recover.c b/fs/xfs/xfs_log_recover.c
+index 541a508..4f5d0ce 100644
+--- a/fs/xfs/xfs_log_recover.c
++++ b/fs/xfs/xfs_log_recover.c
+@@ -3161,37 +3161,26 @@ xlog_recover_process_iunlinks(
+ 			 */
+ 			continue;
+ 		}
++		/*
++		 * Unlock the buffer so that it can be acquired in the normal
++		 * course of the transaction to truncate and free each inode.
++		 * Because we are not racing with anyone else here for the AGI
++		 * buffer, we don't even need to hold it locked to read the
++		 * initial unlinked bucket entries out of the buffer. We keep
++		 * buffer reference though, so that it stays pinned in memory
++		 * while we need the buffer.
++		 */
+ 		agi = XFS_BUF_TO_AGI(agibp);
++		xfs_buf_unlock(agibp);
+ 
+ 		for (bucket = 0; bucket < XFS_AGI_UNLINKED_BUCKETS; bucket++) {
+ 			agino = be32_to_cpu(agi->agi_unlinked[bucket]);
+ 			while (agino != NULLAGINO) {
+-				/*
+-				 * Release the agi buffer so that it can
+-				 * be acquired in the normal course of the
+-				 * transaction to truncate and free the inode.
+-				 */
+-				xfs_buf_relse(agibp);
+-
+ 				agino = xlog_recover_process_one_iunlink(mp,
+ 							agno, agino, bucket);
+-
+-				/*
+-				 * Reacquire the agibuffer and continue around
+-				 * the loop. This should never fail as we know
+-				 * the buffer was good earlier on.
+-				 */
+-				error = xfs_read_agi(mp, NULL, agno, &agibp);
+-				ASSERT(error == 0);
+-				agi = XFS_BUF_TO_AGI(agibp);
+ 			}
+ 		}
+-
+-		/*
+-		 * Release the buffer for the current agi so we can
+-		 * go on to the next one.
+-		 */
+-		xfs_buf_relse(agibp);
++		xfs_buf_rele(agibp);
+ 	}
+ 
+ 	mp->m_dmevmask = mp_dmevmask;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0125-slub-Do-not-hold-slub_lock-when-calling-sysfs_slab_a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0125-slub-Do-not-hold-slub_lock-when-calling-sysfs_slab_a.patch
new file mode 100644
index 0000000..325ae73
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0125-slub-Do-not-hold-slub_lock-when-calling-sysfs_slab_a.patch
@@ -0,0 +1,51 @@
+From 4e25692d8b794add23cb09fdeeaa62ecee2ef697 Mon Sep 17 00:00:00 2001
+From: Christoph Lameter <cl@linux.com>
+Date: Tue, 17 Jan 2012 09:27:31 -0600
+Subject: [PATCH 125/147] slub: Do not hold slub_lock when calling
+ sysfs_slab_add()
+
+commit 66c4c35c6bc5a1a452b024cf0364635b28fd94e4 upstream.
+
+sysfs_slab_add() calls various sysfs functions that actually may
+end up in userspace doing all sorts of things.
+
+Release the slub_lock after adding the kmem_cache structure to the list.
+At that point the address of the kmem_cache is not known so we are
+guaranteed exlusive access to the following modifications to the
+kmem_cache structure.
+
+If the sysfs_slab_add fails then reacquire the slub_lock to
+remove the kmem_cache structure from the list.
+
+Reported-by: Sasha Levin <levinsasha928@gmail.com>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: Christoph Lameter <cl@linux.com>
+Signed-off-by: Pekka Enberg <penberg@kernel.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/slub.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/mm/slub.c b/mm/slub.c
+index 1a919f0..a99c785 100644
+--- a/mm/slub.c
++++ b/mm/slub.c
+@@ -3911,13 +3911,14 @@ struct kmem_cache *kmem_cache_create(const char *name, size_t size,
+ 		if (kmem_cache_open(s, n,
+ 				size, align, flags, ctor)) {
+ 			list_add(&s->list, &slab_caches);
++			up_write(&slub_lock);
+ 			if (sysfs_slab_add(s)) {
++				down_write(&slub_lock);
+ 				list_del(&s->list);
+ 				kfree(n);
+ 				kfree(s);
+ 				goto err;
+ 			}
+-			up_write(&slub_lock);
+ 			return s;
+ 		}
+ 		kfree(n);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0126-NFSv4-Fix-two-infinite-loops-in-the-mount-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0126-NFSv4-Fix-two-infinite-loops-in-the-mount-code.patch
new file mode 100644
index 0000000..dd7fa83
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0126-NFSv4-Fix-two-infinite-loops-in-the-mount-code.patch
@@ -0,0 +1,54 @@
+From a92e847768f32d7059094c15ce686019b91893ab Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Tue, 27 Mar 2012 18:13:02 -0400
+Subject: [PATCH 126/147] NFSv4: Fix two infinite loops in the mount code
+
+commit 05e9cfb408b24debb3a85fd98edbfd09dd148881 upstream.
+
+We can currently loop forever in nfs4_lookup_root() and in
+nfs41_proc_secinfo_no_name(), if the first iteration returns a
+NFS4ERR_DELAY or something else that causes exception.retry to get
+set.
+
+Reported-by: Weston Andros Adamson <dros@netapp.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4proc.c |    6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index c9e2d9e..6db0972 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -2242,11 +2242,12 @@ static int nfs4_lookup_root(struct nfs_server *server, struct nfs_fh *fhandle,
+ 		switch (err) {
+ 		case 0:
+ 		case -NFS4ERR_WRONGSEC:
+-			break;
++			goto out;
+ 		default:
+ 			err = nfs4_handle_exception(server, err, &exception);
+ 		}
+ 	} while (exception.retry);
++out:
+ 	return err;
+ }
+ 
+@@ -6099,11 +6100,12 @@ nfs41_proc_secinfo_no_name(struct nfs_server *server, struct nfs_fh *fhandle,
+ 		case 0:
+ 		case -NFS4ERR_WRONGSEC:
+ 		case -NFS4ERR_NOTSUPP:
+-			break;
++			goto out;
+ 		default:
+ 			err = nfs4_handle_exception(server, err, &exception);
+ 		}
+ 	} while (exception.retry);
++out:
+ 	return err;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0127-NFSv4.1-Fix-layoutcommit-error-handling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0127-NFSv4.1-Fix-layoutcommit-error-handling.patch
new file mode 100644
index 0000000..2f1e88a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0127-NFSv4.1-Fix-layoutcommit-error-handling.patch
@@ -0,0 +1,61 @@
+From ccd03bf68f47d089dc1c789ea11a19792e056fdf Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Tue, 27 Mar 2012 18:22:19 -0400
+Subject: [PATCH 127/147] NFSv4.1: Fix layoutcommit error handling
+
+commit e59d27e05a6435f8c04d5ad843f37fa795f2eaaa upstream.
+
+Firstly, task->tk_status will always return negative error values,
+so the current tests for 'NFS4ERR_DELEG_REVOKED' etc. are all being
+ignored.
+Secondly, clean up the code so that we only need to test
+task->tk_status once!
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4proc.c |   25 +++++++++++++------------
+ 1 file changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index 6db0972..d945700 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -5983,21 +5983,22 @@ nfs4_layoutcommit_done(struct rpc_task *task, void *calldata)
+ 		return;
+ 
+ 	switch (task->tk_status) { /* Just ignore these failures */
+-	case NFS4ERR_DELEG_REVOKED: /* layout was recalled */
+-	case NFS4ERR_BADIOMODE:     /* no IOMODE_RW layout for range */
+-	case NFS4ERR_BADLAYOUT:     /* no layout */
+-	case NFS4ERR_GRACE:	    /* loca_recalim always false */
++	case -NFS4ERR_DELEG_REVOKED: /* layout was recalled */
++	case -NFS4ERR_BADIOMODE:     /* no IOMODE_RW layout for range */
++	case -NFS4ERR_BADLAYOUT:     /* no layout */
++	case -NFS4ERR_GRACE:	    /* loca_recalim always false */
+ 		task->tk_status = 0;
+-	}
+-
+-	if (nfs4_async_handle_error(task, server, NULL) == -EAGAIN) {
+-		rpc_restart_call_prepare(task);
+-		return;
+-	}
+-
+-	if (task->tk_status == 0)
++		break;
++	case 0:
+ 		nfs_post_op_update_inode_force_wcc(data->args.inode,
+ 						   data->res.fattr);
++		break;
++	default:
++		if (nfs4_async_handle_error(task, server, NULL) == -EAGAIN) {
++			rpc_restart_call_prepare(task);
++			return;
++		}
++	}
+ }
+ 
+ static void nfs4_layoutcommit_release(void *calldata)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0128-module-Remove-module-size-limit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0128-module-Remove-module-size-limit.patch
new file mode 100644
index 0000000..09a8b51
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0128-module-Remove-module-size-limit.patch
@@ -0,0 +1,38 @@
+From fd3597c3facb39143261c34964aabfc9c66c4fdf Mon Sep 17 00:00:00 2001
+From: Sasha Levin <levinsasha928@gmail.com>
+Date: Mon, 30 Jan 2012 23:07:22 -0500
+Subject: [PATCH 128/147] module: Remove module size limit
+
+commit f946eeb9313ff1470758e171a60fe7438a2ded3f upstream.
+
+Module size was limited to 64MB, this was legacy limitation due to vmalloc()
+which was removed a while ago.
+
+Limiting module size to 64MB is both pointless and affects real world use
+cases.
+
+Cc: Tim Abbott <tim.abbott@oracle.com>
+Signed-off-by: Sasha Levin <sasha.levin@oracle.com>
+Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/module.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/kernel/module.c b/kernel/module.c
+index 178333c..6969ef0 100644
+--- a/kernel/module.c
++++ b/kernel/module.c
+@@ -2341,8 +2341,7 @@ static int copy_and_check(struct load_info *info,
+ 		return -ENOEXEC;
+ 
+ 	/* Suck in entire file: we'll want most of it. */
+-	/* vmalloc barfs on "unusual" numbers.  Check here */
+-	if (len > 64 * 1024 * 1024 || (hdr = vmalloc(len)) == NULL)
++	if ((hdr = vmalloc(len)) == NULL)
+ 		return -ENOMEM;
+ 
+ 	if (copy_from_user(hdr, umod, len) != 0) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0129-Bluetooth-btusb-fix-bInterval-for-high-super-speed-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0129-Bluetooth-btusb-fix-bInterval-for-high-super-speed-i.patch
new file mode 100644
index 0000000..2aae62b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0129-Bluetooth-btusb-fix-bInterval-for-high-super-speed-i.patch
@@ -0,0 +1,47 @@
+From 7c62cb0eff8ac7154b41d4b010c18e1a92e1bf8e Mon Sep 17 00:00:00 2001
+From: Bing Zhao <bzhao@marvell.com>
+Date: Tue, 20 Dec 2011 18:19:00 -0800
+Subject: [PATCH 129/147] Bluetooth: btusb: fix bInterval for high/super speed
+ isochronous endpoints
+
+commit fa0fb93f2ac308a76fa64eb57c18511dadf97089 upstream.
+
+For high-speed/super-speed isochronous endpoints, the bInterval
+value is used as exponent, 2^(bInterval-1). Luckily we have
+usb_fill_int_urb() function that handles it correctly. So we just
+call this function to fill in the RX URB.
+
+Cc: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Bing Zhao <bzhao@marvell.com>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Gustavo F. Padovan <padovan@profusion.mobi>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/bluetooth/btusb.c |    9 ++-------
+ 1 file changed, 2 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
+index 11a925c..c16c750 100644
+--- a/drivers/bluetooth/btusb.c
++++ b/drivers/bluetooth/btusb.c
+@@ -507,15 +507,10 @@ static int btusb_submit_isoc_urb(struct hci_dev *hdev, gfp_t mem_flags)
+ 
+ 	pipe = usb_rcvisocpipe(data->udev, data->isoc_rx_ep->bEndpointAddress);
+ 
+-	urb->dev      = data->udev;
+-	urb->pipe     = pipe;
+-	urb->context  = hdev;
+-	urb->complete = btusb_isoc_complete;
+-	urb->interval = data->isoc_rx_ep->bInterval;
++	usb_fill_int_urb(urb, data->udev, pipe, buf, size, btusb_isoc_complete,
++				hdev, data->isoc_rx_ep->bInterval);
+ 
+ 	urb->transfer_flags  = URB_FREE_BUFFER | URB_ISO_ASAP;
+-	urb->transfer_buffer = buf;
+-	urb->transfer_buffer_length = size;
+ 
+ 	__fill_isoc_descriptor(urb, size,
+ 			le16_to_cpu(data->isoc_rx_ep->wMaxPacketSize));
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0130-drm-i915-suspend-fbdev-device-around-suspend-hiberna.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0130-drm-i915-suspend-fbdev-device-around-suspend-hiberna.patch
new file mode 100644
index 0000000..f224abe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0130-drm-i915-suspend-fbdev-device-around-suspend-hiberna.patch
@@ -0,0 +1,95 @@
+From 38c2bda521b456704bd7b7376e79d69b0e867198 Mon Sep 17 00:00:00 2001
+From: Dave Airlie <airlied@redhat.com>
+Date: Wed, 28 Mar 2012 10:48:49 +0100
+Subject: [PATCH 130/147] drm/i915: suspend fbdev device around
+ suspend/hibernate
+
+commit 3fa016a0b5c5237e9c387fc3249592b2cb5391c6 upstream.
+
+Looking at hibernate overwriting I though it looked like a cursor,
+so I tracked down this missing piece to stop the cursor blink
+timer. I've no idea if this is sufficient to fix the hibernate
+problems people are seeing, but please test it.
+
+Both radeon and nouveau have done this for a long time.
+
+I've run this personally all night hib/resume cycles with no fails.
+
+Reviewed-by: Keith Packard <keithp@keithp.com>
+Reported-by: Petr Tesarik <kernel@tesarici.cz>
+Reported-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Reported-by: Lots of misc segfaults after hibernate across the world.
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=37142
+Tested-by: Dave Airlie <airlied@redhat.com>
+Tested-by: Bojan Smojver <bojan@rexursive.com>
+Tested-by: Andreas Hartmann <andihartmann@01019freenet.de>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_drv.c  |    7 +++++++
+ drivers/gpu/drm/i915/intel_drv.h |    2 +-
+ drivers/gpu/drm/i915/intel_fb.c  |   10 ++++++++++
+ 3 files changed, 18 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
+index e2d85a9..d04597d 100644
+--- a/drivers/gpu/drm/i915/i915_drv.c
++++ b/drivers/gpu/drm/i915/i915_drv.c
+@@ -442,6 +442,10 @@ static int i915_drm_freeze(struct drm_device *dev)
+ 	/* Modeset on resume, not lid events */
+ 	dev_priv->modeset_on_lid = 0;
+ 
++	console_lock();
++	intel_fbdev_set_suspend(dev, 1);
++	console_unlock();
++
+ 	return 0;
+ }
+ 
+@@ -514,6 +518,9 @@ static int i915_drm_thaw(struct drm_device *dev)
+ 
+ 	dev_priv->modeset_on_lid = 0;
+ 
++	console_lock();
++	intel_fbdev_set_suspend(dev, 0);
++	console_unlock();
+ 	return error;
+ }
+ 
+diff --git a/drivers/gpu/drm/i915/intel_drv.h b/drivers/gpu/drm/i915/intel_drv.h
+index a1b4343..83e820e 100644
+--- a/drivers/gpu/drm/i915/intel_drv.h
++++ b/drivers/gpu/drm/i915/intel_drv.h
+@@ -364,7 +364,7 @@ extern int intel_framebuffer_init(struct drm_device *dev,
+ 				  struct drm_i915_gem_object *obj);
+ extern int intel_fbdev_init(struct drm_device *dev);
+ extern void intel_fbdev_fini(struct drm_device *dev);
+-
++extern void intel_fbdev_set_suspend(struct drm_device *dev, int state);
+ extern void intel_prepare_page_flip(struct drm_device *dev, int plane);
+ extern void intel_finish_page_flip(struct drm_device *dev, int pipe);
+ extern void intel_finish_page_flip_plane(struct drm_device *dev, int plane);
+diff --git a/drivers/gpu/drm/i915/intel_fb.c b/drivers/gpu/drm/i915/intel_fb.c
+index ec49bae..d0ce34b 100644
+--- a/drivers/gpu/drm/i915/intel_fb.c
++++ b/drivers/gpu/drm/i915/intel_fb.c
+@@ -257,6 +257,16 @@ void intel_fbdev_fini(struct drm_device *dev)
+ 	kfree(dev_priv->fbdev);
+ 	dev_priv->fbdev = NULL;
+ }
++
++void intel_fbdev_set_suspend(struct drm_device *dev, int state)
++{
++	drm_i915_private_t *dev_priv = dev->dev_private;
++	if (!dev_priv->fbdev)
++		return;
++
++	fb_set_suspend(dev_priv->fbdev->helper.fbdev, state);
++}
++
+ MODULE_LICENSE("GPL and additional rights");
+ 
+ void intel_fb_output_poll_changed(struct drm_device *dev)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0131-Fix-pppol2tp-getsockname.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0131-Fix-pppol2tp-getsockname.patch
new file mode 100644
index 0000000..371e203
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0131-Fix-pppol2tp-getsockname.patch
@@ -0,0 +1,37 @@
+From f5d559cda23c4abbccffff4d6992fba722321a1e Mon Sep 17 00:00:00 2001
+From: Benjamin LaHaise <bcrl@kvack.org>
+Date: Tue, 20 Mar 2012 03:57:54 +0000
+Subject: [PATCH 131/147] Fix pppol2tp getsockname()
+
+[ Upstream commit bbdb32cb5b73597386913d052165423b9d736145 ]
+
+While testing L2TP functionality, I came across a bug in getsockname().  The
+IP address returned within the pppol2tp_addr's addr memember was not being
+set to the IP  address in use.  This bug is caused by using inet_sk() on the
+wrong socket (the L2TP socket rather than the underlying UDP socket), and was
+likely introduced during the addition of L2TPv3 support.
+
+Signed-off-by: Benjamin LaHaise <bcrl@kvack.org>
+Signed-off-by: James Chapman <jchapman@katalix.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/l2tp/l2tp_ppp.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/net/l2tp/l2tp_ppp.c b/net/l2tp/l2tp_ppp.c
+index 8a90d75..b1bd16f 100644
+--- a/net/l2tp/l2tp_ppp.c
++++ b/net/l2tp/l2tp_ppp.c
+@@ -915,7 +915,7 @@ static int pppol2tp_getname(struct socket *sock, struct sockaddr *uaddr,
+ 		goto end_put_sess;
+ 	}
+ 
+-	inet = inet_sk(sk);
++	inet = inet_sk(tunnel->sock);
+ 	if (tunnel->version == 2) {
+ 		struct sockaddr_pppol2tp sp;
+ 		len = sizeof(sp);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0132-ipv6-fix-incorrent-ipv6-ipsec-packet-fragment.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0132-ipv6-fix-incorrent-ipv6-ipsec-packet-fragment.patch
new file mode 100644
index 0000000..eaf6d78
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0132-ipv6-fix-incorrent-ipv6-ipsec-packet-fragment.patch
@@ -0,0 +1,54 @@
+From c809355ceedbec6be4d31c189c452323b7dd0555 Mon Sep 17 00:00:00 2001
+From: Gao feng <gaofeng@cn.fujitsu.com>
+Date: Mon, 19 Mar 2012 22:36:10 +0000
+Subject: [PATCH 132/147] ipv6: fix incorrent ipv6 ipsec packet fragment
+
+[ Upstream commit 1f85851e17b64cabd089a8a8839dddebc627948c ]
+
+Since commit 299b0767(ipv6: Fix IPsec slowpath fragmentation problem)
+In func ip6_append_data,after call skb_put(skb, fraglen + dst_exthdrlen)
+the skb->len contains dst_exthdrlen,and we don't reduce dst_exthdrlen at last
+This will make fraggap>0 in next "while cycle",and cause the size of skb incorrent
+
+Fix this by reserve headroom for dst_exthdrlen.
+
+Signed-off-by: Gao feng <gaofeng@cn.fujitsu.com>
+Acked-by: Steffen Klassert <steffen.klassert@secunet.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv6/ip6_output.c |   11 ++++++-----
+ 1 file changed, 6 insertions(+), 5 deletions(-)
+
+diff --git a/net/ipv6/ip6_output.c b/net/ipv6/ip6_output.c
+index ec56271..f7f07e2 100644
+--- a/net/ipv6/ip6_output.c
++++ b/net/ipv6/ip6_output.c
+@@ -1411,8 +1411,9 @@ alloc_new_skb:
+ 			 */
+ 			skb->ip_summed = csummode;
+ 			skb->csum = 0;
+-			/* reserve for fragmentation */
+-			skb_reserve(skb, hh_len+sizeof(struct frag_hdr));
++			/* reserve for fragmentation and ipsec header */
++			skb_reserve(skb, hh_len + sizeof(struct frag_hdr) +
++				    dst_exthdrlen);
+ 
+ 			if (sk->sk_type == SOCK_DGRAM)
+ 				skb_shinfo(skb)->tx_flags = tx_flags;
+@@ -1420,9 +1421,9 @@ alloc_new_skb:
+ 			/*
+ 			 *	Find where to start putting bytes
+ 			 */
+-			data = skb_put(skb, fraglen + dst_exthdrlen);
+-			skb_set_network_header(skb, exthdrlen + dst_exthdrlen);
+-			data += fragheaderlen + dst_exthdrlen;
++			data = skb_put(skb, fraglen);
++			skb_set_network_header(skb, exthdrlen);
++			data += fragheaderlen;
+ 			skb->transport_header = (skb->network_header +
+ 						 fragheaderlen);
+ 			if (fraggap) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0133-net-bpf_jit-fix-BPF_S_LDX_B_MSH-compilation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0133-net-bpf_jit-fix-BPF_S_LDX_B_MSH-compilation.patch
new file mode 100644
index 0000000..a5780d4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0133-net-bpf_jit-fix-BPF_S_LDX_B_MSH-compilation.patch
@@ -0,0 +1,62 @@
+From 3f5659b743cac5379f2b1619b713edeb60844b23 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Sun, 18 Mar 2012 02:40:48 +0000
+Subject: [PATCH 133/147] net: bpf_jit: fix BPF_S_LDX_B_MSH compilation
+
+[ Upstream commit dc72d99dabb870ca5bd6d9fff674be853bb4a88d ]
+
+Matt Evans spotted that x86 bpf_jit was incorrectly handling negative
+constant offsets in BPF_S_LDX_B_MSH instruction.
+
+We need to abort JIT compilation like we do in common_load so that
+filter uses the interpreter code and can call __load_pointer()
+
+Reference: http://lists.openwall.net/netdev/2011/07/19/11
+
+Thanks to Indan Zupancic to bring back this issue.
+
+Reported-by: Matt Evans <matt@ozlabs.org>
+Reported-by: Indan Zupancic <indan@nul.nu>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/net/bpf_jit_comp.c |   14 +++++---------
+ 1 file changed, 5 insertions(+), 9 deletions(-)
+
+diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
+index 7c1b765..5671752 100644
+--- a/arch/x86/net/bpf_jit_comp.c
++++ b/arch/x86/net/bpf_jit_comp.c
+@@ -475,8 +475,10 @@ void bpf_jit_compile(struct sk_filter *fp)
+ 			case BPF_S_LD_W_ABS:
+ 				func = sk_load_word;
+ common_load:			seen |= SEEN_DATAREF;
+-				if ((int)K < 0)
++				if ((int)K < 0) {
++					/* Abort the JIT because __load_pointer() is needed. */
+ 					goto out;
++				}
+ 				t_offset = func - (image + addrs[i]);
+ 				EMIT1_off32(0xbe, K); /* mov imm32,%esi */
+ 				EMIT1_off32(0xe8, t_offset); /* call */
+@@ -489,14 +491,8 @@ common_load:			seen |= SEEN_DATAREF;
+ 				goto common_load;
+ 			case BPF_S_LDX_B_MSH:
+ 				if ((int)K < 0) {
+-					if (pc_ret0 > 0) {
+-						/* addrs[pc_ret0 - 1] is the start address */
+-						EMIT_JMP(addrs[pc_ret0 - 1] - addrs[i]);
+-						break;
+-					}
+-					CLEAR_A();
+-					EMIT_JMP(cleanup_addr - addrs[i]);
+-					break;
++					/* Abort the JIT because __load_pointer() is needed. */
++					goto out;
+ 				}
+ 				seen |= SEEN_DATAREF | SEEN_XREG;
+ 				t_offset = sk_load_byte_msh - (image + addrs[i]);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0134-net-fix-a-potential-rcu_read_lock-imbalance-in-rt6_f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0134-net-fix-a-potential-rcu_read_lock-imbalance-in-rt6_f.patch
new file mode 100644
index 0000000..c0f9663
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0134-net-fix-a-potential-rcu_read_lock-imbalance-in-rt6_f.patch
@@ -0,0 +1,50 @@
+From fa36f84193bedebf0fdfb861e5e9f1dd72044f64 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Tue, 27 Mar 2012 09:53:52 +0000
+Subject: [PATCH 134/147] net: fix a potential rcu_read_lock() imbalance in
+ rt6_fill_node()
+
+[ Upstream commit 94f826b8076e2cb92242061e92f21b5baa3eccc2 ]
+
+Commit f2c31e32b378 (net: fix NULL dereferences in check_peer_redir() )
+added a regression in rt6_fill_node(), leading to rcu_read_lock()
+imbalance.
+
+Thats because NLA_PUT() can make a jump to nla_put_failure label.
+
+Fix this by using nla_put()
+
+Many thanks to Ben Greear for his help
+
+Reported-by: Ben Greear <greearb@candelatech.com>
+Reported-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Tested-by: Ben Greear <greearb@candelatech.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv6/route.c |    8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/net/ipv6/route.c b/net/ipv6/route.c
+index b582a0a..059b9d9 100644
+--- a/net/ipv6/route.c
++++ b/net/ipv6/route.c
+@@ -2446,8 +2446,12 @@ static int rt6_fill_node(struct net *net,
+ 
+ 	rcu_read_lock();
+ 	n = dst_get_neighbour(&rt->dst);
+-	if (n)
+-		NLA_PUT(skb, RTA_GATEWAY, 16, &n->primary_key);
++	if (n) {
++		if (nla_put(skb, RTA_GATEWAY, 16, &n->primary_key) < 0) {
++			rcu_read_unlock();
++			goto nla_put_failure;
++		}
++	}
+ 	rcu_read_unlock();
+ 
+ 	if (rt->dst.dev)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0135-net-fix-napi_reuse_skb-skb-reserve.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0135-net-fix-napi_reuse_skb-skb-reserve.patch
new file mode 100644
index 0000000..b176c8b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0135-net-fix-napi_reuse_skb-skb-reserve.patch
@@ -0,0 +1,39 @@
+From 33dbbab6716bf8d3703ccb81a1e7e7084c4b8233 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Wed, 21 Mar 2012 06:58:03 +0000
+Subject: [PATCH 135/147] net: fix napi_reuse_skb() skb reserve
+
+[ Upstream commit 2a2a459eeeff48640dc557548ce576d666ab06ed ]
+
+napi->skb is allocated in napi_get_frags() using
+netdev_alloc_skb_ip_align(), with a reserve of NET_SKB_PAD +
+NET_IP_ALIGN bytes.
+
+However, when such skb is recycled in napi_reuse_skb(), it ends with a
+reserve of NET_IP_ALIGN which is suboptimal.
+
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Cc: Herbert Xu <herbert@gondor.apana.org.au>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/core/dev.c |    3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/net/core/dev.c b/net/core/dev.c
+index c56cacf..55cd370 100644
+--- a/net/core/dev.c
++++ b/net/core/dev.c
+@@ -3634,7 +3634,8 @@ EXPORT_SYMBOL(napi_gro_receive);
+ static void napi_reuse_skb(struct napi_struct *napi, struct sk_buff *skb)
+ {
+ 	__skb_pull(skb, skb_headlen(skb));
+-	skb_reserve(skb, NET_IP_ALIGN - skb_headroom(skb));
++	/* restore the reserve we had after netdev_alloc_skb_ip_align() */
++	skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN - skb_headroom(skb));
+ 	skb->vlan_tci = 0;
+ 	skb->dev = napi->dev;
+ 	skb->skb_iif = 0;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0136-Remove-printk-from-rds_sendmsg.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0136-Remove-printk-from-rds_sendmsg.patch
new file mode 100644
index 0000000..1164259
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0136-Remove-printk-from-rds_sendmsg.patch
@@ -0,0 +1,31 @@
+From 7a3d883bc2d70f61ca23b7778c945d7e4cf5e10a Mon Sep 17 00:00:00 2001
+From: Dave Jones <davej@redhat.com>
+Date: Mon, 19 Mar 2012 13:01:07 +0000
+Subject: [PATCH 136/147] Remove printk from rds_sendmsg
+
+[ Upstream commit a6506e1486181975d318344143aca722b2b91621 ]
+
+no socket layer outputs a message for this error and neither should rds.
+
+Signed-off-by: Dave Jones <davej@redhat.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/rds/send.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/net/rds/send.c b/net/rds/send.c
+index e2d63c5..96531d4 100644
+--- a/net/rds/send.c
++++ b/net/rds/send.c
+@@ -935,7 +935,6 @@ int rds_sendmsg(struct kiocb *iocb, struct socket *sock, struct msghdr *msg,
+ 	/* Mirror Linux UDP mirror of BSD error message compatibility */
+ 	/* XXX: Perhaps MSG_MORE someday */
+ 	if (msg->msg_flags & ~(MSG_DONTWAIT | MSG_CMSG_COMPAT)) {
+-		printk(KERN_INFO "msg_flags 0x%08X\n", msg->msg_flags);
+ 		ret = -EOPNOTSUPP;
+ 		goto out;
+ 	}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0137-sky2-override-for-PCI-legacy-power-management.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0137-sky2-override-for-PCI-legacy-power-management.patch
new file mode 100644
index 0000000..6e4cc9f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0137-sky2-override-for-PCI-legacy-power-management.patch
@@ -0,0 +1,52 @@
+From 82df145d92f585fd22bc74921a3dc184d54be9d3 Mon Sep 17 00:00:00 2001
+From: stephen hemminger <shemminger@vyatta.com>
+Date: Wed, 21 Mar 2012 05:32:05 +0000
+Subject: [PATCH 137/147] sky2: override for PCI legacy power management
+
+[ Upstream commit 5676cc7bfe1e388e87843f71daa229610385b41e ]
+
+Some BIOS's don't setup power management correctly (what else is
+new) and don't allow use of PCI Express power control. Add a special
+exception module parameter to allow working around this issue.
+Based on slightly different patch by Knut Petersen.
+
+Reported-by: Arkadiusz Miskiewicz <arekm@maven.pl>
+Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/marvell/sky2.c |   11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
+index 7803efa..f612b35 100644
+--- a/drivers/net/ethernet/marvell/sky2.c
++++ b/drivers/net/ethernet/marvell/sky2.c
+@@ -95,6 +95,10 @@ static int disable_msi = 0;
+ module_param(disable_msi, int, 0);
+ MODULE_PARM_DESC(disable_msi, "Disable Message Signaled Interrupt (MSI)");
+ 
++static int legacy_pme = 0;
++module_param(legacy_pme, int, 0);
++MODULE_PARM_DESC(legacy_pme, "Legacy power management");
++
+ static DEFINE_PCI_DEVICE_TABLE(sky2_id_table) = {
+ 	{ PCI_DEVICE(PCI_VENDOR_ID_SYSKONNECT, 0x9000) }, /* SK-9Sxx */
+ 	{ PCI_DEVICE(PCI_VENDOR_ID_SYSKONNECT, 0x9E00) }, /* SK-9Exx */
+@@ -867,6 +871,13 @@ static void sky2_wol_init(struct sky2_port *sky2)
+ 	/* Disable PiG firmware */
+ 	sky2_write16(hw, B0_CTST, Y2_HW_WOL_OFF);
+ 
++	/* Needed by some broken BIOSes, use PCI rather than PCI-e for WOL */
++	if (legacy_pme) {
++		u32 reg1 = sky2_pci_read32(hw, PCI_DEV_REG1);
++		reg1 |= PCI_Y2_PME_LEGACY;
++		sky2_pci_write32(hw, PCI_DEV_REG1, reg1);
++	}
++
+ 	/* block receiver */
+ 	sky2_write8(hw, SK_REG(port, RX_GMF_CTRL_T), GMF_RST_SET);
+ 	sky2_read32(hw, B0_CTST);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0138-xfrm-Access-the-replay-notify-functions-via-the-regi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0138-xfrm-Access-the-replay-notify-functions-via-the-regi.patch
new file mode 100644
index 0000000..d030cc7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0138-xfrm-Access-the-replay-notify-functions-via-the-regi.patch
@@ -0,0 +1,54 @@
+From eaa691b3cd85066e4f84583f7b818372c86a4bc2 Mon Sep 17 00:00:00 2001
+From: Steffen Klassert <steffen.klassert@secunet.com>
+Date: Wed, 21 Mar 2012 23:36:13 +0000
+Subject: [PATCH 138/147] xfrm: Access the replay notify functions via the
+ registered callbacks
+
+[ Upstream commit 1265fd616782ef03b98fd19f65c2b47fcd4ea11f ]
+
+We call the wrong replay notify function when we use ESN replay
+handling. This leads to the fact that we don't send notifications
+if we use ESN. Fix this by calling the registered callbacks instead
+of xfrm_replay_notify().
+
+Signed-off-by: Steffen Klassert <steffen.klassert@secunet.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/xfrm/xfrm_replay.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/net/xfrm/xfrm_replay.c b/net/xfrm/xfrm_replay.c
+index 39e02c5..2f6d11d 100644
+--- a/net/xfrm/xfrm_replay.c
++++ b/net/xfrm/xfrm_replay.c
+@@ -167,7 +167,7 @@ static void xfrm_replay_advance(struct xfrm_state *x, __be32 net_seq)
+ 	}
+ 
+ 	if (xfrm_aevent_is_on(xs_net(x)))
+-		xfrm_replay_notify(x, XFRM_REPLAY_UPDATE);
++		x->repl->notify(x, XFRM_REPLAY_UPDATE);
+ }
+ 
+ static int xfrm_replay_overflow_bmp(struct xfrm_state *x, struct sk_buff *skb)
+@@ -279,7 +279,7 @@ static void xfrm_replay_advance_bmp(struct xfrm_state *x, __be32 net_seq)
+ 	replay_esn->bmp[nr] |= (1U << bitnr);
+ 
+ 	if (xfrm_aevent_is_on(xs_net(x)))
+-		xfrm_replay_notify(x, XFRM_REPLAY_UPDATE);
++		x->repl->notify(x, XFRM_REPLAY_UPDATE);
+ }
+ 
+ static void xfrm_replay_notify_bmp(struct xfrm_state *x, int event)
+@@ -473,7 +473,7 @@ static void xfrm_replay_advance_esn(struct xfrm_state *x, __be32 net_seq)
+ 	replay_esn->bmp[nr] |= (1U << bitnr);
+ 
+ 	if (xfrm_aevent_is_on(xs_net(x)))
+-		xfrm_replay_notify(x, XFRM_REPLAY_UPDATE);
++		x->repl->notify(x, XFRM_REPLAY_UPDATE);
+ }
+ 
+ static struct xfrm_replay xfrm_replay_legacy = {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0139-lockd-fix-arg-parsing-for-grace_period-and-timeout.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0139-lockd-fix-arg-parsing-for-grace_period-and-timeout.patch
new file mode 100644
index 0000000..3e15c06
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0139-lockd-fix-arg-parsing-for-grace_period-and-timeout.patch
@@ -0,0 +1,40 @@
+From a0ef4bd55a5a7d190eeceb4d1626988af68a2f0e Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Tue, 7 Feb 2012 15:35:42 +1100
+Subject: [PATCH 139/147] lockd: fix arg parsing for grace_period and timeout.
+
+commit de5b8e8e047534aac6bc9803f96e7257436aef9c upstream.
+
+If you try to set grace_period or timeout via a module parameter
+to lockd, and do this on a big-endian machine where
+
+   sizeof(int) != sizeof(unsigned long)
+
+it won't work.  This number given will be effectively shifted right
+by the difference in those two sizes.
+
+So cast kp->arg properly to get correct result.
+
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: J. Bruce Fields <bfields@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/lockd/svc.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/lockd/svc.c b/fs/lockd/svc.c
+index c061b9a..2444780 100644
+--- a/fs/lockd/svc.c
++++ b/fs/lockd/svc.c
+@@ -440,7 +440,7 @@ static int param_set_##name(const char *val, struct kernel_param *kp)	\
+ 	__typeof__(type) num = which_strtol(val, &endp, 0);		\
+ 	if (endp == val || *endp || num < (min) || num > (max))		\
+ 		return -EINVAL;						\
+-	*((int *) kp->arg) = num;					\
++	*((type *) kp->arg) = num;					\
+ 	return 0;							\
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0140-x86-tsc-Skip-refined-tsc-calibration-on-systems-with.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0140-x86-tsc-Skip-refined-tsc-calibration-on-systems-with.patch
new file mode 100644
index 0000000..637e830
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0140-x86-tsc-Skip-refined-tsc-calibration-on-systems-with.patch
@@ -0,0 +1,62 @@
+From 6361e158f9827a43f7f20342c5f58a46ac003fb1 Mon Sep 17 00:00:00 2001
+From: Alok Kataria <akataria@vmware.com>
+Date: Tue, 21 Feb 2012 18:19:55 -0800
+Subject: [PATCH 140/147] x86, tsc: Skip refined tsc calibration on systems
+ with reliable TSC
+
+commit 57779dc2b3b75bee05ef5d1ada47f615f7a13932 upstream.
+
+While running the latest Linux as guest under VMware in highly
+over-committed situations, we have seen cases when the refined TSC
+algorithm fails to get a valid tsc_start value in
+tsc_refine_calibration_work from multiple attempts. As a result the
+kernel keeps on scheduling the tsc_irqwork task for later. Subsequently
+after several attempts when it gets a valid start value it goes through
+the refined calibration and either bails out or uses the new results.
+Given that the kernel originally read the TSC frequency from the
+platform, which is the best it can get, I don't think there is much
+value in refining it.
+
+So  for systems which get the TSC frequency from the platform we
+should skip the refined tsc algorithm.
+
+We can use the TSC_RELIABLE cpu cap flag to detect this, right now it is
+set only on VMware and for Moorestown Penwell both of which have there
+own TSC calibration methods.
+
+Signed-off-by: Alok N Kataria <akataria@vmware.com>
+Cc: John Stultz <johnstul@us.ibm.com>
+Cc: Dirk Brandewie <dirk.brandewie@gmail.com>
+Cc: Alan Cox <alan@linux.intel.com>
+[jstultz: Reworked to simply not schedule the refining work,
+rather then scheduling the work and bombing out later]
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/tsc.c |   10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/arch/x86/kernel/tsc.c b/arch/x86/kernel/tsc.c
+index db48336..3fe298a 100644
+--- a/arch/x86/kernel/tsc.c
++++ b/arch/x86/kernel/tsc.c
+@@ -934,6 +934,16 @@ static int __init init_tsc_clocksource(void)
+ 		clocksource_tsc.rating = 0;
+ 		clocksource_tsc.flags &= ~CLOCK_SOURCE_IS_CONTINUOUS;
+ 	}
++
++	/*
++	 * Trust the results of the earlier calibration on systems
++	 * exporting a reliable TSC.
++	 */
++	if (boot_cpu_has(X86_FEATURE_TSC_RELIABLE)) {
++		clocksource_register_khz(&clocksource_tsc, tsc_khz);
++		return 0;
++	}
++
+ 	schedule_delayed_work(&tsc_irqwork, 0);
+ 	return 0;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0141-x86-tls-Off-by-one-limit-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0141-x86-tls-Off-by-one-limit-check.patch
new file mode 100644
index 0000000..a4510ef
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0141-x86-tls-Off-by-one-limit-check.patch
@@ -0,0 +1,43 @@
+From 2d52fe6cb2d5afcd27d1c675484bdcbefaad6d2c Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Sat, 24 Mar 2012 10:52:50 +0300
+Subject: [PATCH 141/147] x86, tls: Off by one limit check
+
+commit 8f0750f19789cf352d7e24a6cc50f2ab1b4f1372 upstream.
+
+These are used as offsets into an array of GDT_ENTRY_TLS_ENTRIES members
+so GDT_ENTRY_TLS_ENTRIES is one past the end of the array.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Link: http://lkml.kernel.org/r/20120324075250.GA28258@elgon.mountain
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/tls.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/x86/kernel/tls.c b/arch/x86/kernel/tls.c
+index 6bb7b85..bcfec2d 100644
+--- a/arch/x86/kernel/tls.c
++++ b/arch/x86/kernel/tls.c
+@@ -163,7 +163,7 @@ int regset_tls_get(struct task_struct *target, const struct user_regset *regset,
+ {
+ 	const struct desc_struct *tls;
+ 
+-	if (pos > GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
++	if (pos >= GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
+ 	    (pos % sizeof(struct user_desc)) != 0 ||
+ 	    (count % sizeof(struct user_desc)) != 0)
+ 		return -EINVAL;
+@@ -198,7 +198,7 @@ int regset_tls_set(struct task_struct *target, const struct user_regset *regset,
+ 	struct user_desc infobuf[GDT_ENTRY_TLS_ENTRIES];
+ 	const struct user_desc *info;
+ 
+-	if (pos > GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
++	if (pos >= GDT_ENTRY_TLS_ENTRIES * sizeof(struct user_desc) ||
+ 	    (pos % sizeof(struct user_desc)) != 0 ||
+ 	    (count % sizeof(struct user_desc)) != 0)
+ 		return -EINVAL;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0142-compat-use-sys_sendfile64-implementation-for-sendfil.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0142-compat-use-sys_sendfile64-implementation-for-sendfil.patch
new file mode 100644
index 0000000..a93ecf8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0142-compat-use-sys_sendfile64-implementation-for-sendfil.patch
@@ -0,0 +1,40 @@
+From c6fc3006639bfddf212067de1c13a8345019d934 Mon Sep 17 00:00:00 2001
+From: Chris Metcalf <cmetcalf@tilera.com>
+Date: Mon, 26 Mar 2012 16:26:12 -0400
+Subject: [PATCH 142/147] compat: use sys_sendfile64() implementation for
+ sendfile syscall
+
+commit 1631fcea8399da5e80a80084b3b8c5bfd99d21e7 upstream.
+
+<asm-generic/unistd.h> was set up to use sys_sendfile() for the 32-bit
+compat API instead of sys_sendfile64(), but in fact the right thing to
+do is to use sys_sendfile64() in all cases.  The 32-bit sendfile64() API
+in glibc uses the sendfile64 syscall, so it has to be capable of doing
+full 64-bit operations.  But the sys_sendfile() kernel implementation
+has a MAX_NON_LFS test in it which explicitly limits the offset to 2^32.
+So, we need to use the sys_sendfile64() implementation in the kernel
+for this case.
+
+Acked-by: Arnd Bergmann <arnd@arndb.de>
+Signed-off-by: Chris Metcalf <cmetcalf@tilera.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/asm-generic/unistd.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/asm-generic/unistd.h b/include/asm-generic/unistd.h
+index 2292d1a..991ef01 100644
+--- a/include/asm-generic/unistd.h
++++ b/include/asm-generic/unistd.h
+@@ -218,7 +218,7 @@ __SC_COMP(__NR_pwritev, sys_pwritev, compat_sys_pwritev)
+ 
+ /* fs/sendfile.c */
+ #define __NR3264_sendfile 71
+-__SC_3264(__NR3264_sendfile, sys_sendfile64, sys_sendfile)
++__SYSCALL(__NR3264_sendfile, sys_sendfile64)
+ 
+ /* fs/select.c */
+ #define __NR_pselect6 72
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0143-rtc-Provide-flag-for-rtc-devices-that-don-t-support-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0143-rtc-Provide-flag-for-rtc-devices-that-don-t-support-.patch
new file mode 100644
index 0000000..1f20272
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0143-rtc-Provide-flag-for-rtc-devices-that-don-t-support-.patch
@@ -0,0 +1,76 @@
+From 04cb3b02d54277c9db7bf8b185f41839317e40b1 Mon Sep 17 00:00:00 2001
+From: John Stultz <john.stultz@linaro.org>
+Date: Tue, 6 Mar 2012 17:16:09 -0800
+Subject: [PATCH 143/147] rtc: Provide flag for rtc devices that don't support
+ UIE
+
+commit 4a649903f91232d02284d53724b0a45728111767 upstream.
+
+Richard Weinberger noticed that on some RTC hardware that
+doesn't support UIE mode, due to coarse granular alarms
+(like 1minute resolution), the current virtualized RTC
+support doesn't properly error out when UIE is enabled.
+
+Instead the current code queues an alarm for the next second,
+but it won't fire until up to a miniute later.
+
+This patch provides a generic way to flag this sort of hardware
+and fixes the issue on the mpc5121 where Richard noticed the
+problem.
+
+Reported-by: Richard Weinberger <richard@nod.at>
+Tested-by: Richard Weinberger <richard@nod.at>
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/rtc/interface.c   |    5 +++++
+ drivers/rtc/rtc-mpc5121.c |    2 ++
+ include/linux/rtc.h       |    3 ++-
+ 3 files changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/rtc/interface.c b/drivers/rtc/interface.c
+index c1edbf8..565742b 100644
+--- a/drivers/rtc/interface.c
++++ b/drivers/rtc/interface.c
+@@ -445,6 +445,11 @@ int rtc_update_irq_enable(struct rtc_device *rtc, unsigned int enabled)
+ 	if (rtc->uie_rtctimer.enabled == enabled)
+ 		goto out;
+ 
++	if (rtc->uie_unsupported) {
++		err = -EINVAL;
++		goto out;
++	}
++
+ 	if (enabled) {
+ 		struct rtc_time tm;
+ 		ktime_t now, onesec;
+diff --git a/drivers/rtc/rtc-mpc5121.c b/drivers/rtc/rtc-mpc5121.c
+index da60915..0fc2d22 100644
+--- a/drivers/rtc/rtc-mpc5121.c
++++ b/drivers/rtc/rtc-mpc5121.c
+@@ -360,6 +360,8 @@ static int __devinit mpc5121_rtc_probe(struct platform_device *op)
+ 						&mpc5200_rtc_ops, THIS_MODULE);
+ 	}
+ 
++	rtc->rtc->uie_unsupported = 1;
++
+ 	if (IS_ERR(rtc->rtc)) {
+ 		err = PTR_ERR(rtc->rtc);
+ 		goto out_free_irq;
+diff --git a/include/linux/rtc.h b/include/linux/rtc.h
+index 93f4d03..fcabfb4 100644
+--- a/include/linux/rtc.h
++++ b/include/linux/rtc.h
+@@ -202,7 +202,8 @@ struct rtc_device
+ 	struct hrtimer pie_timer; /* sub second exp, so needs hrtimer */
+ 	int pie_enabled;
+ 	struct work_struct irqwork;
+-
++	/* Some hardware can't support UIE mode */
++	int uie_unsupported;
+ 
+ #ifdef CONFIG_RTC_INTF_DEV_UIE_EMUL
+ 	struct work_struct uie_task;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0144-nfsd-don-t-allow-zero-length-strings-in-cache_parse.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0144-nfsd-don-t-allow-zero-length-strings-in-cache_parse.patch
new file mode 100644
index 0000000..de5ea80
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0144-nfsd-don-t-allow-zero-length-strings-in-cache_parse.patch
@@ -0,0 +1,35 @@
+From 43917d0f4bc9e7b8d6f0cafd29da95d52f587c58 Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Wed, 18 Jan 2012 12:56:02 +0300
+Subject: [PATCH 144/147] nfsd: don't allow zero length strings in
+ cache_parse()
+
+commit 6d8d17499810479eabd10731179c04b2ca22152f upstream.
+
+There is no point in passing a zero length string here and quite a
+few of that cache_parse() implementations will Oops if count is
+zero.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: J. Bruce Fields <bfields@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/sunrpc/cache.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/net/sunrpc/cache.c b/net/sunrpc/cache.c
+index 72ad836..4530a91 100644
+--- a/net/sunrpc/cache.c
++++ b/net/sunrpc/cache.c
+@@ -828,6 +828,8 @@ static ssize_t cache_do_downcall(char *kaddr, const char __user *buf,
+ {
+ 	ssize_t ret;
+ 
++	if (count == 0)
++		return -EINVAL;
+ 	if (copy_from_user(kaddr, buf, count))
+ 		return -EFAULT;
+ 	kaddr[count] = '\0';
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0145-serial-sh-sci-fix-a-race-of-DMA-submit_tx-on-transfe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0145-serial-sh-sci-fix-a-race-of-DMA-submit_tx-on-transfe.patch
new file mode 100644
index 0000000..14546aa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0145-serial-sh-sci-fix-a-race-of-DMA-submit_tx-on-transfe.patch
@@ -0,0 +1,91 @@
+From 3e2440eb910fa022dedfd93ecc868155dbd14fe1 Mon Sep 17 00:00:00 2001
+From: Yoshii Takashi <takashi.yoshii.zj@renesas.com>
+Date: Wed, 14 Mar 2012 16:14:43 +0900
+Subject: [PATCH 145/147] serial: sh-sci: fix a race of DMA submit_tx on
+ transfer
+
+commit 49d4bcaddca977fffdea8b0b71f6e5da96dac78e upstream.
+
+When DMA is enabled, sh-sci transfer begins with
+ uart_start()
+  sci_start_tx()
+    if (cookie_tx < 0) schedule_work()
+Then, starts DMA when wq scheduled, -- (A)
+ process_one_work()
+  work_fn_rx()
+   cookie_tx = desc->submit_tx()
+And finishes when DMA transfer ends, -- (B)
+ sci_dma_tx_complete()
+  async_tx_ack()
+  cookie_tx = -EINVAL
+  (possible another schedule_work())
+
+This A to B sequence is not reentrant, since controlling variables
+(for example, cookie_tx above) are not queues nor lists. So, they
+must be invoked as A B A B..., otherwise results in kernel crash.
+
+To ensure the sequence, sci_start_tx() seems to test if cookie_tx < 0
+(represents "not used") to call schedule_work().
+But cookie_tx will not be set (to a cookie, also means "used") until
+in the middle of work queue scheduled function work_fn_tx().
+
+This gap between the test and set allows the breakage of the sequence
+under the very frequently call of uart_start().
+Another gap between async_tx_ack() and another schedule_work() results
+in the same issue, too.
+
+This patch introduces a new condition "cookie_tx == 0" just to mark
+it is "busy" and assign it within spin-locked region to fill the gaps.
+
+Signed-off-by: Takashi Yoshii <takashi.yoshii.zj@renesas.com>
+Reviewed-by: Guennadi Liakhovetski <g.liakhovetski@gmx.de>
+Signed-off-by: Paul Mundt <lethal@linux-sh.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/serial/sh-sci.c |   15 ++++++++++-----
+ 1 file changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/tty/serial/sh-sci.c b/drivers/tty/serial/sh-sci.c
+index aff9d61..829e51a 100644
+--- a/drivers/tty/serial/sh-sci.c
++++ b/drivers/tty/serial/sh-sci.c
+@@ -1123,17 +1123,20 @@ static void sci_dma_tx_complete(void *arg)
+ 	port->icount.tx += sg_dma_len(&s->sg_tx);
+ 
+ 	async_tx_ack(s->desc_tx);
+-	s->cookie_tx = -EINVAL;
+ 	s->desc_tx = NULL;
+ 
+ 	if (uart_circ_chars_pending(xmit) < WAKEUP_CHARS)
+ 		uart_write_wakeup(port);
+ 
+ 	if (!uart_circ_empty(xmit)) {
++		s->cookie_tx = 0;
+ 		schedule_work(&s->work_tx);
+-	} else if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+-		u16 ctrl = sci_in(port, SCSCR);
+-		sci_out(port, SCSCR, ctrl & ~SCSCR_TIE);
++	} else {
++		s->cookie_tx = -EINVAL;
++		if (port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
++			u16 ctrl = sci_in(port, SCSCR);
++			sci_out(port, SCSCR, ctrl & ~SCSCR_TIE);
++		}
+ 	}
+ 
+ 	spin_unlock_irqrestore(&port->lock, flags);
+@@ -1395,8 +1398,10 @@ static void sci_start_tx(struct uart_port *port)
+ 	}
+ 
+ 	if (s->chan_tx && !uart_circ_empty(&s->port.state->xmit) &&
+-	    s->cookie_tx < 0)
++	    s->cookie_tx < 0) {
++		s->cookie_tx = 0;
+ 		schedule_work(&s->work_tx);
++	}
+ #endif
+ 
+ 	if (!s->chan_tx || port->type == PORT_SCIFA || port->type == PORT_SCIFB) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0146-ASPM-Fix-pcie-devices-with-non-pcie-children.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0146-ASPM-Fix-pcie-devices-with-non-pcie-children.patch
new file mode 100644
index 0000000..9d2291b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0146-ASPM-Fix-pcie-devices-with-non-pcie-children.patch
@@ -0,0 +1,72 @@
+From f1bc4d09cd5cb0d91b7ab742b0bc2c6ea7ed9a10 Mon Sep 17 00:00:00 2001
+From: Matthew Garrett <mjg@redhat.com>
+Date: Tue, 27 Mar 2012 10:17:41 -0400
+Subject: [PATCH 146/147] ASPM: Fix pcie devices with non-pcie children
+
+commit c9651e70ad0aa499814817cbf3cc1d0b806ed3a1 upstream.
+
+Since 3.2.12 and 3.3, some systems are failing to boot with a BUG_ON.
+Some other systems using the pata_jmicron driver fail to boot because no
+disks are detected.  Passing pcie_aspm=force on the kernel command line
+works around it.
+
+The cause: commit 4949be16822e ("PCI: ignore pre-1.1 ASPM quirking when
+ASPM is disabled") changed the behaviour of pcie_aspm_sanity_check() to
+always return 0 if aspm is disabled, in order to avoid cases where we
+changed ASPM state on pre-PCIe 1.1 devices.
+
+This skipped the secondary function of pcie_aspm_sanity_check which was
+to avoid us enabling ASPM on devices that had non-PCIe children, causing
+trouble later on.  Move the aspm_disabled check so we continue to honour
+that scenario.
+
+Addresses https://bugzilla.kernel.org/show_bug.cgi?id=42979 and
+          http://bugs.debian.org/665420
+
+Reported-by: Romain Francoise <romain@orebokech.com> # kernel panic
+Reported-by: Chris Holland <bandidoirlandes@gmail.com> # disk detection trouble
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+Tested-by: Hatem Masmoudi <hatem.masmoudi@gmail.com> # Dell Latitude E5520
+Tested-by: janek <jan0x6c@gmail.com> # pata_jmicron with JMB362/JMB363
+[jn: with more symptoms in log message]
+Signed-off-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/pci/pcie/aspm.c |   13 ++++++++++---
+ 1 file changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
+index 24f049e..2275162 100644
+--- a/drivers/pci/pcie/aspm.c
++++ b/drivers/pci/pcie/aspm.c
+@@ -500,9 +500,6 @@ static int pcie_aspm_sanity_check(struct pci_dev *pdev)
+ 	int pos;
+ 	u32 reg32;
+ 
+-	if (aspm_disabled)
+-		return 0;
+-
+ 	/*
+ 	 * Some functions in a slot might not all be PCIe functions,
+ 	 * very strange. Disable ASPM for the whole slot
+@@ -511,6 +508,16 @@ static int pcie_aspm_sanity_check(struct pci_dev *pdev)
+ 		pos = pci_pcie_cap(child);
+ 		if (!pos)
+ 			return -EINVAL;
++
++		/*
++		 * If ASPM is disabled then we're not going to change
++		 * the BIOS state. It's safe to continue even if it's a
++		 * pre-1.1 device
++		 */
++
++		if (aspm_disabled)
++			continue;
++
+ 		/*
+ 		 * Disable ASPM for pre-1.1 PCIe device, we follow MS to use
+ 		 * RBER bit to determine if a function is 1.1 version device
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0147-Linux-3.2.14.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0147-Linux-3.2.14.patch
new file mode 100644
index 0000000..6a9f27c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.14/0147-Linux-3.2.14.patch
@@ -0,0 +1,24 @@
+From 6c99e5e88e70f85b97e9363c80763e306ac3296c Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Mon, 2 Apr 2012 09:53:31 -0700
+Subject: [PATCH 147/147] Linux 3.2.14
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 172e041..afe4c7d 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 13
++SUBLEVEL = 14
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 16c0dd4..9a5d31f 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -12,7 +12,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -645,6 +645,153 @@ PATCHES_OVER_PSP = " \
 	file://3.2.13/0008-iwl3945-fix-possible-il-txq-NULL-pointer-dereference.patch \
 	file://3.2.13/0009-powerpc-pmac-Fix-SMP-kernels-on-pre-core99-UP-machin.patch \
 	file://3.2.13/0010-Linux-3.2.13.patch \
+	file://3.2.14/0001-USB-option-Add-MediaTek-MT6276M-modem-app-interfaces.patch \
+	file://3.2.14/0002-USB-option-driver-adding-support-for-Telit-CC864-SIN.patch \
+	file://3.2.14/0003-USB-option-make-interface-blacklist-work-again.patch \
+	file://3.2.14/0004-USB-option-add-ZTE-MF820D.patch \
+	file://3.2.14/0005-staging-zcache-avoid-AB-BA-deadlock-condition.patch \
+	file://3.2.14/0006-USB-ftdi_sio-fix-problem-when-the-manufacture-is-a-N.patch \
+	file://3.2.14/0007-USB-ftdi_sio-add-support-for-BeagleBone-rev-A5.patch \
+	file://3.2.14/0008-USB-Microchip-VID-mislabeled-as-Hornby-VID-in-ftdi_s.patch \
+	file://3.2.14/0009-USB-ftdi_sio-new-PID-Distortec-JTAG-lock-pick.patch \
+	file://3.2.14/0010-USB-ftdi_sio-add-support-for-FT-X-series-devices.patch \
+	file://3.2.14/0011-USB-ftdi_sio-new-PID-LUMEL-PD12.patch \
+	file://3.2.14/0012-powerpc-usb-fix-bug-of-kernel-hang-when-initializing.patch \
+	file://3.2.14/0013-staging-r8712u-Add-missing-initialization-and-remove.patch \
+	file://3.2.14/0014-staging-r8712u-Fix-regression-introduced-by-commit-a.patch \
+	file://3.2.14/0015-staging-r8712u-Fix-regression-in-signal-level-after-.patch \
+	file://3.2.14/0016-usb-dwc3-fix-bogus-test-in-dwc3_gadget_start_isoc.patch \
+	file://3.2.14/0017-usb-dwc3-use-proper-function-for-setting-endpoint-na.patch \
+	file://3.2.14/0018-usb-gadgetfs-return-number-of-bytes-on-ep0-read-requ.patch \
+	file://3.2.14/0019-USB-gadget-Make-g_hid-device-class-conform-to-spec.patch \
+	file://3.2.14/0020-futex-Cover-all-PI-opcodes-with-cmpxchg-enabled-chec.patch \
+	file://3.2.14/0021-sysfs-Fix-memory-leak-in-sysfs_sd_setsecdata.patch \
+	file://3.2.14/0022-tty-moxa-fix-bit-test-in-moxa_start.patch \
+	file://3.2.14/0023-TTY-Wrong-unicode-value-copied-in-con_set_unimap.patch \
+	file://3.2.14/0024-USB-serial-fix-console-error-reporting.patch \
+	file://3.2.14/0025-cdc-wdm-Fix-more-races-on-the-read-path.patch \
+	file://3.2.14/0026-cdc-wdm-Don-t-clear-WDM_READ-unless-entire-read-buff.patch \
+	file://3.2.14/0027-usb-fsl_udc_core-Fix-scheduling-while-atomic-dump-me.patch \
+	file://3.2.14/0028-usb-Fix-build-error-due-to-dma_mask-is-not-at-pdev_a.patch \
+	file://3.2.14/0029-USB-ums_realtek-do-not-use-stack-memory-for-DMA-in-_.patch \
+	file://3.2.14/0030-USB-qcserial-add-several-new-serial-devices.patch \
+	file://3.2.14/0031-USB-qcserial-don-t-grab-QMI-port-on-Gobi-1000-device.patch \
+	file://3.2.14/0032-usb-serial-Add-support-for-the-Sealevel-SeaLINK-8-20.patch \
+	file://3.2.14/0033-usb-cp210x-Update-to-support-CP2105-and-multiple-int.patch \
+	file://3.2.14/0034-USB-serial-mos7840-Fixed-MCS7820-device-attach-probl.patch \
+	file://3.2.14/0035-rt2x00-Add-support-for-D-Link-DWA-127-to-rt2800usb.patch \
+	file://3.2.14/0036-rtlwifi-rtl8192c_common-rtl8192de-Check-for-allocati.patch \
+	file://3.2.14/0037-rtlwifi-Handle-previous-allocation-failures-when-fre.patch \
+	file://3.2.14/0038-rtlwifi-rtl8192c-Prevent-sleeping-from-invalid-conte.patch \
+	file://3.2.14/0039-rtlwifi-rtl8192ce-Fix-loss-of-receive-performance.patch \
+	file://3.2.14/0040-iwlwifi-always-monitor-for-stuck-queues.patch \
+	file://3.2.14/0041-math-Introduce-div64_long.patch \
+	file://3.2.14/0042-ntp-Fix-integer-overflow-when-setting-time.patch \
+	file://3.2.14/0043-uevent-send-events-in-correct-order-according-to-seq.patch \
+	file://3.2.14/0044-genirq-Fix-long-term-regression-in-genirq-irq_set_ir.patch \
+	file://3.2.14/0045-genirq-Fix-incorrect-check-for-forced-IRQ-thread-han.patch \
+	file://3.2.14/0046-rtc-Disable-the-alarm-in-the-hardware-v2.patch \
+	file://3.2.14/0047-p54spi-Release-GPIO-lines-and-IRQ-on-error-in-p54spi.patch \
+	file://3.2.14/0048-rtnetlink-Fix-VF-IFLA-policy.patch \
+	file://3.2.14/0049-IB-iser-Post-initial-receive-buffers-before-sending-.patch \
+	file://3.2.14/0050-ima-fix-Kconfig-dependencies.patch \
+	file://3.2.14/0051-x86-ioapic-Add-register-level-checks-to-detect-bogus.patch \
+	file://3.2.14/0052-mm-thp-fix-pmd_bad-triggering-in-code-paths-holding-.patch \
+	file://3.2.14/0053-TPM-Zero-buffer-whole-after-copying-to-userspace.patch \
+	file://3.2.14/0054-PM-Domains-Fix-handling-of-wakeup-devices-during-sys.patch \
+	file://3.2.14/0055-bootmem-sparsemem-remove-limit-constraint-in-alloc_b.patch \
+	file://3.2.14/0056-hugetlbfs-avoid-taking-i_mutex-from-hugetlbfs_read.patch \
+	file://3.2.14/0057-ASoC-fsl-p1022ds-tell-the-WM8776-codec-driver-that-i.patch \
+	file://3.2.14/0058-ASoC-pxa-ssp-atomically-set-stream-active-masks.patch \
+	file://3.2.14/0059-tcm_loop-Set-residual-field-for-SCSI-commands.patch \
+	file://3.2.14/0060-iscsi-target-Fix-iscsit_alloc_buffs-failure-cases.patch \
+	file://3.2.14/0061-iscsi-target-Fix-dynamic-explict-NodeACL-pointer-ref.patch \
+	file://3.2.14/0062-ALSA-hda-fix-printing-of-high-HDMI-sample-rates.patch \
+	file://3.2.14/0063-usb-gadget-fix-a-section-mismatch-when-compiling-g_f.patch \
+	file://3.2.14/0064-udlfb-remove-sysfs-framebuffer-device-with-USB-.disc.patch \
+	file://3.2.14/0065-tcm_fc-Fix-fc_exch-memory-leak-in-ft_send_resp_statu.patch \
+	file://3.2.14/0066-md-bitmap-ensure-to-load-bitmap-when-creating-via-sy.patch \
+	file://3.2.14/0067-md-don-t-set-md-arrays-to-readonly-on-shutdown.patch \
+	file://3.2.14/0068-md-raid1-raid10-avoid-deadlock-during-resync-recover.patch \
+	file://3.2.14/0069-md-fix-clearing-of-the-changed-flags-for-the-bad-blo.patch \
+	file://3.2.14/0070-drm-i915-Only-clear-the-GPU-domains-upon-a-successfu.patch \
+	file://3.2.14/0071-drm-radeon-Restrict-offset-for-legacy-hardware-curso.patch \
+	file://3.2.14/0072-drm-radeon-kms-fix-analog-load-detection-on-DVI-I-co.patch \
+	file://3.2.14/0073-drm-radeon-kms-add-connector-quirk-for-Fujitsu-D3003.patch \
+	file://3.2.14/0074-target-Don-t-set-WBUS16-or-SYNC-bits-in-INQUIRY-resp.patch \
+	file://3.2.14/0075-target-fix-use-after-free-in-target_report_luns.patch \
+	file://3.2.14/0076-target-prevent-NULL-pointer-dereference-in-target_re.patch \
+	file://3.2.14/0077-target-Fix-16-bit-target-ports-for-SET-TARGET-PORT-G.patch \
+	file://3.2.14/0078-Bluetooth-Add-AR30XX-device-ID-on-Asus-laptops.patch \
+	file://3.2.14/0079-HID-add-extra-hotkeys-in-Asus-AIO-keyboards.patch \
+	file://3.2.14/0080-HID-add-more-hotkeys-in-Asus-AIO-keyboards.patch \
+	file://3.2.14/0081-pata_legacy-correctly-mask-recovery-field-for-HT6560.patch \
+	file://3.2.14/0082-firewire-ohci-fix-too-early-completion-of-IR-multich.patch \
+	file://3.2.14/0083-KVM-x86-extend-struct-x86_emulate_ops-with-get_cpuid.patch \
+	file://3.2.14/0084-KVM-x86-fix-missing-checks-in-syscall-emulation.patch \
+	file://3.2.14/0085-NFS-Properly-handle-the-case-where-the-delegation-is.patch \
+	file://3.2.14/0086-NFSv4-Return-the-delegation-if-the-server-returns-NF.patch \
+	file://3.2.14/0087-xfs-fix-inode-lookup-race.patch \
+	file://3.2.14/0088-CIFS-Respect-negotiated-MaxMpxCount.patch \
+	file://3.2.14/0089-cifs-fix-issue-mounting-of-DFS-ROOT-when-redirecting.patch \
+	file://3.2.14/0090-CIFS-Fix-a-spurious-error-in-cifs_push_posix_locks.patch \
+	file://3.2.14/0091-UBI-fix-error-handling-in-ubi_scan.patch \
+	file://3.2.14/0092-UBI-fix-eraseblock-picking-criteria.patch \
+	file://3.2.14/0093-SUNRPC-We-must-not-use-list_for_each_entry_safe-in-r.patch \
+	file://3.2.14/0094-usbnet-increase-URB-reference-count-before-usb_unlin.patch \
+	file://3.2.14/0095-usbnet-don-t-clear-urb-dev-in-tx_complete.patch \
+	file://3.2.14/0096-e1000e-Avoid-wrong-check-on-TX-hang.patch \
+	file://3.2.14/0097-x86-32-Fix-endless-loop-when-processing-signals-for-.patch \
+	file://3.2.14/0098-proc-ns-use-d_set_d_op-API-to-set-dentry-ops-in-proc.patch \
+	file://3.2.14/0099-iommu-amd-Fix-section-warning-for-prealloc_protectio.patch \
+	file://3.2.14/0100-sysctl-protect-poll-in-entries-that-may-go-away.patch \
+	file://3.2.14/0101-hwmon-fam15h_power-Correct-sign-extension-of-running.patch \
+	file://3.2.14/0102-lgdt330x-fix-signedness-error-in-i2c_read_demod_byte.patch \
+	file://3.2.14/0103-pvrusb2-fix-7MHz-8MHz-DVB-T-tuner-support-for-HVR190.patch \
+	file://3.2.14/0104-mxl111sf-fix-error-on-stream-stop-in-mxl111sf_ep6_st.patch \
+	file://3.2.14/0105-NFSv4-Rate-limit-the-state-manager-warning-messages.patch \
+	file://3.2.14/0106-PM-Hibernate-Enable-usermodehelpers-in-hibernate-err.patch \
+	file://3.2.14/0107-jbd2-clear-BH_Delay-BH_Unwritten-in-journal_unmap_bu.patch \
+	file://3.2.14/0108-ext4-ignore-EXT4_INODE_JOURNAL_DATA-flag-with-delall.patch \
+	file://3.2.14/0109-ext4-fix-race-between-unwritten-extent-conversion-an.patch \
+	file://3.2.14/0110-ext4-fix-race-between-sync-and-completed-io-work.patch \
+	file://3.2.14/0111-ext4-check-for-zero-length-extent.patch \
+	file://3.2.14/0112-vfs-fix-d_ancestor-case-in-d_materialize_unique.patch \
+	file://3.2.14/0113-ARM-tegra-select-required-CPU-and-L2-errata-options.patch \
+	file://3.2.14/0114-udf-Fix-deadlock-in-udf_release_file.patch \
+	file://3.2.14/0115-gpio-omap-fix-_set_gpio_irqenable-implementation.patch \
+	file://3.2.14/0116-gpio-davinci-fix-oops-on-unbanked-gpio-irq-request.patch \
+	file://3.2.14/0117-gpio-davinci-fix-enabling-unbanked-GPIO-IRQs.patch \
+	file://3.2.14/0118-dm-crypt-fix-mempool-deadlock.patch \
+	file://3.2.14/0119-dm-crypt-add-missing-error-handling.patch \
+	file://3.2.14/0120-dm-exception-store-fix-init-error-path.patch \
+	file://3.2.14/0121-dm-persistent-data-fix-btree-rebalancing-after-remov.patch \
+	file://3.2.14/0122-dm-thin-fix-stacked-bi_next-usage.patch \
+	file://3.2.14/0123-backlight-fix-typo-in-tosa_lcd.c.patch \
+	file://3.2.14/0124-xfs-Fix-oops-on-IO-error-during-xlog_recover_process.patch \
+	file://3.2.14/0125-slub-Do-not-hold-slub_lock-when-calling-sysfs_slab_a.patch \
+	file://3.2.14/0126-NFSv4-Fix-two-infinite-loops-in-the-mount-code.patch \
+	file://3.2.14/0127-NFSv4.1-Fix-layoutcommit-error-handling.patch \
+	file://3.2.14/0128-module-Remove-module-size-limit.patch \
+	file://3.2.14/0129-Bluetooth-btusb-fix-bInterval-for-high-super-speed-i.patch \
+	file://3.2.14/0130-drm-i915-suspend-fbdev-device-around-suspend-hiberna.patch \
+	file://3.2.14/0131-Fix-pppol2tp-getsockname.patch \
+	file://3.2.14/0132-ipv6-fix-incorrent-ipv6-ipsec-packet-fragment.patch \
+	file://3.2.14/0133-net-bpf_jit-fix-BPF_S_LDX_B_MSH-compilation.patch \
+	file://3.2.14/0134-net-fix-a-potential-rcu_read_lock-imbalance-in-rt6_f.patch \
+	file://3.2.14/0135-net-fix-napi_reuse_skb-skb-reserve.patch \
+	file://3.2.14/0136-Remove-printk-from-rds_sendmsg.patch \
+	file://3.2.14/0137-sky2-override-for-PCI-legacy-power-management.patch \
+	file://3.2.14/0138-xfrm-Access-the-replay-notify-functions-via-the-regi.patch \
+	file://3.2.14/0139-lockd-fix-arg-parsing-for-grace_period-and-timeout.patch \
+	file://3.2.14/0140-x86-tsc-Skip-refined-tsc-calibration-on-systems-with.patch \
+	file://3.2.14/0141-x86-tls-Off-by-one-limit-check.patch \
+	file://3.2.14/0142-compat-use-sys_sendfile64-implementation-for-sendfil.patch \
+	file://3.2.14/0143-rtc-Provide-flag-for-rtc-devices-that-don-t-support-.patch \
+	file://3.2.14/0144-nfsd-don-t-allow-zero-length-strings-in-cache_parse.patch \
+	file://3.2.14/0145-serial-sh-sci-fix-a-race-of-DMA-submit_tx-on-transfe.patch \
+	file://3.2.14/0146-ASPM-Fix-pcie-devices-with-non-pcie-children.patch \
+	file://3.2.14/0147-Linux-3.2.14.patch \
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
-- 
1.7.2.5


