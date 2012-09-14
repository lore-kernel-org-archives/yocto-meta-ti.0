Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D70EE01430
	for <meta-ti@yoctoproject.org>; Thu, 13 Sep 2012 22:53:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id A4E8752A77; Fri, 14 Sep 2012 05:53:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120914055356.A4E8752A77@arago-project.org>
Date: Fri, 14 Sep 2012 05:53:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2.25
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
Commit: 6203cbca5c9df9095882544f1eaa370a9cbd364a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6203cbca5c9df9095882544f1eaa370a9cbd364a

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Wed Aug  8 10:41:23 2012 +0200

linux-ti33x-psp 3.2: update to 3.2.25

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 ...ung-laptop-make-the-dmi-check-less-strict.patch |  306 ++++++++
 .../3.2.24/0002-raid5-delayed-stripe-fix.patch     |   43 ++
 .../3.2.24/0003-tcp-drop-SYN-FIN-messages.patch    |   36 +
 ...3-Apply-short-DMA-frag-workaround-to-5906.patch |   35 +
 ...0005-rtl8187-brightness_set-can-not-sleep.patch |   56 ++
 ...s-ipw2x00-add-supported-cipher-suites-to-.patch |  102 +++
 ...m-i915-do-not-enable-RC6p-on-Sandy-Bridge.patch |   47 ++
 ...ix-operator-precedence-when-enabling-RC6p.patch |   34 +
 ...d-do-not-check-for-ancient-modutils-tools.patch |   47 ++
 ...TERMEDIATE-but-not-AMPDU-only-when-tracin.patch |   45 ++
 ...limit-the-state-manager-for-lock-reclaim-.patch |   37 +
 ...t4-Report-max_batch_time-option-correctly.patch |   32 +
 ...-fix-use-after-free-bug-in-quota-handling.patch |  464 ++++++++++++
 ...FSv4-Reduce-the-footprint-of-the-idmapper.patch |   69 ++
 ...ther-reduce-the-footprint-of-the-idmapper.patch |  131 ++++
 ...ocopy-fix-offset-calculation-when-buildin.patch |   67 ++
 ...tap-zerocopy-fix-truesize-underestimation.patch |   46 ++
 ...ocopy-put-page-when-fail-to-get-all-reque.patch |   40 +
 ...ocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch |   53 ++
 ...ocopy-validate-vectors-before-building-sk.patch |   84 +++
 ...21-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch |   35 +
 ...e-unnecessary-warnings-about-ioctl-to-par.patch |   54 ++
 ...epoll-clear-the-tfile_check_list-on-ELOOP.patch |   43 ++
 ...ix-missing-iommu_shutdown-initialization-.patch |   45 ++
 ...nitialize-dma_ops-for-hotplug-and-sriov-d.patch |   53 ++
 ...-Add-support-for-root-hub-port-status-CAS.patch |  170 +++++
 ...994-Pay-attention-to-the-value-set-when-e.patch |   40 +
 ...Rewrite-and-fix-load-avg-computation-agai.patch |  462 ++++++++++++
 .../3.2.24/0029-USB-option-add-ZTE-MF60.patch      |   70 ++
 .../0030-USB-option-Add-MEDIATEK-product-ids.patch |   55 ++
 ...B-cdc-wdm-fix-lockup-on-error-in-wdm_read.patch |   78 ++
 ...d-nandsim-don-t-open-code-a-do_div-helper.patch |   94 +++
 ...lease-semaphore-on-error-path-dvb_registe.patch |   33 +
 ...core-use-global-ID-to-register-hwspinlock.patch |   52 ++
 ...taskfile-corruption-in-sas_ata_qc_fill_rt.patch |  116 +++
 ...x-use-after-free-bug-in-RAID1-data-check-.patch |   58 ++
 ...ix-crash-during-suspend-on-ASUS-computers.patch |  166 +++++
 ...lug-fix-invalid-memory-access-caused-by-s.patch |  114 +++
 ...ULL-pointer-dereference-in-__ocfs2_change.patch |   43 ++
 ...t-compaction-if-migration-page-cannot-be-.patch |   53 ++
 ...-rtc-mxc.c-fix-irq-enabled-interrupts-war.patch |   74 ++
 ...2-fs-ramfs-file-nommu-add-SetPageUptodate.patch |   49 ++
 ...I-Fix-not-loading-acpi-cpufreq-driver-reg.patch |   53 ++
 ...Preserve-configuration-register-bits-on-i.patch |   37 +
 ...SAMSUNG-fix-race-in-s3c_adc_start-for-ADC.patch |   42 ++
 ...-block-fix-infinite-loop-in-__getblk_slow.patch |  116 +++
 ...ly-user-triggerable-BUG-from-generic_setl.patch |   42 ++
 .../3.2.24/0048-NFC-Export-nfc.h-to-userland.patch |   32 +
 ...bernate-Hibernate-thaw-fixes-improvements.patch |  178 +++++
 ...eck-iface-combinations-only-when-iface-is.patch |   40 +
 ...51-intel_ips-blacklist-HP-ProBook-laptops.patch |   70 ++
 ...c-fix-issue-of-transmit-queue-0-timed-out.patch |   42 ++
 ...usb-fix-indexes-ordering-on-RX-queue-kick.patch |   51 ++
 ...-iwlegacy-always-monitor-for-stuck-queues.patch |   65 ++
 ...don-t-mess-up-the-SCD-when-removing-a-key.patch |   51 ++
 ...Correct-link-check-logic-for-82571-serdes.patch |   39 +
 ...ix-crash-seen-with-aborts-and-large-reads.patch |   39 +
 ...-restart-open-if-it-already-found-a-partn.patch |  115 +++
 ...n-up-returning-errors-in-PR-handling-code.patch |   55 ++
 ...range-calculation-in-WRITE-SAME-emulation.patch |   41 ++
 ...FIG_HIGHMEM-machines-limit-the-rsize-wsiz.patch |   82 +++
 ...-update-the-inode-cache-with-the-results-.patch |   47 ++
 ...-mm-fix-lost-kswapd-wakeup-in-kswapd_stop.patch |   84 +++
 ...ash-when-stopping-md-array-races-with-clo.patch |  164 +++++
 ...ose-some-possible-races-on-write-errors-d.patch |   58 ++
 ...roperly-align-the-.data.init_task-section.patch |   70 ++
 ...067-UBIFS-fix-a-bug-in-empty-space-fix-up.patch |   67 ++
 ...-crash-by-supporting-any-unaligned-RAID-I.patch |  211 ++++++
 ...e-support-of-partial-IO-request-NFS-crash.patch |   50 ++
 ...n-t-leak-objio_state-if-ore_write-read-fa.patch |   46 ++
 ...x-__r4w_get_page-when-offset-is-beyond-i_.patch |   71 ++
 ...ix-crash-with-mirror-recovery-and-discard.patch |  114 +++
 ...raid1-set-discard_zeroes_data_unsupported.patch |   41 ++
 ...0074-ntp-Fix-leap-second-hrtimer-livelock.patch |  349 +++++++++
 ...ntp-Correct-TAI-offset-during-leap-second.patch |   42 ++
 ...-Fix-CLOCK_MONOTONIC-inconsistency-during.patch |   53 ++
 ...77-time-Move-common-updates-to-a-function.patch |   99 +++
 ...078-hrtimer-Provide-clock_was_set_delayed.patch |  118 +++
 ...-Fix-leapsecond-triggered-load-spike-issu.patch |   66 ++
 ...-Maintain-ktime_t-based-offsets-for-hrtim.patch |  104 +++
 ...ove-lock-held-region-in-hrtimer_interrupt.patch |   61 ++
 ...mekeeping-Provide-hrtimer-update-function.patch |   94 +++
 ...ate-hrtimer-base-offsets-each-hrtimer_int.patch |  125 ++++
 ...-Add-missing-update-call-in-timekeeping_r.patch |   57 ++
 ...rpc-Fix-wrong-divisor-in-usecs_to_cputime.patch |   87 +++
 .../0086-vhost-don-t-forget-to-schedule.patch      |   60 ++
 ...netif_napi_del-at-errpaths-and-at-driver-.patch |   43 ++
 .../0088-bnx2x-fix-checksum-validation.patch       |  112 +++
 ...0089-bnx2x-fix-panic-when-TX-ring-is-full.patch |   75 ++
 .../3.2.24/0090-net-remove-skb_orphan_try.patch    |  135 ++++
 ...cpi_skip_timer_override-cover-all-source_.patch |   78 ++
 ...-one-board-specific-WARN-when-ignoring-ti.patch |   42 ++
 ...quirk-for-AMILO-PRO-V2030-to-ignore-the-t.patch |   50 ++
 ...x-Dell-M6600-ACPI-reboot-regression-via-D.patch |   43 ++
 .../3.2.24/0095-ACPI-sysfs.c-strlen-fix.patch      |   43 ++
 ...acefully-refuse-miscdev-file-ops-on-inher.patch |   98 +++
 ...Fix-lockdep-warning-in-miscdev-operations.patch |  105 +++
 ...operly-check-for-O_RDONLY-flag-before-doi.patch |   45 ++
 ...e-acpi_pm_device_sleep_state-follow-the-s.patch |   49 ++
 .../3.2.24/0100-ipheth-add-support-for-iPad.patch  |   43 ++
 ...tmmac-Fix-for-nfs-hang-on-multiple-reboot.patch |   56 ++
 ...ugfs-and-network-namespaces-are-incompati.patch |   39 +
 ...age-proc-net-bonding-entries-from-the-net.patch |   61 ++
 ...74-Add-support-for-2012-MacBook-Pro-Retin.patch |   67 ++
 ...handle-all-variations-of-Mad-Catz-Beat-Pa.patch |   61 ++
 ...add-signature-for-Razer-Onza-Tournament-E.patch |   40 +
 ...07-Input-xpad-add-Andamiro-Pump-It-Up-pad.patch |   33 +
 ...D-add-support-for-2012-MacBook-Pro-Retina.patch |   85 +++
 .../3.2.24/0109-Linux-3.2.24.patch                 |   24 +
 ...he-amount-of-work-done-when-updating-min_.patch |   88 +++
 ...on-allow-compaction-to-isolate-dirty-page.patch |  436 ++++++++++++
 ...on-determine-if-dirty-pages-can-be-migrat.patch |  376 ++++++++++
 ...ocator-do-not-call-direct-reclaim-for-THP.patch |  143 ++++
 ...on-make-isolate_lru_page-filter-aware-aga.patch |  117 +++
 ...on-introduce-sync-light-migration-for-use.patch |  547 ++++++++++++++
 ...hen-reclaiming-for-compaction-ensure-ther.patch |  120 ++++
 ...o-not-OOM-if-aborting-reclaim-to-start-co.patch |   71 ++
 ...heck-if-reclaim-should-really-abort-even-.patch |  119 ++++
 ...0-vmscan-promote-shared-file-mapped-pages.patch |   82 +++
 ...tivate-executable-pages-after-first-usage.patch |   56 ++
 ...-consider-swap-space-when-deciding-whethe.patch |   50 ++
 ...3-mm-test-PageSwapBacked-in-lumpy-reclaim.patch |   42 ++
 ...onvert-global-reclaim-to-per-memcg-LRU-li.patch |   58 ++
 ...educe-large-amounts-of-memory-barrier-rel.patch |  655 +++++++++++++++++
 ...fix-warning-in-alloc_huge_page-dequeue_hu.patch |   50 ++
 ...x-NULL-dereferences-in-scsi_cmd_to_driver.patch |   71 ++
 ...8-sched-nohz-Fix-rq-cpu_load-calculations.patch |  137 ++++
 ...hz-Fix-rq-cpu_load-calculations-some-more.patch |  147 ++++
 ...ace-Fix-assembly-trampoline-register-usag.patch |   50 ++
 ...25821-Remove-bad-strcpy-to-read-only-char.patch |   53 ++
 .../0022-x86-Fix-boot-on-Twinhead-H12Y.patch       |   54 ++
 .../0023-r8169-RxConfig-hack-for-the-8168evl.patch |   47 ++
 ...ONFIG_HIGHMEM-is-set-serialize-the-read-w.patch |  124 ++++
 ...ess-rt2x00-rt2800usb-add-more-devices-ids.patch |   89 +++
 ...2x00-rt2800usb-more-devices-were-identifi.patch |   79 ++
 ...7-rt2800usb-2001-3c17-is-an-RT3370-device.patch |   41 ++
 ...-gadget-Fix-g_ether-interface-link-status.patch |   61 ++
 ...-char-to-ext4_count_free-instead-of-a-buf.patch |   88 +++
 ...ble-function-tracing-during-suspend-resum.patch |  113 +++
 ...de-microcode_core.c-simple_strtoul-cleanu.patch |   44 ++
 ...de-Sanitize-per-cpu-microcode-reloading-i.patch |   92 +++
 ...rrect-amount-of-data-copied-to-user-in-pr.patch |   45 ++
 ...-overhead-calculation-used-by-ext4_statfs.patch |  294 ++++++++
 ...-table-length-check-to-avoid-possible-ove.patch |   36 +
 ...36-powerpc-Add-memory-attribute-for-mfmsr.patch |   34 +
 ...037-mwifiex-correction-in-mcs-index-check.patch |   41 ++
 ...Ignore-ZTE-Vodafone-K3570-71-net-interfac.patch |   37 +
 .../3.2.25/0039-USB-option-add-ZTE-MF821D.patch    |   36 +
 ...generation-of-LOGICAL-BLOCK-ADDRESS-OUT-O.patch |   64 ++
 ...get-Add-range-checking-to-UNMAP-emulation.patch |   46 ++
 ...reading-of-data-length-fields-for-UNMAP-c.patch |   51 ++
 ...possible-integer-underflow-in-UNMAP-emula.patch |   75 ++
 ...k-number-of-unmap-descriptors-against-our.patch |   38 +
 ...idle-fix-sequence-handling-vs-cpu-hotplug.patch |   80 +++
 ...l8192de-Fix-phy-based-version-calculation.patch |   61 ++
 ...erform-cpu-down-operations-from-low-prior.patch |  120 ++++
 ...8-ALSA-hda-Add-support-for-Realtek-ALC282.patch |   34 +
 .../0049-iommu-amd-Fix-hotplug-with-iommu-pt.patch |   48 ++
 ...Try-harder-to-avoid-HW-cursor-ending-on-a.patch |   50 ++
 ...urn-on-PIN_OUT-from-hdmi-playback-prepare.patch |   66 ++
 .../3.2.25/0052-block-add-blk_queue_dead.patch     |  140 ++++
 ...x-device-removal-NULL-pointer-dereference.patch |  163 +++++
 ...-dangling-pointer-in-scsi_requeue_command.patch |   57 ++
 .../0055-fix-hot-unplug-vs-async-scan-race.patch   |  122 ++++
 ...up-scsi_schedule_eh-vs-scsi_restart_opera.patch |   62 ++
 .../3.2.25/0057-libsas-continue-revalidation.patch |   49 ++
 ...sas_discover_devices-return-code-handling.patch |  128 ++++
 ...t-Drop-bogus-struct-file-usage-for-iSCSI-.patch |  230 ++++++
 ...-sdhci-pci-CaFe-has-broken-card-detection.patch |   42 ++
 ...-t-let-i_reserved_meta_blocks-go-negative.patch |   55 ++
 ...xt4_calc_metadata_amount-if-we-fail-to-cl.patch |   93 +++
 ...ix-_PRE-and-_POST-events-for-DAPM-perform.patch |   46 ++
 ...s-fix-checking-of-fcntl_setlease-argument.patch |   57 ++
 ...vent-OOPS-on-some-boxes-due-to-missing-ch.patch |   45 ++
 ...066-drm-radeon-fix-bo-creation-retry-path.patch |   47 ++
 ...rm-radeon-fix-non-revealent-error-message.patch |   70 ++
 ...fix-hotplug-of-DP-to-DVI-HDMI-passive-ada.patch |   69 ++
 ...on-hotplug-force-link-training-to-happen-.patch |   51 ++
 ...the-ordered-free-operation-without-any-lo.patch |   48 ++
 ...-alignment-requirements-on-src-and-dst-ad.patch |  748 ++++++++++++++++++++
 ...g-argument-of-migrate_huge_pages-in-soft_.patch |   58 ++
 .../3.2.25/0073-Linux-3.2.25.patch                 |   24 +
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  186 +++++-
 184 files changed, 16831 insertions(+), 3 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=6203cbca5c9df9095882544f1eaa370a9cbd364a

