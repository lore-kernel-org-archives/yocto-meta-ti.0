Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 475CEE01446
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:19 -0700 (PDT)
Received: by mail-ey0-f176.google.com with SMTP id d1so500603eab.35
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rXAxlScXf0E3Fo25GYI+tBcX712k/IaWWQwAcMO9I+k=;
	b=g6sjoB9lrVs/fO7IaPzaTq1ky4BHiscBECX/Z7GD3aA5Z14Fiuyjhu69rVe9rgSrYo
	mfqV98HfqoOLFZ95EYVzk+/SE7m26Zc0hpPgS3C1iI4/lULw3A7DrHqkjzde3/RxRcxI
	qElz7VD2nQKaHhr0gK+PrOkJ3TQQsjZLdkB7E+HkmJkFcFnlq114+KcDbzQkbUDqf4Pl
	CdESR2A3e5Sf+ElcA7CDpKgMfKySAHCSxhltvqLAqi5NqwZNP1xova7DRGk8/jXfY4Y/
	xrgPd7YANlSmqj4c0I4eUbxGpbhPH0bq60TwQZfyfNR9qGyuy51ra/2FDnRfvBTpmB1m
	W4/g==
Received: by 10.14.219.198 with SMTP id m46mr5516432eep.18.1346316918637;
	Thu, 30 Aug 2012 01:55:18 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id u8sm2971416eel.11.2012.08.30.01.55.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 01:55:16 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 30 Aug 2012 10:54:57 +0200
Message-Id: <1346316899-11441-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
References: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQm9y48rG+TOV4pGibmgmJnE8fq4YQ2L4uvF6i3NECkXvKftOu1Tbn4GOJxA5HZJakw9mF84
Subject: [PATCH 4/6] linux-ti33x-psp 3.2: update to 3.2.28 and add motorcape support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Aug 2012 08:55:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...y-code-by-removing-a-SMP-ifdefs-from-stru.patch |  273 ++++++++++++++++
 .../3.2.26/0002-Linux-3.2.26.patch                 |   24 ++
 .../3.2.27/0001-sched-Fix-race-in-task_group.patch |  158 +++++++++
 ...nup-disk-queue-before-caling-put_disk-if-.patch |   51 +++
 ...ocal-pages-as-FOREIGN-in-the-m2p_override.patch |  156 +++++++++
 ...04-lirc_sir-make-device-registration-work.patch |  131 ++++++++
 ...te-references-to-older-2.6-versions-for-3.patch |   62 ++++
 ...add-dock-support-for-Thinkpad-X230-Tablet.patch |  107 ++++++
 ...x-interface-combinations-check-for-ADHOC-.patch |   67 ++++
 ...68k-Correct-the-Atari-ALLOWINT-definition.patch |   97 ++++++
 .../0009-ene_ir-Fix-driver-initialisation.patch    |   47 +++
 ...r-filesystems-are-normally-case-sensitive.patch |   32 ++
 ...arch_get_random_int-instead-of-cycle-coun.patch |   69 ++++
 ...arch-specific-RNG-to-initialize-the-entro.patch |   49 +++
 ...ust-the-number-of-loops-when-initializing.patch |   37 +++
 ...-add_interrupt_randomness-do-something-sa.patch |  288 +++++++++++++++++
 ...lockless-techniques-in-the-interrupt-path.patch |  245 ++++++++++++++
 ...om-create-add_device_randomness-interface.patch |   93 ++++++
 ...B-device-information-to-the-dev-random-dr.patch |   49 +++
 ...v-random-with-the-MAC-address-when-regist.patch |   60 ++++
 ...the-arch-specific-rng-in-xfer_secondary_p.patch |   91 ++++++
 ...om-add-new-get_random_bytes_arch-function.patch |   95 ++++++
 ...Feed-the-write-counter-into-device_add_ra.patch |   75 +++++
 ...Feed-the-device-UUID-into-device_add_rand.patch |   54 ++++
 ...-Ensure-there-are-enough-BCLKs-for-four-c.patch |   33 ++
 ...for-pi_mutex-on-fault-in-futex_wait_reque.patch |   38 +++
 ...ex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch |   36 +++
 ...bid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch |   59 ++++
 ...deo-smscufx-fix-line-counting-in-fb_write.patch |   36 +++
 ...tics-handle-out-of-bounds-values-from-the.patch |   89 +++++
 ...x-invalid-D3-of-headphone-DAC-on-VT202x-c.patch |   60 ++++
 ...1-Fix-missing-initialization-of-irq-field.patch |   34 ++
 ...ssing-break-resulting-in-incorrect-select.patch |   36 +++
 ...ngrade-page-table-after-fork-of-a-31-bit-.patch |  140 ++++++++
 ...OMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch |   73 +++++
 .../0034-dm-thin-reduce-endio_hook-pool-size.patch |   37 +++
 ...-memory-leak-in-process_prepared_mapping-.patch |   53 +++
 ...in-architectural-randomness-in-extract_bu.patch |  151 +++++++++
 ...e-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch |   44 +++
 ...tio-blk-Use-block-layer-provided-spinlock.patch |  103 ++++++
 ...x-fault-handling-for-page-table-walk-case.patch |   72 +++++
 ...mmit-in-releasepage-if-we-re-freeing-memo.patch |  182 +++++++++++
 ...on-t-abort-a-resync-on-the-first-badblock.patch |   48 +++
 ...rly_ioremap-early_iounmap-to-access-pcdp-.patch |   73 +++++
 ...f.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch |   48 +++
 ...deadlock-issue-between-chcp-and-thaw-ioct.patch |  144 +++++++++
 ...rn-negative-value-in-case-rpcbind-client-.patch |   45 +++
 ...mutex-use-generic-xchg-based-implementati.patch |  165 ++++++++++
 ...vfp-only-clear-vfp-state-for-current-cpu-.patch |   36 +++
 ...vfp-Always-save-VFP-state-in-vfp_pm_suspe.patch |   58 ++++
 ...errata-extend-workaround-for-erratum-7207.patch |   62 ++++
 ...-undefined-instruction-exception-handling.patch |  335 +++++++++++++++++++
 ...gp-increase-the-controller-wait-time-to-c.patch |   38 +++
 ...ASoC-wm8962-Allow-VMID-time-to-fully-ramp.patch |   32 ++
 ...ge_alloc.c-remove-pageblock_default_order.patch |   98 ++++++
 ...geblock_order-before-it-s-used-by-sparsem.patch |  101 ++++++
 ...fier-fix-freed-page-still-mapped-in-secon.patch |  137 ++++++++
 ...s-close-race-during-teardown-of-hugetlbfs.patch |  340 ++++++++++++++++++++
 ...A-snd-usb-fix-clock-source-validity-index.patch |   40 +++
 ...pport-dock-on-Lenovo-Thinkpad-T530-with-A.patch |   34 ++
 ...-ore-Fix-out-of-bounds-access-in-_ios_obj.patch |   75 +++++
 ...ys_atomic_cmpxchg_32-work-on-classic-m68k.patch |   41 +++
 ...efer-wide-slow-to-fast-narrow-in-DP-confi.patch |   41 +++
 ...support-for-BUFFALO-WLI-UC-GNM2-to-rt2800.patch |   32 ++
 ...r-fix-sleeping-in-invalid-context-warning.patch |  115 +++++++
 ...p_monitor-Make-updating-data-skb-smp-safe.patch |  187 +++++++++++
 ...r-prevent-init-path-from-scheduling-on-th.patch |   93 ++++++
 ...drop_monitor-dont-sleep-in-atomic-context.patch |  244 ++++++++++++++
 ...h_uart-Fix-missing-break-for-16-byte-fifo.patch |   33 ++
 ...uart-Fix-rx-error-interrupt-setting-issue.patch |   85 +++++
 .../0069-pch_uart-Fix-parity-setting-issue.patch   |   35 ++
 .../3.2.27/0070-Linux-3.2.27.patch                 |   24 ++
 .../0001-bnx2-Fix-bug-in-bnx2_free_tx_skbs.patch   |   47 +++
 .../0002-sch_sfb-Fix-missing-NULL-check.patch      |   33 ++
 ...st-corruption-resulting-from-freeing-an-a.patch |  188 +++++++++++
 ...04-caif-Fix-access-to-freed-pernet-memory.patch |   52 +++
 ...-follow-a-NULL-pointer-when-setsockopt-is.patch |   95 ++++++
 .../3.2.28/0006-caif-fix-NULL-pointer-check.patch  |   33 ++
 .../0007-wanmain-comparing-array-with-NULL.patch   |   83 +++++
 ...Add-TCP_USER_TIMEOUT-negative-value-check.patch |   39 +++
 ...B-kaweth.c-use-GFP_ATOMIC-under-spin_lock.patch |   40 +++
 ...etlink-IFF_PROMISC-and-IFF_ALLMULTI-handl.patch |   60 ++++
 ...-DMA-to-userspace-only-if-there-is-a-task.patch |   57 ++++
 .../0012-net-tun-fix-ioctl-based-info-leaks.patch  |   41 +++
 ...ropped-DMA-receive-enable-back-in-for-WoL.patch |   50 +++
 ...8192cu-Change-buffer-allocation-for-synch.patch |   77 +++++
 ...-overflow-in-sector-calculations-in-hfspl.patch |   40 +++
 ...xup-seqno-allocation-logic-for-lazy_reque.patch |  182 +++++++++++
 ...ertise-CPU_BASED_RDPMC_EXITING-for-nested.patch |   37 +++
 .../0018-mac80211-cancel-mesh-path-timer.patch     |   32 ++
 ...0019-ath9k-Add-PID-VID-support-for-AR1111.patch |   65 ++++
 ...ove-MMAP_MIN_ADDR-setting-from-mxs_defcon.patch |   52 +++
 ...A-hda-add-dock-support-for-Thinkpad-T430s.patch |   34 ++
 ...ocess-pending-events-when-unregistering-n.patch |   72 +++++
 ...-NULL-pointer-dereference-in-config_lna_g.patch |   39 +++
 ...able-greenfield-transmissions-as-a-workar.patch |   53 +++
 ...SA-hda-add-dock-support-for-Thinkpad-X230.patch |   32 ++
 ...00e-NIC-goes-up-and-immediately-goes-down.patch |   41 +++
 ...LSA-hda-remove-quirk-for-Dell-Vostro-1015.patch |   32 ++
 ...x-double-quirk-for-Quanta-FL1-Lenovo-Idea.patch |   43 +++
 ...a-remove-irq_to_gpio-from-ezx-pcap-driver.patch |   57 ++++
 ...ut-eeti_ts-pass-gpio-value-instead-of-IRQ.patch |  150 +++++++++
 ...drm-i915-Add-wait_for-in-init_ring_common.patch |   41 +++
 ...15-correctly-order-the-ring-init-sequence.patch |   49 +++
 ...-fix-compat-wrappers-for-process_vm-syste.patch |   40 +++
 ...-s390-compat-fix-mmap-compat-system-calls.patch |   54 ++++
 ...n-fix-bank-tiling-parameters-on-evergreen.patch |   44 +++
 ...deon-fix-bank-tiling-parameters-on-cayman.patch |   45 +++
 ...do-not-reenable-crtc-after-moving-vram-st.patch |  178 ++++++++++
 .../3.2.28/0038-Linux-3.2.28.patch                 |   24 ++
 ...335xevm-Add-Beaglebone-Motor-Cape-Support.patch |   43 +++
 ...-MUXENTRYs-for-MCASP0_ACLKX-FSX-to-add-eh.patch |   37 +++
 ...eartbeat-stop-on-shutdown-reboot-or-panic.patch |    8 +-
 ...WM-ecap-Correct-configuration-of-polarity.patch |   42 +++
 ...m335x-mux-add-ecap2_in_pwm2_out-string-en.patch |   29 ++
 ...M335x-hwmod-Remove-PRCM-entries-for-PWMSS.patch |  107 ++++++
 ...ecap-Resets-the-PWM-output-to-low-on-stop.patch |   40 +++
 ...ix-for-throwing-PWM-output-before-running.patch |   52 +++
 ...wm-ehrpwm-Configure-polarity-on-pwm_start.patch |   30 ++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  131 +++++++-
 121 files changed, 9365 insertions(+), 12 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0001-x86-Simplify-code-by-removing-a-SMP-ifdefs-from-stru.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0002-Linux-3.2.26.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0001-sched-Fix-race-in-task_group.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0002-floppy-Cleanup-disk-queue-before-caling-put_disk-if-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0003-xen-mark-local-pages-as-FOREIGN-in-the-m2p_override.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0004-lirc_sir-make-device-registration-work.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0005-stable-update-references-to-older-2.6-versions-for-3.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0006-ALSA-hda-add-dock-support-for-Thinkpad-X230-Tablet.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0007-cfg80211-fix-interface-combinations-check-for-ADHOC-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0008-m68k-Correct-the-Atari-ALLOWINT-definition.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0009-ene_ir-Fix-driver-initialisation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0010-nfsd4-our-filesystems-are-normally-case-sensitive.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0011-random-Use-arch_get_random_int-instead-of-cycle-coun.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0012-random-Use-arch-specific-RNG-to-initialize-the-entro.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0013-random-Adjust-the-number-of-loops-when-initializing.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0014-random-make-add_interrupt_randomness-do-something-sa.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0015-random-use-lockless-techniques-in-the-interrupt-path.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0016-random-create-add_device_randomness-interface.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0017-usb-feed-USB-device-information-to-the-dev-random-dr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0018-net-feed-dev-random-with-the-MAC-address-when-regist.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0019-random-use-the-arch-specific-rng-in-xfer_secondary_p.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0020-random-add-new-get_random_bytes_arch-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0021-rtc-wm831x-Feed-the-write-counter-into-device_add_ra.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0022-mfd-wm831x-Feed-the-device-UUID-into-device_add_rand.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0023-ASoC-wm8994-Ensure-there-are-enough-BCLKs-for-four-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0024-futex-Test-for-pi_mutex-on-fault-in-futex_wait_reque.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0025-futex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0026-futex-Forbid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0027-video-smscufx-fix-line-counting-in-fb_write.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0028-Input-synaptics-handle-out-of-bounds-values-from-the.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0029-ALSA-hda-Fix-invalid-D3-of-headphone-DAC-on-VT202x-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0030-ALSA-mpu401-Fix-missing-initialization-of-irq-field.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0031-x86-nops-Missing-break-resulting-in-incorrect-select.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0032-s390-mm-downgrade-page-table-after-fork-of-a-31-bit-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0033-Redefine-ATOMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0034-dm-thin-reduce-endio_hook-pool-size.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0035-dm-thin-fix-memory-leak-in-process_prepared_mapping-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0036-random-mix-in-architectural-randomness-in-extract_bu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0037-asus-wmi-use-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0038-virtio-blk-Use-block-layer-provided-spinlock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0039-s390-mm-fix-fault-handling-for-page-table-walk-case.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0040-nfs-skip-commit-in-releasepage-if-we-re-freeing-memo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0041-md-raid1-don-t-abort-a-resync-on-the-first-badblock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0042-pcdp-use-early_ioremap-early_iounmap-to-access-pcdp-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0043-lib-vsprintf.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0044-nilfs2-fix-deadlock-issue-between-chcp-and-thaw-ioct.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0045-SUNRPC-return-negative-value-in-case-rpcbind-client-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0046-ARM-7467-1-mutex-use-generic-xchg-based-implementati.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0047-ARM-7476-1-vfp-only-clear-vfp-state-for-current-cpu-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0048-ARM-7477-1-vfp-Always-save-VFP-state-in-vfp_pm_suspe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0049-ARM-7478-1-errata-extend-workaround-for-erratum-7207.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0050-ARM-Fix-undefined-instruction-exception-handling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0051-USB-echi-dbgp-increase-the-controller-wait-time-to-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0052-ASoC-wm8962-Allow-VMID-time-to-fully-ramp.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0053-mm-page_alloc.c-remove-pageblock_default_order.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0054-mm-setup-pageblock_order-before-it-s-used-by-sparsem.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0055-mm-mmu_notifier-fix-freed-page-still-mapped-in-secon.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0056-mm-hugetlbfs-close-race-during-teardown-of-hugetlbfs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0057-ALSA-snd-usb-fix-clock-source-validity-index.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0058-ALSA-hda-Support-dock-on-Lenovo-Thinkpad-T530-with-A.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0059-ore-Fix-out-of-bounds-access-in-_ios_obj.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0060-m68k-Make-sys_atomic_cmpxchg_32-work-on-classic-m68k.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0061-drm-i915-prefer-wide-slow-to-fast-narrow-in-DP-confi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0062-rt2x00-Add-support-for-BUFFALO-WLI-UC-GNM2-to-rt2800.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0063-drop_monitor-fix-sleeping-in-invalid-context-warning.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0064-drop_monitor-Make-updating-data-skb-smp-safe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0065-drop_monitor-prevent-init-path-from-scheduling-on-th.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0066-drop_monitor-dont-sleep-in-atomic-context.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0067-pch_uart-Fix-missing-break-for-16-byte-fifo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0068-pch_uart-Fix-rx-error-interrupt-setting-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0069-pch_uart-Fix-parity-setting-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0070-Linux-3.2.27.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0001-bnx2-Fix-bug-in-bnx2_free_tx_skbs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0002-sch_sfb-Fix-missing-NULL-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0003-sctp-Fix-list-corruption-resulting-from-freeing-an-a.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0004-caif-Fix-access-to-freed-pernet-memory.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0005-cipso-don-t-follow-a-NULL-pointer-when-setsockopt-is.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0006-caif-fix-NULL-pointer-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0007-wanmain-comparing-array-with-NULL.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0008-tcp-Add-TCP_USER_TIMEOUT-negative-value-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0009-USB-kaweth.c-use-GFP_ATOMIC-under-spin_lock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0010-net-fix-rtnetlink-IFF_PROMISC-and-IFF_ALLMULTI-handl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0011-tcp-perform-DMA-to-userspace-only-if-there-is-a-task.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0012-net-tun-fix-ioctl-based-info-leaks.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0013-e1000-add-dropped-DMA-receive-enable-back-in-for-WoL.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0014-rtlwifi-rtl8192cu-Change-buffer-allocation-for-synch.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0015-hfsplus-fix-overflow-in-sector-calculations-in-hfspl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0016-drm-i915-fixup-seqno-allocation-logic-for-lazy_reque.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0017-KVM-VMX-Advertise-CPU_BASED_RDPMC_EXITING-for-nested.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0018-mac80211-cancel-mesh-path-timer.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0019-ath9k-Add-PID-VID-support-for-AR1111.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0020-ARM-mxs-Remove-MMAP_MIN_ADDR-setting-from-mxs_defcon.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0021-ALSA-hda-add-dock-support-for-Thinkpad-T430s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0022-cfg80211-process-pending-events-when-unregistering-n.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0023-rt61pci-fix-NULL-pointer-dereference-in-config_lna_g.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0024-iwlwifi-disable-greenfield-transmissions-as-a-workar.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0025-ALSA-hda-add-dock-support-for-Thinkpad-X230.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0026-e1000e-NIC-goes-up-and-immediately-goes-down.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0027-ALSA-hda-remove-quirk-for-Dell-Vostro-1015.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0028-ALSA-hda-Fix-double-quirk-for-Quanta-FL1-Lenovo-Idea.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0029-ARM-pxa-remove-irq_to_gpio-from-ezx-pcap-driver.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0030-Input-eeti_ts-pass-gpio-value-instead-of-IRQ.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0031-drm-i915-Add-wait_for-in-init_ring_common.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0032-drm-i915-correctly-order-the-ring-init-sequence.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0033-s390-compat-fix-compat-wrappers-for-process_vm-syste.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0034-s390-compat-fix-mmap-compat-system-calls.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0035-drm-radeon-fix-bank-tiling-parameters-on-evergreen.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0036-drm-radeon-fix-bank-tiling-parameters-on-cayman.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0037-drm-radeon-do-not-reenable-crtc-after-moving-vram-st.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0038-Linux-3.2.28.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0086-board-am335xevm-Add-Beaglebone-Motor-Cape-Support.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0087-mux33xx-Fix-MUXENTRYs-for-MCASP0_ACLKX-FSX-to-add-eh.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0001-PWM-ecap-Correct-configuration-of-polarity.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0002-ARM-OMAP2-am335x-mux-add-ecap2_in_pwm2_out-string-en.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0003-ARM-OMAP2-AM335x-hwmod-Remove-PRCM-entries-for-PWMSS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0004-PWM-ecap-Resets-the-PWM-output-to-low-on-stop.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0005-PWM-ecap-Fix-for-throwing-PWM-output-before-running.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0006-pwm-ehrpwm-Configure-polarity-on-pwm_start.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 9610881..223f814 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r15"
+MACHINE_KERNEL_PR = "r16"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0001-x86-Simplify-code-by-removing-a-SMP-ifdefs-from-stru.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0001-x86-Simplify-code-by-removing-a-SMP-ifdefs-from-stru.patch
new file mode 100644
index 0000000..e858ded
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0001-x86-Simplify-code-by-removing-a-SMP-ifdefs-from-stru.patch
@@ -0,0 +1,273 @@
+From 6b4860ef321fadc060ec7541cb5074980fd41a68 Mon Sep 17 00:00:00 2001
+From: Kevin Winchester <kjwinchester@gmail.com>
+Date: Tue, 20 Dec 2011 20:52:22 -0400
+Subject: [PATCH 1/2] x86: Simplify code by removing a !SMP #ifdefs from
+ 'struct cpuinfo_x86'
+
+commit 141168c36cdee3ff23d9c7700b0edc47cb65479f and
+commit 3f806e50981825fa56a7f1938f24c0680816be45 upstream.
+
+Several fields in struct cpuinfo_x86 were not defined for the
+!SMP case, likely to save space.  However, those fields still
+have some meaning for UP, and keeping them allows some #ifdef
+removal from other files.  The additional size of the UP kernel
+from this change is not significant enough to worry about
+keeping up the distinction:
+
+	   text    data     bss     dec     hex filename
+	4737168	 506459	 972040	6215667	 5ed7f3	vmlinux.o.before
+	4737444	 506459	 972040	6215943	 5ed907	vmlinux.o.after
+
+for a difference of 276 bytes for an example UP config.
+
+If someone wants those 276 bytes back badly then it should
+be implemented in a cleaner way.
+
+Signed-off-by: Kevin Winchester <kjwinchester@gmail.com>
+Cc: Steffen Persvold <sp@numascale.com>
+Link: http://lkml.kernel.org/r/1324428742-12498-1-git-send-email-kjwinchester@gmail.com
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/include/asm/processor.h     |    2 --
+ arch/x86/kernel/amd_nb.c             |    8 ++------
+ arch/x86/kernel/cpu/amd.c            |    2 --
+ arch/x86/kernel/cpu/common.c         |    5 -----
+ arch/x86/kernel/cpu/intel.c          |    2 --
+ arch/x86/kernel/cpu/mcheck/mce.c     |    2 --
+ arch/x86/kernel/cpu/mcheck/mce_amd.c |    5 +----
+ arch/x86/kernel/cpu/proc.c           |    4 +---
+ drivers/edac/sb_edac.c               |    2 --
+ drivers/hwmon/coretemp.c             |    7 +++----
+ 10 files changed, 7 insertions(+), 32 deletions(-)
+
+diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
+index bb3ee36..f7c89e2 100644
+--- a/arch/x86/include/asm/processor.h
++++ b/arch/x86/include/asm/processor.h
+@@ -99,7 +99,6 @@ struct cpuinfo_x86 {
+ 	u16			apicid;
+ 	u16			initial_apicid;
+ 	u16			x86_clflush_size;
+-#ifdef CONFIG_SMP
+ 	/* number of cores as seen by the OS: */
+ 	u16			booted_cores;
+ 	/* Physical processor id: */
+@@ -110,7 +109,6 @@ struct cpuinfo_x86 {
+ 	u8			compute_unit_id;
+ 	/* Index into per_cpu list: */
+ 	u16			cpu_index;
+-#endif
+ 	u32			microcode;
+ } __attribute__((__aligned__(SMP_CACHE_BYTES)));
+ 
+diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
+index bae1efe..be16854 100644
+--- a/arch/x86/kernel/amd_nb.c
++++ b/arch/x86/kernel/amd_nb.c
+@@ -154,16 +154,14 @@ int amd_get_subcaches(int cpu)
+ {
+ 	struct pci_dev *link = node_to_amd_nb(amd_get_nb_id(cpu))->link;
+ 	unsigned int mask;
+-	int cuid = 0;
++	int cuid;
+ 
+ 	if (!amd_nb_has_feature(AMD_NB_L3_PARTITIONING))
+ 		return 0;
+ 
+ 	pci_read_config_dword(link, 0x1d4, &mask);
+ 
+-#ifdef CONFIG_SMP
+ 	cuid = cpu_data(cpu).compute_unit_id;
+-#endif
+ 	return (mask >> (4 * cuid)) & 0xf;
+ }
+ 
+@@ -172,7 +170,7 @@ int amd_set_subcaches(int cpu, int mask)
+ 	static unsigned int reset, ban;
+ 	struct amd_northbridge *nb = node_to_amd_nb(amd_get_nb_id(cpu));
+ 	unsigned int reg;
+-	int cuid = 0;
++	int cuid;
+ 
+ 	if (!amd_nb_has_feature(AMD_NB_L3_PARTITIONING) || mask > 0xf)
+ 		return -EINVAL;
+@@ -190,9 +188,7 @@ int amd_set_subcaches(int cpu, int mask)
+ 		pci_write_config_dword(nb->misc, 0x1b8, reg & ~0x180000);
+ 	}
+ 
+-#ifdef CONFIG_SMP
+ 	cuid = cpu_data(cpu).compute_unit_id;
+-#endif
+ 	mask <<= 4 * cuid;
+ 	mask |= (0xf ^ (1 << cuid)) << 26;
+ 
+diff --git a/arch/x86/kernel/cpu/amd.c b/arch/x86/kernel/cpu/amd.c
+index 3524e1f..ff8557e 100644
+--- a/arch/x86/kernel/cpu/amd.c
++++ b/arch/x86/kernel/cpu/amd.c
+@@ -148,7 +148,6 @@ static void __cpuinit init_amd_k6(struct cpuinfo_x86 *c)
+ 
+ static void __cpuinit amd_k7_smp_check(struct cpuinfo_x86 *c)
+ {
+-#ifdef CONFIG_SMP
+ 	/* calling is from identify_secondary_cpu() ? */
+ 	if (!c->cpu_index)
+ 		return;
+@@ -192,7 +191,6 @@ static void __cpuinit amd_k7_smp_check(struct cpuinfo_x86 *c)
+ 
+ valid_k7:
+ 	;
+-#endif
+ }
+ 
+ static void __cpuinit init_amd_k7(struct cpuinfo_x86 *c)
+diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
+index aa003b1..ca93cc7 100644
+--- a/arch/x86/kernel/cpu/common.c
++++ b/arch/x86/kernel/cpu/common.c
+@@ -676,9 +676,7 @@ static void __init early_identify_cpu(struct cpuinfo_x86 *c)
+ 	if (this_cpu->c_early_init)
+ 		this_cpu->c_early_init(c);
+ 
+-#ifdef CONFIG_SMP
+ 	c->cpu_index = 0;
+-#endif
+ 	filter_cpuid_features(c, false);
+ 
+ 	setup_smep(c);
+@@ -764,10 +762,7 @@ static void __cpuinit generic_identify(struct cpuinfo_x86 *c)
+ 		c->apicid = c->initial_apicid;
+ # endif
+ #endif
+-
+-#ifdef CONFIG_X86_HT
+ 		c->phys_proc_id = c->initial_apicid;
+-#endif
+ 	}
+ 
+ 	setup_smep(c);
+diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
+index 5231312..3e6ff6c 100644
+--- a/arch/x86/kernel/cpu/intel.c
++++ b/arch/x86/kernel/cpu/intel.c
+@@ -181,7 +181,6 @@ static void __cpuinit trap_init_f00f_bug(void)
+ 
+ static void __cpuinit intel_smp_check(struct cpuinfo_x86 *c)
+ {
+-#ifdef CONFIG_SMP
+ 	/* calling is from identify_secondary_cpu() ? */
+ 	if (!c->cpu_index)
+ 		return;
+@@ -198,7 +197,6 @@ static void __cpuinit intel_smp_check(struct cpuinfo_x86 *c)
+ 		WARN_ONCE(1, "WARNING: SMP operation may be unreliable"
+ 				    "with B stepping processors.\n");
+ 	}
+-#endif
+ }
+ 
+ static void __cpuinit intel_workarounds(struct cpuinfo_x86 *c)
+diff --git a/arch/x86/kernel/cpu/mcheck/mce.c b/arch/x86/kernel/cpu/mcheck/mce.c
+index b0f1271..3b67877 100644
+--- a/arch/x86/kernel/cpu/mcheck/mce.c
++++ b/arch/x86/kernel/cpu/mcheck/mce.c
+@@ -119,9 +119,7 @@ void mce_setup(struct mce *m)
+ 	m->time = get_seconds();
+ 	m->cpuvendor = boot_cpu_data.x86_vendor;
+ 	m->cpuid = cpuid_eax(1);
+-#ifdef CONFIG_SMP
+ 	m->socketid = cpu_data(m->extcpu).phys_proc_id;
+-#endif
+ 	m->apicid = cpu_data(m->extcpu).initial_apicid;
+ 	rdmsrl(MSR_IA32_MCG_CAP, m->mcgcap);
+ }
+diff --git a/arch/x86/kernel/cpu/mcheck/mce_amd.c b/arch/x86/kernel/cpu/mcheck/mce_amd.c
+index 445a61c..d4444be 100644
+--- a/arch/x86/kernel/cpu/mcheck/mce_amd.c
++++ b/arch/x86/kernel/cpu/mcheck/mce_amd.c
+@@ -65,11 +65,9 @@ struct threshold_bank {
+ };
+ static DEFINE_PER_CPU(struct threshold_bank * [NR_BANKS], threshold_banks);
+ 
+-#ifdef CONFIG_SMP
+ static unsigned char shared_bank[NR_BANKS] = {
+ 	0, 0, 0, 0, 1
+ };
+-#endif
+ 
+ static DEFINE_PER_CPU(unsigned char, bank_map);	/* see which banks are on */
+ 
+@@ -227,10 +225,9 @@ void mce_amd_feature_init(struct cpuinfo_x86 *c)
+ 
+ 			if (!block)
+ 				per_cpu(bank_map, cpu) |= (1 << bank);
+-#ifdef CONFIG_SMP
++
+ 			if (shared_bank[bank] && c->cpu_core_id)
+ 				break;
+-#endif
+ 
+ 			memset(&b, 0, sizeof(b));
+ 			b.cpu			= cpu;
+diff --git a/arch/x86/kernel/cpu/proc.c b/arch/x86/kernel/cpu/proc.c
+index 14b2314..8022c66 100644
+--- a/arch/x86/kernel/cpu/proc.c
++++ b/arch/x86/kernel/cpu/proc.c
+@@ -64,12 +64,10 @@ static void show_cpuinfo_misc(struct seq_file *m, struct cpuinfo_x86 *c)
+ static int show_cpuinfo(struct seq_file *m, void *v)
+ {
+ 	struct cpuinfo_x86 *c = v;
+-	unsigned int cpu = 0;
++	unsigned int cpu;
+ 	int i;
+ 
+-#ifdef CONFIG_SMP
+ 	cpu = c->cpu_index;
+-#endif
+ 	seq_printf(m, "processor\t: %u\n"
+ 		   "vendor_id\t: %s\n"
+ 		   "cpu family\t: %d\n"
+diff --git a/drivers/edac/sb_edac.c b/drivers/edac/sb_edac.c
+index 18a1293..0db57b5 100644
+--- a/drivers/edac/sb_edac.c
++++ b/drivers/edac/sb_edac.c
+@@ -1609,11 +1609,9 @@ static int sbridge_mce_check_error(struct notifier_block *nb, unsigned long val,
+ 		mce->cpuvendor, mce->cpuid, mce->time,
+ 		mce->socketid, mce->apicid);
+ 
+-#ifdef CONFIG_SMP
+ 	/* Only handle if it is the right mc controller */
+ 	if (cpu_data(mce->cpu).phys_proc_id != pvt->sbridge_dev->mc)
+ 		return NOTIFY_DONE;
+-#endif
+ 
+ 	smp_rmb();
+ 	if ((pvt->mce_out + 1) % MCE_LOG_LEN == pvt->mce_in) {
+diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
+index 0790c98..19b4412 100644
+--- a/drivers/hwmon/coretemp.c
++++ b/drivers/hwmon/coretemp.c
+@@ -57,16 +57,15 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
+ #define TOTAL_ATTRS		(MAX_CORE_ATTRS + 1)
+ #define MAX_CORE_DATA		(NUM_REAL_CORES + BASE_SYSFS_ATTR_NO)
+ 
+-#ifdef CONFIG_SMP
+ #define TO_PHYS_ID(cpu)		cpu_data(cpu).phys_proc_id
+ #define TO_CORE_ID(cpu)		cpu_data(cpu).cpu_core_id
++#define TO_ATTR_NO(cpu)		(TO_CORE_ID(cpu) + BASE_SYSFS_ATTR_NO)
++
++#ifdef CONFIG_SMP
+ #define for_each_sibling(i, cpu)	for_each_cpu(i, cpu_sibling_mask(cpu))
+ #else
+-#define TO_PHYS_ID(cpu)		(cpu)
+-#define TO_CORE_ID(cpu)		(cpu)
+ #define for_each_sibling(i, cpu)	for (i = 0; false; )
+ #endif
+-#define TO_ATTR_NO(cpu)		(TO_CORE_ID(cpu) + BASE_SYSFS_ATTR_NO)
+ 
+ /*
+  * Per-Core Temperature Data
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0002-Linux-3.2.26.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0002-Linux-3.2.26.patch
new file mode 100644
index 0000000..3015fd3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.26/0002-Linux-3.2.26.patch
@@ -0,0 +1,24 @@
+From c155c854372ebc05bac443b7d5285dd8d5834c62 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sat, 4 Aug 2012 16:31:19 +0100
+Subject: [PATCH 2/2] Linux 3.2.26
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e13e4e7..fa5acc83 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 25
++SUBLEVEL = 26
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0001-sched-Fix-race-in-task_group.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0001-sched-Fix-race-in-task_group.patch
new file mode 100644
index 0000000..ea42ba5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0001-sched-Fix-race-in-task_group.patch
@@ -0,0 +1,158 @@
+From 7164208d7f019fd736a9b7411858b534b3b69bba Mon Sep 17 00:00:00 2001
+From: Peter Zijlstra <peterz@infradead.org>
+Date: Fri, 22 Jun 2012 13:36:05 +0200
+Subject: [PATCH 01/70] sched: Fix race in task_group()
+
+commit 8323f26ce3425460769605a6aece7a174edaa7d1 upstream
+
+Stefan reported a crash on a kernel before a3e5d1091c1 ("sched:
+Don't call task_group() too many times in set_task_rq()"), he
+found the reason to be that the multiple task_group()
+invocations in set_task_rq() returned different values.
+
+Looking at all that I found a lack of serialization and plain
+wrong comments.
+
+The below tries to fix it using an extra pointer which is
+updated under the appropriate scheduler locks. Its not pretty,
+but I can't really see another way given how all the cgroup
+stuff works.
+
+Reported-and-tested-by: Stefan Bader <stefan.bader@canonical.com>
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Link: http://lkml.kernel.org/r/1340364965.18025.71.camel@twins
+Signed-off-by: Ingo Molnar <mingo@kernel.org>
+
+(backported to previous file names and layout)
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/init_task.h |   12 +++++++++++-
+ include/linux/sched.h     |    5 ++++-
+ kernel/sched.c            |   32 ++++++++++++++++++--------------
+ 3 files changed, 33 insertions(+), 16 deletions(-)
+
+diff --git a/include/linux/init_task.h b/include/linux/init_task.h
+index df53fdf..cdde2b3 100644
+--- a/include/linux/init_task.h
++++ b/include/linux/init_task.h
+@@ -124,8 +124,17 @@ extern struct group_info init_groups;
+ 
+ extern struct cred init_cred;
+ 
++extern struct task_group root_task_group;
++
++#ifdef CONFIG_CGROUP_SCHED
++# define INIT_CGROUP_SCHED(tsk)						\
++	.sched_task_group = &root_task_group,
++#else
++# define INIT_CGROUP_SCHED(tsk)
++#endif
++
+ #ifdef CONFIG_PERF_EVENTS
+-# define INIT_PERF_EVENTS(tsk)					\
++# define INIT_PERF_EVENTS(tsk)						\
+ 	.perf_event_mutex = 						\
+ 		 __MUTEX_INITIALIZER(tsk.perf_event_mutex),		\
+ 	.perf_event_list = LIST_HEAD_INIT(tsk.perf_event_list),
+@@ -162,6 +171,7 @@ extern struct cred init_cred;
+ 	},								\
+ 	.tasks		= LIST_HEAD_INIT(tsk.tasks),			\
+ 	INIT_PUSHABLE_TASKS(tsk)					\
++	INIT_CGROUP_SCHED(tsk)						\
+ 	.ptraced	= LIST_HEAD_INIT(tsk.ptraced),			\
+ 	.ptrace_entry	= LIST_HEAD_INIT(tsk.ptrace_entry),		\
+ 	.real_parent	= &tsk,						\
+diff --git a/include/linux/sched.h b/include/linux/sched.h
+index d336c35..1e86bb4 100644
+--- a/include/linux/sched.h
++++ b/include/linux/sched.h
+@@ -1236,6 +1236,9 @@ struct task_struct {
+ 	const struct sched_class *sched_class;
+ 	struct sched_entity se;
+ 	struct sched_rt_entity rt;
++#ifdef CONFIG_CGROUP_SCHED
++	struct task_group *sched_task_group;
++#endif
+ 
+ #ifdef CONFIG_PREEMPT_NOTIFIERS
+ 	/* list of struct preempt_notifier: */
+@@ -2646,7 +2649,7 @@ extern int sched_group_set_rt_period(struct task_group *tg,
+ extern long sched_group_rt_period(struct task_group *tg);
+ extern int sched_rt_can_attach(struct task_group *tg, struct task_struct *tsk);
+ #endif
+-#endif
++#endif /* CONFIG_CGROUP_SCHED */
+ 
+ extern int task_can_switch_user(struct user_struct *up,
+ 					struct task_struct *tsk);
+diff --git a/kernel/sched.c b/kernel/sched.c
+index 9cd8ca7..e0431c4 100644
+--- a/kernel/sched.c
++++ b/kernel/sched.c
+@@ -746,22 +746,19 @@ static inline int cpu_of(struct rq *rq)
+ /*
+  * Return the group to which this tasks belongs.
+  *
+- * We use task_subsys_state_check() and extend the RCU verification with
+- * pi->lock and rq->lock because cpu_cgroup_attach() holds those locks for each
+- * task it moves into the cgroup. Therefore by holding either of those locks,
+- * we pin the task to the current cgroup.
++ * We cannot use task_subsys_state() and friends because the cgroup
++ * subsystem changes that value before the cgroup_subsys::attach() method
++ * is called, therefore we cannot pin it and might observe the wrong value.
++ *
++ * The same is true for autogroup's p->signal->autogroup->tg, the autogroup
++ * core changes this before calling sched_move_task().
++ *
++ * Instead we use a 'copy' which is updated from sched_move_task() while
++ * holding both task_struct::pi_lock and rq::lock.
+  */
+ static inline struct task_group *task_group(struct task_struct *p)
+ {
+-	struct task_group *tg;
+-	struct cgroup_subsys_state *css;
+-
+-	css = task_subsys_state_check(p, cpu_cgroup_subsys_id,
+-			lockdep_is_held(&p->pi_lock) ||
+-			lockdep_is_held(&task_rq(p)->lock));
+-	tg = container_of(css, struct task_group, css);
+-
+-	return autogroup_task_group(p, tg);
++	return p->sched_task_group;
+ }
+ 
+ /* Change a task's cfs_rq and parent entity if it moves across CPUs/groups */
+@@ -2372,7 +2369,7 @@ void set_task_cpu(struct task_struct *p, unsigned int new_cpu)
+ 	 * a task's CPU. ->pi_lock for waking tasks, rq->lock for runnable tasks.
+ 	 *
+ 	 * sched_move_task() holds both and thus holding either pins the cgroup,
+-	 * see set_task_rq().
++	 * see task_group().
+ 	 *
+ 	 * Furthermore, all task_rq users should acquire both locks, see
+ 	 * task_rq_lock().
+@@ -8952,6 +8949,7 @@ void sched_destroy_group(struct task_group *tg)
+  */
+ void sched_move_task(struct task_struct *tsk)
+ {
++	struct task_group *tg;
+ 	int on_rq, running;
+ 	unsigned long flags;
+ 	struct rq *rq;
+@@ -8966,6 +8964,12 @@ void sched_move_task(struct task_struct *tsk)
+ 	if (unlikely(running))
+ 		tsk->sched_class->put_prev_task(rq, tsk);
+ 
++	tg = container_of(task_subsys_state_check(tsk, cpu_cgroup_subsys_id,
++				lockdep_is_held(&tsk->sighand->siglock)),
++			  struct task_group, css);
++	tg = autogroup_task_group(tsk, tg);
++	tsk->sched_task_group = tg;
++
+ #ifdef CONFIG_FAIR_GROUP_SCHED
+ 	if (tsk->sched_class->task_move_group)
+ 		tsk->sched_class->task_move_group(tsk, on_rq);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0002-floppy-Cleanup-disk-queue-before-caling-put_disk-if-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0002-floppy-Cleanup-disk-queue-before-caling-put_disk-if-.patch
new file mode 100644
index 0000000..5f258a3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0002-floppy-Cleanup-disk-queue-before-caling-put_disk-if-.patch
@@ -0,0 +1,51 @@
+From d51b64762e38f2ef1577ddc9f6399a7b56aaeb25 Mon Sep 17 00:00:00 2001
+From: Vivek Goyal <vgoyal@redhat.com>
+Date: Wed, 8 Feb 2012 20:03:38 +0100
+Subject: [PATCH 02/70] floppy: Cleanup disk->queue before caling put_disk()
+ if add_disk() was never called
+
+commit 3f9a5aabd0a9fe0e0cd308506f48963d79169aa7 upstream.
+
+add_disk() takes gendisk reference on request queue. If driver failed during
+initialization and never called add_disk() then that extra reference is not
+taken. That reference is put in put_disk(). floppy driver allocates the
+disk, allocates queue, sets disk->queue and then relizes that floppy
+controller is not present. It tries to tear down everything and tries to
+put a reference down in put_disk() which was never taken.
+
+In such error cases cleanup disk->queue before calling put_disk() so that
+we never try to put down a reference which was never taken in first place.
+
+Reported-and-tested-by: Suresh Jayaraman <sjayaraman@suse.com>
+Tested-by: Dirk Gouders <gouders@et.bocholt.fh-gelsenkirchen.de>
+Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
+Acked-by: Tejun Heo <tj@kernel.org>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/block/floppy.c |    8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
+index 9955a53..c864add 100644
+--- a/drivers/block/floppy.c
++++ b/drivers/block/floppy.c
+@@ -4369,8 +4369,14 @@ out_unreg_blkdev:
+ out_put_disk:
+ 	while (dr--) {
+ 		del_timer_sync(&motor_off_timer[dr]);
+-		if (disks[dr]->queue)
++		if (disks[dr]->queue) {
+ 			blk_cleanup_queue(disks[dr]->queue);
++			/*
++			 * put_disk() is not paired with add_disk() and
++			 * will put queue reference one extra time. fix it.
++			 */
++			disks[dr]->queue = NULL;
++		}
+ 		put_disk(disks[dr]);
+ 	}
+ 	return err;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0003-xen-mark-local-pages-as-FOREIGN-in-the-m2p_override.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0003-xen-mark-local-pages-as-FOREIGN-in-the-m2p_override.patch
new file mode 100644
index 0000000..a111e55
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0003-xen-mark-local-pages-as-FOREIGN-in-the-m2p_override.patch
@@ -0,0 +1,156 @@
+From 0619fd368e61287667b8e77ae17b332e196f6258 Mon Sep 17 00:00:00 2001
+From: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Date: Wed, 23 May 2012 18:57:20 +0100
+Subject: [PATCH 03/70] xen: mark local pages as FOREIGN in the m2p_override
+
+commit b9e0d95c041ca2d7ad297ee37c2e9cfab67a188f upstream.
+
+When the frontend and the backend reside on the same domain, even if we
+add pages to the m2p_override, these pages will never be returned by
+mfn_to_pfn because the check "get_phys_to_machine(pfn) != mfn" will
+always fail, so the pfn of the frontend will be returned instead
+(resulting in a deadlock because the frontend pages are already locked).
+
+INFO: task qemu-system-i38:1085 blocked for more than 120 seconds.
+"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
+qemu-system-i38 D ffff8800cfc137c0     0  1085      1 0x00000000
+ ffff8800c47ed898 0000000000000282 ffff8800be4596b0 00000000000137c0
+ ffff8800c47edfd8 ffff8800c47ec010 00000000000137c0 00000000000137c0
+ ffff8800c47edfd8 00000000000137c0 ffffffff82213020 ffff8800be4596b0
+Call Trace:
+ [<ffffffff81101ee0>] ? __lock_page+0x70/0x70
+ [<ffffffff81a0fdd9>] schedule+0x29/0x70
+ [<ffffffff81a0fe80>] io_schedule+0x60/0x80
+ [<ffffffff81101eee>] sleep_on_page+0xe/0x20
+ [<ffffffff81a0e1ca>] __wait_on_bit_lock+0x5a/0xc0
+ [<ffffffff81101ed7>] __lock_page+0x67/0x70
+ [<ffffffff8106f750>] ? autoremove_wake_function+0x40/0x40
+ [<ffffffff811867e6>] ? bio_add_page+0x36/0x40
+ [<ffffffff8110b692>] set_page_dirty_lock+0x52/0x60
+ [<ffffffff81186021>] bio_set_pages_dirty+0x51/0x70
+ [<ffffffff8118c6b4>] do_blockdev_direct_IO+0xb24/0xeb0
+ [<ffffffff811e71a0>] ? ext3_get_blocks_handle+0xe00/0xe00
+ [<ffffffff8118ca95>] __blockdev_direct_IO+0x55/0x60
+ [<ffffffff811e71a0>] ? ext3_get_blocks_handle+0xe00/0xe00
+ [<ffffffff811e91c8>] ext3_direct_IO+0xf8/0x390
+ [<ffffffff811e71a0>] ? ext3_get_blocks_handle+0xe00/0xe00
+ [<ffffffff81004b60>] ? xen_mc_flush+0xb0/0x1b0
+ [<ffffffff81104027>] generic_file_aio_read+0x737/0x780
+ [<ffffffff813bedeb>] ? gnttab_map_refs+0x15b/0x1e0
+ [<ffffffff811038f0>] ? find_get_pages+0x150/0x150
+ [<ffffffff8119736c>] aio_rw_vect_retry+0x7c/0x1d0
+ [<ffffffff811972f0>] ? lookup_ioctx+0x90/0x90
+ [<ffffffff81198856>] aio_run_iocb+0x66/0x1a0
+ [<ffffffff811998b8>] do_io_submit+0x708/0xb90
+ [<ffffffff81199d50>] sys_io_submit+0x10/0x20
+ [<ffffffff81a18d69>] system_call_fastpath+0x16/0x1b
+
+The explanation is in the comment within the code:
+
+We need to do this because the pages shared by the frontend
+(xen-blkfront) can be already locked (lock_page, called by
+do_read_cache_page); when the userspace backend tries to use them
+with direct_IO, mfn_to_pfn returns the pfn of the frontend, so
+do_blockdev_direct_IO is going to try to lock the same pages
+again resulting in a deadlock.
+
+A simplified call graph looks like this:
+
+pygrub                          QEMU
+-----------------------------------------------
+do_read_cache_page              io_submit
+  |                              |
+lock_page                       ext3_direct_IO
+                                 |
+                                bio_add_page
+                                 |
+                                lock_page
+
+Internally the xen-blkback uses m2p_add_override to swizzle (temporarily)
+a 'struct page' to have a different MFN (so that it can point to another
+guest). It also can easily find out whether another pfn corresponding
+to the mfn exists in the m2p, and can set the FOREIGN bit
+in the p2m, making sure that mfn_to_pfn returns the pfn of the backend.
+
+This allows the backend to perform direct_IO on these pages, but as a
+side effect prevents the frontend from using get_user_pages_fast on
+them while they are being shared with the backend.
+
+Signed-off-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
+Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/xen/p2m.c |   36 ++++++++++++++++++++++++++++++++++++
+ 1 files changed, 36 insertions(+), 0 deletions(-)
+
+diff --git a/arch/x86/xen/p2m.c b/arch/x86/xen/p2m.c
+index 1b267e7..00a03854 100644
+--- a/arch/x86/xen/p2m.c
++++ b/arch/x86/xen/p2m.c
+@@ -686,6 +686,7 @@ int m2p_add_override(unsigned long mfn, struct page *page,
+ 	unsigned long uninitialized_var(address);
+ 	unsigned level;
+ 	pte_t *ptep = NULL;
++	int ret = 0;
+ 
+ 	pfn = page_to_pfn(page);
+ 	if (!PageHighMem(page)) {
+@@ -721,6 +722,24 @@ int m2p_add_override(unsigned long mfn, struct page *page,
+ 	list_add(&page->lru,  &m2p_overrides[mfn_hash(mfn)]);
+ 	spin_unlock_irqrestore(&m2p_override_lock, flags);
+ 
++	/* p2m(m2p(mfn)) == mfn: the mfn is already present somewhere in
++	 * this domain. Set the FOREIGN_FRAME_BIT in the p2m for the other
++	 * pfn so that the following mfn_to_pfn(mfn) calls will return the
++	 * pfn from the m2p_override (the backend pfn) instead.
++	 * We need to do this because the pages shared by the frontend
++	 * (xen-blkfront) can be already locked (lock_page, called by
++	 * do_read_cache_page); when the userspace backend tries to use them
++	 * with direct_IO, mfn_to_pfn returns the pfn of the frontend, so
++	 * do_blockdev_direct_IO is going to try to lock the same pages
++	 * again resulting in a deadlock.
++	 * As a side effect get_user_pages_fast might not be safe on the
++	 * frontend pages while they are being shared with the backend,
++	 * because mfn_to_pfn (that ends up being called by GUPF) will
++	 * return the backend pfn rather than the frontend pfn. */
++	ret = __get_user(pfn, &machine_to_phys_mapping[mfn]);
++	if (ret == 0 && get_phys_to_machine(pfn) == mfn)
++		set_phys_to_machine(pfn, FOREIGN_FRAME(mfn));
++
+ 	return 0;
+ }
+ EXPORT_SYMBOL_GPL(m2p_add_override);
+@@ -732,6 +751,7 @@ int m2p_remove_override(struct page *page, bool clear_pte)
+ 	unsigned long uninitialized_var(address);
+ 	unsigned level;
+ 	pte_t *ptep = NULL;
++	int ret = 0;
+ 
+ 	pfn = page_to_pfn(page);
+ 	mfn = get_phys_to_machine(pfn);
+@@ -801,6 +821,22 @@ int m2p_remove_override(struct page *page, bool clear_pte)
+ 	} else
+ 		set_phys_to_machine(pfn, page->index);
+ 
++	/* p2m(m2p(mfn)) == FOREIGN_FRAME(mfn): the mfn is already present
++	 * somewhere in this domain, even before being added to the
++	 * m2p_override (see comment above in m2p_add_override).
++	 * If there are no other entries in the m2p_override corresponding
++	 * to this mfn, then remove the FOREIGN_FRAME_BIT from the p2m for
++	 * the original pfn (the one shared by the frontend): the backend
++	 * cannot do any IO on this page anymore because it has been
++	 * unshared. Removing the FOREIGN_FRAME_BIT from the p2m entry of
++	 * the original pfn causes mfn_to_pfn(mfn) to return the frontend
++	 * pfn again. */
++	mfn &= ~FOREIGN_FRAME_BIT;
++	ret = __get_user(pfn, &machine_to_phys_mapping[mfn]);
++	if (ret == 0 && get_phys_to_machine(pfn) == FOREIGN_FRAME(mfn) &&
++			m2p_find_override(mfn) == NULL)
++		set_phys_to_machine(pfn, mfn);
++
+ 	return 0;
+ }
+ EXPORT_SYMBOL_GPL(m2p_remove_override);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0004-lirc_sir-make-device-registration-work.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0004-lirc_sir-make-device-registration-work.patch
new file mode 100644
index 0000000..9a3e2ad
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0004-lirc_sir-make-device-registration-work.patch
@@ -0,0 +1,131 @@
+From 03d61a0ca7ab54f6fb1524f4313afd1811fde803 Mon Sep 17 00:00:00 2001
+From: Jarod Wilson <jarod@redhat.com>
+Date: Mon, 4 Jun 2012 13:05:24 -0300
+Subject: [PATCH 04/70] lirc_sir: make device registration work
+
+commit 4b71ca6bce8fab3d08c61bf330e781f957934ae1 upstream.
+
+For one, the driver device pointer needs to be filled in, or the lirc core
+will refuse to load the driver. And we really need to wire up all the
+platform_device bits. This has been tested via the lirc sourceforge tree
+and verified to work, been sitting there for months, finally getting
+around to sending it. :\
+
+CC: Josh Boyer <jwboyer@redhat.com>
+Signed-off-by: Jarod Wilson <jarod@redhat.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/staging/media/lirc/lirc_sir.c |   60 +++++++++++++++++++++++++++++++-
+ 1 files changed, 58 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/staging/media/lirc/lirc_sir.c b/drivers/staging/media/lirc/lirc_sir.c
+index 6903d39..90e9e32 100644
+--- a/drivers/staging/media/lirc/lirc_sir.c
++++ b/drivers/staging/media/lirc/lirc_sir.c
+@@ -53,6 +53,7 @@
+ #include <linux/io.h>
+ #include <asm/irq.h>
+ #include <linux/fcntl.h>
++#include <linux/platform_device.h>
+ #ifdef LIRC_ON_SA1100
+ #include <asm/hardware.h>
+ #ifdef CONFIG_SA1100_COLLIE
+@@ -488,9 +489,11 @@ static struct lirc_driver driver = {
+ 	.owner		= THIS_MODULE,
+ };
+ 
++static struct platform_device *lirc_sir_dev;
+ 
+ static int init_chrdev(void)
+ {
++	driver.dev = &lirc_sir_dev->dev;
+ 	driver.minor = lirc_register_driver(&driver);
+ 	if (driver.minor < 0) {
+ 		printk(KERN_ERR LIRC_DRIVER_NAME ": init_chrdev() failed.\n");
+@@ -1216,20 +1219,71 @@ static int init_lirc_sir(void)
+ 	return 0;
+ }
+ 
++static int __devinit lirc_sir_probe(struct platform_device *dev)
++{
++	return 0;
++}
++
++static int __devexit lirc_sir_remove(struct platform_device *dev)
++{
++	return 0;
++}
++
++static struct platform_driver lirc_sir_driver = {
++	.probe		= lirc_sir_probe,
++	.remove		= __devexit_p(lirc_sir_remove),
++	.driver		= {
++		.name	= "lirc_sir",
++		.owner	= THIS_MODULE,
++	},
++};
+ 
+ static int __init lirc_sir_init(void)
+ {
+ 	int retval;
+ 
++	retval = platform_driver_register(&lirc_sir_driver);
++	if (retval) {
++		printk(KERN_ERR LIRC_DRIVER_NAME ": Platform driver register "
++		       "failed!\n");
++		return -ENODEV;
++	}
++
++	lirc_sir_dev = platform_device_alloc("lirc_dev", 0);
++	if (!lirc_sir_dev) {
++		printk(KERN_ERR LIRC_DRIVER_NAME ": Platform device alloc "
++		       "failed!\n");
++		retval = -ENOMEM;
++		goto pdev_alloc_fail;
++	}
++
++	retval = platform_device_add(lirc_sir_dev);
++	if (retval) {
++		printk(KERN_ERR LIRC_DRIVER_NAME ": Platform device add "
++		       "failed!\n");
++		retval = -ENODEV;
++		goto pdev_add_fail;
++	}
++
+ 	retval = init_chrdev();
+ 	if (retval < 0)
+-		return retval;
++		goto fail;
++
+ 	retval = init_lirc_sir();
+ 	if (retval) {
+ 		drop_chrdev();
+-		return retval;
++		goto fail;
+ 	}
++
+ 	return 0;
++
++fail:
++	platform_device_del(lirc_sir_dev);
++pdev_add_fail:
++	platform_device_put(lirc_sir_dev);
++pdev_alloc_fail:
++	platform_driver_unregister(&lirc_sir_driver);
++	return retval;
+ }
+ 
+ static void __exit lirc_sir_exit(void)
+@@ -1237,6 +1291,8 @@ static void __exit lirc_sir_exit(void)
+ 	drop_hardware();
+ 	drop_chrdev();
+ 	drop_port();
++	platform_device_unregister(lirc_sir_dev);
++	platform_driver_unregister(&lirc_sir_driver);
+ 	printk(KERN_INFO LIRC_DRIVER_NAME ": Uninstalled.\n");
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0005-stable-update-references-to-older-2.6-versions-for-3.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0005-stable-update-references-to-older-2.6-versions-for-3.patch
new file mode 100644
index 0000000..78b6729
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0005-stable-update-references-to-older-2.6-versions-for-3.patch
@@ -0,0 +1,62 @@
+From ed3c699ad6609ac8df5b4cea1805b7c5b0235c1f Mon Sep 17 00:00:00 2001
+From: Paul Gortmaker <paul.gortmaker@windriver.com>
+Date: Tue, 5 Jun 2012 11:15:50 -0400
+Subject: [PATCH 05/70] stable: update references to older 2.6 versions for
+ 3.x
+
+commit 2584f5212d97b664be250ad5700a2d0fee31a10d upstream.
+
+Also add information on where the respective trees are.
+
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+Acked-by: Rob Landley <rob@landley.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ Documentation/stable_kernel_rules.txt |   19 ++++++++++++++-----
+ 1 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/Documentation/stable_kernel_rules.txt b/Documentation/stable_kernel_rules.txt
+index e1f856b..22bf11b 100644
+--- a/Documentation/stable_kernel_rules.txt
++++ b/Documentation/stable_kernel_rules.txt
+@@ -1,4 +1,4 @@
+-Everything you ever wanted to know about Linux 2.6 -stable releases.
++Everything you ever wanted to know about Linux -stable releases.
+ 
+ Rules on what kind of patches are accepted, and which ones are not, into the
+ "-stable" tree:
+@@ -41,10 +41,10 @@ Procedure for submitting patches to the -stable tree:
+    cherry-picked than this can be specified in the following format in
+    the sign-off area:
+ 
+-     Cc: <stable@vger.kernel.org> # .32.x: a1f84a3: sched: Check for idle
+-     Cc: <stable@vger.kernel.org> # .32.x: 1b9508f: sched: Rate-limit newidle
+-     Cc: <stable@vger.kernel.org> # .32.x: fd21073: sched: Fix affinity logic
+-     Cc: <stable@vger.kernel.org> # .32.x
++     Cc: <stable@vger.kernel.org> # 3.3.x: a1f84a3: sched: Check for idle
++     Cc: <stable@vger.kernel.org> # 3.3.x: 1b9508f: sched: Rate-limit newidle
++     Cc: <stable@vger.kernel.org> # 3.3.x: fd21073: sched: Fix affinity logic
++     Cc: <stable@vger.kernel.org> # 3.3.x
+     Signed-off-by: Ingo Molnar <mingo@elte.hu>
+ 
+    The tag sequence has the meaning of:
+@@ -78,6 +78,15 @@ Review cycle:
+    security kernel team, and not go through the normal review cycle.
+    Contact the kernel security team for more details on this procedure.
+ 
++Trees:
++
++ - The queues of patches, for both completed versions and in progress
++   versions can be found at:
++	http://git.kernel.org/?p=linux/kernel/git/stable/stable-queue.git
++ - The finalized and tagged releases of all stable kernels can be found
++   in separate branches per version at:
++	http://git.kernel.org/?p=linux/kernel/git/stable/linux-stable.git
++
+ 
+ Review committee:
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0006-ALSA-hda-add-dock-support-for-Thinkpad-X230-Tablet.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0006-ALSA-hda-add-dock-support-for-Thinkpad-X230-Tablet.patch
new file mode 100644
index 0000000..d2a0bcd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0006-ALSA-hda-add-dock-support-for-Thinkpad-X230-Tablet.patch
@@ -0,0 +1,107 @@
+From bad9b02f55b18da07c00945ac46d33636331bfa0 Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Fri, 20 Jul 2012 10:37:25 +0200
+Subject: [PATCH 06/70] ALSA: hda - add dock support for Thinkpad X230 Tablet
+
+commit 108cc108a3bb42fe4705df1317ff98e1e29428a6 upstream.
+
+Also add a model/fixup string "lenovo-dock", so that other Thinkpad
+users will be able to test this fixup easily, to see if it enables
+dock I/O for them as well.
+
+BugLink: https://bugs.launchpad.net/bugs/1026953
+Tested-by: John McCarron <john.mccarron@canonical.com>
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ Documentation/sound/alsa/HD-Audio-Models.txt |    3 +-
+ sound/pci/hda/patch_realtek.c                |   27 ++++++++++++++++++++++++++
+ 2 files changed, 29 insertions(+), 1 deletions(-)
+
+diff --git a/Documentation/sound/alsa/HD-Audio-Models.txt b/Documentation/sound/alsa/HD-Audio-Models.txt
+index edad99a..69820b2 100644
+--- a/Documentation/sound/alsa/HD-Audio-Models.txt
++++ b/Documentation/sound/alsa/HD-Audio-Models.txt
+@@ -60,10 +60,11 @@ ALC267/268
+ ==========
+   N/A
+ 
+-ALC269
++ALC269/270/275/276/280/282
+ ======
+   laptop-amic	Laptops with analog-mic input
+   laptop-dmic	Laptops with digital-mic input
++  lenovo-dock   Enables docking station I/O for some Lenovos
+ 
+ ALC662/663/272
+ ==============
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 191fd78..6ae58b2 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -4809,6 +4809,15 @@ static int alc269_resume(struct hda_codec *codec)
+ }
+ #endif /* CONFIG_PM */
+ 
++static void alc269_fixup_pincfg_no_hp_to_lineout(struct hda_codec *codec,
++						 const struct alc_fixup *fix, int action)
++{
++	struct alc_spec *spec = codec->spec;
++
++	if (action == ALC_FIXUP_ACT_PRE_PROBE)
++		spec->parse_flags = HDA_PINCFG_NO_HP_FIXUP;
++}
++
+ static void alc269_fixup_hweq(struct hda_codec *codec,
+ 			       const struct alc_fixup *fix, int action)
+ {
+@@ -4909,6 +4918,8 @@ enum {
+ 	ALC269_FIXUP_DMIC,
+ 	ALC269VB_FIXUP_AMIC,
+ 	ALC269VB_FIXUP_DMIC,
++	ALC269_FIXUP_LENOVO_DOCK,
++	ALC269_FIXUP_PINCFG_NO_HP_TO_LINEOUT,
+ };
+ 
+ static const struct alc_fixup alc269_fixups[] = {
+@@ -5029,6 +5040,20 @@ static const struct alc_fixup alc269_fixups[] = {
+ 			{ }
+ 		},
+ 	},
++	[ALC269_FIXUP_LENOVO_DOCK] = {
++		.type = ALC_FIXUP_PINS,
++		.v.pins = (const struct alc_pincfg[]) {
++			{ 0x19, 0x23a11040 }, /* dock mic */
++			{ 0x1b, 0x2121103f }, /* dock headphone */
++			{ }
++		},
++		.chained = true,
++		.chain_id = ALC269_FIXUP_PINCFG_NO_HP_TO_LINEOUT
++	},
++	[ALC269_FIXUP_PINCFG_NO_HP_TO_LINEOUT] = {
++		.type = ALC_FIXUP_FUNC,
++		.v.func = alc269_fixup_pincfg_no_hp_to_lineout,
++	},
+ };
+ 
+ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+@@ -5051,6 +5076,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x17aa, 0x21b8, "Thinkpad Edge 14", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21ca, "Thinkpad L412", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21e9, "Thinkpad Edge 15", ALC269_FIXUP_SKU_IGNORE),
++	SND_PCI_QUIRK(0x17aa, 0x2203, "Thinkpad X230 Tablet", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_QUANTA_MUTE),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Lenovo Ideapd", ALC269_FIXUP_PCM_44K),
+ 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
+@@ -5109,6 +5135,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ static const struct alc_model_fixup alc269_fixup_models[] = {
+ 	{.id = ALC269_FIXUP_AMIC, .name = "laptop-amic"},
+ 	{.id = ALC269_FIXUP_DMIC, .name = "laptop-dmic"},
++	{.id = ALC269_FIXUP_LENOVO_DOCK, .name = "lenovo-dock"},
+ 	{}
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0007-cfg80211-fix-interface-combinations-check-for-ADHOC-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0007-cfg80211-fix-interface-combinations-check-for-ADHOC-.patch
new file mode 100644
index 0000000..3238c87
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0007-cfg80211-fix-interface-combinations-check-for-ADHOC-.patch
@@ -0,0 +1,67 @@
+From 41cc15f973d21bd51d318e8f5d67512821561d89 Mon Sep 17 00:00:00 2001
+From: Liang Li <liang.li@windriver.com>
+Date: Thu, 2 Aug 2012 18:55:41 -0400
+Subject: [PATCH 07/70] cfg80211: fix interface combinations check for
+ ADHOC(IBSS)
+
+partial of commit 8e8b41f9d8c8e63fc92f899ace8da91a490ac573 upstream.
+
+As part of commit 463454b5dbd8 ("cfg80211: fix interface
+combinations check"), this extra check was introduced:
+
+       if ((all_iftypes & used_iftypes) != used_iftypes)
+               goto cont;
+
+However, most wireless NIC drivers did not advertise ADHOC in
+wiphy.iface_combinations[i].limits[] and hence we'll get -EBUSY
+when we bring up a ADHOC wlan with commands similar to:
+
+ # iwconfig wlan0 mode ad-hoc && ifconfig wlan0 up
+
+In commit 8e8b41f9d8c8e ("cfg80211: enforce lack of interface
+combinations"), the change below fixes the issue:
+
+       if (total == 1)
+               return 0;
+
+But it also introduces other dependencies for stable. For example,
+a full cherry pick of 8e8b41f9d8c8e would introduce additional
+regressions unless we also start cherry picking driver specific
+fixes like the following:
+
+  9b4760e  ath5k: add possible wiphy interface combinations
+  1ae2fc2  mac80211_hwsim: advertise interface combinations
+  20c8e8d  ath9k: add possible wiphy interface combinations
+
+And the purpose of the 'if (total == 1)' is to cover the specific
+use case (IBSS, adhoc) that was mentioned above. So we just pick
+the specific part out from 8e8b41f9d8c8e here.
+
+Doing so gives stable kernels a way to fix the change introduced
+by 463454b5dbd8, without having to make cherry picks specific to
+various NIC drivers.
+
+Signed-off-by: Liang Li <liang.li@windriver.com>
+Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/wireless/util.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/net/wireless/util.c b/net/wireless/util.c
+index 74d5292..b5e4c1c 100644
+--- a/net/wireless/util.c
++++ b/net/wireless/util.c
+@@ -981,6 +981,9 @@ int cfg80211_can_change_interface(struct cfg80211_registered_device *rdev,
+ 	}
+ 	mutex_unlock(&rdev->devlist_mtx);
+ 
++	if (total == 1)
++		return 0;
++
+ 	for (i = 0; i < rdev->wiphy.n_iface_combinations; i++) {
+ 		const struct ieee80211_iface_combination *c;
+ 		struct ieee80211_iface_limit *limits;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0008-m68k-Correct-the-Atari-ALLOWINT-definition.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0008-m68k-Correct-the-Atari-ALLOWINT-definition.patch
new file mode 100644
index 0000000..a6dd032
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0008-m68k-Correct-the-Atari-ALLOWINT-definition.patch
@@ -0,0 +1,97 @@
+From b7cced0ffff904b0803fad89348dec227ab3c79a Mon Sep 17 00:00:00 2001
+From: Mikael Pettersson <mikpe@it.uu.se>
+Date: Thu, 19 Apr 2012 00:53:36 +0200
+Subject: [PATCH 08/70] m68k: Correct the Atari ALLOWINT definition
+
+commit c663600584a596b5e66258cc10716fb781a5c2c9 upstream.
+
+Booting a 3.2, 3.3, or 3.4-rc4 kernel on an Atari using the
+`nfeth' ethernet device triggers a WARN_ONCE() in generic irq
+handling code on the first irq for that device:
+
+WARNING: at kernel/irq/handle.c:146 handle_irq_event_percpu+0x134/0x142()
+irq 3 handler nfeth_interrupt+0x0/0x194 enabled interrupts
+Modules linked in:
+Call Trace: [<000299b2>] warn_slowpath_common+0x48/0x6a
+ [<000299c0>] warn_slowpath_common+0x56/0x6a
+ [<00029a4c>] warn_slowpath_fmt+0x2a/0x32
+ [<0005b34c>] handle_irq_event_percpu+0x134/0x142
+ [<0005b34c>] handle_irq_event_percpu+0x134/0x142
+ [<0000a584>] nfeth_interrupt+0x0/0x194
+ [<001ba0a8>] schedule_preempt_disabled+0x0/0xc
+ [<0005b37a>] handle_irq_event+0x20/0x2c
+ [<0005add4>] generic_handle_irq+0x2c/0x3a
+ [<00002ab6>] do_IRQ+0x20/0x32
+ [<0000289e>] auto_irqhandler_fixup+0x4/0x6
+ [<00003144>] cpu_idle+0x22/0x2e
+ [<001b8a78>] printk+0x0/0x18
+ [<0024d112>] start_kernel+0x37a/0x386
+ [<0003021d>] __do_proc_dointvec+0xb1/0x366
+ [<0003021d>] __do_proc_dointvec+0xb1/0x366
+ [<0024c31e>] _sinittext+0x31e/0x9c0
+
+After invoking the irq's handler the kernel sees !irqs_disabled()
+and concludes that the handler erroneously enabled interrupts.
+
+However, debugging shows that !irqs_disabled() is true even before
+the handler is invoked, which indicates a problem in the platform
+code rather than the specific driver.
+
+The warning does not occur in 3.1 or older kernels.
+
+It turns out that the ALLOWINT definition for Atari is incorrect.
+
+The Atari definition of ALLOWINT is ~0x400, the stated purpose of
+that is to avoid taking HSYNC interrupts.  irqs_disabled() returns
+true if the 3-bit ipl & 4 is non-zero.  The nfeth interrupt runs at
+ipl 3 (it's autovector 3), but 3 & 4 is zero so irqs_disabled() is
+false, and the warning above is generated.
+
+When interrupts are explicitly disabled, ipl is set to 7.  When they
+are enabled, ipl is masked with ALLOWINT.  On Atari this will result
+in ipl = 3, which blocks interrupts at ipl 3 and below.  So how come
+nfeth interrupts at ipl 3 are received at all?  That's because ipl
+is reset to 2 by Atari-specific code in default_idle(), again with
+the stated purpose of blocking HSYNC interrupts.  This discrepancy
+means that ipl 3 can remain blocked for longer than intended.
+
+Both default_idle() and falcon_hblhandler() identify HSYNC with
+ipl 2, and the "Atari ST/.../F030 Hardware Register Listing" agrees,
+but ALLOWINT is defined as if HSYNC was ipl 3.
+
+[As an experiment I modified default_idle() to reset ipl to 3, and
+as expected that resulted in all nfeth interrupts being blocked.]
+
+The fix is simple: define ALLOWINT as ~0x500 instead.  This makes
+arch_local_irq_enable() consistent with default_idle(), and prevents
+the !irqs_disabled() problems for ipl 3 interrupts.
+
+Tested on Atari running in an Aranym VM.
+
+Signed-off-by: Mikael Pettersson <mikpe@it.uu.se>
+Tested-by: Michael Schmitz <schmitzmic@googlemail.com> (on Falcon/CT60)
+[Geert Uytterhoeven: This version applies to v3.2..v3.4.]
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/m68k/include/asm/entry.h |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/m68k/include/asm/entry.h b/arch/m68k/include/asm/entry.h
+index c3c5a86..8798ebc 100644
+--- a/arch/m68k/include/asm/entry.h
++++ b/arch/m68k/include/asm/entry.h
+@@ -33,8 +33,8 @@
+ 
+ /* the following macro is used when enabling interrupts */
+ #if defined(MACH_ATARI_ONLY)
+-	/* block out HSYNC on the atari */
+-#define ALLOWINT	(~0x400)
++	/* block out HSYNC = ipl 2 on the atari */
++#define ALLOWINT	(~0x500)
+ #define	MAX_NOINT_IPL	3
+ #else
+ 	/* portable version */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0009-ene_ir-Fix-driver-initialisation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0009-ene_ir-Fix-driver-initialisation.patch
new file mode 100644
index 0000000..472f534
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0009-ene_ir-Fix-driver-initialisation.patch
@@ -0,0 +1,47 @@
+From 07187b4a8471054cf6698ddc3d72ce6b45b8544e Mon Sep 17 00:00:00 2001
+From: Luis Henriques <luis.henriques@canonical.com>
+Date: Tue, 19 Jun 2012 11:29:49 -0300
+Subject: [PATCH 09/70] ene_ir: Fix driver initialisation
+
+commit b31b021988fed9e3741a46918f14ba9b063811db upstream.
+
+commit 9ef449c6b31bb6a8e6dedc24de475a3b8c79be20 ("[media] rc: Postpone ISR
+registration") fixed an early ISR registration on several drivers.  It did
+however also introduced a bug by moving the invocation of pnp_port_start()
+to the end of the probe function.
+
+This patch fixes this issue by moving the invocation of pnp_port_start() to
+an earlier stage in the probe function.
+
+Cc: Jarod Wilson <jarod@redhat.com>
+Signed-off-by: Luis Henriques <luis.henriques@canonical.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/media/rc/ene_ir.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/media/rc/ene_ir.c b/drivers/media/rc/ene_ir.c
+index bef5296..647dd95 100644
+--- a/drivers/media/rc/ene_ir.c
++++ b/drivers/media/rc/ene_ir.c
+@@ -1018,6 +1018,8 @@ static int ene_probe(struct pnp_dev *pnp_dev, const struct pnp_device_id *id)
+ 
+ 	spin_lock_init(&dev->hw_lock);
+ 
++	dev->hw_io = pnp_port_start(pnp_dev, 0);
++
+ 	pnp_set_drvdata(pnp_dev, dev);
+ 	dev->pnp_dev = pnp_dev;
+ 
+@@ -1072,7 +1074,6 @@ static int ene_probe(struct pnp_dev *pnp_dev, const struct pnp_device_id *id)
+ 
+ 	/* claim the resources */
+ 	error = -EBUSY;
+-	dev->hw_io = pnp_port_start(pnp_dev, 0);
+ 	if (!request_region(dev->hw_io, ENE_IO_SIZE, ENE_DRIVER_NAME)) {
+ 		dev->hw_io = -1;
+ 		dev->irq = -1;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0010-nfsd4-our-filesystems-are-normally-case-sensitive.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0010-nfsd4-our-filesystems-are-normally-case-sensitive.patch
new file mode 100644
index 0000000..de068e4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0010-nfsd4-our-filesystems-are-normally-case-sensitive.patch
@@ -0,0 +1,32 @@
+From 6effad381853da1eb23ae2a04aac78009253ea74 Mon Sep 17 00:00:00 2001
+From: "J. Bruce Fields" <bfields@redhat.com>
+Date: Tue, 5 Jun 2012 16:52:06 -0400
+Subject: [PATCH 10/70] nfsd4: our filesystems are normally case sensitive
+
+commit 2930d381d22b9c56f40dd4c63a8fa59719ca2c3c upstream.
+
+Actually, xfs and jfs can optionally be case insensitive; we'll handle
+that case in later patches.
+
+Signed-off-by: J. Bruce Fields <bfields@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfsd/nfs4xdr.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/nfsd/nfs4xdr.c b/fs/nfsd/nfs4xdr.c
+index 9cfa60a..87a1746 100644
+--- a/fs/nfsd/nfs4xdr.c
++++ b/fs/nfsd/nfs4xdr.c
+@@ -2236,7 +2236,7 @@ out_acl:
+ 	if (bmval0 & FATTR4_WORD0_CASE_INSENSITIVE) {
+ 		if ((buflen -= 4) < 0)
+ 			goto out_resource;
+-		WRITE32(1);
++		WRITE32(0);
+ 	}
+ 	if (bmval0 & FATTR4_WORD0_CASE_PRESERVING) {
+ 		if ((buflen -= 4) < 0)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0011-random-Use-arch_get_random_int-instead-of-cycle-coun.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0011-random-Use-arch_get_random_int-instead-of-cycle-coun.patch
new file mode 100644
index 0000000..50e3091
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0011-random-Use-arch_get_random_int-instead-of-cycle-coun.patch
@@ -0,0 +1,69 @@
+From 396b7a076c7496b8d98861bbebe701de9a3b795a Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Thu, 22 Dec 2011 11:36:22 -0800
+Subject: [PATCH 11/70] random: Use arch_get_random_int instead of cycle
+ counter if avail
+
+commit cf833d0b9937874b50ef2867c4e8badfd64948ce upstream.
+
+We still don't use rdrand in /dev/random, which just seems stupid. We
+accept the *cycle*counter* as a random input, but we don't accept
+rdrand? That's just broken.
+
+Sure, people can do things in user space (write to /dev/random, use
+rdrand in addition to /dev/random themselves etc etc), but that
+*still* seems to be a particularly stupid reason for saying "we
+shouldn't bother to try to do better in /dev/random".
+
+And even if somebody really doesn't trust rdrand as a source of random
+bytes, it seems singularly stupid to trust the cycle counter *more*.
+
+So I'd suggest the attached patch. I'm not going to even bother
+arguing that we should add more bits to the entropy estimate, because
+that's not the point - I don't care if /dev/random fills up slowly or
+not, I think it's just stupid to not use the bits we can get from
+rdrand and mix them into the strong randomness pool.
+
+Link: http://lkml.kernel.org/r/CA%2B55aFwn59N1=m651QAyTy-1gO1noGbK18zwKDwvwqnravA84A@mail.gmail.com
+Acked-by: "David S. Miller" <davem@davemloft.net>
+Acked-by: "Theodore Ts'o" <tytso@mit.edu>
+Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
+Cc: Matt Mackall <mpm@selenic.com>
+Cc: Tony Luck <tony.luck@intel.com>
+Cc: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 6035ab8..85da874 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -624,8 +624,8 @@ static struct timer_rand_state input_timer_state;
+ static void add_timer_randomness(struct timer_rand_state *state, unsigned num)
+ {
+ 	struct {
+-		cycles_t cycles;
+ 		long jiffies;
++		unsigned cycles;
+ 		unsigned num;
+ 	} sample;
+ 	long delta, delta2, delta3;
+@@ -637,7 +637,11 @@ static void add_timer_randomness(struct timer_rand_state *state, unsigned num)
+ 		goto out;
+ 
+ 	sample.jiffies = jiffies;
+-	sample.cycles = get_cycles();
++
++	/* Use arch random value, fall back to cycles */
++	if (!arch_get_random_int(&sample.cycles))
++		sample.cycles = get_cycles();
++
+ 	sample.num = num;
+ 	mix_pool_bytes(&input_pool, &sample, sizeof(sample));
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0012-random-Use-arch-specific-RNG-to-initialize-the-entro.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0012-random-Use-arch-specific-RNG-to-initialize-the-entro.patch
new file mode 100644
index 0000000..623bc63
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0012-random-Use-arch-specific-RNG-to-initialize-the-entro.patch
@@ -0,0 +1,49 @@
+From 5633ed2c64b766f280942d8c0906f7ae77cf2c20 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 22 Dec 2011 16:28:01 -0500
+Subject: [PATCH 12/70] random: Use arch-specific RNG to initialize the
+ entropy store
+
+commit 3e88bdff1c65145f7ba297ccec69c774afe4c785 upstream.
+
+If there is an architecture-specific random number generator (such as
+RDRAND for Intel architectures), use it to initialize /dev/random's
+entropy stores.  Even in the worst case, if RDRAND is something like
+AES(NSA_KEY, counter++), it won't hurt, and it will definitely help
+against any other adversaries.
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Link: http://lkml.kernel.org/r/1324589281-31931-1-git-send-email-tytso@mit.edu
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 85da874..3079477 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -965,6 +965,7 @@ EXPORT_SYMBOL(get_random_bytes);
+  */
+ static void init_std_data(struct entropy_store *r)
+ {
++	int i;
+ 	ktime_t now;
+ 	unsigned long flags;
+ 
+@@ -974,6 +975,11 @@ static void init_std_data(struct entropy_store *r)
+ 
+ 	now = ktime_get_real();
+ 	mix_pool_bytes(r, &now, sizeof(now));
++	for (i = r->poolinfo->poolwords; i; i--) {
++		if (!arch_get_random_long(&flags))
++			break;
++		mix_pool_bytes(r, &flags, sizeof(flags));
++	}
+ 	mix_pool_bytes(r, utsname(), sizeof(*(utsname())));
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0013-random-Adjust-the-number-of-loops-when-initializing.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0013-random-Adjust-the-number-of-loops-when-initializing.patch
new file mode 100644
index 0000000..03af3b2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0013-random-Adjust-the-number-of-loops-when-initializing.patch
@@ -0,0 +1,37 @@
+From 451f20f81b1619b22ecd823bb962d76e05a4afa6 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@linux.intel.com>
+Date: Mon, 16 Jan 2012 11:23:29 -0800
+Subject: [PATCH 13/70] random: Adjust the number of loops when initializing
+
+commit 2dac8e54f988ab58525505d7ef982493374433c3 upstream.
+
+When we are initializing using arch_get_random_long() we only need to
+loop enough times to touch all the bytes in the buffer; using
+poolwords for that does twice the number of operations necessary on a
+64-bit machine, since in the random number generator code "word" means
+32 bits.
+
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+Cc: "Theodore Ts'o" <tytso@mit.edu>
+Link: http://lkml.kernel.org/r/1324589281-31931-1-git-send-email-tytso@mit.edu
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 3079477..9a2156d 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -975,7 +975,7 @@ static void init_std_data(struct entropy_store *r)
+ 
+ 	now = ktime_get_real();
+ 	mix_pool_bytes(r, &now, sizeof(now));
+-	for (i = r->poolinfo->poolwords; i; i--) {
++	for (i = r->poolinfo->POOLBYTES; i > 0; i -= sizeof flags) {
+ 		if (!arch_get_random_long(&flags))
+ 			break;
+ 		mix_pool_bytes(r, &flags, sizeof(flags));
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0014-random-make-add_interrupt_randomness-do-something-sa.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0014-random-make-add_interrupt_randomness-do-something-sa.patch
new file mode 100644
index 0000000..70a2ed5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0014-random-make-add_interrupt_randomness-do-something-sa.patch
@@ -0,0 +1,288 @@
+From 7fdc8a8f6b3498487bee19b2f01969245f8ac85a Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Mon, 2 Jul 2012 07:52:16 -0400
+Subject: [PATCH 14/70] random: make 'add_interrupt_randomness()' do something
+ sane
+
+commit 775f4b297b780601e61787b766f306ed3e1d23eb upstream.
+
+We've been moving away from add_interrupt_randomness() for various
+reasons: it's too expensive to do on every interrupt, and flooding the
+CPU with interrupts could theoretically cause bogus floods of entropy
+from a somewhat externally controllable source.
+
+This solves both problems by limiting the actual randomness addition
+to just once a second or after 64 interrupts, whicever comes first.
+During that time, the interrupt cycle data is buffered up in a per-cpu
+pool.  Also, we make sure the the nonblocking pool used by urandom is
+initialized before we start feeding the normal input pool.  This
+assures that /dev/urandom is returning unpredictable data as soon as
+possible.
+
+(Based on an original patch by Linus, but significantly modified by
+tytso.)
+
+Tested-by: Eric Wustrow <ewust@umich.edu>
+Reported-by: Eric Wustrow <ewust@umich.edu>
+Reported-by: Nadia Heninger <nadiah@cs.ucsd.edu>
+Reported-by: Zakir Durumeric <zakir@umich.edu>
+Reported-by: J. Alex Halderman <jhalderm@umich.edu>.
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c     |  103 +++++++++++++++++++++++++++++++++++++-------
+ drivers/mfd/ab3100-core.c |    2 -
+ include/linux/random.h    |    2 +-
+ kernel/irq/handle.c       |    7 +--
+ 4 files changed, 90 insertions(+), 24 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 9a2156d..a30df99 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -127,19 +127,15 @@
+  *
+  * 	void add_input_randomness(unsigned int type, unsigned int code,
+  *                                unsigned int value);
+- * 	void add_interrupt_randomness(int irq);
++ *	void add_interrupt_randomness(int irq, int irq_flags);
+  * 	void add_disk_randomness(struct gendisk *disk);
+  *
+  * add_input_randomness() uses the input layer interrupt timing, as well as
+  * the event type information from the hardware.
+  *
+- * add_interrupt_randomness() uses the inter-interrupt timing as random
+- * inputs to the entropy pool.  Note that not all interrupts are good
+- * sources of randomness!  For example, the timer interrupts is not a
+- * good choice, because the periodicity of the interrupts is too
+- * regular, and hence predictable to an attacker.  Network Interface
+- * Controller interrupts are a better measure, since the timing of the
+- * NIC interrupts are more unpredictable.
++ * add_interrupt_randomness() uses the interrupt timing as random
++ * inputs to the entropy pool. Using the cycle counters and the irq source
++ * as inputs, it feeds the randomness roughly once a second.
+  *
+  * add_disk_randomness() uses what amounts to the seek time of block
+  * layer request events, on a per-disk_devt basis, as input to the
+@@ -248,6 +244,7 @@
+ #include <linux/percpu.h>
+ #include <linux/cryptohash.h>
+ #include <linux/fips.h>
++#include <linux/ptrace.h>
+ 
+ #ifdef CONFIG_GENERIC_HARDIRQS
+ # include <linux/irq.h>
+@@ -256,6 +253,7 @@
+ #include <asm/processor.h>
+ #include <asm/uaccess.h>
+ #include <asm/irq.h>
++#include <asm/irq_regs.h>
+ #include <asm/io.h>
+ 
+ /*
+@@ -421,7 +419,9 @@ struct entropy_store {
+ 	spinlock_t lock;
+ 	unsigned add_ptr;
+ 	int entropy_count;
++	int entropy_total;
+ 	int input_rotate;
++	unsigned int initialized:1;
+ 	__u8 last_data[EXTRACT_SIZE];
+ };
+ 
+@@ -454,6 +454,10 @@ static struct entropy_store nonblocking_pool = {
+ 	.pool = nonblocking_pool_data
+ };
+ 
++static __u32 const twist_table[8] = {
++	0x00000000, 0x3b6e20c8, 0x76dc4190, 0x4db26158,
++	0xedb88320, 0xd6d6a3e8, 0x9b64c2b0, 0xa00ae278 };
++
+ /*
+  * This function adds bytes into the entropy "pool".  It does not
+  * update the entropy estimate.  The caller should call
+@@ -467,9 +471,6 @@ static struct entropy_store nonblocking_pool = {
+ static void mix_pool_bytes_extract(struct entropy_store *r, const void *in,
+ 				   int nbytes, __u8 out[64])
+ {
+-	static __u32 const twist_table[8] = {
+-		0x00000000, 0x3b6e20c8, 0x76dc4190, 0x4db26158,
+-		0xedb88320, 0xd6d6a3e8, 0x9b64c2b0, 0xa00ae278 };
+ 	unsigned long i, j, tap1, tap2, tap3, tap4, tap5;
+ 	int input_rotate;
+ 	int wordmask = r->poolinfo->poolwords - 1;
+@@ -528,6 +529,36 @@ static void mix_pool_bytes(struct entropy_store *r, const void *in, int bytes)
+        mix_pool_bytes_extract(r, in, bytes, NULL);
+ }
+ 
++struct fast_pool {
++	__u32		pool[4];
++	unsigned long	last;
++	unsigned short	count;
++	unsigned char	rotate;
++	unsigned char	last_timer_intr;
++};
++
++/*
++ * This is a fast mixing routine used by the interrupt randomness
++ * collector.  It's hardcoded for an 128 bit pool and assumes that any
++ * locks that might be needed are taken by the caller.
++ */
++static void fast_mix(struct fast_pool *f, const void *in, int nbytes)
++{
++	const char	*bytes = in;
++	__u32		w;
++	unsigned	i = f->count;
++	unsigned	input_rotate = f->rotate;
++
++	while (nbytes--) {
++		w = rol32(*bytes++, input_rotate & 31) ^ f->pool[i & 3] ^
++			f->pool[(i + 1) & 3];
++		f->pool[i & 3] = (w >> 3) ^ twist_table[w & 7];
++		input_rotate += (i++ & 3) ? 7 : 14;
++	}
++	f->count = i;
++	f->rotate = input_rotate;
++}
++
+ /*
+  * Credit (or debit) the entropy store with n bits of entropy
+  */
+@@ -551,6 +582,12 @@ static void credit_entropy_bits(struct entropy_store *r, int nbits)
+ 		entropy_count = r->poolinfo->POOLBITS;
+ 	r->entropy_count = entropy_count;
+ 
++	if (!r->initialized && nbits > 0) {
++		r->entropy_total += nbits;
++		if (r->entropy_total > 128)
++			r->initialized = 1;
++	}
++
+ 	/* should we wake readers? */
+ 	if (r == &input_pool && entropy_count >= random_read_wakeup_thresh) {
+ 		wake_up_interruptible(&random_read_wait);
+@@ -700,17 +737,48 @@ void add_input_randomness(unsigned int type, unsigned int code,
+ }
+ EXPORT_SYMBOL_GPL(add_input_randomness);
+ 
+-void add_interrupt_randomness(int irq)
++static DEFINE_PER_CPU(struct fast_pool, irq_randomness);
++
++void add_interrupt_randomness(int irq, int irq_flags)
+ {
+-	struct timer_rand_state *state;
++	struct entropy_store	*r;
++	struct fast_pool	*fast_pool = &__get_cpu_var(irq_randomness);
++	struct pt_regs		*regs = get_irq_regs();
++	unsigned long		now = jiffies;
++	__u32			input[4], cycles = get_cycles();
++
++	input[0] = cycles ^ jiffies;
++	input[1] = irq;
++	if (regs) {
++		__u64 ip = instruction_pointer(regs);
++		input[2] = ip;
++		input[3] = ip >> 32;
++	}
+ 
+-	state = get_timer_rand_state(irq);
++	fast_mix(fast_pool, input, sizeof(input));
+ 
+-	if (state == NULL)
++	if ((fast_pool->count & 1023) &&
++	    !time_after(now, fast_pool->last + HZ))
+ 		return;
+ 
+-	DEBUG_ENT("irq event %d\n", irq);
+-	add_timer_randomness(state, 0x100 + irq);
++	fast_pool->last = now;
++
++	r = nonblocking_pool.initialized ? &input_pool : &nonblocking_pool;
++	mix_pool_bytes(r, &fast_pool->pool, sizeof(fast_pool->pool));
++	/*
++	 * If we don't have a valid cycle counter, and we see
++	 * back-to-back timer interrupts, then skip giving credit for
++	 * any entropy.
++	 */
++	if (cycles == 0) {
++		if (irq_flags & __IRQF_TIMER) {
++			if (fast_pool->last_timer_intr)
++				return;
++			fast_pool->last_timer_intr = 1;
++		} else
++			fast_pool->last_timer_intr = 0;
++	}
++	credit_entropy_bits(r, 1);
+ }
+ 
+ #ifdef CONFIG_BLOCK
+@@ -971,6 +1039,7 @@ static void init_std_data(struct entropy_store *r)
+ 
+ 	spin_lock_irqsave(&r->lock, flags);
+ 	r->entropy_count = 0;
++	r->entropy_total = 0;
+ 	spin_unlock_irqrestore(&r->lock, flags);
+ 
+ 	now = ktime_get_real();
+diff --git a/drivers/mfd/ab3100-core.c b/drivers/mfd/ab3100-core.c
+index 60107ee..4eec7b7 100644
+--- a/drivers/mfd/ab3100-core.c
++++ b/drivers/mfd/ab3100-core.c
+@@ -409,8 +409,6 @@ static irqreturn_t ab3100_irq_handler(int irq, void *data)
+ 	u32 fatevent;
+ 	int err;
+ 
+-	add_interrupt_randomness(irq);
+-
+ 	err = ab3100_get_register_page_interruptible(ab3100, AB3100_EVENTA1,
+ 				       event_regs, 3);
+ 	if (err)
+diff --git a/include/linux/random.h b/include/linux/random.h
+index 8f74538..6ef39d7 100644
+--- a/include/linux/random.h
++++ b/include/linux/random.h
+@@ -52,7 +52,7 @@ extern void rand_initialize_irq(int irq);
+ 
+ extern void add_input_randomness(unsigned int type, unsigned int code,
+ 				 unsigned int value);
+-extern void add_interrupt_randomness(int irq);
++extern void add_interrupt_randomness(int irq, int irq_flags);
+ 
+ extern void get_random_bytes(void *buf, int nbytes);
+ void generate_random_uuid(unsigned char uuid_out[16]);
+diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
+index 470d08c..10e0772 100644
+--- a/kernel/irq/handle.c
++++ b/kernel/irq/handle.c
+@@ -117,7 +117,7 @@ irqreturn_t
+ handle_irq_event_percpu(struct irq_desc *desc, struct irqaction *action)
+ {
+ 	irqreturn_t retval = IRQ_NONE;
+-	unsigned int random = 0, irq = desc->irq_data.irq;
++	unsigned int flags = 0, irq = desc->irq_data.irq;
+ 
+ 	do {
+ 		irqreturn_t res;
+@@ -145,7 +145,7 @@ handle_irq_event_percpu(struct irq_desc *desc, struct irqaction *action)
+ 
+ 			/* Fall through to add to randomness */
+ 		case IRQ_HANDLED:
+-			random |= action->flags;
++			flags |= action->flags;
+ 			break;
+ 
+ 		default:
+@@ -156,8 +156,7 @@ handle_irq_event_percpu(struct irq_desc *desc, struct irqaction *action)
+ 		action = action->next;
+ 	} while (action);
+ 
+-	if (random & IRQF_SAMPLE_RANDOM)
+-		add_interrupt_randomness(irq);
++	add_interrupt_randomness(irq, flags);
+ 
+ 	if (!noirqdebug)
+ 		note_interrupt(irq, desc, retval);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0015-random-use-lockless-techniques-in-the-interrupt-path.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0015-random-use-lockless-techniques-in-the-interrupt-path.patch
new file mode 100644
index 0000000..7638e84
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0015-random-use-lockless-techniques-in-the-interrupt-path.patch
@@ -0,0 +1,245 @@
+From 121c36f0542c9e8e3066652a19d4cfa838e28139 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Wed, 4 Jul 2012 10:38:30 -0400
+Subject: [PATCH 15/70] random: use lockless techniques in the interrupt path
+
+commit 902c098a3663de3fa18639efbb71b6080f0bcd3c upstream.
+
+The real-time Linux folks don't like add_interrupt_randomness() taking
+a spinlock since it is called in the low-level interrupt routine.
+This also allows us to reduce the overhead in the fast path, for the
+random driver, which is the interrupt collection path.
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c |   78 ++++++++++++++++++++++++------------------------
+ 1 files changed, 39 insertions(+), 39 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index a30df99..8ac7e05 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -418,9 +418,9 @@ struct entropy_store {
+ 	/* read-write data: */
+ 	spinlock_t lock;
+ 	unsigned add_ptr;
++	unsigned input_rotate;
+ 	int entropy_count;
+ 	int entropy_total;
+-	int input_rotate;
+ 	unsigned int initialized:1;
+ 	__u8 last_data[EXTRACT_SIZE];
+ };
+@@ -468,26 +468,24 @@ static __u32 const twist_table[8] = {
+  * it's cheap to do so and helps slightly in the expected case where
+  * the entropy is concentrated in the low-order bits.
+  */
+-static void mix_pool_bytes_extract(struct entropy_store *r, const void *in,
+-				   int nbytes, __u8 out[64])
++static void __mix_pool_bytes(struct entropy_store *r, const void *in,
++			     int nbytes, __u8 out[64])
+ {
+ 	unsigned long i, j, tap1, tap2, tap3, tap4, tap5;
+ 	int input_rotate;
+ 	int wordmask = r->poolinfo->poolwords - 1;
+ 	const char *bytes = in;
+ 	__u32 w;
+-	unsigned long flags;
+ 
+-	/* Taps are constant, so we can load them without holding r->lock.  */
+ 	tap1 = r->poolinfo->tap1;
+ 	tap2 = r->poolinfo->tap2;
+ 	tap3 = r->poolinfo->tap3;
+ 	tap4 = r->poolinfo->tap4;
+ 	tap5 = r->poolinfo->tap5;
+ 
+-	spin_lock_irqsave(&r->lock, flags);
+-	input_rotate = r->input_rotate;
+-	i = r->add_ptr;
++	smp_rmb();
++	input_rotate = ACCESS_ONCE(r->input_rotate);
++	i = ACCESS_ONCE(r->add_ptr);
+ 
+ 	/* mix one byte at a time to simplify size handling and churn faster */
+ 	while (nbytes--) {
+@@ -514,19 +512,23 @@ static void mix_pool_bytes_extract(struct entropy_store *r, const void *in,
+ 		input_rotate += i ? 7 : 14;
+ 	}
+ 
+-	r->input_rotate = input_rotate;
+-	r->add_ptr = i;
++	ACCESS_ONCE(r->input_rotate) = input_rotate;
++	ACCESS_ONCE(r->add_ptr) = i;
++	smp_wmb();
+ 
+ 	if (out)
+ 		for (j = 0; j < 16; j++)
+ 			((__u32 *)out)[j] = r->pool[(i - j) & wordmask];
+-
+-	spin_unlock_irqrestore(&r->lock, flags);
+ }
+ 
+-static void mix_pool_bytes(struct entropy_store *r, const void *in, int bytes)
++static void mix_pool_bytes(struct entropy_store *r, const void *in,
++			     int nbytes, __u8 out[64])
+ {
+-       mix_pool_bytes_extract(r, in, bytes, NULL);
++	unsigned long flags;
++
++	spin_lock_irqsave(&r->lock, flags);
++	__mix_pool_bytes(r, in, nbytes, out);
++	spin_unlock_irqrestore(&r->lock, flags);
+ }
+ 
+ struct fast_pool {
+@@ -564,23 +566,22 @@ static void fast_mix(struct fast_pool *f, const void *in, int nbytes)
+  */
+ static void credit_entropy_bits(struct entropy_store *r, int nbits)
+ {
+-	unsigned long flags;
+-	int entropy_count;
++	int entropy_count, orig;
+ 
+ 	if (!nbits)
+ 		return;
+ 
+-	spin_lock_irqsave(&r->lock, flags);
+-
+ 	DEBUG_ENT("added %d entropy credits to %s\n", nbits, r->name);
+-	entropy_count = r->entropy_count;
++retry:
++	entropy_count = orig = ACCESS_ONCE(r->entropy_count);
+ 	entropy_count += nbits;
+ 	if (entropy_count < 0) {
+ 		DEBUG_ENT("negative entropy/overflow\n");
+ 		entropy_count = 0;
+ 	} else if (entropy_count > r->poolinfo->POOLBITS)
+ 		entropy_count = r->poolinfo->POOLBITS;
+-	r->entropy_count = entropy_count;
++	if (cmpxchg(&r->entropy_count, orig, entropy_count) != orig)
++		goto retry;
+ 
+ 	if (!r->initialized && nbits > 0) {
+ 		r->entropy_total += nbits;
+@@ -593,7 +594,6 @@ static void credit_entropy_bits(struct entropy_store *r, int nbits)
+ 		wake_up_interruptible(&random_read_wait);
+ 		kill_fasync(&fasync, SIGIO, POLL_IN);
+ 	}
+-	spin_unlock_irqrestore(&r->lock, flags);
+ }
+ 
+ /*********************************************************************
+@@ -680,7 +680,7 @@ static void add_timer_randomness(struct timer_rand_state *state, unsigned num)
+ 		sample.cycles = get_cycles();
+ 
+ 	sample.num = num;
+-	mix_pool_bytes(&input_pool, &sample, sizeof(sample));
++	mix_pool_bytes(&input_pool, &sample, sizeof(sample), NULL);
+ 
+ 	/*
+ 	 * Calculate number of bits of randomness we probably added.
+@@ -764,7 +764,7 @@ void add_interrupt_randomness(int irq, int irq_flags)
+ 	fast_pool->last = now;
+ 
+ 	r = nonblocking_pool.initialized ? &input_pool : &nonblocking_pool;
+-	mix_pool_bytes(r, &fast_pool->pool, sizeof(fast_pool->pool));
++	__mix_pool_bytes(r, &fast_pool->pool, sizeof(fast_pool->pool), NULL);
+ 	/*
+ 	 * If we don't have a valid cycle counter, and we see
+ 	 * back-to-back timer interrupts, then skip giving credit for
+@@ -829,7 +829,7 @@ static void xfer_secondary_pool(struct entropy_store *r, size_t nbytes)
+ 
+ 		bytes = extract_entropy(r->pull, tmp, bytes,
+ 					random_read_wakeup_thresh / 8, rsvd);
+-		mix_pool_bytes(r, tmp, bytes);
++		mix_pool_bytes(r, tmp, bytes, NULL);
+ 		credit_entropy_bits(r, bytes*8);
+ 	}
+ }
+@@ -890,9 +890,11 @@ static void extract_buf(struct entropy_store *r, __u8 *out)
+ 	int i;
+ 	__u32 hash[5], workspace[SHA_WORKSPACE_WORDS];
+ 	__u8 extract[64];
++	unsigned long flags;
+ 
+ 	/* Generate a hash across the pool, 16 words (512 bits) at a time */
+ 	sha_init(hash);
++	spin_lock_irqsave(&r->lock, flags);
+ 	for (i = 0; i < r->poolinfo->poolwords; i += 16)
+ 		sha_transform(hash, (__u8 *)(r->pool + i), workspace);
+ 
+@@ -905,7 +907,8 @@ static void extract_buf(struct entropy_store *r, __u8 *out)
+ 	 * brute-forcing the feedback as hard as brute-forcing the
+ 	 * hash.
+ 	 */
+-	mix_pool_bytes_extract(r, hash, sizeof(hash), extract);
++	__mix_pool_bytes(r, hash, sizeof(hash), extract);
++	spin_unlock_irqrestore(&r->lock, flags);
+ 
+ 	/*
+ 	 * To avoid duplicates, we atomically extract a portion of the
+@@ -928,11 +931,10 @@ static void extract_buf(struct entropy_store *r, __u8 *out)
+ }
+ 
+ static ssize_t extract_entropy(struct entropy_store *r, void *buf,
+-			       size_t nbytes, int min, int reserved)
++				 size_t nbytes, int min, int reserved)
+ {
+ 	ssize_t ret = 0, i;
+ 	__u8 tmp[EXTRACT_SIZE];
+-	unsigned long flags;
+ 
+ 	xfer_secondary_pool(r, nbytes);
+ 	nbytes = account(r, nbytes, min, reserved);
+@@ -941,6 +943,8 @@ static ssize_t extract_entropy(struct entropy_store *r, void *buf,
+ 		extract_buf(r, tmp);
+ 
+ 		if (fips_enabled) {
++			unsigned long flags;
++
+ 			spin_lock_irqsave(&r->lock, flags);
+ 			if (!memcmp(tmp, r->last_data, EXTRACT_SIZE))
+ 				panic("Hardware RNG duplicated output!\n");
+@@ -1034,22 +1038,18 @@ EXPORT_SYMBOL(get_random_bytes);
+ static void init_std_data(struct entropy_store *r)
+ {
+ 	int i;
+-	ktime_t now;
+-	unsigned long flags;
++	ktime_t now = ktime_get_real();
++	unsigned long rv;
+ 
+-	spin_lock_irqsave(&r->lock, flags);
+ 	r->entropy_count = 0;
+ 	r->entropy_total = 0;
+-	spin_unlock_irqrestore(&r->lock, flags);
+-
+-	now = ktime_get_real();
+-	mix_pool_bytes(r, &now, sizeof(now));
+-	for (i = r->poolinfo->POOLBYTES; i > 0; i -= sizeof flags) {
+-		if (!arch_get_random_long(&flags))
++	mix_pool_bytes(r, &now, sizeof(now), NULL);
++	for (i = r->poolinfo->POOLBYTES; i > 0; i -= sizeof(rv)) {
++		if (!arch_get_random_long(&rv))
+ 			break;
+-		mix_pool_bytes(r, &flags, sizeof(flags));
++		mix_pool_bytes(r, &rv, sizeof(rv), NULL);
+ 	}
+-	mix_pool_bytes(r, utsname(), sizeof(*(utsname())));
++	mix_pool_bytes(r, utsname(), sizeof(*(utsname())), NULL);
+ }
+ 
+ static int rand_initialize(void)
+@@ -1186,7 +1186,7 @@ write_pool(struct entropy_store *r, const char __user *buffer, size_t count)
+ 		count -= bytes;
+ 		p += bytes;
+ 
+-		mix_pool_bytes(r, buf, bytes);
++		mix_pool_bytes(r, buf, bytes, NULL);
+ 		cond_resched();
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0016-random-create-add_device_randomness-interface.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0016-random-create-add_device_randomness-interface.patch
new file mode 100644
index 0000000..78b8dcb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0016-random-create-add_device_randomness-interface.patch
@@ -0,0 +1,93 @@
+From 683cefe6594a919e89ca7d7d076ca753ced67679 Mon Sep 17 00:00:00 2001
+From: Linus Torvalds <torvalds@linux-foundation.org>
+Date: Wed, 4 Jul 2012 11:16:01 -0400
+Subject: [PATCH 16/70] random: create add_device_randomness() interface
+
+commit a2080a67abe9e314f9e9c2cc3a4a176e8a8f8793 upstream.
+
+Add a new interface, add_device_randomness() for adding data to the
+random pool that is likely to differ between two devices (or possibly
+even per boot).  This would be things like MAC addresses or serial
+numbers, or the read-out of the RTC. This does *not* add any actual
+entropy to the pool, but it initializes the pool to different values
+for devices that might otherwise be identical and have very little
+entropy available to them (particularly common in the embedded world).
+
+[ Modified by tytso to mix in a timestamp, since there may be some
+  variability caused by the time needed to detect/configure the hardware
+  in question. ]
+
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c  |   28 ++++++++++++++++++++++++++++
+ include/linux/random.h |    1 +
+ 2 files changed, 29 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 8ac7e05..4446a27 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -125,11 +125,20 @@
+  * The current exported interfaces for gathering environmental noise
+  * from the devices are:
+  *
++ *	void add_device_randomness(const void *buf, unsigned int size);
+  * 	void add_input_randomness(unsigned int type, unsigned int code,
+  *                                unsigned int value);
+  *	void add_interrupt_randomness(int irq, int irq_flags);
+  * 	void add_disk_randomness(struct gendisk *disk);
+  *
++ * add_device_randomness() is for adding data to the random pool that
++ * is likely to differ between two devices (or possibly even per boot).
++ * This would be things like MAC addresses or serial numbers, or the
++ * read-out of the RTC. This does *not* add any actual entropy to the
++ * pool, but it initializes the pool to different values for devices
++ * that might otherwise be identical and have very little entropy
++ * available to them (particularly common in the embedded world).
++ *
+  * add_input_randomness() uses the input layer interrupt timing, as well as
+  * the event type information from the hardware.
+  *
+@@ -646,6 +655,25 @@ static void set_timer_rand_state(unsigned int irq,
+ }
+ #endif
+ 
++/*
++ * Add device- or boot-specific data to the input and nonblocking
++ * pools to help initialize them to unique values.
++ *
++ * None of this adds any entropy, it is meant to avoid the
++ * problem of the nonblocking pool having similar initial state
++ * across largely identical devices.
++ */
++void add_device_randomness(const void *buf, unsigned int size)
++{
++	unsigned long time = get_cycles() ^ jiffies;
++
++	mix_pool_bytes(&input_pool, buf, size, NULL);
++	mix_pool_bytes(&input_pool, &time, sizeof(time), NULL);
++	mix_pool_bytes(&nonblocking_pool, buf, size, NULL);
++	mix_pool_bytes(&nonblocking_pool, &time, sizeof(time), NULL);
++}
++EXPORT_SYMBOL(add_device_randomness);
++
+ static struct timer_rand_state input_timer_state;
+ 
+ /*
+diff --git a/include/linux/random.h b/include/linux/random.h
+index 6ef39d7..e14b438 100644
+--- a/include/linux/random.h
++++ b/include/linux/random.h
+@@ -50,6 +50,7 @@ struct rnd_state {
+ 
+ extern void rand_initialize_irq(int irq);
+ 
++extern void add_device_randomness(const void *, unsigned int);
+ extern void add_input_randomness(unsigned int type, unsigned int code,
+ 				 unsigned int value);
+ extern void add_interrupt_randomness(int irq, int irq_flags);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0017-usb-feed-USB-device-information-to-the-dev-random-dr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0017-usb-feed-USB-device-information-to-the-dev-random-dr.patch
new file mode 100644
index 0000000..a2e4aea
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0017-usb-feed-USB-device-information-to-the-dev-random-dr.patch
@@ -0,0 +1,49 @@
+From 578a5228a14f84af6f10050b84e3da331b0c37eb Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Wed, 4 Jul 2012 11:22:20 -0400
+Subject: [PATCH 17/70] usb: feed USB device information to the /dev/random
+ driver
+
+commit b04b3156a20d395a7faa8eed98698d1e17a36000 upstream.
+
+Send the USB device's serial, product, and manufacturer strings to the
+/dev/random driver to help seed its pools.
+
+Cc: Linus Torvalds <torvalds@linux-foundation.org>
+Acked-by: Greg KH <greg@kroah.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/core/hub.c |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
+index 2bc736f..6a4a8c9 100644
+--- a/drivers/usb/core/hub.c
++++ b/drivers/usb/core/hub.c
+@@ -24,6 +24,7 @@
+ #include <linux/kthread.h>
+ #include <linux/mutex.h>
+ #include <linux/freezer.h>
++#include <linux/random.h>
+ 
+ #include <asm/uaccess.h>
+ #include <asm/byteorder.h>
+@@ -1897,6 +1898,14 @@ int usb_new_device(struct usb_device *udev)
+ 	/* Tell the world! */
+ 	announce_device(udev);
+ 
++	if (udev->serial)
++		add_device_randomness(udev->serial, strlen(udev->serial));
++	if (udev->product)
++		add_device_randomness(udev->product, strlen(udev->product));
++	if (udev->manufacturer)
++		add_device_randomness(udev->manufacturer,
++				      strlen(udev->manufacturer));
++
+ 	device_enable_async_suspend(&udev->dev);
+ 	/* Register the device.  The device driver is responsible
+ 	 * for configuring the device and invoking the add-device
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0018-net-feed-dev-random-with-the-MAC-address-when-regist.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0018-net-feed-dev-random-with-the-MAC-address-when-regist.patch
new file mode 100644
index 0000000..f2dd6aa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0018-net-feed-dev-random-with-the-MAC-address-when-regist.patch
@@ -0,0 +1,60 @@
+From c59aebeab04a154ab9b93a79303be44d5d382059 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Wed, 4 Jul 2012 21:23:25 -0400
+Subject: [PATCH 18/70] net: feed /dev/random with the MAC address when
+ registering a device
+
+commit 7bf2357524408b97fec58344caf7397f8140c3fd upstream.
+
+Cc: David Miller <davem@davemloft.net>
+Cc: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/dev.c       |    3 +++
+ net/core/rtnetlink.c |    1 +
+ 2 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/net/core/dev.c b/net/core/dev.c
+index 5738654..4b18703 100644
+--- a/net/core/dev.c
++++ b/net/core/dev.c
+@@ -1177,6 +1177,7 @@ static int __dev_open(struct net_device *dev)
+ 		net_dmaengine_get();
+ 		dev_set_rx_mode(dev);
+ 		dev_activate(dev);
++		add_device_randomness(dev->dev_addr, dev->addr_len);
+ 	}
+ 
+ 	return ret;
+@@ -4841,6 +4842,7 @@ int dev_set_mac_address(struct net_device *dev, struct sockaddr *sa)
+ 	err = ops->ndo_set_mac_address(dev, sa);
+ 	if (!err)
+ 		call_netdevice_notifiers(NETDEV_CHANGEADDR, dev);
++	add_device_randomness(dev->dev_addr, dev->addr_len);
+ 	return err;
+ }
+ EXPORT_SYMBOL(dev_set_mac_address);
+@@ -5621,6 +5623,7 @@ int register_netdevice(struct net_device *dev)
+ 	dev_init_scheduler(dev);
+ 	dev_hold(dev);
+ 	list_netdevice(dev);
++	add_device_randomness(dev->dev_addr, dev->addr_len);
+ 
+ 	/* Notify protocols, that a new device appeared. */
+ 	ret = call_netdevice_notifiers(NETDEV_REGISTER, dev);
+diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
+index 2ef859a..05842ab 100644
+--- a/net/core/rtnetlink.c
++++ b/net/core/rtnetlink.c
+@@ -1354,6 +1354,7 @@ static int do_setlink(struct net_device *dev, struct ifinfomsg *ifm,
+ 			goto errout;
+ 		send_addr_notify = 1;
+ 		modified = 1;
++		add_device_randomness(dev->dev_addr, dev->addr_len);
+ 	}
+ 
+ 	if (tb[IFLA_MTU]) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0019-random-use-the-arch-specific-rng-in-xfer_secondary_p.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0019-random-use-the-arch-specific-rng-in-xfer_secondary_p.patch
new file mode 100644
index 0000000..a69ffbe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0019-random-use-the-arch-specific-rng-in-xfer_secondary_p.patch
@@ -0,0 +1,91 @@
+From 8692924706ea929d1176354912971149133ab768 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 5 Jul 2012 10:21:01 -0400
+Subject: [PATCH 19/70] random: use the arch-specific rng in
+ xfer_secondary_pool
+
+commit e6d4947b12e8ad947add1032dd754803c6004824 upstream.
+
+If the CPU supports a hardware random number generator, use it in
+xfer_secondary_pool(), where it will significantly improve things and
+where we can afford it.
+
+Also, remove the use of the arch-specific rng in
+add_timer_randomness(), since the call is significantly slower than
+get_cycles(), and we're much better off using it in
+xfer_secondary_pool() anyway.
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c |   25 ++++++++++++++++---------
+ 1 files changed, 16 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 4446a27..4a83220 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -254,6 +254,7 @@
+ #include <linux/cryptohash.h>
+ #include <linux/fips.h>
+ #include <linux/ptrace.h>
++#include <linux/kmemcheck.h>
+ 
+ #ifdef CONFIG_GENERIC_HARDIRQS
+ # include <linux/irq.h>
+@@ -702,11 +703,7 @@ static void add_timer_randomness(struct timer_rand_state *state, unsigned num)
+ 		goto out;
+ 
+ 	sample.jiffies = jiffies;
+-
+-	/* Use arch random value, fall back to cycles */
+-	if (!arch_get_random_int(&sample.cycles))
+-		sample.cycles = get_cycles();
+-
++	sample.cycles = get_cycles();
+ 	sample.num = num;
+ 	mix_pool_bytes(&input_pool, &sample, sizeof(sample), NULL);
+ 
+@@ -838,7 +835,11 @@ static ssize_t extract_entropy(struct entropy_store *r, void *buf,
+  */
+ static void xfer_secondary_pool(struct entropy_store *r, size_t nbytes)
+ {
+-	__u32 tmp[OUTPUT_POOL_WORDS];
++	union {
++		__u32	tmp[OUTPUT_POOL_WORDS];
++		long	hwrand[4];
++	} u;
++	int	i;
+ 
+ 	if (r->pull && r->entropy_count < nbytes * 8 &&
+ 	    r->entropy_count < r->poolinfo->POOLBITS) {
+@@ -849,17 +850,23 @@ static void xfer_secondary_pool(struct entropy_store *r, size_t nbytes)
+ 		/* pull at least as many as BYTES as wakeup BITS */
+ 		bytes = max_t(int, bytes, random_read_wakeup_thresh / 8);
+ 		/* but never more than the buffer size */
+-		bytes = min_t(int, bytes, sizeof(tmp));
++		bytes = min_t(int, bytes, sizeof(u.tmp));
+ 
+ 		DEBUG_ENT("going to reseed %s with %d bits "
+ 			  "(%d of %d requested)\n",
+ 			  r->name, bytes * 8, nbytes * 8, r->entropy_count);
+ 
+-		bytes = extract_entropy(r->pull, tmp, bytes,
++		bytes = extract_entropy(r->pull, u.tmp, bytes,
+ 					random_read_wakeup_thresh / 8, rsvd);
+-		mix_pool_bytes(r, tmp, bytes, NULL);
++		mix_pool_bytes(r, u.tmp, bytes, NULL);
+ 		credit_entropy_bits(r, bytes*8);
+ 	}
++	kmemcheck_mark_initialized(&u.hwrand, sizeof(u.hwrand));
++	for (i = 0; i < 4; i++)
++		if (arch_get_random_long(&u.hwrand[i]))
++			break;
++	if (i)
++		mix_pool_bytes(r, &u.hwrand, sizeof(u.hwrand), 0);
+ }
+ 
+ /*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0020-random-add-new-get_random_bytes_arch-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0020-random-add-new-get_random_bytes_arch-function.patch
new file mode 100644
index 0000000..28ba75e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0020-random-add-new-get_random_bytes_arch-function.patch
@@ -0,0 +1,95 @@
+From 6ce374197d352474ff8514805efb43436c9cf87b Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 5 Jul 2012 10:35:23 -0400
+Subject: [PATCH 20/70] random: add new get_random_bytes_arch() function
+
+commit c2557a303ab6712bb6e09447df828c557c710ac9 upstream.
+
+Create a new function, get_random_bytes_arch() which will use the
+architecture-specific hardware random number generator if it is
+present.  Change get_random_bytes() to not use the HW RNG, even if it
+is avaiable.
+
+The reason for this is that the hw random number generator is fast (if
+it is present), but it requires that we trust the hardware
+manufacturer to have not put in a back door.  (For example, an
+increasing counter encrypted by an AES key known to the NSA.)
+
+It's unlikely that Intel (for example) was paid off by the US
+Government to do this, but it's impossible for them to prove otherwise
+---
+ drivers/char/random.c  |   29 ++++++++++++++++++++++++-----
+ include/linux/random.h |    1 +
+ 2 files changed, 25 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index 4a83220..f3200bf 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -1038,17 +1038,34 @@ static ssize_t extract_entropy_user(struct entropy_store *r, void __user *buf,
+ 
+ /*
+  * This function is the exported kernel interface.  It returns some
+- * number of good random numbers, suitable for seeding TCP sequence
+- * numbers, etc.
++ * number of good random numbers, suitable for key generation, seeding
++ * TCP sequence numbers, etc.  It does not use the hw random number
++ * generator, if available; use get_random_bytes_arch() for that.
+  */
+ void get_random_bytes(void *buf, int nbytes)
+ {
++	extract_entropy(&nonblocking_pool, buf, nbytes, 0, 0);
++}
++EXPORT_SYMBOL(get_random_bytes);
++
++/*
++ * This function will use the architecture-specific hardware random
++ * number generator if it is available.  The arch-specific hw RNG will
++ * almost certainly be faster than what we can do in software, but it
++ * is impossible to verify that it is implemented securely (as
++ * opposed, to, say, the AES encryption of a sequence number using a
++ * key known by the NSA).  So it's useful if we need the speed, but
++ * only if we're willing to trust the hardware manufacturer not to
++ * have put in a back door.
++ */
++void get_random_bytes_arch(void *buf, int nbytes)
++{
+ 	char *p = buf;
+ 
+ 	while (nbytes) {
+ 		unsigned long v;
+ 		int chunk = min(nbytes, (int)sizeof(unsigned long));
+-		
++
+ 		if (!arch_get_random_long(&v))
+ 			break;
+ 		
+@@ -1057,9 +1074,11 @@ void get_random_bytes(void *buf, int nbytes)
+ 		nbytes -= chunk;
+ 	}
+ 
+-	extract_entropy(&nonblocking_pool, p, nbytes, 0, 0);
++	if (nbytes)
++		extract_entropy(&nonblocking_pool, p, nbytes, 0, 0);
+ }
+-EXPORT_SYMBOL(get_random_bytes);
++EXPORT_SYMBOL(get_random_bytes_arch);
++
+ 
+ /*
+  * init_std_data - initialize pool with system data
+diff --git a/include/linux/random.h b/include/linux/random.h
+index e14b438..29e217a 100644
+--- a/include/linux/random.h
++++ b/include/linux/random.h
+@@ -56,6 +56,7 @@ extern void add_input_randomness(unsigned int type, unsigned int code,
+ extern void add_interrupt_randomness(int irq, int irq_flags);
+ 
+ extern void get_random_bytes(void *buf, int nbytes);
++extern void get_random_bytes_arch(void *buf, int nbytes);
+ void generate_random_uuid(unsigned char uuid_out[16]);
+ 
+ #ifndef MODULE
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0021-rtc-wm831x-Feed-the-write-counter-into-device_add_ra.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0021-rtc-wm831x-Feed-the-write-counter-into-device_add_ra.patch
new file mode 100644
index 0000000..567d064
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0021-rtc-wm831x-Feed-the-write-counter-into-device_add_ra.patch
@@ -0,0 +1,75 @@
+From 70392d9bb5b688d5e6ccb6052d1b6a953942aea8 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Thu, 5 Jul 2012 20:19:17 +0000
+Subject: [PATCH 21/70] rtc: wm831x: Feed the write counter into
+ device_add_randomness()
+
+commit 9dccf55f4cb011a7552a8a2749a580662f5ed8ed upstream.
+
+The tamper evident features of the RTC include the "write counter" which
+is a pseudo-random number regenerated whenever we set the RTC. Since this
+value is unpredictable it should provide some useful seeding to the random
+number generator.
+
+Only do this on boot since the goal is to seed the pool rather than add
+useful entropy.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/rtc/rtc-wm831x.c |   24 +++++++++++++++++++++++-
+ 1 files changed, 23 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/rtc/rtc-wm831x.c b/drivers/rtc/rtc-wm831x.c
+index bdc909b..f3c2110 100644
+--- a/drivers/rtc/rtc-wm831x.c
++++ b/drivers/rtc/rtc-wm831x.c
+@@ -24,7 +24,7 @@
+ #include <linux/mfd/wm831x/core.h>
+ #include <linux/delay.h>
+ #include <linux/platform_device.h>
+-
++#include <linux/random.h>
+ 
+ /*
+  * R16416 (0x4020) - RTC Write Counter
+@@ -96,6 +96,26 @@ struct wm831x_rtc {
+ 	unsigned int alarm_enabled:1;
+ };
+ 
++static void wm831x_rtc_add_randomness(struct wm831x *wm831x)
++{
++	int ret;
++	u16 reg;
++
++	/*
++	 * The write counter contains a pseudo-random number which is
++	 * regenerated every time we set the RTC so it should be a
++	 * useful per-system source of entropy.
++	 */
++	ret = wm831x_reg_read(wm831x, WM831X_RTC_WRITE_COUNTER);
++	if (ret >= 0) {
++		reg = ret;
++		add_device_randomness(&reg, sizeof(reg));
++	} else {
++		dev_warn(wm831x->dev, "Failed to read RTC write counter: %d\n",
++			 ret);
++	}
++}
++
+ /*
+  * Read current time and date in RTC
+  */
+@@ -449,6 +469,8 @@ static int wm831x_rtc_probe(struct platform_device *pdev)
+ 			alm_irq, ret);
+ 	}
+ 
++	wm831x_rtc_add_randomness(wm831x);
++
+ 	return 0;
+ 
+ err:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0022-mfd-wm831x-Feed-the-device-UUID-into-device_add_rand.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0022-mfd-wm831x-Feed-the-device-UUID-into-device_add_rand.patch
new file mode 100644
index 0000000..ea38b5a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0022-mfd-wm831x-Feed-the-device-UUID-into-device_add_rand.patch
@@ -0,0 +1,54 @@
+From fb9ac5d5d77aaf09012931a54251629368050ee2 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Thu, 5 Jul 2012 20:23:21 +0000
+Subject: [PATCH 22/70] mfd: wm831x: Feed the device UUID into
+ device_add_randomness()
+
+commit 27130f0cc3ab97560384da437e4621fc4e94f21c upstream.
+
+wm831x devices contain a unique ID value. Feed this into the newly added
+device_add_randomness() to add some per device seed data to the pool.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/mfd/wm831x-otp.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mfd/wm831x-otp.c b/drivers/mfd/wm831x-otp.c
+index f742745..b90f3e0 100644
+--- a/drivers/mfd/wm831x-otp.c
++++ b/drivers/mfd/wm831x-otp.c
+@@ -18,6 +18,7 @@
+ #include <linux/bcd.h>
+ #include <linux/delay.h>
+ #include <linux/mfd/core.h>
++#include <linux/random.h>
+ 
+ #include <linux/mfd/wm831x/core.h>
+ #include <linux/mfd/wm831x/otp.h>
+@@ -66,6 +67,7 @@ static DEVICE_ATTR(unique_id, 0444, wm831x_unique_id_show, NULL);
+ 
+ int wm831x_otp_init(struct wm831x *wm831x)
+ {
++	char uuid[WM831X_UNIQUE_ID_LEN];
+ 	int ret;
+ 
+ 	ret = device_create_file(wm831x->dev, &dev_attr_unique_id);
+@@ -73,6 +75,12 @@ int wm831x_otp_init(struct wm831x *wm831x)
+ 		dev_err(wm831x->dev, "Unique ID attribute not created: %d\n",
+ 			ret);
+ 
++	ret = wm831x_unique_id_read(wm831x, uuid);
++	if (ret == 0)
++		add_device_randomness(uuid, sizeof(uuid));
++	else
++		dev_err(wm831x->dev, "Failed to read UUID: %d\n", ret);
++
+ 	return ret;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0023-ASoC-wm8994-Ensure-there-are-enough-BCLKs-for-four-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0023-ASoC-wm8994-Ensure-there-are-enough-BCLKs-for-four-c.patch
new file mode 100644
index 0000000..0019f5e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0023-ASoC-wm8994-Ensure-there-are-enough-BCLKs-for-four-c.patch
@@ -0,0 +1,33 @@
+From f2173fb9a41cc0f7c114bb81fc0d138bc9649ccd Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Fri, 22 Jun 2012 17:21:17 +0100
+Subject: [PATCH 23/70] ASoC: wm8994: Ensure there are enough BCLKs for four
+ channels
+
+commit b8edf3e5522735c8ce78b81845f7a1a2d4a08626 upstream.
+
+Otherwise if someone tries to use all four channels on AIF1 with the
+device in master mode we won't be able to clock out all the data.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/soc/codecs/wm8994.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
+index de61b8a..98c5774 100644
+--- a/sound/soc/codecs/wm8994.c
++++ b/sound/soc/codecs/wm8994.c
+@@ -2508,7 +2508,7 @@ static int wm8994_hw_params(struct snd_pcm_substream *substream,
+ 		return -EINVAL;
+ 	}
+ 
+-	bclk_rate = params_rate(params) * 2;
++	bclk_rate = params_rate(params) * 4;
+ 	switch (params_format(params)) {
+ 	case SNDRV_PCM_FORMAT_S16_LE:
+ 		bclk_rate *= 16;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0024-futex-Test-for-pi_mutex-on-fault-in-futex_wait_reque.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0024-futex-Test-for-pi_mutex-on-fault-in-futex_wait_reque.patch
new file mode 100644
index 0000000..5422494
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0024-futex-Test-for-pi_mutex-on-fault-in-futex_wait_reque.patch
@@ -0,0 +1,38 @@
+From f36864057b59eec6a77bd9be1d04267fe3648b8f Mon Sep 17 00:00:00 2001
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Fri, 20 Jul 2012 11:53:29 -0700
+Subject: [PATCH 24/70] futex: Test for pi_mutex on fault in
+ futex_wait_requeue_pi()
+
+commit b6070a8d9853eda010a549fa9a09eb8d7269b929 upstream.
+
+If fixup_pi_state_owner() faults, pi_mutex may be NULL. Test
+for pi_mutex != NULL before testing the owner against current
+and possibly unlocking it.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Dan Carpenter <dan.carpenter@oracle.com>
+Link: http://lkml.kernel.org/r/dc59890338fc413606f04e5c5b131530734dae3d.1342809673.git.dvhart@linux.intel.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/futex.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/futex.c b/kernel/futex.c
+index 866c9d5..ed96926 100644
+--- a/kernel/futex.c
++++ b/kernel/futex.c
+@@ -2370,7 +2370,7 @@ static int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
+ 	 * fault, unlock the rt_mutex and return the fault to userspace.
+ 	 */
+ 	if (ret == -EFAULT) {
+-		if (rt_mutex_owner(pi_mutex) == current)
++		if (pi_mutex && rt_mutex_owner(pi_mutex) == current)
+ 			rt_mutex_unlock(pi_mutex);
+ 	} else if (ret == -EINTR) {
+ 		/*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0025-futex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0025-futex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch
new file mode 100644
index 0000000..ac9cdc0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0025-futex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch
@@ -0,0 +1,36 @@
+From 5630485a96fdf29be75437e32eabccf5a2ac9fe7 Mon Sep 17 00:00:00 2001
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Fri, 20 Jul 2012 11:53:30 -0700
+Subject: [PATCH 25/70] futex: Fix bug in WARN_ON for NULL q.pi_state
+
+commit f27071cb7fe3e1d37a9dbe6c0dfc5395cd40fa43 upstream.
+
+The WARN_ON in futex_wait_requeue_pi() for a NULL q.pi_state was testing
+the address (&q.pi_state) of the pointer instead of the value
+(q.pi_state) of the pointer. Correct it accordingly.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+Cc: Dave Jones <davej@redhat.com>
+Link: http://lkml.kernel.org/r/1c85d97f6e5f79ec389a4ead3e367363c74bd09a.1342809673.git.dvhart@linux.intel.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/futex.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/futex.c b/kernel/futex.c
+index ed96926..68e817a 100644
+--- a/kernel/futex.c
++++ b/kernel/futex.c
+@@ -2343,7 +2343,7 @@ static int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
+ 		 * signal.  futex_unlock_pi() will not destroy the lock_ptr nor
+ 		 * the pi_state.
+ 		 */
+-		WARN_ON(!&q.pi_state);
++		WARN_ON(!q.pi_state);
+ 		pi_mutex = &q.pi_state->pi_mutex;
+ 		ret = rt_mutex_finish_proxy_lock(pi_mutex, to, &rt_waiter, 1);
+ 		debug_rt_mutex_free_waiter(&rt_waiter);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0026-futex-Forbid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0026-futex-Forbid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch
new file mode 100644
index 0000000..9f0ff30
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0026-futex-Forbid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch
@@ -0,0 +1,59 @@
+From 6b32682a969a782f8a03b42f0cec593a923412fb Mon Sep 17 00:00:00 2001
+From: Darren Hart <dvhart@linux.intel.com>
+Date: Fri, 20 Jul 2012 11:53:31 -0700
+Subject: [PATCH 26/70] futex: Forbid uaddr == uaddr2 in
+ futex_wait_requeue_pi()
+
+commit 6f7b0a2a5c0fb03be7c25bd1745baa50582348ef upstream.
+
+If uaddr == uaddr2, then we have broken the rule of only requeueing
+from a non-pi futex to a pi futex with this call. If we attempt this,
+as the trinity test suite manages to do, we miss early wakeups as
+q.key is equal to key2 (because they are the same uaddr). We will then
+attempt to dereference the pi_mutex (which would exist had the futex_q
+been properly requeued to a pi futex) and trigger a NULL pointer
+dereference.
+
+Signed-off-by: Darren Hart <dvhart@linux.intel.com>
+Cc: Dave Jones <davej@redhat.com>
+Link: http://lkml.kernel.org/r/ad82bfe7f7d130247fbe2b5b4275654807774227.1342809673.git.dvhart@linux.intel.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/futex.c |   13 ++++++++-----
+ 1 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/kernel/futex.c b/kernel/futex.c
+index 68e817a..80fb1c6 100644
+--- a/kernel/futex.c
++++ b/kernel/futex.c
+@@ -2231,11 +2231,11 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_bucket *hb,
+  * @uaddr2:	the pi futex we will take prior to returning to user-space
+  *
+  * The caller will wait on uaddr and will be requeued by futex_requeue() to
+- * uaddr2 which must be PI aware.  Normal wakeup will wake on uaddr2 and
+- * complete the acquisition of the rt_mutex prior to returning to userspace.
+- * This ensures the rt_mutex maintains an owner when it has waiters; without
+- * one, the pi logic wouldn't know which task to boost/deboost, if there was a
+- * need to.
++ * uaddr2 which must be PI aware and unique from uaddr.  Normal wakeup will wake
++ * on uaddr2 and complete the acquisition of the rt_mutex prior to returning to
++ * userspace.  This ensures the rt_mutex maintains an owner when it has waiters;
++ * without one, the pi logic would not know which task to boost/deboost, if
++ * there was a need to.
+  *
+  * We call schedule in futex_wait_queue_me() when we enqueue and return there
+  * via the following:
+@@ -2272,6 +2272,9 @@ static int futex_wait_requeue_pi(u32 __user *uaddr, unsigned int flags,
+ 	struct futex_q q = futex_q_init;
+ 	int res, ret;
+ 
++	if (uaddr == uaddr2)
++		return -EINVAL;
++
+ 	if (!bitset)
+ 		return -EINVAL;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0027-video-smscufx-fix-line-counting-in-fb_write.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0027-video-smscufx-fix-line-counting-in-fb_write.patch
new file mode 100644
index 0000000..030c40e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0027-video-smscufx-fix-line-counting-in-fb_write.patch
@@ -0,0 +1,36 @@
+From 3c9cd66c826a8517a56d6d6b102018f73a0a6371 Mon Sep 17 00:00:00 2001
+From: Alexander Holler <holler@ahsoftware.de>
+Date: Sat, 21 Apr 2012 00:11:07 +0200
+Subject: [PATCH 27/70] video/smscufx: fix line counting in fb_write
+
+commit 2fe2d9f47cfe1a3e66e7d087368b3d7155b04c15 upstream.
+
+Line 0 and 1 were both written to line 0 (on the display) and all subsequent
+lines had an offset of -1. The result was that the last line on the display
+was never overwritten by writes to /dev/fbN.
+
+The origin of this bug seems to have been udlfb.
+
+Signed-off-by: Alexander Holler <holler@ahsoftware.de>
+Signed-off-by: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/video/smscufx.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/video/smscufx.c b/drivers/video/smscufx.c
+index aaccffa..dd9533a 100644
+--- a/drivers/video/smscufx.c
++++ b/drivers/video/smscufx.c
+@@ -904,7 +904,7 @@ static ssize_t ufx_ops_write(struct fb_info *info, const char __user *buf,
+ 	result = fb_sys_write(info, buf, count, ppos);
+ 
+ 	if (result > 0) {
+-		int start = max((int)(offset / info->fix.line_length) - 1, 0);
++		int start = max((int)(offset / info->fix.line_length), 0);
+ 		int lines = min((u32)((result / info->fix.line_length) + 1),
+ 				(u32)info->var.yres);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0028-Input-synaptics-handle-out-of-bounds-values-from-the.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0028-Input-synaptics-handle-out-of-bounds-values-from-the.patch
new file mode 100644
index 0000000..f77c2c2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0028-Input-synaptics-handle-out-of-bounds-values-from-the.patch
@@ -0,0 +1,89 @@
+From 9bd55f644225e671f6c74cc89d9cf68b434385d1 Mon Sep 17 00:00:00 2001
+From: Seth Forshee <seth.forshee@canonical.com>
+Date: Tue, 24 Jul 2012 23:54:11 -0700
+Subject: [PATCH 28/70] Input: synaptics - handle out of bounds values from
+ the hardware
+
+commit c0394506e69b37c47d391c2a7bbea3ea236d8ec8 upstream.
+
+The touchpad on the Acer Aspire One D250 will report out of range values
+in the extreme lower portion of the touchpad. These appear as abrupt
+changes in the values reported by the hardware from very low values to
+very high values, which can cause unexpected vertical jumps in the
+position of the mouse pointer.
+
+What seems to be happening is that the value is wrapping to a two's
+compliment negative value of higher resolution than the 13-bit value
+reported by the hardware, with the high-order bits being truncated. This
+patch adds handling for these values by converting them to the
+appropriate negative values.
+
+The only tricky part about this is deciding when to treat a number as
+negative. It stands to reason that if out of range values can be
+reported on the low end then it could also happen on the high end, so
+not all out of range values should be treated as negative. The approach
+taken here is to split the difference between the maximum legitimate
+value for the axis and the maximum possible value that the hardware can
+report, treating values greater than this number as negative and all
+other values as positive. This can be tweaked later if hardware is found
+that operates outside of these parameters.
+
+BugLink: http://bugs.launchpad.net/bugs/1001251
+Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
+Reviewed-by: Daniel Kurtz <djkurtz@chromium.org>
+Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/input/mouse/synaptics.c |   23 +++++++++++++++++++++++
+ 1 files changed, 23 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/input/mouse/synaptics.c b/drivers/input/mouse/synaptics.c
+index a6dcd18..96532bc 100644
+--- a/drivers/input/mouse/synaptics.c
++++ b/drivers/input/mouse/synaptics.c
+@@ -40,11 +40,28 @@
+  * Note that newer firmware allows querying device for maximum useable
+  * coordinates.
+  */
++#define XMIN 0
++#define XMAX 6143
++#define YMIN 0
++#define YMAX 6143
+ #define XMIN_NOMINAL 1472
+ #define XMAX_NOMINAL 5472
+ #define YMIN_NOMINAL 1408
+ #define YMAX_NOMINAL 4448
+ 
++/* Size in bits of absolute position values reported by the hardware */
++#define ABS_POS_BITS 13
++
++/*
++ * Any position values from the hardware above the following limits are
++ * treated as "wrapped around negative" values that have been truncated to
++ * the 13-bit reporting range of the hardware. These are just reasonable
++ * guesses and can be adjusted if hardware is found that operates outside
++ * of these parameters.
++ */
++#define X_MAX_POSITIVE (((1 << ABS_POS_BITS) + XMAX) / 2)
++#define Y_MAX_POSITIVE (((1 << ABS_POS_BITS) + YMAX) / 2)
++
+ /*
+  * Synaptics touchpads report the y coordinate from bottom to top, which is
+  * opposite from what userspace expects.
+@@ -544,6 +561,12 @@ static int synaptics_parse_hw_state(const unsigned char buf[],
+ 		hw->right = (buf[0] & 0x02) ? 1 : 0;
+ 	}
+ 
++	/* Convert wrap-around values to negative */
++	if (hw->x > X_MAX_POSITIVE)
++		hw->x -= 1 << ABS_POS_BITS;
++	if (hw->y > Y_MAX_POSITIVE)
++		hw->y -= 1 << ABS_POS_BITS;
++
+ 	return 0;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0029-ALSA-hda-Fix-invalid-D3-of-headphone-DAC-on-VT202x-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0029-ALSA-hda-Fix-invalid-D3-of-headphone-DAC-on-VT202x-c.patch
new file mode 100644
index 0000000..963bda5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0029-ALSA-hda-Fix-invalid-D3-of-headphone-DAC-on-VT202x-c.patch
@@ -0,0 +1,60 @@
+From 82ed7ed6d4c89cbcaa138eb1fd0075357e8c06d3 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Wed, 25 Jul 2012 13:54:55 +0200
+Subject: [PATCH 29/70] ALSA: hda - Fix invalid D3 of headphone DAC on VT202x
+ codecs
+
+commit 6162552b0de6ba80937c3dd53e084967851cd199 upstream.
+
+We've got a bug report about the silent output from the headphone on a
+mobo with VT2021, and spotted out that this was because of the wrong
+D3 state on the DAC for the headphone output.  The bug is triggered by
+the incomplete check for this DAC in set_widgets_power_state_vt1718S().
+It checks only the connectivity of the primary output (0x27) but
+doesn't consider the path from the headphone pin (0x28).
+
+Now this patch fixes the problem by checking both pins for DAC 0x0b.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+[bwh: Backported to 3.2: keep using snd_hda_codec_write() as
+ update_power_state() is missing]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_via.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
+index 1fe1308..7160ff2 100644
+--- a/sound/pci/hda/patch_via.c
++++ b/sound/pci/hda/patch_via.c
+@@ -3227,7 +3227,7 @@ static void set_widgets_power_state_vt1718S(struct hda_codec *codec)
+ {
+ 	struct via_spec *spec = codec->spec;
+ 	int imux_is_smixer;
+-	unsigned int parm;
++	unsigned int parm, parm2;
+ 	/* MUX6 (1eh) = stereo mixer */
+ 	imux_is_smixer =
+ 	snd_hda_codec_read(codec, 0x1e, 0, AC_VERB_GET_CONNECT_SEL, 0x00) == 5;
+@@ -3250,7 +3250,7 @@ static void set_widgets_power_state_vt1718S(struct hda_codec *codec)
+ 	parm = AC_PWRST_D3;
+ 	set_pin_power_state(codec, 0x27, &parm);
+ 	snd_hda_codec_write(codec, 0x1a, 0, AC_VERB_SET_POWER_STATE, parm);
+-	snd_hda_codec_write(codec, 0xb, 0, AC_VERB_SET_POWER_STATE, parm);
++	parm2 = parm; /* for pin 0x0b */
+ 
+ 	/* PW2 (26h), AOW2 (ah) */
+ 	parm = AC_PWRST_D3;
+@@ -3265,6 +3265,9 @@ static void set_widgets_power_state_vt1718S(struct hda_codec *codec)
+ 	if (!spec->hp_independent_mode) /* check for redirected HP */
+ 		set_pin_power_state(codec, 0x28, &parm);
+ 	snd_hda_codec_write(codec, 0x8, 0, AC_VERB_SET_POWER_STATE, parm);
++	if (!spec->hp_independent_mode && parm2 != AC_PWRST_D3)
++		parm = parm2;
++	snd_hda_codec_write(codec, 0xb, 0, AC_VERB_SET_POWER_STATE, parm);
+ 	/* MW9 (21h), Mw2 (1ah), AOW0 (8h) */
+ 	snd_hda_codec_write(codec, 0x21, 0, AC_VERB_SET_POWER_STATE,
+ 			    imux_is_smixer ? AC_PWRST_D0 : parm);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0030-ALSA-mpu401-Fix-missing-initialization-of-irq-field.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0030-ALSA-mpu401-Fix-missing-initialization-of-irq-field.patch
new file mode 100644
index 0000000..5885b45
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0030-ALSA-mpu401-Fix-missing-initialization-of-irq-field.patch
@@ -0,0 +1,34 @@
+From 1b12abe45ddcd7a4f3d927195dd69b8e6e9acb4e Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 23 Jul 2012 11:35:55 +0200
+Subject: [PATCH 30/70] ALSA: mpu401: Fix missing initialization of irq field
+
+commit bc733d495267a23ef8660220d696c6e549ce30b3 upstream.
+
+The irq field of struct snd_mpu401 is supposed to be initialized to -1.
+Since it's set to zero as of now, a probing error before the irq
+installation results in a kernel warning "Trying to free already-free
+IRQ 0".
+
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=44821
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/drivers/mpu401/mpu401_uart.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/sound/drivers/mpu401/mpu401_uart.c b/sound/drivers/mpu401/mpu401_uart.c
+index 1cff331..4608c2c 100644
+--- a/sound/drivers/mpu401/mpu401_uart.c
++++ b/sound/drivers/mpu401/mpu401_uart.c
+@@ -554,6 +554,7 @@ int snd_mpu401_uart_new(struct snd_card *card, int device,
+ 	spin_lock_init(&mpu->output_lock);
+ 	spin_lock_init(&mpu->timer_lock);
+ 	mpu->hardware = hardware;
++	mpu->irq = -1;
+ 	if (! (info_flags & MPU401_INFO_INTEGRATED)) {
+ 		int res_size = hardware == MPU401_HW_PC98II ? 4 : 2;
+ 		mpu->res = request_region(port, res_size, "MPU401 UART");
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0031-x86-nops-Missing-break-resulting-in-incorrect-select.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0031-x86-nops-Missing-break-resulting-in-incorrect-select.patch
new file mode 100644
index 0000000..b99ccb2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0031-x86-nops-Missing-break-resulting-in-incorrect-select.patch
@@ -0,0 +1,36 @@
+From 884a5eb458ec88aad066be1cd4486dba34488aad Mon Sep 17 00:00:00 2001
+From: Alan Cox <alan@linux.intel.com>
+Date: Wed, 25 Jul 2012 16:28:19 +0100
+Subject: [PATCH 31/70] x86, nops: Missing break resulting in incorrect
+ selection on Intel
+
+commit d6250a3f12edb3a86db9598ffeca3de8b4a219e9 upstream.
+
+The Intel case falls through into the generic case which then changes
+the values.  For cases like the P6 it doesn't do the right thing so
+this seems to be a screwup.
+
+Signed-off-by: Alan Cox <alan@linux.intel.com>
+Link: http://lkml.kernel.org/n/tip-lww2uirad4skzjlmrm0vru8o@git.kernel.org
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/alternative.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
+index 1f84794..73ef56c 100644
+--- a/arch/x86/kernel/alternative.c
++++ b/arch/x86/kernel/alternative.c
+@@ -219,7 +219,7 @@ void __init arch_init_ideal_nops(void)
+ 			ideal_nops = intel_nops;
+ #endif
+ 		}
+-
++		break;
+ 	default:
+ #ifdef CONFIG_X86_64
+ 		ideal_nops = k8_nops;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0032-s390-mm-downgrade-page-table-after-fork-of-a-31-bit-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0032-s390-mm-downgrade-page-table-after-fork-of-a-31-bit-.patch
new file mode 100644
index 0000000..d285d97
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0032-s390-mm-downgrade-page-table-after-fork-of-a-31-bit-.patch
@@ -0,0 +1,140 @@
+From 7cd099a4bf8f6367aff3ef6f7b0409712925f42e Mon Sep 17 00:00:00 2001
+From: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Date: Thu, 26 Jul 2012 08:53:06 +0200
+Subject: [PATCH 32/70] s390/mm: downgrade page table after fork of a 31 bit
+ process
+
+commit 0f6f281b731d20bfe75c13f85d33f3f05b440222 upstream.
+
+The downgrade of the 4 level page table created by init_new_context is
+currently done only in start_thread31. If a 31 bit process forks the
+new mm uses a 4 level page table, including the task size of 2<<42
+that goes along with it. This is incorrect as now a 31 bit process
+can map memory beyond 2GB. Define arch_dup_mmap to do the downgrade
+after fork.
+
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/s390/include/asm/mmu_context.h |   14 +++++++++++++-
+ arch/s390/include/asm/processor.h   |    2 ++
+ arch/s390/mm/mmap.c                 |   12 ++++++++++--
+ arch/s390/mm/pgtable.c              |    5 -----
+ 4 files changed, 25 insertions(+), 8 deletions(-)
+
+diff --git a/arch/s390/include/asm/mmu_context.h b/arch/s390/include/asm/mmu_context.h
+index 5682f16..20f0e01 100644
+--- a/arch/s390/include/asm/mmu_context.h
++++ b/arch/s390/include/asm/mmu_context.h
+@@ -12,7 +12,6 @@
+ #include <asm/pgalloc.h>
+ #include <asm/uaccess.h>
+ #include <asm/tlbflush.h>
+-#include <asm-generic/mm_hooks.h>
+ 
+ static inline int init_new_context(struct task_struct *tsk,
+ 				   struct mm_struct *mm)
+@@ -92,4 +91,17 @@ static inline void activate_mm(struct mm_struct *prev,
+         switch_mm(prev, next, current);
+ }
+ 
++static inline void arch_dup_mmap(struct mm_struct *oldmm,
++				 struct mm_struct *mm)
++{
++#ifdef CONFIG_64BIT
++	if (oldmm->context.asce_limit < mm->context.asce_limit)
++		crst_table_downgrade(mm, oldmm->context.asce_limit);
++#endif
++}
++
++static inline void arch_exit_mmap(struct mm_struct *mm)
++{
++}
++
+ #endif /* __S390_MMU_CONTEXT_H */
+diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
+index 5f33d37..172550d 100644
+--- a/arch/s390/include/asm/processor.h
++++ b/arch/s390/include/asm/processor.h
+@@ -130,7 +130,9 @@ struct stack_frame {
+ 	regs->psw.mask	= psw_user_bits | PSW_MASK_BA;			\
+ 	regs->psw.addr	= new_psw | PSW_ADDR_AMODE;			\
+ 	regs->gprs[15]	= new_stackp;					\
++	__tlb_flush_mm(current->mm);					\
+ 	crst_table_downgrade(current->mm, 1UL << 31);			\
++	update_mm(current->mm, current);				\
+ } while (0)
+ 
+ /* Forward declaration, a strange C thing */
+diff --git a/arch/s390/mm/mmap.c b/arch/s390/mm/mmap.c
+index a0155c0..c70b3d8 100644
+--- a/arch/s390/mm/mmap.c
++++ b/arch/s390/mm/mmap.c
+@@ -106,9 +106,15 @@ EXPORT_SYMBOL_GPL(arch_pick_mmap_layout);
+ 
+ int s390_mmap_check(unsigned long addr, unsigned long len)
+ {
++	int rc;
++
+ 	if (!is_compat_task() &&
+-	    len >= TASK_SIZE && TASK_SIZE < (1UL << 53))
+-		return crst_table_upgrade(current->mm, 1UL << 53);
++	    len >= TASK_SIZE && TASK_SIZE < (1UL << 53)) {
++		rc = crst_table_upgrade(current->mm, 1UL << 53);
++		if (rc)
++			return rc;
++		update_mm(current->mm, current);
++	}
+ 	return 0;
+ }
+ 
+@@ -128,6 +134,7 @@ s390_get_unmapped_area(struct file *filp, unsigned long addr,
+ 		rc = crst_table_upgrade(mm, 1UL << 53);
+ 		if (rc)
+ 			return (unsigned long) rc;
++		update_mm(mm, current);
+ 		area = arch_get_unmapped_area(filp, addr, len, pgoff, flags);
+ 	}
+ 	return area;
+@@ -150,6 +157,7 @@ s390_get_unmapped_area_topdown(struct file *filp, const unsigned long addr,
+ 		rc = crst_table_upgrade(mm, 1UL << 53);
+ 		if (rc)
+ 			return (unsigned long) rc;
++		update_mm(mm, current);
+ 		area = arch_get_unmapped_area_topdown(filp, addr, len,
+ 						      pgoff, flags);
+ 	}
+diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
+index f8ceac4..f8e92f8 100644
+--- a/arch/s390/mm/pgtable.c
++++ b/arch/s390/mm/pgtable.c
+@@ -97,7 +97,6 @@ repeat:
+ 		crst_table_free(mm, table);
+ 	if (mm->context.asce_limit < limit)
+ 		goto repeat;
+-	update_mm(mm, current);
+ 	return 0;
+ }
+ 
+@@ -105,9 +104,6 @@ void crst_table_downgrade(struct mm_struct *mm, unsigned long limit)
+ {
+ 	pgd_t *pgd;
+ 
+-	if (mm->context.asce_limit <= limit)
+-		return;
+-	__tlb_flush_mm(mm);
+ 	while (mm->context.asce_limit > limit) {
+ 		pgd = mm->pgd;
+ 		switch (pgd_val(*pgd) & _REGION_ENTRY_TYPE_MASK) {
+@@ -130,7 +126,6 @@ void crst_table_downgrade(struct mm_struct *mm, unsigned long limit)
+ 		mm->task_size = mm->context.asce_limit;
+ 		crst_table_free(mm, (unsigned long *) pgd);
+ 	}
+-	update_mm(mm, current);
+ }
+ #endif
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0033-Redefine-ATOMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0033-Redefine-ATOMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch
new file mode 100644
index 0000000..2a98f77
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0033-Redefine-ATOMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch
@@ -0,0 +1,73 @@
+From f96e9f9d90fd6778b97a1a32c6769abcb302fbb0 Mon Sep 17 00:00:00 2001
+From: Tony Luck <tony.luck@intel.com>
+Date: Thu, 26 Jul 2012 10:55:26 -0700
+Subject: [PATCH 33/70] Redefine ATOMIC_INIT and ATOMIC64_INIT to drop the
+ casts
+
+commit a119365586b0130dfea06457f584953e0ff6481d upstream.
+
+The following build error occured during a ia64 build with
+swap-over-NFS patches applied.
+
+net/core/sock.c:274:36: error: initializer element is not constant
+net/core/sock.c:274:36: error: (near initialization for 'memalloc_socks')
+net/core/sock.c:274:36: error: initializer element is not constant
+
+This is identical to a parisc build error. Fengguang Wu, Mel Gorman
+and James Bottomley did all the legwork to track the root cause of
+the problem. This fix and entire commit log is shamelessly copied
+from them with one extra detail to change a dubious runtime use of
+ATOMIC_INIT() to atomic_set() in drivers/char/mspec.c
+
+Dave Anglin says:
+> Here is the line in sock.i:
+>
+> struct static_key memalloc_socks = ((struct static_key) { .enabled =
+> ((atomic_t) { (0) }) });
+
+The above line contains two compound literals.  It also uses a designated
+initializer to initialize the field enabled.  A compound literal is not a
+constant expression.
+
+The location of the above statement isn't fully clear, but if a compound
+literal occurs outside the body of a function, the initializer list must
+consist of constant expressions.
+
+Signed-off-by: Tony Luck <tony.luck@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/ia64/include/asm/atomic.h |    4 ++--
+ drivers/char/mspec.c           |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/arch/ia64/include/asm/atomic.h b/arch/ia64/include/asm/atomic.h
+index 3fad89e..2fc214b 100644
+--- a/arch/ia64/include/asm/atomic.h
++++ b/arch/ia64/include/asm/atomic.h
+@@ -18,8 +18,8 @@
+ #include <asm/system.h>
+ 
+ 
+-#define ATOMIC_INIT(i)		((atomic_t) { (i) })
+-#define ATOMIC64_INIT(i)	((atomic64_t) { (i) })
++#define ATOMIC_INIT(i)		{ (i) }
++#define ATOMIC64_INIT(i)	{ (i) }
+ 
+ #define atomic_read(v)		(*(volatile int *)&(v)->counter)
+ #define atomic64_read(v)	(*(volatile long *)&(v)->counter)
+diff --git a/drivers/char/mspec.c b/drivers/char/mspec.c
+index 5c0d96a..b12ffea 100644
+--- a/drivers/char/mspec.c
++++ b/drivers/char/mspec.c
+@@ -284,7 +284,7 @@ mspec_mmap(struct file *file, struct vm_area_struct *vma,
+ 	vdata->flags = flags;
+ 	vdata->type = type;
+ 	spin_lock_init(&vdata->lock);
+-	vdata->refcnt = ATOMIC_INIT(1);
++	atomic_set(&vdata->refcnt, 1);
+ 	vma->vm_private_data = vdata;
+ 
+ 	vma->vm_flags |= (VM_IO | VM_RESERVED | VM_PFNMAP | VM_DONTEXPAND);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0034-dm-thin-reduce-endio_hook-pool-size.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0034-dm-thin-reduce-endio_hook-pool-size.patch
new file mode 100644
index 0000000..c3c5f8b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0034-dm-thin-reduce-endio_hook-pool-size.patch
@@ -0,0 +1,37 @@
+From 1385bcac3fbce09731cb85a16a86952796a5dcbf Mon Sep 17 00:00:00 2001
+From: Alasdair G Kergon <agk@redhat.com>
+Date: Fri, 27 Jul 2012 15:07:57 +0100
+Subject: [PATCH 34/70] dm thin: reduce endio_hook pool size
+
+commit 7768ed33ccdc02801c4483fc5682dc66ace14aea upstream.
+
+Reduce the slab size used for the dm_thin_endio_hook mempool.
+
+Allocation has been seen to fail on machines with smaller amounts
+of memory due to fragmentation.
+
+  lvm: page allocation failure. order:5, mode:0xd0
+  device-mapper: table: 253:38: thin-pool: Error creating pool's endio_hook mempool
+
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/dm-thin.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
+index 532a902..f68290d 100644
+--- a/drivers/md/dm-thin.c
++++ b/drivers/md/dm-thin.c
+@@ -19,7 +19,7 @@
+ /*
+  * Tunable constants
+  */
+-#define ENDIO_HOOK_POOL_SIZE 10240
++#define ENDIO_HOOK_POOL_SIZE 1024
+ #define DEFERRED_SET_SIZE 64
+ #define MAPPING_POOL_SIZE 1024
+ #define PRISON_CELLS 1024
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0035-dm-thin-fix-memory-leak-in-process_prepared_mapping-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0035-dm-thin-fix-memory-leak-in-process_prepared_mapping-.patch
new file mode 100644
index 0000000..1a4dfb9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0035-dm-thin-fix-memory-leak-in-process_prepared_mapping-.patch
@@ -0,0 +1,53 @@
+From 0b46cbe86286a3688c4469a702b907d4f45f6b17 Mon Sep 17 00:00:00 2001
+From: Joe Thornber <ejt@redhat.com>
+Date: Fri, 27 Jul 2012 15:08:05 +0100
+Subject: [PATCH 35/70] dm thin: fix memory leak in process_prepared_mapping
+ error paths
+
+commit 905386f82d08f66726912f303f3e6605248c60a3 upstream.
+
+Fix memory leak in process_prepared_mapping by always freeing
+the dm_thin_new_mapping structs from the mapping_pool mempool on
+the error paths.
+
+Signed-off-by: Joe Thornber <ejt@redhat.com>
+Signed-off-by: Mike Snitzer <snitzer@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/dm-thin.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
+index f68290d..d432032 100644
+--- a/drivers/md/dm-thin.c
++++ b/drivers/md/dm-thin.c
+@@ -857,7 +857,7 @@ static void process_prepared_mapping(struct new_mapping *m)
+ 
+ 	if (m->err) {
+ 		cell_error(m->cell);
+-		return;
++		goto out;
+ 	}
+ 
+ 	/*
+@@ -869,7 +869,7 @@ static void process_prepared_mapping(struct new_mapping *m)
+ 	if (r) {
+ 		DMERR("dm_thin_insert_block() failed");
+ 		cell_error(m->cell);
+-		return;
++		goto out;
+ 	}
+ 
+ 	/*
+@@ -884,6 +884,7 @@ static void process_prepared_mapping(struct new_mapping *m)
+ 	} else
+ 		cell_defer(tc, m->cell, m->data_block);
+ 
++out:
+ 	list_del(&m->list);
+ 	mempool_free(m, tc->pool->mapping_pool);
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0036-random-mix-in-architectural-randomness-in-extract_bu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0036-random-mix-in-architectural-randomness-in-extract_bu.patch
new file mode 100644
index 0000000..26586e6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0036-random-mix-in-architectural-randomness-in-extract_bu.patch
@@ -0,0 +1,151 @@
+From fe897421d28b4fce43ee643aa1e1bacecd6aacf2 Mon Sep 17 00:00:00 2001
+From: "H. Peter Anvin" <hpa@linux.intel.com>
+Date: Fri, 27 Jul 2012 22:26:08 -0400
+Subject: [PATCH 36/70] random: mix in architectural randomness in
+ extract_buf()
+
+commit d2e7c96af1e54b507ae2a6a7dd2baf588417a7e5 upstream.
+
+Mix in any architectural randomness in extract_buf() instead of
+xfer_secondary_buf().  This allows us to mix in more architectural
+randomness, and it also makes xfer_secondary_buf() faster, moving a
+tiny bit of additional CPU overhead to process which is extracting the
+randomness.
+
+[ Commit description modified by tytso to remove an extended
+  advertisement for the RDRAND instruction. ]
+
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+Acked-by: Ingo Molnar <mingo@kernel.org>
+Cc: DJ Johnston <dj.johnston@intel.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/char/random.c |   56 ++++++++++++++++++++++++++++---------------------
+ 1 files changed, 32 insertions(+), 24 deletions(-)
+
+diff --git a/drivers/char/random.c b/drivers/char/random.c
+index f3200bf..631d4f6 100644
+--- a/drivers/char/random.c
++++ b/drivers/char/random.c
+@@ -274,6 +274,8 @@
+ #define SEC_XFER_SIZE 512
+ #define EXTRACT_SIZE 10
+ 
++#define LONGS(x) (((x) + sizeof(unsigned long) - 1)/sizeof(unsigned long))
++
+ /*
+  * The minimum number of bits of entropy before we wake up a read on
+  * /dev/random.  Should be enough to do a significant reseed.
+@@ -835,11 +837,7 @@ static ssize_t extract_entropy(struct entropy_store *r, void *buf,
+  */
+ static void xfer_secondary_pool(struct entropy_store *r, size_t nbytes)
+ {
+-	union {
+-		__u32	tmp[OUTPUT_POOL_WORDS];
+-		long	hwrand[4];
+-	} u;
+-	int	i;
++	__u32	tmp[OUTPUT_POOL_WORDS];
+ 
+ 	if (r->pull && r->entropy_count < nbytes * 8 &&
+ 	    r->entropy_count < r->poolinfo->POOLBITS) {
+@@ -850,23 +848,17 @@ static void xfer_secondary_pool(struct entropy_store *r, size_t nbytes)
+ 		/* pull at least as many as BYTES as wakeup BITS */
+ 		bytes = max_t(int, bytes, random_read_wakeup_thresh / 8);
+ 		/* but never more than the buffer size */
+-		bytes = min_t(int, bytes, sizeof(u.tmp));
++		bytes = min_t(int, bytes, sizeof(tmp));
+ 
+ 		DEBUG_ENT("going to reseed %s with %d bits "
+ 			  "(%d of %d requested)\n",
+ 			  r->name, bytes * 8, nbytes * 8, r->entropy_count);
+ 
+-		bytes = extract_entropy(r->pull, u.tmp, bytes,
++		bytes = extract_entropy(r->pull, tmp, bytes,
+ 					random_read_wakeup_thresh / 8, rsvd);
+-		mix_pool_bytes(r, u.tmp, bytes, NULL);
++		mix_pool_bytes(r, tmp, bytes, NULL);
+ 		credit_entropy_bits(r, bytes*8);
+ 	}
+-	kmemcheck_mark_initialized(&u.hwrand, sizeof(u.hwrand));
+-	for (i = 0; i < 4; i++)
+-		if (arch_get_random_long(&u.hwrand[i]))
+-			break;
+-	if (i)
+-		mix_pool_bytes(r, &u.hwrand, sizeof(u.hwrand), 0);
+ }
+ 
+ /*
+@@ -923,15 +915,19 @@ static size_t account(struct entropy_store *r, size_t nbytes, int min,
+ static void extract_buf(struct entropy_store *r, __u8 *out)
+ {
+ 	int i;
+-	__u32 hash[5], workspace[SHA_WORKSPACE_WORDS];
++	union {
++		__u32 w[5];
++		unsigned long l[LONGS(EXTRACT_SIZE)];
++	} hash;
++	__u32 workspace[SHA_WORKSPACE_WORDS];
+ 	__u8 extract[64];
+ 	unsigned long flags;
+ 
+ 	/* Generate a hash across the pool, 16 words (512 bits) at a time */
+-	sha_init(hash);
++	sha_init(hash.w);
+ 	spin_lock_irqsave(&r->lock, flags);
+ 	for (i = 0; i < r->poolinfo->poolwords; i += 16)
+-		sha_transform(hash, (__u8 *)(r->pool + i), workspace);
++		sha_transform(hash.w, (__u8 *)(r->pool + i), workspace);
+ 
+ 	/*
+ 	 * We mix the hash back into the pool to prevent backtracking
+@@ -942,14 +938,14 @@ static void extract_buf(struct entropy_store *r, __u8 *out)
+ 	 * brute-forcing the feedback as hard as brute-forcing the
+ 	 * hash.
+ 	 */
+-	__mix_pool_bytes(r, hash, sizeof(hash), extract);
++	__mix_pool_bytes(r, hash.w, sizeof(hash.w), extract);
+ 	spin_unlock_irqrestore(&r->lock, flags);
+ 
+ 	/*
+ 	 * To avoid duplicates, we atomically extract a portion of the
+ 	 * pool while mixing, and hash one final time.
+ 	 */
+-	sha_transform(hash, extract, workspace);
++	sha_transform(hash.w, extract, workspace);
+ 	memset(extract, 0, sizeof(extract));
+ 	memset(workspace, 0, sizeof(workspace));
+ 
+@@ -958,11 +954,23 @@ static void extract_buf(struct entropy_store *r, __u8 *out)
+ 	 * pattern, we fold it in half. Thus, we always feed back
+ 	 * twice as much data as we output.
+ 	 */
+-	hash[0] ^= hash[3];
+-	hash[1] ^= hash[4];
+-	hash[2] ^= rol32(hash[2], 16);
+-	memcpy(out, hash, EXTRACT_SIZE);
+-	memset(hash, 0, sizeof(hash));
++	hash.w[0] ^= hash.w[3];
++	hash.w[1] ^= hash.w[4];
++	hash.w[2] ^= rol32(hash.w[2], 16);
++
++	/*
++	 * If we have a architectural hardware random number
++	 * generator, mix that in, too.
++	 */
++	for (i = 0; i < LONGS(EXTRACT_SIZE); i++) {
++		unsigned long v;
++		if (!arch_get_random_long(&v))
++			break;
++		hash.l[i] ^= v;
++	}
++
++	memcpy(out, &hash, EXTRACT_SIZE);
++	memset(&hash, 0, sizeof(hash));
+ }
+ 
+ static ssize_t extract_entropy(struct entropy_store *r, void *buf,
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0037-asus-wmi-use-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0037-asus-wmi-use-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch
new file mode 100644
index 0000000..983ede2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0037-asus-wmi-use-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch
@@ -0,0 +1,44 @@
+From b84b4b80d632292198b2281d2c76044b5bebadd3 Mon Sep 17 00:00:00 2001
+From: Alex Hung <alex.hung@canonical.com>
+Date: Wed, 20 Jun 2012 11:47:35 +0800
+Subject: [PATCH 37/70] asus-wmi: use ASUS_WMI_METHODID_DSTS2 as default DSTS
+ ID.
+
+commit 63a78bb1051b240417daad3a3fa9c1bb10646dca upstream.
+
+According to responses from the BIOS team, ASUS_WMI_METHODID_DSTS2
+(0x53545344) will be used as future DSTS ID. In addition, calling
+asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2, 0, 0, NULL) returns
+ASUS_WMI_UNSUPPORTED_METHOD in new ASUS laptop PCs. This patch fixes
+no DSTS ID will be assigned in this case.
+
+Signed-off-by: Alex Hung <alex.hung@canonical.com>
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/platform/x86/asus-wmi.c |    7 +------
+ 1 files changed, 1 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
+index d1049ee..26fba2d 100644
+--- a/drivers/platform/x86/asus-wmi.c
++++ b/drivers/platform/x86/asus-wmi.c
+@@ -1431,14 +1431,9 @@ static int asus_wmi_platform_init(struct asus_wmi *asus)
+ 	 */
+ 	if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, 0, 0, NULL))
+ 		asus->dsts_id = ASUS_WMI_METHODID_DSTS;
+-	else if (!asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS2, 0, 0, NULL))
++	else
+ 		asus->dsts_id = ASUS_WMI_METHODID_DSTS2;
+ 
+-	if (!asus->dsts_id) {
+-		pr_err("Can't find DSTS");
+-		return -ENODEV;
+-	}
+-
+ 	/* CWAP allow to define the behavior of the Fn+F2 key,
+ 	 * this method doesn't seems to be present on Eee PCs */
+ 	if (asus->driver->wapf >= 0)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0038-virtio-blk-Use-block-layer-provided-spinlock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0038-virtio-blk-Use-block-layer-provided-spinlock.patch
new file mode 100644
index 0000000..8efee34
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0038-virtio-blk-Use-block-layer-provided-spinlock.patch
@@ -0,0 +1,103 @@
+From b0b5f9284f3f86ce8c28aa112d267d261a5201e9 Mon Sep 17 00:00:00 2001
+From: Asias He <asias@redhat.com>
+Date: Fri, 25 May 2012 16:03:27 +0800
+Subject: [PATCH 38/70] virtio-blk: Use block layer provided spinlock
+
+commit 2c95a3290919541b846bee3e0fbaa75860929f53 upstream.
+
+Block layer will allocate a spinlock for the queue if the driver does
+not provide one in blk_init_queue().
+
+The reason to use the internal spinlock is that blk_cleanup_queue() will
+switch to use the internal spinlock in the cleanup code path.
+
+        if (q->queue_lock != &q->__queue_lock)
+                q->queue_lock = &q->__queue_lock;
+
+However, processes which are in D state might have taken the driver
+provided spinlock, when the processes wake up, they would release the
+block provided spinlock.
+
+=====================================
+[ BUG: bad unlock balance detected! ]
+3.4.0-rc7+ #238 Not tainted
+-------------------------------------
+fio/3587 is trying to release lock (&(&q->__queue_lock)->rlock) at:
+[<ffffffff813274d2>] blk_queue_bio+0x2a2/0x380
+but there are no more locks to release!
+
+other info that might help us debug this:
+1 lock held by fio/3587:
+ #0:  (&(&vblk->lock)->rlock){......}, at:
+[<ffffffff8132661a>] get_request_wait+0x19a/0x250
+
+Other drivers use block layer provided spinlock as well, e.g. SCSI.
+
+Switching to the block layer provided spinlock saves a bit of memory and
+does not increase lock contention. Performance test shows no real
+difference is observed before and after this patch.
+
+Changes in v2: Improve commit log as Michael suggested.
+
+Cc: virtualization@lists.linux-foundation.org
+Cc: kvm@vger.kernel.org
+Signed-off-by: Asias He <asias@redhat.com>
+Acked-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/block/virtio_blk.c |    9 +++------
+ 1 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/block/virtio_blk.c b/drivers/block/virtio_blk.c
+index e46f2f7..650a308 100644
+--- a/drivers/block/virtio_blk.c
++++ b/drivers/block/virtio_blk.c
+@@ -20,8 +20,6 @@ struct workqueue_struct *virtblk_wq;
+ 
+ struct virtio_blk
+ {
+-	spinlock_t lock;
+-
+ 	struct virtio_device *vdev;
+ 	struct virtqueue *vq;
+ 
+@@ -62,7 +60,7 @@ static void blk_done(struct virtqueue *vq)
+ 	unsigned int len;
+ 	unsigned long flags;
+ 
+-	spin_lock_irqsave(&vblk->lock, flags);
++	spin_lock_irqsave(vblk->disk->queue->queue_lock, flags);
+ 	while ((vbr = virtqueue_get_buf(vblk->vq, &len)) != NULL) {
+ 		int error;
+ 
+@@ -97,7 +95,7 @@ static void blk_done(struct virtqueue *vq)
+ 	}
+ 	/* In case queue is stopped waiting for more buffers. */
+ 	blk_start_queue(vblk->disk->queue);
+-	spin_unlock_irqrestore(&vblk->lock, flags);
++	spin_unlock_irqrestore(vblk->disk->queue->queue_lock, flags);
+ }
+ 
+ static bool do_req(struct request_queue *q, struct virtio_blk *vblk,
+@@ -384,7 +382,6 @@ static int __devinit virtblk_probe(struct virtio_device *vdev)
+ 	}
+ 
+ 	INIT_LIST_HEAD(&vblk->reqs);
+-	spin_lock_init(&vblk->lock);
+ 	vblk->vdev = vdev;
+ 	vblk->sg_elems = sg_elems;
+ 	sg_init_table(vblk->sg, vblk->sg_elems);
+@@ -410,7 +407,7 @@ static int __devinit virtblk_probe(struct virtio_device *vdev)
+ 		goto out_mempool;
+ 	}
+ 
+-	q = vblk->disk->queue = blk_init_queue(do_virtblk_request, &vblk->lock);
++	q = vblk->disk->queue = blk_init_queue(do_virtblk_request, NULL);
+ 	if (!q) {
+ 		err = -ENOMEM;
+ 		goto out_put_disk;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0039-s390-mm-fix-fault-handling-for-page-table-walk-case.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0039-s390-mm-fix-fault-handling-for-page-table-walk-case.patch
new file mode 100644
index 0000000..51b2063
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0039-s390-mm-fix-fault-handling-for-page-table-walk-case.patch
@@ -0,0 +1,72 @@
+From 3f3c533087d18cd75fbd23caa35032b3cec80ea8 Mon Sep 17 00:00:00 2001
+From: Heiko Carstens <heiko.carstens@de.ibm.com>
+Date: Fri, 27 Jul 2012 09:45:39 +0200
+Subject: [PATCH 39/70] s390/mm: fix fault handling for page table walk case
+
+commit 008c2e8f247f0a8db1e8e26139da12f3a3abcda0 upstream.
+
+Make sure the kernel does not incorrectly create a SIGBUS signal during
+user space accesses:
+
+For user space accesses in the switched addressing mode case the kernel
+may walk page tables and access user address space via the kernel
+mapping. If a page table entry is invalid the function __handle_fault()
+gets called in order to emulate a page fault and trigger all the usual
+actions like paging in a missing page etc. by calling handle_mm_fault().
+
+If handle_mm_fault() returns with an error fixup handling is necessary.
+For the switched addressing mode case all errors need to be mapped to
+-EFAULT, so that the calling uaccess function can return -EFAULT to
+user space.
+
+Unfortunately the __handle_fault() incorrectly calls do_sigbus() if
+VM_FAULT_SIGBUS is set. This however should only happen if a page fault
+was triggered by a user space instruction. For kernel mode uaccesses
+the correct action is to only return -EFAULT.
+So user space may incorrectly see SIGBUS signals because of this bug.
+
+For current machines this would only be possible for the switched
+addressing mode case in conjunction with futex operations.
+
+Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+[bwh: Backported to 3.2: do_exception() and do_sigbus() parameters differ]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/s390/mm/fault.c |   13 +++++++------
+ 1 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/arch/s390/mm/fault.c b/arch/s390/mm/fault.c
+index b28aaa4..0fc0a7e 100644
+--- a/arch/s390/mm/fault.c
++++ b/arch/s390/mm/fault.c
+@@ -453,6 +453,7 @@ int __handle_fault(unsigned long uaddr, unsigned long pgm_int_code, int write)
+ 	struct pt_regs regs;
+ 	int access, fault;
+ 
++	/* Emulate a uaccess fault from kernel mode. */
+ 	regs.psw.mask = psw_kernel_bits | PSW_MASK_DAT | PSW_MASK_MCHECK;
+ 	if (!irqs_disabled())
+ 		regs.psw.mask |= PSW_MASK_IO | PSW_MASK_EXT;
+@@ -461,12 +462,12 @@ int __handle_fault(unsigned long uaddr, unsigned long pgm_int_code, int write)
+ 	uaddr &= PAGE_MASK;
+ 	access = write ? VM_WRITE : VM_READ;
+ 	fault = do_exception(&regs, access, uaddr | 2);
+-	if (unlikely(fault)) {
+-		if (fault & VM_FAULT_OOM)
+-			return -EFAULT;
+-		else if (fault & VM_FAULT_SIGBUS)
+-			do_sigbus(&regs, pgm_int_code, uaddr);
+-	}
++	/*
++	 * Since the fault happened in kernel mode while performing a uaccess
++	 * all we need to do now is emulating a fixup in case "fault" is not
++	 * zero.
++	 * For the calling uaccess functions this results always in -EFAULT.
++	 */
+ 	return fault ? -EFAULT : 0;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0040-nfs-skip-commit-in-releasepage-if-we-re-freeing-memo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0040-nfs-skip-commit-in-releasepage-if-we-re-freeing-memo.patch
new file mode 100644
index 0000000..1063bad
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0040-nfs-skip-commit-in-releasepage-if-we-re-freeing-memo.patch
@@ -0,0 +1,182 @@
+From 264ef5a0ef781e5e2212558fe56f17f6cc2b7308 Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Mon, 23 Jul 2012 13:58:51 -0400
+Subject: [PATCH 40/70] nfs: skip commit in releasepage if we're freeing
+ memory for fs-related reasons
+
+commit 5cf02d09b50b1ee1c2d536c9cf64af5a7d433f56 upstream.
+
+We've had some reports of a deadlock where rpciod ends up with a stack
+trace like this:
+
+    PID: 2507   TASK: ffff88103691ab40  CPU: 14  COMMAND: "rpciod/14"
+     #0 [ffff8810343bf2f0] schedule at ffffffff814dabd9
+     #1 [ffff8810343bf3b8] nfs_wait_bit_killable at ffffffffa038fc04 [nfs]
+     #2 [ffff8810343bf3c8] __wait_on_bit at ffffffff814dbc2f
+     #3 [ffff8810343bf418] out_of_line_wait_on_bit at ffffffff814dbcd8
+     #4 [ffff8810343bf488] nfs_commit_inode at ffffffffa039e0c1 [nfs]
+     #5 [ffff8810343bf4f8] nfs_release_page at ffffffffa038bef6 [nfs]
+     #6 [ffff8810343bf528] try_to_release_page at ffffffff8110c670
+     #7 [ffff8810343bf538] shrink_page_list.clone.0 at ffffffff81126271
+     #8 [ffff8810343bf668] shrink_inactive_list at ffffffff81126638
+     #9 [ffff8810343bf818] shrink_zone at ffffffff8112788f
+    #10 [ffff8810343bf8c8] do_try_to_free_pages at ffffffff81127b1e
+    #11 [ffff8810343bf958] try_to_free_pages at ffffffff8112812f
+    #12 [ffff8810343bfa08] __alloc_pages_nodemask at ffffffff8111fdad
+    #13 [ffff8810343bfb28] kmem_getpages at ffffffff81159942
+    #14 [ffff8810343bfb58] fallback_alloc at ffffffff8115a55a
+    #15 [ffff8810343bfbd8] ____cache_alloc_node at ffffffff8115a2d9
+    #16 [ffff8810343bfc38] kmem_cache_alloc at ffffffff8115b09b
+    #17 [ffff8810343bfc78] sk_prot_alloc at ffffffff81411808
+    #18 [ffff8810343bfcb8] sk_alloc at ffffffff8141197c
+    #19 [ffff8810343bfce8] inet_create at ffffffff81483ba6
+    #20 [ffff8810343bfd38] __sock_create at ffffffff8140b4a7
+    #21 [ffff8810343bfd98] xs_create_sock at ffffffffa01f649b [sunrpc]
+    #22 [ffff8810343bfdd8] xs_tcp_setup_socket at ffffffffa01f6965 [sunrpc]
+    #23 [ffff8810343bfe38] worker_thread at ffffffff810887d0
+    #24 [ffff8810343bfee8] kthread at ffffffff8108dd96
+    #25 [ffff8810343bff48] kernel_thread at ffffffff8100c1ca
+
+rpciod is trying to allocate memory for a new socket to talk to the
+server. The VM ends up calling ->releasepage to get more memory, and it
+tries to do a blocking commit. That commit can't succeed however without
+a connected socket, so we deadlock.
+
+Fix this by setting PF_FSTRANS on the workqueue task prior to doing the
+socket allocation, and having nfs_release_page check for that flag when
+deciding whether to do a commit call. Also, set PF_FSTRANS
+unconditionally in rpc_async_schedule since that function can also do
+allocations sometimes.
+
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfs/file.c                   |    7 +++++--
+ net/sunrpc/sched.c              |    2 ++
+ net/sunrpc/xprtrdma/transport.c |    3 ++-
+ net/sunrpc/xprtsock.c           |   10 ++++++++++
+ 4 files changed, 19 insertions(+), 3 deletions(-)
+
+diff --git a/fs/nfs/file.c b/fs/nfs/file.c
+index c43a452..961e562 100644
+--- a/fs/nfs/file.c
++++ b/fs/nfs/file.c
+@@ -452,8 +452,11 @@ static int nfs_release_page(struct page *page, gfp_t gfp)
+ 
+ 	dfprintk(PAGECACHE, "NFS: release_page(%p)\n", page);
+ 
+-	/* Only do I/O if gfp is a superset of GFP_KERNEL */
+-	if (mapping && (gfp & GFP_KERNEL) == GFP_KERNEL) {
++	/* Only do I/O if gfp is a superset of GFP_KERNEL, and we're not
++	 * doing this memory reclaim for a fs-related allocation.
++	 */
++	if (mapping && (gfp & GFP_KERNEL) == GFP_KERNEL &&
++	    !(current->flags & PF_FSTRANS)) {
+ 		int how = FLUSH_SYNC;
+ 
+ 		/* Don't let kswapd deadlock waiting for OOM RPC calls */
+diff --git a/net/sunrpc/sched.c b/net/sunrpc/sched.c
+index 4e2b3b4..c90b832 100644
+--- a/net/sunrpc/sched.c
++++ b/net/sunrpc/sched.c
+@@ -755,7 +755,9 @@ void rpc_execute(struct rpc_task *task)
+ 
+ static void rpc_async_schedule(struct work_struct *work)
+ {
++	current->flags |= PF_FSTRANS;
+ 	__rpc_execute(container_of(work, struct rpc_task, u.tk_work));
++	current->flags &= ~PF_FSTRANS;
+ }
+ 
+ /**
+diff --git a/net/sunrpc/xprtrdma/transport.c b/net/sunrpc/xprtrdma/transport.c
+index b446e10..06cdbff 100644
+--- a/net/sunrpc/xprtrdma/transport.c
++++ b/net/sunrpc/xprtrdma/transport.c
+@@ -200,6 +200,7 @@ xprt_rdma_connect_worker(struct work_struct *work)
+ 	int rc = 0;
+ 
+ 	if (!xprt->shutdown) {
++		current->flags |= PF_FSTRANS;
+ 		xprt_clear_connected(xprt);
+ 
+ 		dprintk("RPC:       %s: %sconnect\n", __func__,
+@@ -212,10 +213,10 @@ xprt_rdma_connect_worker(struct work_struct *work)
+ 
+ out:
+ 	xprt_wake_pending_tasks(xprt, rc);
+-
+ out_clear:
+ 	dprintk("RPC:       %s: exit\n", __func__);
+ 	xprt_clear_connecting(xprt);
++	current->flags &= ~PF_FSTRANS;
+ }
+ 
+ /*
+diff --git a/net/sunrpc/xprtsock.c b/net/sunrpc/xprtsock.c
+index 55472c4..1a6edc7 100644
+--- a/net/sunrpc/xprtsock.c
++++ b/net/sunrpc/xprtsock.c
+@@ -1895,6 +1895,8 @@ static void xs_local_setup_socket(struct work_struct *work)
+ 	if (xprt->shutdown)
+ 		goto out;
+ 
++	current->flags |= PF_FSTRANS;
++
+ 	clear_bit(XPRT_CONNECTION_ABORT, &xprt->state);
+ 	status = __sock_create(xprt->xprt_net, AF_LOCAL,
+ 					SOCK_STREAM, 0, &sock, 1);
+@@ -1928,6 +1930,7 @@ static void xs_local_setup_socket(struct work_struct *work)
+ out:
+ 	xprt_clear_connecting(xprt);
+ 	xprt_wake_pending_tasks(xprt, status);
++	current->flags &= ~PF_FSTRANS;
+ }
+ 
+ static void xs_udp_finish_connecting(struct rpc_xprt *xprt, struct socket *sock)
+@@ -1970,6 +1973,8 @@ static void xs_udp_setup_socket(struct work_struct *work)
+ 	if (xprt->shutdown)
+ 		goto out;
+ 
++	current->flags |= PF_FSTRANS;
++
+ 	/* Start by resetting any existing state */
+ 	xs_reset_transport(transport);
+ 	sock = xs_create_sock(xprt, transport,
+@@ -1988,6 +1993,7 @@ static void xs_udp_setup_socket(struct work_struct *work)
+ out:
+ 	xprt_clear_connecting(xprt);
+ 	xprt_wake_pending_tasks(xprt, status);
++	current->flags &= ~PF_FSTRANS;
+ }
+ 
+ /*
+@@ -2113,6 +2119,8 @@ static void xs_tcp_setup_socket(struct work_struct *work)
+ 	if (xprt->shutdown)
+ 		goto out;
+ 
++	current->flags |= PF_FSTRANS;
++
+ 	if (!sock) {
+ 		clear_bit(XPRT_CONNECTION_ABORT, &xprt->state);
+ 		sock = xs_create_sock(xprt, transport,
+@@ -2162,6 +2170,7 @@ static void xs_tcp_setup_socket(struct work_struct *work)
+ 	case -EINPROGRESS:
+ 	case -EALREADY:
+ 		xprt_clear_connecting(xprt);
++		current->flags &= ~PF_FSTRANS;
+ 		return;
+ 	case -EINVAL:
+ 		/* Happens, for instance, if the user specified a link
+@@ -2174,6 +2183,7 @@ out_eagain:
+ out:
+ 	xprt_clear_connecting(xprt);
+ 	xprt_wake_pending_tasks(xprt, status);
++	current->flags &= ~PF_FSTRANS;
+ }
+ 
+ /**
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0041-md-raid1-don-t-abort-a-resync-on-the-first-badblock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0041-md-raid1-don-t-abort-a-resync-on-the-first-badblock.patch
new file mode 100644
index 0000000..5cbbca6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0041-md-raid1-don-t-abort-a-resync-on-the-first-badblock.patch
@@ -0,0 +1,48 @@
+From 30dede5f9785f15bda14b54146afa5d3bd8ebcef Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Tue, 31 Jul 2012 10:05:34 +1000
+Subject: [PATCH 41/70] md/raid1: don't abort a resync on the first badblock.
+
+commit b7219ccb33aa0df9949a60c68b5e9f712615e56f upstream.
+
+If a resync of a RAID1 array with 2 devices finds a known bad block
+one device it will neither read from, or write to, that device for
+this block offset.
+So there will be one read_target (The other device) and zero write
+targets.
+This condition causes md/raid1 to abort the resync assuming that it
+has finished - without known bad blocks this would be true.
+
+When there are no write targets because of the presence of bad blocks
+we should only skip over the area covered by the bad block.
+RAID10 already gets this right, raid1 doesn't.  Or didn't.
+
+As this can cause a 'sync' to abort early and appear to have succeeded
+it could lead to some data corruption, so it suitable for -stable.
+
+Reported-by: Alexander Lyakas <alex.bolshoy@gmail.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid1.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
+index 2d97bf0..62306e5 100644
+--- a/drivers/md/raid1.c
++++ b/drivers/md/raid1.c
+@@ -2321,7 +2321,10 @@ static sector_t sync_request(struct mddev *mddev, sector_t sector_nr, int *skipp
+ 		/* There is nowhere to write, so all non-sync
+ 		 * drives must be failed - so we are finished
+ 		 */
+-		sector_t rv = max_sector - sector_nr;
++		sector_t rv;
++		if (min_bad > 0)
++			max_sector = sector_nr + min_bad;
++		rv = max_sector - sector_nr;
+ 		*skipped = 1;
+ 		put_buf(r1_bio);
+ 		return rv;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0042-pcdp-use-early_ioremap-early_iounmap-to-access-pcdp-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0042-pcdp-use-early_ioremap-early_iounmap-to-access-pcdp-.patch
new file mode 100644
index 0000000..5d73f17
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0042-pcdp-use-early_ioremap-early_iounmap-to-access-pcdp-.patch
@@ -0,0 +1,73 @@
+From d95d761e05255b4aadcc2978c41cbabb0fba5069 Mon Sep 17 00:00:00 2001
+From: Greg Pearson <greg.pearson@hp.com>
+Date: Mon, 30 Jul 2012 14:39:05 -0700
+Subject: [PATCH 42/70] pcdp: use early_ioremap/early_iounmap to access pcdp
+ table
+
+commit 6c4088ac3a4d82779903433bcd5f048c58fb1aca upstream.
+
+efi_setup_pcdp_console() is called during boot to parse the HCDP/PCDP
+EFI system table and setup an early console for printk output.  The
+routine uses ioremap/iounmap to setup access to the HCDP/PCDP table
+information.
+
+The call to ioremap is happening early in the boot process which leads
+to a panic on x86_64 systems:
+
+    panic+0x01ca
+    do_exit+0x043c
+    oops_end+0x00a7
+    no_context+0x0119
+    __bad_area_nosemaphore+0x0138
+    bad_area_nosemaphore+0x000e
+    do_page_fault+0x0321
+    page_fault+0x0020
+    reserve_memtype+0x02a1
+    __ioremap_caller+0x0123
+    ioremap_nocache+0x0012
+    efi_setup_pcdp_console+0x002b
+    setup_arch+0x03a9
+    start_kernel+0x00d4
+    x86_64_start_reservations+0x012c
+    x86_64_start_kernel+0x00fe
+
+This replaces the calls to ioremap/iounmap in efi_setup_pcdp_console()
+with calls to early_ioremap/early_iounmap which can be called during
+early boot.
+
+This patch was tested on an x86_64 prototype system which uses the
+HCDP/PCDP table for early console setup.
+
+Signed-off-by: Greg Pearson <greg.pearson@hp.com>
+Acked-by: Khalid Aziz <khalid.aziz@hp.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/firmware/pcdp.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/firmware/pcdp.c b/drivers/firmware/pcdp.c
+index 51e0e2d..a330492 100644
+--- a/drivers/firmware/pcdp.c
++++ b/drivers/firmware/pcdp.c
+@@ -95,7 +95,7 @@ efi_setup_pcdp_console(char *cmdline)
+ 	if (efi.hcdp == EFI_INVALID_TABLE_ADDR)
+ 		return -ENODEV;
+ 
+-	pcdp = ioremap(efi.hcdp, 4096);
++	pcdp = early_ioremap(efi.hcdp, 4096);
+ 	printk(KERN_INFO "PCDP: v%d at 0x%lx\n", pcdp->rev, efi.hcdp);
+ 
+ 	if (strstr(cmdline, "console=hcdp")) {
+@@ -131,6 +131,6 @@ efi_setup_pcdp_console(char *cmdline)
+ 	}
+ 
+ out:
+-	iounmap(pcdp);
++	early_iounmap(pcdp, 4096);
+ 	return rc;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0043-lib-vsprintf.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0043-lib-vsprintf.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch
new file mode 100644
index 0000000..791a80e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0043-lib-vsprintf.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch
@@ -0,0 +1,48 @@
+From a0a91da6c89df972be571c3b3cc7288dcab8b501 Mon Sep 17 00:00:00 2001
+From: Dan Rosenberg <drosenberg@vsecurity.com>
+Date: Mon, 30 Jul 2012 14:40:26 -0700
+Subject: [PATCH 43/70] lib/vsprintf.c: kptr_restrict: fix pK-error in SysRq
+ show-all-timers(Q)
+
+commit 3715c5309f6d175c3053672b73fd4f73be16fd07 upstream.
+
+When using ALT+SysRq+Q all the pointers are replaced with "pK-error" like
+this:
+
+	[23153.208033]   .base:               pK-error
+
+with echo h > /proc/sysrq-trigger it works:
+
+	[23107.776363]   .base:       ffff88023e60d540
+
+The intent behind this behavior was to return "pK-error" in cases where
+the %pK format specifier was used in interrupt context, because the
+CAP_SYSLOG check wouldn't be meaningful.  Clearly this should only apply
+when kptr_restrict is actually enabled though.
+
+Reported-by: Stevie Trujillo <stevie.trujillo@gmail.com>
+Signed-off-by: Dan Rosenberg <dan.j.rosenberg@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ lib/vsprintf.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/lib/vsprintf.c b/lib/vsprintf.c
+index 993599e..d74c317 100644
+--- a/lib/vsprintf.c
++++ b/lib/vsprintf.c
+@@ -886,7 +886,8 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
+ 		 * %pK cannot be used in IRQ context because its test
+ 		 * for CAP_SYSLOG would be meaningless.
+ 		 */
+-		if (in_irq() || in_serving_softirq() || in_nmi()) {
++		if (kptr_restrict && (in_irq() || in_serving_softirq() ||
++				      in_nmi())) {
+ 			if (spec.field_width == -1)
+ 				spec.field_width = 2 * sizeof(void *);
+ 			return string(buf, end, "pK-error", spec);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0044-nilfs2-fix-deadlock-issue-between-chcp-and-thaw-ioct.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0044-nilfs2-fix-deadlock-issue-between-chcp-and-thaw-ioct.patch
new file mode 100644
index 0000000..081eb4b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0044-nilfs2-fix-deadlock-issue-between-chcp-and-thaw-ioct.patch
@@ -0,0 +1,144 @@
+From 9cdd3090a527c3174e3db476d1e86db6e9b2333e Mon Sep 17 00:00:00 2001
+From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Date: Mon, 30 Jul 2012 14:42:07 -0700
+Subject: [PATCH 44/70] nilfs2: fix deadlock issue between chcp and thaw
+ ioctls
+
+commit 572d8b3945a31bee7c40d21556803e4807fd9141 upstream.
+
+An fs-thaw ioctl causes deadlock with a chcp or mkcp -s command:
+
+ chcp            D ffff88013870f3d0     0  1325   1324 0x00000004
+ ...
+ Call Trace:
+   nilfs_transaction_begin+0x11c/0x1a0 [nilfs2]
+   wake_up_bit+0x20/0x20
+   copy_from_user+0x18/0x30 [nilfs2]
+   nilfs_ioctl_change_cpmode+0x7d/0xcf [nilfs2]
+   nilfs_ioctl+0x252/0x61a [nilfs2]
+   do_page_fault+0x311/0x34c
+   get_unmapped_area+0x132/0x14e
+   do_vfs_ioctl+0x44b/0x490
+   __set_task_blocked+0x5a/0x61
+   vm_mmap_pgoff+0x76/0x87
+   __set_current_blocked+0x30/0x4a
+   sys_ioctl+0x4b/0x6f
+   system_call_fastpath+0x16/0x1b
+ thaw            D ffff88013870d890     0  1352   1351 0x00000004
+ ...
+ Call Trace:
+   rwsem_down_failed_common+0xdb/0x10f
+   call_rwsem_down_write_failed+0x13/0x20
+   down_write+0x25/0x27
+   thaw_super+0x13/0x9e
+   do_vfs_ioctl+0x1f5/0x490
+   vm_mmap_pgoff+0x76/0x87
+   sys_ioctl+0x4b/0x6f
+   filp_close+0x64/0x6c
+   system_call_fastpath+0x16/0x1b
+
+where the thaw ioctl deadlocked at thaw_super() when called while chcp was
+waiting at nilfs_transaction_begin() called from
+nilfs_ioctl_change_cpmode().  This deadlock is 100% reproducible.
+
+This is because nilfs_ioctl_change_cpmode() first locks sb->s_umount in
+read mode and then waits for unfreezing in nilfs_transaction_begin(),
+whereas thaw_super() locks sb->s_umount in write mode.  The locking of
+sb->s_umount here was intended to make snapshot mounts and the downgrade
+of snapshots to checkpoints exclusive.
+
+This fixes the deadlock issue by replacing the sb->s_umount usage in
+nilfs_ioctl_change_cpmode() with a dedicated mutex which protects snapshot
+mounts.
+
+Signed-off-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Cc: Fernando Luis Vazquez Cao <fernando@oss.ntt.co.jp>
+Tested-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nilfs2/ioctl.c     |    4 ++--
+ fs/nilfs2/super.c     |    3 +++
+ fs/nilfs2/the_nilfs.c |    1 +
+ fs/nilfs2/the_nilfs.h |    2 ++
+ 4 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/fs/nilfs2/ioctl.c b/fs/nilfs2/ioctl.c
+index ac258be..c598cfb 100644
+--- a/fs/nilfs2/ioctl.c
++++ b/fs/nilfs2/ioctl.c
+@@ -182,7 +182,7 @@ static int nilfs_ioctl_change_cpmode(struct inode *inode, struct file *filp,
+ 	if (copy_from_user(&cpmode, argp, sizeof(cpmode)))
+ 		goto out;
+ 
+-	down_read(&inode->i_sb->s_umount);
++	mutex_lock(&nilfs->ns_snapshot_mount_mutex);
+ 
+ 	nilfs_transaction_begin(inode->i_sb, &ti, 0);
+ 	ret = nilfs_cpfile_change_cpmode(
+@@ -192,7 +192,7 @@ static int nilfs_ioctl_change_cpmode(struct inode *inode, struct file *filp,
+ 	else
+ 		nilfs_transaction_commit(inode->i_sb); /* never fails */
+ 
+-	up_read(&inode->i_sb->s_umount);
++	mutex_unlock(&nilfs->ns_snapshot_mount_mutex);
+ out:
+ 	mnt_drop_write(filp->f_path.mnt);
+ 	return ret;
+diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
+index 8351c44..97bfbdd 100644
+--- a/fs/nilfs2/super.c
++++ b/fs/nilfs2/super.c
+@@ -951,6 +951,8 @@ static int nilfs_attach_snapshot(struct super_block *s, __u64 cno,
+ 	struct nilfs_root *root;
+ 	int ret;
+ 
++	mutex_lock(&nilfs->ns_snapshot_mount_mutex);
++
+ 	down_read(&nilfs->ns_segctor_sem);
+ 	ret = nilfs_cpfile_is_snapshot(nilfs->ns_cpfile, cno);
+ 	up_read(&nilfs->ns_segctor_sem);
+@@ -975,6 +977,7 @@ static int nilfs_attach_snapshot(struct super_block *s, __u64 cno,
+ 	ret = nilfs_get_root_dentry(s, root, root_dentry);
+ 	nilfs_put_root(root);
+  out:
++	mutex_unlock(&nilfs->ns_snapshot_mount_mutex);
+ 	return ret;
+ }
+ 
+diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
+index 35a8970..1c98f53 100644
+--- a/fs/nilfs2/the_nilfs.c
++++ b/fs/nilfs2/the_nilfs.c
+@@ -76,6 +76,7 @@ struct the_nilfs *alloc_nilfs(struct block_device *bdev)
+ 	nilfs->ns_bdev = bdev;
+ 	atomic_set(&nilfs->ns_ndirtyblks, 0);
+ 	init_rwsem(&nilfs->ns_sem);
++	mutex_init(&nilfs->ns_snapshot_mount_mutex);
+ 	INIT_LIST_HEAD(&nilfs->ns_dirty_files);
+ 	INIT_LIST_HEAD(&nilfs->ns_gc_inodes);
+ 	spin_lock_init(&nilfs->ns_inode_lock);
+diff --git a/fs/nilfs2/the_nilfs.h b/fs/nilfs2/the_nilfs.h
+index 9992b11..de7435f 100644
+--- a/fs/nilfs2/the_nilfs.h
++++ b/fs/nilfs2/the_nilfs.h
+@@ -47,6 +47,7 @@ enum {
+  * @ns_flags: flags
+  * @ns_bdev: block device
+  * @ns_sem: semaphore for shared states
++ * @ns_snapshot_mount_mutex: mutex to protect snapshot mounts
+  * @ns_sbh: buffer heads of on-disk super blocks
+  * @ns_sbp: pointers to super block data
+  * @ns_sbwtime: previous write time of super block
+@@ -99,6 +100,7 @@ struct the_nilfs {
+ 
+ 	struct block_device    *ns_bdev;
+ 	struct rw_semaphore	ns_sem;
++	struct mutex		ns_snapshot_mount_mutex;
+ 
+ 	/*
+ 	 * used for
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0045-SUNRPC-return-negative-value-in-case-rpcbind-client-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0045-SUNRPC-return-negative-value-in-case-rpcbind-client-.patch
new file mode 100644
index 0000000..78d6dc3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0045-SUNRPC-return-negative-value-in-case-rpcbind-client-.patch
@@ -0,0 +1,45 @@
+From 2bf260f82454f5f3809e8bb31cf158abdc7259a3 Mon Sep 17 00:00:00 2001
+From: Stanislav Kinsbursky <skinsbursky@parallels.com>
+Date: Fri, 20 Jul 2012 15:57:48 +0400
+Subject: [PATCH 45/70] SUNRPC: return negative value in case rpcbind client
+ creation error
+
+commit caea33da898e4e14f0ba58173e3b7689981d2c0b upstream.
+
+Without this patch kernel will panic on LockD start, because lockd_up() checks
+lockd_up_net() result for negative value.
+From my pow it's better to return negative value from rpcbind routines instead
+of replacing all such checks like in lockd_up().
+
+Signed-off-by: Stanislav Kinsbursky <skinsbursky@parallels.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/sunrpc/rpcb_clnt.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/net/sunrpc/rpcb_clnt.c b/net/sunrpc/rpcb_clnt.c
+index 8761bf8..337c68b 100644
+--- a/net/sunrpc/rpcb_clnt.c
++++ b/net/sunrpc/rpcb_clnt.c
+@@ -246,7 +246,7 @@ static int rpcb_create_local_unix(void)
+ 	if (IS_ERR(clnt)) {
+ 		dprintk("RPC:       failed to create AF_LOCAL rpcbind "
+ 				"client (errno %ld).\n", PTR_ERR(clnt));
+-		result = -PTR_ERR(clnt);
++		result = PTR_ERR(clnt);
+ 		goto out;
+ 	}
+ 
+@@ -293,7 +293,7 @@ static int rpcb_create_local_net(void)
+ 	if (IS_ERR(clnt)) {
+ 		dprintk("RPC:       failed to create local rpcbind "
+ 				"client (errno %ld).\n", PTR_ERR(clnt));
+-		result = -PTR_ERR(clnt);
++		result = PTR_ERR(clnt);
+ 		goto out;
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0046-ARM-7467-1-mutex-use-generic-xchg-based-implementati.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0046-ARM-7467-1-mutex-use-generic-xchg-based-implementati.patch
new file mode 100644
index 0000000..0808024
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0046-ARM-7467-1-mutex-use-generic-xchg-based-implementati.patch
@@ -0,0 +1,165 @@
+From 28c5c473fd1dffcd9dacfc1b4ea643181398f149 Mon Sep 17 00:00:00 2001
+From: Will Deacon <will.deacon@arm.com>
+Date: Fri, 13 Jul 2012 19:15:40 +0100
+Subject: [PATCH 46/70] ARM: 7467/1: mutex: use generic xchg-based
+ implementation for ARMv6+
+
+commit a76d7bd96d65fa5119adba97e1b58d95f2e78829 upstream.
+
+The open-coded mutex implementation for ARMv6+ cores suffers from a
+severe lack of barriers, so in the uncontended case we don't actually
+protect any accesses performed during the critical section.
+
+Furthermore, the code is largely a duplication of the ARMv6+ atomic_dec
+code but optimised to remove a branch instruction, as the mutex fastpath
+was previously inlined. Now that this is executed out-of-line, we can
+reuse the atomic access code for the locking (in fact, we use the xchg
+code as this produces shorter critical sections).
+
+This patch uses the generic xchg based implementation for mutexes on
+ARMv6+, which introduces barriers to the lock/unlock operations and also
+has the benefit of removing a fair amount of inline assembly code.
+
+Acked-by: Arnd Bergmann <arnd@arndb.de>
+Acked-by: Nicolas Pitre <nico@linaro.org>
+Reported-by: Shan Kang <kangshan0910@gmail.com>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/include/asm/mutex.h |  119 ++----------------------------------------
+ 1 files changed, 4 insertions(+), 115 deletions(-)
+
+diff --git a/arch/arm/include/asm/mutex.h b/arch/arm/include/asm/mutex.h
+index 93226cf..b1479fd 100644
+--- a/arch/arm/include/asm/mutex.h
++++ b/arch/arm/include/asm/mutex.h
+@@ -7,121 +7,10 @@
+  */
+ #ifndef _ASM_MUTEX_H
+ #define _ASM_MUTEX_H
+-
+-#if __LINUX_ARM_ARCH__ < 6
+-/* On pre-ARMv6 hardware the swp based implementation is the most efficient. */
+-# include <asm-generic/mutex-xchg.h>
+-#else
+-
+ /*
+- * Attempting to lock a mutex on ARMv6+ can be done with a bastardized
+- * atomic decrement (it is not a reliable atomic decrement but it satisfies
+- * the defined semantics for our purpose, while being smaller and faster
+- * than a real atomic decrement or atomic swap.  The idea is to attempt
+- * decrementing the lock value only once.  If once decremented it isn't zero,
+- * or if its store-back fails due to a dispute on the exclusive store, we
+- * simply bail out immediately through the slow path where the lock will be
+- * reattempted until it succeeds.
++ * On pre-ARMv6 hardware this results in a swp-based implementation,
++ * which is the most efficient. For ARMv6+, we emit a pair of exclusive
++ * accesses instead.
+  */
+-static inline void
+-__mutex_fastpath_lock(atomic_t *count, void (*fail_fn)(atomic_t *))
+-{
+-	int __ex_flag, __res;
+-
+-	__asm__ (
+-
+-		"ldrex	%0, [%2]	\n\t"
+-		"sub	%0, %0, #1	\n\t"
+-		"strex	%1, %0, [%2]	"
+-
+-		: "=&r" (__res), "=&r" (__ex_flag)
+-		: "r" (&(count)->counter)
+-		: "cc","memory" );
+-
+-	__res |= __ex_flag;
+-	if (unlikely(__res != 0))
+-		fail_fn(count);
+-}
+-
+-static inline int
+-__mutex_fastpath_lock_retval(atomic_t *count, int (*fail_fn)(atomic_t *))
+-{
+-	int __ex_flag, __res;
+-
+-	__asm__ (
+-
+-		"ldrex	%0, [%2]	\n\t"
+-		"sub	%0, %0, #1	\n\t"
+-		"strex	%1, %0, [%2]	"
+-
+-		: "=&r" (__res), "=&r" (__ex_flag)
+-		: "r" (&(count)->counter)
+-		: "cc","memory" );
+-
+-	__res |= __ex_flag;
+-	if (unlikely(__res != 0))
+-		__res = fail_fn(count);
+-	return __res;
+-}
+-
+-/*
+- * Same trick is used for the unlock fast path. However the original value,
+- * rather than the result, is used to test for success in order to have
+- * better generated assembly.
+- */
+-static inline void
+-__mutex_fastpath_unlock(atomic_t *count, void (*fail_fn)(atomic_t *))
+-{
+-	int __ex_flag, __res, __orig;
+-
+-	__asm__ (
+-
+-		"ldrex	%0, [%3]	\n\t"
+-		"add	%1, %0, #1	\n\t"
+-		"strex	%2, %1, [%3]	"
+-
+-		: "=&r" (__orig), "=&r" (__res), "=&r" (__ex_flag)
+-		: "r" (&(count)->counter)
+-		: "cc","memory" );
+-
+-	__orig |= __ex_flag;
+-	if (unlikely(__orig != 0))
+-		fail_fn(count);
+-}
+-
+-/*
+- * If the unlock was done on a contended lock, or if the unlock simply fails
+- * then the mutex remains locked.
+- */
+-#define __mutex_slowpath_needs_to_unlock()	1
+-
+-/*
+- * For __mutex_fastpath_trylock we use another construct which could be
+- * described as a "single value cmpxchg".
+- *
+- * This provides the needed trylock semantics like cmpxchg would, but it is
+- * lighter and less generic than a true cmpxchg implementation.
+- */
+-static inline int
+-__mutex_fastpath_trylock(atomic_t *count, int (*fail_fn)(atomic_t *))
+-{
+-	int __ex_flag, __res, __orig;
+-
+-	__asm__ (
+-
+-		"1: ldrex	%0, [%3]	\n\t"
+-		"subs		%1, %0, #1	\n\t"
+-		"strexeq	%2, %1, [%3]	\n\t"
+-		"movlt		%0, #0		\n\t"
+-		"cmpeq		%2, #0		\n\t"
+-		"bgt		1b		"
+-
+-		: "=&r" (__orig), "=&r" (__res), "=&r" (__ex_flag)
+-		: "r" (&count->counter)
+-		: "cc", "memory" );
+-
+-	return __orig;
+-}
+-
+-#endif
++#include <asm-generic/mutex-xchg.h>
+ #endif
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0047-ARM-7476-1-vfp-only-clear-vfp-state-for-current-cpu-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0047-ARM-7476-1-vfp-only-clear-vfp-state-for-current-cpu-.patch
new file mode 100644
index 0000000..d7aaf22
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0047-ARM-7476-1-vfp-only-clear-vfp-state-for-current-cpu-.patch
@@ -0,0 +1,36 @@
+From 57a8207d3a9a4df2ed7a736afa04cdff4b1eae03 Mon Sep 17 00:00:00 2001
+From: Colin Cross <ccross@android.com>
+Date: Fri, 20 Jul 2012 02:03:43 +0100
+Subject: [PATCH 47/70] ARM: 7476/1: vfp: only clear vfp state for current cpu
+ in vfp_pm_suspend
+
+commit a84b895a2348f0dbff31b71ddf954f70a6cde368 upstream.
+
+vfp_pm_suspend runs on each cpu, only clear the hardware state
+pointer for the current cpu.  Prevents a possible crash if one
+cpu clears the hw state pointer when another cpu has already
+checked if it is valid.
+
+Signed-off-by: Colin Cross <ccross@android.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/vfp/vfpmodule.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
+index 8ea07e4..61e11ce 100644
+--- a/arch/arm/vfp/vfpmodule.c
++++ b/arch/arm/vfp/vfpmodule.c
+@@ -456,7 +456,7 @@ static int vfp_pm_suspend(void)
+ 	}
+ 
+ 	/* clear any information we had about last context state */
+-	memset(vfp_current_hw_state, 0, sizeof(vfp_current_hw_state));
++	vfp_current_hw_state[ti->cpu] = NULL;
+ 
+ 	return 0;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0048-ARM-7477-1-vfp-Always-save-VFP-state-in-vfp_pm_suspe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0048-ARM-7477-1-vfp-Always-save-VFP-state-in-vfp_pm_suspe.patch
new file mode 100644
index 0000000..aa5978e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0048-ARM-7477-1-vfp-Always-save-VFP-state-in-vfp_pm_suspe.patch
@@ -0,0 +1,58 @@
+From 670bc10621ecb0750e22b72dc873b4ade756fd73 Mon Sep 17 00:00:00 2001
+From: Colin Cross <ccross@android.com>
+Date: Fri, 20 Jul 2012 02:03:42 +0100
+Subject: [PATCH 48/70] ARM: 7477/1: vfp: Always save VFP state in
+ vfp_pm_suspend on UP
+
+commit 24b35521b8ddf088531258f06f681bb7b227bf47 upstream.
+
+vfp_pm_suspend should save the VFP state in suspend after
+any lazy context switch.  If it only saves when the VFP is enabled,
+the state can get lost when, on a UP system:
+  Thread 1 uses the VFP
+  Context switch occurs to thread 2, VFP is disabled but the
+     VFP context is not saved
+  Thread 2 initiates suspend
+  vfp_pm_suspend is called with the VFP disabled, and the unsaved
+     VFP context of Thread 1 in the registers
+
+Modify vfp_pm_suspend to save the VFP context whenever
+vfp_current_hw_state is not NULL.
+
+Includes a fix from Ido Yariv <ido@wizery.com>, who pointed out that on
+SMP systems, the state pointer can be pointing to a freed task struct if
+a task exited on another cpu, fixed by using #ifndef CONFIG_SMP in the
+new if clause.
+
+Cc: Barry Song <bs14@csr.com>
+Cc: Catalin Marinas <catalin.marinas@arm.com>
+Cc: Ido Yariv <ido@wizery.com>
+Cc: Daniel Drake <dsd@laptop.org>
+Cc: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Colin Cross <ccross@android.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/vfp/vfpmodule.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
+index 61e11ce..ad83dad 100644
+--- a/arch/arm/vfp/vfpmodule.c
++++ b/arch/arm/vfp/vfpmodule.c
+@@ -453,6 +453,12 @@ static int vfp_pm_suspend(void)
+ 
+ 		/* disable, just in case */
+ 		fmxr(FPEXC, fmrx(FPEXC) & ~FPEXC_EN);
++	} else if (vfp_current_hw_state[ti->cpu]) {
++#ifndef CONFIG_SMP
++		fmxr(FPEXC, fpexc | FPEXC_EN);
++		vfp_save_state(vfp_current_hw_state[ti->cpu], fpexc);
++		fmxr(FPEXC, fpexc);
++#endif
+ 	}
+ 
+ 	/* clear any information we had about last context state */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0049-ARM-7478-1-errata-extend-workaround-for-erratum-7207.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0049-ARM-7478-1-errata-extend-workaround-for-erratum-7207.patch
new file mode 100644
index 0000000..0940ef0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0049-ARM-7478-1-errata-extend-workaround-for-erratum-7207.patch
@@ -0,0 +1,62 @@
+From 98922b7089b3ef806a0c3bae3c7e10e5618e4859 Mon Sep 17 00:00:00 2001
+From: Will Deacon <will.deacon@arm.com>
+Date: Fri, 20 Jul 2012 18:24:55 +0100
+Subject: [PATCH 49/70] ARM: 7478/1: errata: extend workaround for erratum
+ #720789
+
+commit 5a783cbc48367cfc7b65afc75430953dfe60098f upstream.
+
+Commit cdf357f1 ("ARM: 6299/1: errata: TLBIASIDIS and TLBIMVAIS
+operations can broadcast a faulty ASID") replaced by-ASID TLB flushing
+operations with all-ASID variants to workaround A9 erratum #720789.
+
+This patch extends the workaround to include the tlb_range operations,
+which were overlooked by the original patch.
+
+Tested-by: Steve Capper <steve.capper@arm.com>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/mm/tlb-v7.S |   12 ++++++++++++
+ 1 files changed, 12 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mm/tlb-v7.S b/arch/arm/mm/tlb-v7.S
+index 845f461..c202113 100644
+--- a/arch/arm/mm/tlb-v7.S
++++ b/arch/arm/mm/tlb-v7.S
+@@ -38,11 +38,19 @@ ENTRY(v7wbi_flush_user_tlb_range)
+ 	dsb
+ 	mov	r0, r0, lsr #PAGE_SHIFT		@ align address
+ 	mov	r1, r1, lsr #PAGE_SHIFT
++#ifdef CONFIG_ARM_ERRATA_720789
++	mov	r3, #0
++#else
+ 	asid	r3, r3				@ mask ASID
++#endif
+ 	orr	r0, r3, r0, lsl #PAGE_SHIFT	@ Create initial MVA
+ 	mov	r1, r1, lsl #PAGE_SHIFT
+ 1:
++#ifdef CONFIG_ARM_ERRATA_720789
++	ALT_SMP(mcr	p15, 0, r0, c8, c3, 3)	@ TLB invalidate U MVA all ASID (shareable)
++#else
+ 	ALT_SMP(mcr	p15, 0, r0, c8, c3, 1)	@ TLB invalidate U MVA (shareable)
++#endif
+ 	ALT_UP(mcr	p15, 0, r0, c8, c7, 1)	@ TLB invalidate U MVA
+ 
+ 	add	r0, r0, #PAGE_SZ
+@@ -67,7 +75,11 @@ ENTRY(v7wbi_flush_kern_tlb_range)
+ 	mov	r0, r0, lsl #PAGE_SHIFT
+ 	mov	r1, r1, lsl #PAGE_SHIFT
+ 1:
++#ifdef CONFIG_ARM_ERRATA_720789
++	ALT_SMP(mcr	p15, 0, r0, c8, c3, 3)	@ TLB invalidate U MVA all ASID (shareable)
++#else
+ 	ALT_SMP(mcr	p15, 0, r0, c8, c3, 1)	@ TLB invalidate U MVA (shareable)
++#endif
+ 	ALT_UP(mcr	p15, 0, r0, c8, c7, 1)	@ TLB invalidate U MVA
+ 	add	r0, r0, #PAGE_SZ
+ 	cmp	r0, r1
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0050-ARM-Fix-undefined-instruction-exception-handling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0050-ARM-Fix-undefined-instruction-exception-handling.patch
new file mode 100644
index 0000000..0b98409
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0050-ARM-Fix-undefined-instruction-exception-handling.patch
@@ -0,0 +1,335 @@
+From 6b090d4fbcfaaa71f311f47019e622a794b0fca4 Mon Sep 17 00:00:00 2001
+From: Russell King <rmk+kernel@arm.linux.org.uk>
+Date: Mon, 30 Jul 2012 19:42:10 +0100
+Subject: [PATCH 50/70] ARM: Fix undefined instruction exception handling
+
+commit 15ac49b65024f55c4371a53214879a9c77c4fbf9 upstream.
+
+While trying to get a v3.5 kernel booted on the cubox, I noticed that
+VFP does not work correctly with VFP bounce handling.  This is because
+of the confusion over 16-bit vs 32-bit instructions, and where PC is
+supposed to point to.
+
+The rule is that FP handlers are entered with regs->ARM_pc pointing at
+the _next_ instruction to be executed.  However, if the exception is
+not handled, regs->ARM_pc points at the faulting instruction.
+
+This is easy for ARM mode, because we know that the next instruction and
+previous instructions are separated by four bytes.  This is not true of
+Thumb2 though.
+
+Since all FP instructions are 32-bit in Thumb2, it makes things easy.
+We just need to select the appropriate adjustment.  Do this by moving
+the adjustment out of do_undefinstr() into the assembly code, as only
+the assembly code knows whether it's dealing with a 32-bit or 16-bit
+instruction.
+
+Acked-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/kernel/entry-armv.S |  111 +++++++++++++++++++++++++++---------------
+ arch/arm/kernel/traps.c      |    8 ---
+ arch/arm/vfp/entry.S         |   16 +++---
+ arch/arm/vfp/vfphw.S         |   19 ++++---
+ 4 files changed, 92 insertions(+), 62 deletions(-)
+
+diff --git a/arch/arm/kernel/entry-armv.S b/arch/arm/kernel/entry-armv.S
+index 3a456c6..bc084a1 100644
+--- a/arch/arm/kernel/entry-armv.S
++++ b/arch/arm/kernel/entry-armv.S
+@@ -241,6 +241,19 @@ svc_preempt:
+ 	b	1b
+ #endif
+ 
++__und_fault:
++	@ Correct the PC such that it is pointing at the instruction
++	@ which caused the fault.  If the faulting instruction was ARM
++	@ the PC will be pointing at the next instruction, and have to
++	@ subtract 4.  Otherwise, it is Thumb, and the PC will be
++	@ pointing at the second half of the Thumb instruction.  We
++	@ have to subtract 2.
++	ldr	r2, [r0, #S_PC]
++	sub	r2, r2, r1
++	str	r2, [r0, #S_PC]
++	b	do_undefinstr
++ENDPROC(__und_fault)
++
+ 	.align	5
+ __und_svc:
+ #ifdef CONFIG_KPROBES
+@@ -258,25 +271,32 @@ __und_svc:
+ 	@
+ 	@  r0 - instruction
+ 	@
+-#ifndef	CONFIG_THUMB2_KERNEL
++#ifndef CONFIG_THUMB2_KERNEL
+ 	ldr	r0, [r4, #-4]
+ #else
++	mov	r1, #2
+ 	ldrh	r0, [r4, #-2]			@ Thumb instruction at LR - 2
+ 	cmp	r0, #0xe800			@ 32-bit instruction if xx >= 0
+-	ldrhhs	r9, [r4]			@ bottom 16 bits
+-	orrhs	r0, r9, r0, lsl #16
++	blo	__und_svc_fault
++	ldrh	r9, [r4]			@ bottom 16 bits
++	add	r4, r4, #2
++	str	r4, [sp, #S_PC]
++	orr	r0, r9, r0, lsl #16
+ #endif
+-	adr	r9, BSYM(1f)
++	adr	r9, BSYM(__und_svc_finish)
+ 	mov	r2, r4
+ 	bl	call_fpe
+ 
++	mov	r1, #4				@ PC correction to apply
++__und_svc_fault:
+ 	mov	r0, sp				@ struct pt_regs *regs
+-	bl	do_undefinstr
++	bl	__und_fault
+ 
+ 	@
+ 	@ IRQs off again before pulling preserved data off the stack
+ 	@
+-1:	disable_irq_notrace
++__und_svc_finish:
++	disable_irq_notrace
+ 
+ 	@
+ 	@ restore SPSR and restart the instruction
+@@ -420,25 +440,33 @@ __und_usr:
+ 	mov	r2, r4
+ 	mov	r3, r5
+ 
++	@ r2 = regs->ARM_pc, which is either 2 or 4 bytes ahead of the
++	@      faulting instruction depending on Thumb mode.
++	@ r3 = regs->ARM_cpsr
+ 	@
+-	@ fall through to the emulation code, which returns using r9 if
+-	@ it has emulated the instruction, or the more conventional lr
+-	@ if we are to treat this as a real undefined instruction
+-	@
+-	@  r0 - instruction
++	@ The emulation code returns using r9 if it has emulated the
++	@ instruction, or the more conventional lr if we are to treat
++	@ this as a real undefined instruction
+ 	@
+ 	adr	r9, BSYM(ret_from_exception)
+-	adr	lr, BSYM(__und_usr_unknown)
++
+ 	tst	r3, #PSR_T_BIT			@ Thumb mode?
+-	itet	eq				@ explicit IT needed for the 1f label
+-	subeq	r4, r2, #4			@ ARM instr at LR - 4
+-	subne	r4, r2, #2			@ Thumb instr at LR - 2
+-1:	ldreqt	r0, [r4]
++	bne	__und_usr_thumb
++	sub	r4, r2, #4			@ ARM instr at LR - 4
++1:	ldrt	r0, [r4]
+ #ifdef CONFIG_CPU_ENDIAN_BE8
+-	reveq	r0, r0				@ little endian instruction
++	rev	r0, r0				@ little endian instruction
+ #endif
+-	beq	call_fpe
++	@ r0 = 32-bit ARM instruction which caused the exception
++	@ r2 = PC value for the following instruction (:= regs->ARM_pc)
++	@ r4 = PC value for the faulting instruction
++	@ lr = 32-bit undefined instruction function
++	adr	lr, BSYM(__und_usr_fault_32)
++	b	call_fpe
++
++__und_usr_thumb:
+ 	@ Thumb instruction
++	sub	r4, r2, #2			@ First half of thumb instr at LR - 2
+ #if CONFIG_ARM_THUMB && __LINUX_ARM_ARCH__ >= 6 && CONFIG_CPU_V7
+ /*
+  * Thumb-2 instruction handling.  Note that because pre-v6 and >= v6 platforms
+@@ -452,7 +480,7 @@ __und_usr:
+ 	ldr	r5, .LCcpu_architecture
+ 	ldr	r5, [r5]
+ 	cmp	r5, #CPU_ARCH_ARMv7
+-	blo	__und_usr_unknown
++	blo	__und_usr_fault_16		@ 16bit undefined instruction
+ /*
+  * The following code won't get run unless the running CPU really is v7, so
+  * coding round the lack of ldrht on older arches is pointless.  Temporarily
+@@ -460,15 +488,18 @@ __und_usr:
+  */
+ 	.arch	armv6t2
+ #endif
+-2:
+- ARM(	ldrht	r5, [r4], #2	)
+- THUMB(	ldrht	r5, [r4]	)
+- THUMB(	add	r4, r4, #2	)
++2:	ldrht	r5, [r4]
+ 	cmp	r5, #0xe800			@ 32bit instruction if xx != 0
+-	blo	__und_usr_unknown
+-3:	ldrht	r0, [r4]
++	blo	__und_usr_fault_16		@ 16bit undefined instruction
++3:	ldrht	r0, [r2]
+ 	add	r2, r2, #2			@ r2 is PC + 2, make it PC + 4
++	str	r2, [sp, #S_PC]			@ it's a 2x16bit instr, update
+ 	orr	r0, r0, r5, lsl #16
++	adr	lr, BSYM(__und_usr_fault_32)
++	@ r0 = the two 16-bit Thumb instructions which caused the exception
++	@ r2 = PC value for the following Thumb instruction (:= regs->ARM_pc)
++	@ r4 = PC value for the first 16-bit Thumb instruction
++	@ lr = 32bit undefined instruction function
+ 
+ #if __LINUX_ARM_ARCH__ < 7
+ /* If the target arch was overridden, change it back: */
+@@ -479,17 +510,13 @@ __und_usr:
+ #endif
+ #endif /* __LINUX_ARM_ARCH__ < 7 */
+ #else /* !(CONFIG_ARM_THUMB && __LINUX_ARM_ARCH__ >= 6 && CONFIG_CPU_V7) */
+-	b	__und_usr_unknown
++	b	__und_usr_fault_16
+ #endif
+- UNWIND(.fnend		)
++ UNWIND(.fnend)
+ ENDPROC(__und_usr)
+ 
+-	@
+-	@ fallthrough to call_fpe
+-	@
+-
+ /*
+- * The out of line fixup for the ldrt above.
++ * The out of line fixup for the ldrt instructions above.
+  */
+ 	.pushsection .fixup, "ax"
+ 4:	mov	pc, r9
+@@ -520,11 +547,12 @@ ENDPROC(__und_usr)
+  * NEON handler code.
+  *
+  * Emulators may wish to make use of the following registers:
+- *  r0  = instruction opcode.
+- *  r2  = PC+4
++ *  r0  = instruction opcode (32-bit ARM or two 16-bit Thumb)
++ *  r2  = PC value to resume execution after successful emulation
+  *  r9  = normal "successful" return address
+- *  r10 = this threads thread_info structure.
++ *  r10 = this threads thread_info structure
+  *  lr  = unrecognised instruction return address
++ * IRQs disabled, FIQs enabled.
+  */
+ 	@
+ 	@ Fall-through from Thumb-2 __und_usr
+@@ -659,12 +687,17 @@ ENTRY(no_fp)
+ 	mov	pc, lr
+ ENDPROC(no_fp)
+ 
+-__und_usr_unknown:
+-	enable_irq
++__und_usr_fault_32:
++	mov	r1, #4
++	b	1f
++__und_usr_fault_16:
++	mov	r1, #2
++1:	enable_irq
+ 	mov	r0, sp
+ 	adr	lr, BSYM(ret_from_exception)
+-	b	do_undefinstr
+-ENDPROC(__und_usr_unknown)
++	b	__und_fault
++ENDPROC(__und_usr_fault_32)
++ENDPROC(__und_usr_fault_16)
+ 
+ 	.align	5
+ __pabt_usr:
+diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
+index 160cb16..8380bd1 100644
+--- a/arch/arm/kernel/traps.c
++++ b/arch/arm/kernel/traps.c
+@@ -362,18 +362,10 @@ static int call_undef_hook(struct pt_regs *regs, unsigned int instr)
+ 
+ asmlinkage void __exception do_undefinstr(struct pt_regs *regs)
+ {
+-	unsigned int correction = thumb_mode(regs) ? 2 : 4;
+ 	unsigned int instr;
+ 	siginfo_t info;
+ 	void __user *pc;
+ 
+-	/*
+-	 * According to the ARM ARM, PC is 2 or 4 bytes ahead,
+-	 * depending whether we're in Thumb mode or not.
+-	 * Correct this offset.
+-	 */
+-	regs->ARM_pc -= correction;
+-
+ 	pc = (void __user *)instruction_pointer(regs);
+ 
+ 	if (processor_mode(regs) == SVC_MODE) {
+diff --git a/arch/arm/vfp/entry.S b/arch/arm/vfp/entry.S
+index 4fa9903..cc926c9 100644
+--- a/arch/arm/vfp/entry.S
++++ b/arch/arm/vfp/entry.S
+@@ -7,18 +7,20 @@
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License version 2 as
+  * published by the Free Software Foundation.
+- *
+- * Basic entry code, called from the kernel's undefined instruction trap.
+- *  r0  = faulted instruction
+- *  r5  = faulted PC+4
+- *  r9  = successful return
+- *  r10 = thread_info structure
+- *  lr  = failure return
+  */
+ #include <asm/thread_info.h>
+ #include <asm/vfpmacros.h>
+ #include "../kernel/entry-header.S"
+ 
++@ VFP entry point.
++@
++@  r0  = instruction opcode (32-bit ARM or two 16-bit Thumb)
++@  r2  = PC value to resume execution after successful emulation
++@  r9  = normal "successful" return address
++@  r10 = this threads thread_info structure
++@  lr  = unrecognised instruction return address
++@  IRQs disabled.
++@
+ ENTRY(do_vfp)
+ #ifdef CONFIG_PREEMPT
+ 	ldr	r4, [r10, #TI_PREEMPT]	@ get preempt count
+diff --git a/arch/arm/vfp/vfphw.S b/arch/arm/vfp/vfphw.S
+index 2d30c7f..3a0efaa 100644
+--- a/arch/arm/vfp/vfphw.S
++++ b/arch/arm/vfp/vfphw.S
+@@ -61,13 +61,13 @@
+ 
+ @ VFP hardware support entry point.
+ @
+-@  r0  = faulted instruction
+-@  r2  = faulted PC+4
+-@  r9  = successful return
++@  r0  = instruction opcode (32-bit ARM or two 16-bit Thumb)
++@  r2  = PC value to resume execution after successful emulation
++@  r9  = normal "successful" return address
+ @  r10 = vfp_state union
+ @  r11 = CPU number
+-@  lr  = failure return
+-
++@  lr  = unrecognised instruction return address
++@  IRQs enabled.
+ ENTRY(vfp_support_entry)
+ 	DBGSTR3	"instr %08x pc %08x state %p", r0, r2, r10
+ 
+@@ -161,9 +161,12 @@ vfp_hw_state_valid:
+ 					@ exception before retrying branch
+ 					@ out before setting an FPEXC that
+ 					@ stops us reading stuff
+-	VFPFMXR	FPEXC, r1		@ restore FPEXC last
+-	sub	r2, r2, #4
+-	str	r2, [sp, #S_PC]		@ retry the instruction
++	VFPFMXR	FPEXC, r1		@ Restore FPEXC last
++	sub	r2, r2, #4		@ Retry current instruction - if Thumb
++	str	r2, [sp, #S_PC]		@ mode it's two 16-bit instructions,
++					@ else it's one 32-bit instruction, so
++					@ always subtract 4 from the following
++					@ instruction address.
+ #ifdef CONFIG_PREEMPT
+ 	get_thread_info	r10
+ 	ldr	r4, [r10, #TI_PREEMPT]	@ get preempt count
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0051-USB-echi-dbgp-increase-the-controller-wait-time-to-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0051-USB-echi-dbgp-increase-the-controller-wait-time-to-c.patch
new file mode 100644
index 0000000..39c9f4c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0051-USB-echi-dbgp-increase-the-controller-wait-time-to-c.patch
@@ -0,0 +1,38 @@
+From d8b93bb6a3ec7a8092ad0ea2a3fa78746aba6471 Mon Sep 17 00:00:00 2001
+From: Colin Ian King <colin.king@canonical.com>
+Date: Mon, 30 Jul 2012 16:06:42 +0100
+Subject: [PATCH 51/70] USB: echi-dbgp: increase the controller wait time to
+ come out of halt.
+
+commit f96a4216e85050c0a9d41a41ecb0ae9d8e39b509 upstream.
+
+The default 10 microsecond delay for the controller to come out of
+halt in dbgp_ehci_startup is too short, so increase it to 1 millisecond.
+
+This is based on emperical testing on various USB debug ports on
+modern machines such as a Lenovo X220i and an Ivybridge development
+platform that needed to wait ~450-950 microseconds.
+
+Signed-off-by: Colin Ian King <colin.king@canonical.com>
+Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/early/ehci-dbgp.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/early/ehci-dbgp.c b/drivers/usb/early/ehci-dbgp.c
+index 1fc8f12..347bb05 100644
+--- a/drivers/usb/early/ehci-dbgp.c
++++ b/drivers/usb/early/ehci-dbgp.c
+@@ -450,7 +450,7 @@ static int dbgp_ehci_startup(void)
+ 	writel(FLAG_CF, &ehci_regs->configured_flag);
+ 
+ 	/* Wait until the controller is no longer halted */
+-	loop = 10;
++	loop = 1000;
+ 	do {
+ 		status = readl(&ehci_regs->status);
+ 		if (!(status & STS_HALT))
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0052-ASoC-wm8962-Allow-VMID-time-to-fully-ramp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0052-ASoC-wm8962-Allow-VMID-time-to-fully-ramp.patch
new file mode 100644
index 0000000..b9c1a03
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0052-ASoC-wm8962-Allow-VMID-time-to-fully-ramp.patch
@@ -0,0 +1,32 @@
+From 83c2f7e55e6b8ecd96bf3222c8176824c643d562 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Mon, 30 Jul 2012 18:24:19 +0100
+Subject: [PATCH 52/70] ASoC: wm8962: Allow VMID time to fully ramp
+
+commit 9d40e5582c9c4cfb6977ba2a0ca9c2ed82c56f21 upstream.
+
+Required for reliable power up from cold.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/soc/codecs/wm8962.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
+index 07dd7eb..e97df24 100644
+--- a/sound/soc/codecs/wm8962.c
++++ b/sound/soc/codecs/wm8962.c
+@@ -3105,6 +3105,9 @@ static int wm8962_set_bias_level(struct snd_soc_codec *codec,
+ 		/* VMID 2*250k */
+ 		snd_soc_update_bits(codec, WM8962_PWR_MGMT_1,
+ 				    WM8962_VMID_SEL_MASK, 0x100);
++
++		if (codec->dapm.bias_level == SND_SOC_BIAS_OFF)
++			msleep(100);
+ 		break;
+ 
+ 	case SND_SOC_BIAS_OFF:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0053-mm-page_alloc.c-remove-pageblock_default_order.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0053-mm-page_alloc.c-remove-pageblock_default_order.patch
new file mode 100644
index 0000000..0143cbd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0053-mm-page_alloc.c-remove-pageblock_default_order.patch
@@ -0,0 +1,98 @@
+From 9159bdebda7f6210dfe791c22f4a1f6c04826b0d Mon Sep 17 00:00:00 2001
+From: Andrew Morton <akpm@linux-foundation.org>
+Date: Tue, 29 May 2012 15:06:31 -0700
+Subject: [PATCH 53/70] mm/page_alloc.c: remove pageblock_default_order()
+
+commit 955c1cd7401565671b064e499115344ec8067dfd upstream.
+
+This has always been broken: one version takes an unsigned int and the
+other version takes no arguments.  This bug was hidden because one
+version of set_pageblock_order() was a macro which doesn't evaluate its
+argument.
+
+Simplify it all and remove pageblock_default_order() altogether.
+
+Reported-by: rajman mekaco <rajman.mekaco@gmail.com>
+Cc: Mel Gorman <mel@csn.ul.ie>
+Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Tejun Heo <tj@kernel.org>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/page_alloc.c |   33 +++++++++++++++------------------
+ 1 files changed, 15 insertions(+), 18 deletions(-)
+
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index 065dbe8..63a4e1d 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -4281,25 +4281,24 @@ static inline void setup_usemap(struct pglist_data *pgdat,
+ 
+ #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
+ 
+-/* Return a sensible default order for the pageblock size. */
+-static inline int pageblock_default_order(void)
+-{
+-	if (HPAGE_SHIFT > PAGE_SHIFT)
+-		return HUGETLB_PAGE_ORDER;
+-
+-	return MAX_ORDER-1;
+-}
+-
+ /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
+-static inline void __init set_pageblock_order(unsigned int order)
++static inline void __init set_pageblock_order(void)
+ {
++	unsigned int order;
++
+ 	/* Check that pageblock_nr_pages has not already been setup */
+ 	if (pageblock_order)
+ 		return;
+ 
++	if (HPAGE_SHIFT > PAGE_SHIFT)
++		order = HUGETLB_PAGE_ORDER;
++	else
++		order = MAX_ORDER - 1;
++
+ 	/*
+ 	 * Assume the largest contiguous order of interest is a huge page.
+-	 * This value may be variable depending on boot parameters on IA64
++	 * This value may be variable depending on boot parameters on IA64 and
++	 * powerpc.
+ 	 */
+ 	pageblock_order = order;
+ }
+@@ -4307,15 +4306,13 @@ static inline void __init set_pageblock_order(unsigned int order)
+ 
+ /*
+  * When CONFIG_HUGETLB_PAGE_SIZE_VARIABLE is not set, set_pageblock_order()
+- * and pageblock_default_order() are unused as pageblock_order is set
+- * at compile-time. See include/linux/pageblock-flags.h for the values of
+- * pageblock_order based on the kernel config
++ * is unused as pageblock_order is set at compile-time. See
++ * include/linux/pageblock-flags.h for the values of pageblock_order based on
++ * the kernel config
+  */
+-static inline int pageblock_default_order(unsigned int order)
++static inline void set_pageblock_order(void)
+ {
+-	return MAX_ORDER-1;
+ }
+-#define set_pageblock_order(x)	do {} while (0)
+ 
+ #endif /* CONFIG_HUGETLB_PAGE_SIZE_VARIABLE */
+ 
+@@ -4403,7 +4400,7 @@ static void __paginginit free_area_init_core(struct pglist_data *pgdat,
+ 		if (!size)
+ 			continue;
+ 
+-		set_pageblock_order(pageblock_default_order());
++		set_pageblock_order();
+ 		setup_usemap(pgdat, zone, size);
+ 		ret = init_currently_empty_zone(zone, zone_start_pfn,
+ 						size, MEMMAP_EARLY);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0054-mm-setup-pageblock_order-before-it-s-used-by-sparsem.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0054-mm-setup-pageblock_order-before-it-s-used-by-sparsem.patch
new file mode 100644
index 0000000..540cd1c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0054-mm-setup-pageblock_order-before-it-s-used-by-sparsem.patch
@@ -0,0 +1,101 @@
+From 4cf34c29c3362f55fe4ca807f2b01984c36fe1b2 Mon Sep 17 00:00:00 2001
+From: Xishi Qiu <qiuxishi@huawei.com>
+Date: Tue, 31 Jul 2012 16:43:19 -0700
+Subject: [PATCH 54/70] mm: setup pageblock_order before it's used by
+ sparsemem
+
+commit ca57df79d4f64e1a4886606af4289d40636189c5 upstream.
+
+On architectures with CONFIG_HUGETLB_PAGE_SIZE_VARIABLE set, such as
+Itanium, pageblock_order is a variable with default value of 0.  It's set
+to the right value by set_pageblock_order() in function
+free_area_init_core().
+
+But pageblock_order may be used by sparse_init() before free_area_init_core()
+is called along path:
+sparse_init()
+    ->sparse_early_usemaps_alloc_node()
+	->usemap_size()
+	    ->SECTION_BLOCKFLAGS_BITS
+		->((1UL << (PFN_SECTION_SHIFT - pageblock_order)) *
+NR_PAGEBLOCK_BITS)
+
+The uninitialized pageblock_size will cause memory wasting because
+usemap_size() returns a much bigger value then it's really needed.
+
+For example, on an Itanium platform,
+sparse_init() pageblock_order=0 usemap_size=24576
+free_area_init_core() before pageblock_order=0, usemap_size=24576
+free_area_init_core() after pageblock_order=12, usemap_size=8
+
+That means 24K memory has been wasted for each section, so fix it by calling
+set_pageblock_order() from sparse_init().
+
+Signed-off-by: Xishi Qiu <qiuxishi@huawei.com>
+Signed-off-by: Jiang Liu <liuj97@gmail.com>
+Cc: Tony Luck <tony.luck@intel.com>
+Cc: Yinghai Lu <yinghai@kernel.org>
+Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
+Cc: David Rientjes <rientjes@google.com>
+Cc: Keping Chen <chenkeping@huawei.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/internal.h   |    2 ++
+ mm/page_alloc.c |    4 ++--
+ mm/sparse.c     |    3 +++
+ 3 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/mm/internal.h b/mm/internal.h
+index 2189af4..0c26b5e 100644
+--- a/mm/internal.h
++++ b/mm/internal.h
+@@ -309,3 +309,5 @@ extern u64 hwpoison_filter_flags_mask;
+ extern u64 hwpoison_filter_flags_value;
+ extern u64 hwpoison_filter_memcg;
+ extern u32 hwpoison_filter_enable;
++
++extern void set_pageblock_order(void);
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index 63a4e1d..6e51bf0 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -4282,7 +4282,7 @@ static inline void setup_usemap(struct pglist_data *pgdat,
+ #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
+ 
+ /* Initialise the number of pages represented by NR_PAGEBLOCK_BITS */
+-static inline void __init set_pageblock_order(void)
++void __init set_pageblock_order(void)
+ {
+ 	unsigned int order;
+ 
+@@ -4310,7 +4310,7 @@ static inline void __init set_pageblock_order(void)
+  * include/linux/pageblock-flags.h for the values of pageblock_order based on
+  * the kernel config
+  */
+-static inline void set_pageblock_order(void)
++void __init set_pageblock_order(void)
+ {
+ }
+ 
+diff --git a/mm/sparse.c b/mm/sparse.c
+index a8bc7d3..bf7d3cc 100644
+--- a/mm/sparse.c
++++ b/mm/sparse.c
+@@ -486,6 +486,9 @@ void __init sparse_init(void)
+ 	struct page **map_map;
+ #endif
+ 
++	/* Setup pageblock_order for HUGETLB_PAGE_SIZE_VARIABLE */
++	set_pageblock_order();
++
+ 	/*
+ 	 * map is using big page (aka 2M in x86 64 bit)
+ 	 * usemap is less one page (aka 24 bytes)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0055-mm-mmu_notifier-fix-freed-page-still-mapped-in-secon.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0055-mm-mmu_notifier-fix-freed-page-still-mapped-in-secon.patch
new file mode 100644
index 0000000..78c9f97
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0055-mm-mmu_notifier-fix-freed-page-still-mapped-in-secon.patch
@@ -0,0 +1,137 @@
+From 4bc62f55f275bd09fa00023c52414a4c08784919 Mon Sep 17 00:00:00 2001
+From: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
+Date: Tue, 31 Jul 2012 16:45:52 -0700
+Subject: [PATCH 55/70] mm: mmu_notifier: fix freed page still mapped in
+ secondary MMU
+
+commit 3ad3d901bbcfb15a5e4690e55350db0899095a68 upstream.
+
+mmu_notifier_release() is called when the process is exiting.  It will
+delete all the mmu notifiers.  But at this time the page belonging to the
+process is still present in page tables and is present on the LRU list, so
+this race will happen:
+
+      CPU 0                 CPU 1
+mmu_notifier_release:    try_to_unmap:
+   hlist_del_init_rcu(&mn->hlist);
+                            ptep_clear_flush_notify:
+                                  mmu nofifler not found
+                            free page  !!!!!!
+                            /*
+                             * At the point, the page has been
+                             * freed, but it is still mapped in
+                             * the secondary MMU.
+                             */
+
+  mn->ops->release(mn, mm);
+
+Then the box is not stable and sometimes we can get this bug:
+
+[  738.075923] BUG: Bad page state in process migrate-perf  pfn:03bec
+[  738.075931] page:ffffea00000efb00 count:0 mapcount:0 mapping:          (null) index:0x8076
+[  738.075936] page flags: 0x20000000000014(referenced|dirty)
+
+The same issue is present in mmu_notifier_unregister().
+
+We can call ->release before deleting the notifier to ensure the page has
+been unmapped from the secondary MMU before it is freed.
+
+Signed-off-by: Xiao Guangrong <xiaoguangrong@linux.vnet.ibm.com>
+Cc: Avi Kivity <avi@redhat.com>
+Cc: Marcelo Tosatti <mtosatti@redhat.com>
+Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/mmu_notifier.c |   45 +++++++++++++++++++++++----------------------
+ 1 files changed, 23 insertions(+), 22 deletions(-)
+
+diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
+index 9a611d3..862b608 100644
+--- a/mm/mmu_notifier.c
++++ b/mm/mmu_notifier.c
+@@ -33,6 +33,24 @@
+ void __mmu_notifier_release(struct mm_struct *mm)
+ {
+ 	struct mmu_notifier *mn;
++	struct hlist_node *n;
++
++	/*
++	 * RCU here will block mmu_notifier_unregister until
++	 * ->release returns.
++	 */
++	rcu_read_lock();
++	hlist_for_each_entry_rcu(mn, n, &mm->mmu_notifier_mm->list, hlist)
++		/*
++		 * if ->release runs before mmu_notifier_unregister it
++		 * must be handled as it's the only way for the driver
++		 * to flush all existing sptes and stop the driver
++		 * from establishing any more sptes before all the
++		 * pages in the mm are freed.
++		 */
++		if (mn->ops->release)
++			mn->ops->release(mn, mm);
++	rcu_read_unlock();
+ 
+ 	spin_lock(&mm->mmu_notifier_mm->lock);
+ 	while (unlikely(!hlist_empty(&mm->mmu_notifier_mm->list))) {
+@@ -46,23 +64,6 @@ void __mmu_notifier_release(struct mm_struct *mm)
+ 		 * mmu_notifier_unregister to return.
+ 		 */
+ 		hlist_del_init_rcu(&mn->hlist);
+-		/*
+-		 * RCU here will block mmu_notifier_unregister until
+-		 * ->release returns.
+-		 */
+-		rcu_read_lock();
+-		spin_unlock(&mm->mmu_notifier_mm->lock);
+-		/*
+-		 * if ->release runs before mmu_notifier_unregister it
+-		 * must be handled as it's the only way for the driver
+-		 * to flush all existing sptes and stop the driver
+-		 * from establishing any more sptes before all the
+-		 * pages in the mm are freed.
+-		 */
+-		if (mn->ops->release)
+-			mn->ops->release(mn, mm);
+-		rcu_read_unlock();
+-		spin_lock(&mm->mmu_notifier_mm->lock);
+ 	}
+ 	spin_unlock(&mm->mmu_notifier_mm->lock);
+ 
+@@ -284,16 +285,13 @@ void mmu_notifier_unregister(struct mmu_notifier *mn, struct mm_struct *mm)
+ {
+ 	BUG_ON(atomic_read(&mm->mm_count) <= 0);
+ 
+-	spin_lock(&mm->mmu_notifier_mm->lock);
+ 	if (!hlist_unhashed(&mn->hlist)) {
+-		hlist_del_rcu(&mn->hlist);
+-
+ 		/*
+ 		 * RCU here will force exit_mmap to wait ->release to finish
+ 		 * before freeing the pages.
+ 		 */
+ 		rcu_read_lock();
+-		spin_unlock(&mm->mmu_notifier_mm->lock);
++
+ 		/*
+ 		 * exit_mmap will block in mmu_notifier_release to
+ 		 * guarantee ->release is called before freeing the
+@@ -302,8 +300,11 @@ void mmu_notifier_unregister(struct mmu_notifier *mn, struct mm_struct *mm)
+ 		if (mn->ops->release)
+ 			mn->ops->release(mn, mm);
+ 		rcu_read_unlock();
+-	} else
++
++		spin_lock(&mm->mmu_notifier_mm->lock);
++		hlist_del_rcu(&mn->hlist);
+ 		spin_unlock(&mm->mmu_notifier_mm->lock);
++	}
+ 
+ 	/*
+ 	 * Wait any running method to finish, of course including
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0056-mm-hugetlbfs-close-race-during-teardown-of-hugetlbfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0056-mm-hugetlbfs-close-race-during-teardown-of-hugetlbfs.patch
new file mode 100644
index 0000000..653bd0c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0056-mm-hugetlbfs-close-race-during-teardown-of-hugetlbfs.patch
@@ -0,0 +1,340 @@
+From 677941da036e27de0418fa601b49f8c8c6ccf594 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Tue, 31 Jul 2012 16:46:20 -0700
+Subject: [PATCH 56/70] mm: hugetlbfs: close race during teardown of hugetlbfs
+ shared page tables
+
+commit d833352a4338dc31295ed832a30c9ccff5c7a183 upstream.
+
+If a process creates a large hugetlbfs mapping that is eligible for page
+table sharing and forks heavily with children some of whom fault and
+others which destroy the mapping then it is possible for page tables to
+get corrupted.  Some teardowns of the mapping encounter a "bad pmd" and
+output a message to the kernel log.  The final teardown will trigger a
+BUG_ON in mm/filemap.c.
+
+This was reproduced in 3.4 but is known to have existed for a long time
+and goes back at least as far as 2.6.37.  It was probably was introduced
+in 2.6.20 by [39dde65c: shared page table for hugetlb page].  The messages
+look like this;
+
+[  ..........] Lots of bad pmd messages followed by this
+[  127.164256] mm/memory.c:391: bad pmd ffff880412e04fe8(80000003de4000e7).
+[  127.164257] mm/memory.c:391: bad pmd ffff880412e04ff0(80000003de6000e7).
+[  127.164258] mm/memory.c:391: bad pmd ffff880412e04ff8(80000003de0000e7).
+[  127.186778] ------------[ cut here ]------------
+[  127.186781] kernel BUG at mm/filemap.c:134!
+[  127.186782] invalid opcode: 0000 [#1] SMP
+[  127.186783] CPU 7
+[  127.186784] Modules linked in: af_packet cpufreq_conservative cpufreq_userspace cpufreq_powersave acpi_cpufreq mperf ext3 jbd dm_mod coretemp crc32c_intel usb_storage ghash_clmulni_intel aesni_intel i2c_i801 r8169 mii uas sr_mod cdrom sg iTCO_wdt iTCO_vendor_support shpchp serio_raw cryptd aes_x86_64 e1000e pci_hotplug dcdbas aes_generic container microcode ext4 mbcache jbd2 crc16 sd_mod crc_t10dif i915 drm_kms_helper drm i2c_algo_bit ehci_hcd ahci libahci usbcore rtc_cmos usb_common button i2c_core intel_agp video intel_gtt fan processor thermal thermal_sys hwmon ata_generic pata_atiixp libata scsi_mod
+[  127.186801]
+[  127.186802] Pid: 9017, comm: hugetlbfs-test Not tainted 3.4.0-autobuild #53 Dell Inc. OptiPlex 990/06D7TR
+[  127.186804] RIP: 0010:[<ffffffff810ed6ce>]  [<ffffffff810ed6ce>] __delete_from_page_cache+0x15e/0x160
+[  127.186809] RSP: 0000:ffff8804144b5c08  EFLAGS: 00010002
+[  127.186810] RAX: 0000000000000001 RBX: ffffea000a5c9000 RCX: 00000000ffffffc0
+[  127.186811] RDX: 0000000000000000 RSI: 0000000000000009 RDI: ffff88042dfdad00
+[  127.186812] RBP: ffff8804144b5c18 R08: 0000000000000009 R09: 0000000000000003
+[  127.186813] R10: 0000000000000000 R11: 000000000000002d R12: ffff880412ff83d8
+[  127.186814] R13: ffff880412ff83d8 R14: 0000000000000000 R15: ffff880412ff83d8
+[  127.186815] FS:  00007fe18ed2c700(0000) GS:ffff88042dce0000(0000) knlGS:0000000000000000
+[  127.186816] CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
+[  127.186817] CR2: 00007fe340000503 CR3: 0000000417a14000 CR4: 00000000000407e0
+[  127.186818] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
+[  127.186819] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
+[  127.186820] Process hugetlbfs-test (pid: 9017, threadinfo ffff8804144b4000, task ffff880417f803c0)
+[  127.186821] Stack:
+[  127.186822]  ffffea000a5c9000 0000000000000000 ffff8804144b5c48 ffffffff810ed83b
+[  127.186824]  ffff8804144b5c48 000000000000138a 0000000000001387 ffff8804144b5c98
+[  127.186825]  ffff8804144b5d48 ffffffff811bc925 ffff8804144b5cb8 0000000000000000
+[  127.186827] Call Trace:
+[  127.186829]  [<ffffffff810ed83b>] delete_from_page_cache+0x3b/0x80
+[  127.186832]  [<ffffffff811bc925>] truncate_hugepages+0x115/0x220
+[  127.186834]  [<ffffffff811bca43>] hugetlbfs_evict_inode+0x13/0x30
+[  127.186837]  [<ffffffff811655c7>] evict+0xa7/0x1b0
+[  127.186839]  [<ffffffff811657a3>] iput_final+0xd3/0x1f0
+[  127.186840]  [<ffffffff811658f9>] iput+0x39/0x50
+[  127.186842]  [<ffffffff81162708>] d_kill+0xf8/0x130
+[  127.186843]  [<ffffffff81162812>] dput+0xd2/0x1a0
+[  127.186845]  [<ffffffff8114e2d0>] __fput+0x170/0x230
+[  127.186848]  [<ffffffff81236e0e>] ? rb_erase+0xce/0x150
+[  127.186849]  [<ffffffff8114e3ad>] fput+0x1d/0x30
+[  127.186851]  [<ffffffff81117db7>] remove_vma+0x37/0x80
+[  127.186853]  [<ffffffff81119182>] do_munmap+0x2d2/0x360
+[  127.186855]  [<ffffffff811cc639>] sys_shmdt+0xc9/0x170
+[  127.186857]  [<ffffffff81410a39>] system_call_fastpath+0x16/0x1b
+[  127.186858] Code: 0f 1f 44 00 00 48 8b 43 08 48 8b 00 48 8b 40 28 8b b0 40 03 00 00 85 f6 0f 88 df fe ff ff 48 89 df e8 e7 cb 05 00 e9 d2 fe ff ff <0f> 0b 55 83 e2 fd 48 89 e5 48 83 ec 30 48 89 5d d8 4c 89 65 e0
+[  127.186868] RIP  [<ffffffff810ed6ce>] __delete_from_page_cache+0x15e/0x160
+[  127.186870]  RSP <ffff8804144b5c08>
+[  127.186871] ---[ end trace 7cbac5d1db69f426 ]---
+
+The bug is a race and not always easy to reproduce.  To reproduce it I was
+doing the following on a single socket I7-based machine with 16G of RAM.
+
+$ hugeadm --pool-pages-max DEFAULT:13G
+$ echo $((18*1048576*1024)) > /proc/sys/kernel/shmmax
+$ echo $((18*1048576*1024)) > /proc/sys/kernel/shmall
+$ for i in `seq 1 9000`; do ./hugetlbfs-test; done
+
+On my particular machine, it usually triggers within 10 minutes but
+enabling debug options can change the timing such that it never hits.
+Once the bug is triggered, the machine is in trouble and needs to be
+rebooted.  The machine will respond but processes accessing proc like "ps
+aux" will hang due to the BUG_ON.  shutdown will also hang and needs a
+hard reset or a sysrq-b.
+
+The basic problem is a race between page table sharing and teardown.  For
+the most part page table sharing depends on i_mmap_mutex.  In some cases,
+it is also taking the mm->page_table_lock for the PTE updates but with
+shared page tables, it is the i_mmap_mutex that is more important.
+
+Unfortunately it appears to be also insufficient. Consider the following
+situation
+
+Process A					Process B
+---------					---------
+hugetlb_fault					shmdt
+  						LockWrite(mmap_sem)
+    						  do_munmap
+						    unmap_region
+						      unmap_vmas
+						        unmap_single_vma
+						          unmap_hugepage_range
+      						            Lock(i_mmap_mutex)
+							    Lock(mm->page_table_lock)
+							    huge_pmd_unshare/unmap tables <--- (1)
+							    Unlock(mm->page_table_lock)
+      						            Unlock(i_mmap_mutex)
+  huge_pte_alloc				      ...
+    Lock(i_mmap_mutex)				      ...
+    vma_prio_walk, find svma, spte		      ...
+    Lock(mm->page_table_lock)			      ...
+    share spte					      ...
+    Unlock(mm->page_table_lock)			      ...
+    Unlock(i_mmap_mutex)			      ...
+  hugetlb_no_page									  <--- (2)
+						      free_pgtables
+						        unlink_file_vma
+							hugetlb_free_pgd_range
+						    remove_vma_list
+
+In this scenario, it is possible for Process A to share page tables with
+Process B that is trying to tear them down.  The i_mmap_mutex on its own
+does not prevent Process A walking Process B's page tables.  At (1) above,
+the page tables are not shared yet so it unmaps the PMDs.  Process A sets
+up page table sharing and at (2) faults a new entry.  Process B then trips
+up on it in free_pgtables.
+
+This patch fixes the problem by adding a new function
+__unmap_hugepage_range_final that is only called when the VMA is about to
+be destroyed.  This function clears VM_MAYSHARE during
+unmap_hugepage_range() under the i_mmap_mutex.  This makes the VMA
+ineligible for sharing and avoids the race.  Superficially this looks like
+it would then be vunerable to truncate and madvise issues but hugetlbfs
+has its own truncate handlers so does not use unmap_mapping_range() and
+does not support madvise(DONTNEED).
+
+This should be treated as a -stable candidate if it is merged.
+
+Test program is as follows. The test case was mostly written by Michal
+Hocko with a few minor changes to reproduce this bug.
+
+==== CUT HERE ====
+
+static size_t huge_page_size = (2UL << 20);
+static size_t nr_huge_page_A = 512;
+static size_t nr_huge_page_B = 5632;
+
+unsigned int get_random(unsigned int max)
+{
+	struct timeval tv;
+
+	gettimeofday(&tv, NULL);
+	srandom(tv.tv_usec);
+	return random() % max;
+}
+
+static void play(void *addr, size_t size)
+{
+	unsigned char *start = addr,
+		      *end = start + size,
+		      *a;
+	start += get_random(size/2);
+
+	/* we could itterate on huge pages but let's give it more time. */
+	for (a = start; a < end; a += 4096)
+		*a = 0;
+}
+
+int main(int argc, char **argv)
+{
+	key_t key = IPC_PRIVATE;
+	size_t sizeA = nr_huge_page_A * huge_page_size;
+	size_t sizeB = nr_huge_page_B * huge_page_size;
+	int shmidA, shmidB;
+	void *addrA = NULL, *addrB = NULL;
+	int nr_children = 300, n = 0;
+
+	if ((shmidA = shmget(key, sizeA, IPC_CREAT|SHM_HUGETLB|0660)) == -1) {
+		perror("shmget:");
+		return 1;
+	}
+
+	if ((addrA = shmat(shmidA, addrA, SHM_R|SHM_W)) == (void *)-1UL) {
+		perror("shmat");
+		return 1;
+	}
+	if ((shmidB = shmget(key, sizeB, IPC_CREAT|SHM_HUGETLB|0660)) == -1) {
+		perror("shmget:");
+		return 1;
+	}
+
+	if ((addrB = shmat(shmidB, addrB, SHM_R|SHM_W)) == (void *)-1UL) {
+		perror("shmat");
+		return 1;
+	}
+
+fork_child:
+	switch(fork()) {
+		case 0:
+			switch (n%3) {
+			case 0:
+				play(addrA, sizeA);
+				break;
+			case 1:
+				play(addrB, sizeB);
+				break;
+			case 2:
+				break;
+			}
+			break;
+		case -1:
+			perror("fork:");
+			break;
+		default:
+			if (++n < nr_children)
+				goto fork_child;
+			play(addrA, sizeA);
+			break;
+	}
+	shmdt(addrA);
+	shmdt(addrB);
+	do {
+		wait(NULL);
+	} while (--n > 0);
+	shmctl(shmidA, IPC_RMID, NULL);
+	shmctl(shmidB, IPC_RMID, NULL);
+	return 0;
+}
+
+[akpm@linux-foundation.org: name the declaration's args, fix CONFIG_HUGETLBFS=n build]
+Signed-off-by: Hugh Dickins <hughd@google.com>
+Reviewed-by: Michal Hocko <mhocko@suse.cz>
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+[bwh: Backported to 3.2:
+ - Adjust context
+ - Drop the mmu_gather * parameters]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/hugetlb.h |   10 ++++++++++
+ mm/hugetlb.c            |   28 ++++++++++++++++++++++++++--
+ mm/memory.c             |    7 +++++--
+ 3 files changed, 41 insertions(+), 4 deletions(-)
+
+diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
+index c5ed2f1..a2227f7 100644
+--- a/include/linux/hugetlb.h
++++ b/include/linux/hugetlb.h
+@@ -41,6 +41,9 @@ int follow_hugetlb_page(struct mm_struct *, struct vm_area_struct *,
+ 			unsigned long *, int *, int, unsigned int flags);
+ void unmap_hugepage_range(struct vm_area_struct *,
+ 			unsigned long, unsigned long, struct page *);
++void __unmap_hugepage_range_final(struct vm_area_struct *vma,
++			  unsigned long start, unsigned long end,
++			  struct page *ref_page);
+ void __unmap_hugepage_range(struct vm_area_struct *,
+ 			unsigned long, unsigned long, struct page *);
+ int hugetlb_prefault(struct address_space *, struct vm_area_struct *);
+@@ -99,6 +102,13 @@ static inline unsigned long hugetlb_total_pages(void)
+ #define copy_hugetlb_page_range(src, dst, vma)	({ BUG(); 0; })
+ #define hugetlb_prefault(mapping, vma)		({ BUG(); 0; })
+ #define unmap_hugepage_range(vma, start, end, page)	BUG()
++static inline void __unmap_hugepage_range_final(struct vm_area_struct *vma,
++			unsigned long start, unsigned long end,
++			struct page *ref_page)
++{
++	BUG();
++}
++
+ static inline void hugetlb_report_meminfo(struct seq_file *m)
+ {
+ }
+diff --git a/mm/hugetlb.c b/mm/hugetlb.c
+index b1e1bad..0f897b8 100644
+--- a/mm/hugetlb.c
++++ b/mm/hugetlb.c
+@@ -2382,6 +2382,25 @@ void __unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
+ 	}
+ }
+ 
++void __unmap_hugepage_range_final(struct vm_area_struct *vma,
++			  unsigned long start, unsigned long end,
++			  struct page *ref_page)
++{
++	__unmap_hugepage_range(vma, start, end, ref_page);
++
++	/*
++	 * Clear this flag so that x86's huge_pmd_share page_table_shareable
++	 * test will fail on a vma being torn down, and not grab a page table
++	 * on its way out.  We're lucky that the flag has such an appropriate
++	 * name, and can in fact be safely cleared here. We could clear it
++	 * before the __unmap_hugepage_range above, but all that's necessary
++	 * is to clear it before releasing the i_mmap_mutex. This works
++	 * because in the context this is called, the VMA is about to be
++	 * destroyed and the i_mmap_mutex is held.
++	 */
++	vma->vm_flags &= ~VM_MAYSHARE;
++}
++
+ void unmap_hugepage_range(struct vm_area_struct *vma, unsigned long start,
+ 			  unsigned long end, struct page *ref_page)
+ {
+@@ -2939,9 +2958,14 @@ void hugetlb_change_protection(struct vm_area_struct *vma,
+ 		}
+ 	}
+ 	spin_unlock(&mm->page_table_lock);
+-	mutex_unlock(&vma->vm_file->f_mapping->i_mmap_mutex);
+-
++	/*
++	 * Must flush TLB before releasing i_mmap_mutex: x86's huge_pmd_unshare
++	 * may have cleared our pud entry and done put_page on the page table:
++	 * once we release i_mmap_mutex, another task can do the final put_page
++	 * and that page table be reused and filled with junk.
++	 */
+ 	flush_tlb_range(vma, start, end);
++	mutex_unlock(&vma->vm_file->f_mapping->i_mmap_mutex);
+ }
+ 
+ int hugetlb_reserve_pages(struct inode *inode,
+diff --git a/mm/memory.c b/mm/memory.c
+index 1b1ca17..70f5daf 100644
+--- a/mm/memory.c
++++ b/mm/memory.c
+@@ -1358,8 +1358,11 @@ unsigned long unmap_vmas(struct mmu_gather *tlb,
+ 				 * Since no pte has actually been setup, it is
+ 				 * safe to do nothing in this case.
+ 				 */
+-				if (vma->vm_file)
+-					unmap_hugepage_range(vma, start, end, NULL);
++				if (vma->vm_file) {
++					mutex_lock(&vma->vm_file->f_mapping->i_mmap_mutex);
++					__unmap_hugepage_range_final(vma, start, end, NULL);
++					mutex_unlock(&vma->vm_file->f_mapping->i_mmap_mutex);
++				}
+ 
+ 				start = end;
+ 			} else
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0057-ALSA-snd-usb-fix-clock-source-validity-index.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0057-ALSA-snd-usb-fix-clock-source-validity-index.patch
new file mode 100644
index 0000000..007e393
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0057-ALSA-snd-usb-fix-clock-source-validity-index.patch
@@ -0,0 +1,40 @@
+From 25ad0cb4cfe9597474d8cda839d5adedc9412201 Mon Sep 17 00:00:00 2001
+From: Daniel Mack <zonque@gmail.com>
+Date: Wed, 1 Aug 2012 10:16:53 +0200
+Subject: [PATCH 57/70] ALSA: snd-usb: fix clock source validity index
+
+commit aff252a848ce21b431ba822de3dab9c4c94571cb upstream.
+
+uac_clock_source_is_valid() uses the control selector value to access
+the bmControls bitmap of the clock source unit. This is wrong, as
+control selector values start from 1, while the bitmap uses all
+available bits.
+
+In other words, "Clock Validity Control" is stored in D3..2, not D5..4
+of the clock selector unit's bmControls.
+
+Signed-off-by: Daniel Mack <zonque@gmail.com>
+Reported-by: Andreas Koch <andreas@akdesigninc.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/usb/clock.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/sound/usb/clock.c b/sound/usb/clock.c
+index 379baad..5e634a2 100644
+--- a/sound/usb/clock.c
++++ b/sound/usb/clock.c
+@@ -111,7 +111,8 @@ static bool uac_clock_source_is_valid(struct snd_usb_audio *chip, int source_id)
+ 		return 0;
+ 
+ 	/* If a clock source can't tell us whether it's valid, we assume it is */
+-	if (!uac2_control_is_readable(cs_desc->bmControls, UAC2_CS_CONTROL_CLOCK_VALID))
++	if (!uac2_control_is_readable(cs_desc->bmControls,
++				      UAC2_CS_CONTROL_CLOCK_VALID - 1))
+ 		return 1;
+ 
+ 	err = snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0), UAC2_CS_CUR,
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0058-ALSA-hda-Support-dock-on-Lenovo-Thinkpad-T530-with-A.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0058-ALSA-hda-Support-dock-on-Lenovo-Thinkpad-T530-with-A.patch
new file mode 100644
index 0000000..9ffbd4c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0058-ALSA-hda-Support-dock-on-Lenovo-Thinkpad-T530-with-A.patch
@@ -0,0 +1,34 @@
+From 49cbaa1b1111f838004b74390214575cc82ae5ff Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Thu, 2 Aug 2012 09:04:39 +0200
+Subject: [PATCH 58/70] ALSA: hda - Support dock on Lenovo Thinkpad T530 with
+ ALC269VC
+
+commit 707fba3fa76a4c8855552f5d4c1a12430c09bce8 upstream.
+
+Lenovo Thinkpad T530 with ALC269VC codec has a dock port but BIOS
+doesn't set up the pins properly.  Enable the pins as well as on
+Thinkpad X230 Tablet.
+
+Reported-and-tested-by: Mario <anyc@hadiko.de>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_realtek.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 6ae58b2..2e2eb93 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -5076,6 +5076,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x17aa, 0x21b8, "Thinkpad Edge 14", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21ca, "Thinkpad L412", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21e9, "Thinkpad Edge 15", ALC269_FIXUP_SKU_IGNORE),
++	SND_PCI_QUIRK(0x17aa, 0x21f6, "Thinkpad T530", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x2203, "Thinkpad X230 Tablet", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_QUANTA_MUTE),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Lenovo Ideapd", ALC269_FIXUP_PCM_44K),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0059-ore-Fix-out-of-bounds-access-in-_ios_obj.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0059-ore-Fix-out-of-bounds-access-in-_ios_obj.patch
new file mode 100644
index 0000000..42b27e5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0059-ore-Fix-out-of-bounds-access-in-_ios_obj.patch
@@ -0,0 +1,75 @@
+From e9c69241e1b7a169690d8b16393d712d7613706d Mon Sep 17 00:00:00 2001
+From: Boaz Harrosh <bharrosh@panasas.com>
+Date: Wed, 1 Aug 2012 17:48:36 +0300
+Subject: [PATCH 59/70] ore: Fix out-of-bounds access in _ios_obj()
+
+commit 9e62bb4458ad2cf28bd701aa5fab380b846db326 upstream.
+
+_ios_obj() is accessed by group_index not device_table index.
+
+The oc->comps array is only a group_full of devices at a time
+it is not like ore_comp_dev() which is indexed by a global
+device_table index.
+
+This did not BUG until now because exofs only uses a single
+COMP for all devices. But with other FSs like PanFS this is
+not true.
+
+This bug was only in the write_path, all other users were
+using it correctly
+
+[This is a bug since 3.2 Kernel]
+
+Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/exofs/ore.c |   14 +++++++-------
+ 1 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/fs/exofs/ore.c b/fs/exofs/ore.c
+index 24a49d4..1585db1 100644
+--- a/fs/exofs/ore.c
++++ b/fs/exofs/ore.c
+@@ -837,11 +837,11 @@ static int _write_mirror(struct ore_io_state *ios, int cur_comp)
+ 				bio->bi_rw |= REQ_WRITE;
+ 			}
+ 
+-			osd_req_write(or, _ios_obj(ios, dev), per_dev->offset,
+-				      bio, per_dev->length);
++			osd_req_write(or, _ios_obj(ios, cur_comp),
++				      per_dev->offset, bio, per_dev->length);
+ 			ORE_DBGMSG("write(0x%llx) offset=0x%llx "
+ 				      "length=0x%llx dev=%d\n",
+-				     _LLU(_ios_obj(ios, dev)->id),
++				     _LLU(_ios_obj(ios, cur_comp)->id),
+ 				     _LLU(per_dev->offset),
+ 				     _LLU(per_dev->length), dev);
+ 		} else if (ios->kern_buff) {
+@@ -853,20 +853,20 @@ static int _write_mirror(struct ore_io_state *ios, int cur_comp)
+ 			       (ios->si.unit_off + ios->length >
+ 				ios->layout->stripe_unit));
+ 
+-			ret = osd_req_write_kern(or, _ios_obj(ios, per_dev->dev),
++			ret = osd_req_write_kern(or, _ios_obj(ios, cur_comp),
+ 						 per_dev->offset,
+ 						 ios->kern_buff, ios->length);
+ 			if (unlikely(ret))
+ 				goto out;
+ 			ORE_DBGMSG2("write_kern(0x%llx) offset=0x%llx "
+ 				      "length=0x%llx dev=%d\n",
+-				     _LLU(_ios_obj(ios, dev)->id),
++				     _LLU(_ios_obj(ios, cur_comp)->id),
+ 				     _LLU(per_dev->offset),
+ 				     _LLU(ios->length), per_dev->dev);
+ 		} else {
+-			osd_req_set_attributes(or, _ios_obj(ios, dev));
++			osd_req_set_attributes(or, _ios_obj(ios, cur_comp));
+ 			ORE_DBGMSG2("obj(0x%llx) set_attributes=%d dev=%d\n",
+-				     _LLU(_ios_obj(ios, dev)->id),
++				     _LLU(_ios_obj(ios, cur_comp)->id),
+ 				     ios->out_attr_len, dev);
+ 		}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0060-m68k-Make-sys_atomic_cmpxchg_32-work-on-classic-m68k.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0060-m68k-Make-sys_atomic_cmpxchg_32-work-on-classic-m68k.patch
new file mode 100644
index 0000000..b955501
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0060-m68k-Make-sys_atomic_cmpxchg_32-work-on-classic-m68k.patch
@@ -0,0 +1,41 @@
+From 83e7a3bd925b3f8886f4a116a3d6581c89fcb87e Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Sat, 28 Jul 2012 00:20:34 +0200
+Subject: [PATCH 60/70] m68k: Make sys_atomic_cmpxchg_32 work on classic m68k
+
+commit 9e2760d18b3cf179534bbc27692c84879c61b97c upstream.
+
+User space access must always go through uaccess accessors, since on
+classic m68k user space and kernel space are completely separate.
+
+Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
+Tested-by: Thorsten Glaser <tg@debian.org>
+Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/m68k/kernel/sys_m68k.c |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/arch/m68k/kernel/sys_m68k.c b/arch/m68k/kernel/sys_m68k.c
+index 8623f8d..9a5932e 100644
+--- a/arch/m68k/kernel/sys_m68k.c
++++ b/arch/m68k/kernel/sys_m68k.c
+@@ -479,9 +479,13 @@ sys_atomic_cmpxchg_32(unsigned long newval, int oldval, int d3, int d4, int d5,
+ 			goto bad_access;
+ 		}
+ 
+-		mem_value = *mem;
++		/*
++		 * No need to check for EFAULT; we know that the page is
++		 * present and writable.
++		 */
++		__get_user(mem_value, mem);
+ 		if (mem_value == oldval)
+-			*mem = newval;
++			__put_user(newval, mem);
+ 
+ 		pte_unmap_unlock(pte, ptl);
+ 		up_read(&mm->mmap_sem);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0061-drm-i915-prefer-wide-slow-to-fast-narrow-in-DP-confi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0061-drm-i915-prefer-wide-slow-to-fast-narrow-in-DP-confi.patch
new file mode 100644
index 0000000..5d55fb5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0061-drm-i915-prefer-wide-slow-to-fast-narrow-in-DP-confi.patch
@@ -0,0 +1,41 @@
+From dc2062a19f602bfb44928a95bdeb21165a17e27c Mon Sep 17 00:00:00 2001
+From: Jesse Barnes <jbarnes@virtuousgeek.org>
+Date: Thu, 21 Jun 2012 15:13:50 -0700
+Subject: [PATCH 61/70] drm/i915: prefer wide & slow to fast & narrow in DP
+ configs
+
+commit 2514bc510d0c3aadcc5204056bb440fa36845147 upstream.
+
+High frequency link configurations have the potential to cause trouble
+with long and/or cheap cables, so prefer slow and wide configurations
+instead.  This patch has the potential to cause trouble for eDP
+configurations that lie about available lanes, so if we run into that we
+can make it conditional on eDP.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=45801
+Tested-by: peter@colberg.org
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_dp.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
+index d4c4937..fae2050 100644
+--- a/drivers/gpu/drm/i915/intel_dp.c
++++ b/drivers/gpu/drm/i915/intel_dp.c
+@@ -708,8 +708,8 @@ intel_dp_mode_fixup(struct drm_encoder *encoder, struct drm_display_mode *mode,
+ 
+ 	bpp = adjusted_mode->private_flags & INTEL_MODE_DP_FORCE_6BPC ? 18 : 24;
+ 
+-	for (lane_count = 1; lane_count <= max_lane_count; lane_count <<= 1) {
+-		for (clock = 0; clock <= max_clock; clock++) {
++	for (clock = 0; clock <= max_clock; clock++) {
++		for (lane_count = 1; lane_count <= max_lane_count; lane_count <<= 1) {
+ 			int link_avail = intel_dp_max_data_rate(intel_dp_link_clock(bws[clock]), lane_count);
+ 
+ 			if (intel_dp_link_required(mode->clock, bpp)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0062-rt2x00-Add-support-for-BUFFALO-WLI-UC-GNM2-to-rt2800.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0062-rt2x00-Add-support-for-BUFFALO-WLI-UC-GNM2-to-rt2800.patch
new file mode 100644
index 0000000..a55d013
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0062-rt2x00-Add-support-for-BUFFALO-WLI-UC-GNM2-to-rt2800.patch
@@ -0,0 +1,32 @@
+From 1daebd9ade24166c1212e0dc8383a54558c77476 Mon Sep 17 00:00:00 2001
+From: Jeongdo Son <sohn9086@gmail.com>
+Date: Fri, 15 Jun 2012 02:28:01 +0900
+Subject: [PATCH 62/70] rt2x00: Add support for BUFFALO WLI-UC-GNM2 to
+ rt2800usb.
+
+commit a769f9577232afe2c754606a83aad85127e7052a upstream.
+
+This is a RT3070 based device.
+
+Signed-off-by: Jeongdo Son <sohn9086@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rt2x00/rt2800usb.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2800usb.c b/drivers/net/wireless/rt2x00/rt2800usb.c
+index bdf960b..ae7528b 100644
+--- a/drivers/net/wireless/rt2x00/rt2800usb.c
++++ b/drivers/net/wireless/rt2x00/rt2800usb.c
+@@ -925,6 +925,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x0411, 0x015d) },
+ 	{ USB_DEVICE(0x0411, 0x016f) },
+ 	{ USB_DEVICE(0x0411, 0x01a2) },
++	{ USB_DEVICE(0x0411, 0x01ee) },
+ 	/* Corega */
+ 	{ USB_DEVICE(0x07aa, 0x002f) },
+ 	{ USB_DEVICE(0x07aa, 0x003c) },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0063-drop_monitor-fix-sleeping-in-invalid-context-warning.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0063-drop_monitor-fix-sleeping-in-invalid-context-warning.patch
new file mode 100644
index 0000000..66b0cf5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0063-drop_monitor-fix-sleeping-in-invalid-context-warning.patch
@@ -0,0 +1,115 @@
+From f525976c33830cfe23b1a73eb9ae853820c5c085 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Fri, 27 Apr 2012 10:11:48 +0000
+Subject: [PATCH 63/70] drop_monitor: fix sleeping in invalid context warning
+
+commit cde2e9a651b76d8db36ae94cd0febc82b637e5dd upstream.
+
+Eric Dumazet pointed out this warning in the drop_monitor protocol to me:
+
+[   38.352571] BUG: sleeping function called from invalid context at kernel/mutex.c:85
+[   38.352576] in_atomic(): 1, irqs_disabled(): 0, pid: 4415, name: dropwatch
+[   38.352580] Pid: 4415, comm: dropwatch Not tainted 3.4.0-rc2+ #71
+[   38.352582] Call Trace:
+[   38.352592]  [<ffffffff8153aaf0>] ? trace_napi_poll_hit+0xd0/0xd0
+[   38.352599]  [<ffffffff81063f2a>] __might_sleep+0xca/0xf0
+[   38.352606]  [<ffffffff81655b16>] mutex_lock+0x26/0x50
+[   38.352610]  [<ffffffff8153aaf0>] ? trace_napi_poll_hit+0xd0/0xd0
+[   38.352616]  [<ffffffff810b72d9>] tracepoint_probe_register+0x29/0x90
+[   38.352621]  [<ffffffff8153a585>] set_all_monitor_traces+0x105/0x170
+[   38.352625]  [<ffffffff8153a8ca>] net_dm_cmd_trace+0x2a/0x40
+[   38.352630]  [<ffffffff8154a81a>] genl_rcv_msg+0x21a/0x2b0
+[   38.352636]  [<ffffffff810f8029>] ? zone_statistics+0x99/0xc0
+[   38.352640]  [<ffffffff8154a600>] ? genl_rcv+0x30/0x30
+[   38.352645]  [<ffffffff8154a059>] netlink_rcv_skb+0xa9/0xd0
+[   38.352649]  [<ffffffff8154a5f0>] genl_rcv+0x20/0x30
+[   38.352653]  [<ffffffff81549a7e>] netlink_unicast+0x1ae/0x1f0
+[   38.352658]  [<ffffffff81549d76>] netlink_sendmsg+0x2b6/0x310
+[   38.352663]  [<ffffffff8150824f>] sock_sendmsg+0x10f/0x130
+[   38.352668]  [<ffffffff8150abe0>] ? move_addr_to_kernel+0x60/0xb0
+[   38.352673]  [<ffffffff81515f04>] ? verify_iovec+0x64/0xe0
+[   38.352677]  [<ffffffff81509c46>] __sys_sendmsg+0x386/0x390
+[   38.352682]  [<ffffffff810ffaf9>] ? handle_mm_fault+0x139/0x210
+[   38.352687]  [<ffffffff8165b5bc>] ? do_page_fault+0x1ec/0x4f0
+[   38.352693]  [<ffffffff8106ba4d>] ? set_next_entity+0x9d/0xb0
+[   38.352699]  [<ffffffff81310b49>] ? tty_ldisc_deref+0x9/0x10
+[   38.352703]  [<ffffffff8106d363>] ? pick_next_task_fair+0x63/0x140
+[   38.352708]  [<ffffffff8150b8d4>] sys_sendmsg+0x44/0x80
+[   38.352713]  [<ffffffff8165f8e2>] system_call_fastpath+0x16/0x1b
+
+It stems from holding a spinlock (trace_state_lock) while attempting to register
+or unregister tracepoint hooks, making in_atomic() true in this context, leading
+to the warning when the tracepoint calls might_sleep() while its taking a mutex.
+Since we only use the trace_state_lock to prevent trace protocol state races, as
+well as hardware stat list updates on an rcu write side, we can just convert the
+spinlock to a mutex to avoid this problem.
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Reported-by: Eric Dumazet <eric.dumazet@gmail.com>
+CC: David Miller <davem@davemloft.net>
+Acked-by: Eric Dumazet <edumazet@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/drop_monitor.c |   14 +++++++-------
+ 1 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
+index 7f36b38..f74d7d7 100644
+--- a/net/core/drop_monitor.c
++++ b/net/core/drop_monitor.c
+@@ -42,7 +42,7 @@ static void send_dm_alert(struct work_struct *unused);
+  * netlink alerts
+  */
+ static int trace_state = TRACE_OFF;
+-static DEFINE_SPINLOCK(trace_state_lock);
++static DEFINE_MUTEX(trace_state_mutex);
+ 
+ struct per_cpu_dm_data {
+ 	struct work_struct dm_alert_work;
+@@ -213,7 +213,7 @@ static int set_all_monitor_traces(int state)
+ 	struct dm_hw_stat_delta *new_stat = NULL;
+ 	struct dm_hw_stat_delta *temp;
+ 
+-	spin_lock(&trace_state_lock);
++	mutex_lock(&trace_state_mutex);
+ 
+ 	if (state == trace_state) {
+ 		rc = -EAGAIN;
+@@ -252,7 +252,7 @@ static int set_all_monitor_traces(int state)
+ 		rc = -EINPROGRESS;
+ 
+ out_unlock:
+-	spin_unlock(&trace_state_lock);
++	mutex_unlock(&trace_state_mutex);
+ 
+ 	return rc;
+ }
+@@ -295,12 +295,12 @@ static int dropmon_net_event(struct notifier_block *ev_block,
+ 
+ 		new_stat->dev = dev;
+ 		new_stat->last_rx = jiffies;
+-		spin_lock(&trace_state_lock);
++		mutex_lock(&trace_state_mutex);
+ 		list_add_rcu(&new_stat->list, &hw_stats_list);
+-		spin_unlock(&trace_state_lock);
++		mutex_unlock(&trace_state_mutex);
+ 		break;
+ 	case NETDEV_UNREGISTER:
+-		spin_lock(&trace_state_lock);
++		mutex_lock(&trace_state_mutex);
+ 		list_for_each_entry_safe(new_stat, tmp, &hw_stats_list, list) {
+ 			if (new_stat->dev == dev) {
+ 				new_stat->dev = NULL;
+@@ -311,7 +311,7 @@ static int dropmon_net_event(struct notifier_block *ev_block,
+ 				}
+ 			}
+ 		}
+-		spin_unlock(&trace_state_lock);
++		mutex_unlock(&trace_state_mutex);
+ 		break;
+ 	}
+ out:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0064-drop_monitor-Make-updating-data-skb-smp-safe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0064-drop_monitor-Make-updating-data-skb-smp-safe.patch
new file mode 100644
index 0000000..437f06c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0064-drop_monitor-Make-updating-data-skb-smp-safe.patch
@@ -0,0 +1,187 @@
+From 89f73073f155006eaacd5709739fb83e07f3caa8 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Fri, 27 Apr 2012 10:11:49 +0000
+Subject: [PATCH 64/70] drop_monitor: Make updating data->skb smp safe
+
+commit 3885ca785a3618593226687ced84f3f336dc3860 upstream.
+
+Eric Dumazet pointed out to me that the drop_monitor protocol has some holes in
+its smp protections.  Specifically, its possible to replace data->skb while its
+being written.  This patch corrects that by making data->skb an rcu protected
+variable.  That will prevent it from being overwritten while a tracepoint is
+modifying it.
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Reported-by: Eric Dumazet <eric.dumazet@gmail.com>
+CC: David Miller <davem@davemloft.net>
+Acked-by: Eric Dumazet <edumazet@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/drop_monitor.c |   70 ++++++++++++++++++++++++++++++++++++-----------
+ 1 files changed, 54 insertions(+), 16 deletions(-)
+
+diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
+index f74d7d7..d75cbfc 100644
+--- a/net/core/drop_monitor.c
++++ b/net/core/drop_monitor.c
+@@ -46,7 +46,7 @@ static DEFINE_MUTEX(trace_state_mutex);
+ 
+ struct per_cpu_dm_data {
+ 	struct work_struct dm_alert_work;
+-	struct sk_buff *skb;
++	struct sk_buff __rcu *skb;
+ 	atomic_t dm_hit_count;
+ 	struct timer_list send_timer;
+ };
+@@ -73,35 +73,58 @@ static int dm_hit_limit = 64;
+ static int dm_delay = 1;
+ static unsigned long dm_hw_check_delta = 2*HZ;
+ static LIST_HEAD(hw_stats_list);
++static int initialized = 0;
+ 
+ static void reset_per_cpu_data(struct per_cpu_dm_data *data)
+ {
+ 	size_t al;
+ 	struct net_dm_alert_msg *msg;
+ 	struct nlattr *nla;
++	struct sk_buff *skb;
++	struct sk_buff *oskb = rcu_dereference_protected(data->skb, 1);
+ 
+ 	al = sizeof(struct net_dm_alert_msg);
+ 	al += dm_hit_limit * sizeof(struct net_dm_drop_point);
+ 	al += sizeof(struct nlattr);
+ 
+-	data->skb = genlmsg_new(al, GFP_KERNEL);
+-	genlmsg_put(data->skb, 0, 0, &net_drop_monitor_family,
+-			0, NET_DM_CMD_ALERT);
+-	nla = nla_reserve(data->skb, NLA_UNSPEC, sizeof(struct net_dm_alert_msg));
+-	msg = nla_data(nla);
+-	memset(msg, 0, al);
+-	atomic_set(&data->dm_hit_count, dm_hit_limit);
++	skb = genlmsg_new(al, GFP_KERNEL);
++
++	if (skb) {
++		genlmsg_put(skb, 0, 0, &net_drop_monitor_family,
++				0, NET_DM_CMD_ALERT);
++		nla = nla_reserve(skb, NLA_UNSPEC,
++				  sizeof(struct net_dm_alert_msg));
++		msg = nla_data(nla);
++		memset(msg, 0, al);
++	} else if (initialized)
++		schedule_work_on(smp_processor_id(), &data->dm_alert_work);
++
++	/*
++	 * Don't need to lock this, since we are guaranteed to only
++	 * run this on a single cpu at a time.
++	 * Note also that we only update data->skb if the old and new skb
++	 * pointers don't match.  This ensures that we don't continually call
++	 * synchornize_rcu if we repeatedly fail to alloc a new netlink message.
++	 */
++	if (skb != oskb) {
++		rcu_assign_pointer(data->skb, skb);
++
++		synchronize_rcu();
++
++		atomic_set(&data->dm_hit_count, dm_hit_limit);
++	}
++
+ }
+ 
+ static void send_dm_alert(struct work_struct *unused)
+ {
+ 	struct sk_buff *skb;
+-	struct per_cpu_dm_data *data = &__get_cpu_var(dm_cpu_data);
++	struct per_cpu_dm_data *data = &get_cpu_var(dm_cpu_data);
+ 
+ 	/*
+ 	 * Grab the skb we're about to send
+ 	 */
+-	skb = data->skb;
++	skb = rcu_dereference_protected(data->skb, 1);
+ 
+ 	/*
+ 	 * Replace it with a new one
+@@ -111,8 +134,10 @@ static void send_dm_alert(struct work_struct *unused)
+ 	/*
+ 	 * Ship it!
+ 	 */
+-	genlmsg_multicast(skb, 0, NET_DM_GRP_ALERT, GFP_KERNEL);
++	if (skb)
++		genlmsg_multicast(skb, 0, NET_DM_GRP_ALERT, GFP_KERNEL);
+ 
++	put_cpu_var(dm_cpu_data);
+ }
+ 
+ /*
+@@ -123,9 +148,11 @@ static void send_dm_alert(struct work_struct *unused)
+  */
+ static void sched_send_work(unsigned long unused)
+ {
+-	struct per_cpu_dm_data *data =  &__get_cpu_var(dm_cpu_data);
++	struct per_cpu_dm_data *data =  &get_cpu_var(dm_cpu_data);
++
++	schedule_work_on(smp_processor_id(), &data->dm_alert_work);
+ 
+-	schedule_work(&data->dm_alert_work);
++	put_cpu_var(dm_cpu_data);
+ }
+ 
+ static void trace_drop_common(struct sk_buff *skb, void *location)
+@@ -134,9 +161,16 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 	struct nlmsghdr *nlh;
+ 	struct nlattr *nla;
+ 	int i;
+-	struct per_cpu_dm_data *data = &__get_cpu_var(dm_cpu_data);
++	struct sk_buff *dskb;
++	struct per_cpu_dm_data *data = &get_cpu_var(dm_cpu_data);
+ 
+ 
++	rcu_read_lock();
++	dskb = rcu_dereference(data->skb);
++
++	if (!dskb)
++		goto out;
++
+ 	if (!atomic_add_unless(&data->dm_hit_count, -1, 0)) {
+ 		/*
+ 		 * we're already at zero, discard this hit
+@@ -144,7 +178,7 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 		goto out;
+ 	}
+ 
+-	nlh = (struct nlmsghdr *)data->skb->data;
++	nlh = (struct nlmsghdr *)dskb->data;
+ 	nla = genlmsg_data(nlmsg_data(nlh));
+ 	msg = nla_data(nla);
+ 	for (i = 0; i < msg->entries; i++) {
+@@ -157,7 +191,7 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 	/*
+ 	 * We need to create a new entry
+ 	 */
+-	__nla_reserve_nohdr(data->skb, sizeof(struct net_dm_drop_point));
++	__nla_reserve_nohdr(dskb, sizeof(struct net_dm_drop_point));
+ 	nla->nla_len += NLA_ALIGN(sizeof(struct net_dm_drop_point));
+ 	memcpy(msg->points[msg->entries].pc, &location, sizeof(void *));
+ 	msg->points[msg->entries].count = 1;
+@@ -169,6 +203,8 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 	}
+ 
+ out:
++	rcu_read_unlock();
++	put_cpu_var(dm_cpu_data);
+ 	return;
+ }
+ 
+@@ -374,6 +410,8 @@ static int __init init_net_drop_monitor(void)
+ 		data->send_timer.function = sched_send_work;
+ 	}
+ 
++	initialized = 1;
++
+ 	goto out;
+ 
+ out_unreg:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0065-drop_monitor-prevent-init-path-from-scheduling-on-th.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0065-drop_monitor-prevent-init-path-from-scheduling-on-th.patch
new file mode 100644
index 0000000..08c7a7c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0065-drop_monitor-prevent-init-path-from-scheduling-on-th.patch
@@ -0,0 +1,93 @@
+From e056f9e8a25db637798455e701c2a42f9cdeb5b8 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Tue, 1 May 2012 08:18:02 +0000
+Subject: [PATCH 65/70] drop_monitor: prevent init path from scheduling on the
+ wrong cpu
+
+commit 4fdcfa12843bca38d0c9deff70c8720e4e8f515f upstream.
+
+I just noticed after some recent updates, that the init path for the drop
+monitor protocol has a minor error.  drop monitor maintains a per cpu structure,
+that gets initalized from a single cpu.  Normally this is fine, as the protocol
+isn't in use yet, but I recently made a change that causes a failed skb
+allocation to reschedule itself .  Given the current code, the implication is
+that this workqueue reschedule will take place on the wrong cpu.  If drop
+monitor is used early during the boot process, its possible that two cpus will
+access a single per-cpu structure in parallel, possibly leading to data
+corruption.
+
+This patch fixes the situation, by storing the cpu number that a given instance
+of this per-cpu data should be accessed from.  In the case of a need for a
+reschedule, the cpu stored in the struct is assigned the rescheule, rather than
+the currently executing cpu
+
+Tested successfully by myself.
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+CC: David Miller <davem@davemloft.net>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/drop_monitor.c |   12 +++++++-----
+ 1 files changed, 7 insertions(+), 5 deletions(-)
+
+diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
+index d75cbfc..e836592 100644
+--- a/net/core/drop_monitor.c
++++ b/net/core/drop_monitor.c
+@@ -49,6 +49,7 @@ struct per_cpu_dm_data {
+ 	struct sk_buff __rcu *skb;
+ 	atomic_t dm_hit_count;
+ 	struct timer_list send_timer;
++	int cpu;
+ };
+ 
+ struct dm_hw_stat_delta {
+@@ -73,7 +74,6 @@ static int dm_hit_limit = 64;
+ static int dm_delay = 1;
+ static unsigned long dm_hw_check_delta = 2*HZ;
+ static LIST_HEAD(hw_stats_list);
+-static int initialized = 0;
+ 
+ static void reset_per_cpu_data(struct per_cpu_dm_data *data)
+ {
+@@ -96,8 +96,8 @@ static void reset_per_cpu_data(struct per_cpu_dm_data *data)
+ 				  sizeof(struct net_dm_alert_msg));
+ 		msg = nla_data(nla);
+ 		memset(msg, 0, al);
+-	} else if (initialized)
+-		schedule_work_on(smp_processor_id(), &data->dm_alert_work);
++	} else
++		schedule_work_on(data->cpu, &data->dm_alert_work);
+ 
+ 	/*
+ 	 * Don't need to lock this, since we are guaranteed to only
+@@ -121,6 +121,8 @@ static void send_dm_alert(struct work_struct *unused)
+ 	struct sk_buff *skb;
+ 	struct per_cpu_dm_data *data = &get_cpu_var(dm_cpu_data);
+ 
++	WARN_ON_ONCE(data->cpu != smp_processor_id());
++
+ 	/*
+ 	 * Grab the skb we're about to send
+ 	 */
+@@ -403,14 +405,14 @@ static int __init init_net_drop_monitor(void)
+ 
+ 	for_each_present_cpu(cpu) {
+ 		data = &per_cpu(dm_cpu_data, cpu);
+-		reset_per_cpu_data(data);
++		data->cpu = cpu;
+ 		INIT_WORK(&data->dm_alert_work, send_dm_alert);
+ 		init_timer(&data->send_timer);
+ 		data->send_timer.data = cpu;
+ 		data->send_timer.function = sched_send_work;
++		reset_per_cpu_data(data);
+ 	}
+ 
+-	initialized = 1;
+ 
+ 	goto out;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0066-drop_monitor-dont-sleep-in-atomic-context.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0066-drop_monitor-dont-sleep-in-atomic-context.patch
new file mode 100644
index 0000000..dff38d2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0066-drop_monitor-dont-sleep-in-atomic-context.patch
@@ -0,0 +1,244 @@
+From af61f8503b1c3a3d2e034a79abc0368ab3fd2aa4 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Mon, 4 Jun 2012 00:18:19 +0000
+Subject: [PATCH 66/70] drop_monitor: dont sleep in atomic context
+
+commit bec4596b4e6770c7037f21f6bd27567b152dc0d6 upstream.
+
+drop_monitor calls several sleeping functions while in atomic context.
+
+ BUG: sleeping function called from invalid context at mm/slub.c:943
+ in_atomic(): 1, irqs_disabled(): 0, pid: 2103, name: kworker/0:2
+ Pid: 2103, comm: kworker/0:2 Not tainted 3.5.0-rc1+ #55
+ Call Trace:
+  [<ffffffff810697ca>] __might_sleep+0xca/0xf0
+  [<ffffffff811345a3>] kmem_cache_alloc_node+0x1b3/0x1c0
+  [<ffffffff8105578c>] ? queue_delayed_work_on+0x11c/0x130
+  [<ffffffff815343fb>] __alloc_skb+0x4b/0x230
+  [<ffffffffa00b0360>] ? reset_per_cpu_data+0x160/0x160 [drop_monitor]
+  [<ffffffffa00b022f>] reset_per_cpu_data+0x2f/0x160 [drop_monitor]
+  [<ffffffffa00b03ab>] send_dm_alert+0x4b/0xb0 [drop_monitor]
+  [<ffffffff810568e0>] process_one_work+0x130/0x4c0
+  [<ffffffff81058249>] worker_thread+0x159/0x360
+  [<ffffffff810580f0>] ? manage_workers.isra.27+0x240/0x240
+  [<ffffffff8105d403>] kthread+0x93/0xa0
+  [<ffffffff816be6d4>] kernel_thread_helper+0x4/0x10
+  [<ffffffff8105d370>] ? kthread_freezable_should_stop+0x80/0x80
+  [<ffffffff816be6d0>] ? gs_change+0xb/0xb
+
+Rework the logic to call the sleeping functions in right context.
+
+Use standard timer/workqueue api to let system chose any cpu to perform
+the allocation and netlink send.
+
+Also avoid a loop if reset_per_cpu_data() cannot allocate memory :
+use mod_timer() to wait 1/10 second before next try.
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Cc: Neil Horman <nhorman@tuxdriver.com>
+Reviewed-by: Neil Horman <nhorman@tuxdriver.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/drop_monitor.c |  101 +++++++++++++++-------------------------------
+ 1 files changed, 33 insertions(+), 68 deletions(-)
+
+diff --git a/net/core/drop_monitor.c b/net/core/drop_monitor.c
+index e836592..b856f87 100644
+--- a/net/core/drop_monitor.c
++++ b/net/core/drop_monitor.c
+@@ -33,9 +33,6 @@
+ #define TRACE_ON 1
+ #define TRACE_OFF 0
+ 
+-static void send_dm_alert(struct work_struct *unused);
+-
+-
+ /*
+  * Globals, our netlink socket pointer
+  * and the work handle that will send up
+@@ -45,11 +42,10 @@ static int trace_state = TRACE_OFF;
+ static DEFINE_MUTEX(trace_state_mutex);
+ 
+ struct per_cpu_dm_data {
+-	struct work_struct dm_alert_work;
+-	struct sk_buff __rcu *skb;
+-	atomic_t dm_hit_count;
+-	struct timer_list send_timer;
+-	int cpu;
++	spinlock_t		lock;
++	struct sk_buff		*skb;
++	struct work_struct	dm_alert_work;
++	struct timer_list	send_timer;
+ };
+ 
+ struct dm_hw_stat_delta {
+@@ -75,13 +71,13 @@ static int dm_delay = 1;
+ static unsigned long dm_hw_check_delta = 2*HZ;
+ static LIST_HEAD(hw_stats_list);
+ 
+-static void reset_per_cpu_data(struct per_cpu_dm_data *data)
++static struct sk_buff *reset_per_cpu_data(struct per_cpu_dm_data *data)
+ {
+ 	size_t al;
+ 	struct net_dm_alert_msg *msg;
+ 	struct nlattr *nla;
+ 	struct sk_buff *skb;
+-	struct sk_buff *oskb = rcu_dereference_protected(data->skb, 1);
++	unsigned long flags;
+ 
+ 	al = sizeof(struct net_dm_alert_msg);
+ 	al += dm_hit_limit * sizeof(struct net_dm_drop_point);
+@@ -96,65 +92,40 @@ static void reset_per_cpu_data(struct per_cpu_dm_data *data)
+ 				  sizeof(struct net_dm_alert_msg));
+ 		msg = nla_data(nla);
+ 		memset(msg, 0, al);
+-	} else
+-		schedule_work_on(data->cpu, &data->dm_alert_work);
+-
+-	/*
+-	 * Don't need to lock this, since we are guaranteed to only
+-	 * run this on a single cpu at a time.
+-	 * Note also that we only update data->skb if the old and new skb
+-	 * pointers don't match.  This ensures that we don't continually call
+-	 * synchornize_rcu if we repeatedly fail to alloc a new netlink message.
+-	 */
+-	if (skb != oskb) {
+-		rcu_assign_pointer(data->skb, skb);
+-
+-		synchronize_rcu();
+-
+-		atomic_set(&data->dm_hit_count, dm_hit_limit);
++	} else {
++		mod_timer(&data->send_timer, jiffies + HZ / 10);
+ 	}
+ 
++	spin_lock_irqsave(&data->lock, flags);
++	swap(data->skb, skb);
++	spin_unlock_irqrestore(&data->lock, flags);
++
++	return skb;
+ }
+ 
+-static void send_dm_alert(struct work_struct *unused)
++static void send_dm_alert(struct work_struct *work)
+ {
+ 	struct sk_buff *skb;
+-	struct per_cpu_dm_data *data = &get_cpu_var(dm_cpu_data);
++	struct per_cpu_dm_data *data;
+ 
+-	WARN_ON_ONCE(data->cpu != smp_processor_id());
++	data = container_of(work, struct per_cpu_dm_data, dm_alert_work);
+ 
+-	/*
+-	 * Grab the skb we're about to send
+-	 */
+-	skb = rcu_dereference_protected(data->skb, 1);
++	skb = reset_per_cpu_data(data);
+ 
+-	/*
+-	 * Replace it with a new one
+-	 */
+-	reset_per_cpu_data(data);
+-
+-	/*
+-	 * Ship it!
+-	 */
+ 	if (skb)
+ 		genlmsg_multicast(skb, 0, NET_DM_GRP_ALERT, GFP_KERNEL);
+-
+-	put_cpu_var(dm_cpu_data);
+ }
+ 
+ /*
+  * This is the timer function to delay the sending of an alert
+  * in the event that more drops will arrive during the
+- * hysteresis period.  Note that it operates under the timer interrupt
+- * so we don't need to disable preemption here
++ * hysteresis period.
+  */
+-static void sched_send_work(unsigned long unused)
++static void sched_send_work(unsigned long _data)
+ {
+-	struct per_cpu_dm_data *data =  &get_cpu_var(dm_cpu_data);
++	struct per_cpu_dm_data *data = (struct per_cpu_dm_data *)_data;
+ 
+-	schedule_work_on(smp_processor_id(), &data->dm_alert_work);
+-
+-	put_cpu_var(dm_cpu_data);
++	schedule_work(&data->dm_alert_work);
+ }
+ 
+ static void trace_drop_common(struct sk_buff *skb, void *location)
+@@ -164,22 +135,17 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 	struct nlattr *nla;
+ 	int i;
+ 	struct sk_buff *dskb;
+-	struct per_cpu_dm_data *data = &get_cpu_var(dm_cpu_data);
+-
++	struct per_cpu_dm_data *data;
++	unsigned long flags;
+ 
+-	rcu_read_lock();
+-	dskb = rcu_dereference(data->skb);
++	local_irq_save(flags);
++	data = &__get_cpu_var(dm_cpu_data);
++	spin_lock(&data->lock);
++	dskb = data->skb;
+ 
+ 	if (!dskb)
+ 		goto out;
+ 
+-	if (!atomic_add_unless(&data->dm_hit_count, -1, 0)) {
+-		/*
+-		 * we're already at zero, discard this hit
+-		 */
+-		goto out;
+-	}
+-
+ 	nlh = (struct nlmsghdr *)dskb->data;
+ 	nla = genlmsg_data(nlmsg_data(nlh));
+ 	msg = nla_data(nla);
+@@ -189,7 +155,8 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 			goto out;
+ 		}
+ 	}
+-
++	if (msg->entries == dm_hit_limit)
++		goto out;
+ 	/*
+ 	 * We need to create a new entry
+ 	 */
+@@ -201,13 +168,11 @@ static void trace_drop_common(struct sk_buff *skb, void *location)
+ 
+ 	if (!timer_pending(&data->send_timer)) {
+ 		data->send_timer.expires = jiffies + dm_delay * HZ;
+-		add_timer_on(&data->send_timer, smp_processor_id());
++		add_timer(&data->send_timer);
+ 	}
+ 
+ out:
+-	rcu_read_unlock();
+-	put_cpu_var(dm_cpu_data);
+-	return;
++	spin_unlock_irqrestore(&data->lock, flags);
+ }
+ 
+ static void trace_kfree_skb_hit(void *ignore, struct sk_buff *skb, void *location)
+@@ -405,11 +370,11 @@ static int __init init_net_drop_monitor(void)
+ 
+ 	for_each_present_cpu(cpu) {
+ 		data = &per_cpu(dm_cpu_data, cpu);
+-		data->cpu = cpu;
+ 		INIT_WORK(&data->dm_alert_work, send_dm_alert);
+ 		init_timer(&data->send_timer);
+-		data->send_timer.data = cpu;
++		data->send_timer.data = (unsigned long)data;
+ 		data->send_timer.function = sched_send_work;
++		spin_lock_init(&data->lock);
+ 		reset_per_cpu_data(data);
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0067-pch_uart-Fix-missing-break-for-16-byte-fifo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0067-pch_uart-Fix-missing-break-for-16-byte-fifo.patch
new file mode 100644
index 0000000..54f82b5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0067-pch_uart-Fix-missing-break-for-16-byte-fifo.patch
@@ -0,0 +1,33 @@
+From 3cae39d521ecb047ef935280fff8eac467b2b8ce Mon Sep 17 00:00:00 2001
+From: Alan Cox <alan@linux.intel.com>
+Date: Mon, 2 Jul 2012 18:51:38 +0100
+Subject: [PATCH 67/70] pch_uart: Fix missing break for 16 byte fifo
+
+commit 9bc03743fff0770dc5a5324ba92e67cc377f16ca upstream.
+
+Otherwise we fall back to the wrong value.
+
+Reported-by: <dcb314@hotmail.com>
+Resolves-bug: https://bugzilla.kernel.org/show_bug.cgi?id=44091
+Signed-off-by: Alan Cox <alan@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/tty/serial/pch_uart.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
+index a4b192d..5ad5040 100644
+--- a/drivers/tty/serial/pch_uart.c
++++ b/drivers/tty/serial/pch_uart.c
+@@ -1163,6 +1163,7 @@ static int pch_uart_startup(struct uart_port *port)
+ 		break;
+ 	case 16:
+ 		fifo_size = PCH_UART_HAL_FIFO16;
++		break;
+ 	case 1:
+ 	default:
+ 		fifo_size = PCH_UART_HAL_FIFO_DIS;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0068-pch_uart-Fix-rx-error-interrupt-setting-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0068-pch_uart-Fix-rx-error-interrupt-setting-issue.patch
new file mode 100644
index 0000000..010bf8c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0068-pch_uart-Fix-rx-error-interrupt-setting-issue.patch
@@ -0,0 +1,85 @@
+From 5e59a1ea39747dfffd111ac418cb27de4047363a Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Fri, 6 Jul 2012 17:19:42 +0900
+Subject: [PATCH 68/70] pch_uart: Fix rx error interrupt setting issue
+
+commit 9539dfb7ac1c84522fe1f79bb7dac2990f3de44a upstream.
+
+Rx Error interrupt(E.G. parity error) is not enabled.
+So, when parity error occurs, error interrupt is not occurred.
+As a result, the received data is not dropped.
+
+This patch adds enable/disable rx error interrupt code.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Acked-by: Alan Cox <alan@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+[Backported by Tomoya MORINGA: adjusted context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/tty/serial/pch_uart.c |   18 ++++++++++++------
+ 1 files changed, 12 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
+index 5ad5040..82f5760 100644
+--- a/drivers/tty/serial/pch_uart.c
++++ b/drivers/tty/serial/pch_uart.c
+@@ -660,7 +660,8 @@ static void pch_dma_rx_complete(void *arg)
+ 		tty_flip_buffer_push(tty);
+ 	tty_kref_put(tty);
+ 	async_tx_ack(priv->desc_rx);
+-	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_RX_INT);
++	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_RX_INT |
++					    PCH_UART_HAL_RX_ERR_INT);
+ }
+ 
+ static void pch_dma_tx_complete(void *arg)
+@@ -715,7 +716,8 @@ static int handle_rx_to(struct eg20t_port *priv)
+ 	int rx_size;
+ 	int ret;
+ 	if (!priv->start_rx) {
+-		pch_uart_hal_disable_interrupt(priv, PCH_UART_HAL_RX_INT);
++		pch_uart_hal_disable_interrupt(priv, PCH_UART_HAL_RX_INT |
++						     PCH_UART_HAL_RX_ERR_INT);
+ 		return 0;
+ 	}
+ 	buf = &priv->rxbuf;
+@@ -977,11 +979,13 @@ static irqreturn_t pch_uart_interrupt(int irq, void *dev_id)
+ 		case PCH_UART_IID_RDR:	/* Received Data Ready */
+ 			if (priv->use_dma) {
+ 				pch_uart_hal_disable_interrupt(priv,
+-							PCH_UART_HAL_RX_INT);
++						PCH_UART_HAL_RX_INT |
++						PCH_UART_HAL_RX_ERR_INT);
+ 				ret = dma_handle_rx(priv);
+ 				if (!ret)
+ 					pch_uart_hal_enable_interrupt(priv,
+-							PCH_UART_HAL_RX_INT);
++						PCH_UART_HAL_RX_INT |
++						PCH_UART_HAL_RX_ERR_INT);
+ 			} else {
+ 				ret = handle_rx(priv);
+ 			}
+@@ -1107,7 +1111,8 @@ static void pch_uart_stop_rx(struct uart_port *port)
+ 	struct eg20t_port *priv;
+ 	priv = container_of(port, struct eg20t_port, port);
+ 	priv->start_rx = 0;
+-	pch_uart_hal_disable_interrupt(priv, PCH_UART_HAL_RX_INT);
++	pch_uart_hal_disable_interrupt(priv, PCH_UART_HAL_RX_INT |
++					     PCH_UART_HAL_RX_ERR_INT);
+ 	priv->int_dis_flag = 1;
+ }
+ 
+@@ -1201,7 +1206,8 @@ static int pch_uart_startup(struct uart_port *port)
+ 		pch_request_dma(port);
+ 
+ 	priv->start_rx = 1;
+-	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_RX_INT);
++	pch_uart_hal_enable_interrupt(priv, PCH_UART_HAL_RX_INT |
++					    PCH_UART_HAL_RX_ERR_INT);
+ 	uart_update_timeout(port, CS8, default_baud);
+ 
+ 	return 0;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0069-pch_uart-Fix-parity-setting-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0069-pch_uart-Fix-parity-setting-issue.patch
new file mode 100644
index 0000000..345038c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0069-pch_uart-Fix-parity-setting-issue.patch
@@ -0,0 +1,35 @@
+From 60811100a88284132fb0d48f99305e87f8c74d0f Mon Sep 17 00:00:00 2001
+From: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Date: Fri, 6 Jul 2012 17:19:43 +0900
+Subject: [PATCH 69/70] pch_uart: Fix parity setting issue
+
+commit 38bd2a1ac736901d1cf4971c78ef952ba92ef78b upstream.
+
+Parity Setting value is reverse.
+E.G. In case of setting ODD parity, EVEN value is set.
+This patch inverts "if" condition.
+
+Signed-off-by: Tomoya MORINAGA <tomoya.rohm@gmail.com>
+Acked-by: Alan Cox <alan@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/tty/serial/pch_uart.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/tty/serial/pch_uart.c b/drivers/tty/serial/pch_uart.c
+index 82f5760..08b92a6 100644
+--- a/drivers/tty/serial/pch_uart.c
++++ b/drivers/tty/serial/pch_uart.c
+@@ -1265,7 +1265,7 @@ static void pch_uart_set_termios(struct uart_port *port,
+ 		stb = PCH_UART_HAL_STB1;
+ 
+ 	if (termios->c_cflag & PARENB) {
+-		if (!(termios->c_cflag & PARODD))
++		if (termios->c_cflag & PARODD)
+ 			parity = PCH_UART_HAL_PARITY_ODD;
+ 		else
+ 			parity = PCH_UART_HAL_PARITY_EVEN;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0070-Linux-3.2.27.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0070-Linux-3.2.27.patch
new file mode 100644
index 0000000..6d3fce0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.27/0070-Linux-3.2.27.patch
@@ -0,0 +1,24 @@
+From 1ff662dfc66fa1db58460d0cf92c1900095f7f0c Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Fri, 10 Aug 2012 00:25:22 +0100
+Subject: [PATCH 70/70] Linux 3.2.27
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index fa5acc83..bdf851f 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 26
++SUBLEVEL = 27
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0001-bnx2-Fix-bug-in-bnx2_free_tx_skbs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0001-bnx2-Fix-bug-in-bnx2_free_tx_skbs.patch
new file mode 100644
index 0000000..83af235
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0001-bnx2-Fix-bug-in-bnx2_free_tx_skbs.patch
@@ -0,0 +1,47 @@
+From ac01c6d147d4570eba977bd3d0632732231bcf8b Mon Sep 17 00:00:00 2001
+From: Michael Chan <mchan@broadcom.com>
+Date: Tue, 10 Jul 2012 10:04:40 +0000
+Subject: [PATCH 01/38] bnx2: Fix bug in bnx2_free_tx_skbs().
+
+[ Upstream commit c1f5163de417dab01fa9daaf09a74bbb19303f3c ]
+
+In rare cases, bnx2x_free_tx_skbs() can unmap the wrong DMA address
+when it gets to the last entry of the tx ring.  We were not using
+the proper macro to skip the last entry when advancing the tx index.
+
+Reported-by: Zongyun Lai <zlai@vmware.com>
+Reviewed-by: Jeffrey Huang <huangjw@broadcom.com>
+Signed-off-by: Michael Chan <mchan@broadcom.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/broadcom/bnx2.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/broadcom/bnx2.c b/drivers/net/ethernet/broadcom/bnx2.c
+index 965c723..721adfd 100644
+--- a/drivers/net/ethernet/broadcom/bnx2.c
++++ b/drivers/net/ethernet/broadcom/bnx2.c
+@@ -5378,7 +5378,7 @@ bnx2_free_tx_skbs(struct bnx2 *bp)
+ 			int k, last;
+ 
+ 			if (skb == NULL) {
+-				j++;
++				j = NEXT_TX_BD(j);
+ 				continue;
+ 			}
+ 
+@@ -5390,8 +5390,8 @@ bnx2_free_tx_skbs(struct bnx2 *bp)
+ 			tx_buf->skb = NULL;
+ 
+ 			last = tx_buf->nr_frags;
+-			j++;
+-			for (k = 0; k < last; k++, j++) {
++			j = NEXT_TX_BD(j);
++			for (k = 0; k < last; k++, j = NEXT_TX_BD(j)) {
+ 				tx_buf = &txr->tx_buf_ring[TX_RING_IDX(j)];
+ 				dma_unmap_page(&bp->pdev->dev,
+ 					dma_unmap_addr(tx_buf, mapping),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0002-sch_sfb-Fix-missing-NULL-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0002-sch_sfb-Fix-missing-NULL-check.patch
new file mode 100644
index 0000000..480f1b8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0002-sch_sfb-Fix-missing-NULL-check.patch
@@ -0,0 +1,33 @@
+From 9404ab928af493a8793024335d18ad8151f114c3 Mon Sep 17 00:00:00 2001
+From: Alan Cox <alan@linux.intel.com>
+Date: Thu, 12 Jul 2012 03:39:11 +0000
+Subject: [PATCH 02/38] sch_sfb: Fix missing NULL check
+
+[ Upstream commit 7ac2908e4b2edaec60e9090ddb4d9ceb76c05e7d ]
+
+Resolves-bug: https://bugzilla.kernel.org/show_bug.cgi?id=44461
+
+Signed-off-by: Alan Cox <alan@linux.intel.com>
+Acked-by: Eric Dumazet <edumazet@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/sched/sch_sfb.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/net/sched/sch_sfb.c b/net/sched/sch_sfb.c
+index 17859ea..351a69b 100644
+--- a/net/sched/sch_sfb.c
++++ b/net/sched/sch_sfb.c
+@@ -559,6 +559,8 @@ static int sfb_dump(struct Qdisc *sch, struct sk_buff *skb)
+ 
+ 	sch->qstats.backlog = q->qdisc->qstats.backlog;
+ 	opts = nla_nest_start(skb, TCA_OPTIONS);
++	if (opts == NULL)
++		goto nla_put_failure;
+ 	NLA_PUT(skb, TCA_SFB_PARMS, sizeof(opt), &opt);
+ 	return nla_nest_end(skb, opts);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0003-sctp-Fix-list-corruption-resulting-from-freeing-an-a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0003-sctp-Fix-list-corruption-resulting-from-freeing-an-a.patch
new file mode 100644
index 0000000..f1291c0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0003-sctp-Fix-list-corruption-resulting-from-freeing-an-a.patch
@@ -0,0 +1,188 @@
+From e7ccb3dde4457e701c4ec1a77e7728e180c57526 Mon Sep 17 00:00:00 2001
+From: Neil Horman <nhorman@tuxdriver.com>
+Date: Mon, 16 Jul 2012 09:13:51 +0000
+Subject: [PATCH 03/38] sctp: Fix list corruption resulting from freeing an
+ association on a list
+
+[ Upstream commit 2eebc1e188e9e45886ee00662519849339884d6d ]
+
+A few days ago Dave Jones reported this oops:
+
+[22766.294255] general protection fault: 0000 [#1] PREEMPT SMP
+[22766.295376] CPU 0
+[22766.295384] Modules linked in:
+[22766.387137]  ffffffffa169f292 6b6b6b6b6b6b6b6b ffff880147c03a90
+ffff880147c03a74
+[22766.387135] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 00000000000
+[22766.387136] Process trinity-watchdo (pid: 10896, threadinfo ffff88013e7d2000,
+[22766.387137] Stack:
+[22766.387140]  ffff880147c03a10
+[22766.387140]  ffffffffa169f2b6
+[22766.387140]  ffff88013ed95728
+[22766.387143]  0000000000000002
+[22766.387143]  0000000000000000
+[22766.387143]  ffff880003fad062
+[22766.387144]  ffff88013c120000
+[22766.387144]
+[22766.387145] Call Trace:
+[22766.387145]  <IRQ>
+[22766.387150]  [<ffffffffa169f292>] ? __sctp_lookup_association+0x62/0xd0
+[sctp]
+[22766.387154]  [<ffffffffa169f2b6>] __sctp_lookup_association+0x86/0xd0 [sctp]
+[22766.387157]  [<ffffffffa169f597>] sctp_rcv+0x207/0xbb0 [sctp]
+[22766.387161]  [<ffffffff810d4da8>] ? trace_hardirqs_off_caller+0x28/0xd0
+[22766.387163]  [<ffffffff815827e3>] ? nf_hook_slow+0x133/0x210
+[22766.387166]  [<ffffffff815902fc>] ? ip_local_deliver_finish+0x4c/0x4c0
+[22766.387168]  [<ffffffff8159043d>] ip_local_deliver_finish+0x18d/0x4c0
+[22766.387169]  [<ffffffff815902fc>] ? ip_local_deliver_finish+0x4c/0x4c0
+[22766.387171]  [<ffffffff81590a07>] ip_local_deliver+0x47/0x80
+[22766.387172]  [<ffffffff8158fd80>] ip_rcv_finish+0x150/0x680
+[22766.387174]  [<ffffffff81590c54>] ip_rcv+0x214/0x320
+[22766.387176]  [<ffffffff81558c07>] __netif_receive_skb+0x7b7/0x910
+[22766.387178]  [<ffffffff8155856c>] ? __netif_receive_skb+0x11c/0x910
+[22766.387180]  [<ffffffff810d423e>] ? put_lock_stats.isra.25+0xe/0x40
+[22766.387182]  [<ffffffff81558f83>] netif_receive_skb+0x23/0x1f0
+[22766.387183]  [<ffffffff815596a9>] ? dev_gro_receive+0x139/0x440
+[22766.387185]  [<ffffffff81559280>] napi_skb_finish+0x70/0xa0
+[22766.387187]  [<ffffffff81559cb5>] napi_gro_receive+0xf5/0x130
+[22766.387218]  [<ffffffffa01c4679>] e1000_receive_skb+0x59/0x70 [e1000e]
+[22766.387242]  [<ffffffffa01c5aab>] e1000_clean_rx_irq+0x28b/0x460 [e1000e]
+[22766.387266]  [<ffffffffa01c9c18>] e1000e_poll+0x78/0x430 [e1000e]
+[22766.387268]  [<ffffffff81559fea>] net_rx_action+0x1aa/0x3d0
+[22766.387270]  [<ffffffff810a495f>] ? account_system_vtime+0x10f/0x130
+[22766.387273]  [<ffffffff810734d0>] __do_softirq+0xe0/0x420
+[22766.387275]  [<ffffffff8169826c>] call_softirq+0x1c/0x30
+[22766.387278]  [<ffffffff8101db15>] do_softirq+0xd5/0x110
+[22766.387279]  [<ffffffff81073bc5>] irq_exit+0xd5/0xe0
+[22766.387281]  [<ffffffff81698b03>] do_IRQ+0x63/0xd0
+[22766.387283]  [<ffffffff8168ee2f>] common_interrupt+0x6f/0x6f
+[22766.387283]  <EOI>
+[22766.387284]
+[22766.387285]  [<ffffffff8168eed9>] ? retint_swapgs+0x13/0x1b
+[22766.387285] Code: c0 90 5d c3 66 0f 1f 44 00 00 4c 89 c8 5d c3 0f 1f 00 55 48
+89 e5 48 83
+ec 20 48 89 5d e8 4c 89 65 f0 4c 89 6d f8 66 66 66 66 90 <0f> b7 87 98 00 00 00
+48 89 fb
+49 89 f5 66 c1 c0 08 66 39 46 02
+[22766.387307]
+[22766.387307] RIP
+[22766.387311]  [<ffffffffa168a2c9>] sctp_assoc_is_match+0x19/0x90 [sctp]
+[22766.387311]  RSP <ffff880147c039b0>
+[22766.387142]  ffffffffa16ab120
+[22766.599537] ---[ end trace 3f6dae82e37b17f5 ]---
+[22766.601221] Kernel panic - not syncing: Fatal exception in interrupt
+
+It appears from his analysis and some staring at the code that this is likely
+occuring because an association is getting freed while still on the
+sctp_assoc_hashtable.  As a result, we get a gpf when traversing the hashtable
+while a freed node corrupts part of the list.
+
+Nominally I would think that an mibalanced refcount was responsible for this,
+but I can't seem to find any obvious imbalance.  What I did note however was
+that the two places where we create an association using
+sctp_primitive_ASSOCIATE (__sctp_connect and sctp_sendmsg), have failure paths
+which free a newly created association after calling sctp_primitive_ASSOCIATE.
+sctp_primitive_ASSOCIATE brings us into the sctp_sf_do_prm_asoc path, which
+issues a SCTP_CMD_NEW_ASOC side effect, which in turn adds a new association to
+the aforementioned hash table.  the sctp command interpreter that process side
+effects has not way to unwind previously processed commands, so freeing the
+association from the __sctp_connect or sctp_sendmsg error path would lead to a
+freed association remaining on this hash table.
+
+I've fixed this but modifying sctp_[un]hash_established to use hlist_del_init,
+which allows us to proerly use hlist_unhashed to check if the node is on a
+hashlist safely during a delete.  That in turn alows us to safely call
+sctp_unhash_established in the __sctp_connect and sctp_sendmsg error paths
+before freeing them, regardles of what the associations state is on the hash
+list.
+
+I noted, while I was doing this, that the __sctp_unhash_endpoint was using
+hlist_unhsashed in a simmilar fashion, but never nullified any removed nodes
+pointers to make that function work properly, so I fixed that up in a simmilar
+fashion.
+
+I attempted to test this using a virtual guest running the SCTP_RR test from
+netperf in a loop while running the trinity fuzzer, both in a loop.  I wasn't
+able to recreate the problem prior to this fix, nor was I able to trigger the
+failure after (neither of which I suppose is suprising).  Given the trace above
+however, I think its likely that this is what we hit.
+
+Signed-off-by: Neil Horman <nhorman@tuxdriver.com>
+Reported-by: davej@redhat.com
+CC: davej@redhat.com
+CC: "David S. Miller" <davem@davemloft.net>
+CC: Vlad Yasevich <vyasevich@gmail.com>
+CC: Sridhar Samudrala <sri@us.ibm.com>
+CC: linux-sctp@vger.kernel.org
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/sctp/input.c  |    7 ++-----
+ net/sctp/socket.c |   12 ++++++++++--
+ 2 files changed, 12 insertions(+), 7 deletions(-)
+
+diff --git a/net/sctp/input.c b/net/sctp/input.c
+index b7692aa..0fc18c7 100644
+--- a/net/sctp/input.c
++++ b/net/sctp/input.c
+@@ -736,15 +736,12 @@ static void __sctp_unhash_endpoint(struct sctp_endpoint *ep)
+ 
+ 	epb = &ep->base;
+ 
+-	if (hlist_unhashed(&epb->node))
+-		return;
+-
+ 	epb->hashent = sctp_ep_hashfn(epb->bind_addr.port);
+ 
+ 	head = &sctp_ep_hashtable[epb->hashent];
+ 
+ 	sctp_write_lock(&head->lock);
+-	__hlist_del(&epb->node);
++	hlist_del_init(&epb->node);
+ 	sctp_write_unlock(&head->lock);
+ }
+ 
+@@ -825,7 +822,7 @@ static void __sctp_unhash_established(struct sctp_association *asoc)
+ 	head = &sctp_assoc_hashtable[epb->hashent];
+ 
+ 	sctp_write_lock(&head->lock);
+-	__hlist_del(&epb->node);
++	hlist_del_init(&epb->node);
+ 	sctp_write_unlock(&head->lock);
+ }
+ 
+diff --git a/net/sctp/socket.c b/net/sctp/socket.c
+index 0075554..8e49d76 100644
+--- a/net/sctp/socket.c
++++ b/net/sctp/socket.c
+@@ -1231,8 +1231,14 @@ out_free:
+ 	SCTP_DEBUG_PRINTK("About to exit __sctp_connect() free asoc: %p"
+ 			  " kaddrs: %p err: %d\n",
+ 			  asoc, kaddrs, err);
+-	if (asoc)
++	if (asoc) {
++		/* sctp_primitive_ASSOCIATE may have added this association
++		 * To the hash table, try to unhash it, just in case, its a noop
++		 * if it wasn't hashed so we're safe
++		 */
++		sctp_unhash_established(asoc);
+ 		sctp_association_free(asoc);
++	}
+ 	return err;
+ }
+ 
+@@ -1942,8 +1948,10 @@ SCTP_STATIC int sctp_sendmsg(struct kiocb *iocb, struct sock *sk,
+ 	goto out_unlock;
+ 
+ out_free:
+-	if (new_asoc)
++	if (new_asoc) {
++		sctp_unhash_established(asoc);
+ 		sctp_association_free(asoc);
++	}
+ out_unlock:
+ 	sctp_release_sock(sk);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0004-caif-Fix-access-to-freed-pernet-memory.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0004-caif-Fix-access-to-freed-pernet-memory.patch
new file mode 100644
index 0000000..d974620
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0004-caif-Fix-access-to-freed-pernet-memory.patch
@@ -0,0 +1,52 @@
+From b86789c525a7fc1e9cae59eb21bc0138f89ba8c3 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sjur=20Br=C3=A6ndeland?= <sjur.brandeland@stericsson.com>
+Date: Sun, 15 Jul 2012 10:10:14 +0000
+Subject: [PATCH 04/38] caif: Fix access to freed pernet memory
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[ Upstream commit 96f80d123eff05c3cd4701463786b87952a6c3ac ]
+
+unregister_netdevice_notifier() must be called before
+unregister_pernet_subsys() to avoid accessing already freed
+pernet memory. This fixes the following oops when doing rmmod:
+
+Call Trace:
+ [<ffffffffa0f802bd>] caif_device_notify+0x4d/0x5a0 [caif]
+ [<ffffffff81552ba9>] unregister_netdevice_notifier+0xb9/0x100
+ [<ffffffffa0f86dcc>] caif_device_exit+0x1c/0x250 [caif]
+ [<ffffffff810e7734>] sys_delete_module+0x1a4/0x300
+ [<ffffffff810da82d>] ? trace_hardirqs_on_caller+0x15d/0x1e0
+ [<ffffffff813517de>] ? trace_hardirqs_on_thunk+0x3a/0x3
+ [<ffffffff81696bad>] system_call_fastpath+0x1a/0x1f
+
+RIP
+ [<ffffffffa0f7f561>] caif_get+0x51/0xb0 [caif]
+
+Signed-off-by: Sjur Brændeland <sjur.brandeland@stericsson.com>
+Acked-by: "Eric W. Biederman" <ebiederm@xmission.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/caif/caif_dev.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/net/caif/caif_dev.c b/net/caif/caif_dev.c
+index 68223e4..4e9115d 100644
+--- a/net/caif/caif_dev.c
++++ b/net/caif/caif_dev.c
+@@ -428,9 +428,9 @@ static int __init caif_device_init(void)
+ 
+ static void __exit caif_device_exit(void)
+ {
+-	unregister_pernet_subsys(&caif_net_ops);
+ 	unregister_netdevice_notifier(&caif_device_notifier);
+ 	dev_remove_pack(&caif_packet_type);
++	unregister_pernet_subsys(&caif_net_ops);
+ }
+ 
+ module_init(caif_device_init);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0005-cipso-don-t-follow-a-NULL-pointer-when-setsockopt-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0005-cipso-don-t-follow-a-NULL-pointer-when-setsockopt-is.patch
new file mode 100644
index 0000000..ee4d3cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0005-cipso-don-t-follow-a-NULL-pointer-when-setsockopt-is.patch
@@ -0,0 +1,95 @@
+From 6037d0b798b22b0b0be2a95c65e629b5532884a2 Mon Sep 17 00:00:00 2001
+From: Paul Moore <pmoore@redhat.com>
+Date: Tue, 17 Jul 2012 11:07:47 +0000
+Subject: [PATCH 05/38] cipso: don't follow a NULL pointer when setsockopt()
+ is called
+
+[ Upstream commit 89d7ae34cdda4195809a5a987f697a517a2a3177 ]
+
+As reported by Alan Cox, and verified by Lin Ming, when a user
+attempts to add a CIPSO option to a socket using the CIPSO_V4_TAG_LOCAL
+tag the kernel dies a terrible death when it attempts to follow a NULL
+pointer (the skb argument to cipso_v4_validate() is NULL when called via
+the setsockopt() syscall).
+
+This patch fixes this by first checking to ensure that the skb is
+non-NULL before using it to find the incoming network interface.  In
+the unlikely case where the skb is NULL and the user attempts to add
+a CIPSO option with the _TAG_LOCAL tag we return an error as this is
+not something we want to allow.
+
+A simple reproducer, kindly supplied by Lin Ming, although you must
+have the CIPSO DOI #3 configure on the system first or you will be
+caught early in cipso_v4_validate():
+
+	#include <sys/types.h>
+	#include <sys/socket.h>
+	#include <linux/ip.h>
+	#include <linux/in.h>
+	#include <string.h>
+
+	struct local_tag {
+		char type;
+		char length;
+		char info[4];
+	};
+
+	struct cipso {
+		char type;
+		char length;
+		char doi[4];
+		struct local_tag local;
+	};
+
+	int main(int argc, char **argv)
+	{
+		int sockfd;
+		struct cipso cipso = {
+			.type = IPOPT_CIPSO,
+			.length = sizeof(struct cipso),
+			.local = {
+				.type = 128,
+				.length = sizeof(struct local_tag),
+			},
+		};
+
+		memset(cipso.doi, 0, 4);
+		cipso.doi[3] = 3;
+
+		sockfd = socket(AF_INET, SOCK_DGRAM, 0);
+		#define SOL_IP 0
+		setsockopt(sockfd, SOL_IP, IP_OPTIONS,
+			&cipso, sizeof(struct cipso));
+
+		return 0;
+	}
+
+CC: Lin Ming <mlin@ss.pku.edu.cn>
+Reported-by: Alan Cox <alan@lxorguk.ukuu.org.uk>
+Signed-off-by: Paul Moore <pmoore@redhat.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/ipv4/cipso_ipv4.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/net/ipv4/cipso_ipv4.c b/net/ipv4/cipso_ipv4.c
+index 86f3b88..afaa735 100644
+--- a/net/ipv4/cipso_ipv4.c
++++ b/net/ipv4/cipso_ipv4.c
+@@ -1725,8 +1725,10 @@ int cipso_v4_validate(const struct sk_buff *skb, unsigned char **option)
+ 		case CIPSO_V4_TAG_LOCAL:
+ 			/* This is a non-standard tag that we only allow for
+ 			 * local connections, so if the incoming interface is
+-			 * not the loopback device drop the packet. */
+-			if (!(skb->dev->flags & IFF_LOOPBACK)) {
++			 * not the loopback device drop the packet. Further,
++			 * there is no legitimate reason for setting this from
++			 * userspace so reject it if skb is NULL. */
++			if (skb == NULL || !(skb->dev->flags & IFF_LOOPBACK)) {
+ 				err_offset = opt_iter;
+ 				goto validate_return_locked;
+ 			}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0006-caif-fix-NULL-pointer-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0006-caif-fix-NULL-pointer-check.patch
new file mode 100644
index 0000000..b83525e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0006-caif-fix-NULL-pointer-check.patch
@@ -0,0 +1,33 @@
+From 074a6a80582984a2cf5fb8f62225bbd9cd314434 Mon Sep 17 00:00:00 2001
+From: Alan Cox <alan@linux.intel.com>
+Date: Tue, 24 Jul 2012 02:42:14 +0000
+Subject: [PATCH 06/38] caif: fix NULL pointer check
+
+[ Upstream commit c66b9b7d365444b433307ebb18734757cb668a02 ]
+
+Reported-by: <rucsoftsec@gmail.com>
+Resolves-bug: http://bugzilla.kernel.org/show_bug?44441
+Signed-off-by: Alan Cox <alan@linux.intel.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/caif/caif_serial.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/caif/caif_serial.c b/drivers/net/caif/caif_serial.c
+index 23406e6..ae286a9 100644
+--- a/drivers/net/caif/caif_serial.c
++++ b/drivers/net/caif/caif_serial.c
+@@ -325,6 +325,9 @@ static int ldisc_open(struct tty_struct *tty)
+ 
+ 	sprintf(name, "cf%s", tty->name);
+ 	dev = alloc_netdev(sizeof(*ser), name, caifdev_setup);
++	if (!dev)
++		return -ENOMEM;
++
+ 	ser = netdev_priv(dev);
+ 	ser->tty = tty_kref_get(tty);
+ 	ser->dev = dev;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0007-wanmain-comparing-array-with-NULL.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0007-wanmain-comparing-array-with-NULL.patch
new file mode 100644
index 0000000..1534803
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0007-wanmain-comparing-array-with-NULL.patch
@@ -0,0 +1,83 @@
+From ed8467f422e2d17a05fbe02b149780199a683d11 Mon Sep 17 00:00:00 2001
+From: Alan Cox <alan@linux.intel.com>
+Date: Tue, 24 Jul 2012 08:16:25 +0000
+Subject: [PATCH 07/38] wanmain: comparing array with NULL
+
+[ Upstream commit 8b72ff6484fe303e01498b58621810a114f3cf09 ]
+
+gcc really should warn about these !
+
+Signed-off-by: Alan Cox <alan@linux.intel.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/wanrouter/wanmain.c |   51 +++++++++++++++++++++-------------------------
+ 1 files changed, 23 insertions(+), 28 deletions(-)
+
+diff --git a/net/wanrouter/wanmain.c b/net/wanrouter/wanmain.c
+index 788a12c..2ab7850 100644
+--- a/net/wanrouter/wanmain.c
++++ b/net/wanrouter/wanmain.c
+@@ -602,36 +602,31 @@ static int wanrouter_device_new_if(struct wan_device *wandev,
+ 		 * successfully, add it to the interface list.
+ 		 */
+ 
+-		if (dev->name == NULL) {
+-			err = -EINVAL;
+-		} else {
++#ifdef WANDEBUG
++		printk(KERN_INFO "%s: registering interface %s...\n",
++		       wanrouter_modname, dev->name);
++#endif
+ 
+-			#ifdef WANDEBUG
+-			printk(KERN_INFO "%s: registering interface %s...\n",
+-				wanrouter_modname, dev->name);
+-			#endif
+-
+-			err = register_netdev(dev);
+-			if (!err) {
+-				struct net_device *slave = NULL;
+-				unsigned long smp_flags=0;
+-
+-				lock_adapter_irq(&wandev->lock, &smp_flags);
+-
+-				if (wandev->dev == NULL) {
+-					wandev->dev = dev;
+-				} else {
+-					for (slave=wandev->dev;
+-					     DEV_TO_SLAVE(slave);
+-					     slave = DEV_TO_SLAVE(slave))
+-						DEV_TO_SLAVE(slave) = dev;
+-				}
+-				++wandev->ndev;
+-
+-				unlock_adapter_irq(&wandev->lock, &smp_flags);
+-				err = 0;	/* done !!! */
+-				goto out;
++		err = register_netdev(dev);
++		if (!err) {
++			struct net_device *slave = NULL;
++			unsigned long smp_flags=0;
++
++			lock_adapter_irq(&wandev->lock, &smp_flags);
++
++			if (wandev->dev == NULL) {
++				wandev->dev = dev;
++			} else {
++				for (slave=wandev->dev;
++				     DEV_TO_SLAVE(slave);
++				     slave = DEV_TO_SLAVE(slave))
++					DEV_TO_SLAVE(slave) = dev;
+ 			}
++			++wandev->ndev;
++
++			unlock_adapter_irq(&wandev->lock, &smp_flags);
++			err = 0;	/* done !!! */
++			goto out;
+ 		}
+ 		if (wandev->del_if)
+ 			wandev->del_if(wandev, dev);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0008-tcp-Add-TCP_USER_TIMEOUT-negative-value-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0008-tcp-Add-TCP_USER_TIMEOUT-negative-value-check.patch
new file mode 100644
index 0000000..c2a2ae2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0008-tcp-Add-TCP_USER_TIMEOUT-negative-value-check.patch
@@ -0,0 +1,39 @@
+From 24be4ad08d43124b8146baeaf2e0ea04beaeedc4 Mon Sep 17 00:00:00 2001
+From: Hangbin Liu <liuhangbin@gmail.com>
+Date: Thu, 26 Jul 2012 22:52:21 +0000
+Subject: [PATCH 08/38] tcp: Add TCP_USER_TIMEOUT negative value check
+
+[ Upstream commit 42493570100b91ef663c4c6f0c0fdab238f9d3c2 ]
+
+TCP_USER_TIMEOUT is a TCP level socket option that takes an unsigned int. But
+patch "tcp: Add TCP_USER_TIMEOUT socket option"(dca43c75) didn't check the negative
+values. If a user assign -1 to it, the socket will set successfully and wait
+for 4294967295 miliseconds. This patch add a negative value check to avoid
+this issue.
+
+Signed-off-by: Hangbin Liu <liuhangbin@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/ipv4/tcp.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
+index 11ba922..ad466a7 100644
+--- a/net/ipv4/tcp.c
++++ b/net/ipv4/tcp.c
+@@ -2391,7 +2391,10 @@ static int do_tcp_setsockopt(struct sock *sk, int level,
+ 		/* Cap the max timeout in ms TCP will retry/retrans
+ 		 * before giving up and aborting (ETIMEDOUT) a connection.
+ 		 */
+-		icsk->icsk_user_timeout = msecs_to_jiffies(val);
++		if (val < 0)
++			err = -EINVAL;
++		else
++			icsk->icsk_user_timeout = msecs_to_jiffies(val);
+ 		break;
+ 	default:
+ 		err = -ENOPROTOOPT;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0009-USB-kaweth.c-use-GFP_ATOMIC-under-spin_lock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0009-USB-kaweth.c-use-GFP_ATOMIC-under-spin_lock.patch
new file mode 100644
index 0000000..aa27cd5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0009-USB-kaweth.c-use-GFP_ATOMIC-under-spin_lock.patch
@@ -0,0 +1,40 @@
+From 0ffa373b3d400c24d958e623a99a276c4a5e25db Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Fri, 27 Jul 2012 01:46:51 +0000
+Subject: [PATCH 09/38] USB: kaweth.c: use GFP_ATOMIC under spin_lock
+
+[ Upstream commit e4c7f259c5be99dcfc3d98f913590663b0305bf8 ]
+
+The problem is that we call this with a spin lock held.  The call tree
+is:
+	kaweth_start_xmit() holds kaweth->device_lock.
+	-> kaweth_async_set_rx_mode()
+	   -> kaweth_control()
+	      -> kaweth_internal_control_msg()
+
+The kaweth_internal_control_msg() function is only called from
+kaweth_control() which used GFP_ATOMIC for its allocations.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/usb/kaweth.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/usb/kaweth.c b/drivers/net/usb/kaweth.c
+index 582ca2d..c4c6a73 100644
+--- a/drivers/net/usb/kaweth.c
++++ b/drivers/net/usb/kaweth.c
+@@ -1308,7 +1308,7 @@ static int kaweth_internal_control_msg(struct usb_device *usb_dev,
+         int retv;
+         int length = 0; /* shut up GCC */
+ 
+-        urb = usb_alloc_urb(0, GFP_NOIO);
++	urb = usb_alloc_urb(0, GFP_ATOMIC);
+         if (!urb)
+                 return -ENOMEM;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0010-net-fix-rtnetlink-IFF_PROMISC-and-IFF_ALLMULTI-handl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0010-net-fix-rtnetlink-IFF_PROMISC-and-IFF_ALLMULTI-handl.patch
new file mode 100644
index 0000000..b662f1a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0010-net-fix-rtnetlink-IFF_PROMISC-and-IFF_ALLMULTI-handl.patch
@@ -0,0 +1,60 @@
+From 10bd72dd5d3631b8058ef86bfbb64d5176477dc7 Mon Sep 17 00:00:00 2001
+From: Jiri Benc <jbenc@redhat.com>
+Date: Fri, 27 Jul 2012 02:58:22 +0000
+Subject: [PATCH 10/38] net: fix rtnetlink IFF_PROMISC and IFF_ALLMULTI
+ handling
+
+[ Upstream commit b1beb681cba5358f62e6187340660ade226a5fcc ]
+
+When device flags are set using rtnetlink, IFF_PROMISC and IFF_ALLMULTI
+flags are handled specially. Function dev_change_flags sets IFF_PROMISC and
+IFF_ALLMULTI bits in dev->gflags according to the passed value but
+do_setlink passes a result of rtnl_dev_combine_flags which takes those bits
+from dev->flags.
+
+This can be easily trigerred by doing:
+
+tcpdump -i eth0 &
+ip l s up eth0
+
+ip sets IFF_UP flag in ifi_flags and ifi_change, which is combined with
+IFF_PROMISC by rtnl_dev_combine_flags, causing __dev_change_flags to set
+IFF_PROMISC in gflags.
+
+Reported-by: Max Matveev <makc@redhat.com>
+Signed-off-by: Jiri Benc <jbenc@redhat.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/core/rtnetlink.c |    8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/net/core/rtnetlink.c b/net/core/rtnetlink.c
+index 05842ab..0cf604b 100644
+--- a/net/core/rtnetlink.c
++++ b/net/core/rtnetlink.c
+@@ -670,6 +670,12 @@ static void set_operstate(struct net_device *dev, unsigned char transition)
+ 	}
+ }
+ 
++static unsigned int rtnl_dev_get_flags(const struct net_device *dev)
++{
++	return (dev->flags & ~(IFF_PROMISC | IFF_ALLMULTI)) |
++	       (dev->gflags & (IFF_PROMISC | IFF_ALLMULTI));
++}
++
+ static unsigned int rtnl_dev_combine_flags(const struct net_device *dev,
+ 					   const struct ifinfomsg *ifm)
+ {
+@@ -678,7 +684,7 @@ static unsigned int rtnl_dev_combine_flags(const struct net_device *dev,
+ 	/* bugwards compatibility: ifi_change == 0 is treated as ~0 */
+ 	if (ifm->ifi_change)
+ 		flags = (flags & ifm->ifi_change) |
+-			(dev->flags & ~ifm->ifi_change);
++			(rtnl_dev_get_flags(dev) & ~ifm->ifi_change);
+ 
+ 	return flags;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0011-tcp-perform-DMA-to-userspace-only-if-there-is-a-task.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0011-tcp-perform-DMA-to-userspace-only-if-there-is-a-task.patch
new file mode 100644
index 0000000..86f8026
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0011-tcp-perform-DMA-to-userspace-only-if-there-is-a-task.patch
@@ -0,0 +1,57 @@
+From 0d41914945b1a1d6b6aa1c9ec95af25a5d7d06e6 Mon Sep 17 00:00:00 2001
+From: Jiri Kosina <jkosina@suse.cz>
+Date: Fri, 27 Jul 2012 10:38:50 +0000
+Subject: [PATCH 11/38] tcp: perform DMA to userspace only if there is a task
+ waiting for it
+
+[ Upstream commit 59ea33a68a9083ac98515e4861c00e71efdc49a1 ]
+
+Back in 2006, commit 1a2449a87b ("[I/OAT]: TCP recv offload to I/OAT")
+added support for receive offloading to IOAT dma engine if available.
+
+The code in tcp_rcv_established() tries to perform early DMA copy if
+applicable. It however does so without checking whether the userspace
+task is actually expecting the data in the buffer.
+
+This is not a problem under normal circumstances, but there is a corner
+case where this doesn't work -- and that's when MSG_TRUNC flag to
+recvmsg() is used.
+
+If the IOAT dma engine is not used, the code properly checks whether
+there is a valid ucopy.task and the socket is owned by userspace, but
+misses the check in the dmaengine case.
+
+This problem can be observed in real trivially -- for example 'tbench' is a
+good reproducer, as it makes a heavy use of MSG_TRUNC. On systems utilizing
+IOAT, you will soon find tbench waiting indefinitely in sk_wait_data(), as they
+have been already early-copied in tcp_rcv_established() using dma engine.
+
+This patch introduces the same check we are performing in the simple
+iovec copy case to the IOAT case as well. It fixes the indefinite
+recvmsg(MSG_TRUNC) hangs.
+
+Signed-off-by: Jiri Kosina <jkosina@suse.cz>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/ipv4/tcp_input.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 32e6ca2..a08a621 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -5415,7 +5415,9 @@ int tcp_rcv_established(struct sock *sk, struct sk_buff *skb,
+ 			if (tp->copied_seq == tp->rcv_nxt &&
+ 			    len - tcp_header_len <= tp->ucopy.len) {
+ #ifdef CONFIG_NET_DMA
+-				if (tcp_dma_try_early_copy(sk, skb, tcp_header_len)) {
++				if (tp->ucopy.task == current &&
++				    sock_owned_by_user(sk) &&
++				    tcp_dma_try_early_copy(sk, skb, tcp_header_len)) {
+ 					copied_early = 1;
+ 					eaten = 1;
+ 				}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0012-net-tun-fix-ioctl-based-info-leaks.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0012-net-tun-fix-ioctl-based-info-leaks.patch
new file mode 100644
index 0000000..efd8310
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0012-net-tun-fix-ioctl-based-info-leaks.patch
@@ -0,0 +1,41 @@
+From c45f3d3d8ea33347baec087b5f05f561bbb7e994 Mon Sep 17 00:00:00 2001
+From: Mathias Krause <minipli@googlemail.com>
+Date: Sun, 29 Jul 2012 19:45:14 +0000
+Subject: [PATCH 12/38] net/tun: fix ioctl() based info leaks
+
+[ Upstream commits a117dacde0288f3ec60b6e5bcedae8fa37ee0dfc
+  and 8bbb181308bc348e02bfdbebdedd4e4ec9d452ce ]
+
+The tun module leaks up to 36 bytes of memory by not fully initializing
+a structure located on the stack that gets copied to user memory by the
+TUNGETIFF and SIOCGIFHWADDR ioctl()s.
+
+Signed-off-by: Mathias Krause <minipli@googlemail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/tun.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/tun.c b/drivers/net/tun.c
+index 7bea9c6..a12c9bf 100644
+--- a/drivers/net/tun.c
++++ b/drivers/net/tun.c
+@@ -1243,10 +1243,12 @@ static long __tun_chr_ioctl(struct file *file, unsigned int cmd,
+ 	int vnet_hdr_sz;
+ 	int ret;
+ 
+-	if (cmd == TUNSETIFF || _IOC_TYPE(cmd) == 0x89)
++	if (cmd == TUNSETIFF || _IOC_TYPE(cmd) == 0x89) {
+ 		if (copy_from_user(&ifr, argp, ifreq_len))
+ 			return -EFAULT;
+-
++	} else {
++		memset(&ifr, 0, sizeof(ifr));
++	}
+ 	if (cmd == TUNGETFEATURES) {
+ 		/* Currently this just means: "what IFF flags are valid?".
+ 		 * This is needed because we never checked for invalid flags on
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0013-e1000-add-dropped-DMA-receive-enable-back-in-for-WoL.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0013-e1000-add-dropped-DMA-receive-enable-back-in-for-WoL.patch
new file mode 100644
index 0000000..6011417
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0013-e1000-add-dropped-DMA-receive-enable-back-in-for-WoL.patch
@@ -0,0 +1,50 @@
+From a434024fe4e85366698b867be432dfd3dc2f70c1 Mon Sep 17 00:00:00 2001
+From: Dean Nelson <dnelson@redhat.com>
+Date: Thu, 19 Jan 2012 17:47:24 +0000
+Subject: [PATCH 13/38] e1000: add dropped DMA receive enable back in for WoL
+
+commit b868179c47e9e8eadcd04c1f3105998e528988a3 upstream.
+
+Commit d5bc77a223b0e9b9dfb002048d2b34a79e7d0b48 broke Wake-on-LAN by
+inadvertently dropping the enabling of DMA receives.
+
+Restore the enabling of DMA receives for WoL.
+
+This is applicable to 3.1+ stable trees.
+
+Reported-by: Tobias Klausmann <klausman@schwarzvogel.de>
+Signed-off-by: Dean Nelson <dnelson@redhat.com>
+Tested-by: Tobias Klausmann <klausman@schwarzvogel.de>
+Tested-by: Aaron Brown <aaron.f.brown@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/intel/e1000/e1000_main.c |   10 ++++++----
+ 1 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/ethernet/intel/e1000/e1000_main.c
+index de00805..0549261 100644
+--- a/drivers/net/ethernet/intel/e1000/e1000_main.c
++++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
+@@ -4743,12 +4743,14 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool *enable_wake)
+ 		e1000_setup_rctl(adapter);
+ 		e1000_set_rx_mode(netdev);
+ 
++		rctl = er32(RCTL);
++
+ 		/* turn on all-multi mode if wake on multicast is enabled */
+-		if (wufc & E1000_WUFC_MC) {
+-			rctl = er32(RCTL);
++		if (wufc & E1000_WUFC_MC)
+ 			rctl |= E1000_RCTL_MPE;
+-			ew32(RCTL, rctl);
+-		}
++
++		/* enable receives in the hardware */
++		ew32(RCTL, rctl | E1000_RCTL_EN);
+ 
+ 		if (hw->mac_type >= e1000_82540) {
+ 			ctrl = er32(CTRL);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0014-rtlwifi-rtl8192cu-Change-buffer-allocation-for-synch.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0014-rtlwifi-rtl8192cu-Change-buffer-allocation-for-synch.patch
new file mode 100644
index 0000000..40ef189
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0014-rtlwifi-rtl8192cu-Change-buffer-allocation-for-synch.patch
@@ -0,0 +1,77 @@
+From 9f32412e06d7c657dc0db00f1990196da0edc7b5 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Wed, 11 Jul 2012 14:37:28 -0500
+Subject: [PATCH 14/38] rtlwifi: rtl8192cu: Change buffer allocation for
+ synchronous reads
+
+commit 3ce4d85b76010525adedcc2555fa164bf706a2f3 upstream.
+
+In commit a7959c1, the USB part of rtlwifi was switched to convert
+_usb_read_sync() to using a preallocated buffer rather than one
+that has been acquired using kmalloc. Although this routine is named
+as though it were synchronous, there seem to be simultaneous users,
+and the selection of the index to the data buffer is not multi-user
+safe. This situation is addressed by adding a new spinlock. The routine
+cannot sleep, thus a mutex is not allowed.
+
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rtlwifi/usb.c  |   14 +++++++++++---
+ drivers/net/wireless/rtlwifi/wifi.h |    1 +
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/usb.c b/drivers/net/wireless/rtlwifi/usb.c
+index db34db6..a49e848 100644
+--- a/drivers/net/wireless/rtlwifi/usb.c
++++ b/drivers/net/wireless/rtlwifi/usb.c
+@@ -120,15 +120,19 @@ static u32 _usb_read_sync(struct rtl_priv *rtlpriv, u32 addr, u16 len)
+ 	u8 request;
+ 	u16 wvalue;
+ 	u16 index;
+-	__le32 *data = &rtlpriv->usb_data[rtlpriv->usb_data_index];
++	__le32 *data;
++	unsigned long flags;
+ 
++	spin_lock_irqsave(&rtlpriv->locks.usb_lock, flags);
++	if (++rtlpriv->usb_data_index >= RTL_USB_MAX_RX_COUNT)
++		rtlpriv->usb_data_index = 0;
++	data = &rtlpriv->usb_data[rtlpriv->usb_data_index];
++	spin_unlock_irqrestore(&rtlpriv->locks.usb_lock, flags);
+ 	request = REALTEK_USB_VENQT_CMD_REQ;
+ 	index = REALTEK_USB_VENQT_CMD_IDX; /* n/a */
+ 
+ 	wvalue = (u16)addr;
+ 	_usbctrl_vendorreq_sync_read(udev, request, wvalue, index, data, len);
+-	if (++rtlpriv->usb_data_index >= RTL_USB_MAX_RX_COUNT)
+-		rtlpriv->usb_data_index = 0;
+ 	return le32_to_cpu(*data);
+ }
+ 
+@@ -909,6 +913,10 @@ int __devinit rtl_usb_probe(struct usb_interface *intf,
+ 				    GFP_KERNEL);
+ 	if (!rtlpriv->usb_data)
+ 		return -ENOMEM;
++
++	/* this spin lock must be initialized early */
++	spin_lock_init(&rtlpriv->locks.usb_lock);
++
+ 	rtlpriv->usb_data_index = 0;
+ 	SET_IEEE80211_DEV(hw, &intf->dev);
+ 	udev = interface_to_usbdev(intf);
+diff --git a/drivers/net/wireless/rtlwifi/wifi.h b/drivers/net/wireless/rtlwifi/wifi.h
+index b1e9deb..deb87e9 100644
+--- a/drivers/net/wireless/rtlwifi/wifi.h
++++ b/drivers/net/wireless/rtlwifi/wifi.h
+@@ -1550,6 +1550,7 @@ struct rtl_locks {
+ 	spinlock_t rf_lock;
+ 	spinlock_t lps_lock;
+ 	spinlock_t waitq_lock;
++	spinlock_t usb_lock;
+ 
+ 	/*Dual mac*/
+ 	spinlock_t cck_and_rw_pagea_lock;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0015-hfsplus-fix-overflow-in-sector-calculations-in-hfspl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0015-hfsplus-fix-overflow-in-sector-calculations-in-hfspl.patch
new file mode 100644
index 0000000..471e568
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0015-hfsplus-fix-overflow-in-sector-calculations-in-hfspl.patch
@@ -0,0 +1,40 @@
+From 2a5405901ea07bfd5de0ab32cd08149f70b29e0b Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Janne=20Kalliom=C3=A4ki?= <janne@tuxera.com>
+Date: Sun, 17 Jun 2012 17:05:24 -0400
+Subject: [PATCH 15/38] hfsplus: fix overflow in sector calculations in
+ hfsplus_submit_bio
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit a6dc8c04218eb752ff79cdc24a995cf51866caed upstream.
+
+The variable io_size was unsigned int, which caused the wrong sector number
+to be calculated after aligning it. This then caused mount to fail with big
+volumes, as backup volume header information was searched from a
+wrong sector.
+
+Signed-off-by: Janne Kalliomäki <janne@tuxera.com>
+Signed-off-by: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/hfsplus/wrapper.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/hfsplus/wrapper.c b/fs/hfsplus/wrapper.c
+index 7daf4b8..90effcc 100644
+--- a/fs/hfsplus/wrapper.c
++++ b/fs/hfsplus/wrapper.c
+@@ -56,7 +56,7 @@ int hfsplus_submit_bio(struct super_block *sb, sector_t sector,
+ 	DECLARE_COMPLETION_ONSTACK(wait);
+ 	struct bio *bio;
+ 	int ret = 0;
+-	unsigned int io_size;
++	u64 io_size;
+ 	loff_t start;
+ 	int offset;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0016-drm-i915-fixup-seqno-allocation-logic-for-lazy_reque.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0016-drm-i915-fixup-seqno-allocation-logic-for-lazy_reque.patch
new file mode 100644
index 0000000..dab607f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0016-drm-i915-fixup-seqno-allocation-logic-for-lazy_reque.patch
@@ -0,0 +1,182 @@
+From fb7b884cf3c3ea0ff01bade0bff2d6338559e870 Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Wed, 25 Jan 2012 16:32:49 +0100
+Subject: [PATCH 16/38] drm/i915: fixup seqno allocation logic for
+ lazy_request
+
+commit 53d227f282eb9fa4c7cdbfd691fa372b7ca8c4c3 upstream.
+
+Currently we reserve seqnos only when we emit the request to the ring
+(by bumping dev_priv->next_seqno), but start using it much earlier for
+ring->oustanding_lazy_request. When 2 threads compete for the gpu and
+run on two different rings (e.g. ddx on blitter vs. compositor)
+hilarity ensued, especially when we get constantly interrupted while
+reserving buffers.
+
+Breakage seems to have been introduced in
+
+commit 6f392d548658a17600da7faaf8a5df25ee5f01f6
+Author: Chris Wilson <chris@chris-wilson.co.uk>
+Date:   Sat Aug 7 11:01:22 2010 +0100
+
+    drm/i915: Use a common seqno for all rings.
+
+This patch fixes up the seqno reservation logic by moving it into
+i915_gem_next_request_seqno. The ring->add_request functions now
+superflously still return the new seqno through a pointer, that will
+be refactored in the next patch.
+
+Note that with this change we now unconditionally allocate a seqno,
+even when ->add_request might fail because the rings are full and the
+gpu died. But this does not open up a new can of worms because we can
+already leave behind an outstanding_request_seqno if e.g. the caller
+gets interrupted with a signal while stalling for the gpu in the
+eviciton paths. And with the bugfix we only ever have one seqno
+allocated per ring (and only that ring), so there are no ordering
+issues with multiple outstanding seqnos on the same ring.
+
+v2: Keep i915_gem_get_seqno (but move it to i915_gem.c) to make it
+clear that we only have one seqno counter for all rings. Suggested by
+Chris Wilson.
+
+v3: As suggested by Chris Wilson use i915_gem_next_request_seqno
+instead of ring->oustanding_lazy_request to make the follow-up
+refactoring more clearly correct. Also improve the commit message
+with issues discussed on irc.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=45181
+Tested-by: Nicolas Kalkhof nkalkhof()at()web.de
+Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/i915_drv.h         |    7 +------
+ drivers/gpu/drm/i915/i915_gem.c         |   23 +++++++++++++++++++++++
+ drivers/gpu/drm/i915/intel_ringbuffer.c |   24 ++++--------------------
+ 3 files changed, 28 insertions(+), 26 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
+index d62c731..c364358 100644
+--- a/drivers/gpu/drm/i915/i915_drv.h
++++ b/drivers/gpu/drm/i915/i915_drv.h
+@@ -1170,12 +1170,7 @@ i915_seqno_passed(uint32_t seq1, uint32_t seq2)
+ 	return (int32_t)(seq1 - seq2) >= 0;
+ }
+ 
+-static inline u32
+-i915_gem_next_request_seqno(struct intel_ring_buffer *ring)
+-{
+-	drm_i915_private_t *dev_priv = ring->dev->dev_private;
+-	return ring->outstanding_lazy_request = dev_priv->next_seqno;
+-}
++u32 i915_gem_next_request_seqno(struct intel_ring_buffer *ring);
+ 
+ int __must_check i915_gem_object_get_fence(struct drm_i915_gem_object *obj,
+ 					   struct intel_ring_buffer *pipelined);
+diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
+index 3e2edc6..548a400 100644
+--- a/drivers/gpu/drm/i915/i915_gem.c
++++ b/drivers/gpu/drm/i915/i915_gem.c
+@@ -1647,6 +1647,28 @@ i915_gem_process_flushing_list(struct intel_ring_buffer *ring,
+ 	}
+ }
+ 
++static u32
++i915_gem_get_seqno(struct drm_device *dev)
++{
++	drm_i915_private_t *dev_priv = dev->dev_private;
++	u32 seqno = dev_priv->next_seqno;
++
++	/* reserve 0 for non-seqno */
++	if (++dev_priv->next_seqno == 0)
++		dev_priv->next_seqno = 1;
++
++	return seqno;
++}
++
++u32
++i915_gem_next_request_seqno(struct intel_ring_buffer *ring)
++{
++	if (ring->outstanding_lazy_request == 0)
++		ring->outstanding_lazy_request = i915_gem_get_seqno(ring->dev);
++
++	return ring->outstanding_lazy_request;
++}
++
+ int
+ i915_add_request(struct intel_ring_buffer *ring,
+ 		 struct drm_file *file,
+@@ -1658,6 +1680,7 @@ i915_add_request(struct intel_ring_buffer *ring,
+ 	int ret;
+ 
+ 	BUG_ON(request == NULL);
++	seqno = i915_gem_next_request_seqno(ring);
+ 
+ 	ret = ring->add_request(ring, &seqno);
+ 	if (ret)
+diff --git a/drivers/gpu/drm/i915/intel_ringbuffer.c b/drivers/gpu/drm/i915/intel_ringbuffer.c
+index f6613dc..d2cbe5d 100644
+--- a/drivers/gpu/drm/i915/intel_ringbuffer.c
++++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
+@@ -52,20 +52,6 @@ static inline int ring_space(struct intel_ring_buffer *ring)
+ 	return space;
+ }
+ 
+-static u32 i915_gem_get_seqno(struct drm_device *dev)
+-{
+-	drm_i915_private_t *dev_priv = dev->dev_private;
+-	u32 seqno;
+-
+-	seqno = dev_priv->next_seqno;
+-
+-	/* reserve 0 for non-seqno */
+-	if (++dev_priv->next_seqno == 0)
+-		dev_priv->next_seqno = 1;
+-
+-	return seqno;
+-}
+-
+ static int
+ render_ring_flush(struct intel_ring_buffer *ring,
+ 		  u32	invalidate_domains,
+@@ -488,7 +474,7 @@ gen6_add_request(struct intel_ring_buffer *ring,
+ 	mbox1_reg = ring->signal_mbox[0];
+ 	mbox2_reg = ring->signal_mbox[1];
+ 
+-	*seqno = i915_gem_get_seqno(ring->dev);
++	*seqno = i915_gem_next_request_seqno(ring);
+ 
+ 	update_mboxes(ring, *seqno, mbox1_reg);
+ 	update_mboxes(ring, *seqno, mbox2_reg);
+@@ -586,8 +572,7 @@ static int
+ pc_render_add_request(struct intel_ring_buffer *ring,
+ 		      u32 *result)
+ {
+-	struct drm_device *dev = ring->dev;
+-	u32 seqno = i915_gem_get_seqno(dev);
++	u32 seqno = i915_gem_next_request_seqno(ring);
+ 	struct pipe_control *pc = ring->private;
+ 	u32 scratch_addr = pc->gtt_offset + 128;
+ 	int ret;
+@@ -638,8 +623,7 @@ static int
+ render_ring_add_request(struct intel_ring_buffer *ring,
+ 			u32 *result)
+ {
+-	struct drm_device *dev = ring->dev;
+-	u32 seqno = i915_gem_get_seqno(dev);
++	u32 seqno = i915_gem_next_request_seqno(ring);
+ 	int ret;
+ 
+ 	ret = intel_ring_begin(ring, 4);
+@@ -813,7 +797,7 @@ ring_add_request(struct intel_ring_buffer *ring,
+ 	if (ret)
+ 		return ret;
+ 
+-	seqno = i915_gem_get_seqno(ring->dev);
++	seqno = i915_gem_next_request_seqno(ring);
+ 
+ 	intel_ring_emit(ring, MI_STORE_DWORD_INDEX);
+ 	intel_ring_emit(ring, I915_GEM_HWS_INDEX << MI_STORE_DWORD_INDEX_SHIFT);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0017-KVM-VMX-Advertise-CPU_BASED_RDPMC_EXITING-for-nested.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0017-KVM-VMX-Advertise-CPU_BASED_RDPMC_EXITING-for-nested.patch
new file mode 100644
index 0000000..ce5de76
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0017-KVM-VMX-Advertise-CPU_BASED_RDPMC_EXITING-for-nested.patch
@@ -0,0 +1,37 @@
+From 3a120a56ad2a35167da519fb81f66027f6b8b8bc Mon Sep 17 00:00:00 2001
+From: Stefan Bader <stefan.bader@canonical.com>
+Date: Thu, 9 Aug 2012 12:33:12 +0300
+Subject: [PATCH 17/38] KVM: VMX: Advertise CPU_BASED_RDPMC_EXITING for nested
+ guests
+
+Based on commit fee84b079d5ddee2247b5c1f53162c330c622902 upstream.
+
+  Intercept RDPMC and forward it to the PMU emulation code.
+
+Newer vmx support will only allow to load the kvm_intel module
+if RDPMC_EXITING is supported. Even without the actual support
+this part of the change is required on 3.2 hosts.
+
+BugLink: http://bugs.launchpad.net/bugs/1031090
+Signed-off-by: Stefan Bader <stefan.bader@canonical.com>
+Signed-off-by: Avi Kivity <avi@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kvm/vmx.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/arch/x86/kvm/vmx.c b/arch/x86/kvm/vmx.c
+index 7315488..407789b 100644
+--- a/arch/x86/kvm/vmx.c
++++ b/arch/x86/kvm/vmx.c
+@@ -1956,6 +1956,7 @@ static __init void nested_vmx_setup_ctls_msrs(void)
+ #endif
+ 		CPU_BASED_MOV_DR_EXITING | CPU_BASED_UNCOND_IO_EXITING |
+ 		CPU_BASED_USE_IO_BITMAPS | CPU_BASED_MONITOR_EXITING |
++		CPU_BASED_RDPMC_EXITING |
+ 		CPU_BASED_ACTIVATE_SECONDARY_CONTROLS;
+ 	/*
+ 	 * We can allow some features even when not supported by the
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0018-mac80211-cancel-mesh-path-timer.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0018-mac80211-cancel-mesh-path-timer.patch
new file mode 100644
index 0000000..ce103a3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0018-mac80211-cancel-mesh-path-timer.patch
@@ -0,0 +1,32 @@
+From 6232af882bb87e23d74aad3351552b267c99e952 Mon Sep 17 00:00:00 2001
+From: Johannes Berg <johannes.berg@intel.com>
+Date: Wed, 1 Aug 2012 21:03:21 +0200
+Subject: [PATCH 18/38] mac80211: cancel mesh path timer
+
+commit dd4c9260e7f23f2e951cbfb2726e468c6d30306c upstream.
+
+The mesh path timer needs to be canceled when
+leaving the mesh as otherwise it could fire
+after the interface has been removed already.
+
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/mac80211/mesh.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/net/mac80211/mesh.c b/net/mac80211/mesh.c
+index a7078fd..f85de8e 100644
+--- a/net/mac80211/mesh.c
++++ b/net/mac80211/mesh.c
+@@ -543,6 +543,7 @@ void ieee80211_stop_mesh(struct ieee80211_sub_if_data *sdata)
+ 
+ 	del_timer_sync(&sdata->u.mesh.housekeeping_timer);
+ 	del_timer_sync(&sdata->u.mesh.mesh_path_root_timer);
++	del_timer_sync(&sdata->u.mesh.mesh_path_timer);
+ 	/*
+ 	 * If the timer fired while we waited for it, it will have
+ 	 * requeued the work. Now the work will be running again
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0019-ath9k-Add-PID-VID-support-for-AR1111.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0019-ath9k-Add-PID-VID-support-for-AR1111.patch
new file mode 100644
index 0000000..4c77dce
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0019-ath9k-Add-PID-VID-support-for-AR1111.patch
@@ -0,0 +1,65 @@
+From 79e8531b00817a47eaadccc39250dbe05d4f141f Mon Sep 17 00:00:00 2001
+From: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Date: Thu, 2 Aug 2012 11:58:50 +0530
+Subject: [PATCH 19/38] ath9k: Add PID/VID support for AR1111
+
+commit d4e5979c0da95791aa717c18e162540c7a596360 upstream.
+
+AR1111 is same as AR9485. The h/w
+difference between them is quite insignificant,
+Felix suggests only very few baseband features
+may not be available in AR1111. The h/w code for
+AR9485 is already present, so AR1111 should
+work fine with the addition of its PID/VID.
+
+Cc: Felix Bitterli <felixb@qca.qualcomm.com>
+Reported-by: Tim Bentley <Tim.Bentley@Gmail.com>
+Signed-off-by: Mohammed Shafi Shajakhan <mohammed@qca.qualcomm.com>
+Tested-by: Tim Bentley <Tim.Bentley@Gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ath/ath9k/hw.c  |    1 +
+ drivers/net/wireless/ath/ath9k/hw.h  |    1 +
+ drivers/net/wireless/ath/ath9k/pci.c |    1 +
+ 3 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
+index 7f97164..2b8e957 100644
+--- a/drivers/net/wireless/ath/ath9k/hw.c
++++ b/drivers/net/wireless/ath/ath9k/hw.c
+@@ -674,6 +674,7 @@ int ath9k_hw_init(struct ath_hw *ah)
+ 	case AR9300_DEVID_AR9340:
+ 	case AR9300_DEVID_AR9580:
+ 	case AR9300_DEVID_AR9462:
++	case AR9485_DEVID_AR1111:
+ 		break;
+ 	default:
+ 		if (common->bus_ops->ath_bus_type == ATH_USB)
+diff --git a/drivers/net/wireless/ath/ath9k/hw.h b/drivers/net/wireless/ath/ath9k/hw.h
+index 1bd8edf..a5c4ba8 100644
+--- a/drivers/net/wireless/ath/ath9k/hw.h
++++ b/drivers/net/wireless/ath/ath9k/hw.h
+@@ -48,6 +48,7 @@
+ #define AR9300_DEVID_AR9580	0x0033
+ #define AR9300_DEVID_AR9462	0x0034
+ #define AR9300_DEVID_AR9330	0x0035
++#define AR9485_DEVID_AR1111	0x0037
+ 
+ #define AR5416_AR9100_DEVID	0x000b
+ 
+diff --git a/drivers/net/wireless/ath/ath9k/pci.c b/drivers/net/wireless/ath/ath9k/pci.c
+index 2dcdf63..1883d39 100644
+--- a/drivers/net/wireless/ath/ath9k/pci.c
++++ b/drivers/net/wireless/ath/ath9k/pci.c
+@@ -35,6 +35,7 @@ static DEFINE_PCI_DEVICE_TABLE(ath_pci_id_table) = {
+ 	{ PCI_VDEVICE(ATHEROS, 0x0032) }, /* PCI-E  AR9485 */
+ 	{ PCI_VDEVICE(ATHEROS, 0x0033) }, /* PCI-E  AR9580 */
+ 	{ PCI_VDEVICE(ATHEROS, 0x0034) }, /* PCI-E  AR9462 */
++	{ PCI_VDEVICE(ATHEROS, 0x0037) }, /* PCI-E  AR1111/AR9485 */
+ 	{ 0 }
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0020-ARM-mxs-Remove-MMAP_MIN_ADDR-setting-from-mxs_defcon.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0020-ARM-mxs-Remove-MMAP_MIN_ADDR-setting-from-mxs_defcon.patch
new file mode 100644
index 0000000..08c6777
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0020-ARM-mxs-Remove-MMAP_MIN_ADDR-setting-from-mxs_defcon.patch
@@ -0,0 +1,52 @@
+From 72e131402c22fe7df4bff17249c4b5a513118b8b Mon Sep 17 00:00:00 2001
+From: Marek Vasut <marex@denx.de>
+Date: Fri, 3 Aug 2012 20:54:48 +0200
+Subject: [PATCH 20/38] ARM: mxs: Remove MMAP_MIN_ADDR setting from
+ mxs_defconfig
+
+commit 3bed491c8d28329e34f8a31e3fe64d03f3a350f1 upstream.
+
+The CONFIG_DEFAULT_MMAP_MIN_ADDR was set to 65536 in mxs_defconfig,
+this caused severe breakage of userland applications since the upper
+limit for ARM is 32768. By default CONFIG_DEFAULT_MMAP_MIN_ADDR is
+set to 4096 and can also be changed via /proc/sys/vm/mmap_min_addr
+if needed.
+
+Quoting Russell King [1]:
+
+"4096 is also fine for ARM too. There's not much point in having
+defconfigs change it - that would just be pure noise in the config
+files."
+
+the CONFIG_DEFAULT_MMAP_MIN_ADDR can be removed from the defconfig
+altogether.
+
+This problem was introduced by commit cde7c41 (ARM: configs: add
+defconfig for mach-mxs).
+
+[1] http://marc.info/?l=linux-arm-kernel&m=134401593807820&w=2
+
+Signed-off-by: Marek Vasut <marex@denx.de>
+Cc: Russell King <linux@arm.linux.org.uk>
+Cc: Wolfgang Denk <wd@denx.de>
+Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/configs/mxs_defconfig |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
+index 6ee781b..3ee3e84 100644
+--- a/arch/arm/configs/mxs_defconfig
++++ b/arch/arm/configs/mxs_defconfig
+@@ -32,7 +32,6 @@ CONFIG_NO_HZ=y
+ CONFIG_HIGH_RES_TIMERS=y
+ CONFIG_PREEMPT_VOLUNTARY=y
+ CONFIG_AEABI=y
+-CONFIG_DEFAULT_MMAP_MIN_ADDR=65536
+ CONFIG_AUTO_ZRELADDR=y
+ CONFIG_FPE_NWFPE=y
+ CONFIG_NET=y
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0021-ALSA-hda-add-dock-support-for-Thinkpad-T430s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0021-ALSA-hda-add-dock-support-for-Thinkpad-T430s.patch
new file mode 100644
index 0000000..087bd23
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0021-ALSA-hda-add-dock-support-for-Thinkpad-T430s.patch
@@ -0,0 +1,34 @@
+From e7af387d6087031280b03362bbfdeaefa97cecfa Mon Sep 17 00:00:00 2001
+From: "Philipp A. Mohrenweiser" <phiamo@googlemail.com>
+Date: Mon, 6 Aug 2012 13:14:18 +0200
+Subject: [PATCH 21/38] ALSA: hda - add dock support for Thinkpad T430s
+
+commit 4407be6ba217514b1bc01488f8b56467d309e416 upstream.
+
+Add a model/fixup string "lenovo-dock", for Thinkpad T430s, to allow
+sound in docking station.
+
+Tested on Lenovo T430s with ThinkPad Mini Dock Plus Series 3
+
+Signed-off-by: Philipp A. Mohrenweiser <phiamo@googlemail.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_realtek.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 2e2eb93..36cef6f 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -5077,6 +5077,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x17aa, 0x21ca, "Thinkpad L412", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21e9, "Thinkpad Edge 15", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21f6, "Thinkpad T530", ALC269_FIXUP_LENOVO_DOCK),
++	SND_PCI_QUIRK(0x17aa, 0x21fb, "Thinkpad T430s", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x2203, "Thinkpad X230 Tablet", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_QUANTA_MUTE),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Lenovo Ideapd", ALC269_FIXUP_PCM_44K),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0022-cfg80211-process-pending-events-when-unregistering-n.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0022-cfg80211-process-pending-events-when-unregistering-n.patch
new file mode 100644
index 0000000..0b3cd87
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0022-cfg80211-process-pending-events-when-unregistering-n.patch
@@ -0,0 +1,72 @@
+From 494c6e65c2040893d8d7bb7a5c34eeb5355a1255 Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Thu, 2 Aug 2012 18:41:48 +0100
+Subject: [PATCH 22/38] cfg80211: process pending events when unregistering
+ net device
+
+commit 1f6fc43e621167492ed4b7f3b4269c584c3d6ccc upstream.
+
+libertas currently calls cfg80211_disconnected() when it is being
+brought down. This causes an event to be allocated, but since the
+wdev is already removed from the rdev by the time that the event
+processing work executes, the event is never processed or freed.
+http://article.gmane.org/gmane.linux.kernel.wireless.general/95666
+
+Fix this leak, and other possible situations, by processing the event
+queue when a device is being unregistered. Thanks to Johannes Berg for
+the suggestion.
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Reviewed-by: Johannes Berg <johannes@sipsolutions.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/wireless/core.c |    5 +++++
+ net/wireless/core.h |    1 +
+ net/wireless/util.c |    2 +-
+ 3 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/net/wireless/core.c b/net/wireless/core.c
+index 220f3bd..8f5042d 100644
+--- a/net/wireless/core.c
++++ b/net/wireless/core.c
+@@ -971,6 +971,11 @@ static int cfg80211_netdev_notifier_call(struct notifier_block * nb,
+ 		 */
+ 		synchronize_rcu();
+ 		INIT_LIST_HEAD(&wdev->list);
++		/*
++		 * Ensure that all events have been processed and
++		 * freed.
++		 */
++		cfg80211_process_wdev_events(wdev);
+ 		break;
+ 	case NETDEV_PRE_UP:
+ 		if (!(wdev->wiphy->interface_modes & BIT(wdev->iftype)))
+diff --git a/net/wireless/core.h b/net/wireless/core.h
+index b9ec306..02c3be3 100644
+--- a/net/wireless/core.h
++++ b/net/wireless/core.h
+@@ -426,6 +426,7 @@ int cfg80211_change_iface(struct cfg80211_registered_device *rdev,
+ 			  struct net_device *dev, enum nl80211_iftype ntype,
+ 			  u32 *flags, struct vif_params *params);
+ void cfg80211_process_rdev_events(struct cfg80211_registered_device *rdev);
++void cfg80211_process_wdev_events(struct wireless_dev *wdev);
+ 
+ int cfg80211_can_change_interface(struct cfg80211_registered_device *rdev,
+ 				  struct wireless_dev *wdev,
+diff --git a/net/wireless/util.c b/net/wireless/util.c
+index b5e4c1c..22fb802 100644
+--- a/net/wireless/util.c
++++ b/net/wireless/util.c
+@@ -725,7 +725,7 @@ void cfg80211_upload_connect_keys(struct wireless_dev *wdev)
+ 	wdev->connect_keys = NULL;
+ }
+ 
+-static void cfg80211_process_wdev_events(struct wireless_dev *wdev)
++void cfg80211_process_wdev_events(struct wireless_dev *wdev)
+ {
+ 	struct cfg80211_event *ev;
+ 	unsigned long flags;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0023-rt61pci-fix-NULL-pointer-dereference-in-config_lna_g.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0023-rt61pci-fix-NULL-pointer-dereference-in-config_lna_g.patch
new file mode 100644
index 0000000..7ada863
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0023-rt61pci-fix-NULL-pointer-dereference-in-config_lna_g.patch
@@ -0,0 +1,39 @@
+From 6eeecbf1bfca2b6453a4708a0e0392ba10db91b4 Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Fri, 3 Aug 2012 12:49:14 +0200
+Subject: [PATCH 23/38] rt61pci: fix NULL pointer dereference in
+ config_lna_gain
+
+commit deee0214def5d8a32b8112f11d9c2b1696e9c0cb upstream.
+
+We can not pass NULL libconf->conf->channel to rt61pci_config() as it
+is dereferenced unconditionally in rt61pci_config_lna_gain() subroutine.
+
+Resolves:
+https://bugzilla.kernel.org/show_bug.cgi?id=44361
+
+Reported-and-tested-by: <dolohow@gmail.com>
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rt2x00/rt61pci.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt61pci.c b/drivers/net/wireless/rt2x00/rt61pci.c
+index bf55b4a..d69f88c 100644
+--- a/drivers/net/wireless/rt2x00/rt61pci.c
++++ b/drivers/net/wireless/rt2x00/rt61pci.c
+@@ -2243,8 +2243,7 @@ static void rt61pci_txdone(struct rt2x00_dev *rt2x00dev)
+ 
+ static void rt61pci_wakeup(struct rt2x00_dev *rt2x00dev)
+ {
+-	struct ieee80211_conf conf = { .flags = 0 };
+-	struct rt2x00lib_conf libconf = { .conf = &conf };
++	struct rt2x00lib_conf libconf = { .conf = &rt2x00dev->hw->conf };
+ 
+ 	rt61pci_config(rt2x00dev, &libconf, IEEE80211_CONF_CHANGE_PS);
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0024-iwlwifi-disable-greenfield-transmissions-as-a-workar.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0024-iwlwifi-disable-greenfield-transmissions-as-a-workar.patch
new file mode 100644
index 0000000..4a14054
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0024-iwlwifi-disable-greenfield-transmissions-as-a-workar.patch
@@ -0,0 +1,53 @@
+From a05a0b85c314feeebcbf3491dd6ed98e4ffb0958 Mon Sep 17 00:00:00 2001
+From: Johannes Berg <johannes.berg@intel.com>
+Date: Sun, 5 Aug 2012 18:31:46 +0200
+Subject: [PATCH 24/38] iwlwifi: disable greenfield transmissions as a
+ workaround
+
+commit 50e2a30cf6fcaeb2d27360ba614dd169a10041c5 upstream.
+
+There's a bug that causes the rate scaling to get stuck
+when it has to use single-stream rates with a peer that
+can do GF and SGI; the two are incompatible so we can't
+use them together, but that causes the algorithm to not
+work at all, it always rejects updates.
+
+Disable greenfield for now to prevent that problem.
+
+Reviewed-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
+Tested-by: Cesar Eduardo Barros <cesarb@cesarb.net>
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: adjust filename]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/iwlwifi/iwl-agn-rs.c |   13 ++++++++-----
+ 1 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/net/wireless/iwlwifi/iwl-agn-rs.c b/drivers/net/wireless/iwlwifi/iwl-agn-rs.c
+index 9ba2c1b..3395025 100644
+--- a/drivers/net/wireless/iwlwifi/iwl-agn-rs.c
++++ b/drivers/net/wireless/iwlwifi/iwl-agn-rs.c
+@@ -708,11 +708,14 @@ static int rs_toggle_antenna(u32 valid_ant, u32 *rate_n_flags,
+  */
+ static bool rs_use_green(struct ieee80211_sta *sta)
+ {
+-	struct iwl_station_priv *sta_priv = (void *)sta->drv_priv;
+-	struct iwl_rxon_context *ctx = sta_priv->ctx;
+-
+-	return (sta->ht_cap.cap & IEEE80211_HT_CAP_GRN_FLD) &&
+-		!(ctx->ht.non_gf_sta_present);
++	/*
++	 * There's a bug somewhere in this code that causes the
++	 * scaling to get stuck because GF+SGI can't be combined
++	 * in SISO rates. Until we find that bug, disable GF, it
++	 * has only limited benefit and we still interoperate with
++	 * GF APs since we can always receive GF transmissions.
++	 */
++	return false;
+ }
+ 
+ /**
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0025-ALSA-hda-add-dock-support-for-Thinkpad-X230.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0025-ALSA-hda-add-dock-support-for-Thinkpad-X230.patch
new file mode 100644
index 0000000..9ffee7b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0025-ALSA-hda-add-dock-support-for-Thinkpad-X230.patch
@@ -0,0 +1,32 @@
+From d1d4e5b872501c6b9a04a50d656a517fdbb3d7b1 Mon Sep 17 00:00:00 2001
+From: Felix Kaechele <felix@fetzig.org>
+Date: Mon, 6 Aug 2012 23:02:01 +0200
+Subject: [PATCH 25/38] ALSA: hda - add dock support for Thinkpad X230
+
+commit c8415a48fcb7a29889f4405d38c57db351e4b50a upstream.
+
+As with the ThinkPad Models X230 Tablet and T530 the X230 needs a qurik to
+correctly set up the pins for the dock port.
+
+Signed-off-by: Felix Kaechele <felix@fetzig.org>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_realtek.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 36cef6f..2bf8cbb 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -5077,6 +5077,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x17aa, 0x21ca, "Thinkpad L412", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21e9, "Thinkpad Edge 15", ALC269_FIXUP_SKU_IGNORE),
+ 	SND_PCI_QUIRK(0x17aa, 0x21f6, "Thinkpad T530", ALC269_FIXUP_LENOVO_DOCK),
++	SND_PCI_QUIRK(0x17aa, 0x21fa, "Thinkpad X230", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x21fb, "Thinkpad T430s", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x2203, "Thinkpad X230 Tablet", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_QUANTA_MUTE),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0026-e1000e-NIC-goes-up-and-immediately-goes-down.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0026-e1000e-NIC-goes-up-and-immediately-goes-down.patch
new file mode 100644
index 0000000..d5eec9f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0026-e1000e-NIC-goes-up-and-immediately-goes-down.patch
@@ -0,0 +1,41 @@
+From 4391276e45606802564174334f4a43ce57b9601c Mon Sep 17 00:00:00 2001
+From: Tushar Dave <tushar.n.dave@intel.com>
+Date: Tue, 31 Jul 2012 02:02:43 +0000
+Subject: [PATCH 26/38] e1000e: NIC goes up and immediately goes down
+
+commit b7ec70be01a87f2c85df3ae11046e74f9b67e323 upstream.
+
+Found that commit d478eb44 was a bad commit.
+If the link partner is transmitting codeword (even if NULL codeword),
+then the RXCW.C bit will be set so check for RXCW.CW is unnecessary.
+Ref: RH BZ 840642
+
+Reported-by: Fabio Futigami <ffutigam@redhat.com>
+Signed-off-by: Tushar Dave <tushar.n.dave@intel.com>
+CC: Marcelo Ricardo Leitner <mleitner@redhat.com>
+Tested-by: Aaron Brown <aaron.f.brown@intel.com>
+Signed-off-by: Peter P Waskiewicz Jr <peter.p.waskiewicz.jr@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/intel/e1000e/82571.c |    4 +---
+ 1 files changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/e1000e/82571.c b/drivers/net/ethernet/intel/e1000e/82571.c
+index 3072d35..4f4d52a 100644
+--- a/drivers/net/ethernet/intel/e1000e/82571.c
++++ b/drivers/net/ethernet/intel/e1000e/82571.c
+@@ -1600,10 +1600,8 @@ static s32 e1000_check_for_serdes_link_82571(struct e1000_hw *hw)
+ 			 * auto-negotiation in the TXCW register and disable
+ 			 * forced link in the Device Control register in an
+ 			 * attempt to auto-negotiate with our link partner.
+-			 * If the partner code word is null, stop forcing
+-			 * and restart auto negotiation.
+ 			 */
+-			if ((rxcw & E1000_RXCW_C) || !(rxcw & E1000_RXCW_CW))  {
++			if (rxcw & E1000_RXCW_C) {
+ 				/* Enable autoneg, and unforce link up */
+ 				ew32(TXCW, mac->txcw);
+ 				ew32(CTRL, (ctrl & ~E1000_CTRL_SLU));
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0027-ALSA-hda-remove-quirk-for-Dell-Vostro-1015.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0027-ALSA-hda-remove-quirk-for-Dell-Vostro-1015.patch
new file mode 100644
index 0000000..0f76ad6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0027-ALSA-hda-remove-quirk-for-Dell-Vostro-1015.patch
@@ -0,0 +1,32 @@
+From e812f3553b54d0a821ba55198f31d898cf57a6b0 Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Tue, 7 Aug 2012 14:03:29 +0200
+Subject: [PATCH 27/38] ALSA: hda - remove quirk for Dell Vostro 1015
+
+commit e9fc83cb2e5877801a255a37ddbc5be996ea8046 upstream.
+
+This computer is confirmed working with model=auto on kernel 3.2.
+Also, parsing fails with hda-emu with the current model.
+
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_conexant.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/sound/pci/hda/patch_conexant.c b/sound/pci/hda/patch_conexant.c
+index 51a1afc..402f330 100644
+--- a/sound/pci/hda/patch_conexant.c
++++ b/sound/pci/hda/patch_conexant.c
+@@ -3059,7 +3059,6 @@ static const struct snd_pci_quirk cxt5066_cfg_tbl[] = {
+ 	SND_PCI_QUIRK(0x1028, 0x02d8, "Dell Vostro", CXT5066_DELL_VOSTRO),
+ 	SND_PCI_QUIRK(0x1028, 0x02f5, "Dell Vostro 320", CXT5066_IDEAPAD),
+ 	SND_PCI_QUIRK(0x1028, 0x0401, "Dell Vostro 1014", CXT5066_DELL_VOSTRO),
+-	SND_PCI_QUIRK(0x1028, 0x0402, "Dell Vostro", CXT5066_DELL_VOSTRO),
+ 	SND_PCI_QUIRK(0x1028, 0x0408, "Dell Inspiron One 19T", CXT5066_IDEAPAD),
+ 	SND_PCI_QUIRK(0x1028, 0x050f, "Dell Inspiron", CXT5066_IDEAPAD),
+ 	SND_PCI_QUIRK(0x1028, 0x0510, "Dell Vostro", CXT5066_IDEAPAD),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0028-ALSA-hda-Fix-double-quirk-for-Quanta-FL1-Lenovo-Idea.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0028-ALSA-hda-Fix-double-quirk-for-Quanta-FL1-Lenovo-Idea.patch
new file mode 100644
index 0000000..8bd1291
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0028-ALSA-hda-Fix-double-quirk-for-Quanta-FL1-Lenovo-Idea.patch
@@ -0,0 +1,43 @@
+From 48c0a41688550241188e24029bfbc89b431f39be Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Wed, 8 Aug 2012 08:43:37 +0200
+Subject: [PATCH 28/38] ALSA: hda - Fix double quirk for Quanta FL1 / Lenovo
+ Ideapad
+
+commit 012e7eb1e501d0120e0383b81477f63091f5e365 upstream.
+
+The same ID is twice in the quirk table, so the second one is not used.
+
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_realtek.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 2bf8cbb..32c8169 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -4981,6 +4981,8 @@ static const struct alc_fixup alc269_fixups[] = {
+ 	[ALC269_FIXUP_PCM_44K] = {
+ 		.type = ALC_FIXUP_FUNC,
+ 		.v.func = alc269_fixup_pcm_44k,
++		.chained = true,
++		.chain_id = ALC269_FIXUP_QUANTA_MUTE
+ 	},
+ 	[ALC269_FIXUP_STEREO_DMIC] = {
+ 		.type = ALC_FIXUP_FUNC,
+@@ -5080,8 +5082,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x17aa, 0x21fa, "Thinkpad X230", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x21fb, "Thinkpad T430s", ALC269_FIXUP_LENOVO_DOCK),
+ 	SND_PCI_QUIRK(0x17aa, 0x2203, "Thinkpad X230 Tablet", ALC269_FIXUP_LENOVO_DOCK),
+-	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_QUANTA_MUTE),
+-	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Lenovo Ideapd", ALC269_FIXUP_PCM_44K),
++	SND_PCI_QUIRK(0x17aa, 0x3bf8, "Quanta FL1", ALC269_FIXUP_PCM_44K),
+ 	SND_PCI_QUIRK(0x17aa, 0x9e54, "LENOVO NB", ALC269_FIXUP_LENOVO_EAPD),
+ 
+ #if 1
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0029-ARM-pxa-remove-irq_to_gpio-from-ezx-pcap-driver.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0029-ARM-pxa-remove-irq_to_gpio-from-ezx-pcap-driver.patch
new file mode 100644
index 0000000..74e4c99
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0029-ARM-pxa-remove-irq_to_gpio-from-ezx-pcap-driver.patch
@@ -0,0 +1,57 @@
+From d1a256509df27e34f01e3c36017f21fd94b9d40f Mon Sep 17 00:00:00 2001
+From: Arnd Bergmann <arnd@arndb.de>
+Date: Sun, 5 Aug 2012 14:58:37 +0000
+Subject: [PATCH 29/38] ARM: pxa: remove irq_to_gpio from ezx-pcap driver
+
+commit 59ee93a528b94ef4e81a08db252b0326feff171f upstream.
+
+The irq_to_gpio function was removed from the pxa platform
+in linux-3.2, and this driver has been broken since.
+
+There is actually no in-tree user of this driver that adds
+this platform device, but the driver can and does get enabled
+on some platforms.
+
+Without this patch, building ezx_defconfig results in:
+
+drivers/mfd/ezx-pcap.c: In function 'pcap_isr_work':
+drivers/mfd/ezx-pcap.c:205:2: error: implicit declaration of function 'irq_to_gpio' [-Werror=implicit-function-declaration]
+
+Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+Acked-by: Haojian Zhuang <haojian.zhuang@gmail.com>
+Cc: Samuel Ortiz <sameo@linux.intel.com>
+Cc: Daniel Ribeiro <drwyrm@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/mfd/ezx-pcap.c       |    2 +-
+ include/linux/mfd/ezx-pcap.h |    1 +
+ 2 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
+index 43a76c4..db662e2 100644
+--- a/drivers/mfd/ezx-pcap.c
++++ b/drivers/mfd/ezx-pcap.c
+@@ -202,7 +202,7 @@ static void pcap_isr_work(struct work_struct *work)
+ 		}
+ 		local_irq_enable();
+ 		ezx_pcap_write(pcap, PCAP_REG_MSR, pcap->msr);
+-	} while (gpio_get_value(irq_to_gpio(pcap->spi->irq)));
++	} while (gpio_get_value(pdata->gpio));
+ }
+ 
+ static void pcap_irq_handler(unsigned int irq, struct irq_desc *desc)
+diff --git a/include/linux/mfd/ezx-pcap.h b/include/linux/mfd/ezx-pcap.h
+index 40c37216..32a1b5c 100644
+--- a/include/linux/mfd/ezx-pcap.h
++++ b/include/linux/mfd/ezx-pcap.h
+@@ -16,6 +16,7 @@ struct pcap_subdev {
+ struct pcap_platform_data {
+ 	unsigned int irq_base;
+ 	unsigned int config;
++	int gpio;
+ 	void (*init) (void *);	/* board specific init */
+ 	int num_subdevs;
+ 	struct pcap_subdev *subdevs;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0030-Input-eeti_ts-pass-gpio-value-instead-of-IRQ.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0030-Input-eeti_ts-pass-gpio-value-instead-of-IRQ.patch
new file mode 100644
index 0000000..ba341a4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0030-Input-eeti_ts-pass-gpio-value-instead-of-IRQ.patch
@@ -0,0 +1,150 @@
+From 2cc9ed812de17dc47de5a66405766895cc02c729 Mon Sep 17 00:00:00 2001
+From: Arnd Bergmann <arnd@arndb.de>
+Date: Mon, 30 Apr 2012 16:21:37 +0000
+Subject: [PATCH 30/38] Input: eeti_ts: pass gpio value instead of IRQ
+
+commit 4eef6cbfcc03b294d9d334368a851b35b496ce53 upstream.
+
+The EETI touchscreen asserts its IRQ line as soon as it has data in its
+internal buffers. The line is automatically deasserted once all data has
+been read via I2C. Hence, the driver has to monitor the GPIO line and
+cannot simply rely on the interrupt handler reception.
+
+In the current implementation of the driver, irq_to_gpio() is used to
+determine the GPIO number from the i2c_client's IRQ value.
+
+As irq_to_gpio() is not available on all platforms, this patch changes
+this and makes the driver ignore the passed in IRQ. Instead, a GPIO is
+added to the platform_data struct and gpio_to_irq is used to derive the
+IRQ from that GPIO. If this fails, bail out. The driver is only able to
+work in environments where the touchscreen GPIO can be mapped to an
+IRQ.
+
+Without this patch, building raumfeld_defconfig results in:
+
+drivers/input/touchscreen/eeti_ts.c: In function 'eeti_ts_irq_active':
+drivers/input/touchscreen/eeti_ts.c:65:2: error: implicit declaration of function 'irq_to_gpio' [-Werror=implicit-function-declaration]
+
+Signed-off-by: Daniel Mack <zonque@gmail.com>
+Signed-off-by: Arnd Bergmann <arnd@arndb.de>
+Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Cc: Sven Neumann <s.neumann@raumfeld.com>
+Cc: linux-input@vger.kernel.org
+Cc: Haojian Zhuang <haojian.zhuang@gmail.com>
+[bwh: Backported to 3.2: raumfeld_controller_i2c_board_info.irq was
+ initialised using gpio_to_irq(), but this doesn't seem to matter]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/mach-pxa/raumfeld.c        |    2 +-
+ drivers/input/touchscreen/eeti_ts.c |   21 +++++++++++++--------
+ include/linux/input/eeti_ts.h       |    1 +
+ 3 files changed, 15 insertions(+), 9 deletions(-)
+
+diff --git a/arch/arm/mach-pxa/raumfeld.c b/arch/arm/mach-pxa/raumfeld.c
+index f0c05f4..ae7786d 100644
+--- a/arch/arm/mach-pxa/raumfeld.c
++++ b/arch/arm/mach-pxa/raumfeld.c
+@@ -951,12 +951,12 @@ static struct i2c_board_info raumfeld_connector_i2c_board_info __initdata = {
+ 
+ static struct eeti_ts_platform_data eeti_ts_pdata = {
+ 	.irq_active_high = 1,
++	.irq_gpio = GPIO_TOUCH_IRQ,
+ };
+ 
+ static struct i2c_board_info raumfeld_controller_i2c_board_info __initdata = {
+ 	.type	= "eeti_ts",
+ 	.addr	= 0x0a,
+-	.irq	= gpio_to_irq(GPIO_TOUCH_IRQ),
+ 	.platform_data = &eeti_ts_pdata,
+ };
+ 
+diff --git a/drivers/input/touchscreen/eeti_ts.c b/drivers/input/touchscreen/eeti_ts.c
+index 7f8f538..4f938bb 100644
+--- a/drivers/input/touchscreen/eeti_ts.c
++++ b/drivers/input/touchscreen/eeti_ts.c
+@@ -48,7 +48,7 @@ struct eeti_ts_priv {
+ 	struct input_dev *input;
+ 	struct work_struct work;
+ 	struct mutex mutex;
+-	int irq, irq_active_high;
++	int irq_gpio, irq, irq_active_high;
+ };
+ 
+ #define EETI_TS_BITDEPTH	(11)
+@@ -62,7 +62,7 @@ struct eeti_ts_priv {
+ 
+ static inline int eeti_ts_irq_active(struct eeti_ts_priv *priv)
+ {
+-	return gpio_get_value(irq_to_gpio(priv->irq)) == priv->irq_active_high;
++	return gpio_get_value(priv->irq_gpio) == priv->irq_active_high;
+ }
+ 
+ static void eeti_ts_read(struct work_struct *work)
+@@ -157,7 +157,7 @@ static void eeti_ts_close(struct input_dev *dev)
+ static int __devinit eeti_ts_probe(struct i2c_client *client,
+ 				   const struct i2c_device_id *idp)
+ {
+-	struct eeti_ts_platform_data *pdata;
++	struct eeti_ts_platform_data *pdata = client->dev.platform_data;
+ 	struct eeti_ts_priv *priv;
+ 	struct input_dev *input;
+ 	unsigned int irq_flags;
+@@ -199,9 +199,12 @@ static int __devinit eeti_ts_probe(struct i2c_client *client,
+ 
+ 	priv->client = client;
+ 	priv->input = input;
+-	priv->irq = client->irq;
++	priv->irq_gpio = pdata->irq_gpio;
++	priv->irq = gpio_to_irq(pdata->irq_gpio);
+ 
+-	pdata = client->dev.platform_data;
++	err = gpio_request_one(pdata->irq_gpio, GPIOF_IN, client->name);
++	if (err < 0)
++		goto err1;
+ 
+ 	if (pdata)
+ 		priv->irq_active_high = pdata->irq_active_high;
+@@ -215,13 +218,13 @@ static int __devinit eeti_ts_probe(struct i2c_client *client,
+ 
+ 	err = input_register_device(input);
+ 	if (err)
+-		goto err1;
++		goto err2;
+ 
+ 	err = request_irq(priv->irq, eeti_ts_isr, irq_flags,
+ 			  client->name, priv);
+ 	if (err) {
+ 		dev_err(&client->dev, "Unable to request touchscreen IRQ.\n");
+-		goto err2;
++		goto err3;
+ 	}
+ 
+ 	/*
+@@ -233,9 +236,11 @@ static int __devinit eeti_ts_probe(struct i2c_client *client,
+ 	device_init_wakeup(&client->dev, 0);
+ 	return 0;
+ 
+-err2:
++err3:
+ 	input_unregister_device(input);
+ 	input = NULL; /* so we dont try to free it below */
++err2:
++	gpio_free(pdata->irq_gpio);
+ err1:
+ 	input_free_device(input);
+ 	kfree(priv);
+diff --git a/include/linux/input/eeti_ts.h b/include/linux/input/eeti_ts.h
+index f875b31..16625d7 100644
+--- a/include/linux/input/eeti_ts.h
++++ b/include/linux/input/eeti_ts.h
+@@ -2,6 +2,7 @@
+ #define LINUX_INPUT_EETI_TS_H
+ 
+ struct eeti_ts_platform_data {
++	int irq_gpio;
+ 	unsigned int irq_active_high;
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0031-drm-i915-Add-wait_for-in-init_ring_common.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0031-drm-i915-Add-wait_for-in-init_ring_common.patch
new file mode 100644
index 0000000..e45866d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0031-drm-i915-Add-wait_for-in-init_ring_common.patch
@@ -0,0 +1,41 @@
+From d23b1ce378587bb69517adb584a891ae632e6796 Mon Sep 17 00:00:00 2001
+From: Sean Paul <seanpaul@chromium.org>
+Date: Fri, 16 Mar 2012 12:43:22 -0400
+Subject: [PATCH 31/38] drm/i915: Add wait_for in init_ring_common
+
+commit f01db988ef6f6c70a6cc36ee71e4a98a68901229 upstream.
+
+I have seen a number of "blt ring initialization failed" messages
+where the ctl or start registers are not the correct value. Upon further
+inspection, if the code just waited a little bit, it would read the
+correct value. Adding the wait_for to these reads should eliminate the
+issue.
+
+Signed-off-by: Sean Paul <seanpaul@chromium.org>
+Reviewed-by: Ben Widawsky <ben@bwidawsk.net>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_ringbuffer.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_ringbuffer.c b/drivers/gpu/drm/i915/intel_ringbuffer.c
+index d2cbe5d..4983e59 100644
+--- a/drivers/gpu/drm/i915/intel_ringbuffer.c
++++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
+@@ -295,9 +295,9 @@ static int init_ring_common(struct intel_ring_buffer *ring)
+ 			| RING_VALID);
+ 
+ 	/* If the head is still not zero, the ring is dead */
+-	if ((I915_READ_CTL(ring) & RING_VALID) == 0 ||
+-	    I915_READ_START(ring) != obj->gtt_offset ||
+-	    (I915_READ_HEAD(ring) & HEAD_ADDR) != 0) {
++	if (wait_for((I915_READ_CTL(ring) & RING_VALID) != 0 &&
++		     I915_READ_START(ring) == obj->gtt_offset &&
++		     (I915_READ_HEAD(ring) & HEAD_ADDR) == 0, 50)) {
+ 		DRM_ERROR("%s initialization failed "
+ 				"ctl %08x head %08x tail %08x start %08x\n",
+ 				ring->name,
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0032-drm-i915-correctly-order-the-ring-init-sequence.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0032-drm-i915-correctly-order-the-ring-init-sequence.patch
new file mode 100644
index 0000000..dffe4de
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0032-drm-i915-correctly-order-the-ring-init-sequence.patch
@@ -0,0 +1,49 @@
+From 0985ae7d2afe20b2e54416d1985672a37aea9f0a Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Tue, 7 Aug 2012 09:54:14 +0200
+Subject: [PATCH 32/38] drm/i915: correctly order the ring init sequence
+
+commit 0d8957c8a90bbb5d34fab9a304459448a5131e06 upstream.
+
+We may only start to set up the new register values after having
+confirmed that the ring is truely off. Otherwise the hw might lose the
+newly written register values. This is caught later on in the init
+sequence, when we check whether the register writes have stuck.
+
+Reviewed-by: Jani Nikula <jani.nikula@intel.com>
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=50522
+Tested-by: Yang Guang <guang.a.yang@intel.com>
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_ringbuffer.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_ringbuffer.c b/drivers/gpu/drm/i915/intel_ringbuffer.c
+index 4983e59..19085c0 100644
+--- a/drivers/gpu/drm/i915/intel_ringbuffer.c
++++ b/drivers/gpu/drm/i915/intel_ringbuffer.c
+@@ -263,8 +263,6 @@ static int init_ring_common(struct intel_ring_buffer *ring)
+ 	I915_WRITE_HEAD(ring, 0);
+ 	ring->write_tail(ring, 0);
+ 
+-	/* Initialize the ring. */
+-	I915_WRITE_START(ring, obj->gtt_offset);
+ 	head = I915_READ_HEAD(ring) & HEAD_ADDR;
+ 
+ 	/* G45 ring initialization fails to reset head to zero */
+@@ -290,6 +288,11 @@ static int init_ring_common(struct intel_ring_buffer *ring)
+ 		}
+ 	}
+ 
++	/* Initialize the ring. This must happen _after_ we've cleared the ring
++	 * registers with the above sequence (the readback of the HEAD registers
++	 * also enforces ordering), otherwise the hw might lose the new ring
++	 * register values. */
++	I915_WRITE_START(ring, obj->gtt_offset);
+ 	I915_WRITE_CTL(ring,
+ 			((ring->size - PAGE_SIZE) & RING_NR_PAGES)
+ 			| RING_VALID);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0033-s390-compat-fix-compat-wrappers-for-process_vm-syste.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0033-s390-compat-fix-compat-wrappers-for-process_vm-syste.patch
new file mode 100644
index 0000000..b004b58
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0033-s390-compat-fix-compat-wrappers-for-process_vm-syste.patch
@@ -0,0 +1,40 @@
+From 664f500626e5151a1b9350bb7e6fc68618d7769c Mon Sep 17 00:00:00 2001
+From: Heiko Carstens <heiko.carstens@de.ibm.com>
+Date: Tue, 7 Aug 2012 09:48:13 +0200
+Subject: [PATCH 33/38] s390/compat: fix compat wrappers for process_vm system
+ calls
+
+commit 82aabdb6f1eb61e0034ec23901480f5dd23db7c4 upstream.
+
+The compat wrappers incorrectly called the non compat versions of
+the system process_vm system calls.
+
+Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/s390/kernel/compat_wrapper.S |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/s390/kernel/compat_wrapper.S b/arch/s390/kernel/compat_wrapper.S
+index 18c51df..25408d3 100644
+--- a/arch/s390/kernel/compat_wrapper.S
++++ b/arch/s390/kernel/compat_wrapper.S
+@@ -1636,7 +1636,7 @@ ENTRY(compat_sys_process_vm_readv_wrapper)
+ 	llgfr	%r6,%r6			# unsigned long
+ 	llgf	%r0,164(%r15)		# unsigned long
+ 	stg	%r0,160(%r15)
+-	jg	sys_process_vm_readv
++	jg	compat_sys_process_vm_readv
+ 
+ ENTRY(compat_sys_process_vm_writev_wrapper)
+ 	lgfr	%r2,%r2			# compat_pid_t
+@@ -1646,4 +1646,4 @@ ENTRY(compat_sys_process_vm_writev_wrapper)
+ 	llgfr	%r6,%r6			# unsigned long
+ 	llgf	%r0,164(%r15)		# unsigned long
+ 	stg	%r0,160(%r15)
+-	jg	sys_process_vm_writev
++	jg	compat_sys_process_vm_writev
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0034-s390-compat-fix-mmap-compat-system-calls.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0034-s390-compat-fix-mmap-compat-system-calls.patch
new file mode 100644
index 0000000..043e7cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0034-s390-compat-fix-mmap-compat-system-calls.patch
@@ -0,0 +1,54 @@
+From 406540dcb821843e6807203e7530a00909d42bf0 Mon Sep 17 00:00:00 2001
+From: Heiko Carstens <heiko.carstens@de.ibm.com>
+Date: Wed, 8 Aug 2012 09:32:20 +0200
+Subject: [PATCH 34/38] s390/compat: fix mmap compat system calls
+
+commit e85871218513c54f7dfdb6009043cb638f2fecbe upstream.
+
+The native 31 bit and the compat behaviour for the mmap system calls differ:
+
+In native 31 bit mode the passed in address for the mmap system call will be
+unmodified passed to sys_mmap_pgoff().
+In compat mode however the passed in address will be modified with
+compat_ptr() which masks out the most significant bit.
+
+The result is that in native 31 bit mode each mmap request (with MAP_FIXED)
+will fail where the most significat bit is set, while in compat mode it
+may succeed.
+
+This odd behaviour was introduced with d3815898 "[S390] mmap: add missing
+compat_ptr conversion to both mmap compat syscalls".
+
+To restore a consistent behaviour accross native and compat mode this
+patch functionally reverts the above mentioned commit.
+
+Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/s390/kernel/compat_linux.c |    2 --
+ 1 files changed, 0 insertions(+), 2 deletions(-)
+
+diff --git a/arch/s390/kernel/compat_linux.c b/arch/s390/kernel/compat_linux.c
+index 84a9828..38c6645 100644
+--- a/arch/s390/kernel/compat_linux.c
++++ b/arch/s390/kernel/compat_linux.c
+@@ -615,7 +615,6 @@ asmlinkage unsigned long old32_mmap(struct mmap_arg_struct_emu31 __user *arg)
+ 		return -EFAULT;
+ 	if (a.offset & ~PAGE_MASK)
+ 		return -EINVAL;
+-	a.addr = (unsigned long) compat_ptr(a.addr);
+ 	return sys_mmap_pgoff(a.addr, a.len, a.prot, a.flags, a.fd,
+ 			      a.offset >> PAGE_SHIFT);
+ }
+@@ -626,7 +625,6 @@ asmlinkage long sys32_mmap2(struct mmap_arg_struct_emu31 __user *arg)
+ 
+ 	if (copy_from_user(&a, arg, sizeof(a)))
+ 		return -EFAULT;
+-	a.addr = (unsigned long) compat_ptr(a.addr);
+ 	return sys_mmap_pgoff(a.addr, a.len, a.prot, a.flags, a.fd, a.offset);
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0035-drm-radeon-fix-bank-tiling-parameters-on-evergreen.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0035-drm-radeon-fix-bank-tiling-parameters-on-evergreen.patch
new file mode 100644
index 0000000..e95ddc7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0035-drm-radeon-fix-bank-tiling-parameters-on-evergreen.patch
@@ -0,0 +1,44 @@
+From 15678bda8906e4eef89b8b2f9661a765f86aced6 Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Tue, 31 Jul 2012 11:01:10 -0400
+Subject: [PATCH 35/38] drm/radeon: fix bank tiling parameters on evergreen
+
+commit c8d15edc17d836686d1f071e564800e1a2724fa6 upstream.
+
+Handle the 16 bank case.
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/evergreen.c |   14 +++++++++++---
+ 1 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
+index 931f4df..3fdbdd1 100644
+--- a/drivers/gpu/drm/radeon/evergreen.c
++++ b/drivers/gpu/drm/radeon/evergreen.c
+@@ -2080,10 +2080,18 @@ static void evergreen_gpu_init(struct radeon_device *rdev)
+ 	if (rdev->flags & RADEON_IS_IGP)
+ 		rdev->config.evergreen.tile_config |= 1 << 4;
+ 	else {
+-		if ((mc_arb_ramcfg & NOOFBANK_MASK) >> NOOFBANK_SHIFT)
+-			rdev->config.evergreen.tile_config |= 1 << 4;
+-		else
++		switch ((mc_arb_ramcfg & NOOFBANK_MASK) >> NOOFBANK_SHIFT) {
++		case 0: /* four banks */
+ 			rdev->config.evergreen.tile_config |= 0 << 4;
++			break;
++		case 1: /* eight banks */
++			rdev->config.evergreen.tile_config |= 1 << 4;
++			break;
++		case 2: /* sixteen banks */
++		default:
++			rdev->config.evergreen.tile_config |= 2 << 4;
++			break;
++		}
+ 	}
+ 	rdev->config.evergreen.tile_config |=
+ 		((mc_arb_ramcfg & BURSTLENGTH_MASK) >> BURSTLENGTH_SHIFT) << 8;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0036-drm-radeon-fix-bank-tiling-parameters-on-cayman.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0036-drm-radeon-fix-bank-tiling-parameters-on-cayman.patch
new file mode 100644
index 0000000..e001c22
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0036-drm-radeon-fix-bank-tiling-parameters-on-cayman.patch
@@ -0,0 +1,45 @@
+From 175620c56b4907a68fd11f7bfbea559739394915 Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Tue, 31 Jul 2012 11:05:11 -0400
+Subject: [PATCH 36/38] drm/radeon: fix bank tiling parameters on cayman
+
+commit 5b23c9045a8b61352986270b2d109edf5085e113 upstream.
+
+Handle the 16 bank case.
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+[bwh: Backported to 3.2: adjust context, indentation]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/ni.c |   14 +++++++++++---
+ 1 files changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/ni.c b/drivers/gpu/drm/radeon/ni.c
+index 9e50814..636255b 100644
+--- a/drivers/gpu/drm/radeon/ni.c
++++ b/drivers/gpu/drm/radeon/ni.c
+@@ -804,10 +804,18 @@ static void cayman_gpu_init(struct radeon_device *rdev)
+ 		rdev->config.cayman.tile_config |= (3 << 0);
+ 		break;
+ 	}
+-	if ((mc_arb_ramcfg & NOOFBANK_MASK) >> NOOFBANK_SHIFT)
+-		rdev->config.cayman.tile_config |= 1 << 4;
+-	else
++	switch ((mc_arb_ramcfg & NOOFBANK_MASK) >> NOOFBANK_SHIFT) {
++	case 0: /* four banks */
+ 		rdev->config.cayman.tile_config |= 0 << 4;
++		break;
++	case 1: /* eight banks */
++		rdev->config.cayman.tile_config |= 1 << 4;
++		break;
++	case 2: /* sixteen banks */
++	default:
++		rdev->config.cayman.tile_config |= 2 << 4;
++		break;
++	}
+ 	rdev->config.cayman.tile_config |=
+ 		((gb_addr_config & PIPE_INTERLEAVE_SIZE_MASK) >> PIPE_INTERLEAVE_SIZE_SHIFT) << 8;
+ 	rdev->config.cayman.tile_config |=
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0037-drm-radeon-do-not-reenable-crtc-after-moving-vram-st.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0037-drm-radeon-do-not-reenable-crtc-after-moving-vram-st.patch
new file mode 100644
index 0000000..435ae16
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0037-drm-radeon-do-not-reenable-crtc-after-moving-vram-st.patch
@@ -0,0 +1,178 @@
+From 5c84fba575f5b4915184ba74d2f3be21ffb231b9 Mon Sep 17 00:00:00 2001
+From: Jerome Glisse <jglisse@redhat.com>
+Date: Fri, 27 Jul 2012 16:32:24 -0400
+Subject: [PATCH 37/38] drm/radeon: do not reenable crtc after moving vram
+ start address
+
+commit 81ee8fb6b52ec69eeed37fe7943446af1dccecc5 upstream.
+
+It seems we can not update the crtc scanout address. After disabling
+crtc, update to base address do not take effect after crtc being
+reenable leading to at least frame being scanout from the old crtc
+base address. Disabling crtc display request lead to same behavior.
+
+So after changing the vram address if we don't keep crtc disabled
+we will have the GPU trying to read some random system memory address
+with some iommu this will broke the crtc engine and will lead to
+broken display and iommu error message.
+
+So to avoid this, disable crtc. For flicker less boot we will need
+to avoid moving the vram start address.
+
+This patch should also fix :
+
+https://bugs.freedesktop.org/show_bug.cgi?id=42373
+
+Signed-off-by: Jerome Glisse <jglisse@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/evergreen.c   |   57 ----------------------------------
+ drivers/gpu/drm/radeon/radeon_asic.h |    8 +---
+ drivers/gpu/drm/radeon/rv515.c       |   13 --------
+ 3 files changed, 2 insertions(+), 76 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/evergreen.c b/drivers/gpu/drm/radeon/evergreen.c
+index 3fdbdd1..fc0633c 100644
+--- a/drivers/gpu/drm/radeon/evergreen.c
++++ b/drivers/gpu/drm/radeon/evergreen.c
+@@ -1065,24 +1065,8 @@ void evergreen_agp_enable(struct radeon_device *rdev)
+ 
+ void evergreen_mc_stop(struct radeon_device *rdev, struct evergreen_mc_save *save)
+ {
+-	save->vga_control[0] = RREG32(D1VGA_CONTROL);
+-	save->vga_control[1] = RREG32(D2VGA_CONTROL);
+ 	save->vga_render_control = RREG32(VGA_RENDER_CONTROL);
+ 	save->vga_hdp_control = RREG32(VGA_HDP_CONTROL);
+-	save->crtc_control[0] = RREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC0_REGISTER_OFFSET);
+-	save->crtc_control[1] = RREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC1_REGISTER_OFFSET);
+-	if (rdev->num_crtc >= 4) {
+-		save->vga_control[2] = RREG32(EVERGREEN_D3VGA_CONTROL);
+-		save->vga_control[3] = RREG32(EVERGREEN_D4VGA_CONTROL);
+-		save->crtc_control[2] = RREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC2_REGISTER_OFFSET);
+-		save->crtc_control[3] = RREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC3_REGISTER_OFFSET);
+-	}
+-	if (rdev->num_crtc >= 6) {
+-		save->vga_control[4] = RREG32(EVERGREEN_D5VGA_CONTROL);
+-		save->vga_control[5] = RREG32(EVERGREEN_D6VGA_CONTROL);
+-		save->crtc_control[4] = RREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC4_REGISTER_OFFSET);
+-		save->crtc_control[5] = RREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC5_REGISTER_OFFSET);
+-	}
+ 
+ 	/* Stop all video */
+ 	WREG32(VGA_RENDER_CONTROL, 0);
+@@ -1193,47 +1177,6 @@ void evergreen_mc_resume(struct radeon_device *rdev, struct evergreen_mc_save *s
+ 	/* Unlock host access */
+ 	WREG32(VGA_HDP_CONTROL, save->vga_hdp_control);
+ 	mdelay(1);
+-	/* Restore video state */
+-	WREG32(D1VGA_CONTROL, save->vga_control[0]);
+-	WREG32(D2VGA_CONTROL, save->vga_control[1]);
+-	if (rdev->num_crtc >= 4) {
+-		WREG32(EVERGREEN_D3VGA_CONTROL, save->vga_control[2]);
+-		WREG32(EVERGREEN_D4VGA_CONTROL, save->vga_control[3]);
+-	}
+-	if (rdev->num_crtc >= 6) {
+-		WREG32(EVERGREEN_D5VGA_CONTROL, save->vga_control[4]);
+-		WREG32(EVERGREEN_D6VGA_CONTROL, save->vga_control[5]);
+-	}
+-	WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC0_REGISTER_OFFSET, 1);
+-	WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC1_REGISTER_OFFSET, 1);
+-	if (rdev->num_crtc >= 4) {
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC2_REGISTER_OFFSET, 1);
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC3_REGISTER_OFFSET, 1);
+-	}
+-	if (rdev->num_crtc >= 6) {
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC4_REGISTER_OFFSET, 1);
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC5_REGISTER_OFFSET, 1);
+-	}
+-	WREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC0_REGISTER_OFFSET, save->crtc_control[0]);
+-	WREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC1_REGISTER_OFFSET, save->crtc_control[1]);
+-	if (rdev->num_crtc >= 4) {
+-		WREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC2_REGISTER_OFFSET, save->crtc_control[2]);
+-		WREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC3_REGISTER_OFFSET, save->crtc_control[3]);
+-	}
+-	if (rdev->num_crtc >= 6) {
+-		WREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC4_REGISTER_OFFSET, save->crtc_control[4]);
+-		WREG32(EVERGREEN_CRTC_CONTROL + EVERGREEN_CRTC5_REGISTER_OFFSET, save->crtc_control[5]);
+-	}
+-	WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC0_REGISTER_OFFSET, 0);
+-	WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC1_REGISTER_OFFSET, 0);
+-	if (rdev->num_crtc >= 4) {
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC2_REGISTER_OFFSET, 0);
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC3_REGISTER_OFFSET, 0);
+-	}
+-	if (rdev->num_crtc >= 6) {
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC4_REGISTER_OFFSET, 0);
+-		WREG32(EVERGREEN_CRTC_UPDATE_LOCK + EVERGREEN_CRTC5_REGISTER_OFFSET, 0);
+-	}
+ 	WREG32(VGA_RENDER_CONTROL, save->vga_render_control);
+ }
+ 
+diff --git a/drivers/gpu/drm/radeon/radeon_asic.h b/drivers/gpu/drm/radeon/radeon_asic.h
+index 5991484..5ce9402 100644
+--- a/drivers/gpu/drm/radeon/radeon_asic.h
++++ b/drivers/gpu/drm/radeon/radeon_asic.h
+@@ -253,13 +253,10 @@ void rs690_line_buffer_adjust(struct radeon_device *rdev,
+  * rv515
+  */
+ struct rv515_mc_save {
+-	u32 d1vga_control;
+-	u32 d2vga_control;
+ 	u32 vga_render_control;
+ 	u32 vga_hdp_control;
+-	u32 d1crtc_control;
+-	u32 d2crtc_control;
+ };
++
+ int rv515_init(struct radeon_device *rdev);
+ void rv515_fini(struct radeon_device *rdev);
+ uint32_t rv515_mc_rreg(struct radeon_device *rdev, uint32_t reg);
+@@ -387,11 +384,10 @@ void r700_cp_fini(struct radeon_device *rdev);
+  * evergreen
+  */
+ struct evergreen_mc_save {
+-	u32 vga_control[6];
+ 	u32 vga_render_control;
+ 	u32 vga_hdp_control;
+-	u32 crtc_control[6];
+ };
++
+ void evergreen_pcie_gart_tlb_flush(struct radeon_device *rdev);
+ int evergreen_init(struct radeon_device *rdev);
+ void evergreen_fini(struct radeon_device *rdev);
+diff --git a/drivers/gpu/drm/radeon/rv515.c b/drivers/gpu/drm/radeon/rv515.c
+index 6613ee9..d5f45b4 100644
+--- a/drivers/gpu/drm/radeon/rv515.c
++++ b/drivers/gpu/drm/radeon/rv515.c
+@@ -281,12 +281,8 @@ int rv515_debugfs_ga_info_init(struct radeon_device *rdev)
+ 
+ void rv515_mc_stop(struct radeon_device *rdev, struct rv515_mc_save *save)
+ {
+-	save->d1vga_control = RREG32(R_000330_D1VGA_CONTROL);
+-	save->d2vga_control = RREG32(R_000338_D2VGA_CONTROL);
+ 	save->vga_render_control = RREG32(R_000300_VGA_RENDER_CONTROL);
+ 	save->vga_hdp_control = RREG32(R_000328_VGA_HDP_CONTROL);
+-	save->d1crtc_control = RREG32(R_006080_D1CRTC_CONTROL);
+-	save->d2crtc_control = RREG32(R_006880_D2CRTC_CONTROL);
+ 
+ 	/* Stop all video */
+ 	WREG32(R_0068E8_D2CRTC_UPDATE_LOCK, 0);
+@@ -311,15 +307,6 @@ void rv515_mc_resume(struct radeon_device *rdev, struct rv515_mc_save *save)
+ 	/* Unlock host access */
+ 	WREG32(R_000328_VGA_HDP_CONTROL, save->vga_hdp_control);
+ 	mdelay(1);
+-	/* Restore video state */
+-	WREG32(R_000330_D1VGA_CONTROL, save->d1vga_control);
+-	WREG32(R_000338_D2VGA_CONTROL, save->d2vga_control);
+-	WREG32(R_0060E8_D1CRTC_UPDATE_LOCK, 1);
+-	WREG32(R_0068E8_D2CRTC_UPDATE_LOCK, 1);
+-	WREG32(R_006080_D1CRTC_CONTROL, save->d1crtc_control);
+-	WREG32(R_006880_D2CRTC_CONTROL, save->d2crtc_control);
+-	WREG32(R_0060E8_D1CRTC_UPDATE_LOCK, 0);
+-	WREG32(R_0068E8_D2CRTC_UPDATE_LOCK, 0);
+ 	WREG32(R_000300_VGA_RENDER_CONTROL, save->vga_render_control);
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0038-Linux-3.2.28.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0038-Linux-3.2.28.patch
new file mode 100644
index 0000000..54aab40
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.28/0038-Linux-3.2.28.patch
@@ -0,0 +1,24 @@
+From 07d458defd356c96a7d4edaeae46b5b17f37fd2b Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Sun, 19 Aug 2012 18:15:38 +0100
+Subject: [PATCH 38/38] Linux 3.2.28
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index bdf851f..5368961 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 27
++SUBLEVEL = 28
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0086-board-am335xevm-Add-Beaglebone-Motor-Cape-Support.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0086-board-am335xevm-Add-Beaglebone-Motor-Cape-Support.patch
new file mode 100644
index 0000000..78055d0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0086-board-am335xevm-Add-Beaglebone-Motor-Cape-Support.patch
@@ -0,0 +1,43 @@
+From 4184217cda11245823527d7b3b65fcb9eeb88c6a Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Mon, 13 Aug 2012 21:44:49 +0100
+Subject: [PATCH 86/87] board-am335xevm: Add Beaglebone Motor Cape Support
+
+   * Beaglebone Motor Cape adds 4 DRV8833 devices connected to
+     the 8 PWM outputs on the beaglebone allowing 8 DC Motors or
+     4 Stepper Motors to be controlled
+      * If PWM channels are not available some of these channels can be
+        remapped to GPIO pins via jumpers
+
+   * GPIOs are used for Direction control of each motor channel (1 per channel)
+   * GPIOs are also used for Sense Feedback from each motor (2 per channel)
+      * Channel 1 sense pins are mapped to QEP0 for use with quadrature encoders
+
+   * Initial Patch recognises the Motor Cape and makes all necessary
+     pins available by ensuring w1 and spi1 are marked as in-use
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ arch/arm/mach-omap2/board-am335xevm.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/board-am335xevm.c b/arch/arm/mach-omap2/board-am335xevm.c
+index 699fab3..f2d4a69 100644
+--- a/arch/arm/mach-omap2/board-am335xevm.c
++++ b/arch/arm/mach-omap2/board-am335xevm.c
+@@ -3165,6 +3165,12 @@ static void beaglebone_cape_setup(struct memory_accessor *mem_acc, void *context
+ 		cssp_gpmc_init();
+ 	}
+ 
++	if (!strncmp("BB-BONE-MOTOR-01", cape_config.partnumber, 16)) {
++		pr_info("BeagleBone cape: initializing Motor cape\n");
++		beaglebone_w1gpio_free = 0;
++		beaglebone_spi1_free = 0;
++        }
++
+ 	goto out2;
+ out:
+ 	/*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0087-mux33xx-Fix-MUXENTRYs-for-MCASP0_ACLKX-FSX-to-add-eh.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0087-mux33xx-Fix-MUXENTRYs-for-MCASP0_ACLKX-FSX-to-add-eh.patch
new file mode 100644
index 0000000..d361e16
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/0087-mux33xx-Fix-MUXENTRYs-for-MCASP0_ACLKX-FSX-to-add-eh.patch
@@ -0,0 +1,37 @@
+From 2bb4fd4b7a1eb2a29de53ca66c67ca92ae52351e Mon Sep 17 00:00:00 2001
+From: Roger Monk <r-monk@ti.com>
+Date: Tue, 14 Aug 2012 18:06:13 +0100
+Subject: [PATCH 87/87] mux33xx: Fix MUXENTRYs for MCASP0_ACLKX/FSX to add
+ ehrpwm0 and pru pins
+
+   * Add Mux Entries for ehrpwm0 to MCASP0_CLKX/FSX pins
+   * Also add modes 5/6 to the same pins for completeness (pru pins)
+
+Signed-off-by: Roger Monk <r-monk@ti.com>
+---
+ arch/arm/mach-omap2/mux33xx.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 852f7f0..c0d14b3 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -335,11 +335,11 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		"i2c0_scl", NULL, NULL, NULL,
+ 		NULL, NULL, NULL, "gpio3_6"),
+ 	_AM33XX_MUXENTRY(MCASP0_ACLKX, 0,
+-		"mcasp0_aclkx", NULL, NULL, "spi1_sclk",
+-		"mmc0_sdcd", NULL, NULL, "gpio3_14"),
++		"mcasp0_aclkx", "ehrpwm0A", NULL, "spi1_sclk",
++		"mmc0_sdcd", "pr1_pru0_pru_r30_0", "pr1_pru0_pru_r31_0", "gpio3_14"),
+ 	_AM33XX_MUXENTRY(MCASP0_FSX, 0,
+-		"mcasp0_fsx", NULL, NULL, "spi1_d0",
+-		"mmc1_sdcd", NULL, NULL, "gpio3_15"),
++		"mcasp0_fsx", "ehrpwm0B", NULL, "spi1_d0",
++		"mmc1_sdcd", "pr1_pru0_pru_r30_1", "pr1_pru0_pru_r31_1", "gpio3_15"),
+ 	_AM33XX_MUXENTRY(MCASP0_AXR0, 0,
+ 		"mcasp0_axr0", NULL, NULL, "spi1_d1",
+ 		"mmc2_sdcd", NULL, NULL, "gpio3_16"),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
index 87b7741..bd24051 100644
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch
@@ -1,7 +1,7 @@
-From 59d23a375a752abc6a6a8ddd935d1b367f69ed3d Mon Sep 17 00:00:00 2001
+From a48682f0690f07aa31d3e9d5d24388f0aee0bf3d Mon Sep 17 00:00:00 2001
 From: Alexander Holler <hol...@ahsoftware.de>
 Date: Wed, 25 Apr 2012 00:50:03 +0200
-Subject: [PATCH] leds: heartbeat: stop on shutdown, reboot or panic
+Subject: [PATCH 1/4] leds: heartbeat: stop on shutdown, reboot or panic
 
 A halted kernel should not show a heartbeat.
 
@@ -9,7 +9,7 @@ Signed-off-by: Alexander Holler <hol...@ahsoftware.de>
 Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
 ---
  drivers/leds/ledtrig-heartbeat.c |   27 ++++++++++++++++++++++++++-
- 1 file changed, 26 insertions(+), 1 deletion(-)
+ 1 files changed, 26 insertions(+), 1 deletions(-)
 
 diff --git a/drivers/leds/ledtrig-heartbeat.c b/drivers/leds/ledtrig-heartbeat.c
 index 759c0bb..31c234c 100644
@@ -63,5 +63,5 @@ index 759c0bb..31c234c 100644
  }
  
 -- 
-1.7.10
+1.7.7.6
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0001-PWM-ecap-Correct-configuration-of-polarity.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0001-PWM-ecap-Correct-configuration-of-polarity.patch
new file mode 100644
index 0000000..1d17a8c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0001-PWM-ecap-Correct-configuration-of-polarity.patch
@@ -0,0 +1,42 @@
+From 0a2068b30dcf949b2852511c4c909e5283cbd540 Mon Sep 17 00:00:00 2001
+From: "Philip, Avinash" <avinashphilip@ti.com>
+Date: Fri, 18 May 2012 12:10:36 +0530
+Subject: [PATCH 1/6] PWM: ecap: Correct configuration of polarity
+
+1. ECAP driver configures PWM polarity wrongly. For example if polarity
+configured low and duty percentage to 20%, PWM output should be 20% low
+and 80% high. However behavior is inverted here.
+
+2. Also reading back from SYSFS interface for polarity always gives 0.
+
+This patch fixes both.
+
+Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
+---
+ drivers/pwm/ecap.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/pwm/ecap.c b/drivers/pwm/ecap.c
+index 63c2405..614be36 100644
+--- a/drivers/pwm/ecap.c
++++ b/drivers/pwm/ecap.c
+@@ -121,7 +121,7 @@ static int ecap_pwm_set_polarity(struct pwm_device *p, char pol)
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 	v = readw(ep->mmio_base + CAPTURE_CTRL2_REG);
+ 	v &= ~ECTRL2_PLSL_LOW;
+-	v |= (!pol << 10);
++	v |= pol << 10;
+ 	writew(v, ep->mmio_base + CAPTURE_CTRL2_REG);
+ 	spin_unlock_irqrestore(&ep->lock, flags);
+ 
+@@ -188,6 +188,7 @@ static int ecap_pwm_config(struct pwm_device *p,
+ 		break;
+ 
+ 	case BIT(PWM_CONFIG_POLARITY):
++		p->active_high = c->polarity;
+ 		ret = ecap_pwm_set_polarity(p, c->polarity);
+ 		break;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0002-ARM-OMAP2-am335x-mux-add-ecap2_in_pwm2_out-string-en.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0002-ARM-OMAP2-am335x-mux-add-ecap2_in_pwm2_out-string-en.patch
new file mode 100644
index 0000000..009c785
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0002-ARM-OMAP2-am335x-mux-add-ecap2_in_pwm2_out-string-en.patch
@@ -0,0 +1,29 @@
+From c2496a91c7a198e0713a00d5d8a3e6d6dd8eea30 Mon Sep 17 00:00:00 2001
+From: "Philip, Avinash" <avinashphilip@ti.com>
+Date: Wed, 16 May 2012 09:43:56 +0530
+Subject: [PATCH 2/6] ARM: OMAP2+: am335x-mux: add ecap2_in_pwm2_out string
+ entry
+
+On am335x-sk board, backlight is control through ecap 2.
+
+Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
+---
+ arch/arm/mach-omap2/mux33xx.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/mux33xx.c b/arch/arm/mach-omap2/mux33xx.c
+index 59e51e0..5749d20 100644
+--- a/arch/arm/mach-omap2/mux33xx.c
++++ b/arch/arm/mach-omap2/mux33xx.c
+@@ -340,7 +340,7 @@ static struct omap_mux __initdata am33xx_muxmodes[] = {
+ 		"mmc2_sdcd", NULL, NULL, "gpio3_16"),
+ 	_AM33XX_MUXENTRY(MCASP0_AHCLKR, 0,
+ 		"mcasp0_ahclkr", NULL, "mcasp0_axr2", "spi1_cs0",
+-		NULL, NULL, NULL, "gpio3_17"),
++		"ecap2_in_pwm2_out", NULL, NULL, "gpio3_17"),
+ 	_AM33XX_MUXENTRY(MCASP0_ACLKR, 0,
+ 		"mcasp0_aclkr", NULL, "mcasp0_axr2", "mcasp1_aclkx",
+ 		"mmc0_sdwp", NULL, NULL, "gpio3_18"),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0003-ARM-OMAP2-AM335x-hwmod-Remove-PRCM-entries-for-PWMSS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0003-ARM-OMAP2-AM335x-hwmod-Remove-PRCM-entries-for-PWMSS.patch
new file mode 100644
index 0000000..fcdc5b2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0003-ARM-OMAP2-AM335x-hwmod-Remove-PRCM-entries-for-PWMSS.patch
@@ -0,0 +1,107 @@
+From 3c42d32f6dac363c3a7e3fa491278592409498cf Mon Sep 17 00:00:00 2001
+From: "Philip, Avinash" <avinashphilip@ti.com>
+Date: Tue, 7 Aug 2012 18:25:50 +0530
+Subject: [PATCH 3/6] ARM: OMAP2+: AM335x: hwmod: Remove PRCM entries for
+ PWMSS
+
+PWMSS clock resources being used as a shared resource for eCAP & eHRPWM
+OMAP devices. However OMAP hwmod didn't protect the race condition for
+accessing shared resources from independent OMAP devices. So removes
+PRCM entries, so that clock framework takes care of clock synchronization
+between eCAP & eHRPWM devices.
+
+NOTE:
+With removal .prcm hwmod data, clock enabling is happening from clock
+frame work. With clock framework, usecount entry in struct clk takes
+care the race condition.
+
+Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
+---
+ arch/arm/mach-omap2/omap_hwmod_33xx_data.c |   36 ----------------------------
+ 1 files changed, 0 insertions(+), 36 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+index 9d3c9a5..832bba3 100644
+--- a/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
++++ b/arch/arm/mach-omap2/omap_hwmod_33xx_data.c
+@@ -729,12 +729,6 @@ static struct omap_hwmod am33xx_ehrpwm0_hwmod = {
+ 	.class		= &am33xx_epwmss_hwmod_class,
+ 	.main_clk	= "epwmss0_fck",
+ 	.clkdm_name	= "l4ls_clkdm",
+-	.prcm		= {
+-		.omap4	= {
+-			.clkctrl_offs	= AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET,
+-			.modulemode	= MODULEMODE_SWCTRL,
+-		},
+-	},
+ 	.slaves		= am33xx_ehrpwm0_slaves,
+ 	.slaves_cnt	= ARRAY_SIZE(am33xx_ehrpwm0_slaves),
+ 	.opt_clks	= ehrpwm0_opt_clks,
+@@ -787,12 +781,6 @@ static struct omap_hwmod am33xx_ehrpwm1_hwmod = {
+ 	.class		= &am33xx_epwmss_hwmod_class,
+ 	.main_clk	= "epwmss1_fck",
+ 	.clkdm_name	= "l4ls_clkdm",
+-	.prcm		= {
+-		.omap4	= {
+-			.clkctrl_offs	= AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET,
+-			.modulemode	= MODULEMODE_SWCTRL,
+-		},
+-	},
+ 	.slaves		= am33xx_ehrpwm1_slaves,
+ 	.slaves_cnt	= ARRAY_SIZE(am33xx_ehrpwm1_slaves),
+ 	.opt_clks	= ehrpwm1_opt_clks,
+@@ -845,12 +833,6 @@ static struct omap_hwmod am33xx_ehrpwm2_hwmod = {
+ 	.class		= &am33xx_epwmss_hwmod_class,
+ 	.main_clk	= "epwmss2_fck",
+ 	.clkdm_name	= "l4ls_clkdm",
+-	.prcm		= {
+-		.omap4	= {
+-			.clkctrl_offs	= AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET,
+-			.modulemode	= MODULEMODE_SWCTRL,
+-		},
+-	},
+ 	.slaves		= am33xx_ehrpwm2_slaves,
+ 	.slaves_cnt	= ARRAY_SIZE(am33xx_ehrpwm2_slaves),
+ 	.opt_clks	= ehrpwm2_opt_clks,
+@@ -898,12 +880,6 @@ static struct omap_hwmod am33xx_ecap0_hwmod = {
+ 	.class		= &am33xx_epwmss_hwmod_class,
+ 	.main_clk	= "epwmss0_fck",
+ 	.clkdm_name	= "l4ls_clkdm",
+-	.prcm		= {
+-		.omap4	= {
+-			.clkctrl_offs	= AM33XX_CM_PER_EPWMSS0_CLKCTRL_OFFSET,
+-			.modulemode	= MODULEMODE_SWCTRL,
+-		},
+-	},
+ 	.slaves		= am33xx_ecap0_slaves,
+ 	.slaves_cnt	= ARRAY_SIZE(am33xx_ecap0_slaves),
+ };
+@@ -949,12 +925,6 @@ static struct omap_hwmod am33xx_ecap1_hwmod = {
+ 	.class		= &am33xx_epwmss_hwmod_class,
+ 	.main_clk	= "epwmss1_fck",
+ 	.clkdm_name	= "l4ls_clkdm",
+-	.prcm		= {
+-		.omap4	= {
+-			.clkctrl_offs	= AM33XX_CM_PER_EPWMSS1_CLKCTRL_OFFSET,
+-			.modulemode	= MODULEMODE_SWCTRL,
+-		},
+-	},
+ 	.slaves		= am33xx_ecap1_slaves,
+ 	.slaves_cnt	= ARRAY_SIZE(am33xx_ecap1_slaves),
+ };
+@@ -1000,12 +970,6 @@ static struct omap_hwmod am33xx_ecap2_hwmod = {
+ 	.class		= &am33xx_epwmss_hwmod_class,
+ 	.clkdm_name	= "l4ls_clkdm",
+ 	.main_clk	= "epwmss2_fck",
+-	.prcm		= {
+-		.omap4	= {
+-			.clkctrl_offs	= AM33XX_CM_PER_EPWMSS2_CLKCTRL_OFFSET,
+-			.modulemode	= MODULEMODE_SWCTRL,
+-		},
+-	},
+ 	.slaves		= am33xx_ecap2_slaves,
+ 	.slaves_cnt	= ARRAY_SIZE(am33xx_ecap2_slaves),
+ };
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0004-PWM-ecap-Resets-the-PWM-output-to-low-on-stop.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0004-PWM-ecap-Resets-the-PWM-output-to-low-on-stop.patch
new file mode 100644
index 0000000..781e690
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0004-PWM-ecap-Resets-the-PWM-output-to-low-on-stop.patch
@@ -0,0 +1,40 @@
+From cd86d4c2a2a380a0824a08aed2d878c1d12a94e4 Mon Sep 17 00:00:00 2001
+From: "Philip, Avinash" <avinashphilip@ti.com>
+Date: Wed, 8 Aug 2012 18:17:11 +0530
+Subject: [PATCH 4/6] PWM: ecap: Resets the PWM output to low on stop
+
+When PWM is stopped, the output on the PWM pin is not reset to low. This
+can result in un-predictable output (example pwm brightness goes to 100%
+if the line is high upon stop).
+This patch fixes by disabling APWM mode on stop & enable it on start.
+
+Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
+---
+ drivers/pwm/ecap.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/pwm/ecap.c b/drivers/pwm/ecap.c
+index 614be36..670b32e 100644
+--- a/drivers/pwm/ecap.c
++++ b/drivers/pwm/ecap.c
+@@ -77,7 +77,7 @@ static int ecap_pwm_stop(struct pwm_device *p)
+ 
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 	v = readw(ep->mmio_base + CAPTURE_CTRL2_REG);
+-	v &= ~ECTRL2_CTRSTP_FREERUN;
++	v &= ~(ECTRL2_CTRSTP_FREERUN | ECTRL2_MDSL_ECAP);
+ 	writew(v, ep->mmio_base + CAPTURE_CTRL2_REG);
+ 	spin_unlock_irqrestore(&ep->lock, flags);
+ 
+@@ -103,7 +103,7 @@ static int ecap_pwm_start(struct pwm_device *p)
+ 
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 	v = readw(ep->mmio_base + CAPTURE_CTRL2_REG);
+-	v |= ECTRL2_CTRSTP_FREERUN;
++	v |= (ECTRL2_CTRSTP_FREERUN | ECTRL2_MDSL_ECAP);
+ 	writew(v, ep->mmio_base + CAPTURE_CTRL2_REG);
+ 	spin_unlock_irqrestore(&ep->lock, flags);
+ 	set_bit(FLAG_RUNNING, &p->flags);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0005-PWM-ecap-Fix-for-throwing-PWM-output-before-running.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0005-PWM-ecap-Fix-for-throwing-PWM-output-before-running.patch
new file mode 100644
index 0000000..fb333d8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0005-PWM-ecap-Fix-for-throwing-PWM-output-before-running.patch
@@ -0,0 +1,52 @@
+From 16bfdd6480abb907b946d1c902205e6f03d7ed68 Mon Sep 17 00:00:00 2001
+From: "Philip, Avinash" <avinashphilip@ti.com>
+Date: Tue, 14 Aug 2012 13:48:55 +0530
+Subject: [PATCH 5/6] PWM: ecap: Fix for throwing PWM output before running
+
+On configuring duty cycle, APWM mode is enabled and left enabled even if
+PWM not running. Fixes the same by disabling APWM mode if PWM device not
+running. This ensures PWM output is low if PWM device not running.
+
+Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
+---
+ drivers/pwm/ecap.c |   11 +++++++----
+ 1 files changed, 7 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/pwm/ecap.c b/drivers/pwm/ecap.c
+index 670b32e..864f3ee 100644
+--- a/drivers/pwm/ecap.c
++++ b/drivers/pwm/ecap.c
+@@ -131,16 +131,13 @@ static int ecap_pwm_set_polarity(struct pwm_device *p, char pol)
+ 
+ static int ecap_pwm_config_period(struct pwm_device *p)
+ {
+-	unsigned long flags, v;
++	unsigned long flags;
+ 	struct ecap_pwm *ep = to_ecap_pwm(p);
+ 
+ 	 pm_runtime_get_sync(ep->dev);
+ 
+ 	spin_lock_irqsave(&ep->lock, flags);
+ 	writel((p->period_ticks) - 1, ep->mmio_base + CAPTURE_3_REG);
+-	v = readw(ep->mmio_base + CAPTURE_CTRL2_REG);
+-	v |= (ECTRL2_MDSL_ECAP | ECTRL2_SYNCOSEL_MASK);
+-	writew(v, ep->mmio_base + CAPTURE_CTRL2_REG);
+ 	spin_unlock_irqrestore(&ep->lock, flags);
+ 
+ 	pm_runtime_put_sync(ep->dev);
+@@ -167,6 +164,12 @@ static int ecap_pwm_config_duty(struct pwm_device *p)
+ 	}
+ 	spin_unlock_irqrestore(&ep->lock, flags);
+ 
++	if (!pwm_is_running(p)) {
++		v = readw(ep->mmio_base + CAPTURE_CTRL2_REG);
++		v &= ~ECTRL2_MDSL_ECAP;
++		writew(v, ep->mmio_base + CAPTURE_CTRL2_REG);
++	}
++
+ 	pm_runtime_put_sync(ep->dev);
+ 	return 0;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0006-pwm-ehrpwm-Configure-polarity-on-pwm_start.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0006-pwm-ehrpwm-Configure-polarity-on-pwm_start.patch
new file mode 100644
index 0000000..3ebb6f7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/pwm/0006-pwm-ehrpwm-Configure-polarity-on-pwm_start.patch
@@ -0,0 +1,30 @@
+From 76361b6715c04d513b9f6bb4ec79ef2297eafe78 Mon Sep 17 00:00:00 2001
+From: "Philip, Avinash" <avinashphilip@ti.com>
+Date: Tue, 14 Aug 2012 13:50:37 +0530
+Subject: [PATCH 6/6] pwm: ehrpwm: Configure polarity on pwm_start
+
+Polarity of PWM device should done only from start. This helps in
+disabling polarity change even PWM device is running.
+
+Signed-off-by: Philip, Avinash <avinashphilip@ti.com>
+---
+ drivers/pwm/ehrpwm.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/pwm/ehrpwm.c b/drivers/pwm/ehrpwm.c
+index 8bbed87..636b0d9 100644
+--- a/drivers/pwm/ehrpwm.c
++++ b/drivers/pwm/ehrpwm.c
+@@ -1284,8 +1284,8 @@ static int ehrpwm_pwm_config(struct pwm_device *p,
+ 		break;
+ 
+ 	case BIT(PWM_CONFIG_POLARITY):
++		/* Polarity configuration done from pwm_start */
+ 		p->active_high = c->polarity;
+-		ret = ehrpwm_pwm_set_pol(p);
+ 		break;
+ 
+ 	case BIT(PWM_CONFIG_START):
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 5cbf46b..2bc6081 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,11 +11,11 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 # the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
-PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.25", d)}"
+PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.28", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "b+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1722,7 +1722,116 @@ PATCHES_OVER_PSP = " \
 	file://3.2.25/0071-nouveau-Fix-alignment-requirements-on-src-and-dst-ad.patch \
 	file://3.2.25/0072-mm-fix-wrong-argument-of-migrate_huge_pages-in-soft_.patch \
 	file://3.2.25/0073-Linux-3.2.25.patch \
-	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
+	file://3.2.26/0001-x86-Simplify-code-by-removing-a-SMP-ifdefs-from-stru.patch \
+	file://3.2.26/0002-Linux-3.2.26.patch \
+	file://3.2.27/0001-sched-Fix-race-in-task_group.patch \
+	file://3.2.27/0002-floppy-Cleanup-disk-queue-before-caling-put_disk-if-.patch \
+	file://3.2.27/0003-xen-mark-local-pages-as-FOREIGN-in-the-m2p_override.patch \
+	file://3.2.27/0004-lirc_sir-make-device-registration-work.patch \
+	file://3.2.27/0005-stable-update-references-to-older-2.6-versions-for-3.patch \
+	file://3.2.27/0006-ALSA-hda-add-dock-support-for-Thinkpad-X230-Tablet.patch \
+	file://3.2.27/0007-cfg80211-fix-interface-combinations-check-for-ADHOC-.patch \
+	file://3.2.27/0008-m68k-Correct-the-Atari-ALLOWINT-definition.patch \
+	file://3.2.27/0009-ene_ir-Fix-driver-initialisation.patch \
+	file://3.2.27/0010-nfsd4-our-filesystems-are-normally-case-sensitive.patch \
+	file://3.2.27/0011-random-Use-arch_get_random_int-instead-of-cycle-coun.patch \
+	file://3.2.27/0012-random-Use-arch-specific-RNG-to-initialize-the-entro.patch \
+	file://3.2.27/0013-random-Adjust-the-number-of-loops-when-initializing.patch \
+	file://3.2.27/0014-random-make-add_interrupt_randomness-do-something-sa.patch \
+	file://3.2.27/0015-random-use-lockless-techniques-in-the-interrupt-path.patch \
+	file://3.2.27/0016-random-create-add_device_randomness-interface.patch \
+	file://3.2.27/0017-usb-feed-USB-device-information-to-the-dev-random-dr.patch \
+	file://3.2.27/0018-net-feed-dev-random-with-the-MAC-address-when-regist.patch \
+	file://3.2.27/0019-random-use-the-arch-specific-rng-in-xfer_secondary_p.patch \
+	file://3.2.27/0020-random-add-new-get_random_bytes_arch-function.patch \
+	file://3.2.27/0021-rtc-wm831x-Feed-the-write-counter-into-device_add_ra.patch \
+	file://3.2.27/0022-mfd-wm831x-Feed-the-device-UUID-into-device_add_rand.patch \
+	file://3.2.27/0023-ASoC-wm8994-Ensure-there-are-enough-BCLKs-for-four-c.patch \
+	file://3.2.27/0024-futex-Test-for-pi_mutex-on-fault-in-futex_wait_reque.patch \
+	file://3.2.27/0025-futex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch \
+	file://3.2.27/0026-futex-Forbid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch \
+	file://3.2.27/0027-video-smscufx-fix-line-counting-in-fb_write.patch \
+	file://3.2.27/0028-Input-synaptics-handle-out-of-bounds-values-from-the.patch \
+	file://3.2.27/0029-ALSA-hda-Fix-invalid-D3-of-headphone-DAC-on-VT202x-c.patch \
+	file://3.2.27/0030-ALSA-mpu401-Fix-missing-initialization-of-irq-field.patch \
+	file://3.2.27/0031-x86-nops-Missing-break-resulting-in-incorrect-select.patch \
+	file://3.2.27/0032-s390-mm-downgrade-page-table-after-fork-of-a-31-bit-.patch \
+	file://3.2.27/0033-Redefine-ATOMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch \
+	file://3.2.27/0034-dm-thin-reduce-endio_hook-pool-size.patch \
+	file://3.2.27/0035-dm-thin-fix-memory-leak-in-process_prepared_mapping-.patch \
+	file://3.2.27/0036-random-mix-in-architectural-randomness-in-extract_bu.patch \
+	file://3.2.27/0037-asus-wmi-use-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch \
+	file://3.2.27/0038-virtio-blk-Use-block-layer-provided-spinlock.patch \
+	file://3.2.27/0039-s390-mm-fix-fault-handling-for-page-table-walk-case.patch \
+	file://3.2.27/0040-nfs-skip-commit-in-releasepage-if-we-re-freeing-memo.patch \
+	file://3.2.27/0041-md-raid1-don-t-abort-a-resync-on-the-first-badblock.patch \
+	file://3.2.27/0042-pcdp-use-early_ioremap-early_iounmap-to-access-pcdp-.patch \
+	file://3.2.27/0043-lib-vsprintf.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch \
+	file://3.2.27/0044-nilfs2-fix-deadlock-issue-between-chcp-and-thaw-ioct.patch \
+	file://3.2.27/0045-SUNRPC-return-negative-value-in-case-rpcbind-client-.patch \
+	file://3.2.27/0046-ARM-7467-1-mutex-use-generic-xchg-based-implementati.patch \
+	file://3.2.27/0047-ARM-7476-1-vfp-only-clear-vfp-state-for-current-cpu-.patch \
+	file://3.2.27/0048-ARM-7477-1-vfp-Always-save-VFP-state-in-vfp_pm_suspe.patch \
+	file://3.2.27/0049-ARM-7478-1-errata-extend-workaround-for-erratum-7207.patch \
+	file://3.2.27/0050-ARM-Fix-undefined-instruction-exception-handling.patch \
+	file://3.2.27/0051-USB-echi-dbgp-increase-the-controller-wait-time-to-c.patch \
+	file://3.2.27/0052-ASoC-wm8962-Allow-VMID-time-to-fully-ramp.patch \
+	file://3.2.27/0053-mm-page_alloc.c-remove-pageblock_default_order.patch \
+	file://3.2.27/0054-mm-setup-pageblock_order-before-it-s-used-by-sparsem.patch \
+	file://3.2.27/0055-mm-mmu_notifier-fix-freed-page-still-mapped-in-secon.patch \
+	file://3.2.27/0056-mm-hugetlbfs-close-race-during-teardown-of-hugetlbfs.patch \
+	file://3.2.27/0057-ALSA-snd-usb-fix-clock-source-validity-index.patch \
+	file://3.2.27/0058-ALSA-hda-Support-dock-on-Lenovo-Thinkpad-T530-with-A.patch \
+	file://3.2.27/0059-ore-Fix-out-of-bounds-access-in-_ios_obj.patch \
+	file://3.2.27/0060-m68k-Make-sys_atomic_cmpxchg_32-work-on-classic-m68k.patch \
+	file://3.2.27/0061-drm-i915-prefer-wide-slow-to-fast-narrow-in-DP-confi.patch \
+	file://3.2.27/0062-rt2x00-Add-support-for-BUFFALO-WLI-UC-GNM2-to-rt2800.patch \
+	file://3.2.27/0063-drop_monitor-fix-sleeping-in-invalid-context-warning.patch \
+	file://3.2.27/0064-drop_monitor-Make-updating-data-skb-smp-safe.patch \
+	file://3.2.27/0065-drop_monitor-prevent-init-path-from-scheduling-on-th.patch \
+	file://3.2.27/0066-drop_monitor-dont-sleep-in-atomic-context.patch \
+	file://3.2.27/0067-pch_uart-Fix-missing-break-for-16-byte-fifo.patch \
+	file://3.2.27/0068-pch_uart-Fix-rx-error-interrupt-setting-issue.patch \
+	file://3.2.27/0069-pch_uart-Fix-parity-setting-issue.patch \
+	file://3.2.27/0070-Linux-3.2.27.patch \
+	file://3.2.28/0001-bnx2-Fix-bug-in-bnx2_free_tx_skbs.patch \
+	file://3.2.28/0002-sch_sfb-Fix-missing-NULL-check.patch \
+	file://3.2.28/0003-sctp-Fix-list-corruption-resulting-from-freeing-an-a.patch \
+	file://3.2.28/0004-caif-Fix-access-to-freed-pernet-memory.patch \
+	file://3.2.28/0005-cipso-don-t-follow-a-NULL-pointer-when-setsockopt-is.patch \
+	file://3.2.28/0006-caif-fix-NULL-pointer-check.patch \
+	file://3.2.28/0007-wanmain-comparing-array-with-NULL.patch \
+	file://3.2.28/0008-tcp-Add-TCP_USER_TIMEOUT-negative-value-check.patch \
+	file://3.2.28/0009-USB-kaweth.c-use-GFP_ATOMIC-under-spin_lock.patch \
+	file://3.2.28/0010-net-fix-rtnetlink-IFF_PROMISC-and-IFF_ALLMULTI-handl.patch \
+	file://3.2.28/0011-tcp-perform-DMA-to-userspace-only-if-there-is-a-task.patch \
+	file://3.2.28/0012-net-tun-fix-ioctl-based-info-leaks.patch \
+	file://3.2.28/0013-e1000-add-dropped-DMA-receive-enable-back-in-for-WoL.patch \
+	file://3.2.28/0014-rtlwifi-rtl8192cu-Change-buffer-allocation-for-synch.patch \
+	file://3.2.28/0015-hfsplus-fix-overflow-in-sector-calculations-in-hfspl.patch \
+	file://3.2.28/0016-drm-i915-fixup-seqno-allocation-logic-for-lazy_reque.patch \
+	file://3.2.28/0017-KVM-VMX-Advertise-CPU_BASED_RDPMC_EXITING-for-nested.patch \
+	file://3.2.28/0018-mac80211-cancel-mesh-path-timer.patch \
+	file://3.2.28/0019-ath9k-Add-PID-VID-support-for-AR1111.patch \
+	file://3.2.28/0020-ARM-mxs-Remove-MMAP_MIN_ADDR-setting-from-mxs_defcon.patch \
+	file://3.2.28/0021-ALSA-hda-add-dock-support-for-Thinkpad-T430s.patch \
+	file://3.2.28/0022-cfg80211-process-pending-events-when-unregistering-n.patch \
+	file://3.2.28/0023-rt61pci-fix-NULL-pointer-dereference-in-config_lna_g.patch \
+	file://3.2.28/0024-iwlwifi-disable-greenfield-transmissions-as-a-workar.patch \
+	file://3.2.28/0025-ALSA-hda-add-dock-support-for-Thinkpad-X230.patch \
+	file://3.2.28/0026-e1000e-NIC-goes-up-and-immediately-goes-down.patch \
+	file://3.2.28/0027-ALSA-hda-remove-quirk-for-Dell-Vostro-1015.patch \
+	file://3.2.28/0028-ALSA-hda-Fix-double-quirk-for-Quanta-FL1-Lenovo-Idea.patch \
+	file://3.2.28/0029-ARM-pxa-remove-irq_to_gpio-from-ezx-pcap-driver.patch \
+	file://3.2.28/0030-Input-eeti_ts-pass-gpio-value-instead-of-IRQ.patch \
+	file://3.2.28/0031-drm-i915-Add-wait_for-in-init_ring_common.patch \
+	file://3.2.28/0032-drm-i915-correctly-order-the-ring-init-sequence.patch \
+	file://3.2.28/0033-s390-compat-fix-compat-wrappers-for-process_vm-syste.patch \
+	file://3.2.28/0034-s390-compat-fix-mmap-compat-system-calls.patch \
+	file://3.2.28/0035-drm-radeon-fix-bank-tiling-parameters-on-evergreen.patch \
+	file://3.2.28/0036-drm-radeon-fix-bank-tiling-parameters-on-cayman.patch \
+	file://3.2.28/0037-drm-radeon-do-not-reenable-crtc-after-moving-vram-st.patch \
+	file://3.2.28/0038-Linux-3.2.28.patch \
 	file://libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch \
 	file://libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch \
 	file://libertas/0003-switch-debugfs-to-umode_t.patch \
@@ -1739,9 +1848,12 @@ PATCHES_OVER_PSP = " \
 	file://libertas/0014-libertas-CS-convert-to-asynchronous-firmware-loading.patch \
 	file://libertas/0015-libertas-add-missing-include.patch \
 	file://libertas/0016-remove-debug-msgs-due-to-missing-in_interrupt.patch \
-	\
-	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
-	\
+	file://pwm/0001-PWM-ecap-Correct-configuration-of-polarity.patch \
+	file://pwm/0002-ARM-OMAP2-am335x-mux-add-ecap2_in_pwm2_out-string-en.patch \
+	file://pwm/0003-ARM-OMAP2-AM335x-hwmod-Remove-PRCM-entries-for-PWMSS.patch \
+	file://pwm/0004-PWM-ecap-Resets-the-PWM-output-to-low-on-stop.patch \
+	file://pwm/0005-PWM-ecap-Fix-for-throwing-PWM-output-before-running.patch \
+	file://pwm/0006-pwm-ehrpwm-Configure-polarity-on-pwm_start.patch \
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
@@ -1827,4 +1939,9 @@ PATCHES_OVER_PSP = " \
 	file://beaglebone/0083-beaglebone-add-extra-partnumber-for-camera-cape.patch \
 	file://beaglebone/0084-beaglebone-cssp_camera-driver-cleanup.patch \
 	file://beaglebone/0085-beaglebone-mux-camera-cape-orientation-pin-to-gpio.patch \
-"
+	file://beaglebone/0086-board-am335xevm-Add-Beaglebone-Motor-Cape-Support.patch \
+	file://beaglebone/0087-mux33xx-Fix-MUXENTRYs-for-MCASP0_ACLKX-FSX-to-add-eh.patch \
+	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
+	\
+	file://beaglebone/0001-arm-boot-compressed-default-asm-arch-to-armv7-a.patch \
+	"
-- 
1.7.10


