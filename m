Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22F09E01304
	for <meta-ti@yoctoproject.org>; Wed, 30 May 2012 11:15:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 1C410529DA; Wed, 30 May 2012 18:15:14 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120530181515.1C410529DA@arago-project.org>
Date: Wed, 30 May 2012 18:15:14 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2.18
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
X-List-Received-Date: Wed, 30 May 2012 18:15:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 2177f80076ebc15cc58fb521b58e49c83315f34e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2177f80076ebc15cc58fb521b58e49c83315f34e

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed May 23 11:20:07 2012 +0200

linux-ti33x-psp 3.2: update to 3.2.18

Duplicate patches between PSP and 3.2.17 have been dropped from the 3.2.17 series

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...a512-Fix-byte-counter-overflow-in-SHA-512.patch |   37 ++
 ...nexant-Don-t-set-HP-pin-control-bit-uncon.patch |   43 +++
 ...nexant-Set-up-the-missing-docking-station.patch |   99 +++++
 ...x-serial-driver-hungs-are-a-result-of-cal.patch |   54 +++
 ...MTIMER-fix-broken-timer-clock-source-sele.patch |   58 +++
 ...mmc-fixes-for-eMMC-v4.5-discard-operation.patch |   72 ++++
 ...mc-fixes-for-eMMC-v4.5-sanitize-operation.patch |  136 +++++++
 ...008-mmc-unbreak-sdhci-esdhc-imx-on-i.MX25.patch |   40 ++
 .../0009-xen-gntdev-do-not-set-VM_PFNMAP.patch     |   37 ++
 ...Add-quirk-to-deal-with-misconfigured-back.patch |  151 ++++++++
 ...emove-allocation-of-coherent-buffer-for-s.patch |   48 +++
 ...ix-missing-URB_NO_TRANSFER_DMA_MAP-flag-i.patch |   35 ++
 ...wb-fix-use-of-del_timer_sync-in-interrupt.patch |   64 ++++
 .../3.2.17/0014-uwb-fix-error-handling.patch       |   34 ++
 .../0015-davinci_mdio-Fix-MDIO-timeout-check.patch |   44 +++
 ...pdate-pcie8766-scratch-register-addresses.patch |   50 +++
 ...mac-resume-transmit-fifo-upon-receiving-f.patch |   57 +++
 .../0018-rc-core-set-mode-for-winbond-cir.patch    |   37 ++
 ...ot-unlock-mutex-if-sanity-check-failed-in.patch |   41 ++
 ...cfg80211-fix-interface-combinations-check.patch |   30 ++
 .../0021-Fix-modpost-failures-in-fedora-17.patch   |   54 +++
 ...-BUG-by-__set_page_dirty_no_writeback-on-.patch |   60 +++
 ...ible-corruption-of-array-metadata-on-shut.patch |   51 +++
 ...-jbd2-use-GFP_NOFS-for-blkdev_issue_flush.patch |   45 +++
 ...cp210x-Fixed-usb_control_msg-timeout-valu.patch |   54 +++
 ...ch_uart-Fix-dma-channel-unallocated-issue.patch |   55 +++
 ...rs-tty-amiserial.c-add-missing-tty_unlock.patch |   36 ++
 ...sierra-avoid-QMI-wwan-interface-on-MC77xx.patch |   60 +++
 ...I-fix-criterion-for-resuming-the-root-hub.patch |   48 +++
 ...-EHCI-always-clear-the-STS_FLR-status-bit.patch |   46 +++
 ...dlock-in-bConfigurationValue-attribute-me.patch |  116 ++++++
 ...eliminate-NULL-pointer-dereference-bugfix.patch |   56 +++
 ...ap-fix-crash-when-musb-glue-omap-gets-ini.patch |   44 +++
 ...ap-fix-the-error-check-for-pm_runtime_get.patch |   48 +++
 ...rk-for-still-enabled-interrupts-on-Intel-.patch |   89 +++++
 ...dianness-breakage-in-ext4_split_extent_at.patch |   33 ++
 ...ages-from-the-iommu-when-slots-are-remove.patch |  109 ++++++
 ...ptop-add-3-machines-that-has-touchpad-LED.patch |   58 +++
 ...-touchpad-LED-should-persist-its-status-a.patch |   34 ++
 ...uetooth-Add-support-for-Atheros-04ca-3005.patch |   64 ++++
 .../0041-Don-t-limit-non-nested-epoll-paths.patch  |   45 +++
 ...ice-unregistration-when-unregistering-the.patch |   38 ++
 ...pi-mpc83xx-fix-NULL-pdata-dereference-bug.patch |   42 +++
 ...dd-support-for-the-Fujitsu-Stylistic-Q550.patch |   33 ++
 .../0045-rt2x00-Identify-rt2800usb-chipsets.patch  |  148 ++++++++
 ...rken-error-value-for-setattr-on-read-only.patch |   45 +++
 ...ror-values-returned-by-nfsd4_lockt-when-n.patch |   73 ++++
 ...dianness-breakage-in-TEST_STATEID-handlin.patch |   36 ++
 ...9-nfsd-fix-compose_entry_fh-failure-exits.patch |   92 +++++
 ...-btrfs_root_readonly-broken-on-big-endian.patch |   33 ++
 ...s2-l_next_free_req-breakage-on-big-endian.patch |   53 +++
 .../0052-ocfs-rl_used-breakage-on-big-endian.patch |   58 +++
 .../0053-ocfs2-rl_count-endianness-breakage.patch  |   31 ++
 ...ocfs2-e_leaf_clusters-endianness-breakage.patch |   40 ++
 .../3.2.17/0055-lockd-fix-the-endianness-bug.patch |   45 +++
 ...-ep0-increment-actual-on-bounced-ep0-case.patch |   41 ++
 .../0057-net-fix-proc-net-dev-regression.patch     |  185 ++++++++++
 ...fail-unchecked-creates-of-non-special-fil.patch |   75 ++++
 ...stop-and-restart-queue-on-every-TX-packet.patch |   65 ++++
 ...cp-allow-splice-to-build-full-TSO-packets.patch |  129 +++++++
 ...struct-sctp_event_subscribe-to-grow-witho.patch |   56 +++
 ...ot-send-queries-on-multicast-group-leaves.patch |  199 ++++++++++
 ...63-ipv6-fix-array-index-in-ip6_mc_add_src.patch |   39 ++
 ...t-Check-input-from-user-before-allocating.patch |   78 ++++
 ...perly-unset-current_arp_slave-on-slave-li.patch |   45 +++
 ...m-prevent-a-possible-kernel-bug-due-to-mi.patch |   37 ++
 ...0067-netlink-fix-races-after-skb-queueing.patch |   82 ++++
 ...0068-net-fix-a-race-in-sock_queue_err_skb.patch |   43 +++
 ..._rcv_rtt_update-use-of-an-unscaled-RTT-sa.patch |   50 +++
 ...-pskb_expand_head-to-get-maximum-tailroom.patch |   48 +++
 .../3.2.17/0071-tcp-fix-tcp_trim_head.patch        |   57 +++
 ...d-order-1-allocations-on-wifi-and-tx-path.patch |  134 +++++++
 ...l1-fix-kernel-panic-in-case-of-DMA-errors.patch |  106 ++++++
 ...intr-mask-after-its-handler-is-registered.patch |   67 ++++
 ...smsc911x-fix-skb-handling-in-receive-path.patch |   78 ++++
 ...t-ks8851_mll-fix-rx-frame-buffer-overflow.patch |   46 +++
 ...d-gred-Fix-oops-in-gred_dump-in-WRED-mode.patch |   54 +++
 .../3.2.17/0078-net-usb-smsc75xx-fix-mtu.patch     |   39 ++
 .../3.2.17/0079-dummy-Add-ndo_uninit.patch         |   55 +++
 ...tcp_grow_window-for-large-incoming-frames.patch |   40 ++
 ...-not-leak-net_generic-data-on-failed-init.patch |   79 ++++
 ...-t-copy-too-much-in-netdev_set_mac_addres.patch |   36 ++
 ...et-ax25-Reorder-ax25_exit-to-remove-races.patch |   58 +++
 ..._MAXSEG-for-established-IPv6-passive-sock.patch |   41 ++
 ...-hostname-in-brackets-when-needed-in-nfs_.patch |   49 +++
 ...e-that-the-LOCK-code-sets-exception-inode.patch |   54 +++
 ...e-that-we-check-lock-exclusive-shared-typ.patch |   45 +++
 ...open-context-on-error-in-nfs_pagein_multi.patch |   30 ++
 ...-open-context-on-error-in-nfs_flush_multi.patch |   30 ++
 ...de-Fix-sysfs-warning-during-module-unload.patch |   71 ++++
 ...IC-code-touches-invalid-MSR-on-P5-class-m.patch |   91 +++++
 ...fs-work-around-unhappy-compat-problem-on-.patch |  135 +++++++
 ...ly-check-for-pending-events-when-restorin.patch |   47 +++
 ...-crash-when-booting-with-ACPI-hotplug-CPU.patch |   99 +++++
 ...nsure-power-gets-managed-for-line-widgets.patch |   43 +++
 ...-Improve-sequencing-of-AIF-channel-enable.patch |  389 ++++++++++++++++++++
 ...t_hdmac-remove-clear-on-read-in-atc_dosta.patch |   40 ++
 ...OPS-when-build_sched_domains-percpu-alloc.patch |   85 +++++
 ...-stacktrace-of-latency-tracers-irqsoff-an.patch |   62 +++
 ...h_power-fix-bogus-values-with-current-BIO.patch |   93 +++++
 ...wmon-fam15h_power-Fix-pci_device_id-array.patch |   49 +++
 ...ell-laptop-Terminate-quirks-list-properly.patch |   32 ++
 ...kms-need-to-set-up-ss-on-DP-bridges-as-we.patch |   40 ++
 ...ndle-input-output-sdvo-timings-separately.patch |  182 +++++++++
 ...drm-i915-relative_constants_mode-race-fix.patch |   78 ++++
 ...drm-i915-Force-sync-command-ordering-Gen6.patch |   98 +++++
 ...t-the-Stencil-Cache-eviction-policy-to-no.patch |   69 ++++
 ...x-integer-overflow-in-i915_gem_execbuffer.patch |   40 ++
 ...x-integer-overflow-in-i915_gem_do_execbuf.patch |   41 ++
 ...11-ensure-interface-is-up-in-various-APIs.patch |  152 ++++++++
 ...d-external-mic-quirk-for-Asus-Zenbook-UX3.patch |   37 ++
 ...-fix-race-leading-leading-to-memory-corru.patch |   64 ++++
 ...ix-crash-during-suspend-on-ASUS-computers.patch |   97 +++++
 ...storage-gadgets-send-wrong-error-code-for.patch |   55 +++
 ...dget-dummy-do-not-call-pullup-on-udc_stop.patch |   35 ++
 ...uvc-uvc_request_data-length-field-must-be.patch |   50 +++
 ...es-add-a-packetized-pipe-mode-for-writing.patch |  143 +++++++
 ...-the-autofsv5-packet-file-descriptor-use-.patch |  117 ++++++
 ...errata-only-handle-ARM-erratum-326103-on-.patch |   89 +++++
 ...l2x0-only-apply-workaround-for-erratum-75.patch |   62 +++
 ...l2x0-only-write-to-debug-registers-on-PL3.patch |   69 ++++
 ...-1-tls-remove-covert-channel-via-TPIDRURW.patch |   52 +++
 ...hotplug-copy-the-affinity-mask-when-force.patch |   53 +++
 ...sas_find_bcast_phy-in-the-presence-of-vac.patch |   59 +++
 ...false-positive-device-attached-conditions.patch |   48 +++
 .../0126-efi-Add-new-variable-attributes.patch     |   45 +++
 .../0127-efi-Validate-UEFI-boot-variables.patch    |  231 ++++++++++++
 ...e-fix-the-number-of-pages-used-for-hibern.patch |  100 +++++
 ...15-enable-dip-before-writing-data-on-gen4.patch |   50 +++
 ...0130-sched-Fix-nohz-load-accounting-again.patch |  133 +++++++
 .../0131-efivars-Improve-variable-validation.patch |  142 +++++++
 ...0132-fs-cifs-fix-parsing-of-dfs-referrals.patch |   49 +++
 ...seqcount_begin-to-use-ACCESS_ONCE-for-seq.patch |   51 +++
 ...34-hwmon-coretemp-Increase-CPU-core-limit.patch |   35 ++
 ...5-nouveau-initialise-has_optimus-variable.patch |   31 ++
 ...136-hwmon-coretemp-fix-oops-on-cpu-unplug.patch |   77 ++++
 ...-old-error-history-when-counting-probe-tr.patch |   42 +++
 ...load-config-after-successful-initializati.patch |   48 +++
 .../0139-i2c-pnx-Disable-clk-in-suspend.patch      |   38 ++
 ...-race-condition-in-the-command-completion.patch |   74 ++++
 ...0211-fix-AP-mode-EAP-tx-for-VLAN-stations.patch |   38 ++
 .../3.2.17/0142-rtlwifi-Fix-oops-on-unload.patch   |   67 ++++
 ...ix-crash-on-remove-due-to-premature-kfree.patch |   40 ++
 ...crash-on-remove-due-to-leftover-work-item.patch |   35 ++
 ...45-iwlwifi-do-not-nulify-ctx-vif-on-reset.patch |   85 +++++
 ...46-iwlwifi-fix-hardware-queue-programming.patch |  114 ++++++
 ...47-hfsplus-Fix-potential-buffer-overflows.patch |   79 ++++
 .../0148-ASoC-tlv312aic23-unbreak-resume.patch     |   51 +++
 ...m-generic-Use-__BITS_PER_LONG-in-statfs.h.patch |   37 ++
 ...0150-x86-relocs-Remove-an-unused-variable.patch |   41 ++
 ...Add-extra-clobber-registers-for-assembly-.patch |   43 +++
 ...SMP-prevent-use-of-the-console-when-using.patch |   58 +++
 ...drm-i915-disable-sdvo-hotplug-on-i945g-gm.patch |   56 +++
 ...-no-set-Stencil-Cache-eviction-LRA-w-a-on.patch |   51 +++
 ...-crashes-when-trying-to-see-non-existent-.patch |   63 ++++
 ...-t-use-PCI-BIOS-service-for-configuration.patch |   53 +++
 ...don-t-use-PMD_SIZE-as-embedded-atom_size-.patch |   68 ++++
 ...-allow-up-to-uCode-API-6-for-6000-devices.patch |   64 ++++
 ...wlwifi-use-correct-released-ucode-version.patch |  159 ++++++++
 ...wlwifi-use-6000G2B-for-6030-device-series.patch |   44 +++
 ...-simplify-the-we-have-changed-execution-d.patch |   75 ++++
 ...-fix-the-parent-has-changed-security-doma.patch |   77 ++++
 ...12u-Fix-regression-caused-by-commit-8c213.patch |   66 ++++
 ...rk-link-down-on-startup-and-let-PHY-inter.patch |   46 +++
 .../3.2.17/0165-Linux-3.2.17.patch                 |   24 ++
 ...ix-the-logic-to-ensure-new-voltage-settin.patch |   35 ++
 ...vert-ARM-OMAP-ctrl-Fix-CONTROL_DSIPHY-reg.patch |   52 +++
 ...oaudio-Remove-incorrect-part-of-assertion.patch |   46 +++
 ...ARM-orion5x-Fix-GPIO-enable-bits-for-MPP9.patch |   41 ++
 ...ssen-CPU-usage-when-waiting-for-chip-to-r.patch |   56 +++
 ..._embed_first_chunk-should-free-unused-par.patch |   57 +++
 ...event-BUG_ON-in-hugetlb_fault-hugetlb_cow.patch |   46 +++
 ...spaces-pid_ns-fix-leakage-on-fork-failure.patch |   49 +++
 ...m-fix-sign-extend-problem-in-__free_pages.patch |   49 +++
 ...ix-tx-transfer-padding-for-full-speed-USB.patch |   45 +++
 .../3.2.18/0011-netem-fix-possible-skb-leak.patch  |   39 ++
 ...gister_netdevice_notifier-unregister-the-.patch |   64 ++++
 ...lock-socket-lock-before-returning-from-l2.patch |   47 +++
 ...2-propogate-rx-hash-when-packet-is-copied.patch |   38 ++
 ...ceive-length-error-in-mixed-non-VLAN-VLAN.patch |  136 +++++++
 .../3.2.18/0016-sungem-Fix-WakeOnLan.patch         |   35 ++
 ...-panic-from-reserved-statblk-field-access.patch |   67 ++++
 ...tcp-fix-infinite-cwnd-in-tcp_complete_cwr.patch |   46 +++
 ...p-change-tcp_adv_win_scale-and-tcp_rmem-2.patch |  124 +++++++
 ...mac-pass-missing-argument-to-brcms_b_mute.patch |   43 +++
 ...fix-Auto-Power-Saving-in-ip101a_config_in.patch |   43 +++
 .../0022-NFSv4-Revalidate-uid-gid-after-open.patch |   74 ++++
 ...-incorrect-se_lun_acl-release-for-dynamic.patch |   70 ++++
 .../0024-marvell-cam-fix-an-ARM-build-error.patch  |   34 ++
 .../3.2.18/0025-rc-Postpone-ISR-registration.patch |  325 ++++++++++++++++
 ...gnore-bogus-union-descriptor-for-RNDIS-de.patch |   75 ++++
 ...Fix-lock-acquisition-order-bug-in-gc-path.patch |  103 +++++
 ...5p-fimc-Fix-locking-in-subdev-set_crop-op.patch |   35 ++
 ...eck-if-scsi_dh-module-already-loaded-befo.patch |   39 ++
 ...o-not-clobber-g2-in-xcall_fetch_glob_regs.patch |   58 +++
 ...ssing-spin_lock_init-in-gpio-ml-ioh-drive.patch |   33 ++
 ...f-pch-Modify-pci-bus-number-dynamically-t.patch |   32 ++
 ...f-pch-Fix-issue-for-transmitting-over-4KB.patch |  187 ++++++++++
 ...f-pch-supports-a-spi-mode-setup-and-bit-o.patch |   34 ++
 ...f-pch-add-recovery-processing-in-case-wai.patch |   43 +++
 ...d-deadlock-on-sync-mounted-FS-w-o-journal.patch |   64 ++++
 .../3.2.18/0037-ia64-Add-accept4-syscall.patch     |   57 +++
 ...mac-fix-endless-retry-of-A-MPDU-transmiss.patch |   60 +++
 ...vfp-ensure-preemption-is-disabled-when-en.patch |   73 ++++
 ...SPC-2-RELEASE-bug-for-multi-session-iSCSI.patch |   42 +++
 ...-mv_cesa-requires-on-CRYPTO_HASH-to-build.patch |   51 +++
 ...t-Fix-power-map-for-speaker-pins-with-som.patch |   46 +++
 .../0043-ASoC-wm8994-Fix-AIF2ADC-power-down.patch  |   29 ++
 ...fix-skb-traversing-races-during-unlink-v2.patch |  222 +++++++++++
 ...dd-Novatel-USB551L-device-IDs-for-FLAG_WW.patch |   58 +++
 ...-VM_GROWSDOWN-mmaps-extending-below-FIRST.patch |   33 ++
 ...pply-commit-74fca9da0-to-the-compat-signa.patch |   49 +++
 ...timer_sync-to-mddev_suspend-fix-nasty-pan.patch |   38 ++
 ...bug-in-handling-of-FILEIO-block_device-re.patch |   78 ++++
 ...sendpages-must-try-to-push-data-out-on-oo.patch |   57 +++
 ...1-e1000-Prevent-reset-task-killing-itself.patch |   40 ++
 ...052-mtd-map.h-fix-arm-cross-build-failure.patch |   37 ++
 ...tmmac-Fix-compilation-error-in-mmc_core.c.patch |   38 ++
 .../0054-pktgen-fix-crash-at-module-unload.patch   |   72 ++++
 .../0055-pktgen-fix-module-unload-for-good.patch   |   48 +++
 .../3.2.18/0056-Linux-3.2.18.patch                 |   24 ++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  223 +++++++++++-
 223 files changed, 14794 insertions(+), 2 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=2177f80076ebc15cc58fb521b58e49c83315f34e

