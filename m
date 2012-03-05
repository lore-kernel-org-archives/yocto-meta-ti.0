Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53C1AE013BF
	for <meta-ti@yoctoproject.org>; Sun,  4 Mar 2012 20:37:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 23C98529B7; Mon,  5 Mar 2012 04:37:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120305043707.23C98529B7@arago-project.org>
Date: Mon,  5 Mar 2012 04:37:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2. 9 and add 2 patches from PSP tree
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
X-List-Received-Date: Mon, 05 Mar 2012 04:37:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 4d6e7c358e61f2053f945423718d0923b6413f99
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4d6e7c358e61f2053f945423718d0923b6413f99

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Thu Mar  1 09:35:40 2012 +0100

linux-ti33x-psp 3.2: update to 3.2.9 and add 2 patches from PSP tree

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=4d6e7c358e61f2053f945423718d0923b6413f99

