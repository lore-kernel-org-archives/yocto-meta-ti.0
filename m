Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76B12E013E8
	for <meta-ti@lists.yoctoproject.org>;
	Thu,  1 Mar 2012 00:48:48 -0800 (PST)
Received: by wibhi8 with SMTP id hi8so227697wib.26
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 01 Mar 2012 00:48:46 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.7.231 as permitted sender)
	client-ip=10.180.7.231; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.7.231 as permitted
	sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.7.231])
	by 10.180.7.231 with SMTP id m7mr30399467wia.3.1330591726901 (num_hops
	= 1); Thu, 01 Mar 2012 00:48:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.180.7.231 with SMTP id m7mr24380873wia.3.1330591726718;
	Thu, 01 Mar 2012 00:48:46 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	fq10sm15642813wib.11.2012.03.01.00.48.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Mar 2012 00:48:45 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Thu,  1 Mar 2012 09:48:33 +0100
Message-Id: <1330591716-30218-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
X-Gm-Message-State: ALoCoQmwK7FtrBOLKMY6sV8kRiRhOQYCgaL77HKu1ZTwfytwCG0w2GP1nWuB+DbaG6B1cGYxf3mV
Subject: [PATCH 0/3] beagleboard.org board updates
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
X-List-Received-Date: Thu, 01 Mar 2012 08:48:49 -0000

The following changes since commit f581b98514272f49c7a4a210a062ee0122b1908f:

  recipes: fix the remaining missing quotes (2012-02-29 15:43:39 -0500)

are available in the git repository at:
  git://github.com/Angstrom-distribution/meta-ti.git beagleboard.org-20120301

Koen Kooi (3):
      linux 3.0: enable 'option' serial for beagleboard
      linux 3.0: update to 3.0.23
      linux-ti33x-psp 3.2: update to 3.2.9 and add 2 patches from PSP tree

 conf/machine/include/omap3.inc                     |    2 +-
 conf/machine/include/ti33x.inc                     |    2 +-
 .../linux/linux-3.0/beagleboard/defconfig          |    5 +-
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
 recipes-kernel/linux/linux_3.0.bb                  |    6 +-
 121 files changed, 9917 insertions(+), 8 deletions(-)
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

