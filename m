Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F612E01438
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 22:53:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EAE1752A8D; Fri, 14 Sep 2012 05:53:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120914055356.EAE1752A8D@arago-project.org>
Date: Fri, 14 Sep 2012 05:53:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2.28 and add motorcape support
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
X-List-Received-Date: Fri, 14 Sep 2012 05:53:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: df83a59b6b9fd9de817a06aa162912682ab6b5b7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=df83a59b6b9fd9de817a06aa162912682ab6b5b7

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Aug 22 14:29:17 2012 +0200

linux-ti33x-psp 3.2: update to 3.2.28 and add motorcape support

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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
 ...Feed-the-device-UUID-into-device_add_rand.patch |   54 +++
 ...-Ensure-there-are-enough-BCLKs-for-four-c.patch |   33 ++
 ...for-pi_mutex-on-fault-in-futex_wait_reque.patch |   38 +++
 ...ex-Fix-bug-in-WARN_ON-for-NULL-q.pi_state.patch |   36 ++
 ...bid-uaddr-uaddr2-in-futex_wait_requeue_pi.patch |   59 ++++
 ...deo-smscufx-fix-line-counting-in-fb_write.patch |   36 ++
 ...tics-handle-out-of-bounds-values-from-the.patch |   89 +++++
 ...x-invalid-D3-of-headphone-DAC-on-VT202x-c.patch |   60 ++++
 ...1-Fix-missing-initialization-of-irq-field.patch |   34 ++
 ...ssing-break-resulting-in-incorrect-select.patch |   36 ++
 ...ngrade-page-table-after-fork-of-a-31-bit-.patch |  140 ++++++++
 ...OMIC_INIT-and-ATOMIC64_INIT-to-drop-the-c.patch |   73 +++++
 .../0034-dm-thin-reduce-endio_hook-pool-size.patch |   37 +++
 ...-memory-leak-in-process_prepared_mapping-.patch |   53 +++
 ...in-architectural-randomness-in-extract_bu.patch |  151 +++++++++
 ...e-ASUS_WMI_METHODID_DSTS2-as-default-DSTS.patch |   44 +++
 ...tio-blk-Use-block-layer-provided-spinlock.patch |  103 ++++++
 ...x-fault-handling-for-page-table-walk-case.patch |   72 ++++
 ...mmit-in-releasepage-if-we-re-freeing-memo.patch |  182 +++++++++++
 ...on-t-abort-a-resync-on-the-first-badblock.patch |   48 +++
 ...rly_ioremap-early_iounmap-to-access-pcdp-.patch |   73 +++++
 ...f.c-kptr_restrict-fix-pK-error-in-SysRq-s.patch |   48 +++
 ...deadlock-issue-between-chcp-and-thaw-ioct.patch |  144 +++++++++
 ...rn-negative-value-in-case-rpcbind-client-.patch |   45 +++
 ...mutex-use-generic-xchg-based-implementati.patch |  165 ++++++++++
 ...vfp-only-clear-vfp-state-for-current-cpu-.patch |   36 ++
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
 ...ocess-pending-events-when-unregistering-n.patch |   72 ++++
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
 ...-s390-compat-fix-mmap-compat-system-calls.patch |   54 +++
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

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=df83a59b6b9fd9de817a06aa162912682ab6b5b7

