Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50923E01405
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 00:48:54 -0800 (PST)
Received: by mail-we0-f181.google.com with SMTP id m13so225603wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 00:48:54 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.107.169 as permitted sender)
	client-ip=10.180.107.169; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.107.169 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.107.169])
	by 10.180.107.169 with SMTP id hd9mr8312223wib.0.1330591734046
	(num_hops = 1); Thu, 01 Mar 2012 00:48:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.107.169 with SMTP id hd9mr6640022wib.0.1330591733746;
	Thu, 01 Mar 2012 00:48:53 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id gp8sm40301277wib.5.2012.03.01.00.48.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:48:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  1 Mar 2012 09:48:36 +0100
Message-Id: <1330591716-30218-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
References: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkgg6qB05qSGyQN9pySq1zGxn7wcjLe1MWovWOs2lhRkbLJcyT7ouynEAO0FQ9kzSdv0b3K
Subject: [PATCH 3/3] linux-ti33x-psp 3.2: update to 3.2.9 and add 2 patches from PSP tree
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
X-List-Received-Date: Thu, 01 Mar 2012 08:48:55 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...am33xx-fix-serial-mux-warnings-for-am33xx.patch |   39 ++
 ...MAP2-am335x-correct-McASP0-pin-mux-detail.patch |   29 ++
 .../3.2.7/0001-ixgbe-fix-vf-lookup.patch           |   42 ++
 .../3.2.7/0002-igb-fix-vf-lookup.patch             |   42 ++
 ...Fix-an-issue-where-perf-report-fails-to-s.patch |   64 +++
 ...Fix-perf-stack-to-non-executable-on-x86_6.patch |   55 +++
 ...rce-explicit-bpp-selection-for-intel_dp_l.patch |   99 ++++
 ...006-drm-i915-no-lvds-quirk-for-AOpen-MP45.patch |   40 ++
 ...-kernel-panic-during-driver-initilization.patch |   96 ++++
 ...ath9k-fix-a-WEP-crypto-related-regression.patch |   45 ++
 ...ath9k_hw-fix-a-RTS-CTS-timeout-regression.patch |   52 ++
 ...75375s-Fix-bit-shifting-in-f75375_write16.patch |   33 ++
 .../0011-net-enable-TC35815-for-MIPS-again.patch   |   41 ++
 ...ion-lower-PROP_MAX_SHIFT-to-32-on-64-bit-.patch |   48 ++
 ...ay-prevent-integer-overflow-in-relay_open.patch |   50 ++
 ...meout-a-single-frame-in-the-rx-reorder-bu.patch |   36 ++
 ...ix-NULL-bdi-dev-in-trace-writeback_single.patch |   72 +++
 ...ix-dereferencing-NULL-bdi-dev-on-trace_wr.patch |   44 ++
 ...5s-Fix-automatic-pwm-mode-setting-for-F75.patch |   34 ++
 ...-request-oplock-when-doing-open-on-lookup.patch |   32 ++
 ...return-error-from-standard_receive3-after.patch |   50 ++
 ...-sha512-Use-binary-and-instead-of-modulus.patch |   42 ++
 ...1-crypto-sha512-Avoid-stack-bloat-on-i386.patch |  113 +++++
 ...-fix-wakeup-timer-races-with-bdi_unregist.patch |   95 ++++
 ...x0-Fix-default-inaudible-sound-on-Gateway.patch |   42 ++
 ...x-initialization-of-secondary-capture-sou.patch |   41 ++
 ...x-silent-speaker-output-on-Acer-Aspire-69.patch |   78 +++
 ...ci-save-and-restore-sdioirq-when-soft-res.patch |   42 ++
 ..._mmc-Fix-PIO-mode-with-support-of-highmem.patch |  353 ++++++++++++++
 ...o-not-remap-pirqs-onto-evtchns-if-xen_hav.patch |   31 ++
 .../0029-crypto-sha512-use-standard-ror64.patch    |   90 ++++
 .../3.2.7/0030-Linux-3.2.7.patch                   |   24 +
 ...-math_state_restore-isn-t-called-from-asm.patch |   53 ++
 ...387-make-irq_fpu_usable-tests-more-robust.patch |  131 +++++
 .../0003-i387-fix-sense-of-sanity-check.patch      |   37 ++
 ...6-64-preemption-unsafe-user-stack-save-re.patch |  163 +++++++
 ...S_USEDFPU-clearing-out-of-__save_init_fpu.patch |   64 +++
 ...ever-touch-TS_USEDFPU-directly-use-helper.patch |  228 +++++++++
 ...not-preload-FPU-state-at-task-switch-time.patch |  202 ++++++++
 ...MD-K7-K8-fpu-fxsave-fxrstor-workaround-fr.patch |  133 +++++
 ...S_USEDFPU-flag-from-thread_info-to-task_s.patch |  305 ++++++++++++
 ...roduce-FPU-state-preloading-at-context-sw.patch |  353 ++++++++++++++
 .../3.2.8/0011-Linux-3.2.8.patch                   |   24 +
 .../0001-Security-tomoyo-add-.gitignore-file.patch |   32 ++
 ...f-power_pmu_start-restores-incorrect-valu.patch |   58 +++
 ...1-USB-AT91-gadget-registration-for-module.patch |   78 +++
 ...04-drm-radeon-kms-fix-MSI-re-arm-on-rv370.patch |   54 ++
 ...5-PCI-workaround-hard-wired-bus-number-V2.patch |   44 ++
 .../0006-mac80211-Fix-a-rwlock-bad-magic-bug.patch |   91 ++++
 .../3.2.9/0007-ipheth-Add-iPhone-4S.patch          |   43 ++
 ...cache-defaults-initialization-from-raw-ca.patch |   53 ++
 ...py-up-lower-inode-attrs-after-setting-low.patch |   43 ++
 ...t-ktime-to-tod-clock-comparator-conversio.patch |   44 ++
 ...11-vfs-fix-d_inode_lookup-dentry-ref-leak.patch |   35 ++
 ...PL330-fix-null-pointer-dereference-in-pl3.patch |   45 ++
 ...a-Fix-redundant-jack-creations-for-cx5051.patch |   68 +++
 ...mmc-core-check-for-zero-length-ioctl-data.patch |  137 ++++++
 ...FSv4-Fix-an-Oops-in-the-NFSv4-getacl-code.patch |   98 ++++
 ...e-we-throw-out-bad-delegation-stateids-on.patch |   33 ++
 .../0017-NFSv4-fix-server_scope-memory-leak.patch  |   55 +++
 ...cache-v7-Disable-preemption-when-reading-.patch |   61 +++
 ...M-7325-1-fix-v7-boot-with-lockdep-enabled.patch |   61 +++
 ...9x-shorten-timer-period-for-slave-devices.patch |   42 ++
 ...roxy-arp-respond-if-iif-rt-dst.dev-if-pri.patch |   43 ++
 ...-netpoll_poll_dev-should-access-dev-flags.patch |   35 ++
 .../0023-net_sched-Bug-in-netem-reordering.patch   |   42 ++
 ...th-Enforce-minimum-size-of-VETH_INFO_PEER.patch |   37 ++
 .../3.2.9/0025-via-velocity-S3-resume-fix.patch    |   37 ++
 ...4-reset-flowi-parameters-on-route-connect.patch |   90 ++++
 ..._reset-binding-oif-to-iif-in-no-sock-case.patch |   47 ++
 ...ong-order-of-ip_rt_get_source-and-update-.patch |   38 ++
 ...ke-qdisc_skb_cb-upper-size-bound-explicit.patch |   90 ++++
 ...lying-about-hard_header_len-and-use-skb-c.patch |  213 ++++++++
 .../0031-gro-more-generic-L2-header-check.patch    |   61 +++
 ...cp_sacktag_one-to-tag-ranges-not-aligned-.patch |  119 +++++
 ...ge-tcp_shifted_skb-passes-to-tcp_sacktag_.patch |   77 +++
 ..._shifted_skb-adjustment-of-lost_cnt_hint-.patch |   42 ++
 ...Kamstrup-VID-PIDs-to-cp210x-serial-driver.patch |   29 ++
 ...n-cleanup-zte-3g-dongle-s-pid-in-option.c.patch |  246 ++++++++++
 ...ti_usb_3410_5052-Add-Abbot-Diabetes-Care-.patch |   76 +++
 ...ove-duplicate-USB-3.0-hub-feature-defines.patch |   74 +++
 ...andoff-when-BIOS-disables-host-PCI-device.patch |   69 +++
 ...ps-caused-by-more-USB2-ports-than-USB3-po.patch |   39 ++
 ...Fix-encoding-for-HS-bulk-control-NAK-rate.patch |   98 ++++
 ...fail-USB3-probe-on-missing-legacy-PCI-IRQ.patch |   80 +++
 ...43-USB-Set-hub-depth-after-USB3-hub-reset.patch |   86 ++++
 ...orage-fix-freezing-of-the-scanning-thread.patch |  213 ++++++++
 ...arget-Allow-control-CDBs-with-data-1-page.patch |  513 ++++++++++++++++++++
 ...SoC-wm8962-Fix-sidetone-enumeration-texts.patch |   31 ++
 ...altek-Fix-overflow-of-vol-sw-check-bitmap.patch |   61 +++
 ...altek-Fix-surround-output-regression-on-A.patch |   53 ++
 ...i_mmap_mutex-for-access-to-the-VMA-prio-l.patch |   76 +++
 ...wmon-max6639-Fix-FAN_FROM_REG-calculation.patch |   46 ++
 ...39-Fix-PPR-register-initialization-to-set.patch |   65 +++
 ...n-ads1015-Fix-file-leak-in-probe-function.patch |   43 ++
 ...fix-oops-in-drivers-video-omap2-dss-dpi.c.patch |  113 +++++
 ...x-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch |   74 +++
 ...-L1i-and-L2-cache-sharing-information-for.patch |  100 ++++
 ...on-rates-with-idx-1-in-ath9k-rate-control.patch |   41 ++
 ...sk-oneshot-irqs-when-thread-was-not-woken.patch |   81 +++
 ...genirq-Handle-pending-irqs-in-irq_startup.patch |  117 +++++
 ...ix-Poison-overwritten-warning-caused-by-u.patch |  104 ++++
 ...-bug-in-the-SCSI-power-management-handler.patch |  106 ++++
 ...tching-of-fwmark-templates-during-schedul.patch |   47 ++
 .../3.2.9/0062-jme-Fix-FIFO-flush-issue.patch      |   63 +++
 ...c-Do-not-free-all-rx-dma-descriptors-duri.patch |   72 +++
 ...n-t-create-files-in-tmp-with-predictable-.patch |   47 ++
 ...-fix-isr-hang-when-hw-is-unplugged-under-.patch |   67 +++
 ...x-race-conditon-during-start-of-streaming.patch |   39 ++
 ...on-t-wedge-hardware-after-early-callbacks.patch |  107 ++++
 ...5s-Fix-register-write-order-when-setting-.patch |   48 ++
 ...duce-POLLFREE-to-flush-signalfd_wqh-befor.patch |  164 +++++++
 ...register_pollwait-can-use-the-freed-pwq-w.patch |  116 +++++
 .../3.2.9/0071-epoll-limit-paths.patch             |  475 ++++++++++++++++++
 ...-use-copy_to_user-without-the-underscores.patch |   56 +++
 .../3.2.9/0073-Linux-3.2.9.patch                   |   24 +
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  118 +++++-
 118 files changed, 9910 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0022-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/0023-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0001-ixgbe-fix-vf-lookup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0002-igb-fix-vf-lookup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0003-perf-evsel-Fix-an-issue-where-perf-report-fails-to-s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0004-perf-tools-Fix-perf-stack-to-non-executable-on-x86_6.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0005-drm-i915-Force-explicit-bpp-selection-for-intel_dp_l.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0006-drm-i915-no-lvds-quirk-for-AOpen-MP45.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0007-ath9k-Fix-kernel-panic-during-driver-initilization.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0008-ath9k-fix-a-WEP-crypto-related-regression.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0009-ath9k_hw-fix-a-RTS-CTS-timeout-regression.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0010-hwmon-f75375s-Fix-bit-shifting-in-f75375_write16.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0011-net-enable-TC35815-for-MIPS-again.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0012-lib-proportion-lower-PROP_MAX_SHIFT-to-32-on-64-bit-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0013-relay-prevent-integer-overflow-in-relay_open.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0014-mac80211-timeout-a-single-frame-in-the-rx-reorder-bu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0015-writeback-fix-NULL-bdi-dev-in-trace-writeback_single.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0016-writeback-fix-dereferencing-NULL-bdi-dev-on-trace_wr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0017-hwmon-f75375s-Fix-automatic-pwm-mode-setting-for-F75.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0018-cifs-request-oplock-when-doing-open-on-lookup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0019-cifs-don-t-return-error-from-standard_receive3-after.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0020-crypto-sha512-Use-binary-and-instead-of-modulus.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0021-crypto-sha512-Avoid-stack-bloat-on-i386.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0022-backing-dev-fix-wakeup-timer-races-with-bdi_unregist.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0023-ALSA-intel8x0-Fix-default-inaudible-sound-on-Gateway.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0024-ALSA-hda-Fix-initialization-of-secondary-capture-sou.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0025-ALSA-hda-Fix-silent-speaker-output-on-Acer-Aspire-69.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0026-mmc-atmel-mci-save-and-restore-sdioirq-when-soft-res.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0027-mmc-dw_mmc-Fix-PIO-mode-with-support-of-highmem.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0028-xen-pvhvm-do-not-remap-pirqs-onto-evtchns-if-xen_hav.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0029-crypto-sha512-use-standard-ror64.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0030-Linux-3.2.7.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0001-i387-math_state_restore-isn-t-called-from-asm.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0002-i387-make-irq_fpu_usable-tests-more-robust.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0003-i387-fix-sense-of-sanity-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0004-i387-fix-x86-64-preemption-unsafe-user-stack-save-re.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0005-i387-move-TS_USEDFPU-clearing-out-of-__save_init_fpu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0006-i387-don-t-ever-touch-TS_USEDFPU-directly-use-helper.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0007-i387-do-not-preload-FPU-state-at-task-switch-time.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0008-i387-move-AMD-K7-K8-fpu-fxsave-fxrstor-workaround-fr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0009-i387-move-TS_USEDFPU-flag-from-thread_info-to-task_s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0010-i387-re-introduce-FPU-state-preloading-at-context-sw.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0011-Linux-3.2.8.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0001-Security-tomoyo-add-.gitignore-file.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0002-powerpc-perf-power_pmu_start-restores-incorrect-valu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0003-ARM-at91-USB-AT91-gadget-registration-for-module.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0004-drm-radeon-kms-fix-MSI-re-arm-on-rv370.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0005-PCI-workaround-hard-wired-bus-number-V2.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0006-mac80211-Fix-a-rwlock-bad-magic-bug.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0007-ipheth-Add-iPhone-4S.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0008-regmap-Fix-cache-defaults-initialization-from-raw-ca.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0009-eCryptfs-Copy-up-lower-inode-attrs-after-setting-low.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0010-S390-correct-ktime-to-tod-clock-comparator-conversio.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0011-vfs-fix-d_inode_lookup-dentry-ref-leak.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0012-ARM-7326-2-PL330-fix-null-pointer-dereference-in-pl3.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0013-ALSA-hda-Fix-redundant-jack-creations-for-cx5051.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0014-mmc-core-check-for-zero-length-ioctl-data.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0015-NFSv4-Fix-an-Oops-in-the-NFSv4-getacl-code.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0016-NFSv4-Ensure-we-throw-out-bad-delegation-stateids-on.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0017-NFSv4-fix-server_scope-memory-leak.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0018-ARM-7321-1-cache-v7-Disable-preemption-when-reading-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0019-ARM-7325-1-fix-v7-boot-with-lockdep-enabled.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0020-3c59x-shorten-timer-period-for-slave-devices.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0021-net-Don-t-proxy-arp-respond-if-iif-rt-dst.dev-if-pri.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0022-netpoll-netpoll_poll_dev-should-access-dev-flags.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0023-net_sched-Bug-in-netem-reordering.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0024-veth-Enforce-minimum-size-of-VETH_INFO_PEER.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0025-via-velocity-S3-resume-fix.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0026-ipv4-reset-flowi-parameters-on-route-connect.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0027-tcp_v4_send_reset-binding-oif-to-iif-in-no-sock-case.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0028-ipv4-Fix-wrong-order-of-ip_rt_get_source-and-update-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0029-net-Make-qdisc_skb_cb-upper-size-bound-explicit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0030-IPoIB-Stop-lying-about-hard_header_len-and-use-skb-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0031-gro-more-generic-L2-header-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0032-tcp-allow-tcp_sacktag_one-to-tag-ranges-not-aligned-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0033-tcp-fix-range-tcp_shifted_skb-passes-to-tcp_sacktag_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0034-tcp-fix-tcp_shifted_skb-adjustment-of-lost_cnt_hint-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0035-USB-Added-Kamstrup-VID-PIDs-to-cp210x-serial-driver.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0036-USB-option-cleanup-zte-3g-dongle-s-pid-in-option.c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0037-USB-Serial-ti_usb_3410_5052-Add-Abbot-Diabetes-Care-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0038-USB-Remove-duplicate-USB-3.0-hub-feature-defines.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0039-USB-Fix-handoff-when-BIOS-disables-host-PCI-device.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0040-xhci-Fix-oops-caused-by-more-USB2-ports-than-USB3-po.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0041-xhci-Fix-encoding-for-HS-bulk-control-NAK-rate.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0042-USB-Don-t-fail-USB3-probe-on-missing-legacy-PCI-IRQ.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0043-USB-Set-hub-depth-after-USB3-hub-reset.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0044-usb-storage-fix-freezing-of-the-scanning-thread.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0045-target-Allow-control-CDBs-with-data-1-page.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0046-ASoC-wm8962-Fix-sidetone-enumeration-texts.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0047-ALSA-hda-realtek-Fix-overflow-of-vol-sw-check-bitmap.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0048-ALSA-hda-realtek-Fix-surround-output-regression-on-A.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0049-NOMMU-Lock-i_mmap_mutex-for-access-to-the-VMA-prio-l.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0050-hwmon-max6639-Fix-FAN_FROM_REG-calculation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0058-genirq-Handle-pending-irqs-in-irq_startup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0059-scsi_scan-Fix-Poison-overwritten-warning-caused-by-u.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0060-scsi_pm-Fix-bug-in-the-SCSI-power-management-handler.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0061-ipvs-fix-matching-of-fwmark-templates-during-schedul.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0062-jme-Fix-FIFO-flush-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0063-davinci_emac-Do-not-free-all-rx-dma-descriptors-duri.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0064-builddeb-Don-t-create-files-in-tmp-with-predictable-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0065-can-sja1000-fix-isr-hang-when-hw-is-unplugged-under-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0066-hdpvr-fix-race-conditon-during-start-of-streaming.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0067-imon-don-t-wedge-hardware-after-early-callbacks.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0068-hwmon-f75375s-Fix-register-write-order-when-setting-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0069-epoll-introduce-POLLFREE-to-flush-signalfd_wqh-befor.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0070-epoll-ep_unregister_pollwait-can-use-the-freed-pwq-w.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0071-epoll-limit-paths.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0072-cdrom-use-copy_to_user-without-the-underscores.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0073-Linux-3.2.9.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index f9d8f7a..fb8bad3 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "ti33x"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r4"
+MACHINE_KERNEL_PR = "r5"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch
new file mode 100644
index 0000000..2c98099
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0022-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch
@@ -0,0 +1,39 @@
+From cf59e3f3c203e6812881c12ab1b3d956a3fc47cc Mon Sep 17 00:00:00 2001
+From: "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
+Date: Tue, 24 Jan 2012 19:45:12 +0530
+Subject: [PATCH 1/2] ARM: OMAP2+: am33xx: fix serial mux warnings for am33xx
+
+The patch removes below warning in serial mux setup on AM335x platform
+
+[    0.162052] _omap_mux_get_by_name: Could not find signal
+uart1_cts.uart1_cts
+[    0.169437] omap_hwmod_mux_init: Could not allocate device mux entry
+[    0.176384] _omap_mux_get_by_name: Could not find signal
+uart2_cts.uart2_cts
+[    0.183735] omap_hwmod_mux_init: Could not allocate device mux entry
+[    0.190663] _omap_mux_get_by_name: Could not find signal
+uart3_cts_rctx.uart3_cts_rctx
+[    0.198926] omap_hwmod_mux_init: Could not allocate device mux entry
+
+Signed-off-by: Hebbar, Gururaja <gururaja.hebbar@ti.com>
+---
+ arch/arm/mach-omap2/serial.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/serial.c b/arch/arm/mach-omap2/serial.c
+index ad5bed3..bfa8ae3 100644
+--- a/arch/arm/mach-omap2/serial.c
++++ b/arch/arm/mach-omap2/serial.c
+@@ -409,7 +409,8 @@ void __init omap_serial_board_init(struct omap_uart_port_info *info)
+ 		bdata.pads = NULL;
+ 		bdata.pads_cnt = 0;
+ 
+-		if (cpu_is_omap44xx() || cpu_is_omap34xx())
++		if (cpu_is_omap44xx() || (cpu_is_omap34xx() &&
++							!cpu_is_am33xx()))
+ 			omap_serial_fill_default_pads(&bdata);
+ 
+ 		if (!info)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/0023-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/0023-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch
new file mode 100644
index 0000000..c59b8c8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/0023-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch
@@ -0,0 +1,29 @@
+From 64c66b9ea196032c017306f487e89ef12e5cdaca Mon Sep 17 00:00:00 2001
+From: "Hebbar, Gururaja" <gururaja.hebbar@ti.com>
+Date: Mon, 27 Feb 2012 11:56:39 +0530
+Subject: [PATCH 2/2] ARM: OMAP2+: am335x: correct McASP0 pin mux detail
+
+McASP0 AXR3 pin mux-mode was incorrect specified in mux file. This
+patch corrects the same.
+
+Signed-off-by: Hebbar, Gururaja <gururaja.hebbar@ti.com>
+---
+ arch/arm/mach-omap2/mux33xx.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 2de76e3..25dcedb 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -351,7 +351,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		"mcasp0_axr1", NULL, NULL, "mcasp1_axr0",
+ 		NULL, NULL, NULL, "gpio3_20"),
+ 	_AM33XX_MUXENTRY(MCASP0_AHCLKX, 0,
+-		"mcasp0_ahclkx", "mcasp0_axr3",	NULL, "mcasp1_axr1",
++		"mcasp0_ahclkx", NULL, "mcasp0_axr3", "mcasp1_axr1",
+ 		NULL, NULL, NULL, "gpio3_21"),
+ 	_AM33XX_MUXENTRY(XDMA_EVENT_INTR0, 0,
+ 		"xdma_event_intr0", NULL, NULL, NULL,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0001-ixgbe-fix-vf-lookup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0001-ixgbe-fix-vf-lookup.patch
new file mode 100644
index 0000000..082c2b1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0001-ixgbe-fix-vf-lookup.patch
@@ -0,0 +1,42 @@
+From ec00c9c49aef783ec75155431d43df4cd93e24a4 Mon Sep 17 00:00:00 2001
+From: Greg Rose <gregory.v.rose@intel.com>
+Date: Fri, 3 Feb 2012 00:54:13 +0000
+Subject: [PATCH 01/30] ixgbe: fix vf lookup
+
+commit a4b08329c74985e5cc3a44b6d2b2c59444ed8079 upstream.
+
+Recent addition of code to find already allocated VFs failed to take
+account that systems with 2 or more multi-port SR-IOV capable controllers
+might have already enabled VFs.  Make sure that the VFs the function is
+finding are actually subordinate to the particular instance of the adapter
+that is looking for them and not subordinate to some device that has
+previously enabled SR-IOV.
+
+This bug exists in 3.2 stable as well as 3.3 release candidates.
+
+Reported-by: David Ahern <daahern@cisco.com>
+Signed-off-by: Greg Rose <gregory.v.rose@intel.com>
+Tested-by: Robert E Garrett <robertX.e.garrett@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
+index 00fcd39..e571356 100644
+--- a/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
++++ b/drivers/net/ethernet/intel/ixgbe/ixgbe_sriov.c
+@@ -67,7 +67,8 @@ static int ixgbe_find_enabled_vfs(struct ixgbe_adapter *adapter)
+ 	vf_devfn = pdev->devfn + 0x80;
+ 	pvfdev = pci_get_device(IXGBE_INTEL_VENDOR_ID, device_id, NULL);
+ 	while (pvfdev) {
+-		if (pvfdev->devfn == vf_devfn)
++		if (pvfdev->devfn == vf_devfn &&
++		    (pvfdev->bus->number >= pdev->bus->number))
+ 			vfs_found++;
+ 		vf_devfn += 2;
+ 		pvfdev = pci_get_device(IXGBE_INTEL_VENDOR_ID,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0002-igb-fix-vf-lookup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0002-igb-fix-vf-lookup.patch
new file mode 100644
index 0000000..7b26812
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0002-igb-fix-vf-lookup.patch
@@ -0,0 +1,42 @@
+From 3039fb27d54ba3ffa564c56ef25d799e756ca3ad Mon Sep 17 00:00:00 2001
+From: Greg Rose <gregory.v.rose@intel.com>
+Date: Thu, 2 Feb 2012 23:51:43 +0000
+Subject: [PATCH 02/30] igb: fix vf lookup
+
+commit 0629292117572a60465f38cdedde2f8164c3df0b upstream.
+
+Recent addition of code to find already allocated VFs failed to take
+account that systems with 2 or more multi-port SR-IOV capable controllers
+might have already enabled VFs.  Make sure that the VFs the function is
+finding are actually subordinate to the particular instance of the adapter
+that is looking for them and not subordinate to some device that has
+previously enabled SR-IOV.
+
+This is applicable to 3.2+ kernels.
+
+Reported-by: David Ahern <daahern@cisco.com>
+Signed-off-by: Greg Rose <gregory.v.rose@intel.com>
+Tested-by: Robert E Garrett <robertX.e.garrett@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/intel/igb/igb_main.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
+index ced5444..222954d 100644
+--- a/drivers/net/ethernet/intel/igb/igb_main.c
++++ b/drivers/net/ethernet/intel/igb/igb_main.c
+@@ -4965,7 +4965,8 @@ static int igb_find_enabled_vfs(struct igb_adapter *adapter)
+ 	vf_devfn = pdev->devfn + 0x80;
+ 	pvfdev = pci_get_device(hw->vendor_id, device_id, NULL);
+ 	while (pvfdev) {
+-		if (pvfdev->devfn == vf_devfn)
++		if (pvfdev->devfn == vf_devfn &&
++		    (pvfdev->bus->number >= pdev->bus->number))
+ 			vfs_found++;
+ 		vf_devfn += vf_stride;
+ 		pvfdev = pci_get_device(hw->vendor_id,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0003-perf-evsel-Fix-an-issue-where-perf-report-fails-to-s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0003-perf-evsel-Fix-an-issue-where-perf-report-fails-to-s.patch
new file mode 100644
index 0000000..12e6693
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0003-perf-evsel-Fix-an-issue-where-perf-report-fails-to-s.patch
@@ -0,0 +1,64 @@
+From 838d7aabe2a5c93aa7116f1a74758731ba1a0264 Mon Sep 17 00:00:00 2001
+From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
+Date: Fri, 3 Feb 2012 22:31:13 +0530
+Subject: [PATCH 03/30] perf evsel: Fix an issue where perf report fails to
+ show the proper percentage
+
+commit a4a03fc7ef89020baca4f19174e6a43767c6d78a upstream.
+
+This patch fixes an issue where perf report shows nan% for certain
+perf.data files. The below is from a report for a do_fork probe:
+
+   -nan%           sshd  [kernel.kallsyms]  [k] do_fork
+   -nan%    packagekitd  [kernel.kallsyms]  [k] do_fork
+   -nan%    dbus-daemon  [kernel.kallsyms]  [k] do_fork
+   -nan%           bash  [kernel.kallsyms]  [k] do_fork
+
+A git bisect shows commit f3bda2c as the cause. However, looking back
+through the git history, I saw commit 640c03c which seems to have
+removed the required initialization for perf_sample->period. The problem
+only started showing after commit f3bda2c. The below patch re-introduces
+the initialization and it fixes the problem for me.
+
+With the below patch, for the same perf.data:
+
+  73.08%             bash  [kernel.kallsyms]  [k] do_fork
+   8.97%      11-dhclient  [kernel.kallsyms]  [k] do_fork
+   6.41%             sshd  [kernel.kallsyms]  [k] do_fork
+   3.85%        20-chrony  [kernel.kallsyms]  [k] do_fork
+   2.56%         sendmail  [kernel.kallsyms]  [k] do_fork
+
+This patch applies over current linux-tip commit 9949284.
+
+Problem introduced in:
+
+$ git describe 640c03c
+v2.6.37-rc3-83-g640c03c
+
+Cc: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
+Cc: Ingo Molnar <mingo@elte.hu>
+Cc: Robert Richter <robert.richter@amd.com>
+Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
+Link: http://lkml.kernel.org/r/20120203170113.5190.25558.stgit@localhost6.localdomain6
+Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/util/evsel.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
+index d7915d4..efca198 100644
+--- a/tools/perf/util/evsel.c
++++ b/tools/perf/util/evsel.c
+@@ -390,6 +390,7 @@ int perf_event__parse_sample(const union perf_event *event, u64 type,
+ 
+ 	data->cpu = data->pid = data->tid = -1;
+ 	data->stream_id = data->id = data->time = -1ULL;
++	data->period = 1;
+ 
+ 	if (event->header.type != PERF_RECORD_SAMPLE) {
+ 		if (!sample_id_all)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0004-perf-tools-Fix-perf-stack-to-non-executable-on-x86_6.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0004-perf-tools-Fix-perf-stack-to-non-executable-on-x86_6.patch
new file mode 100644
index 0000000..c7d7045
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0004-perf-tools-Fix-perf-stack-to-non-executable-on-x86_6.patch
@@ -0,0 +1,55 @@
+From bb937c6a47bdc27bf0f5c7323b8e75b5c313adeb Mon Sep 17 00:00:00 2001
+From: Jiri Olsa <jolsa@redhat.com>
+Date: Mon, 6 Feb 2012 18:54:06 -0200
+Subject: [PATCH 04/30] perf tools: Fix perf stack to non executable on x86_64
+
+commit 7a0153ee15575a4d07b5da8c96b79e0b0fd41a12 upstream.
+
+By adding following objects:
+  bench/mem-memcpy-x86-64-asm.o
+the x86_64 perf binary ended up with executable stack.
+
+The reason was that above object are assembler sourced and is missing the
+GNU-stack note section. In such case the linker assumes that the final binary
+should not be restricted at all and mark the stack as RWX.
+
+Adding section ".note.GNU-stack" definition to mentioned object, with all
+flags disabled, thus omiting this object from linker stack flags decision.
+
+Problem introduced in:
+
+  $ git describe ea7872b
+  v2.6.37-rc2-19-gea7872b
+
+Reported-at: https://bugzilla.redhat.com/show_bug.cgi?id=783570
+Reported-by: Clark Williams <williams@redhat.com>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Cc: Corey Ashford <cjashfor@linux.vnet.ibm.com>
+Cc: Ingo Molnar <mingo@elte.hu>
+Cc: Paul Mackerras <paulus@samba.org>
+Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Link: http://lkml.kernel.org/r/1328100848-5630-1-git-send-email-jolsa@redhat.com
+Signed-off-by: Jiri Olsa <jolsa@redhat.com>
+[ committer note: Backported fix to perf/urgent (3.3-rc2+) ]
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/bench/mem-memcpy-x86-64-asm.S |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/tools/perf/bench/mem-memcpy-x86-64-asm.S b/tools/perf/bench/mem-memcpy-x86-64-asm.S
+index a57b66e..185a96d 100644
+--- a/tools/perf/bench/mem-memcpy-x86-64-asm.S
++++ b/tools/perf/bench/mem-memcpy-x86-64-asm.S
+@@ -1,2 +1,8 @@
+ 
+ #include "../../../arch/x86/lib/memcpy_64.S"
++/*
++ * We need to provide note.GNU-stack section, saying that we want
++ * NOT executable stack. Otherwise the final linking will assume that
++ * the ELF stack should not be restricted at all and set it RWX.
++ */
++.section .note.GNU-stack,"",@progbits
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0005-drm-i915-Force-explicit-bpp-selection-for-intel_dp_l.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0005-drm-i915-Force-explicit-bpp-selection-for-intel_dp_l.patch
new file mode 100644
index 0000000..227c581
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0005-drm-i915-Force-explicit-bpp-selection-for-intel_dp_l.patch
@@ -0,0 +1,99 @@
+From 3d794f87238f74d80e78a7611c7fbde8a54c85c2 Mon Sep 17 00:00:00 2001
+From: Keith Packard <keithp@keithp.com>
+Date: Wed, 25 Jan 2012 08:16:25 -0800
+Subject: [PATCH 05/30] drm/i915: Force explicit bpp selection for
+ intel_dp_link_required
+
+commit c898261c0dad617f0f1080bedc02d507a2fcfb92 upstream.
+
+It is never correct to use intel_crtc->bpp in intel_dp_link_required,
+so instead pass an explicit bpp in to this function. This patch
+only supports 18bpp and 24bpp modes, which means that 10bpc modes will
+be computed incorrectly. Fixing that will require more extensive
+changes, and so must be addressed separately from this bugfix.
+
+intel_dp_link_required is called from intel_dp_mode_valid and
+intel_dp_mode_fixup.
+
+* intel_dp_mode_valid is called to list supported modes; in this case,
+  the current crtc values cannot be relevant as the modes in question
+  may never be selected. Thus, using intel_crtc->bpp is never right.
+
+* intel_dp_mode_fixup is called during mode setting, but it is run
+  well before ironlake_crtc_mode_set is called to set intel_crtc->bpp,
+  so using intel_crtc-bpp in this path can only ever get a stale
+  value.
+
+Cc: Lubos Kolouch <lubos.kolouch@gmail.com>
+Cc: Adam Jackson <ajax@redhat.com>
+Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=42263
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=44881
+Tested-by: Dave Airlie <airlied@redhat.com>
+Tested-by: camalot@picnicpark.org (Dell Latitude 6510)
+Tested-by: Roland Dreier <roland@digitalvampire.org>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_dp.c |   20 +++++---------------
+ 1 files changed, 5 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
+index db3b461..94f860c 100644
+--- a/drivers/gpu/drm/i915/intel_dp.c
++++ b/drivers/gpu/drm/i915/intel_dp.c
+@@ -208,17 +208,8 @@ intel_dp_link_clock(uint8_t link_bw)
+  */
+ 
+ static int
+-intel_dp_link_required(struct intel_dp *intel_dp, int pixel_clock, int check_bpp)
++intel_dp_link_required(int pixel_clock, int bpp)
+ {
+-	struct drm_crtc *crtc = intel_dp->base.base.crtc;
+-	struct intel_crtc *intel_crtc = to_intel_crtc(crtc);
+-	int bpp = 24;
+-
+-	if (check_bpp)
+-		bpp = check_bpp;
+-	else if (intel_crtc)
+-		bpp = intel_crtc->bpp;
+-
+ 	return (pixel_clock * bpp + 9) / 10;
+ }
+ 
+@@ -245,12 +236,11 @@ intel_dp_mode_valid(struct drm_connector *connector,
+ 			return MODE_PANEL;
+ 	}
+ 
+-	mode_rate = intel_dp_link_required(intel_dp, mode->clock, 0);
++	mode_rate = intel_dp_link_required(mode->clock, 24);
+ 	max_rate = intel_dp_max_data_rate(max_link_clock, max_lanes);
+ 
+ 	if (mode_rate > max_rate) {
+-			mode_rate = intel_dp_link_required(intel_dp,
+-							   mode->clock, 18);
++			mode_rate = intel_dp_link_required(mode->clock, 18);
+ 			if (mode_rate > max_rate)
+ 				return MODE_CLOCK_HIGH;
+ 			else
+@@ -683,7 +673,7 @@ intel_dp_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
+ 	int lane_count, clock;
+ 	int max_lane_count = intel_dp_max_lane_count(intel_dp);
+ 	int max_clock = intel_dp_max_link_bw(intel_dp) == DP_LINK_BW_2_7 ? 1 : 0;
+-	int bpp = mode->private_flags & INTEL_MODE_DP_FORCE_6BPC ? 18 : 0;
++	int bpp = mode->private_flags & INTEL_MODE_DP_FORCE_6BPC ? 18 : 24;
+ 	static int bws[2] = { DP_LINK_BW_1_62, DP_LINK_BW_2_7 };
+ 
+ 	if (is_edp(intel_dp) && intel_dp->panel_fixed_mode) {
+@@ -701,7 +691,7 @@ intel_dp_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
+ 		for (clock = 0; clock <= max_clock; clock++) {
+ 			int link_avail = intel_dp_max_data_rate(intel_dp_link_clock(bws[clock]), lane_count);
+ 
+-			if (intel_dp_link_required(intel_dp, mode->clock, bpp)
++			if (intel_dp_link_required(mode->clock, bpp)
+ 					<= link_avail) {
+ 				intel_dp->link_bw = bws[clock];
+ 				intel_dp->lane_count = lane_count;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0006-drm-i915-no-lvds-quirk-for-AOpen-MP45.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0006-drm-i915-no-lvds-quirk-for-AOpen-MP45.patch
new file mode 100644
index 0000000..0483dfb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0006-drm-i915-no-lvds-quirk-for-AOpen-MP45.patch
@@ -0,0 +1,40 @@
+From e0de290452ad63560c1051b1f0a3d2fba665094e Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Wed, 8 Feb 2012 16:42:52 +0100
+Subject: [PATCH 06/30] drm/i915: no lvds quirk for AOpen MP45
+
+commit e57b6886f555ab57f40a01713304e2053efe51ec upstream.
+
+According to a bug report, it doesn't have one.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=44263
+Acked-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_lvds.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_lvds.c b/drivers/gpu/drm/i915/intel_lvds.c
+index e441911..b83f745 100644
+--- a/drivers/gpu/drm/i915/intel_lvds.c
++++ b/drivers/gpu/drm/i915/intel_lvds.c
+@@ -694,6 +694,14 @@ static const struct dmi_system_id intel_no_lvds[] = {
+ 	},
+ 	{
+ 		.callback = intel_no_lvds_dmi_callback,
++                .ident = "AOpen i45GMx-I",
++                .matches = {
++                        DMI_MATCH(DMI_BOARD_VENDOR, "AOpen"),
++                        DMI_MATCH(DMI_BOARD_NAME, "i45GMx-I"),
++                },
++        },
++	{
++		.callback = intel_no_lvds_dmi_callback,
+ 		.ident = "Aopen i945GTt-VFA",
+ 		.matches = {
+ 			DMI_MATCH(DMI_PRODUCT_VERSION, "AO00001JW"),
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0007-ath9k-Fix-kernel-panic-during-driver-initilization.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0007-ath9k-Fix-kernel-panic-during-driver-initilization.patch
new file mode 100644
index 0000000..e6b767e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0007-ath9k-Fix-kernel-panic-during-driver-initilization.patch
@@ -0,0 +1,96 @@
+From 801cb74a250edad565024f2db5c5a6c7930ecbb1 Mon Sep 17 00:00:00 2001
+From: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Date: Thu, 2 Feb 2012 16:29:05 +0530
+Subject: [PATCH 07/30] ath9k: Fix kernel panic during driver initilization
+
+commit 07445f688218a48bde72316aed9de4fdcc173131 upstream.
+
+all works need to be initialized before ieee80211_register_hw
+to prevent mac80211 call backs such as drv_start, drv_config
+getting started. otherwise we would queue/cancel works before
+initializing them and it leads to kernel panic.
+this issue can be recreated with the following script
+in Chrome laptops with AR928X cards, with background scan
+running (or) Network manager is running
+
+while true
+do
+sudo modprobe -v ath9k
+sleep 3
+sudo modprobe -r ath9k
+sleep 3
+done
+
+	 EIP: [<81040a47>] __cancel_work_timer+0xb8/0xe1 SS:ESP 0068:f6be9d70
+	 ---[ end trace 4f86d6139a9900ef ]---
+	 Registered led device: ath9k-phy0
+	 ieee80211 phy0: Atheros AR9280 Rev:2 mem=0xf88a0000,
+	 irq=16
+	 Kernel panic - not syncing: Fatal exception
+	 Pid: 456, comm: wpa_supplicant Tainted: G      D
+	 3.0.13 #1
+	Call Trace:
+	 [<81379e21>] panic+0x53/0x14a
+	 [<81004a30>] oops_end+0x73/0x81
+	 [<81004b53>] die+0x4c/0x55
+	 [<81002710>] do_trap+0x7c/0x83
+	 [<81002855>] ? do_bounds+0x58/0x58
+	 [<810028cc>] do_invalid_op+0x77/0x81
+	 [<81040a47>] ? __cancel_work_timer+0xb8/0xe1
+	 [<810489ec>] ? sched_clock_cpu+0x81/0x11f
+	 [<8103f809>] ? wait_on_work+0xe2/0xf7
+	 [<8137f807>] error_code+0x67/0x6c
+	 [<810300d8>] ? wait_consider_task+0x4ba/0x84c
+	 [<81040a47>] ? __cancel_work_timer+0xb8/0xe1
+	 [<810380c9>] ? try_to_del_timer_sync+0x5f/0x67
+	 [<81040a91>] cancel_work_sync+0xf/0x11
+	 [<f88d7b7c>] ath_set_channel+0x62/0x25c [ath9k]
+	 [<f88d67d1>] ? ath9k_tx_last_beacon+0x26a/0x85c [ath9k]
+	 [<f88d8899>] ath_radio_disable+0x3f1/0x68e [ath9k]
+	 [<f90d0edb>] ieee80211_hw_config+0x111/0x116 [mac80211]
+	 [<f90dd95c>] __ieee80211_recalc_idle+0x919/0xa37 [mac80211]
+	 [<f90dda76>] __ieee80211_recalc_idle+0xa33/0xa37 [mac80211]
+	 [<812dbed8>] __dev_open+0x82/0xab
+
+Cc: Gary Morain <gmorain@google.com>
+Cc: Paul Stewart <pstew@google.com>
+Cc: Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>
+Tested-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
+Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/ath/ath9k/init.c |    9 +++++----
+ 1 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
+index d4c909f..57622e0 100644
+--- a/drivers/net/wireless/ath/ath9k/init.c
++++ b/drivers/net/wireless/ath/ath9k/init.c
+@@ -775,6 +775,11 @@ int ath9k_init_device(u16 devid, struct ath_softc *sc,
+ 		ARRAY_SIZE(ath9k_tpt_blink));
+ #endif
+ 
++	INIT_WORK(&sc->hw_reset_work, ath_reset_work);
++	INIT_WORK(&sc->hw_check_work, ath_hw_check);
++	INIT_WORK(&sc->paprd_work, ath_paprd_calibrate);
++	INIT_DELAYED_WORK(&sc->hw_pll_work, ath_hw_pll_work);
++
+ 	/* Register with mac80211 */
+ 	error = ieee80211_register_hw(hw);
+ 	if (error)
+@@ -793,10 +798,6 @@ int ath9k_init_device(u16 devid, struct ath_softc *sc,
+ 			goto error_world;
+ 	}
+ 
+-	INIT_WORK(&sc->hw_reset_work, ath_reset_work);
+-	INIT_WORK(&sc->hw_check_work, ath_hw_check);
+-	INIT_WORK(&sc->paprd_work, ath_paprd_calibrate);
+-	INIT_DELAYED_WORK(&sc->hw_pll_work, ath_hw_pll_work);
+ 	sc->last_rssi = ATH_RSSI_DUMMY_MARKER;
+ 
+ 	ath_init_leds(sc);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0008-ath9k-fix-a-WEP-crypto-related-regression.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0008-ath9k-fix-a-WEP-crypto-related-regression.patch
new file mode 100644
index 0000000..0ef0ce8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0008-ath9k-fix-a-WEP-crypto-related-regression.patch
@@ -0,0 +1,45 @@
+From 07c07e52693740326b24511ba6053f3fd52c0942 Mon Sep 17 00:00:00 2001
+From: Felix Fietkau <nbd@openwrt.org>
+Date: Sun, 5 Feb 2012 21:15:17 +0100
+Subject: [PATCH 08/30] ath9k: fix a WEP crypto related regression
+
+commit f88373fa47f3ce6590fdfaa742d0ddacc2ae017f upstream.
+
+commit b4a82a0 "ath9k_hw: fix interpretation of the rx KeyMiss flag"
+fixed the interpretation of the KeyMiss flag for keycache based lookups,
+however WEP encryption uses a static index, so KeyMiss is always asserted
+for it, even though frames are decrypted properly.
+Fix this by clearing the ATH9K_RXERR_KEYMISS flag if no keycache based
+lookup was performed.
+
+Signed-off-by: Felix Fietkau <nbd@openwrt.org>
+Reported-by: Laurent Bonnans <bonnans.l@gmail.com>
+Reported-by: Jurica Vukadin <u.ra604@googlemail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/ath/ath9k/recv.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/recv.c b/drivers/net/wireless/ath/ath9k/recv.c
+index 67b862c..2f3aeac 100644
+--- a/drivers/net/wireless/ath/ath9k/recv.c
++++ b/drivers/net/wireless/ath/ath9k/recv.c
+@@ -824,6 +824,14 @@ static bool ath9k_rx_accept(struct ath_common *common,
+ 		(ATH9K_RXERR_DECRYPT | ATH9K_RXERR_CRC | ATH9K_RXERR_MIC |
+ 		 ATH9K_RXERR_KEYMISS));
+ 
++	/*
++	 * Key miss events are only relevant for pairwise keys where the
++	 * descriptor does contain a valid key index. This has been observed
++	 * mostly with CCMP encryption.
++	 */
++	if (rx_stats->rs_keyix == ATH9K_RXKEYIX_INVALID)
++		rx_stats->rs_status &= ~ATH9K_RXERR_KEYMISS;
++
+ 	if (!rx_stats->rs_datalen)
+ 		return false;
+         /*
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0009-ath9k_hw-fix-a-RTS-CTS-timeout-regression.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0009-ath9k_hw-fix-a-RTS-CTS-timeout-regression.patch
new file mode 100644
index 0000000..9f2c1cd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0009-ath9k_hw-fix-a-RTS-CTS-timeout-regression.patch
@@ -0,0 +1,52 @@
+From 39141a87c717403c9dd4e0432766ea18054f86f8 Mon Sep 17 00:00:00 2001
+From: Felix Fietkau <nbd@openwrt.org>
+Date: Sun, 5 Feb 2012 21:15:18 +0100
+Subject: [PATCH 09/30] ath9k_hw: fix a RTS/CTS timeout regression
+
+commit 55a2bb4a6d5e8c7b324d003e130fd9aaf33be4e6 upstream.
+
+commit adb5066 "ath9k_hw: do not apply the 2.4 ghz ack timeout
+workaround to cts" reduced the hardware CTS timeout to the normal
+values specified by the standard, but it turns out while it doesn't
+need the same extra time that it needs for the ACK timeout, it
+does need more than the value specified in the standard, but only
+for 2.4 GHz.
+
+This patch brings the CTS timeout value in sync with the initialization
+values, while still allowing adjustment for bigger distances.
+
+Signed-off-by: Felix Fietkau <nbd@openwrt.org>
+Reported-by: Seth Forshee <seth.forshee@canonical.com>
+Reported-by: Marek Lindner <lindner_marek@yahoo.de>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/ath/ath9k/hw.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
+index 8873c6e..8b0c2ca 100644
+--- a/drivers/net/wireless/ath/ath9k/hw.c
++++ b/drivers/net/wireless/ath/ath9k/hw.c
+@@ -1034,13 +1034,16 @@ void ath9k_hw_init_global_settings(struct ath_hw *ah)
+ 
+ 	/*
+ 	 * Workaround for early ACK timeouts, add an offset to match the
+-	 * initval's 64us ack timeout value.
++	 * initval's 64us ack timeout value. Use 48us for the CTS timeout.
+ 	 * This was initially only meant to work around an issue with delayed
+ 	 * BA frames in some implementations, but it has been found to fix ACK
+ 	 * timeout issues in other cases as well.
+ 	 */
+-	if (conf->channel && conf->channel->band == IEEE80211_BAND_2GHZ)
++	if (conf->channel && conf->channel->band == IEEE80211_BAND_2GHZ) {
+ 		acktimeout += 64 - sifstime - ah->slottime;
++		ctstimeout += 48 - sifstime - ah->slottime;
++	}
++
+ 
+ 	ath9k_hw_set_sifs_time(ah, sifstime);
+ 	ath9k_hw_setslottime(ah, slottime);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0010-hwmon-f75375s-Fix-bit-shifting-in-f75375_write16.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0010-hwmon-f75375s-Fix-bit-shifting-in-f75375_write16.patch
new file mode 100644
index 0000000..e4a498c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0010-hwmon-f75375s-Fix-bit-shifting-in-f75375_write16.patch
@@ -0,0 +1,33 @@
+From 82546bf5ccd28a6c5f0829f43d3d5050065ce4d4 Mon Sep 17 00:00:00 2001
+From: Nikolaus Schulz <schulz@macnetix.de>
+Date: Wed, 8 Feb 2012 18:56:10 +0100
+Subject: [PATCH 10/30] hwmon: (f75375s) Fix bit shifting in f75375_write16
+
+commit eb2f255b2d360df3f500042a2258dcf2fcbe89a2 upstream.
+
+In order to extract the high byte of the 16-bit word, shift the word to
+the right, not to the left.
+
+Signed-off-by: Nikolaus Schulz <mail@microschulz.de>
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/f75375s.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
+index 95cbfb3..dcfd9e1 100644
+--- a/drivers/hwmon/f75375s.c
++++ b/drivers/hwmon/f75375s.c
+@@ -159,7 +159,7 @@ static inline void f75375_write8(struct i2c_client *client, u8 reg,
+ static inline void f75375_write16(struct i2c_client *client, u8 reg,
+ 		u16 value)
+ {
+-	int err = i2c_smbus_write_byte_data(client, reg, (value << 8));
++	int err = i2c_smbus_write_byte_data(client, reg, (value >> 8));
+ 	if (err)
+ 		return;
+ 	i2c_smbus_write_byte_data(client, reg + 1, (value & 0xFF));
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0011-net-enable-TC35815-for-MIPS-again.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0011-net-enable-TC35815-for-MIPS-again.patch
new file mode 100644
index 0000000..c80b5ac
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0011-net-enable-TC35815-for-MIPS-again.patch
@@ -0,0 +1,41 @@
+From 5f892ebab0da0262e16737c1a618a19384da29bf Mon Sep 17 00:00:00 2001
+From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
+Date: Mon, 6 Feb 2012 14:51:03 +0000
+Subject: [PATCH 11/30] net: enable TC35815 for MIPS again
+
+commit a1728800bed3b93b231d99e97c756f622b9991c2 upstream.
+
+8<----------------------------------------------------------------------
+From: Ralf Roesch <ralf.roesch@rw-gmbh.de>
+Date: Wed, 16 Nov 2011 09:33:50 +0100
+Subject: net: enable TC35815 for MIPS again
+
+TX493[8,9] MIPS SoCs support 2 Ethernet channels of type TC35815
+which are connected to the internal PCI controller.
+And JMR3927 MIPS board has a TC35815 chip on board.
+These dependencies were lost on movement to drivers/net/ethernet/toshiba.
+
+Signed-off-by: Ralf Roesch <ralf.roesch@rw-gmbh.de>
+Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/toshiba/Kconfig |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/ethernet/toshiba/Kconfig b/drivers/net/ethernet/toshiba/Kconfig
+index 0517647..74acb5c 100644
+--- a/drivers/net/ethernet/toshiba/Kconfig
++++ b/drivers/net/ethernet/toshiba/Kconfig
+@@ -5,7 +5,7 @@
+ config NET_VENDOR_TOSHIBA
+ 	bool "Toshiba devices"
+ 	default y
+-	depends on PCI && (PPC_IBM_CELL_BLADE || PPC_CELLEB) || PPC_PS3
++	depends on PCI && (PPC_IBM_CELL_BLADE || PPC_CELLEB || MIPS) || PPC_PS3
+ 	---help---
+ 	  If you have a network (Ethernet) card belonging to this class, say Y
+ 	  and read the Ethernet-HOWTO, available from
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0012-lib-proportion-lower-PROP_MAX_SHIFT-to-32-on-64-bit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0012-lib-proportion-lower-PROP_MAX_SHIFT-to-32-on-64-bit-.patch
new file mode 100644
index 0000000..9bb974d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0012-lib-proportion-lower-PROP_MAX_SHIFT-to-32-on-64-bit-.patch
@@ -0,0 +1,48 @@
+From 736020248ccb92a11af037e1cec4a2c79946be8a Mon Sep 17 00:00:00 2001
+From: Wu Fengguang <fengguang.wu@intel.com>
+Date: Mon, 9 Jan 2012 11:53:50 -0600
+Subject: [PATCH 12/30] lib: proportion: lower PROP_MAX_SHIFT to 32 on 64-bit
+ kernel
+
+commit 3310225dfc71a35a2cc9340c15c0e08b14b3c754 upstream.
+
+PROP_MAX_SHIFT should be set to <=32 on 64-bit box. This fixes two bugs
+in the below lines of bdi_dirty_limit():
+
+	bdi_dirty *= numerator;
+	do_div(bdi_dirty, denominator);
+
+1) divide error: do_div() only uses the lower 32 bit of the denominator,
+   which may trimmed to be 0 when PROP_MAX_SHIFT > 32.
+
+2) overflow: (bdi_dirty * numerator) could easily overflow if numerator
+   used up to 48 bits, leaving only 16 bits to bdi_dirty
+
+Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Reported-by: Ilya Tumaykin <librarian_rus@yahoo.com>
+Tested-by: Ilya Tumaykin <librarian_rus@yahoo.com>
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/proportions.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/proportions.h b/include/linux/proportions.h
+index ef35bb7..26a8a4e 100644
+--- a/include/linux/proportions.h
++++ b/include/linux/proportions.h
+@@ -81,7 +81,11 @@ void prop_inc_percpu(struct prop_descriptor *pd, struct prop_local_percpu *pl)
+  * Limit the time part in order to ensure there are some bits left for the
+  * cycle counter and fraction multiply.
+  */
++#if BITS_PER_LONG == 32
+ #define PROP_MAX_SHIFT (3*BITS_PER_LONG/4)
++#else
++#define PROP_MAX_SHIFT (BITS_PER_LONG/2)
++#endif
+ 
+ #define PROP_FRAC_SHIFT		(BITS_PER_LONG - PROP_MAX_SHIFT - 1)
+ #define PROP_FRAC_BASE		(1UL << PROP_FRAC_SHIFT)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0013-relay-prevent-integer-overflow-in-relay_open.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0013-relay-prevent-integer-overflow-in-relay_open.patch
new file mode 100644
index 0000000..96aa48d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0013-relay-prevent-integer-overflow-in-relay_open.patch
@@ -0,0 +1,50 @@
+From a0cbc2da8ed19f3affb50a249dc16a04d5d6f42f Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Fri, 10 Feb 2012 09:03:58 +0100
+Subject: [PATCH 13/30] relay: prevent integer overflow in relay_open()
+
+commit f6302f1bcd75a042df69866d98b8d775a668f8f1 upstream.
+
+"subbuf_size" and "n_subbufs" come from the user and they need to be
+capped to prevent an integer overflow.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/relay.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/relay.c b/kernel/relay.c
+index 226fade..b6f803a 100644
+--- a/kernel/relay.c
++++ b/kernel/relay.c
+@@ -164,10 +164,14 @@ depopulate:
+  */
+ static struct rchan_buf *relay_create_buf(struct rchan *chan)
+ {
+-	struct rchan_buf *buf = kzalloc(sizeof(struct rchan_buf), GFP_KERNEL);
+-	if (!buf)
++	struct rchan_buf *buf;
++
++	if (chan->n_subbufs > UINT_MAX / sizeof(size_t *))
+ 		return NULL;
+ 
++	buf = kzalloc(sizeof(struct rchan_buf), GFP_KERNEL);
++	if (!buf)
++		return NULL;
+ 	buf->padding = kmalloc(chan->n_subbufs * sizeof(size_t *), GFP_KERNEL);
+ 	if (!buf->padding)
+ 		goto free_buf;
+@@ -574,6 +578,8 @@ struct rchan *relay_open(const char *base_filename,
+ 
+ 	if (!(subbuf_size && n_subbufs))
+ 		return NULL;
++	if (subbuf_size > UINT_MAX / n_subbufs)
++		return NULL;
+ 
+ 	chan = kzalloc(sizeof(struct rchan), GFP_KERNEL);
+ 	if (!chan)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0014-mac80211-timeout-a-single-frame-in-the-rx-reorder-bu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0014-mac80211-timeout-a-single-frame-in-the-rx-reorder-bu.patch
new file mode 100644
index 0000000..190babf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0014-mac80211-timeout-a-single-frame-in-the-rx-reorder-bu.patch
@@ -0,0 +1,36 @@
+From 60d08dde8e209a4e5b6ff95022004c65672c149f Mon Sep 17 00:00:00 2001
+From: Eliad Peller <eliad@wizery.com>
+Date: Wed, 1 Feb 2012 18:48:09 +0200
+Subject: [PATCH 14/30] mac80211: timeout a single frame in the rx reorder
+ buffer
+
+commit 07ae2dfcf4f7143ce191c6436da1c33f179af0d6 upstream.
+
+The current code checks for stored_mpdu_num > 1, causing
+the reorder_timer to be triggered indefinitely, but the
+frame is never timed-out (until the next packet is received)
+
+Signed-off-by: Eliad Peller <eliad@wizery.com>
+Acked-by: Johannes Berg <johannes@sipsolutions.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/mac80211/rx.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
+index 5c51607..064d20f 100644
+--- a/net/mac80211/rx.c
++++ b/net/mac80211/rx.c
+@@ -616,7 +616,7 @@ static void ieee80211_sta_reorder_release(struct ieee80211_hw *hw,
+ 	index = seq_sub(tid_agg_rx->head_seq_num, tid_agg_rx->ssn) %
+ 						tid_agg_rx->buf_size;
+ 	if (!tid_agg_rx->reorder_buf[index] &&
+-	    tid_agg_rx->stored_mpdu_num > 1) {
++	    tid_agg_rx->stored_mpdu_num) {
+ 		/*
+ 		 * No buffers ready to be released, but check whether any
+ 		 * frames in the reorder buffer have timed out.
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0015-writeback-fix-NULL-bdi-dev-in-trace-writeback_single.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0015-writeback-fix-NULL-bdi-dev-in-trace-writeback_single.patch
new file mode 100644
index 0000000..4c7acab
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0015-writeback-fix-NULL-bdi-dev-in-trace-writeback_single.patch
@@ -0,0 +1,72 @@
+From aec14f459cc9d40f9fd4a7aad2be761de084b320 Mon Sep 17 00:00:00 2001
+From: Wu Fengguang <fengguang.wu@intel.com>
+Date: Tue, 17 Jan 2012 11:18:56 -0600
+Subject: [PATCH 15/30] writeback: fix NULL bdi->dev in trace
+ writeback_single_inode
+
+commit 15eb77a07c714ac80201abd0a9568888bcee6276 upstream.
+
+bdi_prune_sb() resets sb->s_bdi to default_backing_dev_info when the
+tearing down the original bdi. Fix trace_writeback_single_inode to
+use sb->s_bdi=default_backing_dev_info rather than bdi->dev=NULL for a
+teared down bdi.
+
+Reported-by: Rabin Vincent <rabin@rab.in>
+Tested-by: Rabin Vincent <rabin@rab.in>
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/fs-writeback.c                |   16 ++++++++--------
+ include/trace/events/writeback.h |    2 +-
+ 2 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
+index 517f211..54f5786 100644
+--- a/fs/fs-writeback.c
++++ b/fs/fs-writeback.c
+@@ -48,14 +48,6 @@ struct wb_writeback_work {
+ };
+ 
+ /*
+- * Include the creation of the trace points after defining the
+- * wb_writeback_work structure so that the definition remains local to this
+- * file.
+- */
+-#define CREATE_TRACE_POINTS
+-#include <trace/events/writeback.h>
+-
+-/*
+  * We don't actually have pdflush, but this one is exported though /proc...
+  */
+ int nr_pdflush_threads;
+@@ -87,6 +79,14 @@ static inline struct inode *wb_inode(struct list_head *head)
+ 	return list_entry(head, struct inode, i_wb_list);
+ }
+ 
++/*
++ * Include the creation of the trace points after defining the
++ * wb_writeback_work structure and inline functions so that the definition
++ * remains local to this file.
++ */
++#define CREATE_TRACE_POINTS
++#include <trace/events/writeback.h>
++
+ /* Wakeup flusher thread or forker thread to fork it. Requires bdi->wb_lock. */
+ static void bdi_wakeup_flusher(struct backing_dev_info *bdi)
+ {
+diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
+index 99d1d0d..46e389c 100644
+--- a/include/trace/events/writeback.h
++++ b/include/trace/events/writeback.h
+@@ -418,7 +418,7 @@ DECLARE_EVENT_CLASS(writeback_single_inode_template,
+ 
+ 	TP_fast_assign(
+ 		strncpy(__entry->name,
+-			dev_name(inode->i_mapping->backing_dev_info->dev), 32);
++			dev_name(inode_to_bdi(inode)->dev), 32);
+ 		__entry->ino		= inode->i_ino;
+ 		__entry->state		= inode->i_state;
+ 		__entry->dirtied_when	= inode->dirtied_when;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0016-writeback-fix-dereferencing-NULL-bdi-dev-on-trace_wr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0016-writeback-fix-dereferencing-NULL-bdi-dev-on-trace_wr.patch
new file mode 100644
index 0000000..495dfa8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0016-writeback-fix-dereferencing-NULL-bdi-dev-on-trace_wr.patch
@@ -0,0 +1,44 @@
+From 422204b77968331ce85721527f7ece49f72658f2 Mon Sep 17 00:00:00 2001
+From: Wu Fengguang <fengguang.wu@intel.com>
+Date: Sat, 4 Feb 2012 20:54:03 -0600
+Subject: [PATCH 16/30] writeback: fix dereferencing NULL bdi->dev on
+ trace_writeback_queue
+
+commit 977b7e3a52a7421ad33a393a38ece59f3d41c2fa upstream.
+
+When a SD card is hot removed without umount, del_gendisk() will call
+bdi_unregister() without destroying/freeing it. This leaves the bdi in
+the bdi->dev = NULL, bdi->wb.task = NULL, bdi->bdi_list removed state.
+
+When sync(2) gets the bdi before bdi_unregister() and calls
+bdi_queue_work() after the unregister, trace_writeback_queue will be
+dereferencing the NULL bdi->dev. Fix it with a simple test for NULL.
+
+LKML-reference: http://lkml.org/lkml/2012/1/18/346
+Reported-by: Rabin Vincent <rabin@rab.in>
+Tested-by: Namjae Jeon <linkinjeon@gmail.com>
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/trace/events/writeback.h |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
+index 46e389c..1f48f14 100644
+--- a/include/trace/events/writeback.h
++++ b/include/trace/events/writeback.h
+@@ -47,7 +47,10 @@ DECLARE_EVENT_CLASS(writeback_work_class,
+ 		__field(int, reason)
+ 	),
+ 	TP_fast_assign(
+-		strncpy(__entry->name, dev_name(bdi->dev), 32);
++		struct device *dev = bdi->dev;
++		if (!dev)
++			dev = default_backing_dev_info.dev;
++		strncpy(__entry->name, dev_name(dev), 32);
+ 		__entry->nr_pages = work->nr_pages;
+ 		__entry->sb_dev = work->sb ? work->sb->s_dev : 0;
+ 		__entry->sync_mode = work->sync_mode;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0017-hwmon-f75375s-Fix-automatic-pwm-mode-setting-for-F75.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0017-hwmon-f75375s-Fix-automatic-pwm-mode-setting-for-F75.patch
new file mode 100644
index 0000000..ae31b44
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0017-hwmon-f75375s-Fix-automatic-pwm-mode-setting-for-F75.patch
@@ -0,0 +1,34 @@
+From 90d9b5dce1ba11bb577378da3138be5c40c01278 Mon Sep 17 00:00:00 2001
+From: Nikolaus Schulz <schulz@macnetix.de>
+Date: Wed, 8 Feb 2012 18:56:08 +0100
+Subject: [PATCH 17/30] hwmon: (f75375s) Fix automatic pwm mode setting for
+ F75373 & F75375
+
+commit 09e87e5c4f9af656af2a8a3afc03487c5d9287c3 upstream.
+
+In order to enable temperature mode aka automatic mode for the F75373 and
+F75375 chips, the two FANx_MODE bits in the fan configuration register
+need be set to 01, not 10.
+
+Signed-off-by: Nikolaus Schulz <mail@microschulz.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/f75375s.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
+index dcfd9e1..e4ab491 100644
+--- a/drivers/hwmon/f75375s.c
++++ b/drivers/hwmon/f75375s.c
+@@ -311,7 +311,7 @@ static int set_pwm_enable_direct(struct i2c_client *client, int nr, int val)
+ 		fanmode  |= (3 << FAN_CTRL_MODE(nr));
+ 		break;
+ 	case 2: /* AUTOMATIC*/
+-		fanmode  |= (2 << FAN_CTRL_MODE(nr));
++		fanmode  |= (1 << FAN_CTRL_MODE(nr));
+ 		break;
+ 	case 3: /* fan speed */
+ 		break;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0018-cifs-request-oplock-when-doing-open-on-lookup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0018-cifs-request-oplock-when-doing-open-on-lookup.patch
new file mode 100644
index 0000000..b942b85
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0018-cifs-request-oplock-when-doing-open-on-lookup.patch
@@ -0,0 +1,32 @@
+From 77d04b76d64e24329bb63d3d8d52c942db61bcb6 Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Tue, 7 Feb 2012 06:30:52 -0500
+Subject: [PATCH 18/30] cifs: request oplock when doing open on lookup
+
+commit 8b0192a5f478da1c1ae906bf3ffff53f26204f56 upstream.
+
+Currently, it's always set to 0 (no oplock requested).
+
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steve French <smfrench@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/dir.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/cifs/dir.c b/fs/cifs/dir.c
+index d7eeb9d..e4c3334 100644
+--- a/fs/cifs/dir.c
++++ b/fs/cifs/dir.c
+@@ -492,7 +492,7 @@ cifs_lookup(struct inode *parent_dir_inode, struct dentry *direntry,
+ {
+ 	int xid;
+ 	int rc = 0; /* to get around spurious gcc warning, set to zero here */
+-	__u32 oplock = 0;
++	__u32 oplock = enable_oplocks ? REQ_OPLOCK : 0;
+ 	__u16 fileHandle = 0;
+ 	bool posix_open = false;
+ 	struct cifs_sb_info *cifs_sb;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0019-cifs-don-t-return-error-from-standard_receive3-after.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0019-cifs-don-t-return-error-from-standard_receive3-after.patch
new file mode 100644
index 0000000..38e1b8f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0019-cifs-don-t-return-error-from-standard_receive3-after.patch
@@ -0,0 +1,50 @@
+From 23cfecf97911af4ef38afd61879f030af0410755 Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Tue, 7 Feb 2012 06:31:05 -0500
+Subject: [PATCH 19/30] cifs: don't return error from standard_receive3 after
+ marking response malformed
+
+commit ff4fa4a25a33f92b5653bb43add0c63bea98d464 upstream.
+
+standard_receive3 will check the validity of the response from the
+server (via checkSMB). It'll pass the result of that check to handle_mid
+which will dequeue it and mark it with a status of
+MID_RESPONSE_MALFORMED if checkSMB returned an error. At that point,
+standard_receive3 will also return an error, which will make the
+demultiplex thread skip doing the callback for the mid.
+
+This is wrong -- if we were able to identify the request and the
+response is marked malformed, then we want the demultiplex thread to do
+the callback. Fix this by making standard_receive3 return 0 in this
+situation.
+
+Reported-and-Tested-by: Mark Moseley <moseleymark@gmail.com>
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steve French <smfrench@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/connect.c |    7 ++++---
+ 1 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
+index 63e4be4..720edf5 100644
+--- a/fs/cifs/connect.c
++++ b/fs/cifs/connect.c
+@@ -756,10 +756,11 @@ standard_receive3(struct TCP_Server_Info *server, struct mid_q_entry *mid)
+ 		cifs_dump_mem("Bad SMB: ", buf,
+ 			min_t(unsigned int, server->total_read, 48));
+ 
+-	if (mid)
+-		handle_mid(mid, server, smb_buffer, length);
++	if (!mid)
++		return length;
+ 
+-	return length;
++	handle_mid(mid, server, smb_buffer, length);
++	return 0;
+ }
+ 
+ static int
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0020-crypto-sha512-Use-binary-and-instead-of-modulus.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0020-crypto-sha512-Use-binary-and-instead-of-modulus.patch
new file mode 100644
index 0000000..d948f72
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0020-crypto-sha512-Use-binary-and-instead-of-modulus.patch
@@ -0,0 +1,42 @@
+From f334f74575cb0d9463d39caf4a43483cfc3dd542 Mon Sep 17 00:00:00 2001
+From: Herbert Xu <herbert@gondor.apana.org.au>
+Date: Thu, 26 Jan 2012 15:03:16 +1100
+Subject: [PATCH 20/30] crypto: sha512 - Use binary and instead of modulus
+
+commit 58d7d18b5268febb8b1391c6dffc8e2aaa751fcd upstream.
+
+The previous patch used the modulus operator over a power of 2
+unnecessarily which may produce suboptimal binary code.  This
+patch changes changes them to binary ands instead.
+
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ crypto/sha512_generic.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/sha512_generic.c b/crypto/sha512_generic.c
+index 88f160b..3edebfd 100644
+--- a/crypto/sha512_generic.c
++++ b/crypto/sha512_generic.c
+@@ -78,7 +78,7 @@ static inline void LOAD_OP(int I, u64 *W, const u8 *input)
+ 
+ static inline void BLEND_OP(int I, u64 *W)
+ {
+-	W[I % 16] += s1(W[(I-2) % 16]) + W[(I-7) % 16] + s0(W[(I-15) % 16]);
++	W[I & 15] += s1(W[(I-2) & 15]) + W[(I-7) & 15] + s0(W[(I-15) & 15]);
+ }
+ 
+ static void
+@@ -105,7 +105,7 @@ sha512_transform(u64 *state, const u8 *input)
+ 
+ #define SHA512_16_79(i, a, b, c, d, e, f, g, h)			\
+ 	BLEND_OP(i, W);						\
+-	t1 = h + e1(e) + Ch(e, f, g) + sha512_K[i] + W[(i)%16];	\
++	t1 = h + e1(e) + Ch(e, f, g) + sha512_K[i] + W[(i)&15];	\
+ 	t2 = e0(a) + Maj(a, b, c);				\
+ 	d += t1;						\
+ 	h = t1 + t2
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0021-crypto-sha512-Avoid-stack-bloat-on-i386.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0021-crypto-sha512-Avoid-stack-bloat-on-i386.patch
new file mode 100644
index 0000000..c5441eb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0021-crypto-sha512-Avoid-stack-bloat-on-i386.patch
@@ -0,0 +1,113 @@
+From 03b762ab87db7977a7e6d9fe92dd63fa6dbc5f02 Mon Sep 17 00:00:00 2001
+From: Herbert Xu <herbert@gondor.apana.org.au>
+Date: Sun, 5 Feb 2012 15:09:28 +1100
+Subject: [PATCH 21/30] crypto: sha512 - Avoid stack bloat on i386
+
+commit 3a92d687c8015860a19213e3c102cad6b722f83c upstream.
+
+Unfortunately in reducing W from 80 to 16 we ended up unrolling
+the loop twice.  As gcc has issues dealing with 64-bit ops on
+i386 this means that we end up using even more stack space (>1K).
+
+This patch solves the W reduction by moving LOAD_OP/BLEND_OP
+into the loop itself, thus avoiding the need to duplicate it.
+
+While the stack space still isn't great (>0.5K) it is at least
+in the same ball park as the amount of stack used for our C sha1
+implementation.
+
+Note that this patch basically reverts to the original code so
+the diff looks bigger than it really is.
+
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ crypto/sha512_generic.c |   68 ++++++++++++++++++++++-------------------------
+ 1 files changed, 32 insertions(+), 36 deletions(-)
+
+diff --git a/crypto/sha512_generic.c b/crypto/sha512_generic.c
+index 3edebfd..f04af93 100644
+--- a/crypto/sha512_generic.c
++++ b/crypto/sha512_generic.c
+@@ -89,46 +89,42 @@ sha512_transform(u64 *state, const u8 *input)
+ 	int i;
+ 	u64 W[16];
+ 
+-	/* load the input */
+-        for (i = 0; i < 16; i++)
+-                LOAD_OP(i, W, input);
+-
+ 	/* load the state into our registers */
+ 	a=state[0];   b=state[1];   c=state[2];   d=state[3];
+ 	e=state[4];   f=state[5];   g=state[6];   h=state[7];
+ 
+-#define SHA512_0_15(i, a, b, c, d, e, f, g, h)			\
+-	t1 = h + e1(e) + Ch(e, f, g) + sha512_K[i] + W[i];	\
+-	t2 = e0(a) + Maj(a, b, c);				\
+-	d += t1;						\
+-	h = t1 + t2
+-
+-#define SHA512_16_79(i, a, b, c, d, e, f, g, h)			\
+-	BLEND_OP(i, W);						\
+-	t1 = h + e1(e) + Ch(e, f, g) + sha512_K[i] + W[(i)&15];	\
+-	t2 = e0(a) + Maj(a, b, c);				\
+-	d += t1;						\
+-	h = t1 + t2
+-
+-	for (i = 0; i < 16; i += 8) {
+-		SHA512_0_15(i, a, b, c, d, e, f, g, h);
+-		SHA512_0_15(i + 1, h, a, b, c, d, e, f, g);
+-		SHA512_0_15(i + 2, g, h, a, b, c, d, e, f);
+-		SHA512_0_15(i + 3, f, g, h, a, b, c, d, e);
+-		SHA512_0_15(i + 4, e, f, g, h, a, b, c, d);
+-		SHA512_0_15(i + 5, d, e, f, g, h, a, b, c);
+-		SHA512_0_15(i + 6, c, d, e, f, g, h, a, b);
+-		SHA512_0_15(i + 7, b, c, d, e, f, g, h, a);
+-	}
+-	for (i = 16; i < 80; i += 8) {
+-		SHA512_16_79(i, a, b, c, d, e, f, g, h);
+-		SHA512_16_79(i + 1, h, a, b, c, d, e, f, g);
+-		SHA512_16_79(i + 2, g, h, a, b, c, d, e, f);
+-		SHA512_16_79(i + 3, f, g, h, a, b, c, d, e);
+-		SHA512_16_79(i + 4, e, f, g, h, a, b, c, d);
+-		SHA512_16_79(i + 5, d, e, f, g, h, a, b, c);
+-		SHA512_16_79(i + 6, c, d, e, f, g, h, a, b);
+-		SHA512_16_79(i + 7, b, c, d, e, f, g, h, a);
++	/* now iterate */
++	for (i=0; i<80; i+=8) {
++		if (!(i & 8)) {
++			int j;
++
++			if (i < 16) {
++				/* load the input */
++				for (j = 0; j < 16; j++)
++					LOAD_OP(i + j, W, input);
++			} else {
++				for (j = 0; j < 16; j++) {
++					BLEND_OP(i + j, W);
++				}
++			}
++		}
++
++		t1 = h + e1(e) + Ch(e,f,g) + sha512_K[i  ] + W[(i & 15)];
++		t2 = e0(a) + Maj(a,b,c);    d+=t1;    h=t1+t2;
++		t1 = g + e1(d) + Ch(d,e,f) + sha512_K[i+1] + W[(i & 15) + 1];
++		t2 = e0(h) + Maj(h,a,b);    c+=t1;    g=t1+t2;
++		t1 = f + e1(c) + Ch(c,d,e) + sha512_K[i+2] + W[(i & 15) + 2];
++		t2 = e0(g) + Maj(g,h,a);    b+=t1;    f=t1+t2;
++		t1 = e + e1(b) + Ch(b,c,d) + sha512_K[i+3] + W[(i & 15) + 3];
++		t2 = e0(f) + Maj(f,g,h);    a+=t1;    e=t1+t2;
++		t1 = d + e1(a) + Ch(a,b,c) + sha512_K[i+4] + W[(i & 15) + 4];
++		t2 = e0(e) + Maj(e,f,g);    h+=t1;    d=t1+t2;
++		t1 = c + e1(h) + Ch(h,a,b) + sha512_K[i+5] + W[(i & 15) + 5];
++		t2 = e0(d) + Maj(d,e,f);    g+=t1;    c=t1+t2;
++		t1 = b + e1(g) + Ch(g,h,a) + sha512_K[i+6] + W[(i & 15) + 6];
++		t2 = e0(c) + Maj(c,d,e);    f+=t1;    b=t1+t2;
++		t1 = a + e1(f) + Ch(f,g,h) + sha512_K[i+7] + W[(i & 15) + 7];
++		t2 = e0(b) + Maj(b,c,d);    e+=t1;    a=t1+t2;
+ 	}
+ 
+ 	state[0] += a; state[1] += b; state[2] += c; state[3] += d;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0022-backing-dev-fix-wakeup-timer-races-with-bdi_unregist.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0022-backing-dev-fix-wakeup-timer-races-with-bdi_unregist.patch
new file mode 100644
index 0000000..708c814
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0022-backing-dev-fix-wakeup-timer-races-with-bdi_unregist.patch
@@ -0,0 +1,95 @@
+From 884d833e27faee8f929f95ca1be53b1997c66c30 Mon Sep 17 00:00:00 2001
+From: Rabin Vincent <rabin@rab.in>
+Date: Sun, 29 Jan 2012 12:17:33 -0600
+Subject: [PATCH 22/30] backing-dev: fix wakeup timer races with
+ bdi_unregister()
+
+commit 2673b4cf5d59c3ee5e0c12f6d734d38770324dc4 upstream.
+
+While 7a401a972df8e18 ("backing-dev: ensure wakeup_timer is deleted")
+addressed the problem of the bdi being freed with a queued wakeup
+timer, there are other races that could happen if the wakeup timer
+expires after/during bdi_unregister(), before bdi_destroy() is called.
+
+wakeup_timer_fn() could attempt to wakeup a task which has already has
+been freed, or could access a NULL bdi->dev via the wake_forker_thread
+tracepoint.
+
+Cc: Jens Axboe <axboe@kernel.dk>
+Reported-by: Chanho Min <chanho.min@lge.com>
+Reviewed-by: Namjae Jeon <linkinjeon@gmail.com>
+Signed-off-by: Rabin Vincent <rabin@rab.in>
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/backing-dev.c |   25 +++++++++++++++++++------
+ 1 files changed, 19 insertions(+), 6 deletions(-)
+
+diff --git a/mm/backing-dev.c b/mm/backing-dev.c
+index 71034f4..2b49dd2 100644
+--- a/mm/backing-dev.c
++++ b/mm/backing-dev.c
+@@ -318,7 +318,7 @@ static void wakeup_timer_fn(unsigned long data)
+ 	if (bdi->wb.task) {
+ 		trace_writeback_wake_thread(bdi);
+ 		wake_up_process(bdi->wb.task);
+-	} else {
++	} else if (bdi->dev) {
+ 		/*
+ 		 * When bdi tasks are inactive for long time, they are killed.
+ 		 * In this case we have to wake-up the forker thread which
+@@ -584,6 +584,8 @@ EXPORT_SYMBOL(bdi_register_dev);
+  */
+ static void bdi_wb_shutdown(struct backing_dev_info *bdi)
+ {
++	struct task_struct *task;
++
+ 	if (!bdi_cap_writeback_dirty(bdi))
+ 		return;
+ 
+@@ -604,9 +606,14 @@ static void bdi_wb_shutdown(struct backing_dev_info *bdi)
+ 	 * unfreeze of the thread before calling kthread_stop(), otherwise
+ 	 * it would never exet if it is currently stuck in the refrigerator.
+ 	 */
+-	if (bdi->wb.task) {
+-		thaw_process(bdi->wb.task);
+-		kthread_stop(bdi->wb.task);
++	spin_lock_bh(&bdi->wb_lock);
++	task = bdi->wb.task;
++	bdi->wb.task = NULL;
++	spin_unlock_bh(&bdi->wb_lock);
++
++	if (task) {
++		thaw_process(task);
++		kthread_stop(task);
+ 	}
+ }
+ 
+@@ -627,7 +634,9 @@ static void bdi_prune_sb(struct backing_dev_info *bdi)
+ 
+ void bdi_unregister(struct backing_dev_info *bdi)
+ {
+-	if (bdi->dev) {
++	struct device *dev = bdi->dev;
++
++	if (dev) {
+ 		bdi_set_min_ratio(bdi, 0);
+ 		trace_writeback_bdi_unregister(bdi);
+ 		bdi_prune_sb(bdi);
+@@ -636,8 +645,12 @@ void bdi_unregister(struct backing_dev_info *bdi)
+ 		if (!bdi_cap_flush_forker(bdi))
+ 			bdi_wb_shutdown(bdi);
+ 		bdi_debug_unregister(bdi);
+-		device_unregister(bdi->dev);
++
++		spin_lock_bh(&bdi->wb_lock);
+ 		bdi->dev = NULL;
++		spin_unlock_bh(&bdi->wb_lock);
++
++		device_unregister(dev);
+ 	}
+ }
+ EXPORT_SYMBOL(bdi_unregister);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0023-ALSA-intel8x0-Fix-default-inaudible-sound-on-Gateway.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0023-ALSA-intel8x0-Fix-default-inaudible-sound-on-Gateway.patch
new file mode 100644
index 0000000..7ebb3f9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0023-ALSA-intel8x0-Fix-default-inaudible-sound-on-Gateway.patch
@@ -0,0 +1,42 @@
+From c9353a7b06ea31cea2e1319ebe75d6e9045fffd4 Mon Sep 17 00:00:00 2001
+From: Daniel T Chen <crimsun@ubuntu.com>
+Date: Mon, 13 Feb 2012 23:44:22 -0500
+Subject: [PATCH 23/30] ALSA: intel8x0: Fix default inaudible sound on Gateway
+ M520
+
+commit 27c3afe6e1cf129faac90405121203962da08ff4 upstream.
+
+BugLink: https://bugs.launchpad.net/bugs/930842
+
+The reporter states that audio is inaudible by default without muting
+'External Amplifier'. Add a quirk to handle his SSID so that changing
+the control is not necessary.
+
+Reported-and-tested-by: Benjamin Carlson <elderbubba0810@gmail.com>
+Signed-off-by: Daniel T Chen <crimsun@ubuntu.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/intel8x0.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/intel8x0.c b/sound/pci/intel8x0.c
+index 11718b49..55f48fb 100644
+--- a/sound/pci/intel8x0.c
++++ b/sound/pci/intel8x0.c
+@@ -2102,6 +2102,12 @@ static struct ac97_quirk ac97_quirks[] __devinitdata = {
+ 	},
+ 	{
+ 		.subvendor = 0x161f,
++		.subdevice = 0x202f,
++		.name = "Gateway M520",
++		.type = AC97_TUNE_INV_EAPD
++	},
++	{
++		.subvendor = 0x161f,
+ 		.subdevice = 0x203a,
+ 		.name = "Gateway 4525GZ",		/* AD1981B */
+ 		.type = AC97_TUNE_INV_EAPD
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0024-ALSA-hda-Fix-initialization-of-secondary-capture-sou.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0024-ALSA-hda-Fix-initialization-of-secondary-capture-sou.patch
new file mode 100644
index 0000000..d07a261
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0024-ALSA-hda-Fix-initialization-of-secondary-capture-sou.patch
@@ -0,0 +1,41 @@
+From 852c3a36c216e351d07ca96e9af30b81fff30ccc Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 13 Feb 2012 15:04:06 +0100
+Subject: [PATCH 24/30] ALSA: hda - Fix initialization of secondary capture
+ source on VT1705
+
+commit fc1156c0b0f7ad45ec03d919866349eeca2bf18c upstream.
+
+VT1705 codec has two ADCs where the secondary ADC has no MUX but only
+a fixed connection to the mic pin.  This confused the driver and it
+tries always overriding the input-source selection by assumption of
+the existing MUX for the secondary ADC, resulted in resetting the
+input-source at each time PM (including power-saving) occurs.
+
+The fix is simply to check the existence of MUX for secondary ADCs in
+the initialization code.
+
+Tested-by: Anisse Astier <anisse@astier.eu>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_via.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
+index a0a3f50..1fe1308 100644
+--- a/sound/pci/hda/patch_via.c
++++ b/sound/pci/hda/patch_via.c
+@@ -665,6 +665,9 @@ static void via_auto_init_analog_input(struct hda_codec *codec)
+ 	/* init input-src */
+ 	for (i = 0; i < spec->num_adc_nids; i++) {
+ 		int adc_idx = spec->inputs[spec->cur_mux[i]].adc_idx;
++		/* secondary ADCs must have the unique MUX */
++		if (i > 0 && !spec->mux_nids[i])
++			break;
+ 		if (spec->mux_nids[adc_idx]) {
+ 			int mux_idx = spec->inputs[spec->cur_mux[i]].mux_idx;
+ 			snd_hda_codec_write(codec, spec->mux_nids[adc_idx], 0,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0025-ALSA-hda-Fix-silent-speaker-output-on-Acer-Aspire-69.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0025-ALSA-hda-Fix-silent-speaker-output-on-Acer-Aspire-69.patch
new file mode 100644
index 0000000..8fb6bfd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0025-ALSA-hda-Fix-silent-speaker-output-on-Acer-Aspire-69.patch
@@ -0,0 +1,78 @@
+From 2edcb814b345ab919010974e88a4bbd407bf4db8 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 13 Feb 2012 15:25:07 +0100
+Subject: [PATCH 25/30] ALSA: hda - Fix silent speaker output on Acer Aspire
+ 6935
+
+commit 02a237b24d57e2e2d5402c92549e9e792aa24359 upstream.
+
+Since 3.2 kernel, the driver starts trying to assign the multi-io DACs
+before the speaker, thus it assigns DAC2/3 for multi-io and DAC4 for
+the speaker for a standard laptop setup like a HP, a speaker, a mic-in
+and a line-in.  However, on Acer Aspire 6935, it seems that the
+speaker pin 0x14 must be connected with either DAC1 or 2; otherwise it
+results in silence by some reason, although the codec itself allows
+the routing to DAC3/4.
+
+As a workaround, the connection list of each pin is reduced to be
+mapped to either only DAC1/2 or DAC3/4, so that the compatible
+assignment as in kernel 3.1 is achieved.
+
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=42740
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_realtek.c |   23 +++++++++++++++++++++++
+ 1 files changed, 23 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 34e5fcc..9c197d4 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -4213,8 +4213,26 @@ enum {
+ 	PINFIX_PB_M5210,
+ 	PINFIX_ACER_ASPIRE_7736,
+ 	PINFIX_ASUS_W90V,
++	ALC889_FIXUP_DAC_ROUTE,
+ };
+ 
++/* Fix the connection of some pins for ALC889:
++ * At least, Acer Aspire 5935 shows the connections to DAC3/4 don't
++ * work correctly (bko#42740)
++ */
++static void alc889_fixup_dac_route(struct hda_codec *codec,
++				   const struct alc_fixup *fix, int action)
++{
++	if (action == ALC_FIXUP_ACT_PRE_PROBE) {
++		hda_nid_t conn1[2] = { 0x0c, 0x0d };
++		hda_nid_t conn2[2] = { 0x0e, 0x0f };
++		snd_hda_override_conn_list(codec, 0x14, 2, conn1);
++		snd_hda_override_conn_list(codec, 0x15, 2, conn1);
++		snd_hda_override_conn_list(codec, 0x18, 2, conn2);
++		snd_hda_override_conn_list(codec, 0x1a, 2, conn2);
++	}
++}
++
+ static const struct alc_fixup alc882_fixups[] = {
+ 	[PINFIX_ABIT_AW9D_MAX] = {
+ 		.type = ALC_FIXUP_PINS,
+@@ -4251,10 +4269,15 @@ static const struct alc_fixup alc882_fixups[] = {
+ 			{ }
+ 		}
+ 	},
++	[ALC889_FIXUP_DAC_ROUTE] = {
++		.type = ALC_FIXUP_FUNC,
++		.v.func = alc889_fixup_dac_route,
++	},
+ };
+ 
+ static const struct snd_pci_quirk alc882_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x1025, 0x0155, "Packard-Bell M5120", PINFIX_PB_M5210),
++	SND_PCI_QUIRK(0x1025, 0x0259, "Acer Aspire 5935", ALC889_FIXUP_DAC_ROUTE),
+ 	SND_PCI_QUIRK(0x1043, 0x1873, "ASUS W90V", PINFIX_ASUS_W90V),
+ 	SND_PCI_QUIRK(0x17aa, 0x3a0d, "Lenovo Y530", PINFIX_LENOVO_Y530),
+ 	SND_PCI_QUIRK(0x147b, 0x107a, "Abit AW9D-MAX", PINFIX_ABIT_AW9D_MAX),
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0026-mmc-atmel-mci-save-and-restore-sdioirq-when-soft-res.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0026-mmc-atmel-mci-save-and-restore-sdioirq-when-soft-res.patch
new file mode 100644
index 0000000..40667ce
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0026-mmc-atmel-mci-save-and-restore-sdioirq-when-soft-res.patch
@@ -0,0 +1,42 @@
+From b207384ec8dd38b408be6c29bcf7a3484771c34e Mon Sep 17 00:00:00 2001
+From: Ludovic Desroches <ludovic.desroches@atmel.com>
+Date: Thu, 9 Feb 2012 11:55:29 +0100
+Subject: [PATCH 26/30] mmc: atmel-mci: save and restore sdioirq when soft
+ reset is performed
+
+commit 18ee684b8ab666329e0a0a72d8b70f16fb0e2243 upstream.
+
+Sometimes a software reset is needed. Then some registers are saved and
+restored but the interrupt mask register is missing. It causes issues
+with sdio devices whose interrupts are masked after reset.
+
+Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
+Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mmc/host/atmel-mci.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
+index a7ee502..72bc756 100644
+--- a/drivers/mmc/host/atmel-mci.c
++++ b/drivers/mmc/host/atmel-mci.c
+@@ -965,11 +965,14 @@ static void atmci_start_request(struct atmel_mci *host,
+ 	host->data_status = 0;
+ 
+ 	if (host->need_reset) {
++		iflags = atmci_readl(host, ATMCI_IMR);
++		iflags &= (ATMCI_SDIOIRQA | ATMCI_SDIOIRQB);
+ 		atmci_writel(host, ATMCI_CR, ATMCI_CR_SWRST);
+ 		atmci_writel(host, ATMCI_CR, ATMCI_CR_MCIEN);
+ 		atmci_writel(host, ATMCI_MR, host->mode_reg);
+ 		if (host->caps.has_cfg_reg)
+ 			atmci_writel(host, ATMCI_CFG, host->cfg_reg);
++		atmci_writel(host, ATMCI_IER, iflags);
+ 		host->need_reset = false;
+ 	}
+ 	atmci_writel(host, ATMCI_SDCR, slot->sdc_reg);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0027-mmc-dw_mmc-Fix-PIO-mode-with-support-of-highmem.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0027-mmc-dw_mmc-Fix-PIO-mode-with-support-of-highmem.patch
new file mode 100644
index 0000000..d0cb3c7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0027-mmc-dw_mmc-Fix-PIO-mode-with-support-of-highmem.patch
@@ -0,0 +1,353 @@
+From 00863fc2727e1d1e93c17add69f675935b4d1956 Mon Sep 17 00:00:00 2001
+From: Seungwon Jeon <tgih.jun@samsung.com>
+Date: Thu, 9 Feb 2012 14:32:43 +0900
+Subject: [PATCH 27/30] mmc: dw_mmc: Fix PIO mode with support of highmem
+
+commit f9c2a0dc42a6938ff2a80e55ca2bbd1d5581c72e upstream.
+
+Current PIO mode makes a kernel crash with CONFIG_HIGHMEM.
+Highmem pages have a NULL from sg_virt(sg).
+This patch fixes the following problem.
+
+Unable to handle kernel NULL pointer dereference at virtual address 00000000
+pgd = c0004000
+[00000000] *pgd=00000000
+Internal error: Oops: 817 [#1] PREEMPT SMP
+Modules linked in:
+CPU: 0    Not tainted  (3.0.15-01423-gdbf465f #589)
+PC is at dw_mci_pull_data32+0x4c/0x9c
+LR is at dw_mci_read_data_pio+0x54/0x1f0
+pc : [<c0358824>]    lr : [<c035988c>]    psr: 20000193
+sp : c0619d48  ip : c0619d70  fp : c0619d6c
+r10: 00000000  r9 : 00000002  r8 : 00001000
+r7 : 00000200  r6 : 00000000  r5 : e1dd3100  r4 : 00000000
+r3 : 65622023  r2 : 0000007f  r1 : eeb96000  r0 : e1dd3100
+Flags: nzCv  IRQs off  FIQs on  Mode SVC_32  ISA ARM  Segment
+xkernel
+Control: 10c5387d  Table: 61e2004a  DAC: 00000015
+Process swapper (pid: 0, stack limit = 0xc06182f0)
+Stack: (0xc0619d48 to 0xc061a000)
+9d40:                   e1dd3100 e1a4f000 00000000 e1dd3100 e1a4f000 00000200
+9d60: c0619da4 c0619d70 c035988c c03587e4 c0619d9c e18158f4 e1dd3100 e1dd3100
+9d80: 00000020 00000000 00000000 00000020 c06e8a84 00000000 c0619e04 c0619da8
+9da0: c0359b24 c0359844 e18158f4 e1dd3164 e1dd3168 e1dd3150 3d02fc79 e1dd3154
+9dc0: e1dd3178 00000000 00000020 00000000 e1dd3150 00000000 c10dd7e8 e1a84900
+9de0: c061e7cc 00000000 00000000 0000008d c06e8a84 c061e780 c0619e4c c0619e08
+9e00: c00c4738 c0359a34 3d02fc79 00000000 c0619e4c c05a1698 c05a1670 c05a165c
+9e20: c04de8b0 c061e780 c061e7cc e1a84900 ffffed68 0000008d c0618000 00000000
+9e40: c0619e6c c0619e50 c00c48b4 c00c46c8 c061e780 c00423ac c061e7cc ffffed68
+9e60: c0619e8c c0619e70 c00c7358 c00c487c 0000008d ffffee38 c0618000 ffffed68
+9e80: c0619ea4 c0619e90 c00c4258 c00c72b0 c00423ac ffffee38 c0619ecc c0619ea8
+9ea0: c004241c c00c4234 ffffffff f8810000 0000006d 00000002 00000001 7fffffff
+9ec0: c0619f44 c0619ed0 c0048bc0 c00423c4 220ae7a9 00000000 386f0d30 0005d3a4
+9ee0: c00423ac c10dd0b8 c06f2cd8 c0618000 c0594778 c003a674 7fffffff c0619f44
+9f00: 386f0d30 c0619f18 c00a6f94 c005be3c 80000013 ffffffff 386f0d30 0005d3a4
+9f20: 386f0d30 0005d2d1 c10dd0a8 c10dd0b8 c06f2cd8 c0618000 c0619f74 c0619f48
+9f40: c0345858 c005be00 c00a2440 c0618000 c0618000 c00410d8 c06c1944 c00410fc
+9f60: c0594778 c003a674 c0619f9c c0619f78 c004a7e8 c03457b4 c0618000 c06c18f8
+9f80: 00000000 c0039c70 c06c18d4 c003a674 c0619fb4 c0619fa0 c04ceafc c004a714
+9fa0: c06287b4 c06c18f8 c0619ff4 c0619fb8 c0008b68 c04cea68 c0008578 00000000
+9fc0: 00000000 c003a674 00000000 10c5387d c0628658 c003aa78 c062f1c4 4000406a
+9fe0: 413fc090 00000000 00000000 c0619ff8 40008044 c0008858 00000000 00000000
+Backtrace:
+[<c03587d8>] (dw_mci_pull_data32+0x0/0x9c) from [<c035988c>] (dw_mci_read_data_pio+0x54/0x1f0)
+ r6:00000200 r5:e1a4f000 r4:e1dd3100
+ [<c0359838>] (dw_mci_read_data_pio+0x0/0x1f0) from [<c0359b24>] (dw_mci_interrupt+0xfc/0x4a4)
+[<c0359a28>] (dw_mci_interrupt+0x0/0x4a4) from [<c00c4738>] (handle_irq_event_percpu+0x7c/0x1b4)
+[<c00c46bc>] (handle_irq_event_percpu+0x0/0x1b4) from [<c00c48b4>] (handle_irq_event+0x44/0x64)
+[<c00c4870>] (handle_irq_event+0x0/0x64) from [<c00c7358>] (handle_fasteoi_irq+0xb4/0x124)
+ r7:ffffed68 r6:c061e7cc r5:c00423ac r4:c061e780
+ [<c00c72a4>] (handle_fasteoi_irq+0x0/0x124) from [<c00c4258>] (generic_handle_irq+0x30/0x38)
+ r7:ffffed68 r6:c0618000 r5:ffffee38 r4:0000008d
+ [<c00c4228>] (generic_handle_irq+0x0/0x38) from [<c004241c>] (asm_do_IRQ+0x64/0xe0)
+ r5:ffffee38 r4:c00423ac
+ [<c00423b8>] (asm_do_IRQ+0x0/0xe0) from [<c0048bc0>] (__irq_svc+0x80/0x14c)
+Exception stack(0xc0619ed0 to 0xc0619f18)
+
+Signed-off-by: Seungwon Jeon <tgih.jun@samsung.com>
+Acked-by: Will Newton <will.newton@imgtec.com>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mmc/host/dw_mmc.c  |  144 +++++++++++++++++++++++---------------------
+ include/linux/mmc/dw_mmc.h |    6 +-
+ 2 files changed, 79 insertions(+), 71 deletions(-)
+
+diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
+index 3aaeb08..baf3d42 100644
+--- a/drivers/mmc/host/dw_mmc.c
++++ b/drivers/mmc/host/dw_mmc.c
+@@ -22,7 +22,6 @@
+ #include <linux/ioport.h>
+ #include <linux/module.h>
+ #include <linux/platform_device.h>
+-#include <linux/scatterlist.h>
+ #include <linux/seq_file.h>
+ #include <linux/slab.h>
+ #include <linux/stat.h>
+@@ -502,8 +501,14 @@ static void dw_mci_submit_data(struct dw_mci *host, struct mmc_data *data)
+ 		host->dir_status = DW_MCI_SEND_STATUS;
+ 
+ 	if (dw_mci_submit_data_dma(host, data)) {
++		int flags = SG_MITER_ATOMIC;
++		if (host->data->flags & MMC_DATA_READ)
++			flags |= SG_MITER_TO_SG;
++		else
++			flags |= SG_MITER_FROM_SG;
++
++		sg_miter_start(&host->sg_miter, data->sg, data->sg_len, flags);
+ 		host->sg = data->sg;
+-		host->pio_offset = 0;
+ 		host->part_buf_start = 0;
+ 		host->part_buf_count = 0;
+ 
+@@ -953,6 +958,7 @@ static void dw_mci_tasklet_func(unsigned long priv)
+ 				 * generates a block interrupt, hence setting
+ 				 * the scatter-gather pointer to NULL.
+ 				 */
++				sg_miter_stop(&host->sg_miter);
+ 				host->sg = NULL;
+ 				ctrl = mci_readl(host, CTRL);
+ 				ctrl |= SDMMC_CTRL_FIFO_RESET;
+@@ -1286,54 +1292,44 @@ static void dw_mci_pull_data(struct dw_mci *host, void *buf, int cnt)
+ 
+ static void dw_mci_read_data_pio(struct dw_mci *host)
+ {
+-	struct scatterlist *sg = host->sg;
+-	void *buf = sg_virt(sg);
+-	unsigned int offset = host->pio_offset;
++	struct sg_mapping_iter *sg_miter = &host->sg_miter;
++	void *buf;
++	unsigned int offset;
+ 	struct mmc_data	*data = host->data;
+ 	int shift = host->data_shift;
+ 	u32 status;
+ 	unsigned int nbytes = 0, len;
++	unsigned int remain, fcnt;
+ 
+ 	do {
+-		len = host->part_buf_count +
+-			(SDMMC_GET_FCNT(mci_readl(host, STATUS)) << shift);
+-		if (offset + len <= sg->length) {
++		if (!sg_miter_next(sg_miter))
++			goto done;
++
++		host->sg = sg_miter->__sg;
++		buf = sg_miter->addr;
++		remain = sg_miter->length;
++		offset = 0;
++
++		do {
++			fcnt = (SDMMC_GET_FCNT(mci_readl(host, STATUS))
++					<< shift) + host->part_buf_count;
++			len = min(remain, fcnt);
++			if (!len)
++				break;
+ 			dw_mci_pull_data(host, (void *)(buf + offset), len);
+-
+ 			offset += len;
+ 			nbytes += len;
+-
+-			if (offset == sg->length) {
+-				flush_dcache_page(sg_page(sg));
+-				host->sg = sg = sg_next(sg);
+-				if (!sg)
+-					goto done;
+-
+-				offset = 0;
+-				buf = sg_virt(sg);
+-			}
+-		} else {
+-			unsigned int remaining = sg->length - offset;
+-			dw_mci_pull_data(host, (void *)(buf + offset),
+-					 remaining);
+-			nbytes += remaining;
+-
+-			flush_dcache_page(sg_page(sg));
+-			host->sg = sg = sg_next(sg);
+-			if (!sg)
+-				goto done;
+-
+-			offset = len - remaining;
+-			buf = sg_virt(sg);
+-			dw_mci_pull_data(host, buf, offset);
+-			nbytes += offset;
+-		}
++			remain -= len;
++		} while (remain);
++		sg_miter->consumed = offset;
+ 
+ 		status = mci_readl(host, MINTSTS);
+ 		mci_writel(host, RINTSTS, SDMMC_INT_RXDR);
+ 		if (status & DW_MCI_DATA_ERROR_FLAGS) {
+ 			host->data_status = status;
+ 			data->bytes_xfered += nbytes;
++			sg_miter_stop(sg_miter);
++			host->sg = NULL;
+ 			smp_wmb();
+ 
+ 			set_bit(EVENT_DATA_ERROR, &host->pending_events);
+@@ -1342,65 +1338,66 @@ static void dw_mci_read_data_pio(struct dw_mci *host)
+ 			return;
+ 		}
+ 	} while (status & SDMMC_INT_RXDR); /*if the RXDR is ready read again*/
+-	host->pio_offset = offset;
+ 	data->bytes_xfered += nbytes;
++
++	if (!remain) {
++		if (!sg_miter_next(sg_miter))
++			goto done;
++		sg_miter->consumed = 0;
++	}
++	sg_miter_stop(sg_miter);
+ 	return;
+ 
+ done:
+ 	data->bytes_xfered += nbytes;
++	sg_miter_stop(sg_miter);
++	host->sg = NULL;
+ 	smp_wmb();
+ 	set_bit(EVENT_XFER_COMPLETE, &host->pending_events);
+ }
+ 
+ static void dw_mci_write_data_pio(struct dw_mci *host)
+ {
+-	struct scatterlist *sg = host->sg;
+-	void *buf = sg_virt(sg);
+-	unsigned int offset = host->pio_offset;
++	struct sg_mapping_iter *sg_miter = &host->sg_miter;
++	void *buf;
++	unsigned int offset;
+ 	struct mmc_data	*data = host->data;
+ 	int shift = host->data_shift;
+ 	u32 status;
+ 	unsigned int nbytes = 0, len;
++	unsigned int fifo_depth = host->fifo_depth;
++	unsigned int remain, fcnt;
+ 
+ 	do {
+-		len = ((host->fifo_depth -
+-			SDMMC_GET_FCNT(mci_readl(host, STATUS))) << shift)
+-			- host->part_buf_count;
+-		if (offset + len <= sg->length) {
++		if (!sg_miter_next(sg_miter))
++			goto done;
++
++		host->sg = sg_miter->__sg;
++		buf = sg_miter->addr;
++		remain = sg_miter->length;
++		offset = 0;
++
++		do {
++			fcnt = ((fifo_depth -
++				 SDMMC_GET_FCNT(mci_readl(host, STATUS)))
++					<< shift) - host->part_buf_count;
++			len = min(remain, fcnt);
++			if (!len)
++				break;
+ 			host->push_data(host, (void *)(buf + offset), len);
+-
+ 			offset += len;
+ 			nbytes += len;
+-			if (offset == sg->length) {
+-				host->sg = sg = sg_next(sg);
+-				if (!sg)
+-					goto done;
+-
+-				offset = 0;
+-				buf = sg_virt(sg);
+-			}
+-		} else {
+-			unsigned int remaining = sg->length - offset;
+-
+-			host->push_data(host, (void *)(buf + offset),
+-					remaining);
+-			nbytes += remaining;
+-
+-			host->sg = sg = sg_next(sg);
+-			if (!sg)
+-				goto done;
+-
+-			offset = len - remaining;
+-			buf = sg_virt(sg);
+-			host->push_data(host, (void *)buf, offset);
+-			nbytes += offset;
+-		}
++			remain -= len;
++		} while (remain);
++		sg_miter->consumed = offset;
+ 
+ 		status = mci_readl(host, MINTSTS);
+ 		mci_writel(host, RINTSTS, SDMMC_INT_TXDR);
+ 		if (status & DW_MCI_DATA_ERROR_FLAGS) {
+ 			host->data_status = status;
+ 			data->bytes_xfered += nbytes;
++			sg_miter_stop(sg_miter);
++			host->sg = NULL;
+ 
+ 			smp_wmb();
+ 
+@@ -1410,12 +1407,20 @@ static void dw_mci_write_data_pio(struct dw_mci *host)
+ 			return;
+ 		}
+ 	} while (status & SDMMC_INT_TXDR); /* if TXDR write again */
+-	host->pio_offset = offset;
+ 	data->bytes_xfered += nbytes;
++
++	if (!remain) {
++		if (!sg_miter_next(sg_miter))
++			goto done;
++		sg_miter->consumed = 0;
++	}
++	sg_miter_stop(sg_miter);
+ 	return;
+ 
+ done:
+ 	data->bytes_xfered += nbytes;
++	sg_miter_stop(sg_miter);
++	host->sg = NULL;
+ 	smp_wmb();
+ 	set_bit(EVENT_XFER_COMPLETE, &host->pending_events);
+ }
+@@ -1618,6 +1623,7 @@ static void dw_mci_work_routine_card(struct work_struct *work)
+ 				 * block interrupt, hence setting the
+ 				 * scatter-gather pointer to NULL.
+ 				 */
++				sg_miter_stop(&host->sg_miter);
+ 				host->sg = NULL;
+ 
+ 				ctrl = mci_readl(host, CTRL);
+diff --git a/include/linux/mmc/dw_mmc.h b/include/linux/mmc/dw_mmc.h
+index 6dc9b80..107fcb3 100644
+--- a/include/linux/mmc/dw_mmc.h
++++ b/include/linux/mmc/dw_mmc.h
+@@ -14,6 +14,8 @@
+ #ifndef LINUX_MMC_DW_MMC_H
+ #define LINUX_MMC_DW_MMC_H
+ 
++#include <linux/scatterlist.h>
++
+ #define MAX_MCI_SLOTS	2
+ 
+ enum dw_mci_state {
+@@ -40,7 +42,7 @@ struct mmc_data;
+  * @lock: Spinlock protecting the queue and associated data.
+  * @regs: Pointer to MMIO registers.
+  * @sg: Scatterlist entry currently being processed by PIO code, if any.
+- * @pio_offset: Offset into the current scatterlist entry.
++ * @sg_miter: PIO mapping scatterlist iterator.
+  * @cur_slot: The slot which is currently using the controller.
+  * @mrq: The request currently being processed on @cur_slot,
+  *	or NULL if the controller is idle.
+@@ -115,7 +117,7 @@ struct dw_mci {
+ 	void __iomem		*regs;
+ 
+ 	struct scatterlist	*sg;
+-	unsigned int		pio_offset;
++	struct sg_mapping_iter	sg_miter;
+ 
+ 	struct dw_mci_slot	*cur_slot;
+ 	struct mmc_request	*mrq;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0028-xen-pvhvm-do-not-remap-pirqs-onto-evtchns-if-xen_hav.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0028-xen-pvhvm-do-not-remap-pirqs-onto-evtchns-if-xen_hav.patch
new file mode 100644
index 0000000..014dd68
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0028-xen-pvhvm-do-not-remap-pirqs-onto-evtchns-if-xen_hav.patch
@@ -0,0 +1,31 @@
+From 3601bce60f271876c8dee6747ad5874aed96037f Mon Sep 17 00:00:00 2001
+From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Date: Mon, 30 Jan 2012 14:31:46 +0000
+Subject: [PATCH 28/30] xen pvhvm: do not remap pirqs onto evtchns if
+ !xen_have_vector_callback
+
+commit 207d543f472c1ac9552df79838dc807cbcaa9740 upstream.
+
+Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/pci/xen.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/x86/pci/xen.c b/arch/x86/pci/xen.c
+index 492ade8..d99346e 100644
+--- a/arch/x86/pci/xen.c
++++ b/arch/x86/pci/xen.c
+@@ -374,7 +374,7 @@ int __init pci_xen_init(void)
+ 
+ int __init pci_xen_hvm_init(void)
+ {
+-	if (!xen_feature(XENFEAT_hvm_pirqs))
++	if (!xen_have_vector_callback || !xen_feature(XENFEAT_hvm_pirqs))
+ 		return 0;
+ 
+ #ifdef CONFIG_ACPI
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0029-crypto-sha512-use-standard-ror64.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0029-crypto-sha512-use-standard-ror64.patch
new file mode 100644
index 0000000..3d4c487
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0029-crypto-sha512-use-standard-ror64.patch
@@ -0,0 +1,90 @@
+From 7c51cb723a36b2b8491354029df48a984e8e8f8a Mon Sep 17 00:00:00 2001
+From: Alexey Dobriyan <adobriyan@gmail.com>
+Date: Sat, 14 Jan 2012 21:44:49 +0300
+Subject: [PATCH 29/30] crypto: sha512 - use standard ror64()
+
+commit f2ea0f5f04c97b48c88edccba52b0682fbe45087 upstream.
+
+Use standard ror64() instead of hand-written.
+There is no standard ror64, so create it.
+
+The difference is shift value being "unsigned int" instead of uint64_t
+(for which there is no reason). gcc starts to emit native ROR instructions
+which it doesn't do for some reason currently. This should make the code
+faster.
+
+Patch survives in-tree crypto test and ping flood with hmac(sha512) on.
+
+Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ crypto/sha512_generic.c |   13 ++++---------
+ include/linux/bitops.h  |   20 ++++++++++++++++++++
+ 2 files changed, 24 insertions(+), 9 deletions(-)
+
+diff --git a/crypto/sha512_generic.c b/crypto/sha512_generic.c
+index f04af93..107f6f7 100644
+--- a/crypto/sha512_generic.c
++++ b/crypto/sha512_generic.c
+@@ -31,11 +31,6 @@ static inline u64 Maj(u64 x, u64 y, u64 z)
+         return (x & y) | (z & (x | y));
+ }
+ 
+-static inline u64 RORu64(u64 x, u64 y)
+-{
+-        return (x >> y) | (x << (64 - y));
+-}
+-
+ static const u64 sha512_K[80] = {
+         0x428a2f98d728ae22ULL, 0x7137449123ef65cdULL, 0xb5c0fbcfec4d3b2fULL,
+         0xe9b5dba58189dbbcULL, 0x3956c25bf348b538ULL, 0x59f111f1b605d019ULL,
+@@ -66,10 +61,10 @@ static const u64 sha512_K[80] = {
+         0x5fcb6fab3ad6faecULL, 0x6c44198c4a475817ULL,
+ };
+ 
+-#define e0(x)       (RORu64(x,28) ^ RORu64(x,34) ^ RORu64(x,39))
+-#define e1(x)       (RORu64(x,14) ^ RORu64(x,18) ^ RORu64(x,41))
+-#define s0(x)       (RORu64(x, 1) ^ RORu64(x, 8) ^ (x >> 7))
+-#define s1(x)       (RORu64(x,19) ^ RORu64(x,61) ^ (x >> 6))
++#define e0(x)       (ror64(x,28) ^ ror64(x,34) ^ ror64(x,39))
++#define e1(x)       (ror64(x,14) ^ ror64(x,18) ^ ror64(x,41))
++#define s0(x)       (ror64(x, 1) ^ ror64(x, 8) ^ (x >> 7))
++#define s1(x)       (ror64(x,19) ^ ror64(x,61) ^ (x >> 6))
+ 
+ static inline void LOAD_OP(int I, u64 *W, const u8 *input)
+ {
+diff --git a/include/linux/bitops.h b/include/linux/bitops.h
+index a3ef66a..fc8a3ff 100644
+--- a/include/linux/bitops.h
++++ b/include/linux/bitops.h
+@@ -50,6 +50,26 @@ static inline unsigned long hweight_long(unsigned long w)
+ }
+ 
+ /**
++ * rol64 - rotate a 64-bit value left
++ * @word: value to rotate
++ * @shift: bits to roll
++ */
++static inline __u64 rol64(__u64 word, unsigned int shift)
++{
++	return (word << shift) | (word >> (64 - shift));
++}
++
++/**
++ * ror64 - rotate a 64-bit value right
++ * @word: value to rotate
++ * @shift: bits to roll
++ */
++static inline __u64 ror64(__u64 word, unsigned int shift)
++{
++	return (word >> shift) | (word << (64 - shift));
++}
++
++/**
+  * rol32 - rotate a 32-bit value left
+  * @word: value to rotate
+  * @shift: bits to roll
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0030-Linux-3.2.7.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0030-Linux-3.2.7.patch
new file mode 100644
index 0000000..aeab962
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.7/0030-Linux-3.2.7.patch
@@ -0,0 +1,24 @@
+From 9d0231c207faeda051cf54c1a64e1a147d2187fa Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Mon, 20 Feb 2012 13:42:16 -0800
+Subject: [PATCH 30/30] Linux 3.2.7
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 47fe496..d1bdc90 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 6
++SUBLEVEL = 7
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0001-i387-math_state_restore-isn-t-called-from-asm.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0001-i387-math_state_restore-isn-t-called-from-asm.patch
new file mode 100644
index 0000000..713171e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0001-i387-math_state_restore-isn-t-called-from-asm.patch
@@ -0,0 +1,53 @@
+From 4733009df6d45db10f1f7551e65147576f224a06 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Mon, 13 Feb 2012 13:47:25 -0800
+Subject: [PATCH 01/11] i387: math_state_restore() isn't called from asm
+
+commit be98c2cdb15ba26148cd2bd58a857d4f7759ed38 upstream.
+
+It was marked asmlinkage for some really old and stale legacy reasons.
+Fix that and the equally stale comment.
+
+Noticed when debugging the irq_fpu_usable() bugs.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h |    2 +-
+ arch/x86/kernel/traps.c     |    6 +++---
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index c9e09ea..cba1432 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -29,7 +29,7 @@ extern unsigned int sig_xstate_size;
+ extern void fpu_init(void);
+ extern void mxcsr_feature_mask_init(void);
+ extern int init_fpu(struct task_struct *child);
+-extern asmlinkage void math_state_restore(void);
++extern void math_state_restore(void);
+ extern void __math_state_restore(void);
+ extern int dump_fpu(struct pt_regs *, struct user_i387_struct *);
+ 
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index a8e3eb8..727e6c1 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -590,10 +590,10 @@ void __math_state_restore(void)
+  * Careful.. There are problems with IBM-designed IRQ13 behaviour.
+  * Don't touch unless you *really* know how it works.
+  *
+- * Must be called with kernel preemption disabled (in this case,
+- * local interrupts are disabled at the call-site in entry.S).
++ * Must be called with kernel preemption disabled (eg with local
++ * local interrupts as in the case of do_device_not_available).
+  */
+-asmlinkage void math_state_restore(void)
++void math_state_restore(void)
+ {
+ 	struct thread_info *thread = current_thread_info();
+ 	struct task_struct *tsk = thread->task;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0002-i387-make-irq_fpu_usable-tests-more-robust.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0002-i387-make-irq_fpu_usable-tests-more-robust.patch
new file mode 100644
index 0000000..e0d9cdf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0002-i387-make-irq_fpu_usable-tests-more-robust.patch
@@ -0,0 +1,131 @@
+From 42f2560ed6e9b040ef64e18a5030bf2d2cb05d7f Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Mon, 13 Feb 2012 13:56:14 -0800
+Subject: [PATCH 02/11] i387: make irq_fpu_usable() tests more robust
+
+commit 5b1cbac37798805c1fee18c8cebe5c0a13975b17 upstream.
+
+Some code - especially the crypto layer - wants to use the x86
+FP/MMX/AVX register set in what may be interrupt (typically softirq)
+context.
+
+That *can* be ok, but the tests for when it was ok were somewhat
+suspect.  We cannot touch the thread-specific status bits either, so
+we'd better check that we're not going to try to save FP state or
+anything like that.
+
+Now, it may be that the TS bit is always cleared *before* we set the
+USEDFPU bit (and only set when we had already cleared the USEDFP
+before), so the TS bit test may actually have been sufficient, but it
+certainly was not obviously so.
+
+So this explicitly verifies that we will not touch the TS_USEDFPU bit,
+and adds a few related sanity-checks.  Because it seems that somehow
+AES-NI is corrupting user FP state.  The cause is not clear, and this
+patch doesn't fix it, but while debugging it I really wanted the code to
+be more obviously correct and robust.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h |   54 ++++++++++++++++++++++++++++++++++++------
+ arch/x86/kernel/traps.c     |    1 +
+ 2 files changed, 47 insertions(+), 8 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index cba1432..a436582 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -307,9 +307,54 @@ static inline void __clear_fpu(struct task_struct *tsk)
+ 	}
+ }
+ 
++/*
++ * Were we in an interrupt that interrupted kernel mode?
++ *
++ * We can do a kernel_fpu_begin/end() pair *ONLY* if that
++ * pair does nothing at all: TS_USEDFPU must be clear (so
++ * that we don't try to save the FPU state), and TS must
++ * be set (so that the clts/stts pair does nothing that is
++ * visible in the interrupted kernel thread).
++ */
++static inline bool interrupted_kernel_fpu_idle(void)
++{
++	return !(current_thread_info()->status & TS_USEDFPU) &&
++		(read_cr0() & X86_CR0_TS);
++}
++
++/*
++ * Were we in user mode (or vm86 mode) when we were
++ * interrupted?
++ *
++ * Doing kernel_fpu_begin/end() is ok if we are running
++ * in an interrupt context from user mode - we'll just
++ * save the FPU state as required.
++ */
++static inline bool interrupted_user_mode(void)
++{
++	struct pt_regs *regs = get_irq_regs();
++	return regs && user_mode_vm(regs);
++}
++
++/*
++ * Can we use the FPU in kernel mode with the
++ * whole "kernel_fpu_begin/end()" sequence?
++ *
++ * It's always ok in process context (ie "not interrupt")
++ * but it is sometimes ok even from an irq.
++ */
++static inline bool irq_fpu_usable(void)
++{
++	return !in_interrupt() ||
++		interrupted_user_mode() ||
++		interrupted_kernel_fpu_idle();
++}
++
+ static inline void kernel_fpu_begin(void)
+ {
+ 	struct thread_info *me = current_thread_info();
++
++	WARN_ON_ONCE(!irq_fpu_usable());
+ 	preempt_disable();
+ 	if (me->status & TS_USEDFPU)
+ 		__save_init_fpu(me->task);
+@@ -323,14 +368,6 @@ static inline void kernel_fpu_end(void)
+ 	preempt_enable();
+ }
+ 
+-static inline bool irq_fpu_usable(void)
+-{
+-	struct pt_regs *regs;
+-
+-	return !in_interrupt() || !(regs = get_irq_regs()) || \
+-		user_mode(regs) || (read_cr0() & X86_CR0_TS);
+-}
+-
+ /*
+  * Some instructions like VIA's padlock instructions generate a spurious
+  * DNA fault but don't modify SSE registers. And these instructions
+@@ -367,6 +404,7 @@ static inline void irq_ts_restore(int TS_state)
+  */
+ static inline void save_init_fpu(struct task_struct *tsk)
+ {
++	WARN_ON_ONCE(task_thread_info(tsk)->status & TS_USEDFPU);
+ 	preempt_disable();
+ 	__save_init_fpu(tsk);
+ 	stts();
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index 727e6c1..41e0b8c 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -622,6 +622,7 @@ EXPORT_SYMBOL_GPL(math_state_restore);
+ dotraplinkage void __kprobes
+ do_device_not_available(struct pt_regs *regs, long error_code)
+ {
++	WARN_ON_ONCE(!user_mode_vm(regs));
+ #ifdef CONFIG_MATH_EMULATION
+ 	if (read_cr0() & X86_CR0_EM) {
+ 		struct math_emu_info info = { };
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0003-i387-fix-sense-of-sanity-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0003-i387-fix-sense-of-sanity-check.patch
new file mode 100644
index 0000000..1b5f977
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0003-i387-fix-sense-of-sanity-check.patch
@@ -0,0 +1,37 @@
+From 0a7ea9d5aa1e2cab84a48c0380f7f8c305006224 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Wed, 15 Feb 2012 08:05:18 -0800
+Subject: [PATCH 03/11] i387: fix sense of sanity check
+
+commit c38e23456278e967f094b08247ffc3711b1029b2 upstream.
+
+The check for save_init_fpu() (introduced in commit 5b1cbac37798: "i387:
+make irq_fpu_usable() tests more robust") was the wrong way around, but
+I hadn't noticed, because my "tests" were bogus: the FPU exceptions are
+disabled by default, so even doing a divide by zero never actually
+triggers this code at all unless you do extra work to enable them.
+
+So if anybody did enable them, they'd get one spurious warning.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index a436582..262bea9 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -404,7 +404,7 @@ static inline void irq_ts_restore(int TS_state)
+  */
+ static inline void save_init_fpu(struct task_struct *tsk)
+ {
+-	WARN_ON_ONCE(task_thread_info(tsk)->status & TS_USEDFPU);
++	WARN_ON_ONCE(!(task_thread_info(tsk)->status & TS_USEDFPU));
+ 	preempt_disable();
+ 	__save_init_fpu(tsk);
+ 	stts();
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0004-i387-fix-x86-64-preemption-unsafe-user-stack-save-re.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0004-i387-fix-x86-64-preemption-unsafe-user-stack-save-re.patch
new file mode 100644
index 0000000..e496914
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0004-i387-fix-x86-64-preemption-unsafe-user-stack-save-re.patch
@@ -0,0 +1,163 @@
+From a5c28716652f9f71c848452b67795e5af690a91f Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 16 Feb 2012 09:15:04 -0800
+Subject: [PATCH 04/11] i387: fix x86-64 preemption-unsafe user stack
+ save/restore
+
+commit 15d8791cae75dca27bfda8ecfe87dca9379d6bb0 upstream.
+
+Commit 5b1cbac37798 ("i387: make irq_fpu_usable() tests more robust")
+added a sanity check to the #NM handler to verify that we never cause
+the "Device Not Available" exception in kernel mode.
+
+However, that check actually pinpointed a (fundamental) race where we do
+cause that exception as part of the signal stack FPU state save/restore
+code.
+
+Because we use the floating point instructions themselves to save and
+restore state directly from user mode, we cannot do that atomically with
+testing the TS_USEDFPU bit: the user mode access itself may cause a page
+fault, which causes a task switch, which saves and restores the FP/MMX
+state from the kernel buffers.
+
+This kind of "recursive" FP state save is fine per se, but it means that
+when the signal stack save/restore gets restarted, it will now take the
+'#NM' exception we originally tried to avoid.  With preemption this can
+happen even without the page fault - but because of the user access, we
+cannot just disable preemption around the save/restore instruction.
+
+There are various ways to solve this, including using the
+"enable/disable_page_fault()" helpers to not allow page faults at all
+during the sequence, and fall back to copying things by hand without the
+use of the native FP state save/restore instructions.
+
+However, the simplest thing to do is to just allow the #NM from kernel
+space, but fix the race in setting and clearing CR0.TS that this all
+exposed: the TS bit changes and the TS_USEDFPU bit absolutely have to be
+atomic wrt scheduling, so while the actual state save/restore can be
+interrupted and restarted, the act of actually clearing/setting CR0.TS
+and the TS_USEDFPU bit together must not.
+
+Instead of just adding random "preempt_disable/enable()" calls to what
+is already excessively ugly code, this introduces some helper functions
+that mostly mirror the "kernel_fpu_begin/end()" functionality, just for
+the user state instead.
+
+Those helper functions should probably eventually replace the other
+ad-hoc CR0.TS and TS_USEDFPU tests too, but I'll need to think about it
+some more: the task switching functionality in particular needs to
+expose the difference between the 'prev' and 'next' threads, while the
+new helper functions intentionally were written to only work with
+'current'.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h |   42 ++++++++++++++++++++++++++++++++++++++++++
+ arch/x86/kernel/traps.c     |    1 -
+ arch/x86/kernel/xsave.c     |   10 +++-------
+ 3 files changed, 45 insertions(+), 8 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index 262bea9..6e87fa4 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -400,6 +400,48 @@ static inline void irq_ts_restore(int TS_state)
+ }
+ 
+ /*
++ * The question "does this thread have fpu access?"
++ * is slightly racy, since preemption could come in
++ * and revoke it immediately after the test.
++ *
++ * However, even in that very unlikely scenario,
++ * we can just assume we have FPU access - typically
++ * to save the FP state - we'll just take a #NM
++ * fault and get the FPU access back.
++ *
++ * The actual user_fpu_begin/end() functions
++ * need to be preemption-safe, though.
++ *
++ * NOTE! user_fpu_end() must be used only after you
++ * have saved the FP state, and user_fpu_begin() must
++ * be used only immediately before restoring it.
++ * These functions do not do any save/restore on
++ * their own.
++ */
++static inline int user_has_fpu(void)
++{
++	return current_thread_info()->status & TS_USEDFPU;
++}
++
++static inline void user_fpu_end(void)
++{
++	preempt_disable();
++	current_thread_info()->status &= ~TS_USEDFPU;
++	stts();
++	preempt_enable();
++}
++
++static inline void user_fpu_begin(void)
++{
++	preempt_disable();
++	if (!user_has_fpu()) {
++		clts();
++		current_thread_info()->status |= TS_USEDFPU;
++	}
++	preempt_enable();
++}
++
++/*
+  * These disable preemption on their own and are safe
+  */
+ static inline void save_init_fpu(struct task_struct *tsk)
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index 41e0b8c..727e6c1 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -622,7 +622,6 @@ EXPORT_SYMBOL_GPL(math_state_restore);
+ dotraplinkage void __kprobes
+ do_device_not_available(struct pt_regs *regs, long error_code)
+ {
+-	WARN_ON_ONCE(!user_mode_vm(regs));
+ #ifdef CONFIG_MATH_EMULATION
+ 	if (read_cr0() & X86_CR0_EM) {
+ 		struct math_emu_info info = { };
+diff --git a/arch/x86/kernel/xsave.c b/arch/x86/kernel/xsave.c
+index a391134..86f1f09 100644
+--- a/arch/x86/kernel/xsave.c
++++ b/arch/x86/kernel/xsave.c
+@@ -168,7 +168,7 @@ int save_i387_xstate(void __user *buf)
+ 	if (!used_math())
+ 		return 0;
+ 
+-	if (task_thread_info(tsk)->status & TS_USEDFPU) {
++	if (user_has_fpu()) {
+ 		if (use_xsave())
+ 			err = xsave_user(buf);
+ 		else
+@@ -176,8 +176,7 @@ int save_i387_xstate(void __user *buf)
+ 
+ 		if (err)
+ 			return err;
+-		task_thread_info(tsk)->status &= ~TS_USEDFPU;
+-		stts();
++		user_fpu_end();
+ 	} else {
+ 		sanitize_i387_state(tsk);
+ 		if (__copy_to_user(buf, &tsk->thread.fpu.state->fxsave,
+@@ -292,10 +291,7 @@ int restore_i387_xstate(void __user *buf)
+ 			return err;
+ 	}
+ 
+-	if (!(task_thread_info(current)->status & TS_USEDFPU)) {
+-		clts();
+-		task_thread_info(current)->status |= TS_USEDFPU;
+-	}
++	user_fpu_begin();
+ 	if (use_xsave())
+ 		err = restore_user_xstate(buf);
+ 	else
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0005-i387-move-TS_USEDFPU-clearing-out-of-__save_init_fpu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0005-i387-move-TS_USEDFPU-clearing-out-of-__save_init_fpu.patch
new file mode 100644
index 0000000..a8d1982
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0005-i387-move-TS_USEDFPU-clearing-out-of-__save_init_fpu.patch
@@ -0,0 +1,64 @@
+From 38358b6185298df66ef4ddb4ceaaa1baf8521b28 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 16 Feb 2012 12:22:48 -0800
+Subject: [PATCH 05/11] i387: move TS_USEDFPU clearing out of __save_init_fpu
+ and into callers
+
+commit b6c66418dcad0fcf83cd1d0a39482db37bf4fc41 upstream.
+
+Touching TS_USEDFPU without touching CR0.TS is confusing, so don't do
+it.  By moving it into the callers, we always do the TS_USEDFPU next to
+the CR0.TS accesses in the source code, and it's much easier to see how
+the two go hand in hand.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h |    9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index 6e87fa4..55fb3aa 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -259,7 +259,6 @@ static inline void fpu_save_init(struct fpu *fpu)
+ static inline void __save_init_fpu(struct task_struct *tsk)
+ {
+ 	fpu_save_init(&tsk->thread.fpu);
+-	task_thread_info(tsk)->status &= ~TS_USEDFPU;
+ }
+ 
+ static inline int fpu_fxrstor_checking(struct fpu *fpu)
+@@ -290,6 +289,7 @@ static inline void __unlazy_fpu(struct task_struct *tsk)
+ {
+ 	if (task_thread_info(tsk)->status & TS_USEDFPU) {
+ 		__save_init_fpu(tsk);
++		task_thread_info(tsk)->status &= ~TS_USEDFPU;
+ 		stts();
+ 	} else
+ 		tsk->fpu_counter = 0;
+@@ -356,9 +356,11 @@ static inline void kernel_fpu_begin(void)
+ 
+ 	WARN_ON_ONCE(!irq_fpu_usable());
+ 	preempt_disable();
+-	if (me->status & TS_USEDFPU)
++	if (me->status & TS_USEDFPU) {
+ 		__save_init_fpu(me->task);
+-	else
++		me->status &= ~TS_USEDFPU;
++		/* We do 'stts()' in kernel_fpu_end() */
++	} else
+ 		clts();
+ }
+ 
+@@ -449,6 +451,7 @@ static inline void save_init_fpu(struct task_struct *tsk)
+ 	WARN_ON_ONCE(!(task_thread_info(tsk)->status & TS_USEDFPU));
+ 	preempt_disable();
+ 	__save_init_fpu(tsk);
++	task_thread_info(tsk)->status &= ~TS_USEDFPU;
+ 	stts();
+ 	preempt_enable();
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0006-i387-don-t-ever-touch-TS_USEDFPU-directly-use-helper.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0006-i387-don-t-ever-touch-TS_USEDFPU-directly-use-helper.patch
new file mode 100644
index 0000000..7daaa62
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0006-i387-don-t-ever-touch-TS_USEDFPU-directly-use-helper.patch
@@ -0,0 +1,228 @@
+From 29515b215b9bbbad0368a5039ba6e53ed3fa7f25 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 16 Feb 2012 13:33:12 -0800
+Subject: [PATCH 06/11] i387: don't ever touch TS_USEDFPU directly, use helper
+ functions
+
+commit 6d59d7a9f5b723a7ac1925c136e93ec83c0c3043 upstream.
+
+This creates three helper functions that do the TS_USEDFPU accesses, and
+makes everybody that used to do it by hand use those helpers instead.
+
+In addition, there's a couple of helper functions for the "change both
+CR0.TS and TS_USEDFPU at the same time" case, and the places that do
+that together have been changed to use those.  That means that we have
+fewer random places that open-code this situation.
+
+The intent is partly to clarify the code without actually changing any
+semantics yet (since we clearly still have some hard to reproduce bug in
+this area), but also to make it much easier to use another approach
+entirely to caching the CR0.TS bit for software accesses.
+
+Right now we use a bit in the thread-info 'status' variable (this patch
+does not change that), but we might want to make it a full field of its
+own or even make it a per-cpu variable.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h |   75 +++++++++++++++++++++++++++++++-----------
+ arch/x86/kernel/traps.c     |    2 +-
+ arch/x86/kernel/xsave.c     |    2 +-
+ arch/x86/kvm/vmx.c          |    2 +-
+ 4 files changed, 58 insertions(+), 23 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index 55fb3aa..730d7be 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -280,6 +280,47 @@ static inline int restore_fpu_checking(struct task_struct *tsk)
+ }
+ 
+ /*
++ * Software FPU state helpers. Careful: these need to
++ * be preemption protection *and* they need to be
++ * properly paired with the CR0.TS changes!
++ */
++static inline int __thread_has_fpu(struct thread_info *ti)
++{
++	return ti->status & TS_USEDFPU;
++}
++
++/* Must be paired with an 'stts' after! */
++static inline void __thread_clear_has_fpu(struct thread_info *ti)
++{
++	ti->status &= ~TS_USEDFPU;
++}
++
++/* Must be paired with a 'clts' before! */
++static inline void __thread_set_has_fpu(struct thread_info *ti)
++{
++	ti->status |= TS_USEDFPU;
++}
++
++/*
++ * Encapsulate the CR0.TS handling together with the
++ * software flag.
++ *
++ * These generally need preemption protection to work,
++ * do try to avoid using these on their own.
++ */
++static inline void __thread_fpu_end(struct thread_info *ti)
++{
++	__thread_clear_has_fpu(ti);
++	stts();
++}
++
++static inline void __thread_fpu_begin(struct thread_info *ti)
++{
++	clts();
++	__thread_set_has_fpu(ti);
++}
++
++/*
+  * Signal frame handlers...
+  */
+ extern int save_i387_xstate(void __user *buf);
+@@ -287,23 +328,21 @@ extern int restore_i387_xstate(void __user *buf);
+ 
+ static inline void __unlazy_fpu(struct task_struct *tsk)
+ {
+-	if (task_thread_info(tsk)->status & TS_USEDFPU) {
++	if (__thread_has_fpu(task_thread_info(tsk))) {
+ 		__save_init_fpu(tsk);
+-		task_thread_info(tsk)->status &= ~TS_USEDFPU;
+-		stts();
++		__thread_fpu_end(task_thread_info(tsk));
+ 	} else
+ 		tsk->fpu_counter = 0;
+ }
+ 
+ static inline void __clear_fpu(struct task_struct *tsk)
+ {
+-	if (task_thread_info(tsk)->status & TS_USEDFPU) {
++	if (__thread_has_fpu(task_thread_info(tsk))) {
+ 		/* Ignore delayed exceptions from user space */
+ 		asm volatile("1: fwait\n"
+ 			     "2:\n"
+ 			     _ASM_EXTABLE(1b, 2b));
+-		task_thread_info(tsk)->status &= ~TS_USEDFPU;
+-		stts();
++		__thread_fpu_end(task_thread_info(tsk));
+ 	}
+ }
+ 
+@@ -311,14 +350,14 @@ static inline void __clear_fpu(struct task_struct *tsk)
+  * Were we in an interrupt that interrupted kernel mode?
+  *
+  * We can do a kernel_fpu_begin/end() pair *ONLY* if that
+- * pair does nothing at all: TS_USEDFPU must be clear (so
++ * pair does nothing at all: the thread must not have fpu (so
+  * that we don't try to save the FPU state), and TS must
+  * be set (so that the clts/stts pair does nothing that is
+  * visible in the interrupted kernel thread).
+  */
+ static inline bool interrupted_kernel_fpu_idle(void)
+ {
+-	return !(current_thread_info()->status & TS_USEDFPU) &&
++	return !__thread_has_fpu(current_thread_info()) &&
+ 		(read_cr0() & X86_CR0_TS);
+ }
+ 
+@@ -356,9 +395,9 @@ static inline void kernel_fpu_begin(void)
+ 
+ 	WARN_ON_ONCE(!irq_fpu_usable());
+ 	preempt_disable();
+-	if (me->status & TS_USEDFPU) {
++	if (__thread_has_fpu(me)) {
+ 		__save_init_fpu(me->task);
+-		me->status &= ~TS_USEDFPU;
++		__thread_clear_has_fpu(me);
+ 		/* We do 'stts()' in kernel_fpu_end() */
+ 	} else
+ 		clts();
+@@ -422,24 +461,21 @@ static inline void irq_ts_restore(int TS_state)
+  */
+ static inline int user_has_fpu(void)
+ {
+-	return current_thread_info()->status & TS_USEDFPU;
++	return __thread_has_fpu(current_thread_info());
+ }
+ 
+ static inline void user_fpu_end(void)
+ {
+ 	preempt_disable();
+-	current_thread_info()->status &= ~TS_USEDFPU;
+-	stts();
++	__thread_fpu_end(current_thread_info());
+ 	preempt_enable();
+ }
+ 
+ static inline void user_fpu_begin(void)
+ {
+ 	preempt_disable();
+-	if (!user_has_fpu()) {
+-		clts();
+-		current_thread_info()->status |= TS_USEDFPU;
+-	}
++	if (!user_has_fpu())
++		__thread_fpu_begin(current_thread_info());
+ 	preempt_enable();
+ }
+ 
+@@ -448,11 +484,10 @@ static inline void user_fpu_begin(void)
+  */
+ static inline void save_init_fpu(struct task_struct *tsk)
+ {
+-	WARN_ON_ONCE(!(task_thread_info(tsk)->status & TS_USEDFPU));
++	WARN_ON_ONCE(!__thread_has_fpu(task_thread_info(tsk)));
+ 	preempt_disable();
+ 	__save_init_fpu(tsk);
+-	task_thread_info(tsk)->status &= ~TS_USEDFPU;
+-	stts();
++	__thread_fpu_end(task_thread_info(tsk));
+ 	preempt_enable();
+ }
+ 
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index 727e6c1..bb5445c 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -579,7 +579,7 @@ void __math_state_restore(void)
+ 		return;
+ 	}
+ 
+-	thread->status |= TS_USEDFPU;	/* So we fnsave on switch_to() */
++	__thread_set_has_fpu(thread);	/* clts in caller! */
+ 	tsk->fpu_counter++;
+ }
+ 
+diff --git a/arch/x86/kernel/xsave.c b/arch/x86/kernel/xsave.c
+index 86f1f09..a0bcd0d 100644
+--- a/arch/x86/kernel/xsave.c
++++ b/arch/x86/kernel/xsave.c
+@@ -47,7 +47,7 @@ void __sanitize_i387_state(struct task_struct *tsk)
+ 	if (!fx)
+ 		return;
+ 
+-	BUG_ON(task_thread_info(tsk)->status & TS_USEDFPU);
++	BUG_ON(__thread_has_fpu(task_thread_info(tsk)));
+ 
+ 	xstate_bv = tsk->thread.fpu.state->xsave.xsave_hdr.xstate_bv;
+ 
+diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
+index 579a0b5..b2c612d 100644
+--- a/arch/x86/kvm/vmx.c
++++ b/arch/x86/kvm/vmx.c
+@@ -1456,7 +1456,7 @@ static void __vmx_load_host_state(struct vcpu_vmx *vmx)
+ #ifdef CONFIG_X86_64
+ 	wrmsrl(MSR_KERNEL_GS_BASE, vmx->msr_host_kernel_gs_base);
+ #endif
+-	if (current_thread_info()->status & TS_USEDFPU)
++	if (__thread_has_fpu(current_thread_info()))
+ 		clts();
+ 	load_gdt(&__get_cpu_var(host_gdt));
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0007-i387-do-not-preload-FPU-state-at-task-switch-time.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0007-i387-do-not-preload-FPU-state-at-task-switch-time.patch
new file mode 100644
index 0000000..c6553d9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0007-i387-do-not-preload-FPU-state-at-task-switch-time.patch
@@ -0,0 +1,202 @@
+From ba6aaed5cc8f55b77644daf56e9ae3a75f042908 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 16 Feb 2012 15:45:23 -0800
+Subject: [PATCH 07/11] i387: do not preload FPU state at task switch time
+
+commit b3b0870ef3ffed72b92415423da864f440f57ad6 upstream.
+
+Yes, taking the trap to re-load the FPU/MMX state is expensive, but so
+is spending several days looking for a bug in the state save/restore
+code.  And the preload code has some rather subtle interactions with
+both paravirtualization support and segment state restore, so it's not
+nearly as simple as it should be.
+
+Also, now that we no longer necessarily depend on a single bit (ie
+TS_USEDFPU) for keeping track of the state of the FPU, we migth be able
+to do better.  If we are really switching between two processes that
+keep touching the FP state, save/restore is inevitable, but in the case
+of having one process that does most of the FPU usage, we may actually
+be able to do much better than the preloading.
+
+In particular, we may be able to keep track of which CPU the process ran
+on last, and also per CPU keep track of which process' FP state that CPU
+has.  For modern CPU's that don't destroy the FPU contents on save time,
+that would allow us to do a lazy restore by just re-enabling the
+existing FPU state - with no restore cost at all!
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h  |    1 -
+ arch/x86/kernel/process_32.c |   20 --------------------
+ arch/x86/kernel/process_64.c |   23 -----------------------
+ arch/x86/kernel/traps.c      |   35 +++++++++++------------------------
+ 4 files changed, 11 insertions(+), 68 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index 730d7be..3521c24 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -30,7 +30,6 @@ extern void fpu_init(void);
+ extern void mxcsr_feature_mask_init(void);
+ extern int init_fpu(struct task_struct *child);
+ extern void math_state_restore(void);
+-extern void __math_state_restore(void);
+ extern int dump_fpu(struct pt_regs *, struct user_i387_struct *);
+ 
+ extern user_regset_active_fn fpregs_active, xfpregs_active;
+diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
+index 795b79f..0cdb4fa 100644
+--- a/arch/x86/kernel/process_32.c
++++ b/arch/x86/kernel/process_32.c
+@@ -297,23 +297,11 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 				 *next = &next_p->thread;
+ 	int cpu = smp_processor_id();
+ 	struct tss_struct *tss = &per_cpu(init_tss, cpu);
+-	bool preload_fpu;
+ 
+ 	/* never put a printk in __switch_to... printk() calls wake_up*() indirectly */
+ 
+-	/*
+-	 * If the task has used fpu the last 5 timeslices, just do a full
+-	 * restore of the math state immediately to avoid the trap; the
+-	 * chances of needing FPU soon are obviously high now
+-	 */
+-	preload_fpu = tsk_used_math(next_p) && next_p->fpu_counter > 5;
+-
+ 	__unlazy_fpu(prev_p);
+ 
+-	/* we're going to use this soon, after a few expensive things */
+-	if (preload_fpu)
+-		prefetch(next->fpu.state);
+-
+ 	/*
+ 	 * Reload esp0.
+ 	 */
+@@ -352,11 +340,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 		     task_thread_info(next_p)->flags & _TIF_WORK_CTXSW_NEXT))
+ 		__switch_to_xtra(prev_p, next_p, tss);
+ 
+-	/* If we're going to preload the fpu context, make sure clts
+-	   is run while we're batching the cpu state updates. */
+-	if (preload_fpu)
+-		clts();
+-
+ 	/*
+ 	 * Leave lazy mode, flushing any hypercalls made here.
+ 	 * This must be done before restoring TLS segments so
+@@ -366,9 +349,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 	 */
+ 	arch_end_context_switch(next_p);
+ 
+-	if (preload_fpu)
+-		__math_state_restore();
+-
+ 	/*
+ 	 * Restore %gs if needed (which is common)
+ 	 */
+diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
+index 3bd7e6e..370801e 100644
+--- a/arch/x86/kernel/process_64.c
++++ b/arch/x86/kernel/process_64.c
+@@ -381,18 +381,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 	int cpu = smp_processor_id();
+ 	struct tss_struct *tss = &per_cpu(init_tss, cpu);
+ 	unsigned fsindex, gsindex;
+-	bool preload_fpu;
+-
+-	/*
+-	 * If the task has used fpu the last 5 timeslices, just do a full
+-	 * restore of the math state immediately to avoid the trap; the
+-	 * chances of needing FPU soon are obviously high now
+-	 */
+-	preload_fpu = tsk_used_math(next_p) && next_p->fpu_counter > 5;
+-
+-	/* we're going to use this soon, after a few expensive things */
+-	if (preload_fpu)
+-		prefetch(next->fpu.state);
+ 
+ 	/*
+ 	 * Reload esp0, LDT and the page table pointer:
+@@ -425,10 +413,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 	/* Must be after DS reload */
+ 	__unlazy_fpu(prev_p);
+ 
+-	/* Make sure cpu is ready for new context */
+-	if (preload_fpu)
+-		clts();
+-
+ 	/*
+ 	 * Leave lazy mode, flushing any hypercalls made here.
+ 	 * This must be done before restoring TLS segments so
+@@ -487,13 +471,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 		     task_thread_info(prev_p)->flags & _TIF_WORK_CTXSW_PREV))
+ 		__switch_to_xtra(prev_p, next_p, tss);
+ 
+-	/*
+-	 * Preload the FPU context, now that we've determined that the
+-	 * task is likely to be using it. 
+-	 */
+-	if (preload_fpu)
+-		__math_state_restore();
+-
+ 	return prev_p;
+ }
+ 
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index bb5445c..7767ed2 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -562,28 +562,6 @@ asmlinkage void __attribute__((weak)) smp_threshold_interrupt(void)
+ }
+ 
+ /*
+- * __math_state_restore assumes that cr0.TS is already clear and the
+- * fpu state is all ready for use.  Used during context switch.
+- */
+-void __math_state_restore(void)
+-{
+-	struct thread_info *thread = current_thread_info();
+-	struct task_struct *tsk = thread->task;
+-
+-	/*
+-	 * Paranoid restore. send a SIGSEGV if we fail to restore the state.
+-	 */
+-	if (unlikely(restore_fpu_checking(tsk))) {
+-		stts();
+-		force_sig(SIGSEGV, tsk);
+-		return;
+-	}
+-
+-	__thread_set_has_fpu(thread);	/* clts in caller! */
+-	tsk->fpu_counter++;
+-}
+-
+-/*
+  * 'math_state_restore()' saves the current math information in the
+  * old math state array, and gets the new ones from the current task
+  *
+@@ -613,9 +591,18 @@ void math_state_restore(void)
+ 		local_irq_disable();
+ 	}
+ 
+-	clts();				/* Allow maths ops (or we recurse) */
++	__thread_fpu_begin(thread);
+ 
+-	__math_state_restore();
++	/*
++	 * Paranoid restore. send a SIGSEGV if we fail to restore the state.
++	 */
++	if (unlikely(restore_fpu_checking(tsk))) {
++		__thread_fpu_end(thread);
++		force_sig(SIGSEGV, tsk);
++		return;
++	}
++
++	tsk->fpu_counter++;
+ }
+ EXPORT_SYMBOL_GPL(math_state_restore);
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0008-i387-move-AMD-K7-K8-fpu-fxsave-fxrstor-workaround-fr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0008-i387-move-AMD-K7-K8-fpu-fxsave-fxrstor-workaround-fr.patch
new file mode 100644
index 0000000..00458e1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0008-i387-move-AMD-K7-K8-fpu-fxsave-fxrstor-workaround-fr.patch
@@ -0,0 +1,133 @@
+From 9147fbe60acc9125e7b0deae409f1da5c3f8bdda Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 16 Feb 2012 19:11:15 -0800
+Subject: [PATCH 08/11] i387: move AMD K7/K8 fpu fxsave/fxrstor workaround
+ from save to restore
+
+commit 4903062b5485f0e2c286a23b44c9b59d9b017d53 upstream.
+
+The AMD K7/K8 CPUs don't save/restore FDP/FIP/FOP unless an exception is
+pending.  In order to not leak FIP state from one process to another, we
+need to do a floating point load after the fxsave of the old process,
+and before the fxrstor of the new FPU state.  That resets the state to
+the (uninteresting) kernel load, rather than some potentially sensitive
+user information.
+
+We used to do this directly after the FPU state save, but that is
+actually very inconvenient, since it
+
+ (a) corrupts what is potentially perfectly good FPU state that we might
+     want to lazy avoid restoring later and
+
+ (b) on x86-64 it resulted in a very annoying ordering constraint, where
+     "__unlazy_fpu()" in the task switch needs to be delayed until after
+     the DS segment has been reloaded just to get the new DS value.
+
+Coupling it to the fxrstor instead of the fxsave automatically avoids
+both of these issues, and also ensures that we only do it when actually
+necessary (the FP state after a save may never actually get used).  It's
+simply a much more natural place for the leaked state cleanup.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h  |   19 -------------------
+ arch/x86/kernel/process_64.c |    5 ++---
+ arch/x86/kernel/traps.c      |   14 ++++++++++++++
+ 3 files changed, 16 insertions(+), 22 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index 3521c24..01b115d 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -211,15 +211,6 @@ static inline void fpu_fxsave(struct fpu *fpu)
+ 
+ #endif	/* CONFIG_X86_64 */
+ 
+-/* We need a safe address that is cheap to find and that is already
+-   in L1 during context switch. The best choices are unfortunately
+-   different for UP and SMP */
+-#ifdef CONFIG_SMP
+-#define safe_address (__per_cpu_offset[0])
+-#else
+-#define safe_address (kstat_cpu(0).cpustat.user)
+-#endif
+-
+ /*
+  * These must be called with preempt disabled
+  */
+@@ -243,16 +234,6 @@ static inline void fpu_save_init(struct fpu *fpu)
+ 
+ 	if (unlikely(fpu->state->fxsave.swd & X87_FSW_ES))
+ 		asm volatile("fnclex");
+-
+-	/* AMD K7/K8 CPUs don't save/restore FDP/FIP/FOP unless an exception
+-	   is pending.  Clear the x87 state here by setting it to fixed
+-	   values. safe_address is a random variable that should be in L1 */
+-	alternative_input(
+-		ASM_NOP8 ASM_NOP2,
+-		"emms\n\t"	  	/* clear stack tags */
+-		"fildl %P[addr]",	/* set F?P to defined value */
+-		X86_FEATURE_FXSAVE_LEAK,
+-		[addr] "m" (safe_address));
+ }
+ 
+ static inline void __save_init_fpu(struct task_struct *tsk)
+diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
+index 370801e..042b18f 100644
+--- a/arch/x86/kernel/process_64.c
++++ b/arch/x86/kernel/process_64.c
+@@ -382,6 +382,8 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 	struct tss_struct *tss = &per_cpu(init_tss, cpu);
+ 	unsigned fsindex, gsindex;
+ 
++	__unlazy_fpu(prev_p);
++
+ 	/*
+ 	 * Reload esp0, LDT and the page table pointer:
+ 	 */
+@@ -410,9 +412,6 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 
+ 	load_TLS(next, cpu);
+ 
+-	/* Must be after DS reload */
+-	__unlazy_fpu(prev_p);
+-
+ 	/*
+ 	 * Leave lazy mode, flushing any hypercalls made here.
+ 	 * This must be done before restoring TLS segments so
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index 7767ed2..c24bb75 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -576,6 +576,10 @@ void math_state_restore(void)
+ 	struct thread_info *thread = current_thread_info();
+ 	struct task_struct *tsk = thread->task;
+ 
++	/* We need a safe address that is cheap to find and that is already
++	   in L1. We just brought in "thread->task", so use that */
++#define safe_address (thread->task)
++
+ 	if (!tsk_used_math(tsk)) {
+ 		local_irq_enable();
+ 		/*
+@@ -593,6 +597,16 @@ void math_state_restore(void)
+ 
+ 	__thread_fpu_begin(thread);
+ 
++	/* AMD K7/K8 CPUs don't save/restore FDP/FIP/FOP unless an exception
++	   is pending.  Clear the x87 state here by setting it to fixed
++	   values. safe_address is a random variable that should be in L1 */
++	alternative_input(
++		ASM_NOP8 ASM_NOP2,
++		"emms\n\t"	  	/* clear stack tags */
++		"fildl %P[addr]",	/* set F?P to defined value */
++		X86_FEATURE_FXSAVE_LEAK,
++		[addr] "m" (safe_address));
++
+ 	/*
+ 	 * Paranoid restore. send a SIGSEGV if we fail to restore the state.
+ 	 */
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0009-i387-move-TS_USEDFPU-flag-from-thread_info-to-task_s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0009-i387-move-TS_USEDFPU-flag-from-thread_info-to-task_s.patch
new file mode 100644
index 0000000..af43d21
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0009-i387-move-TS_USEDFPU-flag-from-thread_info-to-task_s.patch
@@ -0,0 +1,305 @@
+From 555558c5bf8e8d9919fbcbe4b1cfe920f692c0cb Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Fri, 17 Feb 2012 21:48:54 -0800
+Subject: [PATCH 09/11] i387: move TS_USEDFPU flag from thread_info to
+ task_struct
+
+commit f94edacf998516ac9d849f7bc6949a703977a7f3 upstream.
+
+This moves the bit that indicates whether a thread has ownership of the
+FPU from the TS_USEDFPU bit in thread_info->status to a word of its own
+(called 'has_fpu') in task_struct->thread.has_fpu.
+
+This fixes two independent bugs at the same time:
+
+ - changing 'thread_info->status' from the scheduler causes nasty
+   problems for the other users of that variable, since it is defined to
+   be thread-synchronous (that's what the "TS_" part of the naming was
+   supposed to indicate).
+
+   So perfectly valid code could (and did) do
+
+	ti->status |= TS_RESTORE_SIGMASK;
+
+   and the compiler was free to do that as separate load, or and store
+   instructions.  Which can cause problems with preemption, since a task
+   switch could happen in between, and change the TS_USEDFPU bit. The
+   change to TS_USEDFPU would be overwritten by the final store.
+
+   In practice, this seldom happened, though, because the 'status' field
+   was seldom used more than once, so gcc would generally tend to
+   generate code that used a read-modify-write instruction and thus
+   happened to avoid this problem - RMW instructions are naturally low
+   fat and preemption-safe.
+
+ - On x86-32, the current_thread_info() pointer would, during interrupts
+   and softirqs, point to a *copy* of the real thread_info, because
+   x86-32 uses %esp to calculate the thread_info address, and thus the
+   separate irq (and softirq) stacks would cause these kinds of odd
+   thread_info copy aliases.
+
+   This is normally not a problem, since interrupts aren't supposed to
+   look at thread information anyway (what thread is running at
+   interrupt time really isn't very well-defined), but it confused the
+   heck out of irq_fpu_usable() and the code that tried to squirrel
+   away the FPU state.
+
+   (It also caused untold confusion for us poor kernel developers).
+
+It also turns out that using 'task_struct' is actually much more natural
+for most of the call sites that care about the FPU state, since they
+tend to work with the task struct for other reasons anyway (ie
+scheduling).  And the FPU data that we are going to save/restore is
+found there too.
+
+Thanks to Arjan Van De Ven <arjan@linux.intel.com> for pointing us to
+the %esp issue.
+
+Cc: Arjan van de Ven <arjan@linux.intel.com>
+Reported-and-tested-by: Raphael Prevost <raphael@buro.asia>
+Acked-and-tested-by: Suresh Siddha <suresh.b.siddha@intel.com>
+Tested-by: Peter Anvin <hpa@zytor.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h        |   44 ++++++++++++++++++------------------
+ arch/x86/include/asm/processor.h   |    1 +
+ arch/x86/include/asm/thread_info.h |    2 -
+ arch/x86/kernel/traps.c            |   11 ++++-----
+ arch/x86/kernel/xsave.c            |    2 +-
+ arch/x86/kvm/vmx.c                 |    2 +-
+ 6 files changed, 30 insertions(+), 32 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index 01b115d..f537667 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -264,21 +264,21 @@ static inline int restore_fpu_checking(struct task_struct *tsk)
+  * be preemption protection *and* they need to be
+  * properly paired with the CR0.TS changes!
+  */
+-static inline int __thread_has_fpu(struct thread_info *ti)
++static inline int __thread_has_fpu(struct task_struct *tsk)
+ {
+-	return ti->status & TS_USEDFPU;
++	return tsk->thread.has_fpu;
+ }
+ 
+ /* Must be paired with an 'stts' after! */
+-static inline void __thread_clear_has_fpu(struct thread_info *ti)
++static inline void __thread_clear_has_fpu(struct task_struct *tsk)
+ {
+-	ti->status &= ~TS_USEDFPU;
++	tsk->thread.has_fpu = 0;
+ }
+ 
+ /* Must be paired with a 'clts' before! */
+-static inline void __thread_set_has_fpu(struct thread_info *ti)
++static inline void __thread_set_has_fpu(struct task_struct *tsk)
+ {
+-	ti->status |= TS_USEDFPU;
++	tsk->thread.has_fpu = 1;
+ }
+ 
+ /*
+@@ -288,16 +288,16 @@ static inline void __thread_set_has_fpu(struct thread_info *ti)
+  * These generally need preemption protection to work,
+  * do try to avoid using these on their own.
+  */
+-static inline void __thread_fpu_end(struct thread_info *ti)
++static inline void __thread_fpu_end(struct task_struct *tsk)
+ {
+-	__thread_clear_has_fpu(ti);
++	__thread_clear_has_fpu(tsk);
+ 	stts();
+ }
+ 
+-static inline void __thread_fpu_begin(struct thread_info *ti)
++static inline void __thread_fpu_begin(struct task_struct *tsk)
+ {
+ 	clts();
+-	__thread_set_has_fpu(ti);
++	__thread_set_has_fpu(tsk);
+ }
+ 
+ /*
+@@ -308,21 +308,21 @@ extern int restore_i387_xstate(void __user *buf);
+ 
+ static inline void __unlazy_fpu(struct task_struct *tsk)
+ {
+-	if (__thread_has_fpu(task_thread_info(tsk))) {
++	if (__thread_has_fpu(tsk)) {
+ 		__save_init_fpu(tsk);
+-		__thread_fpu_end(task_thread_info(tsk));
++		__thread_fpu_end(tsk);
+ 	} else
+ 		tsk->fpu_counter = 0;
+ }
+ 
+ static inline void __clear_fpu(struct task_struct *tsk)
+ {
+-	if (__thread_has_fpu(task_thread_info(tsk))) {
++	if (__thread_has_fpu(tsk)) {
+ 		/* Ignore delayed exceptions from user space */
+ 		asm volatile("1: fwait\n"
+ 			     "2:\n"
+ 			     _ASM_EXTABLE(1b, 2b));
+-		__thread_fpu_end(task_thread_info(tsk));
++		__thread_fpu_end(tsk);
+ 	}
+ }
+ 
+@@ -337,7 +337,7 @@ static inline void __clear_fpu(struct task_struct *tsk)
+  */
+ static inline bool interrupted_kernel_fpu_idle(void)
+ {
+-	return !__thread_has_fpu(current_thread_info()) &&
++	return !__thread_has_fpu(current) &&
+ 		(read_cr0() & X86_CR0_TS);
+ }
+ 
+@@ -371,12 +371,12 @@ static inline bool irq_fpu_usable(void)
+ 
+ static inline void kernel_fpu_begin(void)
+ {
+-	struct thread_info *me = current_thread_info();
++	struct task_struct *me = current;
+ 
+ 	WARN_ON_ONCE(!irq_fpu_usable());
+ 	preempt_disable();
+ 	if (__thread_has_fpu(me)) {
+-		__save_init_fpu(me->task);
++		__save_init_fpu(me);
+ 		__thread_clear_has_fpu(me);
+ 		/* We do 'stts()' in kernel_fpu_end() */
+ 	} else
+@@ -441,13 +441,13 @@ static inline void irq_ts_restore(int TS_state)
+  */
+ static inline int user_has_fpu(void)
+ {
+-	return __thread_has_fpu(current_thread_info());
++	return __thread_has_fpu(current);
+ }
+ 
+ static inline void user_fpu_end(void)
+ {
+ 	preempt_disable();
+-	__thread_fpu_end(current_thread_info());
++	__thread_fpu_end(current);
+ 	preempt_enable();
+ }
+ 
+@@ -455,7 +455,7 @@ static inline void user_fpu_begin(void)
+ {
+ 	preempt_disable();
+ 	if (!user_has_fpu())
+-		__thread_fpu_begin(current_thread_info());
++		__thread_fpu_begin(current);
+ 	preempt_enable();
+ }
+ 
+@@ -464,10 +464,10 @@ static inline void user_fpu_begin(void)
+  */
+ static inline void save_init_fpu(struct task_struct *tsk)
+ {
+-	WARN_ON_ONCE(!__thread_has_fpu(task_thread_info(tsk)));
++	WARN_ON_ONCE(!__thread_has_fpu(tsk));
+ 	preempt_disable();
+ 	__save_init_fpu(tsk);
+-	__thread_fpu_end(task_thread_info(tsk));
++	__thread_fpu_end(tsk);
+ 	preempt_enable();
+ }
+ 
+diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
+index b650435..bb3ee36 100644
+--- a/arch/x86/include/asm/processor.h
++++ b/arch/x86/include/asm/processor.h
+@@ -456,6 +456,7 @@ struct thread_struct {
+ 	unsigned long		trap_no;
+ 	unsigned long		error_code;
+ 	/* floating point and extended processor state */
++	unsigned long		has_fpu;
+ 	struct fpu		fpu;
+ #ifdef CONFIG_X86_32
+ 	/* Virtual 86 mode info */
+diff --git a/arch/x86/include/asm/thread_info.h b/arch/x86/include/asm/thread_info.h
+index a1fe5c1..d7ef849 100644
+--- a/arch/x86/include/asm/thread_info.h
++++ b/arch/x86/include/asm/thread_info.h
+@@ -242,8 +242,6 @@ static inline struct thread_info *current_thread_info(void)
+  * ever touches our thread-synchronous status, so we don't
+  * have to worry about atomic accesses.
+  */
+-#define TS_USEDFPU		0x0001	/* FPU was used by this task
+-					   this quantum (SMP) */
+ #define TS_COMPAT		0x0002	/* 32bit syscall active (64BIT)*/
+ #define TS_POLLING		0x0004	/* idle task polling need_resched,
+ 					   skip sending interrupt */
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index c24bb75..a99badf 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -573,12 +573,11 @@ asmlinkage void __attribute__((weak)) smp_threshold_interrupt(void)
+  */
+ void math_state_restore(void)
+ {
+-	struct thread_info *thread = current_thread_info();
+-	struct task_struct *tsk = thread->task;
++	struct task_struct *tsk = current;
+ 
+ 	/* We need a safe address that is cheap to find and that is already
+-	   in L1. We just brought in "thread->task", so use that */
+-#define safe_address (thread->task)
++	   in L1. We're just bringing in "tsk->thread.has_fpu", so use that */
++#define safe_address (tsk->thread.has_fpu)
+ 
+ 	if (!tsk_used_math(tsk)) {
+ 		local_irq_enable();
+@@ -595,7 +594,7 @@ void math_state_restore(void)
+ 		local_irq_disable();
+ 	}
+ 
+-	__thread_fpu_begin(thread);
++	__thread_fpu_begin(tsk);
+ 
+ 	/* AMD K7/K8 CPUs don't save/restore FDP/FIP/FOP unless an exception
+ 	   is pending.  Clear the x87 state here by setting it to fixed
+@@ -611,7 +610,7 @@ void math_state_restore(void)
+ 	 * Paranoid restore. send a SIGSEGV if we fail to restore the state.
+ 	 */
+ 	if (unlikely(restore_fpu_checking(tsk))) {
+-		__thread_fpu_end(thread);
++		__thread_fpu_end(tsk);
+ 		force_sig(SIGSEGV, tsk);
+ 		return;
+ 	}
+diff --git a/arch/x86/kernel/xsave.c b/arch/x86/kernel/xsave.c
+index a0bcd0d..7110911 100644
+--- a/arch/x86/kernel/xsave.c
++++ b/arch/x86/kernel/xsave.c
+@@ -47,7 +47,7 @@ void __sanitize_i387_state(struct task_struct *tsk)
+ 	if (!fx)
+ 		return;
+ 
+-	BUG_ON(__thread_has_fpu(task_thread_info(tsk)));
++	BUG_ON(__thread_has_fpu(tsk));
+ 
+ 	xstate_bv = tsk->thread.fpu.state->xsave.xsave_hdr.xstate_bv;
+ 
+diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
+index b2c612d..4ea7678 100644
+--- a/arch/x86/kvm/vmx.c
++++ b/arch/x86/kvm/vmx.c
+@@ -1456,7 +1456,7 @@ static void __vmx_load_host_state(struct vcpu_vmx *vmx)
+ #ifdef CONFIG_X86_64
+ 	wrmsrl(MSR_KERNEL_GS_BASE, vmx->msr_host_kernel_gs_base);
+ #endif
+-	if (__thread_has_fpu(current_thread_info()))
++	if (__thread_has_fpu(current))
+ 		clts();
+ 	load_gdt(&__get_cpu_var(host_gdt));
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0010-i387-re-introduce-FPU-state-preloading-at-context-sw.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0010-i387-re-introduce-FPU-state-preloading-at-context-sw.patch
new file mode 100644
index 0000000..95d4a73
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0010-i387-re-introduce-FPU-state-preloading-at-context-sw.patch
@@ -0,0 +1,353 @@
+From 9016ec427136d5b5d025948319cf1114dc7734e4 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Sat, 18 Feb 2012 12:56:35 -0800
+Subject: [PATCH 10/11] i387: re-introduce FPU state preloading at context
+ switch time
+
+commit 34ddc81a230b15c0e345b6b253049db731499f7e upstream.
+
+After all the FPU state cleanups and finally finding the problem that
+caused all our FPU save/restore problems, this re-introduces the
+preloading of FPU state that was removed in commit b3b0870ef3ff ("i387:
+do not preload FPU state at task switch time").
+
+However, instead of simply reverting the removal, this reimplements
+preloading with several fixes, most notably
+
+ - properly abstracted as a true FPU state switch, rather than as
+   open-coded save and restore with various hacks.
+
+   In particular, implementing it as a proper FPU state switch allows us
+   to optimize the CR0.TS flag accesses: there is no reason to set the
+   TS bit only to then almost immediately clear it again.  CR0 accesses
+   are quite slow and expensive, don't flip the bit back and forth for
+   no good reason.
+
+ - Make sure that the same model works for both x86-32 and x86-64, so
+   that there are no gratuitous differences between the two due to the
+   way they save and restore segment state differently due to
+   architectural differences that really don't matter to the FPU state.
+
+ - Avoid exposing the "preload" state to the context switch routines,
+   and in particular allow the concept of lazy state restore: if nothing
+   else has used the FPU in the meantime, and the process is still on
+   the same CPU, we can avoid restoring state from memory entirely, just
+   re-expose the state that is still in the FPU unit.
+
+   That optimized lazy restore isn't actually implemented here, but the
+   infrastructure is set up for it.  Of course, older CPU's that use
+   'fnsave' to save the state cannot take advantage of this, since the
+   state saving also trashes the state.
+
+In other words, there is now an actual _design_ to the FPU state saving,
+rather than just random historical baggage.  Hopefully it's easier to
+follow as a result.
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/include/asm/i387.h  |  110 +++++++++++++++++++++++++++++++++++-------
+ arch/x86/kernel/process_32.c |    5 ++-
+ arch/x86/kernel/process_64.c |    5 ++-
+ arch/x86/kernel/traps.c      |   55 ++++++++++++---------
+ 4 files changed, 133 insertions(+), 42 deletions(-)
+
+diff --git a/arch/x86/include/asm/i387.h b/arch/x86/include/asm/i387.h
+index f537667..a850b4d 100644
+--- a/arch/x86/include/asm/i387.h
++++ b/arch/x86/include/asm/i387.h
+@@ -29,6 +29,7 @@ extern unsigned int sig_xstate_size;
+ extern void fpu_init(void);
+ extern void mxcsr_feature_mask_init(void);
+ extern int init_fpu(struct task_struct *child);
++extern void __math_state_restore(struct task_struct *);
+ extern void math_state_restore(void);
+ extern int dump_fpu(struct pt_regs *, struct user_i387_struct *);
+ 
+@@ -212,9 +213,10 @@ static inline void fpu_fxsave(struct fpu *fpu)
+ #endif	/* CONFIG_X86_64 */
+ 
+ /*
+- * These must be called with preempt disabled
++ * These must be called with preempt disabled. Returns
++ * 'true' if the FPU state is still intact.
+  */
+-static inline void fpu_save_init(struct fpu *fpu)
++static inline int fpu_save_init(struct fpu *fpu)
+ {
+ 	if (use_xsave()) {
+ 		fpu_xsave(fpu);
+@@ -223,22 +225,33 @@ static inline void fpu_save_init(struct fpu *fpu)
+ 		 * xsave header may indicate the init state of the FP.
+ 		 */
+ 		if (!(fpu->state->xsave.xsave_hdr.xstate_bv & XSTATE_FP))
+-			return;
++			return 1;
+ 	} else if (use_fxsr()) {
+ 		fpu_fxsave(fpu);
+ 	} else {
+ 		asm volatile("fnsave %[fx]; fwait"
+ 			     : [fx] "=m" (fpu->state->fsave));
+-		return;
++		return 0;
+ 	}
+ 
+-	if (unlikely(fpu->state->fxsave.swd & X87_FSW_ES))
++	/*
++	 * If exceptions are pending, we need to clear them so
++	 * that we don't randomly get exceptions later.
++	 *
++	 * FIXME! Is this perhaps only true for the old-style
++	 * irq13 case? Maybe we could leave the x87 state
++	 * intact otherwise?
++	 */
++	if (unlikely(fpu->state->fxsave.swd & X87_FSW_ES)) {
+ 		asm volatile("fnclex");
++		return 0;
++	}
++	return 1;
+ }
+ 
+-static inline void __save_init_fpu(struct task_struct *tsk)
++static inline int __save_init_fpu(struct task_struct *tsk)
+ {
+-	fpu_save_init(&tsk->thread.fpu);
++	return fpu_save_init(&tsk->thread.fpu);
+ }
+ 
+ static inline int fpu_fxrstor_checking(struct fpu *fpu)
+@@ -301,20 +314,79 @@ static inline void __thread_fpu_begin(struct task_struct *tsk)
+ }
+ 
+ /*
+- * Signal frame handlers...
++ * FPU state switching for scheduling.
++ *
++ * This is a two-stage process:
++ *
++ *  - switch_fpu_prepare() saves the old state and
++ *    sets the new state of the CR0.TS bit. This is
++ *    done within the context of the old process.
++ *
++ *  - switch_fpu_finish() restores the new state as
++ *    necessary.
+  */
+-extern int save_i387_xstate(void __user *buf);
+-extern int restore_i387_xstate(void __user *buf);
++typedef struct { int preload; } fpu_switch_t;
++
++/*
++ * FIXME! We could do a totally lazy restore, but we need to
++ * add a per-cpu "this was the task that last touched the FPU
++ * on this CPU" variable, and the task needs to have a "I last
++ * touched the FPU on this CPU" and check them.
++ *
++ * We don't do that yet, so "fpu_lazy_restore()" always returns
++ * false, but some day..
++ */
++#define fpu_lazy_restore(tsk) (0)
++#define fpu_lazy_state_intact(tsk) do { } while (0)
++
++static inline fpu_switch_t switch_fpu_prepare(struct task_struct *old, struct task_struct *new)
++{
++	fpu_switch_t fpu;
++
++	fpu.preload = tsk_used_math(new) && new->fpu_counter > 5;
++	if (__thread_has_fpu(old)) {
++		if (__save_init_fpu(old))
++			fpu_lazy_state_intact(old);
++		__thread_clear_has_fpu(old);
++		old->fpu_counter++;
++
++		/* Don't change CR0.TS if we just switch! */
++		if (fpu.preload) {
++			__thread_set_has_fpu(new);
++			prefetch(new->thread.fpu.state);
++		} else
++			stts();
++	} else {
++		old->fpu_counter = 0;
++		if (fpu.preload) {
++			if (fpu_lazy_restore(new))
++				fpu.preload = 0;
++			else
++				prefetch(new->thread.fpu.state);
++			__thread_fpu_begin(new);
++		}
++	}
++	return fpu;
++}
+ 
+-static inline void __unlazy_fpu(struct task_struct *tsk)
++/*
++ * By the time this gets called, we've already cleared CR0.TS and
++ * given the process the FPU if we are going to preload the FPU
++ * state - all we need to do is to conditionally restore the register
++ * state itself.
++ */
++static inline void switch_fpu_finish(struct task_struct *new, fpu_switch_t fpu)
+ {
+-	if (__thread_has_fpu(tsk)) {
+-		__save_init_fpu(tsk);
+-		__thread_fpu_end(tsk);
+-	} else
+-		tsk->fpu_counter = 0;
++	if (fpu.preload)
++		__math_state_restore(new);
+ }
+ 
++/*
++ * Signal frame handlers...
++ */
++extern int save_i387_xstate(void __user *buf);
++extern int restore_i387_xstate(void __user *buf);
++
+ static inline void __clear_fpu(struct task_struct *tsk)
+ {
+ 	if (__thread_has_fpu(tsk)) {
+@@ -474,7 +546,11 @@ static inline void save_init_fpu(struct task_struct *tsk)
+ static inline void unlazy_fpu(struct task_struct *tsk)
+ {
+ 	preempt_disable();
+-	__unlazy_fpu(tsk);
++	if (__thread_has_fpu(tsk)) {
++		__save_init_fpu(tsk);
++		__thread_fpu_end(tsk);
++	} else
++		tsk->fpu_counter = 0;
+ 	preempt_enable();
+ }
+ 
+diff --git a/arch/x86/kernel/process_32.c b/arch/x86/kernel/process_32.c
+index 0cdb4fa..8598296 100644
+--- a/arch/x86/kernel/process_32.c
++++ b/arch/x86/kernel/process_32.c
+@@ -297,10 +297,11 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 				 *next = &next_p->thread;
+ 	int cpu = smp_processor_id();
+ 	struct tss_struct *tss = &per_cpu(init_tss, cpu);
++	fpu_switch_t fpu;
+ 
+ 	/* never put a printk in __switch_to... printk() calls wake_up*() indirectly */
+ 
+-	__unlazy_fpu(prev_p);
++	fpu = switch_fpu_prepare(prev_p, next_p);
+ 
+ 	/*
+ 	 * Reload esp0.
+@@ -355,6 +356,8 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 	if (prev->gs | next->gs)
+ 		lazy_load_gs(next->gs);
+ 
++	switch_fpu_finish(next_p, fpu);
++
+ 	percpu_write(current_task, next_p);
+ 
+ 	return prev_p;
+diff --git a/arch/x86/kernel/process_64.c b/arch/x86/kernel/process_64.c
+index 042b18f..6a364a6 100644
+--- a/arch/x86/kernel/process_64.c
++++ b/arch/x86/kernel/process_64.c
+@@ -381,8 +381,9 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 	int cpu = smp_processor_id();
+ 	struct tss_struct *tss = &per_cpu(init_tss, cpu);
+ 	unsigned fsindex, gsindex;
++	fpu_switch_t fpu;
+ 
+-	__unlazy_fpu(prev_p);
++	fpu = switch_fpu_prepare(prev_p, next_p);
+ 
+ 	/*
+ 	 * Reload esp0, LDT and the page table pointer:
+@@ -452,6 +453,8 @@ __switch_to(struct task_struct *prev_p, struct task_struct *next_p)
+ 		wrmsrl(MSR_KERNEL_GS_BASE, next->gs);
+ 	prev->gsindex = gsindex;
+ 
++	switch_fpu_finish(next_p, fpu);
++
+ 	/*
+ 	 * Switch the PDA and FPU contexts.
+ 	 */
+diff --git a/arch/x86/kernel/traps.c b/arch/x86/kernel/traps.c
+index a99badf..31d9d0f 100644
+--- a/arch/x86/kernel/traps.c
++++ b/arch/x86/kernel/traps.c
+@@ -562,6 +562,37 @@ asmlinkage void __attribute__((weak)) smp_threshold_interrupt(void)
+ }
+ 
+ /*
++ * This gets called with the process already owning the
++ * FPU state, and with CR0.TS cleared. It just needs to
++ * restore the FPU register state.
++ */
++void __math_state_restore(struct task_struct *tsk)
++{
++	/* We need a safe address that is cheap to find and that is already
++	   in L1. We've just brought in "tsk->thread.has_fpu", so use that */
++#define safe_address (tsk->thread.has_fpu)
++
++	/* AMD K7/K8 CPUs don't save/restore FDP/FIP/FOP unless an exception
++	   is pending.  Clear the x87 state here by setting it to fixed
++	   values. safe_address is a random variable that should be in L1 */
++	alternative_input(
++		ASM_NOP8 ASM_NOP2,
++		"emms\n\t"	  	/* clear stack tags */
++		"fildl %P[addr]",	/* set F?P to defined value */
++		X86_FEATURE_FXSAVE_LEAK,
++		[addr] "m" (safe_address));
++
++	/*
++	 * Paranoid restore. send a SIGSEGV if we fail to restore the state.
++	 */
++	if (unlikely(restore_fpu_checking(tsk))) {
++		__thread_fpu_end(tsk);
++		force_sig(SIGSEGV, tsk);
++		return;
++	}
++}
++
++/*
+  * 'math_state_restore()' saves the current math information in the
+  * old math state array, and gets the new ones from the current task
+  *
+@@ -575,10 +606,6 @@ void math_state_restore(void)
+ {
+ 	struct task_struct *tsk = current;
+ 
+-	/* We need a safe address that is cheap to find and that is already
+-	   in L1. We're just bringing in "tsk->thread.has_fpu", so use that */
+-#define safe_address (tsk->thread.has_fpu)
+-
+ 	if (!tsk_used_math(tsk)) {
+ 		local_irq_enable();
+ 		/*
+@@ -595,25 +622,7 @@ void math_state_restore(void)
+ 	}
+ 
+ 	__thread_fpu_begin(tsk);
+-
+-	/* AMD K7/K8 CPUs don't save/restore FDP/FIP/FOP unless an exception
+-	   is pending.  Clear the x87 state here by setting it to fixed
+-	   values. safe_address is a random variable that should be in L1 */
+-	alternative_input(
+-		ASM_NOP8 ASM_NOP2,
+-		"emms\n\t"	  	/* clear stack tags */
+-		"fildl %P[addr]",	/* set F?P to defined value */
+-		X86_FEATURE_FXSAVE_LEAK,
+-		[addr] "m" (safe_address));
+-
+-	/*
+-	 * Paranoid restore. send a SIGSEGV if we fail to restore the state.
+-	 */
+-	if (unlikely(restore_fpu_checking(tsk))) {
+-		__thread_fpu_end(tsk);
+-		force_sig(SIGSEGV, tsk);
+-		return;
+-	}
++	__math_state_restore(tsk);
+ 
+ 	tsk->fpu_counter++;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0011-Linux-3.2.8.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0011-Linux-3.2.8.patch
new file mode 100644
index 0000000..e3189b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.8/0011-Linux-3.2.8.patch
@@ -0,0 +1,24 @@
+From 1de504ea25617f701ac3a246a1c9dfd2246d4900 Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Mon, 27 Feb 2012 10:26:22 -0800
+Subject: [PATCH 11/11] Linux 3.2.8
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index d1bdc90..7df8a84 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 7
++SUBLEVEL = 8
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0001-Security-tomoyo-add-.gitignore-file.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0001-Security-tomoyo-add-.gitignore-file.patch
new file mode 100644
index 0000000..aba9a7c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0001-Security-tomoyo-add-.gitignore-file.patch
@@ -0,0 +1,32 @@
+From ae9aea55d123e1091f239833f832de071ff00f22 Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@suse.de>
+Date: Fri, 9 Dec 2011 11:23:46 -0800
+Subject: [PATCH 01/73] Security: tomoyo: add .gitignore file
+
+commit 735e93c70434614bffac4a914ca1da72e37d43c0 upstream.
+
+This adds the .gitignore file for the autogenerated TOMOYO files to keep
+git from complaining after building things.
+
+Cc: Kentaro Takeda <takedakn@nttdata.co.jp>
+Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
+Cc: James Morris <jmorris@namei.org>
+Acked-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
+Signed-off-by: James Morris <jmorris@namei.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ security/tomoyo/.gitignore |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+ create mode 100644 security/tomoyo/.gitignore
+
+diff --git a/security/tomoyo/.gitignore b/security/tomoyo/.gitignore
+new file mode 100644
+index 0000000..5caf1a6
+--- /dev/null
++++ b/security/tomoyo/.gitignore
+@@ -0,0 +1,2 @@
++builtin-policy.h
++policy/
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0002-powerpc-perf-power_pmu_start-restores-incorrect-valu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0002-powerpc-perf-power_pmu_start-restores-incorrect-valu.patch
new file mode 100644
index 0000000..653f93c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0002-powerpc-perf-power_pmu_start-restores-incorrect-valu.patch
@@ -0,0 +1,58 @@
+From 90f91ae1598200e5f650c5ddb1d7165398cf7f5a Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@samba.org>
+Date: Wed, 15 Feb 2012 18:48:22 +0000
+Subject: [PATCH 02/73] powerpc/perf: power_pmu_start restores incorrect
+ values, breaking frequency events
+
+commit 9a45a9407c69d068500923480884661e2b9cc421 upstream.
+
+perf on POWER stopped working after commit e050e3f0a71b (perf: Fix
+broken interrupt rate throttling). That patch exposed a bug in
+the POWER perf_events code.
+
+Since the PMCs count upwards and take an exception when the top bit
+is set, we want to write 0x80000000 - left in power_pmu_start. We were
+instead programming in left which effectively disables the counter
+until we eventually hit 0x80000000. This could take seconds or longer.
+
+With the patch applied I get the expected number of samples:
+
+          SAMPLE events:       9948
+
+Signed-off-by: Anton Blanchard <anton@samba.org>
+Acked-by: Paul Mackerras <paulus@samba.org>
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/powerpc/kernel/perf_event.c |    8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/arch/powerpc/kernel/perf_event.c b/arch/powerpc/kernel/perf_event.c
+index 10a140f..64483fd 100644
+--- a/arch/powerpc/kernel/perf_event.c
++++ b/arch/powerpc/kernel/perf_event.c
+@@ -865,6 +865,7 @@ static void power_pmu_start(struct perf_event *event, int ef_flags)
+ {
+ 	unsigned long flags;
+ 	s64 left;
++	unsigned long val;
+ 
+ 	if (!event->hw.idx || !event->hw.sample_period)
+ 		return;
+@@ -880,7 +881,12 @@ static void power_pmu_start(struct perf_event *event, int ef_flags)
+ 
+ 	event->hw.state = 0;
+ 	left = local64_read(&event->hw.period_left);
+-	write_pmc(event->hw.idx, left);
++
++	val = 0;
++	if (left < 0x80000000L)
++		val = 0x80000000L - left;
++
++	write_pmc(event->hw.idx, val);
+ 
+ 	perf_event_update_userpage(event);
+ 	perf_pmu_enable(event->pmu);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0003-ARM-at91-USB-AT91-gadget-registration-for-module.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0003-ARM-at91-USB-AT91-gadget-registration-for-module.patch
new file mode 100644
index 0000000..cafbf0e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0003-ARM-at91-USB-AT91-gadget-registration-for-module.patch
@@ -0,0 +1,78 @@
+From 4f89dcb180bf8f614410c8fd9cb2ab1d951155b1 Mon Sep 17 00:00:00 2001
+From: Nicolas Ferre <nicolas.ferre@atmel.com>
+Date: Fri, 27 Jan 2012 11:14:44 +0100
+Subject: [PATCH 03/73] ARM: at91: USB AT91 gadget registration for module
+
+commit e8c9dc93e27d891636defbc269f182a83e6abba8 upstream.
+
+Registration of at91_udc as a module will enable SoC
+related code.
+
+Fix following an idea from Karel Znamenacek.
+
+Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Acked-by: Karel Znamenacek <karel@ryston.cz>
+Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mach-at91/at91rm9200_devices.c  |    2 +-
+ arch/arm/mach-at91/at91sam9260_devices.c |    2 +-
+ arch/arm/mach-at91/at91sam9261_devices.c |    2 +-
+ arch/arm/mach-at91/at91sam9263_devices.c |    2 +-
+ 4 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-at91/at91rm9200_devices.c b/arch/arm/mach-at91/at91rm9200_devices.c
+index ad93068..143eebb 100644
+--- a/arch/arm/mach-at91/at91rm9200_devices.c
++++ b/arch/arm/mach-at91/at91rm9200_devices.c
+@@ -83,7 +83,7 @@ void __init at91_add_device_usbh(struct at91_usbh_data *data) {}
+  *  USB Device (Gadget)
+  * -------------------------------------------------------------------- */
+ 
+-#ifdef CONFIG_USB_AT91
++#if defined(CONFIG_USB_AT91) || defined(CONFIG_USB_AT91_MODULE)
+ static struct at91_udc_data udc_data;
+ 
+ static struct resource udc_resources[] = {
+diff --git a/arch/arm/mach-at91/at91sam9260_devices.c b/arch/arm/mach-at91/at91sam9260_devices.c
+index 629fa97..2590988 100644
+--- a/arch/arm/mach-at91/at91sam9260_devices.c
++++ b/arch/arm/mach-at91/at91sam9260_devices.c
+@@ -84,7 +84,7 @@ void __init at91_add_device_usbh(struct at91_usbh_data *data) {}
+  *  USB Device (Gadget)
+  * -------------------------------------------------------------------- */
+ 
+-#ifdef CONFIG_USB_AT91
++#if defined(CONFIG_USB_AT91) || defined(CONFIG_USB_AT91_MODULE)
+ static struct at91_udc_data udc_data;
+ 
+ static struct resource udc_resources[] = {
+diff --git a/arch/arm/mach-at91/at91sam9261_devices.c b/arch/arm/mach-at91/at91sam9261_devices.c
+index a178b58..daf3e66 100644
+--- a/arch/arm/mach-at91/at91sam9261_devices.c
++++ b/arch/arm/mach-at91/at91sam9261_devices.c
+@@ -87,7 +87,7 @@ void __init at91_add_device_usbh(struct at91_usbh_data *data) {}
+  *  USB Device (Gadget)
+  * -------------------------------------------------------------------- */
+ 
+-#ifdef CONFIG_USB_AT91
++#if defined(CONFIG_USB_AT91) || defined(CONFIG_USB_AT91_MODULE)
+ static struct at91_udc_data udc_data;
+ 
+ static struct resource udc_resources[] = {
+diff --git a/arch/arm/mach-at91/at91sam9263_devices.c b/arch/arm/mach-at91/at91sam9263_devices.c
+index d5fbac9..32a7e43 100644
+--- a/arch/arm/mach-at91/at91sam9263_devices.c
++++ b/arch/arm/mach-at91/at91sam9263_devices.c
+@@ -92,7 +92,7 @@ void __init at91_add_device_usbh(struct at91_usbh_data *data) {}
+  *  USB Device (Gadget)
+  * -------------------------------------------------------------------- */
+ 
+-#ifdef CONFIG_USB_AT91
++#if defined(CONFIG_USB_AT91) || defined(CONFIG_USB_AT91_MODULE)
+ static struct at91_udc_data udc_data;
+ 
+ static struct resource udc_resources[] = {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0004-drm-radeon-kms-fix-MSI-re-arm-on-rv370.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0004-drm-radeon-kms-fix-MSI-re-arm-on-rv370.patch
new file mode 100644
index 0000000..05d41bd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0004-drm-radeon-kms-fix-MSI-re-arm-on-rv370.patch
@@ -0,0 +1,54 @@
+From 74d54f57ce5ae36b8e74cab2a349edb614f1b5cb Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Mon, 13 Feb 2012 16:36:34 -0500
+Subject: [PATCH 04/73] drm/radeon/kms: fix MSI re-arm on rv370+
+
+commit b7f5b7dec3d539a84734f2bcb7e53fbb1532a40b upstream.
+
+MSI_REARM_EN register is a write only trigger register.
+There is no need RMW when re-arming.
+
+May fix:
+https://bugs.freedesktop.org/show_bug.cgi?id=41668
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/r100.c  |    4 +---
+ drivers/gpu/drm/radeon/rs600.c |    4 +---
+ 2 files changed, 2 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/r100.c b/drivers/gpu/drm/radeon/r100.c
+index 31b0d1a..fad7cd1 100644
+--- a/drivers/gpu/drm/radeon/r100.c
++++ b/drivers/gpu/drm/radeon/r100.c
+@@ -789,9 +789,7 @@ int r100_irq_process(struct radeon_device *rdev)
+ 			WREG32(RADEON_AIC_CNTL, msi_rearm | RS400_MSI_REARM);
+ 			break;
+ 		default:
+-			msi_rearm = RREG32(RADEON_MSI_REARM_EN) & ~RV370_MSI_REARM_EN;
+-			WREG32(RADEON_MSI_REARM_EN, msi_rearm);
+-			WREG32(RADEON_MSI_REARM_EN, msi_rearm | RV370_MSI_REARM_EN);
++			WREG32(RADEON_MSI_REARM_EN, RV370_MSI_REARM_EN);
+ 			break;
+ 		}
+ 	}
+diff --git a/drivers/gpu/drm/radeon/rs600.c b/drivers/gpu/drm/radeon/rs600.c
+index c259e21..ee898e9 100644
+--- a/drivers/gpu/drm/radeon/rs600.c
++++ b/drivers/gpu/drm/radeon/rs600.c
+@@ -693,9 +693,7 @@ int rs600_irq_process(struct radeon_device *rdev)
+ 			WREG32(RADEON_BUS_CNTL, msi_rearm | RS600_MSI_REARM);
+ 			break;
+ 		default:
+-			msi_rearm = RREG32(RADEON_MSI_REARM_EN) & ~RV370_MSI_REARM_EN;
+-			WREG32(RADEON_MSI_REARM_EN, msi_rearm);
+-			WREG32(RADEON_MSI_REARM_EN, msi_rearm | RV370_MSI_REARM_EN);
++			WREG32(RADEON_MSI_REARM_EN, RV370_MSI_REARM_EN);
+ 			break;
+ 		}
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0005-PCI-workaround-hard-wired-bus-number-V2.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0005-PCI-workaround-hard-wired-bus-number-V2.patch
new file mode 100644
index 0000000..188dc1b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0005-PCI-workaround-hard-wired-bus-number-V2.patch
@@ -0,0 +1,44 @@
+From 608951f12d572bd36c95a5629a9c5bb7b6cf244c Mon Sep 17 00:00:00 2001
+From: Yinghai Lu <yinghai.lu@oracle.com>
+Date: Mon, 30 Jan 2012 12:25:24 +0100
+Subject: [PATCH 05/73] PCI: workaround hard-wired bus number V2
+
+commit 71f6bd4a23130cd2f4b036010c5790b1295290b9 upstream.
+
+Fixes PCI device detection on IBM xSeries IBM 3850 M2 / x3950 M2
+when using ACPI resources (_CRS).
+This is default, a manual workaround (without this patch)
+would be pci=nocrs boot param.
+
+V2: Add dev_warn if the workaround is hit. This should reveal
+how common such setups are (via google) and point to possible
+problems if things are still not working as expected.
+-> Suggested by Jan Beulich.
+
+Tested-by: garyhade@us.ibm.com
+Signed-off-by: Yinghai Lu <yinghai.lu@oracle.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/pci/probe.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
+index 04e74f4..dfee1b3 100644
+--- a/drivers/pci/probe.c
++++ b/drivers/pci/probe.c
+@@ -651,6 +651,11 @@ int __devinit pci_scan_bridge(struct pci_bus *bus, struct pci_dev *dev, int max,
+ 	dev_dbg(&dev->dev, "scanning [bus %02x-%02x] behind bridge, pass %d\n",
+ 		secondary, subordinate, pass);
+ 
++	if (!primary && (primary != bus->number) && secondary && subordinate) {
++		dev_warn(&dev->dev, "Primary bus is hard wired to 0\n");
++		primary = bus->number;
++	}
++
+ 	/* Check if setup is sensible at all */
+ 	if (!pass &&
+ 	    (primary != bus->number || secondary <= bus->number)) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0006-mac80211-Fix-a-rwlock-bad-magic-bug.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0006-mac80211-Fix-a-rwlock-bad-magic-bug.patch
new file mode 100644
index 0000000..71ef771
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0006-mac80211-Fix-a-rwlock-bad-magic-bug.patch
@@ -0,0 +1,91 @@
+From c5ffed9245d22034d5b9d5f910c6217fdb00a469 Mon Sep 17 00:00:00 2001
+From: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Date: Thu, 9 Feb 2012 19:59:43 +0530
+Subject: [PATCH 06/73] mac80211: Fix a rwlock bad magic bug
+
+commit b57e6b560fc2a2742910ac5ca0eb2c46e45aeac2 upstream.
+
+read_lock(&tpt_trig->trig.leddev_list_lock) is accessed via the path
+ieee80211_open (->) ieee80211_do_open (->) ieee80211_mod_tpt_led_trig
+(->) ieee80211_start_tpt_led_trig (->) tpt_trig_timer before initializing
+it.
+the intilization of this read/write lock happens via the path
+ieee80211_led_init (->) led_trigger_register, but we are doing
+'ieee80211_led_init'  after 'ieeee80211_if_add' where we
+register netdev_ops.
+so we access leddev_list_lock before initializing it and causes the
+following bug in chrome laptops with AR928X cards with the following
+script
+
+while true
+do
+sudo modprobe -v ath9k
+sleep 3
+sudo modprobe -r ath9k
+sleep 3
+done
+
+	BUG: rwlock bad magic on CPU#1, wpa_supplicant/358, f5b9eccc
+	Pid: 358, comm: wpa_supplicant Not tainted 3.0.13 #1
+	Call Trace:
+
+	[<8137b9df>] rwlock_bug+0x3d/0x47
+	[<81179830>] do_raw_read_lock+0x19/0x29
+	[<8137f063>] _raw_read_lock+0xd/0xf
+	[<f9081957>] tpt_trig_timer+0xc3/0x145 [mac80211]
+	[<f9081f3a>] ieee80211_mod_tpt_led_trig+0x152/0x174 [mac80211]
+	[<f9076a3f>] ieee80211_do_open+0x11e/0x42e [mac80211]
+	[<f9075390>] ? ieee80211_check_concurrent_iface+0x26/0x13c [mac80211]
+	[<f9076d97>] ieee80211_open+0x48/0x4c [mac80211]
+	[<812dbed8>] __dev_open+0x82/0xab
+	[<812dc0c9>] __dev_change_flags+0x9c/0x113
+	[<812dc1ae>] dev_change_flags+0x18/0x44
+	[<8132144f>] devinet_ioctl+0x243/0x51a
+	[<81321ba9>] inet_ioctl+0x93/0xac
+	[<812cc951>] sock_ioctl+0x1c6/0x1ea
+	[<812cc78b>] ? might_fault+0x20/0x20
+	[<810b1ebb>] do_vfs_ioctl+0x46e/0x4a2
+	[<810a6ebb>] ? fget_light+0x2f/0x70
+	[<812ce549>] ? sys_recvmsg+0x3e/0x48
+	[<810b1f35>] sys_ioctl+0x46/0x69
+	[<8137fa77>] sysenter_do_call+0x12/0x2
+
+Cc: Gary Morain <gmorain@google.com>
+Cc: Paul Stewart <pstew@google.com>
+Cc: Abhijit Pradhan <abhijit@qca.qualcomm.com>
+Cc: Vasanthakumar Thiagarajan <vthiagar@qca.qualcomm.com>
+Cc: Rajkumar Manoharan <rmanohar@qca.qualcomm.com>
+Acked-by: Johannes Berg <johannes.berg@intel.com>
+Tested-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/mac80211/main.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/net/mac80211/main.c b/net/mac80211/main.c
+index a7536fd..7d9b21d 100644
+--- a/net/mac80211/main.c
++++ b/net/mac80211/main.c
+@@ -885,6 +885,8 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
+ 		wiphy_debug(local->hw.wiphy, "Failed to initialize wep: %d\n",
+ 			    result);
+ 
++	ieee80211_led_init(local);
++
+ 	rtnl_lock();
+ 
+ 	result = ieee80211_init_rate_ctrl_alg(local,
+@@ -906,8 +908,6 @@ int ieee80211_register_hw(struct ieee80211_hw *hw)
+ 
+ 	rtnl_unlock();
+ 
+-	ieee80211_led_init(local);
+-
+ 	local->network_latency_notifier.notifier_call =
+ 		ieee80211_max_network_latency;
+ 	result = pm_qos_add_notifier(PM_QOS_NETWORK_LATENCY,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0007-ipheth-Add-iPhone-4S.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0007-ipheth-Add-iPhone-4S.patch
new file mode 100644
index 0000000..18143ec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0007-ipheth-Add-iPhone-4S.patch
@@ -0,0 +1,43 @@
+From 35c224c3c96801e94357ab4ea7158a5557a04c15 Mon Sep 17 00:00:00 2001
+From: Tim Gardner <tim.gardner@canonical.com>
+Date: Wed, 15 Feb 2012 07:50:15 +0000
+Subject: [PATCH 07/73] ipheth: Add iPhone 4S
+
+commit 72ba009b8a159e995e40d3b4e5d7d265acead983 upstream.
+
+BugLink: http://bugs.launchpad.net/bugs/900802
+
+Signed-off-by: Till Kamppeter <till.kamppeter@gmail.com>
+Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/usb/ipheth.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
+index 13c1f04..ad96164 100644
+--- a/drivers/net/usb/ipheth.c
++++ b/drivers/net/usb/ipheth.c
+@@ -60,6 +60,7 @@
+ #define USB_PRODUCT_IPHONE_3GS  0x1294
+ #define USB_PRODUCT_IPHONE_4	0x1297
+ #define USB_PRODUCT_IPHONE_4_VZW 0x129c
++#define USB_PRODUCT_IPHONE_4S	0x12a0
+ 
+ #define IPHETH_USBINTF_CLASS    255
+ #define IPHETH_USBINTF_SUBCLASS 253
+@@ -103,6 +104,10 @@ static struct usb_device_id ipheth_table[] = {
+ 		USB_VENDOR_APPLE, USB_PRODUCT_IPHONE_4_VZW,
+ 		IPHETH_USBINTF_CLASS, IPHETH_USBINTF_SUBCLASS,
+ 		IPHETH_USBINTF_PROTO) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(
++		USB_VENDOR_APPLE, USB_PRODUCT_IPHONE_4S,
++		IPHETH_USBINTF_CLASS, IPHETH_USBINTF_SUBCLASS,
++		IPHETH_USBINTF_PROTO) },
+ 	{ }
+ };
+ MODULE_DEVICE_TABLE(usb, ipheth_table);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0008-regmap-Fix-cache-defaults-initialization-from-raw-ca.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0008-regmap-Fix-cache-defaults-initialization-from-raw-ca.patch
new file mode 100644
index 0000000..d9b07d8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0008-regmap-Fix-cache-defaults-initialization-from-raw-ca.patch
@@ -0,0 +1,53 @@
+From 2a66303d51a096182e881319aef517e4847de32b Mon Sep 17 00:00:00 2001
+From: Lars-Peter Clausen <lars@metafoo.de>
+Date: Wed, 15 Feb 2012 10:23:25 +0100
+Subject: [PATCH 08/73] regmap: Fix cache defaults initialization from raw
+ cache defaults
+
+commit 61cddc57dc14a5dffa0921d9a24fd68edbb374ac upstream.
+
+Currently registers with a value of 0 are ignored when initializing the register
+defaults from raw defaults. This worked in the past, because registers without a
+explicit default were assumed to have a default value of 0. This was changed in
+commit b03622a8 ("regmap: Ensure rbtree syncs registers set to zero properly").
+As a result registers, which have a raw default value of 0 are now assumed to
+have no default. This again can result in unnecessary writes when syncing the
+cache. It will also result in unnecessary reads for e.g. the first update
+operation. In the case where readback is not possible this will even let the
+update operation fail, if the register has not been written to before.
+
+So this patch removes the check. Instead it adds a check to ignore raw defaults
+for registers which are volatile, since those registers are not cached.
+
+Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/base/regmap/regcache.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
+index 666f6f5..64004b0 100644
+--- a/drivers/base/regmap/regcache.c
++++ b/drivers/base/regmap/regcache.c
+@@ -54,7 +54,7 @@ static int regcache_hw_init(struct regmap *map)
+ 	for (count = 0, i = 0; i < map->num_reg_defaults_raw; i++) {
+ 		val = regcache_get_val(map->reg_defaults_raw,
+ 				       i, map->cache_word_size);
+-		if (!val)
++		if (regmap_volatile(map, i))
+ 			continue;
+ 		count++;
+ 	}
+@@ -69,7 +69,7 @@ static int regcache_hw_init(struct regmap *map)
+ 	for (i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
+ 		val = regcache_get_val(map->reg_defaults_raw,
+ 				       i, map->cache_word_size);
+-		if (!val)
++		if (regmap_volatile(map, i))
+ 			continue;
+ 		map->reg_defaults[j].reg = i;
+ 		map->reg_defaults[j].def = val;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0009-eCryptfs-Copy-up-lower-inode-attrs-after-setting-low.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0009-eCryptfs-Copy-up-lower-inode-attrs-after-setting-low.patch
new file mode 100644
index 0000000..fc0e815
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0009-eCryptfs-Copy-up-lower-inode-attrs-after-setting-low.patch
@@ -0,0 +1,43 @@
+From 6b6cd603f9bde174d9cf18060264204587d4a9fb Mon Sep 17 00:00:00 2001
+From: Tyler Hicks <tyhicks@canonical.com>
+Date: Tue, 7 Feb 2012 17:55:40 -0600
+Subject: [PATCH 09/73] eCryptfs: Copy up lower inode attrs after setting
+ lower xattr
+
+commit 545d680938be1e86a6c5250701ce9abaf360c495 upstream.
+
+After passing through a ->setxattr() call, eCryptfs needs to copy the
+inode attributes from the lower inode to the eCryptfs inode, as they
+may have changed in the lower filesystem's ->setxattr() path.
+
+One example is if an extended attribute containing a POSIX Access
+Control List is being set. The new ACL may cause the lower filesystem to
+modify the mode of the lower inode and the eCryptfs inode would need to
+be updated to reflect the new mode.
+
+https://launchpad.net/bugs/926292
+
+Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
+Reported-by: Sebastien Bacher <seb128@ubuntu.com>
+Cc: John Johansen <john.johansen@canonical.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ecryptfs/inode.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/fs/ecryptfs/inode.c b/fs/ecryptfs/inode.c
+index d2039ca..af11098 100644
+--- a/fs/ecryptfs/inode.c
++++ b/fs/ecryptfs/inode.c
+@@ -1104,6 +1104,8 @@ ecryptfs_setxattr(struct dentry *dentry, const char *name, const void *value,
+ 	}
+ 
+ 	rc = vfs_setxattr(lower_dentry, name, value, size, flags);
++	if (!rc)
++		fsstack_copy_attr_all(dentry->d_inode, lower_dentry->d_inode);
+ out:
+ 	return rc;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0010-S390-correct-ktime-to-tod-clock-comparator-conversio.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0010-S390-correct-ktime-to-tod-clock-comparator-conversio.patch
new file mode 100644
index 0000000..080ca0d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0010-S390-correct-ktime-to-tod-clock-comparator-conversio.patch
@@ -0,0 +1,44 @@
+From cadd96ffcc3e4c6db78a08d0ea95fec1ddaecf18 Mon Sep 17 00:00:00 2001
+From: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Date: Fri, 17 Feb 2012 10:29:23 +0100
+Subject: [PATCH 10/73] S390: correct ktime to tod clock comparator conversion
+
+commit cf1eb40f8f5ea12c9e569e7282161fc7f194fd62 upstream.
+
+The conversion of the ktime to a value suitable for the clock comparator
+does not take changes to wall_to_monotonic into account. In fact the
+conversion just needs the boot clock (sched_clock_base_cc) and the
+total_sleep_time.
+
+This is applicable to 3.2+ kernels.
+
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/s390/kernel/time.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
+index ebbfab3..e03c555 100644
+--- a/arch/s390/kernel/time.c
++++ b/arch/s390/kernel/time.c
+@@ -113,11 +113,14 @@ static void fixup_clock_comparator(unsigned long long delta)
+ static int s390_next_ktime(ktime_t expires,
+ 			   struct clock_event_device *evt)
+ {
++	struct timespec ts;
+ 	u64 nsecs;
+ 
+-	nsecs = ktime_to_ns(ktime_sub(expires, ktime_get_monotonic_offset()));
++	ts.tv_sec = ts.tv_nsec = 0;
++	monotonic_to_bootbased(&ts);
++	nsecs = ktime_to_ns(ktime_add(timespec_to_ktime(ts), expires));
+ 	do_div(nsecs, 125);
+-	S390_lowcore.clock_comparator = TOD_UNIX_EPOCH + (nsecs << 9);
++	S390_lowcore.clock_comparator = sched_clock_base_cc + (nsecs << 9);
+ 	set_clock_comparator(S390_lowcore.clock_comparator);
+ 	return 0;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0011-vfs-fix-d_inode_lookup-dentry-ref-leak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0011-vfs-fix-d_inode_lookup-dentry-ref-leak.patch
new file mode 100644
index 0000000..1603235
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0011-vfs-fix-d_inode_lookup-dentry-ref-leak.patch
@@ -0,0 +1,35 @@
+From 3c40e5e0828215d90ab4374405019cd5d170615b Mon Sep 17 00:00:00 2001
+From: Miklos Szeredi <mszeredi@suse.cz>
+Date: Fri, 3 Feb 2012 14:25:18 +0100
+Subject: [PATCH 11/73] vfs: fix d_inode_lookup() dentry ref leak
+
+commit e188dc02d3a9c911be56eca5aa114fe7e9822d53 upstream.
+
+d_inode_lookup() leaks a dentry reference on IS_DEADDIR().
+
+Signed-off-by: Miklos Szeredi <mszeredi@suse.cz>
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/namei.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/fs/namei.c b/fs/namei.c
+index 5008f01..744e942 100644
+--- a/fs/namei.c
++++ b/fs/namei.c
+@@ -1094,8 +1094,10 @@ static struct dentry *d_inode_lookup(struct dentry *parent, struct dentry *dentr
+ 	struct dentry *old;
+ 
+ 	/* Don't create child dentry for a dead directory. */
+-	if (unlikely(IS_DEADDIR(inode)))
++	if (unlikely(IS_DEADDIR(inode))) {
++		dput(dentry);
+ 		return ERR_PTR(-ENOENT);
++	}
+ 
+ 	old = inode->i_op->lookup(inode, dentry, nd);
+ 	if (unlikely(old)) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0012-ARM-7326-2-PL330-fix-null-pointer-dereference-in-pl3.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0012-ARM-7326-2-PL330-fix-null-pointer-dereference-in-pl3.patch
new file mode 100644
index 0000000..74fe49b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0012-ARM-7326-2-PL330-fix-null-pointer-dereference-in-pl3.patch
@@ -0,0 +1,45 @@
+From 32818d15fe50ef5465fc635252ca4c2c1bcf1673 Mon Sep 17 00:00:00 2001
+From: Javi Merino <javi.merino@arm.com>
+Date: Wed, 15 Feb 2012 17:36:39 +0100
+Subject: [PATCH 12/73] ARM: 7326/2: PL330: fix null pointer dereference in
+ pl330_chan_ctrl()
+
+commit 46e33c606af8e0caeeca374103189663d877c0d6 upstream.
+
+This fixes the thrd->req_running field being accessed before thrd
+is checked for null. The error was introduced in
+
+   abb959f: ARM: 7237/1: PL330: Fix driver freeze
+
+Reference: <1326458191-23492-1-git-send-email-mans.rullgard@linaro.org>
+
+Signed-off-by: Mans Rullgard <mans.rullgard@linaro.org>
+Acked-by: Javi Merino <javi.merino@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/common/pl330.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/common/pl330.c b/arch/arm/common/pl330.c
+index 8d8df74..67abef5 100644
+--- a/arch/arm/common/pl330.c
++++ b/arch/arm/common/pl330.c
+@@ -1496,12 +1496,13 @@ int pl330_chan_ctrl(void *ch_id, enum pl330_chan_op op)
+ 	struct pl330_thread *thrd = ch_id;
+ 	struct pl330_dmac *pl330;
+ 	unsigned long flags;
+-	int ret = 0, active = thrd->req_running;
++	int ret = 0, active;
+ 
+ 	if (!thrd || thrd->free || thrd->dmac->state == DYING)
+ 		return -EINVAL;
+ 
+ 	pl330 = thrd->dmac;
++	active = thrd->req_running;
+ 
+ 	spin_lock_irqsave(&pl330->lock, flags);
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0013-ALSA-hda-Fix-redundant-jack-creations-for-cx5051.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0013-ALSA-hda-Fix-redundant-jack-creations-for-cx5051.patch
new file mode 100644
index 0000000..5ffcdc7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0013-ALSA-hda-Fix-redundant-jack-creations-for-cx5051.patch
@@ -0,0 +1,68 @@
+From 2a8e5e8a2df18812c60720fa0534c29c9f1c17b6 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Wed, 22 Feb 2012 17:02:38 +0100
+Subject: [PATCH 13/73] ALSA: hda - Fix redundant jack creations for cx5051
+
+[Note that since the patch isn't applicable (and unnecessary) to
+3.3-rc, there is no corresponding upstream fix.]
+
+The cx5051 parser calls snd_hda_input_jack_add() in the init callback
+to create and initialize the jack detection instances.  Since the init
+callback is called at each time when the device gets woken up after
+suspend or power-saving mode, the duplicated instances are accumulated
+at each call.  This ends up with the kernel warnings with the too
+large array size.
+
+The fix is simply to move the calls of snd_hda_input_jack_add() into
+the parser section instead of the init callback.
+
+The fix is needed only up to 3.2 kernel, since the HD-audio jack layer
+was redesigned in the 3.3 kernel.
+
+Reported-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Tested-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_conexant.c |   11 ++++++++++-
+ 1 files changed, 10 insertions(+), 1 deletions(-)
+
+diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
+index 7072251..08bad5b 100644
+--- a/sound/pci/hda/patch_conexant.c
++++ b/sound/pci/hda/patch_conexant.c
+@@ -1899,6 +1899,10 @@ static void cxt5051_init_mic_port(struct hda_codec *codec, hda_nid_t nid,
+ 	snd_hda_codec_write(codec, nid, 0,
+ 			    AC_VERB_SET_UNSOLICITED_ENABLE,
+ 			    AC_USRSP_EN | event);
++}
++
++static void cxt5051_init_mic_jack(struct hda_codec *codec, hda_nid_t nid)
++{
+ 	snd_hda_input_jack_add(codec, nid, SND_JACK_MICROPHONE, NULL);
+ 	snd_hda_input_jack_report(codec, nid);
+ }
+@@ -1916,7 +1920,6 @@ static int cxt5051_init(struct hda_codec *codec)
+ 	struct conexant_spec *spec = codec->spec;
+ 
+ 	conexant_init(codec);
+-	conexant_init_jacks(codec);
+ 
+ 	if (spec->auto_mic & AUTO_MIC_PORTB)
+ 		cxt5051_init_mic_port(codec, 0x17, CXT5051_PORTB_EVENT);
+@@ -2037,6 +2040,12 @@ static int patch_cxt5051(struct hda_codec *codec)
+ 	if (spec->beep_amp)
+ 		snd_hda_attach_beep_device(codec, spec->beep_amp);
+ 
++	conexant_init_jacks(codec);
++	if (spec->auto_mic & AUTO_MIC_PORTB)
++		cxt5051_init_mic_jack(codec, 0x17);
++	if (spec->auto_mic & AUTO_MIC_PORTC)
++		cxt5051_init_mic_jack(codec, 0x18);
++
+ 	return 0;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0014-mmc-core-check-for-zero-length-ioctl-data.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0014-mmc-core-check-for-zero-length-ioctl-data.patch
new file mode 100644
index 0000000..1e0fdb7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0014-mmc-core-check-for-zero-length-ioctl-data.patch
@@ -0,0 +1,137 @@
+From f3d763847f78da07fb82f6d9e8242875cf6995d3 Mon Sep 17 00:00:00 2001
+From: Johan Rudholm <johan.rudholm@stericsson.com>
+Date: Wed, 23 Nov 2011 09:05:58 +0100
+Subject: [PATCH 14/73] mmc: core: check for zero length ioctl data
+
+commit 4d6144de8ba263eb3691a737c547e5b2fdc45287 upstream.
+
+If the read or write buffer size associated with the command sent
+through the mmc_blk_ioctl is zero, do not prepare data buffer.
+
+This enables a ioctl(2) call to for instance send a MMC_SWITCH to set
+a byte in the ext_csd.
+
+Signed-off-by: Johan Rudholm <johan.rudholm@stericsson.com>
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mmc/card/block.c |   82 +++++++++++++++++++++++++---------------------
+ 1 files changed, 45 insertions(+), 37 deletions(-)
+
+diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
+index 1e0e27c..e15e47d 100644
+--- a/drivers/mmc/card/block.c
++++ b/drivers/mmc/card/block.c
+@@ -266,6 +266,9 @@ static struct mmc_blk_ioc_data *mmc_blk_ioctl_copy_from_user(
+ 		goto idata_err;
+ 	}
+ 
++	if (!idata->buf_bytes)
++		return idata;
++
+ 	idata->buf = kzalloc(idata->buf_bytes, GFP_KERNEL);
+ 	if (!idata->buf) {
+ 		err = -ENOMEM;
+@@ -312,25 +315,6 @@ static int mmc_blk_ioctl_cmd(struct block_device *bdev,
+ 	if (IS_ERR(idata))
+ 		return PTR_ERR(idata);
+ 
+-	cmd.opcode = idata->ic.opcode;
+-	cmd.arg = idata->ic.arg;
+-	cmd.flags = idata->ic.flags;
+-
+-	data.sg = &sg;
+-	data.sg_len = 1;
+-	data.blksz = idata->ic.blksz;
+-	data.blocks = idata->ic.blocks;
+-
+-	sg_init_one(data.sg, idata->buf, idata->buf_bytes);
+-
+-	if (idata->ic.write_flag)
+-		data.flags = MMC_DATA_WRITE;
+-	else
+-		data.flags = MMC_DATA_READ;
+-
+-	mrq.cmd = &cmd;
+-	mrq.data = &data;
+-
+ 	md = mmc_blk_get(bdev->bd_disk);
+ 	if (!md) {
+ 		err = -EINVAL;
+@@ -343,6 +327,48 @@ static int mmc_blk_ioctl_cmd(struct block_device *bdev,
+ 		goto cmd_done;
+ 	}
+ 
++	cmd.opcode = idata->ic.opcode;
++	cmd.arg = idata->ic.arg;
++	cmd.flags = idata->ic.flags;
++
++	if (idata->buf_bytes) {
++		data.sg = &sg;
++		data.sg_len = 1;
++		data.blksz = idata->ic.blksz;
++		data.blocks = idata->ic.blocks;
++
++		sg_init_one(data.sg, idata->buf, idata->buf_bytes);
++
++		if (idata->ic.write_flag)
++			data.flags = MMC_DATA_WRITE;
++		else
++			data.flags = MMC_DATA_READ;
++
++		/* data.flags must already be set before doing this. */
++		mmc_set_data_timeout(&data, card);
++
++		/* Allow overriding the timeout_ns for empirical tuning. */
++		if (idata->ic.data_timeout_ns)
++			data.timeout_ns = idata->ic.data_timeout_ns;
++
++		if ((cmd.flags & MMC_RSP_R1B) == MMC_RSP_R1B) {
++			/*
++			 * Pretend this is a data transfer and rely on the
++			 * host driver to compute timeout.  When all host
++			 * drivers support cmd.cmd_timeout for R1B, this
++			 * can be changed to:
++			 *
++			 *     mrq.data = NULL;
++			 *     cmd.cmd_timeout = idata->ic.cmd_timeout_ms;
++			 */
++			data.timeout_ns = idata->ic.cmd_timeout_ms * 1000000;
++		}
++
++		mrq.data = &data;
++	}
++
++	mrq.cmd = &cmd;
++
+ 	mmc_claim_host(card->host);
+ 
+ 	if (idata->ic.is_acmd) {
+@@ -351,24 +377,6 @@ static int mmc_blk_ioctl_cmd(struct block_device *bdev,
+ 			goto cmd_rel_host;
+ 	}
+ 
+-	/* data.flags must already be set before doing this. */
+-	mmc_set_data_timeout(&data, card);
+-	/* Allow overriding the timeout_ns for empirical tuning. */
+-	if (idata->ic.data_timeout_ns)
+-		data.timeout_ns = idata->ic.data_timeout_ns;
+-
+-	if ((cmd.flags & MMC_RSP_R1B) == MMC_RSP_R1B) {
+-		/*
+-		 * Pretend this is a data transfer and rely on the host driver
+-		 * to compute timeout.  When all host drivers support
+-		 * cmd.cmd_timeout for R1B, this can be changed to:
+-		 *
+-		 *     mrq.data = NULL;
+-		 *     cmd.cmd_timeout = idata->ic.cmd_timeout_ms;
+-		 */
+-		data.timeout_ns = idata->ic.cmd_timeout_ms * 1000000;
+-	}
+-
+ 	mmc_wait_for_req(card->host, &mrq);
+ 
+ 	if (cmd.error) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0015-NFSv4-Fix-an-Oops-in-the-NFSv4-getacl-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0015-NFSv4-Fix-an-Oops-in-the-NFSv4-getacl-code.patch
new file mode 100644
index 0000000..e205000
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0015-NFSv4-Fix-an-Oops-in-the-NFSv4-getacl-code.patch
@@ -0,0 +1,98 @@
+From 4a818b4288d5a897b0e928dd0cd1e1e29501159f Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Fri, 3 Feb 2012 18:30:53 -0500
+Subject: [PATCH 15/73] NFSv4: Fix an Oops in the NFSv4 getacl code
+
+commit 331818f1c468a24e581aedcbe52af799366a9dfe upstream.
+
+Commit bf118a342f10dafe44b14451a1392c3254629a1f (NFSv4: include bitmap
+in nfsv4 get acl data) introduces the 'acl_scratch' page for the case
+where we may need to decode multi-page data. However it fails to take
+into account the fact that the variable may be NULL (for the case where
+we're not doing multi-page decode), and it also attaches it to the
+encoding xdr_stream rather than the decoding one.
+
+The immediate result is an Oops in nfs4_xdr_enc_getacl due to the
+call to page_address() with a NULL page pointer.
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Cc: Andy Adamson <andros@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4proc.c       |    8 ++++----
+ fs/nfs/nfs4xdr.c        |    5 ++++-
+ include/linux/nfs_xdr.h |    2 +-
+ 3 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index 055d702..2ee398a 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -3568,8 +3568,8 @@ static ssize_t __nfs4_get_acl_uncached(struct inode *inode, void *buf, size_t bu
+ 	}
+ 	if (npages > 1) {
+ 		/* for decoding across pages */
+-		args.acl_scratch = alloc_page(GFP_KERNEL);
+-		if (!args.acl_scratch)
++		res.acl_scratch = alloc_page(GFP_KERNEL);
++		if (!res.acl_scratch)
+ 			goto out_free;
+ 	}
+ 	args.acl_len = npages * PAGE_SIZE;
+@@ -3605,8 +3605,8 @@ out_free:
+ 	for (i = 0; i < npages; i++)
+ 		if (pages[i])
+ 			__free_page(pages[i]);
+-	if (args.acl_scratch)
+-		__free_page(args.acl_scratch);
++	if (res.acl_scratch)
++		__free_page(res.acl_scratch);
+ 	return ret;
+ }
+ 
+diff --git a/fs/nfs/nfs4xdr.c b/fs/nfs/nfs4xdr.c
+index dcaf693..68adab4 100644
+--- a/fs/nfs/nfs4xdr.c
++++ b/fs/nfs/nfs4xdr.c
+@@ -2522,7 +2522,6 @@ static void nfs4_xdr_enc_getacl(struct rpc_rqst *req, struct xdr_stream *xdr,
+ 
+ 	xdr_inline_pages(&req->rq_rcv_buf, replen << 2,
+ 		args->acl_pages, args->acl_pgbase, args->acl_len);
+-	xdr_set_scratch_buffer(xdr, page_address(args->acl_scratch), PAGE_SIZE);
+ 
+ 	encode_nops(&hdr);
+ }
+@@ -6034,6 +6033,10 @@ nfs4_xdr_dec_getacl(struct rpc_rqst *rqstp, struct xdr_stream *xdr,
+ 	struct compound_hdr hdr;
+ 	int status;
+ 
++	if (res->acl_scratch != NULL) {
++		void *p = page_address(res->acl_scratch);
++		xdr_set_scratch_buffer(xdr, p, PAGE_SIZE);
++	}
+ 	status = decode_compound_hdr(xdr, &hdr);
+ 	if (status)
+ 		goto out;
+diff --git a/include/linux/nfs_xdr.h b/include/linux/nfs_xdr.h
+index 6c898af..41116ab 100644
+--- a/include/linux/nfs_xdr.h
++++ b/include/linux/nfs_xdr.h
+@@ -602,7 +602,6 @@ struct nfs_getaclargs {
+ 	size_t				acl_len;
+ 	unsigned int			acl_pgbase;
+ 	struct page **			acl_pages;
+-	struct page *			acl_scratch;
+ 	struct nfs4_sequence_args 	seq_args;
+ };
+ 
+@@ -612,6 +611,7 @@ struct nfs_getaclres {
+ 	size_t				acl_len;
+ 	size_t				acl_data_offset;
+ 	int				acl_flags;
++	struct page *			acl_scratch;
+ 	struct nfs4_sequence_res	seq_res;
+ };
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0016-NFSv4-Ensure-we-throw-out-bad-delegation-stateids-on.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0016-NFSv4-Ensure-we-throw-out-bad-delegation-stateids-on.patch
new file mode 100644
index 0000000..a40f910
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0016-NFSv4-Ensure-we-throw-out-bad-delegation-stateids-on.patch
@@ -0,0 +1,33 @@
+From 0cea513e395f2a2d4dd650eeae8a1c08a7425296 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Thu, 9 Feb 2012 15:31:36 -0500
+Subject: [PATCH 16/73] NFSv4: Ensure we throw out bad delegation stateids on
+ NFS4ERR_BAD_STATEID
+
+commit b9f9a03150969e4bd9967c20bce67c4de769058f upstream.
+
+To ensure that we don't just reuse the bad delegation when we attempt to
+recover the nfs4_state that received the bad stateid error.
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4state.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/fs/nfs/nfs4state.c b/fs/nfs/nfs4state.c
+index 6a7107a..a58eed7 100644
+--- a/fs/nfs/nfs4state.c
++++ b/fs/nfs/nfs4state.c
+@@ -1071,6 +1071,8 @@ void nfs4_schedule_stateid_recovery(const struct nfs_server *server, struct nfs4
+ {
+ 	struct nfs_client *clp = server->nfs_client;
+ 
++	if (test_and_clear_bit(NFS_DELEGATED_STATE, &state->flags))
++		nfs_async_inode_return_delegation(state->inode, &state->stateid);
+ 	nfs4_state_mark_reclaim_nograce(clp, state);
+ 	nfs4_schedule_state_manager(clp);
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0017-NFSv4-fix-server_scope-memory-leak.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0017-NFSv4-fix-server_scope-memory-leak.patch
new file mode 100644
index 0000000..7edf14c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0017-NFSv4-fix-server_scope-memory-leak.patch
@@ -0,0 +1,55 @@
+From 8ed3fe820fe9cf267d39d86cb76e4064cdf82da3 Mon Sep 17 00:00:00 2001
+From: Weston Andros Adamson <dros@netapp.com>
+Date: Thu, 16 Feb 2012 11:17:05 -0500
+Subject: [PATCH 17/73] NFSv4: fix server_scope memory leak
+
+commit abe9a6d57b4544ac208401f9c0a4262814db2be4 upstream.
+
+server_scope would never be freed if nfs4_check_cl_exchange_flags() returned
+non-zero
+
+Signed-off-by: Weston Andros Adamson <dros@netapp.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nfs/nfs4proc.c |   15 +++++++++------
+ 1 files changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/fs/nfs/nfs4proc.c b/fs/nfs/nfs4proc.c
+index 2ee398a..e527030 100644
+--- a/fs/nfs/nfs4proc.c
++++ b/fs/nfs/nfs4proc.c
+@@ -4876,8 +4876,10 @@ int nfs4_proc_exchange_id(struct nfs_client *clp, struct rpc_cred *cred)
+ 				clp->cl_rpcclient->cl_auth->au_flavor);
+ 
+ 	res.server_scope = kzalloc(sizeof(struct server_scope), GFP_KERNEL);
+-	if (unlikely(!res.server_scope))
+-		return -ENOMEM;
++	if (unlikely(!res.server_scope)) {
++		status = -ENOMEM;
++		goto out;
++	}
+ 
+ 	status = rpc_call_sync(clp->cl_rpcclient, &msg, RPC_TASK_TIMEOUT);
+ 	if (!status)
+@@ -4894,12 +4896,13 @@ int nfs4_proc_exchange_id(struct nfs_client *clp, struct rpc_cred *cred)
+ 			clp->server_scope = NULL;
+ 		}
+ 
+-		if (!clp->server_scope)
++		if (!clp->server_scope) {
+ 			clp->server_scope = res.server_scope;
+-		else
+-			kfree(res.server_scope);
++			goto out;
++		}
+ 	}
+-
++	kfree(res.server_scope);
++out:
+ 	dprintk("<-- %s status= %d\n", __func__, status);
+ 	return status;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0018-ARM-7321-1-cache-v7-Disable-preemption-when-reading-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0018-ARM-7321-1-cache-v7-Disable-preemption-when-reading-.patch
new file mode 100644
index 0000000..e8d52aa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0018-ARM-7321-1-cache-v7-Disable-preemption-when-reading-.patch
@@ -0,0 +1,61 @@
+From 1bbe8912e024ae0502c208159364de706ad5d999 Mon Sep 17 00:00:00 2001
+From: Stephen Boyd <sboyd@codeaurora.org>
+Date: Tue, 7 Feb 2012 19:42:07 +0100
+Subject: [PATCH 18/73] ARM: 7321/1: cache-v7: Disable preemption when reading
+ CCSIDR
+
+commit b46c0f74657d1fe1c1b0c1452631cc38a9e6987f upstream.
+
+armv7's flush_cache_all() flushes caches via set/way. To
+determine the cache attributes (line size, number of sets,
+etc.) the assembly first writes the CSSELR register to select a
+cache level and then reads the CCSIDR register. The CSSELR register
+is banked per-cpu and is used to determine which cache level CCSIDR
+reads. If the task is migrated between when the CSSELR is written and
+the CCSIDR is read the CCSIDR value may be for an unexpected cache
+level (for example L1 instead of L2) and incorrect cache flushing
+could occur.
+
+Disable interrupts across the write and read so that the correct
+cache attributes are read and used for the cache flushing
+routine. We disable interrupts instead of disabling preemption
+because the critical section is only 3 instructions and we want
+to call v7_dcache_flush_all from __v7_setup which doesn't have a
+full kernel stack with a struct thread_info.
+
+This fixes a problem we see in scm_call() when flush_cache_all()
+is called from preemptible context and sometimes the L2 cache is
+not properly flushed out.
+
+Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
+Acked-by: Catalin Marinas <catalin.marinas@arm.com>
+Reviewed-by: Nicolas Pitre <nico@linaro.org>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mm/cache-v7.S |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
+index 07c4bc8..7a24d39 100644
+--- a/arch/arm/mm/cache-v7.S
++++ b/arch/arm/mm/cache-v7.S
+@@ -54,9 +54,15 @@ loop1:
+ 	and	r1, r1, #7			@ mask of the bits for current cache only
+ 	cmp	r1, #2				@ see what cache we have at this level
+ 	blt	skip				@ skip if no cache, or just i-cache
++#ifdef CONFIG_PREEMPT
++	save_and_disable_irqs r9		@ make cssr&csidr read atomic
++#endif
+ 	mcr	p15, 2, r10, c0, c0, 0		@ select current cache level in cssr
+ 	isb					@ isb to sych the new cssr&csidr
+ 	mrc	p15, 1, r1, c0, c0, 0		@ read the new csidr
++#ifdef CONFIG_PREEMPT
++	restore_irqs_notrace r9
++#endif
+ 	and	r2, r1, #7			@ extract the length of the cache lines
+ 	add	r2, r2, #4			@ add 4 (line length offset)
+ 	ldr	r4, =0x3ff
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0019-ARM-7325-1-fix-v7-boot-with-lockdep-enabled.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0019-ARM-7325-1-fix-v7-boot-with-lockdep-enabled.patch
new file mode 100644
index 0000000..8e5b0fb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0019-ARM-7325-1-fix-v7-boot-with-lockdep-enabled.patch
@@ -0,0 +1,61 @@
+From ceb484992b356b7f9b499cf56b8ba8da8289aa74 Mon Sep 17 00:00:00 2001
+From: Rabin Vincent <rabin@rab.in>
+Date: Wed, 15 Feb 2012 16:01:42 +0100
+Subject: [PATCH 19/73] ARM: 7325/1: fix v7 boot with lockdep enabled
+
+commit 8e43a905dd574f54c5715d978318290ceafbe275 upstream.
+
+Bootup with lockdep enabled has been broken on v7 since b46c0f74657d
+("ARM: 7321/1: cache-v7: Disable preemption when reading CCSIDR").
+
+This is because v7_setup (which is called very early during boot) calls
+v7_flush_dcache_all, and the save_and_disable_irqs added by that patch
+ends up attempting to call into lockdep C code (trace_hardirqs_off())
+when we are in no position to execute it (no stack, MMU off).
+
+Fix this by using a notrace variant of save_and_disable_irqs.  The code
+already uses the notrace variant of restore_irqs.
+
+Reviewed-by: Nicolas Pitre <nico@linaro.org>
+Acked-by: Stephen Boyd <sboyd@codeaurora.org>
+Cc: Catalin Marinas <catalin.marinas@arm.com>
+Signed-off-by: Rabin Vincent <rabin@rab.in>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/include/asm/assembler.h |    5 +++++
+ arch/arm/mm/cache-v7.S           |    2 +-
+ 2 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/include/asm/assembler.h b/arch/arm/include/asm/assembler.h
+index 29035e8..7bb8bf9 100644
+--- a/arch/arm/include/asm/assembler.h
++++ b/arch/arm/include/asm/assembler.h
+@@ -137,6 +137,11 @@
+ 	disable_irq
+ 	.endm
+ 
++	.macro	save_and_disable_irqs_notrace, oldcpsr
++	mrs	\oldcpsr, cpsr
++	disable_irq_notrace
++	.endm
++
+ /*
+  * Restore interrupt state previously stored in a register.  We don't
+  * guarantee that this will preserve the flags.
+diff --git a/arch/arm/mm/cache-v7.S b/arch/arm/mm/cache-v7.S
+index 7a24d39..a655d3d 100644
+--- a/arch/arm/mm/cache-v7.S
++++ b/arch/arm/mm/cache-v7.S
+@@ -55,7 +55,7 @@ loop1:
+ 	cmp	r1, #2				@ see what cache we have at this level
+ 	blt	skip				@ skip if no cache, or just i-cache
+ #ifdef CONFIG_PREEMPT
+-	save_and_disable_irqs r9		@ make cssr&csidr read atomic
++	save_and_disable_irqs_notrace r9	@ make cssr&csidr read atomic
+ #endif
+ 	mcr	p15, 2, r10, c0, c0, 0		@ select current cache level in cssr
+ 	isb					@ isb to sych the new cssr&csidr
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0020-3c59x-shorten-timer-period-for-slave-devices.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0020-3c59x-shorten-timer-period-for-slave-devices.patch
new file mode 100644
index 0000000..57ee5c2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0020-3c59x-shorten-timer-period-for-slave-devices.patch
@@ -0,0 +1,42 @@
+From 96dd4ee6793dd443256eda40dd38fa3e84a02c89 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Tue, 14 Feb 2012 10:27:09 +0000
+Subject: [PATCH 20/73] 3c59x: shorten timer period for slave devices
+
+[ Upstream commit 3013dc0cceb9baaf25d5624034eeaa259bf99004 ]
+
+Jean Delvare reported bonding on top of 3c59x adapters was not detecting
+network cable removal fast enough.
+
+3c59x indeed uses a 60 seconds timer to check link status if carrier is
+on, and 5 seconds if carrier is off.
+
+This patch reduces timer period to 5 seconds if device is a bonding
+slave.
+
+Reported-by: Jean Delvare <jdelvare@suse.de>
+Acked-by: Jean Delvare <jdelvare@suse.de>
+Acked-by: Steffen Klassert <steffen.klassert@secunet.com>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/3com/3c59x.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/ethernet/3com/3c59x.c b/drivers/net/ethernet/3com/3c59x.c
+index b42c06b..e0c5529 100644
+--- a/drivers/net/ethernet/3com/3c59x.c
++++ b/drivers/net/ethernet/3com/3c59x.c
+@@ -1842,7 +1842,7 @@ vortex_timer(unsigned long data)
+ 		ok = 1;
+ 	}
+ 
+-	if (!netif_carrier_ok(dev))
++	if (dev->flags & IFF_SLAVE || !netif_carrier_ok(dev))
+ 		next_tick = 5*HZ;
+ 
+ 	if (vp->medialock)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0021-net-Don-t-proxy-arp-respond-if-iif-rt-dst.dev-if-pri.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0021-net-Don-t-proxy-arp-respond-if-iif-rt-dst.dev-if-pri.patch
new file mode 100644
index 0000000..d8f0bd3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0021-net-Don-t-proxy-arp-respond-if-iif-rt-dst.dev-if-pri.patch
@@ -0,0 +1,43 @@
+From 1b22d2ddf4f62bc4f600f9b4c5d9d6ad65dcca14 Mon Sep 17 00:00:00 2001
+From: Thomas Graf <tgraf@suug.ch>
+Date: Fri, 10 Feb 2012 04:07:11 +0000
+Subject: [PATCH 21/73] net: Don't proxy arp respond if iif == rt->dst.dev if
+ private VLAN is disabled
+
+[ Upstream commit 70620c46ac2b45c24b0f22002fdf5ddd1f7daf81 ]
+
+Commit 653241 (net: RFC3069, private VLAN proxy arp support) changed
+the behavior of arp proxy to send arp replies back out on the interface
+the request came in even if the private VLAN feature is disabled.
+
+Previously we checked rt->dst.dev != skb->dev for in scenarios, when
+proxy arp is enabled on for the netdevice and also when individual proxy
+neighbour entries have been added.
+
+This patch adds the check back for the pneigh_lookup() scenario.
+
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+Acked-by: Jesper Dangaard Brouer <hawk@comx.dk>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/arp.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/net/ipv4/arp.c b/net/ipv4/arp.c
+index 96a164a..59a7041 100644
+--- a/net/ipv4/arp.c
++++ b/net/ipv4/arp.c
+@@ -867,7 +867,8 @@ static int arp_process(struct sk_buff *skb)
+ 			if (addr_type == RTN_UNICAST  &&
+ 			    (arp_fwd_proxy(in_dev, dev, rt) ||
+ 			     arp_fwd_pvlan(in_dev, dev, rt, sip, tip) ||
+-			     pneigh_lookup(&arp_tbl, net, &tip, dev, 0))) {
++			     (rt->dst.dev != dev &&
++			      pneigh_lookup(&arp_tbl, net, &tip, dev, 0)))) {
+ 				n = neigh_event_ns(&arp_tbl, sha, &sip, dev);
+ 				if (n)
+ 					neigh_release(n);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0022-netpoll-netpoll_poll_dev-should-access-dev-flags.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0022-netpoll-netpoll_poll_dev-should-access-dev-flags.patch
new file mode 100644
index 0000000..e0047b4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0022-netpoll-netpoll_poll_dev-should-access-dev-flags.patch
@@ -0,0 +1,35 @@
+From 39994fb222e62650dc945af466f15f0696f9db7b Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Tue, 14 Feb 2012 10:11:59 +0000
+Subject: [PATCH 22/73] netpoll: netpoll_poll_dev() should access dev->flags
+
+[ Upstream commit 58e05f357a039a94aa36475f8c110256f693a239 ]
+
+commit 5a698af53f (bond: service netpoll arp queue on master device)
+tested IFF_SLAVE flag against dev->priv_flags instead of dev->flags
+
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Cc: WANG Cong <amwang@redhat.com>
+Acked-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/core/netpoll.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/net/core/netpoll.c b/net/core/netpoll.c
+index 5d4d896..ab0633f 100644
+--- a/net/core/netpoll.c
++++ b/net/core/netpoll.c
+@@ -194,7 +194,7 @@ static void netpoll_poll_dev(struct net_device *dev)
+ 
+ 	poll_napi(dev);
+ 
+-	if (dev->priv_flags & IFF_SLAVE) {
++	if (dev->flags & IFF_SLAVE) {
+ 		if (dev->npinfo) {
+ 			struct net_device *bond_dev = dev->master;
+ 			struct sk_buff *skb;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0023-net_sched-Bug-in-netem-reordering.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0023-net_sched-Bug-in-netem-reordering.patch
new file mode 100644
index 0000000..93a991d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0023-net_sched-Bug-in-netem-reordering.patch
@@ -0,0 +1,42 @@
+From a1845875b3f78fa493087da218c90d09b0294271 Mon Sep 17 00:00:00 2001
+From: Hagen Paul Pfeifer <hagen@jauu.net>
+Date: Wed, 4 Jan 2012 17:35:26 +0000
+Subject: [PATCH 23/73] net_sched: Bug in netem reordering
+
+[ Upstream commit eb10192447370f19a215a8c2749332afa1199d46 ]
+
+Not now, but it looks you are correct. q->qdisc is NULL until another
+additional qdisc is attached (beside tfifo). See 50612537e9ab2969312.
+The following patch should work.
+
+From: Hagen Paul Pfeifer <hagen@jauu.net>
+
+netem: catch NULL pointer by updating the real qdisc statistic
+
+Reported-by: Vijay Subramanian <subramanian.vijay@gmail.com>
+Signed-off-by: Hagen Paul Pfeifer <hagen@jauu.net>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/sched/sch_netem.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
+index a4ab207..fd34012 100644
+--- a/net/sched/sch_netem.c
++++ b/net/sched/sch_netem.c
+@@ -383,8 +383,8 @@ static int netem_enqueue(struct sk_buff *skb, struct Qdisc *sch)
+ 		q->counter = 0;
+ 
+ 		__skb_queue_head(&q->qdisc->q, skb);
+-		q->qdisc->qstats.backlog += qdisc_pkt_len(skb);
+-		q->qdisc->qstats.requeues++;
++		sch->qstats.backlog += qdisc_pkt_len(skb);
++		sch->qstats.requeues++;
+ 		ret = NET_XMIT_SUCCESS;
+ 	}
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0024-veth-Enforce-minimum-size-of-VETH_INFO_PEER.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0024-veth-Enforce-minimum-size-of-VETH_INFO_PEER.patch
new file mode 100644
index 0000000..dbab8e6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0024-veth-Enforce-minimum-size-of-VETH_INFO_PEER.patch
@@ -0,0 +1,37 @@
+From b21abc775d2095a517f74f6df989569e3131e9c7 Mon Sep 17 00:00:00 2001
+From: Hagen Paul Pfeifer <hagen@jauu.net>
+Date: Wed, 15 Feb 2012 04:09:46 +0000
+Subject: [PATCH 24/73] veth: Enforce minimum size of VETH_INFO_PEER
+
+[ Upstream commit 237114384ab22c174ec4641e809f8e6cbcfce774 ]
+
+VETH_INFO_PEER carries struct ifinfomsg plus optional IFLA
+attributes. A minimal size of sizeof(struct ifinfomsg) must be
+enforced or we may risk accessing that struct beyond the limits
+of the netlink message.
+
+Signed-off-by: Thomas Graf <tgraf@suug.ch>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/veth.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/veth.c b/drivers/net/veth.c
+index ef883e9..b907398 100644
+--- a/drivers/net/veth.c
++++ b/drivers/net/veth.c
+@@ -423,7 +423,9 @@ static void veth_dellink(struct net_device *dev, struct list_head *head)
+ 	unregister_netdevice_queue(peer, head);
+ }
+ 
+-static const struct nla_policy veth_policy[VETH_INFO_MAX + 1];
++static const struct nla_policy veth_policy[VETH_INFO_MAX + 1] = {
++	[VETH_INFO_PEER]	= { .len = sizeof(struct ifinfomsg) },
++};
+ 
+ static struct rtnl_link_ops veth_link_ops = {
+ 	.kind		= DRV_NAME,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0025-via-velocity-S3-resume-fix.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0025-via-velocity-S3-resume-fix.patch
new file mode 100644
index 0000000..d486aaf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0025-via-velocity-S3-resume-fix.patch
@@ -0,0 +1,37 @@
+From d14d408060c6a2d35c115f8bbded2faa41d21de7 Mon Sep 17 00:00:00 2001
+From: David Lv <DavidLv@viatech.com.cn>
+Date: Sat, 4 Feb 2012 23:22:26 +0000
+Subject: [PATCH 25/73] via-velocity: S3 resume fix.
+
+[ Upstream commit b530b1930bbd9d005345133f0ff0c556d2a52b19 ]
+
+Initially diagnosed on Ubuntu 11.04 with kernel 2.6.38.
+
+velocity_close is not called during a suspend / resume cycle in this
+driver and it has no business playing directly with power states.
+
+Signed-off-by: David Lv <DavidLv@viatech.com.cn>
+Acked-by: Francois Romieu <romieu@fr.zoreil.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/via/via-velocity.c |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
+index 4535d7c..e015a57 100644
+--- a/drivers/net/ethernet/via/via-velocity.c
++++ b/drivers/net/ethernet/via/via-velocity.c
+@@ -2489,9 +2489,6 @@ static int velocity_close(struct net_device *dev)
+ 	if (dev->irq != 0)
+ 		free_irq(dev->irq, dev);
+ 
+-	/* Power down the chip */
+-	pci_set_power_state(vptr->pdev, PCI_D3hot);
+-
+ 	velocity_free_rings(vptr);
+ 
+ 	vptr->flags &= (~VELOCITY_FLAGS_OPENED);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0026-ipv4-reset-flowi-parameters-on-route-connect.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0026-ipv4-reset-flowi-parameters-on-route-connect.patch
new file mode 100644
index 0000000..9d57676
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0026-ipv4-reset-flowi-parameters-on-route-connect.patch
@@ -0,0 +1,90 @@
+From f4df037cf3ca933c941a0f87a9c9ec542c88031c Mon Sep 17 00:00:00 2001
+From: Julian Anastasov <ja@ssi.bg>
+Date: Sat, 4 Feb 2012 13:04:46 +0000
+Subject: [PATCH 26/73] ipv4: reset flowi parameters on route connect
+
+[ Upstream commit e6b45241c57a83197e5de9166b3b0d32ac562609 ]
+
+Eric Dumazet found that commit 813b3b5db83
+(ipv4: Use caller's on-stack flowi as-is in output
+route lookups.) that comes in 3.0 added a regression.
+The problem appears to be that resulting flowi4_oif is
+used incorrectly as input parameter to some routing lookups.
+The result is that when connecting to local port without
+listener if the IP address that is used is not on a loopback
+interface we incorrectly assign RTN_UNICAST to the output
+route because no route is matched by oif=lo. The RST packet
+can not be sent immediately by tcp_v4_send_reset because
+it expects RTN_LOCAL.
+
+	So, change ip_route_connect and ip_route_newports to
+update the flowi4 fields that are input parameters because
+we do not want unnecessary binding to oif.
+
+	To make it clear what are the input parameters that
+can be modified during lookup and to show which fields of
+floiw4 are reused add a new function to update the flowi4
+structure: flowi4_update_output.
+
+Thanks to Yurij M. Plotnikov for providing a bug report including a
+program to reproduce the problem.
+
+Thanks to Eric Dumazet for tracking the problem down to
+tcp_v4_send_reset and providing initial fix.
+
+Reported-by: Yurij M. Plotnikov <Yurij.Plotnikov@oktetlabs.ru>
+Signed-off-by: Julian Anastasov <ja@ssi.bg>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/net/flow.h  |   10 ++++++++++
+ include/net/route.h |    4 ++++
+ 2 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/include/net/flow.h b/include/net/flow.h
+index 57f15a7..2a7eefd 100644
+--- a/include/net/flow.h
++++ b/include/net/flow.h
+@@ -90,6 +90,16 @@ static inline void flowi4_init_output(struct flowi4 *fl4, int oif,
+ 	fl4->fl4_dport = dport;
+ 	fl4->fl4_sport = sport;
+ }
++
++/* Reset some input parameters after previous lookup */
++static inline void flowi4_update_output(struct flowi4 *fl4, int oif, __u8 tos,
++					__be32 daddr, __be32 saddr)
++{
++	fl4->flowi4_oif = oif;
++	fl4->flowi4_tos = tos;
++	fl4->daddr = daddr;
++	fl4->saddr = saddr;
++}
+ 				      
+ 
+ struct flowi6 {
+diff --git a/include/net/route.h b/include/net/route.h
+index 91855d1..b1c0d5b 100644
+--- a/include/net/route.h
++++ b/include/net/route.h
+@@ -270,6 +270,7 @@ static inline struct rtable *ip_route_connect(struct flowi4 *fl4,
+ 		if (IS_ERR(rt))
+ 			return rt;
+ 		ip_rt_put(rt);
++		flowi4_update_output(fl4, oif, tos, fl4->daddr, fl4->saddr);
+ 	}
+ 	security_sk_classify_flow(sk, flowi4_to_flowi(fl4));
+ 	return ip_route_output_flow(net, fl4, sk);
+@@ -284,6 +285,9 @@ static inline struct rtable *ip_route_newports(struct flowi4 *fl4, struct rtable
+ 		fl4->fl4_dport = dport;
+ 		fl4->fl4_sport = sport;
+ 		ip_rt_put(rt);
++		flowi4_update_output(fl4, sk->sk_bound_dev_if,
++				     RT_CONN_FLAGS(sk), fl4->daddr,
++				     fl4->saddr);
+ 		security_sk_classify_flow(sk, flowi4_to_flowi(fl4));
+ 		return ip_route_output_flow(sock_net(sk), fl4, sk);
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0027-tcp_v4_send_reset-binding-oif-to-iif-in-no-sock-case.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0027-tcp_v4_send_reset-binding-oif-to-iif-in-no-sock-case.patch
new file mode 100644
index 0000000..52ef35e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0027-tcp_v4_send_reset-binding-oif-to-iif-in-no-sock-case.patch
@@ -0,0 +1,47 @@
+From 017d762758b89e117b10c21a8490b16e93cf487b Mon Sep 17 00:00:00 2001
+From: Shawn Lu <shawn.lu@ericsson.com>
+Date: Sat, 4 Feb 2012 12:38:09 +0000
+Subject: [PATCH 27/73] tcp_v4_send_reset: binding oif to iif in no sock case
+
+[ Upstream commit e2446eaab5585555a38ea0df4e01ff313dbb4ac9 ]
+
+Binding RST packet outgoing interface to incoming interface
+for tcp v4 when there is no socket associate with it.
+when sk is not NULL, using sk->sk_bound_dev_if instead.
+(suggested by Eric Dumazet).
+
+This has few benefits:
+1. tcp_v6_send_reset already did that.
+2. This helps tcp connect with SO_BINDTODEVICE set. When
+connection is lost, we still able to sending out RST using
+same interface.
+3. we are sending reply, it is most likely to be succeed
+if iif is used
+
+Signed-off-by: Shawn Lu <shawn.lu@ericsson.com>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_ipv4.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
+index c89e354..eb90aa8 100644
+--- a/net/ipv4/tcp_ipv4.c
++++ b/net/ipv4/tcp_ipv4.c
+@@ -650,6 +650,11 @@ static void tcp_v4_send_reset(struct sock *sk, struct sk_buff *skb)
+ 				      arg.iov[0].iov_len, IPPROTO_TCP, 0);
+ 	arg.csumoffset = offsetof(struct tcphdr, check) / 2;
+ 	arg.flags = (sk && inet_sk(sk)->transparent) ? IP_REPLY_ARG_NOSRCCHECK : 0;
++	/* When socket is gone, all binding information is lost.
++	 * routing might fail in this case. using iif for oif to
++	 * make sure we can deliver it
++	 */
++	arg.bound_dev_if = sk ? sk->sk_bound_dev_if : inet_iif(skb);
+ 
+ 	net = dev_net(skb_dst(skb)->dev);
+ 	arg.tos = ip_hdr(skb)->tos;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0028-ipv4-Fix-wrong-order-of-ip_rt_get_source-and-update-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0028-ipv4-Fix-wrong-order-of-ip_rt_get_source-and-update-.patch
new file mode 100644
index 0000000..a9e0a6a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0028-ipv4-Fix-wrong-order-of-ip_rt_get_source-and-update-.patch
@@ -0,0 +1,38 @@
+From 763fe579c154a7bcff5f40788b3b32ada3a1f8db Mon Sep 17 00:00:00 2001
+From: Li Wei <lw@cn.fujitsu.com>
+Date: Thu, 9 Feb 2012 21:15:25 +0000
+Subject: [PATCH 28/73] ipv4: Fix wrong order of ip_rt_get_source() and update
+ iph->daddr.
+
+[ Upstream commit 5dc7883f2a7c25f8df40d7479687153558cd531b ]
+
+This patch fix a bug which introduced by commit ac8a4810 (ipv4: Save
+nexthop address of LSRR/SSRR option to IPCB.).In that patch, we saved
+the nexthop of SRR in ip_option->nexthop and update iph->daddr until
+we get to ip_forward_options(), but we need to update it before
+ip_rt_get_source(), otherwise we may get a wrong src.
+
+Signed-off-by: Li Wei <lw@cn.fujitsu.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/ip_options.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/net/ipv4/ip_options.c b/net/ipv4/ip_options.c
+index 1e60f76..42dd1a9 100644
+--- a/net/ipv4/ip_options.c
++++ b/net/ipv4/ip_options.c
+@@ -573,8 +573,8 @@ void ip_forward_options(struct sk_buff *skb)
+ 		}
+ 		if (srrptr + 3 <= srrspace) {
+ 			opt->is_changed = 1;
+-			ip_rt_get_source(&optptr[srrptr-1], skb, rt);
+ 			ip_hdr(skb)->daddr = opt->nexthop;
++			ip_rt_get_source(&optptr[srrptr-1], skb, rt);
+ 			optptr[2] = srrptr+4;
+ 		} else if (net_ratelimit())
+ 			printk(KERN_CRIT "ip_forward(): Argh! Destination lost!\n");
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0029-net-Make-qdisc_skb_cb-upper-size-bound-explicit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0029-net-Make-qdisc_skb_cb-upper-size-bound-explicit.patch
new file mode 100644
index 0000000..651c2a0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0029-net-Make-qdisc_skb_cb-upper-size-bound-explicit.patch
@@ -0,0 +1,90 @@
+From 79246cb05913bd4262514210136d087c1beb6d3b Mon Sep 17 00:00:00 2001
+From: "David S. Miller" <davem@davemloft.net>
+Date: Mon, 6 Feb 2012 15:14:37 -0500
+Subject: [PATCH 29/73] net: Make qdisc_skb_cb upper size bound explicit.
+
+[ Upstream commit 16bda13d90c8d5da243e2cfa1677e62ecce26860 ]
+
+Just like skb->cb[], so that qdisc_skb_cb can be encapsulated inside
+of other data structures.
+
+This is intended to be used by IPoIB so that it can remember
+addressing information stored at hard_header_ops->create() time that
+it can fetch when the packet gets to the transmit routine.
+
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/net/sch_generic.h |    9 ++++++++-
+ net/sched/sch_choke.c     |    3 +--
+ net/sched/sch_netem.c     |    3 +--
+ net/sched/sch_sfb.c       |    3 +--
+ 4 files changed, 11 insertions(+), 7 deletions(-)
+
+diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
+index f6bb08b..55ce96b 100644
+--- a/include/net/sch_generic.h
++++ b/include/net/sch_generic.h
+@@ -220,9 +220,16 @@ struct tcf_proto {
+ 
+ struct qdisc_skb_cb {
+ 	unsigned int		pkt_len;
+-	long			data[];
++	unsigned char		data[24];
+ };
+ 
++static inline void qdisc_cb_private_validate(const struct sk_buff *skb, int sz)
++{
++	struct qdisc_skb_cb *qcb;
++	BUILD_BUG_ON(sizeof(skb->cb) < sizeof(unsigned int) + sz);
++	BUILD_BUG_ON(sizeof(qcb->data) < sz);
++}
++
+ static inline int qdisc_qlen(const struct Qdisc *q)
+ {
+ 	return q->q.qlen;
+diff --git a/net/sched/sch_choke.c b/net/sched/sch_choke.c
+index 3422b25..081ffb9 100644
+--- a/net/sched/sch_choke.c
++++ b/net/sched/sch_choke.c
+@@ -225,8 +225,7 @@ struct choke_skb_cb {
+ 
+ static inline struct choke_skb_cb *choke_skb_cb(const struct sk_buff *skb)
+ {
+-	BUILD_BUG_ON(sizeof(skb->cb) <
+-		sizeof(struct qdisc_skb_cb) + sizeof(struct choke_skb_cb));
++	qdisc_cb_private_validate(skb, sizeof(struct choke_skb_cb));
+ 	return (struct choke_skb_cb *)qdisc_skb_cb(skb)->data;
+ }
+ 
+diff --git a/net/sched/sch_netem.c b/net/sched/sch_netem.c
+index fd34012..7801b15 100644
+--- a/net/sched/sch_netem.c
++++ b/net/sched/sch_netem.c
+@@ -118,8 +118,7 @@ struct netem_skb_cb {
+ 
+ static inline struct netem_skb_cb *netem_skb_cb(struct sk_buff *skb)
+ {
+-	BUILD_BUG_ON(sizeof(skb->cb) <
+-		sizeof(struct qdisc_skb_cb) + sizeof(struct netem_skb_cb));
++	qdisc_cb_private_validate(skb, sizeof(struct netem_skb_cb));
+ 	return (struct netem_skb_cb *)qdisc_skb_cb(skb)->data;
+ }
+ 
+diff --git a/net/sched/sch_sfb.c b/net/sched/sch_sfb.c
+index e83c272..17859ea 100644
+--- a/net/sched/sch_sfb.c
++++ b/net/sched/sch_sfb.c
+@@ -93,8 +93,7 @@ struct sfb_skb_cb {
+ 
+ static inline struct sfb_skb_cb *sfb_skb_cb(const struct sk_buff *skb)
+ {
+-	BUILD_BUG_ON(sizeof(skb->cb) <
+-		sizeof(struct qdisc_skb_cb) + sizeof(struct sfb_skb_cb));
++	qdisc_cb_private_validate(skb, sizeof(struct sfb_skb_cb));
+ 	return (struct sfb_skb_cb *)qdisc_skb_cb(skb)->data;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0030-IPoIB-Stop-lying-about-hard_header_len-and-use-skb-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0030-IPoIB-Stop-lying-about-hard_header_len-and-use-skb-c.patch
new file mode 100644
index 0000000..8e88101
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0030-IPoIB-Stop-lying-about-hard_header_len-and-use-skb-c.patch
@@ -0,0 +1,213 @@
+From afd87adacb5de00768b2e54f0bd851278f2e6179 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Tue, 7 Feb 2012 14:51:21 +0000
+Subject: [PATCH 30/73] IPoIB: Stop lying about hard_header_len and use
+ skb->cb to stash LL addresses
+
+[ Upstream commit 936d7de3d736e0737542641269436f4b5968e9ef ]
+
+Commit a0417fa3a18a ("net: Make qdisc_skb_cb upper size bound
+explicit.") made it possible for a netdev driver to use skb->cb
+between its header_ops.create method and its .ndo_start_xmit
+method.  Use this in ipoib_hard_header() to stash away the LL address
+(GID + QPN), instead of the "ipoib_pseudoheader" hack.  This allows
+IPoIB to stop lying about its hard_header_len, which will let us fix
+the L2 check for GRO.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/infiniband/ulp/ipoib/ipoib.h           |    6 ++-
+ drivers/infiniband/ulp/ipoib/ipoib_main.c      |   55 ++++++++---------------
+ drivers/infiniband/ulp/ipoib/ipoib_multicast.c |    9 +---
+ 3 files changed, 24 insertions(+), 46 deletions(-)
+
+diff --git a/drivers/infiniband/ulp/ipoib/ipoib.h b/drivers/infiniband/ulp/ipoib/ipoib.h
+index b3cc1e0..86df632 100644
+--- a/drivers/infiniband/ulp/ipoib/ipoib.h
++++ b/drivers/infiniband/ulp/ipoib/ipoib.h
+@@ -44,6 +44,7 @@
+ #include <linux/mutex.h>
+ 
+ #include <net/neighbour.h>
++#include <net/sch_generic.h>
+ 
+ #include <linux/atomic.h>
+ 
+@@ -117,8 +118,9 @@ struct ipoib_header {
+ 	u16	reserved;
+ };
+ 
+-struct ipoib_pseudoheader {
+-	u8  hwaddr[INFINIBAND_ALEN];
++struct ipoib_cb {
++	struct qdisc_skb_cb	qdisc_cb;
++	u8			hwaddr[INFINIBAND_ALEN];
+ };
+ 
+ /* Used for all multicast joins (broadcast, IPv4 mcast and IPv6 mcast) */
+diff --git a/drivers/infiniband/ulp/ipoib/ipoib_main.c b/drivers/infiniband/ulp/ipoib/ipoib_main.c
+index 83695b4..fe2fdbb 100644
+--- a/drivers/infiniband/ulp/ipoib/ipoib_main.c
++++ b/drivers/infiniband/ulp/ipoib/ipoib_main.c
+@@ -658,7 +658,7 @@ static void ipoib_path_lookup(struct sk_buff *skb, struct net_device *dev)
+ }
+ 
+ static void unicast_arp_send(struct sk_buff *skb, struct net_device *dev,
+-			     struct ipoib_pseudoheader *phdr)
++			     struct ipoib_cb *cb)
+ {
+ 	struct ipoib_dev_priv *priv = netdev_priv(dev);
+ 	struct ipoib_path *path;
+@@ -666,17 +666,15 @@ static void unicast_arp_send(struct sk_buff *skb, struct net_device *dev,
+ 
+ 	spin_lock_irqsave(&priv->lock, flags);
+ 
+-	path = __path_find(dev, phdr->hwaddr + 4);
++	path = __path_find(dev, cb->hwaddr + 4);
+ 	if (!path || !path->valid) {
+ 		int new_path = 0;
+ 
+ 		if (!path) {
+-			path = path_rec_create(dev, phdr->hwaddr + 4);
++			path = path_rec_create(dev, cb->hwaddr + 4);
+ 			new_path = 1;
+ 		}
+ 		if (path) {
+-			/* put pseudoheader back on for next time */
+-			skb_push(skb, sizeof *phdr);
+ 			__skb_queue_tail(&path->queue, skb);
+ 
+ 			if (!path->query && path_rec_start(dev, path)) {
+@@ -700,12 +698,10 @@ static void unicast_arp_send(struct sk_buff *skb, struct net_device *dev,
+ 			  be16_to_cpu(path->pathrec.dlid));
+ 
+ 		spin_unlock_irqrestore(&priv->lock, flags);
+-		ipoib_send(dev, skb, path->ah, IPOIB_QPN(phdr->hwaddr));
++		ipoib_send(dev, skb, path->ah, IPOIB_QPN(cb->hwaddr));
+ 		return;
+ 	} else if ((path->query || !path_rec_start(dev, path)) &&
+ 		   skb_queue_len(&path->queue) < IPOIB_MAX_PATH_REC_QUEUE) {
+-		/* put pseudoheader back on for next time */
+-		skb_push(skb, sizeof *phdr);
+ 		__skb_queue_tail(&path->queue, skb);
+ 	} else {
+ 		++dev->stats.tx_dropped;
+@@ -774,16 +770,14 @@ static int ipoib_start_xmit(struct sk_buff *skb, struct net_device *dev)
+ 			dev_kfree_skb_any(skb);
+ 		}
+ 	} else {
+-		struct ipoib_pseudoheader *phdr =
+-			(struct ipoib_pseudoheader *) skb->data;
+-		skb_pull(skb, sizeof *phdr);
++		struct ipoib_cb *cb = (struct ipoib_cb *) skb->cb;
+ 
+-		if (phdr->hwaddr[4] == 0xff) {
++		if (cb->hwaddr[4] == 0xff) {
+ 			/* Add in the P_Key for multicast*/
+-			phdr->hwaddr[8] = (priv->pkey >> 8) & 0xff;
+-			phdr->hwaddr[9] = priv->pkey & 0xff;
++			cb->hwaddr[8] = (priv->pkey >> 8) & 0xff;
++			cb->hwaddr[9] = priv->pkey & 0xff;
+ 
+-			ipoib_mcast_send(dev, phdr->hwaddr + 4, skb);
++			ipoib_mcast_send(dev, cb->hwaddr + 4, skb);
+ 		} else {
+ 			/* unicast GID -- should be ARP or RARP reply */
+ 
+@@ -792,14 +786,14 @@ static int ipoib_start_xmit(struct sk_buff *skb, struct net_device *dev)
+ 				ipoib_warn(priv, "Unicast, no %s: type %04x, QPN %06x %pI6\n",
+ 					   skb_dst(skb) ? "neigh" : "dst",
+ 					   be16_to_cpup((__be16 *) skb->data),
+-					   IPOIB_QPN(phdr->hwaddr),
+-					   phdr->hwaddr + 4);
++					   IPOIB_QPN(cb->hwaddr),
++					   cb->hwaddr + 4);
+ 				dev_kfree_skb_any(skb);
+ 				++dev->stats.tx_dropped;
+ 				goto unlock;
+ 			}
+ 
+-			unicast_arp_send(skb, dev, phdr);
++			unicast_arp_send(skb, dev, cb);
+ 		}
+ 	}
+ unlock:
+@@ -825,8 +819,6 @@ static int ipoib_hard_header(struct sk_buff *skb,
+ 			     const void *daddr, const void *saddr, unsigned len)
+ {
+ 	struct ipoib_header *header;
+-	struct dst_entry *dst;
+-	struct neighbour *n;
+ 
+ 	header = (struct ipoib_header *) skb_push(skb, sizeof *header);
+ 
+@@ -834,18 +826,13 @@ static int ipoib_hard_header(struct sk_buff *skb,
+ 	header->reserved = 0;
+ 
+ 	/*
+-	 * If we don't have a neighbour structure, stuff the
+-	 * destination address onto the front of the skb so we can
+-	 * figure out where to send the packet later.
++	 * If we don't have a dst_entry structure, stuff the
++	 * destination address into skb->cb so we can figure out where
++	 * to send the packet later.
+ 	 */
+-	dst = skb_dst(skb);
+-	n = NULL;
+-	if (dst)
+-		n = dst_get_neighbour_raw(dst);
+-	if ((!dst || !n) && daddr) {
+-		struct ipoib_pseudoheader *phdr =
+-			(struct ipoib_pseudoheader *) skb_push(skb, sizeof *phdr);
+-		memcpy(phdr->hwaddr, daddr, INFINIBAND_ALEN);
++	if (!skb_dst(skb)) {
++		struct ipoib_cb *cb = (struct ipoib_cb *) skb->cb;
++		memcpy(cb->hwaddr, daddr, INFINIBAND_ALEN);
+ 	}
+ 
+ 	return 0;
+@@ -1021,11 +1008,7 @@ static void ipoib_setup(struct net_device *dev)
+ 
+ 	dev->flags		|= IFF_BROADCAST | IFF_MULTICAST;
+ 
+-	/*
+-	 * We add in INFINIBAND_ALEN to allow for the destination
+-	 * address "pseudoheader" for skbs without neighbour struct.
+-	 */
+-	dev->hard_header_len	 = IPOIB_ENCAP_LEN + INFINIBAND_ALEN;
++	dev->hard_header_len	 = IPOIB_ENCAP_LEN;
+ 	dev->addr_len		 = INFINIBAND_ALEN;
+ 	dev->type		 = ARPHRD_INFINIBAND;
+ 	dev->tx_queue_len	 = ipoib_sendq_size * 2;
+diff --git a/drivers/infiniband/ulp/ipoib/ipoib_multicast.c b/drivers/infiniband/ulp/ipoib/ipoib_multicast.c
+index 873bff9..e5069b4 100644
+--- a/drivers/infiniband/ulp/ipoib/ipoib_multicast.c
++++ b/drivers/infiniband/ulp/ipoib/ipoib_multicast.c
+@@ -262,21 +262,14 @@ static int ipoib_mcast_join_finish(struct ipoib_mcast *mcast,
+ 	netif_tx_lock_bh(dev);
+ 	while (!skb_queue_empty(&mcast->pkt_queue)) {
+ 		struct sk_buff *skb = skb_dequeue(&mcast->pkt_queue);
+-		struct dst_entry *dst = skb_dst(skb);
+-		struct neighbour *n = NULL;
+ 
+ 		netif_tx_unlock_bh(dev);
+ 
+ 		skb->dev = dev;
+-		if (dst)
+-			n = dst_get_neighbour_raw(dst);
+-		if (!dst || !n) {
+-			/* put pseudoheader back on for next time */
+-			skb_push(skb, sizeof (struct ipoib_pseudoheader));
+-		}
+ 
+ 		if (dev_queue_xmit(skb))
+ 			ipoib_warn(priv, "dev_queue_xmit failed to requeue packet\n");
++
+ 		netif_tx_lock_bh(dev);
+ 	}
+ 	netif_tx_unlock_bh(dev);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0031-gro-more-generic-L2-header-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0031-gro-more-generic-L2-header-check.patch
new file mode 100644
index 0000000..7314b14
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0031-gro-more-generic-L2-header-check.patch
@@ -0,0 +1,61 @@
+From 156f251f74fc547065adc2aef8955f70f3237a71 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Wed, 8 Feb 2012 08:51:50 +0000
+Subject: [PATCH 31/73] gro: more generic L2 header check
+
+[ Upstream commit 5ca3b72c5da47d95b83857b768def6172fbc080a ]
+
+Shlomo Pongratz reported GRO L2 header check was suited for Ethernet
+only, and failed on IB/ipoib traffic.
+
+He provided a patch faking a zeroed header to let GRO aggregates frames.
+
+Roland Dreier, Herbert Xu, and others suggested we change GRO L2 header
+check to be more generic, ie not assuming L2 header is 14 bytes, but
+taking into account hard_header_len.
+
+__napi_gro_receive() has special handling for the common case (Ethernet)
+to avoid a memcmp() call and use an inline optimized function instead.
+
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Reported-by: Shlomo Pongratz <shlomop@mellanox.com>
+Cc: Roland Dreier <roland@kernel.org>
+Cc: Or Gerlitz <ogerlitz@mellanox.com>
+Cc: Herbert Xu <herbert@gondor.apana.org.au>
+Tested-by: Sean Hefty <sean.hefty@intel.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/core/dev.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/net/core/dev.c b/net/core/dev.c
+index 5a13edf..c56cacf 100644
+--- a/net/core/dev.c
++++ b/net/core/dev.c
+@@ -3565,14 +3565,20 @@ static inline gro_result_t
+ __napi_gro_receive(struct napi_struct *napi, struct sk_buff *skb)
+ {
+ 	struct sk_buff *p;
++	unsigned int maclen = skb->dev->hard_header_len;
+ 
+ 	for (p = napi->gro_list; p; p = p->next) {
+ 		unsigned long diffs;
+ 
+ 		diffs = (unsigned long)p->dev ^ (unsigned long)skb->dev;
+ 		diffs |= p->vlan_tci ^ skb->vlan_tci;
+-		diffs |= compare_ether_header(skb_mac_header(p),
+-					      skb_gro_mac_header(skb));
++		if (maclen == ETH_HLEN)
++			diffs |= compare_ether_header(skb_mac_header(p),
++						      skb_gro_mac_header(skb));
++		else if (!diffs)
++			diffs = memcmp(skb_mac_header(p),
++				       skb_gro_mac_header(skb),
++				       maclen);
+ 		NAPI_GRO_CB(p)->same_flow = !diffs;
+ 		NAPI_GRO_CB(p)->flush = 0;
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0032-tcp-allow-tcp_sacktag_one-to-tag-ranges-not-aligned-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0032-tcp-allow-tcp_sacktag_one-to-tag-ranges-not-aligned-.patch
new file mode 100644
index 0000000..5e48952
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0032-tcp-allow-tcp_sacktag_one-to-tag-ranges-not-aligned-.patch
@@ -0,0 +1,119 @@
+From aaa9bcd96008a3d7879c3a679625c7ff61b6360b Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Sun, 12 Feb 2012 18:37:09 +0000
+Subject: [PATCH 32/73] tcp: allow tcp_sacktag_one() to tag ranges not aligned
+ with skbs
+
+[ Upstream commit cc9a672ee522d4805495b98680f4a3db5d0a0af9 ]
+
+This commit allows callers of tcp_sacktag_one() to pass in sequence
+ranges that do not align with skb boundaries, as tcp_shifted_skb()
+needs to do in an upcoming fix in this patch series.
+
+In fact, now tcp_sacktag_one() does not need to depend on an input skb
+at all, which makes its semantics and dependencies more clear.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_input.c |   36 ++++++++++++++++++++++--------------
+ 1 files changed, 22 insertions(+), 14 deletions(-)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 52b5c2d..41440f1 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -1310,25 +1310,26 @@ static int tcp_match_skb_to_sack(struct sock *sk, struct sk_buff *skb,
+ 	return in_sack;
+ }
+ 
+-static u8 tcp_sacktag_one(const struct sk_buff *skb, struct sock *sk,
+-			  struct tcp_sacktag_state *state,
++/* Mark the given newly-SACKed range as such, adjusting counters and hints. */
++static u8 tcp_sacktag_one(struct sock *sk,
++			  struct tcp_sacktag_state *state, u8 sacked,
++			  u32 start_seq, u32 end_seq,
+ 			  int dup_sack, int pcount)
+ {
+ 	struct tcp_sock *tp = tcp_sk(sk);
+-	u8 sacked = TCP_SKB_CB(skb)->sacked;
+ 	int fack_count = state->fack_count;
+ 
+ 	/* Account D-SACK for retransmitted packet. */
+ 	if (dup_sack && (sacked & TCPCB_RETRANS)) {
+ 		if (tp->undo_marker && tp->undo_retrans &&
+-		    after(TCP_SKB_CB(skb)->end_seq, tp->undo_marker))
++		    after(end_seq, tp->undo_marker))
+ 			tp->undo_retrans--;
+ 		if (sacked & TCPCB_SACKED_ACKED)
+ 			state->reord = min(fack_count, state->reord);
+ 	}
+ 
+ 	/* Nothing to do; acked frame is about to be dropped (was ACKed). */
+-	if (!after(TCP_SKB_CB(skb)->end_seq, tp->snd_una))
++	if (!after(end_seq, tp->snd_una))
+ 		return sacked;
+ 
+ 	if (!(sacked & TCPCB_SACKED_ACKED)) {
+@@ -1347,13 +1348,13 @@ static u8 tcp_sacktag_one(const struct sk_buff *skb, struct sock *sk,
+ 				/* New sack for not retransmitted frame,
+ 				 * which was in hole. It is reordering.
+ 				 */
+-				if (before(TCP_SKB_CB(skb)->seq,
++				if (before(start_seq,
+ 					   tcp_highest_sack_seq(tp)))
+ 					state->reord = min(fack_count,
+ 							   state->reord);
+ 
+ 				/* SACK enhanced F-RTO (RFC4138; Appendix B) */
+-				if (!after(TCP_SKB_CB(skb)->end_seq, tp->frto_highmark))
++				if (!after(end_seq, tp->frto_highmark))
+ 					state->flag |= FLAG_ONLY_ORIG_SACKED;
+ 			}
+ 
+@@ -1371,8 +1372,7 @@ static u8 tcp_sacktag_one(const struct sk_buff *skb, struct sock *sk,
+ 
+ 		/* Lost marker hint past SACKed? Tweak RFC3517 cnt */
+ 		if (!tcp_is_fack(tp) && (tp->lost_skb_hint != NULL) &&
+-		    before(TCP_SKB_CB(skb)->seq,
+-			   TCP_SKB_CB(tp->lost_skb_hint)->seq))
++		    before(start_seq, TCP_SKB_CB(tp->lost_skb_hint)->seq))
+ 			tp->lost_cnt_hint += pcount;
+ 
+ 		if (fack_count > tp->fackets_out)
+@@ -1428,7 +1428,11 @@ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ 	}
+ 
+ 	/* We discard results */
+-	tcp_sacktag_one(skb, sk, state, dup_sack, pcount);
++	tcp_sacktag_one(sk, state,
++			TCP_SKB_CB(skb)->sacked,
++			TCP_SKB_CB(skb)->seq,
++			TCP_SKB_CB(skb)->end_seq,
++			dup_sack, pcount);
+ 
+ 	/* Difference in this won't matter, both ACKed by the same cumul. ACK */
+ 	TCP_SKB_CB(prev)->sacked |= (TCP_SKB_CB(skb)->sacked & TCPCB_EVER_RETRANS);
+@@ -1667,10 +1671,14 @@ static struct sk_buff *tcp_sacktag_walk(struct sk_buff *skb, struct sock *sk,
+ 			break;
+ 
+ 		if (in_sack) {
+-			TCP_SKB_CB(skb)->sacked = tcp_sacktag_one(skb, sk,
+-								  state,
+-								  dup_sack,
+-								  tcp_skb_pcount(skb));
++			TCP_SKB_CB(skb)->sacked =
++				tcp_sacktag_one(sk,
++						state,
++						TCP_SKB_CB(skb)->sacked,
++						TCP_SKB_CB(skb)->seq,
++						TCP_SKB_CB(skb)->end_seq,
++						dup_sack,
++						tcp_skb_pcount(skb));
+ 
+ 			if (!before(TCP_SKB_CB(skb)->seq,
+ 				    tcp_highest_sack_seq(tp)))
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0033-tcp-fix-range-tcp_shifted_skb-passes-to-tcp_sacktag_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0033-tcp-fix-range-tcp_shifted_skb-passes-to-tcp_sacktag_.patch
new file mode 100644
index 0000000..8793f22
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0033-tcp-fix-range-tcp_shifted_skb-passes-to-tcp_sacktag_.patch
@@ -0,0 +1,77 @@
+From 85a90ef604578b9825d3b7e9d1e3a103357bb668 Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Sun, 12 Feb 2012 18:37:10 +0000
+Subject: [PATCH 33/73] tcp: fix range tcp_shifted_skb() passes to
+ tcp_sacktag_one()
+
+[ Upstream commit daef52bab1fd26e24e8e9578f8fb33ba1d0cb412 ]
+
+Fix the newly-SACKed range to be the range of newly-shifted bytes.
+
+Previously - since 832d11c5cd076abc0aa1eaf7be96c81d1a59ce41 -
+tcp_shifted_skb() incorrectly called tcp_sacktag_one() with the start
+and end sequence numbers of the skb it passes in set to the range just
+beyond the range that is newly-SACKed.
+
+This commit also removes a special-case adjustment to lost_cnt_hint in
+tcp_shifted_skb() since the pre-existing adjustment of lost_cnt_hint
+in tcp_sacktag_one() now properly handles this things now that the
+correct start sequence number is passed in.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_input.c |   19 ++++++++++---------
+ 1 files changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 41440f1..b16fbf3 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -1391,6 +1391,9 @@ static u8 tcp_sacktag_one(struct sock *sk,
+ 	return sacked;
+ }
+ 
++/* Shift newly-SACKed bytes from this skb to the immediately previous
++ * already-SACKed sk_buff. Mark the newly-SACKed bytes as such.
++ */
+ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ 			   struct tcp_sacktag_state *state,
+ 			   unsigned int pcount, int shifted, int mss,
+@@ -1398,12 +1401,11 @@ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ {
+ 	struct tcp_sock *tp = tcp_sk(sk);
+ 	struct sk_buff *prev = tcp_write_queue_prev(sk, skb);
++	u32 start_seq = TCP_SKB_CB(skb)->seq;	/* start of newly-SACKed */
++	u32 end_seq = start_seq + shifted;	/* end of newly-SACKed */
+ 
+ 	BUG_ON(!pcount);
+ 
+-	if (skb == tp->lost_skb_hint)
+-		tp->lost_cnt_hint += pcount;
+-
+ 	TCP_SKB_CB(prev)->end_seq += shifted;
+ 	TCP_SKB_CB(skb)->seq += shifted;
+ 
+@@ -1427,12 +1429,11 @@ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ 		skb_shinfo(skb)->gso_type = 0;
+ 	}
+ 
+-	/* We discard results */
+-	tcp_sacktag_one(sk, state,
+-			TCP_SKB_CB(skb)->sacked,
+-			TCP_SKB_CB(skb)->seq,
+-			TCP_SKB_CB(skb)->end_seq,
+-			dup_sack, pcount);
++	/* Adjust counters and hints for the newly sacked sequence range but
++	 * discard the return value since prev is already marked.
++	 */
++	tcp_sacktag_one(sk, state, TCP_SKB_CB(skb)->sacked,
++			start_seq, end_seq, dup_sack, pcount);
+ 
+ 	/* Difference in this won't matter, both ACKed by the same cumul. ACK */
+ 	TCP_SKB_CB(prev)->sacked |= (TCP_SKB_CB(skb)->sacked & TCPCB_EVER_RETRANS);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0034-tcp-fix-tcp_shifted_skb-adjustment-of-lost_cnt_hint-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0034-tcp-fix-tcp_shifted_skb-adjustment-of-lost_cnt_hint-.patch
new file mode 100644
index 0000000..12a891c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0034-tcp-fix-tcp_shifted_skb-adjustment-of-lost_cnt_hint-.patch
@@ -0,0 +1,42 @@
+From c90fa02e73e931f959428385077213180f5c69eb Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Mon, 13 Feb 2012 20:22:08 +0000
+Subject: [PATCH 34/73] tcp: fix tcp_shifted_skb() adjustment of lost_cnt_hint
+ for FACK
+
+[ Upstream commit 0af2a0d0576205dda778d25c6c344fc6508fc81d ]
+
+This commit ensures that lost_cnt_hint is correctly updated in
+tcp_shifted_skb() for FACK TCP senders. The lost_cnt_hint adjustment
+in tcp_sacktag_one() only applies to non-FACK senders, so FACK senders
+need their own adjustment.
+
+This applies the spirit of 1e5289e121372a3494402b1b131b41bfe1cf9b7f -
+except now that the sequence range passed into tcp_sacktag_one() is
+correct we need only have a special case adjustment for FACK.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_input.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index b16fbf3..53113b9 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -1406,6 +1406,10 @@ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ 
+ 	BUG_ON(!pcount);
+ 
++	/* Adjust hint for FACK. Non-FACK is handled in tcp_sacktag_one(). */
++	if (tcp_is_fack(tp) && (skb == tp->lost_skb_hint))
++		tp->lost_cnt_hint += pcount;
++
+ 	TCP_SKB_CB(prev)->end_seq += shifted;
+ 	TCP_SKB_CB(skb)->seq += shifted;
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0035-USB-Added-Kamstrup-VID-PIDs-to-cp210x-serial-driver.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0035-USB-Added-Kamstrup-VID-PIDs-to-cp210x-serial-driver.patch
new file mode 100644
index 0000000..30e69cf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0035-USB-Added-Kamstrup-VID-PIDs-to-cp210x-serial-driver.patch
@@ -0,0 +1,29 @@
+From 4a2448683921f6bb770e934ff6ab78a6e2dc78cf Mon Sep 17 00:00:00 2001
+From: Bruno Thomsen <bruno.thomsen@gmail.com>
+Date: Tue, 21 Feb 2012 23:41:37 +0100
+Subject: [PATCH 35/73] USB: Added Kamstrup VID/PIDs to cp210x serial driver.
+
+commit c6c1e4491dc8d1ed2509fa6aacffa7f34614fc38 upstream.
+
+Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/cp210x.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/serial/cp210x.c b/drivers/usb/serial/cp210x.c
+index a515237..33d25d4 100644
+--- a/drivers/usb/serial/cp210x.c
++++ b/drivers/usb/serial/cp210x.c
+@@ -136,6 +136,8 @@ static const struct usb_device_id id_table[] = {
+ 	{ USB_DEVICE(0x16DC, 0x0011) }, /* W-IE-NE-R Plein & Baus GmbH RCM Remote Control for MARATON Power Supply */
+ 	{ USB_DEVICE(0x16DC, 0x0012) }, /* W-IE-NE-R Plein & Baus GmbH MPOD Multi Channel Power Supply */
+ 	{ USB_DEVICE(0x16DC, 0x0015) }, /* W-IE-NE-R Plein & Baus GmbH CML Control, Monitoring and Data Logger */
++	{ USB_DEVICE(0x17A8, 0x0001) }, /* Kamstrup Optical Eye/3-wire */
++	{ USB_DEVICE(0x17A8, 0x0005) }, /* Kamstrup M-Bus Master MultiPort 250D */
+ 	{ USB_DEVICE(0x17F4, 0xAAAA) }, /* Wavesense Jazz blood glucose meter */
+ 	{ USB_DEVICE(0x1843, 0x0200) }, /* Vaisala USB Instrument Cable */
+ 	{ USB_DEVICE(0x18EF, 0xE00F) }, /* ELV USB-I2C-Interface */
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0036-USB-option-cleanup-zte-3g-dongle-s-pid-in-option.c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0036-USB-option-cleanup-zte-3g-dongle-s-pid-in-option.c.patch
new file mode 100644
index 0000000..3c3862b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0036-USB-option-cleanup-zte-3g-dongle-s-pid-in-option.c.patch
@@ -0,0 +1,246 @@
+From 4cc383ba35be70d24fb7d43dd67f15f6ec3c7ebc Mon Sep 17 00:00:00 2001
+From: Rui li <li.rui27@zte.com.cn>
+Date: Tue, 14 Feb 2012 10:35:01 +0800
+Subject: [PATCH 36/73] USB: option: cleanup zte 3g-dongle's pid in option.c
+
+commit b9e44fe5ecda4158c22bc1ea4bffa378a4f83f65 upstream.
+
+  1. Remove all old mass-storage ids's pid:
+     0x0026,0x0053,0x0098,0x0099,0x0149,0x0150,0x0160;
+  2. As the pid from 0x1401 to 0x1510 which have not surely assigned to
+     use for serial-port or mass-storage port,so i think it should be
+     removed now, and will re-add after it have assigned in future;
+  3. sort the pid to WCDMA and CDMA.
+
+Signed-off-by: Rui li <li.rui27@zte.com.cn>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |  143 ++++---------------------------------------
+ 1 files changed, 13 insertions(+), 130 deletions(-)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 338d082..68fa8c7 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -788,7 +788,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0012, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf1_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0013, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0014, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_MF628, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0016, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0017, 0xff, 0xff, 0xff),
+@@ -803,7 +802,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0024, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0025, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf1_blacklist },
+-	/* { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0026, 0xff, 0xff, 0xff) }, */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0028, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0029, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0030, 0xff, 0xff, 0xff) },
+@@ -828,7 +826,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0051, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0052, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+-	/* { USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0053, 0xff, 0xff, 0xff) }, */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0054, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0055, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf1_blacklist },
+@@ -836,7 +833,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0057, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0058, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0059, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0061, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0062, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0063, 0xff, 0xff, 0xff),
+@@ -846,7 +842,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0066, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0067, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0069, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0070, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0076, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0077, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0078, 0xff, 0xff, 0xff) },
+@@ -865,8 +860,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0095, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0096, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0097, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0098, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0099, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0104, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0105, 0xff, 0xff, 0xff) },
+@@ -887,28 +880,18 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0143, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0144, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0145, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0146, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0147, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0148, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0149, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0150, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0151, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0152, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0153, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0155, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0156, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0157, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0158, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0159, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0160, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0161, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0162, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0164, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0165, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0168, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0170, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0176, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0178, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1012, 0xff, 0xff, 0xff) },
+@@ -1083,127 +1066,27 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1298, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1299, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1300, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1401, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1402, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1403, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1404, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1405, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1406, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1407, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1408, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1409, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1410, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1411, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1412, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1413, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1414, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1415, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1416, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1417, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1418, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1419, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1420, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1421, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1422, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1423, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1424, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1425, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1426, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1427, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1429, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1430, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1431, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1432, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1433, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1434, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1435, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1436, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1437, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1438, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1439, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1440, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1441, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1442, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1443, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1444, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1445, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1446, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1447, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1448, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1449, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1450, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1451, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1452, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1453, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1454, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1455, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1456, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1457, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1458, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1459, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1460, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1461, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1462, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1463, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1464, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1465, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1466, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1467, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1468, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1469, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1470, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1471, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1472, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1473, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1474, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1475, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1476, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1477, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1478, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1479, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1480, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1481, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1482, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1483, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1484, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1485, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1486, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1487, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1488, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1489, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1490, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1491, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1492, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1493, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1494, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1495, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1496, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1497, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1498, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1499, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1500, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1501, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1502, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1503, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1504, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1505, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1506, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1507, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1508, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1509, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1510, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2002, 0xff,
++	  0xff, 0xff), .driver_info = (kernel_ulong_t)&zte_k3765_z_blacklist },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2003, 0xff, 0xff, 0xff) },
++
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0014, 0xff, 0xff, 0xff) }, /* ZTE CDMA products */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0027, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0059, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0060, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0070, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0073, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0094, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0130, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0133, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0141, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2002, 0xff,
+-	  0xff, 0xff), .driver_info = (kernel_ulong_t)&zte_k3765_z_blacklist },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2003, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0147, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0152, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0168, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0170, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0176, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0178, 0xff, 0xff, 0xff) },
++
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_CDMA_TECH, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_AC8710, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, ZTE_PRODUCT_AC2726, 0xff, 0xff, 0xff) },
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0037-USB-Serial-ti_usb_3410_5052-Add-Abbot-Diabetes-Care-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0037-USB-Serial-ti_usb_3410_5052-Add-Abbot-Diabetes-Care-.patch
new file mode 100644
index 0000000..cb9491d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0037-USB-Serial-ti_usb_3410_5052-Add-Abbot-Diabetes-Care-.patch
@@ -0,0 +1,76 @@
+From f891ac47c26ed3a7efcf4bd641590e54869cd37e Mon Sep 17 00:00:00 2001
+From: Andrew Lunn <andrew@lunn.ch>
+Date: Mon, 20 Feb 2012 09:31:57 +0100
+Subject: [PATCH 37/73] USB: Serial: ti_usb_3410_5052: Add Abbot Diabetes Care
+ cable id
+
+commit 7fd25702ba616d9ba56e2a625472f29e5aff25ee upstream.
+
+This USB-serial cable with mini stereo jack enumerates as:
+Bus 001 Device 004: ID 1a61:3410 Abbott Diabetes Care
+
+It is a TI3410 inside.
+
+Signed-off-by: Andrew Lunn <andrew@lunn.ch>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ti_usb_3410_5052.c |    6 ++++--
+ drivers/usb/serial/ti_usb_3410_5052.h |    4 ++++
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/serial/ti_usb_3410_5052.c b/drivers/usb/serial/ti_usb_3410_5052.c
+index ea84456..21c82b0 100644
+--- a/drivers/usb/serial/ti_usb_3410_5052.c
++++ b/drivers/usb/serial/ti_usb_3410_5052.c
+@@ -165,7 +165,7 @@ static unsigned int product_5052_count;
+ /* the array dimension is the number of default entries plus */
+ /* TI_EXTRA_VID_PID_COUNT user defined entries plus 1 terminating */
+ /* null entry */
+-static struct usb_device_id ti_id_table_3410[13+TI_EXTRA_VID_PID_COUNT+1] = {
++static struct usb_device_id ti_id_table_3410[14+TI_EXTRA_VID_PID_COUNT+1] = {
+ 	{ USB_DEVICE(TI_VENDOR_ID, TI_3410_PRODUCT_ID) },
+ 	{ USB_DEVICE(TI_VENDOR_ID, TI_3410_EZ430_ID) },
+ 	{ USB_DEVICE(MTS_VENDOR_ID, MTS_GSM_NO_FW_PRODUCT_ID) },
+@@ -179,6 +179,7 @@ static struct usb_device_id ti_id_table_3410[13+TI_EXTRA_VID_PID_COUNT+1] = {
+ 	{ USB_DEVICE(IBM_VENDOR_ID, IBM_4543_PRODUCT_ID) },
+ 	{ USB_DEVICE(IBM_VENDOR_ID, IBM_454B_PRODUCT_ID) },
+ 	{ USB_DEVICE(IBM_VENDOR_ID, IBM_454C_PRODUCT_ID) },
++	{ USB_DEVICE(ABBOTT_VENDOR_ID, ABBOTT_PRODUCT_ID) },
+ };
+ 
+ static struct usb_device_id ti_id_table_5052[5+TI_EXTRA_VID_PID_COUNT+1] = {
+@@ -188,7 +189,7 @@ static struct usb_device_id ti_id_table_5052[5+TI_EXTRA_VID_PID_COUNT+1] = {
+ 	{ USB_DEVICE(TI_VENDOR_ID, TI_5052_FIRMWARE_PRODUCT_ID) },
+ };
+ 
+-static struct usb_device_id ti_id_table_combined[17+2*TI_EXTRA_VID_PID_COUNT+1] = {
++static struct usb_device_id ti_id_table_combined[18+2*TI_EXTRA_VID_PID_COUNT+1] = {
+ 	{ USB_DEVICE(TI_VENDOR_ID, TI_3410_PRODUCT_ID) },
+ 	{ USB_DEVICE(TI_VENDOR_ID, TI_3410_EZ430_ID) },
+ 	{ USB_DEVICE(MTS_VENDOR_ID, MTS_GSM_NO_FW_PRODUCT_ID) },
+@@ -206,6 +207,7 @@ static struct usb_device_id ti_id_table_combined[17+2*TI_EXTRA_VID_PID_COUNT+1]
+ 	{ USB_DEVICE(IBM_VENDOR_ID, IBM_4543_PRODUCT_ID) },
+ 	{ USB_DEVICE(IBM_VENDOR_ID, IBM_454B_PRODUCT_ID) },
+ 	{ USB_DEVICE(IBM_VENDOR_ID, IBM_454C_PRODUCT_ID) },
++	{ USB_DEVICE(ABBOTT_VENDOR_ID, ABBOTT_PRODUCT_ID) },
+ 	{ }
+ };
+ 
+diff --git a/drivers/usb/serial/ti_usb_3410_5052.h b/drivers/usb/serial/ti_usb_3410_5052.h
+index 2aac195..f140f1b 100644
+--- a/drivers/usb/serial/ti_usb_3410_5052.h
++++ b/drivers/usb/serial/ti_usb_3410_5052.h
+@@ -49,6 +49,10 @@
+ #define MTS_MT9234ZBA_PRODUCT_ID	0xF115
+ #define MTS_MT9234ZBAOLD_PRODUCT_ID	0x0319
+ 
++/* Abbott Diabetics vendor and product ids */
++#define ABBOTT_VENDOR_ID		0x1a61
++#define ABBOTT_PRODUCT_ID		0x3410
++
+ /* Commands */
+ #define TI_GET_VERSION			0x01
+ #define TI_GET_PORT_STATUS		0x02
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0038-USB-Remove-duplicate-USB-3.0-hub-feature-defines.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0038-USB-Remove-duplicate-USB-3.0-hub-feature-defines.patch
new file mode 100644
index 0000000..cbdabc2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0038-USB-Remove-duplicate-USB-3.0-hub-feature-defines.patch
@@ -0,0 +1,74 @@
+From d8c3ee4541529fe177c8afac31b890a7c2adecfd Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Thu, 5 Jan 2012 16:28:54 -0800
+Subject: [PATCH 38/73] USB: Remove duplicate USB 3.0 hub feature #defines.
+
+commit d9f5343e35d9138432657202afa8e3ddb2ade360 upstream.
+
+Somehow we ended up with duplicate hub feature #defines in ch11.h.
+Tatyana Brokhman first created the USB 3.0 hub feature macros in 2.6.38
+with commit 0eadcc09203349b11ca477ec367079b23d32ab91 "usb: USB3.0 ch11
+definitions".  In 2.6.39, I modified a patch from John Youn that added
+similar macros in a different place in the same file, and committed
+dbe79bbe9dcb22cb3651c46f18943477141ca452 "USB 3.0 Hub Changes".
+
+Some of the #defines used different names for the same values.  Others
+used exactly the same names with the same values, like these gems:
+
+ #define USB_PORT_FEAT_BH_PORT_RESET     28
+...
+ #define USB_PORT_FEAT_BH_PORT_RESET            28
+
+According to my very geeky husband (who looked it up in the C99 spec),
+it is allowed to have object-like macros with duplicate names as long as
+the replacement list is exactly the same.  However, he recalled that
+some compilers will give warnings when they find duplicate macros.  It's
+probably best to remove the duplicates in the stable tree, so that the
+code compiles for everyone.
+
+The macros are now fixed to move the feature requests that are specific
+to USB 3.0 hubs into a new section (out of the USB 2.0 hub feature
+section), and use the most common macro name.
+
+This patch should be backported to 2.6.39.
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Cc: Tatyana Brokhman <tlinder@codeaurora.org>
+Cc: John Youn <johnyoun@synopsys.com>
+Cc: Jamey Sharp <jamey@minilop.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/usb/ch11.h |   10 ++--------
+ 1 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/include/linux/usb/ch11.h b/include/linux/usb/ch11.h
+index 4ebaf08..1eb735b 100644
+--- a/include/linux/usb/ch11.h
++++ b/include/linux/usb/ch11.h
+@@ -62,12 +62,6 @@
+ #define USB_PORT_FEAT_TEST              21
+ #define USB_PORT_FEAT_INDICATOR         22
+ #define USB_PORT_FEAT_C_PORT_L1         23
+-#define USB_PORT_FEAT_C_PORT_LINK_STATE	25
+-#define USB_PORT_FEAT_C_PORT_CONFIG_ERROR 26
+-#define USB_PORT_FEAT_PORT_REMOTE_WAKE_MASK 27
+-#define USB_PORT_FEAT_BH_PORT_RESET     28
+-#define USB_PORT_FEAT_C_BH_PORT_RESET   29
+-#define USB_PORT_FEAT_FORCE_LINKPM_ACCEPT 30
+ 
+ /*
+  * Port feature selectors added by USB 3.0 spec.
+@@ -76,8 +70,8 @@
+ #define USB_PORT_FEAT_LINK_STATE		5
+ #define USB_PORT_FEAT_U1_TIMEOUT		23
+ #define USB_PORT_FEAT_U2_TIMEOUT		24
+-#define USB_PORT_FEAT_C_LINK_STATE		25
+-#define USB_PORT_FEAT_C_CONFIG_ERR		26
++#define USB_PORT_FEAT_C_PORT_LINK_STATE		25
++#define USB_PORT_FEAT_C_PORT_CONFIG_ERROR	26
+ #define USB_PORT_FEAT_REMOTE_WAKE_MASK		27
+ #define USB_PORT_FEAT_BH_PORT_RESET		28
+ #define USB_PORT_FEAT_C_BH_PORT_RESET		29
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0039-USB-Fix-handoff-when-BIOS-disables-host-PCI-device.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0039-USB-Fix-handoff-when-BIOS-disables-host-PCI-device.patch
new file mode 100644
index 0000000..f848457
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0039-USB-Fix-handoff-when-BIOS-disables-host-PCI-device.patch
@@ -0,0 +1,69 @@
+From 6dc2acf66f46c7aee7ae6617612fcf32fc6b0de5 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Tue, 7 Feb 2012 15:11:46 -0800
+Subject: [PATCH 39/73] USB: Fix handoff when BIOS disables host PCI device.
+
+commit cab928ee1f221c9cc48d6615070fefe2e444384a upstream.
+
+On some systems with an Intel Panther Point xHCI host controller, the
+BIOS disables the xHCI PCI device during boot, and switches the xHCI
+ports over to EHCI.  This allows the BIOS to access USB devices without
+having xHCI support.
+
+The downside is that the xHCI BIOS handoff mechanism will fail because
+memory mapped I/O is not enabled for the disabled PCI device.
+Jesse Barnes says this is expected behavior.  The PCI core will enable
+BARs before quirks run, but it will leave it in an undefined state, and
+it may not have memory mapped I/O enabled.
+
+Make the generic USB quirk handler call pci_enable_device() to re-enable
+MMIO, and call pci_disable_device() once the host-specific BIOS handoff
+is finished.  This will balance the ref counts in the PCI core.  When
+the PCI probe function is called, usb_hcd_pci_probe() will call
+pci_enable_device() again.
+
+This should be back ported to kernels as old as 2.6.31.  That was the
+first kernel with xHCI support, and no one has complained about BIOS
+handoffs failing due to memory mapped I/O being disabled on other hosts
+(EHCI, UHCI, or OHCI).
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Acked-by: Oliver Neukum <oneukum@suse.de>
+Cc: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/pci-quirks.c |   11 +++++++++++
+ 1 files changed, 11 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
+index ac53a66..7732d69 100644
+--- a/drivers/usb/host/pci-quirks.c
++++ b/drivers/usb/host/pci-quirks.c
+@@ -872,7 +872,17 @@ static void __devinit quirk_usb_early_handoff(struct pci_dev *pdev)
+ 	 */
+ 	if (pdev->vendor == 0x184e)	/* vendor Netlogic */
+ 		return;
++	if (pdev->class != PCI_CLASS_SERIAL_USB_UHCI &&
++			pdev->class != PCI_CLASS_SERIAL_USB_OHCI &&
++			pdev->class != PCI_CLASS_SERIAL_USB_EHCI &&
++			pdev->class != PCI_CLASS_SERIAL_USB_XHCI)
++		return;
+ 
++	if (pci_enable_device(pdev) < 0) {
++		dev_warn(&pdev->dev, "Can't enable PCI device, "
++				"BIOS handoff failed.\n");
++		return;
++	}
+ 	if (pdev->class == PCI_CLASS_SERIAL_USB_UHCI)
+ 		quirk_usb_handoff_uhci(pdev);
+ 	else if (pdev->class == PCI_CLASS_SERIAL_USB_OHCI)
+@@ -881,5 +891,6 @@ static void __devinit quirk_usb_early_handoff(struct pci_dev *pdev)
+ 		quirk_usb_disable_ehci(pdev);
+ 	else if (pdev->class == PCI_CLASS_SERIAL_USB_XHCI)
+ 		quirk_usb_handoff_xhci(pdev);
++	pci_disable_device(pdev);
+ }
+ DECLARE_PCI_FIXUP_FINAL(PCI_ANY_ID, PCI_ANY_ID, quirk_usb_early_handoff);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0040-xhci-Fix-oops-caused-by-more-USB2-ports-than-USB3-po.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0040-xhci-Fix-oops-caused-by-more-USB2-ports-than-USB3-po.patch
new file mode 100644
index 0000000..a6470ed
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0040-xhci-Fix-oops-caused-by-more-USB2-ports-than-USB3-po.patch
@@ -0,0 +1,39 @@
+From 60e1345a34208c8024e01dc7481e090737720d90 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Thu, 9 Feb 2012 14:43:44 -0800
+Subject: [PATCH 40/73] xhci: Fix oops caused by more USB2 ports than USB3
+ ports.
+
+commit 3278a55a1aebe2bbd47fbb5196209e5326a88b56 upstream.
+
+The code to set the device removable bits in the USB 2.0 roothub
+descriptor was accidentally looking at the USB 3.0 port registers
+instead of the USB 2.0 registers.  This can cause an oops if there are
+more USB 2.0 registers than USB 3.0 registers.
+
+This should be backported to kernels as old as 2.6.39, that contain the
+commit 4bbb0ace9a3de8392527e3c87926309d541d3b00 "xhci: Return a USB 3.0
+hub descriptor for USB3 roothub."
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci-hub.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
+index 430e88f..a8b2980 100644
+--- a/drivers/usb/host/xhci-hub.c
++++ b/drivers/usb/host/xhci-hub.c
+@@ -95,7 +95,7 @@ static void xhci_usb2_hub_descriptor(struct usb_hcd *hcd, struct xhci_hcd *xhci,
+ 	 */
+ 	memset(port_removable, 0, sizeof(port_removable));
+ 	for (i = 0; i < ports; i++) {
+-		portsc = xhci_readl(xhci, xhci->usb3_ports[i]);
++		portsc = xhci_readl(xhci, xhci->usb2_ports[i]);
+ 		/* If a device is removable, PORTSC reports a 0, same as in the
+ 		 * hub descriptor DeviceRemovable bits.
+ 		 */
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0041-xhci-Fix-encoding-for-HS-bulk-control-NAK-rate.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0041-xhci-Fix-encoding-for-HS-bulk-control-NAK-rate.patch
new file mode 100644
index 0000000..79b724d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0041-xhci-Fix-encoding-for-HS-bulk-control-NAK-rate.patch
@@ -0,0 +1,98 @@
+From 0eec53088be92edf907c345ff96d94059d89f124 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Mon, 13 Feb 2012 14:42:11 -0800
+Subject: [PATCH 41/73] xhci: Fix encoding for HS bulk/control NAK rate.
+
+commit 340a3504fd39dad753ba908fb6f894ee81fc3ae2 upstream.
+
+The xHCI 0.96 spec says that HS bulk and control endpoint NAK rate must
+be encoded as an exponent of two number of microframes.  The endpoint
+descriptor has the NAK rate encoded in number of microframes.  We were
+just copying the value from the endpoint descriptor into the endpoint
+context interval field, which was not correct.  This lead to the VIA
+host rejecting the add of a bulk OUT endpoint from any USB 2.0 mass
+storage device.
+
+The fix is to use the correct encoding.  Refactor the code to convert
+number of frames to an exponential number of microframes, and make sure
+we convert the number of microframes in HS bulk and control endpoints to
+an exponent.
+
+This should be back ported to kernels as old as 2.6.31, that contain the
+commit dfa49c4ad120a784ef1ff0717168aa79f55a483a "USB: xhci - fix math
+in xhci_get_endpoint_interval"
+
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Tested-by: Felipe Contreras <felipe.contreras@gmail.com>
+Suggested-by: Andiry Xu <andiry.xu@amd.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/xhci-mem.c |   32 ++++++++++++++++++++++++--------
+ 1 files changed, 24 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
+index 0e4b25f..c69cf54 100644
+--- a/drivers/usb/host/xhci-mem.c
++++ b/drivers/usb/host/xhci-mem.c
+@@ -1140,26 +1140,42 @@ static unsigned int xhci_parse_exponent_interval(struct usb_device *udev,
+ }
+ 
+ /*
+- * Convert bInterval expressed in frames (in 1-255 range) to exponent of
++ * Convert bInterval expressed in microframes (in 1-255 range) to exponent of
+  * microframes, rounded down to nearest power of 2.
+  */
+-static unsigned int xhci_parse_frame_interval(struct usb_device *udev,
+-		struct usb_host_endpoint *ep)
++static unsigned int xhci_microframes_to_exponent(struct usb_device *udev,
++		struct usb_host_endpoint *ep, unsigned int desc_interval,
++		unsigned int min_exponent, unsigned int max_exponent)
+ {
+ 	unsigned int interval;
+ 
+-	interval = fls(8 * ep->desc.bInterval) - 1;
+-	interval = clamp_val(interval, 3, 10);
+-	if ((1 << interval) != 8 * ep->desc.bInterval)
++	interval = fls(desc_interval) - 1;
++	interval = clamp_val(interval, min_exponent, max_exponent);
++	if ((1 << interval) != desc_interval)
+ 		dev_warn(&udev->dev,
+ 			 "ep %#x - rounding interval to %d microframes, ep desc says %d microframes\n",
+ 			 ep->desc.bEndpointAddress,
+ 			 1 << interval,
+-			 8 * ep->desc.bInterval);
++			 desc_interval);
+ 
+ 	return interval;
+ }
+ 
++static unsigned int xhci_parse_microframe_interval(struct usb_device *udev,
++		struct usb_host_endpoint *ep)
++{
++	return xhci_microframes_to_exponent(udev, ep,
++			ep->desc.bInterval, 0, 15);
++}
++
++
++static unsigned int xhci_parse_frame_interval(struct usb_device *udev,
++		struct usb_host_endpoint *ep)
++{
++	return xhci_microframes_to_exponent(udev, ep,
++			ep->desc.bInterval * 8, 3, 10);
++}
++
+ /* Return the polling or NAK interval.
+  *
+  * The polling interval is expressed in "microframes".  If xHCI's Interval field
+@@ -1178,7 +1194,7 @@ static unsigned int xhci_get_endpoint_interval(struct usb_device *udev,
+ 		/* Max NAK rate */
+ 		if (usb_endpoint_xfer_control(&ep->desc) ||
+ 		    usb_endpoint_xfer_bulk(&ep->desc)) {
+-			interval = ep->desc.bInterval;
++			interval = xhci_parse_microframe_interval(udev, ep);
+ 			break;
+ 		}
+ 		/* Fall through - SS and HS isoc/int have same decoding */
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0042-USB-Don-t-fail-USB3-probe-on-missing-legacy-PCI-IRQ.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0042-USB-Don-t-fail-USB3-probe-on-missing-legacy-PCI-IRQ.patch
new file mode 100644
index 0000000..5f63bf7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0042-USB-Don-t-fail-USB3-probe-on-missing-legacy-PCI-IRQ.patch
@@ -0,0 +1,80 @@
+From 4d5845033ef313d6d1008ac5dafe69dbab23cc11 Mon Sep 17 00:00:00 2001
+From: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Date: Mon, 13 Feb 2012 16:25:57 -0800
+Subject: [PATCH 42/73] USB: Don't fail USB3 probe on missing legacy PCI IRQ.
+
+commit 68d07f64b8a11a852d48d1b05b724c3e20c0d94b upstream.
+
+Intel has a PCI USB xhci host controller on a new platform. It doesn't
+have a line IRQ definition in BIOS.  The Linux driver refuses to
+initialize this controller, but Windows works well because it only depends
+on MSI.
+
+Actually, Linux also can work for MSI.  This patch avoids the line IRQ
+checking for USB3 HCDs in usb core PCI probe.  It allows the xHCI driver
+to try to enable MSI or MSI-X first.  It will fail the probe if MSI
+enabling failed and there's no legacy PCI IRQ.
+
+This patch should be backported to kernels as old as 2.6.32.
+
+Signed-off-by: Alex Shi <alex.shi@intel.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/core/hcd-pci.c |    5 ++++-
+ drivers/usb/core/hcd.c     |    6 ++++--
+ drivers/usb/host/xhci.c    |    5 +++++
+ 3 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
+index a004db3..61d08dd 100644
+--- a/drivers/usb/core/hcd-pci.c
++++ b/drivers/usb/core/hcd-pci.c
+@@ -187,7 +187,10 @@ int usb_hcd_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
+ 		return -ENODEV;
+ 	dev->current_state = PCI_D0;
+ 
+-	if (!dev->irq) {
++	/* The xHCI driver supports MSI and MSI-X,
++	 * so don't fail if the BIOS doesn't provide a legacy IRQ.
++	 */
++	if (!dev->irq && (driver->flags & HCD_MASK) != HCD_USB3) {
+ 		dev_err(&dev->dev,
+ 			"Found HC with no IRQ.  Check BIOS/PCI %s setup!\n",
+ 			pci_name(dev));
+diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
+index 179e364..8cb9304 100644
+--- a/drivers/usb/core/hcd.c
++++ b/drivers/usb/core/hcd.c
+@@ -2465,8 +2465,10 @@ int usb_add_hcd(struct usb_hcd *hcd,
+ 			&& device_can_wakeup(&hcd->self.root_hub->dev))
+ 		dev_dbg(hcd->self.controller, "supports USB remote wakeup\n");
+ 
+-	/* enable irqs just before we start the controller */
+-	if (usb_hcd_is_primary_hcd(hcd)) {
++	/* enable irqs just before we start the controller,
++	 * if the BIOS provides legacy PCI irqs.
++	 */
++	if (usb_hcd_is_primary_hcd(hcd) && irqnum) {
+ 		retval = usb_hcd_request_irqs(hcd, irqnum, irqflags);
+ 		if (retval)
+ 			goto err_request_irq;
+diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
+index b33f059..034f554 100644
+--- a/drivers/usb/host/xhci.c
++++ b/drivers/usb/host/xhci.c
+@@ -352,6 +352,11 @@ static int xhci_try_enable_msi(struct usb_hcd *hcd)
+ 		/* hcd->irq is -1, we have MSI */
+ 		return 0;
+ 
++	if (!pdev->irq) {
++		xhci_err(xhci, "No msi-x/msi found and no IRQ in BIOS\n");
++		return -EINVAL;
++	}
++
+ 	/* fall back to legacy interrupt*/
+ 	ret = request_irq(pdev->irq, &usb_hcd_irq, IRQF_SHARED,
+ 			hcd->irq_descr, hcd);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0043-USB-Set-hub-depth-after-USB3-hub-reset.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0043-USB-Set-hub-depth-after-USB3-hub-reset.patch
new file mode 100644
index 0000000..debbbc5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0043-USB-Set-hub-depth-after-USB3-hub-reset.patch
@@ -0,0 +1,86 @@
+From 1a624979096199f383fc7785a509d1e38b608986 Mon Sep 17 00:00:00 2001
+From: Elric Fu <elricfu1@gmail.com>
+Date: Sat, 18 Feb 2012 13:32:27 +0800
+Subject: [PATCH 43/73] USB: Set hub depth after USB3 hub reset
+
+commit a45aa3b30583e7d54e7cf4fbcd0aa699348a6e5c upstream.
+
+The superspeed device attached to a USB 3.0 hub(such as VIA's)
+doesn't respond the address device command after resume. The
+root cause is the superspeed hub will miss the Hub Depth value
+that is used as an offset into the route string to locate the
+bits it uses to determine the downstream port number after
+reset, and all packets can't be routed to the device attached
+to the superspeed hub.
+
+Hub driver sends a Set Hub Depth request to the superspeed hub
+except for USB 3.0 root hub when the hub is initialized and
+doesn't send the request again after reset due to the resume
+process. So moving the code that sends the Set Hub Depth request
+to the superspeed hub from hub_configure() to hub_activate()
+is to cover those situations include initialization and reset.
+
+The patch should be backported to kernels as old as 2.6.39.
+
+Signed-off-by: Elric Fu <elricfu1@gmail.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Acked-by: Alan Stern <stern@rowland.harvard.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/core/hub.c |   30 +++++++++++++++++-------------
+ 1 files changed, 17 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
+index 7978146..bc06a8f 100644
+--- a/drivers/usb/core/hub.c
++++ b/drivers/usb/core/hub.c
+@@ -705,10 +705,26 @@ static void hub_activate(struct usb_hub *hub, enum hub_activation_type type)
+ 	if (type == HUB_INIT3)
+ 		goto init3;
+ 
+-	/* After a resume, port power should still be on.
++	/* The superspeed hub except for root hub has to use Hub Depth
++	 * value as an offset into the route string to locate the bits
++	 * it uses to determine the downstream port number. So hub driver
++	 * should send a set hub depth request to superspeed hub after
++	 * the superspeed hub is set configuration in initialization or
++	 * reset procedure.
++	 *
++	 * After a resume, port power should still be on.
+ 	 * For any other type of activation, turn it on.
+ 	 */
+ 	if (type != HUB_RESUME) {
++		if (hdev->parent && hub_is_superspeed(hdev)) {
++			ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
++					HUB_SET_DEPTH, USB_RT_HUB,
++					hdev->level - 1, 0, NULL, 0,
++					USB_CTRL_SET_TIMEOUT);
++			if (ret < 0)
++				dev_err(hub->intfdev,
++						"set hub depth failed\n");
++		}
+ 
+ 		/* Speed up system boot by using a delayed_work for the
+ 		 * hub's initial power-up delays.  This is pretty awkward
+@@ -987,18 +1003,6 @@ static int hub_configure(struct usb_hub *hub,
+ 		goto fail;
+ 	}
+ 
+-	if (hub_is_superspeed(hdev) && (hdev->parent != NULL)) {
+-		ret = usb_control_msg(hdev, usb_sndctrlpipe(hdev, 0),
+-				HUB_SET_DEPTH, USB_RT_HUB,
+-				hdev->level - 1, 0, NULL, 0,
+-				USB_CTRL_SET_TIMEOUT);
+-
+-		if (ret < 0) {
+-			message = "can't set hub depth";
+-			goto fail;
+-		}
+-	}
+-
+ 	/* Request the entire hub descriptor.
+ 	 * hub->descriptor can handle USB_MAXCHILDREN ports,
+ 	 * but the hub can/will return fewer bytes here.
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0044-usb-storage-fix-freezing-of-the-scanning-thread.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0044-usb-storage-fix-freezing-of-the-scanning-thread.patch
new file mode 100644
index 0000000..731d030
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0044-usb-storage-fix-freezing-of-the-scanning-thread.patch
@@ -0,0 +1,213 @@
+From 2ab9cc5409e9871927ef2799b41af3288cf7114c Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Tue, 21 Feb 2012 13:16:32 -0500
+Subject: [PATCH 44/73] usb-storage: fix freezing of the scanning thread
+
+commit bb94a406682770a35305daaa241ccdb7cab399de upstream.
+
+This patch (as1521b) fixes the interaction between usb-storage's
+scanning thread and the freezer.  The current implementation has a
+race: If the device is unplugged shortly after being plugged in and
+just as a system sleep begins, the scanning thread may get frozen
+before the khubd task.  Khubd won't be able to freeze until the
+disconnect processing is complete, and the disconnect processing can't
+proceed until the scanning thread finishes, so the sleep transition
+will fail.
+
+The implementation in the 3.2 kernel suffers from an additional
+problem.  There the scanning thread calls set_freezable_with_signal(),
+and the signals sent by the freezer will mess up the thread's I/O
+delays, which are all interruptible.
+
+The solution to both problems is the same: Replace the kernel thread
+used for scanning with a delayed-work routine on the system freezable
+work queue.  Freezable work queues have the nice property that you can
+cancel a work item even while the work queue is frozen, and no signals
+are needed.
+
+The 3.2 version of this patch solves the problem in Bugzilla #42730.
+
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Acked-by: Seth Forshee <seth.forshee@canonical.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/storage/usb.c |   89 ++++++++++++++++-----------------------------
+ drivers/usb/storage/usb.h |    7 ++--
+ 2 files changed, 35 insertions(+), 61 deletions(-)
+
+diff --git a/drivers/usb/storage/usb.c b/drivers/usb/storage/usb.c
+index 9e069ef..db51ba1 100644
+--- a/drivers/usb/storage/usb.c
++++ b/drivers/usb/storage/usb.c
+@@ -788,15 +788,19 @@ static void quiesce_and_remove_host(struct us_data *us)
+ 	struct Scsi_Host *host = us_to_host(us);
+ 
+ 	/* If the device is really gone, cut short reset delays */
+-	if (us->pusb_dev->state == USB_STATE_NOTATTACHED)
++	if (us->pusb_dev->state == USB_STATE_NOTATTACHED) {
+ 		set_bit(US_FLIDX_DISCONNECTING, &us->dflags);
++		wake_up(&us->delay_wait);
++	}
+ 
+-	/* Prevent SCSI-scanning (if it hasn't started yet)
+-	 * and wait for the SCSI-scanning thread to stop.
++	/* Prevent SCSI scanning (if it hasn't started yet)
++	 * or wait for the SCSI-scanning routine to stop.
+ 	 */
+-	set_bit(US_FLIDX_DONT_SCAN, &us->dflags);
+-	wake_up(&us->delay_wait);
+-	wait_for_completion(&us->scanning_done);
++	cancel_delayed_work_sync(&us->scan_dwork);
++
++	/* Balance autopm calls if scanning was cancelled */
++	if (test_bit(US_FLIDX_SCAN_PENDING, &us->dflags))
++		usb_autopm_put_interface_no_suspend(us->pusb_intf);
+ 
+ 	/* Removing the host will perform an orderly shutdown: caches
+ 	 * synchronized, disks spun down, etc.
+@@ -823,52 +827,28 @@ static void release_everything(struct us_data *us)
+ 	scsi_host_put(us_to_host(us));
+ }
+ 
+-/* Thread to carry out delayed SCSI-device scanning */
+-static int usb_stor_scan_thread(void * __us)
++/* Delayed-work routine to carry out SCSI-device scanning */
++static void usb_stor_scan_dwork(struct work_struct *work)
+ {
+-	struct us_data *us = (struct us_data *)__us;
++	struct us_data *us = container_of(work, struct us_data,
++			scan_dwork.work);
+ 	struct device *dev = &us->pusb_intf->dev;
+ 
+-	dev_dbg(dev, "device found\n");
++	dev_dbg(dev, "starting scan\n");
+ 
+-	set_freezable_with_signal();
+-	/*
+-	 * Wait for the timeout to expire or for a disconnect
+-	 *
+-	 * We can't freeze in this thread or we risk causing khubd to
+-	 * fail to freeze, but we can't be non-freezable either. Nor can
+-	 * khubd freeze while waiting for scanning to complete as it may
+-	 * hold the device lock, causing a hang when suspending devices.
+-	 * So we request a fake signal when freezing and use
+-	 * interruptible sleep to kick us out of our wait early when
+-	 * freezing happens.
+-	 */
+-	if (delay_use > 0) {
+-		dev_dbg(dev, "waiting for device to settle "
+-				"before scanning\n");
+-		wait_event_interruptible_timeout(us->delay_wait,
+-				test_bit(US_FLIDX_DONT_SCAN, &us->dflags),
+-				delay_use * HZ);
++	/* For bulk-only devices, determine the max LUN value */
++	if (us->protocol == USB_PR_BULK && !(us->fflags & US_FL_SINGLE_LUN)) {
++		mutex_lock(&us->dev_mutex);
++		us->max_lun = usb_stor_Bulk_max_lun(us);
++		mutex_unlock(&us->dev_mutex);
+ 	}
++	scsi_scan_host(us_to_host(us));
++	dev_dbg(dev, "scan complete\n");
+ 
+-	/* If the device is still connected, perform the scanning */
+-	if (!test_bit(US_FLIDX_DONT_SCAN, &us->dflags)) {
+-
+-		/* For bulk-only devices, determine the max LUN value */
+-		if (us->protocol == USB_PR_BULK &&
+-				!(us->fflags & US_FL_SINGLE_LUN)) {
+-			mutex_lock(&us->dev_mutex);
+-			us->max_lun = usb_stor_Bulk_max_lun(us);
+-			mutex_unlock(&us->dev_mutex);
+-		}
+-		scsi_scan_host(us_to_host(us));
+-		dev_dbg(dev, "scan complete\n");
+-
+-		/* Should we unbind if no devices were detected? */
+-	}
++	/* Should we unbind if no devices were detected? */
+ 
+ 	usb_autopm_put_interface(us->pusb_intf);
+-	complete_and_exit(&us->scanning_done, 0);
++	clear_bit(US_FLIDX_SCAN_PENDING, &us->dflags);
+ }
+ 
+ static unsigned int usb_stor_sg_tablesize(struct usb_interface *intf)
+@@ -915,7 +895,7 @@ int usb_stor_probe1(struct us_data **pus,
+ 	init_completion(&us->cmnd_ready);
+ 	init_completion(&(us->notify));
+ 	init_waitqueue_head(&us->delay_wait);
+-	init_completion(&us->scanning_done);
++	INIT_DELAYED_WORK(&us->scan_dwork, usb_stor_scan_dwork);
+ 
+ 	/* Associate the us_data structure with the USB device */
+ 	result = associate_dev(us, intf);
+@@ -946,7 +926,6 @@ EXPORT_SYMBOL_GPL(usb_stor_probe1);
+ /* Second part of general USB mass-storage probing */
+ int usb_stor_probe2(struct us_data *us)
+ {
+-	struct task_struct *th;
+ 	int result;
+ 	struct device *dev = &us->pusb_intf->dev;
+ 
+@@ -987,20 +966,14 @@ int usb_stor_probe2(struct us_data *us)
+ 		goto BadDevice;
+ 	}
+ 
+-	/* Start up the thread for delayed SCSI-device scanning */
+-	th = kthread_create(usb_stor_scan_thread, us, "usb-stor-scan");
+-	if (IS_ERR(th)) {
+-		dev_warn(dev,
+-				"Unable to start the device-scanning thread\n");
+-		complete(&us->scanning_done);
+-		quiesce_and_remove_host(us);
+-		result = PTR_ERR(th);
+-		goto BadDevice;
+-	}
+-
++	/* Submit the delayed_work for SCSI-device scanning */
+ 	usb_autopm_get_interface_no_resume(us->pusb_intf);
+-	wake_up_process(th);
++	set_bit(US_FLIDX_SCAN_PENDING, &us->dflags);
+ 
++	if (delay_use > 0)
++		dev_dbg(dev, "waiting for device to settle before scanning\n");
++	queue_delayed_work(system_freezable_wq, &us->scan_dwork,
++			delay_use * HZ);
+ 	return 0;
+ 
+ 	/* We come here if there are any problems */
+diff --git a/drivers/usb/storage/usb.h b/drivers/usb/storage/usb.h
+index 7b0f211..75f70f0 100644
+--- a/drivers/usb/storage/usb.h
++++ b/drivers/usb/storage/usb.h
+@@ -47,6 +47,7 @@
+ #include <linux/blkdev.h>
+ #include <linux/completion.h>
+ #include <linux/mutex.h>
++#include <linux/workqueue.h>
+ #include <scsi/scsi_host.h>
+ 
+ struct us_data;
+@@ -72,7 +73,7 @@ struct us_unusual_dev {
+ #define US_FLIDX_DISCONNECTING	3	/* disconnect in progress   */
+ #define US_FLIDX_RESETTING	4	/* device reset in progress */
+ #define US_FLIDX_TIMED_OUT	5	/* SCSI midlayer timed out  */
+-#define US_FLIDX_DONT_SCAN	6	/* don't scan (disconnect)  */
++#define US_FLIDX_SCAN_PENDING	6	/* scanning not yet done    */
+ #define US_FLIDX_REDO_READ10	7	/* redo READ(10) command    */
+ #define US_FLIDX_READ10_WORKED	8	/* previous READ(10) succeeded */
+ 
+@@ -147,8 +148,8 @@ struct us_data {
+ 	/* mutual exclusion and synchronization structures */
+ 	struct completion	cmnd_ready;	 /* to sleep thread on	    */
+ 	struct completion	notify;		 /* thread begin/end	    */
+-	wait_queue_head_t	delay_wait;	 /* wait during scan, reset */
+-	struct completion	scanning_done;	 /* wait for scan thread    */
++	wait_queue_head_t	delay_wait;	 /* wait during reset	    */
++	struct delayed_work	scan_dwork;	 /* for async scanning      */
+ 
+ 	/* subdriver information */
+ 	void			*extra;		 /* Any extra data          */
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0045-target-Allow-control-CDBs-with-data-1-page.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0045-target-Allow-control-CDBs-with-data-1-page.patch
new file mode 100644
index 0000000..c1367b9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0045-target-Allow-control-CDBs-with-data-1-page.patch
@@ -0,0 +1,513 @@
+From d2227f84ba0e97906153ac83db13213fb2e3938d Mon Sep 17 00:00:00 2001
+From: Andy Grover <agrover@redhat.com>
+Date: Mon, 16 Jan 2012 16:57:08 -0800
+Subject: [PATCH 45/73] target: Allow control CDBs with data > 1 page
+
+commit 4949314c7283ea4f9ade182ca599583b89f7edd6 upstream.
+
+We need to handle >1 page control cdbs, so extend the code to do a vmap
+if bigger than 1 page. It seems like kmap() is still preferable if just
+a page, fewer TLB shootdowns(?), so keep using that when possible.
+
+Rename function pair for their new scope.
+
+Signed-off-by: Andy Grover <agrover@redhat.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_alua.c      |    8 +++---
+ drivers/target/target_core_cdb.c       |   28 ++++++++++----------
+ drivers/target/target_core_device.c    |    4 +-
+ drivers/target/target_core_pr.c        |   38 +++++++++++++-------------
+ drivers/target/target_core_pscsi.c     |    4 +-
+ drivers/target/target_core_transport.c |   45 ++++++++++++++++++++++++--------
+ include/target/target_core_base.h      |    1 +
+ include/target/target_core_transport.h |    4 +-
+ 8 files changed, 78 insertions(+), 54 deletions(-)
+
+diff --git a/drivers/target/target_core_alua.c b/drivers/target/target_core_alua.c
+index 1dcbef4..1d24512 100644
+--- a/drivers/target/target_core_alua.c
++++ b/drivers/target/target_core_alua.c
+@@ -79,7 +79,7 @@ int target_emulate_report_target_port_groups(struct se_task *task)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	spin_lock(&su_dev->t10_alua.tg_pt_gps_lock);
+ 	list_for_each_entry(tg_pt_gp, &su_dev->t10_alua.tg_pt_gps_list,
+@@ -164,7 +164,7 @@ int target_emulate_report_target_port_groups(struct se_task *task)
+ 	buf[2] = ((rd_len >> 8) & 0xff);
+ 	buf[3] = (rd_len & 0xff);
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	task->task_scsi_status = GOOD;
+ 	transport_complete_task(task, 1);
+@@ -195,7 +195,7 @@ int target_emulate_set_target_port_groups(struct se_task *task)
+ 		cmd->scsi_sense_reason = TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
+ 		return -EINVAL;
+ 	}
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	/*
+ 	 * Determine if explict ALUA via SET_TARGET_PORT_GROUPS is allowed
+@@ -352,7 +352,7 @@ int target_emulate_set_target_port_groups(struct se_task *task)
+ 	}
+ 
+ out:
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	task->task_scsi_status = GOOD;
+ 	transport_complete_task(task, 1);
+ 	return 0;
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 251e48f..8facd33 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -82,7 +82,7 @@ target_emulate_inquiry_std(struct se_cmd *cmd)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	if (dev == tpg->tpg_virt_lun0.lun_se_dev) {
+ 		buf[0] = 0x3f; /* Not connected */
+@@ -135,7 +135,7 @@ target_emulate_inquiry_std(struct se_cmd *cmd)
+ 	buf[4] = 31; /* Set additional length to 31 */
+ 
+ out:
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	return 0;
+ }
+ 
+@@ -726,7 +726,7 @@ int target_emulate_inquiry(struct se_task *task)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	buf[0] = dev->transport->get_device_type(dev);
+ 
+@@ -743,7 +743,7 @@ int target_emulate_inquiry(struct se_task *task)
+ 	ret = -EINVAL;
+ 
+ out_unmap:
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ out:
+ 	if (!ret) {
+ 		task->task_scsi_status = GOOD;
+@@ -765,7 +765,7 @@ int target_emulate_readcapacity(struct se_task *task)
+ 	else
+ 		blocks = (u32)blocks_long;
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	buf[0] = (blocks >> 24) & 0xff;
+ 	buf[1] = (blocks >> 16) & 0xff;
+@@ -781,7 +781,7 @@ int target_emulate_readcapacity(struct se_task *task)
+ 	if (dev->se_sub_dev->se_dev_attrib.emulate_tpu || dev->se_sub_dev->se_dev_attrib.emulate_tpws)
+ 		put_unaligned_be32(0xFFFFFFFF, &buf[0]);
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	task->task_scsi_status = GOOD;
+ 	transport_complete_task(task, 1);
+@@ -795,7 +795,7 @@ int target_emulate_readcapacity_16(struct se_task *task)
+ 	unsigned char *buf;
+ 	unsigned long long blocks = dev->transport->get_blocks(dev);
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	buf[0] = (blocks >> 56) & 0xff;
+ 	buf[1] = (blocks >> 48) & 0xff;
+@@ -816,7 +816,7 @@ int target_emulate_readcapacity_16(struct se_task *task)
+ 	if (dev->se_sub_dev->se_dev_attrib.emulate_tpu || dev->se_sub_dev->se_dev_attrib.emulate_tpws)
+ 		buf[14] = 0x80;
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	task->task_scsi_status = GOOD;
+ 	transport_complete_task(task, 1);
+@@ -1029,9 +1029,9 @@ int target_emulate_modesense(struct se_task *task)
+ 			offset = cmd->data_length;
+ 	}
+ 
+-	rbuf = transport_kmap_first_data_page(cmd);
++	rbuf = transport_kmap_data_sg(cmd);
+ 	memcpy(rbuf, buf, offset);
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	task->task_scsi_status = GOOD;
+ 	transport_complete_task(task, 1);
+@@ -1053,7 +1053,7 @@ int target_emulate_request_sense(struct se_task *task)
+ 		return -ENOSYS;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	if (!core_scsi3_ua_clear_for_request_sense(cmd, &ua_asc, &ua_ascq)) {
+ 		/*
+@@ -1099,7 +1099,7 @@ int target_emulate_request_sense(struct se_task *task)
+ 	}
+ 
+ end:
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	task->task_scsi_status = GOOD;
+ 	transport_complete_task(task, 1);
+ 	return 0;
+@@ -1133,7 +1133,7 @@ int target_emulate_unmap(struct se_task *task)
+ 	dl = get_unaligned_be16(&cdb[0]);
+ 	bd_dl = get_unaligned_be16(&cdb[2]);
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	ptr = &buf[offset];
+ 	pr_debug("UNMAP: Sub: %s Using dl: %hu bd_dl: %hu size: %hu"
+@@ -1157,7 +1157,7 @@ int target_emulate_unmap(struct se_task *task)
+ 	}
+ 
+ err:
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	if (!ret) {
+ 		task->task_scsi_status = GOOD;
+ 		transport_complete_task(task, 1);
+diff --git a/drivers/target/target_core_device.c b/drivers/target/target_core_device.c
+index 9b86394..19f8aca 100644
+--- a/drivers/target/target_core_device.c
++++ b/drivers/target/target_core_device.c
+@@ -658,7 +658,7 @@ int target_report_luns(struct se_task *se_task)
+ 	unsigned char *buf;
+ 	u32 cdb_offset = 0, lun_count = 0, offset = 8, i;
+ 
+-	buf = transport_kmap_first_data_page(se_cmd);
++	buf = (unsigned char *) transport_kmap_data_sg(se_cmd);
+ 
+ 	/*
+ 	 * If no struct se_session pointer is present, this struct se_cmd is
+@@ -696,7 +696,7 @@ int target_report_luns(struct se_task *se_task)
+ 	 * See SPC3 r07, page 159.
+ 	 */
+ done:
+-	transport_kunmap_first_data_page(se_cmd);
++	transport_kunmap_data_sg(se_cmd);
+ 	lun_count *= 8;
+ 	buf[0] = ((lun_count >> 24) & 0xff);
+ 	buf[1] = ((lun_count >> 16) & 0xff);
+diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core_pr.c
+index 9119d92..778c1a6 100644
+--- a/drivers/target/target_core_pr.c
++++ b/drivers/target/target_core_pr.c
+@@ -1538,7 +1538,7 @@ static int core_scsi3_decode_spec_i_port(
+ 	tidh_new->dest_local_nexus = 1;
+ 	list_add_tail(&tidh_new->dest_list, &tid_dest_list);
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 	/*
+ 	 * For a PERSISTENT RESERVE OUT specify initiator ports payload,
+ 	 * first extract TransportID Parameter Data Length, and make sure
+@@ -1789,7 +1789,7 @@ static int core_scsi3_decode_spec_i_port(
+ 
+ 	}
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	/*
+ 	 * Go ahead and create a registrations from tid_dest_list for the
+@@ -1837,7 +1837,7 @@ static int core_scsi3_decode_spec_i_port(
+ 
+ 	return 0;
+ out:
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	/*
+ 	 * For the failure case, release everything from tid_dest_list
+ 	 * including *dest_pr_reg and the configfs dependances..
+@@ -3429,14 +3429,14 @@ static int core_scsi3_emulate_pro_register_and_move(
+ 	 * will be moved to for the TransportID containing SCSI initiator WWN
+ 	 * information.
+ 	 */
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 	rtpi = (buf[18] & 0xff) << 8;
+ 	rtpi |= buf[19] & 0xff;
+ 	tid_len = (buf[20] & 0xff) << 24;
+ 	tid_len |= (buf[21] & 0xff) << 16;
+ 	tid_len |= (buf[22] & 0xff) << 8;
+ 	tid_len |= buf[23] & 0xff;
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	buf = NULL;
+ 
+ 	if ((tid_len + 24) != cmd->data_length) {
+@@ -3488,7 +3488,7 @@ static int core_scsi3_emulate_pro_register_and_move(
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 	proto_ident = (buf[24] & 0x0f);
+ #if 0
+ 	pr_debug("SPC-3 PR REGISTER_AND_MOVE: Extracted Protocol Identifier:"
+@@ -3522,7 +3522,7 @@ static int core_scsi3_emulate_pro_register_and_move(
+ 		goto out;
+ 	}
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	buf = NULL;
+ 
+ 	pr_debug("SPC-3 PR [%s] Extracted initiator %s identifier: %s"
+@@ -3787,13 +3787,13 @@ after_iport_check:
+ 					" REGISTER_AND_MOVE\n");
+ 	}
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	core_scsi3_put_pr_reg(dest_pr_reg);
+ 	return 0;
+ out:
+ 	if (buf)
+-		transport_kunmap_first_data_page(cmd);
++		transport_kunmap_data_sg(cmd);
+ 	if (dest_se_deve)
+ 		core_scsi3_lunacl_undepend_item(dest_se_deve);
+ 	if (dest_node_acl)
+@@ -3867,7 +3867,7 @@ int target_scsi3_emulate_pr_out(struct se_task *task)
+ 	scope = (cdb[2] & 0xf0);
+ 	type = (cdb[2] & 0x0f);
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 	/*
+ 	 * From PERSISTENT_RESERVE_OUT parameter list (payload)
+ 	 */
+@@ -3885,7 +3885,7 @@ int target_scsi3_emulate_pr_out(struct se_task *task)
+ 		aptpl = (buf[17] & 0x01);
+ 		unreg = (buf[17] & 0x02);
+ 	}
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 	buf = NULL;
+ 
+ 	/*
+@@ -3985,7 +3985,7 @@ static int core_scsi3_pri_read_keys(struct se_cmd *cmd)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 	buf[0] = ((su_dev->t10_pr.pr_generation >> 24) & 0xff);
+ 	buf[1] = ((su_dev->t10_pr.pr_generation >> 16) & 0xff);
+ 	buf[2] = ((su_dev->t10_pr.pr_generation >> 8) & 0xff);
+@@ -4019,7 +4019,7 @@ static int core_scsi3_pri_read_keys(struct se_cmd *cmd)
+ 	buf[6] = ((add_len >> 8) & 0xff);
+ 	buf[7] = (add_len & 0xff);
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	return 0;
+ }
+@@ -4045,7 +4045,7 @@ static int core_scsi3_pri_read_reservation(struct se_cmd *cmd)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 	buf[0] = ((su_dev->t10_pr.pr_generation >> 24) & 0xff);
+ 	buf[1] = ((su_dev->t10_pr.pr_generation >> 16) & 0xff);
+ 	buf[2] = ((su_dev->t10_pr.pr_generation >> 8) & 0xff);
+@@ -4104,7 +4104,7 @@ static int core_scsi3_pri_read_reservation(struct se_cmd *cmd)
+ 
+ err:
+ 	spin_unlock(&se_dev->dev_reservation_lock);
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	return 0;
+ }
+@@ -4128,7 +4128,7 @@ static int core_scsi3_pri_report_capabilities(struct se_cmd *cmd)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	buf[0] = ((add_len << 8) & 0xff);
+ 	buf[1] = (add_len & 0xff);
+@@ -4160,7 +4160,7 @@ static int core_scsi3_pri_report_capabilities(struct se_cmd *cmd)
+ 	buf[4] |= 0x02; /* PR_TYPE_WRITE_EXCLUSIVE */
+ 	buf[5] |= 0x01; /* PR_TYPE_EXCLUSIVE_ACCESS_ALLREG */
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	return 0;
+ }
+@@ -4190,7 +4190,7 @@ static int core_scsi3_pri_read_full_status(struct se_cmd *cmd)
+ 		return -EINVAL;
+ 	}
+ 
+-	buf = transport_kmap_first_data_page(cmd);
++	buf = transport_kmap_data_sg(cmd);
+ 
+ 	buf[0] = ((su_dev->t10_pr.pr_generation >> 24) & 0xff);
+ 	buf[1] = ((su_dev->t10_pr.pr_generation >> 16) & 0xff);
+@@ -4311,7 +4311,7 @@ static int core_scsi3_pri_read_full_status(struct se_cmd *cmd)
+ 	buf[6] = ((add_len >> 8) & 0xff);
+ 	buf[7] = (add_len & 0xff);
+ 
+-	transport_kunmap_first_data_page(cmd);
++	transport_kunmap_data_sg(cmd);
+ 
+ 	return 0;
+ }
+diff --git a/drivers/target/target_core_pscsi.c b/drivers/target/target_core_pscsi.c
+index 8b15e56..5c12137 100644
+--- a/drivers/target/target_core_pscsi.c
++++ b/drivers/target/target_core_pscsi.c
+@@ -695,7 +695,7 @@ static int pscsi_transport_complete(struct se_task *task)
+ 
+ 		if (task->task_se_cmd->se_deve->lun_flags &
+ 				TRANSPORT_LUNFLAGS_READ_ONLY) {
+-			unsigned char *buf = transport_kmap_first_data_page(task->task_se_cmd);
++			unsigned char *buf = transport_kmap_data_sg(task->task_se_cmd);
+ 
+ 			if (cdb[0] == MODE_SENSE_10) {
+ 				if (!(buf[3] & 0x80))
+@@ -705,7 +705,7 @@ static int pscsi_transport_complete(struct se_task *task)
+ 					buf[2] |= 0x80;
+ 			}
+ 
+-			transport_kunmap_first_data_page(task->task_se_cmd);
++			transport_kunmap_data_sg(task->task_se_cmd);
+ 		}
+ 	}
+ after_mode_sense:
+diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
+index 861628e..e4ddb93 100644
+--- a/drivers/target/target_core_transport.c
++++ b/drivers/target/target_core_transport.c
+@@ -3053,11 +3053,6 @@ static int transport_generic_cmd_sequencer(
+ 	     (cmd->se_cmd_flags & SCF_SCSI_DATA_SG_IO_CDB)))
+ 		goto out_unsupported_cdb;
+ 
+-	/* Let's limit control cdbs to a page, for simplicity's sake. */
+-	if ((cmd->se_cmd_flags & SCF_SCSI_CONTROL_SG_IO_CDB) &&
+-	    size > PAGE_SIZE)
+-		goto out_invalid_cdb_field;
+-
+ 	transport_set_supported_SAM_opcode(cmd);
+ 	return ret;
+ 
+@@ -3435,9 +3430,11 @@ int transport_generic_map_mem_to_cmd(
+ }
+ EXPORT_SYMBOL(transport_generic_map_mem_to_cmd);
+ 
+-void *transport_kmap_first_data_page(struct se_cmd *cmd)
++void *transport_kmap_data_sg(struct se_cmd *cmd)
+ {
+ 	struct scatterlist *sg = cmd->t_data_sg;
++	struct page **pages;
++	int i;
+ 
+ 	BUG_ON(!sg);
+ 	/*
+@@ -3445,15 +3442,41 @@ void *transport_kmap_first_data_page(struct se_cmd *cmd)
+ 	 * tcm_loop who may be using a contig buffer from the SCSI midlayer for
+ 	 * control CDBs passed as SGLs via transport_generic_map_mem_to_cmd()
+ 	 */
+-	return kmap(sg_page(sg)) + sg->offset;
++	if (!cmd->t_data_nents)
++		return NULL;
++	else if (cmd->t_data_nents == 1)
++		return kmap(sg_page(sg)) + sg->offset;
++
++	/* >1 page. use vmap */
++	pages = kmalloc(sizeof(*pages) * cmd->t_data_nents, GFP_KERNEL);
++	if (!pages)
++		return NULL;
++
++	/* convert sg[] to pages[] */
++	for_each_sg(cmd->t_data_sg, sg, cmd->t_data_nents, i) {
++		pages[i] = sg_page(sg);
++	}
++
++	cmd->t_data_vmap = vmap(pages, cmd->t_data_nents,  VM_MAP, PAGE_KERNEL);
++	kfree(pages);
++	if (!cmd->t_data_vmap)
++		return NULL;
++
++	return cmd->t_data_vmap + cmd->t_data_sg[0].offset;
+ }
+-EXPORT_SYMBOL(transport_kmap_first_data_page);
++EXPORT_SYMBOL(transport_kmap_data_sg);
+ 
+-void transport_kunmap_first_data_page(struct se_cmd *cmd)
++void transport_kunmap_data_sg(struct se_cmd *cmd)
+ {
+-	kunmap(sg_page(cmd->t_data_sg));
++	if (!cmd->t_data_nents)
++		return;
++	else if (cmd->t_data_nents == 1)
++		kunmap(sg_page(cmd->t_data_sg));
++
++	vunmap(cmd->t_data_vmap);
++	cmd->t_data_vmap = NULL;
+ }
+-EXPORT_SYMBOL(transport_kunmap_first_data_page);
++EXPORT_SYMBOL(transport_kunmap_data_sg);
+ 
+ static int
+ transport_generic_get_mem(struct se_cmd *cmd)
+diff --git a/include/target/target_core_base.h b/include/target/target_core_base.h
+index a79886c..94bbec3 100644
+--- a/include/target/target_core_base.h
++++ b/include/target/target_core_base.h
+@@ -486,6 +486,7 @@ struct se_cmd {
+ 
+ 	struct scatterlist	*t_data_sg;
+ 	unsigned int		t_data_nents;
++	void			*t_data_vmap;
+ 	struct scatterlist	*t_bidi_data_sg;
+ 	unsigned int		t_bidi_data_nents;
+ 
+diff --git a/include/target/target_core_transport.h b/include/target/target_core_transport.h
+index dac4f2d..72751e8 100644
+--- a/include/target/target_core_transport.h
++++ b/include/target/target_core_transport.h
+@@ -129,8 +129,8 @@ extern void transport_init_se_cmd(struct se_cmd *,
+ 					struct target_core_fabric_ops *,
+ 					struct se_session *, u32, int, int,
+ 					unsigned char *);
+-void *transport_kmap_first_data_page(struct se_cmd *cmd);
+-void transport_kunmap_first_data_page(struct se_cmd *cmd);
++void *transport_kmap_data_sg(struct se_cmd *);
++void transport_kunmap_data_sg(struct se_cmd *);
+ extern int transport_generic_allocate_tasks(struct se_cmd *, unsigned char *);
+ extern int transport_handle_cdb_direct(struct se_cmd *);
+ extern int transport_generic_handle_cdb_map(struct se_cmd *);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0046-ASoC-wm8962-Fix-sidetone-enumeration-texts.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0046-ASoC-wm8962-Fix-sidetone-enumeration-texts.patch
new file mode 100644
index 0000000..c0096a2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0046-ASoC-wm8962-Fix-sidetone-enumeration-texts.patch
@@ -0,0 +1,31 @@
+From 8fb548906ee57c17c6a770007075b92b1a9d89b6 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Mon, 13 Feb 2012 22:00:47 -0800
+Subject: [PATCH 46/73] ASoC: wm8962: Fix sidetone enumeration texts
+
+commit 31794bc37bf2db84f085da52b72bfba65739b2d2 upstream.
+
+The sidetone enumeration texts have left and right swapped.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm8962.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
+index d795294..07dd7eb 100644
+--- a/sound/soc/codecs/wm8962.c
++++ b/sound/soc/codecs/wm8962.c
+@@ -2559,7 +2559,7 @@ static int dsp2_event(struct snd_soc_dapm_widget *w,
+ 	return 0;
+ }
+ 
+-static const char *st_text[] = { "None", "Right", "Left" };
++static const char *st_text[] = { "None", "Left", "Right" };
+ 
+ static const struct soc_enum str_enum =
+ 	SOC_ENUM_SINGLE(WM8962_DAC_DSP_MIXING_1, 2, 3, st_text);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0047-ALSA-hda-realtek-Fix-overflow-of-vol-sw-check-bitmap.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0047-ALSA-hda-realtek-Fix-overflow-of-vol-sw-check-bitmap.patch
new file mode 100644
index 0000000..1c12264
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0047-ALSA-hda-realtek-Fix-overflow-of-vol-sw-check-bitmap.patch
@@ -0,0 +1,61 @@
+From 0da0c63e05b5f7de8298753d79304cd137351590 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Thu, 16 Feb 2012 16:38:07 +0100
+Subject: [PATCH 47/73] ALSA: hda/realtek - Fix overflow of vol/sw check
+ bitmap
+
+commit c14c95f62ecb8710af14ae0d48e01991b70bb6f4 upstream.
+
+The bitmap introduced in the commit [527e4d73: ALSA: hda/realtek - Fix
+missing volume controls with ALC260] is too narrow for some codecs,
+which may have more NIDs than 0x20, thus it may overflow the bitmap
+array on them.
+
+Just double the number to cover all and also add a sanity-check code
+to be safer.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_realtek.c |   11 ++++++++---
+ 1 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 9c197d4..ceda0ac 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -79,6 +79,8 @@ enum {
+ 	ALC_AUTOMUTE_MIXER,	/* mute/unmute mixer widget AMP */
+ };
+ 
++#define MAX_VOL_NIDS	0x40
++
+ struct alc_spec {
+ 	/* codec parameterization */
+ 	const struct snd_kcontrol_new *mixers[5];	/* mixer arrays */
+@@ -117,8 +119,8 @@ struct alc_spec {
+ 	const hda_nid_t *capsrc_nids;
+ 	hda_nid_t dig_in_nid;		/* digital-in NID; optional */
+ 	hda_nid_t mixer_nid;		/* analog-mixer NID */
+-	DECLARE_BITMAP(vol_ctls, 0x20 << 1);
+-	DECLARE_BITMAP(sw_ctls, 0x20 << 1);
++	DECLARE_BITMAP(vol_ctls, MAX_VOL_NIDS << 1);
++	DECLARE_BITMAP(sw_ctls, MAX_VOL_NIDS << 1);
+ 
+ 	/* capture setup for dynamic dual-adc switch */
+ 	hda_nid_t cur_adc;
+@@ -3068,7 +3070,10 @@ static int alc_auto_fill_dac_nids(struct hda_codec *codec)
+ static inline unsigned int get_ctl_pos(unsigned int data)
+ {
+ 	hda_nid_t nid = get_amp_nid_(data);
+-	unsigned int dir = get_amp_direction_(data);
++	unsigned int dir;
++	if (snd_BUG_ON(nid >= MAX_VOL_NIDS))
++		return 0;
++	dir = get_amp_direction_(data);
+ 	return (nid << 1) | dir;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0048-ALSA-hda-realtek-Fix-surround-output-regression-on-A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0048-ALSA-hda-realtek-Fix-surround-output-regression-on-A.patch
new file mode 100644
index 0000000..b30fe7a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0048-ALSA-hda-realtek-Fix-surround-output-regression-on-A.patch
@@ -0,0 +1,53 @@
+From 8f421627d178f1346bb68c9e7b32b2bd5844ce1d Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Fri, 17 Feb 2012 10:12:38 +0100
+Subject: [PATCH 48/73] ALSA: hda/realtek - Fix surround output regression on
+ Acer Aspire 5935
+
+commit ef8d60fb79614a86a82720dc2402631dbcafb315 upstream.
+
+The previous fix for the speaker on Acer Aspire 59135 introduced
+another problem for surround outputs.  It changed the connections on
+the line-in/mic pins for limiting the routes, but it left the modified
+connections.  Thus wrong connection indices were written when set to
+4ch or 6ch mode.
+
+This patch fixes it by restoring the right connections just after
+parsing the tree but before the initialization.
+
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=42740
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_realtek.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index ceda0ac..c4c8d78 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -4229,12 +4229,20 @@ static void alc889_fixup_dac_route(struct hda_codec *codec,
+ 				   const struct alc_fixup *fix, int action)
+ {
+ 	if (action == ALC_FIXUP_ACT_PRE_PROBE) {
++		/* fake the connections during parsing the tree */
+ 		hda_nid_t conn1[2] = { 0x0c, 0x0d };
+ 		hda_nid_t conn2[2] = { 0x0e, 0x0f };
+ 		snd_hda_override_conn_list(codec, 0x14, 2, conn1);
+ 		snd_hda_override_conn_list(codec, 0x15, 2, conn1);
+ 		snd_hda_override_conn_list(codec, 0x18, 2, conn2);
+ 		snd_hda_override_conn_list(codec, 0x1a, 2, conn2);
++	} else if (action == ALC_FIXUP_ACT_PROBE) {
++		/* restore the connections */
++		hda_nid_t conn[5] = { 0x0c, 0x0d, 0x0e, 0x0f, 0x26 };
++		snd_hda_override_conn_list(codec, 0x14, 5, conn);
++		snd_hda_override_conn_list(codec, 0x15, 5, conn);
++		snd_hda_override_conn_list(codec, 0x18, 5, conn);
++		snd_hda_override_conn_list(codec, 0x1a, 5, conn);
+ 	}
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0049-NOMMU-Lock-i_mmap_mutex-for-access-to-the-VMA-prio-l.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0049-NOMMU-Lock-i_mmap_mutex-for-access-to-the-VMA-prio-l.patch
new file mode 100644
index 0000000..b8b7003
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0049-NOMMU-Lock-i_mmap_mutex-for-access-to-the-VMA-prio-l.patch
@@ -0,0 +1,76 @@
+From 8f6c3d1a5873d9190bd6259357900ddebc308626 Mon Sep 17 00:00:00 2001
+From: David Howells <dhowells@redhat.com>
+Date: Thu, 23 Feb 2012 13:50:35 +0000
+Subject: [PATCH 49/73] NOMMU: Lock i_mmap_mutex for access to the VMA prio
+ list
+
+commit 918e556ec214ed2f584e4cac56d7b29e4bb6bf27 upstream.
+
+Lock i_mmap_mutex for access to the VMA prio list to prevent concurrent
+access.  Currently, certain parts of the mmap handling are protected by
+the region mutex, but not all.
+
+Reported-by: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: David Howells <dhowells@redhat.com>
+Acked-by: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/nommu.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/mm/nommu.c b/mm/nommu.c
+index b982290..ee7e57e 100644
+--- a/mm/nommu.c
++++ b/mm/nommu.c
+@@ -696,9 +696,11 @@ static void add_vma_to_mm(struct mm_struct *mm, struct vm_area_struct *vma)
+ 	if (vma->vm_file) {
+ 		mapping = vma->vm_file->f_mapping;
+ 
++		mutex_lock(&mapping->i_mmap_mutex);
+ 		flush_dcache_mmap_lock(mapping);
+ 		vma_prio_tree_insert(vma, &mapping->i_mmap);
+ 		flush_dcache_mmap_unlock(mapping);
++		mutex_unlock(&mapping->i_mmap_mutex);
+ 	}
+ 
+ 	/* add the VMA to the tree */
+@@ -760,9 +762,11 @@ static void delete_vma_from_mm(struct vm_area_struct *vma)
+ 	if (vma->vm_file) {
+ 		mapping = vma->vm_file->f_mapping;
+ 
++		mutex_lock(&mapping->i_mmap_mutex);
+ 		flush_dcache_mmap_lock(mapping);
+ 		vma_prio_tree_remove(vma, &mapping->i_mmap);
+ 		flush_dcache_mmap_unlock(mapping);
++		mutex_unlock(&mapping->i_mmap_mutex);
+ 	}
+ 
+ 	/* remove from the MM's tree and list */
+@@ -2052,6 +2056,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
+ 	high = (size + PAGE_SIZE - 1) >> PAGE_SHIFT;
+ 
+ 	down_write(&nommu_region_sem);
++	mutex_lock(&inode->i_mapping->i_mmap_mutex);
+ 
+ 	/* search for VMAs that fall within the dead zone */
+ 	vma_prio_tree_foreach(vma, &iter, &inode->i_mapping->i_mmap,
+@@ -2059,6 +2064,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
+ 		/* found one - only interested if it's shared out of the page
+ 		 * cache */
+ 		if (vma->vm_flags & VM_SHARED) {
++			mutex_unlock(&inode->i_mapping->i_mmap_mutex);
+ 			up_write(&nommu_region_sem);
+ 			return -ETXTBSY; /* not quite true, but near enough */
+ 		}
+@@ -2086,6 +2092,7 @@ int nommu_shrink_inode_mappings(struct inode *inode, size_t size,
+ 		}
+ 	}
+ 
++	mutex_unlock(&inode->i_mapping->i_mmap_mutex);
+ 	up_write(&nommu_region_sem);
+ 	return 0;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0050-hwmon-max6639-Fix-FAN_FROM_REG-calculation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0050-hwmon-max6639-Fix-FAN_FROM_REG-calculation.patch
new file mode 100644
index 0000000..d83fb34
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0050-hwmon-max6639-Fix-FAN_FROM_REG-calculation.patch
@@ -0,0 +1,46 @@
+From 8003623db5dfe0819e0fb83863392d6465569d60 Mon Sep 17 00:00:00 2001
+From: Chris D Schimp <silverchris@gmail.com>
+Date: Mon, 20 Feb 2012 16:59:24 -0500
+Subject: [PATCH 50/73] hwmon: (max6639) Fix FAN_FROM_REG calculation
+
+commit b63d97a36edb1aecf8c13e5f5783feff4d64c24b upstream.
+
+RPM calculation from tachometer value does not depend on PPR.
+Also, do not report negative RPM values.
+
+Signed-off-by: Chris D Schimp <silverchris@gmail.com>
+[guenter.roeck@ericsson.com: do not report negative RPM values]
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Acked-by: Roland Stigge <stigge@antcom.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/max6639.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
+index f20d997..1b844db 100644
+--- a/drivers/hwmon/max6639.c
++++ b/drivers/hwmon/max6639.c
+@@ -72,8 +72,8 @@ static unsigned short normal_i2c[] = { 0x2c, 0x2e, 0x2f, I2C_CLIENT_END };
+ 
+ static const int rpm_ranges[] = { 2000, 4000, 8000, 16000 };
+ 
+-#define FAN_FROM_REG(val, div, rpm_range)	((val) == 0 ? -1 : \
+-	(val) == 255 ? 0 : (rpm_ranges[rpm_range] * 30) / ((div + 1) * (val)))
++#define FAN_FROM_REG(val, rpm_range)	((val) == 0 || (val) == 255 ? \
++				0 : (rpm_ranges[rpm_range] * 30) / (val))
+ #define TEMP_LIMIT_TO_REG(val)	SENSORS_LIMIT((val) / 1000, 0, 255)
+ 
+ /*
+@@ -333,7 +333,7 @@ static ssize_t show_fan_input(struct device *dev,
+ 		return PTR_ERR(data);
+ 
+ 	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index],
+-		       data->ppr, data->rpm_range));
++		       data->rpm_range));
+ }
+ 
+ static ssize_t show_alarm(struct device *dev,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch
new file mode 100644
index 0000000..effff92
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch
@@ -0,0 +1,65 @@
+From b7b3a0104a6e22b03733289ec2665e2acf19170c Mon Sep 17 00:00:00 2001
+From: Chris D Schimp <silverchris@gmail.com>
+Date: Mon, 20 Feb 2012 17:44:59 -0500
+Subject: [PATCH 51/73] hwmon: (max6639) Fix PPR register initialization to
+ set both channels
+
+commit 2f2da1ac0ba5b6cc6e1957c4da5ff20e67d8442b upstream.
+
+Initialize PPR register for both channels, and set correct PPR register bits.
+Also remove unnecessary variable initializations.
+
+Signed-off-by: Chris D Schimp <silverchris@gmail.com>
+[guenter.roeck@ericsson.com: Merged two patches into one]
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Acked-by: Roland Stigge <stigge@antcom.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/max6639.c |   16 +++++++++-------
+ 1 files changed, 9 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/hwmon/max6639.c b/drivers/hwmon/max6639.c
+index 1b844db..8c3df04 100644
+--- a/drivers/hwmon/max6639.c
++++ b/drivers/hwmon/max6639.c
+@@ -429,9 +429,9 @@ static int max6639_init_client(struct i2c_client *client)
+ 	struct max6639_data *data = i2c_get_clientdata(client);
+ 	struct max6639_platform_data *max6639_info =
+ 		client->dev.platform_data;
+-	int i = 0;
++	int i;
+ 	int rpm_range = 1; /* default: 4000 RPM */
+-	int err = 0;
++	int err;
+ 
+ 	/* Reset chip to default values, see below for GCONFIG setup */
+ 	err = i2c_smbus_write_byte_data(client, MAX6639_REG_GCONFIG,
+@@ -446,11 +446,6 @@ static int max6639_init_client(struct i2c_client *client)
+ 	else
+ 		data->ppr = 2;
+ 	data->ppr -= 1;
+-	err = i2c_smbus_write_byte_data(client,
+-			MAX6639_REG_FAN_PPR(i),
+-			data->ppr << 5);
+-	if (err)
+-		goto exit;
+ 
+ 	if (max6639_info)
+ 		rpm_range = rpm_range_to_reg(max6639_info->rpm_range);
+@@ -458,6 +453,13 @@ static int max6639_init_client(struct i2c_client *client)
+ 
+ 	for (i = 0; i < 2; i++) {
+ 
++		/* Set Fan pulse per revolution */
++		err = i2c_smbus_write_byte_data(client,
++				MAX6639_REG_FAN_PPR(i),
++				data->ppr << 6);
++		if (err)
++			goto exit;
++
+ 		/* Fans config PWM, RPM */
+ 		err = i2c_smbus_write_byte_data(client,
+ 			MAX6639_REG_FAN_CONFIG1(i),
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch
new file mode 100644
index 0000000..9d8c30d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch
@@ -0,0 +1,43 @@
+From 4651f6ab6be87e326d7ed3820be6cedfca323e51 Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <guenter.roeck@ericsson.com>
+Date: Wed, 22 Feb 2012 08:13:52 -0800
+Subject: [PATCH 52/73] hwmon: (ads1015) Fix file leak in probe function
+
+commit 363434b5dc352464ac7601547891e5fc9105f124 upstream.
+
+An error while creating sysfs attribute files in the driver's probe function
+results in an error abort, but already created files are not removed. This patch
+fixes the problem.
+
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Cc: Dirk Eibach <eibach@gdsys.de>
+Acked-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/ads1015.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/hwmon/ads1015.c b/drivers/hwmon/ads1015.c
+index eedca3c..dd87ae9 100644
+--- a/drivers/hwmon/ads1015.c
++++ b/drivers/hwmon/ads1015.c
+@@ -271,7 +271,7 @@ static int ads1015_probe(struct i2c_client *client,
+ 			continue;
+ 		err = device_create_file(&client->dev, &ads1015_in[k].dev_attr);
+ 		if (err)
+-			goto exit_free;
++			goto exit_remove;
+ 	}
+ 
+ 	data->hwmon_dev = hwmon_device_register(&client->dev);
+@@ -285,7 +285,6 @@ static int ads1015_probe(struct i2c_client *client,
+ exit_remove:
+ 	for (k = 0; k < ADS1015_CHANNELS; ++k)
+ 		device_remove_file(&client->dev, &ads1015_in[k].dev_attr);
+-exit_free:
+ 	kfree(data);
+ exit:
+ 	return err;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch
new file mode 100644
index 0000000..2366787
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch
@@ -0,0 +1,113 @@
+From 527cba8ab2a3c44aab030065446ebc8dbaa26f9c Mon Sep 17 00:00:00 2001
+From: Russell King <rmk+kernel@arm.linux.org.uk>
+Date: Tue, 7 Feb 2012 09:44:55 +0000
+Subject: [PATCH 53/73] ARM: omap: fix oops in drivers/video/omap2/dss/dpi.c
+
+commit 40410715715178ec196314dd0c19150c06901f80 upstream.
+
+When a PMIC is not found, this driver is unable to obtain its
+'vdds_dsi_reg' regulator.  Even through its initialization function
+fails, other code still calls its enable function, which fails to
+check whether it has this regulator before asking for it to be enabled.
+
+This fixes the oops, however a better fix would be to sort out the
+upper layers to prevent them calling into a module which failed to
+initialize.
+
+Unable to handle kernel NULL pointer dereference at virtual address 00000038
+pgd = c0004000
+[00000038] *pgd=00000000
+Internal error: Oops: 5 [#1] PREEMPT
+Modules linked in:
+CPU: 0    Not tainted  (3.3.0-rc2+ #228)
+PC is at regulator_enable+0x10/0x70
+LR is at omapdss_dpi_display_enable+0x54/0x15c
+pc : [<c01b9a08>]    lr : [<c01af994>]    psr: 60000013
+sp : c181fd90  ip : c181fdb0  fp : c181fdac
+r10: c042eff0  r9 : 00000060  r8 : c044a164
+r7 : c042c0e4  r6 : c042bd60  r5 : 00000000  r4 : c042bd60
+r3 : c084de48  r2 : c181e000  r1 : c042bd60  r0 : 00000000
+Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
+Control: 10c5387d  Table: 80004019  DAC: 00000015
+Process swapper (pid: 1, stack limit = 0xc181e2e8)
+Stack: (0xc181fd90 to 0xc1820000)
+fd80:                                     c001754c c042bd60 00000000 c042bd60
+fda0: c181fdcc c181fdb0 c01af994 c01b9a04 c0016104 c042bd60 c042bd60 c044a338
+fdc0: c181fdec c181fdd0 c01b5ed0 c01af94c c042bd60 c042bd60 c1aa8000 c1aa8a0c
+fde0: c181fe04 c181fdf0 c01b5f54 c01b5ea8 c02fc18c c042bd60 c181fe3c c181fe08
+fe00: c01b2a18 c01b5f48 c01aed14 c02fc160 c01df8ec 00000002 c042bd60 00000003
+fe20: c042bd60 c1aa8000 c1aa8a0c c042eff8 c181fe84 c181fe40 c01b3874 c01b29fc
+fe40: c042eff8 00000000 c042f000 c0449db8 c044ed78 00000000 c181fe74 c042eff8
+fe60: c042eff8 c0449db8 c0449db8 c044ed78 00000000 00000000 c181fe94 c181fe88
+fe80: c01e452c c01b35e8 c181feb4 c181fe98 c01e2fdc c01e4518 c042eff8 c0449db8
+fea0: c0449db8 c181fef0 c181fecc c181feb8 c01e3104 c01e2f48 c042eff8 c042f02c
+fec0: c181feec c181fed0 c01e3190 c01e30c0 c01e311c 00000000 c01e311c c0449db8
+fee0: c181ff14 c181fef0 c01e1998 c01e3128 c18330a8 c1892290 c04165e8 c0449db8
+ff00: c0449db8 c1ab60c0 c181ff24 c181ff18 c01e2e28 c01e194c c181ff54 c181ff28
+ff20: c01e2218 c01e2e14 c039afed c181ff38 c04165e8 c041660c c0449db8 00000013
+ff40: 00000000 c03ffdb8 c181ff7c c181ff58 c01e384c c01e217c c181ff7c c04165e8
+ff60: c041660c c003a37c 00000013 00000000 c181ff8c c181ff80 c01e488c c01e3790
+ff80: c181ff9c c181ff90 c03ffdcc c01e484c c181ffdc c181ffa0 c0008798 c03ffdc4
+ffa0: c181ffc4 c181ffb0 c0056440 c0187810 c003a37c c04165e8 c041660c c003a37c
+ffc0: 00000013 00000000 00000000 00000000 c181fff4 c181ffe0 c03ea284 c0008708
+ffe0: 00000000 c03ea208 00000000 c181fff8 c003a37c c03ea214 1073cec0 01f7ee08
+Backtrace:
+[<c01b99f8>] (regulator_enable+0x0/0x70) from [<c01af994>] (omapdss_dpi_display_enable+0x54/0x15c)
+ r6:c042bd60 r5:00000000 r4:c042bd60
+[<c01af940>] (omapdss_dpi_display_enable+0x0/0x15c) from [<c01b5ed0>] (generic_dpi_panel_power_on+0x34/0x78)
+ r6:c044a338 r5:c042bd60 r4:c042bd60
+[<c01b5e9c>] (generic_dpi_panel_power_on+0x0/0x78) from [<c01b5f54>] (generic_dpi_panel_enable+0x18/0x28)
+ r7:c1aa8a0c r6:c1aa8000 r5:c042bd60 r4:c042bd60
+[<c01b5f3c>] (generic_dpi_panel_enable+0x0/0x28) from [<c01b2a18>] (omapfb_init_display+0x28/0x150)
+ r4:c042bd60
+[<c01b29f0>] (omapfb_init_display+0x0/0x150) from [<c01b3874>] (omapfb_probe+0x298/0x318)
+ r8:c042eff8 r7:c1aa8a0c r6:c1aa8000 r5:c042bd60 r4:00000003
+[<c01b35dc>] (omapfb_probe+0x0/0x318) from [<c01e452c>] (platform_drv_probe+0x20/0x24)
+[<c01e450c>] (platform_drv_probe+0x0/0x24) from [<c01e2fdc>] (really_probe+0xa0/0x178)
+[<c01e2f3c>] (really_probe+0x0/0x178) from [<c01e3104>] (driver_probe_device+0x50/0x68)
+ r7:c181fef0 r6:c0449db8 r5:c0449db8 r4:c042eff8
+[<c01e30b4>] (driver_probe_device+0x0/0x68) from [<c01e3190>] (__driver_attach+0x74/0x98)
+ r5:c042f02c r4:c042eff8
+[<c01e311c>] (__driver_attach+0x0/0x98) from [<c01e1998>] (bus_for_each_dev+0x58/0x98)
+ r6:c0449db8 r5:c01e311c r4:00000000
+[<c01e1940>] (bus_for_each_dev+0x0/0x98) from [<c01e2e28>] (driver_attach+0x20/0x28)
+ r7:c1ab60c0 r6:c0449db8 r5:c0449db8 r4:c04165e8
+[<c01e2e08>] (driver_attach+0x0/0x28) from [<c01e2218>] (bus_add_driver+0xa8/0x22c)
+[<c01e2170>] (bus_add_driver+0x0/0x22c) from [<c01e384c>] (driver_register+0xc8/0x154)
+[<c01e3784>] (driver_register+0x0/0x154) from [<c01e488c>] (platform_driver_register+0x4c/0x60)
+ r8:00000000 r7:00000013 r6:c003a37c r5:c041660c r4:c04165e8
+[<c01e4840>] (platform_driver_register+0x0/0x60) from [<c03ffdcc>] (omapfb_init+0x14/0x34)
+[<c03ffdb8>] (omapfb_init+0x0/0x34) from [<c0008798>] (do_one_initcall+0x9c/0x164)
+[<c00086fc>] (do_one_initcall+0x0/0x164) from [<c03ea284>] (kernel_init+0x7c/0x120)
+[<c03ea208>] (kernel_init+0x0/0x120) from [<c003a37c>] (do_exit+0x0/0x2d8)
+ r5:c03ea208 r4:00000000
+Code: e1a0c00d e92dd870 e24cb004 e24dd004 (e5906038)
+---[ end trace 9e2474c2e193b223 ]---
+
+Acked-by: Tony Lindgren <tony@atomide.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Cc: Igor Grinberg <grinberg@compulab.co.il>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/video/omap2/dss/dpi.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/video/omap2/dss/dpi.c b/drivers/video/omap2/dss/dpi.c
+index 976ac23..c04205c 100644
+--- a/drivers/video/omap2/dss/dpi.c
++++ b/drivers/video/omap2/dss/dpi.c
+@@ -180,6 +180,11 @@ int omapdss_dpi_display_enable(struct omap_dss_device *dssdev)
+ {
+ 	int r;
+ 
++	if (cpu_is_omap34xx() && !dpi.vdds_dsi_reg) {
++		DSSERR("no VDSS_DSI regulator\n");
++		return -ENODEV;
++	}
++
+ 	if (dssdev->manager == NULL) {
+ 		DSSERR("failed to enable display: no manager\n");
+ 		return -ENODEV;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch
new file mode 100644
index 0000000..6d70b40
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch
@@ -0,0 +1,74 @@
+From 758e4d3da5bc2a30a7618cb8f1710e096dac0e53 Mon Sep 17 00:00:00 2001
+From: Russell King <rmk+kernel@arm.linux.org.uk>
+Date: Tue, 7 Feb 2012 09:42:11 +0000
+Subject: [PATCH 54/73] ARM: omap: fix oops in arch/arm/mach-omap2/vp.c when
+ pmic is not found
+
+commit d980e0f8d858c6963d676013e976ff00ab7acb2b upstream.
+
+When the PMIC is not found, voltdm->pmic will be NULL.  vp.c's
+initialization function tries to dereferences this, which causes an
+oops:
+
+Unable to handle kernel NULL pointer dereference at virtual address 00000000
+pgd = c0004000
+[00000000] *pgd=00000000
+Internal error: Oops: 5 [#1] PREEMPT
+Modules linked in:
+CPU: 0    Not tainted  (3.3.0-rc2+ #204)
+PC is at omap_vp_init+0x5c/0x15c
+LR is at omap_vp_init+0x58/0x15c
+pc : [<c03db880>]    lr : [<c03db87c>]    psr: 60000013
+sp : c181ff30  ip : c181ff68  fp : c181ff64
+r10: c0407808  r9 : c040786c  r8 : c0407814
+r7 : c0026868  r6 : c00264fc  r5 : c040ad6c  r4 : 00000000
+r3 : 00000040  r2 : 000032c8  r1 : 0000fa00  r0 : 000032c8
+Flags: nZCv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment kernel
+Control: 10c5387d  Table: 80004019  DAC: 00000015
+Process swapper (pid: 1, stack limit = 0xc181e2e8)
+Stack: (0xc181ff30 to 0xc1820000)
+ff20:                                     c0381d00 c02e9c6d c0383582 c040786c
+ff40: c040ad6c c00264fc c0026868 c0407814 00000000 c03d9de4 c181ff8c c181ff68
+ff60: c03db448 c03db830 c02e982c c03fdfb8 c03fe004 c0039988 00000013 00000000
+ff80: c181ff9c c181ff90 c03d9df8 c03db390 c181ffdc c181ffa0 c0008798 c03d9df0
+ffa0: c181ffc4 c181ffb0 c0055a44 c0187050 c0039988 c03fdfb8 c03fe004 c0039988
+ffc0: 00000013 00000000 00000000 00000000 c181fff4 c181ffe0 c03d1284 c0008708
+ffe0: 00000000 c03d1208 00000000 c181fff8 c0039988 c03d1214 1077ce40 01f7ee08
+Backtrace:
+[<c03db824>] (omap_vp_init+0x0/0x15c) from [<c03db448>] (omap_voltage_late_init+0xc4/0xfc)
+[<c03db384>] (omap_voltage_late_init+0x0/0xfc) from [<c03d9df8>] (omap2_common_pm_late_init+0x14/0x54)
+ r8:00000000 r7:00000013 r6:c0039988 r5:c03fe004 r4:c03fdfb8
+[<c03d9de4>] (omap2_common_pm_late_init+0x0/0x54) from [<c0008798>] (do_one_initcall+0x9c/0x164)
+[<c00086fc>] (do_one_initcall+0x0/0x164) from [<c03d1284>] (kernel_init+0x7c/0x120)
+[<c03d1208>] (kernel_init+0x0/0x120) from [<c0039988>] (do_exit+0x0/0x2cc)
+ r5:c03d1208 r4:00000000
+Code: e5ca300b e5900034 ebf69027 e5994024 (e5941000)
+---[ end trace aed617dddaf32c3d ]---
+Kernel panic - not syncing: Attempted to kill init!
+
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Cc: Igor Grinberg <grinberg@compulab.co.il>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mach-omap2/vp.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/vp.c b/arch/arm/mach-omap2/vp.c
+index 66bd700..3b52027 100644
+--- a/arch/arm/mach-omap2/vp.c
++++ b/arch/arm/mach-omap2/vp.c
+@@ -41,6 +41,11 @@ void __init omap_vp_init(struct voltagedomain *voltdm)
+ 	u32 val, sys_clk_rate, timeout, waittime;
+ 	u32 vddmin, vddmax, vstepmin, vstepmax;
+ 
++	if (!voltdm->pmic || !voltdm->pmic->uv_to_vsel) {
++		pr_err("%s: No PMIC info for vdd_%s\n", __func__, voltdm->name);
++		return;
++	}
++
+ 	if (!voltdm->read || !voltdm->write) {
+ 		pr_err("%s: No read/write API for accessing vdd_%s regs\n",
+ 			__func__, voltdm->name);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch
new file mode 100644
index 0000000..4a6f533
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch
@@ -0,0 +1,100 @@
+From 03fedc5c56706c1bd0528a2dfab590f3b7cd9d1d Mon Sep 17 00:00:00 2001
+From: Andreas Herrmann <andreas.herrmann3@amd.com>
+Date: Wed, 8 Feb 2012 20:52:29 +0100
+Subject: [PATCH 55/73] x86/amd: Fix L1i and L2 cache sharing information for
+ AMD family 15h processors
+
+commit 32c3233885eb10ac9cb9410f2f8cd64b8df2b2a1 upstream.
+
+For L1 instruction cache and L2 cache the shared CPU information
+is wrong. On current AMD family 15h CPUs those caches are shared
+between both cores of a compute unit.
+
+This fixes https://bugzilla.kernel.org/show_bug.cgi?id=42607
+
+Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
+Cc: Petkov Borislav <Borislav.Petkov@amd.com>
+Cc: Dave Jones <davej@redhat.com>
+Link: http://lkml.kernel.org/r/20120208195229.GA17523@alberich.amd.com
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/cpu/intel_cacheinfo.c |   44 +++++++++++++++++++++++++++------
+ 1 files changed, 36 insertions(+), 8 deletions(-)
+
+diff --git a/arch/x86/kernel/cpu/intel_cacheinfo.c b/arch/x86/kernel/cpu/intel_cacheinfo.c
+index a3b0811..0e89635 100644
+--- a/arch/x86/kernel/cpu/intel_cacheinfo.c
++++ b/arch/x86/kernel/cpu/intel_cacheinfo.c
+@@ -326,8 +326,7 @@ static void __cpuinit amd_calc_l3_indices(struct amd_northbridge *nb)
+ 	l3->indices = (max(max3(sc0, sc1, sc2), sc3) << 10) - 1;
+ }
+ 
+-static void __cpuinit amd_init_l3_cache(struct _cpuid4_info_regs *this_leaf,
+-					int index)
++static void __cpuinit amd_init_l3_cache(struct _cpuid4_info_regs *this_leaf, int index)
+ {
+ 	int node;
+ 
+@@ -725,14 +724,16 @@ static DEFINE_PER_CPU(struct _cpuid4_info *, ici_cpuid4_info);
+ #define CPUID4_INFO_IDX(x, y)	(&((per_cpu(ici_cpuid4_info, x))[y]))
+ 
+ #ifdef CONFIG_SMP
+-static void __cpuinit cache_shared_cpu_map_setup(unsigned int cpu, int index)
++
++static int __cpuinit cache_shared_amd_cpu_map_setup(unsigned int cpu, int index)
+ {
+-	struct _cpuid4_info	*this_leaf, *sibling_leaf;
+-	unsigned long num_threads_sharing;
+-	int index_msb, i, sibling;
++	struct _cpuid4_info *this_leaf;
++	int ret, i, sibling;
+ 	struct cpuinfo_x86 *c = &cpu_data(cpu);
+ 
+-	if ((index == 3) && (c->x86_vendor == X86_VENDOR_AMD)) {
++	ret = 0;
++	if (index == 3) {
++		ret = 1;
+ 		for_each_cpu(i, cpu_llc_shared_mask(cpu)) {
+ 			if (!per_cpu(ici_cpuid4_info, i))
+ 				continue;
+@@ -743,8 +744,35 @@ static void __cpuinit cache_shared_cpu_map_setup(unsigned int cpu, int index)
+ 				set_bit(sibling, this_leaf->shared_cpu_map);
+ 			}
+ 		}
+-		return;
++	} else if ((c->x86 == 0x15) && ((index == 1) || (index == 2))) {
++		ret = 1;
++		for_each_cpu(i, cpu_sibling_mask(cpu)) {
++			if (!per_cpu(ici_cpuid4_info, i))
++				continue;
++			this_leaf = CPUID4_INFO_IDX(i, index);
++			for_each_cpu(sibling, cpu_sibling_mask(cpu)) {
++				if (!cpu_online(sibling))
++					continue;
++				set_bit(sibling, this_leaf->shared_cpu_map);
++			}
++		}
+ 	}
++
++	return ret;
++}
++
++static void __cpuinit cache_shared_cpu_map_setup(unsigned int cpu, int index)
++{
++	struct _cpuid4_info *this_leaf, *sibling_leaf;
++	unsigned long num_threads_sharing;
++	int index_msb, i;
++	struct cpuinfo_x86 *c = &cpu_data(cpu);
++
++	if (c->x86_vendor == X86_VENDOR_AMD) {
++		if (cache_shared_amd_cpu_map_setup(cpu, index))
++			return;
++	}
++
+ 	this_leaf = CPUID4_INFO_IDX(cpu, index);
+ 	num_threads_sharing = 1 + this_leaf->base.eax.split.num_threads_sharing;
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch
new file mode 100644
index 0000000..eb8d50a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch
@@ -0,0 +1,41 @@
+From 72633f08ad74b93530b8e038041c450492a00ed5 Mon Sep 17 00:00:00 2001
+From: Pavel Roskin <proski@gnu.org>
+Date: Sat, 11 Feb 2012 10:01:53 -0500
+Subject: [PATCH 56/73] ath9k: stop on rates with idx -1 in ath9k rate
+ control's .tx_status
+
+commit 2504a6423b9ab4c36df78227055995644de19edb upstream.
+
+Rate control algorithms are supposed to stop processing when they
+encounter a rate with the index -1.  Checking for rate->count not being
+zero is not enough.
+
+Allowing a rate with negative index leads to memory corruption in
+ath_debug_stat_rc().
+
+One consequence of the bug is discussed at
+https://bugzilla.redhat.com/show_bug.cgi?id=768639
+
+Signed-off-by: Pavel Roskin <proski@gnu.org>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/ath/ath9k/rc.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/rc.c b/drivers/net/wireless/ath/ath9k/rc.c
+index 528d5f3..64af11f 100644
+--- a/drivers/net/wireless/ath/ath9k/rc.c
++++ b/drivers/net/wireless/ath/ath9k/rc.c
+@@ -1347,7 +1347,7 @@ static void ath_tx_status(void *priv, struct ieee80211_supported_band *sband,
+ 	fc = hdr->frame_control;
+ 	for (i = 0; i < sc->hw->max_rates; i++) {
+ 		struct ieee80211_tx_rate *rate = &tx_info->status.rates[i];
+-		if (!rate->count)
++		if (rate->idx < 0 || !rate->count)
+ 			break;
+ 
+ 		final_ts_idx = i;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch
new file mode 100644
index 0000000..247270a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch
@@ -0,0 +1,81 @@
+From aa0eb3474beae8f6d9dcc2311dc02bea50cfd7b7 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Tue, 7 Feb 2012 17:58:03 +0100
+Subject: [PATCH 57/73] genirq: Unmask oneshot irqs when thread was not woken
+
+commit ac5637611150281f398bb7a47e3fcb69a09e7803 upstream.
+
+When the primary handler of an interrupt which is marked IRQ_ONESHOT
+returns IRQ_HANDLED or IRQ_NONE, then the interrupt thread is not
+woken and the unmask logic of the interrupt line is never
+invoked. This keeps the interrupt masked forever.
+
+This was not noticed as most IRQ_ONESHOT users wake the thread
+unconditionally (usually because they cannot access the underlying
+device from hard interrupt context). Though this behaviour was nowhere
+documented and not necessarily intentional. Some drivers can avoid the
+thread wakeup in certain cases and run into the situation where the
+interrupt line s kept masked.
+
+Handle it gracefully.
+
+Reported-and-tested-by: Lothar Wassmann <lw@karo-electronics.de>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/irq/chip.c |   25 +++++++++++++++++++++++--
+ 1 files changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
+index f7c543a..b742edc 100644
+--- a/kernel/irq/chip.c
++++ b/kernel/irq/chip.c
+@@ -330,6 +330,24 @@ out_unlock:
+ }
+ EXPORT_SYMBOL_GPL(handle_simple_irq);
+ 
++/*
++ * Called unconditionally from handle_level_irq() and only for oneshot
++ * interrupts from handle_fasteoi_irq()
++ */
++static void cond_unmask_irq(struct irq_desc *desc)
++{
++	/*
++	 * We need to unmask in the following cases:
++	 * - Standard level irq (IRQF_ONESHOT is not set)
++	 * - Oneshot irq which did not wake the thread (caused by a
++	 *   spurious interrupt or a primary handler handling it
++	 *   completely).
++	 */
++	if (!irqd_irq_disabled(&desc->irq_data) &&
++	    irqd_irq_masked(&desc->irq_data) && !desc->threads_oneshot)
++		unmask_irq(desc);
++}
++
+ /**
+  *	handle_level_irq - Level type irq handler
+  *	@irq:	the interrupt number
+@@ -362,8 +380,8 @@ handle_level_irq(unsigned int irq, struct irq_desc *desc)
+ 
+ 	handle_irq_event(desc);
+ 
+-	if (!irqd_irq_disabled(&desc->irq_data) && !(desc->istate & IRQS_ONESHOT))
+-		unmask_irq(desc);
++	cond_unmask_irq(desc);
++
+ out_unlock:
+ 	raw_spin_unlock(&desc->lock);
+ }
+@@ -417,6 +435,9 @@ handle_fasteoi_irq(unsigned int irq, struct irq_desc *desc)
+ 	preflow_handler(desc);
+ 	handle_irq_event(desc);
+ 
++	if (desc->istate & IRQS_ONESHOT)
++		cond_unmask_irq(desc);
++
+ out_eoi:
+ 	desc->irq_data.chip->irq_eoi(&desc->irq_data);
+ out_unlock:
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0058-genirq-Handle-pending-irqs-in-irq_startup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0058-genirq-Handle-pending-irqs-in-irq_startup.patch
new file mode 100644
index 0000000..4569e02
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0058-genirq-Handle-pending-irqs-in-irq_startup.patch
@@ -0,0 +1,117 @@
+From 37ef0e621b065f2d9e1c37ff42a37d6bd74bf039 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Wed, 8 Feb 2012 11:57:52 +0100
+Subject: [PATCH 58/73] genirq: Handle pending irqs in irq_startup()
+
+commit b4bc724e82e80478cba5fe9825b62e71ddf78757 upstream.
+
+An interrupt might be pending when irq_startup() is called, but the
+startup code does not invoke the resend logic. In some cases this
+prevents the device from issuing another interrupt which renders the
+device non functional.
+
+Call the resend function in irq_startup() to keep things going.
+
+Reported-and-tested-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/irq/autoprobe.c |    4 ++--
+ kernel/irq/chip.c      |   17 ++++++++++-------
+ kernel/irq/internals.h |    2 +-
+ kernel/irq/manage.c    |    2 +-
+ 4 files changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/kernel/irq/autoprobe.c b/kernel/irq/autoprobe.c
+index 342d8f4..0119b9d 100644
+--- a/kernel/irq/autoprobe.c
++++ b/kernel/irq/autoprobe.c
+@@ -53,7 +53,7 @@ unsigned long probe_irq_on(void)
+ 			if (desc->irq_data.chip->irq_set_type)
+ 				desc->irq_data.chip->irq_set_type(&desc->irq_data,
+ 							 IRQ_TYPE_PROBE);
+-			irq_startup(desc);
++			irq_startup(desc, false);
+ 		}
+ 		raw_spin_unlock_irq(&desc->lock);
+ 	}
+@@ -70,7 +70,7 @@ unsigned long probe_irq_on(void)
+ 		raw_spin_lock_irq(&desc->lock);
+ 		if (!desc->action && irq_settings_can_probe(desc)) {
+ 			desc->istate |= IRQS_AUTODETECT | IRQS_WAITING;
+-			if (irq_startup(desc))
++			if (irq_startup(desc, false))
+ 				desc->istate |= IRQS_PENDING;
+ 		}
+ 		raw_spin_unlock_irq(&desc->lock);
+diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
+index b742edc..fb7db75 100644
+--- a/kernel/irq/chip.c
++++ b/kernel/irq/chip.c
+@@ -157,19 +157,22 @@ static void irq_state_set_masked(struct irq_desc *desc)
+ 	irqd_set(&desc->irq_data, IRQD_IRQ_MASKED);
+ }
+ 
+-int irq_startup(struct irq_desc *desc)
++int irq_startup(struct irq_desc *desc, bool resend)
+ {
++	int ret = 0;
++
+ 	irq_state_clr_disabled(desc);
+ 	desc->depth = 0;
+ 
+ 	if (desc->irq_data.chip->irq_startup) {
+-		int ret = desc->irq_data.chip->irq_startup(&desc->irq_data);
++		ret = desc->irq_data.chip->irq_startup(&desc->irq_data);
+ 		irq_state_clr_masked(desc);
+-		return ret;
++	} else {
++		irq_enable(desc);
+ 	}
+-
+-	irq_enable(desc);
+-	return 0;
++	if (resend)
++		check_irq_resend(desc, desc->irq_data.irq);
++	return ret;
+ }
+ 
+ void irq_shutdown(struct irq_desc *desc)
+@@ -646,7 +649,7 @@ __irq_set_handler(unsigned int irq, irq_flow_handler_t handle, int is_chained,
+ 		irq_settings_set_noprobe(desc);
+ 		irq_settings_set_norequest(desc);
+ 		irq_settings_set_nothread(desc);
+-		irq_startup(desc);
++		irq_startup(desc, true);
+ 	}
+ out:
+ 	irq_put_desc_busunlock(desc, flags);
+diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
+index a73dd6c..e1a8b64 100644
+--- a/kernel/irq/internals.h
++++ b/kernel/irq/internals.h
+@@ -67,7 +67,7 @@ extern int __irq_set_trigger(struct irq_desc *desc, unsigned int irq,
+ extern void __disable_irq(struct irq_desc *desc, unsigned int irq, bool susp);
+ extern void __enable_irq(struct irq_desc *desc, unsigned int irq, bool resume);
+ 
+-extern int irq_startup(struct irq_desc *desc);
++extern int irq_startup(struct irq_desc *desc, bool resend);
+ extern void irq_shutdown(struct irq_desc *desc);
+ extern void irq_enable(struct irq_desc *desc);
+ extern void irq_disable(struct irq_desc *desc);
+diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
+index 1da999f..cf2d7ae 100644
+--- a/kernel/irq/manage.c
++++ b/kernel/irq/manage.c
+@@ -1027,7 +1027,7 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
+ 			desc->istate |= IRQS_ONESHOT;
+ 
+ 		if (irq_settings_can_autoenable(desc))
+-			irq_startup(desc);
++			irq_startup(desc, true);
+ 		else
+ 			/* Undo nested disables: */
+ 			desc->depth = 1;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0059-scsi_scan-Fix-Poison-overwritten-warning-caused-by-u.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0059-scsi_scan-Fix-Poison-overwritten-warning-caused-by-u.patch
new file mode 100644
index 0000000..1f9fcd1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0059-scsi_scan-Fix-Poison-overwritten-warning-caused-by-u.patch
@@ -0,0 +1,104 @@
+From 0234f0569820c617e90b0ced54a345705cee031b Mon Sep 17 00:00:00 2001
+From: Huajun Li <huajun.li.lee@gmail.com>
+Date: Sun, 12 Feb 2012 19:59:14 +0800
+Subject: [PATCH 59/73] scsi_scan: Fix 'Poison overwritten' warning caused by
+ using freed 'shost'
+
+commit 267a6ad4aefaafbde607804c60945bcf97f91c1b upstream.
+
+In do_scan_async(), calling scsi_autopm_put_host(shost) may reference
+freed shost, and cause Posison overwitten warning.
+Yes, this case can happen, for example, an USB is disconnected just
+when do_scan_async() thread starts to run, then scsi_host_put() called
+in scsi_finish_async_scan() will lead to shost be freed(because the
+refcount of shost->shost_gendev decreases to 1 after USB disconnects),
+at this point, if references shost again, system will show following
+warning msg.
+
+To make scsi_autopm_put_host(shost) always reference a valid shost,
+put it just before scsi_host_put() in function
+scsi_finish_async_scan().
+
+[  299.281565] =============================================================================
+[  299.281634] BUG kmalloc-4096 (Tainted: G          I ): Poison overwritten
+[  299.281682] -----------------------------------------------------------------------------
+[  299.281684]
+[  299.281752] INFO: 0xffff880056c305d0-0xffff880056c305d0. First byte
+0x6a instead of 0x6b
+[  299.281816] INFO: Allocated in scsi_host_alloc+0x4a/0x490 age=1688
+cpu=1 pid=2004
+[  299.281870] 	__slab_alloc+0x617/0x6c1
+[  299.281901] 	__kmalloc+0x28c/0x2e0
+[  299.281931] 	scsi_host_alloc+0x4a/0x490
+[  299.281966] 	usb_stor_probe1+0x5b/0xc40 [usb_storage]
+[  299.282010] 	storage_probe+0xa4/0xe0 [usb_storage]
+[  299.282062] 	usb_probe_interface+0x172/0x330 [usbcore]
+[  299.282105] 	driver_probe_device+0x257/0x3b0
+[  299.282138] 	__driver_attach+0x103/0x110
+[  299.282171] 	bus_for_each_dev+0x8e/0xe0
+[  299.282201] 	driver_attach+0x26/0x30
+[  299.282230] 	bus_add_driver+0x1c4/0x430
+[  299.282260] 	driver_register+0xb6/0x230
+[  299.282298] 	usb_register_driver+0xe5/0x270 [usbcore]
+[  299.282337] 	0xffffffffa04ab03d
+[  299.282364] 	do_one_initcall+0x47/0x230
+[  299.282396] 	sys_init_module+0xa0f/0x1fe0
+[  299.282429] INFO: Freed in scsi_host_dev_release+0x18a/0x1d0 age=85
+cpu=0 pid=2008
+[  299.282482] 	__slab_free+0x3c/0x2a1
+[  299.282510] 	kfree+0x296/0x310
+[  299.282536] 	scsi_host_dev_release+0x18a/0x1d0
+[  299.282574] 	device_release+0x74/0x100
+[  299.282606] 	kobject_release+0xc7/0x2a0
+[  299.282637] 	kobject_put+0x54/0xa0
+[  299.282668] 	put_device+0x27/0x40
+[  299.282694] 	scsi_host_put+0x1d/0x30
+[  299.282723] 	do_scan_async+0x1fc/0x2b0
+[  299.282753] 	kthread+0xdf/0xf0
+[  299.282782] 	kernel_thread_helper+0x4/0x10
+[  299.282817] INFO: Slab 0xffffea00015b0c00 objects=7 used=7 fp=0x
+      (null) flags=0x100000000004080
+[  299.282882] INFO: Object 0xffff880056c30000 @offset=0 fp=0x          (null)
+[  299.282884]
+...
+
+Signed-off-by: Huajun Li <huajun.li.lee@gmail.com>
+Acked-by: Alan Stern <stern@rowland.harvard.edu>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/scsi/scsi_scan.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
+index b3c6d95..6e7ea4a 100644
+--- a/drivers/scsi/scsi_scan.c
++++ b/drivers/scsi/scsi_scan.c
+@@ -1815,6 +1815,7 @@ static void scsi_finish_async_scan(struct async_scan_data *data)
+ 	}
+ 	spin_unlock(&async_scan_lock);
+ 
++	scsi_autopm_put_host(shost);
+ 	scsi_host_put(shost);
+ 	kfree(data);
+ }
+@@ -1841,7 +1842,6 @@ static int do_scan_async(void *_data)
+ 
+ 	do_scsi_scan_host(shost);
+ 	scsi_finish_async_scan(data);
+-	scsi_autopm_put_host(shost);
+ 	return 0;
+ }
+ 
+@@ -1869,7 +1869,7 @@ void scsi_scan_host(struct Scsi_Host *shost)
+ 	p = kthread_run(do_scan_async, data, "scsi_scan_%d", shost->host_no);
+ 	if (IS_ERR(p))
+ 		do_scan_async(data);
+-	/* scsi_autopm_put_host(shost) is called in do_scan_async() */
++	/* scsi_autopm_put_host(shost) is called in scsi_finish_async_scan() */
+ }
+ EXPORT_SYMBOL(scsi_scan_host);
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0060-scsi_pm-Fix-bug-in-the-SCSI-power-management-handler.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0060-scsi_pm-Fix-bug-in-the-SCSI-power-management-handler.patch
new file mode 100644
index 0000000..9eb67f6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0060-scsi_pm-Fix-bug-in-the-SCSI-power-management-handler.patch
@@ -0,0 +1,106 @@
+From 8c1c1c37c29906c94fb030261e1687c8197cc2af Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Fri, 17 Feb 2012 16:25:08 -0500
+Subject: [PATCH 60/73] scsi_pm: Fix bug in the SCSI power management handler
+
+commit fea6d607e154cf96ab22254ccb48addfd43d4cb5 upstream.
+
+This patch (as1520) fixes a bug in the SCSI layer's power management
+implementation.
+
+LUN scanning can be carried out asynchronously in do_scan_async(), and
+sd uses an asynchronous thread for the time-consuming parts of disk
+probing in sd_probe_async().  Currently nothing coordinates these
+async threads with system sleep transitions; they can and do attempt
+to continue scanning/probing SCSI devices even after the host adapter
+has been suspended.  As one might expect, the outcome is not ideal.
+
+This is what the "prepare" stage of system suspend was created for.
+After the prepare callback has been called for a host, target, or
+device, drivers are not allowed to register any children underneath
+them.  Currently the SCSI prepare callback is not implemented; this
+patch rectifies that omission.
+
+For SCSI hosts, the prepare routine calls scsi_complete_async_scans()
+to wait until async scanning is finished.  It might be slightly more
+efficient to wait only until the host in question has been scanned,
+but there's currently no way to do that.  Besides, during a sleep
+transition we will ultimately have to wait until all the host scanning
+has finished anyway.
+
+For SCSI devices, the prepare routine calls async_synchronize_full()
+to wait until sd probing is finished.  The routine does nothing for
+SCSI targets, because asynchronous target scanning is done only as
+part of host scanning.
+
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/scsi/scsi_pm.c   |   16 ++++++++++++++++
+ drivers/scsi/scsi_priv.h |    1 +
+ 2 files changed, 17 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/scsi/scsi_pm.c b/drivers/scsi/scsi_pm.c
+index d329f8b..2aeaf5c 100644
+--- a/drivers/scsi/scsi_pm.c
++++ b/drivers/scsi/scsi_pm.c
+@@ -7,6 +7,7 @@
+ 
+ #include <linux/pm_runtime.h>
+ #include <linux/export.h>
++#include <linux/async.h>
+ 
+ #include <scsi/scsi.h>
+ #include <scsi/scsi_device.h>
+@@ -69,6 +70,19 @@ static int scsi_bus_resume_common(struct device *dev)
+ 	return err;
+ }
+ 
++static int scsi_bus_prepare(struct device *dev)
++{
++	if (scsi_is_sdev_device(dev)) {
++		/* sd probing uses async_schedule.  Wait until it finishes. */
++		async_synchronize_full();
++
++	} else if (scsi_is_host_device(dev)) {
++		/* Wait until async scanning is finished */
++		scsi_complete_async_scans();
++	}
++	return 0;
++}
++
+ static int scsi_bus_suspend(struct device *dev)
+ {
+ 	return scsi_bus_suspend_common(dev, PMSG_SUSPEND);
+@@ -87,6 +101,7 @@ static int scsi_bus_poweroff(struct device *dev)
+ #else /* CONFIG_PM_SLEEP */
+ 
+ #define scsi_bus_resume_common		NULL
++#define scsi_bus_prepare		NULL
+ #define scsi_bus_suspend		NULL
+ #define scsi_bus_freeze			NULL
+ #define scsi_bus_poweroff		NULL
+@@ -195,6 +210,7 @@ void scsi_autopm_put_host(struct Scsi_Host *shost)
+ #endif /* CONFIG_PM_RUNTIME */
+ 
+ const struct dev_pm_ops scsi_bus_pm_ops = {
++	.prepare =		scsi_bus_prepare,
+ 	.suspend =		scsi_bus_suspend,
+ 	.resume =		scsi_bus_resume_common,
+ 	.freeze =		scsi_bus_freeze,
+diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
+index 2a58895..5b475d0 100644
+--- a/drivers/scsi/scsi_priv.h
++++ b/drivers/scsi/scsi_priv.h
+@@ -110,6 +110,7 @@ extern void scsi_exit_procfs(void);
+ #endif /* CONFIG_PROC_FS */
+ 
+ /* scsi_scan.c */
++extern int scsi_complete_async_scans(void);
+ extern int scsi_scan_host_selected(struct Scsi_Host *, unsigned int,
+ 				   unsigned int, unsigned int, int);
+ extern void scsi_forget_host(struct Scsi_Host *);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0061-ipvs-fix-matching-of-fwmark-templates-during-schedul.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0061-ipvs-fix-matching-of-fwmark-templates-during-schedul.patch
new file mode 100644
index 0000000..ed64dbc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0061-ipvs-fix-matching-of-fwmark-templates-during-schedul.patch
@@ -0,0 +1,47 @@
+From 9b83c78d644ae794f0ec3cf7a4722c613b947913 Mon Sep 17 00:00:00 2001
+From: Simon Horman <horms@verge.net.au>
+Date: Fri, 27 Jan 2012 10:45:27 +0900
+Subject: [PATCH 61/73] ipvs: fix matching of fwmark templates during
+ scheduling
+
+commit e0aac52e17a3db68fe2ceae281780a70fc69957f upstream.
+
+	Commit f11017ec2d1859c661f4e2b12c4a8d250e1f47cf (2.6.37)
+moved the fwmark variable in subcontext that is invalidated before
+reaching the ip_vs_ct_in_get call. As vaddr is provided as pointer
+in the param structure make sure the fwmark variable is in
+same context. As the fwmark templates can not be matched,
+more and more template connections are created and the
+controlled connections can not go to single real server.
+
+Signed-off-by: Julian Anastasov <ja@ssi.bg>
+Signed-off-by: Simon Horman <horms@verge.net.au>
+Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/netfilter/ipvs/ip_vs_core.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/net/netfilter/ipvs/ip_vs_core.c b/net/netfilter/ipvs/ip_vs_core.c
+index 093cc32..6dc7d7d 100644
+--- a/net/netfilter/ipvs/ip_vs_core.c
++++ b/net/netfilter/ipvs/ip_vs_core.c
+@@ -232,6 +232,7 @@ ip_vs_sched_persist(struct ip_vs_service *svc,
+ 	__be16 dport = 0;		/* destination port to forward */
+ 	unsigned int flags;
+ 	struct ip_vs_conn_param param;
++	const union nf_inet_addr fwmark = { .ip = htonl(svc->fwmark) };
+ 	union nf_inet_addr snet;	/* source network of the client,
+ 					   after masking */
+ 
+@@ -267,7 +268,6 @@ ip_vs_sched_persist(struct ip_vs_service *svc,
+ 	{
+ 		int protocol = iph.protocol;
+ 		const union nf_inet_addr *vaddr = &iph.daddr;
+-		const union nf_inet_addr fwmark = { .ip = htonl(svc->fwmark) };
+ 		__be16 vport = 0;
+ 
+ 		if (dst_port == svc->port) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0062-jme-Fix-FIFO-flush-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0062-jme-Fix-FIFO-flush-issue.patch
new file mode 100644
index 0000000..6efc1c2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0062-jme-Fix-FIFO-flush-issue.patch
@@ -0,0 +1,63 @@
+From 5fbc730462e4c65e83bc343c4d3f97292b867ff7 Mon Sep 17 00:00:00 2001
+From: Guo-Fu Tseng <cooldavid@cooldavid.org>
+Date: Wed, 22 Feb 2012 08:58:10 +0000
+Subject: [PATCH 62/73] jme: Fix FIFO flush issue
+
+commit ba9adbe67e288823ac1deb7f11576ab5653f833e upstream.
+
+Set the RX FIFO flush watermark lower.
+According to Federico and JMicron's reply,
+setting it to 16QW would be stable on most platforms.
+Otherwise, user might experience packet drop issue.
+
+Reported-by: Federico Quagliata <federico@quagliata.org>
+Fixed-by: Federico Quagliata <federico@quagliata.org>
+Signed-off-by: Guo-Fu Tseng <cooldavid@cooldavid.org>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/jme.c |   10 +---------
+ drivers/net/ethernet/jme.h |    2 +-
+ 2 files changed, 2 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/net/ethernet/jme.c b/drivers/net/ethernet/jme.c
+index 76b8457..ab784e0 100644
+--- a/drivers/net/ethernet/jme.c
++++ b/drivers/net/ethernet/jme.c
+@@ -2328,19 +2328,11 @@ jme_change_mtu(struct net_device *netdev, int new_mtu)
+ 		((new_mtu) < IPV6_MIN_MTU))
+ 		return -EINVAL;
+ 
+-	if (new_mtu > 4000) {
+-		jme->reg_rxcs &= ~RXCS_FIFOTHNP;
+-		jme->reg_rxcs |= RXCS_FIFOTHNP_64QW;
+-		jme_restart_rx_engine(jme);
+-	} else {
+-		jme->reg_rxcs &= ~RXCS_FIFOTHNP;
+-		jme->reg_rxcs |= RXCS_FIFOTHNP_128QW;
+-		jme_restart_rx_engine(jme);
+-	}
+ 
+ 	netdev->mtu = new_mtu;
+ 	netdev_update_features(netdev);
+ 
++	jme_restart_rx_engine(jme);
+ 	jme_reset_link(jme);
+ 
+ 	return 0;
+diff --git a/drivers/net/ethernet/jme.h b/drivers/net/ethernet/jme.h
+index 4304072..3efc897 100644
+--- a/drivers/net/ethernet/jme.h
++++ b/drivers/net/ethernet/jme.h
+@@ -730,7 +730,7 @@ enum jme_rxcs_values {
+ 	RXCS_RETRYCNT_60	= 0x00000F00,
+ 
+ 	RXCS_DEFAULT		= RXCS_FIFOTHTP_128T |
+-				  RXCS_FIFOTHNP_128QW |
++				  RXCS_FIFOTHNP_16QW |
+ 				  RXCS_DMAREQSZ_128B |
+ 				  RXCS_RETRYGAP_256ns |
+ 				  RXCS_RETRYCNT_32,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0063-davinci_emac-Do-not-free-all-rx-dma-descriptors-duri.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0063-davinci_emac-Do-not-free-all-rx-dma-descriptors-duri.patch
new file mode 100644
index 0000000..15ff450
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0063-davinci_emac-Do-not-free-all-rx-dma-descriptors-duri.patch
@@ -0,0 +1,72 @@
+From df9a5f8f94f3276aaa8c960a46f6838f7fdab974 Mon Sep 17 00:00:00 2001
+From: Christian Riesch <christian.riesch@omicron.at>
+Date: Thu, 23 Feb 2012 01:14:17 +0000
+Subject: [PATCH 63/73] davinci_emac: Do not free all rx dma descriptors
+ during init
+
+commit 5d69703263d588dbb03f4e57091afd8942d96e6d upstream.
+
+This patch fixes a regression that was introduced by
+
+commit 0a5f38467765ee15478db90d81e40c269c8dda20
+davinci_emac: Add Carrier Link OK check in Davinci RX Handler
+
+Said commit adds a check whether the carrier link is ok. If the link is
+not ok, the skb is freed and no new dma descriptor added to the rx dma
+channel. This causes trouble during initialization when the carrier
+status has not yet been updated. If a lot of packets are received while
+netif_carrier_ok returns false, all dma descriptors are freed and the
+rx dma transfer is stopped.
+
+The bug occurs when the board is connected to a network with lots of
+traffic and the ifconfig down/up is done, e.g., when reconfiguring
+the interface with DHCP.
+
+The bug can be reproduced by flood pinging the davinci board while doing
+ifconfig eth0 down
+ifconfig eth0 up
+on the board.
+
+After that, the rx path stops working and the overrun value reported
+by ifconfig is counting up.
+
+This patch reverts commit 0a5f38467765ee15478db90d81e40c269c8dda20
+and instead issues warnings only if cpdma_chan_submit returns -ENOMEM.
+
+Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
+Cc: Cyril Chemparathy <cyril@ti.com>
+Cc: Sascha Hauer <s.hauer@pengutronix.de>
+Tested-by: Rajashekhara, Sudhakar <sudhakar.raj@ti.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/ti/davinci_emac.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/ethernet/ti/davinci_emac.c b/drivers/net/ethernet/ti/davinci_emac.c
+index 815c797..22f2788 100644
+--- a/drivers/net/ethernet/ti/davinci_emac.c
++++ b/drivers/net/ethernet/ti/davinci_emac.c
+@@ -1007,7 +1007,7 @@ static void emac_rx_handler(void *token, int len, int status)
+ 	int			ret;
+ 
+ 	/* free and bail if we are shutting down */
+-	if (unlikely(!netif_running(ndev) || !netif_carrier_ok(ndev))) {
++	if (unlikely(!netif_running(ndev))) {
+ 		dev_kfree_skb_any(skb);
+ 		return;
+ 	}
+@@ -1036,7 +1036,9 @@ static void emac_rx_handler(void *token, int len, int status)
+ recycle:
+ 	ret = cpdma_chan_submit(priv->rxchan, skb, skb->data,
+ 			skb_tailroom(skb), GFP_KERNEL);
+-	if (WARN_ON(ret < 0))
++
++	WARN_ON(ret == -ENOMEM);
++	if (unlikely(ret < 0))
+ 		dev_kfree_skb_any(skb);
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0064-builddeb-Don-t-create-files-in-tmp-with-predictable-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0064-builddeb-Don-t-create-files-in-tmp-with-predictable-.patch
new file mode 100644
index 0000000..93fd429
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0064-builddeb-Don-t-create-files-in-tmp-with-predictable-.patch
@@ -0,0 +1,47 @@
+From c3d65b135f856651b2fa8606a7799a9f33d8f113 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 15 Feb 2012 14:17:29 +0000
+Subject: [PATCH 64/73] builddeb: Don't create files in /tmp with predictable
+ names
+
+commit 6c635224602d760c1208ada337562f40d8ae93a5 upstream.
+
+The current use of /tmp for file lists is insecure.  Put them under
+$objtree/debian instead.
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Acked-by: maximilian attems <max@stro.at>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ scripts/package/builddeb |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/scripts/package/builddeb b/scripts/package/builddeb
+index f6cbc3d..3c6c0b1 100644
+--- a/scripts/package/builddeb
++++ b/scripts/package/builddeb
+@@ -238,14 +238,14 @@ EOF
+ fi
+ 
+ # Build header package
+-(cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > /tmp/files$$)
+-(cd $srctree; find arch/$SRCARCH/include include scripts -type f >> /tmp/files$$)
+-(cd $objtree; find .config Module.symvers include scripts -type f >> /tmp/objfiles$$)
++(cd $srctree; find . -name Makefile -o -name Kconfig\* -o -name \*.pl > "$objtree/debian/hdrsrcfiles")
++(cd $srctree; find arch/$SRCARCH/include include scripts -type f >> "$objtree/debian/hdrsrcfiles")
++(cd $objtree; find .config Module.symvers include scripts -type f >> "$objtree/debian/hdrobjfiles")
+ destdir=$kernel_headers_dir/usr/src/linux-headers-$version
+ mkdir -p "$destdir"
+-(cd $srctree; tar -c -f - -T /tmp/files$$) | (cd $destdir; tar -xf -)
+-(cd $objtree; tar -c -f - -T /tmp/objfiles$$) | (cd $destdir; tar -xf -)
+-rm -f /tmp/files$$ /tmp/objfiles$$
++(cd $srctree; tar -c -f - -T "$objtree/debian/hdrsrcfiles") | (cd $destdir; tar -xf -)
++(cd $objtree; tar -c -f - -T "$objtree/debian/hdrobjfiles") | (cd $destdir; tar -xf -)
++rm -f "$objtree/debian/hdrsrcfiles" "$objtree/debian/hdrobjfiles"
+ arch=$(dpkg --print-architecture)
+ 
+ cat <<EOF >> debian/control
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0065-can-sja1000-fix-isr-hang-when-hw-is-unplugged-under-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0065-can-sja1000-fix-isr-hang-when-hw-is-unplugged-under-.patch
new file mode 100644
index 0000000..49156d3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0065-can-sja1000-fix-isr-hang-when-hw-is-unplugged-under-.patch
@@ -0,0 +1,67 @@
+From 9bda01cc81b40639565e63223d7c5413bb15b99a Mon Sep 17 00:00:00 2001
+From: Oliver Hartkopp <socketcan@hartkopp.net>
+Date: Wed, 15 Feb 2012 17:51:56 +0100
+Subject: [PATCH 65/73] can: sja1000: fix isr hang when hw is unplugged under
+ load
+
+commit a7762b10c12a70c5dbf2253142764b728ac88c3a upstream.
+
+In the case of hotplug enabled devices (PCMCIA/PCIeC) the removal of the
+hardware can cause an infinite loop in the common sja1000 isr.
+
+Use the already retrieved status register to indicate a possible hardware
+removal and double check by reading the mode register in sja1000_is_absent.
+
+Signed-off-by: Oliver Hartkopp <socketcan@hartkopp.net>
+Acked-by: Wolfgang Grandegger <wg@grandegger.com>
+Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/can/sja1000/sja1000.c |   13 ++++++++++++-
+ 1 files changed, 12 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/can/sja1000/sja1000.c b/drivers/net/can/sja1000/sja1000.c
+index 04a3f1b..192b0d1 100644
+--- a/drivers/net/can/sja1000/sja1000.c
++++ b/drivers/net/can/sja1000/sja1000.c
+@@ -95,11 +95,16 @@ static void sja1000_write_cmdreg(struct sja1000_priv *priv, u8 val)
+ 	spin_unlock_irqrestore(&priv->cmdreg_lock, flags);
+ }
+ 
++static int sja1000_is_absent(struct sja1000_priv *priv)
++{
++	return (priv->read_reg(priv, REG_MOD) == 0xFF);
++}
++
+ static int sja1000_probe_chip(struct net_device *dev)
+ {
+ 	struct sja1000_priv *priv = netdev_priv(dev);
+ 
+-	if (priv->reg_base && (priv->read_reg(priv, 0) == 0xFF)) {
++	if (priv->reg_base && sja1000_is_absent(priv)) {
+ 		printk(KERN_INFO "%s: probing @0x%lX failed\n",
+ 		       DRV_NAME, dev->base_addr);
+ 		return 0;
+@@ -493,6 +498,9 @@ irqreturn_t sja1000_interrupt(int irq, void *dev_id)
+ 	while ((isrc = priv->read_reg(priv, REG_IR)) && (n < SJA1000_MAX_IRQ)) {
+ 		n++;
+ 		status = priv->read_reg(priv, REG_SR);
++		/* check for absent controller due to hw unplug */
++		if (status == 0xFF && sja1000_is_absent(priv))
++			return IRQ_NONE;
+ 
+ 		if (isrc & IRQ_WUI)
+ 			dev_warn(dev->dev.parent, "wakeup interrupt\n");
+@@ -509,6 +517,9 @@ irqreturn_t sja1000_interrupt(int irq, void *dev_id)
+ 			while (status & SR_RBS) {
+ 				sja1000_rx(dev);
+ 				status = priv->read_reg(priv, REG_SR);
++				/* check for absent controller */
++				if (status == 0xFF && sja1000_is_absent(priv))
++					return IRQ_NONE;
+ 			}
+ 		}
+ 		if (isrc & (IRQ_DOI | IRQ_EI | IRQ_BEI | IRQ_EPI | IRQ_ALI)) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0066-hdpvr-fix-race-conditon-during-start-of-streaming.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0066-hdpvr-fix-race-conditon-during-start-of-streaming.patch
new file mode 100644
index 0000000..142e5c3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0066-hdpvr-fix-race-conditon-during-start-of-streaming.patch
@@ -0,0 +1,39 @@
+From 81fa1b30877282eb79de420b7e29d09737ab86eb Mon Sep 17 00:00:00 2001
+From: Janne Grunau <j@jannau.net>
+Date: Thu, 2 Feb 2012 13:35:21 -0300
+Subject: [PATCH 66/73] hdpvr: fix race conditon during start of streaming
+
+commit afa159538af61f1a65d48927f4e949fe514fb4fc upstream.
+
+status has to be set to STREAMING before the streaming worker is
+queued. hdpvr_transmit_buffers() will exit immediately otherwise.
+
+Reported-by: Joerg Desch <vvd.joede@googlemail.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/media/video/hdpvr/hdpvr-video.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/media/video/hdpvr/hdpvr-video.c b/drivers/media/video/hdpvr/hdpvr-video.c
+index 087f7c0..41fd57b 100644
+--- a/drivers/media/video/hdpvr/hdpvr-video.c
++++ b/drivers/media/video/hdpvr/hdpvr-video.c
+@@ -283,12 +283,13 @@ static int hdpvr_start_streaming(struct hdpvr_device *dev)
+ 
+ 		hdpvr_config_call(dev, CTRL_START_STREAMING_VALUE, 0x00);
+ 
++		dev->status = STATUS_STREAMING;
++
+ 		INIT_WORK(&dev->worker, hdpvr_transmit_buffers);
+ 		queue_work(dev->workqueue, &dev->worker);
+ 
+ 		v4l2_dbg(MSG_BUFFER, hdpvr_debug, &dev->v4l2_dev,
+ 			 "streaming started\n");
+-		dev->status = STATUS_STREAMING;
+ 
+ 		return 0;
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0067-imon-don-t-wedge-hardware-after-early-callbacks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0067-imon-don-t-wedge-hardware-after-early-callbacks.patch
new file mode 100644
index 0000000..5c568cd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0067-imon-don-t-wedge-hardware-after-early-callbacks.patch
@@ -0,0 +1,107 @@
+From 7171d39d2187d3a59f8a2452bce6691755c0b153 Mon Sep 17 00:00:00 2001
+From: Jarod Wilson <jarod@redhat.com>
+Date: Thu, 26 Jan 2012 12:04:11 -0300
+Subject: [PATCH 67/73] imon: don't wedge hardware after early callbacks
+
+commit 8791d63af0cf113725ae4cb8cba9492814c59a93 upstream.
+
+This patch is just a minor update to one titled "imon: Input from ffdc
+device type ignored" from Corinna Vinschen. An earlier patch to prevent
+an oops when we got early callbacks also has the nasty side-effect of
+wedging imon hardware, as we don't acknowledge the urb. Rework the check
+slightly here to bypass processing the packet, as the driver isn't yet
+fully initialized, but still acknowlege the urb and submit a new rx_urb.
+Do this for both interfaces -- irrelevant for ffdc hardware, but
+relevant for newer hardware, though newer hardware doesn't spew the
+constant stream of data as soon as the hardware is initialized like the
+older ffdc devices, so they'd be less likely to trigger this anyway...
+
+Tested with both an ffdc device and an 0042 device.
+
+Reported-by: Corinna Vinschen <vinschen@redhat.com>
+Signed-off-by: Jarod Wilson <jarod@redhat.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/media/rc/imon.c |   26 ++++++++++++++++++++++----
+ 1 files changed, 22 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/media/rc/imon.c b/drivers/media/rc/imon.c
+index 6ed9646..3f175eb 100644
+--- a/drivers/media/rc/imon.c
++++ b/drivers/media/rc/imon.c
+@@ -47,7 +47,7 @@
+ #define MOD_AUTHOR	"Jarod Wilson <jarod@wilsonet.com>"
+ #define MOD_DESC	"Driver for SoundGraph iMON MultiMedia IR/Display"
+ #define MOD_NAME	"imon"
+-#define MOD_VERSION	"0.9.3"
++#define MOD_VERSION	"0.9.4"
+ 
+ #define DISPLAY_MINOR_BASE	144
+ #define DEVICE_NAME	"lcd%d"
+@@ -1658,9 +1658,17 @@ static void usb_rx_callback_intf0(struct urb *urb)
+ 		return;
+ 
+ 	ictx = (struct imon_context *)urb->context;
+-	if (!ictx || !ictx->dev_present_intf0)
++	if (!ictx)
+ 		return;
+ 
++	/*
++	 * if we get a callback before we're done configuring the hardware, we
++	 * can't yet process the data, as there's nowhere to send it, but we
++	 * still need to submit a new rx URB to avoid wedging the hardware
++	 */
++	if (!ictx->dev_present_intf0)
++		goto out;
++
+ 	switch (urb->status) {
+ 	case -ENOENT:		/* usbcore unlink successful! */
+ 		return;
+@@ -1678,6 +1686,7 @@ static void usb_rx_callback_intf0(struct urb *urb)
+ 		break;
+ 	}
+ 
++out:
+ 	usb_submit_urb(ictx->rx_urb_intf0, GFP_ATOMIC);
+ }
+ 
+@@ -1690,9 +1699,17 @@ static void usb_rx_callback_intf1(struct urb *urb)
+ 		return;
+ 
+ 	ictx = (struct imon_context *)urb->context;
+-	if (!ictx || !ictx->dev_present_intf1)
++	if (!ictx)
+ 		return;
+ 
++	/*
++	 * if we get a callback before we're done configuring the hardware, we
++	 * can't yet process the data, as there's nowhere to send it, but we
++	 * still need to submit a new rx URB to avoid wedging the hardware
++	 */
++	if (!ictx->dev_present_intf1)
++		goto out;
++
+ 	switch (urb->status) {
+ 	case -ENOENT:		/* usbcore unlink successful! */
+ 		return;
+@@ -1710,6 +1727,7 @@ static void usb_rx_callback_intf1(struct urb *urb)
+ 		break;
+ 	}
+ 
++out:
+ 	usb_submit_urb(ictx->rx_urb_intf1, GFP_ATOMIC);
+ }
+ 
+@@ -2242,7 +2260,7 @@ find_endpoint_failed:
+ 	mutex_unlock(&ictx->lock);
+ 	usb_free_urb(rx_urb);
+ rx_urb_alloc_failed:
+-	dev_err(ictx->dev, "unable to initialize intf0, err %d\n", ret);
++	dev_err(ictx->dev, "unable to initialize intf1, err %d\n", ret);
+ 
+ 	return NULL;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0068-hwmon-f75375s-Fix-register-write-order-when-setting-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0068-hwmon-f75375s-Fix-register-write-order-when-setting-.patch
new file mode 100644
index 0000000..ca1f37f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0068-hwmon-f75375s-Fix-register-write-order-when-setting-.patch
@@ -0,0 +1,48 @@
+From a93a91746fe70854f5301c526d1eec16312bebc3 Mon Sep 17 00:00:00 2001
+From: Nikolaus Schulz <schulz@macnetix.de>
+Date: Wed, 22 Feb 2012 23:18:44 +0100
+Subject: [PATCH 68/73] hwmon: (f75375s) Fix register write order when setting
+ fans to full speed
+
+commit c1c1a3d012fe5e82a9a025fb4b5a4f8ee67a53f6 upstream.
+
+By hwmon sysfs interface convention, setting pwm_enable to zero sets a fan
+to full speed.  In the f75375s driver, this need be done by enabling
+manual fan control, plus duty mode for the F875387 chip, and then setting
+the maximum duty cycle.  Fix a bug where the two necessary register writes
+were swapped, effectively discarding the setting to full-speed.
+
+Signed-off-by: Nikolaus Schulz <mail@microschulz.de>
+Cc: Riku Voipio <riku.voipio@iki.fi>
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/f75375s.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/hwmon/f75375s.c b/drivers/hwmon/f75375s.c
+index e4ab491..040a820 100644
+--- a/drivers/hwmon/f75375s.c
++++ b/drivers/hwmon/f75375s.c
+@@ -304,8 +304,6 @@ static int set_pwm_enable_direct(struct i2c_client *client, int nr, int val)
+ 	case 0: /* Full speed */
+ 		fanmode  |= (3 << FAN_CTRL_MODE(nr));
+ 		data->pwm[nr] = 255;
+-		f75375_write8(client, F75375_REG_FAN_PWM_DUTY(nr),
+-				data->pwm[nr]);
+ 		break;
+ 	case 1: /* PWM */
+ 		fanmode  |= (3 << FAN_CTRL_MODE(nr));
+@@ -318,6 +316,9 @@ static int set_pwm_enable_direct(struct i2c_client *client, int nr, int val)
+ 	}
+ 	f75375_write8(client, F75375_REG_FAN_TIMER, fanmode);
+ 	data->pwm_enable[nr] = val;
++	if (val == 0)
++		f75375_write8(client, F75375_REG_FAN_PWM_DUTY(nr),
++				data->pwm[nr]);
+ 	return 0;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0069-epoll-introduce-POLLFREE-to-flush-signalfd_wqh-befor.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0069-epoll-introduce-POLLFREE-to-flush-signalfd_wqh-befor.patch
new file mode 100644
index 0000000..ae8e8df
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0069-epoll-introduce-POLLFREE-to-flush-signalfd_wqh-befor.patch
@@ -0,0 +1,164 @@
+From 7741374fa2e5b7fa48f674bdbac6e1d5edf55c5a Mon Sep 17 00:00:00 2001
+From: Oleg Nesterov <oleg@redhat.com>
+Date: Fri, 24 Feb 2012 20:07:11 +0100
+Subject: [PATCH 69/73] epoll: introduce POLLFREE to flush ->signalfd_wqh
+ before kfree()
+
+commit d80e731ecab420ddcb79ee9d0ac427acbc187b4b upstream.
+
+This patch is intentionally incomplete to simplify the review.
+It ignores ep_unregister_pollwait() which plays with the same wqh.
+See the next change.
+
+epoll assumes that the EPOLL_CTL_ADD'ed file controls everything
+f_op->poll() needs. In particular it assumes that the wait queue
+can't go away until eventpoll_release(). This is not true in case
+of signalfd, the task which does EPOLL_CTL_ADD uses its ->sighand
+which is not connected to the file.
+
+This patch adds the special event, POLLFREE, currently only for
+epoll. It expects that init_poll_funcptr()'ed hook should do the
+necessary cleanup. Perhaps it should be defined as EPOLLFREE in
+eventpoll.
+
+__cleanup_sighand() is changed to do wake_up_poll(POLLFREE) if
+->signalfd_wqh is not empty, we add the new signalfd_cleanup()
+helper.
+
+ep_poll_callback(POLLFREE) simply does list_del_init(task_list).
+This make this poll entry inconsistent, but we don't care. If you
+share epoll fd which contains our sigfd with another process you
+should blame yourself. signalfd is "really special". I simply do
+not know how we can define the "right" semantics if it used with
+epoll.
+
+The main problem is, epoll calls signalfd_poll() once to establish
+the connection with the wait queue, after that signalfd_poll(NULL)
+returns the different/inconsistent results depending on who does
+EPOLL_CTL_MOD/signalfd_read/etc. IOW: apart from sigmask, signalfd
+has nothing to do with the file, it works with the current thread.
+
+In short: this patch is the hack which tries to fix the symptoms.
+It also assumes that nobody can take tasklist_lock under epoll
+locks, this seems to be true.
+
+Note:
+
+	- we do not have wake_up_all_poll() but wake_up_poll()
+	  is fine, poll/epoll doesn't use WQ_FLAG_EXCLUSIVE.
+
+	- signalfd_cleanup() uses POLLHUP along with POLLFREE,
+	  we need a couple of simple changes in eventpoll.c to
+	  make sure it can't be "lost".
+
+Reported-by: Maxime Bizon <mbizon@freebox.fr>
+Signed-off-by: Oleg Nesterov <oleg@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/eventpoll.c             |    4 ++++
+ fs/signalfd.c              |   11 +++++++++++
+ include/asm-generic/poll.h |    2 ++
+ include/linux/signalfd.h   |    5 ++++-
+ kernel/fork.c              |    5 ++++-
+ 5 files changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/fs/eventpoll.c b/fs/eventpoll.c
+index 828e750..ede66ad 100644
+--- a/fs/eventpoll.c
++++ b/fs/eventpoll.c
+@@ -827,6 +827,10 @@ static int ep_poll_callback(wait_queue_t *wait, unsigned mode, int sync, void *k
+ 	struct epitem *epi = ep_item_from_wait(wait);
+ 	struct eventpoll *ep = epi->ep;
+ 
++	/* the caller holds eppoll_entry->whead->lock */
++	if ((unsigned long)key & POLLFREE)
++		list_del_init(&wait->task_list);
++
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 
+ 	/*
+diff --git a/fs/signalfd.c b/fs/signalfd.c
+index 492465b..79c1eea 100644
+--- a/fs/signalfd.c
++++ b/fs/signalfd.c
+@@ -30,6 +30,17 @@
+ #include <linux/signalfd.h>
+ #include <linux/syscalls.h>
+ 
++void signalfd_cleanup(struct sighand_struct *sighand)
++{
++	wait_queue_head_t *wqh = &sighand->signalfd_wqh;
++
++	if (likely(!waitqueue_active(wqh)))
++		return;
++
++	/* wait_queue_t->func(POLLFREE) should do remove_wait_queue() */
++	wake_up_poll(wqh, POLLHUP | POLLFREE);
++}
++
+ struct signalfd_ctx {
+ 	sigset_t sigmask;
+ };
+diff --git a/include/asm-generic/poll.h b/include/asm-generic/poll.h
+index 44bce83..9ce7f44 100644
+--- a/include/asm-generic/poll.h
++++ b/include/asm-generic/poll.h
+@@ -28,6 +28,8 @@
+ #define POLLRDHUP       0x2000
+ #endif
+ 
++#define POLLFREE	0x4000	/* currently only for epoll */
++
+ struct pollfd {
+ 	int fd;
+ 	short events;
+diff --git a/include/linux/signalfd.h b/include/linux/signalfd.h
+index 3ff4961..247399b 100644
+--- a/include/linux/signalfd.h
++++ b/include/linux/signalfd.h
+@@ -61,13 +61,16 @@ static inline void signalfd_notify(struct task_struct *tsk, int sig)
+ 		wake_up(&tsk->sighand->signalfd_wqh);
+ }
+ 
++extern void signalfd_cleanup(struct sighand_struct *sighand);
++
+ #else /* CONFIG_SIGNALFD */
+ 
+ static inline void signalfd_notify(struct task_struct *tsk, int sig) { }
+ 
++static inline void signalfd_cleanup(struct sighand_struct *sighand) { }
++
+ #endif /* CONFIG_SIGNALFD */
+ 
+ #endif /* __KERNEL__ */
+ 
+ #endif /* _LINUX_SIGNALFD_H */
+-
+diff --git a/kernel/fork.c b/kernel/fork.c
+index da4a6a1..0acf42c0 100644
+--- a/kernel/fork.c
++++ b/kernel/fork.c
+@@ -66,6 +66,7 @@
+ #include <linux/user-return-notifier.h>
+ #include <linux/oom.h>
+ #include <linux/khugepaged.h>
++#include <linux/signalfd.h>
+ 
+ #include <asm/pgtable.h>
+ #include <asm/pgalloc.h>
+@@ -910,8 +911,10 @@ static int copy_sighand(unsigned long clone_flags, struct task_struct *tsk)
+ 
+ void __cleanup_sighand(struct sighand_struct *sighand)
+ {
+-	if (atomic_dec_and_test(&sighand->count))
++	if (atomic_dec_and_test(&sighand->count)) {
++		signalfd_cleanup(sighand);
+ 		kmem_cache_free(sighand_cachep, sighand);
++	}
+ }
+ 
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0070-epoll-ep_unregister_pollwait-can-use-the-freed-pwq-w.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0070-epoll-ep_unregister_pollwait-can-use-the-freed-pwq-w.patch
new file mode 100644
index 0000000..f847fc2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0070-epoll-ep_unregister_pollwait-can-use-the-freed-pwq-w.patch
@@ -0,0 +1,116 @@
+From e6aa5c0ba6e2383b2952a9f340e58a990bf15111 Mon Sep 17 00:00:00 2001
+From: Oleg Nesterov <oleg@redhat.com>
+Date: Fri, 24 Feb 2012 20:07:29 +0100
+Subject: [PATCH 70/73] epoll: ep_unregister_pollwait() can use the freed
+ pwq->whead
+
+commit 971316f0503a5c50633d07b83b6db2f15a3a5b00 upstream.
+
+signalfd_cleanup() ensures that ->signalfd_wqh is not used, but
+this is not enough. eppoll_entry->whead still points to the memory
+we are going to free, ep_unregister_pollwait()->remove_wait_queue()
+is obviously unsafe.
+
+Change ep_poll_callback(POLLFREE) to set eppoll_entry->whead = NULL,
+change ep_unregister_pollwait() to check pwq->whead != NULL under
+rcu_read_lock() before remove_wait_queue(). We add the new helper,
+ep_remove_wait_queue(), for this.
+
+This works because sighand_cachep is SLAB_DESTROY_BY_RCU and because
+->signalfd_wqh is initialized in sighand_ctor(), not in copy_sighand.
+ep_unregister_pollwait()->remove_wait_queue() can play with already
+freed and potentially reused ->sighand, but this is fine. This memory
+must have the valid ->signalfd_wqh until rcu_read_unlock().
+
+Reported-by: Maxime Bizon <mbizon@freebox.fr>
+Signed-off-by: Oleg Nesterov <oleg@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/eventpoll.c |   30 +++++++++++++++++++++++++++---
+ fs/signalfd.c  |    6 +++++-
+ 2 files changed, 32 insertions(+), 4 deletions(-)
+
+diff --git a/fs/eventpoll.c b/fs/eventpoll.c
+index ede66ad..12a772b 100644
+--- a/fs/eventpoll.c
++++ b/fs/eventpoll.c
+@@ -299,6 +299,11 @@ static inline int ep_is_linked(struct list_head *p)
+ 	return !list_empty(p);
+ }
+ 
++static inline struct eppoll_entry *ep_pwq_from_wait(wait_queue_t *p)
++{
++	return container_of(p, struct eppoll_entry, wait);
++}
++
+ /* Get the "struct epitem" from a wait queue pointer */
+ static inline struct epitem *ep_item_from_wait(wait_queue_t *p)
+ {
+@@ -446,6 +451,18 @@ static void ep_poll_safewake(wait_queue_head_t *wq)
+ 	put_cpu();
+ }
+ 
++static void ep_remove_wait_queue(struct eppoll_entry *pwq)
++{
++	wait_queue_head_t *whead;
++
++	rcu_read_lock();
++	/* If it is cleared by POLLFREE, it should be rcu-safe */
++	whead = rcu_dereference(pwq->whead);
++	if (whead)
++		remove_wait_queue(whead, &pwq->wait);
++	rcu_read_unlock();
++}
++
+ /*
+  * This function unregisters poll callbacks from the associated file
+  * descriptor.  Must be called with "mtx" held (or "epmutex" if called from
+@@ -460,7 +477,7 @@ static void ep_unregister_pollwait(struct eventpoll *ep, struct epitem *epi)
+ 		pwq = list_first_entry(lsthead, struct eppoll_entry, llink);
+ 
+ 		list_del(&pwq->llink);
+-		remove_wait_queue(pwq->whead, &pwq->wait);
++		ep_remove_wait_queue(pwq);
+ 		kmem_cache_free(pwq_cache, pwq);
+ 	}
+ }
+@@ -827,9 +844,16 @@ static int ep_poll_callback(wait_queue_t *wait, unsigned mode, int sync, void *k
+ 	struct epitem *epi = ep_item_from_wait(wait);
+ 	struct eventpoll *ep = epi->ep;
+ 
+-	/* the caller holds eppoll_entry->whead->lock */
+-	if ((unsigned long)key & POLLFREE)
++	if ((unsigned long)key & POLLFREE) {
++		ep_pwq_from_wait(wait)->whead = NULL;
++		/*
++		 * whead = NULL above can race with ep_remove_wait_queue()
++		 * which can do another remove_wait_queue() after us, so we
++		 * can't use __remove_wait_queue(). whead->lock is held by
++		 * the caller.
++		 */
+ 		list_del_init(&wait->task_list);
++	}
+ 
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 
+diff --git a/fs/signalfd.c b/fs/signalfd.c
+index 79c1eea..7ae2a57 100644
+--- a/fs/signalfd.c
++++ b/fs/signalfd.c
+@@ -33,7 +33,11 @@
+ void signalfd_cleanup(struct sighand_struct *sighand)
+ {
+ 	wait_queue_head_t *wqh = &sighand->signalfd_wqh;
+-
++	/*
++	 * The lockless check can race with remove_wait_queue() in progress,
++	 * but in this case its caller should run under rcu_read_lock() and
++	 * sighand_cachep is SLAB_DESTROY_BY_RCU, we can safely return.
++	 */
+ 	if (likely(!waitqueue_active(wqh)))
+ 		return;
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0071-epoll-limit-paths.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0071-epoll-limit-paths.patch
new file mode 100644
index 0000000..b6b53ba
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0071-epoll-limit-paths.patch
@@ -0,0 +1,475 @@
+From 203aa5260edca2ab1872ad8b08386d874f7132f3 Mon Sep 17 00:00:00 2001
+From: Jason Baron <jbaron@redhat.com>
+Date: Thu, 12 Jan 2012 17:17:43 -0800
+Subject: [PATCH 71/73] epoll: limit paths
+
+commit 28d82dc1c4edbc352129f97f4ca22624d1fe61de upstream.
+
+The current epoll code can be tickled to run basically indefinitely in
+both loop detection path check (on ep_insert()), and in the wakeup paths.
+The programs that tickle this behavior set up deeply linked networks of
+epoll file descriptors that cause the epoll algorithms to traverse them
+indefinitely.  A couple of these sample programs have been previously
+posted in this thread: https://lkml.org/lkml/2011/2/25/297.
+
+To fix the loop detection path check algorithms, I simply keep track of
+the epoll nodes that have been already visited.  Thus, the loop detection
+becomes proportional to the number of epoll file descriptor and links.
+This dramatically decreases the run-time of the loop check algorithm.  In
+one diabolical case I tried it reduced the run-time from 15 mintues (all
+in kernel time) to .3 seconds.
+
+Fixing the wakeup paths could be done at wakeup time in a similar manner
+by keeping track of nodes that have already been visited, but the
+complexity is harder, since there can be multiple wakeups on different
+cpus...Thus, I've opted to limit the number of possible wakeup paths when
+the paths are created.
+
+This is accomplished, by noting that the end file descriptor points that
+are found during the loop detection pass (from the newly added link), are
+actually the sources for wakeup events.  I keep a list of these file
+descriptors and limit the number and length of these paths that emanate
+from these 'source file descriptors'.  In the current implemetation I
+allow 1000 paths of length 1, 500 of length 2, 100 of length 3, 50 of
+length 4 and 10 of length 5.  Note that it is sufficient to check the
+'source file descriptors' reachable from the newly added link, since no
+other 'source file descriptors' will have newly added links.  This allows
+us to check only the wakeup paths that may have gotten too long, and not
+re-check all possible wakeup paths on the system.
+
+In terms of the path limit selection, I think its first worth noting that
+the most common case for epoll, is probably the model where you have 1
+epoll file descriptor that is monitoring n number of 'source file
+descriptors'.  In this case, each 'source file descriptor' has a 1 path of
+length 1.  Thus, I believe that the limits I'm proposing are quite
+reasonable and in fact may be too generous.  Thus, I'm hoping that the
+proposed limits will not prevent any workloads that currently work to
+fail.
+
+In terms of locking, I have extended the use of the 'epmutex' to all
+epoll_ctl add and remove operations.  Currently its only used in a subset
+of the add paths.  I need to hold the epmutex, so that we can correctly
+traverse a coherent graph, to check the number of paths.  I believe that
+this additional locking is probably ok, since its in the setup/teardown
+paths, and doesn't affect the running paths, but it certainly is going to
+add some extra overhead.  Also, worth noting is that the epmuex was
+recently added to the ep_ctl add operations in the initial path loop
+detection code using the argument that it was not on a critical path.
+
+Another thing to note here, is the length of epoll chains that is allowed.
+Currently, eventpoll.c defines:
+
+/* Maximum number of nesting allowed inside epoll sets */
+#define EP_MAX_NESTS 4
+
+This basically means that I am limited to a graph depth of 5 (EP_MAX_NESTS
++ 1).  However, this limit is currently only enforced during the loop
+check detection code, and only when the epoll file descriptors are added
+in a certain order.  Thus, this limit is currently easily bypassed.  The
+newly added check for wakeup paths, stricly limits the wakeup paths to a
+length of 5, regardless of the order in which ep's are linked together.
+Thus, a side-effect of the new code is a more consistent enforcement of
+the graph depth.
+
+Thus far, I've tested this, using the sample programs previously
+mentioned, which now either return quickly or return -EINVAL.  I've also
+testing using the piptest.c epoll tester, which showed no difference in
+performance.  I've also created a number of different epoll networks and
+tested that they behave as expectded.
+
+I believe this solves the original diabolical test cases, while still
+preserving the sane epoll nesting.
+
+Signed-off-by: Jason Baron <jbaron@redhat.com>
+Cc: Nelson Elhage <nelhage@ksplice.com>
+Cc: Davide Libenzi <davidel@xmailserver.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/eventpoll.c            |  234 ++++++++++++++++++++++++++++++++++++++++-----
+ include/linux/eventpoll.h |    1 +
+ include/linux/fs.h        |    1 +
+ 3 files changed, 211 insertions(+), 25 deletions(-)
+
+diff --git a/fs/eventpoll.c b/fs/eventpoll.c
+index 12a772b..ea54cde 100644
+--- a/fs/eventpoll.c
++++ b/fs/eventpoll.c
+@@ -197,6 +197,12 @@ struct eventpoll {
+ 
+ 	/* The user that created the eventpoll descriptor */
+ 	struct user_struct *user;
++
++	struct file *file;
++
++	/* used to optimize loop detection check */
++	int visited;
++	struct list_head visited_list_link;
+ };
+ 
+ /* Wait structure used by the poll hooks */
+@@ -255,6 +261,15 @@ static struct kmem_cache *epi_cache __read_mostly;
+ /* Slab cache used to allocate "struct eppoll_entry" */
+ static struct kmem_cache *pwq_cache __read_mostly;
+ 
++/* Visited nodes during ep_loop_check(), so we can unset them when we finish */
++static LIST_HEAD(visited_list);
++
++/*
++ * List of files with newly added links, where we may need to limit the number
++ * of emanating paths. Protected by the epmutex.
++ */
++static LIST_HEAD(tfile_check_list);
++
+ #ifdef CONFIG_SYSCTL
+ 
+ #include <linux/sysctl.h>
+@@ -276,6 +291,12 @@ ctl_table epoll_table[] = {
+ };
+ #endif /* CONFIG_SYSCTL */
+ 
++static const struct file_operations eventpoll_fops;
++
++static inline int is_file_epoll(struct file *f)
++{
++	return f->f_op == &eventpoll_fops;
++}
+ 
+ /* Setup the structure that is used as key for the RB tree */
+ static inline void ep_set_ffd(struct epoll_filefd *ffd,
+@@ -728,12 +749,6 @@ static const struct file_operations eventpoll_fops = {
+ 	.llseek		= noop_llseek,
+ };
+ 
+-/* Fast test to see if the file is an eventpoll file */
+-static inline int is_file_epoll(struct file *f)
+-{
+-	return f->f_op == &eventpoll_fops;
+-}
+-
+ /*
+  * This is called from eventpoll_release() to unlink files from the eventpoll
+  * interface. We need to have this facility to cleanup correctly files that are
+@@ -954,6 +969,99 @@ static void ep_rbtree_insert(struct eventpoll *ep, struct epitem *epi)
+ 	rb_insert_color(&epi->rbn, &ep->rbr);
+ }
+ 
++
++
++#define PATH_ARR_SIZE 5
++/*
++ * These are the number paths of length 1 to 5, that we are allowing to emanate
++ * from a single file of interest. For example, we allow 1000 paths of length
++ * 1, to emanate from each file of interest. This essentially represents the
++ * potential wakeup paths, which need to be limited in order to avoid massive
++ * uncontrolled wakeup storms. The common use case should be a single ep which
++ * is connected to n file sources. In this case each file source has 1 path
++ * of length 1. Thus, the numbers below should be more than sufficient. These
++ * path limits are enforced during an EPOLL_CTL_ADD operation, since a modify
++ * and delete can't add additional paths. Protected by the epmutex.
++ */
++static const int path_limits[PATH_ARR_SIZE] = { 1000, 500, 100, 50, 10 };
++static int path_count[PATH_ARR_SIZE];
++
++static int path_count_inc(int nests)
++{
++	if (++path_count[nests] > path_limits[nests])
++		return -1;
++	return 0;
++}
++
++static void path_count_init(void)
++{
++	int i;
++
++	for (i = 0; i < PATH_ARR_SIZE; i++)
++		path_count[i] = 0;
++}
++
++static int reverse_path_check_proc(void *priv, void *cookie, int call_nests)
++{
++	int error = 0;
++	struct file *file = priv;
++	struct file *child_file;
++	struct epitem *epi;
++
++	list_for_each_entry(epi, &file->f_ep_links, fllink) {
++		child_file = epi->ep->file;
++		if (is_file_epoll(child_file)) {
++			if (list_empty(&child_file->f_ep_links)) {
++				if (path_count_inc(call_nests)) {
++					error = -1;
++					break;
++				}
++			} else {
++				error = ep_call_nested(&poll_loop_ncalls,
++							EP_MAX_NESTS,
++							reverse_path_check_proc,
++							child_file, child_file,
++							current);
++			}
++			if (error != 0)
++				break;
++		} else {
++			printk(KERN_ERR "reverse_path_check_proc: "
++				"file is not an ep!\n");
++		}
++	}
++	return error;
++}
++
++/**
++ * reverse_path_check - The tfile_check_list is list of file *, which have
++ *                      links that are proposed to be newly added. We need to
++ *                      make sure that those added links don't add too many
++ *                      paths such that we will spend all our time waking up
++ *                      eventpoll objects.
++ *
++ * Returns: Returns zero if the proposed links don't create too many paths,
++ *	    -1 otherwise.
++ */
++static int reverse_path_check(void)
++{
++	int length = 0;
++	int error = 0;
++	struct file *current_file;
++
++	/* let's call this for all tfiles */
++	list_for_each_entry(current_file, &tfile_check_list, f_tfile_llink) {
++		length++;
++		path_count_init();
++		error = ep_call_nested(&poll_loop_ncalls, EP_MAX_NESTS,
++					reverse_path_check_proc, current_file,
++					current_file, current);
++		if (error)
++			break;
++	}
++	return error;
++}
++
+ /*
+  * Must be called with "mtx" held.
+  */
+@@ -1015,6 +1123,11 @@ static int ep_insert(struct eventpoll *ep, struct epoll_event *event,
+ 	 */
+ 	ep_rbtree_insert(ep, epi);
+ 
++	/* now check if we've created too many backpaths */
++	error = -EINVAL;
++	if (reverse_path_check())
++		goto error_remove_epi;
++
+ 	/* We have to drop the new item inside our item list to keep track of it */
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 
+@@ -1039,6 +1152,14 @@ static int ep_insert(struct eventpoll *ep, struct epoll_event *event,
+ 
+ 	return 0;
+ 
++error_remove_epi:
++	spin_lock(&tfile->f_lock);
++	if (ep_is_linked(&epi->fllink))
++		list_del_init(&epi->fllink);
++	spin_unlock(&tfile->f_lock);
++
++	rb_erase(&epi->rbn, &ep->rbr);
++
+ error_unregister:
+ 	ep_unregister_pollwait(ep, epi);
+ 
+@@ -1303,18 +1424,36 @@ static int ep_loop_check_proc(void *priv, void *cookie, int call_nests)
+ 	int error = 0;
+ 	struct file *file = priv;
+ 	struct eventpoll *ep = file->private_data;
++	struct eventpoll *ep_tovisit;
+ 	struct rb_node *rbp;
+ 	struct epitem *epi;
+ 
+ 	mutex_lock_nested(&ep->mtx, call_nests + 1);
++	ep->visited = 1;
++	list_add(&ep->visited_list_link, &visited_list);
+ 	for (rbp = rb_first(&ep->rbr); rbp; rbp = rb_next(rbp)) {
+ 		epi = rb_entry(rbp, struct epitem, rbn);
+ 		if (unlikely(is_file_epoll(epi->ffd.file))) {
++			ep_tovisit = epi->ffd.file->private_data;
++			if (ep_tovisit->visited)
++				continue;
+ 			error = ep_call_nested(&poll_loop_ncalls, EP_MAX_NESTS,
+-					       ep_loop_check_proc, epi->ffd.file,
+-					       epi->ffd.file->private_data, current);
++					ep_loop_check_proc, epi->ffd.file,
++					ep_tovisit, current);
+ 			if (error != 0)
+ 				break;
++		} else {
++			/*
++			 * If we've reached a file that is not associated with
++			 * an ep, then we need to check if the newly added
++			 * links are going to add too many wakeup paths. We do
++			 * this by adding it to the tfile_check_list, if it's
++			 * not already there, and calling reverse_path_check()
++			 * during ep_insert().
++			 */
++			if (list_empty(&epi->ffd.file->f_tfile_llink))
++				list_add(&epi->ffd.file->f_tfile_llink,
++					 &tfile_check_list);
+ 		}
+ 	}
+ 	mutex_unlock(&ep->mtx);
+@@ -1335,8 +1474,31 @@ static int ep_loop_check_proc(void *priv, void *cookie, int call_nests)
+  */
+ static int ep_loop_check(struct eventpoll *ep, struct file *file)
+ {
+-	return ep_call_nested(&poll_loop_ncalls, EP_MAX_NESTS,
++	int ret;
++	struct eventpoll *ep_cur, *ep_next;
++
++	ret = ep_call_nested(&poll_loop_ncalls, EP_MAX_NESTS,
+ 			      ep_loop_check_proc, file, ep, current);
++	/* clear visited list */
++	list_for_each_entry_safe(ep_cur, ep_next, &visited_list,
++							visited_list_link) {
++		ep_cur->visited = 0;
++		list_del(&ep_cur->visited_list_link);
++	}
++	return ret;
++}
++
++static void clear_tfile_check_list(void)
++{
++	struct file *file;
++
++	/* first clear the tfile_check_list */
++	while (!list_empty(&tfile_check_list)) {
++		file = list_first_entry(&tfile_check_list, struct file,
++					f_tfile_llink);
++		list_del_init(&file->f_tfile_llink);
++	}
++	INIT_LIST_HEAD(&tfile_check_list);
+ }
+ 
+ /*
+@@ -1344,8 +1506,9 @@ static int ep_loop_check(struct eventpoll *ep, struct file *file)
+  */
+ SYSCALL_DEFINE1(epoll_create1, int, flags)
+ {
+-	int error;
++	int error, fd;
+ 	struct eventpoll *ep = NULL;
++	struct file *file;
+ 
+ 	/* Check the EPOLL_* constant for consistency.  */
+ 	BUILD_BUG_ON(EPOLL_CLOEXEC != O_CLOEXEC);
+@@ -1362,11 +1525,25 @@ SYSCALL_DEFINE1(epoll_create1, int, flags)
+ 	 * Creates all the items needed to setup an eventpoll file. That is,
+ 	 * a file structure and a free file descriptor.
+ 	 */
+-	error = anon_inode_getfd("[eventpoll]", &eventpoll_fops, ep,
++	fd = get_unused_fd_flags(O_RDWR | (flags & O_CLOEXEC));
++	if (fd < 0) {
++		error = fd;
++		goto out_free_ep;
++	}
++	file = anon_inode_getfile("[eventpoll]", &eventpoll_fops, ep,
+ 				 O_RDWR | (flags & O_CLOEXEC));
+-	if (error < 0)
+-		ep_free(ep);
+-
++	if (IS_ERR(file)) {
++		error = PTR_ERR(file);
++		goto out_free_fd;
++	}
++	fd_install(fd, file);
++	ep->file = file;
++	return fd;
++
++out_free_fd:
++	put_unused_fd(fd);
++out_free_ep:
++	ep_free(ep);
+ 	return error;
+ }
+ 
+@@ -1432,21 +1609,27 @@ SYSCALL_DEFINE4(epoll_ctl, int, epfd, int, op, int, fd,
+ 	/*
+ 	 * When we insert an epoll file descriptor, inside another epoll file
+ 	 * descriptor, there is the change of creating closed loops, which are
+-	 * better be handled here, than in more critical paths.
++	 * better be handled here, than in more critical paths. While we are
++	 * checking for loops we also determine the list of files reachable
++	 * and hang them on the tfile_check_list, so we can check that we
++	 * haven't created too many possible wakeup paths.
+ 	 *
+-	 * We hold epmutex across the loop check and the insert in this case, in
+-	 * order to prevent two separate inserts from racing and each doing the
+-	 * insert "at the same time" such that ep_loop_check passes on both
+-	 * before either one does the insert, thereby creating a cycle.
++	 * We need to hold the epmutex across both ep_insert and ep_remove
++	 * b/c we want to make sure we are looking at a coherent view of
++	 * epoll network.
+ 	 */
+-	if (unlikely(is_file_epoll(tfile) && op == EPOLL_CTL_ADD)) {
++	if (op == EPOLL_CTL_ADD || op == EPOLL_CTL_DEL) {
+ 		mutex_lock(&epmutex);
+ 		did_lock_epmutex = 1;
+-		error = -ELOOP;
+-		if (ep_loop_check(ep, tfile) != 0)
+-			goto error_tgt_fput;
+ 	}
+-
++	if (op == EPOLL_CTL_ADD) {
++		if (is_file_epoll(tfile)) {
++			error = -ELOOP;
++			if (ep_loop_check(ep, tfile) != 0)
++				goto error_tgt_fput;
++		} else
++			list_add(&tfile->f_tfile_llink, &tfile_check_list);
++	}
+ 
+ 	mutex_lock_nested(&ep->mtx, 0);
+ 
+@@ -1465,6 +1648,7 @@ SYSCALL_DEFINE4(epoll_ctl, int, epfd, int, op, int, fd,
+ 			error = ep_insert(ep, &epds, tfile, fd);
+ 		} else
+ 			error = -EEXIST;
++		clear_tfile_check_list();
+ 		break;
+ 	case EPOLL_CTL_DEL:
+ 		if (epi)
+@@ -1483,7 +1667,7 @@ SYSCALL_DEFINE4(epoll_ctl, int, epfd, int, op, int, fd,
+ 	mutex_unlock(&ep->mtx);
+ 
+ error_tgt_fput:
+-	if (unlikely(did_lock_epmutex))
++	if (did_lock_epmutex)
+ 		mutex_unlock(&epmutex);
+ 
+ 	fput(tfile);
+diff --git a/include/linux/eventpoll.h b/include/linux/eventpoll.h
+index f362733..657ab55 100644
+--- a/include/linux/eventpoll.h
++++ b/include/linux/eventpoll.h
+@@ -61,6 +61,7 @@ struct file;
+ static inline void eventpoll_init_file(struct file *file)
+ {
+ 	INIT_LIST_HEAD(&file->f_ep_links);
++	INIT_LIST_HEAD(&file->f_tfile_llink);
+ }
+ 
+ 
+diff --git a/include/linux/fs.h b/include/linux/fs.h
+index e0bc4ff..10b2288 100644
+--- a/include/linux/fs.h
++++ b/include/linux/fs.h
+@@ -1001,6 +1001,7 @@ struct file {
+ #ifdef CONFIG_EPOLL
+ 	/* Used by fs/eventpoll.c to link all the hooks to this file */
+ 	struct list_head	f_ep_links;
++	struct list_head	f_tfile_llink;
+ #endif /* #ifdef CONFIG_EPOLL */
+ 	struct address_space	*f_mapping;
+ #ifdef CONFIG_DEBUG_WRITECOUNT
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0072-cdrom-use-copy_to_user-without-the-underscores.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0072-cdrom-use-copy_to_user-without-the-underscores.patch
new file mode 100644
index 0000000..b5eb402
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0072-cdrom-use-copy_to_user-without-the-underscores.patch
@@ -0,0 +1,56 @@
+From c1dd346c39c2a7d3ca7b9670e9504ae19d4e927a Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Mon, 6 Feb 2012 10:20:45 +0100
+Subject: [PATCH 72/73] cdrom: use copy_to_user() without the underscores
+
+commit 822bfa51ce44f2c63c300fdb76dc99c4d5a5ca9f upstream.
+
+"nframes" comes from the user and "nframes * CD_FRAMESIZE_RAW" can wrap
+on 32 bit systems.  That would have been ok if we used the same wrapped
+value for the copy, but we use a shifted value.  We should just use the
+checked version of copy_to_user() because it's not going to make a
+difference to the speed.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/cdrom/cdrom.c |    8 +-------
+ 1 files changed, 1 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/cdrom/cdrom.c b/drivers/cdrom/cdrom.c
+index cedb231..2678b6f 100644
+--- a/drivers/cdrom/cdrom.c
++++ b/drivers/cdrom/cdrom.c
+@@ -2120,11 +2120,6 @@ static int cdrom_read_cdda_old(struct cdrom_device_info *cdi, __u8 __user *ubuf,
+ 	if (!nr)
+ 		return -ENOMEM;
+ 
+-	if (!access_ok(VERIFY_WRITE, ubuf, nframes * CD_FRAMESIZE_RAW)) {
+-		ret = -EFAULT;
+-		goto out;
+-	}
+-
+ 	cgc.data_direction = CGC_DATA_READ;
+ 	while (nframes > 0) {
+ 		if (nr > nframes)
+@@ -2133,7 +2128,7 @@ static int cdrom_read_cdda_old(struct cdrom_device_info *cdi, __u8 __user *ubuf,
+ 		ret = cdrom_read_block(cdi, &cgc, lba, nr, 1, CD_FRAMESIZE_RAW);
+ 		if (ret)
+ 			break;
+-		if (__copy_to_user(ubuf, cgc.buffer, CD_FRAMESIZE_RAW * nr)) {
++		if (copy_to_user(ubuf, cgc.buffer, CD_FRAMESIZE_RAW * nr)) {
+ 			ret = -EFAULT;
+ 			break;
+ 		}
+@@ -2141,7 +2136,6 @@ static int cdrom_read_cdda_old(struct cdrom_device_info *cdi, __u8 __user *ubuf,
+ 		nframes -= nr;
+ 		lba += nr;
+ 	}
+-out:
+ 	kfree(cgc.buffer);
+ 	return ret;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0073-Linux-3.2.9.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0073-Linux-3.2.9.patch
new file mode 100644
index 0000000..a22af08
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.9/0073-Linux-3.2.9.patch
@@ -0,0 +1,24 @@
+From 44fb3170ae46f8de964a4bb5b0504e865a6dd7da Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Wed, 29 Feb 2012 16:32:49 -0800
+Subject: [PATCH 73/73] Linux 3.2.9
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 7df8a84..5f1739b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 8
++SUBLEVEL = 9
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 36df3e6..530fb48 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,7 +11,7 @@ MULTI_CONFIG_BASE_SUFFIX = ""
 
 BRANCH = "v3.2-staging"
 SRCREV = "09e9651bcf2ee8d86685f2a8075bc6557b1d3b91"
-MACHINE_KERNEL_PR_append = "c+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -386,6 +386,120 @@ PATCHES_OVER_PSP = " \
 	file://3.2.6/0085-powernow-k8-Avoid-Pstate-MSR-accesses-on-systems-sup.patch \
 	file://3.2.6/0086-powernow-k8-Fix-indexing-issue.patch \
 	file://3.2.6/0087-Linux-3.2.6.patch \
+	file://3.2.7/0001-ixgbe-fix-vf-lookup.patch \
+	file://3.2.7/0002-igb-fix-vf-lookup.patch \
+	file://3.2.7/0003-perf-evsel-Fix-an-issue-where-perf-report-fails-to-s.patch \
+	file://3.2.7/0004-perf-tools-Fix-perf-stack-to-non-executable-on-x86_6.patch \
+	file://3.2.7/0005-drm-i915-Force-explicit-bpp-selection-for-intel_dp_l.patch \
+	file://3.2.7/0006-drm-i915-no-lvds-quirk-for-AOpen-MP45.patch \
+	file://3.2.7/0007-ath9k-Fix-kernel-panic-during-driver-initilization.patch \
+	file://3.2.7/0008-ath9k-fix-a-WEP-crypto-related-regression.patch \
+	file://3.2.7/0009-ath9k_hw-fix-a-RTS-CTS-timeout-regression.patch \
+	file://3.2.7/0010-hwmon-f75375s-Fix-bit-shifting-in-f75375_write16.patch \
+	file://3.2.7/0011-net-enable-TC35815-for-MIPS-again.patch \
+	file://3.2.7/0012-lib-proportion-lower-PROP_MAX_SHIFT-to-32-on-64-bit-.patch \
+	file://3.2.7/0013-relay-prevent-integer-overflow-in-relay_open.patch \
+	file://3.2.7/0014-mac80211-timeout-a-single-frame-in-the-rx-reorder-bu.patch \
+	file://3.2.7/0015-writeback-fix-NULL-bdi-dev-in-trace-writeback_single.patch \
+	file://3.2.7/0016-writeback-fix-dereferencing-NULL-bdi-dev-on-trace_wr.patch \
+	file://3.2.7/0017-hwmon-f75375s-Fix-automatic-pwm-mode-setting-for-F75.patch \
+	file://3.2.7/0018-cifs-request-oplock-when-doing-open-on-lookup.patch \
+	file://3.2.7/0019-cifs-don-t-return-error-from-standard_receive3-after.patch \
+	file://3.2.7/0020-crypto-sha512-Use-binary-and-instead-of-modulus.patch \
+	file://3.2.7/0021-crypto-sha512-Avoid-stack-bloat-on-i386.patch \
+	file://3.2.7/0022-backing-dev-fix-wakeup-timer-races-with-bdi_unregist.patch \
+	file://3.2.7/0023-ALSA-intel8x0-Fix-default-inaudible-sound-on-Gateway.patch \
+	file://3.2.7/0024-ALSA-hda-Fix-initialization-of-secondary-capture-sou.patch \
+	file://3.2.7/0025-ALSA-hda-Fix-silent-speaker-output-on-Acer-Aspire-69.patch \
+	file://3.2.7/0026-mmc-atmel-mci-save-and-restore-sdioirq-when-soft-res.patch \
+	file://3.2.7/0027-mmc-dw_mmc-Fix-PIO-mode-with-support-of-highmem.patch \
+	file://3.2.7/0028-xen-pvhvm-do-not-remap-pirqs-onto-evtchns-if-xen_hav.patch \
+	file://3.2.7/0029-crypto-sha512-use-standard-ror64.patch \
+	file://3.2.7/0030-Linux-3.2.7.patch \
+	file://3.2.8/0001-i387-math_state_restore-isn-t-called-from-asm.patch \
+	file://3.2.8/0002-i387-make-irq_fpu_usable-tests-more-robust.patch \
+	file://3.2.8/0003-i387-fix-sense-of-sanity-check.patch \
+	file://3.2.8/0004-i387-fix-x86-64-preemption-unsafe-user-stack-save-re.patch \
+	file://3.2.8/0005-i387-move-TS_USEDFPU-clearing-out-of-__save_init_fpu.patch \
+	file://3.2.8/0006-i387-don-t-ever-touch-TS_USEDFPU-directly-use-helper.patch \
+	file://3.2.8/0007-i387-do-not-preload-FPU-state-at-task-switch-time.patch \
+	file://3.2.8/0008-i387-move-AMD-K7-K8-fpu-fxsave-fxrstor-workaround-fr.patch \
+	file://3.2.8/0009-i387-move-TS_USEDFPU-flag-from-thread_info-to-task_s.patch \
+	file://3.2.8/0010-i387-re-introduce-FPU-state-preloading-at-context-sw.patch \
+	file://3.2.8/0011-Linux-3.2.8.patch \
+	file://3.2.9/0001-Security-tomoyo-add-.gitignore-file.patch \
+	file://3.2.9/0002-powerpc-perf-power_pmu_start-restores-incorrect-valu.patch \
+	file://3.2.9/0003-ARM-at91-USB-AT91-gadget-registration-for-module.patch \
+	file://3.2.9/0004-drm-radeon-kms-fix-MSI-re-arm-on-rv370.patch \
+	file://3.2.9/0005-PCI-workaround-hard-wired-bus-number-V2.patch \
+	file://3.2.9/0006-mac80211-Fix-a-rwlock-bad-magic-bug.patch \
+	file://3.2.9/0007-ipheth-Add-iPhone-4S.patch \
+	file://3.2.9/0008-regmap-Fix-cache-defaults-initialization-from-raw-ca.patch \
+	file://3.2.9/0009-eCryptfs-Copy-up-lower-inode-attrs-after-setting-low.patch \
+	file://3.2.9/0010-S390-correct-ktime-to-tod-clock-comparator-conversio.patch \
+	file://3.2.9/0011-vfs-fix-d_inode_lookup-dentry-ref-leak.patch \
+	file://3.2.9/0012-ARM-7326-2-PL330-fix-null-pointer-dereference-in-pl3.patch \
+	file://3.2.9/0013-ALSA-hda-Fix-redundant-jack-creations-for-cx5051.patch \
+	file://3.2.9/0014-mmc-core-check-for-zero-length-ioctl-data.patch \
+	file://3.2.9/0015-NFSv4-Fix-an-Oops-in-the-NFSv4-getacl-code.patch \
+	file://3.2.9/0016-NFSv4-Ensure-we-throw-out-bad-delegation-stateids-on.patch \
+	file://3.2.9/0017-NFSv4-fix-server_scope-memory-leak.patch \
+	file://3.2.9/0018-ARM-7321-1-cache-v7-Disable-preemption-when-reading-.patch \
+	file://3.2.9/0019-ARM-7325-1-fix-v7-boot-with-lockdep-enabled.patch \
+	file://3.2.9/0020-3c59x-shorten-timer-period-for-slave-devices.patch \
+	file://3.2.9/0021-net-Don-t-proxy-arp-respond-if-iif-rt-dst.dev-if-pri.patch \
+	file://3.2.9/0022-netpoll-netpoll_poll_dev-should-access-dev-flags.patch \
+	file://3.2.9/0023-net_sched-Bug-in-netem-reordering.patch \
+	file://3.2.9/0024-veth-Enforce-minimum-size-of-VETH_INFO_PEER.patch \
+	file://3.2.9/0025-via-velocity-S3-resume-fix.patch \
+	file://3.2.9/0026-ipv4-reset-flowi-parameters-on-route-connect.patch \
+	file://3.2.9/0027-tcp_v4_send_reset-binding-oif-to-iif-in-no-sock-case.patch \
+	file://3.2.9/0028-ipv4-Fix-wrong-order-of-ip_rt_get_source-and-update-.patch \
+	file://3.2.9/0029-net-Make-qdisc_skb_cb-upper-size-bound-explicit.patch \
+	file://3.2.9/0030-IPoIB-Stop-lying-about-hard_header_len-and-use-skb-c.patch \
+	file://3.2.9/0031-gro-more-generic-L2-header-check.patch \
+	file://3.2.9/0032-tcp-allow-tcp_sacktag_one-to-tag-ranges-not-aligned-.patch \
+	file://3.2.9/0033-tcp-fix-range-tcp_shifted_skb-passes-to-tcp_sacktag_.patch \
+	file://3.2.9/0034-tcp-fix-tcp_shifted_skb-adjustment-of-lost_cnt_hint-.patch \
+	file://3.2.9/0035-USB-Added-Kamstrup-VID-PIDs-to-cp210x-serial-driver.patch \
+	file://3.2.9/0036-USB-option-cleanup-zte-3g-dongle-s-pid-in-option.c.patch \
+	file://3.2.9/0037-USB-Serial-ti_usb_3410_5052-Add-Abbot-Diabetes-Care-.patch \
+	file://3.2.9/0038-USB-Remove-duplicate-USB-3.0-hub-feature-defines.patch \
+	file://3.2.9/0039-USB-Fix-handoff-when-BIOS-disables-host-PCI-device.patch \
+	file://3.2.9/0040-xhci-Fix-oops-caused-by-more-USB2-ports-than-USB3-po.patch \
+	file://3.2.9/0041-xhci-Fix-encoding-for-HS-bulk-control-NAK-rate.patch \
+	file://3.2.9/0042-USB-Don-t-fail-USB3-probe-on-missing-legacy-PCI-IRQ.patch \
+	file://3.2.9/0043-USB-Set-hub-depth-after-USB3-hub-reset.patch \
+	file://3.2.9/0044-usb-storage-fix-freezing-of-the-scanning-thread.patch \
+	file://3.2.9/0045-target-Allow-control-CDBs-with-data-1-page.patch \
+	file://3.2.9/0046-ASoC-wm8962-Fix-sidetone-enumeration-texts.patch \
+	file://3.2.9/0047-ALSA-hda-realtek-Fix-overflow-of-vol-sw-check-bitmap.patch \
+	file://3.2.9/0048-ALSA-hda-realtek-Fix-surround-output-regression-on-A.patch \
+	file://3.2.9/0049-NOMMU-Lock-i_mmap_mutex-for-access-to-the-VMA-prio-l.patch \
+	file://3.2.9/0050-hwmon-max6639-Fix-FAN_FROM_REG-calculation.patch \
+	file://3.2.9/0051-hwmon-max6639-Fix-PPR-register-initialization-to-set.patch \
+	file://3.2.9/0052-hwmon-ads1015-Fix-file-leak-in-probe-function.patch \
+	file://3.2.9/0053-ARM-omap-fix-oops-in-drivers-video-omap2-dss-dpi.c.patch \
+	file://3.2.9/0054-ARM-omap-fix-oops-in-arch-arm-mach-omap2-vp.c-when-p.patch \
+	file://3.2.9/0055-x86-amd-Fix-L1i-and-L2-cache-sharing-information-for.patch \
+	file://3.2.9/0056-ath9k-stop-on-rates-with-idx-1-in-ath9k-rate-control.patch \
+	file://3.2.9/0057-genirq-Unmask-oneshot-irqs-when-thread-was-not-woken.patch \
+	file://3.2.9/0058-genirq-Handle-pending-irqs-in-irq_startup.patch \
+	file://3.2.9/0059-scsi_scan-Fix-Poison-overwritten-warning-caused-by-u.patch \
+	file://3.2.9/0060-scsi_pm-Fix-bug-in-the-SCSI-power-management-handler.patch \
+	file://3.2.9/0061-ipvs-fix-matching-of-fwmark-templates-during-schedul.patch \
+	file://3.2.9/0062-jme-Fix-FIFO-flush-issue.patch \
+	file://3.2.9/0063-davinci_emac-Do-not-free-all-rx-dma-descriptors-duri.patch \
+	file://3.2.9/0064-builddeb-Don-t-create-files-in-tmp-with-predictable-.patch \
+	file://3.2.9/0065-can-sja1000-fix-isr-hang-when-hw-is-unplugged-under-.patch \
+	file://3.2.9/0066-hdpvr-fix-race-conditon-during-start-of-streaming.patch \
+	file://3.2.9/0067-imon-don-t-wedge-hardware-after-early-callbacks.patch \
+	file://3.2.9/0068-hwmon-f75375s-Fix-register-write-order-when-setting-.patch \
+	file://3.2.9/0069-epoll-introduce-POLLFREE-to-flush-signalfd_wqh-befor.patch \
+	file://3.2.9/0070-epoll-ep_unregister_pollwait-can-use-the-freed-pwq-w.patch \
+	file://3.2.9/0071-epoll-limit-paths.patch \
+	file://3.2.9/0072-cdrom-use-copy_to_user-without-the-underscores.patch \
+	file://3.2.9/0073-Linux-3.2.9.patch \
 	file://0002-f_rndis-HACK-around-undefined-variables.patch \
 	file://0003-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
@@ -406,6 +520,8 @@ PATCHES_OVER_PSP = " \
 	file://0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
 	file://0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch \
 	file://0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
+	file://0022-ARM-OMAP2-am33xx-fix-serial-mux-warnings-for-am33xx.patch \
+	file://0023-ARM-OMAP2-am335x-correct-McASP0-pin-mux-detail.patch \
 "
 
 SRC_URI += "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "", "${PATCHES_OVER_PSP}", d)}"
-- 
1.7.2.5


