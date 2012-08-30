Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A43BE01438
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:12 -0700 (PDT)
Received: by mail-ee0-f48.google.com with SMTP id d41so650351eek.35
	for <meta-ti@yoctoproject.org>; Thu, 30 Aug 2012 01:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=aX689A0pQi02KmiDpIXAj4FVFGf3D1daJvXvolV/ss8=;
	b=FBZG4BIvhRcH+SG4xPMvMSBzIMI4TOEwz7ezvJOx7W4J9tWYXv+b06WpuhbA8kApza
	0AXqTjLncifRFWvPaQt51aH57wII868O3lX2DP0ze3eRYClQRoimuA01ubFLDUFcS+O4
	+T39ENc1+ufDGs1jN1fZxp//apcOOhonCJ2pmCkzbGRG3yvUFje0BK8Lo3LpEP9AXhkU
	QIkoQw2ScWb7q6OBmaPqHm8Dfb7HooUFCP02lRUZufLBK+UNEH+3E/uRIPAt6CRhmfVd
	iygAfTOSNts5lk9sJCYbyJkPIBz/OGsgO3gpPkjgXgu8hwN2gfqsJxO9tpPwx1+7cRcn
	koXw==
Received: by 10.14.181.132 with SMTP id l4mr5588985eem.17.1346316911807;
	Thu, 30 Aug 2012 01:55:11 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 9sm2967485eei.12.2012.08.30.01.55.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 01:55:09 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@yoctoproject.org
Date: Thu, 30 Aug 2012 10:54:55 +0200
Message-Id: <1346316899-11441-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
References: <1346316899-11441-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQn+AVJtF4sUZr17XNv3ZFesSDiU+sfHImyM3Q+vMKEodu9gHnzP1czga78znEd3zaAZvTsY
Subject: [PATCH 2/6] linux-ti33x-psp 3.2: update to 3.2.25
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
X-List-Received-Date: Thu, 30 Aug 2012 08:55:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
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
 ...ocopy-put-page-when-fail-to-get-all-reque.patch |   40 ++
 ...ocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch |   53 ++
 ...ocopy-validate-vectors-before-building-sk.patch |   84 +++
 ...21-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch |   35 +
 ...e-unnecessary-warnings-about-ioctl-to-par.patch |   54 ++
 ...epoll-clear-the-tfile_check_list-on-ELOOP.patch |   43 ++
 ...ix-missing-iommu_shutdown-initialization-.patch |   45 ++
 ...nitialize-dma_ops-for-hotplug-and-sriov-d.patch |   53 ++
 ...-Add-support-for-root-hub-port-status-CAS.patch |  170 +++++
 ...994-Pay-attention-to-the-value-set-when-e.patch |   40 ++
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
 ...eck-iface-combinations-only-when-iface-is.patch |   40 ++
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
 ...add-signature-for-Razer-Onza-Tournament-E.patch |   40 ++
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
 ...2x00-rt2800usb-more-devices-were-identifi.patch |   79 +++
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
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  186 ++++-
 184 files changed, 16831 insertions(+), 3 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0001-samsung-laptop-make-the-dmi-check-less-strict.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0002-raid5-delayed-stripe-fix.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0003-tcp-drop-SYN-FIN-messages.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0004-tg3-Apply-short-DMA-frag-workaround-to-5906.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0005-rtl8187-brightness_set-can-not-sleep.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0006-net-wireless-ipw2x00-add-supported-cipher-suites-to-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0007-drm-i915-do-not-enable-RC6p-on-Sandy-Bridge.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0008-drm-i915-fix-operator-precedence-when-enabling-RC6p.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0009-kbuild-do-not-check-for-ancient-modutils-tools.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0010-brcmsmac-INTERMEDIATE-but-not-AMPDU-only-when-tracin.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0011-NFSv4-Rate-limit-the-state-manager-for-lock-reclaim-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0012-ext4-Report-max_batch_time-option-correctly.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0013-hugepages-fix-use-after-free-bug-in-quota-handling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0014-NFSv4-Reduce-the-footprint-of-the-idmapper.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0015-NFSv4-Further-reduce-the-footprint-of-the-idmapper.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0016-macvtap-zerocopy-fix-offset-calculation-when-buildin.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0017-macvtap-zerocopy-fix-truesize-underestimation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0018-macvtap-zerocopy-put-page-when-fail-to-get-all-reque.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0019-macvtap-zerocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0020-macvtap-zerocopy-validate-vectors-before-building-sk.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0021-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0022-scsi-Silence-unnecessary-warnings-about-ioctl-to-par.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0023-epoll-clear-the-tfile_check_list-on-ELOOP.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0024-iommu-amd-Fix-missing-iommu_shutdown-initialization-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0025-iommu-amd-Initialize-dma_ops-for-hotplug-and-sriov-d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0026-usb-Add-support-for-root-hub-port-status-CAS.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0027-gpiolib-wm8994-Pay-attention-to-the-value-set-when-e.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0028-sched-nohz-Rewrite-and-fix-load-avg-computation-agai.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0029-USB-option-add-ZTE-MF60.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0030-USB-option-Add-MEDIATEK-product-ids.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0031-USB-cdc-wdm-fix-lockup-on-error-in-wdm_read.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0032-mtd-nandsim-don-t-open-code-a-do_div-helper.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0033-dvb-core-Release-semaphore-on-error-path-dvb_registe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0034-hwspinlock-core-use-global-ID-to-register-hwspinlock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0035-libsas-fix-taskfile-corruption-in-sas_ata_qc_fill_rt.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0036-md-raid1-fix-use-after-free-bug-in-RAID1-data-check-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0037-PCI-EHCI-fix-crash-during-suspend-on-ASUS-computers.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0038-memory-hotplug-fix-invalid-memory-access-caused-by-s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0039-ocfs2-fix-NULL-pointer-dereference-in-__ocfs2_change.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0040-mm-thp-abort-compaction-if-migration-page-cannot-be-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0041-drivers-rtc-rtc-mxc.c-fix-irq-enabled-interrupts-war.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0042-fs-ramfs-file-nommu-add-SetPageUptodate.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0043-cpufreq-ACPI-Fix-not-loading-acpi-cpufreq-driver-reg.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0044-hwmon-it87-Preserve-configuration-register-bits-on-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0045-ARM-SAMSUNG-fix-race-in-s3c_adc_start-for-ADC.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0046-block-fix-infinite-loop-in-__getblk_slow.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0047-Remove-easily-user-triggerable-BUG-from-generic_setl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0048-NFC-Export-nfc.h-to-userland.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0049-PM-Hibernate-Hibernate-thaw-fixes-improvements.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0050-cfg80211-check-iface-combinations-only-when-iface-is.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0051-intel_ips-blacklist-HP-ProBook-laptops.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0052-atl1c-fix-issue-of-transmit-queue-0-timed-out.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0053-rt2x00usb-fix-indexes-ordering-on-RX-queue-kick.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0054-iwlegacy-always-monitor-for-stuck-queues.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0055-iwlegacy-don-t-mess-up-the-SCD-when-removing-a-key.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0056-e1000e-Correct-link-check-logic-for-82571-serdes.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0057-tcm_fc-Fix-crash-seen-with-aborts-and-large-reads.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0058-fifo-Do-not-restart-open-if-it-already-found-a-partn.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0059-target-Clean-up-returning-errors-in-PR-handling-code.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0060-target-Fix-range-calculation-in-WRITE-SAME-emulation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0061-cifs-on-CONFIG_HIGHMEM-machines-limit-the-rsize-wsiz.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0062-cifs-always-update-the-inode-cache-with-the-results-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0063-mm-fix-lost-kswapd-wakeup-in-kswapd_stop.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0064-md-avoid-crash-when-stopping-md-array-races-with-clo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0065-md-raid1-close-some-possible-races-on-write-errors-d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0066-MIPS-Properly-align-the-.data.init_task-section.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0067-UBIFS-fix-a-bug-in-empty-space-fix-up.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0068-ore-Fix-NFS-crash-by-supporting-any-unaligned-RAID-I.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0069-ore-Remove-support-of-partial-IO-request-NFS-crash.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0070-pnfs-obj-don-t-leak-objio_state-if-ore_write-read-fa.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0071-pnfs-obj-Fix-__r4w_get_page-when-offset-is-beyond-i_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0072-dm-raid1-fix-crash-with-mirror-recovery-and-discard.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0073-dm-raid1-set-discard_zeroes_data_unsupported.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0074-ntp-Fix-leap-second-hrtimer-livelock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0075-ntp-Correct-TAI-offset-during-leap-second.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0076-timekeeping-Fix-CLOCK_MONOTONIC-inconsistency-during.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0077-time-Move-common-updates-to-a-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0078-hrtimer-Provide-clock_was_set_delayed.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0079-timekeeping-Fix-leapsecond-triggered-load-spike-issu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0080-timekeeping-Maintain-ktime_t-based-offsets-for-hrtim.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0081-hrtimers-Move-lock-held-region-in-hrtimer_interrupt.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0082-timekeeping-Provide-hrtimer-update-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0083-hrtimer-Update-hrtimer-base-offsets-each-hrtimer_int.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0084-timekeeping-Add-missing-update-call-in-timekeeping_r.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0085-powerpc-Fix-wrong-divisor-in-usecs_to_cputime.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0086-vhost-don-t-forget-to-schedule.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0087-r8169-call-netif_napi_del-at-errpaths-and-at-driver-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0088-bnx2x-fix-checksum-validation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0089-bnx2x-fix-panic-when-TX-ring-is-full.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0090-net-remove-skb_orphan_try.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0091-ACPI-Make-acpi_skip_timer_override-cover-all-source_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0092-ACPI-Remove-one-board-specific-WARN-when-ignoring-ti.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0093-ACPI-Add-a-quirk-for-AMILO-PRO-V2030-to-ignore-the-t.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0094-ACPI-x86-fix-Dell-M6600-ACPI-reboot-regression-via-D.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0095-ACPI-sysfs.c-strlen-fix.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0096-eCryptfs-Gracefully-refuse-miscdev-file-ops-on-inher.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0097-eCryptfs-Fix-lockdep-warning-in-miscdev-operations.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0098-eCryptfs-Properly-check-for-O_RDONLY-flag-before-doi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0099-ACPI-PM-Make-acpi_pm_device_sleep_state-follow-the-s.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0100-ipheth-add-support-for-iPad.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0101-stmmac-Fix-for-nfs-hang-on-multiple-reboot.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0102-bonding-debugfs-and-network-namespaces-are-incompati.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0103-bonding-Manage-proc-net-bonding-entries-from-the-net.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0104-Input-bcm5974-Add-support-for-2012-MacBook-Pro-Retin.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0105-Input-xpad-handle-all-variations-of-Mad-Catz-Beat-Pa.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0106-Input-xpad-add-signature-for-Razer-Onza-Tournament-E.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0107-Input-xpad-add-Andamiro-Pump-It-Up-pad.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0108-HID-add-support-for-2012-MacBook-Pro-Retina.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0109-Linux-3.2.24.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0001-mm-reduce-the-amount-of-work-done-when-updating-min_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0002-mm-compaction-allow-compaction-to-isolate-dirty-page.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0003-mm-compaction-determine-if-dirty-pages-can-be-migrat.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0004-mm-page-allocator-do-not-call-direct-reclaim-for-THP.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0005-mm-compaction-make-isolate_lru_page-filter-aware-aga.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0006-mm-compaction-introduce-sync-light-migration-for-use.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0007-mm-vmscan-when-reclaiming-for-compaction-ensure-ther.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0008-mm-vmscan-do-not-OOM-if-aborting-reclaim-to-start-co.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0009-mm-vmscan-check-if-reclaim-should-really-abort-even-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0010-vmscan-promote-shared-file-mapped-pages.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0011-vmscan-activate-executable-pages-after-first-usage.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0012-mm-vmscan.c-consider-swap-space-when-deciding-whethe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0013-mm-test-PageSwapBacked-in-lumpy-reclaim.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0014-mm-vmscan-convert-global-reclaim-to-per-memcg-LRU-li.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0015-cpuset-mm-reduce-large-amounts-of-memory-barrier-rel.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0016-mm-hugetlb-fix-warning-in-alloc_huge_page-dequeue_hu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0017-Fix-NULL-dereferences-in-scsi_cmd_to_driver.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0018-sched-nohz-Fix-rq-cpu_load-calculations.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0019-sched-nohz-Fix-rq-cpu_load-calculations-some-more.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0020-powerpc-ftrace-Fix-assembly-trampoline-register-usag.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0021-cx25821-Remove-bad-strcpy-to-read-only-char.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0022-x86-Fix-boot-on-Twinhead-H12Y.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0023-r8169-RxConfig-hack-for-the-8168evl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0024-cifs-when-CONFIG_HIGHMEM-is-set-serialize-the-read-w.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0025-wireless-rt2x00-rt2800usb-add-more-devices-ids.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0026-wireless-rt2x00-rt2800usb-more-devices-were-identifi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0027-rt2800usb-2001-3c17-is-an-RT3370-device.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0028-usb-gadget-Fix-g_ether-interface-link-status.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0029-ext4-pass-a-char-to-ext4_count_free-instead-of-a-buf.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0030-ftrace-Disable-function-tracing-during-suspend-resum.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0031-x86-microcode-microcode_core.c-simple_strtoul-cleanu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0032-x86-microcode-Sanitize-per-cpu-microcode-reloading-i.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0033-usbdevfs-Correct-amount-of-data-copied-to-user-in-pr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0034-ext4-fix-overhead-calculation-used-by-ext4_statfs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0035-udf-Improve-table-length-check-to-avoid-possible-ove.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0036-powerpc-Add-memory-attribute-for-mfmsr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0037-mwifiex-correction-in-mcs-index-check.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0038-USB-option-Ignore-ZTE-Vodafone-K3570-71-net-interfac.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0039-USB-option-add-ZTE-MF821D.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0040-target-Add-generation-of-LOGICAL-BLOCK-ADDRESS-OUT-O.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0041-target-Add-range-checking-to-UNMAP-emulation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0042-target-Fix-reading-of-data-length-fields-for-UNMAP-c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0043-target-Fix-possible-integer-underflow-in-UNMAP-emula.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0044-target-Check-number-of-unmap-descriptors-against-our.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0045-s390-idle-fix-sequence-handling-vs-cpu-hotplug.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0046-rtlwifi-rtl8192de-Fix-phy-based-version-calculation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0047-workqueue-perform-cpu-down-operations-from-low-prior.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0048-ALSA-hda-Add-support-for-Realtek-ALC282.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0049-iommu-amd-Fix-hotplug-with-iommu-pt.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0050-drm-radeon-Try-harder-to-avoid-HW-cursor-ending-on-a.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0051-ALSA-hda-Turn-on-PIN_OUT-from-hdmi-playback-prepare.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0052-block-add-blk_queue_dead.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0053-Fix-device-removal-NULL-pointer-dereference.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0054-Avoid-dangling-pointer-in-scsi_requeue_command.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0055-fix-hot-unplug-vs-async-scan-race.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0056-fix-eh-wakeup-scsi_schedule_eh-vs-scsi_restart_opera.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0057-libsas-continue-revalidation.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0058-libsas-fix-sas_discover_devices-return-code-handling.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0059-iscsi-target-Drop-bogus-struct-file-usage-for-iSCSI-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0060-mmc-sdhci-pci-CaFe-has-broken-card-detection.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0061-ext4-don-t-let-i_reserved_meta_blocks-go-negative.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0062-ext4-undo-ext4_calc_metadata_amount-if-we-fail-to-cl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0063-ASoC-dapm-Fix-_PRE-and-_POST-events-for-DAPM-perform.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0064-locks-fix-checking-of-fcntl_setlease-argument.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0065-ACPI-AC-prevent-OOPS-on-some-boxes-due-to-missing-ch.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0066-drm-radeon-fix-bo-creation-retry-path.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0067-drm-radeon-fix-non-revealent-error-message.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0068-drm-radeon-fix-hotplug-of-DP-to-DVI-HDMI-passive-ada.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0069-drm-radeon-on-hotplug-force-link-training-to-happen-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0070-Btrfs-call-the-ordered-free-operation-without-any-lo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0071-nouveau-Fix-alignment-requirements-on-src-and-dst-ad.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0072-mm-fix-wrong-argument-of-migrate_huge_pages-in-soft_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0073-Linux-3.2.25.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 02759d5..9610881 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r14"
+MACHINE_KERNEL_PR = "r15"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0001-samsung-laptop-make-the-dmi-check-less-strict.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0001-samsung-laptop-make-the-dmi-check-less-strict.patch
new file mode 100644
index 0000000..613acd7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0001-samsung-laptop-make-the-dmi-check-less-strict.patch
@@ -0,0 +1,306 @@
+From fe36d7279bb09c09b2c07b1b8bfe786a3ab12486 Mon Sep 17 00:00:00 2001
+From: Corentin Chary <corentincj@iksaif.net>
+Date: Sat, 26 Nov 2011 11:00:10 +0100
+Subject: [PATCH 001/109] samsung-laptop: make the dmi check less strict
+
+commit 3be324a94df0c3f032178d04549dbfbf6cccb09a upstream.
+
+This enable the driver for everything that look like
+a laptop and is from vendor "SAMSUNG ELECTRONICS CO., LTD.".
+Note that laptop supported by samsung-q10 seem to have a different
+vendor strict.
+
+Also remove every log output until we know that we have a SABI interface
+(except if the driver is forced to load, or debug is enabled).
+
+Keeping a whitelist of laptop with a model granularity is something that can't
+work without close vendor cooperation (and we don't have that).
+
+Signed-off-by: Corentin Chary <corentincj@iksaif.net>
+Acked-by: Greg Kroah-Hartman <gregkh@suse.de>
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+[bwh: Backported to 3.2:
+ - Adjust context
+ - Drop changes relating to ACPI video]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/platform/x86/samsung-laptop.c |  225 ++-------------------------------
+ 1 files changed, 8 insertions(+), 217 deletions(-)
+
+diff --git a/drivers/platform/x86/samsung-laptop.c b/drivers/platform/x86/samsung-laptop.c
+index 09e26bf..af1e296 100644
+--- a/drivers/platform/x86/samsung-laptop.c
++++ b/drivers/platform/x86/samsung-laptop.c
+@@ -540,245 +540,34 @@ static DEVICE_ATTR(performance_level, S_IWUSR | S_IRUGO,
+ 		   get_performance_level, set_performance_level);
+ 
+ 
+-static int __init dmi_check_cb(const struct dmi_system_id *id)
+-{
+-	pr_info("found laptop model '%s'\n",
+-		id->ident);
+-	return 1;
+-}
+-
+ static struct dmi_system_id __initdata samsung_dmi_table[] = {
+ 	{
+-		.ident = "N128",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N128"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N128"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "N130",
+ 		.matches = {
+ 			DMI_MATCH(DMI_SYS_VENDOR,
+ 					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N130"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N130"),
++			DMI_MATCH(DMI_CHASSIS_TYPE, "8"), /* Portable */
+ 		},
+-		.callback = dmi_check_cb,
+ 	},
+ 	{
+-		.ident = "N510",
+ 		.matches = {
+ 			DMI_MATCH(DMI_SYS_VENDOR,
+ 					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N510"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N510"),
++			DMI_MATCH(DMI_CHASSIS_TYPE, "9"), /* Laptop */
+ 		},
+-		.callback = dmi_check_cb,
+ 	},
+ 	{
+-		.ident = "X125",
+ 		.matches = {
+ 			DMI_MATCH(DMI_SYS_VENDOR,
+ 					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "X125"),
+-			DMI_MATCH(DMI_BOARD_NAME, "X125"),
++			DMI_MATCH(DMI_CHASSIS_TYPE, "10"), /* Notebook */
+ 		},
+-		.callback = dmi_check_cb,
+ 	},
+ 	{
+-		.ident = "X120/X170",
+ 		.matches = {
+ 			DMI_MATCH(DMI_SYS_VENDOR,
+ 					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "X120/X170"),
+-			DMI_MATCH(DMI_BOARD_NAME, "X120/X170"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "NC10",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "NC10"),
+-			DMI_MATCH(DMI_BOARD_NAME, "NC10"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-		{
+-		.ident = "NP-Q45",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "SQ45S70S"),
+-			DMI_MATCH(DMI_BOARD_NAME, "SQ45S70S"),
+-		},
+-		.callback = dmi_check_cb,
+-		},
+-	{
+-		.ident = "X360",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "X360"),
+-			DMI_MATCH(DMI_BOARD_NAME, "X360"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R410 Plus",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "R410P"),
+-			DMI_MATCH(DMI_BOARD_NAME, "R460"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R518",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "R518"),
+-			DMI_MATCH(DMI_BOARD_NAME, "R518"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R519/R719",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "R519/R719"),
+-			DMI_MATCH(DMI_BOARD_NAME, "R519/R719"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "N150/N210/N220",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "N220",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N220"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N220"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "N150/N210/N220/N230",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N150/N210/N220/N230"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N150/N210/N220/N230"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "N150P/N210P/N220P",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N150P/N210P/N220P"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N150P/N210P/N220P"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R700",
+-		.matches = {
+-		      DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-		      DMI_MATCH(DMI_PRODUCT_NAME, "SR700"),
+-		      DMI_MATCH(DMI_BOARD_NAME, "SR700"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R530/R730",
+-		.matches = {
+-		      DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-		      DMI_MATCH(DMI_PRODUCT_NAME, "R530/R730"),
+-		      DMI_MATCH(DMI_BOARD_NAME, "R530/R730"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "NF110/NF210/NF310",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "NF110/NF210/NF310"),
+-			DMI_MATCH(DMI_BOARD_NAME, "NF110/NF210/NF310"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "N145P/N250P/N260P",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "N145P/N250P/N260P"),
+-			DMI_MATCH(DMI_BOARD_NAME, "N145P/N250P/N260P"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R70/R71",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR,
+-					"SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "R70/R71"),
+-			DMI_MATCH(DMI_BOARD_NAME, "R70/R71"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "P460",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "P460"),
+-			DMI_MATCH(DMI_BOARD_NAME, "P460"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "R528/R728",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "R528/R728"),
+-			DMI_MATCH(DMI_BOARD_NAME, "R528/R728"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-	{
+-		.ident = "NC210/NC110",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "NC210/NC110"),
+-			DMI_MATCH(DMI_BOARD_NAME, "NC210/NC110"),
+-		},
+-		.callback = dmi_check_cb,
+-	},
+-		{
+-		.ident = "X520",
+-		.matches = {
+-			DMI_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
+-			DMI_MATCH(DMI_PRODUCT_NAME, "X520"),
+-			DMI_MATCH(DMI_BOARD_NAME, "X520"),
++			DMI_MATCH(DMI_CHASSIS_TYPE, "14"), /* Sub-Notebook */
+ 		},
+-		.callback = dmi_check_cb,
+ 	},
+ 	{ },
+ };
+@@ -819,7 +608,8 @@ static int __init samsung_init(void)
+ 
+ 	f0000_segment = ioremap_nocache(0xf0000, 0xffff);
+ 	if (!f0000_segment) {
+-		pr_err("Can't map the segment at 0xf0000\n");
++		if (debug || force)
++			pr_err("Can't map the segment at 0xf0000\n");
+ 		return -EINVAL;
+ 	}
+ 
+@@ -832,7 +622,8 @@ static int __init samsung_init(void)
+ 	}
+ 
+ 	if (loca == 0xffff) {
+-		pr_err("This computer does not support SABI\n");
++		if (debug || force)
++			pr_err("This computer does not support SABI\n");
+ 		goto error_no_signature;
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0002-raid5-delayed-stripe-fix.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0002-raid5-delayed-stripe-fix.patch
new file mode 100644
index 0000000..bb9ebfa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0002-raid5-delayed-stripe-fix.patch
@@ -0,0 +1,43 @@
+From c3041d04e675a5d38a1d57fee3c59d4f073f512e Mon Sep 17 00:00:00 2001
+From: Shaohua Li <shli@kernel.org>
+Date: Tue, 3 Jul 2012 15:57:19 +1000
+Subject: [PATCH 002/109] raid5: delayed stripe fix
+
+commit fab363b5ff502d1b39ddcfec04271f5858d9f26e upstream.
+
+There isn't locking setting STRIPE_DELAYED and STRIPE_PREREAD_ACTIVE bits, but
+the two bits have relationship. A delayed stripe can be moved to hold list only
+when preread active stripe count is below IO_THRESHOLD. If a stripe has both
+the bits set, such stripe will be in delayed list and preread count not 0,
+which will make such stripe never leave delayed list.
+
+Signed-off-by: Shaohua Li <shli@fusionio.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid5.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
+index 6ba4954..26ef63a 100644
+--- a/drivers/md/raid5.c
++++ b/drivers/md/raid5.c
+@@ -196,12 +196,14 @@ static void __release_stripe(struct r5conf *conf, struct stripe_head *sh)
+ 		BUG_ON(!list_empty(&sh->lru));
+ 		BUG_ON(atomic_read(&conf->active_stripes)==0);
+ 		if (test_bit(STRIPE_HANDLE, &sh->state)) {
+-			if (test_bit(STRIPE_DELAYED, &sh->state))
++			if (test_bit(STRIPE_DELAYED, &sh->state) &&
++			    !test_bit(STRIPE_PREREAD_ACTIVE, &sh->state))
+ 				list_add_tail(&sh->lru, &conf->delayed_list);
+ 			else if (test_bit(STRIPE_BIT_DELAY, &sh->state) &&
+ 				   sh->bm_seq - conf->seq_write > 0)
+ 				list_add_tail(&sh->lru, &conf->bitmap_list);
+ 			else {
++				clear_bit(STRIPE_DELAYED, &sh->state);
+ 				clear_bit(STRIPE_BIT_DELAY, &sh->state);
+ 				list_add_tail(&sh->lru, &conf->handle_list);
+ 			}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0003-tcp-drop-SYN-FIN-messages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0003-tcp-drop-SYN-FIN-messages.patch
new file mode 100644
index 0000000..6eb3824
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0003-tcp-drop-SYN-FIN-messages.patch
@@ -0,0 +1,36 @@
+From ebf148a0ca2e0c9fb824a069c0fd5311bb6ae297 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Fri, 2 Dec 2011 23:41:42 +0000
+Subject: [PATCH 003/109] tcp: drop SYN+FIN messages
+
+commit fdf5af0daf8019cec2396cdef8fb042d80fe71fa upstream.
+
+Denys Fedoryshchenko reported that SYN+FIN attacks were bringing his
+linux machines to their limits.
+
+Dont call conn_request() if the TCP flags includes SYN flag
+
+Reported-by: Denys Fedoryshchenko <denys@visp.net.lb>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/ipv4/tcp_input.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 9726927..32e6ca2 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -5836,6 +5836,8 @@ int tcp_rcv_state_process(struct sock *sk, struct sk_buff *skb,
+ 			goto discard;
+ 
+ 		if (th->syn) {
++			if (th->fin)
++				goto discard;
+ 			if (icsk->icsk_af_ops->conn_request(sk, skb) < 0)
+ 				return 1;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0004-tg3-Apply-short-DMA-frag-workaround-to-5906.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0004-tg3-Apply-short-DMA-frag-workaround-to-5906.patch
new file mode 100644
index 0000000..15f5906
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0004-tg3-Apply-short-DMA-frag-workaround-to-5906.patch
@@ -0,0 +1,35 @@
+From 389c56a2dfc90eecb97841668a8d61fc3424f2c8 Mon Sep 17 00:00:00 2001
+From: Matt Carlson <mcarlson@broadcom.com>
+Date: Thu, 7 Jun 2012 12:56:54 +0000
+Subject: [PATCH 004/109] tg3: Apply short DMA frag workaround to 5906
+
+commit b7abee6ef888117f92db370620ebf116a38e3f4d upstream.
+
+5906 devices also need the short DMA fragment workaround.  This patch
+makes the necessary change.
+
+Signed-off-by: Matt Carlson <mcarlson@broadcom.com>
+Tested-by: Christian Kujau <lists@nerdbynature.de>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/broadcom/tg3.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/ethernet/broadcom/tg3.c b/drivers/net/ethernet/broadcom/tg3.c
+index 2dcac28..6b258d9 100644
+--- a/drivers/net/ethernet/broadcom/tg3.c
++++ b/drivers/net/ethernet/broadcom/tg3.c
+@@ -14046,7 +14046,8 @@ static int __devinit tg3_get_invariants(struct tg3 *tp)
+ 		}
+ 	}
+ 
+-	if (tg3_flag(tp, 5755_PLUS))
++	if (tg3_flag(tp, 5755_PLUS) ||
++	    GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5906)
+ 		tg3_flag_set(tp, SHORT_DMA_BUG);
+ 
+ 	if (GET_ASIC_REV(tp->pci_chip_rev_id) == ASIC_REV_5719)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0005-rtl8187-brightness_set-can-not-sleep.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0005-rtl8187-brightness_set-can-not-sleep.patch
new file mode 100644
index 0000000..5a01a08
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0005-rtl8187-brightness_set-can-not-sleep.patch
@@ -0,0 +1,56 @@
+From c8ad2074ce769ad8b16677e0a9bee9232be03acc Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Wed, 16 May 2012 11:06:21 +0200
+Subject: [PATCH 005/109] rtl8187: ->brightness_set can not sleep
+
+commit 0fde0a8cfd0ede7f310d6a681c8e5a7cb3e32406 upstream.
+
+Fix:
+
+BUG: sleeping function called from invalid context at kernel/workqueue.c:2547
+in_atomic(): 1, irqs_disabled(): 0, pid: 629, name: wpa_supplicant
+2 locks held by wpa_supplicant/629:
+ #0:  (rtnl_mutex){+.+.+.}, at: [<c08b2b84>] rtnl_lock+0x14/0x20
+ #1:  (&trigger->leddev_list_lock){.+.?..}, at: [<c0867f41>] led_trigger_event+0x21/0x80
+Pid: 629, comm: wpa_supplicant Not tainted 3.3.0-0.rc3.git5.1.fc17.i686
+Call Trace:
+ [<c046a9f6>] __might_sleep+0x126/0x1d0
+ [<c0457d6c>] wait_on_work+0x2c/0x1d0
+ [<c045a09a>] __cancel_work_timer+0x6a/0x120
+ [<c045a160>] cancel_delayed_work_sync+0x10/0x20
+ [<f7dd3c22>] rtl8187_led_brightness_set+0x82/0xf0 [rtl8187]
+ [<c0867f7c>] led_trigger_event+0x5c/0x80
+ [<f7ff5e6d>] ieee80211_led_radio+0x1d/0x40 [mac80211]
+ [<f7ff3583>] ieee80211_stop_device+0x13/0x230 [mac80211]
+
+Removing _sync is ok, because if led_on work is currently running
+it will be finished before led_off work start to perform, since
+they are always queued on the same mac80211 local->workqueue.
+
+Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=795176
+
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Acked-by: Larry Finger <Larry.Finger@lwfinger.net>
+Acked-by: Hin-Tak Leung <htl10@users.sourceforge.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rtl818x/rtl8187/leds.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/rtl818x/rtl8187/leds.c b/drivers/net/wireless/rtl818x/rtl8187/leds.c
+index 2e0de2f..c2d5b49 100644
+--- a/drivers/net/wireless/rtl818x/rtl8187/leds.c
++++ b/drivers/net/wireless/rtl818x/rtl8187/leds.c
+@@ -117,7 +117,7 @@ static void rtl8187_led_brightness_set(struct led_classdev *led_dev,
+ 			radio_on = true;
+ 		} else if (radio_on) {
+ 			radio_on = false;
+-			cancel_delayed_work_sync(&priv->led_on);
++			cancel_delayed_work(&priv->led_on);
+ 			ieee80211_queue_delayed_work(hw, &priv->led_off, 0);
+ 		}
+ 	} else if (radio_on) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0006-net-wireless-ipw2x00-add-supported-cipher-suites-to-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0006-net-wireless-ipw2x00-add-supported-cipher-suites-to-.patch
new file mode 100644
index 0000000..68fca84
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0006-net-wireless-ipw2x00-add-supported-cipher-suites-to-.patch
@@ -0,0 +1,102 @@
+From 54490f32c07630f7c6bd6429bf73d7507b06e3db Mon Sep 17 00:00:00 2001
+From: Stanislav Yakovlev <stas.yakovlev@gmail.com>
+Date: Tue, 10 Apr 2012 21:44:47 -0400
+Subject: [PATCH 006/109] net/wireless: ipw2x00: add supported cipher suites
+ to wiphy initialization
+
+commit a141e6a0097118bb35024485f1faffc0d9042f5c upstream.
+
+Driver doesn't report its supported cipher suites through cfg80211
+interface. It still uses wext interface and probably will not work
+through nl80211, but will at least correctly advertise supported
+features.
+
+Bug was reported by Omar Siam.
+https://bugzilla.kernel.org/show_bug.cgi?id=43049
+
+Signed-off-by: Stanislav Yakovlev <stas.yakovlev@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/ipw2x00/ipw.h     |   23 +++++++++++++++++++++++
+ drivers/net/wireless/ipw2x00/ipw2100.c |    4 ++++
+ drivers/net/wireless/ipw2x00/ipw2200.c |    4 ++++
+ 3 files changed, 31 insertions(+), 0 deletions(-)
+ create mode 100644 drivers/net/wireless/ipw2x00/ipw.h
+
+diff --git a/drivers/net/wireless/ipw2x00/ipw.h b/drivers/net/wireless/ipw2x00/ipw.h
+new file mode 100644
+index 0000000..4007bf5
+--- /dev/null
++++ b/drivers/net/wireless/ipw2x00/ipw.h
+@@ -0,0 +1,23 @@
++/*
++ * Intel Pro/Wireless 2100, 2200BG, 2915ABG network connection driver
++ *
++ * Copyright 2012 Stanislav Yakovlev <stas.yakovlev@gmail.com>
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License version 2 as
++ * published by the Free Software Foundation.
++ */
++
++#ifndef __IPW_H__
++#define __IPW_H__
++
++#include <linux/ieee80211.h>
++
++static const u32 ipw_cipher_suites[] = {
++	WLAN_CIPHER_SUITE_WEP40,
++	WLAN_CIPHER_SUITE_WEP104,
++	WLAN_CIPHER_SUITE_TKIP,
++	WLAN_CIPHER_SUITE_CCMP,
++};
++
++#endif
+diff --git a/drivers/net/wireless/ipw2x00/ipw2100.c b/drivers/net/wireless/ipw2x00/ipw2100.c
+index 127e9c6..10862d4 100644
+--- a/drivers/net/wireless/ipw2x00/ipw2100.c
++++ b/drivers/net/wireless/ipw2x00/ipw2100.c
+@@ -166,6 +166,7 @@ that only one external action is invoked at a time.
+ #include <net/lib80211.h>
+ 
+ #include "ipw2100.h"
++#include "ipw.h"
+ 
+ #define IPW2100_VERSION "git-1.2.2"
+ 
+@@ -1955,6 +1956,9 @@ static int ipw2100_wdev_init(struct net_device *dev)
+ 		wdev->wiphy->bands[IEEE80211_BAND_2GHZ] = bg_band;
+ 	}
+ 
++	wdev->wiphy->cipher_suites = ipw_cipher_suites;
++	wdev->wiphy->n_cipher_suites = ARRAY_SIZE(ipw_cipher_suites);
++
+ 	set_wiphy_dev(wdev->wiphy, &priv->pci_dev->dev);
+ 	if (wiphy_register(wdev->wiphy)) {
+ 		ipw2100_down(priv);
+diff --git a/drivers/net/wireless/ipw2x00/ipw2200.c b/drivers/net/wireless/ipw2x00/ipw2200.c
+index 827889b..56bd370 100644
+--- a/drivers/net/wireless/ipw2x00/ipw2200.c
++++ b/drivers/net/wireless/ipw2x00/ipw2200.c
+@@ -34,6 +34,7 @@
+ #include <linux/slab.h>
+ #include <net/cfg80211-wext.h>
+ #include "ipw2200.h"
++#include "ipw.h"
+ 
+ 
+ #ifndef KBUILD_EXTMOD
+@@ -11535,6 +11536,9 @@ static int ipw_wdev_init(struct net_device *dev)
+ 		wdev->wiphy->bands[IEEE80211_BAND_5GHZ] = a_band;
+ 	}
+ 
++	wdev->wiphy->cipher_suites = ipw_cipher_suites;
++	wdev->wiphy->n_cipher_suites = ARRAY_SIZE(ipw_cipher_suites);
++
+ 	set_wiphy_dev(wdev->wiphy, &priv->pci_dev->dev);
+ 
+ 	/* With that information in place, we can now register the wiphy... */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0007-drm-i915-do-not-enable-RC6p-on-Sandy-Bridge.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0007-drm-i915-do-not-enable-RC6p-on-Sandy-Bridge.patch
new file mode 100644
index 0000000..ac8f0c7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0007-drm-i915-do-not-enable-RC6p-on-Sandy-Bridge.patch
@@ -0,0 +1,47 @@
+From ae8e28c4c0aaba535e88908a7a2c560bb55061f9 Mon Sep 17 00:00:00 2001
+From: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Date: Tue, 14 Feb 2012 11:44:48 -0200
+Subject: [PATCH 007/109] drm/i915: do not enable RC6p on Sandy Bridge
+
+commit 1c8ecf80fdee4e7b23a9e7da7ff9bd59ba2dcf96 upstream.
+
+With base on latest findings, RC6p seems to be respondible for RC6-related
+issues on Sandy Bridge platform. To work-around those issues, the previous
+solution was to completely disable RC6 on Sandy Bridge for the past few
+releases, even if plain RC6 was not giving any issues.
+
+What this patch does is preventing RC6p from being enabled on Sandy Bridge
+even if users enable RC6 via a kernel parameter. So it won't change the
+defaults in any way, but will ensure that if users do enable RC6 manually
+it won't break their machines by enabling this extra state.
+
+Proper fix for this (enabling specific RC6 states according to the GPU
+generation) were proposed for the -next kernel, but we are too late in the
+release process now to pick such changes.
+
+Acked-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_display.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
+index 6aa7716..c63ca5f 100644
+--- a/drivers/gpu/drm/i915/intel_display.c
++++ b/drivers/gpu/drm/i915/intel_display.c
+@@ -8043,8 +8043,8 @@ void gen6_enable_rps(struct drm_i915_private *dev_priv)
+ 	I915_WRITE(GEN6_RC6pp_THRESHOLD, 64000); /* unused */
+ 
+ 	if (intel_enable_rc6(dev_priv->dev))
+-		rc6_mask = GEN6_RC_CTL_RC6p_ENABLE |
+-			GEN6_RC_CTL_RC6_ENABLE;
++		rc6_mask = GEN6_RC_CTL_RC6_ENABLE |
++			(IS_GEN7(dev_priv->dev)) ? GEN6_RC_CTL_RC6p_ENABLE : 0;
+ 
+ 	I915_WRITE(GEN6_RC_CONTROL,
+ 		   rc6_mask |
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0008-drm-i915-fix-operator-precedence-when-enabling-RC6p.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0008-drm-i915-fix-operator-precedence-when-enabling-RC6p.patch
new file mode 100644
index 0000000..18b111f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0008-drm-i915-fix-operator-precedence-when-enabling-RC6p.patch
@@ -0,0 +1,34 @@
+From 2c5df93ac56c5ec76f87a0daf418966abb25b03b Mon Sep 17 00:00:00 2001
+From: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Date: Thu, 23 Feb 2012 23:57:06 -0200
+Subject: [PATCH 008/109] drm/i915: fix operator precedence when enabling RC6p
+
+commit c0e2ee1bc0cf82eec89e26b7afe7e4db0561b7d9 upstream.
+
+As noticed by Torsten Kaiser, the operator precedence can play tricks with
+us here.
+
+CC: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/i915/intel_display.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
+index c63ca5f..cc75c4b 100644
+--- a/drivers/gpu/drm/i915/intel_display.c
++++ b/drivers/gpu/drm/i915/intel_display.c
+@@ -8044,7 +8044,7 @@ void gen6_enable_rps(struct drm_i915_private *dev_priv)
+ 
+ 	if (intel_enable_rc6(dev_priv->dev))
+ 		rc6_mask = GEN6_RC_CTL_RC6_ENABLE |
+-			(IS_GEN7(dev_priv->dev)) ? GEN6_RC_CTL_RC6p_ENABLE : 0;
++			((IS_GEN7(dev_priv->dev)) ? GEN6_RC_CTL_RC6p_ENABLE : 0);
+ 
+ 	I915_WRITE(GEN6_RC_CONTROL,
+ 		   rc6_mask |
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0009-kbuild-do-not-check-for-ancient-modutils-tools.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0009-kbuild-do-not-check-for-ancient-modutils-tools.patch
new file mode 100644
index 0000000..281b4e9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0009-kbuild-do-not-check-for-ancient-modutils-tools.patch
@@ -0,0 +1,47 @@
+From 6ad602fb1ad21f96e203b4525aa56c7e0cc6ac4f Mon Sep 17 00:00:00 2001
+From: Lucas De Marchi <lucas.demarchi@profusion.mobi>
+Date: Tue, 17 Jan 2012 14:50:51 -0200
+Subject: [PATCH 009/109] kbuild: do not check for ancient modutils tools
+
+commit 620c231c7a7f48745094727bb612f6321cfc8844 upstream.
+
+scripts/depmod.sh checks for the output of '-V' expecting that it has
+module-init-tools in it. It's a hack to prevent users from using
+modutils instead of module-init-tools, that only works with 2.4.x
+kernels. This however prints an annoying warning for kmod tool, that is
+currently replacing module-init-tools.
+
+Rather than putting another check for kmod's version, just remove it
+since users of 2.4.x kernel are unlikely to upgrade to 3.x, and if they
+do, let depmod fail in that case because they should know what they are
+doing.
+
+Signed-off-by: Lucas De Marchi <lucas.demarchi@profusion.mobi>
+Acked-by: WANG Cong <amwang@redhat.com>
+Acked-By: Kay Sievers <kay.sievers@vrfy.org>
+Signed-off-by: Michal Marek <mmarek@suse.cz>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ scripts/depmod.sh |    6 ------
+ 1 files changed, 0 insertions(+), 6 deletions(-)
+
+diff --git a/scripts/depmod.sh b/scripts/depmod.sh
+index a272356..2ae4817 100755
+--- a/scripts/depmod.sh
++++ b/scripts/depmod.sh
+@@ -9,12 +9,6 @@ fi
+ DEPMOD=$1
+ KERNELRELEASE=$2
+ 
+-if ! "$DEPMOD" -V 2>/dev/null | grep -q module-init-tools; then
+-	echo "Warning: you may need to install module-init-tools" >&2
+-	echo "See http://www.codemonkey.org.uk/docs/post-halloween-2.6.txt" >&2
+-	sleep 1
+-fi
+-
+ if ! test -r System.map -a -x "$DEPMOD"; then
+ 	exit 0
+ fi
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0010-brcmsmac-INTERMEDIATE-but-not-AMPDU-only-when-tracin.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0010-brcmsmac-INTERMEDIATE-but-not-AMPDU-only-when-tracin.patch
new file mode 100644
index 0000000..a22e50d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0010-brcmsmac-INTERMEDIATE-but-not-AMPDU-only-when-tracin.patch
@@ -0,0 +1,45 @@
+From bc3f81b80966fcd6e91b61c76408eed675a1b364 Mon Sep 17 00:00:00 2001
+From: Eldad Zack <eldad@fogrefinery.com>
+Date: Sun, 22 Apr 2012 00:48:04 +0200
+Subject: [PATCH 010/109] brcmsmac: "INTERMEDIATE but not AMPDU" only when
+ tracing
+
+commit 6ead629b27269c553c9092c47cd8f5ab0309ee3b upstream.
+
+I keep getting the following messages on the log buffer:
+[ 2167.097507] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+[ 2281.331305] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+[ 2281.332539] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+[ 2329.876605] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+[ 2329.877354] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+[ 2462.280756] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+[ 2615.651689] ieee80211 phy0: brcms_c_dotxstatus: INTERMEDIATE but not AMPDU
+
+From the code comment I understand that this something that can -
+and does, quite frequently - happen.
+
+Signed-off-by: Eldad Zack <eldad@fogrefinery.com>
+Acked-by: Franky Lin<frankyl@broadcom.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/brcm80211/brcmsmac/main.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/brcm80211/brcmsmac/main.c b/drivers/net/wireless/brcm80211/brcmsmac/main.c
+index 833cbef..8a40ff9 100644
+--- a/drivers/net/wireless/brcm80211/brcmsmac/main.c
++++ b/drivers/net/wireless/brcm80211/brcmsmac/main.c
+@@ -900,8 +900,7 @@ brcms_c_dotxstatus(struct brcms_c_info *wlc, struct tx_status *txs)
+ 	 */
+ 	if (!(txs->status & TX_STATUS_AMPDU)
+ 	    && (txs->status & TX_STATUS_INTERMEDIATE)) {
+-		wiphy_err(wlc->wiphy, "%s: INTERMEDIATE but not AMPDU\n",
+-			  __func__);
++		BCMMSG(wlc->wiphy, "INTERMEDIATE but not AMPDU\n");
+ 		return false;
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0011-NFSv4-Rate-limit-the-state-manager-for-lock-reclaim-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0011-NFSv4-Rate-limit-the-state-manager-for-lock-reclaim-.patch
new file mode 100644
index 0000000..44b7c81
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0011-NFSv4-Rate-limit-the-state-manager-for-lock-reclaim-.patch
@@ -0,0 +1,37 @@
+From 9c6259f9486461da338a097ae1655d55b7bead3a Mon Sep 17 00:00:00 2001
+From: William Dauchy <wdauchy@gmail.com>
+Date: Wed, 14 Mar 2012 12:32:04 +0100
+Subject: [PATCH 011/109] NFSv4: Rate limit the state manager for lock reclaim
+ warning messages
+
+commit 96dcadc2fdd111dca90d559f189a30c65394451a upstream.
+
+Adding rate limit on `Lock reclaim failed` messages since it could fill
+up system logs
+Signed-off-by: William Dauchy <wdauchy@gmail.com>
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+[bwh: Backported to 3.2: add the 'NFS:' prefix at the same time]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfs/nfs4state.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/fs/nfs/nfs4state.c b/fs/nfs/nfs4state.c
+index 66020ac..07354b7 100644
+--- a/fs/nfs/nfs4state.c
++++ b/fs/nfs/nfs4state.c
+@@ -1186,8 +1186,9 @@ restart:
+ 				spin_lock(&state->state_lock);
+ 				list_for_each_entry(lock, &state->lock_states, ls_locks) {
+ 					if (!(lock->ls_flags & NFS_LOCK_INITIALIZED))
+-						printk("%s: Lock reclaim failed!\n",
+-							__func__);
++						pr_warn_ratelimited("NFS: "
++							"%s: Lock reclaim "
++							"failed!\n", __func__);
+ 				}
+ 				spin_unlock(&state->state_lock);
+ 				nfs4_put_open_state(state);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0012-ext4-Report-max_batch_time-option-correctly.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0012-ext4-Report-max_batch_time-option-correctly.patch
new file mode 100644
index 0000000..5bd27b4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0012-ext4-Report-max_batch_time-option-correctly.patch
@@ -0,0 +1,32 @@
+From 877ee75ef7f45fd1022c37f6a8a957e9d1b098b7 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 4 Jan 2012 21:22:51 -0500
+Subject: [PATCH 012/109] ext4: Report max_batch_time option correctly
+
+commit 1d526fc91bea04ee35b7599bf8b82f86c0aaf46c upstream.
+
+Currently the value reported for max_batch_time is really the
+value of min_batch_time.
+
+Reported-by: Russell Coker <russell@coker.com.au>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ext4/super.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/ext4/super.c b/fs/ext4/super.c
+index ab7aa3f..a93486e 100644
+--- a/fs/ext4/super.c
++++ b/fs/ext4/super.c
+@@ -1097,7 +1097,7 @@ static int ext4_show_options(struct seq_file *seq, struct vfsmount *vfs)
+ 	}
+ 	if (sbi->s_max_batch_time != EXT4_DEF_MAX_BATCH_TIME) {
+ 		seq_printf(seq, ",max_batch_time=%u",
+-			   (unsigned) sbi->s_min_batch_time);
++			   (unsigned) sbi->s_max_batch_time);
+ 	}
+ 
+ 	/*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0013-hugepages-fix-use-after-free-bug-in-quota-handling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0013-hugepages-fix-use-after-free-bug-in-quota-handling.patch
new file mode 100644
index 0000000..bdfa386
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0013-hugepages-fix-use-after-free-bug-in-quota-handling.patch
@@ -0,0 +1,464 @@
+From 5babdc7487f6c78c06d8e085efe841d91a77ff48 Mon Sep 17 00:00:00 2001
+From: David Gibson <david@gibson.dropbear.id.au>
+Date: Wed, 21 Mar 2012 16:34:12 -0700
+Subject: [PATCH 013/109] hugepages: fix use after free bug in "quota"
+ handling
+
+commit 90481622d75715bfcb68501280a917dbfe516029 upstream.
+
+hugetlbfs_{get,put}_quota() are badly named.  They don't interact with the
+general quota handling code, and they don't much resemble its behaviour.
+Rather than being about maintaining limits on on-disk block usage by
+particular users, they are instead about maintaining limits on in-memory
+page usage (including anonymous MAP_PRIVATE copied-on-write pages)
+associated with a particular hugetlbfs filesystem instance.
+
+Worse, they work by having callbacks to the hugetlbfs filesystem code from
+the low-level page handling code, in particular from free_huge_page().
+This is a layering violation of itself, but more importantly, if the
+kernel does a get_user_pages() on hugepages (which can happen from KVM
+amongst others), then the free_huge_page() can be delayed until after the
+associated inode has already been freed.  If an unmount occurs at the
+wrong time, even the hugetlbfs superblock where the "quota" limits are
+stored may have been freed.
+
+Andrew Barry proposed a patch to fix this by having hugepages, instead of
+storing a pointer to their address_space and reaching the superblock from
+there, had the hugepages store pointers directly to the superblock,
+bumping the reference count as appropriate to avoid it being freed.
+Andrew Morton rejected that version, however, on the grounds that it made
+the existing layering violation worse.
+
+This is a reworked version of Andrew's patch, which removes the extra, and
+some of the existing, layering violation.  It works by introducing the
+concept of a hugepage "subpool" at the lower hugepage mm layer - that is a
+finite logical pool of hugepages to allocate from.  hugetlbfs now creates
+a subpool for each filesystem instance with a page limit set, and a
+pointer to the subpool gets added to each allocated hugepage, instead of
+the address_space pointer used now.  The subpool has its own lifetime and
+is only freed once all pages in it _and_ all other references to it (i.e.
+superblocks) are gone.
+
+subpools are optional - a NULL subpool pointer is taken by the code to
+mean that no subpool limits are in effect.
+
+Previous discussion of this bug found in:  "Fix refcounting in hugetlbfs
+quota handling.". See:  https://lkml.org/lkml/2011/8/11/28 or
+http://marc.info/?l=linux-mm&m=126928970510627&w=1
+
+v2: Fixed a bug spotted by Hillf Danton, and removed the extra parameter to
+alloc_huge_page() - since it already takes the vma, it is not necessary.
+
+Signed-off-by: Andrew Barry <abarry@cray.com>
+Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
+Cc: Hugh Dickins <hughd@google.com>
+Cc: Mel Gorman <mgorman@suse.de>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: Hillf Danton <dhillf@gmail.com>
+Cc: Paul Mackerras <paulus@samba.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+[bwh: Backported to 3.2: adjust context to apply after commit
+ c50ac050811d6485616a193eb0f37bfbd191cc89 'hugetlb: fix resv_map leak in
+ error path', backported in 3.2.20]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/hugetlbfs/inode.c    |   54 +++++++-----------
+ include/linux/hugetlb.h |   14 ++++--
+ mm/hugetlb.c            |  135 +++++++++++++++++++++++++++++++++++++---------
+ 3 files changed, 139 insertions(+), 64 deletions(-)
+
+diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
+index 2d0ca24..ebc2f4d 100644
+--- a/fs/hugetlbfs/inode.c
++++ b/fs/hugetlbfs/inode.c
+@@ -592,9 +592,15 @@ static int hugetlbfs_statfs(struct dentry *dentry, struct kstatfs *buf)
+ 		spin_lock(&sbinfo->stat_lock);
+ 		/* If no limits set, just report 0 for max/free/used
+ 		 * blocks, like simple_statfs() */
+-		if (sbinfo->max_blocks >= 0) {
+-			buf->f_blocks = sbinfo->max_blocks;
+-			buf->f_bavail = buf->f_bfree = sbinfo->free_blocks;
++		if (sbinfo->spool) {
++			long free_pages;
++
++			spin_lock(&sbinfo->spool->lock);
++			buf->f_blocks = sbinfo->spool->max_hpages;
++			free_pages = sbinfo->spool->max_hpages
++				- sbinfo->spool->used_hpages;
++			buf->f_bavail = buf->f_bfree = free_pages;
++			spin_unlock(&sbinfo->spool->lock);
+ 			buf->f_files = sbinfo->max_inodes;
+ 			buf->f_ffree = sbinfo->free_inodes;
+ 		}
+@@ -610,6 +616,10 @@ static void hugetlbfs_put_super(struct super_block *sb)
+ 
+ 	if (sbi) {
+ 		sb->s_fs_info = NULL;
++
++		if (sbi->spool)
++			hugepage_put_subpool(sbi->spool);
++
+ 		kfree(sbi);
+ 	}
+ }
+@@ -841,10 +851,14 @@ hugetlbfs_fill_super(struct super_block *sb, void *data, int silent)
+ 	sb->s_fs_info = sbinfo;
+ 	sbinfo->hstate = config.hstate;
+ 	spin_lock_init(&sbinfo->stat_lock);
+-	sbinfo->max_blocks = config.nr_blocks;
+-	sbinfo->free_blocks = config.nr_blocks;
+ 	sbinfo->max_inodes = config.nr_inodes;
+ 	sbinfo->free_inodes = config.nr_inodes;
++	sbinfo->spool = NULL;
++	if (config.nr_blocks != -1) {
++		sbinfo->spool = hugepage_new_subpool(config.nr_blocks);
++		if (!sbinfo->spool)
++			goto out_free;
++	}
+ 	sb->s_maxbytes = MAX_LFS_FILESIZE;
+ 	sb->s_blocksize = huge_page_size(config.hstate);
+ 	sb->s_blocksize_bits = huge_page_shift(config.hstate);
+@@ -864,38 +878,12 @@ hugetlbfs_fill_super(struct super_block *sb, void *data, int silent)
+ 	sb->s_root = root;
+ 	return 0;
+ out_free:
++	if (sbinfo->spool)
++		kfree(sbinfo->spool);
+ 	kfree(sbinfo);
+ 	return -ENOMEM;
+ }
+ 
+-int hugetlb_get_quota(struct address_space *mapping, long delta)
+-{
+-	int ret = 0;
+-	struct hugetlbfs_sb_info *sbinfo = HUGETLBFS_SB(mapping->host->i_sb);
+-
+-	if (sbinfo->free_blocks > -1) {
+-		spin_lock(&sbinfo->stat_lock);
+-		if (sbinfo->free_blocks - delta >= 0)
+-			sbinfo->free_blocks -= delta;
+-		else
+-			ret = -ENOMEM;
+-		spin_unlock(&sbinfo->stat_lock);
+-	}
+-
+-	return ret;
+-}
+-
+-void hugetlb_put_quota(struct address_space *mapping, long delta)
+-{
+-	struct hugetlbfs_sb_info *sbinfo = HUGETLBFS_SB(mapping->host->i_sb);
+-
+-	if (sbinfo->free_blocks > -1) {
+-		spin_lock(&sbinfo->stat_lock);
+-		sbinfo->free_blocks += delta;
+-		spin_unlock(&sbinfo->stat_lock);
+-	}
+-}
+-
+ static struct dentry *hugetlbfs_mount(struct file_system_type *fs_type,
+ 	int flags, const char *dev_name, void *data)
+ {
+diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
+index d9d6c86..c5ed2f1 100644
+--- a/include/linux/hugetlb.h
++++ b/include/linux/hugetlb.h
+@@ -14,6 +14,15 @@ struct user_struct;
+ #include <linux/shm.h>
+ #include <asm/tlbflush.h>
+ 
++struct hugepage_subpool {
++	spinlock_t lock;
++	long count;
++	long max_hpages, used_hpages;
++};
++
++struct hugepage_subpool *hugepage_new_subpool(long nr_blocks);
++void hugepage_put_subpool(struct hugepage_subpool *spool);
++
+ int PageHuge(struct page *page);
+ 
+ void reset_vma_resv_huge_pages(struct vm_area_struct *vma);
+@@ -138,12 +147,11 @@ struct hugetlbfs_config {
+ };
+ 
+ struct hugetlbfs_sb_info {
+-	long	max_blocks;   /* blocks allowed */
+-	long	free_blocks;  /* blocks free */
+ 	long	max_inodes;   /* inodes allowed */
+ 	long	free_inodes;  /* inodes free */
+ 	spinlock_t	stat_lock;
+ 	struct hstate *hstate;
++	struct hugepage_subpool *spool;
+ };
+ 
+ 
+@@ -166,8 +174,6 @@ extern const struct file_operations hugetlbfs_file_operations;
+ extern const struct vm_operations_struct hugetlb_vm_ops;
+ struct file *hugetlb_file_setup(const char *name, size_t size, vm_flags_t acct,
+ 				struct user_struct **user, int creat_flags);
+-int hugetlb_get_quota(struct address_space *mapping, long delta);
+-void hugetlb_put_quota(struct address_space *mapping, long delta);
+ 
+ static inline int is_file_hugepages(struct file *file)
+ {
+diff --git a/mm/hugetlb.c b/mm/hugetlb.c
+index 5f5c545..7c535b0 100644
+--- a/mm/hugetlb.c
++++ b/mm/hugetlb.c
+@@ -53,6 +53,84 @@ static unsigned long __initdata default_hstate_size;
+  */
+ static DEFINE_SPINLOCK(hugetlb_lock);
+ 
++static inline void unlock_or_release_subpool(struct hugepage_subpool *spool)
++{
++	bool free = (spool->count == 0) && (spool->used_hpages == 0);
++
++	spin_unlock(&spool->lock);
++
++	/* If no pages are used, and no other handles to the subpool
++	 * remain, free the subpool the subpool remain */
++	if (free)
++		kfree(spool);
++}
++
++struct hugepage_subpool *hugepage_new_subpool(long nr_blocks)
++{
++	struct hugepage_subpool *spool;
++
++	spool = kmalloc(sizeof(*spool), GFP_KERNEL);
++	if (!spool)
++		return NULL;
++
++	spin_lock_init(&spool->lock);
++	spool->count = 1;
++	spool->max_hpages = nr_blocks;
++	spool->used_hpages = 0;
++
++	return spool;
++}
++
++void hugepage_put_subpool(struct hugepage_subpool *spool)
++{
++	spin_lock(&spool->lock);
++	BUG_ON(!spool->count);
++	spool->count--;
++	unlock_or_release_subpool(spool);
++}
++
++static int hugepage_subpool_get_pages(struct hugepage_subpool *spool,
++				      long delta)
++{
++	int ret = 0;
++
++	if (!spool)
++		return 0;
++
++	spin_lock(&spool->lock);
++	if ((spool->used_hpages + delta) <= spool->max_hpages) {
++		spool->used_hpages += delta;
++	} else {
++		ret = -ENOMEM;
++	}
++	spin_unlock(&spool->lock);
++
++	return ret;
++}
++
++static void hugepage_subpool_put_pages(struct hugepage_subpool *spool,
++				       long delta)
++{
++	if (!spool)
++		return;
++
++	spin_lock(&spool->lock);
++	spool->used_hpages -= delta;
++	/* If hugetlbfs_put_super couldn't free spool due to
++	* an outstanding quota reference, free it now. */
++	unlock_or_release_subpool(spool);
++}
++
++static inline struct hugepage_subpool *subpool_inode(struct inode *inode)
++{
++	return HUGETLBFS_SB(inode->i_sb)->spool;
++}
++
++static inline struct hugepage_subpool *subpool_vma(struct vm_area_struct *vma)
++{
++	return subpool_inode(vma->vm_file->f_dentry->d_inode);
++}
++
+ /*
+  * Region tracking -- allows tracking of reservations and instantiated pages
+  *                    across the pages in a mapping.
+@@ -533,9 +611,9 @@ static void free_huge_page(struct page *page)
+ 	 */
+ 	struct hstate *h = page_hstate(page);
+ 	int nid = page_to_nid(page);
+-	struct address_space *mapping;
++	struct hugepage_subpool *spool =
++		(struct hugepage_subpool *)page_private(page);
+ 
+-	mapping = (struct address_space *) page_private(page);
+ 	set_page_private(page, 0);
+ 	page->mapping = NULL;
+ 	BUG_ON(page_count(page));
+@@ -551,8 +629,7 @@ static void free_huge_page(struct page *page)
+ 		enqueue_huge_page(h, page);
+ 	}
+ 	spin_unlock(&hugetlb_lock);
+-	if (mapping)
+-		hugetlb_put_quota(mapping, 1);
++	hugepage_subpool_put_pages(spool, 1);
+ }
+ 
+ static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
+@@ -966,11 +1043,12 @@ static void return_unused_surplus_pages(struct hstate *h,
+ /*
+  * Determine if the huge page at addr within the vma has an associated
+  * reservation.  Where it does not we will need to logically increase
+- * reservation and actually increase quota before an allocation can occur.
+- * Where any new reservation would be required the reservation change is
+- * prepared, but not committed.  Once the page has been quota'd allocated
+- * an instantiated the change should be committed via vma_commit_reservation.
+- * No action is required on failure.
++ * reservation and actually increase subpool usage before an allocation
++ * can occur.  Where any new reservation would be required the
++ * reservation change is prepared, but not committed.  Once the page
++ * has been allocated from the subpool and instantiated the change should
++ * be committed via vma_commit_reservation.  No action is required on
++ * failure.
+  */
+ static long vma_needs_reservation(struct hstate *h,
+ 			struct vm_area_struct *vma, unsigned long addr)
+@@ -1019,24 +1097,24 @@ static void vma_commit_reservation(struct hstate *h,
+ static struct page *alloc_huge_page(struct vm_area_struct *vma,
+ 				    unsigned long addr, int avoid_reserve)
+ {
++	struct hugepage_subpool *spool = subpool_vma(vma);
+ 	struct hstate *h = hstate_vma(vma);
+ 	struct page *page;
+-	struct address_space *mapping = vma->vm_file->f_mapping;
+-	struct inode *inode = mapping->host;
+ 	long chg;
+ 
+ 	/*
+-	 * Processes that did not create the mapping will have no reserves and
+-	 * will not have accounted against quota. Check that the quota can be
+-	 * made before satisfying the allocation
+-	 * MAP_NORESERVE mappings may also need pages and quota allocated
+-	 * if no reserve mapping overlaps.
++	 * Processes that did not create the mapping will have no
++	 * reserves and will not have accounted against subpool
++	 * limit. Check that the subpool limit can be made before
++	 * satisfying the allocation MAP_NORESERVE mappings may also
++	 * need pages and subpool limit allocated allocated if no reserve
++	 * mapping overlaps.
+ 	 */
+ 	chg = vma_needs_reservation(h, vma, addr);
+ 	if (chg < 0)
+ 		return ERR_PTR(-VM_FAULT_OOM);
+ 	if (chg)
+-		if (hugetlb_get_quota(inode->i_mapping, chg))
++		if (hugepage_subpool_get_pages(spool, chg))
+ 			return ERR_PTR(-VM_FAULT_SIGBUS);
+ 
+ 	spin_lock(&hugetlb_lock);
+@@ -1046,12 +1124,12 @@ static struct page *alloc_huge_page(struct vm_area_struct *vma,
+ 	if (!page) {
+ 		page = alloc_buddy_huge_page(h, NUMA_NO_NODE);
+ 		if (!page) {
+-			hugetlb_put_quota(inode->i_mapping, chg);
++			hugepage_subpool_put_pages(spool, chg);
+ 			return ERR_PTR(-VM_FAULT_SIGBUS);
+ 		}
+ 	}
+ 
+-	set_page_private(page, (unsigned long) mapping);
++	set_page_private(page, (unsigned long)spool);
+ 
+ 	vma_commit_reservation(h, vma, addr);
+ 
+@@ -2081,6 +2159,7 @@ static void hugetlb_vm_op_close(struct vm_area_struct *vma)
+ {
+ 	struct hstate *h = hstate_vma(vma);
+ 	struct resv_map *reservations = vma_resv_map(vma);
++	struct hugepage_subpool *spool = subpool_vma(vma);
+ 	unsigned long reserve;
+ 	unsigned long start;
+ 	unsigned long end;
+@@ -2096,7 +2175,7 @@ static void hugetlb_vm_op_close(struct vm_area_struct *vma)
+ 
+ 		if (reserve) {
+ 			hugetlb_acct_memory(h, -reserve);
+-			hugetlb_put_quota(vma->vm_file->f_mapping, reserve);
++			hugepage_subpool_put_pages(spool, reserve);
+ 		}
+ 	}
+ }
+@@ -2326,7 +2405,7 @@ static int unmap_ref_private(struct mm_struct *mm, struct vm_area_struct *vma,
+ 	address = address & huge_page_mask(h);
+ 	pgoff = ((address - vma->vm_start) >> PAGE_SHIFT)
+ 		+ (vma->vm_pgoff >> PAGE_SHIFT);
+-	mapping = (struct address_space *)page_private(page);
++	mapping = vma->vm_file->f_dentry->d_inode->i_mapping;
+ 
+ 	/*
+ 	 * Take the mapping lock for the duration of the table walk. As
+@@ -2865,11 +2944,12 @@ int hugetlb_reserve_pages(struct inode *inode,
+ {
+ 	long ret, chg;
+ 	struct hstate *h = hstate_inode(inode);
++	struct hugepage_subpool *spool = subpool_inode(inode);
+ 
+ 	/*
+ 	 * Only apply hugepage reservation if asked. At fault time, an
+ 	 * attempt will be made for VM_NORESERVE to allocate a page
+-	 * and filesystem quota without using reserves
++	 * without using reserves
+ 	 */
+ 	if (vm_flags & VM_NORESERVE)
+ 		return 0;
+@@ -2898,19 +2978,19 @@ int hugetlb_reserve_pages(struct inode *inode,
+ 		goto out_err;
+ 	}
+ 
+-	/* There must be enough filesystem quota for the mapping */
+-	if (hugetlb_get_quota(inode->i_mapping, chg)) {
++	/* There must be enough pages in the subpool for the mapping */
++	if (hugepage_subpool_get_pages(spool, chg)) {
+ 		ret = -ENOSPC;
+ 		goto out_err;
+ 	}
+ 
+ 	/*
+ 	 * Check enough hugepages are available for the reservation.
+-	 * Hand back the quota if there are not
++	 * Hand the pages back to the subpool if there are not
+ 	 */
+ 	ret = hugetlb_acct_memory(h, chg);
+ 	if (ret < 0) {
+-		hugetlb_put_quota(inode->i_mapping, chg);
++		hugepage_subpool_put_pages(spool, chg);
+ 		goto out_err;
+ 	}
+ 
+@@ -2938,12 +3018,13 @@ void hugetlb_unreserve_pages(struct inode *inode, long offset, long freed)
+ {
+ 	struct hstate *h = hstate_inode(inode);
+ 	long chg = region_truncate(&inode->i_mapping->private_list, offset);
++	struct hugepage_subpool *spool = subpool_inode(inode);
+ 
+ 	spin_lock(&inode->i_lock);
+ 	inode->i_blocks -= (blocks_per_huge_page(h) * freed);
+ 	spin_unlock(&inode->i_lock);
+ 
+-	hugetlb_put_quota(inode->i_mapping, (chg - freed));
++	hugepage_subpool_put_pages(spool, (chg - freed));
+ 	hugetlb_acct_memory(h, -(chg - freed));
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0014-NFSv4-Reduce-the-footprint-of-the-idmapper.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0014-NFSv4-Reduce-the-footprint-of-the-idmapper.patch
new file mode 100644
index 0000000..008fc3e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0014-NFSv4-Reduce-the-footprint-of-the-idmapper.patch
@@ -0,0 +1,69 @@
+From e45792228b6a4487d859334c757322554c960397 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Tue, 7 Feb 2012 14:59:05 -0500
+Subject: [PATCH 014/109] NFSv4: Reduce the footprint of the idmapper
+
+commit d073e9b541e1ac3f52d72c3a153855d9a9ee3278 upstream.
+
+Instead of pre-allocating the storage for all the strings, we can
+significantly reduce the size of that table by doing the allocation
+when we do the downcall.
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Reviewed-by: Jeff Layton <jlayton@redhat.com>
+[bwh: Backported to 3.2: adjust context in nfs_idmap_delete()]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfs/idmap.c |   16 +++++++++++++---
+ 1 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/fs/nfs/idmap.c b/fs/nfs/idmap.c
+index 47d1c6f..b8c41c3 100644
+--- a/fs/nfs/idmap.c
++++ b/fs/nfs/idmap.c
+@@ -318,7 +318,7 @@ struct idmap_hashent {
+ 	unsigned long		ih_expires;
+ 	__u32			ih_id;
+ 	size_t			ih_namelen;
+-	char			ih_name[IDMAP_NAMESZ];
++	const char		*ih_name;
+ };
+ 
+ struct idmap_hashtable {
+@@ -382,11 +382,16 @@ void
+ nfs_idmap_delete(struct nfs_client *clp)
+ {
+ 	struct idmap *idmap = clp->cl_idmap;
++	int i;
+ 
+ 	if (!idmap)
+ 		return;
+ 	rpc_unlink(idmap->idmap_dentry);
+ 	clp->cl_idmap = NULL;
++	for (i = 0; i < ARRAY_SIZE(idmap->idmap_user_hash.h_entries); i++)
++		kfree(idmap->idmap_user_hash.h_entries[i].ih_name);
++	for (i = 0; i < ARRAY_SIZE(idmap->idmap_group_hash.h_entries); i++)
++		kfree(idmap->idmap_group_hash.h_entries[i].ih_name);
+ 	kfree(idmap);
+ }
+ 
+@@ -449,9 +454,14 @@ static void
+ idmap_update_entry(struct idmap_hashent *he, const char *name,
+ 		size_t namelen, __u32 id)
+ {
++	char *str = kmalloc(namelen + 1, GFP_KERNEL);
++	if (str == NULL)
++		return;
++	kfree(he->ih_name);
+ 	he->ih_id = id;
+-	memcpy(he->ih_name, name, namelen);
+-	he->ih_name[namelen] = '\0';
++	memcpy(str, name, namelen);
++	str[namelen] = '\0';
++	he->ih_name = str;
+ 	he->ih_namelen = namelen;
+ 	he->ih_expires = jiffies + nfs_idmap_cache_timeout;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0015-NFSv4-Further-reduce-the-footprint-of-the-idmapper.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0015-NFSv4-Further-reduce-the-footprint-of-the-idmapper.patch
new file mode 100644
index 0000000..018a5ef
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0015-NFSv4-Further-reduce-the-footprint-of-the-idmapper.patch
@@ -0,0 +1,131 @@
+From c297b1ec9340ec265bceeb8c1b8198ee476f0573 Mon Sep 17 00:00:00 2001
+From: Trond Myklebust <Trond.Myklebust@netapp.com>
+Date: Wed, 8 Feb 2012 13:39:15 -0500
+Subject: [PATCH 015/109] NFSv4: Further reduce the footprint of the idmapper
+
+commit 685f50f9188ac1e8244d0340a9d6ea36b6136cec upstream.
+
+Don't allocate the legacy idmapper tables until we actually need
+them.
+
+Signed-off-by: Trond Myklebust <Trond.Myklebust@netapp.com>
+Reviewed-by: Jeff Layton <jlayton@redhat.com>
+[bwh: Backported to 3.2: adjust context in nfs_idmap_delete()]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfs/idmap.c |   42 ++++++++++++++++++++++++++++++++++++------
+ 1 files changed, 36 insertions(+), 6 deletions(-)
+
+diff --git a/fs/nfs/idmap.c b/fs/nfs/idmap.c
+index b8c41c3..b122af8 100644
+--- a/fs/nfs/idmap.c
++++ b/fs/nfs/idmap.c
+@@ -323,7 +323,7 @@ struct idmap_hashent {
+ 
+ struct idmap_hashtable {
+ 	__u8			h_type;
+-	struct idmap_hashent	h_entries[IDMAP_HASH_SZ];
++	struct idmap_hashent	*h_entries;
+ };
+ 
+ struct idmap {
+@@ -378,20 +378,39 @@ nfs_idmap_new(struct nfs_client *clp)
+ 	return 0;
+ }
+ 
++static void
++idmap_alloc_hashtable(struct idmap_hashtable *h)
++{
++	if (h->h_entries != NULL)
++		return;
++	h->h_entries = kcalloc(IDMAP_HASH_SZ,
++			sizeof(*h->h_entries),
++			GFP_KERNEL);
++}
++
++static void
++idmap_free_hashtable(struct idmap_hashtable *h)
++{
++	int i;
++
++	if (h->h_entries == NULL)
++		return;
++	for (i = 0; i < IDMAP_HASH_SZ; i++)
++		kfree(h->h_entries[i].ih_name);
++	kfree(h->h_entries);
++}
++
+ void
+ nfs_idmap_delete(struct nfs_client *clp)
+ {
+ 	struct idmap *idmap = clp->cl_idmap;
+-	int i;
+ 
+ 	if (!idmap)
+ 		return;
+ 	rpc_unlink(idmap->idmap_dentry);
+ 	clp->cl_idmap = NULL;
+-	for (i = 0; i < ARRAY_SIZE(idmap->idmap_user_hash.h_entries); i++)
+-		kfree(idmap->idmap_user_hash.h_entries[i].ih_name);
+-	for (i = 0; i < ARRAY_SIZE(idmap->idmap_group_hash.h_entries); i++)
+-		kfree(idmap->idmap_group_hash.h_entries[i].ih_name);
++	idmap_free_hashtable(&idmap->idmap_user_hash);
++	idmap_free_hashtable(&idmap->idmap_group_hash);
+ 	kfree(idmap);
+ }
+ 
+@@ -401,6 +420,8 @@ nfs_idmap_delete(struct nfs_client *clp)
+ static inline struct idmap_hashent *
+ idmap_name_hash(struct idmap_hashtable* h, const char *name, size_t len)
+ {
++	if (h->h_entries == NULL)
++		return NULL;
+ 	return &h->h_entries[fnvhash32(name, len) % IDMAP_HASH_SZ];
+ }
+ 
+@@ -409,6 +430,8 @@ idmap_lookup_name(struct idmap_hashtable *h, const char *name, size_t len)
+ {
+ 	struct idmap_hashent *he = idmap_name_hash(h, name, len);
+ 
++	if (he == NULL)
++		return NULL;
+ 	if (he->ih_namelen != len || memcmp(he->ih_name, name, len) != 0)
+ 		return NULL;
+ 	if (time_after(jiffies, he->ih_expires))
+@@ -419,6 +442,8 @@ idmap_lookup_name(struct idmap_hashtable *h, const char *name, size_t len)
+ static inline struct idmap_hashent *
+ idmap_id_hash(struct idmap_hashtable* h, __u32 id)
+ {
++	if (h->h_entries == NULL)
++		return NULL;
+ 	return &h->h_entries[fnvhash32(&id, sizeof(id)) % IDMAP_HASH_SZ];
+ }
+ 
+@@ -426,6 +451,9 @@ static struct idmap_hashent *
+ idmap_lookup_id(struct idmap_hashtable *h, __u32 id)
+ {
+ 	struct idmap_hashent *he = idmap_id_hash(h, id);
++
++	if (he == NULL)
++		return NULL;
+ 	if (he->ih_id != id || he->ih_namelen == 0)
+ 		return NULL;
+ 	if (time_after(jiffies, he->ih_expires))
+@@ -441,12 +469,14 @@ idmap_lookup_id(struct idmap_hashtable *h, __u32 id)
+ static inline struct idmap_hashent *
+ idmap_alloc_name(struct idmap_hashtable *h, char *name, size_t len)
+ {
++	idmap_alloc_hashtable(h);
+ 	return idmap_name_hash(h, name, len);
+ }
+ 
+ static inline struct idmap_hashent *
+ idmap_alloc_id(struct idmap_hashtable *h, __u32 id)
+ {
++	idmap_alloc_hashtable(h);
+ 	return idmap_id_hash(h, id);
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0016-macvtap-zerocopy-fix-offset-calculation-when-buildin.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0016-macvtap-zerocopy-fix-offset-calculation-when-buildin.patch
new file mode 100644
index 0000000..d19f672
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0016-macvtap-zerocopy-fix-offset-calculation-when-buildin.patch
@@ -0,0 +1,67 @@
+From 6c4e2ff1b19d58c2a2f016d25b96eee0f733d7aa Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 2 May 2012 11:41:30 +0800
+Subject: [PATCH 016/109] macvtap: zerocopy: fix offset calculation when
+ building skb
+
+commit 3afc9621f15701c557e60f61eba9242bac2771dd upstream.
+
+This patch fixes the offset calculation when building skb:
+
+- offset1 were used as skb data offset not vector offset
+- reset offset to zero only when we advance to next vector
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/macvtap.c |   13 +++++++------
+ 1 files changed, 7 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
+index 1b7082d..4505008 100644
+--- a/drivers/net/macvtap.c
++++ b/drivers/net/macvtap.c
+@@ -504,10 +504,11 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 		if (copy > size) {
+ 			++from;
+ 			--count;
+-		}
++			offset = 0;
++		} else
++			offset += size;
+ 		copy -= size;
+ 		offset1 += size;
+-		offset = 0;
+ 	}
+ 
+ 	if (len == offset1)
+@@ -518,13 +519,13 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 		int num_pages;
+ 		unsigned long base;
+ 
+-		len = from->iov_len - offset1;
++		len = from->iov_len - offset;
+ 		if (!len) {
+-			offset1 = 0;
++			offset = 0;
+ 			++from;
+ 			continue;
+ 		}
+-		base = (unsigned long)from->iov_base + offset1;
++		base = (unsigned long)from->iov_base + offset;
+ 		size = ((base & ~PAGE_MASK) + len + ~PAGE_MASK) >> PAGE_SHIFT;
+ 		num_pages = get_user_pages_fast(base, size, 0, &page[i]);
+ 		if ((num_pages != size) ||
+@@ -545,7 +546,7 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 			len -= size;
+ 			i++;
+ 		}
+-		offset1 = 0;
++		offset = 0;
+ 		++from;
+ 	}
+ 	return 0;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0017-macvtap-zerocopy-fix-truesize-underestimation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0017-macvtap-zerocopy-fix-truesize-underestimation.patch
new file mode 100644
index 0000000..b00f0b9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0017-macvtap-zerocopy-fix-truesize-underestimation.patch
@@ -0,0 +1,46 @@
+From e2261c8945dd5af5a0627ac72f7a39f676f3b657 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 2 May 2012 11:41:44 +0800
+Subject: [PATCH 017/109] macvtap: zerocopy: fix truesize underestimation
+
+commit 4ef67ebedffa44ed9939b34708ac2fee06d2f65f upstream.
+
+As the skb fragment were pinned/built from user pages, we should
+account the page instead of length for truesize.
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/macvtap.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
+index 4505008..c7a84eb 100644
+--- a/drivers/net/macvtap.c
++++ b/drivers/net/macvtap.c
+@@ -518,6 +518,7 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 		struct page *page[MAX_SKB_FRAGS];
+ 		int num_pages;
+ 		unsigned long base;
++		unsigned long truesize;
+ 
+ 		len = from->iov_len - offset;
+ 		if (!len) {
+@@ -532,10 +533,11 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 		    (num_pages > MAX_SKB_FRAGS - skb_shinfo(skb)->nr_frags))
+ 			/* put_page is in skb free */
+ 			return -EFAULT;
++		truesize = size * PAGE_SIZE;
+ 		skb->data_len += len;
+ 		skb->len += len;
+-		skb->truesize += len;
+-		atomic_add(len, &skb->sk->sk_wmem_alloc);
++		skb->truesize += truesize;
++		atomic_add(truesize, &skb->sk->sk_wmem_alloc);
+ 		while (len) {
+ 			int off = base & ~PAGE_MASK;
+ 			int size = min_t(int, len, PAGE_SIZE - off);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0018-macvtap-zerocopy-put-page-when-fail-to-get-all-reque.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0018-macvtap-zerocopy-put-page-when-fail-to-get-all-reque.patch
new file mode 100644
index 0000000..55fc073
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0018-macvtap-zerocopy-put-page-when-fail-to-get-all-reque.patch
@@ -0,0 +1,40 @@
+From 13d71d7ee644607d525480330c8b6a4268c18c0e Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 2 May 2012 11:41:58 +0800
+Subject: [PATCH 018/109] macvtap: zerocopy: put page when fail to get all
+ requested user pages
+
+commit 02ce04bb3d28c3333231f43bca677228dbc686fe upstream.
+
+When get_user_pages_fast() fails to get all requested pages, we could not use
+kfree_skb() to free it as it has not been put in the skb fragments. So we need
+to call put_page() instead.
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/macvtap.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
+index c7a84eb..f217247 100644
+--- a/drivers/net/macvtap.c
++++ b/drivers/net/macvtap.c
+@@ -530,9 +530,11 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 		size = ((base & ~PAGE_MASK) + len + ~PAGE_MASK) >> PAGE_SHIFT;
+ 		num_pages = get_user_pages_fast(base, size, 0, &page[i]);
+ 		if ((num_pages != size) ||
+-		    (num_pages > MAX_SKB_FRAGS - skb_shinfo(skb)->nr_frags))
+-			/* put_page is in skb free */
++		    (num_pages > MAX_SKB_FRAGS - skb_shinfo(skb)->nr_frags)) {
++			for (i = 0; i < num_pages; i++)
++				put_page(page[i]);
+ 			return -EFAULT;
++		}
+ 		truesize = size * PAGE_SIZE;
+ 		skb->data_len += len;
+ 		skb->len += len;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0019-macvtap-zerocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0019-macvtap-zerocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch
new file mode 100644
index 0000000..737ed5c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0019-macvtap-zerocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch
@@ -0,0 +1,53 @@
+From c57df8c118c4c11ef6023034aa454636dd8780db Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 2 May 2012 11:42:06 +0800
+Subject: [PATCH 019/109] macvtap: zerocopy: set SKBTX_DEV_ZEROCOPY only when
+ skb is built successfully
+
+commit 01d6657b388438def19c8baaea28e742b6ed32ec upstream.
+
+Current the SKBTX_DEV_ZEROCOPY is set unconditionally after
+zerocopy_sg_from_iovec(), this would lead NULL pointer when macvtap
+fails to build zerocopy skb because destructor_arg was not
+initialized. Solve this by set this flag after the skb were built
+successfully.
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/macvtap.c |    9 +++++----
+ 1 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
+index f217247..7fecd66 100644
+--- a/drivers/net/macvtap.c
++++ b/drivers/net/macvtap.c
+@@ -698,10 +698,9 @@ static ssize_t macvtap_get_user(struct macvtap_queue *q, struct msghdr *m,
+ 	if (!skb)
+ 		goto err;
+ 
+-	if (zerocopy) {
++	if (zerocopy)
+ 		err = zerocopy_sg_from_iovec(skb, iv, vnet_hdr_len, count);
+-		skb_shinfo(skb)->tx_flags |= SKBTX_DEV_ZEROCOPY;
+-	} else
++	else
+ 		err = skb_copy_datagram_from_iovec(skb, 0, iv, vnet_hdr_len,
+ 						   len);
+ 	if (err)
+@@ -720,8 +719,10 @@ static ssize_t macvtap_get_user(struct macvtap_queue *q, struct msghdr *m,
+ 	rcu_read_lock_bh();
+ 	vlan = rcu_dereference_bh(q->vlan);
+ 	/* copy skb_ubuf_info for callback when skb has no error */
+-	if (zerocopy)
++	if (zerocopy) {
+ 		skb_shinfo(skb)->destructor_arg = m->msg_control;
++		skb_shinfo(skb)->tx_flags |= SKBTX_DEV_ZEROCOPY;
++	}
+ 	if (vlan)
+ 		macvlan_start_xmit(skb, vlan->dev);
+ 	else
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0020-macvtap-zerocopy-validate-vectors-before-building-sk.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0020-macvtap-zerocopy-validate-vectors-before-building-sk.patch
new file mode 100644
index 0000000..a46ddcb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0020-macvtap-zerocopy-validate-vectors-before-building-sk.patch
@@ -0,0 +1,84 @@
+From c93ad33631e3efbb6f02f24c6b6817227b2c9252 Mon Sep 17 00:00:00 2001
+From: Jason Wang <jasowang@redhat.com>
+Date: Wed, 2 May 2012 11:42:15 +0800
+Subject: [PATCH 020/109] macvtap: zerocopy: validate vectors before building
+ skb
+
+commit b92946e2919134ebe2a4083e4302236295ea2a73 upstream.
+
+There're several reasons that the vectors need to be validated:
+
+- Return error when caller provides vectors whose num is greater than UIO_MAXIOV.
+- Linearize part of skb when userspace provides vectors grater than MAX_SKB_FRAGS.
+- Return error when userspace provides vectors whose total length may exceed
+- MAX_SKB_FRAGS * PAGE_SIZE.
+
+Signed-off-by: Jason Wang <jasowang@redhat.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/macvtap.c |   25 +++++++++++++++++++++----
+ 1 files changed, 21 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/macvtap.c b/drivers/net/macvtap.c
+index 7fecd66..26106c0 100644
+--- a/drivers/net/macvtap.c
++++ b/drivers/net/macvtap.c
+@@ -528,9 +528,10 @@ static int zerocopy_sg_from_iovec(struct sk_buff *skb, const struct iovec *from,
+ 		}
+ 		base = (unsigned long)from->iov_base + offset;
+ 		size = ((base & ~PAGE_MASK) + len + ~PAGE_MASK) >> PAGE_SHIFT;
++		if (i + size > MAX_SKB_FRAGS)
++			return -EMSGSIZE;
+ 		num_pages = get_user_pages_fast(base, size, 0, &page[i]);
+-		if ((num_pages != size) ||
+-		    (num_pages > MAX_SKB_FRAGS - skb_shinfo(skb)->nr_frags)) {
++		if (num_pages != size) {
+ 			for (i = 0; i < num_pages; i++)
+ 				put_page(page[i]);
+ 			return -EFAULT;
+@@ -650,7 +651,7 @@ static ssize_t macvtap_get_user(struct macvtap_queue *q, struct msghdr *m,
+ 	int err;
+ 	struct virtio_net_hdr vnet_hdr = { 0 };
+ 	int vnet_hdr_len = 0;
+-	int copylen;
++	int copylen = 0;
+ 	bool zerocopy = false;
+ 
+ 	if (q->flags & IFF_VNET_HDR) {
+@@ -679,15 +680,31 @@ static ssize_t macvtap_get_user(struct macvtap_queue *q, struct msghdr *m,
+ 	if (unlikely(len < ETH_HLEN))
+ 		goto err;
+ 
++	err = -EMSGSIZE;
++	if (unlikely(count > UIO_MAXIOV))
++		goto err;
++
+ 	if (m && m->msg_control && sock_flag(&q->sk, SOCK_ZEROCOPY))
+ 		zerocopy = true;
+ 
+ 	if (zerocopy) {
++		/* Userspace may produce vectors with count greater than
++		 * MAX_SKB_FRAGS, so we need to linearize parts of the skb
++		 * to let the rest of data to be fit in the frags.
++		 */
++		if (count > MAX_SKB_FRAGS) {
++			copylen = iov_length(iv, count - MAX_SKB_FRAGS);
++			if (copylen < vnet_hdr_len)
++				copylen = 0;
++			else
++				copylen -= vnet_hdr_len;
++		}
+ 		/* There are 256 bytes to be copied in skb, so there is enough
+ 		 * room for skb expand head in case it is used.
+ 		 * The rest buffer is mapped from userspace.
+ 		 */
+-		copylen = vnet_hdr.hdr_len;
++		if (copylen < vnet_hdr.hdr_len)
++			copylen = vnet_hdr.hdr_len;
+ 		if (!copylen)
+ 			copylen = GOODCOPY_LEN;
+ 	} else
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0021-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0021-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch
new file mode 100644
index 0000000..45dfb2d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0021-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch
@@ -0,0 +1,35 @@
+From 274c1b4b54a12df73eb5fc2763a294ff2a04669c Mon Sep 17 00:00:00 2001
+From: Avi Kivity <avi@redhat.com>
+Date: Sun, 22 Apr 2012 17:02:11 +0300
+Subject: [PATCH 021/109] KVM: Fix buffer overflow in kvm_set_irq()
+
+commit f2ebd422f71cda9c791f76f85d2ca102ae34a1ed upstream.
+
+kvm_set_irq() has an internal buffer of three irq routing entries, allowing
+connecting a GSI to three IRQ chips or on MSI.  However setup_routing_entry()
+does not properly enforce this, allowing three irqchip routes followed by
+an MSI route to overflow the buffer.
+
+Fix by ensuring that an MSI entry is added to an empty list.
+
+Signed-off-by: Avi Kivity <avi@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ virt/kvm/irq_comm.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/virt/kvm/irq_comm.c b/virt/kvm/irq_comm.c
+index 9f614b4..272407c 100644
+--- a/virt/kvm/irq_comm.c
++++ b/virt/kvm/irq_comm.c
+@@ -318,6 +318,7 @@ static int setup_routing_entry(struct kvm_irq_routing_table *rt,
+ 	 */
+ 	hlist_for_each_entry(ei, n, &rt->map[ue->gsi], link)
+ 		if (ei->type == KVM_IRQ_ROUTING_MSI ||
++		    ue->type == KVM_IRQ_ROUTING_MSI ||
+ 		    ue->u.irqchip.irqchip == ei->irqchip.irqchip)
+ 			return r;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0022-scsi-Silence-unnecessary-warnings-about-ioctl-to-par.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0022-scsi-Silence-unnecessary-warnings-about-ioctl-to-par.patch
new file mode 100644
index 0000000..86b471c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0022-scsi-Silence-unnecessary-warnings-about-ioctl-to-par.patch
@@ -0,0 +1,54 @@
+From d0ef0e99137f622218e0395ccc12210e4804b5ed Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Fri, 15 Jun 2012 12:52:46 +0200
+Subject: [PATCH 022/109] scsi: Silence unnecessary warnings about ioctl to
+ partition
+
+commit 6d9359280753d2955f86d6411047516a9431eb51 upstream.
+
+Sometimes, warnings about ioctls to partition happen often enough that they
+form majority of the warnings in the kernel log and users complain. In some
+cases warnings are about ioctls such as SG_IO so it's not good to get rid of
+the warnings completely as they can ease debugging of userspace problems
+when ioctl is refused.
+
+Since I have seen warnings from lots of commands, including some proprietary
+userspace applications, I don't think disallowing the ioctls for processes
+with CAP_SYS_RAWIO will happen in the near future if ever. So lets just
+stop warning for processes with CAP_SYS_RAWIO for which ioctl is allowed.
+
+CC: Paolo Bonzini <pbonzini@redhat.com>
+CC: James Bottomley <JBottomley@parallels.com>
+CC: linux-scsi@vger.kernel.org
+Acked-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+[bwh: Backported to 3.2: use ENOTTY, not ENOIOCTLCMD]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ block/scsi_ioctl.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/block/scsi_ioctl.c b/block/scsi_ioctl.c
+index 688be8a..9e76a32 100644
+--- a/block/scsi_ioctl.c
++++ b/block/scsi_ioctl.c
+@@ -721,11 +721,14 @@ int scsi_verify_blk_ioctl(struct block_device *bd, unsigned int cmd)
+ 		break;
+ 	}
+ 
++	if (capable(CAP_SYS_RAWIO))
++		return 0;
++
+ 	/* In particular, rule out all resets and host-specific ioctls.  */
+ 	printk_ratelimited(KERN_WARNING
+ 			   "%s: sending ioctl %x to a partition!\n", current->comm, cmd);
+ 
+-	return capable(CAP_SYS_RAWIO) ? 0 : -ENOTTY;
++	return -ENOTTY;
+ }
+ EXPORT_SYMBOL(scsi_verify_blk_ioctl);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0023-epoll-clear-the-tfile_check_list-on-ELOOP.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0023-epoll-clear-the-tfile_check_list-on-ELOOP.patch
new file mode 100644
index 0000000..8dbe37d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0023-epoll-clear-the-tfile_check_list-on-ELOOP.patch
@@ -0,0 +1,43 @@
+From 4255dce0ae728fe63f19ded56b5dc2c324d6f18d Mon Sep 17 00:00:00 2001
+From: Jason Baron <jbaron@redhat.com>
+Date: Wed, 25 Apr 2012 16:01:47 -0700
+Subject: [PATCH 023/109] epoll: clear the tfile_check_list on -ELOOP
+
+commit 13d518074a952d33d47c428419693f63389547e9 upstream.
+
+An epoll_ctl(,EPOLL_CTL_ADD,,) operation can return '-ELOOP' to prevent
+circular epoll dependencies from being created.  However, in that case we
+do not properly clear the 'tfile_check_list'.  Thus, add a call to
+clear_tfile_check_list() for the -ELOOP case.
+
+Signed-off-by: Jason Baron <jbaron@redhat.com>
+Reported-by: Yurij M. Plotnikov <Yurij.Plotnikov@oktetlabs.ru>
+Cc: Nelson Elhage <nelhage@nelhage.com>
+Cc: Davide Libenzi <davidel@xmailserver.org>
+Tested-by: Alexandra N. Kossovsky <Alexandra.Kossovsky@oktetlabs.ru>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/eventpoll.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/fs/eventpoll.c b/fs/eventpoll.c
+index 4d9d3a4..a6f3763 100644
+--- a/fs/eventpoll.c
++++ b/fs/eventpoll.c
+@@ -1629,8 +1629,10 @@ SYSCALL_DEFINE4(epoll_ctl, int, epfd, int, op, int, fd,
+ 	if (op == EPOLL_CTL_ADD) {
+ 		if (is_file_epoll(tfile)) {
+ 			error = -ELOOP;
+-			if (ep_loop_check(ep, tfile) != 0)
++			if (ep_loop_check(ep, tfile) != 0) {
++				clear_tfile_check_list();
+ 				goto error_tgt_fput;
++			}
+ 		} else
+ 			list_add(&tfile->f_tfile_llink, &tfile_check_list);
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0024-iommu-amd-Fix-missing-iommu_shutdown-initialization-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0024-iommu-amd-Fix-missing-iommu_shutdown-initialization-.patch
new file mode 100644
index 0000000..4c75e8e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0024-iommu-amd-Fix-missing-iommu_shutdown-initialization-.patch
@@ -0,0 +1,45 @@
+From be1ab01a00ec19b273050ad8f3fbb9472238b026 Mon Sep 17 00:00:00 2001
+From: Shuah Khan <shuah.khan@hp.com>
+Date: Wed, 6 Jun 2012 10:50:06 -0600
+Subject: [PATCH 024/109] iommu/amd: Fix missing iommu_shutdown initialization
+ in passthrough mode
+
+commit f2f12b6fc032c7b1419fd6db84e2868b5f05a878 upstream.
+
+The iommu_shutdown callback is not initialized when the AMD
+IOMMU driver runs in passthrough mode. Fix that by moving
+the callback initialization before the check for
+passthrough mode.
+
+Signed-off-by: Shuah Khan <shuah.khan@hp.com>
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/iommu/amd_iommu_init.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/iommu/amd_iommu_init.c b/drivers/iommu/amd_iommu_init.c
+index 6269eb0..ef2d493 100644
+--- a/drivers/iommu/amd_iommu_init.c
++++ b/drivers/iommu/amd_iommu_init.c
+@@ -1468,6 +1468,8 @@ static int __init amd_iommu_init(void)
+ 
+ 	register_syscore_ops(&amd_iommu_syscore_ops);
+ 
++	x86_platform.iommu_shutdown = disable_iommus;
++
+ 	if (iommu_pass_through)
+ 		goto out;
+ 
+@@ -1476,7 +1478,6 @@ static int __init amd_iommu_init(void)
+ 	else
+ 		printk(KERN_INFO "AMD-Vi: Lazy IO/TLB flushing enabled\n");
+ 
+-	x86_platform.iommu_shutdown = disable_iommus;
+ out:
+ 	return ret;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0025-iommu-amd-Initialize-dma_ops-for-hotplug-and-sriov-d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0025-iommu-amd-Initialize-dma_ops-for-hotplug-and-sriov-d.patch
new file mode 100644
index 0000000..053d5e7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0025-iommu-amd-Initialize-dma_ops-for-hotplug-and-sriov-d.patch
@@ -0,0 +1,53 @@
+From 60eec119060fbd35f569fd77fd448dbcd8d8f011 Mon Sep 17 00:00:00 2001
+From: Joerg Roedel <joerg.roedel@amd.com>
+Date: Thu, 21 Jun 2012 14:52:40 +0200
+Subject: [PATCH 025/109] iommu/amd: Initialize dma_ops for hotplug and sriov
+ devices
+
+commit ac1534a55d1e87d59a21c09c570605933b551480 upstream.
+
+When a device is added to the system at runtime the AMD
+IOMMU driver initializes the necessary data structures to
+handle translation for it. But it forgets to change the
+per-device dma_ops to point to the AMD IOMMU driver. So
+mapping actually never happens and all DMA accesses end in
+an IO_PAGE_FAULT. Fix this.
+
+Reported-by: Stefan Assmann <sassmann@redhat.com>
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+[bwh: Backported to 3.2:
+ - Adjust context
+ - Use global iommu_pass_through; there is no per-device pass_through]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/iommu/amd_iommu.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
+index f1d5408..a1b8caa 100644
+--- a/drivers/iommu/amd_iommu.c
++++ b/drivers/iommu/amd_iommu.c
+@@ -59,6 +59,8 @@ static struct protection_domain *pt_domain;
+ 
+ static struct iommu_ops amd_iommu_ops;
+ 
++static struct dma_map_ops amd_iommu_dma_ops;
++
+ /*
+  * general struct to manage commands send to an IOMMU
+  */
+@@ -1878,6 +1880,11 @@ static int device_change_notifier(struct notifier_block *nb,
+ 		list_add_tail(&dma_domain->list, &iommu_pd_list);
+ 		spin_unlock_irqrestore(&iommu_pd_list_lock, flags);
+ 
++		if (!iommu_pass_through)
++			dev->archdata.dma_ops = &amd_iommu_dma_ops;
++		else
++			dev->archdata.dma_ops = &nommu_dma_ops;
++
+ 		break;
+ 	case BUS_NOTIFY_DEL_DEVICE:
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0026-usb-Add-support-for-root-hub-port-status-CAS.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0026-usb-Add-support-for-root-hub-port-status-CAS.patch
new file mode 100644
index 0000000..827fcec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0026-usb-Add-support-for-root-hub-port-status-CAS.patch
@@ -0,0 +1,170 @@
+From 6455e1a5be4eb27a1587322e0ed3a7ff6c3d8e4f Mon Sep 17 00:00:00 2001
+From: Stanislaw Ledwon <staszek.ledwon@linux.jf.intel.com>
+Date: Mon, 18 Jun 2012 15:20:00 +0200
+Subject: [PATCH 026/109] usb: Add support for root hub port status CAS
+
+commit 8bea2bd37df08aaa599aa361a9f8b836ba98e554 upstream.
+
+The host controller port status register supports CAS (Cold Attach
+Status) bit. This bit could be set when USB3.0 device is connected
+when system is in Sx state. When the system wakes to S0 this port
+status with CAS bit is reported and this port can't be used by any
+device.
+
+When CAS bit is set the port should be reset by warm reset. This
+was not supported by xhci driver.
+
+The issue was found when pendrive was connected to suspended
+platform. The link state of "Compliance Mode" was reported together
+with CAS bit. This link state was also not supported by xhci and
+core/hub.c.
+
+The CAS bit is defined only for xhci root hub port and it is
+not supported on regular hubs. The link status is used to force
+warm reset on port. Make the USB core issue a warm reset when port
+is in ether the 'inactive' or 'compliance mode'. Change the xHCI driver
+to report 'compliance mode' when the CAS is set. This force warm reset
+on the root hub port.
+
+This patch should be backported to stable kernels as old as 3.2, that
+contain the commit 10d674a82e553cb8a1f41027bb3c3e309b3f6804 "USB: When
+hot reset for USB3 fails, try warm reset."
+
+Signed-off-by: Stanislaw Ledwon <staszek.ledwon@linux.intel.com>
+Signed-off-by: Sarah Sharp <sarah.a.sharp@linux.intel.com>
+Acked-by: Andiry Xu <andiry.xu@amd.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/core/hub.c      |   18 +++++++++-------
+ drivers/usb/host/xhci-hub.c |   44 +++++++++++++++++++++++++++++++++++++-----
+ drivers/usb/host/xhci.h     |    6 ++++-
+ 3 files changed, 53 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
+index 50cf41a..2bc736f 100644
+--- a/drivers/usb/core/hub.c
++++ b/drivers/usb/core/hub.c
+@@ -2039,12 +2039,16 @@ static unsigned hub_is_wusb(struct usb_hub *hub)
+ static int hub_port_reset(struct usb_hub *hub, int port1,
+ 			struct usb_device *udev, unsigned int delay, bool warm);
+ 
+-/* Is a USB 3.0 port in the Inactive state? */
+-static bool hub_port_inactive(struct usb_hub *hub, u16 portstatus)
++/* Is a USB 3.0 port in the Inactive or Complinance Mode state?
++ * Port worm reset is required to recover
++ */
++static bool hub_port_warm_reset_required(struct usb_hub *hub, u16 portstatus)
+ {
+ 	return hub_is_superspeed(hub->hdev) &&
+-		(portstatus & USB_PORT_STAT_LINK_STATE) ==
+-		USB_SS_PORT_LS_SS_INACTIVE;
++		(((portstatus & USB_PORT_STAT_LINK_STATE) ==
++		  USB_SS_PORT_LS_SS_INACTIVE) ||
++		 ((portstatus & USB_PORT_STAT_LINK_STATE) ==
++		  USB_SS_PORT_LS_COMP_MOD)) ;
+ }
+ 
+ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
+@@ -2080,7 +2084,7 @@ static int hub_port_wait_reset(struct usb_hub *hub, int port1,
+ 			 *
+ 			 * See https://bugzilla.kernel.org/show_bug.cgi?id=41752
+ 			 */
+-			if (hub_port_inactive(hub, portstatus)) {
++			if (hub_port_warm_reset_required(hub, portstatus)) {
+ 				int ret;
+ 
+ 				if ((portchange & USB_PORT_STAT_C_CONNECTION))
+@@ -3646,9 +3650,7 @@ static void hub_events(void)
+ 			/* Warm reset a USB3 protocol port if it's in
+ 			 * SS.Inactive state.
+ 			 */
+-			if (hub_is_superspeed(hub->hdev) &&
+-				(portstatus & USB_PORT_STAT_LINK_STATE)
+-					== USB_SS_PORT_LS_SS_INACTIVE) {
++			if (hub_port_warm_reset_required(hub, portstatus)) {
+ 				dev_dbg(hub_dev, "warm reset port %d\n", i);
+ 				hub_port_reset(hub, i, NULL,
+ 						HUB_BH_RESET_TIME, true);
+diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
+index a8b2980..fd8a2c2 100644
+--- a/drivers/usb/host/xhci-hub.c
++++ b/drivers/usb/host/xhci-hub.c
+@@ -438,6 +438,42 @@ void xhci_test_and_clear_bit(struct xhci_hcd *xhci, __le32 __iomem **port_array,
+ 	}
+ }
+ 
++/* Updates Link Status for super Speed port */
++static void xhci_hub_report_link_state(u32 *status, u32 status_reg)
++{
++	u32 pls = status_reg & PORT_PLS_MASK;
++
++	/* resume state is a xHCI internal state.
++	 * Do not report it to usb core.
++	 */
++	if (pls == XDEV_RESUME)
++		return;
++
++	/* When the CAS bit is set then warm reset
++	 * should be performed on port
++	 */
++	if (status_reg & PORT_CAS) {
++		/* The CAS bit can be set while the port is
++		 * in any link state.
++		 * Only roothubs have CAS bit, so we
++		 * pretend to be in compliance mode
++		 * unless we're already in compliance
++		 * or the inactive state.
++		 */
++		if (pls != USB_SS_PORT_LS_COMP_MOD &&
++		    pls != USB_SS_PORT_LS_SS_INACTIVE) {
++			pls = USB_SS_PORT_LS_COMP_MOD;
++		}
++		/* Return also connection bit -
++		 * hub state machine resets port
++		 * when this bit is set.
++		 */
++		pls |= USB_PORT_STAT_CONNECTION;
++	}
++	/* update status field */
++	*status |= pls;
++}
++
+ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
+ 		u16 wIndex, char *buf, u16 wLength)
+ {
+@@ -579,13 +615,9 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
+ 			else
+ 				status |= USB_PORT_STAT_POWER;
+ 		}
+-		/* Port Link State */
++		/* Update Port Link State for super speed ports*/
+ 		if (hcd->speed == HCD_USB3) {
+-			/* resume state is a xHCI internal state.
+-			 * Do not report it to usb core.
+-			 */
+-			if ((temp & PORT_PLS_MASK) != XDEV_RESUME)
+-				status |= (temp & PORT_PLS_MASK);
++			xhci_hub_report_link_state(&status, temp);
+ 		}
+ 		if (bus_state->port_c_suspend & (1 << wIndex))
+ 			status |= 1 << USB_PORT_FEAT_C_SUSPEND;
+diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
+index 363b141..7a56805 100644
+--- a/drivers/usb/host/xhci.h
++++ b/drivers/usb/host/xhci.h
+@@ -341,7 +341,11 @@ struct xhci_op_regs {
+ #define PORT_PLC	(1 << 22)
+ /* port configure error change - port failed to configure its link partner */
+ #define PORT_CEC	(1 << 23)
+-/* bit 24 reserved */
++/* Cold Attach Status - xHC can set this bit to report device attached during
++ * Sx state. Warm port reset should be perfomed to clear this bit and move port
++ * to connected state.
++ */
++#define PORT_CAS	(1 << 24)
+ /* wake on connect (enable) */
+ #define PORT_WKCONN_E	(1 << 25)
+ /* wake on disconnect (enable) */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0027-gpiolib-wm8994-Pay-attention-to-the-value-set-when-e.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0027-gpiolib-wm8994-Pay-attention-to-the-value-set-when-e.patch
new file mode 100644
index 0000000..706d989
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0027-gpiolib-wm8994-Pay-attention-to-the-value-set-when-e.patch
@@ -0,0 +1,40 @@
+From 5cdc2897a0bb7b11585d5b14eb3f2faa1505348c Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Sat, 9 Jun 2012 11:07:56 +0800
+Subject: [PATCH 027/109] gpiolib: wm8994: Pay attention to the value set when
+ enabling as output
+
+commit 8cd578b6e28693f357867a77598a88ef3deb6b39 upstream.
+
+Not paying attention to the value being set is a bad thing because it
+means that we'll not set the hardware up to reflect what was requested.
+Not setting the hardware up to reflect what was requested means that the
+caller won't get the results they wanted.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpio/gpio-wm8994.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/gpio/gpio-wm8994.c b/drivers/gpio/gpio-wm8994.c
+index 96198f3..a2da8f2 100644
+--- a/drivers/gpio/gpio-wm8994.c
++++ b/drivers/gpio/gpio-wm8994.c
+@@ -89,8 +89,11 @@ static int wm8994_gpio_direction_out(struct gpio_chip *chip,
+ 	struct wm8994_gpio *wm8994_gpio = to_wm8994_gpio(chip);
+ 	struct wm8994 *wm8994 = wm8994_gpio->wm8994;
+ 
++	if (value)
++		value = WM8994_GPN_LVL;
++
+ 	return wm8994_set_bits(wm8994, WM8994_GPIO_1 + offset,
+-			       WM8994_GPN_DIR, 0);
++			       WM8994_GPN_DIR | WM8994_GPN_LVL, value);
+ }
+ 
+ static void wm8994_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0028-sched-nohz-Rewrite-and-fix-load-avg-computation-agai.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0028-sched-nohz-Rewrite-and-fix-load-avg-computation-agai.patch
new file mode 100644
index 0000000..5659ce7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0028-sched-nohz-Rewrite-and-fix-load-avg-computation-agai.patch
@@ -0,0 +1,462 @@
+From a7d3f237430003ca8d32d1703770f04d32a02b27 Mon Sep 17 00:00:00 2001
+From: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Date: Fri, 22 Jun 2012 15:52:09 +0200
+Subject: [PATCH 028/109] sched/nohz: Rewrite and fix load-avg computation --
+ again
+
+commit 5167e8d5417bf5c322a703d2927daec727ea40dd upstream.
+
+Thanks to Charles Wang for spotting the defects in the current code:
+
+ - If we go idle during the sample window -- after sampling, we get a
+   negative bias because we can negate our own sample.
+
+ - If we wake up during the sample window we get a positive bias
+   because we push the sample to a known active period.
+
+So rewrite the entire nohz load-avg muck once again, now adding
+copious documentation to the code.
+
+Reported-and-tested-by: Doug Smythies <dsmythies@telus.net>
+Reported-and-tested-by: Charles Wang <muming.wq@gmail.com>
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: Linus Torvalds <torvalds@linux-foundation.org>
+Cc: Andrew Morton <akpm@linux-foundation.org>
+Link: http://lkml.kernel.org/r/1340373782.18025.74.camel@twins
+[ minor edits ]
+Signed-off-by: Ingo Molnar <mingo@kernel.org>
+[bwh: Backported to 3.2: adjust filenames, context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/sched.h    |    8 ++
+ kernel/sched.c           |  276 ++++++++++++++++++++++++++++++++++------------
+ kernel/sched_idletask.c  |    1 -
+ kernel/time/tick-sched.c |    2 +
+ 4 files changed, 213 insertions(+), 74 deletions(-)
+
+diff --git a/include/linux/sched.h b/include/linux/sched.h
+index 1c4f3e9..5afa2a3 100644
+--- a/include/linux/sched.h
++++ b/include/linux/sched.h
+@@ -1892,6 +1892,14 @@ static inline int set_cpus_allowed_ptr(struct task_struct *p,
+ }
+ #endif
+ 
++#ifdef CONFIG_NO_HZ
++void calc_load_enter_idle(void);
++void calc_load_exit_idle(void);
++#else
++static inline void calc_load_enter_idle(void) { }
++static inline void calc_load_exit_idle(void) { }
++#endif /* CONFIG_NO_HZ */
++
+ #ifndef CONFIG_CPUMASK_OFFSTACK
+ static inline int set_cpus_allowed(struct task_struct *p, cpumask_t new_mask)
+ {
+diff --git a/kernel/sched.c b/kernel/sched.c
+index 576a27f..52ac69b 100644
+--- a/kernel/sched.c
++++ b/kernel/sched.c
+@@ -1885,7 +1885,6 @@ static void double_rq_unlock(struct rq *rq1, struct rq *rq2)
+ 
+ #endif
+ 
+-static void calc_load_account_idle(struct rq *this_rq);
+ static void update_sysctl(void);
+ static int get_update_sysctl_factor(void);
+ static void update_cpu_load(struct rq *this_rq);
+@@ -3401,11 +3400,73 @@ unsigned long this_cpu_load(void)
+ }
+ 
+ 
++/*
++ * Global load-average calculations
++ *
++ * We take a distributed and async approach to calculating the global load-avg
++ * in order to minimize overhead.
++ *
++ * The global load average is an exponentially decaying average of nr_running +
++ * nr_uninterruptible.
++ *
++ * Once every LOAD_FREQ:
++ *
++ *   nr_active = 0;
++ *   for_each_possible_cpu(cpu)
++ *   	nr_active += cpu_of(cpu)->nr_running + cpu_of(cpu)->nr_uninterruptible;
++ *
++ *   avenrun[n] = avenrun[0] * exp_n + nr_active * (1 - exp_n)
++ *
++ * Due to a number of reasons the above turns in the mess below:
++ *
++ *  - for_each_possible_cpu() is prohibitively expensive on machines with
++ *    serious number of cpus, therefore we need to take a distributed approach
++ *    to calculating nr_active.
++ *
++ *        \Sum_i x_i(t) = \Sum_i x_i(t) - x_i(t_0) | x_i(t_0) := 0
++ *                      = \Sum_i { \Sum_j=1 x_i(t_j) - x_i(t_j-1) }
++ *
++ *    So assuming nr_active := 0 when we start out -- true per definition, we
++ *    can simply take per-cpu deltas and fold those into a global accumulate
++ *    to obtain the same result. See calc_load_fold_active().
++ *
++ *    Furthermore, in order to avoid synchronizing all per-cpu delta folding
++ *    across the machine, we assume 10 ticks is sufficient time for every
++ *    cpu to have completed this task.
++ *
++ *    This places an upper-bound on the IRQ-off latency of the machine. Then
++ *    again, being late doesn't loose the delta, just wrecks the sample.
++ *
++ *  - cpu_rq()->nr_uninterruptible isn't accurately tracked per-cpu because
++ *    this would add another cross-cpu cacheline miss and atomic operation
++ *    to the wakeup path. Instead we increment on whatever cpu the task ran
++ *    when it went into uninterruptible state and decrement on whatever cpu
++ *    did the wakeup. This means that only the sum of nr_uninterruptible over
++ *    all cpus yields the correct result.
++ *
++ *  This covers the NO_HZ=n code, for extra head-aches, see the comment below.
++ */
++
+ /* Variables and functions for calc_load */
+ static atomic_long_t calc_load_tasks;
+ static unsigned long calc_load_update;
+ unsigned long avenrun[3];
+-EXPORT_SYMBOL(avenrun);
++EXPORT_SYMBOL(avenrun); /* should be removed */
++
++/**
++ * get_avenrun - get the load average array
++ * @loads:	pointer to dest load array
++ * @offset:	offset to add
++ * @shift:	shift count to shift the result left
++ *
++ * These values are estimates at best, so no need for locking.
++ */
++void get_avenrun(unsigned long *loads, unsigned long offset, int shift)
++{
++	loads[0] = (avenrun[0] + offset) << shift;
++	loads[1] = (avenrun[1] + offset) << shift;
++	loads[2] = (avenrun[2] + offset) << shift;
++}
+ 
+ static long calc_load_fold_active(struct rq *this_rq)
+ {
+@@ -3422,6 +3483,9 @@ static long calc_load_fold_active(struct rq *this_rq)
+ 	return delta;
+ }
+ 
++/*
++ * a1 = a0 * e + a * (1 - e)
++ */
+ static unsigned long
+ calc_load(unsigned long load, unsigned long exp, unsigned long active)
+ {
+@@ -3433,30 +3497,118 @@ calc_load(unsigned long load, unsigned long exp, unsigned long active)
+ 
+ #ifdef CONFIG_NO_HZ
+ /*
+- * For NO_HZ we delay the active fold to the next LOAD_FREQ update.
++ * Handle NO_HZ for the global load-average.
++ *
++ * Since the above described distributed algorithm to compute the global
++ * load-average relies on per-cpu sampling from the tick, it is affected by
++ * NO_HZ.
++ *
++ * The basic idea is to fold the nr_active delta into a global idle-delta upon
++ * entering NO_HZ state such that we can include this as an 'extra' cpu delta
++ * when we read the global state.
++ *
++ * Obviously reality has to ruin such a delightfully simple scheme:
++ *
++ *  - When we go NO_HZ idle during the window, we can negate our sample
++ *    contribution, causing under-accounting.
++ *
++ *    We avoid this by keeping two idle-delta counters and flipping them
++ *    when the window starts, thus separating old and new NO_HZ load.
++ *
++ *    The only trick is the slight shift in index flip for read vs write.
++ *
++ *        0s            5s            10s           15s
++ *          +10           +10           +10           +10
++ *        |-|-----------|-|-----------|-|-----------|-|
++ *    r:0 0 1           1 0           0 1           1 0
++ *    w:0 1 1           0 0           1 1           0 0
++ *
++ *    This ensures we'll fold the old idle contribution in this window while
++ *    accumlating the new one.
++ *
++ *  - When we wake up from NO_HZ idle during the window, we push up our
++ *    contribution, since we effectively move our sample point to a known
++ *    busy state.
++ *
++ *    This is solved by pushing the window forward, and thus skipping the
++ *    sample, for this cpu (effectively using the idle-delta for this cpu which
++ *    was in effect at the time the window opened). This also solves the issue
++ *    of having to deal with a cpu having been in NOHZ idle for multiple
++ *    LOAD_FREQ intervals.
+  *
+  * When making the ILB scale, we should try to pull this in as well.
+  */
+-static atomic_long_t calc_load_tasks_idle;
++static atomic_long_t calc_load_idle[2];
++static int calc_load_idx;
+ 
+-static void calc_load_account_idle(struct rq *this_rq)
++static inline int calc_load_write_idx(void)
+ {
++	int idx = calc_load_idx;
++
++	/*
++	 * See calc_global_nohz(), if we observe the new index, we also
++	 * need to observe the new update time.
++	 */
++	smp_rmb();
++
++	/*
++	 * If the folding window started, make sure we start writing in the
++	 * next idle-delta.
++	 */
++	if (!time_before(jiffies, calc_load_update))
++		idx++;
++
++	return idx & 1;
++}
++
++static inline int calc_load_read_idx(void)
++{
++	return calc_load_idx & 1;
++}
++
++void calc_load_enter_idle(void)
++{
++	struct rq *this_rq = this_rq();
+ 	long delta;
+ 
++	/*
++	 * We're going into NOHZ mode, if there's any pending delta, fold it
++	 * into the pending idle delta.
++	 */
+ 	delta = calc_load_fold_active(this_rq);
+-	if (delta)
+-		atomic_long_add(delta, &calc_load_tasks_idle);
++	if (delta) {
++		int idx = calc_load_write_idx();
++		atomic_long_add(delta, &calc_load_idle[idx]);
++	}
+ }
+ 
+-static long calc_load_fold_idle(void)
++void calc_load_exit_idle(void)
+ {
+-	long delta = 0;
++	struct rq *this_rq = this_rq();
++
++	/*
++	 * If we're still before the sample window, we're done.
++	 */
++	if (time_before(jiffies, this_rq->calc_load_update))
++		return;
+ 
+ 	/*
+-	 * Its got a race, we don't care...
++	 * We woke inside or after the sample window, this means we're already
++	 * accounted through the nohz accounting, so skip the entire deal and
++	 * sync up for the next window.
+ 	 */
+-	if (atomic_long_read(&calc_load_tasks_idle))
+-		delta = atomic_long_xchg(&calc_load_tasks_idle, 0);
++	this_rq->calc_load_update = calc_load_update;
++	if (time_before(jiffies, this_rq->calc_load_update + 10))
++		this_rq->calc_load_update += LOAD_FREQ;
++}
++
++static long calc_load_fold_idle(void)
++{
++	int idx = calc_load_read_idx();
++	long delta = 0;
++
++	if (atomic_long_read(&calc_load_idle[idx]))
++		delta = atomic_long_xchg(&calc_load_idle[idx], 0);
+ 
+ 	return delta;
+ }
+@@ -3542,66 +3694,39 @@ static void calc_global_nohz(void)
+ {
+ 	long delta, active, n;
+ 
+-	/*
+-	 * If we crossed a calc_load_update boundary, make sure to fold
+-	 * any pending idle changes, the respective CPUs might have
+-	 * missed the tick driven calc_load_account_active() update
+-	 * due to NO_HZ.
+-	 */
+-	delta = calc_load_fold_idle();
+-	if (delta)
+-		atomic_long_add(delta, &calc_load_tasks);
+-
+-	/*
+-	 * It could be the one fold was all it took, we done!
+-	 */
+-	if (time_before(jiffies, calc_load_update + 10))
+-		return;
+-
+-	/*
+-	 * Catch-up, fold however many we are behind still
+-	 */
+-	delta = jiffies - calc_load_update - 10;
+-	n = 1 + (delta / LOAD_FREQ);
++	if (!time_before(jiffies, calc_load_update + 10)) {
++		/*
++		 * Catch-up, fold however many we are behind still
++		 */
++		delta = jiffies - calc_load_update - 10;
++		n = 1 + (delta / LOAD_FREQ);
+ 
+-	active = atomic_long_read(&calc_load_tasks);
+-	active = active > 0 ? active * FIXED_1 : 0;
++		active = atomic_long_read(&calc_load_tasks);
++		active = active > 0 ? active * FIXED_1 : 0;
+ 
+-	avenrun[0] = calc_load_n(avenrun[0], EXP_1, active, n);
+-	avenrun[1] = calc_load_n(avenrun[1], EXP_5, active, n);
+-	avenrun[2] = calc_load_n(avenrun[2], EXP_15, active, n);
++		avenrun[0] = calc_load_n(avenrun[0], EXP_1, active, n);
++		avenrun[1] = calc_load_n(avenrun[1], EXP_5, active, n);
++		avenrun[2] = calc_load_n(avenrun[2], EXP_15, active, n);
+ 
+-	calc_load_update += n * LOAD_FREQ;
+-}
+-#else
+-static void calc_load_account_idle(struct rq *this_rq)
+-{
+-}
++		calc_load_update += n * LOAD_FREQ;
++	}
+ 
+-static inline long calc_load_fold_idle(void)
+-{
+-	return 0;
++	/*
++	 * Flip the idle index...
++	 *
++	 * Make sure we first write the new time then flip the index, so that
++	 * calc_load_write_idx() will see the new time when it reads the new
++	 * index, this avoids a double flip messing things up.
++	 */
++	smp_wmb();
++	calc_load_idx++;
+ }
++#else /* !CONFIG_NO_HZ */
+ 
+-static void calc_global_nohz(void)
+-{
+-}
+-#endif
++static inline long calc_load_fold_idle(void) { return 0; }
++static inline void calc_global_nohz(void) { }
+ 
+-/**
+- * get_avenrun - get the load average array
+- * @loads:	pointer to dest load array
+- * @offset:	offset to add
+- * @shift:	shift count to shift the result left
+- *
+- * These values are estimates at best, so no need for locking.
+- */
+-void get_avenrun(unsigned long *loads, unsigned long offset, int shift)
+-{
+-	loads[0] = (avenrun[0] + offset) << shift;
+-	loads[1] = (avenrun[1] + offset) << shift;
+-	loads[2] = (avenrun[2] + offset) << shift;
+-}
++#endif /* CONFIG_NO_HZ */
+ 
+ /*
+  * calc_load - update the avenrun load estimates 10 ticks after the
+@@ -3609,11 +3734,18 @@ void get_avenrun(unsigned long *loads, unsigned long offset, int shift)
+  */
+ void calc_global_load(unsigned long ticks)
+ {
+-	long active;
++	long active, delta;
+ 
+ 	if (time_before(jiffies, calc_load_update + 10))
+ 		return;
+ 
++	/*
++	 * Fold the 'old' idle-delta to include all NO_HZ cpus.
++	 */
++	delta = calc_load_fold_idle();
++	if (delta)
++		atomic_long_add(delta, &calc_load_tasks);
++
+ 	active = atomic_long_read(&calc_load_tasks);
+ 	active = active > 0 ? active * FIXED_1 : 0;
+ 
+@@ -3624,12 +3756,7 @@ void calc_global_load(unsigned long ticks)
+ 	calc_load_update += LOAD_FREQ;
+ 
+ 	/*
+-	 * Account one period with whatever state we found before
+-	 * folding in the nohz state and ageing the entire idle period.
+-	 *
+-	 * This avoids loosing a sample when we go idle between 
+-	 * calc_load_account_active() (10 ticks ago) and now and thus
+-	 * under-accounting.
++	 * In case we idled for multiple LOAD_FREQ intervals, catch up in bulk.
+ 	 */
+ 	calc_global_nohz();
+ }
+@@ -3646,7 +3773,6 @@ static void calc_load_account_active(struct rq *this_rq)
+ 		return;
+ 
+ 	delta  = calc_load_fold_active(this_rq);
+-	delta += calc_load_fold_idle();
+ 	if (delta)
+ 		atomic_long_add(delta, &calc_load_tasks);
+ 
+@@ -3654,6 +3780,10 @@ static void calc_load_account_active(struct rq *this_rq)
+ }
+ 
+ /*
++ * End of global load-average stuff
++ */
++
++/*
+  * The exact cpuload at various idx values, calculated at every tick would be
+  * load = (2^idx - 1) / 2^idx * load + 1 / 2^idx * cur_load
+  *
+diff --git a/kernel/sched_idletask.c b/kernel/sched_idletask.c
+index 0a51882..be92bfe 100644
+--- a/kernel/sched_idletask.c
++++ b/kernel/sched_idletask.c
+@@ -23,7 +23,6 @@ static void check_preempt_curr_idle(struct rq *rq, struct task_struct *p, int fl
+ static struct task_struct *pick_next_task_idle(struct rq *rq)
+ {
+ 	schedstat_inc(rq, sched_goidle);
+-	calc_load_account_idle(rq);
+ 	return rq->idle;
+ }
+ 
+diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
+index c923640..9955ebd 100644
+--- a/kernel/time/tick-sched.c
++++ b/kernel/time/tick-sched.c
+@@ -430,6 +430,7 @@ void tick_nohz_stop_sched_tick(int inidle)
+ 		 */
+ 		if (!ts->tick_stopped) {
+ 			select_nohz_load_balancer(1);
++			calc_load_enter_idle();
+ 
+ 			ts->idle_tick = hrtimer_get_expires(&ts->sched_timer);
+ 			ts->tick_stopped = 1;
+@@ -563,6 +564,7 @@ void tick_nohz_restart_sched_tick(void)
+ 		account_idle_ticks(ticks);
+ #endif
+ 
++	calc_load_exit_idle();
+ 	touch_softlockup_watchdog();
+ 	/*
+ 	 * Cancel the scheduled timer and restore the tick
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0029-USB-option-add-ZTE-MF60.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0029-USB-option-add-ZTE-MF60.patch
new file mode 100644
index 0000000..0c6d8be
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0029-USB-option-add-ZTE-MF60.patch
@@ -0,0 +1,70 @@
+From 4090ab847de2c528ae152e864a7ce604ef300837 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
+Date: Mon, 2 Jul 2012 19:53:55 +0200
+Subject: [PATCH 029/109] USB: option: add ZTE MF60
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 8e16e33c168a6efd0c9f7fa9dd4c1e1db9a74553 upstream.
+
+Switches into a composite device by ejecting the initial
+driver CD.  The four interfaces are: QCDM, AT, QMI/wwan
+and mass storage.  Let this driver manage the two serial
+interfaces:
+
+T:  Bus=02 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#= 28 Spd=480  MxCh= 0
+D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
+P:  Vendor=19d2 ProdID=1402 Rev= 0.00
+S:  Manufacturer=ZTE,Incorporated
+S:  Product=ZTE WCDMA Technologies MSM
+S:  SerialNumber=xxxxx
+C:* #Ifs= 4 Cfg#= 1 Atr=c0 MxPwr=500mA
+I:* If#= 0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
+E:  Ad=81(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+E:  Ad=01(O) Atr=02(Bulk) MxPS= 512 Ivl=4ms
+I:* If#= 1 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=option
+E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=4ms
+I:* If#= 2 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=qmi_wwan
+E:  Ad=83(I) Atr=03(Int.) MxPS=  64 Ivl=2ms
+E:  Ad=84(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+E:  Ad=03(O) Atr=02(Bulk) MxPS= 512 Ivl=4ms
+I:* If#= 3 Alt= 0 #EPs= 2 Cls=08(stor.) Sub=06 Prot=50 Driver=usb-storage
+E:  Ad=04(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+E:  Ad=85(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
+
+Signed-off-by: Bjørn Mork <bjorn@mork.no>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/option.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 21a4734..5960c7b 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -553,6 +553,10 @@ static const struct option_blacklist_info net_intf1_blacklist = {
+ 	.reserved = BIT(1),
+ };
+ 
++static const struct option_blacklist_info net_intf2_blacklist = {
++	.reserved = BIT(2),
++};
++
+ static const struct option_blacklist_info net_intf3_blacklist = {
+ 	.reserved = BIT(3),
+ };
+@@ -1093,6 +1097,8 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1298, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1299, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1300, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1402, 0xff, 0xff, 0xff),
++		.driver_info = (kernel_ulong_t)&net_intf2_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2002, 0xff,
+ 	  0xff, 0xff), .driver_info = (kernel_ulong_t)&zte_k3765_z_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x2003, 0xff, 0xff, 0xff) },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0030-USB-option-Add-MEDIATEK-product-ids.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0030-USB-option-Add-MEDIATEK-product-ids.patch
new file mode 100644
index 0000000..0091085
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0030-USB-option-Add-MEDIATEK-product-ids.patch
@@ -0,0 +1,55 @@
+From 26b05210d9f77b9b92fb12a73da5b9f6cb1b3f07 Mon Sep 17 00:00:00 2001
+From: Gaosen Zhang <gaosen.zhang@mediatek.com>
+Date: Thu, 5 Jul 2012 21:49:00 +0800
+Subject: [PATCH 030/109] USB: option: Add MEDIATEK product ids
+
+commit aacef9c561a693341566a6850c451ce3df68cb9a upstream.
+
+Signed-off-by: Gaosen Zhang <gaosen.zhang@mediatek.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/option.c |   20 ++++++++++++++++++++
+ 1 files changed, 20 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 5960c7b..5971c95 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -496,6 +496,15 @@ static void option_instat_callback(struct urb *urb);
+ 
+ /* MediaTek products */
+ #define MEDIATEK_VENDOR_ID			0x0e8d
++#define MEDIATEK_PRODUCT_DC_1COM		0x00a0
++#define MEDIATEK_PRODUCT_DC_4COM		0x00a5
++#define MEDIATEK_PRODUCT_DC_5COM		0x00a4
++#define MEDIATEK_PRODUCT_7208_1COM		0x7101
++#define MEDIATEK_PRODUCT_7208_2COM		0x7102
++#define MEDIATEK_PRODUCT_FP_1COM		0x0003
++#define MEDIATEK_PRODUCT_FP_2COM		0x0023
++#define MEDIATEK_PRODUCT_FPDC_1COM		0x0043
++#define MEDIATEK_PRODUCT_FPDC_2COM		0x0033
+ 
+ /* Cellient products */
+ #define CELLIENT_VENDOR_ID			0x2692
+@@ -1240,6 +1249,17 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a1, 0xff, 0x02, 0x01) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x00, 0x00) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, 0x00a2, 0xff, 0x02, 0x01) },        /* MediaTek MT6276M modem & app port */
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_1COM, 0x0a, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_5COM, 0xff, 0x02, 0x01) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_5COM, 0xff, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM, 0xff, 0x02, 0x01) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_DC_4COM, 0xff, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7208_1COM, 0x02, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_7208_2COM, 0x02, 0x02, 0x01) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FP_1COM, 0x0a, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FP_2COM, 0x0a, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FPDC_1COM, 0x0a, 0x00, 0x00) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(MEDIATEK_VENDOR_ID, MEDIATEK_PRODUCT_FPDC_2COM, 0x0a, 0x00, 0x00) },
+ 	{ USB_DEVICE(CELLIENT_VENDOR_ID, CELLIENT_PRODUCT_MEN200) },
+ 	{ } /* Terminating entry */
+ };
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0031-USB-cdc-wdm-fix-lockup-on-error-in-wdm_read.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0031-USB-cdc-wdm-fix-lockup-on-error-in-wdm_read.patch
new file mode 100644
index 0000000..3fb9fae
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0031-USB-cdc-wdm-fix-lockup-on-error-in-wdm_read.patch
@@ -0,0 +1,78 @@
+From 6fb488dec8482c866a2c7cd4d1da06b85b8b28c7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
+Date: Mon, 2 Jul 2012 10:33:14 +0200
+Subject: [PATCH 031/109] USB: cdc-wdm: fix lockup on error in wdm_read
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit b086b6b10d9f182cd8d2f0dcfd7fd11edba93fc9 upstream.
+
+Clear the WDM_READ flag on empty reads to avoid running
+forever in an infinite tight loop, causing lockups:
+
+Jul  1 21:58:11 nemi kernel: [ 3658.898647] qmi_wwan 2-1:1.2: Unexpected error -71
+Jul  1 21:58:36 nemi kernel: [ 3684.072021] BUG: soft lockup - CPU#0 stuck for 23s! [qmi.pl:12235]
+Jul  1 21:58:36 nemi kernel: [ 3684.072212] CPU 0
+Jul  1 21:58:36 nemi kernel: [ 3684.072355]
+Jul  1 21:58:36 nemi kernel: [ 3684.072367] Pid: 12235, comm: qmi.pl Tainted: P           O 3.5.0-rc2+ #13 LENOVO 2776LEG/2776LEG
+Jul  1 21:58:36 nemi kernel: [ 3684.072383] RIP: 0010:[<ffffffffa0635008>]  [<ffffffffa0635008>] spin_unlock_irq+0x8/0xc [cdc_wdm]
+Jul  1 21:58:36 nemi kernel: [ 3684.072388] RSP: 0018:ffff88022dca1e70  EFLAGS: 00000282
+Jul  1 21:58:36 nemi kernel: [ 3684.072393] RAX: ffff88022fc3f650 RBX: ffffffff811c56f7 RCX: 00000001000ce8c1
+Jul  1 21:58:36 nemi kernel: [ 3684.072398] RDX: 0000000000000010 RSI: 000000000267d810 RDI: ffff88022fc3f650
+Jul  1 21:58:36 nemi kernel: [ 3684.072403] RBP: ffff88022dca1eb0 R08: ffffffffa063578e R09: 0000000000000000
+Jul  1 21:58:36 nemi kernel: [ 3684.072407] R10: 0000000000000008 R11: 0000000000000246 R12: 0000000000000002
+Jul  1 21:58:36 nemi kernel: [ 3684.072412] R13: 0000000000000246 R14: ffffffff00000002 R15: ffff8802281d8c88
+Jul  1 21:58:36 nemi kernel: [ 3684.072418] FS:  00007f666a260700(0000) GS:ffff88023bc00000(0000) knlGS:0000000000000000
+Jul  1 21:58:36 nemi kernel: [ 3684.072423] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
+Jul  1 21:58:36 nemi kernel: [ 3684.072428] CR2: 000000000270d9d8 CR3: 000000022e865000 CR4: 00000000000007f0
+Jul  1 21:58:36 nemi kernel: [ 3684.072433] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
+Jul  1 21:58:36 nemi kernel: [ 3684.072438] DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
+Jul  1 21:58:36 nemi kernel: [ 3684.072444] Process qmi.pl (pid: 12235, threadinfo ffff88022dca0000, task ffff88022ff76380)
+Jul  1 21:58:36 nemi kernel: [ 3684.072448] Stack:
+Jul  1 21:58:36 nemi kernel: [ 3684.072458]  ffffffffa063592e 0000000100020000 ffff88022fc3f650 ffff88022fc3f6a8
+Jul  1 21:58:36 nemi kernel: [ 3684.072466]  0000000000000200 0000000100000000 000000000267d810 0000000000000000
+Jul  1 21:58:36 nemi kernel: [ 3684.072475]  0000000000000000 ffff880212cfb6d0 0000000000000200 ffff880212cfb6c0
+Jul  1 21:58:36 nemi kernel: [ 3684.072479] Call Trace:
+Jul  1 21:58:36 nemi kernel: [ 3684.072489]  [<ffffffffa063592e>] ? wdm_read+0x1a0/0x263 [cdc_wdm]
+Jul  1 21:58:36 nemi kernel: [ 3684.072500]  [<ffffffff8110adb7>] ? vfs_read+0xa1/0xfb
+Jul  1 21:58:36 nemi kernel: [ 3684.072509]  [<ffffffff81040589>] ? alarm_setitimer+0x35/0x64
+Jul  1 21:58:36 nemi kernel: [ 3684.072517]  [<ffffffff8110aec7>] ? sys_read+0x45/0x6e
+Jul  1 21:58:36 nemi kernel: [ 3684.072525]  [<ffffffff813725f9>] ? system_call_fastpath+0x16/0x1b
+Jul  1 21:58:36 nemi kernel: [ 3684.072557] Code: <66> 66 90 c3 83 ff ed 89 f8 74 16 7f 06 83 ff a1 75 0a c3 83 ff f4
+
+The WDM_READ flag is normally cleared by wdm_int_callback
+before resubmitting the read urb, and set by wdm_in_callback
+when this urb returns with data or an error.  But a crashing
+device may cause both a read error and cancelling all urbs.
+Make sure that the flag is cleared by wdm_read if the buffer
+is empty.
+
+We don't clear the flag on errors, as there may be pending
+data in the buffer which should be processed.  The flag will
+instead be cleared on the next wdm_read call.
+
+Signed-off-by: Bjørn Mork <bjorn@mork.no>
+Acked-by: Oliver Neukum <oneukum@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/class/cdc-wdm.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
+index 19fb5fa..9aaed0d 100644
+--- a/drivers/usb/class/cdc-wdm.c
++++ b/drivers/usb/class/cdc-wdm.c
+@@ -473,6 +473,8 @@ retry:
+ 			goto retry;
+ 		}
+ 		if (!desc->reslength) { /* zero length read */
++			dev_dbg(&desc->intf->dev, "%s: zero length - clearing WDM_READ\n", __func__);
++			clear_bit(WDM_READ, &desc->flags);
+ 			spin_unlock_irq(&desc->iuspin);
+ 			goto retry;
+ 		}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0032-mtd-nandsim-don-t-open-code-a-do_div-helper.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0032-mtd-nandsim-don-t-open-code-a-do_div-helper.patch
new file mode 100644
index 0000000..e96b5c5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0032-mtd-nandsim-don-t-open-code-a-do_div-helper.patch
@@ -0,0 +1,94 @@
+From bb5561cb838492a05e5dae25114d768828fe2dfe Mon Sep 17 00:00:00 2001
+From: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
+Date: Wed, 16 May 2012 16:21:52 -0300
+Subject: [PATCH 032/109] mtd: nandsim: don't open code a do_div helper
+
+commit 596fd46268634082314b3af1ded4612e1b7f3f03 upstream.
+
+We don't need to open code the divide function, just use div_u64 that
+already exists and do the same job. While this is a straightforward
+clean up, there is more to that, the real motivation for this.
+
+While building on a cross compiling environment in armel, using gcc
+4.6.3 (Ubuntu/Linaro 4.6.3-1ubuntu5), I was getting the following build
+error:
+
+ERROR: "__aeabi_uldivmod" [drivers/mtd/nand/nandsim.ko] undefined!
+
+After investigating with objdump and hand built assembly version
+generated with the compiler, I narrowed __aeabi_uldivmod as being
+generated from the divide function. When nandsim.c is built with
+-fno-inline-functions-called-once, that happens when
+CONFIG_DEBUG_SECTION_MISMATCH is enabled, the do_div optimization in
+arch/arm/include/asm/div64.h doesn't work as expected with the open
+coded divide function: even if the do_div we are using doesn't have a
+constant divisor, the compiler still includes the else parts of the
+optimized do_div macro, and translates the divisions there to use
+__aeabi_uldivmod, instead of only calling __do_div_asm -> __do_div64 and
+optimizing/removing everything else out.
+
+So to reproduce, gcc 4.6 plus CONFIG_DEBUG_SECTION_MISMATCH=y and
+CONFIG_MTD_NAND_NANDSIM=m should do it, building on armel.
+
+After this change, the compiler does the intended thing even with
+-fno-inline-functions-called-once, and optimizes out as expected the
+constant handling in the optimized do_div on arm. As this also avoids a
+build issue, I'm marking for Stable, as I think is applicable for this
+case.
+
+Signed-off-by: Herton Ronaldo Krzesinski <herton.krzesinski@canonical.com>
+Acked-by: Nicolas Pitre <nico@linaro.org>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/mtd/nand/nandsim.c |   12 +++---------
+ 1 files changed, 3 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/mtd/nand/nandsim.c b/drivers/mtd/nand/nandsim.c
+index 34c03be..83e8e1b 100644
+--- a/drivers/mtd/nand/nandsim.c
++++ b/drivers/mtd/nand/nandsim.c
+@@ -28,7 +28,7 @@
+ #include <linux/module.h>
+ #include <linux/moduleparam.h>
+ #include <linux/vmalloc.h>
+-#include <asm/div64.h>
++#include <linux/math64.h>
+ #include <linux/slab.h>
+ #include <linux/errno.h>
+ #include <linux/string.h>
+@@ -547,12 +547,6 @@ static char *get_partition_name(int i)
+ 	return kstrdup(buf, GFP_KERNEL);
+ }
+ 
+-static uint64_t divide(uint64_t n, uint32_t d)
+-{
+-	do_div(n, d);
+-	return n;
+-}
+-
+ /*
+  * Initialize the nandsim structure.
+  *
+@@ -581,7 +575,7 @@ static int init_nandsim(struct mtd_info *mtd)
+ 	ns->geom.oobsz    = mtd->oobsize;
+ 	ns->geom.secsz    = mtd->erasesize;
+ 	ns->geom.pgszoob  = ns->geom.pgsz + ns->geom.oobsz;
+-	ns->geom.pgnum    = divide(ns->geom.totsz, ns->geom.pgsz);
++	ns->geom.pgnum    = div_u64(ns->geom.totsz, ns->geom.pgsz);
+ 	ns->geom.totszoob = ns->geom.totsz + (uint64_t)ns->geom.pgnum * ns->geom.oobsz;
+ 	ns->geom.secshift = ffs(ns->geom.secsz) - 1;
+ 	ns->geom.pgshift  = chip->page_shift;
+@@ -924,7 +918,7 @@ static int setup_wear_reporting(struct mtd_info *mtd)
+ 
+ 	if (!rptwear)
+ 		return 0;
+-	wear_eb_count = divide(mtd->size, mtd->erasesize);
++	wear_eb_count = div_u64(mtd->size, mtd->erasesize);
+ 	mem = wear_eb_count * sizeof(unsigned long);
+ 	if (mem / sizeof(unsigned long) != wear_eb_count) {
+ 		NS_ERR("Too many erase blocks for wear reporting\n");
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0033-dvb-core-Release-semaphore-on-error-path-dvb_registe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0033-dvb-core-Release-semaphore-on-error-path-dvb_registe.patch
new file mode 100644
index 0000000..4ad1726
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0033-dvb-core-Release-semaphore-on-error-path-dvb_registe.patch
@@ -0,0 +1,33 @@
+From 9b4b8dd705a1a7f9c4b7c2128663d2e31b1d0265 Mon Sep 17 00:00:00 2001
+From: Santosh Nayak <santoshprasadnayak@gmail.com>
+Date: Sat, 23 Jun 2012 07:59:54 -0300
+Subject: [PATCH 033/109] dvb-core: Release semaphore on error path
+ dvb_register_device()
+
+commit 82163edcdfa4eb3d74516cc8e9f38dd3d039b67d upstream.
+
+There is a missing "up_write()" here. Semaphore should be released
+before returning error value.
+
+Signed-off-by: Santosh Nayak <santoshprasadnayak@gmail.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/media/dvb/dvb-core/dvbdev.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/media/dvb/dvb-core/dvbdev.c b/drivers/media/dvb/dvb-core/dvbdev.c
+index f732877..d5cda35 100644
+--- a/drivers/media/dvb/dvb-core/dvbdev.c
++++ b/drivers/media/dvb/dvb-core/dvbdev.c
+@@ -243,6 +243,7 @@ int dvb_register_device(struct dvb_adapter *adap, struct dvb_device **pdvbdev,
+ 	if (minor == MAX_DVB_MINORS) {
+ 		kfree(dvbdevfops);
+ 		kfree(dvbdev);
++		up_write(&minor_rwsem);
+ 		mutex_unlock(&dvbdev_register_lock);
+ 		return -EINVAL;
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0034-hwspinlock-core-use-global-ID-to-register-hwspinlock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0034-hwspinlock-core-use-global-ID-to-register-hwspinlock.patch
new file mode 100644
index 0000000..11ba36d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0034-hwspinlock-core-use-global-ID-to-register-hwspinlock.patch
@@ -0,0 +1,52 @@
+From 6c6190dbd1e0054c77445ed61dcbc70db441d4d2 Mon Sep 17 00:00:00 2001
+From: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
+Date: Sat, 7 Jul 2012 13:37:42 +0300
+Subject: [PATCH 034/109] hwspinlock/core: use global ID to register
+ hwspinlocks on multiple devices
+
+commit 476a7eeb60e70ddab138e7cb4bc44ef5ac20782e upstream.
+
+Commit 300bab9770 (hwspinlock/core: register a bank of hwspinlocks in a
+single API call, 2011-09-06) introduced 'hwspin_lock_register_single()'
+to register numerous (a bank of) hwspinlock instances in a single API,
+'hwspin_lock_register()'.
+
+At which time, 'hwspin_lock_register()' accidentally passes 'local IDs'
+to 'hwspin_lock_register_single()', despite that ..._single() requires
+'global IDs' to register hwspinlocks.
+
+We have to convert into global IDs by supplying the missing 'base_id'.
+
+Signed-off-by: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
+[ohad: fix error path of hwspin_lock_register, too]
+Signed-off-by: Ohad Ben-Cohen <ohad@wizery.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/hwspinlock/hwspinlock_core.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/hwspinlock/hwspinlock_core.c b/drivers/hwspinlock/hwspinlock_core.c
+index 61c9cf1..1201a15 100644
+--- a/drivers/hwspinlock/hwspinlock_core.c
++++ b/drivers/hwspinlock/hwspinlock_core.c
+@@ -345,7 +345,7 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
+ 		spin_lock_init(&hwlock->lock);
+ 		hwlock->bank = bank;
+ 
+-		ret = hwspin_lock_register_single(hwlock, i);
++		ret = hwspin_lock_register_single(hwlock, base_id + i);
+ 		if (ret)
+ 			goto reg_failed;
+ 	}
+@@ -354,7 +354,7 @@ int hwspin_lock_register(struct hwspinlock_device *bank, struct device *dev,
+ 
+ reg_failed:
+ 	while (--i >= 0)
+-		hwspin_lock_unregister_single(i);
++		hwspin_lock_unregister_single(base_id + i);
+ 	return ret;
+ }
+ EXPORT_SYMBOL_GPL(hwspin_lock_register);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0035-libsas-fix-taskfile-corruption-in-sas_ata_qc_fill_rt.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0035-libsas-fix-taskfile-corruption-in-sas_ata_qc_fill_rt.patch
new file mode 100644
index 0000000..88c7627
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0035-libsas-fix-taskfile-corruption-in-sas_ata_qc_fill_rt.patch
@@ -0,0 +1,116 @@
+From 65719aa5de077d1ccbfe535e9b934d6e91d11601 Mon Sep 17 00:00:00 2001
+From: Dan Williams <dan.j.williams@intel.com>
+Date: Fri, 22 Jun 2012 10:52:34 -0700
+Subject: [PATCH 035/109] libsas: fix taskfile corruption in
+ sas_ata_qc_fill_rtf
+
+commit 6ef1b512f4e6f936d89aa20be3d97a7ec7c290ac upstream.
+
+fill_result_tf() grabs the taskfile flags from the originating qc which
+sas_ata_qc_fill_rtf() promptly overwrites.  The presence of an
+ata_taskfile in the sata_device makes it tempting to just copy the full
+contents in sas_ata_qc_fill_rtf().  However, libata really only wants
+the fis contents and expects the other portions of the taskfile to not
+be touched by ->qc_fill_rtf.  To that end store a fis buffer in the
+sata_device and use ata_tf_from_fis() like every other ->qc_fill_rtf()
+implementation.
+
+Reported-by: Praveen Murali <pmurali@logicube.com>
+Tested-by: Praveen Murali <pmurali@logicube.com>
+Signed-off-by: Dan Williams <dan.j.williams@intel.com>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/aic94xx/aic94xx_task.c |    2 +-
+ drivers/scsi/libsas/sas_ata.c       |   12 ++++++------
+ include/scsi/libsas.h               |    6 ++++--
+ 3 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/scsi/aic94xx/aic94xx_task.c b/drivers/scsi/aic94xx/aic94xx_task.c
+index 532d212..393e7ce 100644
+--- a/drivers/scsi/aic94xx/aic94xx_task.c
++++ b/drivers/scsi/aic94xx/aic94xx_task.c
+@@ -201,7 +201,7 @@ static void asd_get_response_tasklet(struct asd_ascb *ascb,
+ 
+ 		if (SAS_STATUS_BUF_SIZE >= sizeof(*resp)) {
+ 			resp->frame_len = le16_to_cpu(*(__le16 *)(r+6));
+-			memcpy(&resp->ending_fis[0], r+16, 24);
++			memcpy(&resp->ending_fis[0], r+16, ATA_RESP_FIS_SIZE);
+ 			ts->buf_valid_size = sizeof(*resp);
+ 		}
+ 	}
+diff --git a/drivers/scsi/libsas/sas_ata.c b/drivers/scsi/libsas/sas_ata.c
+index db9238f..4868fc9 100644
+--- a/drivers/scsi/libsas/sas_ata.c
++++ b/drivers/scsi/libsas/sas_ata.c
+@@ -112,12 +112,12 @@ static void sas_ata_task_done(struct sas_task *task)
+ 	if (stat->stat == SAS_PROTO_RESPONSE || stat->stat == SAM_STAT_GOOD ||
+ 	    ((stat->stat == SAM_STAT_CHECK_CONDITION &&
+ 	      dev->sata_dev.command_set == ATAPI_COMMAND_SET))) {
+-		ata_tf_from_fis(resp->ending_fis, &dev->sata_dev.tf);
++		memcpy(dev->sata_dev.fis, resp->ending_fis, ATA_RESP_FIS_SIZE);
+ 
+ 		if (!link->sactive) {
+-			qc->err_mask |= ac_err_mask(dev->sata_dev.tf.command);
++			qc->err_mask |= ac_err_mask(dev->sata_dev.fis[2]);
+ 		} else {
+-			link->eh_info.err_mask |= ac_err_mask(dev->sata_dev.tf.command);
++			link->eh_info.err_mask |= ac_err_mask(dev->sata_dev.fis[2]);
+ 			if (unlikely(link->eh_info.err_mask))
+ 				qc->flags |= ATA_QCFLAG_FAILED;
+ 		}
+@@ -138,8 +138,8 @@ static void sas_ata_task_done(struct sas_task *task)
+ 				qc->flags |= ATA_QCFLAG_FAILED;
+ 			}
+ 
+-			dev->sata_dev.tf.feature = 0x04; /* status err */
+-			dev->sata_dev.tf.command = ATA_ERR;
++			dev->sata_dev.fis[3] = 0x04; /* status err */
++			dev->sata_dev.fis[2] = ATA_ERR;
+ 		}
+ 	}
+ 
+@@ -252,7 +252,7 @@ static bool sas_ata_qc_fill_rtf(struct ata_queued_cmd *qc)
+ {
+ 	struct domain_device *dev = qc->ap->private_data;
+ 
+-	memcpy(&qc->result_tf, &dev->sata_dev.tf, sizeof(qc->result_tf));
++	ata_tf_from_fis(dev->sata_dev.fis, &qc->result_tf);
+ 	return true;
+ }
+ 
+diff --git a/include/scsi/libsas.h b/include/scsi/libsas.h
+index 6a308d4..1e100c6 100644
+--- a/include/scsi/libsas.h
++++ b/include/scsi/libsas.h
+@@ -159,6 +159,8 @@ enum ata_command_set {
+         ATAPI_COMMAND_SET = 1,
+ };
+ 
++#define ATA_RESP_FIS_SIZE 24
++
+ struct sata_device {
+         enum   ata_command_set command_set;
+         struct smp_resp        rps_resp; /* report_phy_sata_resp */
+@@ -170,7 +172,7 @@ struct sata_device {
+ 
+ 	struct ata_port *ap;
+ 	struct ata_host ata_host;
+-	struct ata_taskfile tf;
++	u8     fis[ATA_RESP_FIS_SIZE];
+ 	u32 sstatus;
+ 	u32 serror;
+ 	u32 scontrol;
+@@ -486,7 +488,7 @@ enum exec_status {
+  */
+ struct ata_task_resp {
+ 	u16  frame_len;
+-	u8   ending_fis[24];	  /* dev to host or data-in */
++	u8   ending_fis[ATA_RESP_FIS_SIZE];	  /* dev to host or data-in */
+ 	u32  sstatus;
+ 	u32  serror;
+ 	u32  scontrol;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0036-md-raid1-fix-use-after-free-bug-in-RAID1-data-check-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0036-md-raid1-fix-use-after-free-bug-in-RAID1-data-check-.patch
new file mode 100644
index 0000000..442a6e2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0036-md-raid1-fix-use-after-free-bug-in-RAID1-data-check-.patch
@@ -0,0 +1,58 @@
+From 2710006f98cf587ce6b3108f543689de1bb6d60b Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Mon, 9 Jul 2012 11:34:13 +1000
+Subject: [PATCH 036/109] md/raid1: fix use-after-free bug in RAID1 data-check
+ code.
+
+commit 2d4f4f3384d4ef4f7c571448e803a1ce721113d5 upstream.
+
+This bug has been present ever since data-check was introduce
+in 2.6.16.  However it would only fire if a data-check were
+done on a degraded array, which was only possible if the array
+has 3 or more devices.  This is certainly possible, but is quite
+uncommon.
+
+Since hot-replace was added in 3.3 it can happen more often as
+the same condition can arise if not all possible replacements are
+present.
+
+The problem is that as soon as we submit the last read request, the
+'r1_bio' structure could be freed at any time, so we really should
+stop looking at it.  If the last device is being read from we will
+stop looking at it.  However if the last device is not due to be read
+from, we will still check the bio pointer in the r1_bio, but the
+r1_bio might already be free.
+
+So use the read_targets counter to make sure we stop looking for bios
+to submit as soon as we have submitted them all.
+
+This fix is suitable for any -stable kernel since 2.6.16.
+
+Reported-by: Arnold Schulz <arnysch@gmx.net>
+Signed-off-by: NeilBrown <neilb@suse.de>
+[bwh: Backported to 3.2: no doubling of conf->raid_disks; we don't have
+ hot-replace support]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid1.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
+index 7af60ec..58f0055 100644
+--- a/drivers/md/raid1.c
++++ b/drivers/md/raid1.c
+@@ -2378,9 +2378,10 @@ static sector_t sync_request(struct mddev *mddev, sector_t sector_nr, int *skipp
+ 	 */
+ 	if (test_bit(MD_RECOVERY_REQUESTED, &mddev->recovery)) {
+ 		atomic_set(&r1_bio->remaining, read_targets);
+-		for (i=0; i<conf->raid_disks; i++) {
++		for (i = 0; i < conf->raid_disks && read_targets; i++) {
+ 			bio = r1_bio->bios[i];
+ 			if (bio->bi_end_io == end_sync_read) {
++				read_targets--;
+ 				md_sync_acct(bio->bi_bdev, nr_sectors);
+ 				generic_make_request(bio);
+ 			}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0037-PCI-EHCI-fix-crash-during-suspend-on-ASUS-computers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0037-PCI-EHCI-fix-crash-during-suspend-on-ASUS-computers.patch
new file mode 100644
index 0000000..a5540c3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0037-PCI-EHCI-fix-crash-during-suspend-on-ASUS-computers.patch
@@ -0,0 +1,166 @@
+From 45cd1f6207fb66990e5f25e11fb4cd9486c31794 Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Mon, 9 Jul 2012 11:09:21 -0400
+Subject: [PATCH 037/109] PCI: EHCI: fix crash during suspend on ASUS
+ computers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit dbf0e4c7257f8d684ec1a3c919853464293de66e upstream.
+
+Quite a few ASUS computers experience a nasty problem, related to the
+EHCI controllers, when going into system suspend.  It was observed
+that the problem didn't occur if the controllers were not put into the
+D3 power state before starting the suspend, and commit
+151b61284776be2d6f02d48c23c3625678960b97 (USB: EHCI: fix crash during
+suspend on ASUS computers) was created to do this.
+
+It turned out this approach messed up other computers that didn't have
+the problem -- it prevented USB wakeup from working.  Consequently
+commit c2fb8a3fa25513de8fedb38509b1f15a5bbee47b (USB: add
+NO_D3_DURING_SLEEP flag and revert 151b61284776be2) was merged; it
+reverted the earlier commit and added a whitelist of known good board
+names.
+
+Now we know the actual cause of the problem.  Thanks to AceLan Kao for
+tracking it down.
+
+According to him, an engineer at ASUS explained that some of their
+BIOSes contain a bug that was added in an attempt to work around a
+problem in early versions of Windows.  When the computer goes into S3
+suspend, the BIOS tries to verify that the EHCI controllers were first
+quiesced by the OS.  Nothing's wrong with this, but the BIOS does it
+by checking that the PCI COMMAND registers contain 0 without checking
+the controllers' power state.  If the register isn't 0, the BIOS
+assumes the controller needs to be quiesced and tries to do so.  This
+involves making various MMIO accesses to the controller, which don't
+work very well if the controller is already in D3.  The end result is
+a system hang or memory corruption.
+
+Since the value in the PCI COMMAND register doesn't matter once the
+controller has been suspended, and since the value will be restored
+anyway when the controller is resumed, we can work around the BIOS bug
+simply by setting the register to 0 during system suspend.  This patch
+(as1590) does so and also reverts the second commit mentioned above,
+which is now unnecessary.
+
+In theory we could do this for every PCI device.  However to avoid
+introducing new problems, the patch restricts itself to EHCI host
+controllers.
+
+Finally the affected systems can suspend with USB wakeup working
+properly.
+
+Reference: https://bugzilla.kernel.org/show_bug.cgi?id=37632
+Reference: https://bugzilla.kernel.org/show_bug.cgi?id=42728
+Based-on-patch-by: AceLan Kao <acelan.kao@canonical.com>
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Tested-by: Dâniel Fraga <fragabr@gmail.com>
+Tested-by: Javier Marcet <jmarcet@gmail.com>
+Tested-by: Andrey Rahmatullin <wrar@wrar.name>
+Tested-by: Oleksij Rempel <bug-track@fisher-privat.net>
+Tested-by: Pavel Pisa <pisa@cmp.felk.cvut.cz>
+Acked-by: Bjorn Helgaas <bhelgaas@google.com>
+Acked-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/pci/pci-driver.c |   12 ++++++++++++
+ drivers/pci/pci.c        |    5 -----
+ drivers/pci/quirks.c     |   26 --------------------------
+ include/linux/pci.h      |    2 --
+ 4 files changed, 12 insertions(+), 33 deletions(-)
+
+diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
+index 12d1e81..d024f83 100644
+--- a/drivers/pci/pci-driver.c
++++ b/drivers/pci/pci-driver.c
+@@ -742,6 +742,18 @@ static int pci_pm_suspend_noirq(struct device *dev)
+ 
+ 	pci_pm_set_unknown_state(pci_dev);
+ 
++	/*
++	 * Some BIOSes from ASUS have a bug: If a USB EHCI host controller's
++	 * PCI COMMAND register isn't 0, the BIOS assumes that the controller
++	 * hasn't been quiesced and tries to turn it off.  If the controller
++	 * is already in D3, this can hang or cause memory corruption.
++	 *
++	 * Since the value of the COMMAND register doesn't matter once the
++	 * device has been suspended, we can safely set it to 0 here.
++	 */
++	if (pci_dev->class == PCI_CLASS_SERIAL_USB_EHCI)
++		pci_write_config_word(pci_dev, PCI_COMMAND, 0);
++
+ 	return 0;
+ }
+ 
+diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
+index e5b75eb..6d4a531 100644
+--- a/drivers/pci/pci.c
++++ b/drivers/pci/pci.c
+@@ -1689,11 +1689,6 @@ int pci_prepare_to_sleep(struct pci_dev *dev)
+ 	if (target_state == PCI_POWER_ERROR)
+ 		return -EIO;
+ 
+-	/* Some devices mustn't be in D3 during system sleep */
+-	if (target_state == PCI_D3hot &&
+-			(dev->dev_flags & PCI_DEV_FLAGS_NO_D3_DURING_SLEEP))
+-		return 0;
+-
+ 	pci_enable_wake(dev, target_state, device_may_wakeup(&dev->dev));
+ 
+ 	error = pci_set_power_state(dev, target_state);
+diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
+index 3c56fec..78fda9c 100644
+--- a/drivers/pci/quirks.c
++++ b/drivers/pci/quirks.c
+@@ -2940,32 +2940,6 @@ static void __devinit disable_igfx_irq(struct pci_dev *dev)
+ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x0102, disable_igfx_irq);
+ DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x010a, disable_igfx_irq);
+ 
+-/*
+- * The Intel 6 Series/C200 Series chipset's EHCI controllers on many
+- * ASUS motherboards will cause memory corruption or a system crash
+- * if they are in D3 while the system is put into S3 sleep.
+- */
+-static void __devinit asus_ehci_no_d3(struct pci_dev *dev)
+-{
+-	const char *sys_info;
+-	static const char good_Asus_board[] = "P8Z68-V";
+-
+-	if (dev->dev_flags & PCI_DEV_FLAGS_NO_D3_DURING_SLEEP)
+-		return;
+-	if (dev->subsystem_vendor != PCI_VENDOR_ID_ASUSTEK)
+-		return;
+-	sys_info = dmi_get_system_info(DMI_BOARD_NAME);
+-	if (sys_info && memcmp(sys_info, good_Asus_board,
+-			sizeof(good_Asus_board) - 1) == 0)
+-		return;
+-
+-	dev_info(&dev->dev, "broken D3 during system sleep on ASUS\n");
+-	dev->dev_flags |= PCI_DEV_FLAGS_NO_D3_DURING_SLEEP;
+-	device_set_wakeup_capable(&dev->dev, false);
+-}
+-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1c26, asus_ehci_no_d3);
+-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x1c2d, asus_ehci_no_d3);
+-
+ static void pci_do_fixups(struct pci_dev *dev, struct pci_fixup *f,
+ 			  struct pci_fixup *end)
+ {
+diff --git a/include/linux/pci.h b/include/linux/pci.h
+index c0cfa0d..7cda65b 100644
+--- a/include/linux/pci.h
++++ b/include/linux/pci.h
+@@ -176,8 +176,6 @@ enum pci_dev_flags {
+ 	PCI_DEV_FLAGS_NO_D3 = (__force pci_dev_flags_t) 2,
+ 	/* Provide indication device is assigned by a Virtual Machine Manager */
+ 	PCI_DEV_FLAGS_ASSIGNED = (__force pci_dev_flags_t) 4,
+-	/* Device causes system crash if in D3 during S3 sleep */
+-	PCI_DEV_FLAGS_NO_D3_DURING_SLEEP = (__force pci_dev_flags_t) 8,
+ };
+ 
+ enum pci_irq_reroute_variant {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0038-memory-hotplug-fix-invalid-memory-access-caused-by-s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0038-memory-hotplug-fix-invalid-memory-access-caused-by-s.patch
new file mode 100644
index 0000000..5d3cef2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0038-memory-hotplug-fix-invalid-memory-access-caused-by-s.patch
@@ -0,0 +1,114 @@
+From c9a4beeb70f62ec5976dcbb9086683fda56d6aec Mon Sep 17 00:00:00 2001
+From: Jiang Liu <jiang.liu@huawei.com>
+Date: Wed, 11 Jul 2012 14:01:52 -0700
+Subject: [PATCH 038/109] memory hotplug: fix invalid memory access caused by
+ stale kswapd pointer
+
+commit d8adde17e5f858427504725218c56aef90e90fc7 upstream.
+
+kswapd_stop() is called to destroy the kswapd work thread when all memory
+of a NUMA node has been offlined.  But kswapd_stop() only terminates the
+work thread without resetting NODE_DATA(nid)->kswapd to NULL.  The stale
+pointer will prevent kswapd_run() from creating a new work thread when
+adding memory to the memory-less NUMA node again.  Eventually the stale
+pointer may cause invalid memory access.
+
+An example stack dump as below. It's reproduced with 2.6.32, but latest
+kernel has the same issue.
+
+  BUG: unable to handle kernel NULL pointer dereference at (null)
+  IP: [<ffffffff81051a94>] exit_creds+0x12/0x78
+  PGD 0
+  Oops: 0000 [#1] SMP
+  last sysfs file: /sys/devices/system/memory/memory391/state
+  CPU 11
+  Modules linked in: cpufreq_conservative cpufreq_userspace cpufreq_powersave acpi_cpufreq microcode fuse loop dm_mod tpm_tis rtc_cmos i2c_i801 rtc_core tpm serio_raw pcspkr sg tpm_bios igb i2c_core iTCO_wdt rtc_lib mptctl iTCO_vendor_support button dca bnx2 usbhid hid uhci_hcd ehci_hcd usbcore sd_mod crc_t10dif edd ext3 mbcache jbd fan ide_pci_generic ide_core ata_generic ata_piix libata thermal processor thermal_sys hwmon mptsas mptscsih mptbase scsi_transport_sas scsi_mod
+  Pid: 7949, comm: sh Not tainted 2.6.32.12-qiuxishi-5-default #92 Tecal RH2285
+  RIP: 0010:exit_creds+0x12/0x78
+  RSP: 0018:ffff8806044f1d78  EFLAGS: 00010202
+  RAX: 0000000000000000 RBX: ffff880604f22140 RCX: 0000000000019502
+  RDX: 0000000000000000 RSI: 0000000000000202 RDI: 0000000000000000
+  RBP: ffff880604f22150 R08: 0000000000000000 R09: ffffffff81a4dc10
+  R10: 00000000000032a0 R11: ffff880006202500 R12: 0000000000000000
+  R13: 0000000000c40000 R14: 0000000000008000 R15: 0000000000000001
+  FS:  00007fbc03d066f0(0000) GS:ffff8800282e0000(0000) knlGS:0000000000000000
+  CS:  0010 DS: 0000 ES: 0000 CR0: 000000008005003b
+  CR2: 0000000000000000 CR3: 000000060f029000 CR4: 00000000000006e0
+  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
+  DR3: 0000000000000000 DR6: 00000000ffff0ff0 DR7: 0000000000000400
+  Process sh (pid: 7949, threadinfo ffff8806044f0000, task ffff880603d7c600)
+  Stack:
+   ffff880604f22140 ffffffff8103aac5 ffff880604f22140 ffffffff8104d21e
+   ffff880006202500 0000000000008000 0000000000c38000 ffffffff810bd5b1
+   0000000000000000 ffff880603d7c600 00000000ffffdd29 0000000000000003
+  Call Trace:
+    __put_task_struct+0x5d/0x97
+    kthread_stop+0x50/0x58
+    offline_pages+0x324/0x3da
+    memory_block_change_state+0x179/0x1db
+    store_mem_state+0x9e/0xbb
+    sysfs_write_file+0xd0/0x107
+    vfs_write+0xad/0x169
+    sys_write+0x45/0x6e
+    system_call_fastpath+0x16/0x1b
+  Code: ff 4d 00 0f 94 c0 84 c0 74 08 48 89 ef e8 1f fd ff ff 5b 5d 31 c0 41 5c c3 53 48 8b 87 20 06 00 00 48 89 fb 48 8b bf 18 06 00 00 <8b> 00 48 c7 83 18 06 00 00 00 00 00 00 f0 ff 0f 0f 94 c0 84 c0
+  RIP  exit_creds+0x12/0x78
+   RSP <ffff8806044f1d78>
+  CR2: 0000000000000000
+
+[akpm@linux-foundation.org: add pglist_data.kswapd locking comments]
+Signed-off-by: Xishi Qiu <qiuxishi@huawei.com>
+Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
+Acked-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Acked-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
+Acked-by: Mel Gorman <mgorman@suse.de>
+Acked-by: David Rientjes <rientjes@google.com>
+Reviewed-by: Minchan Kim <minchan@kernel.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/mmzone.h |    2 +-
+ mm/vmscan.c            |    7 +++++--
+ 2 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
+index 188cb2f..905b1e1 100644
+--- a/include/linux/mmzone.h
++++ b/include/linux/mmzone.h
+@@ -652,7 +652,7 @@ typedef struct pglist_data {
+ 					     range, including holes */
+ 	int node_id;
+ 	wait_queue_head_t kswapd_wait;
+-	struct task_struct *kswapd;
++	struct task_struct *kswapd;	/* Protected by lock_memory_hotplug() */
+ 	int kswapd_max_order;
+ 	enum zone_type classzone_idx;
+ } pg_data_t;
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index fbe2d2c..72cf498 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -3090,14 +3090,17 @@ int kswapd_run(int nid)
+ }
+ 
+ /*
+- * Called by memory hotplug when all memory in a node is offlined.
++ * Called by memory hotplug when all memory in a node is offlined.  Caller must
++ * hold lock_memory_hotplug().
+  */
+ void kswapd_stop(int nid)
+ {
+ 	struct task_struct *kswapd = NODE_DATA(nid)->kswapd;
+ 
+-	if (kswapd)
++	if (kswapd) {
+ 		kthread_stop(kswapd);
++		NODE_DATA(nid)->kswapd = NULL;
++	}
+ }
+ 
+ static int __init kswapd_init(void)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0039-ocfs2-fix-NULL-pointer-dereference-in-__ocfs2_change.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0039-ocfs2-fix-NULL-pointer-dereference-in-__ocfs2_change.patch
new file mode 100644
index 0000000..64d18e2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0039-ocfs2-fix-NULL-pointer-dereference-in-__ocfs2_change.patch
@@ -0,0 +1,43 @@
+From 827be17f16d9325db1c05f012ceab345139f7cad Mon Sep 17 00:00:00 2001
+From: Luis Henriques <luis.henriques@canonical.com>
+Date: Wed, 11 Jul 2012 14:02:10 -0700
+Subject: [PATCH 039/109] ocfs2: fix NULL pointer dereference in
+ __ocfs2_change_file_space()
+
+commit a4e08d001f2e50bb8b3c4eebadcf08e5535f02ee upstream.
+
+As ocfs2_fallocate() will invoke __ocfs2_change_file_space() with a NULL
+as the first parameter (file), it may trigger a NULL pointer dereferrence
+due to a missing check.
+
+Addresses http://bugs.launchpad.net/bugs/1006012
+
+Signed-off-by: Luis Henriques <luis.henriques@canonical.com>
+Reported-by: Bret Towe <magnade@gmail.com>
+Tested-by: Bret Towe <magnade@gmail.com>
+Cc: Sunil Mushran <sunil.mushran@oracle.com>
+Acked-by: Joel Becker <jlbec@evilplan.org>
+Acked-by: Mark Fasheh <mfasheh@suse.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ocfs2/file.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/ocfs2/file.c b/fs/ocfs2/file.c
+index 07ee5b4..1c7d45e 100644
+--- a/fs/ocfs2/file.c
++++ b/fs/ocfs2/file.c
+@@ -1950,7 +1950,7 @@ static int __ocfs2_change_file_space(struct file *file, struct inode *inode,
+ 	if (ret < 0)
+ 		mlog_errno(ret);
+ 
+-	if (file->f_flags & O_SYNC)
++	if (file && (file->f_flags & O_SYNC))
+ 		handle->h_sync = 1;
+ 
+ 	ocfs2_commit_trans(osb, handle);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0040-mm-thp-abort-compaction-if-migration-page-cannot-be-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0040-mm-thp-abort-compaction-if-migration-page-cannot-be-.patch
new file mode 100644
index 0000000..74ca9bf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0040-mm-thp-abort-compaction-if-migration-page-cannot-be-.patch
@@ -0,0 +1,53 @@
+From 6a918e81eb228757f20a244ee0d81c32ba7feedc Mon Sep 17 00:00:00 2001
+From: David Rientjes <rientjes@google.com>
+Date: Wed, 11 Jul 2012 14:02:13 -0700
+Subject: [PATCH 040/109] mm, thp: abort compaction if migration page cannot
+ be charged to memcg
+
+commit 4bf2bba3750f10aa9e62e6949bc7e8329990f01b upstream.
+
+If page migration cannot charge the temporary page to the memcg,
+migrate_pages() will return -ENOMEM.  This isn't considered in memory
+compaction however, and the loop continues to iterate over all
+pageblocks trying to isolate and migrate pages.  If a small number of
+very large memcgs happen to be oom, however, these attempts will mostly
+be futile leading to an enormous amout of cpu consumption due to the
+page migration failures.
+
+This patch will short circuit and fail memory compaction if
+migrate_pages() returns -ENOMEM.  COMPACT_PARTIAL is returned in case
+some migrations were successful so that the page allocator will retry.
+
+Signed-off-by: David Rientjes <rientjes@google.com>
+Acked-by: Mel Gorman <mgorman@suse.de>
+Cc: Minchan Kim <minchan@kernel.org>
+Cc: Kamezawa Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Rik van Riel <riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/compaction.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/mm/compaction.c b/mm/compaction.c
+index 8fb8a40..50f1c60 100644
+--- a/mm/compaction.c
++++ b/mm/compaction.c
+@@ -592,8 +592,11 @@ static int compact_zone(struct zone *zone, struct compact_control *cc)
+ 		if (err) {
+ 			putback_lru_pages(&cc->migratepages);
+ 			cc->nr_migratepages = 0;
++			if (err == -ENOMEM) {
++				ret = COMPACT_PARTIAL;
++				goto out;
++			}
+ 		}
+-
+ 	}
+ 
+ out:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0041-drivers-rtc-rtc-mxc.c-fix-irq-enabled-interrupts-war.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0041-drivers-rtc-rtc-mxc.c-fix-irq-enabled-interrupts-war.patch
new file mode 100644
index 0000000..0df7b6e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0041-drivers-rtc-rtc-mxc.c-fix-irq-enabled-interrupts-war.patch
@@ -0,0 +1,74 @@
+From 810c142eafb17318d32209a727060a756a57235d Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?=
+ <benoit.thebaudeau@advansee.com>
+Date: Wed, 11 Jul 2012 14:02:32 -0700
+Subject: [PATCH 041/109] drivers/rtc/rtc-mxc.c: fix irq enabled interrupts
+ warning
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit b59f6d1febd6cbe9fae4589bf72da0ed32bc69e0 upstream.
+
+Fixes
+
+  WARNING: at irq/handle.c:146 handle_irq_event_percpu+0x19c/0x1b8()
+  irq 25 handler mxc_rtc_interrupt+0x0/0xac enabled interrupts
+  Modules linked in:
+   (unwind_backtrace+0x0/0xf0) from (warn_slowpath_common+0x4c/0x64)
+   (warn_slowpath_common+0x4c/0x64) from (warn_slowpath_fmt+0x30/0x40)
+   (warn_slowpath_fmt+0x30/0x40) from (handle_irq_event_percpu+0x19c/0x1b8)
+   (handle_irq_event_percpu+0x19c/0x1b8) from (handle_irq_event+0x28/0x38)
+   (handle_irq_event+0x28/0x38) from (handle_level_irq+0x80/0xc4)
+   (handle_level_irq+0x80/0xc4) from (generic_handle_irq+0x24/0x38)
+   (generic_handle_irq+0x24/0x38) from (handle_IRQ+0x30/0x84)
+   (handle_IRQ+0x30/0x84) from (avic_handle_irq+0x2c/0x4c)
+   (avic_handle_irq+0x2c/0x4c) from (__irq_svc+0x40/0x60)
+  Exception stack(0xc050bf60 to 0xc050bfa8)
+  bf60: 00000001 00000000 003c4208 c0018e20 c050a000 c050a000 c054a4c8 c050a000
+  bf80: c05157a8 4117b363 80503bb4 00000000 01000000 c050bfa8 c0018e2c c000e808
+  bfa0: 60000013 ffffffff
+   (__irq_svc+0x40/0x60) from (default_idle+0x1c/0x30)
+   (default_idle+0x1c/0x30) from (cpu_idle+0x68/0xa8)
+   (cpu_idle+0x68/0xa8) from (start_kernel+0x22c/0x26c)
+
+Signed-off-by: Benoît Thébaudeau <benoit.thebaudeau@advansee.com>
+Cc: Alessandro Zummo <a.zummo@towertech.it>
+Cc: Sascha Hauer <kernel@pengutronix.de>
+Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/rtc/rtc-mxc.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/rtc/rtc-mxc.c b/drivers/rtc/rtc-mxc.c
+index 39e41fb..5160354 100644
+--- a/drivers/rtc/rtc-mxc.c
++++ b/drivers/rtc/rtc-mxc.c
+@@ -191,10 +191,11 @@ static irqreturn_t mxc_rtc_interrupt(int irq, void *dev_id)
+ 	struct platform_device *pdev = dev_id;
+ 	struct rtc_plat_data *pdata = platform_get_drvdata(pdev);
+ 	void __iomem *ioaddr = pdata->ioaddr;
++	unsigned long flags;
+ 	u32 status;
+ 	u32 events = 0;
+ 
+-	spin_lock_irq(&pdata->rtc->irq_lock);
++	spin_lock_irqsave(&pdata->rtc->irq_lock, flags);
+ 	status = readw(ioaddr + RTC_RTCISR) & readw(ioaddr + RTC_RTCIENR);
+ 	/* clear interrupt sources */
+ 	writew(status, ioaddr + RTC_RTCISR);
+@@ -217,7 +218,7 @@ static irqreturn_t mxc_rtc_interrupt(int irq, void *dev_id)
+ 		rtc_update_alarm(&pdev->dev, &pdata->g_rtc_alarm);
+ 
+ 	rtc_update_irq(pdata->rtc, 1, events);
+-	spin_unlock_irq(&pdata->rtc->irq_lock);
++	spin_unlock_irqrestore(&pdata->rtc->irq_lock, flags);
+ 
+ 	return IRQ_HANDLED;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0042-fs-ramfs-file-nommu-add-SetPageUptodate.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0042-fs-ramfs-file-nommu-add-SetPageUptodate.patch
new file mode 100644
index 0000000..89f0fea
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0042-fs-ramfs-file-nommu-add-SetPageUptodate.patch
@@ -0,0 +1,49 @@
+From e3b50d463ce69af9fb5b2d4a54e6c37637c2ecef Mon Sep 17 00:00:00 2001
+From: Bob Liu <lliubbo@gmail.com>
+Date: Wed, 11 Jul 2012 14:02:35 -0700
+Subject: [PATCH 042/109] fs: ramfs: file-nommu: add SetPageUptodate()
+
+commit fea9f718b3d68147f162ed2d870183ce5e0ad8d8 upstream.
+
+There is a bug in the below scenario for !CONFIG_MMU:
+
+ 1. create a new file
+ 2. mmap the file and write to it
+ 3. read the file can't get the correct value
+
+Because
+
+  sys_read() -> generic_file_aio_read() -> simple_readpage() -> clear_page()
+
+which causes the page to be zeroed.
+
+Add SetPageUptodate() to ramfs_nommu_expand_for_mapping() so that
+generic_file_aio_read() do not call simple_readpage().
+
+Signed-off-by: Bob Liu <lliubbo@gmail.com>
+Cc: Hugh Dickins <hughd@google.com>
+Cc: David Howells <dhowells@redhat.com>
+Cc: Geert Uytterhoeven <geert@linux-m68k.org>
+Cc: Greg Ungerer <gerg@uclinux.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ramfs/file-nommu.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/fs/ramfs/file-nommu.c b/fs/ramfs/file-nommu.c
+index fbb0b47..d5378d0 100644
+--- a/fs/ramfs/file-nommu.c
++++ b/fs/ramfs/file-nommu.c
+@@ -110,6 +110,7 @@ int ramfs_nommu_expand_for_mapping(struct inode *inode, size_t newsize)
+ 
+ 		/* prevent the page from being discarded on memory pressure */
+ 		SetPageDirty(page);
++		SetPageUptodate(page);
+ 
+ 		unlock_page(page);
+ 		put_page(page);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0043-cpufreq-ACPI-Fix-not-loading-acpi-cpufreq-driver-reg.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0043-cpufreq-ACPI-Fix-not-loading-acpi-cpufreq-driver-reg.patch
new file mode 100644
index 0000000..21c973d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0043-cpufreq-ACPI-Fix-not-loading-acpi-cpufreq-driver-reg.patch
@@ -0,0 +1,53 @@
+From 8d63c0484f5ed79f498c5bf3e5b90de29555bcb7 Mon Sep 17 00:00:00 2001
+From: Thomas Renninger <trenn@suse.de>
+Date: Thu, 12 Jul 2012 12:24:33 +0200
+Subject: [PATCH 043/109] cpufreq / ACPI: Fix not loading acpi-cpufreq driver
+ regression
+
+commit c4686c71a9183f76e3ef59098da5c098748672f6 upstream.
+
+Commit d640113fe80e45ebd4a5b420b introduced a regression on SMP
+systems where the processor core with ACPI id zero is disabled
+(typically should be the case because of hyperthreading).
+The regression got spread through stable kernels.
+On 3.0.X it got introduced via 3.0.18.
+
+Such platforms may be rare, but do exist.
+Look out for a disabled processor with acpi_id 0 in dmesg:
+ACPI: LAPIC (acpi_id[0x00] lapic_id[0x10] disabled)
+
+This problem has been observed on a:
+HP Proliant BL280c G6 blade
+
+This patch restricts the introduced workaround to platforms
+with nr_cpu_ids <= 1.
+
+Signed-off-by: Thomas Renninger <trenn@suse.de>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/acpi/processor_core.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/acpi/processor_core.c b/drivers/acpi/processor_core.c
+index c850de4..eff7222 100644
+--- a/drivers/acpi/processor_core.c
++++ b/drivers/acpi/processor_core.c
+@@ -189,10 +189,12 @@ int acpi_get_cpuid(acpi_handle handle, int type, u32 acpi_id)
+ 		 *     Processor (CPU3, 0x03, 0x00000410, 0x06) {}
+ 		 * }
+ 		 *
+-		 * Ignores apic_id and always return 0 for CPU0's handle.
++		 * Ignores apic_id and always returns 0 for the processor
++		 * handle with acpi id 0 if nr_cpu_ids is 1.
++		 * This should be the case if SMP tables are not found.
+ 		 * Return -1 for other CPU's handle.
+ 		 */
+-		if (acpi_id == 0)
++		if (nr_cpu_ids <= 1 && acpi_id == 0)
+ 			return acpi_id;
+ 		else
+ 			return apic_id;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0044-hwmon-it87-Preserve-configuration-register-bits-on-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0044-hwmon-it87-Preserve-configuration-register-bits-on-i.patch
new file mode 100644
index 0000000..f7d45cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0044-hwmon-it87-Preserve-configuration-register-bits-on-i.patch
@@ -0,0 +1,37 @@
+From 9b12ab6f8a8a5859e0165b3510dbecae16ca98e3 Mon Sep 17 00:00:00 2001
+From: Jean Delvare <khali@linux-fr.org>
+Date: Thu, 12 Jul 2012 22:47:37 +0200
+Subject: [PATCH 044/109] hwmon: (it87) Preserve configuration register bits
+ on init
+
+commit 41002f8dd5938d5ad1d008ce5bfdbfe47fa7b4e8 upstream.
+
+We were accidentally losing one bit in the configuration register on
+device initialization. It was reported to freeze one specific system
+right away. Properly preserve all bits we don't explicitly want to
+change in order to prevent that.
+
+Reported-by: Stevie Trujillo <stevie.trujillo@gmail.com>
+Signed-off-by: Jean Delvare <khali@linux-fr.org>
+Reviewed-by: Guenter Roeck <linux@roeck-us.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/hwmon/it87.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
+index d912649..1ba7af2 100644
+--- a/drivers/hwmon/it87.c
++++ b/drivers/hwmon/it87.c
+@@ -2086,7 +2086,7 @@ static void __devinit it87_init_device(struct platform_device *pdev)
+ 
+ 	/* Start monitoring */
+ 	it87_write_value(data, IT87_REG_CONFIG,
+-			 (it87_read_value(data, IT87_REG_CONFIG) & 0x36)
++			 (it87_read_value(data, IT87_REG_CONFIG) & 0x3e)
+ 			 | (update_vbat ? 0x41 : 0x01));
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0045-ARM-SAMSUNG-fix-race-in-s3c_adc_start-for-ADC.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0045-ARM-SAMSUNG-fix-race-in-s3c_adc_start-for-ADC.patch
new file mode 100644
index 0000000..be44eb3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0045-ARM-SAMSUNG-fix-race-in-s3c_adc_start-for-ADC.patch
@@ -0,0 +1,42 @@
+From 81b7824449f04aec76681f7723b0f7911ad66f11 Mon Sep 17 00:00:00 2001
+From: Todd Poynor <toddpoynor@google.com>
+Date: Fri, 13 Jul 2012 15:30:48 +0900
+Subject: [PATCH 045/109] ARM: SAMSUNG: fix race in s3c_adc_start for ADC
+
+commit 8265981bb439f3ecc5356fb877a6c2a6636ac88a upstream.
+
+Checking for adc->ts_pend already claimed should be done with the
+lock held.
+
+Signed-off-by: Todd Poynor <toddpoynor@google.com>
+Acked-by: Ben Dooks <ben-linux@fluff.org>
+Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/arm/plat-samsung/adc.c |    8 +++++---
+ 1 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
+index 33ecd0c..b1e05cc 100644
+--- a/arch/arm/plat-samsung/adc.c
++++ b/arch/arm/plat-samsung/adc.c
+@@ -157,11 +157,13 @@ int s3c_adc_start(struct s3c_adc_client *client,
+ 		return -EINVAL;
+ 	}
+ 
+-	if (client->is_ts && adc->ts_pend)
+-		return -EAGAIN;
+-
+ 	spin_lock_irqsave(&adc->lock, flags);
+ 
++	if (client->is_ts && adc->ts_pend) {
++		spin_unlock_irqrestore(&adc->lock, flags);
++		return -EAGAIN;
++	}
++
+ 	client->channel = channel;
+ 	client->nr_samples = nr_samples;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0046-block-fix-infinite-loop-in-__getblk_slow.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0046-block-fix-infinite-loop-in-__getblk_slow.patch
new file mode 100644
index 0000000..6c5d9b8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0046-block-fix-infinite-loop-in-__getblk_slow.patch
@@ -0,0 +1,116 @@
+From 898f4d272514d19aafee8cd66b796c0553fca080 Mon Sep 17 00:00:00 2001
+From: Jeff Moyer <jmoyer@redhat.com>
+Date: Thu, 12 Jul 2012 09:43:14 -0400
+Subject: [PATCH 046/109] block: fix infinite loop in __getblk_slow
+
+commit 91f68c89d8f35fe98ea04159b9a3b42d0149478f upstream.
+
+Commit 080399aaaf35 ("block: don't mark buffers beyond end of disk as
+mapped") exposed a bug in __getblk_slow that causes mount to hang as it
+loops infinitely waiting for a buffer that lies beyond the end of the
+disk to become uptodate.
+
+The problem was initially reported by Torsten Hilbrich here:
+
+    https://lkml.org/lkml/2012/6/18/54
+
+and also reported independently here:
+
+    http://www.sysresccd.org/forums/viewtopic.php?f=13&t=4511
+
+and then Richard W.M.  Jones and Marcos Mello noted a few separate
+bugzillas also associated with the same issue.  This patch has been
+confirmed to fix:
+
+    https://bugzilla.redhat.com/show_bug.cgi?id=835019
+
+The main problem is here, in __getblk_slow:
+
+        for (;;) {
+                struct buffer_head * bh;
+                int ret;
+
+                bh = __find_get_block(bdev, block, size);
+                if (bh)
+                        return bh;
+
+                ret = grow_buffers(bdev, block, size);
+                if (ret < 0)
+                        return NULL;
+                if (ret == 0)
+                        free_more_memory();
+        }
+
+__find_get_block does not find the block, since it will not be marked as
+mapped, and so grow_buffers is called to fill in the buffers for the
+associated page.  I believe the for (;;) loop is there primarily to
+retry in the case of memory pressure keeping grow_buffers from
+succeeding.  However, we also continue to loop for other cases, like the
+block lying beond the end of the disk.  So, the fix I came up with is to
+only loop when grow_buffers fails due to memory allocation issues
+(return value of 0).
+
+The attached patch was tested by myself, Torsten, and Rich, and was
+found to resolve the problem in call cases.
+
+Signed-off-by: Jeff Moyer <jmoyer@redhat.com>
+Reported-and-Tested-by: Torsten Hilbrich <torsten.hilbrich@secunet.com>
+Tested-by: Richard W.M. Jones <rjones@redhat.com>
+Reviewed-by: Josh Boyer <jwboyer@redhat.com>
+[ Jens is on vacation, taking this directly  - Linus ]
+--
+Stable Notes: this patch requires backport to 3.0, 3.2 and 3.3.
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/buffer.c |   22 +++++++++++++---------
+ 1 files changed, 13 insertions(+), 9 deletions(-)
+
+diff --git a/fs/buffer.c b/fs/buffer.c
+index c807931..4115eca 100644
+--- a/fs/buffer.c
++++ b/fs/buffer.c
+@@ -1087,6 +1087,9 @@ grow_buffers(struct block_device *bdev, sector_t block, int size)
+ static struct buffer_head *
+ __getblk_slow(struct block_device *bdev, sector_t block, int size)
+ {
++	int ret;
++	struct buffer_head *bh;
++
+ 	/* Size must be multiple of hard sectorsize */
+ 	if (unlikely(size & (bdev_logical_block_size(bdev)-1) ||
+ 			(size < 512 || size > PAGE_SIZE))) {
+@@ -1099,20 +1102,21 @@ __getblk_slow(struct block_device *bdev, sector_t block, int size)
+ 		return NULL;
+ 	}
+ 
+-	for (;;) {
+-		struct buffer_head * bh;
+-		int ret;
++retry:
++	bh = __find_get_block(bdev, block, size);
++	if (bh)
++		return bh;
+ 
++	ret = grow_buffers(bdev, block, size);
++	if (ret == 0) {
++		free_more_memory();
++		goto retry;
++	} else if (ret > 0) {
+ 		bh = __find_get_block(bdev, block, size);
+ 		if (bh)
+ 			return bh;
+-
+-		ret = grow_buffers(bdev, block, size);
+-		if (ret < 0)
+-			return NULL;
+-		if (ret == 0)
+-			free_more_memory();
+ 	}
++	return NULL;
+ }
+ 
+ /*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0047-Remove-easily-user-triggerable-BUG-from-generic_setl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0047-Remove-easily-user-triggerable-BUG-from-generic_setl.patch
new file mode 100644
index 0000000..8747220
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0047-Remove-easily-user-triggerable-BUG-from-generic_setl.patch
@@ -0,0 +1,42 @@
+From 51b23c5c8a3aacf16acf8b723c35a23c07c37115 Mon Sep 17 00:00:00 2001
+From: Dave Jones <davej@redhat.com>
+Date: Fri, 13 Jul 2012 13:35:36 -0400
+Subject: [PATCH 047/109] Remove easily user-triggerable BUG from
+ generic_setlease
+
+commit 8d657eb3b43861064d36241e88d9d61c709f33f0 upstream.
+
+This can be trivially triggered from userspace by passing in something unexpected.
+
+    kernel BUG at fs/locks.c:1468!
+    invalid opcode: 0000 [#1] SMP
+    RIP: 0010:generic_setlease+0xc2/0x100
+    Call Trace:
+      __vfs_setlease+0x35/0x40
+      fcntl_setlease+0x76/0x150
+      sys_fcntl+0x1c6/0x810
+      system_call_fastpath+0x1a/0x1f
+
+Signed-off-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/locks.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/locks.c b/fs/locks.c
+index 0d68f1f..6a64f15 100644
+--- a/fs/locks.c
++++ b/fs/locks.c
+@@ -1465,7 +1465,7 @@ int generic_setlease(struct file *filp, long arg, struct file_lock **flp)
+ 	case F_WRLCK:
+ 		return generic_add_lease(filp, arg, flp);
+ 	default:
+-		BUG();
++		return -EINVAL;
+ 	}
+ }
+ EXPORT_SYMBOL(generic_setlease);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0048-NFC-Export-nfc.h-to-userland.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0048-NFC-Export-nfc.h-to-userland.patch
new file mode 100644
index 0000000..90d6d7b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0048-NFC-Export-nfc.h-to-userland.patch
@@ -0,0 +1,32 @@
+From 8750544d6522f38e7f5722ee263d0f95941c9bd8 Mon Sep 17 00:00:00 2001
+From: Samuel Ortiz <sameo@linux.intel.com>
+Date: Thu, 10 May 2012 19:45:51 +0200
+Subject: [PATCH 048/109] NFC: Export nfc.h to userland
+
+commit dbd4fcaf8d664fab4163b1f8682e41ad8bff3444 upstream.
+
+The netlink commands and attributes, along with the socket structure
+definitions need to be exported.
+
+Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/Kbuild |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/Kbuild b/include/linux/Kbuild
+index bd21ecd..a3ce901 100644
+--- a/include/linux/Kbuild
++++ b/include/linux/Kbuild
+@@ -268,6 +268,7 @@ header-y += netfilter_ipv4.h
+ header-y += netfilter_ipv6.h
+ header-y += netlink.h
+ header-y += netrom.h
++header-y += nfc.h
+ header-y += nfs.h
+ header-y += nfs2.h
+ header-y += nfs3.h
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0049-PM-Hibernate-Hibernate-thaw-fixes-improvements.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0049-PM-Hibernate-Hibernate-thaw-fixes-improvements.patch
new file mode 100644
index 0000000..b0b708b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0049-PM-Hibernate-Hibernate-thaw-fixes-improvements.patch
@@ -0,0 +1,178 @@
+From b6807062ada796cdfde2c0f5ca59390b0c916aae Mon Sep 17 00:00:00 2001
+From: Bojan Smojver <bojan@rexursive.com>
+Date: Sun, 29 Apr 2012 22:42:06 +0200
+Subject: [PATCH 049/109] PM / Hibernate: Hibernate/thaw fixes/improvements
+
+commit 5a21d489fd9541a4a66b9a500659abaca1b19a51 upstream.
+
+ 1. Do not allocate memory for buffers from emergency pools, unless
+    absolutely required. Do not warn about and do not retry non-essential
+    failed allocations.
+
+ 2. Do not check the amount of free pages left on every single page
+    write, but wait until one map is completely populated and then check.
+
+ 3. Set maximum number of pages for read buffering consistently, instead
+    of inadvertently depending on the size of the sector type.
+
+ 4. Fix copyright line, which I missed when I submitted the hibernation
+    threading patch.
+
+ 5. Dispense with bit shifting arithmetic to improve readability.
+
+ 6. Really recalculate the number of pages required to be free after all
+    allocations have been done.
+
+ 7. Fix calculation of pages required for read buffering. Only count in
+    pages that do not belong to high memory.
+
+Signed-off-by: Bojan Smojver <bojan@rexursive.com>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/power/swap.c |   62 ++++++++++++++++++++++++++++++++-------------------
+ 1 files changed, 39 insertions(+), 23 deletions(-)
+
+diff --git a/kernel/power/swap.c b/kernel/power/swap.c
+index b313086..64f8f97 100644
+--- a/kernel/power/swap.c
++++ b/kernel/power/swap.c
+@@ -6,7 +6,7 @@
+  *
+  * Copyright (C) 1998,2001-2005 Pavel Machek <pavel@ucw.cz>
+  * Copyright (C) 2006 Rafael J. Wysocki <rjw@sisk.pl>
+- * Copyright (C) 2010 Bojan Smojver <bojan@rexursive.com>
++ * Copyright (C) 2010-2012 Bojan Smojver <bojan@rexursive.com>
+  *
+  * This file is released under the GPLv2.
+  *
+@@ -283,14 +283,17 @@ static int write_page(void *buf, sector_t offset, struct bio **bio_chain)
+ 		return -ENOSPC;
+ 
+ 	if (bio_chain) {
+-		src = (void *)__get_free_page(__GFP_WAIT | __GFP_HIGH);
++		src = (void *)__get_free_page(__GFP_WAIT | __GFP_NOWARN |
++		                              __GFP_NORETRY);
+ 		if (src) {
+ 			copy_page(src, buf);
+ 		} else {
+ 			ret = hib_wait_on_bio_chain(bio_chain); /* Free pages */
+ 			if (ret)
+ 				return ret;
+-			src = (void *)__get_free_page(__GFP_WAIT | __GFP_HIGH);
++			src = (void *)__get_free_page(__GFP_WAIT |
++			                              __GFP_NOWARN |
++			                              __GFP_NORETRY);
+ 			if (src) {
+ 				copy_page(src, buf);
+ 			} else {
+@@ -368,12 +371,17 @@ static int swap_write_page(struct swap_map_handle *handle, void *buf,
+ 		clear_page(handle->cur);
+ 		handle->cur_swap = offset;
+ 		handle->k = 0;
+-	}
+-	if (bio_chain && low_free_pages() <= handle->reqd_free_pages) {
+-		error = hib_wait_on_bio_chain(bio_chain);
+-		if (error)
+-			goto out;
+-		handle->reqd_free_pages = reqd_free_pages();
++
++		if (bio_chain && low_free_pages() <= handle->reqd_free_pages) {
++			error = hib_wait_on_bio_chain(bio_chain);
++			if (error)
++				goto out;
++			/*
++			 * Recalculate the number of required free pages, to
++			 * make sure we never take more than half.
++			 */
++			handle->reqd_free_pages = reqd_free_pages();
++		}
+ 	}
+  out:
+ 	return error;
+@@ -420,8 +428,9 @@ static int swap_writer_finish(struct swap_map_handle *handle,
+ /* Maximum number of threads for compression/decompression. */
+ #define LZO_THREADS	3
+ 
+-/* Maximum number of pages for read buffering. */
+-#define LZO_READ_PAGES	(MAP_PAGE_ENTRIES * 8)
++/* Minimum/maximum number of pages for read buffering. */
++#define LZO_MIN_RD_PAGES	1024
++#define LZO_MAX_RD_PAGES	8192
+ 
+ 
+ /**
+@@ -632,12 +641,6 @@ static int save_image_lzo(struct swap_map_handle *handle,
+ 	}
+ 
+ 	/*
+-	 * Adjust number of free pages after all allocations have been done.
+-	 * We don't want to run out of pages when writing.
+-	 */
+-	handle->reqd_free_pages = reqd_free_pages();
+-
+-	/*
+ 	 * Start the CRC32 thread.
+ 	 */
+ 	init_waitqueue_head(&crc->go);
+@@ -658,6 +661,12 @@ static int save_image_lzo(struct swap_map_handle *handle,
+ 		goto out_clean;
+ 	}
+ 
++	/*
++	 * Adjust the number of required free pages after all allocations have
++	 * been done. We don't want to run out of pages when writing.
++	 */
++	handle->reqd_free_pages = reqd_free_pages();
++
+ 	printk(KERN_INFO
+ 		"PM: Using %u thread(s) for compression.\n"
+ 		"PM: Compressing and saving image data (%u pages) ...     ",
+@@ -1067,7 +1076,7 @@ static int load_image_lzo(struct swap_map_handle *handle,
+ 	unsigned i, thr, run_threads, nr_threads;
+ 	unsigned ring = 0, pg = 0, ring_size = 0,
+ 	         have = 0, want, need, asked = 0;
+-	unsigned long read_pages;
++	unsigned long read_pages = 0;
+ 	unsigned char **page = NULL;
+ 	struct dec_data *data = NULL;
+ 	struct crc_data *crc = NULL;
+@@ -1079,7 +1088,7 @@ static int load_image_lzo(struct swap_map_handle *handle,
+ 	nr_threads = num_online_cpus() - 1;
+ 	nr_threads = clamp_val(nr_threads, 1, LZO_THREADS);
+ 
+-	page = vmalloc(sizeof(*page) * LZO_READ_PAGES);
++	page = vmalloc(sizeof(*page) * LZO_MAX_RD_PAGES);
+ 	if (!page) {
+ 		printk(KERN_ERR "PM: Failed to allocate LZO page\n");
+ 		ret = -ENOMEM;
+@@ -1144,15 +1153,22 @@ static int load_image_lzo(struct swap_map_handle *handle,
+ 	}
+ 
+ 	/*
+-	 * Adjust number of pages for read buffering, in case we are short.
++	 * Set the number of pages for read buffering.
++	 * This is complete guesswork, because we'll only know the real
++	 * picture once prepare_image() is called, which is much later on
++	 * during the image load phase. We'll assume the worst case and
++	 * say that none of the image pages are from high memory.
+ 	 */
+-	read_pages = (nr_free_pages() - snapshot_get_image_size()) >> 1;
+-	read_pages = clamp_val(read_pages, LZO_CMP_PAGES, LZO_READ_PAGES);
++	if (low_free_pages() > snapshot_get_image_size())
++		read_pages = (low_free_pages() - snapshot_get_image_size()) / 2;
++	read_pages = clamp_val(read_pages, LZO_MIN_RD_PAGES, LZO_MAX_RD_PAGES);
+ 
+ 	for (i = 0; i < read_pages; i++) {
+ 		page[i] = (void *)__get_free_page(i < LZO_CMP_PAGES ?
+ 		                                  __GFP_WAIT | __GFP_HIGH :
+-		                                  __GFP_WAIT);
++		                                  __GFP_WAIT | __GFP_NOWARN |
++		                                  __GFP_NORETRY);
++
+ 		if (!page[i]) {
+ 			if (i < LZO_CMP_PAGES) {
+ 				ring_size = i;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0050-cfg80211-check-iface-combinations-only-when-iface-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0050-cfg80211-check-iface-combinations-only-when-iface-is.patch
new file mode 100644
index 0000000..c9a9c98
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0050-cfg80211-check-iface-combinations-only-when-iface-is.patch
@@ -0,0 +1,40 @@
+From c83354ed38bbb4ebfa25f954d825594453b160c1 Mon Sep 17 00:00:00 2001
+From: Michal Kazior <michal.kazior@tieto.com>
+Date: Fri, 8 Jun 2012 10:55:44 +0200
+Subject: [PATCH 050/109] cfg80211: check iface combinations only when iface
+ is running
+
+commit f8cdddb8d61d16a156229f0910f7ecfc7a82c003 upstream.
+
+Don't validate interface combinations on a stopped
+interface. Otherwise we might end up being able to
+create a new interface with a certain type, but
+won't be able to change an existing interface
+into that type.
+
+This also skips some other functions when
+interface is stopped and changing interface type.
+
+Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
+Signed-off-by: Johannes Berg <johannes.berg@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ net/wireless/util.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/net/wireless/util.c b/net/wireless/util.c
+index d38815d..74d5292 100644
+--- a/net/wireless/util.c
++++ b/net/wireless/util.c
+@@ -813,7 +813,7 @@ int cfg80211_change_iface(struct cfg80211_registered_device *rdev,
+ 	     ntype == NL80211_IFTYPE_P2P_CLIENT))
+ 		return -EBUSY;
+ 
+-	if (ntype != otype) {
++	if (ntype != otype && netif_running(dev)) {
+ 		err = cfg80211_can_change_interface(rdev, dev->ieee80211_ptr,
+ 						    ntype);
+ 		if (err)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0051-intel_ips-blacklist-HP-ProBook-laptops.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0051-intel_ips-blacklist-HP-ProBook-laptops.patch
new file mode 100644
index 0000000..d1c0f9b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0051-intel_ips-blacklist-HP-ProBook-laptops.patch
@@ -0,0 +1,70 @@
+From ea2ca0ebd427d4a745043e6e030619221fe9a55b Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 25 Jun 2012 15:07:17 +0200
+Subject: [PATCH 051/109] intel_ips: blacklist HP ProBook laptops
+
+commit 88ca518b0bb4161e5f20f8a1d9cc477cae294e54 upstream.
+
+intel_ips driver spews the warning message
+  "ME failed to update for more than 1s, likely hung"
+at each second endlessly on HP ProBook laptops with IronLake.
+
+As this has never worked, better to blacklist the driver for now.
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/platform/x86/intel_ips.c |   22 ++++++++++++++++++++++
+ 1 files changed, 22 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/platform/x86/intel_ips.c b/drivers/platform/x86/intel_ips.c
+index 809a3ae..b46ec11 100644
+--- a/drivers/platform/x86/intel_ips.c
++++ b/drivers/platform/x86/intel_ips.c
+@@ -72,6 +72,7 @@
+ #include <linux/string.h>
+ #include <linux/tick.h>
+ #include <linux/timer.h>
++#include <linux/dmi.h>
+ #include <drm/i915_drm.h>
+ #include <asm/msr.h>
+ #include <asm/processor.h>
+@@ -1505,6 +1506,24 @@ static DEFINE_PCI_DEVICE_TABLE(ips_id_table) = {
+ 
+ MODULE_DEVICE_TABLE(pci, ips_id_table);
+ 
++static int ips_blacklist_callback(const struct dmi_system_id *id)
++{
++	pr_info("Blacklisted intel_ips for %s\n", id->ident);
++	return 1;
++}
++
++static const struct dmi_system_id ips_blacklist[] = {
++	{
++		.callback = ips_blacklist_callback,
++		.ident = "HP ProBook",
++		.matches = {
++			DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
++			DMI_MATCH(DMI_PRODUCT_NAME, "HP ProBook"),
++		},
++	},
++	{ }	/* terminating entry */
++};
++
+ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
+ {
+ 	u64 platform_info;
+@@ -1514,6 +1533,9 @@ static int ips_probe(struct pci_dev *dev, const struct pci_device_id *id)
+ 	u16 htshi, trc, trc_required_mask;
+ 	u8 tse;
+ 
++	if (dmi_check_system(ips_blacklist))
++		return -ENODEV;
++
+ 	ips = kzalloc(sizeof(struct ips_driver), GFP_KERNEL);
+ 	if (!ips)
+ 		return -ENOMEM;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0052-atl1c-fix-issue-of-transmit-queue-0-timed-out.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0052-atl1c-fix-issue-of-transmit-queue-0-timed-out.patch
new file mode 100644
index 0000000..92f5a27
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0052-atl1c-fix-issue-of-transmit-queue-0-timed-out.patch
@@ -0,0 +1,42 @@
+From 0e6bee2eb164145946ea6ca49c4fd1e02c7177fa Mon Sep 17 00:00:00 2001
+From: Cloud Ren <cjren@qca.qualcomm.com>
+Date: Tue, 3 Jul 2012 16:51:48 +0000
+Subject: [PATCH 052/109] atl1c: fix issue of transmit queue 0 timed out
+
+commit b94e52f62683dc0b00c6d1b58b80929a078c0fd5 upstream.
+
+some people report atl1c could cause system hang with following
+kernel trace info:
+---------------------------------------
+WARNING: at.../net/sched/sch_generic.c:258 dev_watchdog+0x1db/0x1d0()
+...
+NETDEV WATCHDOG: eth0 (atl1c): transmit queue 0 timed out
+...
+---------------------------------------
+This is caused by netif_stop_queue calling when cable Link is down.
+So remove netif_stop_queue, because link_watch will take it over.
+
+Signed-off-by: xiong <xiong@qca.qualcomm.com>
+Signed-off-by: Cloud Ren <cjren@qca.qualcomm.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/atheros/atl1c/atl1c_main.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+index eccdcff..5ae7df7 100644
+--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
++++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+@@ -267,7 +267,6 @@ static void atl1c_check_link_status(struct atl1c_adapter *adapter)
+ 				dev_warn(&pdev->dev, "stop mac failed\n");
+ 		atl1c_set_aspm(hw, false);
+ 		netif_carrier_off(netdev);
+-		netif_stop_queue(netdev);
+ 		atl1c_phy_reset(hw);
+ 		atl1c_phy_init(&adapter->hw);
+ 	} else {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0053-rt2x00usb-fix-indexes-ordering-on-RX-queue-kick.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0053-rt2x00usb-fix-indexes-ordering-on-RX-queue-kick.patch
new file mode 100644
index 0000000..17d4e14
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0053-rt2x00usb-fix-indexes-ordering-on-RX-queue-kick.patch
@@ -0,0 +1,51 @@
+From 6b52d1306665e9da06ac76126a97888849dbf290 Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Wed, 4 Jul 2012 13:10:02 +0200
+Subject: [PATCH 053/109] rt2x00usb: fix indexes ordering on RX queue kick
+
+commit efd821182cec8c92babef6e00a95066d3252fda4 upstream.
+
+On rt2x00_dmastart() we increase index specified by Q_INDEX and on
+rt2x00_dmadone() we increase index specified by Q_INDEX_DONE. So entries
+between Q_INDEX_DONE and Q_INDEX are those we currently process in the
+hardware. Entries between Q_INDEX and Q_INDEX_DONE are those we can
+submit to the hardware.
+
+According to that fix rt2x00usb_kick_queue(), as we need to submit RX
+entries that are not processed by the hardware. It worked before only
+for empty queue, otherwise was broken.
+
+Note that for TX queues indexes ordering are ok. We need to kick entries
+that have filled skb, but was not submitted to the hardware, i.e.
+started from Q_INDEX_DONE and have ENTRY_DATA_PENDING bit set.
+
+From practical standpoint this fixes RX queue stall, usually reproducible
+in AP mode, like for example reported here:
+https://bugzilla.redhat.com/show_bug.cgi?id=828824
+
+Reported-and-tested-by: Franco Miceli <fmiceli@plan.ceibal.edu.uy>
+Reported-and-tested-by: Tom Horsley <horsley1953@gmail.com>
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rt2x00/rt2x00usb.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2x00usb.c b/drivers/net/wireless/rt2x00/rt2x00usb.c
+index 1e31050..ba28807 100644
+--- a/drivers/net/wireless/rt2x00/rt2x00usb.c
++++ b/drivers/net/wireless/rt2x00/rt2x00usb.c
+@@ -426,8 +426,8 @@ void rt2x00usb_kick_queue(struct data_queue *queue)
+ 	case QID_RX:
+ 		if (!rt2x00queue_full(queue))
+ 			rt2x00queue_for_each_entry(queue,
+-						   Q_INDEX_DONE,
+ 						   Q_INDEX,
++						   Q_INDEX_DONE,
+ 						   NULL,
+ 						   rt2x00usb_kick_rx_entry);
+ 		break;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0054-iwlegacy-always-monitor-for-stuck-queues.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0054-iwlegacy-always-monitor-for-stuck-queues.patch
new file mode 100644
index 0000000..83172fb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0054-iwlegacy-always-monitor-for-stuck-queues.patch
@@ -0,0 +1,65 @@
+From b7d2c1e70d2c94585ac5839e38b861bdc6d469d2 Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Wed, 4 Jul 2012 13:20:20 +0200
+Subject: [PATCH 054/109] iwlegacy: always monitor for stuck queues
+
+commit c2ca7d92ed4bbd779516beb6eb226e19f7f7ab0f upstream.
+
+This is iwlegacy version of:
+
+commit 342bbf3fee2fa9a18147e74b2e3c4229a4564912
+Author: Johannes Berg <johannes.berg@intel.com>
+Date:   Sun Mar 4 08:50:46 2012 -0800
+
+    iwlwifi: always monitor for stuck queues
+
+    If we only monitor while associated, the following
+    can happen:
+     - we're associated, and the queue stuck check
+       runs, setting the queue "touch" time to X
+     - we disassociate, stopping the monitoring,
+       which leaves the time set to X
+     - almost 2s later, we associate, and enqueue
+       a frame
+     - before the frame is transmitted, we monitor
+       for stuck queues, and find the time set to
+       X, although it is now later than X + 2000ms,
+       so we decide that the queue is stuck and
+       erroneously restart the device
+
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: adjust filename, function and variable names]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/iwlegacy/iwl-core.c |   14 ++++++--------
+ 1 files changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/net/wireless/iwlegacy/iwl-core.c b/drivers/net/wireless/iwlegacy/iwl-core.c
+index 2bd5659..1bb64c9 100644
+--- a/drivers/net/wireless/iwlegacy/iwl-core.c
++++ b/drivers/net/wireless/iwlegacy/iwl-core.c
+@@ -1884,14 +1884,12 @@ void iwl_legacy_bg_watchdog(unsigned long data)
+ 		return;
+ 
+ 	/* monitor and check for other stuck queues */
+-	if (iwl_legacy_is_any_associated(priv)) {
+-		for (cnt = 0; cnt < priv->hw_params.max_txq_num; cnt++) {
+-			/* skip as we already checked the command queue */
+-			if (cnt == priv->cmd_queue)
+-				continue;
+-			if (iwl_legacy_check_stuck_queue(priv, cnt))
+-				return;
+-		}
++	for (cnt = 0; cnt < priv->hw_params.max_txq_num; cnt++) {
++		/* skip as we already checked the command queue */
++		if (cnt == priv->cmd_queue)
++			continue;
++		if (iwl_legacy_check_stuck_queue(priv, cnt))
++			return;
+ 	}
+ 
+ 	mod_timer(&priv->watchdog, jiffies +
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0055-iwlegacy-don-t-mess-up-the-SCD-when-removing-a-key.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0055-iwlegacy-don-t-mess-up-the-SCD-when-removing-a-key.patch
new file mode 100644
index 0000000..f5bbca6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0055-iwlegacy-don-t-mess-up-the-SCD-when-removing-a-key.patch
@@ -0,0 +1,51 @@
+From 910c9012a7e02b93cc1f877aa8ef245dd1d99fbe Mon Sep 17 00:00:00 2001
+From: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
+Date: Wed, 4 Jul 2012 13:59:08 +0200
+Subject: [PATCH 055/109] iwlegacy: don't mess up the SCD when removing a key
+
+commit b48d96652626b315229b1b82c6270eead6a77a6d upstream.
+
+When we remove a key, we put a key index which was supposed
+to tell the fw that we are actually removing the key. But
+instead the fw took that index as a valid index and messed
+up the SRAM of the device.
+
+This memory corruption on the device mangled the data of
+the SCD. The impact on the user is that SCD queue 2 got
+stuck after having removed keys.
+
+Reported-by: Paul Bolle <pebolle@tiscali.nl>
+Signed-off-by: Emmanuel Grumbach <emmanuel.grumbach@intel.com>
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: adjust filename, context and variable name]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/iwlegacy/iwl-4965-sta.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/iwlegacy/iwl-4965-sta.c b/drivers/net/wireless/iwlegacy/iwl-4965-sta.c
+index a262c23..0116ca8 100644
+--- a/drivers/net/wireless/iwlegacy/iwl-4965-sta.c
++++ b/drivers/net/wireless/iwlegacy/iwl-4965-sta.c
+@@ -466,7 +466,7 @@ int iwl4965_remove_dynamic_key(struct iwl_priv *priv,
+ 		return 0;
+ 	}
+ 
+-	if (priv->stations[sta_id].sta.key.key_offset == WEP_INVALID_OFFSET) {
++	if (priv->stations[sta_id].sta.key.key_flags & STA_KEY_FLG_INVALID) {
+ 		IWL_WARN(priv, "Removing wrong key %d 0x%x\n",
+ 			    keyconf->keyidx, key_flags);
+ 		spin_unlock_irqrestore(&priv->sta_lock, flags);
+@@ -483,7 +483,7 @@ int iwl4965_remove_dynamic_key(struct iwl_priv *priv,
+ 					sizeof(struct iwl4965_keyinfo));
+ 	priv->stations[sta_id].sta.key.key_flags =
+ 			STA_KEY_FLG_NO_ENC | STA_KEY_FLG_INVALID;
+-	priv->stations[sta_id].sta.key.key_offset = WEP_INVALID_OFFSET;
++	priv->stations[sta_id].sta.key.key_offset = keyconf->hw_key_idx;
+ 	priv->stations[sta_id].sta.sta.modify_mask = STA_MODIFY_KEY_MASK;
+ 	priv->stations[sta_id].sta.mode = STA_CONTROL_MODIFY_MSK;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0056-e1000e-Correct-link-check-logic-for-82571-serdes.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0056-e1000e-Correct-link-check-logic-for-82571-serdes.patch
new file mode 100644
index 0000000..b7cf900
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0056-e1000e-Correct-link-check-logic-for-82571-serdes.patch
@@ -0,0 +1,39 @@
+From c82dafb3ba87352cb605641f7d709ec76dc64168 Mon Sep 17 00:00:00 2001
+From: Tushar Dave <tushar.n.dave@intel.com>
+Date: Thu, 12 Jul 2012 08:56:56 +0000
+Subject: [PATCH 056/109] e1000e: Correct link check logic for 82571 serdes
+
+commit d0efa8f23a644f7cb7d1f8e78dd9a223efa412a3 upstream.
+
+SYNCH bit and IV bit of RXCW register are sticky. Before examining these bits,
+RXCW should be read twice to filter out one-time false events and have correct
+values for these bits. Incorrect values of these bits in link check logic can
+cause weird link stability issues if auto-negotiation fails.
+
+Reported-by: Dean Nelson <dnelson@redhat.com>
+Signed-off-by: Tushar Dave <tushar.n.dave@intel.com>
+Reviewed-by: Bruce Allan <bruce.w.allan@intel.com>
+Tested-by: Jeff Pieper <jeffrey.e.pieper@intel.com>
+Signed-off-by: Jeff Kirsher <jeffrey.t.kirsher@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/intel/e1000e/82571.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/ethernet/intel/e1000e/82571.c b/drivers/net/ethernet/intel/e1000e/82571.c
+index e556fc3..3072d35 100644
+--- a/drivers/net/ethernet/intel/e1000e/82571.c
++++ b/drivers/net/ethernet/intel/e1000e/82571.c
+@@ -1571,6 +1571,9 @@ static s32 e1000_check_for_serdes_link_82571(struct e1000_hw *hw)
+ 	ctrl = er32(CTRL);
+ 	status = er32(STATUS);
+ 	rxcw = er32(RXCW);
++	/* SYNCH bit and IV bit are sticky */
++	udelay(10);
++	rxcw = er32(RXCW);
+ 
+ 	if ((rxcw & E1000_RXCW_SYNCH) && !(rxcw & E1000_RXCW_IV)) {
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0057-tcm_fc-Fix-crash-seen-with-aborts-and-large-reads.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0057-tcm_fc-Fix-crash-seen-with-aborts-and-large-reads.patch
new file mode 100644
index 0000000..eb1e62d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0057-tcm_fc-Fix-crash-seen-with-aborts-and-large-reads.patch
@@ -0,0 +1,39 @@
+From f846f3528f3dcd02646a919a50696d026e0864ae Mon Sep 17 00:00:00 2001
+From: Mark Rustad <mark.d.rustad@intel.com>
+Date: Fri, 13 Jul 2012 18:18:04 -0700
+Subject: [PATCH 057/109] tcm_fc: Fix crash seen with aborts and large reads
+
+commit 3cc5d2a6b9a2fd1bf024aa5e52dd22961eecaf13 upstream.
+
+This patch fixes a crash seen when large reads have their exchange
+aborted by either timing out or being reset. Because the exchange
+abort results in the seq pointer being set to NULL, because the
+sequence is no longer valid, it must not be dereferenced. This
+patch changes the function ft_get_task_tag to return ~0 if it is
+unable to get the tag for this reason. Because the get_task_tag
+interface provides no means of returning an error, this seems
+like the best way to fix this issue at the moment.
+
+Signed-off-by: Mark Rustad <mark.d.rustad@intel.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/tcm_fc/tfc_cmd.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/tcm_fc/tfc_cmd.c b/drivers/target/tcm_fc/tfc_cmd.c
+index d95cfe2..278819c 100644
+--- a/drivers/target/tcm_fc/tfc_cmd.c
++++ b/drivers/target/tcm_fc/tfc_cmd.c
+@@ -249,6 +249,8 @@ u32 ft_get_task_tag(struct se_cmd *se_cmd)
+ {
+ 	struct ft_cmd *cmd = container_of(se_cmd, struct ft_cmd, se_cmd);
+ 
++	if (cmd->aborted)
++		return ~0;
+ 	return fc_seq_exch(cmd->seq)->rxid;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0058-fifo-Do-not-restart-open-if-it-already-found-a-partn.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0058-fifo-Do-not-restart-open-if-it-already-found-a-partn.patch
new file mode 100644
index 0000000..99a8db5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0058-fifo-Do-not-restart-open-if-it-already-found-a-partn.patch
@@ -0,0 +1,115 @@
+From 13d0304203a528b1c1c76b5c9b6f5b8dc093f996 Mon Sep 17 00:00:00 2001
+From: Anders Kaseorg <andersk@MIT.EDU>
+Date: Sun, 15 Jul 2012 17:14:25 -0400
+Subject: [PATCH 058/109] fifo: Do not restart open() if it already found a
+ partner
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 05d290d66be6ef77a0b962ebecf01911bd984a78 upstream.
+
+If a parent and child process open the two ends of a fifo, and the
+child immediately exits, the parent may receive a SIGCHLD before its
+open() returns.  In that case, we need to make sure that open() will
+return successfully after the SIGCHLD handler returns, instead of
+throwing EINTR or being restarted.  Otherwise, the restarted open()
+would incorrectly wait for a second partner on the other end.
+
+The following test demonstrates the EINTR that was wrongly thrown from
+the parent’s open().  Change .sa_flags = 0 to .sa_flags = SA_RESTART
+to see a deadlock instead, in which the restarted open() waits for a
+second reader that will never come.  (On my systems, this happens
+pretty reliably within about 5 to 500 iterations.  Others report that
+it manages to loop ~forever sometimes; YMMV.)
+
+  #include <sys/stat.h>
+  #include <sys/types.h>
+  #include <sys/wait.h>
+  #include <fcntl.h>
+  #include <signal.h>
+  #include <stdio.h>
+  #include <stdlib.h>
+  #include <unistd.h>
+
+  #define CHECK(x) do if ((x) == -1) {perror(#x); abort();} while(0)
+
+  void handler(int signum) {}
+
+  int main()
+  {
+      struct sigaction act = {.sa_handler = handler, .sa_flags = 0};
+      CHECK(sigaction(SIGCHLD, &act, NULL));
+      CHECK(mknod("fifo", S_IFIFO | S_IRWXU, 0));
+      for (;;) {
+          int fd;
+          pid_t pid;
+          putc('.', stderr);
+          CHECK(pid = fork());
+          if (pid == 0) {
+              CHECK(fd = open("fifo", O_RDONLY));
+              _exit(0);
+          }
+          CHECK(fd = open("fifo", O_WRONLY));
+          CHECK(close(fd));
+          CHECK(waitpid(pid, NULL, 0));
+      }
+  }
+
+This is what I suspect was causing the Git test suite to fail in
+t9010-svn-fe.sh:
+
+	http://bugs.debian.org/678852
+
+Signed-off-by: Anders Kaseorg <andersk@mit.edu>
+Reviewed-by: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/fifo.c |    9 ++++-----
+ 1 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/fs/fifo.c b/fs/fifo.c
+index b1a524d..cf6f434 100644
+--- a/fs/fifo.c
++++ b/fs/fifo.c
+@@ -14,7 +14,7 @@
+ #include <linux/sched.h>
+ #include <linux/pipe_fs_i.h>
+ 
+-static void wait_for_partner(struct inode* inode, unsigned int *cnt)
++static int wait_for_partner(struct inode* inode, unsigned int *cnt)
+ {
+ 	int cur = *cnt;	
+ 
+@@ -23,6 +23,7 @@ static void wait_for_partner(struct inode* inode, unsigned int *cnt)
+ 		if (signal_pending(current))
+ 			break;
+ 	}
++	return cur == *cnt ? -ERESTARTSYS : 0;
+ }
+ 
+ static void wake_up_partner(struct inode* inode)
+@@ -67,8 +68,7 @@ static int fifo_open(struct inode *inode, struct file *filp)
+ 				 * seen a writer */
+ 				filp->f_version = pipe->w_counter;
+ 			} else {
+-				wait_for_partner(inode, &pipe->w_counter);
+-				if(signal_pending(current))
++				if (wait_for_partner(inode, &pipe->w_counter))
+ 					goto err_rd;
+ 			}
+ 		}
+@@ -90,8 +90,7 @@ static int fifo_open(struct inode *inode, struct file *filp)
+ 			wake_up_partner(inode);
+ 
+ 		if (!pipe->readers) {
+-			wait_for_partner(inode, &pipe->r_counter);
+-			if (signal_pending(current))
++			if (wait_for_partner(inode, &pipe->r_counter))
+ 				goto err_wr;
+ 		}
+ 		break;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0059-target-Clean-up-returning-errors-in-PR-handling-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0059-target-Clean-up-returning-errors-in-PR-handling-code.patch
new file mode 100644
index 0000000..273c119
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0059-target-Clean-up-returning-errors-in-PR-handling-code.patch
@@ -0,0 +1,55 @@
+From ab68c7b575aff70124f83d2ec207d06c60eea003 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 15:17:10 -0700
+Subject: [PATCH 059/109] target: Clean up returning errors in PR handling
+ code
+
+commit d35212f3ca3bf4fb49d15e37f530c9931e2d2183 upstream.
+
+ - instead of (PTR_ERR(file) < 0) just use IS_ERR(file)
+ - return -EINVAL instead of EINVAL
+ - all other error returns in target_scsi3_emulate_pr_out() use
+   "goto out" -- get rid of the one remaining straight "return."
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_pr.c |    7 ++++---
+ 1 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core_pr.c
+index b75bc92..9145141 100644
+--- a/drivers/target/target_core_pr.c
++++ b/drivers/target/target_core_pr.c
+@@ -2042,7 +2042,7 @@ static int __core_scsi3_write_aptpl_to_file(
+ 	if (IS_ERR(file) || !file || !file->f_dentry) {
+ 		pr_err("filp_open(%s) for APTPL metadata"
+ 			" failed\n", path);
+-		return (PTR_ERR(file) < 0 ? PTR_ERR(file) : -ENOENT);
++		return IS_ERR(file) ? PTR_ERR(file) : -ENOENT;
+ 	}
+ 
+ 	iov[0].iov_base = &buf[0];
+@@ -3853,7 +3853,7 @@ int target_scsi3_emulate_pr_out(struct se_task *task)
+ 			" SPC-2 reservation is held, returning"
+ 			" RESERVATION_CONFLICT\n");
+ 		cmd->scsi_sense_reason = TCM_RESERVATION_CONFLICT;
+-		ret = EINVAL;
++		ret = -EINVAL;
+ 		goto out;
+ 	}
+ 
+@@ -3863,7 +3863,8 @@ int target_scsi3_emulate_pr_out(struct se_task *task)
+ 	 */
+ 	if (!cmd->se_sess) {
+ 		cmd->scsi_sense_reason = TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE;
+-		return -EINVAL;
++		ret = -EINVAL;
++		goto out;
+ 	}
+ 
+ 	if (cmd->data_length < 24) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0060-target-Fix-range-calculation-in-WRITE-SAME-emulation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0060-target-Fix-range-calculation-in-WRITE-SAME-emulation.patch
new file mode 100644
index 0000000..264206d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0060-target-Fix-range-calculation-in-WRITE-SAME-emulation.patch
@@ -0,0 +1,41 @@
+From 63a96e329f2c66af145a93d6f42067e54ef932af Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 17:10:17 -0700
+Subject: [PATCH 060/109] target: Fix range calculation in WRITE SAME
+ emulation when num blocks == 0
+
+commit 1765fe5edcb83f53fc67edeb559fcf4bc82c6460 upstream.
+
+When NUMBER OF LOGICAL BLOCKS is 0, WRITE SAME is supposed to write
+all the blocks from the specified LBA through the end of the device.
+However, dev->transport->get_blocks(dev) (perhaps confusingly) returns
+the last valid LBA rather than the number of blocks, so the correct
+number of blocks to write starting with lba is
+
+dev->transport->get_blocks(dev) - lba + 1
+
+(nab: Backport roland's for-3.6 patch to for-3.5)
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_cdb.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 65ea65a..93b9406 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -1199,7 +1199,7 @@ int target_emulate_write_same(struct se_task *task)
+ 	if (num_blocks != 0)
+ 		range = num_blocks;
+ 	else
+-		range = (dev->transport->get_blocks(dev) - lba);
++		range = (dev->transport->get_blocks(dev) - lba) + 1;
+ 
+ 	pr_debug("WRITE_SAME UNMAP: LBA: %llu Range: %llu\n",
+ 		 (unsigned long long)lba, (unsigned long long)range);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0061-cifs-on-CONFIG_HIGHMEM-machines-limit-the-rsize-wsiz.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0061-cifs-on-CONFIG_HIGHMEM-machines-limit-the-rsize-wsiz.patch
new file mode 100644
index 0000000..e3fc6d0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0061-cifs-on-CONFIG_HIGHMEM-machines-limit-the-rsize-wsiz.patch
@@ -0,0 +1,82 @@
+From 0028855e0b717cadb5fc6b05934af9bd9d2cc4c1 Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Wed, 11 Jul 2012 09:09:35 -0400
+Subject: [PATCH 061/109] cifs: on CONFIG_HIGHMEM machines, limit the
+ rsize/wsize to the kmap space
+
+commit 3ae629d98bd5ed77585a878566f04f310adbc591 upstream.
+
+We currently rely on being able to kmap all of the pages in an async
+read or write request. If you're on a machine that has CONFIG_HIGHMEM
+set then that kmap space is limited, sometimes to as low as 512 slots.
+
+With 512 slots, we can only support up to a 2M r/wsize, and that's
+assuming that we can get our greedy little hands on all of them. There
+are other users however, so it's possible we'll end up stuck with a
+size that large.
+
+Since we can't handle a rsize or wsize larger than that currently, cap
+those options at the number of kmap slots we have. We could consider
+capping it even lower, but we currently default to a max of 1M. Might as
+well allow those luddites on 32 bit arches enough rope to hang
+themselves.
+
+A more robust fix would be to teach the send and receive routines how
+to contend with an array of pages so we don't need to marshal up a kvec
+array at all. That's a fairly significant overhaul though, so we'll need
+this limit in place until that's ready.
+
+Reported-by: Jian Li <jiali@redhat.com>
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steve French <smfrench@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/cifs/connect.c |   18 ++++++++++++++++++
+ 1 files changed, 18 insertions(+), 0 deletions(-)
+
+diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
+index b21670c..56c152d 100644
+--- a/fs/cifs/connect.c
++++ b/fs/cifs/connect.c
+@@ -2925,6 +2925,18 @@ void cifs_setup_cifs_sb(struct smb_vol *pvolume_info,
+ #define CIFS_DEFAULT_NON_POSIX_RSIZE (60 * 1024)
+ #define CIFS_DEFAULT_NON_POSIX_WSIZE (65536)
+ 
++/*
++ * On hosts with high memory, we can't currently support wsize/rsize that are
++ * larger than we can kmap at once. Cap the rsize/wsize at
++ * LAST_PKMAP * PAGE_SIZE. We'll never be able to fill a read or write request
++ * larger than that anyway.
++ */
++#ifdef CONFIG_HIGHMEM
++#define CIFS_KMAP_SIZE_LIMIT	(LAST_PKMAP * PAGE_CACHE_SIZE)
++#else /* CONFIG_HIGHMEM */
++#define CIFS_KMAP_SIZE_LIMIT	(1<<24)
++#endif /* CONFIG_HIGHMEM */
++
+ static unsigned int
+ cifs_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *pvolume_info)
+ {
+@@ -2955,6 +2967,9 @@ cifs_negotiate_wsize(struct cifs_tcon *tcon, struct smb_vol *pvolume_info)
+ 		wsize = min_t(unsigned int, wsize,
+ 				server->maxBuf - sizeof(WRITE_REQ) + 4);
+ 
++	/* limit to the amount that we can kmap at once */
++	wsize = min_t(unsigned int, wsize, CIFS_KMAP_SIZE_LIMIT);
++
+ 	/* hard limit of CIFS_MAX_WSIZE */
+ 	wsize = min_t(unsigned int, wsize, CIFS_MAX_WSIZE);
+ 
+@@ -2996,6 +3011,9 @@ cifs_negotiate_rsize(struct cifs_tcon *tcon, struct smb_vol *pvolume_info)
+ 	if (!(server->capabilities & CAP_LARGE_READ_X))
+ 		rsize = min_t(unsigned int, CIFSMaxBufSize, rsize);
+ 
++	/* limit to the amount that we can kmap at once */
++	rsize = min_t(unsigned int, rsize, CIFS_KMAP_SIZE_LIMIT);
++
+ 	/* hard limit of CIFS_MAX_RSIZE */
+ 	rsize = min_t(unsigned int, rsize, CIFS_MAX_RSIZE);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0062-cifs-always-update-the-inode-cache-with-the-results-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0062-cifs-always-update-the-inode-cache-with-the-results-.patch
new file mode 100644
index 0000000..6e67cc9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0062-cifs-always-update-the-inode-cache-with-the-results-.patch
@@ -0,0 +1,47 @@
+From 3d7e548a161a109e404e1068901f834c69eeb0ea Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Fri, 6 Jul 2012 07:09:42 -0400
+Subject: [PATCH 062/109] cifs: always update the inode cache with the results
+ from a FIND_*
+
+commit cd60042cc1392e79410dc8de9e9c1abb38a29e57 upstream.
+
+When we get back a FIND_FIRST/NEXT result, we have some info about the
+dentry that we use to instantiate a new inode. We were ignoring and
+discarding that info when we had an existing dentry in the cache.
+
+Fix this by updating the inode in place when we find an existing dentry
+and the uniqueid is the same.
+
+Reported-and-Tested-by: Andrew Bartlett <abartlet@samba.org>
+Reported-by: Bill Robertson <bill_robertson@debortoli.com.au>
+Reported-by: Dion Edwards <dion_edwards@debortoli.com.au>
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steve French <smfrench@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/cifs/readdir.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/fs/cifs/readdir.c b/fs/cifs/readdir.c
+index db4a138..4c37ed4 100644
+--- a/fs/cifs/readdir.c
++++ b/fs/cifs/readdir.c
+@@ -86,9 +86,12 @@ cifs_readdir_lookup(struct dentry *parent, struct qstr *name,
+ 
+ 	dentry = d_lookup(parent, name);
+ 	if (dentry) {
+-		/* FIXME: check for inode number changes? */
+-		if (dentry->d_inode != NULL)
++		inode = dentry->d_inode;
++		/* update inode in place if i_ino didn't change */
++		if (inode && CIFS_I(inode)->uniqueid == fattr->cf_uniqueid) {
++			cifs_fattr_to_inode(inode, fattr);
+ 			return dentry;
++		}
+ 		d_drop(dentry);
+ 		dput(dentry);
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0063-mm-fix-lost-kswapd-wakeup-in-kswapd_stop.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0063-mm-fix-lost-kswapd-wakeup-in-kswapd_stop.patch
new file mode 100644
index 0000000..198dc15
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0063-mm-fix-lost-kswapd-wakeup-in-kswapd_stop.patch
@@ -0,0 +1,84 @@
+From 6ece4e48bfa223f77eff8fc4d2fcc4808214f42e Mon Sep 17 00:00:00 2001
+From: Aaditya Kumar <aaditya.kumar.30@gmail.com>
+Date: Tue, 17 Jul 2012 15:48:07 -0700
+Subject: [PATCH 063/109] mm: fix lost kswapd wakeup in kswapd_stop()
+
+commit 1c7e7f6c0703d03af6bcd5ccc11fc15d23e5ecbe upstream.
+
+Offlining memory may block forever, waiting for kswapd() to wake up
+because kswapd() does not check the event kthread->should_stop before
+sleeping.
+
+The proper pattern, from Documentation/memory-barriers.txt, is:
+
+   ---  waker  ---
+   event_indicated = 1;
+   wake_up_process(event_daemon);
+
+   ---  sleeper  ---
+   for (;;) {
+      set_current_state(TASK_UNINTERRUPTIBLE);
+      if (event_indicated)
+         break;
+      schedule();
+   }
+
+   set_current_state() may be wrapped by:
+      prepare_to_wait();
+
+In the kswapd() case, event_indicated is kthread->should_stop.
+
+  === offlining memory (waker) ===
+   kswapd_stop()
+      kthread_stop()
+         kthread->should_stop = 1
+         wake_up_process()
+         wait_for_completion()
+
+  ===  kswapd_try_to_sleep (sleeper) ===
+   kswapd_try_to_sleep()
+      prepare_to_wait()
+           .
+           .
+      schedule()
+           .
+           .
+      finish_wait()
+
+The schedule() needs to be protected by a test of kthread->should_stop,
+which is wrapped by kthread_should_stop().
+
+Reproducer:
+   Do heavy file I/O in background.
+   Do a memory offline/online in a tight loop
+
+Signed-off-by: Aaditya Kumar <aaditya.kumar@ap.sony.com>
+Acked-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
+Reviewed-by: Minchan Kim <minchan@kernel.org>
+Acked-by: Mel Gorman <mel@csn.ul.ie>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    5 ++++-
+ 1 files changed, 4 insertions(+), 1 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index 72cf498..8342119 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -2824,7 +2824,10 @@ static void kswapd_try_to_sleep(pg_data_t *pgdat, int order, int classzone_idx)
+ 		 * them before going back to sleep.
+ 		 */
+ 		set_pgdat_percpu_threshold(pgdat, calculate_normal_threshold);
+-		schedule();
++
++		if (!kthread_should_stop())
++			schedule();
++
+ 		set_pgdat_percpu_threshold(pgdat, calculate_pressure_threshold);
+ 	} else {
+ 		if (remaining)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0064-md-avoid-crash-when-stopping-md-array-races-with-clo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0064-md-avoid-crash-when-stopping-md-array-races-with-clo.patch
new file mode 100644
index 0000000..3ef68e9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0064-md-avoid-crash-when-stopping-md-array-races-with-clo.patch
@@ -0,0 +1,164 @@
+From 22c2c30192d85ffa042433e89e929b4ea08ab528 Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Thu, 19 Jul 2012 15:59:18 +1000
+Subject: [PATCH 064/109] md: avoid crash when stopping md array races with
+ closing other open fds.
+
+commit a05b7ea03d72f36edb0cec05e8893803335c61a0 upstream.
+
+md will refuse to stop an array if any other fd (or mounted fs) is
+using it.
+When any fs is unmounted of when the last open fd is closed all
+pending IO will be flushed (e.g. sync_blockdev call in __blkdev_put)
+so there will be no pending IO to worry about when the array is
+stopped.
+
+However in order to send the STOP_ARRAY ioctl to stop the array one
+must first get and open fd on the block device.
+If some fd is being used to write to the block device and it is closed
+after mdadm open the block device, but before mdadm issues the
+STOP_ARRAY ioctl, then there will be no last-close on the md device so
+__blkdev_put will not call sync_blockdev.
+
+If this happens, then IO can still be in-flight while md tears down
+the array and bad things can happen (use-after-free and subsequent
+havoc).
+
+So in the case where do_md_stop is being called from an open file
+descriptor, call sync_block after taking the mutex to ensure there
+will be no new openers.
+
+This is needed when setting a read-write device to read-only too.
+
+Reported-by: majianpeng <majianpeng@gmail.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/md.c |   36 +++++++++++++++++++++++-------------
+ 1 files changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/drivers/md/md.c b/drivers/md/md.c
+index 700ecae..d8646d7 100644
+--- a/drivers/md/md.c
++++ b/drivers/md/md.c
+@@ -3700,8 +3700,8 @@ array_state_show(struct mddev *mddev, char *page)
+ 	return sprintf(page, "%s\n", array_states[st]);
+ }
+ 
+-static int do_md_stop(struct mddev * mddev, int ro, int is_open);
+-static int md_set_readonly(struct mddev * mddev, int is_open);
++static int do_md_stop(struct mddev * mddev, int ro, struct block_device *bdev);
++static int md_set_readonly(struct mddev * mddev, struct block_device *bdev);
+ static int do_md_run(struct mddev * mddev);
+ static int restart_array(struct mddev *mddev);
+ 
+@@ -3717,14 +3717,14 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
+ 		/* stopping an active array */
+ 		if (atomic_read(&mddev->openers) > 0)
+ 			return -EBUSY;
+-		err = do_md_stop(mddev, 0, 0);
++		err = do_md_stop(mddev, 0, NULL);
+ 		break;
+ 	case inactive:
+ 		/* stopping an active array */
+ 		if (mddev->pers) {
+ 			if (atomic_read(&mddev->openers) > 0)
+ 				return -EBUSY;
+-			err = do_md_stop(mddev, 2, 0);
++			err = do_md_stop(mddev, 2, NULL);
+ 		} else
+ 			err = 0; /* already inactive */
+ 		break;
+@@ -3732,7 +3732,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
+ 		break; /* not supported yet */
+ 	case readonly:
+ 		if (mddev->pers)
+-			err = md_set_readonly(mddev, 0);
++			err = md_set_readonly(mddev, NULL);
+ 		else {
+ 			mddev->ro = 1;
+ 			set_disk_ro(mddev->gendisk, 1);
+@@ -3742,7 +3742,7 @@ array_state_store(struct mddev *mddev, const char *buf, size_t len)
+ 	case read_auto:
+ 		if (mddev->pers) {
+ 			if (mddev->ro == 0)
+-				err = md_set_readonly(mddev, 0);
++				err = md_set_readonly(mddev, NULL);
+ 			else if (mddev->ro == 1)
+ 				err = restart_array(mddev);
+ 			if (err == 0) {
+@@ -5078,15 +5078,17 @@ void md_stop(struct mddev *mddev)
+ }
+ EXPORT_SYMBOL_GPL(md_stop);
+ 
+-static int md_set_readonly(struct mddev *mddev, int is_open)
++static int md_set_readonly(struct mddev *mddev, struct block_device *bdev)
+ {
+ 	int err = 0;
+ 	mutex_lock(&mddev->open_mutex);
+-	if (atomic_read(&mddev->openers) > is_open) {
++	if (atomic_read(&mddev->openers) > !!bdev) {
+ 		printk("md: %s still in use.\n",mdname(mddev));
+ 		err = -EBUSY;
+ 		goto out;
+ 	}
++	if (bdev)
++		sync_blockdev(bdev);
+ 	if (mddev->pers) {
+ 		__md_stop_writes(mddev);
+ 
+@@ -5108,18 +5110,26 @@ out:
+  *   0 - completely stop and dis-assemble array
+  *   2 - stop but do not disassemble array
+  */
+-static int do_md_stop(struct mddev * mddev, int mode, int is_open)
++static int do_md_stop(struct mddev * mddev, int mode,
++		      struct block_device *bdev)
+ {
+ 	struct gendisk *disk = mddev->gendisk;
+ 	struct md_rdev *rdev;
+ 
+ 	mutex_lock(&mddev->open_mutex);
+-	if (atomic_read(&mddev->openers) > is_open ||
++	if (atomic_read(&mddev->openers) > !!bdev ||
+ 	    mddev->sysfs_active) {
+ 		printk("md: %s still in use.\n",mdname(mddev));
+ 		mutex_unlock(&mddev->open_mutex);
+ 		return -EBUSY;
+ 	}
++	if (bdev)
++		/* It is possible IO was issued on some other
++		 * open file which was closed before we took ->open_mutex.
++		 * As that was not the last close __blkdev_put will not
++		 * have called sync_blockdev, so we must.
++		 */
++		sync_blockdev(bdev);
+ 
+ 	if (mddev->pers) {
+ 		if (mddev->ro)
+@@ -5193,7 +5203,7 @@ static void autorun_array(struct mddev *mddev)
+ 	err = do_md_run(mddev);
+ 	if (err) {
+ 		printk(KERN_WARNING "md: do_md_run() returned %d\n", err);
+-		do_md_stop(mddev, 0, 0);
++		do_md_stop(mddev, 0, NULL);
+ 	}
+ }
+ 
+@@ -6184,11 +6194,11 @@ static int md_ioctl(struct block_device *bdev, fmode_t mode,
+ 			goto done_unlock;
+ 
+ 		case STOP_ARRAY:
+-			err = do_md_stop(mddev, 0, 1);
++			err = do_md_stop(mddev, 0, bdev);
+ 			goto done_unlock;
+ 
+ 		case STOP_ARRAY_RO:
+-			err = md_set_readonly(mddev, 1);
++			err = md_set_readonly(mddev, bdev);
+ 			goto done_unlock;
+ 
+ 		case BLKROSET:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0065-md-raid1-close-some-possible-races-on-write-errors-d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0065-md-raid1-close-some-possible-races-on-write-errors-d.patch
new file mode 100644
index 0000000..b3bd32c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0065-md-raid1-close-some-possible-races-on-write-errors-d.patch
@@ -0,0 +1,58 @@
+From a5f676adf9ef247dd5363de5f0e26d0bdb6597bc Mon Sep 17 00:00:00 2001
+From: NeilBrown <neilb@suse.de>
+Date: Thu, 19 Jul 2012 15:59:18 +1000
+Subject: [PATCH 065/109] md/raid1: close some possible races on write errors
+ during resync
+
+commit 58e94ae18478c08229626daece2fc108a4a23261 upstream.
+
+commit 4367af556133723d0f443e14ca8170d9447317cb
+   md/raid1: clear bad-block record when write succeeds.
+
+Added a 'reschedule_retry' call possibility at the end of
+end_sync_write, but didn't add matching code at the end of
+sync_request_write.  So if the writes complete very quickly, or
+scheduling makes it seem that way, then we can miss rescheduling
+the request and the resync could hang.
+
+Also commit 73d5c38a9536142e062c35997b044e89166e063b
+    md: avoid races when stopping resync.
+
+Fix a race condition in this same code in end_sync_write but didn't
+make the change in sync_request_write.
+
+This patch updates sync_request_write to fix both of those.
+Patch is suitable for 3.1 and later kernels.
+
+Reported-by: Alexander Lyakas <alex.bolshoy@gmail.com>
+Original-version-by: Alexander Lyakas <alex.bolshoy@gmail.com>
+Signed-off-by: NeilBrown <neilb@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/raid1.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
+index 58f0055..2d97bf0 100644
+--- a/drivers/md/raid1.c
++++ b/drivers/md/raid1.c
+@@ -1713,8 +1713,14 @@ static void sync_request_write(struct mddev *mddev, struct r1bio *r1_bio)
+ 
+ 	if (atomic_dec_and_test(&r1_bio->remaining)) {
+ 		/* if we're here, all write(s) have completed, so clean up */
+-		md_done_sync(mddev, r1_bio->sectors, 1);
+-		put_buf(r1_bio);
++		int s = r1_bio->sectors;
++		if (test_bit(R1BIO_MadeGood, &r1_bio->state) ||
++		    test_bit(R1BIO_WriteError, &r1_bio->state))
++			reschedule_retry(r1_bio);
++		else {
++			put_buf(r1_bio);
++			md_done_sync(mddev, s, 1);
++		}
+ 	}
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0066-MIPS-Properly-align-the-.data.init_task-section.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0066-MIPS-Properly-align-the-.data.init_task-section.patch
new file mode 100644
index 0000000..c9ab6f8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0066-MIPS-Properly-align-the-.data.init_task-section.patch
@@ -0,0 +1,70 @@
+From 892d35f24ea2801daef7e48e41d8ec4e9bac34e8 Mon Sep 17 00:00:00 2001
+From: David Daney <david.daney@cavium.com>
+Date: Thu, 19 Jul 2012 09:11:14 +0200
+Subject: [PATCH 066/109] MIPS: Properly align the .data..init_task section.
+
+commit 7b1c0d26a8e272787f0f9fcc5f3e8531df3b3409 upstream.
+
+Improper alignment can lead to unbootable systems and/or random
+crashes.
+
+[ralf@linux-mips.org: This is a lond standing bug since
+6eb10bc9e2deab06630261cd05c4cb1e9a60e980 (kernel.org) rsp.
+c422a10917f75fd19fa7fe070aaaa23e384dae6f (lmo) [MIPS: Clean up linker script
+using new linker script macros.] so dates back to 2.6.32.]
+
+Signed-off-by: David Daney <david.daney@cavium.com>
+Cc: linux-mips@linux-mips.org
+Patchwork: https://patchwork.linux-mips.org/patch/3881/
+Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/mips/include/asm/thread_info.h |    4 ++--
+ arch/mips/kernel/vmlinux.lds.S      |    3 ++-
+ 2 files changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/arch/mips/include/asm/thread_info.h b/arch/mips/include/asm/thread_info.h
+index 97f8bf6..adda036 100644
+--- a/arch/mips/include/asm/thread_info.h
++++ b/arch/mips/include/asm/thread_info.h
+@@ -60,6 +60,8 @@ struct thread_info {
+ register struct thread_info *__current_thread_info __asm__("$28");
+ #define current_thread_info()  __current_thread_info
+ 
++#endif /* !__ASSEMBLY__ */
++
+ /* thread information allocation */
+ #if defined(CONFIG_PAGE_SIZE_4KB) && defined(CONFIG_32BIT)
+ #define THREAD_SIZE_ORDER (1)
+@@ -97,8 +99,6 @@ register struct thread_info *__current_thread_info __asm__("$28");
+ 
+ #define free_thread_info(info) kfree(info)
+ 
+-#endif /* !__ASSEMBLY__ */
+-
+ #define PREEMPT_ACTIVE		0x10000000
+ 
+ /*
+diff --git a/arch/mips/kernel/vmlinux.lds.S b/arch/mips/kernel/vmlinux.lds.S
+index a81176f..be281c6 100644
+--- a/arch/mips/kernel/vmlinux.lds.S
++++ b/arch/mips/kernel/vmlinux.lds.S
+@@ -1,5 +1,6 @@
+ #include <asm/asm-offsets.h>
+ #include <asm/page.h>
++#include <asm/thread_info.h>
+ #include <asm-generic/vmlinux.lds.h>
+ 
+ #undef mips
+@@ -73,7 +74,7 @@ SECTIONS
+ 	.data : {	/* Data */
+ 		. = . + DATAOFFSET;		/* for CONFIG_MAPPED_KERNEL */
+ 
+-		INIT_TASK_DATA(PAGE_SIZE)
++		INIT_TASK_DATA(THREAD_SIZE)
+ 		NOSAVE_DATA
+ 		CACHELINE_ALIGNED_DATA(1 << CONFIG_MIPS_L1_CACHE_SHIFT)
+ 		READ_MOSTLY_DATA(1 << CONFIG_MIPS_L1_CACHE_SHIFT)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0067-UBIFS-fix-a-bug-in-empty-space-fix-up.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0067-UBIFS-fix-a-bug-in-empty-space-fix-up.patch
new file mode 100644
index 0000000..c51b177
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0067-UBIFS-fix-a-bug-in-empty-space-fix-up.patch
@@ -0,0 +1,67 @@
+From f6ba94c29333fa6df9b3b553415e93bafbd3c831 Mon Sep 17 00:00:00 2001
+From: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
+Date: Sat, 14 Jul 2012 14:33:09 +0300
+Subject: [PATCH 067/109] UBIFS: fix a bug in empty space fix-up
+
+commit c6727932cfdb13501108b16c38463c09d5ec7a74 upstream.
+
+UBIFS has a feature called "empty space fix-up" which is a quirk to work-around
+limitations of dumb flasher programs. Namely, of those flashers that are unable
+to skip NAND pages full of 0xFFs while flashing, resulting in empty space at
+the end of half-filled eraseblocks to be unusable for UBIFS. This feature is
+relatively new (introduced in v3.0).
+
+The fix-up routine (fixup_free_space()) is executed only once at the very first
+mount if the superblock has the 'space_fixup' flag set (can be done with -F
+option of mkfs.ubifs). It basically reads all the UBIFS data and metadata and
+writes it back to the same LEB. The routine assumes the image is pristine and
+does not have anything in the journal.
+
+There was a bug in 'fixup_free_space()' where it fixed up the log incorrectly.
+All but one LEB of the log of a pristine file-system are empty. And one
+contains just a commit start node. And 'fixup_free_space()' just unmapped this
+LEB, which resulted in wiping the commit start node. As a result, some users
+were unable to mount the file-system next time with the following symptom:
+
+UBIFS error (pid 1): replay_log_leb: first log node at LEB 3:0 is not CS node
+UBIFS error (pid 1): replay_log_leb: log error detected while replaying the log at LEB 3:0
+
+The root-cause of this bug was that 'fixup_free_space()' wrongly assumed
+that the beginning of empty space in the log head (c->lhead_offs) was known
+on mount. However, it is not the case - it was always 0. UBIFS does not store
+in it the master node and finds out by scanning the log on every mount.
+
+The fix is simple - just pass commit start node size instead of 0 to
+'fixup_leb()'.
+
+Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@linux.intel.com>
+Reported-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
+Tested-by: Iwo Mergler <Iwo.Mergler@netcommwireless.com>
+Reported-by: James Nute <newten82@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ubifs/sb.c |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
+index 6094c5a..b73ecd8 100644
+--- a/fs/ubifs/sb.c
++++ b/fs/ubifs/sb.c
+@@ -715,8 +715,12 @@ static int fixup_free_space(struct ubifs_info *c)
+ 		lnum = ubifs_next_log_lnum(c, lnum);
+ 	}
+ 
+-	/* Fixup the current log head */
+-	err = fixup_leb(c, c->lhead_lnum, c->lhead_offs);
++	/*
++	 * Fixup the log head which contains the only a CS node at the
++	 * beginning.
++	 */
++	err = fixup_leb(c, c->lhead_lnum,
++			ALIGN(UBIFS_CS_NODE_SZ, c->min_io_size));
+ 	if (err)
+ 		goto out;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0068-ore-Fix-NFS-crash-by-supporting-any-unaligned-RAID-I.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0068-ore-Fix-NFS-crash-by-supporting-any-unaligned-RAID-I.patch
new file mode 100644
index 0000000..0dabe3b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0068-ore-Fix-NFS-crash-by-supporting-any-unaligned-RAID-I.patch
@@ -0,0 +1,211 @@
+From b4c39a3690fd0d723f50eba441fe567e8fee68f1 Mon Sep 17 00:00:00 2001
+From: Boaz Harrosh <bharrosh@panasas.com>
+Date: Fri, 8 Jun 2012 01:19:07 +0300
+Subject: [PATCH 068/109] ore: Fix NFS crash by supporting any unaligned RAID
+ IO
+
+commit 9ff19309a9623f2963ac5a136782ea4d8b5d67fb upstream.
+
+In RAID_5/6 We used to not permit an IO that it's end
+byte is not stripe_size aligned and spans more than one stripe.
+.i.e the caller must check if after submission the actual
+transferred bytes is shorter, and would need to resubmit
+a new IO with the remainder.
+
+Exofs supports this, and NFS was supposed to support this
+as well with it's short write mechanism. But late testing has
+exposed a CRASH when this is used with none-RPC layout-drivers.
+
+The change at NFS is deep and risky, in it's place the fix
+at ORE to lift the limitation is actually clean and simple.
+So here it is below.
+
+The principal here is that in the case of unaligned IO on
+both ends, beginning and end, we will send two read requests
+one like old code, before the calculation of the first stripe,
+and also a new site, before the calculation of the last stripe.
+If any "boundary" is aligned or the complete IO is within a single
+stripe. we do a single read like before.
+
+The code is clean and simple by splitting the old _read_4_write
+into 3 even parts:
+1._read_4_write_first_stripe
+2. _read_4_write_last_stripe
+3. _read_4_write_execute
+
+And calling 1+3 at the same place as before. 2+3 before last
+stripe, and in the case of all in a single stripe then 1+2+3
+is preformed additively.
+
+Why did I not think of it before. Well I had a strike of
+genius because I have stared at this code for 2 years, and did
+not find this simple solution, til today. Not that I did not try.
+
+This solution is much better for NFS than the previous supposedly
+solution because the short write was dealt  with out-of-band after
+IO_done, which would cause for a seeky IO pattern where as in here
+we execute in order. At both solutions we do 2 separate reads, only
+here we do it within a single IO request. (And actually combine two
+writes into a single submission)
+
+NFS/exofs code need not change since the ORE API communicates the new
+shorter length on return, what will happen is that this case would not
+occur anymore.
+
+hurray!!
+
+[Stable this is an NFS bug since 3.2 Kernel should apply cleanly]
+Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/exofs/ore_raid.c |   67 +++++++++++++++++++++++++++-----------------------
+ 1 files changed, 36 insertions(+), 31 deletions(-)
+
+diff --git a/fs/exofs/ore_raid.c b/fs/exofs/ore_raid.c
+index d222c77..fff2070 100644
+--- a/fs/exofs/ore_raid.c
++++ b/fs/exofs/ore_raid.c
+@@ -461,16 +461,12 @@ static void _mark_read4write_pages_uptodate(struct ore_io_state *ios, int ret)
+  * ios->sp2d[p][*], xor is calculated the same way. These pages are
+  * allocated/freed and don't go through cache
+  */
+-static int _read_4_write(struct ore_io_state *ios)
++static int _read_4_write_first_stripe(struct ore_io_state *ios)
+ {
+-	struct ore_io_state *ios_read;
+ 	struct ore_striping_info read_si;
+ 	struct __stripe_pages_2d *sp2d = ios->sp2d;
+ 	u64 offset = ios->si.first_stripe_start;
+-	u64 last_stripe_end;
+-	unsigned bytes_in_stripe = ios->si.bytes_in_stripe;
+-	unsigned i, c, p, min_p = sp2d->pages_in_unit, max_p = -1;
+-	int ret;
++	unsigned c, p, min_p = sp2d->pages_in_unit, max_p = -1;
+ 
+ 	if (offset == ios->offset) /* Go to start collect $200 */
+ 		goto read_last_stripe;
+@@ -478,6 +474,9 @@ static int _read_4_write(struct ore_io_state *ios)
+ 	min_p = _sp2d_min_pg(sp2d);
+ 	max_p = _sp2d_max_pg(sp2d);
+ 
++	ORE_DBGMSG("stripe_start=0x%llx ios->offset=0x%llx min_p=%d max_p=%d\n",
++		   offset, ios->offset, min_p, max_p);
++
+ 	for (c = 0; ; c++) {
+ 		ore_calc_stripe_info(ios->layout, offset, 0, &read_si);
+ 		read_si.obj_offset += min_p * PAGE_SIZE;
+@@ -512,6 +511,18 @@ static int _read_4_write(struct ore_io_state *ios)
+ 	}
+ 
+ read_last_stripe:
++	return 0;
++}
++
++static int _read_4_write_last_stripe(struct ore_io_state *ios)
++{
++	struct ore_striping_info read_si;
++	struct __stripe_pages_2d *sp2d = ios->sp2d;
++	u64 offset;
++	u64 last_stripe_end;
++	unsigned bytes_in_stripe = ios->si.bytes_in_stripe;
++	unsigned c, p, min_p = sp2d->pages_in_unit, max_p = -1;
++
+ 	offset = ios->offset + ios->length;
+ 	if (offset % PAGE_SIZE)
+ 		_add_to_r4w_last_page(ios, &offset);
+@@ -527,15 +538,15 @@ read_last_stripe:
+ 	c = _dev_order(ios->layout->group_width * ios->layout->mirrors_p1,
+ 		       ios->layout->mirrors_p1, read_si.par_dev, read_si.dev);
+ 
+-	BUG_ON(ios->si.first_stripe_start + bytes_in_stripe != last_stripe_end);
+-	/* unaligned IO must be within a single stripe */
+-
+ 	if (min_p == sp2d->pages_in_unit) {
+ 		/* Didn't do it yet */
+ 		min_p = _sp2d_min_pg(sp2d);
+ 		max_p = _sp2d_max_pg(sp2d);
+ 	}
+ 
++	ORE_DBGMSG("offset=0x%llx stripe_end=0x%llx min_p=%d max_p=%d\n",
++		   offset, last_stripe_end, min_p, max_p);
++
+ 	while (offset < last_stripe_end) {
+ 		struct __1_page_stripe *_1ps = &sp2d->_1p_stripes[p];
+ 
+@@ -568,6 +579,15 @@ read_last_stripe:
+ 	}
+ 
+ read_it:
++	return 0;
++}
++
++static int _read_4_write_execute(struct ore_io_state *ios)
++{
++	struct ore_io_state *ios_read;
++	unsigned i;
++	int ret;
++
+ 	ios_read = ios->ios_read_4_write;
+ 	if (!ios_read)
+ 		return 0;
+@@ -591,6 +611,8 @@ read_it:
+ 	}
+ 
+ 	_mark_read4write_pages_uptodate(ios_read, ret);
++	ore_put_io_state(ios_read);
++	ios->ios_read_4_write = NULL; /* Might need a reuse at last stripe */
+ 	return 0;
+ }
+ 
+@@ -626,8 +648,11 @@ int _ore_add_parity_unit(struct ore_io_state *ios,
+ 			/* If first stripe, Read in all read4write pages
+ 			 * (if needed) before we calculate the first parity.
+ 			 */
+-			_read_4_write(ios);
++			_read_4_write_first_stripe(ios);
+ 		}
++		if (!cur_len) /* If last stripe r4w pages of last stripe */
++			_read_4_write_last_stripe(ios);
++		_read_4_write_execute(ios);
+ 
+ 		for (i = 0; i < num_pages; i++) {
+ 			pages[i] = _raid_page_alloc();
+@@ -654,34 +679,14 @@ int _ore_add_parity_unit(struct ore_io_state *ios,
+ 
+ int _ore_post_alloc_raid_stuff(struct ore_io_state *ios)
+ {
+-	struct ore_layout *layout = ios->layout;
+-
+ 	if (ios->parity_pages) {
++		struct ore_layout *layout = ios->layout;
+ 		unsigned pages_in_unit = layout->stripe_unit / PAGE_SIZE;
+-		unsigned stripe_size = ios->si.bytes_in_stripe;
+-		u64 last_stripe, first_stripe;
+ 
+ 		if (_sp2d_alloc(pages_in_unit, layout->group_width,
+ 				layout->parity, &ios->sp2d)) {
+ 			return -ENOMEM;
+ 		}
+-
+-		/* Round io down to last full strip */
+-		first_stripe = div_u64(ios->offset, stripe_size);
+-		last_stripe = div_u64(ios->offset + ios->length, stripe_size);
+-
+-		/* If an IO spans more then a single stripe it must end at
+-		 * a stripe boundary. The reminder at the end is pushed into the
+-		 * next IO.
+-		 */
+-		if (last_stripe != first_stripe) {
+-			ios->length = last_stripe * stripe_size - ios->offset;
+-
+-			BUG_ON(!ios->length);
+-			ios->nr_pages = (ios->length + PAGE_SIZE - 1) /
+-					PAGE_SIZE;
+-			ios->si.length = ios->length; /*make it consistent */
+-		}
+ 	}
+ 	return 0;
+ }
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0069-ore-Remove-support-of-partial-IO-request-NFS-crash.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0069-ore-Remove-support-of-partial-IO-request-NFS-crash.patch
new file mode 100644
index 0000000..dade112
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0069-ore-Remove-support-of-partial-IO-request-NFS-crash.patch
@@ -0,0 +1,50 @@
+From a2f43c94b074e0bf567ddc35e17504bbcd237ae1 Mon Sep 17 00:00:00 2001
+From: Boaz Harrosh <bharrosh@panasas.com>
+Date: Fri, 8 Jun 2012 04:30:40 +0300
+Subject: [PATCH 069/109] ore: Remove support of partial IO request (NFS
+ crash)
+
+commit 62b62ad873f2accad9222a4d7ffbe1e93f6714c1 upstream.
+
+Do to OOM situations the ore might fail to allocate all resources
+needed for IO of the full request. If some progress was possible
+it would proceed with a partial/short request, for the sake of
+forward progress.
+
+Since this crashes NFS-core and exofs is just fine without it just
+remove this contraption, and fail.
+
+TODO:
+	Support real forward progress with some reserved allocations
+	of resources, such as mem pools and/or bio_sets
+
+[Bug since 3.2 Kernel]
+CC: Benny Halevy <bhalevy@tonian.com>
+Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/exofs/ore.c |    8 +-------
+ 1 files changed, 1 insertions(+), 7 deletions(-)
+
+diff --git a/fs/exofs/ore.c b/fs/exofs/ore.c
+index 49cf230..24a49d4 100644
+--- a/fs/exofs/ore.c
++++ b/fs/exofs/ore.c
+@@ -735,13 +735,7 @@ static int _prepare_for_striping(struct ore_io_state *ios)
+ out:
+ 	ios->numdevs = devs_in_group;
+ 	ios->pages_consumed = cur_pg;
+-	if (unlikely(ret)) {
+-		if (length == ios->length)
+-			return ret;
+-		else
+-			ios->length -= length;
+-	}
+-	return 0;
++	return ret;
+ }
+ 
+ int ore_create(struct ore_io_state *ios)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0070-pnfs-obj-don-t-leak-objio_state-if-ore_write-read-fa.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0070-pnfs-obj-don-t-leak-objio_state-if-ore_write-read-fa.patch
new file mode 100644
index 0000000..c1659ca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0070-pnfs-obj-don-t-leak-objio_state-if-ore_write-read-fa.patch
@@ -0,0 +1,46 @@
+From 7b47a0e2114e8530614a25d7ec998fd52d069853 Mon Sep 17 00:00:00 2001
+From: Boaz Harrosh <bharrosh@panasas.com>
+Date: Fri, 8 Jun 2012 05:29:40 +0300
+Subject: [PATCH 070/109] pnfs-obj: don't leak objio_state if ore_write/read
+ fails
+
+commit 9909d45a8557455ca5f8ee7af0f253debc851f1a upstream.
+
+[Bug since 3.2 Kernel]
+Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfs/objlayout/objio_osd.c |    9 +++++++--
+ 1 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/fs/nfs/objlayout/objio_osd.c b/fs/nfs/objlayout/objio_osd.c
+index 55d0128..0e7b3fc 100644
+--- a/fs/nfs/objlayout/objio_osd.c
++++ b/fs/nfs/objlayout/objio_osd.c
+@@ -433,7 +433,10 @@ int objio_read_pagelist(struct nfs_read_data *rdata)
+ 	objios->ios->done = _read_done;
+ 	dprintk("%s: offset=0x%llx length=0x%x\n", __func__,
+ 		rdata->args.offset, rdata->args.count);
+-	return ore_read(objios->ios);
++	ret = ore_read(objios->ios);
++	if (unlikely(ret))
++		objio_free_result(&objios->oir);
++	return ret;
+ }
+ 
+ /*
+@@ -517,8 +520,10 @@ int objio_write_pagelist(struct nfs_write_data *wdata, int how)
+ 	dprintk("%s: offset=0x%llx length=0x%x\n", __func__,
+ 		wdata->args.offset, wdata->args.count);
+ 	ret = ore_write(objios->ios);
+-	if (unlikely(ret))
++	if (unlikely(ret)) {
++		objio_free_result(&objios->oir);
+ 		return ret;
++	}
+ 
+ 	if (objios->sync)
+ 		_write_done(objios->ios, objios);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0071-pnfs-obj-Fix-__r4w_get_page-when-offset-is-beyond-i_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0071-pnfs-obj-Fix-__r4w_get_page-when-offset-is-beyond-i_.patch
new file mode 100644
index 0000000..95152cc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0071-pnfs-obj-Fix-__r4w_get_page-when-offset-is-beyond-i_.patch
@@ -0,0 +1,71 @@
+From e4750a0414e24bcd0106493a2f8f251dd02264bf Mon Sep 17 00:00:00 2001
+From: Boaz Harrosh <bharrosh@panasas.com>
+Date: Fri, 8 Jun 2012 02:02:30 +0300
+Subject: [PATCH 071/109] pnfs-obj: Fix __r4w_get_page when offset is beyond
+ i_size
+
+commit c999ff68029ebd0f56ccae75444f640f6d5a27d2 upstream.
+
+It is very common for the end of the file to be unaligned on
+stripe size. But since we know it's beyond file's end then
+the XOR should be preformed with all zeros.
+
+Old code used to just read zeros out of the OSD devices, which is a great
+waist. But what scares me more about this situation is that, we now have
+pages attached to the file's mapping that are beyond i_size. I don't
+like the kind of bugs this calls for.
+
+Fix both birds, by returning a global zero_page, if offset is beyond
+i_size.
+
+TODO:
+	Change the API to ->__r4w_get_page() so a NULL can be
+	returned without being considered as error, since XOR API
+	treats NULL entries as zero_pages.
+
+[Bug since 3.2. Should apply the same way to all Kernels since]
+Signed-off-by: Boaz Harrosh <bharrosh@panasas.com>
+[bwh: Backported to 3.2: adjust for lack of wdata->header]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/nfs/objlayout/objio_osd.c |   16 +++++++++++++---
+ 1 files changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/fs/nfs/objlayout/objio_osd.c b/fs/nfs/objlayout/objio_osd.c
+index 0e7b3fc..a03ee52 100644
+--- a/fs/nfs/objlayout/objio_osd.c
++++ b/fs/nfs/objlayout/objio_osd.c
+@@ -467,8 +467,16 @@ static struct page *__r4w_get_page(void *priv, u64 offset, bool *uptodate)
+ 	struct objio_state *objios = priv;
+ 	struct nfs_write_data *wdata = objios->oir.rpcdata;
+ 	pgoff_t index = offset / PAGE_SIZE;
+-	struct page *page = find_get_page(wdata->inode->i_mapping, index);
++	struct page *page;
++	loff_t i_size = i_size_read(wdata->inode);
+ 
++	if (offset >= i_size) {
++		*uptodate = true;
++		dprintk("%s: g_zero_page index=0x%lx\n", __func__, index);
++		return ZERO_PAGE(0);
++	}
++
++	page = find_get_page(wdata->inode->i_mapping, index);
+ 	if (!page) {
+ 		page = find_or_create_page(wdata->inode->i_mapping,
+ 						index, GFP_NOFS);
+@@ -489,8 +497,10 @@ static struct page *__r4w_get_page(void *priv, u64 offset, bool *uptodate)
+ 
+ static void __r4w_put_page(void *priv, struct page *page)
+ {
+-	dprintk("%s: index=0x%lx\n", __func__, page->index);
+-	page_cache_release(page);
++	dprintk("%s: index=0x%lx\n", __func__,
++		(page == ZERO_PAGE(0)) ? -1UL : page->index);
++	if (ZERO_PAGE(0) != page)
++		page_cache_release(page);
+ 	return;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0072-dm-raid1-fix-crash-with-mirror-recovery-and-discard.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0072-dm-raid1-fix-crash-with-mirror-recovery-and-discard.patch
new file mode 100644
index 0000000..60a39d3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0072-dm-raid1-fix-crash-with-mirror-recovery-and-discard.patch
@@ -0,0 +1,114 @@
+From 035afb0de8406d0f820abf43471d51a377add326 Mon Sep 17 00:00:00 2001
+From: Mikulas Patocka <mpatocka@redhat.com>
+Date: Fri, 20 Jul 2012 14:25:03 +0100
+Subject: [PATCH 072/109] dm raid1: fix crash with mirror recovery and discard
+
+commit 751f188dd5ab95b3f2b5f2f467c38aae5a2877eb upstream.
+
+This patch fixes a crash when a discard request is sent during mirror
+recovery.
+
+Firstly, some background.  Generally, the following sequence happens during
+mirror synchronization:
+- function do_recovery is called
+- do_recovery calls dm_rh_recovery_prepare
+- dm_rh_recovery_prepare uses a semaphore to limit the number
+  simultaneously recovered regions (by default the semaphore value is 1,
+  so only one region at a time is recovered)
+- dm_rh_recovery_prepare calls __rh_recovery_prepare,
+  __rh_recovery_prepare asks the log driver for the next region to
+  recover. Then, it sets the region state to DM_RH_RECOVERING. If there
+  are no pending I/Os on this region, the region is added to
+  quiesced_regions list. If there are pending I/Os, the region is not
+  added to any list. It is added to the quiesced_regions list later (by
+  dm_rh_dec function) when all I/Os finish.
+- when the region is on quiesced_regions list, there are no I/Os in
+  flight on this region. The region is popped from the list in
+  dm_rh_recovery_start function. Then, a kcopyd job is started in the
+  recover function.
+- when the kcopyd job finishes, recovery_complete is called. It calls
+  dm_rh_recovery_end. dm_rh_recovery_end adds the region to
+  recovered_regions or failed_recovered_regions list (depending on
+  whether the copy operation was successful or not).
+
+The above mechanism assumes that if the region is in DM_RH_RECOVERING
+state, no new I/Os are started on this region. When I/O is started,
+dm_rh_inc_pending is called, which increases reg->pending count. When
+I/O is finished, dm_rh_dec is called. It decreases reg->pending count.
+If the count is zero and the region was in DM_RH_RECOVERING state,
+dm_rh_dec adds it to the quiesced_regions list.
+
+Consequently, if we call dm_rh_inc_pending/dm_rh_dec while the region is
+in DM_RH_RECOVERING state, it could be added to quiesced_regions list
+multiple times or it could be added to this list when kcopyd is copying
+data (it is assumed that the region is not on any list while kcopyd does
+its jobs). This results in memory corruption and crash.
+
+There already exist bypasses for REQ_FLUSH requests: REQ_FLUSH requests
+do not belong to any region, so they are always added to the sync list
+in do_writes. dm_rh_inc_pending does not increase count for REQ_FLUSH
+requests. In mirror_end_io, dm_rh_dec is never called for REQ_FLUSH
+requests. These bypasses avoid the crash possibility described above.
+
+These bypasses were improperly implemented for REQ_DISCARD when
+the mirror target gained discard support in commit
+5fc2ffeabb9ee0fc0e71ff16b49f34f0ed3d05b4 (dm raid1: support discard).
+
+In do_writes, REQ_DISCARD requests is always added to the sync queue and
+immediately dispatched (even if the region is in DM_RH_RECOVERING).  However,
+dm_rh_inc and dm_rh_dec is called for REQ_DISCARD resusts.  So it violates the
+rule that no I/Os are started on DM_RH_RECOVERING regions, and causes the list
+corruption described above.
+
+This patch changes it so that REQ_DISCARD requests follow the same path
+as REQ_FLUSH. This avoids the crash.
+
+Reference: https://bugzilla.redhat.com/837607
+
+Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/dm-raid1.c       |    2 +-
+ drivers/md/dm-region-hash.c |    5 ++++-
+ 2 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
+index 9bfd057..42ef54f 100644
+--- a/drivers/md/dm-raid1.c
++++ b/drivers/md/dm-raid1.c
+@@ -1210,7 +1210,7 @@ static int mirror_end_io(struct dm_target *ti, struct bio *bio,
+ 	 * We need to dec pending if this was a write.
+ 	 */
+ 	if (rw == WRITE) {
+-		if (!(bio->bi_rw & REQ_FLUSH))
++		if (!(bio->bi_rw & (REQ_FLUSH | REQ_DISCARD)))
+ 			dm_rh_dec(ms->rh, map_context->ll);
+ 		return error;
+ 	}
+diff --git a/drivers/md/dm-region-hash.c b/drivers/md/dm-region-hash.c
+index 7771ed2..69732e0 100644
+--- a/drivers/md/dm-region-hash.c
++++ b/drivers/md/dm-region-hash.c
+@@ -404,6 +404,9 @@ void dm_rh_mark_nosync(struct dm_region_hash *rh, struct bio *bio)
+ 		return;
+ 	}
+ 
++	if (bio->bi_rw & REQ_DISCARD)
++		return;
++
+ 	/* We must inform the log that the sync count has changed. */
+ 	log->type->set_region_sync(log, region, 0);
+ 
+@@ -524,7 +527,7 @@ void dm_rh_inc_pending(struct dm_region_hash *rh, struct bio_list *bios)
+ 	struct bio *bio;
+ 
+ 	for (bio = bios->head; bio; bio = bio->bi_next) {
+-		if (bio->bi_rw & REQ_FLUSH)
++		if (bio->bi_rw & (REQ_FLUSH | REQ_DISCARD))
+ 			continue;
+ 		rh_inc(rh, dm_rh_bio_to_region(rh, bio));
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0073-dm-raid1-set-discard_zeroes_data_unsupported.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0073-dm-raid1-set-discard_zeroes_data_unsupported.patch
new file mode 100644
index 0000000..b5f81f2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0073-dm-raid1-set-discard_zeroes_data_unsupported.patch
@@ -0,0 +1,41 @@
+From e8cf7231ce4f6464f8962ae6ef0421da40ddad15 Mon Sep 17 00:00:00 2001
+From: Mikulas Patocka <mpatocka@redhat.com>
+Date: Fri, 20 Jul 2012 14:25:07 +0100
+Subject: [PATCH 073/109] dm raid1: set discard_zeroes_data_unsupported
+
+commit 7c8d3a42fe1c58a7e8fd3f6a013e7d7b474ff931 upstream.
+
+We can't guarantee that REQ_DISCARD on dm-mirror zeroes the data even if
+the underlying disks support zero on discard.  So this patch sets
+ti->discard_zeroes_data_unsupported.
+
+For example, if the mirror is in the process of resynchronizing, it may
+happen that kcopyd reads a piece of data, then discard is sent on the
+same area and then kcopyd writes the piece of data to another leg.
+Consequently, the data is not zeroed.
+
+The flag was made available by commit 983c7db347db8ce2d8453fd1d89b7a4bb6920d56
+(dm crypt: always disable discard_zeroes_data).
+
+Signed-off-by: Mikulas Patocka <mpatocka@redhat.com>
+Signed-off-by: Alasdair G Kergon <agk@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/md/dm-raid1.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/md/dm-raid1.c b/drivers/md/dm-raid1.c
+index 42ef54f..dae2b7a 100644
+--- a/drivers/md/dm-raid1.c
++++ b/drivers/md/dm-raid1.c
+@@ -1080,6 +1080,7 @@ static int mirror_ctr(struct dm_target *ti, unsigned int argc, char **argv)
+ 	ti->split_io = dm_rh_get_region_size(ms->rh);
+ 	ti->num_flush_requests = 1;
+ 	ti->num_discard_requests = 1;
++	ti->discard_zeroes_data_unsupported = 1;
+ 
+ 	ms->kmirrord_wq = alloc_workqueue("kmirrord",
+ 					  WQ_NON_REENTRANT | WQ_MEM_RECLAIM, 0);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0074-ntp-Fix-leap-second-hrtimer-livelock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0074-ntp-Fix-leap-second-hrtimer-livelock.patch
new file mode 100644
index 0000000..5042065
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0074-ntp-Fix-leap-second-hrtimer-livelock.patch
@@ -0,0 +1,349 @@
+From 19aeba1469884ed9a789b143cf73ce047663c095 Mon Sep 17 00:00:00 2001
+From: John Stultz <john.stultz@linaro.org>
+Date: Tue, 17 Jul 2012 03:05:14 -0400
+Subject: [PATCH 074/109] ntp: Fix leap-second hrtimer livelock
+
+This is a backport of 6b43ae8a619d17c4935c3320d2ef9e92bdeed05d
+
+This should have been backported when it was commited, but I
+mistook the problem as requiring the ntp_lock changes
+that landed in 3.4 in order for it to occur.
+
+Unfortunately the same issue can happen (with only one cpu)
+as follows:
+do_adjtimex()
+ write_seqlock_irq(&xtime_lock);
+  process_adjtimex_modes()
+   process_adj_status()
+    ntp_start_leap_timer()
+     hrtimer_start()
+      hrtimer_reprogram()
+       tick_program_event()
+        clockevents_program_event()
+         ktime_get()
+          seq = req_seqbegin(xtime_lock); [DEADLOCK]
+
+This deadlock will no always occur, as it requires the
+leap_timer to force a hrtimer_reprogram which only happens
+if its set and there's no sooner timer to expire.
+
+NOTE: This patch, being faithful to the original commit,
+introduces a bug (we don't update wall_to_monotonic),
+which will be resovled by backporting a following fix.
+
+Original commit message below:
+
+Since commit 7dffa3c673fbcf835cd7be80bb4aec8ad3f51168 the ntp
+subsystem has used an hrtimer for triggering the leapsecond
+adjustment. However, this can cause a potential livelock.
+
+Thomas diagnosed this as the following pattern:
+CPU 0                                                    CPU 1
+do_adjtimex()
+  spin_lock_irq(&ntp_lock);
+    process_adjtimex_modes();				 timer_interrupt()
+      process_adj_status();                                do_timer()
+        ntp_start_leap_timer();                             write_lock(&xtime_lock);
+          hrtimer_start();                                  update_wall_time();
+             hrtimer_reprogram();                            ntp_tick_length()
+               tick_program_event()                            spin_lock(&ntp_lock);
+                 clockevents_program_event()
+		   ktime_get()
+                     seq = req_seqbegin(xtime_lock);
+
+This patch tries to avoid the problem by reverting back to not using
+an hrtimer to inject leapseconds, and instead we handle the leapsecond
+processing in the second_overflow() function.
+
+The downside to this change is that on systems that support highres
+timers, the leap second processing will occur on a HZ tick boundary,
+(ie: ~1-10ms, depending on HZ)  after the leap second instead of
+possibly sooner (~34us in my tests w/ x86_64 lapic).
+
+This patch applies on top of tip/timers/core.
+
+CC: Sasha Levin <levinsasha928@gmail.com>
+CC: Thomas Gleixner <tglx@linutronix.de>
+Reported-by: Sasha Levin <levinsasha928@gmail.com>
+Diagnoised-by: Thomas Gleixner <tglx@linutronix.de>
+Tested-by: Sasha Levin <levinsasha928@gmail.com>
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/timex.h     |    2 +-
+ kernel/time/ntp.c         |  122 +++++++++++++++------------------------------
+ kernel/time/timekeeping.c |   18 +++----
+ 3 files changed, 48 insertions(+), 94 deletions(-)
+
+diff --git a/include/linux/timex.h b/include/linux/timex.h
+index aa60fe7..08e90fb 100644
+--- a/include/linux/timex.h
++++ b/include/linux/timex.h
+@@ -266,7 +266,7 @@ static inline int ntp_synced(void)
+ /* Returns how long ticks are at present, in ns / 2^NTP_SCALE_SHIFT. */
+ extern u64 tick_length;
+ 
+-extern void second_overflow(void);
++extern int second_overflow(unsigned long secs);
+ extern void update_ntp_one_tick(void);
+ extern int do_adjtimex(struct timex *);
+ extern void hardpps(const struct timespec *, const struct timespec *);
+diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
+index 4b85a7a..4508f7f 100644
+--- a/kernel/time/ntp.c
++++ b/kernel/time/ntp.c
+@@ -31,8 +31,6 @@ unsigned long			tick_nsec;
+ u64				tick_length;
+ static u64			tick_length_base;
+ 
+-static struct hrtimer		leap_timer;
+-
+ #define MAX_TICKADJ		500LL		/* usecs */
+ #define MAX_TICKADJ_SCALED \
+ 	(((MAX_TICKADJ * NSEC_PER_USEC) << NTP_SCALE_SHIFT) / NTP_INTERVAL_FREQ)
+@@ -350,60 +348,60 @@ void ntp_clear(void)
+ }
+ 
+ /*
+- * Leap second processing. If in leap-insert state at the end of the
+- * day, the system clock is set back one second; if in leap-delete
+- * state, the system clock is set ahead one second.
++ * this routine handles the overflow of the microsecond field
++ *
++ * The tricky bits of code to handle the accurate clock support
++ * were provided by Dave Mills (Mills@UDEL.EDU) of NTP fame.
++ * They were originally developed for SUN and DEC kernels.
++ * All the kudos should go to Dave for this stuff.
++ *
++ * Also handles leap second processing, and returns leap offset
+  */
+-static enum hrtimer_restart ntp_leap_second(struct hrtimer *timer)
++int second_overflow(unsigned long secs)
+ {
+-	enum hrtimer_restart res = HRTIMER_NORESTART;
+-
+-	write_seqlock(&xtime_lock);
++	int leap = 0;
++	s64 delta;
+ 
++	/*
++	 * Leap second processing. If in leap-insert state at the end of the
++	 * day, the system clock is set back one second; if in leap-delete
++	 * state, the system clock is set ahead one second.
++	 */
+ 	switch (time_state) {
+ 	case TIME_OK:
++		if (time_status & STA_INS)
++			time_state = TIME_INS;
++		else if (time_status & STA_DEL)
++			time_state = TIME_DEL;
+ 		break;
+ 	case TIME_INS:
+-		timekeeping_leap_insert(-1);
+-		time_state = TIME_OOP;
+-		printk(KERN_NOTICE
+-			"Clock: inserting leap second 23:59:60 UTC\n");
+-		hrtimer_add_expires_ns(&leap_timer, NSEC_PER_SEC);
+-		res = HRTIMER_RESTART;
++		if (secs % 86400 == 0) {
++			leap = -1;
++			time_state = TIME_OOP;
++			printk(KERN_NOTICE
++				"Clock: inserting leap second 23:59:60 UTC\n");
++		}
+ 		break;
+ 	case TIME_DEL:
+-		timekeeping_leap_insert(1);
+-		time_tai--;
+-		time_state = TIME_WAIT;
+-		printk(KERN_NOTICE
+-			"Clock: deleting leap second 23:59:59 UTC\n");
++		if ((secs + 1) % 86400 == 0) {
++			leap = 1;
++			time_tai--;
++			time_state = TIME_WAIT;
++			printk(KERN_NOTICE
++				"Clock: deleting leap second 23:59:59 UTC\n");
++		}
+ 		break;
+ 	case TIME_OOP:
+ 		time_tai++;
+ 		time_state = TIME_WAIT;
+-		/* fall through */
++		break;
++
+ 	case TIME_WAIT:
+ 		if (!(time_status & (STA_INS | STA_DEL)))
+ 			time_state = TIME_OK;
+ 		break;
+ 	}
+ 
+-	write_sequnlock(&xtime_lock);
+-
+-	return res;
+-}
+-
+-/*
+- * this routine handles the overflow of the microsecond field
+- *
+- * The tricky bits of code to handle the accurate clock support
+- * were provided by Dave Mills (Mills@UDEL.EDU) of NTP fame.
+- * They were originally developed for SUN and DEC kernels.
+- * All the kudos should go to Dave for this stuff.
+- */
+-void second_overflow(void)
+-{
+-	s64 delta;
+ 
+ 	/* Bump the maxerror field */
+ 	time_maxerror += MAXFREQ / NSEC_PER_USEC;
+@@ -423,23 +421,25 @@ void second_overflow(void)
+ 	pps_dec_valid();
+ 
+ 	if (!time_adjust)
+-		return;
++		goto out;
+ 
+ 	if (time_adjust > MAX_TICKADJ) {
+ 		time_adjust -= MAX_TICKADJ;
+ 		tick_length += MAX_TICKADJ_SCALED;
+-		return;
++		goto out;
+ 	}
+ 
+ 	if (time_adjust < -MAX_TICKADJ) {
+ 		time_adjust += MAX_TICKADJ;
+ 		tick_length -= MAX_TICKADJ_SCALED;
+-		return;
++		goto out;
+ 	}
+ 
+ 	tick_length += (s64)(time_adjust * NSEC_PER_USEC / NTP_INTERVAL_FREQ)
+ 							 << NTP_SCALE_SHIFT;
+ 	time_adjust = 0;
++out:
++	return leap;
+ }
+ 
+ #ifdef CONFIG_GENERIC_CMOS_UPDATE
+@@ -501,27 +501,6 @@ static void notify_cmos_timer(void)
+ static inline void notify_cmos_timer(void) { }
+ #endif
+ 
+-/*
+- * Start the leap seconds timer:
+- */
+-static inline void ntp_start_leap_timer(struct timespec *ts)
+-{
+-	long now = ts->tv_sec;
+-
+-	if (time_status & STA_INS) {
+-		time_state = TIME_INS;
+-		now += 86400 - now % 86400;
+-		hrtimer_start(&leap_timer, ktime_set(now, 0), HRTIMER_MODE_ABS);
+-
+-		return;
+-	}
+-
+-	if (time_status & STA_DEL) {
+-		time_state = TIME_DEL;
+-		now += 86400 - (now + 1) % 86400;
+-		hrtimer_start(&leap_timer, ktime_set(now, 0), HRTIMER_MODE_ABS);
+-	}
+-}
+ 
+ /*
+  * Propagate a new txc->status value into the NTP state:
+@@ -546,22 +525,6 @@ static inline void process_adj_status(struct timex *txc, struct timespec *ts)
+ 	time_status &= STA_RONLY;
+ 	time_status |= txc->status & ~STA_RONLY;
+ 
+-	switch (time_state) {
+-	case TIME_OK:
+-		ntp_start_leap_timer(ts);
+-		break;
+-	case TIME_INS:
+-	case TIME_DEL:
+-		time_state = TIME_OK;
+-		ntp_start_leap_timer(ts);
+-	case TIME_WAIT:
+-		if (!(time_status & (STA_INS | STA_DEL)))
+-			time_state = TIME_OK;
+-		break;
+-	case TIME_OOP:
+-		hrtimer_restart(&leap_timer);
+-		break;
+-	}
+ }
+ /*
+  * Called with the xtime lock held, so we can access and modify
+@@ -643,9 +606,6 @@ int do_adjtimex(struct timex *txc)
+ 		    (txc->tick <  900000/USER_HZ ||
+ 		     txc->tick > 1100000/USER_HZ))
+ 			return -EINVAL;
+-
+-		if (txc->modes & ADJ_STATUS && time_state != TIME_OK)
+-			hrtimer_cancel(&leap_timer);
+ 	}
+ 
+ 	if (txc->modes & ADJ_SETOFFSET) {
+@@ -967,6 +927,4 @@ __setup("ntp_tick_adj=", ntp_tick_adj_setup);
+ void __init ntp_init(void)
+ {
+ 	ntp_clear();
+-	hrtimer_init(&leap_timer, CLOCK_REALTIME, HRTIMER_MODE_ABS);
+-	leap_timer.function = ntp_leap_second;
+ }
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index 2378413..4780a7d 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -169,15 +169,6 @@ static struct timespec raw_time;
+ /* flag for if timekeeping is suspended */
+ int __read_mostly timekeeping_suspended;
+ 
+-/* must hold xtime_lock */
+-void timekeeping_leap_insert(int leapsecond)
+-{
+-	xtime.tv_sec += leapsecond;
+-	wall_to_monotonic.tv_sec -= leapsecond;
+-	update_vsyscall(&xtime, &wall_to_monotonic, timekeeper.clock,
+-			timekeeper.mult);
+-}
+-
+ /**
+  * timekeeping_forward_now - update clock to the current time
+  *
+@@ -942,9 +933,11 @@ static cycle_t logarithmic_accumulation(cycle_t offset, int shift)
+ 
+ 	timekeeper.xtime_nsec += timekeeper.xtime_interval << shift;
+ 	while (timekeeper.xtime_nsec >= nsecps) {
++		int leap;
+ 		timekeeper.xtime_nsec -= nsecps;
+ 		xtime.tv_sec++;
+-		second_overflow();
++		leap = second_overflow(xtime.tv_sec);
++		xtime.tv_sec += leap;
+ 	}
+ 
+ 	/* Accumulate raw time */
+@@ -1050,9 +1043,12 @@ static void update_wall_time(void)
+ 	 * xtime.tv_nsec isn't larger then NSEC_PER_SEC
+ 	 */
+ 	if (unlikely(xtime.tv_nsec >= NSEC_PER_SEC)) {
++		int leap;
+ 		xtime.tv_nsec -= NSEC_PER_SEC;
+ 		xtime.tv_sec++;
+-		second_overflow();
++		leap = second_overflow(xtime.tv_sec);
++		xtime.tv_sec += leap;
++
+ 	}
+ 
+ 	/* check to see if there is a new clocksource to use */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0075-ntp-Correct-TAI-offset-during-leap-second.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0075-ntp-Correct-TAI-offset-during-leap-second.patch
new file mode 100644
index 0000000..ec72a79
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0075-ntp-Correct-TAI-offset-during-leap-second.patch
@@ -0,0 +1,42 @@
+From 106227da17ad8a279e7e104b8592ada4e81dbd8b Mon Sep 17 00:00:00 2001
+From: Richard Cochran <richardcochran@gmail.com>
+Date: Thu, 26 Apr 2012 14:11:32 +0200
+Subject: [PATCH 075/109] ntp: Correct TAI offset during leap second
+
+commit dd48d708ff3e917f6d6b6c2b696c3f18c019feed upstream.
+
+When repeating a UTC time value during a leap second (when the UTC
+time should be 23:59:60), the TAI timescale should not stop. The kernel
+NTP code increments the TAI offset one second too late. This patch fixes
+the issue by incrementing the offset during the leap second itself.
+
+Signed-off-by: Richard Cochran <richardcochran@gmail.com>
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/time/ntp.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/time/ntp.c b/kernel/time/ntp.c
+index 4508f7f..f1eb182 100644
+--- a/kernel/time/ntp.c
++++ b/kernel/time/ntp.c
+@@ -378,6 +378,7 @@ int second_overflow(unsigned long secs)
+ 		if (secs % 86400 == 0) {
+ 			leap = -1;
+ 			time_state = TIME_OOP;
++			time_tai++;
+ 			printk(KERN_NOTICE
+ 				"Clock: inserting leap second 23:59:60 UTC\n");
+ 		}
+@@ -392,7 +393,6 @@ int second_overflow(unsigned long secs)
+ 		}
+ 		break;
+ 	case TIME_OOP:
+-		time_tai++;
+ 		time_state = TIME_WAIT;
+ 		break;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0076-timekeeping-Fix-CLOCK_MONOTONIC-inconsistency-during.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0076-timekeeping-Fix-CLOCK_MONOTONIC-inconsistency-during.patch
new file mode 100644
index 0000000..cd6cd91
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0076-timekeeping-Fix-CLOCK_MONOTONIC-inconsistency-during.patch
@@ -0,0 +1,53 @@
+From 7a063ddaad98f05f7976e0e8c9c1455cc9d0f5da Mon Sep 17 00:00:00 2001
+From: John Stultz <john.stultz@linaro.org>
+Date: Wed, 30 May 2012 10:54:57 -0700
+Subject: [PATCH 076/109] timekeeping: Fix CLOCK_MONOTONIC inconsistency
+ during leapsecond
+
+This is a backport of fad0c66c4bb836d57a5f125ecd38bed653ca863a
+which resolves a bug the previous commit.
+
+Commit 6b43ae8a61 (ntp: Fix leap-second hrtimer livelock) broke the
+leapsecond update of CLOCK_MONOTONIC. The missing leapsecond update to
+wall_to_monotonic causes discontinuities in CLOCK_MONOTONIC.
+
+Adjust wall_to_monotonic when NTP inserted a leapsecond.
+
+Reported-by: Richard Cochran <richardcochran@gmail.com>
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Tested-by: Richard Cochran <richardcochran@gmail.com>
+Link: http://lkml.kernel.org/r/1338400497-12420-1-git-send-email-john.stultz@linaro.org
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/time/timekeeping.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index 4780a7d..5c9b67e 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -938,6 +938,7 @@ static cycle_t logarithmic_accumulation(cycle_t offset, int shift)
+ 		xtime.tv_sec++;
+ 		leap = second_overflow(xtime.tv_sec);
+ 		xtime.tv_sec += leap;
++		wall_to_monotonic.tv_sec -= leap;
+ 	}
+ 
+ 	/* Accumulate raw time */
+@@ -1048,7 +1049,7 @@ static void update_wall_time(void)
+ 		xtime.tv_sec++;
+ 		leap = second_overflow(xtime.tv_sec);
+ 		xtime.tv_sec += leap;
+-
++		wall_to_monotonic.tv_sec -= leap;
+ 	}
+ 
+ 	/* check to see if there is a new clocksource to use */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0077-time-Move-common-updates-to-a-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0077-time-Move-common-updates-to-a-function.patch
new file mode 100644
index 0000000..792fe39
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0077-time-Move-common-updates-to-a-function.patch
@@ -0,0 +1,99 @@
+From 540e83f9da352839ff29ce5445fc499de8d54570 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Sun, 13 Nov 2011 23:19:49 +0000
+Subject: [PATCH 077/109] time: Move common updates to a function
+
+This is a backport of cc06268c6a87db156af2daed6e96a936b955cc82
+
+[John Stultz: While not a bugfix itself, it allows following fixes
+ to backport in a more straightforward manner.]
+
+CC: Thomas Gleixner <tglx@linutronix.de>
+CC: Eric Dumazet <eric.dumazet@gmail.com>
+CC: Richard Cochran <richardcochran@gmail.com>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <john.stultz@linaro.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/time/timekeeping.c |   34 +++++++++++++++++-----------------
+ 1 files changed, 17 insertions(+), 17 deletions(-)
+
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index 5c9b67e..5d55185 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -166,6 +166,19 @@ static struct timespec total_sleep_time;
+  */
+ static struct timespec raw_time;
+ 
++/* must hold write on xtime_lock */
++static void timekeeping_update(bool clearntp)
++{
++	if (clearntp) {
++		timekeeper.ntp_error = 0;
++		ntp_clear();
++	}
++	update_vsyscall(&xtime, &wall_to_monotonic,
++			 timekeeper.clock, timekeeper.mult);
++}
++
++
++
+ /* flag for if timekeeping is suspended */
+ int __read_mostly timekeeping_suspended;
+ 
+@@ -366,11 +379,7 @@ int do_settimeofday(const struct timespec *tv)
+ 
+ 	xtime = *tv;
+ 
+-	timekeeper.ntp_error = 0;
+-	ntp_clear();
+-
+-	update_vsyscall(&xtime, &wall_to_monotonic, timekeeper.clock,
+-				timekeeper.mult);
++	timekeeping_update(true);
+ 
+ 	write_sequnlock_irqrestore(&xtime_lock, flags);
+ 
+@@ -403,11 +412,7 @@ int timekeeping_inject_offset(struct timespec *ts)
+ 	xtime = timespec_add(xtime, *ts);
+ 	wall_to_monotonic = timespec_sub(wall_to_monotonic, *ts);
+ 
+-	timekeeper.ntp_error = 0;
+-	ntp_clear();
+-
+-	update_vsyscall(&xtime, &wall_to_monotonic, timekeeper.clock,
+-				timekeeper.mult);
++	timekeeping_update(true);
+ 
+ 	write_sequnlock_irqrestore(&xtime_lock, flags);
+ 
+@@ -636,10 +641,7 @@ void timekeeping_inject_sleeptime(struct timespec *delta)
+ 
+ 	__timekeeping_inject_sleeptime(delta);
+ 
+-	timekeeper.ntp_error = 0;
+-	ntp_clear();
+-	update_vsyscall(&xtime, &wall_to_monotonic, timekeeper.clock,
+-				timekeeper.mult);
++	timekeeping_update(true);
+ 
+ 	write_sequnlock_irqrestore(&xtime_lock, flags);
+ 
+@@ -1052,9 +1054,7 @@ static void update_wall_time(void)
+ 		wall_to_monotonic.tv_sec -= leap;
+ 	}
+ 
+-	/* check to see if there is a new clocksource to use */
+-	update_vsyscall(&xtime, &wall_to_monotonic, timekeeper.clock,
+-				timekeeper.mult);
++	timekeeping_update(false);
+ }
+ 
+ /**
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0078-hrtimer-Provide-clock_was_set_delayed.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0078-hrtimer-Provide-clock_was_set_delayed.patch
new file mode 100644
index 0000000..90b7639
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0078-hrtimer-Provide-clock_was_set_delayed.patch
@@ -0,0 +1,118 @@
+From b6da5d5a3a7e128fd17b15dc64fda7c1aea694e6 Mon Sep 17 00:00:00 2001
+From: John Stultz <johnstul@us.ibm.com>
+Date: Tue, 10 Jul 2012 18:43:19 -0400
+Subject: [PATCH 078/109] hrtimer: Provide clock_was_set_delayed()
+
+commit f55a6faa384304c89cfef162768e88374d3312cb upstream.
+
+clock_was_set() cannot be called from hard interrupt context because
+it calls on_each_cpu().
+
+For fixing the widely reported leap seconds issue it is necessary to
+call it from hard interrupt context, i.e. the timer tick code, which
+does the timekeeping updates.
+
+Provide a new function which denotes it in the hrtimer cpu base
+structure of the cpu on which it is called and raise the hrtimer
+softirq. We then execute the clock_was_set() notificiation from
+softirq context in run_hrtimer_softirq(). The hrtimer softirq is
+rarely used, so polling the flag there is not a performance issue.
+
+[ tglx: Made it depend on CONFIG_HIGH_RES_TIMERS. We really should get
+  rid of all this ifdeffery ASAP ]
+
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Reported-by: Jan Engelhardt <jengelh@inai.de>
+Reviewed-by: Ingo Molnar <mingo@kernel.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Prarit Bhargava <prarit@redhat.com>
+Link: http://lkml.kernel.org/r/1341960205-56738-2-git-send-email-johnstul@us.ibm.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/hrtimer.h |    9 ++++++++-
+ kernel/hrtimer.c        |   20 ++++++++++++++++++++
+ 2 files changed, 28 insertions(+), 1 deletions(-)
+
+diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
+index fd0dc30..c9ec940 100644
+--- a/include/linux/hrtimer.h
++++ b/include/linux/hrtimer.h
+@@ -165,6 +165,7 @@ enum  hrtimer_base_type {
+  * @lock:		lock protecting the base and associated clock bases
+  *			and timers
+  * @active_bases:	Bitfield to mark bases with active timers
++ * @clock_was_set:	Indicates that clock was set from irq context.
+  * @expires_next:	absolute time of the next event which was scheduled
+  *			via clock_set_next_event()
+  * @hres_active:	State of high resolution mode
+@@ -177,7 +178,8 @@ enum  hrtimer_base_type {
+  */
+ struct hrtimer_cpu_base {
+ 	raw_spinlock_t			lock;
+-	unsigned long			active_bases;
++	unsigned int			active_bases;
++	unsigned int			clock_was_set;
+ #ifdef CONFIG_HIGH_RES_TIMERS
+ 	ktime_t				expires_next;
+ 	int				hres_active;
+@@ -286,6 +288,8 @@ extern void hrtimer_peek_ahead_timers(void);
+ # define MONOTONIC_RES_NSEC	HIGH_RES_NSEC
+ # define KTIME_MONOTONIC_RES	KTIME_HIGH_RES
+ 
++extern void clock_was_set_delayed(void);
++
+ #else
+ 
+ # define MONOTONIC_RES_NSEC	LOW_RES_NSEC
+@@ -306,6 +310,9 @@ static inline int hrtimer_is_hres_active(struct hrtimer *timer)
+ {
+ 	return 0;
+ }
++
++static inline void clock_was_set_delayed(void) { }
++
+ #endif
+ 
+ extern void clock_was_set(void);
+diff --git a/kernel/hrtimer.c b/kernel/hrtimer.c
+index ae34bf5..3c24fb2 100644
+--- a/kernel/hrtimer.c
++++ b/kernel/hrtimer.c
+@@ -717,6 +717,19 @@ static int hrtimer_switch_to_hres(void)
+ 	return 1;
+ }
+ 
++/*
++ * Called from timekeeping code to reprogramm the hrtimer interrupt
++ * device. If called from the timer interrupt context we defer it to
++ * softirq context.
++ */
++void clock_was_set_delayed(void)
++{
++	struct hrtimer_cpu_base *cpu_base = &__get_cpu_var(hrtimer_bases);
++
++	cpu_base->clock_was_set = 1;
++	__raise_softirq_irqoff(HRTIMER_SOFTIRQ);
++}
++
+ #else
+ 
+ static inline int hrtimer_hres_active(void) { return 0; }
+@@ -1395,6 +1408,13 @@ void hrtimer_peek_ahead_timers(void)
+ 
+ static void run_hrtimer_softirq(struct softirq_action *h)
+ {
++	struct hrtimer_cpu_base *cpu_base = &__get_cpu_var(hrtimer_bases);
++
++	if (cpu_base->clock_was_set) {
++		cpu_base->clock_was_set = 0;
++		clock_was_set();
++	}
++
+ 	hrtimer_peek_ahead_timers();
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0079-timekeeping-Fix-leapsecond-triggered-load-spike-issu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0079-timekeeping-Fix-leapsecond-triggered-load-spike-issu.patch
new file mode 100644
index 0000000..8965a59
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0079-timekeeping-Fix-leapsecond-triggered-load-spike-issu.patch
@@ -0,0 +1,66 @@
+From 61642041369832a7f8d29d27fcd9e88d523f3163 Mon Sep 17 00:00:00 2001
+From: John Stultz <johnstul@us.ibm.com>
+Date: Tue, 10 Jul 2012 18:43:20 -0400
+Subject: [PATCH 079/109] timekeeping: Fix leapsecond triggered load spike
+ issue
+
+This is a backport of 4873fa070ae84a4115f0b3c9dfabc224f1bc7c51
+
+The timekeeping code misses an update of the hrtimer subsystem after a
+leap second happened. Due to that timers based on CLOCK_REALTIME are
+either expiring a second early or late depending on whether a leap
+second has been inserted or deleted until an operation is initiated
+which causes that update. Unless the update happens by some other
+means this discrepancy between the timekeeping and the hrtimer data
+stays forever and timers are expired either early or late.
+
+The reported immediate workaround - $ data -s "`date`" - is causing a
+call to clock_was_set() which updates the hrtimer data structures.
+See: http://www.sheeri.com/content/mysql-and-leap-second-high-cpu-and-fix
+
+Add the missing clock_was_set() call to update_wall_time() in case of
+a leap second event. The actual update is deferred to softirq context
+as the necessary smp function call cannot be invoked from hard
+interrupt context.
+
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Reported-by: Jan Engelhardt <jengelh@inai.de>
+Reviewed-by: Ingo Molnar <mingo@kernel.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Prarit Bhargava <prarit@redhat.com>
+Link: http://lkml.kernel.org/r/1341960205-56738-3-git-send-email-johnstul@us.ibm.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/time/timekeeping.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index 5d55185..8958ad7 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -941,6 +941,8 @@ static cycle_t logarithmic_accumulation(cycle_t offset, int shift)
+ 		leap = second_overflow(xtime.tv_sec);
+ 		xtime.tv_sec += leap;
+ 		wall_to_monotonic.tv_sec -= leap;
++		if (leap)
++			clock_was_set_delayed();
+ 	}
+ 
+ 	/* Accumulate raw time */
+@@ -1052,6 +1054,8 @@ static void update_wall_time(void)
+ 		leap = second_overflow(xtime.tv_sec);
+ 		xtime.tv_sec += leap;
+ 		wall_to_monotonic.tv_sec -= leap;
++		if (leap)
++			clock_was_set_delayed();
+ 	}
+ 
+ 	timekeeping_update(false);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0080-timekeeping-Maintain-ktime_t-based-offsets-for-hrtim.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0080-timekeeping-Maintain-ktime_t-based-offsets-for-hrtim.patch
new file mode 100644
index 0000000..f00962d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0080-timekeeping-Maintain-ktime_t-based-offsets-for-hrtim.patch
@@ -0,0 +1,104 @@
+From 711cebfd4050d5a41606f9f8ad56986d0377df08 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Tue, 10 Jul 2012 18:43:21 -0400
+Subject: [PATCH 080/109] timekeeping: Maintain ktime_t based offsets for
+ hrtimers
+
+This is a backport of 5b9fe759a678e05be4937ddf03d50e950207c1c0
+
+We need to update the hrtimer clock offsets from the hrtimer interrupt
+context. To avoid conversions from timespec to ktime_t maintain a
+ktime_t based representation of those offsets in the timekeeper. This
+puts the conversion overhead into the code which updates the
+underlying offsets and provides fast accessible values in the hrtimer
+interrupt.
+
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Reviewed-by: Ingo Molnar <mingo@kernel.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Prarit Bhargava <prarit@redhat.com>
+Link: http://lkml.kernel.org/r/1341960205-56738-4-git-send-email-johnstul@us.ibm.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+[John Stultz: Backported to 3.2]
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/time/timekeeping.c |   25 ++++++++++++++++++++++++-
+ 1 files changed, 24 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index 8958ad7..d5d0e5d 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -161,18 +161,34 @@ static struct timespec xtime __attribute__ ((aligned (16)));
+ static struct timespec wall_to_monotonic __attribute__ ((aligned (16)));
+ static struct timespec total_sleep_time;
+ 
++/* Offset clock monotonic -> clock realtime */
++static ktime_t offs_real;
++
++/* Offset clock monotonic -> clock boottime */
++static ktime_t offs_boot;
++
+ /*
+  * The raw monotonic time for the CLOCK_MONOTONIC_RAW posix clock.
+  */
+ static struct timespec raw_time;
+ 
+ /* must hold write on xtime_lock */
++static void update_rt_offset(void)
++{
++	struct timespec tmp, *wtm = &wall_to_monotonic;
++
++	set_normalized_timespec(&tmp, -wtm->tv_sec, -wtm->tv_nsec);
++	offs_real = timespec_to_ktime(tmp);
++}
++
++/* must hold write on xtime_lock */
+ static void timekeeping_update(bool clearntp)
+ {
+ 	if (clearntp) {
+ 		timekeeper.ntp_error = 0;
+ 		ntp_clear();
+ 	}
++	update_rt_offset();
+ 	update_vsyscall(&xtime, &wall_to_monotonic,
+ 			 timekeeper.clock, timekeeper.mult);
+ }
+@@ -587,6 +603,7 @@ void __init timekeeping_init(void)
+ 	}
+ 	set_normalized_timespec(&wall_to_monotonic,
+ 				-boot.tv_sec, -boot.tv_nsec);
++	update_rt_offset();
+ 	total_sleep_time.tv_sec = 0;
+ 	total_sleep_time.tv_nsec = 0;
+ 	write_sequnlock_irqrestore(&xtime_lock, flags);
+@@ -595,6 +612,12 @@ void __init timekeeping_init(void)
+ /* time in seconds when suspend began */
+ static struct timespec timekeeping_suspend_time;
+ 
++static void update_sleep_time(struct timespec t)
++{
++	total_sleep_time = t;
++	offs_boot = timespec_to_ktime(t);
++}
++
+ /**
+  * __timekeeping_inject_sleeptime - Internal function to add sleep interval
+  * @delta: pointer to a timespec delta value
+@@ -612,7 +635,7 @@ static void __timekeeping_inject_sleeptime(struct timespec *delta)
+ 
+ 	xtime = timespec_add(xtime, *delta);
+ 	wall_to_monotonic = timespec_sub(wall_to_monotonic, *delta);
+-	total_sleep_time = timespec_add(total_sleep_time, *delta);
++	update_sleep_time(timespec_add(total_sleep_time, *delta));
+ }
+ 
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0081-hrtimers-Move-lock-held-region-in-hrtimer_interrupt.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0081-hrtimers-Move-lock-held-region-in-hrtimer_interrupt.patch
new file mode 100644
index 0000000..5444d54
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0081-hrtimers-Move-lock-held-region-in-hrtimer_interrupt.patch
@@ -0,0 +1,61 @@
+From 6783d1f7e46f4450b489d970bbf4d62db9296c1f Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Tue, 10 Jul 2012 18:43:23 -0400
+Subject: [PATCH 081/109] hrtimers: Move lock held region in
+ hrtimer_interrupt()
+
+commit 196951e91262fccda81147d2bcf7fdab08668b40 upstream.
+
+We need to update the base offsets from this code and we need to do
+that under base->lock. Move the lock held region around the
+ktime_get() calls. The ktime_get() calls are going to be replaced with
+a function which gets the time and the offsets atomically.
+
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Reviewed-by: Ingo Molnar <mingo@kernel.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Prarit Bhargava <prarit@redhat.com>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Link: http://lkml.kernel.org/r/1341960205-56738-6-git-send-email-johnstul@us.ibm.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/hrtimer.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/hrtimer.c b/kernel/hrtimer.c
+index 3c24fb2..8f320af 100644
+--- a/kernel/hrtimer.c
++++ b/kernel/hrtimer.c
+@@ -1263,11 +1263,10 @@ void hrtimer_interrupt(struct clock_event_device *dev)
+ 	cpu_base->nr_events++;
+ 	dev->next_event.tv64 = KTIME_MAX;
+ 
++	raw_spin_lock(&cpu_base->lock);
+ 	entry_time = now = ktime_get();
+ retry:
+ 	expires_next.tv64 = KTIME_MAX;
+-
+-	raw_spin_lock(&cpu_base->lock);
+ 	/*
+ 	 * We set expires_next to KTIME_MAX here with cpu_base->lock
+ 	 * held to prevent that a timer is enqueued in our queue via
+@@ -1344,6 +1343,7 @@ retry:
+ 	 * interrupt routine. We give it 3 attempts to avoid
+ 	 * overreacting on some spurious event.
+ 	 */
++	raw_spin_lock(&cpu_base->lock);
+ 	now = ktime_get();
+ 	cpu_base->nr_retries++;
+ 	if (++retries < 3)
+@@ -1356,6 +1356,7 @@ retry:
+ 	 */
+ 	cpu_base->nr_hangs++;
+ 	cpu_base->hang_detected = 1;
++	raw_spin_unlock(&cpu_base->lock);
+ 	delta = ktime_sub(now, entry_time);
+ 	if (delta.tv64 > cpu_base->max_hang_time.tv64)
+ 		cpu_base->max_hang_time = delta;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0082-timekeeping-Provide-hrtimer-update-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0082-timekeeping-Provide-hrtimer-update-function.patch
new file mode 100644
index 0000000..a973540
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0082-timekeeping-Provide-hrtimer-update-function.patch
@@ -0,0 +1,94 @@
+From d6cadfb2bf29a5913562d3f63c49a937bc98540d Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Tue, 10 Jul 2012 18:43:24 -0400
+Subject: [PATCH 082/109] timekeeping: Provide hrtimer update function
+
+This is a backport of f6c06abfb3972ad4914cef57d8348fcb2932bc3b
+
+To finally fix the infamous leap second issue and other race windows
+caused by functions which change the offsets between the various time
+bases (CLOCK_MONOTONIC, CLOCK_REALTIME and CLOCK_BOOTTIME) we need a
+function which atomically gets the current monotonic time and updates
+the offsets of CLOCK_REALTIME and CLOCK_BOOTTIME with minimalistic
+overhead. The previous patch which provides ktime_t offsets allows us
+to make this function almost as cheap as ktime_get() which is going to
+be replaced in hrtimer_interrupt().
+
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Reviewed-by: Ingo Molnar <mingo@kernel.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Prarit Bhargava <prarit@redhat.com>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Link: http://lkml.kernel.org/r/1341960205-56738-7-git-send-email-johnstul@us.ibm.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+[John Stultz: Backported to 3.2]
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/hrtimer.h   |    1 +
+ kernel/time/timekeeping.c |   34 ++++++++++++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/hrtimer.h b/include/linux/hrtimer.h
+index c9ec940..cc07d27 100644
+--- a/include/linux/hrtimer.h
++++ b/include/linux/hrtimer.h
+@@ -327,6 +327,7 @@ extern ktime_t ktime_get(void);
+ extern ktime_t ktime_get_real(void);
+ extern ktime_t ktime_get_boottime(void);
+ extern ktime_t ktime_get_monotonic_offset(void);
++extern ktime_t ktime_get_update_offsets(ktime_t *offs_real, ktime_t *offs_boot);
+ 
+ DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
+ 
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index d5d0e5d..4938c5e 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -1240,6 +1240,40 @@ void get_xtime_and_monotonic_and_sleep_offset(struct timespec *xtim,
+ 	} while (read_seqretry(&xtime_lock, seq));
+ }
+ 
++#ifdef CONFIG_HIGH_RES_TIMERS
++/**
++ * ktime_get_update_offsets - hrtimer helper
++ * @real:	pointer to storage for monotonic -> realtime offset
++ * @_boot:	pointer to storage for monotonic -> boottime offset
++ *
++ * Returns current monotonic time and updates the offsets
++ * Called from hrtimer_interupt() or retrigger_next_event()
++ */
++ktime_t ktime_get_update_offsets(ktime_t *real, ktime_t *boot)
++{
++	ktime_t now;
++	unsigned int seq;
++	u64 secs, nsecs;
++
++	do {
++		seq = read_seqbegin(&xtime_lock);
++
++		secs = xtime.tv_sec;
++		nsecs = xtime.tv_nsec;
++		nsecs += timekeeping_get_ns();
++		/* If arch requires, add in gettimeoffset() */
++		nsecs += arch_gettimeoffset();
++
++		*real = offs_real;
++		*boot = offs_boot;
++	} while (read_seqretry(&xtime_lock, seq));
++
++	now = ktime_add_ns(ktime_set(secs, 0), nsecs);
++	now = ktime_sub(now, *real);
++	return now;
++}
++#endif
++
+ /**
+  * ktime_get_monotonic_offset() - get wall_to_monotonic in ktime_t format
+  */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0083-hrtimer-Update-hrtimer-base-offsets-each-hrtimer_int.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0083-hrtimer-Update-hrtimer-base-offsets-each-hrtimer_int.patch
new file mode 100644
index 0000000..d047f31
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0083-hrtimer-Update-hrtimer-base-offsets-each-hrtimer_int.patch
@@ -0,0 +1,125 @@
+From 532c526ac9349430b41f6a16f32fc808c4270647 Mon Sep 17 00:00:00 2001
+From: John Stultz <johnstul@us.ibm.com>
+Date: Tue, 10 Jul 2012 18:43:25 -0400
+Subject: [PATCH 083/109] hrtimer: Update hrtimer base offsets each
+ hrtimer_interrupt
+
+commit 5baefd6d84163443215f4a99f6a20f054ef11236 upstream.
+
+The update of the hrtimer base offsets on all cpus cannot be made
+atomically from the timekeeper.lock held and interrupt disabled region
+as smp function calls are not allowed there.
+
+clock_was_set(), which enforces the update on all cpus, is called
+either from preemptible process context in case of do_settimeofday()
+or from the softirq context when the offset modification happened in
+the timer interrupt itself due to a leap second.
+
+In both cases there is a race window for an hrtimer interrupt between
+dropping timekeeper lock, enabling interrupts and clock_was_set()
+issuing the updates. Any interrupt which arrives in that window will
+see the new time but operate on stale offsets.
+
+So we need to make sure that an hrtimer interrupt always sees a
+consistent state of time and offsets.
+
+ktime_get_update_offsets() allows us to get the current monotonic time
+and update the per cpu hrtimer base offsets from hrtimer_interrupt()
+to capture a consistent state of monotonic time and the offsets. The
+function replaces the existing ktime_get() calls in hrtimer_interrupt().
+
+The overhead of the new function vs. ktime_get() is minimal as it just
+adds two store operations.
+
+This ensures that any changes to realtime or boottime offsets are
+noticed and stored into the per-cpu hrtimer base structures, prior to
+any hrtimer expiration and guarantees that timers are not expired early.
+
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Reviewed-by: Ingo Molnar <mingo@kernel.org>
+Acked-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Prarit Bhargava <prarit@redhat.com>
+Link: http://lkml.kernel.org/r/1341960205-56738-8-git-send-email-johnstul@us.ibm.com
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/hrtimer.c |   28 ++++++++++++++--------------
+ 1 files changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/kernel/hrtimer.c b/kernel/hrtimer.c
+index 8f320af..6db7a5e 100644
+--- a/kernel/hrtimer.c
++++ b/kernel/hrtimer.c
+@@ -657,6 +657,14 @@ static inline int hrtimer_enqueue_reprogram(struct hrtimer *timer,
+ 	return 0;
+ }
+ 
++static inline ktime_t hrtimer_update_base(struct hrtimer_cpu_base *base)
++{
++	ktime_t *offs_real = &base->clock_base[HRTIMER_BASE_REALTIME].offset;
++	ktime_t *offs_boot = &base->clock_base[HRTIMER_BASE_BOOTTIME].offset;
++
++	return ktime_get_update_offsets(offs_real, offs_boot);
++}
++
+ /*
+  * Retrigger next event is called after clock was set
+  *
+@@ -665,22 +673,12 @@ static inline int hrtimer_enqueue_reprogram(struct hrtimer *timer,
+ static void retrigger_next_event(void *arg)
+ {
+ 	struct hrtimer_cpu_base *base = &__get_cpu_var(hrtimer_bases);
+-	struct timespec realtime_offset, xtim, wtm, sleep;
+ 
+ 	if (!hrtimer_hres_active())
+ 		return;
+ 
+-	/* Optimized out for !HIGH_RES */
+-	get_xtime_and_monotonic_and_sleep_offset(&xtim, &wtm, &sleep);
+-	set_normalized_timespec(&realtime_offset, -wtm.tv_sec, -wtm.tv_nsec);
+-
+-	/* Adjust CLOCK_REALTIME offset */
+ 	raw_spin_lock(&base->lock);
+-	base->clock_base[HRTIMER_BASE_REALTIME].offset =
+-		timespec_to_ktime(realtime_offset);
+-	base->clock_base[HRTIMER_BASE_BOOTTIME].offset =
+-		timespec_to_ktime(sleep);
+-
++	hrtimer_update_base(base);
+ 	hrtimer_force_reprogram(base, 0);
+ 	raw_spin_unlock(&base->lock);
+ }
+@@ -710,7 +708,6 @@ static int hrtimer_switch_to_hres(void)
+ 		base->clock_base[i].resolution = KTIME_HIGH_RES;
+ 
+ 	tick_setup_sched_timer();
+-
+ 	/* "Retrigger" the interrupt to get things going */
+ 	retrigger_next_event(NULL);
+ 	local_irq_restore(flags);
+@@ -1264,7 +1261,7 @@ void hrtimer_interrupt(struct clock_event_device *dev)
+ 	dev->next_event.tv64 = KTIME_MAX;
+ 
+ 	raw_spin_lock(&cpu_base->lock);
+-	entry_time = now = ktime_get();
++	entry_time = now = hrtimer_update_base(cpu_base);
+ retry:
+ 	expires_next.tv64 = KTIME_MAX;
+ 	/*
+@@ -1342,9 +1339,12 @@ retry:
+ 	 * We need to prevent that we loop forever in the hrtimer
+ 	 * interrupt routine. We give it 3 attempts to avoid
+ 	 * overreacting on some spurious event.
++	 *
++	 * Acquire base lock for updating the offsets and retrieving
++	 * the current time.
+ 	 */
+ 	raw_spin_lock(&cpu_base->lock);
+-	now = ktime_get();
++	now = hrtimer_update_base(cpu_base);
+ 	cpu_base->nr_retries++;
+ 	if (++retries < 3)
+ 		goto retry;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0084-timekeeping-Add-missing-update-call-in-timekeeping_r.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0084-timekeeping-Add-missing-update-call-in-timekeeping_r.patch
new file mode 100644
index 0000000..06445f0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0084-timekeeping-Add-missing-update-call-in-timekeeping_r.patch
@@ -0,0 +1,57 @@
+From 666e725f56fc4c9a6e4f0e00b5a180866863f724 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Mon, 16 Jul 2012 12:50:42 -0400
+Subject: [PATCH 084/109] timekeeping: Add missing update call in
+ timekeeping_resume()
+
+This is a backport of 3e997130bd2e8c6f5aaa49d6e3161d4d29b43ab0
+
+The leap second rework unearthed another issue of inconsistent data.
+
+On timekeeping_resume() the timekeeper data is updated, but nothing
+calls timekeeping_update(), so now the update code in the timer
+interrupt sees stale values.
+
+This has been the case before those changes, but then the timer
+interrupt was using stale data as well so this went unnoticed for quite
+some time.
+
+Add the missing update call, so all the data is consistent everywhere.
+
+Reported-by: Andreas Schwab <schwab@linux-m68k.org>
+Reported-and-tested-by: "Rafael J. Wysocki" <rjw@sisk.pl>
+Reported-and-tested-by: Martin Steigerwald <Martin@lichtvoll.de>
+Cc: LKML <linux-kernel@vger.kernel.org>
+Cc: Linux PM list <linux-pm@vger.kernel.org>
+Cc: John Stultz <johnstul@us.ibm.com>
+Cc: Ingo Molnar <mingo@kernel.org>
+Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>,
+Cc: Prarit Bhargava <prarit@redhat.com>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+[John Stultz: Backported to 3.2]
+Cc: Prarit Bhargava <prarit@redhat.com>
+Cc: Thomas Gleixner <tglx@linutronix.de>
+Cc: Linux Kernel <linux-kernel@vger.kernel.org>
+Signed-off-by: John Stultz <johnstul@us.ibm.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/time/timekeeping.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
+index 4938c5e..03e67d4 100644
+--- a/kernel/time/timekeeping.c
++++ b/kernel/time/timekeeping.c
+@@ -699,6 +699,7 @@ static void timekeeping_resume(void)
+ 	timekeeper.clock->cycle_last = timekeeper.clock->read(timekeeper.clock);
+ 	timekeeper.ntp_error = 0;
+ 	timekeeping_suspended = 0;
++	timekeeping_update(false);
+ 	write_sequnlock_irqrestore(&xtime_lock, flags);
+ 
+ 	touch_softlockup_watchdog();
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0085-powerpc-Fix-wrong-divisor-in-usecs_to_cputime.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0085-powerpc-Fix-wrong-divisor-in-usecs_to_cputime.patch
new file mode 100644
index 0000000..eb4249f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0085-powerpc-Fix-wrong-divisor-in-usecs_to_cputime.patch
@@ -0,0 +1,87 @@
+From ec9436c865d11ebd0fd6909a9ef2a63e5536ff29 Mon Sep 17 00:00:00 2001
+From: Andreas Schwab <schwab@linux-m68k.org>
+Date: Fri, 9 Dec 2011 11:35:08 +0000
+Subject: [PATCH 085/109] powerpc: Fix wrong divisor in usecs_to_cputime
+
+commit 9f5072d4f63f28d30d343573830ac6c85fc0deff upstream.
+
+Commit d57af9b (taskstats: use real microsecond granularity for CPU times)
+renamed msecs_to_cputime to usecs_to_cputime, but failed to update all
+numbers on the way.  This causes nonsensical cpu idle/iowait values to be
+displayed in /proc/stat (the only user of usecs_to_cputime so far).
+
+This also renames __cputime_msec_factor to __cputime_usec_factor, adapting
+its value and using it directly in cputime_to_usecs instead of doing two
+multiplications.
+
+Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
+Acked-by: Anton Blanchard <anton@samba.org>
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/powerpc/include/asm/cputime.h |    6 +++---
+ arch/powerpc/kernel/time.c         |   10 +++++-----
+ 2 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
+index 98b7c4b..fa3f921 100644
+--- a/arch/powerpc/include/asm/cputime.h
++++ b/arch/powerpc/include/asm/cputime.h
+@@ -126,11 +126,11 @@ static inline u64 cputime64_to_jiffies64(const cputime_t ct)
+ /*
+  * Convert cputime <-> microseconds
+  */
+-extern u64 __cputime_msec_factor;
++extern u64 __cputime_usec_factor;
+ 
+ static inline unsigned long cputime_to_usecs(const cputime_t ct)
+ {
+-	return mulhdu(ct, __cputime_msec_factor) * USEC_PER_MSEC;
++	return mulhdu(ct, __cputime_usec_factor);
+ }
+ 
+ static inline cputime_t usecs_to_cputime(const unsigned long us)
+@@ -143,7 +143,7 @@ static inline cputime_t usecs_to_cputime(const unsigned long us)
+ 	sec = us / 1000000;
+ 	if (ct) {
+ 		ct *= tb_ticks_per_sec;
+-		do_div(ct, 1000);
++		do_div(ct, 1000000);
+ 	}
+ 	if (sec)
+ 		ct += (cputime_t) sec * tb_ticks_per_sec;
+diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
+index 5db163c..ec8affe 100644
+--- a/arch/powerpc/kernel/time.c
++++ b/arch/powerpc/kernel/time.c
+@@ -168,13 +168,13 @@ EXPORT_SYMBOL_GPL(ppc_tb_freq);
+ #ifdef CONFIG_VIRT_CPU_ACCOUNTING
+ /*
+  * Factors for converting from cputime_t (timebase ticks) to
+- * jiffies, milliseconds, seconds, and clock_t (1/USER_HZ seconds).
++ * jiffies, microseconds, seconds, and clock_t (1/USER_HZ seconds).
+  * These are all stored as 0.64 fixed-point binary fractions.
+  */
+ u64 __cputime_jiffies_factor;
+ EXPORT_SYMBOL(__cputime_jiffies_factor);
+-u64 __cputime_msec_factor;
+-EXPORT_SYMBOL(__cputime_msec_factor);
++u64 __cputime_usec_factor;
++EXPORT_SYMBOL(__cputime_usec_factor);
+ u64 __cputime_sec_factor;
+ EXPORT_SYMBOL(__cputime_sec_factor);
+ u64 __cputime_clockt_factor;
+@@ -192,8 +192,8 @@ static void calc_cputime_factors(void)
+ 
+ 	div128_by_32(HZ, 0, tb_ticks_per_sec, &res);
+ 	__cputime_jiffies_factor = res.result_low;
+-	div128_by_32(1000, 0, tb_ticks_per_sec, &res);
+-	__cputime_msec_factor = res.result_low;
++	div128_by_32(1000000, 0, tb_ticks_per_sec, &res);
++	__cputime_usec_factor = res.result_low;
+ 	div128_by_32(1, 0, tb_ticks_per_sec, &res);
+ 	__cputime_sec_factor = res.result_low;
+ 	div128_by_32(USER_HZ, 0, tb_ticks_per_sec, &res);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0086-vhost-don-t-forget-to-schedule.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0086-vhost-don-t-forget-to-schedule.patch
new file mode 100644
index 0000000..fded3c6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0086-vhost-don-t-forget-to-schedule.patch
@@ -0,0 +1,60 @@
+From 164965e103d2cfc11c59b563aa95ce2e8c372b65 Mon Sep 17 00:00:00 2001
+From: Nadav Har'El <nyh@math.technion.ac.il>
+Date: Mon, 27 Feb 2012 15:07:29 +0200
+Subject: [PATCH 086/109] vhost: don't forget to schedule()
+
+commit d550dda192c1bd039afb774b99485e88b70d7cb8 upstream.
+
+This is a tiny, but important, patch to vhost.
+
+Vhost's worker thread only called schedule() when it had no work to do, and
+it wanted to go to sleep. But if there's always work to do, e.g., the guest
+is running a network-intensive program like netperf with small message sizes,
+schedule() was *never* called. This had several negative implications (on
+non-preemptive kernels):
+
+ 1. Passing time was not properly accounted to the "vhost" process (ps and
+    top would wrongly show it using zero CPU time).
+
+ 2. Sometimes error messages about RCU timeouts would be printed, if the
+    core running the vhost thread didn't schedule() for a very long time.
+
+ 3. Worst of all, a vhost thread would "hog" the core. If several vhost
+    threads need to share the same core, typically one would get most of the
+    CPU time (and its associated guest most of the performance), while the
+    others hardly get any work done.
+
+The trivial solution is to add
+
+	if (need_resched())
+		schedule();
+
+After doing every piece of work. This will not do the heavy schedule() all
+the time, just when the timer interrupt decided a reschedule is warranted
+(so need_resched returns true).
+
+Thanks to Abel Gordon for this patch.
+
+Signed-off-by: Nadav Har'El <nyh@il.ibm.com>
+Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/vhost/vhost.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/vhost/vhost.c b/drivers/vhost/vhost.c
+index c14c42b..ae66278 100644
+--- a/drivers/vhost/vhost.c
++++ b/drivers/vhost/vhost.c
+@@ -222,6 +222,8 @@ static int vhost_worker(void *data)
+ 		if (work) {
+ 			__set_current_state(TASK_RUNNING);
+ 			work->fn(work);
++			if (need_resched())
++				schedule();
+ 		} else
+ 			schedule();
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0087-r8169-call-netif_napi_del-at-errpaths-and-at-driver-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0087-r8169-call-netif_napi_del-at-errpaths-and-at-driver-.patch
new file mode 100644
index 0000000..8fd5527
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0087-r8169-call-netif_napi_del-at-errpaths-and-at-driver-.patch
@@ -0,0 +1,43 @@
+From 87b62a139d4385f3726820674127eaee29fc7cff Mon Sep 17 00:00:00 2001
+From: Devendra Naga <devendra.aaru@gmail.com>
+Date: Thu, 31 May 2012 01:51:20 +0000
+Subject: [PATCH 087/109] r8169: call netif_napi_del at errpaths and at driver
+ unload
+
+commit ad1be8d345416a794dea39761a374032aa471a76 upstream.
+
+when register_netdev fails, the init'ed NAPIs by netif_napi_add must be
+deleted with netif_napi_del, and also when driver unloads, it should
+delete the NAPI before unregistering netdevice using unregister_netdev.
+
+Signed-off-by: Devendra Naga <devendra.aaru@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/realtek/r8169.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
+index cc2565c..9e61d6b 100644
+--- a/drivers/net/ethernet/realtek/r8169.c
++++ b/drivers/net/ethernet/realtek/r8169.c
+@@ -4185,6 +4185,7 @@ out:
+ 	return rc;
+ 
+ err_out_msi_4:
++	netif_napi_del(&tp->napi);
+ 	rtl_disable_msi(pdev, tp);
+ 	iounmap(ioaddr);
+ err_out_free_res_3:
+@@ -4210,6 +4211,8 @@ static void __devexit rtl8169_remove_one(struct pci_dev *pdev)
+ 
+ 	cancel_delayed_work_sync(&tp->task);
+ 
++	netif_napi_del(&tp->napi);
++
+ 	unregister_netdev(dev);
+ 
+ 	rtl_release_firmware(tp);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0088-bnx2x-fix-checksum-validation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0088-bnx2x-fix-checksum-validation.patch
new file mode 100644
index 0000000..1a6bce5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0088-bnx2x-fix-checksum-validation.patch
@@ -0,0 +1,112 @@
+From 4ffefa650ebbe2ef8bc2babff2e5686c33a2dab3 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Tue, 12 Jun 2012 23:50:04 +0000
+Subject: [PATCH 088/109] bnx2x: fix checksum validation
+
+commit d6cb3e41386f20fb0777d0b59a2def82c65d37f7 upstream.
+
+bnx2x driver incorrectly sets ip_summed to CHECKSUM_UNNECESSARY on
+encapsulated segments. TCP stack happily accepts frames with bad
+checksums, if they are inside a GRE or IPIP encapsulation.
+
+Our understanding is that if no IP or L4 csum validation was done by the
+hardware, we should leave ip_summed as is (CHECKSUM_NONE), since
+hardware doesn't provide CHECKSUM_COMPLETE support in its cqe.
+
+Then, if IP/L4 checksumming was done by the hardware, set
+CHECKSUM_UNNECESSARY if no error was flagged.
+
+Patch based on findings and analysis from Robert Evans
+
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Cc: Eilon Greenstein <eilong@broadcom.com>
+Cc: Yaniv Rosner <yanivr@broadcom.com>
+Cc: Merav Sicron <meravs@broadcom.com>
+Cc: Tom Herbert <therbert@google.com>
+Cc: Robert Evans <evansr@google.com>
+Cc: Willem de Bruijn <willemb@google.com>
+Acked-by: Eilon Greenstein <eilong@broadcom.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+[bwh: Backported to 3.2: adjust context, indentation]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/broadcom/bnx2x/bnx2x.h     |   15 ------------
+ drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c |   28 ++++++++++++++++++-----
+ 2 files changed, 22 insertions(+), 21 deletions(-)
+
+diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+index aec7212..8dda46a 100644
+--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
++++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x.h
+@@ -723,21 +723,6 @@ struct bnx2x_fastpath {
+ 
+ #define ETH_RX_ERROR_FALGS		ETH_FAST_PATH_RX_CQE_PHY_DECODE_ERR_FLG
+ 
+-#define BNX2X_IP_CSUM_ERR(cqe) \
+-			(!((cqe)->fast_path_cqe.status_flags & \
+-			   ETH_FAST_PATH_RX_CQE_IP_XSUM_NO_VALIDATION_FLG) && \
+-			 ((cqe)->fast_path_cqe.type_error_flags & \
+-			  ETH_FAST_PATH_RX_CQE_IP_BAD_XSUM_FLG))
+-
+-#define BNX2X_L4_CSUM_ERR(cqe) \
+-			(!((cqe)->fast_path_cqe.status_flags & \
+-			   ETH_FAST_PATH_RX_CQE_L4_XSUM_NO_VALIDATION_FLG) && \
+-			 ((cqe)->fast_path_cqe.type_error_flags & \
+-			  ETH_FAST_PATH_RX_CQE_L4_BAD_XSUM_FLG))
+-
+-#define BNX2X_RX_CSUM_OK(cqe) \
+-			(!(BNX2X_L4_CSUM_ERR(cqe) || BNX2X_IP_CSUM_ERR(cqe)))
+-
+ #define BNX2X_PRS_FLAG_OVERETH_IPV4(flags) \
+ 				(((le16_to_cpu(flags) & \
+ 				   PARSING_FLAGS_OVER_ETHERNET_PROTOCOL) >> \
+diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+index 580b44e..27d6d6c 100644
+--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
++++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+@@ -551,6 +551,26 @@ static inline void bnx2x_set_skb_rxhash(struct bnx2x *bp, union eth_rx_cqe *cqe,
+ 		le32_to_cpu(cqe->fast_path_cqe.rss_hash_result);
+ }
+ 
++static void bnx2x_csum_validate(struct sk_buff *skb, union eth_rx_cqe *cqe,
++				struct bnx2x_fastpath *fp)
++{
++	/* Do nothing if no IP/L4 csum validation was done */
++
++	if (cqe->fast_path_cqe.status_flags &
++	    (ETH_FAST_PATH_RX_CQE_IP_XSUM_NO_VALIDATION_FLG |
++	     ETH_FAST_PATH_RX_CQE_L4_XSUM_NO_VALIDATION_FLG))
++		return;
++
++	/* If both IP/L4 validation were done, check if an error was found. */
++
++	if (cqe->fast_path_cqe.type_error_flags &
++	    (ETH_FAST_PATH_RX_CQE_IP_BAD_XSUM_FLG |
++	     ETH_FAST_PATH_RX_CQE_L4_BAD_XSUM_FLG))
++		fp->eth_q_stats.hw_csum_err++;
++	else
++		skb->ip_summed = CHECKSUM_UNNECESSARY;
++}
++
+ int bnx2x_rx_int(struct bnx2x_fastpath *fp, int budget)
+ {
+ 	struct bnx2x *bp = fp->bp;
+@@ -746,13 +766,9 @@ reuse_rx:
+ 
+ 			skb_checksum_none_assert(skb);
+ 
+-			if (bp->dev->features & NETIF_F_RXCSUM) {
++			if (bp->dev->features & NETIF_F_RXCSUM)
++				bnx2x_csum_validate(skb, cqe, fp);
+ 
+-				if (likely(BNX2X_RX_CSUM_OK(cqe)))
+-					skb->ip_summed = CHECKSUM_UNNECESSARY;
+-				else
+-					fp->eth_q_stats.hw_csum_err++;
+-			}
+ 		}
+ 
+ 		skb_record_rx_queue(skb, fp->index);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0089-bnx2x-fix-panic-when-TX-ring-is-full.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0089-bnx2x-fix-panic-when-TX-ring-is-full.patch
new file mode 100644
index 0000000..d21ce22
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0089-bnx2x-fix-panic-when-TX-ring-is-full.patch
@@ -0,0 +1,75 @@
+From 9a59f534e5f1d432bf63f0ed6cb184b1ce988063 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Wed, 13 Jun 2012 09:45:16 +0000
+Subject: [PATCH 089/109] bnx2x: fix panic when TX ring is full
+
+commit bc14786a100cc6a81cd060e8031ec481241b418c upstream.
+
+There is a off by one error in the minimal number of BD in
+bnx2x_start_xmit() and bnx2x_tx_int() before stopping/resuming tx queue.
+
+A full size GSO packet, with data included in skb->head really needs
+(MAX_SKB_FRAGS + 4) BDs, because of bnx2x_tx_split()
+
+This error triggers if BQL is disabled and heavy TCP transmit traffic
+occurs.
+
+bnx2x_tx_split() definitely can be called, remove a wrong comment.
+
+Reported-by: Tomas Hruby <thruby@google.com>
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Cc: Eilon Greenstein <eilong@broadcom.com>
+Cc: Yaniv Rosner <yanivr@broadcom.com>
+Cc: Merav Sicron <meravs@broadcom.com>
+Cc: Tom Herbert <therbert@google.com>
+Cc: Robert Evans <evansr@google.com>
+Cc: Willem de Bruijn <willemb@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c |    8 +++-----
+ 1 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+index 27d6d6c..2c1a5c0 100644
+--- a/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
++++ b/drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c
+@@ -220,7 +220,7 @@ int bnx2x_tx_int(struct bnx2x *bp, struct bnx2x_fp_txdata *txdata)
+ 
+ 		if ((netif_tx_queue_stopped(txq)) &&
+ 		    (bp->state == BNX2X_STATE_OPEN) &&
+-		    (bnx2x_tx_avail(bp, txdata) >= MAX_SKB_FRAGS + 3))
++		    (bnx2x_tx_avail(bp, txdata) >= MAX_SKB_FRAGS + 4))
+ 			netif_tx_wake_queue(txq);
+ 
+ 		__netif_tx_unlock(txq);
+@@ -2254,8 +2254,6 @@ int bnx2x_poll(struct napi_struct *napi, int budget)
+ /* we split the first BD into headers and data BDs
+  * to ease the pain of our fellow microcode engineers
+  * we use one mapping for both BDs
+- * So far this has only been observed to happen
+- * in Other Operating Systems(TM)
+  */
+ static noinline u16 bnx2x_tx_split(struct bnx2x *bp,
+ 				   struct bnx2x_fp_txdata *txdata,
+@@ -2906,7 +2904,7 @@ netdev_tx_t bnx2x_start_xmit(struct sk_buff *skb, struct net_device *dev)
+ 
+ 	txdata->tx_bd_prod += nbd;
+ 
+-	if (unlikely(bnx2x_tx_avail(bp, txdata) < MAX_SKB_FRAGS + 3)) {
++	if (unlikely(bnx2x_tx_avail(bp, txdata) < MAX_SKB_FRAGS + 4)) {
+ 		netif_tx_stop_queue(txq);
+ 
+ 		/* paired memory barrier is in bnx2x_tx_int(), we have to keep
+@@ -2915,7 +2913,7 @@ netdev_tx_t bnx2x_start_xmit(struct sk_buff *skb, struct net_device *dev)
+ 		smp_mb();
+ 
+ 		fp->eth_q_stats.driver_xoff++;
+-		if (bnx2x_tx_avail(bp, txdata) >= MAX_SKB_FRAGS + 3)
++		if (bnx2x_tx_avail(bp, txdata) >= MAX_SKB_FRAGS + 4)
+ 			netif_tx_wake_queue(txq);
+ 	}
+ 	txdata->tx_pkt++;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0090-net-remove-skb_orphan_try.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0090-net-remove-skb_orphan_try.patch
new file mode 100644
index 0000000..6072803
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0090-net-remove-skb_orphan_try.patch
@@ -0,0 +1,135 @@
+From 401354ebe4d79d6edf536ad7b69e59afeec81308 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <edumazet@google.com>
+Date: Thu, 14 Jun 2012 06:42:44 +0000
+Subject: [PATCH 090/109] net: remove skb_orphan_try()
+
+commit 62b1a8ab9b3660bb820d8dfe23148ed6cda38574 upstream.
+
+Orphaning skb in dev_hard_start_xmit() makes bonding behavior
+unfriendly for applications sending big UDP bursts : Once packets
+pass the bonding device and come to real device, they might hit a full
+qdisc and be dropped. Without orphaning, the sender is automatically
+throttled because sk->sk_wmemalloc reaches sk->sk_sndbuf (assuming
+sk_sndbuf is not too big)
+
+We could try to defer the orphaning adding another test in
+dev_hard_start_xmit(), but all this seems of little gain,
+now that BQL tends to make packets more likely to be parked
+in Qdisc queues instead of NIC TX ring, in cases where performance
+matters.
+
+Reverts commits :
+fc6055a5ba31 net: Introduce skb_orphan_try()
+87fd308cfc6b net: skb_tx_hash() fix relative to skb_orphan_try()
+and removes SKBTX_DRV_NEEDS_SK_REF flag
+
+Reported-and-bisected-by: Jean-Michel Hautbois <jhautbois@gmail.com>
+Signed-off-by: Eric Dumazet <edumazet@google.com>
+Tested-by: Oliver Hartkopp <socketcan@hartkopp.net>
+Acked-by: Oliver Hartkopp <socketcan@hartkopp.net>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+[bwh: Backported to 3.2:
+ - Adjust context
+ - SKBTX_WIFI_STATUS is not defined]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/skbuff.h |    5 +----
+ net/can/raw.c          |    3 ---
+ net/core/dev.c         |   23 +----------------------
+ net/iucv/af_iucv.c     |    1 -
+ 4 files changed, 2 insertions(+), 30 deletions(-)
+
+diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
+index bdb4590..53dc7e7 100644
+--- a/include/linux/skbuff.h
++++ b/include/linux/skbuff.h
+@@ -213,11 +213,8 @@ enum {
+ 	/* device driver is going to provide hardware time stamp */
+ 	SKBTX_IN_PROGRESS = 1 << 2,
+ 
+-	/* ensure the originating sk reference is available on driver level */
+-	SKBTX_DRV_NEEDS_SK_REF = 1 << 3,
+-
+ 	/* device driver supports TX zero-copy buffers */
+-	SKBTX_DEV_ZEROCOPY = 1 << 4,
++	SKBTX_DEV_ZEROCOPY = 1 << 3,
+ };
+ 
+ /*
+diff --git a/net/can/raw.c b/net/can/raw.c
+index cde1b4a..46cca3a 100644
+--- a/net/can/raw.c
++++ b/net/can/raw.c
+@@ -681,9 +681,6 @@ static int raw_sendmsg(struct kiocb *iocb, struct socket *sock,
+ 	if (err < 0)
+ 		goto free_skb;
+ 
+-	/* to be able to check the received tx sock reference in raw_rcv() */
+-	skb_shinfo(skb)->tx_flags |= SKBTX_DRV_NEEDS_SK_REF;
+-
+ 	skb->dev = dev;
+ 	skb->sk  = sk;
+ 
+diff --git a/net/core/dev.c b/net/core/dev.c
+index 1cbddc9..5738654 100644
+--- a/net/core/dev.c
++++ b/net/core/dev.c
+@@ -2079,25 +2079,6 @@ static int dev_gso_segment(struct sk_buff *skb, int features)
+ 	return 0;
+ }
+ 
+-/*
+- * Try to orphan skb early, right before transmission by the device.
+- * We cannot orphan skb if tx timestamp is requested or the sk-reference
+- * is needed on driver level for other reasons, e.g. see net/can/raw.c
+- */
+-static inline void skb_orphan_try(struct sk_buff *skb)
+-{
+-	struct sock *sk = skb->sk;
+-
+-	if (sk && !skb_shinfo(skb)->tx_flags) {
+-		/* skb_tx_hash() wont be able to get sk.
+-		 * We copy sk_hash into skb->rxhash
+-		 */
+-		if (!skb->rxhash)
+-			skb->rxhash = sk->sk_hash;
+-		skb_orphan(skb);
+-	}
+-}
+-
+ static bool can_checksum_protocol(unsigned long features, __be16 protocol)
+ {
+ 	return ((features & NETIF_F_GEN_CSUM) ||
+@@ -2182,8 +2163,6 @@ int dev_hard_start_xmit(struct sk_buff *skb, struct net_device *dev,
+ 		if (!list_empty(&ptype_all))
+ 			dev_queue_xmit_nit(skb, dev);
+ 
+-		skb_orphan_try(skb);
+-
+ 		features = netif_skb_features(skb);
+ 
+ 		if (vlan_tx_tag_present(skb) &&
+@@ -2293,7 +2272,7 @@ u16 __skb_tx_hash(const struct net_device *dev, const struct sk_buff *skb,
+ 	if (skb->sk && skb->sk->sk_hash)
+ 		hash = skb->sk->sk_hash;
+ 	else
+-		hash = (__force u16) skb->protocol ^ skb->rxhash;
++		hash = (__force u16) skb->protocol;
+ 	hash = jhash_1word(hash, hashrnd);
+ 
+ 	return (u16) (((u64) hash * qcount) >> 32) + qoffset;
+diff --git a/net/iucv/af_iucv.c b/net/iucv/af_iucv.c
+index 274d150..cf98d62 100644
+--- a/net/iucv/af_iucv.c
++++ b/net/iucv/af_iucv.c
+@@ -380,7 +380,6 @@ static int afiucv_hs_send(struct iucv_message *imsg, struct sock *sock,
+ 			skb_trim(skb, skb->dev->mtu);
+ 	}
+ 	skb->protocol = ETH_P_AF_IUCV;
+-	skb_shinfo(skb)->tx_flags |= SKBTX_DRV_NEEDS_SK_REF;
+ 	nskb = skb_clone(skb, GFP_ATOMIC);
+ 	if (!nskb)
+ 		return -ENOMEM;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0091-ACPI-Make-acpi_skip_timer_override-cover-all-source_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0091-ACPI-Make-acpi_skip_timer_override-cover-all-source_.patch
new file mode 100644
index 0000000..6db854d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0091-ACPI-Make-acpi_skip_timer_override-cover-all-source_.patch
@@ -0,0 +1,78 @@
+From 16fe1810332abe3998fa2e0760af7f8ca5f701d6 Mon Sep 17 00:00:00 2001
+From: Feng Tang <feng.tang@intel.com>
+Date: Mon, 4 Jun 2012 15:00:04 +0800
+Subject: [PATCH 091/109] ACPI: Make acpi_skip_timer_override cover all
+ source_irq==0 cases
+
+commit ae10ccdc3093486f8c2369d227583f9d79f628e5 upstream.
+
+Currently when acpi_skip_timer_override is set, it only cover the
+(source_irq == 0 && global_irq == 2) cases. While there is also
+platform which need use this option and its global_irq is not 2.
+This patch will extend acpi_skip_timer_override to cover all
+timer overriding cases as long as the source irq is 0.
+
+This is the first part of a fix to kernel bug bugzilla 40002:
+	"IRQ 0 assigned to VGA"
+https://bugzilla.kernel.org/show_bug.cgi?id=40002
+
+Reported-and-tested-by: Szymon Kowalczyk <fazerxlo@o2.pl>
+Signed-off-by: Feng Tang <feng.tang@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/acpi/boot.c |   14 ++++++++------
+ 1 files changed, 8 insertions(+), 6 deletions(-)
+
+diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
+index 4558f0d..a94dc95 100644
+--- a/arch/x86/kernel/acpi/boot.c
++++ b/arch/x86/kernel/acpi/boot.c
+@@ -416,12 +416,14 @@ acpi_parse_int_src_ovr(struct acpi_subtable_header * header,
+ 		return 0;
+ 	}
+ 
+-	if (intsrc->source_irq == 0 && intsrc->global_irq == 2) {
++	if (intsrc->source_irq == 0) {
+ 		if (acpi_skip_timer_override) {
+-			printk(PREFIX "BIOS IRQ0 pin2 override ignored.\n");
++			printk(PREFIX "BIOS IRQ0 override ignored.\n");
+ 			return 0;
+ 		}
+-		if (acpi_fix_pin2_polarity && (intsrc->inti_flags & ACPI_MADT_POLARITY_MASK)) {
++
++		if ((intsrc->global_irq == 2) && acpi_fix_pin2_polarity
++			&& (intsrc->inti_flags & ACPI_MADT_POLARITY_MASK)) {
+ 			intsrc->inti_flags &= ~ACPI_MADT_POLARITY_MASK;
+ 			printk(PREFIX "BIOS IRQ0 pin2 override: forcing polarity to high active.\n");
+ 		}
+@@ -1327,7 +1329,7 @@ static int __init dmi_disable_acpi(const struct dmi_system_id *d)
+ }
+ 
+ /*
+- * Force ignoring BIOS IRQ0 pin2 override
++ * Force ignoring BIOS IRQ0 override
+  */
+ static int __init dmi_ignore_irq0_timer_override(const struct dmi_system_id *d)
+ {
+@@ -1337,7 +1339,7 @@ static int __init dmi_ignore_irq0_timer_override(const struct dmi_system_id *d)
+ 	 */
+ 	if (!acpi_skip_timer_override) {
+ 		WARN(1, KERN_ERR "ati_ixp4x0 quirk not complete.\n");
+-		pr_notice("%s detected: Ignoring BIOS IRQ0 pin2 override\n",
++		pr_notice("%s detected: Ignoring BIOS IRQ0 override\n",
+ 			d->ident);
+ 		acpi_skip_timer_override = 1;
+ 	}
+@@ -1431,7 +1433,7 @@ static struct dmi_system_id __initdata acpi_dmi_table_late[] = {
+ 	 * is enabled.  This input is incorrectly designated the
+ 	 * ISA IRQ 0 via an interrupt source override even though
+ 	 * it is wired to the output of the master 8259A and INTIN0
+-	 * is not connected at all.  Force ignoring BIOS IRQ0 pin2
++	 * is not connected at all.  Force ignoring BIOS IRQ0
+ 	 * override in that cases.
+ 	 */
+ 	{
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0092-ACPI-Remove-one-board-specific-WARN-when-ignoring-ti.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0092-ACPI-Remove-one-board-specific-WARN-when-ignoring-ti.patch
new file mode 100644
index 0000000..b7b8f11
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0092-ACPI-Remove-one-board-specific-WARN-when-ignoring-ti.patch
@@ -0,0 +1,42 @@
+From b9c36e346bdb1c7bd2edd7489561f94155195e6e Mon Sep 17 00:00:00 2001
+From: Feng Tang <feng.tang@intel.com>
+Date: Mon, 4 Jun 2012 15:00:05 +0800
+Subject: [PATCH 092/109] ACPI: Remove one board specific WARN when ignoring
+ timer overriding
+
+commit 5752cdb805ff89942d99d12118e2844e7db34df8 upstream.
+
+commit 7f68b4c2e158019c2ec494b5cfbd9c83b4e5b253 upstream.
+
+Current WARN msg is only for the ati_ixp4x0 board, while this function
+is used by mulitple platforms. So this one board specific warning
+is not appropriate any more.
+
+Signed-off-by: Feng Tang <feng.tang@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/acpi/boot.c |    5 -----
+ 1 files changed, 0 insertions(+), 5 deletions(-)
+
+diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
+index a94dc95..882960e 100644
+--- a/arch/x86/kernel/acpi/boot.c
++++ b/arch/x86/kernel/acpi/boot.c
+@@ -1333,12 +1333,7 @@ static int __init dmi_disable_acpi(const struct dmi_system_id *d)
+  */
+ static int __init dmi_ignore_irq0_timer_override(const struct dmi_system_id *d)
+ {
+-	/*
+-	 * The ati_ixp4x0_rev() early PCI quirk should have set
+-	 * the acpi_skip_timer_override flag already:
+-	 */
+ 	if (!acpi_skip_timer_override) {
+-		WARN(1, KERN_ERR "ati_ixp4x0 quirk not complete.\n");
+ 		pr_notice("%s detected: Ignoring BIOS IRQ0 override\n",
+ 			d->ident);
+ 		acpi_skip_timer_override = 1;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0093-ACPI-Add-a-quirk-for-AMILO-PRO-V2030-to-ignore-the-t.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0093-ACPI-Add-a-quirk-for-AMILO-PRO-V2030-to-ignore-the-t.patch
new file mode 100644
index 0000000..b1b5ff5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0093-ACPI-Add-a-quirk-for-AMILO-PRO-V2030-to-ignore-the-t.patch
@@ -0,0 +1,50 @@
+From 0430a8402ee6125c909ae3f4c3a89696e9a24077 Mon Sep 17 00:00:00 2001
+From: Feng Tang <feng.tang@intel.com>
+Date: Mon, 4 Jun 2012 15:00:06 +0800
+Subject: [PATCH 093/109] ACPI: Add a quirk for "AMILO PRO V2030" to ignore
+ the timer overriding
+
+commit b939c2acf1dc42b08407ef5174f2e8d6f43dd5ea upstream.
+
+commit f6b54f083cc66cf9b11d2120d8df3c2ad4e0836d upstream.
+
+This is the 2nd part of fix for kernel bugzilla 40002:
+    "IRQ 0 assigned to VGA"
+https://bugzilla.kernel.org/show_bug.cgi?id=40002
+
+The root cause is the buggy FW, whose ACPI tables assign the GSI 16
+to 2 irqs 0 and 16(VGA), and the VGA is the right owner of GSI 16.
+So add a quirk to ignore the irq0 overriding GSI 16 for the
+FUJITSU SIEMENS AMILO PRO V2030 platform will solve this issue.
+
+Reported-and-tested-by: Szymon Kowalczyk <fazerxlo@o2.pl>
+Signed-off-by: Feng Tang <feng.tang@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/acpi/boot.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/arch/x86/kernel/acpi/boot.c b/arch/x86/kernel/acpi/boot.c
+index 882960e..479d03c 100644
+--- a/arch/x86/kernel/acpi/boot.c
++++ b/arch/x86/kernel/acpi/boot.c
+@@ -1463,6 +1463,14 @@ static struct dmi_system_id __initdata acpi_dmi_table_late[] = {
+ 		     DMI_MATCH(DMI_PRODUCT_NAME, "HP Compaq 6715b"),
+ 		     },
+ 	 },
++	{
++	 .callback = dmi_ignore_irq0_timer_override,
++	 .ident = "FUJITSU SIEMENS",
++	 .matches = {
++		     DMI_MATCH(DMI_SYS_VENDOR, "FUJITSU SIEMENS"),
++		     DMI_MATCH(DMI_PRODUCT_NAME, "AMILO PRO V2030"),
++		     },
++	 },
+ 	{}
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0094-ACPI-x86-fix-Dell-M6600-ACPI-reboot-regression-via-D.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0094-ACPI-x86-fix-Dell-M6600-ACPI-reboot-regression-via-D.patch
new file mode 100644
index 0000000..8cdbeaa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0094-ACPI-x86-fix-Dell-M6600-ACPI-reboot-regression-via-D.patch
@@ -0,0 +1,43 @@
+From 66b7502a0d37876e547c5440aa34bee18e3b0f1e Mon Sep 17 00:00:00 2001
+From: Zhang Rui <rui.zhang@intel.com>
+Date: Mon, 20 Feb 2012 14:20:06 +0800
+Subject: [PATCH 094/109] ACPI, x86: fix Dell M6600 ACPI reboot regression via
+ DMI
+
+commit 76eb9a30db4bc8fd172f9155247264b5f2686d7b upstream.
+
+Dell Precision M6600 is known to require PCI reboot, so add it to
+the reboot blacklist in pci_reboot_dmi_table[].
+
+https://bugzilla.kernel.org/show_bug.cgi?id=42749
+
+cc: x86@kernel.org
+Signed-off-by: Zhang Rui <rui.zhang@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/reboot.c |    8 ++++++++
+ 1 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
+index 37a458b..e61f79c 100644
+--- a/arch/x86/kernel/reboot.c
++++ b/arch/x86/kernel/reboot.c
+@@ -460,6 +460,14 @@ static struct dmi_system_id __initdata pci_reboot_dmi_table[] = {
+ 			DMI_MATCH(DMI_PRODUCT_NAME, "OptiPlex 990"),
+ 		},
+ 	},
++	{	/* Handle problems with rebooting on the Precision M6600. */
++		.callback = set_pci_reboot,
++		.ident = "Dell OptiPlex 990",
++		.matches = {
++			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
++			DMI_MATCH(DMI_PRODUCT_NAME, "Precision M6600"),
++		},
++	},
+ 	{ }
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0095-ACPI-sysfs.c-strlen-fix.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0095-ACPI-sysfs.c-strlen-fix.patch
new file mode 100644
index 0000000..61a570b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0095-ACPI-sysfs.c-strlen-fix.patch
@@ -0,0 +1,43 @@
+From b563da2fc80658815355acc804d1b8c21d1a88f9 Mon Sep 17 00:00:00 2001
+From: Pavel Vasilyev <pavel@pavlinux.ru>
+Date: Tue, 5 Jun 2012 00:02:05 -0400
+Subject: [PATCH 095/109] ACPI sysfs.c strlen fix
+
+commit 9f132652d94c96476b0b0a8caf0c10e96ab10fa8 upstream.
+
+Current code is ignoring the last character of "enable" and "disable"
+in comparisons.
+
+https://bugzilla.kernel.org/show_bug.cgi?id=33732
+
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/acpi/sysfs.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/acpi/sysfs.c b/drivers/acpi/sysfs.c
+index 9f66181..240a244 100644
+--- a/drivers/acpi/sysfs.c
++++ b/drivers/acpi/sysfs.c
+@@ -173,7 +173,7 @@ static int param_set_trace_state(const char *val, struct kernel_param *kp)
+ {
+ 	int result = 0;
+ 
+-	if (!strncmp(val, "enable", strlen("enable") - 1)) {
++	if (!strncmp(val, "enable", strlen("enable"))) {
+ 		result = acpi_debug_trace(trace_method_name, trace_debug_level,
+ 					  trace_debug_layer, 0);
+ 		if (result)
+@@ -181,7 +181,7 @@ static int param_set_trace_state(const char *val, struct kernel_param *kp)
+ 		goto exit;
+ 	}
+ 
+-	if (!strncmp(val, "disable", strlen("disable") - 1)) {
++	if (!strncmp(val, "disable", strlen("disable"))) {
+ 		int name = 0;
+ 		result = acpi_debug_trace((char *)&name, trace_debug_level,
+ 					  trace_debug_layer, 0);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0096-eCryptfs-Gracefully-refuse-miscdev-file-ops-on-inher.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0096-eCryptfs-Gracefully-refuse-miscdev-file-ops-on-inher.patch
new file mode 100644
index 0000000..ba3b558
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0096-eCryptfs-Gracefully-refuse-miscdev-file-ops-on-inher.patch
@@ -0,0 +1,98 @@
+From 5daf178c74f17e523291b0c4eabbf3b3f3740b75 Mon Sep 17 00:00:00 2001
+From: Tyler Hicks <tyhicks@canonical.com>
+Date: Mon, 11 Jun 2012 09:24:11 -0700
+Subject: [PATCH 096/109] eCryptfs: Gracefully refuse miscdev file ops on
+ inherited/passed files
+
+commit 8dc6780587c99286c0d3de747a2946a76989414a upstream.
+
+File operations on /dev/ecryptfs would BUG() when the operations were
+performed by processes other than the process that originally opened the
+file. This could happen with open files inherited after fork() or file
+descriptors passed through IPC mechanisms. Rather than calling BUG(), an
+error code can be safely returned in most situations.
+
+In ecryptfs_miscdev_release(), eCryptfs still needs to handle the
+release even if the last file reference is being held by a process that
+didn't originally open the file. ecryptfs_find_daemon_by_euid() will not
+be successful, so a pointer to the daemon is stored in the file's
+private_data. The private_data pointer is initialized when the miscdev
+file is opened and only used when the file is released.
+
+https://launchpad.net/bugs/994247
+
+Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
+Reported-by: Sasha Levin <levinsasha928@gmail.com>
+Tested-by: Sasha Levin <levinsasha928@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ecryptfs/miscdev.c |   23 ++++++++++++++++-------
+ 1 files changed, 16 insertions(+), 7 deletions(-)
+
+diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
+index 0dc5a3d..a050e4b 100644
+--- a/fs/ecryptfs/miscdev.c
++++ b/fs/ecryptfs/miscdev.c
+@@ -49,7 +49,10 @@ ecryptfs_miscdev_poll(struct file *file, poll_table *pt)
+ 	mutex_lock(&ecryptfs_daemon_hash_mux);
+ 	/* TODO: Just use file->private_data? */
+ 	rc = ecryptfs_find_daemon_by_euid(&daemon, euid, current_user_ns());
+-	BUG_ON(rc || !daemon);
++	if (rc || !daemon) {
++		mutex_unlock(&ecryptfs_daemon_hash_mux);
++		return -EINVAL;
++	}
+ 	mutex_lock(&daemon->mux);
+ 	mutex_unlock(&ecryptfs_daemon_hash_mux);
+ 	if (daemon->flags & ECRYPTFS_DAEMON_ZOMBIE) {
+@@ -122,6 +125,7 @@ ecryptfs_miscdev_open(struct inode *inode, struct file *file)
+ 		goto out_unlock_daemon;
+ 	}
+ 	daemon->flags |= ECRYPTFS_DAEMON_MISCDEV_OPEN;
++	file->private_data = daemon;
+ 	atomic_inc(&ecryptfs_num_miscdev_opens);
+ out_unlock_daemon:
+ 	mutex_unlock(&daemon->mux);
+@@ -152,9 +156,9 @@ ecryptfs_miscdev_release(struct inode *inode, struct file *file)
+ 
+ 	mutex_lock(&ecryptfs_daemon_hash_mux);
+ 	rc = ecryptfs_find_daemon_by_euid(&daemon, euid, current_user_ns());
+-	BUG_ON(rc || !daemon);
++	if (rc || !daemon)
++		daemon = file->private_data;
+ 	mutex_lock(&daemon->mux);
+-	BUG_ON(daemon->pid != task_pid(current));
+ 	BUG_ON(!(daemon->flags & ECRYPTFS_DAEMON_MISCDEV_OPEN));
+ 	daemon->flags &= ~ECRYPTFS_DAEMON_MISCDEV_OPEN;
+ 	atomic_dec(&ecryptfs_num_miscdev_opens);
+@@ -246,8 +250,16 @@ ecryptfs_miscdev_read(struct file *file, char __user *buf, size_t count,
+ 	mutex_lock(&ecryptfs_daemon_hash_mux);
+ 	/* TODO: Just use file->private_data? */
+ 	rc = ecryptfs_find_daemon_by_euid(&daemon, euid, current_user_ns());
+-	BUG_ON(rc || !daemon);
++	if (rc || !daemon) {
++		mutex_unlock(&ecryptfs_daemon_hash_mux);
++		return -EINVAL;
++	}
+ 	mutex_lock(&daemon->mux);
++	if (task_pid(current) != daemon->pid) {
++		mutex_unlock(&daemon->mux);
++		mutex_unlock(&ecryptfs_daemon_hash_mux);
++		return -EPERM;
++	}
+ 	if (daemon->flags & ECRYPTFS_DAEMON_ZOMBIE) {
+ 		rc = 0;
+ 		mutex_unlock(&ecryptfs_daemon_hash_mux);
+@@ -284,9 +296,6 @@ check_list:
+ 		 * message from the queue; try again */
+ 		goto check_list;
+ 	}
+-	BUG_ON(euid != daemon->euid);
+-	BUG_ON(current_user_ns() != daemon->user_ns);
+-	BUG_ON(task_pid(current) != daemon->pid);
+ 	msg_ctx = list_first_entry(&daemon->msg_ctx_out_queue,
+ 				   struct ecryptfs_msg_ctx, daemon_out_list);
+ 	BUG_ON(!msg_ctx);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0097-eCryptfs-Fix-lockdep-warning-in-miscdev-operations.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0097-eCryptfs-Fix-lockdep-warning-in-miscdev-operations.patch
new file mode 100644
index 0000000..d4e453e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0097-eCryptfs-Fix-lockdep-warning-in-miscdev-operations.patch
@@ -0,0 +1,105 @@
+From 3b0dfe936fb38efde98e2650ff18587c3285eb2a Mon Sep 17 00:00:00 2001
+From: Tyler Hicks <tyhicks@canonical.com>
+Date: Mon, 11 Jun 2012 10:21:34 -0700
+Subject: [PATCH 097/109] eCryptfs: Fix lockdep warning in miscdev operations
+
+commit 60d65f1f07a7d81d3eb3b91fc13fca80f2fdbb12 upstream.
+
+Don't grab the daemon mutex while holding the message context mutex.
+Addresses this lockdep warning:
+
+ ecryptfsd/2141 is trying to acquire lock:
+  (&ecryptfs_msg_ctx_arr[i].mux){+.+.+.}, at: [<ffffffffa029c213>] ecryptfs_miscdev_read+0x143/0x470 [ecryptfs]
+
+ but task is already holding lock:
+  (&(*daemon)->mux){+.+...}, at: [<ffffffffa029c2ec>] ecryptfs_miscdev_read+0x21c/0x470 [ecryptfs]
+
+ which lock already depends on the new lock.
+
+ the existing dependency chain (in reverse order) is:
+
+ -> #1 (&(*daemon)->mux){+.+...}:
+        [<ffffffff810a3b8d>] lock_acquire+0x9d/0x220
+        [<ffffffff8151c6da>] __mutex_lock_common+0x5a/0x4b0
+        [<ffffffff8151cc64>] mutex_lock_nested+0x44/0x50
+        [<ffffffffa029c5d7>] ecryptfs_send_miscdev+0x97/0x120 [ecryptfs]
+        [<ffffffffa029b744>] ecryptfs_send_message+0x134/0x1e0 [ecryptfs]
+        [<ffffffffa029a24e>] ecryptfs_generate_key_packet_set+0x2fe/0xa80 [ecryptfs]
+        [<ffffffffa02960f8>] ecryptfs_write_metadata+0x108/0x250 [ecryptfs]
+        [<ffffffffa0290f80>] ecryptfs_create+0x130/0x250 [ecryptfs]
+        [<ffffffff811963a4>] vfs_create+0xb4/0x120
+        [<ffffffff81197865>] do_last+0x8c5/0xa10
+        [<ffffffff811998f9>] path_openat+0xd9/0x460
+        [<ffffffff81199da2>] do_filp_open+0x42/0xa0
+        [<ffffffff81187998>] do_sys_open+0xf8/0x1d0
+        [<ffffffff81187a91>] sys_open+0x21/0x30
+        [<ffffffff81527d69>] system_call_fastpath+0x16/0x1b
+
+ -> #0 (&ecryptfs_msg_ctx_arr[i].mux){+.+.+.}:
+        [<ffffffff810a3418>] __lock_acquire+0x1bf8/0x1c50
+        [<ffffffff810a3b8d>] lock_acquire+0x9d/0x220
+        [<ffffffff8151c6da>] __mutex_lock_common+0x5a/0x4b0
+        [<ffffffff8151cc64>] mutex_lock_nested+0x44/0x50
+        [<ffffffffa029c213>] ecryptfs_miscdev_read+0x143/0x470 [ecryptfs]
+        [<ffffffff811887d3>] vfs_read+0xb3/0x180
+        [<ffffffff811888ed>] sys_read+0x4d/0x90
+        [<ffffffff81527d69>] system_call_fastpath+0x16/0x1b
+
+Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ecryptfs/miscdev.c |   25 +++++++++++++------------
+ 1 files changed, 13 insertions(+), 12 deletions(-)
+
+diff --git a/fs/ecryptfs/miscdev.c b/fs/ecryptfs/miscdev.c
+index a050e4b..de42310 100644
+--- a/fs/ecryptfs/miscdev.c
++++ b/fs/ecryptfs/miscdev.c
+@@ -195,31 +195,32 @@ int ecryptfs_send_miscdev(char *data, size_t data_size,
+ 			  struct ecryptfs_msg_ctx *msg_ctx, u8 msg_type,
+ 			  u16 msg_flags, struct ecryptfs_daemon *daemon)
+ {
+-	int rc = 0;
++	struct ecryptfs_message *msg;
+ 
+-	mutex_lock(&msg_ctx->mux);
+-	msg_ctx->msg = kmalloc((sizeof(*msg_ctx->msg) + data_size),
+-			       GFP_KERNEL);
+-	if (!msg_ctx->msg) {
+-		rc = -ENOMEM;
++	msg = kmalloc((sizeof(*msg) + data_size), GFP_KERNEL);
++	if (!msg) {
+ 		printk(KERN_ERR "%s: Out of memory whilst attempting "
+ 		       "to kmalloc(%zd, GFP_KERNEL)\n", __func__,
+-		       (sizeof(*msg_ctx->msg) + data_size));
+-		goto out_unlock;
++		       (sizeof(*msg) + data_size));
++		return -ENOMEM;
+ 	}
++
++	mutex_lock(&msg_ctx->mux);
++	msg_ctx->msg = msg;
+ 	msg_ctx->msg->index = msg_ctx->index;
+ 	msg_ctx->msg->data_len = data_size;
+ 	msg_ctx->type = msg_type;
+ 	memcpy(msg_ctx->msg->data, data, data_size);
+ 	msg_ctx->msg_size = (sizeof(*msg_ctx->msg) + data_size);
+-	mutex_lock(&daemon->mux);
+ 	list_add_tail(&msg_ctx->daemon_out_list, &daemon->msg_ctx_out_queue);
++	mutex_unlock(&msg_ctx->mux);
++
++	mutex_lock(&daemon->mux);
+ 	daemon->num_queued_msg_ctx++;
+ 	wake_up_interruptible(&daemon->wait);
+ 	mutex_unlock(&daemon->mux);
+-out_unlock:
+-	mutex_unlock(&msg_ctx->mux);
+-	return rc;
++
++	return 0;
+ }
+ 
+ /**
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0098-eCryptfs-Properly-check-for-O_RDONLY-flag-before-doi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0098-eCryptfs-Properly-check-for-O_RDONLY-flag-before-doi.patch
new file mode 100644
index 0000000..2758ec0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0098-eCryptfs-Properly-check-for-O_RDONLY-flag-before-doi.patch
@@ -0,0 +1,45 @@
+From 590d0b9de4bb4ef7a84bb0a8a13d85353556e7ae Mon Sep 17 00:00:00 2001
+From: Tyler Hicks <tyhicks@canonical.com>
+Date: Tue, 12 Jun 2012 11:17:01 -0700
+Subject: [PATCH 098/109] eCryptfs: Properly check for O_RDONLY flag before
+ doing privileged open
+
+commit 9fe79d7600497ed8a95c3981cbe5b73ab98222f0 upstream.
+
+If the first attempt at opening the lower file read/write fails,
+eCryptfs will retry using a privileged kthread. However, the privileged
+retry should not happen if the lower file's inode is read-only because a
+read/write open will still be unsuccessful.
+
+The check for determining if the open should be retried was intended to
+be based on the access mode of the lower file's open flags being
+O_RDONLY, but the check was incorrectly performed. This would cause the
+open to be retried by the privileged kthread, resulting in a second
+failed open of the lower file. This patch corrects the check to
+determine if the open request should be handled by the privileged
+kthread.
+
+Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
+Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
+Acked-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ecryptfs/kthread.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/ecryptfs/kthread.c b/fs/ecryptfs/kthread.c
+index 69f994a..0dbe58a 100644
+--- a/fs/ecryptfs/kthread.c
++++ b/fs/ecryptfs/kthread.c
+@@ -149,7 +149,7 @@ int ecryptfs_privileged_open(struct file **lower_file,
+ 	(*lower_file) = dentry_open(lower_dentry, lower_mnt, flags, cred);
+ 	if (!IS_ERR(*lower_file))
+ 		goto out;
+-	if (flags & O_RDONLY) {
++	if ((flags & O_ACCMODE) == O_RDONLY) {
+ 		rc = PTR_ERR((*lower_file));
+ 		goto out;
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0099-ACPI-PM-Make-acpi_pm_device_sleep_state-follow-the-s.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0099-ACPI-PM-Make-acpi_pm_device_sleep_state-follow-the-s.patch
new file mode 100644
index 0000000..2b7beda
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0099-ACPI-PM-Make-acpi_pm_device_sleep_state-follow-the-s.patch
@@ -0,0 +1,49 @@
+From 074935f3d2b0e862c66af5032619659b070e1ebb Mon Sep 17 00:00:00 2001
+From: "Rafael J. Wysocki" <rjw@sisk.pl>
+Date: Tue, 29 May 2012 21:21:07 +0200
+Subject: [PATCH 099/109] ACPI / PM: Make acpi_pm_device_sleep_state() follow
+ the specification
+
+commit dbe9a2edd17d843d80faf2b99f20a691c1853418 upstream.
+
+The comparison between the system sleep state being entered
+and the lowest system sleep state the given device may wake up
+from in acpi_pm_device_sleep_state() is reversed, because the
+specification (ACPI 5.0) says that for wakeup to work:
+
+"The sleeping state being entered must be less than or equal to the
+ power state declared in element 1 of the _PRW object."
+
+In other words, the state returned by _PRW is the deepest
+(lowest-power) system sleep state the device is capable of waking up
+the system from.
+
+Moreover, acpi_pm_device_sleep_state() also should check if the
+wakeup capability is supported through ACPI, because in principle it
+may be done via native PCIe PME, for example, in which case _SxW
+should not be evaluated.
+
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/acpi/sleep.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/acpi/sleep.c b/drivers/acpi/sleep.c
+index ca191ff..ed6bc52 100644
+--- a/drivers/acpi/sleep.c
++++ b/drivers/acpi/sleep.c
+@@ -702,8 +702,8 @@ int acpi_pm_device_sleep_state(struct device *dev, int *d_min_p)
+ 	 * can wake the system.  _S0W may be valid, too.
+ 	 */
+ 	if (acpi_target_sleep_state == ACPI_STATE_S0 ||
+-	    (device_may_wakeup(dev) &&
+-	     adev->wakeup.sleep_state <= acpi_target_sleep_state)) {
++	    (device_may_wakeup(dev) && adev->wakeup.flags.valid &&
++	     adev->wakeup.sleep_state >= acpi_target_sleep_state)) {
+ 		acpi_status status;
+ 
+ 		acpi_method[3] = 'W';
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0100-ipheth-add-support-for-iPad.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0100-ipheth-add-support-for-iPad.patch
new file mode 100644
index 0000000..1eadc88
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0100-ipheth-add-support-for-iPad.patch
@@ -0,0 +1,43 @@
+From 0c6658ce9402f6e184fad5386d86a3a2bb2a2d67 Mon Sep 17 00:00:00 2001
+From: Davide Gerhard <rainbow@irh.it>
+Date: Mon, 25 Jun 2012 09:04:47 +0200
+Subject: [PATCH 100/109] ipheth: add support for iPad
+
+commit 6de0298ec9c1edaf330b71b57346241ece8f3346 upstream.
+
+This adds support for the iPad to the ipheth driver.
+(product id = 0x129a)
+
+Signed-off-by: Davide Gerhard <rainbow@irh.it>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/usb/ipheth.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/usb/ipheth.c b/drivers/net/usb/ipheth.c
+index ad96164..00ed9c1 100644
+--- a/drivers/net/usb/ipheth.c
++++ b/drivers/net/usb/ipheth.c
+@@ -59,6 +59,7 @@
+ #define USB_PRODUCT_IPHONE_3G   0x1292
+ #define USB_PRODUCT_IPHONE_3GS  0x1294
+ #define USB_PRODUCT_IPHONE_4	0x1297
++#define USB_PRODUCT_IPAD 0x129a
+ #define USB_PRODUCT_IPHONE_4_VZW 0x129c
+ #define USB_PRODUCT_IPHONE_4S	0x12a0
+ 
+@@ -101,6 +102,10 @@ static struct usb_device_id ipheth_table[] = {
+ 		IPHETH_USBINTF_CLASS, IPHETH_USBINTF_SUBCLASS,
+ 		IPHETH_USBINTF_PROTO) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(
++		USB_VENDOR_APPLE, USB_PRODUCT_IPAD,
++		IPHETH_USBINTF_CLASS, IPHETH_USBINTF_SUBCLASS,
++		IPHETH_USBINTF_PROTO) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(
+ 		USB_VENDOR_APPLE, USB_PRODUCT_IPHONE_4_VZW,
+ 		IPHETH_USBINTF_CLASS, IPHETH_USBINTF_SUBCLASS,
+ 		IPHETH_USBINTF_PROTO) },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0101-stmmac-Fix-for-nfs-hang-on-multiple-reboot.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0101-stmmac-Fix-for-nfs-hang-on-multiple-reboot.patch
new file mode 100644
index 0000000..76313ca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0101-stmmac-Fix-for-nfs-hang-on-multiple-reboot.patch
@@ -0,0 +1,56 @@
+From b50133363ad0f4fa9ca46317aaa7261a21f22305 Mon Sep 17 00:00:00 2001
+From: Deepak Sikri <deepak.sikri@st.com>
+Date: Sun, 8 Jul 2012 21:14:45 +0000
+Subject: [PATCH 101/109] stmmac: Fix for nfs hang on multiple reboot
+
+commit 8e83989106562326bfd6aaf92174fe138efd026b upstream.
+
+It was observed that during multiple reboots nfs hangs. The status of
+receive descriptors shows that all the descriptors were in control of
+CPU, and none were assigned to DMA.
+Also the DMA status register confirmed that the Rx buffer is
+unavailable.
+
+This patch adds the fix for the same by adding the memory barriers to
+ascertain that the all instructions before enabling the Rx or Tx DMA are
+completed which involves the proper setting of the ownership bit in DMA
+descriptors.
+
+Signed-off-by: Deepak Sikri <deepak.sikri@st.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+index 72cd190..d4d2bc1 100644
+--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
++++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+@@ -1174,6 +1174,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
+ 		priv->hw->desc->prepare_tx_desc(desc, 0, len, csum_insertion);
+ 		wmb();
+ 		priv->hw->desc->set_tx_owner(desc);
++		wmb();
+ 	}
+ 
+ 	/* Interrupt on completition only for the latest segment */
+@@ -1189,6 +1190,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
+ 
+ 	/* To avoid raise condition */
+ 	priv->hw->desc->set_tx_owner(first);
++	wmb();
+ 
+ 	priv->cur_tx++;
+ 
+@@ -1252,6 +1254,7 @@ static inline void stmmac_rx_refill(struct stmmac_priv *priv)
+ 		}
+ 		wmb();
+ 		priv->hw->desc->set_rx_owner(p + entry);
++		wmb();
+ 	}
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0102-bonding-debugfs-and-network-namespaces-are-incompati.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0102-bonding-debugfs-and-network-namespaces-are-incompati.patch
new file mode 100644
index 0000000..9449afb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0102-bonding-debugfs-and-network-namespaces-are-incompati.patch
@@ -0,0 +1,39 @@
+From 4def3e67f9744a1010a27b55034269076ea6cffc Mon Sep 17 00:00:00 2001
+From: "Eric W. Biederman" <ebiederm@xmission.com>
+Date: Mon, 9 Jul 2012 10:52:43 +0000
+Subject: [PATCH 102/109] bonding: debugfs and network namespaces are
+ incompatible
+
+commit 96ca7ffe748bf91f851e6aa4479aa11c8b1122ba upstream.
+
+The bonding debugfs support has been broken in the presence of network
+namespaces since it has been added.  The debugfs support does not handle
+multiple bonding devices with the same name in different network
+namespaces.
+
+I haven't had any bug reports, and I'm not interested in getting any.
+Disable the debugfs support when network namespaces are enabled.
+
+Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/bonding/bond_debugfs.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/bonding/bond_debugfs.c b/drivers/net/bonding/bond_debugfs.c
+index 3680aa2..2cf084e 100644
+--- a/drivers/net/bonding/bond_debugfs.c
++++ b/drivers/net/bonding/bond_debugfs.c
+@@ -6,7 +6,7 @@
+ #include "bonding.h"
+ #include "bond_alb.h"
+ 
+-#ifdef CONFIG_DEBUG_FS
++#if defined(CONFIG_DEBUG_FS) && !defined(CONFIG_NET_NS)
+ 
+ #include <linux/debugfs.h>
+ #include <linux/seq_file.h>
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0103-bonding-Manage-proc-net-bonding-entries-from-the-net.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0103-bonding-Manage-proc-net-bonding-entries-from-the-net.patch
new file mode 100644
index 0000000..4180a9d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0103-bonding-Manage-proc-net-bonding-entries-from-the-net.patch
@@ -0,0 +1,61 @@
+From 9a6163ec597d5cd83bb9a4ea19b64236ea8499b6 Mon Sep 17 00:00:00 2001
+From: "Eric W. Biederman" <ebiederm@xmission.com>
+Date: Mon, 9 Jul 2012 10:51:45 +0000
+Subject: [PATCH 103/109] bonding: Manage /proc/net/bonding/ entries from the
+ netdev events
+
+commit a64d49c3dd504b685f9742a2f3dcb11fb8e4345f upstream.
+
+It was recently reported that moving a bonding device between network
+namespaces causes warnings from /proc.  It turns out after the move we
+were trying to add and to remove the /proc/net/bonding entries from the
+wrong network namespace.
+
+Move the bonding /proc registration code into the NETDEV_REGISTER and
+NETDEV_UNREGISTER events where the proc registration and unregistration
+will always happen at the right time.
+
+Signed-off-by: "Eric W. Biederman" <ebiederm@xmission.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/bonding/bond_main.c |    9 ++++++---
+ 1 files changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
+index 1a88e38..6c284d1 100644
+--- a/drivers/net/bonding/bond_main.c
++++ b/drivers/net/bonding/bond_main.c
+@@ -3184,6 +3184,12 @@ static int bond_master_netdev_event(unsigned long event,
+ 	switch (event) {
+ 	case NETDEV_CHANGENAME:
+ 		return bond_event_changename(event_bond);
++	case NETDEV_UNREGISTER:
++		bond_remove_proc_entry(event_bond);
++		break;
++	case NETDEV_REGISTER:
++		bond_create_proc_entry(event_bond);
++		break;
+ 	default:
+ 		break;
+ 	}
+@@ -4391,8 +4397,6 @@ static void bond_uninit(struct net_device *bond_dev)
+ 
+ 	bond_work_cancel_all(bond);
+ 
+-	bond_remove_proc_entry(bond);
+-
+ 	bond_debug_unregister(bond);
+ 
+ 	__hw_addr_flush(&bond->mc_list);
+@@ -4794,7 +4798,6 @@ static int bond_init(struct net_device *bond_dev)
+ 
+ 	bond_set_lockdep_class(bond_dev);
+ 
+-	bond_create_proc_entry(bond);
+ 	list_add_tail(&bond->bond_list, &bn->dev_list);
+ 
+ 	bond_prepare_sysfs_group(bond);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0104-Input-bcm5974-Add-support-for-2012-MacBook-Pro-Retin.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0104-Input-bcm5974-Add-support-for-2012-MacBook-Pro-Retin.patch
new file mode 100644
index 0000000..fb73f30
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0104-Input-bcm5974-Add-support-for-2012-MacBook-Pro-Retin.patch
@@ -0,0 +1,67 @@
+From d622494f403ba2a79ac08f83e7b016d0687c4ce5 Mon Sep 17 00:00:00 2001
+From: Henrik Rydberg <rydberg@euromail.se>
+Date: Tue, 10 Jul 2012 09:43:57 -0700
+Subject: [PATCH 104/109] Input: bcm5974 - Add support for 2012 MacBook Pro
+ Retina
+
+commit 3dde22a98e94eb18527f0ff0068fb2fb945e58d4 upstream.
+
+Add support for the 15'' MacBook Pro Retina model (MacBookPro10,1).
+
+Patch originally written by clipcarl (forums.opensuse.org).
+
+Signed-off-by: Henrik Rydberg <rydberg@euromail.se>
+Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/input/mouse/bcm5974.c |   20 ++++++++++++++++++++
+ 1 files changed, 20 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/input/mouse/bcm5974.c b/drivers/input/mouse/bcm5974.c
+index 5ec617e..ec58f48 100644
+--- a/drivers/input/mouse/bcm5974.c
++++ b/drivers/input/mouse/bcm5974.c
+@@ -79,6 +79,10 @@
+ #define USB_DEVICE_ID_APPLE_WELLSPRING5A_ANSI	0x0252
+ #define USB_DEVICE_ID_APPLE_WELLSPRING5A_ISO	0x0253
+ #define USB_DEVICE_ID_APPLE_WELLSPRING5A_JIS	0x0254
++/* MacbookPro10,1 (unibody, June 2012) */
++#define USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI	0x0262
++#define USB_DEVICE_ID_APPLE_WELLSPRING7_ISO	0x0263
++#define USB_DEVICE_ID_APPLE_WELLSPRING7_JIS	0x0264
+ 
+ #define BCM5974_DEVICE(prod) {					\
+ 	.match_flags = (USB_DEVICE_ID_MATCH_DEVICE |		\
+@@ -128,6 +132,10 @@ static const struct usb_device_id bcm5974_table[] = {
+ 	BCM5974_DEVICE(USB_DEVICE_ID_APPLE_WELLSPRING5A_ANSI),
+ 	BCM5974_DEVICE(USB_DEVICE_ID_APPLE_WELLSPRING5A_ISO),
+ 	BCM5974_DEVICE(USB_DEVICE_ID_APPLE_WELLSPRING5A_JIS),
++	/* MacbookPro10,1 */
++	BCM5974_DEVICE(USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI),
++	BCM5974_DEVICE(USB_DEVICE_ID_APPLE_WELLSPRING7_ISO),
++	BCM5974_DEVICE(USB_DEVICE_ID_APPLE_WELLSPRING7_JIS),
+ 	/* Terminating entry */
+ 	{}
+ };
+@@ -354,6 +362,18 @@ static const struct bcm5974_config bcm5974_config_table[] = {
+ 		{ DIM_X, DIM_X / SN_COORD, -4620, 5140 },
+ 		{ DIM_Y, DIM_Y / SN_COORD, -150, 6600 }
+ 	},
++	{
++		USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI,
++		USB_DEVICE_ID_APPLE_WELLSPRING7_ISO,
++		USB_DEVICE_ID_APPLE_WELLSPRING7_JIS,
++		HAS_INTEGRATED_BUTTON,
++		0x84, sizeof(struct bt_data),
++		0x81, TYPE2, FINGER_TYPE2, FINGER_TYPE2 + SIZEOF_ALL_FINGERS,
++		{ DIM_PRESSURE, DIM_PRESSURE / SN_PRESSURE, 0, 300 },
++		{ DIM_WIDTH, DIM_WIDTH / SN_WIDTH, 0, 2048 },
++		{ DIM_X, DIM_X / SN_COORD, -4750, 5280 },
++		{ DIM_Y, DIM_Y / SN_COORD, -150, 6730 }
++	},
+ 	{}
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0105-Input-xpad-handle-all-variations-of-Mad-Catz-Beat-Pa.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0105-Input-xpad-handle-all-variations-of-Mad-Catz-Beat-Pa.patch
new file mode 100644
index 0000000..cf26e8f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0105-Input-xpad-handle-all-variations-of-Mad-Catz-Beat-Pa.patch
@@ -0,0 +1,61 @@
+From f8acffc53848df78a3d1683f4ab3f1236a20512d Mon Sep 17 00:00:00 2001
+From: Yuri Khan <yurivkhan@gmail.com>
+Date: Wed, 11 Jul 2012 00:49:18 -0700
+Subject: [PATCH 105/109] Input: xpad - handle all variations of Mad Catz Beat
+ Pad
+
+commit 3ffb62cb9ac2430c2504c6ff9727d0f2476ef0bd upstream.
+
+The device should be handled by xpad driver instead of generic HID driver.
+
+Signed-off-by: Yuri Khan <yurivkhan@gmail.com>
+Acked-by: Jiri Kosina <jkosina@suse.cz>
+Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/hid/hid-core.c        |    1 +
+ drivers/hid/hid-ids.h         |    3 +++
+ drivers/input/joystick/xpad.c |    1 +
+ 3 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
+index c27b402..cfa053e 100644
+--- a/drivers/hid/hid-core.c
++++ b/drivers/hid/hid-core.c
+@@ -1884,6 +1884,7 @@ static const struct hid_device_id hid_ignore_list[] = {
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_LD, USB_DEVICE_ID_LD_MCT) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_LD, USB_DEVICE_ID_LD_HYBRID) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_LD, USB_DEVICE_ID_LD_HEATCONTROL) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_MADCATZ, USB_DEVICE_ID_MADCATZ_BEATPAD) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_MCC, USB_DEVICE_ID_MCC_PMD1024LS) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_MCC, USB_DEVICE_ID_MCC_PMD1208LS) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_MICROCHIP, USB_DEVICE_ID_PICKIT1) },
+diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
+index fba3fc4..07a91a0 100644
+--- a/drivers/hid/hid-ids.h
++++ b/drivers/hid/hid-ids.h
+@@ -491,6 +491,9 @@
+ #define USB_DEVICE_ID_CRYSTALTOUCH	0x0006
+ #define USB_DEVICE_ID_CRYSTALTOUCH_DUAL	0x0007
+ 
++#define USB_VENDOR_ID_MADCATZ		0x0738
++#define USB_DEVICE_ID_MADCATZ_BEATPAD	0x4540
++
+ #define USB_VENDOR_ID_MCC		0x09db
+ #define USB_DEVICE_ID_MCC_PMD1024LS	0x0076
+ #define USB_DEVICE_ID_MCC_PMD1208LS	0x007a
+diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
+index d728875..a2daf38 100644
+--- a/drivers/input/joystick/xpad.c
++++ b/drivers/input/joystick/xpad.c
+@@ -238,6 +238,7 @@ static struct usb_device_id xpad_table [] = {
+ 	XPAD_XBOX360_VENDOR(0x045e),		/* Microsoft X-Box 360 controllers */
+ 	XPAD_XBOX360_VENDOR(0x046d),		/* Logitech X-Box 360 style controllers */
+ 	XPAD_XBOX360_VENDOR(0x0738),		/* Mad Catz X-Box 360 controllers */
++	{ USB_DEVICE(0x0738, 0x4540) },		/* Mad Catz Beat Pad */
+ 	XPAD_XBOX360_VENDOR(0x0e6f),		/* 0x0e6f X-Box 360 controllers */
+ 	XPAD_XBOX360_VENDOR(0x12ab),		/* X-Box 360 dance pads */
+ 	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane X-Box 360 controllers */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0106-Input-xpad-add-signature-for-Razer-Onza-Tournament-E.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0106-Input-xpad-add-signature-for-Razer-Onza-Tournament-E.patch
new file mode 100644
index 0000000..4dff859
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0106-Input-xpad-add-signature-for-Razer-Onza-Tournament-E.patch
@@ -0,0 +1,40 @@
+From 08a3e81aa5cc67fd0ce0b2f9608aaec9f497ca11 Mon Sep 17 00:00:00 2001
+From: Ilia Katsnelson <k0009000@gmail.com>
+Date: Wed, 11 Jul 2012 00:54:20 -0700
+Subject: [PATCH 106/109] Input: xpad - add signature for Razer Onza
+ Tournament Edition
+
+commit cc71a7e899cc6b2ff41e1be48756782ed004d802 upstream.
+
+Signed-off-by: Ilia Katsnelson <k0009000@gmail.com>
+Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/input/joystick/xpad.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
+index a2daf38..ddfabc4 100644
+--- a/drivers/input/joystick/xpad.c
++++ b/drivers/input/joystick/xpad.c
+@@ -164,6 +164,7 @@ static const struct xpad_device {
+ 	{ 0x1bad, 0x0003, "Harmonix Rock Band Drumkit", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
+ 	{ 0x0f0d, 0x0016, "Hori Real Arcade Pro.EX", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
+ 	{ 0x0f0d, 0x000d, "Hori Fighting Stick EX2", MAP_TRIGGERS_TO_BUTTONS, XTYPE_XBOX360 },
++	{ 0x1689, 0xfd00, "Razer Onza Tournament Edition", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX360 },
+ 	{ 0xffff, 0xffff, "Chinese-made Xbox Controller", 0, XTYPE_XBOX },
+ 	{ 0x0000, 0x0000, "Generic X-Box pad", 0, XTYPE_UNKNOWN }
+ };
+@@ -244,7 +245,8 @@ static struct usb_device_id xpad_table [] = {
+ 	XPAD_XBOX360_VENDOR(0x1430),		/* RedOctane X-Box 360 controllers */
+ 	XPAD_XBOX360_VENDOR(0x146b),		/* BigBen Interactive Controllers */
+ 	XPAD_XBOX360_VENDOR(0x1bad),		/* Harminix Rock Band Guitar and Drums */
+-	XPAD_XBOX360_VENDOR(0x0f0d),            /* Hori Controllers */
++	XPAD_XBOX360_VENDOR(0x0f0d),		/* Hori Controllers */
++	XPAD_XBOX360_VENDOR(0x1689),		/* Razer Onza */
+ 	{ }
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0107-Input-xpad-add-Andamiro-Pump-It-Up-pad.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0107-Input-xpad-add-Andamiro-Pump-It-Up-pad.patch
new file mode 100644
index 0000000..d591ad1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0107-Input-xpad-add-Andamiro-Pump-It-Up-pad.patch
@@ -0,0 +1,33 @@
+From 5c62e66de78b65d8dd3f21df7d856eaefc694c8e Mon Sep 17 00:00:00 2001
+From: Yuri Khan <yurivkhan@gmail.com>
+Date: Wed, 11 Jul 2012 22:12:31 -0700
+Subject: [PATCH 107/109] Input: xpad - add Andamiro Pump It Up pad
+
+commit e76b8ee25e034ab601b525abb95cea14aa167ed3 upstream.
+
+I couldn't find the vendor ID in any of the online databases, but this
+mat has a Pump It Up logo on the top side of the controller compartment,
+and a disclaimer stating that Andamiro will not be liable on the bottom.
+
+Signed-off-by: Yuri Khan <yurivkhan@gmail.com>
+Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/input/joystick/xpad.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/input/joystick/xpad.c b/drivers/input/joystick/xpad.c
+index ddfabc4..2189cbf 100644
+--- a/drivers/input/joystick/xpad.c
++++ b/drivers/input/joystick/xpad.c
+@@ -142,6 +142,7 @@ static const struct xpad_device {
+ 	{ 0x0c12, 0x880a, "Pelican Eclipse PL-2023", 0, XTYPE_XBOX },
+ 	{ 0x0c12, 0x8810, "Zeroplus Xbox Controller", 0, XTYPE_XBOX },
+ 	{ 0x0c12, 0x9902, "HAMA VibraX - *FAULTY HARDWARE*", 0, XTYPE_XBOX },
++	{ 0x0d2f, 0x0002, "Andamiro Pump It Up pad", MAP_DPAD_TO_BUTTONS, XTYPE_XBOX },
+ 	{ 0x0e4c, 0x1097, "Radica Gamester Controller", 0, XTYPE_XBOX },
+ 	{ 0x0e4c, 0x2390, "Radica Games Jtech Controller", 0, XTYPE_XBOX },
+ 	{ 0x0e6f, 0x0003, "Logic3 Freebird wireless Controller", 0, XTYPE_XBOX },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0108-HID-add-support-for-2012-MacBook-Pro-Retina.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0108-HID-add-support-for-2012-MacBook-Pro-Retina.patch
new file mode 100644
index 0000000..fd76af3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0108-HID-add-support-for-2012-MacBook-Pro-Retina.patch
@@ -0,0 +1,85 @@
+From 4be420efc64c25fbe44fbc002e74c117d652a1d5 Mon Sep 17 00:00:00 2001
+From: Ryan Bourgeois <bluedragonx@gmail.com>
+Date: Tue, 10 Jul 2012 09:43:33 -0700
+Subject: [PATCH 108/109] HID: add support for 2012 MacBook Pro Retina
+
+commit b2e6ad7dfe26aac5bf136962d0b11d180b820d44 upstream.
+
+Add support for the 15'' MacBook Pro Retina. The keyboard is
+the same as recent models.
+
+The patch needs to be synchronized with the bcm5974 patch for
+the trackpad - as usual.
+
+Patch originally written by clipcarl (forums.opensuse.org).
+
+[rydberg@euromail.se: Amended mouse ignore lines]
+Signed-off-by: Ryan Bourgeois <bluedragonx@gmail.com>
+Signed-off-by: Henrik Rydberg <rydberg@euromail.se>
+Acked-by: Jiri Kosina <jkosina@suse.cz>
+Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/hid/hid-apple.c |    6 ++++++
+ drivers/hid/hid-core.c  |    6 ++++++
+ drivers/hid/hid-ids.h   |    3 +++
+ 3 files changed, 15 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/hid/hid-apple.c b/drivers/hid/hid-apple.c
+index 299d238..899c712 100644
+--- a/drivers/hid/hid-apple.c
++++ b/drivers/hid/hid-apple.c
+@@ -514,6 +514,12 @@ static const struct hid_device_id apple_devices[] = {
+ 		.driver_data = APPLE_HAS_FN | APPLE_ISO_KEYBOARD },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING5A_JIS),
+ 		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI),
++		.driver_data = APPLE_HAS_FN },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ISO),
++		.driver_data = APPLE_HAS_FN | APPLE_ISO_KEYBOARD },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_JIS),
++		.driver_data = APPLE_HAS_FN | APPLE_RDESC_JIS },
+ 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI),
+ 		.driver_data = APPLE_NUMLOCK_EMULATION | APPLE_HAS_FN },
+ 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO),
+diff --git a/drivers/hid/hid-core.c b/drivers/hid/hid-core.c
+index cfa053e..95430a0 100644
+--- a/drivers/hid/hid-core.c
++++ b/drivers/hid/hid-core.c
+@@ -1374,6 +1374,9 @@ static const struct hid_device_id hid_have_special_driver[] = {
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_ANSI) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_ISO) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_JIS) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ISO) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_JIS) },
+ 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI) },
+ 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO) },
+ 	{ HID_BLUETOOTH_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS) },
+@@ -1969,6 +1972,9 @@ static const struct hid_device_id hid_mouse_ignore_list[] = {
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_ANSI) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_ISO) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING6A_JIS) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_ISO) },
++	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_WELLSPRING7_JIS) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_FOUNTAIN_TP_ONLY) },
+ 	{ HID_USB_DEVICE(USB_VENDOR_ID_APPLE, USB_DEVICE_ID_APPLE_GEYSER1_TP_ONLY) },
+ 	{ }
+diff --git a/drivers/hid/hid-ids.h b/drivers/hid/hid-ids.h
+index 07a91a0..7db934d 100644
+--- a/drivers/hid/hid-ids.h
++++ b/drivers/hid/hid-ids.h
+@@ -125,6 +125,9 @@
+ #define USB_DEVICE_ID_APPLE_WELLSPRING6_ANSI	0x024c
+ #define USB_DEVICE_ID_APPLE_WELLSPRING6_ISO	0x024d
+ #define USB_DEVICE_ID_APPLE_WELLSPRING6_JIS	0x024e
++#define USB_DEVICE_ID_APPLE_WELLSPRING7_ANSI	0x0262
++#define USB_DEVICE_ID_APPLE_WELLSPRING7_ISO	0x0263
++#define USB_DEVICE_ID_APPLE_WELLSPRING7_JIS	0x0264
+ #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ANSI  0x0239
+ #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_ISO   0x023a
+ #define USB_DEVICE_ID_APPLE_ALU_WIRELESS_2009_JIS   0x023b
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0109-Linux-3.2.24.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0109-Linux-3.2.24.patch
new file mode 100644
index 0000000..7c4e2ac
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.24/0109-Linux-3.2.24.patch
@@ -0,0 +1,24 @@
+From b356d49fb84a5f890bd91feedf0d67078e27a3a9 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 25 Jul 2012 04:11:50 +0100
+Subject: [PATCH 109/109] Linux 3.2.24
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 40d1e3b..80bb4fd 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 23
++SUBLEVEL = 24
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0001-mm-reduce-the-amount-of-work-done-when-updating-min_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0001-mm-reduce-the-amount-of-work-done-when-updating-min_.patch
new file mode 100644
index 0000000..d7cf581
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0001-mm-reduce-the-amount-of-work-done-when-updating-min_.patch
@@ -0,0 +1,88 @@
+From ce43a5bb3c28d87f36ff91fcc2fc210db2b6fd4b Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Tue, 10 Jan 2012 15:07:14 -0800
+Subject: [PATCH 01/73] mm: reduce the amount of work done when updating
+ min_free_kbytes
+
+commit 938929f14cb595f43cd1a4e63e22d36cab1e4a1f upstream.
+
+Stable note: Fixes https://bugzilla.novell.com/show_bug.cgi?id=726210 .
+        Large machines with 1TB or more of RAM take a long time to boot
+        without this patch and may spew out soft lockup warnings.
+
+When min_free_kbytes is updated, some pageblocks are marked
+MIGRATE_RESERVE.  Ordinarily, this work is unnoticable as it happens early
+in boot but on large machines with 1TB of memory, this has been reported
+to delay boot times, probably due to the NUMA distances involved.
+
+The bulk of the work is due to calling calling pageblock_is_reserved() an
+unnecessary amount of times and accessing far more struct page metadata
+than is necessary.  This patch significantly reduces the amount of work
+done by setup_zone_migrate_reserve() improving boot times on 1TB machines.
+
+[akpm@linux-foundation.org: coding-style fixes]
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/page_alloc.c |   40 ++++++++++++++++++++++++----------------
+ 1 files changed, 24 insertions(+), 16 deletions(-)
+
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index 485be89..cb3460e 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -3407,25 +3407,33 @@ static void setup_zone_migrate_reserve(struct zone *zone)
+ 		if (page_to_nid(page) != zone_to_nid(zone))
+ 			continue;
+ 
+-		/* Blocks with reserved pages will never free, skip them. */
+-		block_end_pfn = min(pfn + pageblock_nr_pages, end_pfn);
+-		if (pageblock_is_reserved(pfn, block_end_pfn))
+-			continue;
+-
+ 		block_migratetype = get_pageblock_migratetype(page);
+ 
+-		/* If this block is reserved, account for it */
+-		if (reserve > 0 && block_migratetype == MIGRATE_RESERVE) {
+-			reserve--;
+-			continue;
+-		}
++		/* Only test what is necessary when the reserves are not met */
++		if (reserve > 0) {
++			/*
++			 * Blocks with reserved pages will never free, skip
++			 * them.
++			 */
++			block_end_pfn = min(pfn + pageblock_nr_pages, end_pfn);
++			if (pageblock_is_reserved(pfn, block_end_pfn))
++				continue;
+ 
+-		/* Suitable for reserving if this block is movable */
+-		if (reserve > 0 && block_migratetype == MIGRATE_MOVABLE) {
+-			set_pageblock_migratetype(page, MIGRATE_RESERVE);
+-			move_freepages_block(zone, page, MIGRATE_RESERVE);
+-			reserve--;
+-			continue;
++			/* If this block is reserved, account for it */
++			if (block_migratetype == MIGRATE_RESERVE) {
++				reserve--;
++				continue;
++			}
++
++			/* Suitable for reserving if this block is movable */
++			if (block_migratetype == MIGRATE_MOVABLE) {
++				set_pageblock_migratetype(page,
++							MIGRATE_RESERVE);
++				move_freepages_block(zone, page,
++							MIGRATE_RESERVE);
++				reserve--;
++				continue;
++			}
+ 		}
+ 
+ 		/*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0002-mm-compaction-allow-compaction-to-isolate-dirty-page.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0002-mm-compaction-allow-compaction-to-isolate-dirty-page.patch
new file mode 100644
index 0000000..cbcecd1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0002-mm-compaction-allow-compaction-to-isolate-dirty-page.patch
@@ -0,0 +1,436 @@
+From 50bec8b86d1ffdec691586e017499cb3f5e0b6a0 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:22 -0800
+Subject: [PATCH 02/73] mm: compaction: allow compaction to isolate dirty
+ pages
+
+commit a77ebd333cd810d7b680d544be88c875131c2bd3 upstream.
+
+Stable note: Not tracked in Bugzilla. A fix aimed at preserving page aging
+	information by reducing LRU list churning had the side-effect of
+	reducing THP allocation success rates. This was part of a series
+	to restore the success rates while preserving the reclaim fix.
+
+Short summary: There are severe stalls when a USB stick using VFAT is
+used with THP enabled that are reduced by this series.  If you are
+experiencing this problem, please test and report back and considering I
+have seen complaints from openSUSE and Fedora users on this as well as a
+few private mails, I'm guessing it's a widespread issue.  This is a new
+type of USB-related stall because it is due to synchronous compaction
+writing where as in the past the big problem was dirty pages reaching
+the end of the LRU and being written by reclaim.
+
+Am cc'ing Andrew this time and this series would replace
+mm-do-not-stall-in-synchronous-compaction-for-thp-allocations.patch.
+I'm also cc'ing Dave Jones as he might have merged that patch to Fedora
+for wider testing and ideally it would be reverted and replaced by this
+series.
+
+That said, the later patches could really do with some review.  If this
+series is not the answer then a new direction needs to be discussed
+because as it is, the stalls are unacceptable as the results in this
+leader show.
+
+For testers that try backporting this to 3.1, it won't work because
+there is a non-obvious dependency on not writing back pages in direct
+reclaim so you need those patches too.
+
+Changelog since V5
+o Rebase to 3.2-rc5
+o Tidy up the changelogs a bit
+
+Changelog since V4
+o Added reviewed-bys, credited Andrea properly for sync-light
+o Allow dirty pages without mappings to be considered for migration
+o Bound the number of pages freed for compaction
+o Isolate PageReclaim pages on their own LRU list
+
+This is against 3.2-rc5 and follows on from discussions on "mm: Do
+not stall in synchronous compaction for THP allocations" and "[RFC
+PATCH 0/5] Reduce compaction-related stalls". Initially, the proposed
+patch eliminated stalls due to compaction which sometimes resulted in
+user-visible interactivity problems on browsers by simply never using
+sync compaction. The downside was that THP success allocation rates
+were lower because dirty pages were not being migrated as reported by
+Andrea. His approach at fixing this was nacked on the grounds that
+it reverted fixes from Rik merged that reduced the amount of pages
+reclaimed as it severely impacted his workloads performance.
+
+This series attempts to reconcile the requirements of maximising THP
+usage, without stalling in a user-visible fashion due to compaction
+or cheating by reclaiming an excessive number of pages.
+
+Patch 1 partially reverts commit 39deaf85 to allow migration to isolate
+	dirty pages. This is because migration can move some dirty
+	pages without blocking.
+
+Patch 2 notes that the /proc/sys/vm/compact_memory handler is not using
+	synchronous compaction when it should be. This is unrelated
+	to the reported stalls but is worth fixing.
+
+Patch 3 checks if we isolated a compound page during lumpy scan and
+	account for it properly. For the most part, this affects
+	tracing so it's unrelated to the stalls but worth fixing.
+
+Patch 4 notes that it is possible to abort reclaim early for compaction
+	and return 0 to the page allocator potentially entering the
+	"may oom" path. This has not been observed in practice but
+	the rest of the series potentially makes it easier to happen.
+
+Patch 5 adds a sync parameter to the migratepage callback and gives
+	the callback responsibility for migrating the page without
+	blocking if sync==false. For example, fallback_migrate_page
+	will not call writepage if sync==false. This increases the
+	number of pages that can be handled by asynchronous compaction
+	thereby reducing stalls.
+
+Patch 6 restores filter-awareness to isolate_lru_page for migration.
+	In practice, it means that pages under writeback and pages
+	without a ->migratepage callback will not be isolated
+	for migration.
+
+Patch 7 avoids calling direct reclaim if compaction is deferred but
+	makes sure that compaction is only deferred if sync
+	compaction was used.
+
+Patch 8 introduces a sync-light migration mechanism that sync compaction
+	uses. The objective is to allow some stalls but to not call
+	->writepage which can lead to significant user-visible stalls.
+
+Patch 9 notes that while we want to abort reclaim ASAP to allow
+	compation to go ahead that we leave a very small window of
+	opportunity for compaction to run. This patch allows more pages
+	to be freed by reclaim but bounds the number to a reasonable
+	level based on the high watermark on each zone.
+
+Patch 10 allows slabs to be shrunk even after compaction_ready() is
+	true for one zone. This is to avoid a problem whereby a single
+	small zone can abort reclaim even though no pages have been
+	reclaimed and no suitably large zone is in a usable state.
+
+Patch 11 fixes a problem with the rate of page scanning. As reclaim is
+	rarely stalling on pages under writeback it means that scan
+	rates are very high. This is particularly true for direct
+	reclaim which is not calling writepage. The vmstat figures
+	implied that much of this was busy work with PageReclaim pages
+	marked for immediate reclaim. This patch is a prototype that
+	moves these pages to their own LRU list.
+
+This has been tested and other than 2 USB keys getting trashed,
+nothing horrible fell out. That said, I am a bit unhappy with the
+rescue logic in patch 11 but did not find a better way around it. It
+does significantly reduce scan rates and System CPU time indicating
+it is the right direction to take.
+
+What is of critical importance is that stalls due to compaction
+are massively reduced even though sync compaction was still
+allowed. Testing from people complaining about stalls copying to USBs
+with THP enabled are particularly welcome.
+
+The following tests all involve THP usage and USB keys in some
+way. Each test follows this type of pattern
+
+1. Read from some fast fast storage, be it raw device or file. Each time
+   the copy finishes, start again until the test ends
+2. Write a large file to a filesystem on a USB stick. Each time the copy
+   finishes, start again until the test ends
+3. When memory is low, start an alloc process that creates a mapping
+   the size of physical memory to stress THP allocation. This is the
+   "real" part of the test and the part that is meant to trigger
+   stalls when THP is enabled. Copying continues in the background.
+4. Record the CPU usage and time to execute of the alloc process
+5. Record the number of THP allocs and fallbacks as well as the number of THP
+   pages in use a the end of the test just before alloc exited
+6. Run the test 5 times to get an idea of variability
+7. Between each run, sync is run and caches dropped and the test
+   waits until nr_dirty is a small number to avoid interference
+   or caching between iterations that would skew the figures.
+
+The individual tests were then
+
+writebackCPDeviceBasevfat
+	Disable THP, read from a raw device (sda), vfat on USB stick
+writebackCPDeviceBaseext4
+	Disable THP, read from a raw device (sda), ext4 on USB stick
+writebackCPDevicevfat
+	THP enabled, read from a raw device (sda), vfat on USB stick
+writebackCPDeviceext4
+	THP enabled, read from a raw device (sda), ext4 on USB stick
+writebackCPFilevfat
+	THP enabled, read from a file on fast storage and USB, both vfat
+writebackCPFileext4
+	THP enabled, read from a file on fast storage and USB, both ext4
+
+The kernels tested were
+
+3.1		3.1
+vanilla		3.2-rc5
+freemore	Patches 1-10
+immediate	Patches 1-11
+andrea		The 8 patches Andrea posted as a basis of comparison
+
+The results are very long unfortunately. I'll start with the case
+where we are not using THP at all
+
+writebackCPDeviceBasevfat
+                   3.1.0-vanilla         rc5-vanilla       freemore-v6r1        isolate-v6r1         andrea-v2r1
+System Time         1.28 (    0.00%)   54.49 (-4143.46%)   48.63 (-3687.69%)    4.69 ( -265.11%)   51.88 (-3940.81%)
++/-                 0.06 (    0.00%)    2.45 (-4305.55%)    4.75 (-8430.57%)    7.46 (-13282.76%)    4.76 (-8440.70%)
+User Time           0.09 (    0.00%)    0.05 (   40.91%)    0.06 (   29.55%)    0.07 (   15.91%)    0.06 (   27.27%)
++/-                 0.02 (    0.00%)    0.01 (   45.39%)    0.02 (   25.07%)    0.00 (   77.06%)    0.01 (   52.24%)
+Elapsed Time      110.27 (    0.00%)   56.38 (   48.87%)   49.95 (   54.70%)   11.77 (   89.33%)   53.43 (   51.54%)
++/-                 7.33 (    0.00%)    3.77 (   48.61%)    4.94 (   32.63%)    6.71 (    8.50%)    4.76 (   35.03%)
+THP Active          0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)
++/-                 0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)
+Fault Alloc         0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)
++/-                 0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)
+Fault Fallback      0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)
++/-                 0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)    0.00 (    0.00%)
+
+The THP figures are obviously all 0 because THP was enabled. The
+main thing to watch is the elapsed times and how they compare to
+times when THP is enabled later. It's also important to note that
+elapsed time is improved by this series as System CPu time is much
+reduced.
+
+writebackCPDevicevfat
+
+                   3.1.0-vanilla         rc5-vanilla       freemore-v6r1        isolate-v6r1         andrea-v2r1
+System Time         1.22 (    0.00%)   13.89 (-1040.72%)   46.40 (-3709.20%)    4.44 ( -264.37%)   47.37 (-3789.33%)
++/-                 0.06 (    0.00%)   22.82 (-37635.56%)    3.84 (-6249.44%)    6.48 (-10618.92%)    6.60
+(-10818.53%)
+User Time           0.06 (    0.00%)    0.06 (   -6.90%)    0.05 (   17.24%)    0.05 (   13.79%)    0.04 (   31.03%)
++/-                 0.01 (    0.00%)    0.01 (   33.33%)    0.01 (   33.33%)    0.01 (   39.14%)    0.01 (   25.46%)
+Elapsed Time     10445.54 (    0.00%) 2249.92 (   78.46%)   70.06 (   99.33%)   16.59 (   99.84%)  472.43 (
+95.48%)
++/-               643.98 (    0.00%)  811.62 (  -26.03%)   10.02 (   98.44%)    7.03 (   98.91%)   59.99 (   90.68%)
+THP Active         15.60 (    0.00%)   35.20 (  225.64%)   65.00 (  416.67%)   70.80 (  453.85%)   62.20 (  398.72%)
++/-                18.48 (    0.00%)   51.29 (  277.59%)   15.99 (   86.52%)   37.91 (  205.18%)   22.02 (  119.18%)
+Fault Alloc       121.80 (    0.00%)   76.60 (   62.89%)  155.40 (  127.59%)  181.20 (  148.77%)  286.60 (  235.30%)
++/-                73.51 (    0.00%)   61.11 (   83.12%)   34.89 (   47.46%)   31.88 (   43.36%)   68.13 (   92.68%)
+Fault Fallback    881.20 (    0.00%)  926.60 (   -5.15%)  847.60 (    3.81%)  822.00 (    6.72%)  716.60 (   18.68%)
++/-                73.51 (    0.00%)   61.26 (   16.67%)   34.89 (   52.54%)   31.65 (   56.94%)   67.75 (    7.84%)
+MMTests Statistics: duration
+User/Sys Time Running Test (seconds)       3540.88   1945.37    716.04     64.97   1937.03
+Total Elapsed Time (seconds)              52417.33  11425.90    501.02    230.95   2520.28
+
+The first thing to note is the "Elapsed Time" for the vanilla kernels
+of 2249 seconds versus 56 with THP disabled which might explain the
+reports of USB stalls with THP enabled. Applying the patches brings
+performance in line with THP-disabled performance while isolating
+pages for immediate reclaim from the LRU cuts down System CPU time.
+
+The "Fault Alloc" success rate figures are also improved. The vanilla
+kernel only managed to allocate 76.6 pages on average over the course
+of 5 iterations where as applying the series allocated 181.20 on
+average albeit it is well within variance. It's worth noting that
+applies the series at least descreases the amount of variance which
+implies an improvement.
+
+Andrea's series had a higher success rate for THP allocations but
+at a severe cost to elapsed time which is still better than vanilla
+but still much worse than disabling THP altogether. One can bring my
+series close to Andrea's by removing this check
+
+        /*
+         * If compaction is deferred for high-order allocations, it is because
+         * sync compaction recently failed. In this is the case and the caller
+         * has requested the system not be heavily disrupted, fail the
+         * allocation now instead of entering direct reclaim
+         */
+        if (deferred_compaction && (gfp_mask & __GFP_NO_KSWAPD))
+                goto nopage;
+
+I didn't include a patch that removed the above check because hurting
+overall performance to improve the THP figure is not what the average
+user wants. It's something to consider though if someone really wants
+to maximise THP usage no matter what it does to the workload initially.
+
+This is summary of vmstat figures from the same test.
+
+                                       3.1.0-vanilla rc5-vanilla freemore-v6r1 isolate-v6r1 andrea-v2r1
+Page Ins                                  3257266139  1111844061    17263623    10901575   161423219
+Page Outs                                   81054922    30364312     3626530     3657687     8753730
+Swap Ins                                        3294        2851        6560        4964        4592
+Swap Outs                                     390073      528094      620197      790912      698285
+Direct pages scanned                      1077581700  3024951463  1764930052   115140570  5901188831
+Kswapd pages scanned                        34826043     7112868     2131265     1686942     1893966
+Kswapd pages reclaimed                      28950067     4911036     1246044      966475     1497726
+Direct pages reclaimed                     805148398   280167837     3623473     2215044    40809360
+Kswapd efficiency                                83%         69%         58%         57%         79%
+Kswapd velocity                              664.399     622.521    4253.852    7304.360     751.490
+Direct efficiency                                74%          9%          0%          1%          0%
+Direct velocity                            20557.737  264745.137 3522673.849  498551.938 2341481.435
+Percentage direct scans                          96%         99%         99%         98%         99%
+Page writes by reclaim                        722646      529174      620319      791018      699198
+Page writes file                              332573        1080         122         106         913
+Page writes anon                              390073      528094      620197      790912      698285
+Page reclaim immediate                             0  2552514720  1635858848   111281140  5478375032
+Page rescued immediate                             0           0           0       87848           0
+Slabs scanned                                  23552       23552        9216        8192        9216
+Direct inode steals                              231           0           0           0           0
+Kswapd inode steals                                0           0           0           0           0
+Kswapd skipped wait                            28076         786           0          61           6
+THP fault alloc                                  609         383         753         906        1433
+THP collapse alloc                                12           6           0           0           6
+THP splits                                       536         211         456         593        1136
+THP fault fallback                              4406        4633        4263        4110        3583
+THP collapse fail                                120         127           0           0           4
+Compaction stalls                               1810         728         623         779        3200
+Compaction success                               196          53          60          80         123
+Compaction failures                             1614         675         563         699        3077
+Compaction pages moved                        193158       53545      243185      333457      226688
+Compaction move failure                         9952        9396       16424       23676       45070
+
+The main things to look at are
+
+1. Page In/out figures are much reduced by the series.
+
+2. Direct page scanning is incredibly high (264745.137 pages scanned
+   per second on the vanilla kernel) but isolating PageReclaim pages
+   on their own list reduces the number of pages scanned significantly.
+
+3. The fact that "Page rescued immediate" is a positive number implies
+   that we sometimes race removing pages from the LRU_IMMEDIATE list
+   that need to be put back on a normal LRU but it happens only for
+   0.07% of the pages marked for immediate reclaim.
+
+writebackCPDeviceext4
+                   3.1.0-vanilla         rc5-vanilla       freemore-v6r1        isolate-v6r1         andrea-v2r1
+System Time         1.51 (    0.00%)    1.77 (  -17.66%)    1.46 (    2.92%)    1.15 (   23.77%)    1.89 (  -25.63%)
++/-                 0.27 (    0.00%)    0.67 ( -148.52%)    0.33 (  -22.76%)    0.30 (  -11.15%)    0.19 (   30.16%)
+User Time           0.03 (    0.00%)    0.04 (  -37.50%)    0.05 (  -62.50%)    0.07 ( -112.50%)    0.04 (  -18.75%)
++/-                 0.01 (    0.00%)    0.02 ( -146.64%)    0.02 (  -97.91%)    0.02 (  -75.59%)    0.02 (  -63.30%)
+Elapsed Time      124.93 (    0.00%)  114.49 (    8.36%)   96.77 (   22.55%)   27.48 (   78.00%)  205.70 (  -64.65%)
++/-                20.20 (    0.00%)   74.39 ( -268.34%)   59.88 ( -196.48%)    7.72 (   61.79%)   25.03 (  -23.95%)
+THP Active        161.80 (    0.00%)   83.60 (   51.67%)  141.20 (   87.27%)   84.60 (   52.29%)   82.60 (   51.05%)
++/-                71.95 (    0.00%)   43.80 (   60.88%)   26.91 (   37.40%)   59.02 (   82.03%)   52.13 (   72.45%)
+Fault Alloc       471.40 (    0.00%)  228.60 (   48.49%)  282.20 (   59.86%)  225.20 (   47.77%)  388.40 (   82.39%)
++/-                88.07 (    0.00%)   87.42 (   99.26%)   73.79 (   83.78%)  109.62 (  124.47%)   82.62 (   93.81%)
+Fault Fallback    531.60 (    0.00%)  774.60 (  -45.71%)  720.80 (  -35.59%)  777.80 (  -46.31%)  614.80 (  -15.65%)
++/-                88.07 (    0.00%)   87.26 (    0.92%)   73.79 (   16.22%)  109.62 (  -24.47%)   82.29 (    6.56%)
+MMTests Statistics: duration
+User/Sys Time Running Test (seconds)         50.22     33.76     30.65     24.14    128.45
+Total Elapsed Time (seconds)               1113.73   1132.19   1029.45    759.49   1707.26
+
+Similar test but the USB stick is using ext4 instead of vfat. As
+ext4 does not use writepage for migration, the large stalls due to
+compaction when THP is enabled are not observed. Still, isolating
+PageReclaim pages on their own list helped completion time largely
+by reducing the number of pages scanned by direct reclaim although
+time spend in congestion_wait could also be a factor.
+
+Again, Andrea's series had far higher success rates for THP allocation
+at the cost of elapsed time. I didn't look too closely but a quick
+look at the vmstat figures tells me kswapd reclaimed 8 times more pages
+than the patch series and direct reclaim reclaimed roughly three times
+as many pages. It follows that if memory is aggressively reclaimed,
+there will be more available for THP.
+
+writebackCPFilevfat
+                   3.1.0-vanilla         rc5-vanilla       freemore-v6r1        isolate-v6r1         andrea-v2r1
+System Time         1.76 (    0.00%)   29.10 (-1555.52%)   46.01 (-2517.18%)    4.79 ( -172.35%)   54.89 (-3022.53%)
++/-                 0.14 (    0.00%)   25.61 (-18185.17%)    2.15 (-1434.83%)    6.60 (-4610.03%)    9.75
+(-6863.76%)
+User Time           0.05 (    0.00%)    0.07 (  -45.83%)    0.05 (   -4.17%)    0.06 (  -29.17%)    0.06 (  -16.67%)
++/-                 0.02 (    0.00%)    0.02 (   20.11%)    0.02 (   -3.14%)    0.01 (   31.58%)    0.01 (   47.41%)
+Elapsed Time     22520.79 (    0.00%) 1082.85 (   95.19%)   73.30 (   99.67%)   32.43 (   99.86%)  291.84 (  98.70%)
++/-              7277.23 (    0.00%)  706.29 (   90.29%)   19.05 (   99.74%)   17.05 (   99.77%)  125.55 (   98.27%)
+THP Active         83.80 (    0.00%)   12.80 (   15.27%)   15.60 (   18.62%)   13.00 (   15.51%)    0.80 (    0.95%)
++/-                66.81 (    0.00%)   20.19 (   30.22%)    5.92 (    8.86%)   15.06 (   22.54%)    1.17 (    1.75%)
+Fault Alloc       171.00 (    0.00%)   67.80 (   39.65%)   97.40 (   56.96%)  125.60 (   73.45%)  133.00 (   77.78%)
++/-                82.91 (    0.00%)   30.69 (   37.02%)   53.91 (   65.02%)   55.05 (   66.40%)   21.19 (   25.56%)
+Fault Fallback    832.00 (    0.00%)  935.20 (  -12.40%)  906.00 (   -8.89%)  877.40 (   -5.46%)  870.20 (   -4.59%)
++/-                82.91 (    0.00%)   30.69 (   62.98%)   54.01 (   34.86%)   55.05 (   33.60%)   20.91 (   74.78%)
+MMTests Statistics: duration
+User/Sys Time Running Test (seconds)       7229.81    928.42    704.52     80.68   1330.76
+Total Elapsed Time (seconds)             112849.04   5618.69    571.11    360.54   1664.28
+
+In this case, the test is reading/writing only from filesystems but as
+it's vfat, it's slow due to calling writepage during compaction. Little
+to observe really - the time to complete the test goes way down
+with the series applied and THP allocation success rates go up in
+comparison to 3.2-rc5.  The success rates are lower than 3.1.0 but
+the elapsed time for that kernel is abysmal so it is not really a
+sensible comparison.
+
+As before, Andrea's series allocates more THPs at the cost of overall
+performance.
+
+writebackCPFileext4
+                   3.1.0-vanilla         rc5-vanilla       freemore-v6r1        isolate-v6r1         andrea-v2r1
+System Time         1.51 (    0.00%)    1.77 (  -17.66%)    1.46 (    2.92%)    1.15 (   23.77%)    1.89 (  -25.63%)
++/-                 0.27 (    0.00%)    0.67 ( -148.52%)    0.33 (  -22.76%)    0.30 (  -11.15%)    0.19 (   30.16%)
+User Time           0.03 (    0.00%)    0.04 (  -37.50%)    0.05 (  -62.50%)    0.07 ( -112.50%)    0.04 (  -18.75%)
++/-                 0.01 (    0.00%)    0.02 ( -146.64%)    0.02 (  -97.91%)    0.02 (  -75.59%)    0.02 (  -63.30%)
+Elapsed Time      124.93 (    0.00%)  114.49 (    8.36%)   96.77 (   22.55%)   27.48 (   78.00%)  205.70 (  -64.65%)
++/-                20.20 (    0.00%)   74.39 ( -268.34%)   59.88 ( -196.48%)    7.72 (   61.79%)   25.03 (  -23.95%)
+THP Active        161.80 (    0.00%)   83.60 (   51.67%)  141.20 (   87.27%)   84.60 (   52.29%)   82.60 (   51.05%)
++/-                71.95 (    0.00%)   43.80 (   60.88%)   26.91 (   37.40%)   59.02 (   82.03%)   52.13 (   72.45%)
+Fault Alloc       471.40 (    0.00%)  228.60 (   48.49%)  282.20 (   59.86%)  225.20 (   47.77%)  388.40 (   82.39%)
++/-                88.07 (    0.00%)   87.42 (   99.26%)   73.79 (   83.78%)  109.62 (  124.47%)   82.62 (   93.81%)
+Fault Fallback    531.60 (    0.00%)  774.60 (  -45.71%)  720.80 (  -35.59%)  777.80 (  -46.31%)  614.80 (  -15.65%)
++/-                88.07 (    0.00%)   87.26 (    0.92%)   73.79 (   16.22%)  109.62 (  -24.47%)   82.29 (    6.56%)
+MMTests Statistics: duration
+User/Sys Time Running Test (seconds)         50.22     33.76     30.65     24.14    128.45
+Total Elapsed Time (seconds)               1113.73   1132.19   1029.45    759.49   1707.26
+
+Same type of story - elapsed times go down. In this case, allocation
+success rates are roughtly the same. As before, Andrea's has higher
+success rates but takes a lot longer.
+
+Overall the series does reduce latencies and while the tests are
+inherency racy as alloc competes with the cp processes, the variability
+was included. The THP allocation rates are not as high as they could
+be but that is because we would have to be more aggressive about
+reclaim and compaction impacting overall performance.
+
+This patch:
+
+Commit 39deaf85 ("mm: compaction: make isolate_lru_page() filter-aware")
+noted that compaction does not migrate dirty or writeback pages and that
+is was meaningless to pick the page and re-add it to the LRU list.
+
+What was missed during review is that asynchronous migration moves dirty
+pages if their ->migratepage callback is migrate_page() because these can
+be moved without blocking.  This potentially impacted hugepage allocation
+success rates by a factor depending on how many dirty pages are in the
+system.
+
+This patch partially reverts 39deaf85 to allow migration to isolate dirty
+pages again.  This increases how much compaction disrupts the LRU but that
+is addressed later in the series.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Andrea Arcangeli <aarcange@redhat.com>
+Reviewed-by: Rik van Riel <riel@redhat.com>
+Reviewed-by: Minchan Kim <minchan.kim@gmail.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/compaction.c |    3 ---
+ 1 files changed, 0 insertions(+), 3 deletions(-)
+
+diff --git a/mm/compaction.c b/mm/compaction.c
+index 50f1c60..b81625d 100644
+--- a/mm/compaction.c
++++ b/mm/compaction.c
+@@ -371,9 +371,6 @@ static isolate_migrate_t isolate_migratepages(struct zone *zone,
+ 			continue;
+ 		}
+ 
+-		if (!cc->sync)
+-			mode |= ISOLATE_CLEAN;
+-
+ 		/* Try isolate the page */
+ 		if (__isolate_lru_page(page, mode, 0) != 0)
+ 			continue;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0003-mm-compaction-determine-if-dirty-pages-can-be-migrat.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0003-mm-compaction-determine-if-dirty-pages-can-be-migrat.patch
new file mode 100644
index 0000000..b6a461b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0003-mm-compaction-determine-if-dirty-pages-can-be-migrat.patch
@@ -0,0 +1,376 @@
+From 45d9f4db29d9a2f44900c90ab81514c7e04cb1b9 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:34 -0800
+Subject: [PATCH 03/73] mm: compaction: determine if dirty pages can be
+ migrated without blocking within ->migratepage
+
+commit b969c4ab9f182a6e1b2a0848be349f99714947b0 upstream.
+
+Stable note: Not tracked in Bugzilla. A fix aimed at preserving page
+	aging information by reducing LRU list churning had the side-effect
+	of reducing THP allocation success rates. This was part of a series
+	to restore the success rates while preserving the reclaim fix.
+
+Asynchronous compaction is used when allocating transparent hugepages to
+avoid blocking for long periods of time.  Due to reports of stalling,
+there was a debate on disabling synchronous compaction but this severely
+impacted allocation success rates.  Part of the reason was that many dirty
+pages are skipped in asynchronous compaction by the following check;
+
+	if (PageDirty(page) && !sync &&
+		mapping->a_ops->migratepage != migrate_page)
+			rc = -EBUSY;
+
+This skips over all mapping aops using buffer_migrate_page() even though
+it is possible to migrate some of these pages without blocking.  This
+patch updates the ->migratepage callback with a "sync" parameter.  It is
+the responsibility of the callback to fail gracefully if migration would
+block.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel <riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/btrfs/disk-io.c      |    4 +-
+ fs/hugetlbfs/inode.c    |    3 +-
+ fs/nfs/internal.h       |    2 +-
+ fs/nfs/write.c          |    4 +-
+ include/linux/fs.h      |    9 ++-
+ include/linux/migrate.h |    2 +-
+ mm/migrate.c            |  129 +++++++++++++++++++++++++++++++++-------------
+ 7 files changed, 106 insertions(+), 47 deletions(-)
+
+diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
+index f44b392..fa7cddf 100644
+--- a/fs/btrfs/disk-io.c
++++ b/fs/btrfs/disk-io.c
+@@ -872,7 +872,7 @@ static int btree_submit_bio_hook(struct inode *inode, int rw, struct bio *bio,
+ 
+ #ifdef CONFIG_MIGRATION
+ static int btree_migratepage(struct address_space *mapping,
+-			struct page *newpage, struct page *page)
++			struct page *newpage, struct page *page, bool sync)
+ {
+ 	/*
+ 	 * we can't safely write a btree page from here,
+@@ -887,7 +887,7 @@ static int btree_migratepage(struct address_space *mapping,
+ 	if (page_has_private(page) &&
+ 	    !try_to_release_page(page, GFP_KERNEL))
+ 		return -EAGAIN;
+-	return migrate_page(mapping, newpage, page);
++	return migrate_page(mapping, newpage, page, sync);
+ }
+ #endif
+ 
+diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
+index ebc2f4d..217b771 100644
+--- a/fs/hugetlbfs/inode.c
++++ b/fs/hugetlbfs/inode.c
+@@ -569,7 +569,8 @@ static int hugetlbfs_set_page_dirty(struct page *page)
+ }
+ 
+ static int hugetlbfs_migrate_page(struct address_space *mapping,
+-				struct page *newpage, struct page *page)
++				struct page *newpage, struct page *page,
++				bool sync)
+ {
+ 	int rc;
+ 
+diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
+index 3f4d957..8d96ed6 100644
+--- a/fs/nfs/internal.h
++++ b/fs/nfs/internal.h
+@@ -330,7 +330,7 @@ void nfs_commit_release_pages(struct nfs_write_data *data);
+ 
+ #ifdef CONFIG_MIGRATION
+ extern int nfs_migrate_page(struct address_space *,
+-		struct page *, struct page *);
++		struct page *, struct page *, bool);
+ #else
+ #define nfs_migrate_page NULL
+ #endif
+diff --git a/fs/nfs/write.c b/fs/nfs/write.c
+index 4efd421..31b2461 100644
+--- a/fs/nfs/write.c
++++ b/fs/nfs/write.c
+@@ -1711,7 +1711,7 @@ out_error:
+ 
+ #ifdef CONFIG_MIGRATION
+ int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
+-		struct page *page)
++		struct page *page, bool sync)
+ {
+ 	/*
+ 	 * If PagePrivate is set, then the page is currently associated with
+@@ -1726,7 +1726,7 @@ int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
+ 
+ 	nfs_fscache_release_page(page, GFP_KERNEL);
+ 
+-	return migrate_page(mapping, newpage, page);
++	return migrate_page(mapping, newpage, page, sync);
+ }
+ #endif
+ 
+diff --git a/include/linux/fs.h b/include/linux/fs.h
+index 43d36b7..2ae90d3 100644
+--- a/include/linux/fs.h
++++ b/include/linux/fs.h
+@@ -609,9 +609,12 @@ struct address_space_operations {
+ 			loff_t offset, unsigned long nr_segs);
+ 	int (*get_xip_mem)(struct address_space *, pgoff_t, int,
+ 						void **, unsigned long *);
+-	/* migrate the contents of a page to the specified target */
++	/*
++	 * migrate the contents of a page to the specified target. If sync
++	 * is false, it must not block.
++	 */
+ 	int (*migratepage) (struct address_space *,
+-			struct page *, struct page *);
++			struct page *, struct page *, bool);
+ 	int (*launder_page) (struct page *);
+ 	int (*is_partially_uptodate) (struct page *, read_descriptor_t *,
+ 					unsigned long);
+@@ -2586,7 +2589,7 @@ extern int generic_check_addressable(unsigned, u64);
+ 
+ #ifdef CONFIG_MIGRATION
+ extern int buffer_migrate_page(struct address_space *,
+-				struct page *, struct page *);
++				struct page *, struct page *, bool);
+ #else
+ #define buffer_migrate_page NULL
+ #endif
+diff --git a/include/linux/migrate.h b/include/linux/migrate.h
+index e39aeec..14e6d2a 100644
+--- a/include/linux/migrate.h
++++ b/include/linux/migrate.h
+@@ -11,7 +11,7 @@ typedef struct page *new_page_t(struct page *, unsigned long private, int **);
+ 
+ extern void putback_lru_pages(struct list_head *l);
+ extern int migrate_page(struct address_space *,
+-			struct page *, struct page *);
++			struct page *, struct page *, bool);
+ extern int migrate_pages(struct list_head *l, new_page_t x,
+ 			unsigned long private, bool offlining,
+ 			bool sync);
+diff --git a/mm/migrate.c b/mm/migrate.c
+index 177aca4..65c12d2 100644
+--- a/mm/migrate.c
++++ b/mm/migrate.c
+@@ -220,6 +220,55 @@ out:
+ 	pte_unmap_unlock(ptep, ptl);
+ }
+ 
++#ifdef CONFIG_BLOCK
++/* Returns true if all buffers are successfully locked */
++static bool buffer_migrate_lock_buffers(struct buffer_head *head, bool sync)
++{
++	struct buffer_head *bh = head;
++
++	/* Simple case, sync compaction */
++	if (sync) {
++		do {
++			get_bh(bh);
++			lock_buffer(bh);
++			bh = bh->b_this_page;
++
++		} while (bh != head);
++
++		return true;
++	}
++
++	/* async case, we cannot block on lock_buffer so use trylock_buffer */
++	do {
++		get_bh(bh);
++		if (!trylock_buffer(bh)) {
++			/*
++			 * We failed to lock the buffer and cannot stall in
++			 * async migration. Release the taken locks
++			 */
++			struct buffer_head *failed_bh = bh;
++			put_bh(failed_bh);
++			bh = head;
++			while (bh != failed_bh) {
++				unlock_buffer(bh);
++				put_bh(bh);
++				bh = bh->b_this_page;
++			}
++			return false;
++		}
++
++		bh = bh->b_this_page;
++	} while (bh != head);
++	return true;
++}
++#else
++static inline bool buffer_migrate_lock_buffers(struct buffer_head *head,
++								bool sync)
++{
++	return true;
++}
++#endif /* CONFIG_BLOCK */
++
+ /*
+  * Replace the page in the mapping.
+  *
+@@ -229,7 +278,8 @@ out:
+  * 3 for pages with a mapping and PagePrivate/PagePrivate2 set.
+  */
+ static int migrate_page_move_mapping(struct address_space *mapping,
+-		struct page *newpage, struct page *page)
++		struct page *newpage, struct page *page,
++		struct buffer_head *head, bool sync)
+ {
+ 	int expected_count;
+ 	void **pslot;
+@@ -259,6 +309,19 @@ static int migrate_page_move_mapping(struct address_space *mapping,
+ 	}
+ 
+ 	/*
++	 * In the async migration case of moving a page with buffers, lock the
++	 * buffers using trylock before the mapping is moved. If the mapping
++	 * was moved, we later failed to lock the buffers and could not move
++	 * the mapping back due to an elevated page count, we would have to
++	 * block waiting on other references to be dropped.
++	 */
++	if (!sync && head && !buffer_migrate_lock_buffers(head, sync)) {
++		page_unfreeze_refs(page, expected_count);
++		spin_unlock_irq(&mapping->tree_lock);
++		return -EAGAIN;
++	}
++
++	/*
+ 	 * Now we know that no one else is looking at the page.
+ 	 */
+ 	get_page(newpage);	/* add cache reference */
+@@ -415,13 +478,13 @@ EXPORT_SYMBOL(fail_migrate_page);
+  * Pages are locked upon entry and exit.
+  */
+ int migrate_page(struct address_space *mapping,
+-		struct page *newpage, struct page *page)
++		struct page *newpage, struct page *page, bool sync)
+ {
+ 	int rc;
+ 
+ 	BUG_ON(PageWriteback(page));	/* Writeback must be complete */
+ 
+-	rc = migrate_page_move_mapping(mapping, newpage, page);
++	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, sync);
+ 
+ 	if (rc)
+ 		return rc;
+@@ -438,28 +501,28 @@ EXPORT_SYMBOL(migrate_page);
+  * exist.
+  */
+ int buffer_migrate_page(struct address_space *mapping,
+-		struct page *newpage, struct page *page)
++		struct page *newpage, struct page *page, bool sync)
+ {
+ 	struct buffer_head *bh, *head;
+ 	int rc;
+ 
+ 	if (!page_has_buffers(page))
+-		return migrate_page(mapping, newpage, page);
++		return migrate_page(mapping, newpage, page, sync);
+ 
+ 	head = page_buffers(page);
+ 
+-	rc = migrate_page_move_mapping(mapping, newpage, page);
++	rc = migrate_page_move_mapping(mapping, newpage, page, head, sync);
+ 
+ 	if (rc)
+ 		return rc;
+ 
+-	bh = head;
+-	do {
+-		get_bh(bh);
+-		lock_buffer(bh);
+-		bh = bh->b_this_page;
+-
+-	} while (bh != head);
++	/*
++	 * In the async case, migrate_page_move_mapping locked the buffers
++	 * with an IRQ-safe spinlock held. In the sync case, the buffers
++	 * need to be locked now
++	 */
++	if (sync)
++		BUG_ON(!buffer_migrate_lock_buffers(head, sync));
+ 
+ 	ClearPagePrivate(page);
+ 	set_page_private(newpage, page_private(page));
+@@ -536,10 +599,13 @@ static int writeout(struct address_space *mapping, struct page *page)
+  * Default handling if a filesystem does not provide a migration function.
+  */
+ static int fallback_migrate_page(struct address_space *mapping,
+-	struct page *newpage, struct page *page)
++	struct page *newpage, struct page *page, bool sync)
+ {
+-	if (PageDirty(page))
++	if (PageDirty(page)) {
++		if (!sync)
++			return -EBUSY;
+ 		return writeout(mapping, page);
++	}
+ 
+ 	/*
+ 	 * Buffers may be managed in a filesystem specific way.
+@@ -549,7 +615,7 @@ static int fallback_migrate_page(struct address_space *mapping,
+ 	    !try_to_release_page(page, GFP_KERNEL))
+ 		return -EAGAIN;
+ 
+-	return migrate_page(mapping, newpage, page);
++	return migrate_page(mapping, newpage, page, sync);
+ }
+ 
+ /*
+@@ -585,29 +651,18 @@ static int move_to_new_page(struct page *newpage, struct page *page,
+ 
+ 	mapping = page_mapping(page);
+ 	if (!mapping)
+-		rc = migrate_page(mapping, newpage, page);
+-	else {
++		rc = migrate_page(mapping, newpage, page, sync);
++	else if (mapping->a_ops->migratepage)
+ 		/*
+-		 * Do not writeback pages if !sync and migratepage is
+-		 * not pointing to migrate_page() which is nonblocking
+-		 * (swapcache/tmpfs uses migratepage = migrate_page).
++		 * Most pages have a mapping and most filesystems provide a
++		 * migratepage callback. Anonymous pages are part of swap
++		 * space which also has its own migratepage callback. This
++		 * is the most common path for page migration.
+ 		 */
+-		if (PageDirty(page) && !sync &&
+-		    mapping->a_ops->migratepage != migrate_page)
+-			rc = -EBUSY;
+-		else if (mapping->a_ops->migratepage)
+-			/*
+-			 * Most pages have a mapping and most filesystems
+-			 * should provide a migration function. Anonymous
+-			 * pages are part of swap space which also has its
+-			 * own migration function. This is the most common
+-			 * path for page migration.
+-			 */
+-			rc = mapping->a_ops->migratepage(mapping,
+-							newpage, page);
+-		else
+-			rc = fallback_migrate_page(mapping, newpage, page);
+-	}
++		rc = mapping->a_ops->migratepage(mapping,
++						newpage, page, sync);
++	else
++		rc = fallback_migrate_page(mapping, newpage, page, sync);
+ 
+ 	if (rc) {
+ 		newpage->mapping = NULL;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0004-mm-page-allocator-do-not-call-direct-reclaim-for-THP.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0004-mm-page-allocator-do-not-call-direct-reclaim-for-THP.patch
new file mode 100644
index 0000000..7d71a05
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0004-mm-page-allocator-do-not-call-direct-reclaim-for-THP.patch
@@ -0,0 +1,143 @@
+From 246126d86b5c74067beda5a972d4c0e1a03ec9ef Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:41 -0800
+Subject: [PATCH 04/73] mm: page allocator: do not call direct reclaim for THP
+ allocations while compaction is deferred
+
+commit 66199712e9eef5aede09dbcd9dfff87798a66917 upstream.
+
+Stable note: Not tracked in Buzilla. This was part of a series that
+	reduced interactivity stalls experienced when THP was enabled.
+
+If compaction is deferred, direct reclaim is used to try to free enough
+pages for the allocation to succeed.  For small high-orders, this has a
+reasonable chance of success.  However, if the caller has specified
+__GFP_NO_KSWAPD to limit the disruption to the system, it makes more sense
+to fail the allocation rather than stall the caller in direct reclaim.
+This patch skips direct reclaim if compaction is deferred and the caller
+specifies __GFP_NO_KSWAPD.
+
+Async compaction only considers a subset of pages so it is possible for
+compaction to be deferred prematurely and not enter direct reclaim even in
+cases where it should.  To compensate for this, this patch also defers
+compaction only if sync compaction failed.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Acked-by: Minchan Kim <minchan.kim@gmail.com>
+Reviewed-by: Rik van Riel<riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/page_alloc.c |   45 +++++++++++++++++++++++++++++++++++----------
+ 1 files changed, 35 insertions(+), 10 deletions(-)
+
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index cb3460e..ef6e1a1 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -1886,14 +1886,20 @@ static struct page *
+ __alloc_pages_direct_compact(gfp_t gfp_mask, unsigned int order,
+ 	struct zonelist *zonelist, enum zone_type high_zoneidx,
+ 	nodemask_t *nodemask, int alloc_flags, struct zone *preferred_zone,
+-	int migratetype, unsigned long *did_some_progress,
+-	bool sync_migration)
++	int migratetype, bool sync_migration,
++	bool *deferred_compaction,
++	unsigned long *did_some_progress)
+ {
+ 	struct page *page;
+ 
+-	if (!order || compaction_deferred(preferred_zone))
++	if (!order)
+ 		return NULL;
+ 
++	if (compaction_deferred(preferred_zone)) {
++		*deferred_compaction = true;
++		return NULL;
++	}
++
+ 	current->flags |= PF_MEMALLOC;
+ 	*did_some_progress = try_to_compact_pages(zonelist, order, gfp_mask,
+ 						nodemask, sync_migration);
+@@ -1921,7 +1927,13 @@ __alloc_pages_direct_compact(gfp_t gfp_mask, unsigned int order,
+ 		 * but not enough to satisfy watermarks.
+ 		 */
+ 		count_vm_event(COMPACTFAIL);
+-		defer_compaction(preferred_zone);
++
++		/*
++		 * As async compaction considers a subset of pageblocks, only
++		 * defer if the failure was a sync compaction failure.
++		 */
++		if (sync_migration)
++			defer_compaction(preferred_zone);
+ 
+ 		cond_resched();
+ 	}
+@@ -1933,8 +1945,9 @@ static inline struct page *
+ __alloc_pages_direct_compact(gfp_t gfp_mask, unsigned int order,
+ 	struct zonelist *zonelist, enum zone_type high_zoneidx,
+ 	nodemask_t *nodemask, int alloc_flags, struct zone *preferred_zone,
+-	int migratetype, unsigned long *did_some_progress,
+-	bool sync_migration)
++	int migratetype, bool sync_migration,
++	bool *deferred_compaction,
++	unsigned long *did_some_progress)
+ {
+ 	return NULL;
+ }
+@@ -2084,6 +2097,7 @@ __alloc_pages_slowpath(gfp_t gfp_mask, unsigned int order,
+ 	unsigned long pages_reclaimed = 0;
+ 	unsigned long did_some_progress;
+ 	bool sync_migration = false;
++	bool deferred_compaction = false;
+ 
+ 	/*
+ 	 * In the slowpath, we sanity check order to avoid ever trying to
+@@ -2164,12 +2178,22 @@ rebalance:
+ 					zonelist, high_zoneidx,
+ 					nodemask,
+ 					alloc_flags, preferred_zone,
+-					migratetype, &did_some_progress,
+-					sync_migration);
++					migratetype, sync_migration,
++					&deferred_compaction,
++					&did_some_progress);
+ 	if (page)
+ 		goto got_pg;
+ 	sync_migration = true;
+ 
++	/*
++	 * If compaction is deferred for high-order allocations, it is because
++	 * sync compaction recently failed. In this is the case and the caller
++	 * has requested the system not be heavily disrupted, fail the
++	 * allocation now instead of entering direct reclaim
++	 */
++	if (deferred_compaction && (gfp_mask & __GFP_NO_KSWAPD))
++		goto nopage;
++
+ 	/* Try direct reclaim and then allocating */
+ 	page = __alloc_pages_direct_reclaim(gfp_mask, order,
+ 					zonelist, high_zoneidx,
+@@ -2232,8 +2256,9 @@ rebalance:
+ 					zonelist, high_zoneidx,
+ 					nodemask,
+ 					alloc_flags, preferred_zone,
+-					migratetype, &did_some_progress,
+-					sync_migration);
++					migratetype, sync_migration,
++					&deferred_compaction,
++					&did_some_progress);
+ 		if (page)
+ 			goto got_pg;
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0005-mm-compaction-make-isolate_lru_page-filter-aware-aga.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0005-mm-compaction-make-isolate_lru_page-filter-aware-aga.patch
new file mode 100644
index 0000000..1cf5109
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0005-mm-compaction-make-isolate_lru_page-filter-aware-aga.patch
@@ -0,0 +1,117 @@
+From 67c64d699499fd5b83ca0be6f66eaca18cc29601 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:38 -0800
+Subject: [PATCH 05/73] mm: compaction: make isolate_lru_page() filter-aware
+ again
+
+commit c82449352854ff09e43062246af86bdeb628f0c3 upstream.
+
+Stable note: Not tracked in Bugzilla. A fix aimed at preserving page aging
+	information by reducing LRU list churning had the side-effect of
+	reducing THP allocation success rates. This was part of a series
+	to restore the success rates while preserving the reclaim fix.
+
+Commit 39deaf85 ("mm: compaction: make isolate_lru_page() filter-aware")
+noted that compaction does not migrate dirty or writeback pages and that
+is was meaningless to pick the page and re-add it to the LRU list.  This
+had to be partially reverted because some dirty pages can be migrated by
+compaction without blocking.
+
+This patch updates "mm: compaction: make isolate_lru_page" by skipping
+over pages that migration has no possibility of migrating to minimise LRU
+disruption.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel<riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Reviewed-by: Minchan Kim <minchan@kernel.org>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/mmzone.h |    2 ++
+ mm/compaction.c        |    3 +++
+ mm/vmscan.c            |   35 +++++++++++++++++++++++++++++++++--
+ 3 files changed, 38 insertions(+), 2 deletions(-)
+
+diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
+index 905b1e1..25842b6 100644
+--- a/include/linux/mmzone.h
++++ b/include/linux/mmzone.h
+@@ -173,6 +173,8 @@ static inline int is_unevictable_lru(enum lru_list l)
+ #define ISOLATE_CLEAN		((__force isolate_mode_t)0x4)
+ /* Isolate unmapped file */
+ #define ISOLATE_UNMAPPED	((__force isolate_mode_t)0x8)
++/* Isolate for asynchronous migration */
++#define ISOLATE_ASYNC_MIGRATE	((__force isolate_mode_t)0x10)
+ 
+ /* LRU Isolation modes. */
+ typedef unsigned __bitwise__ isolate_mode_t;
+diff --git a/mm/compaction.c b/mm/compaction.c
+index b81625d..979a919 100644
+--- a/mm/compaction.c
++++ b/mm/compaction.c
+@@ -371,6 +371,9 @@ static isolate_migrate_t isolate_migratepages(struct zone *zone,
+ 			continue;
+ 		}
+ 
++		if (!cc->sync)
++			mode |= ISOLATE_ASYNC_MIGRATE;
++
+ 		/* Try isolate the page */
+ 		if (__isolate_lru_page(page, mode, 0) != 0)
+ 			continue;
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index 8342119..1b95e4c 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -1061,8 +1061,39 @@ int __isolate_lru_page(struct page *page, isolate_mode_t mode, int file)
+ 
+ 	ret = -EBUSY;
+ 
+-	if ((mode & ISOLATE_CLEAN) && (PageDirty(page) || PageWriteback(page)))
+-		return ret;
++	/*
++	 * To minimise LRU disruption, the caller can indicate that it only
++	 * wants to isolate pages it will be able to operate on without
++	 * blocking - clean pages for the most part.
++	 *
++	 * ISOLATE_CLEAN means that only clean pages should be isolated. This
++	 * is used by reclaim when it is cannot write to backing storage
++	 *
++	 * ISOLATE_ASYNC_MIGRATE is used to indicate that it only wants to pages
++	 * that it is possible to migrate without blocking
++	 */
++	if (mode & (ISOLATE_CLEAN|ISOLATE_ASYNC_MIGRATE)) {
++		/* All the caller can do on PageWriteback is block */
++		if (PageWriteback(page))
++			return ret;
++
++		if (PageDirty(page)) {
++			struct address_space *mapping;
++
++			/* ISOLATE_CLEAN means only clean pages */
++			if (mode & ISOLATE_CLEAN)
++				return ret;
++
++			/*
++			 * Only pages without mappings or that have a
++			 * ->migratepage callback are possible to migrate
++			 * without blocking
++			 */
++			mapping = page_mapping(page);
++			if (mapping && !mapping->a_ops->migratepage)
++				return ret;
++		}
++	}
+ 
+ 	if ((mode & ISOLATE_UNMAPPED) && page_mapped(page))
+ 		return ret;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0006-mm-compaction-introduce-sync-light-migration-for-use.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0006-mm-compaction-introduce-sync-light-migration-for-use.patch
new file mode 100644
index 0000000..25e33ab
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0006-mm-compaction-introduce-sync-light-migration-for-use.patch
@@ -0,0 +1,547 @@
+From 0fe5ee08804cfadf02801cf6d82f0e2594cd04bd Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:43 -0800
+Subject: [PATCH 06/73] mm: compaction: introduce sync-light migration for use
+ by compaction
+
+commit a6bc32b899223a877f595ef9ddc1e89ead5072b8 upstream.
+
+Stable note: Not tracked in Buzilla. This was part of a series that
+	reduced interactivity stalls experienced when THP was enabled.
+	These stalls were particularly noticable when copying data
+	to a USB stick but the experiences for users varied a lot.
+
+This patch adds a lightweight sync migrate operation MIGRATE_SYNC_LIGHT
+mode that avoids writing back pages to backing storage.  Async compaction
+maps to MIGRATE_ASYNC while sync compaction maps to MIGRATE_SYNC_LIGHT.
+For other migrate_pages users such as memory hotplug, MIGRATE_SYNC is
+used.
+
+This avoids sync compaction stalling for an excessive length of time,
+particularly when copying files to a USB stick where there might be a
+large number of dirty pages backed by a filesystem that does not support
+->writepages.
+
+[aarcange@redhat.com: This patch is heavily based on Andrea's work]
+[akpm@linux-foundation.org: fix fs/nfs/write.c build]
+[akpm@linux-foundation.org: fix fs/btrfs/disk-io.c build]
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel <riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/btrfs/disk-io.c      |    5 ++-
+ fs/hugetlbfs/inode.c    |    2 +-
+ fs/nfs/internal.h       |    2 +-
+ fs/nfs/write.c          |    4 +-
+ include/linux/fs.h      |    6 ++-
+ include/linux/migrate.h |   23 +++++++++++---
+ mm/compaction.c         |    2 +-
+ mm/memory-failure.c     |    2 +-
+ mm/memory_hotplug.c     |    2 +-
+ mm/mempolicy.c          |    2 +-
+ mm/migrate.c            |   78 ++++++++++++++++++++++++++---------------------
+ 11 files changed, 76 insertions(+), 52 deletions(-)
+
+diff --git a/fs/btrfs/disk-io.c b/fs/btrfs/disk-io.c
+index fa7cddf..6b2a724 100644
+--- a/fs/btrfs/disk-io.c
++++ b/fs/btrfs/disk-io.c
+@@ -872,7 +872,8 @@ static int btree_submit_bio_hook(struct inode *inode, int rw, struct bio *bio,
+ 
+ #ifdef CONFIG_MIGRATION
+ static int btree_migratepage(struct address_space *mapping,
+-			struct page *newpage, struct page *page, bool sync)
++			struct page *newpage, struct page *page,
++			enum migrate_mode mode)
+ {
+ 	/*
+ 	 * we can't safely write a btree page from here,
+@@ -887,7 +888,7 @@ static int btree_migratepage(struct address_space *mapping,
+ 	if (page_has_private(page) &&
+ 	    !try_to_release_page(page, GFP_KERNEL))
+ 		return -EAGAIN;
+-	return migrate_page(mapping, newpage, page, sync);
++	return migrate_page(mapping, newpage, page, mode);
+ }
+ #endif
+ 
+diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
+index 217b771..0aa424a 100644
+--- a/fs/hugetlbfs/inode.c
++++ b/fs/hugetlbfs/inode.c
+@@ -570,7 +570,7 @@ static int hugetlbfs_set_page_dirty(struct page *page)
+ 
+ static int hugetlbfs_migrate_page(struct address_space *mapping,
+ 				struct page *newpage, struct page *page,
+-				bool sync)
++				enum migrate_mode mode)
+ {
+ 	int rc;
+ 
+diff --git a/fs/nfs/internal.h b/fs/nfs/internal.h
+index 8d96ed6..68b3f20 100644
+--- a/fs/nfs/internal.h
++++ b/fs/nfs/internal.h
+@@ -330,7 +330,7 @@ void nfs_commit_release_pages(struct nfs_write_data *data);
+ 
+ #ifdef CONFIG_MIGRATION
+ extern int nfs_migrate_page(struct address_space *,
+-		struct page *, struct page *, bool);
++		struct page *, struct page *, enum migrate_mode);
+ #else
+ #define nfs_migrate_page NULL
+ #endif
+diff --git a/fs/nfs/write.c b/fs/nfs/write.c
+index 31b2461..c6e523a 100644
+--- a/fs/nfs/write.c
++++ b/fs/nfs/write.c
+@@ -1711,7 +1711,7 @@ out_error:
+ 
+ #ifdef CONFIG_MIGRATION
+ int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
+-		struct page *page, bool sync)
++		struct page *page, enum migrate_mode mode)
+ {
+ 	/*
+ 	 * If PagePrivate is set, then the page is currently associated with
+@@ -1726,7 +1726,7 @@ int nfs_migrate_page(struct address_space *mapping, struct page *newpage,
+ 
+ 	nfs_fscache_release_page(page, GFP_KERNEL);
+ 
+-	return migrate_page(mapping, newpage, page, sync);
++	return migrate_page(mapping, newpage, page, mode);
+ }
+ #endif
+ 
+diff --git a/include/linux/fs.h b/include/linux/fs.h
+index 2ae90d3..29b6353 100644
+--- a/include/linux/fs.h
++++ b/include/linux/fs.h
+@@ -525,6 +525,7 @@ enum positive_aop_returns {
+ struct page;
+ struct address_space;
+ struct writeback_control;
++enum migrate_mode;
+ 
+ struct iov_iter {
+ 	const struct iovec *iov;
+@@ -614,7 +615,7 @@ struct address_space_operations {
+ 	 * is false, it must not block.
+ 	 */
+ 	int (*migratepage) (struct address_space *,
+-			struct page *, struct page *, bool);
++			struct page *, struct page *, enum migrate_mode);
+ 	int (*launder_page) (struct page *);
+ 	int (*is_partially_uptodate) (struct page *, read_descriptor_t *,
+ 					unsigned long);
+@@ -2589,7 +2590,8 @@ extern int generic_check_addressable(unsigned, u64);
+ 
+ #ifdef CONFIG_MIGRATION
+ extern int buffer_migrate_page(struct address_space *,
+-				struct page *, struct page *, bool);
++				struct page *, struct page *,
++				enum migrate_mode);
+ #else
+ #define buffer_migrate_page NULL
+ #endif
+diff --git a/include/linux/migrate.h b/include/linux/migrate.h
+index 14e6d2a..eaf8674 100644
+--- a/include/linux/migrate.h
++++ b/include/linux/migrate.h
+@@ -6,18 +6,31 @@
+ 
+ typedef struct page *new_page_t(struct page *, unsigned long private, int **);
+ 
++/*
++ * MIGRATE_ASYNC means never block
++ * MIGRATE_SYNC_LIGHT in the current implementation means to allow blocking
++ *	on most operations but not ->writepage as the potential stall time
++ *	is too significant
++ * MIGRATE_SYNC will block when migrating pages
++ */
++enum migrate_mode {
++	MIGRATE_ASYNC,
++	MIGRATE_SYNC_LIGHT,
++	MIGRATE_SYNC,
++};
++
+ #ifdef CONFIG_MIGRATION
+ #define PAGE_MIGRATION 1
+ 
+ extern void putback_lru_pages(struct list_head *l);
+ extern int migrate_page(struct address_space *,
+-			struct page *, struct page *, bool);
++			struct page *, struct page *, enum migrate_mode);
+ extern int migrate_pages(struct list_head *l, new_page_t x,
+ 			unsigned long private, bool offlining,
+-			bool sync);
++			enum migrate_mode mode);
+ extern int migrate_huge_pages(struct list_head *l, new_page_t x,
+ 			unsigned long private, bool offlining,
+-			bool sync);
++			enum migrate_mode mode);
+ 
+ extern int fail_migrate_page(struct address_space *,
+ 			struct page *, struct page *);
+@@ -36,10 +49,10 @@ extern int migrate_huge_page_move_mapping(struct address_space *mapping,
+ static inline void putback_lru_pages(struct list_head *l) {}
+ static inline int migrate_pages(struct list_head *l, new_page_t x,
+ 		unsigned long private, bool offlining,
+-		bool sync) { return -ENOSYS; }
++		enum migrate_mode mode) { return -ENOSYS; }
+ static inline int migrate_huge_pages(struct list_head *l, new_page_t x,
+ 		unsigned long private, bool offlining,
+-		bool sync) { return -ENOSYS; }
++		enum migrate_mode mode) { return -ENOSYS; }
+ 
+ static inline int migrate_prep(void) { return -ENOSYS; }
+ static inline int migrate_prep_local(void) { return -ENOSYS; }
+diff --git a/mm/compaction.c b/mm/compaction.c
+index 979a919..46973fb 100644
+--- a/mm/compaction.c
++++ b/mm/compaction.c
+@@ -577,7 +577,7 @@ static int compact_zone(struct zone *zone, struct compact_control *cc)
+ 		nr_migrate = cc->nr_migratepages;
+ 		err = migrate_pages(&cc->migratepages, compaction_alloc,
+ 				(unsigned long)cc, false,
+-				cc->sync);
++				cc->sync ? MIGRATE_SYNC_LIGHT : MIGRATE_ASYNC);
+ 		update_nr_listpages(cc);
+ 		nr_remaining = cc->nr_migratepages;
+ 
+diff --git a/mm/memory-failure.c b/mm/memory-failure.c
+index 06d3479..56080ea 100644
+--- a/mm/memory-failure.c
++++ b/mm/memory-failure.c
+@@ -1557,7 +1557,7 @@ int soft_offline_page(struct page *page, int flags)
+ 					    page_is_file_cache(page));
+ 		list_add(&page->lru, &pagelist);
+ 		ret = migrate_pages(&pagelist, new_page, MPOL_MF_MOVE_ALL,
+-								0, true);
++							0, MIGRATE_SYNC);
+ 		if (ret) {
+ 			putback_lru_pages(&pagelist);
+ 			pr_info("soft offline: %#lx: migration failed %d, type %lx\n",
+diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
+index 2168489..6629faf 100644
+--- a/mm/memory_hotplug.c
++++ b/mm/memory_hotplug.c
+@@ -809,7 +809,7 @@ do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
+ 		}
+ 		/* this function returns # of failed pages */
+ 		ret = migrate_pages(&source, hotremove_migrate_alloc, 0,
+-								true, true);
++							true, MIGRATE_SYNC);
+ 		if (ret)
+ 			putback_lru_pages(&source);
+ 	}
+diff --git a/mm/mempolicy.c b/mm/mempolicy.c
+index b26aae2..f2650bc 100644
+--- a/mm/mempolicy.c
++++ b/mm/mempolicy.c
+@@ -942,7 +942,7 @@ static int migrate_to_node(struct mm_struct *mm, int source, int dest,
+ 
+ 	if (!list_empty(&pagelist)) {
+ 		err = migrate_pages(&pagelist, new_node_page, dest,
+-								false, true);
++							false, MIGRATE_SYNC);
+ 		if (err)
+ 			putback_lru_pages(&pagelist);
+ 	}
+diff --git a/mm/migrate.c b/mm/migrate.c
+index 65c12d2..180d97f 100644
+--- a/mm/migrate.c
++++ b/mm/migrate.c
+@@ -222,12 +222,13 @@ out:
+ 
+ #ifdef CONFIG_BLOCK
+ /* Returns true if all buffers are successfully locked */
+-static bool buffer_migrate_lock_buffers(struct buffer_head *head, bool sync)
++static bool buffer_migrate_lock_buffers(struct buffer_head *head,
++							enum migrate_mode mode)
+ {
+ 	struct buffer_head *bh = head;
+ 
+ 	/* Simple case, sync compaction */
+-	if (sync) {
++	if (mode != MIGRATE_ASYNC) {
+ 		do {
+ 			get_bh(bh);
+ 			lock_buffer(bh);
+@@ -263,7 +264,7 @@ static bool buffer_migrate_lock_buffers(struct buffer_head *head, bool sync)
+ }
+ #else
+ static inline bool buffer_migrate_lock_buffers(struct buffer_head *head,
+-								bool sync)
++							enum migrate_mode mode)
+ {
+ 	return true;
+ }
+@@ -279,7 +280,7 @@ static inline bool buffer_migrate_lock_buffers(struct buffer_head *head,
+  */
+ static int migrate_page_move_mapping(struct address_space *mapping,
+ 		struct page *newpage, struct page *page,
+-		struct buffer_head *head, bool sync)
++		struct buffer_head *head, enum migrate_mode mode)
+ {
+ 	int expected_count;
+ 	void **pslot;
+@@ -315,7 +316,8 @@ static int migrate_page_move_mapping(struct address_space *mapping,
+ 	 * the mapping back due to an elevated page count, we would have to
+ 	 * block waiting on other references to be dropped.
+ 	 */
+-	if (!sync && head && !buffer_migrate_lock_buffers(head, sync)) {
++	if (mode == MIGRATE_ASYNC && head &&
++			!buffer_migrate_lock_buffers(head, mode)) {
+ 		page_unfreeze_refs(page, expected_count);
+ 		spin_unlock_irq(&mapping->tree_lock);
+ 		return -EAGAIN;
+@@ -478,13 +480,14 @@ EXPORT_SYMBOL(fail_migrate_page);
+  * Pages are locked upon entry and exit.
+  */
+ int migrate_page(struct address_space *mapping,
+-		struct page *newpage, struct page *page, bool sync)
++		struct page *newpage, struct page *page,
++		enum migrate_mode mode)
+ {
+ 	int rc;
+ 
+ 	BUG_ON(PageWriteback(page));	/* Writeback must be complete */
+ 
+-	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, sync);
++	rc = migrate_page_move_mapping(mapping, newpage, page, NULL, mode);
+ 
+ 	if (rc)
+ 		return rc;
+@@ -501,17 +504,17 @@ EXPORT_SYMBOL(migrate_page);
+  * exist.
+  */
+ int buffer_migrate_page(struct address_space *mapping,
+-		struct page *newpage, struct page *page, bool sync)
++		struct page *newpage, struct page *page, enum migrate_mode mode)
+ {
+ 	struct buffer_head *bh, *head;
+ 	int rc;
+ 
+ 	if (!page_has_buffers(page))
+-		return migrate_page(mapping, newpage, page, sync);
++		return migrate_page(mapping, newpage, page, mode);
+ 
+ 	head = page_buffers(page);
+ 
+-	rc = migrate_page_move_mapping(mapping, newpage, page, head, sync);
++	rc = migrate_page_move_mapping(mapping, newpage, page, head, mode);
+ 
+ 	if (rc)
+ 		return rc;
+@@ -521,8 +524,8 @@ int buffer_migrate_page(struct address_space *mapping,
+ 	 * with an IRQ-safe spinlock held. In the sync case, the buffers
+ 	 * need to be locked now
+ 	 */
+-	if (sync)
+-		BUG_ON(!buffer_migrate_lock_buffers(head, sync));
++	if (mode != MIGRATE_ASYNC)
++		BUG_ON(!buffer_migrate_lock_buffers(head, mode));
+ 
+ 	ClearPagePrivate(page);
+ 	set_page_private(newpage, page_private(page));
+@@ -599,10 +602,11 @@ static int writeout(struct address_space *mapping, struct page *page)
+  * Default handling if a filesystem does not provide a migration function.
+  */
+ static int fallback_migrate_page(struct address_space *mapping,
+-	struct page *newpage, struct page *page, bool sync)
++	struct page *newpage, struct page *page, enum migrate_mode mode)
+ {
+ 	if (PageDirty(page)) {
+-		if (!sync)
++		/* Only writeback pages in full synchronous migration */
++		if (mode != MIGRATE_SYNC)
+ 			return -EBUSY;
+ 		return writeout(mapping, page);
+ 	}
+@@ -615,7 +619,7 @@ static int fallback_migrate_page(struct address_space *mapping,
+ 	    !try_to_release_page(page, GFP_KERNEL))
+ 		return -EAGAIN;
+ 
+-	return migrate_page(mapping, newpage, page, sync);
++	return migrate_page(mapping, newpage, page, mode);
+ }
+ 
+ /*
+@@ -630,7 +634,7 @@ static int fallback_migrate_page(struct address_space *mapping,
+  *  == 0 - success
+  */
+ static int move_to_new_page(struct page *newpage, struct page *page,
+-					int remap_swapcache, bool sync)
++				int remap_swapcache, enum migrate_mode mode)
+ {
+ 	struct address_space *mapping;
+ 	int rc;
+@@ -651,7 +655,7 @@ static int move_to_new_page(struct page *newpage, struct page *page,
+ 
+ 	mapping = page_mapping(page);
+ 	if (!mapping)
+-		rc = migrate_page(mapping, newpage, page, sync);
++		rc = migrate_page(mapping, newpage, page, mode);
+ 	else if (mapping->a_ops->migratepage)
+ 		/*
+ 		 * Most pages have a mapping and most filesystems provide a
+@@ -660,9 +664,9 @@ static int move_to_new_page(struct page *newpage, struct page *page,
+ 		 * is the most common path for page migration.
+ 		 */
+ 		rc = mapping->a_ops->migratepage(mapping,
+-						newpage, page, sync);
++						newpage, page, mode);
+ 	else
+-		rc = fallback_migrate_page(mapping, newpage, page, sync);
++		rc = fallback_migrate_page(mapping, newpage, page, mode);
+ 
+ 	if (rc) {
+ 		newpage->mapping = NULL;
+@@ -677,7 +681,7 @@ static int move_to_new_page(struct page *newpage, struct page *page,
+ }
+ 
+ static int __unmap_and_move(struct page *page, struct page *newpage,
+-				int force, bool offlining, bool sync)
++			int force, bool offlining, enum migrate_mode mode)
+ {
+ 	int rc = -EAGAIN;
+ 	int remap_swapcache = 1;
+@@ -686,7 +690,7 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
+ 	struct anon_vma *anon_vma = NULL;
+ 
+ 	if (!trylock_page(page)) {
+-		if (!force || !sync)
++		if (!force || mode == MIGRATE_ASYNC)
+ 			goto out;
+ 
+ 		/*
+@@ -732,10 +736,12 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
+ 
+ 	if (PageWriteback(page)) {
+ 		/*
+-		 * For !sync, there is no point retrying as the retry loop
+-		 * is expected to be too short for PageWriteback to be cleared
++		 * Only in the case of a full syncronous migration is it
++		 * necessary to wait for PageWriteback. In the async case,
++		 * the retry loop is too short and in the sync-light case,
++		 * the overhead of stalling is too much
+ 		 */
+-		if (!sync) {
++		if (mode != MIGRATE_SYNC) {
+ 			rc = -EBUSY;
+ 			goto uncharge;
+ 		}
+@@ -806,7 +812,7 @@ static int __unmap_and_move(struct page *page, struct page *newpage,
+ 
+ skip_unmap:
+ 	if (!page_mapped(page))
+-		rc = move_to_new_page(newpage, page, remap_swapcache, sync);
++		rc = move_to_new_page(newpage, page, remap_swapcache, mode);
+ 
+ 	if (rc && remap_swapcache)
+ 		remove_migration_ptes(page, page);
+@@ -829,7 +835,8 @@ out:
+  * to the newly allocated page in newpage.
+  */
+ static int unmap_and_move(new_page_t get_new_page, unsigned long private,
+-			struct page *page, int force, bool offlining, bool sync)
++			struct page *page, int force, bool offlining,
++			enum migrate_mode mode)
+ {
+ 	int rc = 0;
+ 	int *result = NULL;
+@@ -847,7 +854,7 @@ static int unmap_and_move(new_page_t get_new_page, unsigned long private,
+ 		if (unlikely(split_huge_page(page)))
+ 			goto out;
+ 
+-	rc = __unmap_and_move(page, newpage, force, offlining, sync);
++	rc = __unmap_and_move(page, newpage, force, offlining, mode);
+ out:
+ 	if (rc != -EAGAIN) {
+ 		/*
+@@ -895,7 +902,8 @@ out:
+  */
+ static int unmap_and_move_huge_page(new_page_t get_new_page,
+ 				unsigned long private, struct page *hpage,
+-				int force, bool offlining, bool sync)
++				int force, bool offlining,
++				enum migrate_mode mode)
+ {
+ 	int rc = 0;
+ 	int *result = NULL;
+@@ -908,7 +916,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
+ 	rc = -EAGAIN;
+ 
+ 	if (!trylock_page(hpage)) {
+-		if (!force || !sync)
++		if (!force || mode != MIGRATE_SYNC)
+ 			goto out;
+ 		lock_page(hpage);
+ 	}
+@@ -919,7 +927,7 @@ static int unmap_and_move_huge_page(new_page_t get_new_page,
+ 	try_to_unmap(hpage, TTU_MIGRATION|TTU_IGNORE_MLOCK|TTU_IGNORE_ACCESS);
+ 
+ 	if (!page_mapped(hpage))
+-		rc = move_to_new_page(new_hpage, hpage, 1, sync);
++		rc = move_to_new_page(new_hpage, hpage, 1, mode);
+ 
+ 	if (rc)
+ 		remove_migration_ptes(hpage, hpage);
+@@ -962,7 +970,7 @@ out:
+  */
+ int migrate_pages(struct list_head *from,
+ 		new_page_t get_new_page, unsigned long private, bool offlining,
+-		bool sync)
++		enum migrate_mode mode)
+ {
+ 	int retry = 1;
+ 	int nr_failed = 0;
+@@ -983,7 +991,7 @@ int migrate_pages(struct list_head *from,
+ 
+ 			rc = unmap_and_move(get_new_page, private,
+ 						page, pass > 2, offlining,
+-						sync);
++						mode);
+ 
+ 			switch(rc) {
+ 			case -ENOMEM:
+@@ -1013,7 +1021,7 @@ out:
+ 
+ int migrate_huge_pages(struct list_head *from,
+ 		new_page_t get_new_page, unsigned long private, bool offlining,
+-		bool sync)
++		enum migrate_mode mode)
+ {
+ 	int retry = 1;
+ 	int nr_failed = 0;
+@@ -1030,7 +1038,7 @@ int migrate_huge_pages(struct list_head *from,
+ 
+ 			rc = unmap_and_move_huge_page(get_new_page,
+ 					private, page, pass > 2, offlining,
+-					sync);
++					mode);
+ 
+ 			switch(rc) {
+ 			case -ENOMEM:
+@@ -1159,7 +1167,7 @@ set_status:
+ 	err = 0;
+ 	if (!list_empty(&pagelist)) {
+ 		err = migrate_pages(&pagelist, new_page_node,
+-				(unsigned long)pm, 0, true);
++				(unsigned long)pm, 0, MIGRATE_SYNC);
+ 		if (err)
+ 			putback_lru_pages(&pagelist);
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0007-mm-vmscan-when-reclaiming-for-compaction-ensure-ther.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0007-mm-vmscan-when-reclaiming-for-compaction-ensure-ther.patch
new file mode 100644
index 0000000..a3746f1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0007-mm-vmscan-when-reclaiming-for-compaction-ensure-ther.patch
@@ -0,0 +1,120 @@
+From 70bd5ad826ce15eedd0434f9926730716a1d5c53 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:45 -0800
+Subject: [PATCH 07/73] mm: vmscan: when reclaiming for compaction, ensure
+ there are sufficient free pages available
+
+commit fe4b1b244bdb96136855f2c694071cb09d140766 upstream.
+
+Stable note: Not tracked on Bugzilla. THP and compaction was found to
+	aggressively reclaim pages and stall systems under different
+	situations that was addressed piecemeal over time. This patch
+	addresses a problem where the fix regressed THP allocation
+	success rates.
+
+In commit e0887c19 ("vmscan: limit direct reclaim for higher order
+allocations"), Rik noted that reclaim was too aggressive when THP was
+enabled.  In his initial patch he used the number of free pages to decide
+if reclaim should abort for compaction.  My feedback was that reclaim and
+compaction should be using the same logic when deciding if reclaim should
+be aborted.
+
+Unfortunately, this had the effect of reducing THP success rates when the
+workload included something like streaming reads that continually
+allocated pages.  The window during which compaction could run and return
+a THP was too small.
+
+This patch combines Rik's two patches together.  compaction_suitable() is
+still used to decide if reclaim should be aborted to allow compaction is
+used.  However, it will also ensure that there is a reasonable buffer of
+free pages available.  This improves upon the THP allocation success rates
+but bounds the number of pages that are freed for compaction.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel<riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |   44 +++++++++++++++++++++++++++++++++++++++-----
+ 1 files changed, 39 insertions(+), 5 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index 1b95e4c..fd47744 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -2119,6 +2119,42 @@ restart:
+ 	throttle_vm_writeout(sc->gfp_mask);
+ }
+ 
++/* Returns true if compaction should go ahead for a high-order request */
++static inline bool compaction_ready(struct zone *zone, struct scan_control *sc)
++{
++	unsigned long balance_gap, watermark;
++	bool watermark_ok;
++
++	/* Do not consider compaction for orders reclaim is meant to satisfy */
++	if (sc->order <= PAGE_ALLOC_COSTLY_ORDER)
++		return false;
++
++	/*
++	 * Compaction takes time to run and there are potentially other
++	 * callers using the pages just freed. Continue reclaiming until
++	 * there is a buffer of free pages available to give compaction
++	 * a reasonable chance of completing and allocating the page
++	 */
++	balance_gap = min(low_wmark_pages(zone),
++		(zone->present_pages + KSWAPD_ZONE_BALANCE_GAP_RATIO-1) /
++			KSWAPD_ZONE_BALANCE_GAP_RATIO);
++	watermark = high_wmark_pages(zone) + balance_gap + (2UL << sc->order);
++	watermark_ok = zone_watermark_ok_safe(zone, 0, watermark, 0, 0);
++
++	/*
++	 * If compaction is deferred, reclaim up to a point where
++	 * compaction will have a chance of success when re-enabled
++	 */
++	if (compaction_deferred(zone))
++		return watermark_ok;
++
++	/* If compaction is not ready to start, keep reclaiming */
++	if (!compaction_suitable(zone, sc->order))
++		return false;
++
++	return watermark_ok;
++}
++
+ /*
+  * This is the direct reclaim path, for page-allocating processes.  We only
+  * try to reclaim pages from zones which will satisfy the caller's allocation
+@@ -2136,8 +2172,8 @@ restart:
+  * scan then give up on it.
+  *
+  * This function returns true if a zone is being reclaimed for a costly
+- * high-order allocation and compaction is either ready to begin or deferred.
+- * This indicates to the caller that it should retry the allocation or fail.
++ * high-order allocation and compaction is ready to begin. This indicates to
++ * the caller that it should retry the allocation or fail.
+  */
+ static bool shrink_zones(int priority, struct zonelist *zonelist,
+ 					struct scan_control *sc)
+@@ -2171,9 +2207,7 @@ static bool shrink_zones(int priority, struct zonelist *zonelist,
+ 				 * noticable problem, like transparent huge page
+ 				 * allocations.
+ 				 */
+-				if (sc->order > PAGE_ALLOC_COSTLY_ORDER &&
+-					(compaction_suitable(zone, sc->order) ||
+-					 compaction_deferred(zone))) {
++				if (compaction_ready(zone, sc)) {
+ 					should_abort_reclaim = true;
+ 					continue;
+ 				}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0008-mm-vmscan-do-not-OOM-if-aborting-reclaim-to-start-co.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0008-mm-vmscan-do-not-OOM-if-aborting-reclaim-to-start-co.patch
new file mode 100644
index 0000000..3531d78
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0008-mm-vmscan-do-not-OOM-if-aborting-reclaim-to-start-co.patch
@@ -0,0 +1,71 @@
+From c60330596c8497a94d53b80c5b96799b01846248 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:33 -0800
+Subject: [PATCH 08/73] mm: vmscan: do not OOM if aborting reclaim to start
+ compaction
+
+commit 7335084d446b83cbcb15da80497d03f0c1dc9e21 upstream.
+
+Stable note: Not tracked in Bugzilla. This patch makes later patches
+	easier to apply but otherwise has little to justify it. The
+	problem it fixes was never observed but the source of the
+	theoretical problem did not exist for very long.
+
+During direct reclaim it is possible that reclaim will be aborted so that
+compaction can be attempted to satisfy a high-order allocation.  If this
+decision is made before any pages are reclaimed, it is possible that 0 is
+returned to the page allocator potentially triggering an OOM.  This has
+not been observed but it is a possibility so this patch addresses it.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel <riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index fd47744..662a5ea 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -2284,6 +2284,7 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
+ 	struct zoneref *z;
+ 	struct zone *zone;
+ 	unsigned long writeback_threshold;
++	bool should_abort_reclaim;
+ 
+ 	get_mems_allowed();
+ 	delayacct_freepages_start();
+@@ -2295,7 +2296,8 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
+ 		sc->nr_scanned = 0;
+ 		if (!priority)
+ 			disable_swap_token(sc->mem_cgroup);
+-		if (shrink_zones(priority, zonelist, sc))
++		should_abort_reclaim = shrink_zones(priority, zonelist, sc);
++		if (should_abort_reclaim)
+ 			break;
+ 
+ 		/*
+@@ -2363,6 +2365,10 @@ out:
+ 	if (oom_killer_disabled)
+ 		return 0;
+ 
++	/* Aborting reclaim to try compaction? don't OOM, then */
++	if (should_abort_reclaim)
++		return 1;
++
+ 	/* top priority shrink_zones still had more to do? don't OOM, then */
+ 	if (scanning_global_lru(sc) && !all_unreclaimable(zonelist, sc))
+ 		return 1;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0009-mm-vmscan-check-if-reclaim-should-really-abort-even-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0009-mm-vmscan-check-if-reclaim-should-really-abort-even-.patch
new file mode 100644
index 0000000..76a434d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0009-mm-vmscan-check-if-reclaim-should-really-abort-even-.patch
@@ -0,0 +1,119 @@
+From 0f7e2171b241704ee17ab27e4b8a7ef8c7f1dc32 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Thu, 12 Jan 2012 17:19:49 -0800
+Subject: [PATCH 09/73] mm: vmscan: check if reclaim should really abort even
+ if compaction_ready() is true for one zone
+
+commit 0cee34fd72c582b4f8ad8ce00645b75fb4168199 upstream.
+
+Stable note: Not tracked on Bugzilla. THP and compaction was found to
+	aggressively reclaim pages and stall systems under different
+	situations that was addressed piecemeal over time.
+
+If compaction can proceed for a given zone, shrink_zones() does not
+reclaim any more pages from it.  After commit [e0c2327: vmscan: abort
+reclaim/compaction if compaction can proceed], do_try_to_free_pages()
+tries to finish as soon as possible once one zone can compact.
+
+This was intended to prevent slabs being shrunk unnecessarily but there
+are side-effects.  One is that a small zone that is ready for compaction
+will abort reclaim even if the chances of successfully allocating a THP
+from that zone is small.  It also means that reclaim can return too early
+even though sc->nr_to_reclaim pages were not reclaimed.
+
+This partially reverts the commit until it is proven that slabs are really
+being shrunk unnecessarily but preserves the check to return 1 to avoid
+OOM if reclaim was aborted prematurely.
+
+[aarcange@redhat.com: This patch replaces a revert from Andrea]
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel <riel@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Jan Kara <jack@suse.cz>
+Cc: Andy Isaacson <adi@hexapodia.org>
+Cc: Nai Xia <nai.xia@gmail.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |   19 +++++++++----------
+ 1 files changed, 9 insertions(+), 10 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index 662a5ea..9e89de6 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -2173,7 +2173,8 @@ static inline bool compaction_ready(struct zone *zone, struct scan_control *sc)
+  *
+  * This function returns true if a zone is being reclaimed for a costly
+  * high-order allocation and compaction is ready to begin. This indicates to
+- * the caller that it should retry the allocation or fail.
++ * the caller that it should consider retrying the allocation instead of
++ * further reclaim.
+  */
+ static bool shrink_zones(int priority, struct zonelist *zonelist,
+ 					struct scan_control *sc)
+@@ -2182,7 +2183,7 @@ static bool shrink_zones(int priority, struct zonelist *zonelist,
+ 	struct zone *zone;
+ 	unsigned long nr_soft_reclaimed;
+ 	unsigned long nr_soft_scanned;
+-	bool should_abort_reclaim = false;
++	bool aborted_reclaim = false;
+ 
+ 	for_each_zone_zonelist_nodemask(zone, z, zonelist,
+ 					gfp_zone(sc->gfp_mask), sc->nodemask) {
+@@ -2208,7 +2209,7 @@ static bool shrink_zones(int priority, struct zonelist *zonelist,
+ 				 * allocations.
+ 				 */
+ 				if (compaction_ready(zone, sc)) {
+-					should_abort_reclaim = true;
++					aborted_reclaim = true;
+ 					continue;
+ 				}
+ 			}
+@@ -2230,7 +2231,7 @@ static bool shrink_zones(int priority, struct zonelist *zonelist,
+ 		shrink_zone(priority, zone, sc);
+ 	}
+ 
+-	return should_abort_reclaim;
++	return aborted_reclaim;
+ }
+ 
+ static bool zone_reclaimable(struct zone *zone)
+@@ -2284,7 +2285,7 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
+ 	struct zoneref *z;
+ 	struct zone *zone;
+ 	unsigned long writeback_threshold;
+-	bool should_abort_reclaim;
++	bool aborted_reclaim;
+ 
+ 	get_mems_allowed();
+ 	delayacct_freepages_start();
+@@ -2296,9 +2297,7 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
+ 		sc->nr_scanned = 0;
+ 		if (!priority)
+ 			disable_swap_token(sc->mem_cgroup);
+-		should_abort_reclaim = shrink_zones(priority, zonelist, sc);
+-		if (should_abort_reclaim)
+-			break;
++		aborted_reclaim = shrink_zones(priority, zonelist, sc);
+ 
+ 		/*
+ 		 * Don't shrink slabs when reclaiming memory from
+@@ -2365,8 +2364,8 @@ out:
+ 	if (oom_killer_disabled)
+ 		return 0;
+ 
+-	/* Aborting reclaim to try compaction? don't OOM, then */
+-	if (should_abort_reclaim)
++	/* Aborted reclaim to try compaction? don't OOM, then */
++	if (aborted_reclaim)
+ 		return 1;
+ 
+ 	/* top priority shrink_zones still had more to do? don't OOM, then */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0010-vmscan-promote-shared-file-mapped-pages.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0010-vmscan-promote-shared-file-mapped-pages.patch
new file mode 100644
index 0000000..e1037d4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0010-vmscan-promote-shared-file-mapped-pages.patch
@@ -0,0 +1,82 @@
+From 2a487f6e48c8ee80432e512e3618a6837f6ff448 Mon Sep 17 00:00:00 2001
+From: Konstantin Khlebnikov <khlebnikov@openvz.org>
+Date: Tue, 10 Jan 2012 15:06:59 -0800
+Subject: [PATCH 10/73] vmscan: promote shared file mapped pages
+
+commit 34dbc67a644f11ab3475d822d72e25409911e760 upstream.
+
+Stable note: Not tracked in Bugzilla. There were reports of shared
+	mapped pages being unfairly reclaimed in comparison to older kernels.
+	This is being addressed over time. The specific workload being
+	addressed here in described in paragraph four and while paragraph
+	five says it did not help performance as such, it made a difference
+	to major page faults. I'm aware of at least one bug for a large
+	vendor that was due to increased major faults.
+
+Commit 645747462435 ("vmscan: detect mapped file pages used only once")
+greatly decreases lifetime of single-used mapped file pages.
+Unfortunately it also decreases life time of all shared mapped file
+pages.  Because after commit bf3f3bc5e7347 ("mm: don't mark_page_accessed
+in fault path") page-fault handler does not mark page active or even
+referenced.
+
+Thus page_check_references() activates file page only if it was used twice
+while it stays in inactive list, meanwhile it activates anon pages after
+first access.  Inactive list can be small enough, this way reclaimer can
+accidentally throw away any widely used page if it wasn't used twice in
+short period.
+
+After this patch page_check_references() also activate file mapped page at
+first inactive list scan if this page is already used multiple times via
+several ptes.
+
+I found this while trying to fix degragation in rhel6 (~2.6.32) from rhel5
+(~2.6.18).  There a complete mess with >100 web/mail/spam/ftp containers,
+they share all their files but there a lot of anonymous pages: ~500mb
+shared file mapped memory and 15-20Gb non-shared anonymous memory.  In
+this situation major-pagefaults are very costly, because all containers
+share the same page.  In my load kernel created a disproportionate
+pressure on the file memory, compared with the anonymous, they equaled
+only if I raise swappiness up to 150 =)
+
+These patches actually wasn't helped a lot in my problem, but I saw
+noticable (10-20 times) reduce in count and average time of
+major-pagefault in file-mapped areas.
+
+Actually both patches are fixes for commit v2.6.33-5448-g6457474, because
+it was aimed at one scenario (singly used pages), but it breaks the logic
+in other scenarios (shared and/or executable pages)
+
+Signed-off-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
+Acked-by: Pekka Enberg <penberg@kernel.org>
+Acked-by: Minchan Kim <minchan.kim@gmail.com>
+Reviewed-by: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Wu Fengguang <fengguang.wu@intel.com>
+Cc: Johannes Weiner <hannes@cmpxchg.org>
+Cc: Nick Piggin <npiggin@kernel.dk>
+Cc: Mel Gorman <mel@csn.ul.ie>
+Cc: Shaohua Li <shaohua.li@intel.com>
+Cc: Rik van Riel <riel@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index 9e89de6..cd27455 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -715,7 +715,7 @@ static enum page_references page_check_references(struct page *page,
+ 		 */
+ 		SetPageReferenced(page);
+ 
+-		if (referenced_page)
++		if (referenced_page || referenced_ptes > 1)
+ 			return PAGEREF_ACTIVATE;
+ 
+ 		return PAGEREF_KEEP;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0011-vmscan-activate-executable-pages-after-first-usage.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0011-vmscan-activate-executable-pages-after-first-usage.patch
new file mode 100644
index 0000000..0f24208
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0011-vmscan-activate-executable-pages-after-first-usage.patch
@@ -0,0 +1,56 @@
+From 7560f662e5e895619c356365f675715d7f4ea577 Mon Sep 17 00:00:00 2001
+From: Konstantin Khlebnikov <khlebnikov@openvz.org>
+Date: Tue, 10 Jan 2012 15:07:03 -0800
+Subject: [PATCH 11/73] vmscan: activate executable pages after first usage
+
+commit c909e99364c8b6ca07864d752950b6b4ecf6bef4 upstream.
+
+Stable note: Not tracked in Bugzilla. There were reports of shared
+	mapped pages being unfairly reclaimed in comparison to older kernels.
+	This is being addressed over time.
+
+Logic added in commit 8cab4754d24a0 ("vmscan: make mapped executable pages
+the first class citizen") was noticeably weakened in commit
+645747462435d84 ("vmscan: detect mapped file pages used only once").
+
+Currently these pages can become "first class citizens" only after second
+usage.  After this patch page_check_references() will activate they after
+first usage, and executable code gets yet better chance to stay in memory.
+
+Signed-off-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
+Cc: Pekka Enberg <penberg@kernel.org>
+Cc: Minchan Kim <minchan.kim@gmail.com>
+Cc: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
+Cc: Wu Fengguang <fengguang.wu@intel.com>
+Cc: Johannes Weiner <hannes@cmpxchg.org>
+Cc: Nick Piggin <npiggin@kernel.dk>
+Cc: Mel Gorman <mel@csn.ul.ie>
+Cc: Shaohua Li <shaohua.li@intel.com>
+Cc: Rik van Riel <riel@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index cd27455..87de9c6 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -718,6 +718,12 @@ static enum page_references page_check_references(struct page *page,
+ 		if (referenced_page || referenced_ptes > 1)
+ 			return PAGEREF_ACTIVATE;
+ 
++		/*
++		 * Activate file-backed executable pages after first usage.
++		 */
++		if (vm_flags & VM_EXEC)
++			return PAGEREF_ACTIVATE;
++
+ 		return PAGEREF_KEEP;
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0012-mm-vmscan.c-consider-swap-space-when-deciding-whethe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0012-mm-vmscan.c-consider-swap-space-when-deciding-whethe.patch
new file mode 100644
index 0000000..63186e3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0012-mm-vmscan.c-consider-swap-space-when-deciding-whethe.patch
@@ -0,0 +1,50 @@
+From 2f1cec6b7649ab76eb3b0f736028388e4a7e9047 Mon Sep 17 00:00:00 2001
+From: Minchan Kim <minchan@kernel.org>
+Date: Tue, 10 Jan 2012 15:08:18 -0800
+Subject: [PATCH 12/73] mm/vmscan.c: consider swap space when deciding whether
+ to continue reclaim
+
+commit 86cfd3a45042ab242d47f3935a02811a402beab6 upstream.
+
+Stable note: Not tracked in Bugzilla. This patch reduces kswapd CPU
+	usage on swapless systems with high anonymous memory usage.
+
+It's pointless to continue reclaiming when we have no swap space and lots
+of anon pages in the inactive list.
+
+Without this patch, it is possible when swap is disabled to continue
+trying to reclaim when there are only anonymous pages in the system even
+though that will not make any progress.
+
+Signed-off-by: Minchan Kim <minchan@kernel.org>
+Cc: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
+Acked-by: Mel Gorman <mgorman@suse.de>
+Reviewed-by: Rik van Riel <riel@redhat.com>
+Cc: Johannes Weiner <jweiner@redhat.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index 87de9c6..ba763be 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -2049,8 +2049,9 @@ static inline bool should_continue_reclaim(struct zone *zone,
+ 	 * inactive lists are large enough, continue reclaiming
+ 	 */
+ 	pages_for_compaction = (2UL << sc->order);
+-	inactive_lru_pages = zone_nr_lru_pages(zone, sc, LRU_INACTIVE_ANON) +
+-				zone_nr_lru_pages(zone, sc, LRU_INACTIVE_FILE);
++	inactive_lru_pages = zone_nr_lru_pages(zone, sc, LRU_INACTIVE_FILE);
++	if (nr_swap_pages > 0)
++		inactive_lru_pages += zone_nr_lru_pages(zone, sc, LRU_INACTIVE_ANON);
+ 	if (sc->nr_reclaimed < pages_for_compaction &&
+ 			inactive_lru_pages > pages_for_compaction)
+ 		return true;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0013-mm-test-PageSwapBacked-in-lumpy-reclaim.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0013-mm-test-PageSwapBacked-in-lumpy-reclaim.patch
new file mode 100644
index 0000000..fe39de9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0013-mm-test-PageSwapBacked-in-lumpy-reclaim.patch
@@ -0,0 +1,42 @@
+From 0b642dde6e6cd5dc940498c7cdb676fc56e4cdf4 Mon Sep 17 00:00:00 2001
+From: Hugh Dickins <hughd@google.com>
+Date: Tue, 10 Jan 2012 15:08:33 -0800
+Subject: [PATCH 13/73] mm: test PageSwapBacked in lumpy reclaim
+
+commit 043bcbe5ec51e0478ef2b44acef17193e01d7f70 upstream.
+
+Stable note: Not tracked in Bugzilla. There were reports of shared
+	mapped pages being unfairly reclaimed in comparison to older kernels.
+	This is being addressed over time. Even though the subject
+	refers to lumpy reclaim, it impacts compaction as well.
+
+Lumpy reclaim does well to stop at a PageAnon when there's no swap, but
+better is to stop at any PageSwapBacked, which includes shmem/tmpfs too.
+
+Signed-off-by: Hugh Dickins <hughd@google.com>
+Reviewed-by: KOSAKI Motohiro <kosaki.motohiro@jp.fujitsu.com>
+Reviewed-by: Minchan Kim <minchan@kernel.org>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index ba763be..b9eaa06 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -1215,7 +1215,7 @@ static unsigned long isolate_lru_pages(unsigned long nr_to_scan,
+ 			 * anon page which don't already have a swap slot is
+ 			 * pointless.
+ 			 */
+-			if (nr_swap_pages <= 0 && PageAnon(cursor_page) &&
++			if (nr_swap_pages <= 0 && PageSwapBacked(cursor_page) &&
+ 			    !PageSwapCache(cursor_page))
+ 				break;
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0014-mm-vmscan-convert-global-reclaim-to-per-memcg-LRU-li.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0014-mm-vmscan-convert-global-reclaim-to-per-memcg-LRU-li.patch
new file mode 100644
index 0000000..0be1dd4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0014-mm-vmscan-convert-global-reclaim-to-per-memcg-LRU-li.patch
@@ -0,0 +1,58 @@
+From 2c44243518b5d2a8bb5cd67691efe747e4424cc1 Mon Sep 17 00:00:00 2001
+From: Johannes Weiner <jweiner@redhat.com>
+Date: Thu, 12 Jan 2012 17:18:06 -0800
+Subject: [PATCH 14/73] mm: vmscan: convert global reclaim to per-memcg LRU
+ lists
+
+commit b95a2f2d486d0d768a92879c023a03757b9c7e58 upstream - WARNING: this is a substitute patch.
+
+Stable note: Not tracked in Bugzilla. This is a partial backport of an
+	upstream commit addressing a completely different issue
+	that accidentally contained an important fix. The workload
+	this patch helps was memcached when IO is started in the
+	background. memcached should stay resident but without this patch
+	it gets swapped. Sometimes this manifests as a drop in throughput
+	but mostly it was observed through /proc/vmstat.
+
+Commit [246e87a9: memcg: fix get_scan_count() for small targets] was meant
+to fix a problem whereby small scan targets on memcg were ignored causing
+priority to raise too sharply. It forced scanning to take place if the
+target was small, memcg or kswapd.
+
+From the time it was introduced it caused excessive reclaim by kswapd
+with workloads being pushed to swap that previously would have stayed
+resident. This was accidentally fixed in commit [b95a2f2d: mm: vmscan:
+convert global reclaim to per-memcg LRU lists] by making it harder for
+kswapd to force scan small targets but that patchset is not suitable for
+backporting. This was later changed again by commit [90126375: mm/vmscan:
+push lruvec pointer into get_scan_count()] into a format that looks
+like it would be a straight-forward backport but there is a subtle
+difference due to the use of lruvecs.
+
+The impact of the accidental fix is to make it harder for kswapd to force
+scan small targets by taking zone->all_unreclaimable into account. This
+patch is the closest equivalent available based on what is backported.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/vmscan.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index b9eaa06..ded1857 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -1911,7 +1911,8 @@ static void get_scan_count(struct zone *zone, struct scan_control *sc,
+ 	 * latencies, so it's better to scan a minimum amount there as
+ 	 * well.
+ 	 */
+-	if (scanning_global_lru(sc) && current_is_kswapd())
++	if (scanning_global_lru(sc) && current_is_kswapd() &&
++	    zone->all_unreclaimable)
+ 		force_scan = true;
+ 	if (!scanning_global_lru(sc))
+ 		force_scan = true;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0015-cpuset-mm-reduce-large-amounts-of-memory-barrier-rel.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0015-cpuset-mm-reduce-large-amounts-of-memory-barrier-rel.patch
new file mode 100644
index 0000000..d834bc2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0015-cpuset-mm-reduce-large-amounts-of-memory-barrier-rel.patch
@@ -0,0 +1,655 @@
+From 8d847c6e95dab1977636cd9d3d5da5851f5c95aa Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Wed, 21 Mar 2012 16:34:11 -0700
+Subject: [PATCH 15/73] cpuset: mm: reduce large amounts of memory barrier
+ related damage v3
+
+commit cc9a6c8776615f9c194ccf0b63a0aa5628235545 upstream.
+
+Stable note:  Not tracked in Bugzilla. [get|put]_mems_allowed() is extremely
+	expensive and severely impacted page allocator performance. This
+	is part of a series of patches that reduce page allocator overhead.
+
+Commit c0ff7453bb5c ("cpuset,mm: fix no node to alloc memory when
+changing cpuset's mems") wins a super prize for the largest number of
+memory barriers entered into fast paths for one commit.
+
+[get|put]_mems_allowed is incredibly heavy with pairs of full memory
+barriers inserted into a number of hot paths.  This was detected while
+investigating at large page allocator slowdown introduced some time
+after 2.6.32.  The largest portion of this overhead was shown by
+oprofile to be at an mfence introduced by this commit into the page
+allocator hot path.
+
+For extra style points, the commit introduced the use of yield() in an
+implementation of what looks like a spinning mutex.
+
+This patch replaces the full memory barriers on both read and write
+sides with a sequence counter with just read barriers on the fast path
+side.  This is much cheaper on some architectures, including x86.  The
+main bulk of the patch is the retry logic if the nodemask changes in a
+manner that can cause a false failure.
+
+While updating the nodemask, a check is made to see if a false failure
+is a risk.  If it is, the sequence number gets bumped and parallel
+allocators will briefly stall while the nodemask update takes place.
+
+In a page fault test microbenchmark, oprofile samples from
+__alloc_pages_nodemask went from 4.53% of all samples to 1.15%.  The
+actual results were
+
+                             3.3.0-rc3          3.3.0-rc3
+                             rc3-vanilla        nobarrier-v2r1
+    Clients   1 UserTime       0.07 (  0.00%)   0.08 (-14.19%)
+    Clients   2 UserTime       0.07 (  0.00%)   0.07 (  2.72%)
+    Clients   4 UserTime       0.08 (  0.00%)   0.07 (  3.29%)
+    Clients   1 SysTime        0.70 (  0.00%)   0.65 (  6.65%)
+    Clients   2 SysTime        0.85 (  0.00%)   0.82 (  3.65%)
+    Clients   4 SysTime        1.41 (  0.00%)   1.41 (  0.32%)
+    Clients   1 WallTime       0.77 (  0.00%)   0.74 (  4.19%)
+    Clients   2 WallTime       0.47 (  0.00%)   0.45 (  3.73%)
+    Clients   4 WallTime       0.38 (  0.00%)   0.37 (  1.58%)
+    Clients   1 Flt/sec/cpu  497620.28 (  0.00%) 520294.53 (  4.56%)
+    Clients   2 Flt/sec/cpu  414639.05 (  0.00%) 429882.01 (  3.68%)
+    Clients   4 Flt/sec/cpu  257959.16 (  0.00%) 258761.48 (  0.31%)
+    Clients   1 Flt/sec      495161.39 (  0.00%) 517292.87 (  4.47%)
+    Clients   2 Flt/sec      820325.95 (  0.00%) 850289.77 (  3.65%)
+    Clients   4 Flt/sec      1020068.93 (  0.00%) 1022674.06 (  0.26%)
+    MMTests Statistics: duration
+    Sys Time Running Test (seconds)             135.68    132.17
+    User+Sys Time Running Test (seconds)         164.2    160.13
+    Total Elapsed Time (seconds)                123.46    120.87
+
+The overall improvement is small but the System CPU time is much
+improved and roughly in correlation to what oprofile reported (these
+performance figures are without profiling so skew is expected).  The
+actual number of page faults is noticeably improved.
+
+For benchmarks like kernel builds, the overall benefit is marginal but
+the system CPU time is slightly reduced.
+
+To test the actual bug the commit fixed I opened two terminals.  The
+first ran within a cpuset and continually ran a small program that
+faulted 100M of anonymous data.  In a second window, the nodemask of the
+cpuset was continually randomised in a loop.
+
+Without the commit, the program would fail every so often (usually
+within 10 seconds) and obviously with the commit everything worked fine.
+With this patch applied, it also worked fine so the fix should be
+functionally equivalent.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Cc: Miao Xie <miaox@cn.fujitsu.com>
+Cc: David Rientjes <rientjes@google.com>
+Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: Christoph Lameter <cl@linux.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+[bwh: Forward-ported from 3.0 to 3.2: apply the upstream changes
+ to get_any_partial()]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/cpuset.h    |   47 +++++++++++++++++++-------------------------
+ include/linux/init_task.h |    8 +++++++
+ include/linux/sched.h     |    2 +-
+ kernel/cpuset.c           |   43 +++++++---------------------------------
+ kernel/fork.c             |    3 ++
+ mm/filemap.c              |   11 ++++++---
+ mm/hugetlb.c              |   15 ++++++++++---
+ mm/mempolicy.c            |   28 ++++++++++++++++++++------
+ mm/page_alloc.c           |   33 ++++++++++++++++++++++---------
+ mm/slab.c                 |   13 +++++++----
+ mm/slub.c                 |   40 +++++++++++++++++++++++--------------
+ mm/vmscan.c               |    2 -
+ 12 files changed, 135 insertions(+), 110 deletions(-)
+
+diff --git a/include/linux/cpuset.h b/include/linux/cpuset.h
+index e9eaec5..7a7e5fd 100644
+--- a/include/linux/cpuset.h
++++ b/include/linux/cpuset.h
+@@ -89,42 +89,33 @@ extern void rebuild_sched_domains(void);
+ extern void cpuset_print_task_mems_allowed(struct task_struct *p);
+ 
+ /*
+- * reading current mems_allowed and mempolicy in the fastpath must protected
+- * by get_mems_allowed()
++ * get_mems_allowed is required when making decisions involving mems_allowed
++ * such as during page allocation. mems_allowed can be updated in parallel
++ * and depending on the new value an operation can fail potentially causing
++ * process failure. A retry loop with get_mems_allowed and put_mems_allowed
++ * prevents these artificial failures.
+  */
+-static inline void get_mems_allowed(void)
++static inline unsigned int get_mems_allowed(void)
+ {
+-	current->mems_allowed_change_disable++;
+-
+-	/*
+-	 * ensure that reading mems_allowed and mempolicy happens after the
+-	 * update of ->mems_allowed_change_disable.
+-	 *
+-	 * the write-side task finds ->mems_allowed_change_disable is not 0,
+-	 * and knows the read-side task is reading mems_allowed or mempolicy,
+-	 * so it will clear old bits lazily.
+-	 */
+-	smp_mb();
++	return read_seqcount_begin(&current->mems_allowed_seq);
+ }
+ 
+-static inline void put_mems_allowed(void)
++/*
++ * If this returns false, the operation that took place after get_mems_allowed
++ * may have failed. It is up to the caller to retry the operation if
++ * appropriate.
++ */
++static inline bool put_mems_allowed(unsigned int seq)
+ {
+-	/*
+-	 * ensure that reading mems_allowed and mempolicy before reducing
+-	 * mems_allowed_change_disable.
+-	 *
+-	 * the write-side task will know that the read-side task is still
+-	 * reading mems_allowed or mempolicy, don't clears old bits in the
+-	 * nodemask.
+-	 */
+-	smp_mb();
+-	--ACCESS_ONCE(current->mems_allowed_change_disable);
++	return !read_seqcount_retry(&current->mems_allowed_seq, seq);
+ }
+ 
+ static inline void set_mems_allowed(nodemask_t nodemask)
+ {
+ 	task_lock(current);
++	write_seqcount_begin(&current->mems_allowed_seq);
+ 	current->mems_allowed = nodemask;
++	write_seqcount_end(&current->mems_allowed_seq);
+ 	task_unlock(current);
+ }
+ 
+@@ -234,12 +225,14 @@ static inline void set_mems_allowed(nodemask_t nodemask)
+ {
+ }
+ 
+-static inline void get_mems_allowed(void)
++static inline unsigned int get_mems_allowed(void)
+ {
++	return 0;
+ }
+ 
+-static inline void put_mems_allowed(void)
++static inline bool put_mems_allowed(unsigned int seq)
+ {
++	return true;
+ }
+ 
+ #endif /* !CONFIG_CPUSETS */
+diff --git a/include/linux/init_task.h b/include/linux/init_task.h
+index 32574ee..df53fdf 100644
+--- a/include/linux/init_task.h
++++ b/include/linux/init_task.h
+@@ -30,6 +30,13 @@ extern struct fs_struct init_fs;
+ #define INIT_THREADGROUP_FORK_LOCK(sig)
+ #endif
+ 
++#ifdef CONFIG_CPUSETS
++#define INIT_CPUSET_SEQ							\
++	.mems_allowed_seq = SEQCNT_ZERO,
++#else
++#define INIT_CPUSET_SEQ
++#endif
++
+ #define INIT_SIGNALS(sig) {						\
+ 	.nr_threads	= 1,						\
+ 	.wait_chldexit	= __WAIT_QUEUE_HEAD_INITIALIZER(sig.wait_chldexit),\
+@@ -193,6 +200,7 @@ extern struct cred init_cred;
+ 	INIT_FTRACE_GRAPH						\
+ 	INIT_TRACE_RECURSION						\
+ 	INIT_TASK_RCU_PREEMPT(tsk)					\
++	INIT_CPUSET_SEQ							\
+ }
+ 
+ 
+diff --git a/include/linux/sched.h b/include/linux/sched.h
+index 5afa2a3..a96cb8c 100644
+--- a/include/linux/sched.h
++++ b/include/linux/sched.h
+@@ -1481,7 +1481,7 @@ struct task_struct {
+ #endif
+ #ifdef CONFIG_CPUSETS
+ 	nodemask_t mems_allowed;	/* Protected by alloc_lock */
+-	int mems_allowed_change_disable;
++	seqcount_t mems_allowed_seq;	/* Seqence no to catch updates */
+ 	int cpuset_mem_spread_rotor;
+ 	int cpuset_slab_spread_rotor;
+ #endif
+diff --git a/kernel/cpuset.c b/kernel/cpuset.c
+index 0b1712d..46a1d3c 100644
+--- a/kernel/cpuset.c
++++ b/kernel/cpuset.c
+@@ -964,7 +964,6 @@ static void cpuset_change_task_nodemask(struct task_struct *tsk,
+ {
+ 	bool need_loop;
+ 
+-repeat:
+ 	/*
+ 	 * Allow tasks that have access to memory reserves because they have
+ 	 * been OOM killed to get memory anywhere.
+@@ -983,45 +982,19 @@ repeat:
+ 	 */
+ 	need_loop = task_has_mempolicy(tsk) ||
+ 			!nodes_intersects(*newmems, tsk->mems_allowed);
+-	nodes_or(tsk->mems_allowed, tsk->mems_allowed, *newmems);
+-	mpol_rebind_task(tsk, newmems, MPOL_REBIND_STEP1);
+ 
+-	/*
+-	 * ensure checking ->mems_allowed_change_disable after setting all new
+-	 * allowed nodes.
+-	 *
+-	 * the read-side task can see an nodemask with new allowed nodes and
+-	 * old allowed nodes. and if it allocates page when cpuset clears newly
+-	 * disallowed ones continuous, it can see the new allowed bits.
+-	 *
+-	 * And if setting all new allowed nodes is after the checking, setting
+-	 * all new allowed nodes and clearing newly disallowed ones will be done
+-	 * continuous, and the read-side task may find no node to alloc page.
+-	 */
+-	smp_mb();
++	if (need_loop)
++		write_seqcount_begin(&tsk->mems_allowed_seq);
+ 
+-	/*
+-	 * Allocation of memory is very fast, we needn't sleep when waiting
+-	 * for the read-side.
+-	 */
+-	while (need_loop && ACCESS_ONCE(tsk->mems_allowed_change_disable)) {
+-		task_unlock(tsk);
+-		if (!task_curr(tsk))
+-			yield();
+-		goto repeat;
+-	}
+-
+-	/*
+-	 * ensure checking ->mems_allowed_change_disable before clearing all new
+-	 * disallowed nodes.
+-	 *
+-	 * if clearing newly disallowed bits before the checking, the read-side
+-	 * task may find no node to alloc page.
+-	 */
+-	smp_mb();
++	nodes_or(tsk->mems_allowed, tsk->mems_allowed, *newmems);
++	mpol_rebind_task(tsk, newmems, MPOL_REBIND_STEP1);
+ 
+ 	mpol_rebind_task(tsk, newmems, MPOL_REBIND_STEP2);
+ 	tsk->mems_allowed = *newmems;
++
++	if (need_loop)
++		write_seqcount_end(&tsk->mems_allowed_seq);
++
+ 	task_unlock(tsk);
+ }
+ 
+diff --git a/kernel/fork.c b/kernel/fork.c
+index 79ee71f..222457a 100644
+--- a/kernel/fork.c
++++ b/kernel/fork.c
+@@ -979,6 +979,9 @@ static int copy_signal(unsigned long clone_flags, struct task_struct *tsk)
+ #ifdef CONFIG_CGROUPS
+ 	init_rwsem(&sig->threadgroup_fork_lock);
+ #endif
++#ifdef CONFIG_CPUSETS
++	seqcount_init(&tsk->mems_allowed_seq);
++#endif
+ 
+ 	sig->oom_adj = current->signal->oom_adj;
+ 	sig->oom_score_adj = current->signal->oom_score_adj;
+diff --git a/mm/filemap.c b/mm/filemap.c
+index 03c5b0e..556858c 100644
+--- a/mm/filemap.c
++++ b/mm/filemap.c
+@@ -500,10 +500,13 @@ struct page *__page_cache_alloc(gfp_t gfp)
+ 	struct page *page;
+ 
+ 	if (cpuset_do_page_mem_spread()) {
+-		get_mems_allowed();
+-		n = cpuset_mem_spread_node();
+-		page = alloc_pages_exact_node(n, gfp, 0);
+-		put_mems_allowed();
++		unsigned int cpuset_mems_cookie;
++		do {
++			cpuset_mems_cookie = get_mems_allowed();
++			n = cpuset_mem_spread_node();
++			page = alloc_pages_exact_node(n, gfp, 0);
++		} while (!put_mems_allowed(cpuset_mems_cookie) && !page);
++
+ 		return page;
+ 	}
+ 	return alloc_pages(gfp, 0);
+diff --git a/mm/hugetlb.c b/mm/hugetlb.c
+index 7c535b0..1e747e4 100644
+--- a/mm/hugetlb.c
++++ b/mm/hugetlb.c
+@@ -532,14 +532,16 @@ static struct page *dequeue_huge_page_vma(struct hstate *h,
+ 				struct vm_area_struct *vma,
+ 				unsigned long address, int avoid_reserve)
+ {
+-	struct page *page = NULL;
++	struct page *page;
+ 	struct mempolicy *mpol;
+ 	nodemask_t *nodemask;
+ 	struct zonelist *zonelist;
+ 	struct zone *zone;
+ 	struct zoneref *z;
++	unsigned int cpuset_mems_cookie;
+ 
+-	get_mems_allowed();
++retry_cpuset:
++	cpuset_mems_cookie = get_mems_allowed();
+ 	zonelist = huge_zonelist(vma, address,
+ 					htlb_alloc_mask, &mpol, &nodemask);
+ 	/*
+@@ -566,10 +568,15 @@ static struct page *dequeue_huge_page_vma(struct hstate *h,
+ 			}
+ 		}
+ 	}
+-err:
++
+ 	mpol_cond_put(mpol);
+-	put_mems_allowed();
++	if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !page))
++		goto retry_cpuset;
+ 	return page;
++
++err:
++	mpol_cond_put(mpol);
++	return NULL;
+ }
+ 
+ static void update_and_free_page(struct hstate *h, struct page *page)
+diff --git a/mm/mempolicy.c b/mm/mempolicy.c
+index f2650bc..c0007f9 100644
+--- a/mm/mempolicy.c
++++ b/mm/mempolicy.c
+@@ -1843,18 +1843,24 @@ struct page *
+ alloc_pages_vma(gfp_t gfp, int order, struct vm_area_struct *vma,
+ 		unsigned long addr, int node)
+ {
+-	struct mempolicy *pol = get_vma_policy(current, vma, addr);
++	struct mempolicy *pol;
+ 	struct zonelist *zl;
+ 	struct page *page;
++	unsigned int cpuset_mems_cookie;
++
++retry_cpuset:
++	pol = get_vma_policy(current, vma, addr);
++	cpuset_mems_cookie = get_mems_allowed();
+ 
+-	get_mems_allowed();
+ 	if (unlikely(pol->mode == MPOL_INTERLEAVE)) {
+ 		unsigned nid;
+ 
+ 		nid = interleave_nid(pol, vma, addr, PAGE_SHIFT + order);
+ 		mpol_cond_put(pol);
+ 		page = alloc_page_interleave(gfp, order, nid);
+-		put_mems_allowed();
++		if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !page))
++			goto retry_cpuset;
++
+ 		return page;
+ 	}
+ 	zl = policy_zonelist(gfp, pol, node);
+@@ -1865,7 +1871,8 @@ alloc_pages_vma(gfp_t gfp, int order, struct vm_area_struct *vma,
+ 		struct page *page =  __alloc_pages_nodemask(gfp, order,
+ 						zl, policy_nodemask(gfp, pol));
+ 		__mpol_put(pol);
+-		put_mems_allowed();
++		if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !page))
++			goto retry_cpuset;
+ 		return page;
+ 	}
+ 	/*
+@@ -1873,7 +1880,8 @@ alloc_pages_vma(gfp_t gfp, int order, struct vm_area_struct *vma,
+ 	 */
+ 	page = __alloc_pages_nodemask(gfp, order, zl,
+ 				      policy_nodemask(gfp, pol));
+-	put_mems_allowed();
++	if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !page))
++		goto retry_cpuset;
+ 	return page;
+ }
+ 
+@@ -1900,11 +1908,14 @@ struct page *alloc_pages_current(gfp_t gfp, unsigned order)
+ {
+ 	struct mempolicy *pol = current->mempolicy;
+ 	struct page *page;
++	unsigned int cpuset_mems_cookie;
+ 
+ 	if (!pol || in_interrupt() || (gfp & __GFP_THISNODE))
+ 		pol = &default_policy;
+ 
+-	get_mems_allowed();
++retry_cpuset:
++	cpuset_mems_cookie = get_mems_allowed();
++
+ 	/*
+ 	 * No reference counting needed for current->mempolicy
+ 	 * nor system default_policy
+@@ -1915,7 +1926,10 @@ struct page *alloc_pages_current(gfp_t gfp, unsigned order)
+ 		page = __alloc_pages_nodemask(gfp, order,
+ 				policy_zonelist(gfp, pol, numa_node_id()),
+ 				policy_nodemask(gfp, pol));
+-	put_mems_allowed();
++
++	if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !page))
++		goto retry_cpuset;
++
+ 	return page;
+ }
+ EXPORT_SYMBOL(alloc_pages_current);
+diff --git a/mm/page_alloc.c b/mm/page_alloc.c
+index ef6e1a1..065dbe8 100644
+--- a/mm/page_alloc.c
++++ b/mm/page_alloc.c
+@@ -2282,8 +2282,9 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order,
+ {
+ 	enum zone_type high_zoneidx = gfp_zone(gfp_mask);
+ 	struct zone *preferred_zone;
+-	struct page *page;
++	struct page *page = NULL;
+ 	int migratetype = allocflags_to_migratetype(gfp_mask);
++	unsigned int cpuset_mems_cookie;
+ 
+ 	gfp_mask &= gfp_allowed_mask;
+ 
+@@ -2302,15 +2303,15 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order,
+ 	if (unlikely(!zonelist->_zonerefs->zone))
+ 		return NULL;
+ 
+-	get_mems_allowed();
++retry_cpuset:
++	cpuset_mems_cookie = get_mems_allowed();
++
+ 	/* The preferred zone is used for statistics later */
+ 	first_zones_zonelist(zonelist, high_zoneidx,
+ 				nodemask ? : &cpuset_current_mems_allowed,
+ 				&preferred_zone);
+-	if (!preferred_zone) {
+-		put_mems_allowed();
+-		return NULL;
+-	}
++	if (!preferred_zone)
++		goto out;
+ 
+ 	/* First allocation attempt */
+ 	page = get_page_from_freelist(gfp_mask|__GFP_HARDWALL, nodemask, order,
+@@ -2320,9 +2321,19 @@ __alloc_pages_nodemask(gfp_t gfp_mask, unsigned int order,
+ 		page = __alloc_pages_slowpath(gfp_mask, order,
+ 				zonelist, high_zoneidx, nodemask,
+ 				preferred_zone, migratetype);
+-	put_mems_allowed();
+ 
+ 	trace_mm_page_alloc(page, order, gfp_mask, migratetype);
++
++out:
++	/*
++	 * When updating a task's mems_allowed, it is possible to race with
++	 * parallel threads in such a way that an allocation can fail while
++	 * the mask is being updated. If a page allocation is about to fail,
++	 * check if the cpuset changed during allocation and if so, retry.
++	 */
++	if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !page))
++		goto retry_cpuset;
++
+ 	return page;
+ }
+ EXPORT_SYMBOL(__alloc_pages_nodemask);
+@@ -2546,13 +2557,15 @@ void si_meminfo_node(struct sysinfo *val, int nid)
+ bool skip_free_areas_node(unsigned int flags, int nid)
+ {
+ 	bool ret = false;
++	unsigned int cpuset_mems_cookie;
+ 
+ 	if (!(flags & SHOW_MEM_FILTER_NODES))
+ 		goto out;
+ 
+-	get_mems_allowed();
+-	ret = !node_isset(nid, cpuset_current_mems_allowed);
+-	put_mems_allowed();
++	do {
++		cpuset_mems_cookie = get_mems_allowed();
++		ret = !node_isset(nid, cpuset_current_mems_allowed);
++	} while (!put_mems_allowed(cpuset_mems_cookie));
+ out:
+ 	return ret;
+ }
+diff --git a/mm/slab.c b/mm/slab.c
+index 83311c9a..cd3ab93 100644
+--- a/mm/slab.c
++++ b/mm/slab.c
+@@ -3267,12 +3267,10 @@ static void *alternate_node_alloc(struct kmem_cache *cachep, gfp_t flags)
+ 	if (in_interrupt() || (flags & __GFP_THISNODE))
+ 		return NULL;
+ 	nid_alloc = nid_here = numa_mem_id();
+-	get_mems_allowed();
+ 	if (cpuset_do_slab_mem_spread() && (cachep->flags & SLAB_MEM_SPREAD))
+ 		nid_alloc = cpuset_slab_spread_node();
+ 	else if (current->mempolicy)
+ 		nid_alloc = slab_node(current->mempolicy);
+-	put_mems_allowed();
+ 	if (nid_alloc != nid_here)
+ 		return ____cache_alloc_node(cachep, flags, nid_alloc);
+ 	return NULL;
+@@ -3295,14 +3293,17 @@ static void *fallback_alloc(struct kmem_cache *cache, gfp_t flags)
+ 	enum zone_type high_zoneidx = gfp_zone(flags);
+ 	void *obj = NULL;
+ 	int nid;
++	unsigned int cpuset_mems_cookie;
+ 
+ 	if (flags & __GFP_THISNODE)
+ 		return NULL;
+ 
+-	get_mems_allowed();
+-	zonelist = node_zonelist(slab_node(current->mempolicy), flags);
+ 	local_flags = flags & (GFP_CONSTRAINT_MASK|GFP_RECLAIM_MASK);
+ 
++retry_cpuset:
++	cpuset_mems_cookie = get_mems_allowed();
++	zonelist = node_zonelist(slab_node(current->mempolicy), flags);
++
+ retry:
+ 	/*
+ 	 * Look through allowed nodes for objects available
+@@ -3355,7 +3356,9 @@ retry:
+ 			}
+ 		}
+ 	}
+-	put_mems_allowed();
++
++	if (unlikely(!put_mems_allowed(cpuset_mems_cookie) && !obj))
++		goto retry_cpuset;
+ 	return obj;
+ }
+ 
+diff --git a/mm/slub.c b/mm/slub.c
+index af47188..5710788 100644
+--- a/mm/slub.c
++++ b/mm/slub.c
+@@ -1582,6 +1582,7 @@ static struct page *get_any_partial(struct kmem_cache *s, gfp_t flags,
+ 	struct zone *zone;
+ 	enum zone_type high_zoneidx = gfp_zone(flags);
+ 	void *object;
++	unsigned int cpuset_mems_cookie;
+ 
+ 	/*
+ 	 * The defrag ratio allows a configuration of the tradeoffs between
+@@ -1605,23 +1606,32 @@ static struct page *get_any_partial(struct kmem_cache *s, gfp_t flags,
+ 			get_cycles() % 1024 > s->remote_node_defrag_ratio)
+ 		return NULL;
+ 
+-	get_mems_allowed();
+-	zonelist = node_zonelist(slab_node(current->mempolicy), flags);
+-	for_each_zone_zonelist(zone, z, zonelist, high_zoneidx) {
+-		struct kmem_cache_node *n;
+-
+-		n = get_node(s, zone_to_nid(zone));
+-
+-		if (n && cpuset_zone_allowed_hardwall(zone, flags) &&
+-				n->nr_partial > s->min_partial) {
+-			object = get_partial_node(s, n, c);
+-			if (object) {
+-				put_mems_allowed();
+-				return object;
++	do {
++		cpuset_mems_cookie = get_mems_allowed();
++		zonelist = node_zonelist(slab_node(current->mempolicy), flags);
++		for_each_zone_zonelist(zone, z, zonelist, high_zoneidx) {
++			struct kmem_cache_node *n;
++
++			n = get_node(s, zone_to_nid(zone));
++
++			if (n && cpuset_zone_allowed_hardwall(zone, flags) &&
++					n->nr_partial > s->min_partial) {
++				object = get_partial_node(s, n, c);
++				if (object) {
++					/*
++					 * Return the object even if
++					 * put_mems_allowed indicated that
++					 * the cpuset mems_allowed was
++					 * updated in parallel. It's a
++					 * harmless race between the alloc
++					 * and the cpuset update.
++					 */
++					put_mems_allowed(cpuset_mems_cookie);
++					return object;
++				}
+ 			}
+ 		}
+-	}
+-	put_mems_allowed();
++	} while (!put_mems_allowed(cpuset_mems_cookie));
+ #endif
+ 	return NULL;
+ }
+diff --git a/mm/vmscan.c b/mm/vmscan.c
+index ded1857..48febd7 100644
+--- a/mm/vmscan.c
++++ b/mm/vmscan.c
+@@ -2295,7 +2295,6 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
+ 	unsigned long writeback_threshold;
+ 	bool aborted_reclaim;
+ 
+-	get_mems_allowed();
+ 	delayacct_freepages_start();
+ 
+ 	if (scanning_global_lru(sc))
+@@ -2359,7 +2358,6 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
+ 
+ out:
+ 	delayacct_freepages_end();
+-	put_mems_allowed();
+ 
+ 	if (sc->nr_reclaimed)
+ 		return sc->nr_reclaimed;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0016-mm-hugetlb-fix-warning-in-alloc_huge_page-dequeue_hu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0016-mm-hugetlb-fix-warning-in-alloc_huge_page-dequeue_hu.patch
new file mode 100644
index 0000000..9c4a09a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0016-mm-hugetlb-fix-warning-in-alloc_huge_page-dequeue_hu.patch
@@ -0,0 +1,50 @@
+From f9871f8705a930f3c3c4588a8c990cf76db2b95e Mon Sep 17 00:00:00 2001
+From: Konstantin Khlebnikov <khlebnikov@openvz.org>
+Date: Wed, 25 Apr 2012 16:01:46 -0700
+Subject: [PATCH 16/73] mm/hugetlb: fix warning in
+ alloc_huge_page/dequeue_huge_page_vma
+
+commit b1c12cbcd0a02527c180a862e8971e249d3b347d upstream.
+
+Stable note: Not tracked in Bugzilla. [get|put]_mems_allowed() is extremely
+	expensive and severely impacted page allocator performance. This
+	is part of a series of patches that reduce page allocator overhead.
+
+Fix a gcc warning (and bug?) introduced in cc9a6c877 ("cpuset: mm: reduce
+large amounts of memory barrier related damage v3")
+
+Local variable "page" can be uninitialized if the nodemask from vma policy
+does not intersects with nodemask from cpuset.  Even if it doesn't happens
+it is better to initialize this variable explicitly than to introduce
+a kernel oops in a weird corner case.
+
+mm/hugetlb.c: In function `alloc_huge_page':
+mm/hugetlb.c:1135:5: warning: `page' may be used uninitialized in this function
+
+Signed-off-by: Konstantin Khlebnikov <khlebnikov@openvz.org>
+Acked-by: Mel Gorman <mgorman@suse.de>
+Acked-by: David Rientjes <rientjes@google.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/hugetlb.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/mm/hugetlb.c b/mm/hugetlb.c
+index 1e747e4..b1e1bad 100644
+--- a/mm/hugetlb.c
++++ b/mm/hugetlb.c
+@@ -532,7 +532,7 @@ static struct page *dequeue_huge_page_vma(struct hstate *h,
+ 				struct vm_area_struct *vma,
+ 				unsigned long address, int avoid_reserve)
+ {
+-	struct page *page;
++	struct page *page = NULL;
+ 	struct mempolicy *mpol;
+ 	nodemask_t *nodemask;
+ 	struct zonelist *zonelist;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0017-Fix-NULL-dereferences-in-scsi_cmd_to_driver.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0017-Fix-NULL-dereferences-in-scsi_cmd_to_driver.patch
new file mode 100644
index 0000000..b56b57e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0017-Fix-NULL-dereferences-in-scsi_cmd_to_driver.patch
@@ -0,0 +1,71 @@
+From 67fed15f639763628507a2e704441acabcce4bdd Mon Sep 17 00:00:00 2001
+From: Mark Rustad <mark.d.rustad@intel.com>
+Date: Thu, 21 Jun 2012 12:23:42 -0700
+Subject: [PATCH 17/73] Fix NULL dereferences in scsi_cmd_to_driver
+
+commit 222a806af830fda34ad1f6bc991cd226916de060 upstream.
+
+Avoid crashing if the private_data pointer happens to be NULL. This has
+been seen sometimes when a host reset happens, notably when there are
+many LUNs:
+
+host3: Assigned Port ID 0c1601
+scsi host3: libfc: Host reset succeeded on port (0c1601)
+BUG: unable to handle kernel NULL pointer dereference at 0000000000000350
+IP: [<ffffffff81352bb8>] scsi_send_eh_cmnd+0x58/0x3a0
+<snip>
+Process scsi_eh_3 (pid: 4144, threadinfo ffff88030920c000, task ffff880326b160c0)
+Stack:
+ 000000010372e6ba 0000000000000282 000027100920dca0 ffffffffa0038ee0
+ 0000000000000000 0000000000030003 ffff88030920dc80 ffff88030920dc80
+ 00000002000e0000 0000000a00004000 ffff8803242f7760 ffff88031326ed80
+Call Trace:
+ [<ffffffff8105b590>] ? lock_timer_base+0x70/0x70
+ [<ffffffff81352fbe>] scsi_eh_tur+0x3e/0xc0
+ [<ffffffff81353a36>] scsi_eh_test_devices+0x76/0x170
+ [<ffffffff81354125>] scsi_eh_host_reset+0x85/0x160
+ [<ffffffff81354291>] scsi_eh_ready_devs+0x91/0x110
+ [<ffffffff813543fd>] scsi_unjam_host+0xed/0x1f0
+ [<ffffffff813546a8>] scsi_error_handler+0x1a8/0x200
+ [<ffffffff81354500>] ? scsi_unjam_host+0x1f0/0x1f0
+ [<ffffffff8106ec3e>] kthread+0x9e/0xb0
+ [<ffffffff81509264>] kernel_thread_helper+0x4/0x10
+ [<ffffffff8106eba0>] ? kthread_freezable_should_stop+0x70/0x70
+ [<ffffffff81509260>] ? gs_change+0x13/0x13
+Code: 25 28 00 00 00 48 89 45 c8 31 c0 48 8b 87 80 00 00 00 48 8d b5 60 ff ff ff 89 d1 48 89 fb 41 89 d6 4c 89 fa 48 8b 80 b8 00 00 00
+ <48> 8b 80 50 03 00 00 48 8b 00 48 89 85 38 ff ff ff 48 8b 07 4c
+RIP  [<ffffffff81352bb8>] scsi_send_eh_cmnd+0x58/0x3a0
+ RSP <ffff88030920dc50>
+CR2: 0000000000000350
+
+Signed-off-by: Mark Rustad <mark.d.rustad@intel.com>
+Tested-by: Marcus Dennis <marcusx.e.dennis@intel.com>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+[bwh: Backported to 3.2: adjust filename, context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/scsi.c |    8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/scsi/scsi.c b/drivers/scsi/scsi.c
+index 2aeb2e9..831db24 100644
+--- a/drivers/scsi/scsi.c
++++ b/drivers/scsi/scsi.c
+@@ -785,7 +785,13 @@ static void scsi_done(struct scsi_cmnd *cmd)
+ /* Move this to a header if it becomes more generally useful */
+ static struct scsi_driver *scsi_cmd_to_driver(struct scsi_cmnd *cmd)
+ {
+-	return *(struct scsi_driver **)cmd->request->rq_disk->private_data;
++	struct scsi_driver **sdp;
++
++	sdp = (struct scsi_driver **)cmd->request->rq_disk->private_data;
++	if (!sdp)
++		return NULL;
++
++	return *sdp;
+ }
+ 
+ /**
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0018-sched-nohz-Fix-rq-cpu_load-calculations.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0018-sched-nohz-Fix-rq-cpu_load-calculations.patch
new file mode 100644
index 0000000..6548d42
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0018-sched-nohz-Fix-rq-cpu_load-calculations.patch
@@ -0,0 +1,137 @@
+From af56d9e56ec0729f6aa8c3a51b9bddbdcd8dfcf0 Mon Sep 17 00:00:00 2001
+From: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Date: Fri, 11 May 2012 17:31:26 +0200
+Subject: [PATCH 18/73] sched/nohz: Fix rq->cpu_load[] calculations
+
+commit 556061b00c9f2fd6a5524b6bde823ef12f299ecf upstream.
+
+While investigating why the load-balancer did funny I found that the
+rq->cpu_load[] tables were completely screwy.. a bit more digging
+revealed that the updates that got through were missing ticks followed
+by a catchup of 2 ticks.
+
+The catchup assumes the cpu was idle during that time (since only nohz
+can cause missed ticks and the machine is idle etc..) this means that
+esp. the higher indices were significantly lower than they ought to
+be.
+
+The reason for this is that its not correct to compare against jiffies
+on every jiffy on any other cpu than the cpu that updates jiffies.
+
+This patch cludges around it by only doing the catch-up stuff from
+nohz_idle_balance() and doing the regular stuff unconditionally from
+the tick.
+
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: pjt@google.com
+Cc: Venkatesh Pallipadi <venki@google.com>
+Link: http://lkml.kernel.org/n/tip-tp4kj18xdd5aj4vvj0qg55s2@git.kernel.org
+Signed-off-by: Ingo Molnar <mingo@kernel.org>
+[bwh: Backported to 3.2: adjust filenames and context; keep functions static]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/sched.c      |   53 ++++++++++++++++++++++++++++++++++++++------------
+ kernel/sched_fair.c |    2 +-
+ 2 files changed, 41 insertions(+), 14 deletions(-)
+
+diff --git a/kernel/sched.c b/kernel/sched.c
+index 52ac69b..a409d81 100644
+--- a/kernel/sched.c
++++ b/kernel/sched.c
+@@ -1887,7 +1887,7 @@ static void double_rq_unlock(struct rq *rq1, struct rq *rq2)
+ 
+ static void update_sysctl(void);
+ static int get_update_sysctl_factor(void);
+-static void update_cpu_load(struct rq *this_rq);
++static void update_idle_cpu_load(struct rq *this_rq);
+ 
+ static inline void __set_task_cpu(struct task_struct *p, unsigned int cpu)
+ {
+@@ -3855,22 +3855,13 @@ decay_load_missed(unsigned long load, unsigned long missed_updates, int idx)
+  * scheduler tick (TICK_NSEC). With tickless idle this will not be called
+  * every tick. We fix it up based on jiffies.
+  */
+-static void update_cpu_load(struct rq *this_rq)
++static void __update_cpu_load(struct rq *this_rq, unsigned long this_load,
++			      unsigned long pending_updates)
+ {
+-	unsigned long this_load = this_rq->load.weight;
+-	unsigned long curr_jiffies = jiffies;
+-	unsigned long pending_updates;
+ 	int i, scale;
+ 
+ 	this_rq->nr_load_updates++;
+ 
+-	/* Avoid repeated calls on same jiffy, when moving in and out of idle */
+-	if (curr_jiffies == this_rq->last_load_update_tick)
+-		return;
+-
+-	pending_updates = curr_jiffies - this_rq->last_load_update_tick;
+-	this_rq->last_load_update_tick = curr_jiffies;
+-
+ 	/* Update our load: */
+ 	this_rq->cpu_load[0] = this_load; /* Fasttrack for idx 0 */
+ 	for (i = 1, scale = 2; i < CPU_LOAD_IDX_MAX; i++, scale += scale) {
+@@ -3895,9 +3886,45 @@ static void update_cpu_load(struct rq *this_rq)
+ 	sched_avg_update(this_rq);
+ }
+ 
++/*
++ * Called from nohz_idle_balance() to update the load ratings before doing the
++ * idle balance.
++ */
++static void update_idle_cpu_load(struct rq *this_rq)
++{
++	unsigned long curr_jiffies = jiffies;
++	unsigned long load = this_rq->load.weight;
++	unsigned long pending_updates;
++
++	/*
++	 * Bloody broken means of dealing with nohz, but better than nothing..
++	 * jiffies is updated by one cpu, another cpu can drift wrt the jiffy
++	 * update and see 0 difference the one time and 2 the next, even though
++	 * we ticked at roughtly the same rate.
++	 *
++	 * Hence we only use this from nohz_idle_balance() and skip this
++	 * nonsense when called from the scheduler_tick() since that's
++	 * guaranteed a stable rate.
++	 */
++	if (load || curr_jiffies == this_rq->last_load_update_tick)
++		return;
++
++	pending_updates = curr_jiffies - this_rq->last_load_update_tick;
++	this_rq->last_load_update_tick = curr_jiffies;
++
++	__update_cpu_load(this_rq, load, pending_updates);
++}
++
++/*
++ * Called from scheduler_tick()
++ */
+ static void update_cpu_load_active(struct rq *this_rq)
+ {
+-	update_cpu_load(this_rq);
++	/*
++	 * See the mess in update_idle_cpu_load().
++	 */
++	this_rq->last_load_update_tick = jiffies;
++	__update_cpu_load(this_rq, this_rq->load.weight, 1);
+ 
+ 	calc_load_account_active(this_rq);
+ }
+diff --git a/kernel/sched_fair.c b/kernel/sched_fair.c
+index 8a39fa3..66e4576 100644
+--- a/kernel/sched_fair.c
++++ b/kernel/sched_fair.c
+@@ -4735,7 +4735,7 @@ static void nohz_idle_balance(int this_cpu, enum cpu_idle_type idle)
+ 
+ 		raw_spin_lock_irq(&this_rq->lock);
+ 		update_rq_clock(this_rq);
+-		update_cpu_load(this_rq);
++		update_idle_cpu_load(this_rq);
+ 		raw_spin_unlock_irq(&this_rq->lock);
+ 
+ 		rebalance_domains(balance_cpu, CPU_IDLE);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0019-sched-nohz-Fix-rq-cpu_load-calculations-some-more.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0019-sched-nohz-Fix-rq-cpu_load-calculations-some-more.patch
new file mode 100644
index 0000000..130bbe6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0019-sched-nohz-Fix-rq-cpu_load-calculations-some-more.patch
@@ -0,0 +1,147 @@
+From 5886fe4d82654fa7b041fcc2dd81794d28e2f0a7 Mon Sep 17 00:00:00 2001
+From: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Date: Thu, 17 May 2012 17:15:29 +0200
+Subject: [PATCH 19/73] sched/nohz: Fix rq->cpu_load calculations some more
+
+commit 5aaa0b7a2ed5b12692c9ffb5222182bd558d3146 upstream.
+
+Follow up on commit 556061b00 ("sched/nohz: Fix rq->cpu_load[]
+calculations") since while that fixed the busy case it regressed the
+mostly idle case.
+
+Add a callback from the nohz exit to also age the rq->cpu_load[]
+array. This closes the hole where either there was no nohz load
+balance pass during the nohz, or there was a 'significant' amount of
+idle time between the last nohz balance and the nohz exit.
+
+So we'll update unconditionally from the tick to not insert any
+accidental 0 load periods while busy, and we try and catch up from
+nohz idle balance and nohz exit. Both these are still prone to missing
+a jiffy, but that has always been the case.
+
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: pjt@google.com
+Cc: Venkatesh Pallipadi <venki@google.com>
+Link: http://lkml.kernel.org/n/tip-kt0trz0apodbf84ucjfdbr1a@git.kernel.org
+Signed-off-by: Ingo Molnar <mingo@kernel.org>
+[bwh: Backported to 3.2: adjust filenames and context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/sched.h    |    1 +
+ kernel/sched.c           |   53 +++++++++++++++++++++++++++++++++++++--------
+ kernel/time/tick-sched.c |    1 +
+ 3 files changed, 45 insertions(+), 10 deletions(-)
+
+diff --git a/include/linux/sched.h b/include/linux/sched.h
+index a96cb8c..d336c35 100644
+--- a/include/linux/sched.h
++++ b/include/linux/sched.h
+@@ -145,6 +145,7 @@ extern unsigned long this_cpu_load(void);
+ 
+ 
+ extern void calc_global_load(unsigned long ticks);
++extern void update_cpu_load_nohz(void);
+ 
+ extern unsigned long get_parent_ip(unsigned long addr);
+ 
+diff --git a/kernel/sched.c b/kernel/sched.c
+index a409d81..9cd8ca7 100644
+--- a/kernel/sched.c
++++ b/kernel/sched.c
+@@ -3886,25 +3886,32 @@ static void __update_cpu_load(struct rq *this_rq, unsigned long this_load,
+ 	sched_avg_update(this_rq);
+ }
+ 
++#ifdef CONFIG_NO_HZ
++/*
++ * There is no sane way to deal with nohz on smp when using jiffies because the
++ * cpu doing the jiffies update might drift wrt the cpu doing the jiffy reading
++ * causing off-by-one errors in observed deltas; {0,2} instead of {1,1}.
++ *
++ * Therefore we cannot use the delta approach from the regular tick since that
++ * would seriously skew the load calculation. However we'll make do for those
++ * updates happening while idle (nohz_idle_balance) or coming out of idle
++ * (tick_nohz_idle_exit).
++ *
++ * This means we might still be one tick off for nohz periods.
++ */
++
+ /*
+  * Called from nohz_idle_balance() to update the load ratings before doing the
+  * idle balance.
+  */
+ static void update_idle_cpu_load(struct rq *this_rq)
+ {
+-	unsigned long curr_jiffies = jiffies;
++	unsigned long curr_jiffies = ACCESS_ONCE(jiffies);
+ 	unsigned long load = this_rq->load.weight;
+ 	unsigned long pending_updates;
+ 
+ 	/*
+-	 * Bloody broken means of dealing with nohz, but better than nothing..
+-	 * jiffies is updated by one cpu, another cpu can drift wrt the jiffy
+-	 * update and see 0 difference the one time and 2 the next, even though
+-	 * we ticked at roughtly the same rate.
+-	 *
+-	 * Hence we only use this from nohz_idle_balance() and skip this
+-	 * nonsense when called from the scheduler_tick() since that's
+-	 * guaranteed a stable rate.
++	 * bail if there's load or we're actually up-to-date.
+ 	 */
+ 	if (load || curr_jiffies == this_rq->last_load_update_tick)
+ 		return;
+@@ -3916,12 +3923,38 @@ static void update_idle_cpu_load(struct rq *this_rq)
+ }
+ 
+ /*
++ * Called from tick_nohz_idle_exit() -- try and fix up the ticks we missed.
++ */
++void update_cpu_load_nohz(void)
++{
++	struct rq *this_rq = this_rq();
++	unsigned long curr_jiffies = ACCESS_ONCE(jiffies);
++	unsigned long pending_updates;
++
++	if (curr_jiffies == this_rq->last_load_update_tick)
++		return;
++
++	raw_spin_lock(&this_rq->lock);
++	pending_updates = curr_jiffies - this_rq->last_load_update_tick;
++	if (pending_updates) {
++		this_rq->last_load_update_tick = curr_jiffies;
++		/*
++		 * We were idle, this means load 0, the current load might be
++		 * !0 due to remote wakeups and the sort.
++		 */
++		__update_cpu_load(this_rq, 0, pending_updates);
++	}
++	raw_spin_unlock(&this_rq->lock);
++}
++#endif /* CONFIG_NO_HZ */
++
++/*
+  * Called from scheduler_tick()
+  */
+ static void update_cpu_load_active(struct rq *this_rq)
+ {
+ 	/*
+-	 * See the mess in update_idle_cpu_load().
++	 * See the mess around update_idle_cpu_load() / update_cpu_load_nohz().
+ 	 */
+ 	this_rq->last_load_update_tick = jiffies;
+ 	__update_cpu_load(this_rq, this_rq->load.weight, 1);
+diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
+index 9955ebd..793548c 100644
+--- a/kernel/time/tick-sched.c
++++ b/kernel/time/tick-sched.c
+@@ -549,6 +549,7 @@ void tick_nohz_restart_sched_tick(void)
+ 	/* Update jiffies first */
+ 	select_nohz_load_balancer(0);
+ 	tick_do_update_jiffies64(now);
++	update_cpu_load_nohz();
+ 
+ #ifndef CONFIG_VIRT_CPU_ACCOUNTING
+ 	/*
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0020-powerpc-ftrace-Fix-assembly-trampoline-register-usag.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0020-powerpc-ftrace-Fix-assembly-trampoline-register-usag.patch
new file mode 100644
index 0000000..f55431d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0020-powerpc-ftrace-Fix-assembly-trampoline-register-usag.patch
@@ -0,0 +1,50 @@
+From 033f6d41630ea9916446d27526cad10233c43839 Mon Sep 17 00:00:00 2001
+From: roger blofeld <blofeldus@yahoo.com>
+Date: Thu, 21 Jun 2012 05:27:14 +0000
+Subject: [PATCH 20/73] powerpc/ftrace: Fix assembly trampoline register usage
+
+commit fd5a42980e1cf327b7240adf5e7b51ea41c23437 upstream.
+
+Just like the module loader, ftrace needs to be updated to use r12
+instead of r11 with newer gcc's.
+
+Signed-off-by: Roger Blofeld <blofeldus@yahoo.com>
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/powerpc/kernel/ftrace.c |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/arch/powerpc/kernel/ftrace.c b/arch/powerpc/kernel/ftrace.c
+index bf99cfa..6324008 100644
+--- a/arch/powerpc/kernel/ftrace.c
++++ b/arch/powerpc/kernel/ftrace.c
+@@ -245,9 +245,9 @@ __ftrace_make_nop(struct module *mod,
+ 
+ 	/*
+ 	 * On PPC32 the trampoline looks like:
+-	 *  0x3d, 0x60, 0x00, 0x00  lis r11,sym@ha
+-	 *  0x39, 0x6b, 0x00, 0x00  addi r11,r11,sym@l
+-	 *  0x7d, 0x69, 0x03, 0xa6  mtctr r11
++	 *  0x3d, 0x80, 0x00, 0x00  lis r12,sym@ha
++	 *  0x39, 0x8c, 0x00, 0x00  addi r12,r12,sym@l
++	 *  0x7d, 0x89, 0x03, 0xa6  mtctr r12
+ 	 *  0x4e, 0x80, 0x04, 0x20  bctr
+ 	 */
+ 
+@@ -262,9 +262,9 @@ __ftrace_make_nop(struct module *mod,
+ 	pr_devel(" %08x %08x ", jmp[0], jmp[1]);
+ 
+ 	/* verify that this is what we expect it to be */
+-	if (((jmp[0] & 0xffff0000) != 0x3d600000) ||
+-	    ((jmp[1] & 0xffff0000) != 0x396b0000) ||
+-	    (jmp[2] != 0x7d6903a6) ||
++	if (((jmp[0] & 0xffff0000) != 0x3d800000) ||
++	    ((jmp[1] & 0xffff0000) != 0x398c0000) ||
++	    (jmp[2] != 0x7d8903a6) ||
+ 	    (jmp[3] != 0x4e800420)) {
+ 		printk(KERN_ERR "Not a trampoline\n");
+ 		return -EINVAL;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0021-cx25821-Remove-bad-strcpy-to-read-only-char.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0021-cx25821-Remove-bad-strcpy-to-read-only-char.patch
new file mode 100644
index 0000000..bc425dc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0021-cx25821-Remove-bad-strcpy-to-read-only-char.patch
@@ -0,0 +1,53 @@
+From 030eee1110a4bb7e4bce1cb32eb0f1a4fbd9923a Mon Sep 17 00:00:00 2001
+From: Ezequiel Garcia <elezegarcia@gmail.com>
+Date: Wed, 18 Jul 2012 10:05:26 -0300
+Subject: [PATCH 21/73] cx25821: Remove bad strcpy to read-only char*
+
+commit 380e99fc44d79bc35af9ff1d3316ef4027ce775e upstream.
+
+The strcpy was being used to set the name of the board.  Since the
+destination char* was read-only and the name is set statically at
+compile time; this was both wrong and redundant.
+
+The type of char* is changed to const char* to prevent future errors.
+
+Reported-by: Radek Masin <radek@masin.eu>
+Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
+[ Taking directly due to vacations   - Linus ]
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/media/video/cx25821/cx25821-core.c |    3 ---
+ drivers/media/video/cx25821/cx25821.h      |    2 +-
+ 2 files changed, 1 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/media/video/cx25821/cx25821-core.c b/drivers/media/video/cx25821/cx25821-core.c
+index a7fa38f..e572ce5 100644
+--- a/drivers/media/video/cx25821/cx25821-core.c
++++ b/drivers/media/video/cx25821/cx25821-core.c
+@@ -914,9 +914,6 @@ static int cx25821_dev_setup(struct cx25821_dev *dev)
+ 	list_add_tail(&dev->devlist, &cx25821_devlist);
+ 	mutex_unlock(&cx25821_devlist_mutex);
+ 
+-	strcpy(cx25821_boards[UNKNOWN_BOARD].name, "unknown");
+-	strcpy(cx25821_boards[CX25821_BOARD].name, "cx25821");
+-
+ 	if (dev->pci->device != 0x8210) {
+ 		pr_info("%s(): Exiting. Incorrect Hardware device = 0x%02x\n",
+ 			__func__, dev->pci->device);
+diff --git a/drivers/media/video/cx25821/cx25821.h b/drivers/media/video/cx25821/cx25821.h
+index 2d2d009..bf54360 100644
+--- a/drivers/media/video/cx25821/cx25821.h
++++ b/drivers/media/video/cx25821/cx25821.h
+@@ -187,7 +187,7 @@ enum port {
+ };
+ 
+ struct cx25821_board {
+-	char *name;
++	const char *name;
+ 	enum port porta;
+ 	enum port portb;
+ 	enum port portc;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0022-x86-Fix-boot-on-Twinhead-H12Y.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0022-x86-Fix-boot-on-Twinhead-H12Y.patch
new file mode 100644
index 0000000..b5eccde
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0022-x86-Fix-boot-on-Twinhead-H12Y.patch
@@ -0,0 +1,54 @@
+From 25b4c57c33b9972f3b03d5a74c827b27cd9babcf Mon Sep 17 00:00:00 2001
+From: Alan Cox <alan@linux.intel.com>
+Date: Tue, 15 May 2012 18:44:15 +0100
+Subject: [PATCH 22/73] x86: Fix boot on Twinhead H12Y
+
+commit 80b3e557371205566a71e569fbfcce5b11f92dbe upstream.
+
+Despite lots of investigation into why this is needed we don't
+know or have an elegant cure. The only answer found on this
+laptop is to mark a problem region as used so that Linux doesn't
+put anything there.
+
+Currently all the users add reserve= command lines and anyone
+not knowing this needs to find the magic page that documents it.
+Automate it instead.
+
+Signed-off-by: Alan Cox <alan@linux.intel.com>
+Tested-and-bugfixed-by: Arne Fitzenreiter <arne@fitzenreiter.de>
+Resolves-bug: https://bugzilla.kernel.org/show_bug.cgi?id=10231
+Link: http://lkml.kernel.org/r/20120515174347.5109.94551.stgit@bluebook
+Signed-off-by: Ingo Molnar <mingo@kernel.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/pci/fixup.c |   17 +++++++++++++++++
+ 1 files changed, 17 insertions(+), 0 deletions(-)
+
+diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
+index 6dd8955..0951b81 100644
+--- a/arch/x86/pci/fixup.c
++++ b/arch/x86/pci/fixup.c
+@@ -521,3 +521,20 @@ static void sb600_disable_hpet_bar(struct pci_dev *dev)
+ 	}
+ }
+ DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_ATI, 0x4385, sb600_disable_hpet_bar);
++
++/*
++ * Twinhead H12Y needs us to block out a region otherwise we map devices
++ * there and any access kills the box.
++ *
++ *   See: https://bugzilla.kernel.org/show_bug.cgi?id=10231
++ *
++ * Match off the LPC and svid/sdid (older kernels lose the bridge subvendor)
++ */
++static void __devinit twinhead_reserve_killing_zone(struct pci_dev *dev)
++{
++        if (dev->subsystem_vendor == 0x14FF && dev->subsystem_device == 0xA003) {
++                pr_info("Reserving memory on Twinhead H12Y\n");
++                request_mem_region(0xFFB00000, 0x100000, "twinhead");
++        }
++}
++DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_INTEL, 0x27B9, twinhead_reserve_killing_zone);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0023-r8169-RxConfig-hack-for-the-8168evl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0023-r8169-RxConfig-hack-for-the-8168evl.patch
new file mode 100644
index 0000000..35d29c7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0023-r8169-RxConfig-hack-for-the-8168evl.patch
@@ -0,0 +1,47 @@
+From 57961c5a47473e6a6aa03292828484bb2d293f04 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?fran=C3=A7ois=20romieu?= <romieu@fr.zoreil.com>
+Date: Wed, 20 Jun 2012 12:09:18 +0000
+Subject: [PATCH 23/73] r8169: RxConfig hack for the 8168evl.
+
+commit eb2dc35d99028b698cdedba4f5522bc43e576bd2 upstream.
+
+The 8168evl (RTL_GIGA_MAC_VER_34) based Gigabyte GA-990FXA motherboards
+are very prone to NETDEV watchdog problems without this change. See
+https://bugzilla.kernel.org/show_bug.cgi?id=42899 for instance.
+
+I don't know why it *works*. It's depressingly effective though.
+
+For the record:
+- the problem may go along IOMMU (AMD-Vi) errors but it really looks
+  like a red herring.
+- the patch sets the RX_MULTI_EN bit. If the 8168c doc is any guide,
+  the chipset now fetches several Rx descriptors at a time.
+- long ago the driver ignored the RX_MULTI_EN bit.
+  e542a2269f232d61270ceddd42b73a4348dee2bb changed the RxConfig
+  settings. Whatever the problem it's now labeled a regression.
+- Realtek's own driver can identify two different 8168evl devices
+  (CFG_METHOD_16 and CFG_METHOD_17) where the r8169 driver only
+  sees one. It sucks.
+
+Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/ethernet/realtek/r8169.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
+index 9e61d6b..ed1be8a 100644
+--- a/drivers/net/ethernet/realtek/r8169.c
++++ b/drivers/net/ethernet/realtek/r8169.c
+@@ -3770,6 +3770,7 @@ static void rtl_init_rxcfg(struct rtl8169_private *tp)
+ 	case RTL_GIGA_MAC_VER_22:
+ 	case RTL_GIGA_MAC_VER_23:
+ 	case RTL_GIGA_MAC_VER_24:
++	case RTL_GIGA_MAC_VER_34:
+ 		RTL_W32(RxConfig, RX128_INT_EN | RX_MULTI_EN | RX_DMA_BURST);
+ 		break;
+ 	default:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0024-cifs-when-CONFIG_HIGHMEM-is-set-serialize-the-read-w.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0024-cifs-when-CONFIG_HIGHMEM-is-set-serialize-the-read-w.patch
new file mode 100644
index 0000000..004839e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0024-cifs-when-CONFIG_HIGHMEM-is-set-serialize-the-read-w.patch
@@ -0,0 +1,124 @@
+From 3e3da899949f18869c6958a30a861d89f2d4b73c Mon Sep 17 00:00:00 2001
+From: Jeff Layton <jlayton@redhat.com>
+Date: Wed, 11 Jul 2012 09:09:36 -0400
+Subject: [PATCH 24/73] cifs: when CONFIG_HIGHMEM is set, serialize the
+ read/write kmaps
+
+commit 3cf003c08be785af4bee9ac05891a15bcbff856a upstream.
+
+Jian found that when he ran fsx on a 32 bit arch with a large wsize the
+process and one of the bdi writeback kthreads would sometimes deadlock
+with a stack trace like this:
+
+crash> bt
+PID: 2789   TASK: f02edaa0  CPU: 3   COMMAND: "fsx"
+ #0 [eed63cbc] schedule at c083c5b3
+ #1 [eed63d80] kmap_high at c0500ec8
+ #2 [eed63db0] cifs_async_writev at f7fabcd7 [cifs]
+ #3 [eed63df0] cifs_writepages at f7fb7f5c [cifs]
+ #4 [eed63e50] do_writepages at c04f3e32
+ #5 [eed63e54] __filemap_fdatawrite_range at c04e152a
+ #6 [eed63ea4] filemap_fdatawrite at c04e1b3e
+ #7 [eed63eb4] cifs_file_aio_write at f7fa111a [cifs]
+ #8 [eed63ecc] do_sync_write at c052d202
+ #9 [eed63f74] vfs_write at c052d4ee
+#10 [eed63f94] sys_write at c052df4c
+#11 [eed63fb0] ia32_sysenter_target at c0409a98
+    EAX: 00000004  EBX: 00000003  ECX: abd73b73  EDX: 012a65c6
+    DS:  007b      ESI: 012a65c6  ES:  007b      EDI: 00000000
+    SS:  007b      ESP: bf8db178  EBP: bf8db1f8  GS:  0033
+    CS:  0073      EIP: 40000424  ERR: 00000004  EFLAGS: 00000246
+
+Each task would kmap part of its address array before getting stuck, but
+not enough to actually issue the write.
+
+This patch fixes this by serializing the marshal_iov operations for
+async reads and writes. The idea here is to ensure that cifs
+aggressively tries to populate a request before attempting to fulfill
+another one. As soon as all of the pages are kmapped for a request, then
+we can unlock and allow another one to proceed.
+
+There's no need to do this serialization on non-CONFIG_HIGHMEM arches
+however, so optimize all of this out when CONFIG_HIGHMEM isn't set.
+
+Reported-by: Jian Li <jiali@redhat.com>
+Signed-off-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Steve French <smfrench@gmail.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/cifs/cifssmb.c |   30 ++++++++++++++++++++++++++++++
+ 1 files changed, 30 insertions(+), 0 deletions(-)
+
+diff --git a/fs/cifs/cifssmb.c b/fs/cifs/cifssmb.c
+index 6aa7457..c858a29 100644
+--- a/fs/cifs/cifssmb.c
++++ b/fs/cifs/cifssmb.c
+@@ -89,6 +89,32 @@ static struct {
+ /* Forward declarations */
+ static void cifs_readv_complete(struct work_struct *work);
+ 
++#ifdef CONFIG_HIGHMEM
++/*
++ * On arches that have high memory, kmap address space is limited. By
++ * serializing the kmap operations on those arches, we ensure that we don't
++ * end up with a bunch of threads in writeback with partially mapped page
++ * arrays, stuck waiting for kmap to come back. That situation prevents
++ * progress and can deadlock.
++ */
++static DEFINE_MUTEX(cifs_kmap_mutex);
++
++static inline void
++cifs_kmap_lock(void)
++{
++	mutex_lock(&cifs_kmap_mutex);
++}
++
++static inline void
++cifs_kmap_unlock(void)
++{
++	mutex_unlock(&cifs_kmap_mutex);
++}
++#else /* !CONFIG_HIGHMEM */
++#define cifs_kmap_lock() do { ; } while(0)
++#define cifs_kmap_unlock() do { ; } while(0)
++#endif /* CONFIG_HIGHMEM */
++
+ /* Mark as invalid, all open files on tree connections since they
+    were closed when session to server was lost */
+ static void mark_open_files_invalid(struct cifs_tcon *pTcon)
+@@ -1540,6 +1566,7 @@ cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid)
+ 	eof_index = eof ? (eof - 1) >> PAGE_CACHE_SHIFT : 0;
+ 	cFYI(1, "eof=%llu eof_index=%lu", eof, eof_index);
+ 
++	cifs_kmap_lock();
+ 	list_for_each_entry_safe(page, tpage, &rdata->pages, lru) {
+ 		if (remaining >= PAGE_CACHE_SIZE) {
+ 			/* enough data to fill the page */
+@@ -1589,6 +1616,7 @@ cifs_readv_receive(struct TCP_Server_Info *server, struct mid_q_entry *mid)
+ 			page_cache_release(page);
+ 		}
+ 	}
++	cifs_kmap_unlock();
+ 
+ 	/* issue the read if we have any iovecs left to fill */
+ 	if (rdata->nr_iov > 1) {
+@@ -2171,6 +2199,7 @@ cifs_async_writev(struct cifs_writedata *wdata)
+ 	iov[0].iov_base = smb;
+ 
+ 	/* marshal up the pages into iov array */
++	cifs_kmap_lock();
+ 	wdata->bytes = 0;
+ 	for (i = 0; i < wdata->nr_pages; i++) {
+ 		iov[i + 1].iov_len = min(inode->i_size -
+@@ -2179,6 +2208,7 @@ cifs_async_writev(struct cifs_writedata *wdata)
+ 		iov[i + 1].iov_base = kmap(wdata->pages[i]);
+ 		wdata->bytes += iov[i + 1].iov_len;
+ 	}
++	cifs_kmap_unlock();
+ 
+ 	cFYI(1, "async write at %llu %u bytes", wdata->offset, wdata->bytes);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0025-wireless-rt2x00-rt2800usb-add-more-devices-ids.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0025-wireless-rt2x00-rt2800usb-add-more-devices-ids.patch
new file mode 100644
index 0000000..71216d7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0025-wireless-rt2x00-rt2800usb-add-more-devices-ids.patch
@@ -0,0 +1,89 @@
+From 1b993bd614946837177ce94e29f3d6febec2d7dc Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Tue, 17 Apr 2012 01:50:32 +0200
+Subject: [PATCH 25/73] wireless: rt2x00: rt2800usb add more devices ids
+
+commit 63b376411173c343bbcb450f95539da91f079e0c upstream.
+
+They were taken from ralink drivers:
+2011_0719_RT3070_RT3370_RT5370_RT5372_Linux_STA_V2.5.0.3_DPO
+2012_03_22_RT5572_Linux_STA_v2.6.0.0_DPO
+
+0x1eda,0x2210 RT3070 Airties
+
+0x083a,0xb511 RT3370 Panasonic
+0x0471,0x20dd RT3370 Philips
+
+0x1690,0x0764 RT35xx Askey
+0x0df6,0x0065 RT35xx Sitecom
+0x0df6,0x0066 RT35xx Sitecom
+0x0df6,0x0068 RT35xx Sitecom
+
+0x2001,0x3c1c RT5370 DLink
+0x2001,0x3c1d RT5370 DLink
+
+2001 is D-Link not Alpha
+
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Acked-by: Gertjan van Wingerde <gwingerde@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+[bwh: Backported to 3.2: drop the 5372 devices]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rt2x00/rt2800usb.c |   12 ++++++++++++
+ 1 files changed, 12 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2800usb.c b/drivers/net/wireless/rt2x00/rt2800usb.c
+index 0ffa111..f05a12d 100644
+--- a/drivers/net/wireless/rt2x00/rt2800usb.c
++++ b/drivers/net/wireless/rt2x00/rt2800usb.c
+@@ -876,6 +876,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x1482, 0x3c09) },
+ 	/* AirTies */
+ 	{ USB_DEVICE(0x1eda, 0x2012) },
++	{ USB_DEVICE(0x1eda, 0x2210) },
+ 	{ USB_DEVICE(0x1eda, 0x2310) },
+ 	/* Allwin */
+ 	{ USB_DEVICE(0x8516, 0x2070) },
+@@ -1088,6 +1089,10 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ #ifdef CONFIG_RT2800USB_RT33XX
+ 	/* Belkin */
+ 	{ USB_DEVICE(0x050d, 0x945b) },
++	/* Panasonic */
++	{ USB_DEVICE(0x083a, 0xb511) },
++	/* Philips */
++	{ USB_DEVICE(0x0471, 0x20dd) },
+ 	/* Ralink */
+ 	{ USB_DEVICE(0x148f, 0x3370) },
+ 	{ USB_DEVICE(0x148f, 0x8070) },
+@@ -1099,6 +1104,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x8516, 0x3572) },
+ 	/* Askey */
+ 	{ USB_DEVICE(0x1690, 0x0744) },
++	{ USB_DEVICE(0x1690, 0x0764) },
+ 	/* Cisco */
+ 	{ USB_DEVICE(0x167b, 0x4001) },
+ 	/* EnGenius */
+@@ -1113,6 +1119,9 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	/* Sitecom */
+ 	{ USB_DEVICE(0x0df6, 0x0041) },
+ 	{ USB_DEVICE(0x0df6, 0x0062) },
++	{ USB_DEVICE(0x0df6, 0x0065) },
++	{ USB_DEVICE(0x0df6, 0x0066) },
++	{ USB_DEVICE(0x0df6, 0x0068) },
+ 	/* Toshiba */
+ 	{ USB_DEVICE(0x0930, 0x0a07) },
+ 	/* Zinwell */
+@@ -1122,6 +1131,9 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	/* Azurewave */
+ 	{ USB_DEVICE(0x13d3, 0x3329) },
+ 	{ USB_DEVICE(0x13d3, 0x3365) },
++	/* D-Link */
++	{ USB_DEVICE(0x2001, 0x3c1c) },
++	{ USB_DEVICE(0x2001, 0x3c1d) },
+ 	/* Ralink */
+ 	{ USB_DEVICE(0x148f, 0x5370) },
+ 	{ USB_DEVICE(0x148f, 0x5372) },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0026-wireless-rt2x00-rt2800usb-more-devices-were-identifi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0026-wireless-rt2x00-rt2800usb-more-devices-were-identifi.patch
new file mode 100644
index 0000000..afed137
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0026-wireless-rt2x00-rt2800usb-more-devices-were-identifi.patch
@@ -0,0 +1,79 @@
+From 53157c2a7eda6ba98def241f183a06a6f28f852f Mon Sep 17 00:00:00 2001
+From: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Date: Tue, 17 Apr 2012 16:28:05 +0200
+Subject: [PATCH 26/73] wireless: rt2x00: rt2800usb more devices were
+ identified
+
+commit e828b9fb4f6c3513950759d5fb902db5bd054048 upstream.
+
+found in 2012_03_22_RT5572_Linux_STA_v2.6.0.0_DPO
+
+RT3070:
+(0x2019,0x5201)  Planex Communications, Inc. RT8070
+(0x7392,0x4085)  2L Central Europe BV 8070
+7392 is Edimax
+
+RT35xx:
+(0x1690,0x0761) Askey
+was Fujitsu Stylistic 550, but 1690 is Askey
+
+Signed-off-by: Xose Vazquez Perez <xose.vazquez@gmail.com>
+Acked-by: Gertjan van Wingerde <gwingerde@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rt2x00/rt2800usb.c |    8 +++-----
+ 1 files changed, 3 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2800usb.c b/drivers/net/wireless/rt2x00/rt2800usb.c
+index f05a12d..76ebba4 100644
+--- a/drivers/net/wireless/rt2x00/rt2800usb.c
++++ b/drivers/net/wireless/rt2x00/rt2800usb.c
+@@ -946,6 +946,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	/* DVICO */
+ 	{ USB_DEVICE(0x0fe9, 0xb307) },
+ 	/* Edimax */
++	{ USB_DEVICE(0x7392, 0x4085) },
+ 	{ USB_DEVICE(0x7392, 0x7711) },
+ 	{ USB_DEVICE(0x7392, 0x7717) },
+ 	{ USB_DEVICE(0x7392, 0x7718) },
+@@ -1021,6 +1022,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	/* Philips */
+ 	{ USB_DEVICE(0x0471, 0x200f) },
+ 	/* Planex */
++	{ USB_DEVICE(0x2019, 0x5201) },
+ 	{ USB_DEVICE(0x2019, 0xab25) },
+ 	{ USB_DEVICE(0x2019, 0xed06) },
+ 	/* Quanta */
+@@ -1104,6 +1106,7 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x8516, 0x3572) },
+ 	/* Askey */
+ 	{ USB_DEVICE(0x1690, 0x0744) },
++	{ USB_DEVICE(0x1690, 0x0761) },
+ 	{ USB_DEVICE(0x1690, 0x0764) },
+ 	/* Cisco */
+ 	{ USB_DEVICE(0x167b, 0x4001) },
+@@ -1176,12 +1179,8 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x07d1, 0x3c0b) },
+ 	{ USB_DEVICE(0x07d1, 0x3c17) },
+ 	{ USB_DEVICE(0x2001, 0x3c17) },
+-	/* Edimax */
+-	{ USB_DEVICE(0x7392, 0x4085) },
+ 	/* Encore */
+ 	{ USB_DEVICE(0x203d, 0x14a1) },
+-	/* Fujitsu Stylistic 550 */
+-	{ USB_DEVICE(0x1690, 0x0761) },
+ 	/* Gemtek */
+ 	{ USB_DEVICE(0x15a9, 0x0010) },
+ 	/* Gigabyte */
+@@ -1202,7 +1201,6 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	{ USB_DEVICE(0x05a6, 0x0101) },
+ 	{ USB_DEVICE(0x1d4d, 0x0010) },
+ 	/* Planex */
+-	{ USB_DEVICE(0x2019, 0x5201) },
+ 	{ USB_DEVICE(0x2019, 0xab24) },
+ 	/* Qcom */
+ 	{ USB_DEVICE(0x18e8, 0x6259) },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0027-rt2800usb-2001-3c17-is-an-RT3370-device.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0027-rt2800usb-2001-3c17-is-an-RT3370-device.patch
new file mode 100644
index 0000000..fb65d15
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0027-rt2800usb-2001-3c17-is-an-RT3370-device.patch
@@ -0,0 +1,41 @@
+From b35733e76251b308e5a65e60630261571c85f9f3 Mon Sep 17 00:00:00 2001
+From: Albert Pool <albertpool@solcon.nl>
+Date: Mon, 14 May 2012 18:08:32 +0200
+Subject: [PATCH 27/73] rt2800usb: 2001:3c17 is an RT3370 device
+
+commit 8fd9d059af12786341dec5a688e607bcdb372238 upstream.
+
+D-Link DWA-123 rev A1
+
+Signed-off-by: Albert Pool<albertpool@solcon.nl>
+Acked-by: Gertjan van Wingerde <gwingerde@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rt2x00/rt2800usb.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2800usb.c b/drivers/net/wireless/rt2x00/rt2800usb.c
+index 76ebba4..bdf960b 100644
+--- a/drivers/net/wireless/rt2x00/rt2800usb.c
++++ b/drivers/net/wireless/rt2x00/rt2800usb.c
+@@ -1091,6 +1091,8 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ #ifdef CONFIG_RT2800USB_RT33XX
+ 	/* Belkin */
+ 	{ USB_DEVICE(0x050d, 0x945b) },
++	/* D-Link */
++	{ USB_DEVICE(0x2001, 0x3c17) },
+ 	/* Panasonic */
+ 	{ USB_DEVICE(0x083a, 0xb511) },
+ 	/* Philips */
+@@ -1178,7 +1180,6 @@ static struct usb_device_id rt2800usb_device_table[] = {
+ 	/* D-Link */
+ 	{ USB_DEVICE(0x07d1, 0x3c0b) },
+ 	{ USB_DEVICE(0x07d1, 0x3c17) },
+-	{ USB_DEVICE(0x2001, 0x3c17) },
+ 	/* Encore */
+ 	{ USB_DEVICE(0x203d, 0x14a1) },
+ 	/* Gemtek */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0028-usb-gadget-Fix-g_ether-interface-link-status.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0028-usb-gadget-Fix-g_ether-interface-link-status.patch
new file mode 100644
index 0000000..2dcadb8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0028-usb-gadget-Fix-g_ether-interface-link-status.patch
@@ -0,0 +1,61 @@
+From f91bc4d604edd5b09021245b6643cfeebc707f2b Mon Sep 17 00:00:00 2001
+From: Kevin Cernekee <cernekee@gmail.com>
+Date: Sun, 24 Jun 2012 21:11:22 -0700
+Subject: [PATCH 28/73] usb: gadget: Fix g_ether interface link status
+
+commit 31bde1ceaa873bcaecd49e829bfabceacc4c512d upstream.
+
+A "usb0" interface that has never been connected to a host has an unknown
+operstate, and therefore the IFF_RUNNING flag is (incorrectly) asserted
+when queried by ifconfig, ifplugd, etc.  This is a result of calling
+netif_carrier_off() too early in the probe function; it should be called
+after register_netdev().
+
+Similar problems have been fixed in many other drivers, e.g.:
+
+    e826eafa6 (bonding: Call netif_carrier_off after register_netdevice)
+    0d672e9f8 (drivers/net: Call netif_carrier_off at the end of the probe)
+    6a3c869a6 (cxgb4: fix reported state of interfaces without link)
+
+Fix is to move netif_carrier_off() to the end of the function.
+
+Signed-off-by: Kevin Cernekee <cernekee@gmail.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/gadget/u_ether.c |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/usb/gadget/u_ether.c b/drivers/usb/gadget/u_ether.c
+index 29c854b..4e1f0aa 100644
+--- a/drivers/usb/gadget/u_ether.c
++++ b/drivers/usb/gadget/u_ether.c
+@@ -796,12 +796,6 @@ int gether_setup(struct usb_gadget *g, u8 ethaddr[ETH_ALEN])
+ 
+ 	SET_ETHTOOL_OPS(net, &ops);
+ 
+-	/* two kinds of host-initiated state changes:
+-	 *  - iff DATA transfer is active, carrier is "on"
+-	 *  - tx queueing enabled if open *and* carrier is "on"
+-	 */
+-	netif_carrier_off(net);
+-
+ 	dev->gadget = g;
+ 	SET_NETDEV_DEV(net, &g->dev);
+ 	SET_NETDEV_DEVTYPE(net, &gadget_type);
+@@ -815,6 +809,12 @@ int gether_setup(struct usb_gadget *g, u8 ethaddr[ETH_ALEN])
+ 		INFO(dev, "HOST MAC %pM\n", dev->host_mac);
+ 
+ 		the_dev = dev;
++
++		/* two kinds of host-initiated state changes:
++		 *  - iff DATA transfer is active, carrier is "on"
++		 *  - tx queueing enabled if open *and* carrier is "on"
++		 */
++		netif_carrier_off(net);
+ 	}
+ 
+ 	return status;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0029-ext4-pass-a-char-to-ext4_count_free-instead-of-a-buf.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0029-ext4-pass-a-char-to-ext4_count_free-instead-of-a-buf.patch
new file mode 100644
index 0000000..9286436
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0029-ext4-pass-a-char-to-ext4_count_free-instead-of-a-buf.patch
@@ -0,0 +1,88 @@
+From e872f4ac0de4e1898a669e2c8a7185ef76f266fb Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Sat, 30 Jun 2012 19:14:57 -0400
+Subject: [PATCH 29/73] ext4: pass a char * to ext4_count_free() instead of a
+ buffer_head ptr
+
+commit f6fb99cadcd44660c68e13f6eab28333653621e6 upstream.
+
+Make it possible for ext4_count_free to operate on buffers and not
+just data in buffer_heads.
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ext4/balloc.c |    3 ++-
+ fs/ext4/bitmap.c |    8 +++-----
+ fs/ext4/ext4.h   |    2 +-
+ fs/ext4/ialloc.c |    3 ++-
+ 4 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/fs/ext4/balloc.c b/fs/ext4/balloc.c
+index 914bf9e..d6970f7 100644
+--- a/fs/ext4/balloc.c
++++ b/fs/ext4/balloc.c
+@@ -557,7 +557,8 @@ ext4_fsblk_t ext4_count_free_clusters(struct super_block *sb)
+ 		if (bitmap_bh == NULL)
+ 			continue;
+ 
+-		x = ext4_count_free(bitmap_bh, sb->s_blocksize);
++		x = ext4_count_free(bitmap_bh->b_data,
++				    EXT4_BLOCKS_PER_GROUP(sb) / 8);
+ 		printk(KERN_DEBUG "group %u: stored = %d, counted = %u\n",
+ 			i, ext4_free_group_clusters(sb, gdp), x);
+ 		bitmap_count += x;
+diff --git a/fs/ext4/bitmap.c b/fs/ext4/bitmap.c
+index fa3af81..012faaa 100644
+--- a/fs/ext4/bitmap.c
++++ b/fs/ext4/bitmap.c
+@@ -15,15 +15,13 @@
+ 
+ static const int nibblemap[] = {4, 3, 3, 2, 3, 2, 2, 1, 3, 2, 2, 1, 2, 1, 1, 0};
+ 
+-unsigned int ext4_count_free(struct buffer_head *map, unsigned int numchars)
++unsigned int ext4_count_free(char *bitmap, unsigned int numchars)
+ {
+ 	unsigned int i, sum = 0;
+ 
+-	if (!map)
+-		return 0;
+ 	for (i = 0; i < numchars; i++)
+-		sum += nibblemap[map->b_data[i] & 0xf] +
+-			nibblemap[(map->b_data[i] >> 4) & 0xf];
++		sum += nibblemap[bitmap[i] & 0xf] +
++			nibblemap[(bitmap[i] >> 4) & 0xf];
+ 	return sum;
+ }
+ 
+diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
+index 7b1cd5c..873897c 100644
+--- a/fs/ext4/ext4.h
++++ b/fs/ext4/ext4.h
+@@ -1757,7 +1757,7 @@ struct mmpd_data {
+ # define NORET_AND	noreturn,
+ 
+ /* bitmap.c */
+-extern unsigned int ext4_count_free(struct buffer_head *, unsigned);
++extern unsigned int ext4_count_free(char *bitmap, unsigned numchars);
+ 
+ /* balloc.c */
+ extern unsigned int ext4_block_group(struct super_block *sb,
+diff --git a/fs/ext4/ialloc.c b/fs/ext4/ialloc.c
+index 8fb6844..6266799 100644
+--- a/fs/ext4/ialloc.c
++++ b/fs/ext4/ialloc.c
+@@ -1057,7 +1057,8 @@ unsigned long ext4_count_free_inodes(struct super_block *sb)
+ 		if (!bitmap_bh)
+ 			continue;
+ 
+-		x = ext4_count_free(bitmap_bh, EXT4_INODES_PER_GROUP(sb) / 8);
++		x = ext4_count_free(bitmap_bh->b_data,
++				    EXT4_INODES_PER_GROUP(sb) / 8);
+ 		printk(KERN_DEBUG "group %lu: stored = %d, counted = %lu\n",
+ 			(unsigned long) i, ext4_free_inodes_count(sb, gdp), x);
+ 		bitmap_count += x;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0030-ftrace-Disable-function-tracing-during-suspend-resum.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0030-ftrace-Disable-function-tracing-during-suspend-resum.patch
new file mode 100644
index 0000000..3ec5202
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0030-ftrace-Disable-function-tracing-during-suspend-resum.patch
@@ -0,0 +1,113 @@
+From 951ac5885b5a314d394ea0668dedccd7ed9216e5 Mon Sep 17 00:00:00 2001
+From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
+Date: Sat, 16 Jun 2012 15:30:45 +0200
+Subject: [PATCH 30/73] ftrace: Disable function tracing during suspend/resume
+ and hibernation, again
+
+commit 443772d408a25af62498793f6f805ce3c559309a upstream.
+
+If function tracing is enabled for some of the low-level suspend/resume
+functions, it leads to triple fault during resume from suspend, ultimately
+ending up in a reboot instead of a resume (or a total refusal to come out
+of suspended state, on some machines).
+
+This issue was explained in more detail in commit f42ac38c59e0a03d (ftrace:
+disable tracing for suspend to ram). However, the changes made by that commit
+got reverted by commit cbe2f5a6e84eebb (tracing: allow tracing of
+suspend/resume & hibernation code again). So, unfortunately since things are
+not yet robust enough to allow tracing of low-level suspend/resume functions,
+suspend/resume is still broken when ftrace is enabled.
+
+So fix this by disabling function tracing during suspend/resume & hibernation.
+
+Signed-off-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ kernel/power/hibernate.c |    6 ++++++
+ kernel/power/suspend.c   |    3 +++
+ 2 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
+index 7c0d578..013bd2e 100644
+--- a/kernel/power/hibernate.c
++++ b/kernel/power/hibernate.c
+@@ -367,6 +367,7 @@ int hibernation_snapshot(int platform_mode)
+ 	}
+ 
+ 	suspend_console();
++	ftrace_stop();
+ 	pm_restrict_gfp_mask();
+ 	error = dpm_suspend(PMSG_FREEZE);
+ 	if (error)
+@@ -392,6 +393,7 @@ int hibernation_snapshot(int platform_mode)
+ 	if (error || !in_suspend)
+ 		pm_restore_gfp_mask();
+ 
++	ftrace_start();
+ 	resume_console();
+ 	dpm_complete(msg);
+ 
+@@ -496,6 +498,7 @@ int hibernation_restore(int platform_mode)
+ 
+ 	pm_prepare_console();
+ 	suspend_console();
++	ftrace_stop();
+ 	pm_restrict_gfp_mask();
+ 	error = dpm_suspend_start(PMSG_QUIESCE);
+ 	if (!error) {
+@@ -503,6 +506,7 @@ int hibernation_restore(int platform_mode)
+ 		dpm_resume_end(PMSG_RECOVER);
+ 	}
+ 	pm_restore_gfp_mask();
++	ftrace_start();
+ 	resume_console();
+ 	pm_restore_console();
+ 	return error;
+@@ -529,6 +533,7 @@ int hibernation_platform_enter(void)
+ 
+ 	entering_platform_hibernation = true;
+ 	suspend_console();
++	ftrace_stop();
+ 	error = dpm_suspend_start(PMSG_HIBERNATE);
+ 	if (error) {
+ 		if (hibernation_ops->recover)
+@@ -572,6 +577,7 @@ int hibernation_platform_enter(void)
+  Resume_devices:
+ 	entering_platform_hibernation = false;
+ 	dpm_resume_end(PMSG_RESTORE);
++	ftrace_start();
+ 	resume_console();
+ 
+  Close:
+diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
+index 4953dc0..af48faa 100644
+--- a/kernel/power/suspend.c
++++ b/kernel/power/suspend.c
+@@ -25,6 +25,7 @@
+ #include <linux/export.h>
+ #include <linux/suspend.h>
+ #include <linux/syscore_ops.h>
++#include <linux/ftrace.h>
+ #include <trace/events/power.h>
+ 
+ #include "power.h"
+@@ -220,6 +221,7 @@ int suspend_devices_and_enter(suspend_state_t state)
+ 			goto Close;
+ 	}
+ 	suspend_console();
++	ftrace_stop();
+ 	suspend_test_start();
+ 	error = dpm_suspend_start(PMSG_SUSPEND);
+ 	if (error) {
+@@ -239,6 +241,7 @@ int suspend_devices_and_enter(suspend_state_t state)
+ 	suspend_test_start();
+ 	dpm_resume_end(PMSG_RESUME);
+ 	suspend_test_finish("resume devices");
++	ftrace_start();
+ 	resume_console();
+  Close:
+ 	if (suspend_ops->end)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0031-x86-microcode-microcode_core.c-simple_strtoul-cleanu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0031-x86-microcode-microcode_core.c-simple_strtoul-cleanu.patch
new file mode 100644
index 0000000..abdc7b1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0031-x86-microcode-microcode_core.c-simple_strtoul-cleanu.patch
@@ -0,0 +1,44 @@
+From a0ac7c345c81631057085b53d0b5de53efb8d241 Mon Sep 17 00:00:00 2001
+From: Shuah Khan <shuahkhan@gmail.com>
+Date: Sun, 6 May 2012 11:11:04 -0600
+Subject: [PATCH 31/73] x86, microcode: microcode_core.c simple_strtoul
+ cleanup
+
+commit e826abd523913f63eb03b59746ffb16153c53dc4 upstream.
+
+Change reload_for_cpu() in kernel/microcode_core.c to call kstrtoul()
+instead of calling obsoleted simple_strtoul().
+
+Signed-off-by: Shuah Khan <shuahkhan@gmail.com>
+Reviewed-by: Borislav Petkov <bp@alien8.de>
+Link: http://lkml.kernel.org/r/1336324264.2897.9.camel@lorien2
+Signed-off-by: H. Peter Anvin <hpa@linux.intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/microcode_core.c |    9 ++++-----
+ 1 files changed, 4 insertions(+), 5 deletions(-)
+
+diff --git a/arch/x86/kernel/microcode_core.c b/arch/x86/kernel/microcode_core.c
+index 563a09d..19c7af1 100644
+--- a/arch/x86/kernel/microcode_core.c
++++ b/arch/x86/kernel/microcode_core.c
+@@ -298,12 +298,11 @@ static ssize_t reload_store(struct sys_device *dev,
+ {
+ 	unsigned long val;
+ 	int cpu = dev->id;
+-	int ret = 0;
+-	char *end;
++	ssize_t ret = 0;
+ 
+-	val = simple_strtoul(buf, &end, 0);
+-	if (end == buf)
+-		return -EINVAL;
++	ret = kstrtoul(buf, 0, &val);
++	if (ret)
++		return ret;
+ 
+ 	if (val == 1) {
+ 		get_online_cpus();
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0032-x86-microcode-Sanitize-per-cpu-microcode-reloading-i.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0032-x86-microcode-Sanitize-per-cpu-microcode-reloading-i.patch
new file mode 100644
index 0000000..824c039
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0032-x86-microcode-Sanitize-per-cpu-microcode-reloading-i.patch
@@ -0,0 +1,92 @@
+From 6a7d02f3957e572d5e35fc71df90a3a7311e383d Mon Sep 17 00:00:00 2001
+From: Borislav Petkov <borislav.petkov@amd.com>
+Date: Thu, 21 Jun 2012 14:07:16 +0200
+Subject: [PATCH 32/73] x86, microcode: Sanitize per-cpu microcode reloading
+ interface
+
+commit c9fc3f778a6a215ace14ee556067c73982b6d40f upstream.
+
+Microcode reloading in a per-core manner is a very bad idea for both
+major x86 vendors. And the thing is, we have such interface with which
+we can end up with different microcode versions applied on different
+cores of an otherwise homogeneous wrt (family,model,stepping) system.
+
+So turn off the possibility of doing that per core and allow it only
+system-wide.
+
+This is a minimal fix which we'd like to see in stable too thus the
+more-or-less arbitrary decision to allow system-wide reloading only on
+the BSP:
+
+$ echo 1 > /sys/devices/system/cpu/cpu0/microcode/reload
+...
+
+and disable the interface on the other cores:
+
+$ echo 1 > /sys/devices/system/cpu/cpu23/microcode/reload
+-bash: echo: write error: Invalid argument
+
+Also, allowing the reload only from one CPU (the BSP in
+that case) doesn't allow the reload procedure to degenerate
+into an O(n^2) deal when triggering reloads from all
+/sys/devices/system/cpu/cpuX/microcode/reload sysfs nodes
+simultaneously.
+
+A more generic fix will follow.
+
+Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Signed-off-by: Borislav Petkov <borislav.petkov@amd.com>
+Link: http://lkml.kernel.org/r/1340280437-7718-2-git-send-email-bp@amd64.org
+Signed-off-by: H. Peter Anvin <hpa@zytor.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/x86/kernel/microcode_core.c |   26 +++++++++++++++++++-------
+ 1 files changed, 19 insertions(+), 7 deletions(-)
+
+diff --git a/arch/x86/kernel/microcode_core.c b/arch/x86/kernel/microcode_core.c
+index 19c7af1..29c95d7 100644
+--- a/arch/x86/kernel/microcode_core.c
++++ b/arch/x86/kernel/microcode_core.c
+@@ -297,19 +297,31 @@ static ssize_t reload_store(struct sys_device *dev,
+ 			    const char *buf, size_t size)
+ {
+ 	unsigned long val;
+-	int cpu = dev->id;
+-	ssize_t ret = 0;
++	int cpu;
++	ssize_t ret = 0, tmp_ret;
++
++	/* allow reload only from the BSP */
++	if (boot_cpu_data.cpu_index != dev->id)
++		return -EINVAL;
+ 
+ 	ret = kstrtoul(buf, 0, &val);
+ 	if (ret)
+ 		return ret;
+ 
+-	if (val == 1) {
+-		get_online_cpus();
+-		if (cpu_online(cpu))
+-			ret = reload_for_cpu(cpu);
+-		put_online_cpus();
++	if (val != 1)
++		return size;
++
++	get_online_cpus();
++	for_each_online_cpu(cpu) {
++		tmp_ret = reload_for_cpu(cpu);
++		if (tmp_ret != 0)
++			pr_warn("Error reloading microcode on CPU %d\n", cpu);
++
++		/* save retval of the first encountered reload error */
++		if (!ret)
++			ret = tmp_ret;
+ 	}
++	put_online_cpus();
+ 
+ 	if (!ret)
+ 		ret = size;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0033-usbdevfs-Correct-amount-of-data-copied-to-user-in-pr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0033-usbdevfs-Correct-amount-of-data-copied-to-user-in-pr.patch
new file mode 100644
index 0000000..044c7d0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0033-usbdevfs-Correct-amount-of-data-copied-to-user-in-pr.patch
@@ -0,0 +1,45 @@
+From ab66ac59913202f29a32377f4e8bcfd730a8f31d Mon Sep 17 00:00:00 2001
+From: Hans de Goede <hdegoede@redhat.com>
+Date: Wed, 4 Jul 2012 09:18:01 +0200
+Subject: [PATCH 33/73] usbdevfs: Correct amount of data copied to user in
+ processcompl_compat
+
+commit 2102e06a5f2e414694921f23591f072a5ba7db9f upstream.
+
+iso data buffers may have holes in them if some packets were short, so for
+iso urbs we should always copy the entire buffer, just like the regular
+processcompl does.
+
+Signed-off-by: Hans de Goede <hdegoede@redhat.com>
+Acked-by: Alan Stern <stern@rowland.harvard.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/core/devio.c |   10 +++++++---
+ 1 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/usb/core/devio.c b/drivers/usb/core/devio.c
+index f6ff837..a9df218 100644
+--- a/drivers/usb/core/devio.c
++++ b/drivers/usb/core/devio.c
+@@ -1555,10 +1555,14 @@ static int processcompl_compat(struct async *as, void __user * __user *arg)
+ 	void __user *addr = as->userurb;
+ 	unsigned int i;
+ 
+-	if (as->userbuffer && urb->actual_length)
+-		if (copy_to_user(as->userbuffer, urb->transfer_buffer,
+-				 urb->actual_length))
++	if (as->userbuffer && urb->actual_length) {
++		if (urb->number_of_packets > 0)		/* Isochronous */
++			i = urb->transfer_buffer_length;
++		else					/* Non-Isoc */
++			i = urb->actual_length;
++		if (copy_to_user(as->userbuffer, urb->transfer_buffer, i))
+ 			return -EFAULT;
++	}
+ 	if (put_user(as->status, &userurb->status))
+ 		return -EFAULT;
+ 	if (put_user(urb->actual_length, &userurb->actual_length))
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0034-ext4-fix-overhead-calculation-used-by-ext4_statfs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0034-ext4-fix-overhead-calculation-used-by-ext4_statfs.patch
new file mode 100644
index 0000000..3fc3812
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0034-ext4-fix-overhead-calculation-used-by-ext4_statfs.patch
@@ -0,0 +1,294 @@
+From 838475547b3c83537e291b997da546b518f591b3 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Mon, 9 Jul 2012 16:27:05 -0400
+Subject: [PATCH 34/73] ext4: fix overhead calculation used by ext4_statfs()
+
+commit 952fc18ef9ec707ebdc16c0786ec360295e5ff15 upstream.
+
+Commit f975d6bcc7a introduced bug which caused ext4_statfs() to
+miscalculate the number of file system overhead blocks.  This causes
+the f_blocks field in the statfs structure to be larger than it should
+be.  This would in turn cause the "df" output to show the number of
+data blocks in the file system and the number of data blocks used to
+be larger than they should be.
+
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ext4/bitmap.c |    4 -
+ fs/ext4/ext4.h   |    4 +-
+ fs/ext4/resize.c |    5 ++
+ fs/ext4/super.c  |  174 ++++++++++++++++++++++++++++++++++++++----------------
+ 4 files changed, 131 insertions(+), 56 deletions(-)
+
+diff --git a/fs/ext4/bitmap.c b/fs/ext4/bitmap.c
+index 012faaa..bbde5d5 100644
+--- a/fs/ext4/bitmap.c
++++ b/fs/ext4/bitmap.c
+@@ -11,8 +11,6 @@
+ #include <linux/jbd2.h>
+ #include "ext4.h"
+ 
+-#ifdef EXT4FS_DEBUG
+-
+ static const int nibblemap[] = {4, 3, 3, 2, 3, 2, 2, 1, 3, 2, 2, 1, 2, 1, 1, 0};
+ 
+ unsigned int ext4_count_free(char *bitmap, unsigned int numchars)
+@@ -25,5 +23,3 @@ unsigned int ext4_count_free(char *bitmap, unsigned int numchars)
+ 	return sum;
+ }
+ 
+-#endif  /*  EXT4FS_DEBUG  */
+-
+diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
+index 873897c..8cb184c 100644
+--- a/fs/ext4/ext4.h
++++ b/fs/ext4/ext4.h
+@@ -1123,8 +1123,7 @@ struct ext4_sb_info {
+ 	unsigned long s_desc_per_block;	/* Number of group descriptors per block */
+ 	ext4_group_t s_groups_count;	/* Number of groups in the fs */
+ 	ext4_group_t s_blockfile_groups;/* Groups acceptable for non-extent files */
+-	unsigned long s_overhead_last;  /* Last calculated overhead */
+-	unsigned long s_blocks_last;    /* Last seen block count */
++	unsigned long s_overhead;  /* # of fs overhead clusters */
+ 	unsigned int s_cluster_ratio;	/* Number of blocks per cluster */
+ 	unsigned int s_cluster_bits;	/* log2 of s_cluster_ratio */
+ 	loff_t s_bitmap_maxbytes;	/* max bytes for bitmap files */
+@@ -1925,6 +1924,7 @@ extern int ext4_group_extend(struct super_block *sb,
+ 				ext4_fsblk_t n_blocks_count);
+ 
+ /* super.c */
++extern int ext4_calculate_overhead(struct super_block *sb);
+ extern void *ext4_kvmalloc(size_t size, gfp_t flags);
+ extern void *ext4_kvzalloc(size_t size, gfp_t flags);
+ extern void ext4_kvfree(void *ptr);
+diff --git a/fs/ext4/resize.c b/fs/ext4/resize.c
+index 996780a..4eac337 100644
+--- a/fs/ext4/resize.c
++++ b/fs/ext4/resize.c
+@@ -952,6 +952,11 @@ int ext4_group_add(struct super_block *sb, struct ext4_new_group_data *input)
+ 			   &sbi->s_flex_groups[flex_group].free_inodes);
+ 	}
+ 
++	/*
++	 * Update the fs overhead information
++	 */
++	ext4_calculate_overhead(sb);
++
+ 	ext4_handle_dirty_super(handle, sb);
+ 
+ exit_journal:
+diff --git a/fs/ext4/super.c b/fs/ext4/super.c
+index a93486e..a071348 100644
+--- a/fs/ext4/super.c
++++ b/fs/ext4/super.c
+@@ -3083,6 +3083,114 @@ static void ext4_destroy_lazyinit_thread(void)
+ 	kthread_stop(ext4_lazyinit_task);
+ }
+ 
++/*
++ * Note: calculating the overhead so we can be compatible with
++ * historical BSD practice is quite difficult in the face of
++ * clusters/bigalloc.  This is because multiple metadata blocks from
++ * different block group can end up in the same allocation cluster.
++ * Calculating the exact overhead in the face of clustered allocation
++ * requires either O(all block bitmaps) in memory or O(number of block
++ * groups**2) in time.  We will still calculate the superblock for
++ * older file systems --- and if we come across with a bigalloc file
++ * system with zero in s_overhead_clusters the estimate will be close to
++ * correct especially for very large cluster sizes --- but for newer
++ * file systems, it's better to calculate this figure once at mkfs
++ * time, and store it in the superblock.  If the superblock value is
++ * present (even for non-bigalloc file systems), we will use it.
++ */
++static int count_overhead(struct super_block *sb, ext4_group_t grp,
++			  char *buf)
++{
++	struct ext4_sb_info	*sbi = EXT4_SB(sb);
++	struct ext4_group_desc	*gdp;
++	ext4_fsblk_t		first_block, last_block, b;
++	ext4_group_t		i, ngroups = ext4_get_groups_count(sb);
++	int			s, j, count = 0;
++
++	first_block = le32_to_cpu(sbi->s_es->s_first_data_block) +
++		(grp * EXT4_BLOCKS_PER_GROUP(sb));
++	last_block = first_block + EXT4_BLOCKS_PER_GROUP(sb) - 1;
++	for (i = 0; i < ngroups; i++) {
++		gdp = ext4_get_group_desc(sb, i, NULL);
++		b = ext4_block_bitmap(sb, gdp);
++		if (b >= first_block && b <= last_block) {
++			ext4_set_bit(EXT4_B2C(sbi, b - first_block), buf);
++			count++;
++		}
++		b = ext4_inode_bitmap(sb, gdp);
++		if (b >= first_block && b <= last_block) {
++			ext4_set_bit(EXT4_B2C(sbi, b - first_block), buf);
++			count++;
++		}
++		b = ext4_inode_table(sb, gdp);
++		if (b >= first_block && b + sbi->s_itb_per_group <= last_block)
++			for (j = 0; j < sbi->s_itb_per_group; j++, b++) {
++				int c = EXT4_B2C(sbi, b - first_block);
++				ext4_set_bit(c, buf);
++				count++;
++			}
++		if (i != grp)
++			continue;
++		s = 0;
++		if (ext4_bg_has_super(sb, grp)) {
++			ext4_set_bit(s++, buf);
++			count++;
++		}
++		for (j = ext4_bg_num_gdb(sb, grp); j > 0; j--) {
++			ext4_set_bit(EXT4_B2C(sbi, s++), buf);
++			count++;
++		}
++	}
++	if (!count)
++		return 0;
++	return EXT4_CLUSTERS_PER_GROUP(sb) -
++		ext4_count_free(buf, EXT4_CLUSTERS_PER_GROUP(sb) / 8);
++}
++
++/*
++ * Compute the overhead and stash it in sbi->s_overhead
++ */
++int ext4_calculate_overhead(struct super_block *sb)
++{
++	struct ext4_sb_info *sbi = EXT4_SB(sb);
++	struct ext4_super_block *es = sbi->s_es;
++	ext4_group_t i, ngroups = ext4_get_groups_count(sb);
++	ext4_fsblk_t overhead = 0;
++	char *buf = (char *) get_zeroed_page(GFP_KERNEL);
++
++	memset(buf, 0, PAGE_SIZE);
++	if (!buf)
++		return -ENOMEM;
++
++	/*
++	 * Compute the overhead (FS structures).  This is constant
++	 * for a given filesystem unless the number of block groups
++	 * changes so we cache the previous value until it does.
++	 */
++
++	/*
++	 * All of the blocks before first_data_block are overhead
++	 */
++	overhead = EXT4_B2C(sbi, le32_to_cpu(es->s_first_data_block));
++
++	/*
++	 * Add the overhead found in each block group
++	 */
++	for (i = 0; i < ngroups; i++) {
++		int blks;
++
++		blks = count_overhead(sb, i, buf);
++		overhead += blks;
++		if (blks)
++			memset(buf, 0, PAGE_SIZE);
++		cond_resched();
++	}
++	sbi->s_overhead = overhead;
++	smp_wmb();
++	free_page((unsigned long) buf);
++	return 0;
++}
++
+ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
+ {
+ 	char *orig_data = kstrdup(data, GFP_KERNEL);
+@@ -3695,6 +3803,18 @@ static int ext4_fill_super(struct super_block *sb, void *data, int silent)
+ 
+ no_journal:
+ 	/*
++	 * Get the # of file system overhead blocks from the
++	 * superblock if present.
++	 */
++	if (es->s_overhead_clusters)
++		sbi->s_overhead = le32_to_cpu(es->s_overhead_clusters);
++	else {
++		ret = ext4_calculate_overhead(sb);
++		if (ret)
++			goto failed_mount_wq;
++	}
++
++	/*
+ 	 * The maximum number of concurrent works can be high and
+ 	 * concurrency isn't really necessary.  Limit it to 1.
+ 	 */
+@@ -4568,67 +4688,21 @@ restore_opts:
+ 	return err;
+ }
+ 
+-/*
+- * Note: calculating the overhead so we can be compatible with
+- * historical BSD practice is quite difficult in the face of
+- * clusters/bigalloc.  This is because multiple metadata blocks from
+- * different block group can end up in the same allocation cluster.
+- * Calculating the exact overhead in the face of clustered allocation
+- * requires either O(all block bitmaps) in memory or O(number of block
+- * groups**2) in time.  We will still calculate the superblock for
+- * older file systems --- and if we come across with a bigalloc file
+- * system with zero in s_overhead_clusters the estimate will be close to
+- * correct especially for very large cluster sizes --- but for newer
+- * file systems, it's better to calculate this figure once at mkfs
+- * time, and store it in the superblock.  If the superblock value is
+- * present (even for non-bigalloc file systems), we will use it.
+- */
+ static int ext4_statfs(struct dentry *dentry, struct kstatfs *buf)
+ {
+ 	struct super_block *sb = dentry->d_sb;
+ 	struct ext4_sb_info *sbi = EXT4_SB(sb);
+ 	struct ext4_super_block *es = sbi->s_es;
+-	struct ext4_group_desc *gdp;
++	ext4_fsblk_t overhead = 0;
+ 	u64 fsid;
+ 	s64 bfree;
+ 
+-	if (test_opt(sb, MINIX_DF)) {
+-		sbi->s_overhead_last = 0;
+-	} else if (es->s_overhead_clusters) {
+-		sbi->s_overhead_last = le32_to_cpu(es->s_overhead_clusters);
+-	} else if (sbi->s_blocks_last != ext4_blocks_count(es)) {
+-		ext4_group_t i, ngroups = ext4_get_groups_count(sb);
+-		ext4_fsblk_t overhead = 0;
+-
+-		/*
+-		 * Compute the overhead (FS structures).  This is constant
+-		 * for a given filesystem unless the number of block groups
+-		 * changes so we cache the previous value until it does.
+-		 */
+-
+-		/*
+-		 * All of the blocks before first_data_block are
+-		 * overhead
+-		 */
+-		overhead = EXT4_B2C(sbi, le32_to_cpu(es->s_first_data_block));
+-
+-		/*
+-		 * Add the overhead found in each block group
+-		 */
+-		for (i = 0; i < ngroups; i++) {
+-			gdp = ext4_get_group_desc(sb, i, NULL);
+-			overhead += ext4_num_overhead_clusters(sb, i, gdp);
+-			cond_resched();
+-		}
+-		sbi->s_overhead_last = overhead;
+-		smp_wmb();
+-		sbi->s_blocks_last = ext4_blocks_count(es);
+-	}
++	if (!test_opt(sb, MINIX_DF))
++		overhead = sbi->s_overhead;
+ 
+ 	buf->f_type = EXT4_SUPER_MAGIC;
+ 	buf->f_bsize = sb->s_blocksize;
+-	buf->f_blocks = (ext4_blocks_count(es) -
+-			 EXT4_C2B(sbi, sbi->s_overhead_last));
++	buf->f_blocks = ext4_blocks_count(es) - EXT4_C2B(sbi, sbi->s_overhead);
+ 	bfree = percpu_counter_sum_positive(&sbi->s_freeclusters_counter) -
+ 		percpu_counter_sum_positive(&sbi->s_dirtyclusters_counter);
+ 	/* prevent underflow in case that few free space is available */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0035-udf-Improve-table-length-check-to-avoid-possible-ove.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0035-udf-Improve-table-length-check-to-avoid-possible-ove.patch
new file mode 100644
index 0000000..2548a59
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0035-udf-Improve-table-length-check-to-avoid-possible-ove.patch
@@ -0,0 +1,36 @@
+From 27f12e5bea3378be70c81b258660fcaa44496cb4 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Tue, 10 Jul 2012 17:58:04 +0200
+Subject: [PATCH 35/73] udf: Improve table length check to avoid possible
+ overflow
+
+commit 57b9655d01ef057a523e810d29c37ac09b80eead upstream.
+
+When a partition table length is corrupted to be close to 1 << 32, the
+check for its length may overflow on 32-bit systems and we will think
+the length is valid. Later on the kernel can crash trying to read beyond
+end of buffer. Fix the check to avoid possible overflow.
+
+Reported-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/udf/super.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/fs/udf/super.c b/fs/udf/super.c
+index 270e135..516b7f0 100644
+--- a/fs/udf/super.c
++++ b/fs/udf/super.c
+@@ -1285,7 +1285,7 @@ static int udf_load_logicalvol(struct super_block *sb, sector_t block,
+ 	BUG_ON(ident != TAG_IDENT_LVD);
+ 	lvd = (struct logicalVolDesc *)bh->b_data;
+ 	table_len = le32_to_cpu(lvd->mapTableLength);
+-	if (sizeof(*lvd) + table_len > sb->s_blocksize) {
++	if (table_len > sb->s_blocksize - sizeof(*lvd)) {
+ 		udf_err(sb, "error loading logical volume descriptor: "
+ 			"Partition table too long (%u > %lu)\n", table_len,
+ 			sb->s_blocksize - sizeof(*lvd));
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0036-powerpc-Add-memory-attribute-for-mfmsr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0036-powerpc-Add-memory-attribute-for-mfmsr.patch
new file mode 100644
index 0000000..f631564
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0036-powerpc-Add-memory-attribute-for-mfmsr.patch
@@ -0,0 +1,34 @@
+From 3fed281f20c3b2cdfe1a1f087973b0c0e3b4cd05 Mon Sep 17 00:00:00 2001
+From: Tiejun Chen <tiejun.chen@windriver.com>
+Date: Wed, 11 Jul 2012 14:22:46 +1000
+Subject: [PATCH 36/73] powerpc: Add "memory" attribute for mfmsr()
+
+commit b416c9a10baae6a177b4f9ee858b8d309542fbef upstream.
+
+Add "memory" attribute in inline assembly language as a compiler
+barrier to make sure 4.6.x GCC don't reorder mfmsr().
+
+Signed-off-by: Tiejun Chen <tiejun.chen@windriver.com>
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/powerpc/include/asm/reg.h |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
+index 559da19..578e5a0 100644
+--- a/arch/powerpc/include/asm/reg.h
++++ b/arch/powerpc/include/asm/reg.h
+@@ -1016,7 +1016,8 @@
+ /* Macros for setting and retrieving special purpose registers */
+ #ifndef __ASSEMBLY__
+ #define mfmsr()		({unsigned long rval; \
+-			asm volatile("mfmsr %0" : "=r" (rval)); rval;})
++			asm volatile("mfmsr %0" : "=r" (rval) : \
++						: "memory"); rval;})
+ #ifdef CONFIG_PPC_BOOK3S_64
+ #define __mtmsrd(v, l)	asm volatile("mtmsrd %0," __stringify(l) \
+ 				     : : "r" (v) : "memory")
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0037-mwifiex-correction-in-mcs-index-check.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0037-mwifiex-correction-in-mcs-index-check.patch
new file mode 100644
index 0000000..5934302
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0037-mwifiex-correction-in-mcs-index-check.patch
@@ -0,0 +1,41 @@
+From 10c6ca210b55595833c5b18def07f077947fa88d Mon Sep 17 00:00:00 2001
+From: Amitkumar Karwar <akarwar@marvell.com>
+Date: Wed, 11 Jul 2012 18:12:57 -0700
+Subject: [PATCH 37/73] mwifiex: correction in mcs index check
+
+commit fe020120cb863ba918c6d603345342a880272c4d upstream.
+
+mwifiex driver supports 2x2 chips as well. Hence valid mcs values
+are 0 to 15. The check for mcs index is corrected in this patch.
+
+For example: if 40MHz is enabled and mcs index is 11, "iw link"
+command would show "tx bitrate: 108.0 MBit/s" without this patch.
+Now it shows "tx bitrate: 108.0 MBit/s MCS 11 40Mhz" with the patch.
+
+Signed-off-by: Amitkumar Karwar <akarwar@marvell.com>
+Signed-off-by: Bing Zhao <bzhao@marvell.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/mwifiex/cfg80211.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/mwifiex/cfg80211.c b/drivers/net/wireless/mwifiex/cfg80211.c
+index 01dcb1a..727c129 100644
+--- a/drivers/net/wireless/mwifiex/cfg80211.c
++++ b/drivers/net/wireless/mwifiex/cfg80211.c
+@@ -545,9 +545,9 @@ mwifiex_dump_station_info(struct mwifiex_private *priv,
+ 
+ 	/*
+ 	 * Bit 0 in tx_htinfo indicates that current Tx rate is 11n rate. Valid
+-	 * MCS index values for us are 0 to 7.
++	 * MCS index values for us are 0 to 15.
+ 	 */
+-	if ((priv->tx_htinfo & BIT(0)) && (priv->tx_rate < 8)) {
++	if ((priv->tx_htinfo & BIT(0)) && (priv->tx_rate < 16)) {
+ 		sinfo->txrate.mcs = priv->tx_rate;
+ 		sinfo->txrate.flags |= RATE_INFO_FLAGS_MCS;
+ 		/* 40MHz rate */
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0038-USB-option-Ignore-ZTE-Vodafone-K3570-71-net-interfac.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0038-USB-option-Ignore-ZTE-Vodafone-K3570-71-net-interfac.patch
new file mode 100644
index 0000000..34b5fe5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0038-USB-option-Ignore-ZTE-Vodafone-K3570-71-net-interfac.patch
@@ -0,0 +1,37 @@
+From 06c8b933f7ff30224a62e134cf8e5f19ee9f4975 Mon Sep 17 00:00:00 2001
+From: "Andrew Bird (Sphere Systems)" <ajb@spheresystems.co.uk>
+Date: Sun, 25 Mar 2012 00:10:28 +0000
+Subject: [PATCH 38/73] USB: option: Ignore ZTE (Vodafone) K3570/71 net
+ interfaces
+
+commit f264ddea0109bf7ce8aab920d64a637e830ace5b upstream.
+
+These interfaces need to be handled by QMI/WWAN driver
+
+Signed-off-by: Andrew Bird <ajb@spheresystems.co.uk>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/option.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 5971c95..6d97d2f 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -932,8 +932,10 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0165, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0167, 0xff, 0xff, 0xff),
+ 	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff),
++	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff),
++	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1012, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1057, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1058, 0xff, 0xff, 0xff) },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0039-USB-option-add-ZTE-MF821D.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0039-USB-option-add-ZTE-MF821D.patch
new file mode 100644
index 0000000..a9a075d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0039-USB-option-add-ZTE-MF821D.patch
@@ -0,0 +1,36 @@
+From da7998e23b2a112f2134db067ed2b1d5593113fb Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>
+Date: Thu, 12 Jul 2012 12:37:32 +0200
+Subject: [PATCH 39/73] USB: option: add ZTE MF821D
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 09110529780890804b22e997ae6b4fe3f0b3b158 upstream.
+
+Sold by O2 (telefonica germany) under the name "LTE4G"
+
+Tested-by: Thomas Schäfer <tschaefer@t-online.de>
+Signed-off-by: Bjørn Mork <bjorn@mork.no>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/usb/serial/option.c |    2 ++
+ 1 files changed, 2 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 6d97d2f..d89aac1 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -932,6 +932,8 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0165, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0167, 0xff, 0xff, 0xff),
+ 	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0326, 0xff, 0xff, 0xff),
++	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff),
+ 	  .driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0040-target-Add-generation-of-LOGICAL-BLOCK-ADDRESS-OUT-O.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0040-target-Add-generation-of-LOGICAL-BLOCK-ADDRESS-OUT-O.patch
new file mode 100644
index 0000000..9d17084
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0040-target-Add-generation-of-LOGICAL-BLOCK-ADDRESS-OUT-O.patch
@@ -0,0 +1,64 @@
+From 5d43c09da407f76f1dae2ec3ca08cb62051dea6f Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 15:34:21 -0700
+Subject: [PATCH 40/73] target: Add generation of LOGICAL BLOCK ADDRESS OUT OF
+ RANGE
+
+commit e2397c704429025bc6b331a970f699e52f34283e upstream.
+
+Many SCSI commands are defined to return a CHECK CONDITION / ILLEGAL
+REQUEST with ASC set to LOGICAL BLOCK ADDRESS OUT OF RANGE if the
+initiator sends a command that accesses a too-big LBA.  Add an enum
+value and case entries so that target code can return this status.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_transport.c |   10 ++++++++++
+ include/target/target_core_base.h      |    1 +
+ 2 files changed, 11 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
+index 5660916..94c03d2 100644
+--- a/drivers/target/target_core_transport.c
++++ b/drivers/target/target_core_transport.c
+@@ -1820,6 +1820,7 @@ static void transport_generic_request_failure(struct se_cmd *cmd)
+ 	case TCM_LOGICAL_UNIT_COMMUNICATION_FAILURE:
+ 	case TCM_UNKNOWN_MODE_PAGE:
+ 	case TCM_WRITE_PROTECTED:
++	case TCM_ADDRESS_OUT_OF_RANGE:
+ 	case TCM_CHECK_CONDITION_ABORT_CMD:
+ 	case TCM_CHECK_CONDITION_UNIT_ATTENTION:
+ 	case TCM_CHECK_CONDITION_NOT_READY:
+@@ -4496,6 +4497,15 @@ int transport_send_check_condition_and_sense(
+ 		/* WRITE PROTECTED */
+ 		buffer[offset+SPC_ASC_KEY_OFFSET] = 0x27;
+ 		break;
++	case TCM_ADDRESS_OUT_OF_RANGE:
++		/* CURRENT ERROR */
++		buffer[offset] = 0x70;
++		buffer[offset+SPC_ADD_SENSE_LEN_OFFSET] = 10;
++		/* ILLEGAL REQUEST */
++		buffer[offset+SPC_SENSE_KEY_OFFSET] = ILLEGAL_REQUEST;
++		/* LOGICAL BLOCK ADDRESS OUT OF RANGE */
++		buffer[offset+SPC_ASC_KEY_OFFSET] = 0x21;
++		break;
+ 	case TCM_CHECK_CONDITION_UNIT_ATTENTION:
+ 		/* CURRENT ERROR */
+ 		buffer[offset] = 0x70;
+diff --git a/include/target/target_core_base.h b/include/target/target_core_base.h
+index 94bbec3..6ee550e 100644
+--- a/include/target/target_core_base.h
++++ b/include/target/target_core_base.h
+@@ -157,6 +157,7 @@ enum tcm_sense_reason_table {
+ 	TCM_CHECK_CONDITION_UNIT_ATTENTION	= 0x0e,
+ 	TCM_CHECK_CONDITION_NOT_READY		= 0x0f,
+ 	TCM_RESERVATION_CONFLICT		= 0x10,
++	TCM_ADDRESS_OUT_OF_RANGE		= 0x11,
+ };
+ 
+ struct se_obj {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0041-target-Add-range-checking-to-UNMAP-emulation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0041-target-Add-range-checking-to-UNMAP-emulation.patch
new file mode 100644
index 0000000..3240467
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0041-target-Add-range-checking-to-UNMAP-emulation.patch
@@ -0,0 +1,46 @@
+From 43b1ce67a53720ba82fbe5dbf0a323ae761368bb Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 15:34:22 -0700
+Subject: [PATCH 41/73] target: Add range checking to UNMAP emulation
+
+commit 2594e29865c291db162313187612cd9f14538f33 upstream.
+
+When processing an UNMAP command, we need to make sure that the number
+of blocks we're asked to UNMAP does not exceed our reported maximum
+number of blocks per UNMAP, and that the range of blocks we're
+unmapping doesn't go past the end of the device.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+[bwh: Backported to 3.2: adjust filename, context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_cdb.c |   12 ++++++++++++
+ 1 files changed, 12 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 93b9406..45a3ed4 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -1145,6 +1145,18 @@ int target_emulate_unmap(struct se_task *task)
+ 		pr_debug("UNMAP: Using lba: %llu and range: %u\n",
+ 				 (unsigned long long)lba, range);
+ 
++		if (range > dev->se_sub_dev->se_dev_attrib.max_unmap_lba_count) {
++			cmd->scsi_sense_reason = TCM_INVALID_PARAMETER_LIST;
++			ret = -EINVAL;
++			goto err;
++		}
++
++		if (lba + range > dev->transport->get_blocks(dev) + 1) {
++			cmd->scsi_sense_reason = TCM_ADDRESS_OUT_OF_RANGE;
++			ret = -EINVAL;
++			goto err;
++		}
++
+ 		ret = dev->transport->do_discard(dev, lba, range);
+ 		if (ret < 0) {
+ 			pr_err("blkdev_issue_discard() failed: %d\n",
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0042-target-Fix-reading-of-data-length-fields-for-UNMAP-c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0042-target-Fix-reading-of-data-length-fields-for-UNMAP-c.patch
new file mode 100644
index 0000000..0102742
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0042-target-Fix-reading-of-data-length-fields-for-UNMAP-c.patch
@@ -0,0 +1,51 @@
+From b31df389ada54f5b2725826cd8d9a13ace960168 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 15:34:23 -0700
+Subject: [PATCH 42/73] target: Fix reading of data length fields for UNMAP
+ commands
+
+commit 1a5fa4576ec8a462313c7516b31d7453481ddbe8 upstream.
+
+The UNMAP DATA LENGTH and UNMAP BLOCK DESCRIPTOR DATA LENGTH fields
+are in the unmap descriptor (the payload transferred to our data out
+buffer), not in the CDB itself.  Read them from the correct place in
+target_emulated_unmap.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+[bwh: Backported to 3.2: adjust filename, context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_cdb.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 45a3ed4..b1f5cf0 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -1114,7 +1114,6 @@ int target_emulate_unmap(struct se_task *task)
+ 	struct se_cmd *cmd = task->task_se_cmd;
+ 	struct se_device *dev = cmd->se_dev;
+ 	unsigned char *buf, *ptr = NULL;
+-	unsigned char *cdb = &cmd->t_task_cdb[0];
+ 	sector_t lba;
+ 	unsigned int size = cmd->data_length, range;
+ 	int ret = 0, offset;
+@@ -1130,11 +1129,12 @@ int target_emulate_unmap(struct se_task *task)
+ 	/* First UNMAP block descriptor starts at 8 byte offset */
+ 	offset = 8;
+ 	size -= 8;
+-	dl = get_unaligned_be16(&cdb[0]);
+-	bd_dl = get_unaligned_be16(&cdb[2]);
+ 
+ 	buf = transport_kmap_data_sg(cmd);
+ 
++	dl = get_unaligned_be16(&buf[0]);
++	bd_dl = get_unaligned_be16(&buf[2]);
++
+ 	ptr = &buf[offset];
+ 	pr_debug("UNMAP: Sub: %s Using dl: %hu bd_dl: %hu size: %hu"
+ 		" ptr: %p\n", dev->transport->name, dl, bd_dl, size, ptr);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0043-target-Fix-possible-integer-underflow-in-UNMAP-emula.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0043-target-Fix-possible-integer-underflow-in-UNMAP-emula.patch
new file mode 100644
index 0000000..345d149
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0043-target-Fix-possible-integer-underflow-in-UNMAP-emula.patch
@@ -0,0 +1,75 @@
+From 8d14ccd4bd5dab58984030c13a71953d396e792d Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 15:34:24 -0700
+Subject: [PATCH 43/73] target: Fix possible integer underflow in UNMAP
+ emulation
+
+commit b7fc7f3777582dea85156a821d78a522a0c083aa upstream.
+
+It's possible for an initiator to send us an UNMAP command with a
+descriptor that is less than 8 bytes; in that case it's really bad for
+us to set an unsigned int to that value, subtract 8 from it, and then
+use that as a limit for our loop (since the value will wrap around to
+a huge positive value).
+
+Fix this by making size be signed and only looping if size >= 16 (ie
+if we have at least a full descriptor available).
+
+Also remove offset as an obfuscated name for the constant 8.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+[bwh: Backported to 3.2: adjust filename, context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_cdb.c |   20 ++++++++++----------
+ 1 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index b1f5cf0..00f0f7d 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -1115,9 +1115,10 @@ int target_emulate_unmap(struct se_task *task)
+ 	struct se_device *dev = cmd->se_dev;
+ 	unsigned char *buf, *ptr = NULL;
+ 	sector_t lba;
+-	unsigned int size = cmd->data_length, range;
+-	int ret = 0, offset;
+-	unsigned short dl, bd_dl;
++	int size = cmd->data_length;
++	u32 range;
++	int ret = 0;
++	int dl, bd_dl;
+ 
+ 	if (!dev->transport->do_discard) {
+ 		pr_err("UNMAP emulation not supported for: %s\n",
+@@ -1126,20 +1127,19 @@ int target_emulate_unmap(struct se_task *task)
+ 		return -ENOSYS;
+ 	}
+ 
+-	/* First UNMAP block descriptor starts at 8 byte offset */
+-	offset = 8;
+-	size -= 8;
+-
+ 	buf = transport_kmap_data_sg(cmd);
+ 
+ 	dl = get_unaligned_be16(&buf[0]);
+ 	bd_dl = get_unaligned_be16(&buf[2]);
+ 
+-	ptr = &buf[offset];
+-	pr_debug("UNMAP: Sub: %s Using dl: %hu bd_dl: %hu size: %hu"
++	size = min(size - 8, bd_dl);
++
++	/* First UNMAP block descriptor starts at 8 byte offset */
++	ptr = &buf[8];
++	pr_debug("UNMAP: Sub: %s Using dl: %u bd_dl: %u size: %u"
+ 		" ptr: %p\n", dev->transport->name, dl, bd_dl, size, ptr);
+ 
+-	while (size) {
++	while (size >= 16) {
+ 		lba = get_unaligned_be64(&ptr[0]);
+ 		range = get_unaligned_be32(&ptr[8]);
+ 		pr_debug("UNMAP: Using lba: %llu and range: %u\n",
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0044-target-Check-number-of-unmap-descriptors-against-our.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0044-target-Check-number-of-unmap-descriptors-against-our.patch
new file mode 100644
index 0000000..64f87f3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0044-target-Check-number-of-unmap-descriptors-against-our.patch
@@ -0,0 +1,38 @@
+From 9e2f53ebf9ec64a0999669060222a8cbfae313b2 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 16 Jul 2012 15:34:25 -0700
+Subject: [PATCH 44/73] target: Check number of unmap descriptors against our
+ limit
+
+commit 7409a6657aebf8be74c21d0eded80709b27275cb upstream.
+
+Fail UNMAP commands that have more than our reported limit on unmap
+descriptors.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+[bwh: Backported to 3.2: adjust filename]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/target_core_cdb.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 00f0f7d..717a8d4 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -1133,6 +1133,11 @@ int target_emulate_unmap(struct se_task *task)
+ 	bd_dl = get_unaligned_be16(&buf[2]);
+ 
+ 	size = min(size - 8, bd_dl);
++	if (size / 16 > dev->se_sub_dev->se_dev_attrib.max_unmap_block_desc_count) {
++		cmd->scsi_sense_reason = TCM_INVALID_PARAMETER_LIST;
++		ret = -EINVAL;
++		goto err;
++	}
+ 
+ 	/* First UNMAP block descriptor starts at 8 byte offset */
+ 	ptr = &buf[8];
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0045-s390-idle-fix-sequence-handling-vs-cpu-hotplug.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0045-s390-idle-fix-sequence-handling-vs-cpu-hotplug.patch
new file mode 100644
index 0000000..445cbc5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0045-s390-idle-fix-sequence-handling-vs-cpu-hotplug.patch
@@ -0,0 +1,80 @@
+From 9385ba7e09e3360516f2b3c78c7d8f233dd1119f Mon Sep 17 00:00:00 2001
+From: Heiko Carstens <heiko.carstens@de.ibm.com>
+Date: Fri, 13 Jul 2012 15:45:33 +0200
+Subject: [PATCH 45/73] s390/idle: fix sequence handling vs cpu hotplug
+
+commit 0008204ffe85d23382d6fd0f971f3f0fbe70bae2 upstream.
+
+The s390 idle accounting code uses a sequence counter which gets used
+when the per cpu idle statistics get updated and read.
+
+One assumption on read access is that only when the sequence counter is
+even and did not change while reading all values the result is valid.
+On cpu hotplug however the per cpu data structure gets initialized via
+a cpu hotplug notifier on CPU_ONLINE.
+CPU_ONLINE however is too late, since the onlined cpu is already running
+and might access the per cpu data. Worst case is that the data structure
+gets initialized while an idle thread is updating its idle statistics.
+This will result in an uneven sequence counter after an update.
+
+As a result user space tools like top, which access /proc/stat in order
+to get idle stats, will busy loop waiting for the sequence counter to
+become even again, which will never happen until the queried cpu will
+update its idle statistics again. And even then the sequence counter
+will only have an even value for a couple of cpu cycles.
+
+Fix this by moving the initialization of the per cpu idle statistics
+to cpu_init(). I prefer that solution in favor of changing the
+notifier to CPU_UP_PREPARE, which would be a different solution to
+the problem.
+
+Signed-off-by: Heiko Carstens <heiko.carstens@de.ibm.com>
+Signed-off-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ arch/s390/kernel/processor.c |    2 ++
+ arch/s390/kernel/smp.c       |    3 ---
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/arch/s390/kernel/processor.c b/arch/s390/kernel/processor.c
+index 6e0073e..07c7bf4 100644
+--- a/arch/s390/kernel/processor.c
++++ b/arch/s390/kernel/processor.c
+@@ -26,12 +26,14 @@ static DEFINE_PER_CPU(struct cpuid, cpu_id);
+ void __cpuinit cpu_init(void)
+ {
+ 	struct cpuid *id = &per_cpu(cpu_id, smp_processor_id());
++	struct s390_idle_data *idle = &__get_cpu_var(s390_idle);
+ 
+ 	get_cpu_id(id);
+ 	atomic_inc(&init_mm.mm_count);
+ 	current->active_mm = &init_mm;
+ 	BUG_ON(current->mm);
+ 	enter_lazy_tlb(&init_mm, current);
++	memset(idle, 0, sizeof(*idle));
+ }
+ 
+ /*
+diff --git a/arch/s390/kernel/smp.c b/arch/s390/kernel/smp.c
+index 3ea8728..1df64a8 100644
+--- a/arch/s390/kernel/smp.c
++++ b/arch/s390/kernel/smp.c
+@@ -1020,14 +1020,11 @@ static int __cpuinit smp_cpu_notify(struct notifier_block *self,
+ 	unsigned int cpu = (unsigned int)(long)hcpu;
+ 	struct cpu *c = &per_cpu(cpu_devices, cpu);
+ 	struct sys_device *s = &c->sysdev;
+-	struct s390_idle_data *idle;
+ 	int err = 0;
+ 
+ 	switch (action) {
+ 	case CPU_ONLINE:
+ 	case CPU_ONLINE_FROZEN:
+-		idle = &per_cpu(s390_idle, cpu);
+-		memset(idle, 0, sizeof(struct s390_idle_data));
+ 		err = sysfs_create_group(&s->kobj, &cpu_online_attr_group);
+ 		break;
+ 	case CPU_DEAD:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0046-rtlwifi-rtl8192de-Fix-phy-based-version-calculation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0046-rtlwifi-rtl8192de-Fix-phy-based-version-calculation.patch
new file mode 100644
index 0000000..e52f4d7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0046-rtlwifi-rtl8192de-Fix-phy-based-version-calculation.patch
@@ -0,0 +1,61 @@
+From fccb712c5ec20bb379e0c57e6a8b286e117ee2db Mon Sep 17 00:00:00 2001
+From: Forest Bond <forest.bond@rapidrollout.com>
+Date: Fri, 13 Jul 2012 12:26:06 -0400
+Subject: [PATCH 46/73] rtlwifi: rtl8192de: Fix phy-based version calculation
+
+commit f1b00f4dab29b57bdf1bc03ef12020b280fd2a72 upstream.
+
+Commit d83579e2a50ac68389e6b4c58b845c702cf37516 incorporated some
+changes from the vendor driver that made it newly important that the
+calculated hardware version correctly include the CHIP_92D bit, as all
+of the IS_92D_* macros were changed to depend on it.  However, this bit
+was being unset for dual-mac, dual-phy devices.  The vendor driver
+behavior was modified to not do this, but unfortunately this change was
+not picked up along with the others.  This caused scanning in the 2.4GHz
+band to be broken, and possibly other bugs as well.
+
+This patch brings the version calculation logic in parity with the
+vendor driver in this regard, and in doing so fixes the regression.
+However, the version calculation code in general continues to be largely
+incoherent and messy, and needs to be cleaned up.
+
+Signed-off-by: Forest Bond <forest.bond@rapidrollout.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/net/wireless/rtlwifi/rtl8192de/phy.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/net/wireless/rtlwifi/rtl8192de/phy.c b/drivers/net/wireless/rtlwifi/rtl8192de/phy.c
+index 2cf4c5f..de9faa9 100644
+--- a/drivers/net/wireless/rtlwifi/rtl8192de/phy.c
++++ b/drivers/net/wireless/rtlwifi/rtl8192de/phy.c
+@@ -3462,21 +3462,21 @@ void rtl92d_phy_config_macphymode_info(struct ieee80211_hw *hw)
+ 	switch (rtlhal->macphymode) {
+ 	case DUALMAC_SINGLEPHY:
+ 		rtlphy->rf_type = RF_2T2R;
+-		rtlhal->version |= CHIP_92D_SINGLEPHY;
++		rtlhal->version |= RF_TYPE_2T2R;
+ 		rtlhal->bandset = BAND_ON_BOTH;
+ 		rtlhal->current_bandtype = BAND_ON_2_4G;
+ 		break;
+ 
+ 	case SINGLEMAC_SINGLEPHY:
+ 		rtlphy->rf_type = RF_2T2R;
+-		rtlhal->version |= CHIP_92D_SINGLEPHY;
++		rtlhal->version |= RF_TYPE_2T2R;
+ 		rtlhal->bandset = BAND_ON_BOTH;
+ 		rtlhal->current_bandtype = BAND_ON_2_4G;
+ 		break;
+ 
+ 	case DUALMAC_DUALPHY:
+ 		rtlphy->rf_type = RF_1T1R;
+-		rtlhal->version &= (~CHIP_92D_SINGLEPHY);
++		rtlhal->version &= RF_TYPE_1T1R;
+ 		/* Now we let MAC0 run on 5G band. */
+ 		if (rtlhal->interfaceindex == 0) {
+ 			rtlhal->bandset = BAND_ON_5G;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0047-workqueue-perform-cpu-down-operations-from-low-prior.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0047-workqueue-perform-cpu-down-operations-from-low-prior.patch
new file mode 100644
index 0000000..772eafb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0047-workqueue-perform-cpu-down-operations-from-low-prior.patch
@@ -0,0 +1,120 @@
+From 47ba7731c120a3ed09336d18b85493bd85d926f2 Mon Sep 17 00:00:00 2001
+From: Tejun Heo <tj@kernel.org>
+Date: Tue, 17 Jul 2012 12:39:26 -0700
+Subject: [PATCH 47/73] workqueue: perform cpu down operations from low
+ priority cpu_notifier()
+
+commit 6575820221f7a4dd6eadecf7bf83cdd154335eda upstream.
+
+Currently, all workqueue cpu hotplug operations run off
+CPU_PRI_WORKQUEUE which is higher than normal notifiers.  This is to
+ensure that workqueue is up and running while bringing up a CPU before
+other notifiers try to use workqueue on the CPU.
+
+Per-cpu workqueues are supposed to remain working and bound to the CPU
+for normal CPU_DOWN_PREPARE notifiers.  This holds mostly true even
+with workqueue offlining running with higher priority because
+workqueue CPU_DOWN_PREPARE only creates a bound trustee thread which
+runs the per-cpu workqueue without concurrency management without
+explicitly detaching the existing workers.
+
+However, if the trustee needs to create new workers, it creates
+unbound workers which may wander off to other CPUs while
+CPU_DOWN_PREPARE notifiers are in progress.  Furthermore, if the CPU
+down is cancelled, the per-CPU workqueue may end up with workers which
+aren't bound to the CPU.
+
+While reliably reproducible with a convoluted artificial test-case
+involving scheduling and flushing CPU burning work items from CPU down
+notifiers, this isn't very likely to happen in the wild, and, even
+when it happens, the effects are likely to be hidden by the following
+successful CPU down.
+
+Fix it by using different priorities for up and down notifiers - high
+priority for up operations and low priority for down operations.
+
+Workqueue cpu hotplug operations will soon go through further cleanup.
+
+Signed-off-by: Tejun Heo <tj@kernel.org>
+Acked-by: "Rafael J. Wysocki" <rjw@sisk.pl>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ include/linux/cpu.h |    5 +++--
+ kernel/workqueue.c  |   38 +++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 40 insertions(+), 3 deletions(-)
+
+diff --git a/include/linux/cpu.h b/include/linux/cpu.h
+index 6cb60fd..c692acc 100644
+--- a/include/linux/cpu.h
++++ b/include/linux/cpu.h
+@@ -66,8 +66,9 @@ enum {
+ 	/* migration should happen before other stuff but after perf */
+ 	CPU_PRI_PERF		= 20,
+ 	CPU_PRI_MIGRATION	= 10,
+-	/* prepare workqueues for other notifiers */
+-	CPU_PRI_WORKQUEUE	= 5,
++	/* bring up workqueues before normal notifiers and down after */
++	CPU_PRI_WORKQUEUE_UP	= 5,
++	CPU_PRI_WORKQUEUE_DOWN	= -5,
+ };
+ 
+ #define CPU_ONLINE		0x0002 /* CPU (unsigned)v is up */
+diff --git a/kernel/workqueue.c b/kernel/workqueue.c
+index 7947e16..a650bee 100644
+--- a/kernel/workqueue.c
++++ b/kernel/workqueue.c
+@@ -3586,6 +3586,41 @@ static int __devinit workqueue_cpu_callback(struct notifier_block *nfb,
+ 	return notifier_from_errno(0);
+ }
+ 
++/*
++ * Workqueues should be brought up before normal priority CPU notifiers.
++ * This will be registered high priority CPU notifier.
++ */
++static int __devinit workqueue_cpu_up_callback(struct notifier_block *nfb,
++					       unsigned long action,
++					       void *hcpu)
++{
++	switch (action & ~CPU_TASKS_FROZEN) {
++	case CPU_UP_PREPARE:
++	case CPU_UP_CANCELED:
++	case CPU_DOWN_FAILED:
++	case CPU_ONLINE:
++		return workqueue_cpu_callback(nfb, action, hcpu);
++	}
++	return NOTIFY_OK;
++}
++
++/*
++ * Workqueues should be brought down after normal priority CPU notifiers.
++ * This will be registered as low priority CPU notifier.
++ */
++static int __devinit workqueue_cpu_down_callback(struct notifier_block *nfb,
++						 unsigned long action,
++						 void *hcpu)
++{
++	switch (action & ~CPU_TASKS_FROZEN) {
++	case CPU_DOWN_PREPARE:
++	case CPU_DYING:
++	case CPU_POST_DEAD:
++		return workqueue_cpu_callback(nfb, action, hcpu);
++	}
++	return NOTIFY_OK;
++}
++
+ #ifdef CONFIG_SMP
+ 
+ struct work_for_cpu {
+@@ -3779,7 +3814,8 @@ static int __init init_workqueues(void)
+ 	unsigned int cpu;
+ 	int i;
+ 
+-	cpu_notifier(workqueue_cpu_callback, CPU_PRI_WORKQUEUE);
++	cpu_notifier(workqueue_cpu_up_callback, CPU_PRI_WORKQUEUE_UP);
++	cpu_notifier(workqueue_cpu_down_callback, CPU_PRI_WORKQUEUE_DOWN);
+ 
+ 	/* initialize gcwqs */
+ 	for_each_gcwq_cpu(cpu) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0048-ALSA-hda-Add-support-for-Realtek-ALC282.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0048-ALSA-hda-Add-support-for-Realtek-ALC282.patch
new file mode 100644
index 0000000..cabf58f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0048-ALSA-hda-Add-support-for-Realtek-ALC282.patch
@@ -0,0 +1,34 @@
+From 1438a7338f8ea623f9cfc21c6201ad48273caf12 Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Wed, 18 Jul 2012 07:38:46 +0200
+Subject: [PATCH 48/73] ALSA: hda - Add support for Realtek ALC282
+
+commit 4e01ec636e64707d202a1ca21a47bbc6d53085b7 upstream.
+
+This codec has a separate dmic path (separate dmic only ADC),
+and thus it looks mostly like ALC275.
+
+BugLink: https://bugs.launchpad.net/bugs/1025377
+Tested-by: Ray Chen <ray.chen@canonical.com>
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_realtek.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 5f096a5..191fd78 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -5989,6 +5989,7 @@ static const struct hda_codec_preset snd_hda_preset_realtek[] = {
+ 	{ .id = 0x10ec0275, .name = "ALC275", .patch = patch_alc269 },
+ 	{ .id = 0x10ec0276, .name = "ALC276", .patch = patch_alc269 },
+ 	{ .id = 0x10ec0280, .name = "ALC280", .patch = patch_alc269 },
++	{ .id = 0x10ec0282, .name = "ALC282", .patch = patch_alc269 },
+ 	{ .id = 0x10ec0861, .rev = 0x100340, .name = "ALC660",
+ 	  .patch = patch_alc861 },
+ 	{ .id = 0x10ec0660, .name = "ALC660-VD", .patch = patch_alc861vd },
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0049-iommu-amd-Fix-hotplug-with-iommu-pt.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0049-iommu-amd-Fix-hotplug-with-iommu-pt.patch
new file mode 100644
index 0000000..879ea87
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0049-iommu-amd-Fix-hotplug-with-iommu-pt.patch
@@ -0,0 +1,48 @@
+From 05f62dd05ef7d48fc3f9a778a5413ebcc8dc681f Mon Sep 17 00:00:00 2001
+From: Joerg Roedel <joerg.roedel@amd.com>
+Date: Thu, 19 Jul 2012 13:42:54 +0200
+Subject: [PATCH 49/73] iommu/amd: Fix hotplug with iommu=pt
+
+commit 2c9195e990297068d0f1f1bd8e2f1d09538009da upstream.
+
+This did not work because devices are not put into the
+pt_domain. Fix this.
+
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+[bwh: Backported to 3.2: do not use iommu_dev_data::passthrough]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/iommu/amd_iommu.c |   10 ++++++----
+ 1 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
+index a1b8caa..0f074e0 100644
+--- a/drivers/iommu/amd_iommu.c
++++ b/drivers/iommu/amd_iommu.c
+@@ -1865,6 +1865,11 @@ static int device_change_notifier(struct notifier_block *nb,
+ 
+ 		iommu_init_device(dev);
+ 
++		if (iommu_pass_through) {
++			attach_device(dev, pt_domain);
++			break;
++		}
++
+ 		domain = domain_for_device(dev);
+ 
+ 		/* allocate a protection domain if a device is added */
+@@ -1880,10 +1885,7 @@ static int device_change_notifier(struct notifier_block *nb,
+ 		list_add_tail(&dma_domain->list, &iommu_pd_list);
+ 		spin_unlock_irqrestore(&iommu_pd_list_lock, flags);
+ 
+-		if (!iommu_pass_through)
+-			dev->archdata.dma_ops = &amd_iommu_dma_ops;
+-		else
+-			dev->archdata.dma_ops = &nommu_dma_ops;
++		dev->archdata.dma_ops = &amd_iommu_dma_ops;
+ 
+ 		break;
+ 	case BUS_NOTIFY_DEL_DEVICE:
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0050-drm-radeon-Try-harder-to-avoid-HW-cursor-ending-on-a.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0050-drm-radeon-Try-harder-to-avoid-HW-cursor-ending-on-a.patch
new file mode 100644
index 0000000..7b500ec
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0050-drm-radeon-Try-harder-to-avoid-HW-cursor-ending-on-a.patch
@@ -0,0 +1,50 @@
+From c5666fb07de9499337e69ebde032d9cbcad7e418 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>
+Date: Tue, 17 Jul 2012 19:02:09 +0200
+Subject: [PATCH 50/73] drm/radeon: Try harder to avoid HW cursor ending on a
+ multiple of 128 columns.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit f60ec4c7df043df81e62891ac45383d012afe0da upstream.
+
+This could previously fail if either of the enabled displays was using a
+horizontal resolution that is a multiple of 128, and only the leftmost column
+of the cursor was (supposed to be) visible at the right edge of that display.
+
+The solution is to move the cursor one pixel to the left in that case.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=33183
+
+Signed-off-by: Michel Dänzer <michel.daenzer@amd.com>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/radeon_cursor.c |    8 +++++++-
+ 1 files changed, 7 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_cursor.c b/drivers/gpu/drm/radeon/radeon_cursor.c
+index 986d608..2132109 100644
+--- a/drivers/gpu/drm/radeon/radeon_cursor.c
++++ b/drivers/gpu/drm/radeon/radeon_cursor.c
+@@ -257,8 +257,14 @@ int radeon_crtc_cursor_move(struct drm_crtc *crtc,
+ 				if (!(cursor_end & 0x7f))
+ 					w--;
+ 			}
+-			if (w <= 0)
++			if (w <= 0) {
+ 				w = 1;
++				cursor_end = x - xorigin + w;
++				if (!(cursor_end & 0x7f)) {
++					x--;
++					WARN_ON_ONCE(x < 0);
++				}
++			}
+ 		}
+ 	}
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0051-ALSA-hda-Turn-on-PIN_OUT-from-hdmi-playback-prepare.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0051-ALSA-hda-Turn-on-PIN_OUT-from-hdmi-playback-prepare.patch
new file mode 100644
index 0000000..fce7514
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0051-ALSA-hda-Turn-on-PIN_OUT-from-hdmi-playback-prepare.patch
@@ -0,0 +1,66 @@
+From d9c222f79d4fa6da0c113afe452968a2f0d226f4 Mon Sep 17 00:00:00 2001
+From: Dylan Reid <dgreid@chromium.org>
+Date: Thu, 19 Jul 2012 17:52:58 -0700
+Subject: [PATCH 51/73] ALSA: hda - Turn on PIN_OUT from hdmi playback
+ prepare.
+
+commit 9e76e6d031482194a5b24d8e9ab88063fbd6b4b5 upstream.
+
+Turn on the pin widget's PIN_OUT bit from playback prepare. The pin is
+enabled in open, but is disabled in hdmi_init_pin which is called during
+system resume.  This causes a system suspend/resume during playback to
+mute HDMI/DP. Enabling the pin in prepare instead of open allows calling
+snd_pcm_prepare after a system resume to restore audio.
+
+Signed-off-by: Dylan Reid <dgreid@chromium.org>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/pci/hda/patch_hdmi.c |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
+index c505fd5..c119f33 100644
+--- a/sound/pci/hda/patch_hdmi.c
++++ b/sound/pci/hda/patch_hdmi.c
+@@ -868,7 +868,6 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
+ 	struct hdmi_spec_per_pin *per_pin;
+ 	struct hdmi_eld *eld;
+ 	struct hdmi_spec_per_cvt *per_cvt = NULL;
+-	int pinctl;
+ 
+ 	/* Validate hinfo */
+ 	pin_idx = hinfo_to_pin_index(spec, hinfo);
+@@ -904,11 +903,6 @@ static int hdmi_pcm_open(struct hda_pcm_stream *hinfo,
+ 	snd_hda_codec_write(codec, per_pin->pin_nid, 0,
+ 			    AC_VERB_SET_CONNECT_SEL,
+ 			    mux_idx);
+-	pinctl = snd_hda_codec_read(codec, per_pin->pin_nid, 0,
+-				    AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
+-	snd_hda_codec_write(codec, per_pin->pin_nid, 0,
+-			    AC_VERB_SET_PIN_WIDGET_CONTROL,
+-			    pinctl | PIN_OUT);
+ 	snd_hda_spdif_ctls_assign(codec, pin_idx, per_cvt->cvt_nid);
+ 
+ 	/* Initially set the converter's capabilities */
+@@ -1147,11 +1141,17 @@ static int generic_hdmi_playback_pcm_prepare(struct hda_pcm_stream *hinfo,
+ 	struct hdmi_spec *spec = codec->spec;
+ 	int pin_idx = hinfo_to_pin_index(spec, hinfo);
+ 	hda_nid_t pin_nid = spec->pins[pin_idx].pin_nid;
++	int pinctl;
+ 
+ 	hdmi_set_channel_count(codec, cvt_nid, substream->runtime->channels);
+ 
+ 	hdmi_setup_audio_infoframe(codec, pin_idx, substream);
+ 
++	pinctl = snd_hda_codec_read(codec, pin_nid, 0,
++				    AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
++	snd_hda_codec_write(codec, pin_nid, 0,
++			    AC_VERB_SET_PIN_WIDGET_CONTROL, pinctl | PIN_OUT);
++
+ 	return hdmi_setup_stream(codec, cvt_nid, pin_nid, stream_tag, format);
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0052-block-add-blk_queue_dead.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0052-block-add-blk_queue_dead.patch
new file mode 100644
index 0000000..d9de19d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0052-block-add-blk_queue_dead.patch
@@ -0,0 +1,140 @@
+From 964e5928138f09dc58d9d507ce51a6adccfdb7e0 Mon Sep 17 00:00:00 2001
+From: Tejun Heo <tj@kernel.org>
+Date: Wed, 14 Dec 2011 00:33:37 +0100
+Subject: [PATCH 52/73] block: add blk_queue_dead()
+
+commit 34f6055c80285e4efb3f602a9119db75239744dc upstream.
+
+There are a number of QUEUE_FLAG_DEAD tests.  Add blk_queue_dead()
+macro and use it.
+
+This patch doesn't introduce any functional difference.
+
+Signed-off-by: Tejun Heo <tj@kernel.org>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ block/blk-core.c       |    6 +++---
+ block/blk-exec.c       |    2 +-
+ block/blk-sysfs.c      |    4 ++--
+ block/blk-throttle.c   |    4 ++--
+ block/blk.h            |    2 +-
+ include/linux/blkdev.h |    1 +
+ 6 files changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/block/blk-core.c b/block/blk-core.c
+index 15de223..49d9e91 100644
+--- a/block/blk-core.c
++++ b/block/blk-core.c
+@@ -607,7 +607,7 @@ EXPORT_SYMBOL(blk_init_allocated_queue);
+ 
+ int blk_get_queue(struct request_queue *q)
+ {
+-	if (likely(!test_bit(QUEUE_FLAG_DEAD, &q->queue_flags))) {
++	if (likely(!blk_queue_dead(q))) {
+ 		kobject_get(&q->kobj);
+ 		return 0;
+ 	}
+@@ -754,7 +754,7 @@ static struct request *get_request(struct request_queue *q, int rw_flags,
+ 	const bool is_sync = rw_is_sync(rw_flags) != 0;
+ 	int may_queue;
+ 
+-	if (unlikely(test_bit(QUEUE_FLAG_DEAD, &q->queue_flags)))
++	if (unlikely(blk_queue_dead(q)))
+ 		return NULL;
+ 
+ 	may_queue = elv_may_queue(q, rw_flags);
+@@ -874,7 +874,7 @@ static struct request *get_request_wait(struct request_queue *q, int rw_flags,
+ 		struct io_context *ioc;
+ 		struct request_list *rl = &q->rq;
+ 
+-		if (unlikely(test_bit(QUEUE_FLAG_DEAD, &q->queue_flags)))
++		if (unlikely(blk_queue_dead(q)))
+ 			return NULL;
+ 
+ 		prepare_to_wait_exclusive(&rl->wait[is_sync], &wait,
+diff --git a/block/blk-exec.c b/block/blk-exec.c
+index a1ebceb..6053285 100644
+--- a/block/blk-exec.c
++++ b/block/blk-exec.c
+@@ -50,7 +50,7 @@ void blk_execute_rq_nowait(struct request_queue *q, struct gendisk *bd_disk,
+ {
+ 	int where = at_head ? ELEVATOR_INSERT_FRONT : ELEVATOR_INSERT_BACK;
+ 
+-	if (unlikely(test_bit(QUEUE_FLAG_DEAD, &q->queue_flags))) {
++	if (unlikely(blk_queue_dead(q))) {
+ 		rq->errors = -ENXIO;
+ 		if (rq->end_io)
+ 			rq->end_io(rq, rq->errors);
+diff --git a/block/blk-sysfs.c b/block/blk-sysfs.c
+index e7f9f65..f0b2ca8 100644
+--- a/block/blk-sysfs.c
++++ b/block/blk-sysfs.c
+@@ -425,7 +425,7 @@ queue_attr_show(struct kobject *kobj, struct attribute *attr, char *page)
+ 	if (!entry->show)
+ 		return -EIO;
+ 	mutex_lock(&q->sysfs_lock);
+-	if (test_bit(QUEUE_FLAG_DEAD, &q->queue_flags)) {
++	if (blk_queue_dead(q)) {
+ 		mutex_unlock(&q->sysfs_lock);
+ 		return -ENOENT;
+ 	}
+@@ -447,7 +447,7 @@ queue_attr_store(struct kobject *kobj, struct attribute *attr,
+ 
+ 	q = container_of(kobj, struct request_queue, kobj);
+ 	mutex_lock(&q->sysfs_lock);
+-	if (test_bit(QUEUE_FLAG_DEAD, &q->queue_flags)) {
++	if (blk_queue_dead(q)) {
+ 		mutex_unlock(&q->sysfs_lock);
+ 		return -ENOENT;
+ 	}
+diff --git a/block/blk-throttle.c b/block/blk-throttle.c
+index 4553245..5eed6a7 100644
+--- a/block/blk-throttle.c
++++ b/block/blk-throttle.c
+@@ -310,7 +310,7 @@ static struct throtl_grp * throtl_get_tg(struct throtl_data *td)
+ 	struct request_queue *q = td->queue;
+ 
+ 	/* no throttling for dead queue */
+-	if (unlikely(test_bit(QUEUE_FLAG_DEAD, &q->queue_flags)))
++	if (unlikely(blk_queue_dead(q)))
+ 		return NULL;
+ 
+ 	rcu_read_lock();
+@@ -335,7 +335,7 @@ static struct throtl_grp * throtl_get_tg(struct throtl_data *td)
+ 	spin_lock_irq(q->queue_lock);
+ 
+ 	/* Make sure @q is still alive */
+-	if (unlikely(test_bit(QUEUE_FLAG_DEAD, &q->queue_flags))) {
++	if (unlikely(blk_queue_dead(q))) {
+ 		kfree(tg);
+ 		return NULL;
+ 	}
+diff --git a/block/blk.h b/block/blk.h
+index 3f6551b..e38691d 100644
+--- a/block/blk.h
++++ b/block/blk.h
+@@ -85,7 +85,7 @@ static inline struct request *__elv_next_request(struct request_queue *q)
+ 			q->flush_queue_delayed = 1;
+ 			return NULL;
+ 		}
+-		if (test_bit(QUEUE_FLAG_DEAD, &q->queue_flags) ||
++		if (unlikely(blk_queue_dead(q)) ||
+ 		    !q->elevator->ops->elevator_dispatch_fn(q, 0))
+ 			return NULL;
+ 	}
+diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
+index 0ed1eb0..ff039f0 100644
+--- a/include/linux/blkdev.h
++++ b/include/linux/blkdev.h
+@@ -481,6 +481,7 @@ static inline void queue_flag_clear(unsigned int flag, struct request_queue *q)
+ 
+ #define blk_queue_tagged(q)	test_bit(QUEUE_FLAG_QUEUED, &(q)->queue_flags)
+ #define blk_queue_stopped(q)	test_bit(QUEUE_FLAG_STOPPED, &(q)->queue_flags)
++#define blk_queue_dead(q)	test_bit(QUEUE_FLAG_DEAD, &(q)->queue_flags)
+ #define blk_queue_nomerges(q)	test_bit(QUEUE_FLAG_NOMERGES, &(q)->queue_flags)
+ #define blk_queue_noxmerges(q)	\
+ 	test_bit(QUEUE_FLAG_NOXMERGES, &(q)->queue_flags)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0053-Fix-device-removal-NULL-pointer-dereference.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0053-Fix-device-removal-NULL-pointer-dereference.patch
new file mode 100644
index 0000000..6cf674e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0053-Fix-device-removal-NULL-pointer-dereference.patch
@@ -0,0 +1,163 @@
+From 494efb27e48c4689686b72d1490e9f44fcbd08e8 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Fri, 29 Jun 2012 15:33:22 +0000
+Subject: [PATCH 53/73] Fix device removal NULL pointer dereference
+
+commit 67bd94130015c507011af37858989b199c52e1de upstream.
+
+Use blk_queue_dead() to test whether the queue is dead instead
+of !sdev. Since scsi_prep_fn() may be invoked concurrently with
+__scsi_remove_device(), keep the queuedata (sdev) pointer in
+__scsi_remove_device(). This patch fixes a kernel oops that
+can be triggered by USB device removal. See also
+http://www.spinics.net/lists/linux-scsi/msg56254.html.
+
+Other changes included in this patch:
+- Swap the blk_cleanup_queue() and kfree() calls in
+  scsi_host_dev_release() to make that code easier to grasp.
+- Remove the queue dead check from scsi_run_queue() since the
+  queue state can change anyway at any point in that function
+  where the queue lock is not held.
+- Remove the queue dead check from the start of scsi_request_fn()
+  since it is redundant with the scsi_device_online() check.
+
+Reported-by: Jun'ichi Nomura <j-nomura@ce.jp.nec.com>
+Signed-off-by: Bart Van Assche <bvanassche@acm.org>
+Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
+Reviewed-by: Tejun Heo <tj@kernel.org>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/hosts.c      |    7 ++++---
+ drivers/scsi/scsi_lib.c   |   32 ++++----------------------------
+ drivers/scsi/scsi_priv.h  |    1 -
+ drivers/scsi/scsi_sysfs.c |    5 +----
+ 4 files changed, 9 insertions(+), 36 deletions(-)
+
+diff --git a/drivers/scsi/hosts.c b/drivers/scsi/hosts.c
+index 351dc0b..ee77a58 100644
+--- a/drivers/scsi/hosts.c
++++ b/drivers/scsi/hosts.c
+@@ -287,6 +287,7 @@ static void scsi_host_dev_release(struct device *dev)
+ 	struct Scsi_Host *shost = dev_to_shost(dev);
+ 	struct device *parent = dev->parent;
+ 	struct request_queue *q;
++	void *queuedata;
+ 
+ 	scsi_proc_hostdir_rm(shost->hostt);
+ 
+@@ -296,9 +297,9 @@ static void scsi_host_dev_release(struct device *dev)
+ 		destroy_workqueue(shost->work_q);
+ 	q = shost->uspace_req_q;
+ 	if (q) {
+-		kfree(q->queuedata);
+-		q->queuedata = NULL;
+-		scsi_free_queue(q);
++		queuedata = q->queuedata;
++		blk_cleanup_queue(q);
++		kfree(queuedata);
+ 	}
+ 
+ 	scsi_destroy_command_freelist(shost);
+diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
+index f0ab58e..4f68ba6 100644
+--- a/drivers/scsi/scsi_lib.c
++++ b/drivers/scsi/scsi_lib.c
+@@ -406,10 +406,6 @@ static void scsi_run_queue(struct request_queue *q)
+ 	LIST_HEAD(starved_list);
+ 	unsigned long flags;
+ 
+-	/* if the device is dead, sdev will be NULL, so no queue to run */
+-	if (!sdev)
+-		return;
+-
+ 	shost = sdev->host;
+ 	if (scsi_target(sdev)->single_lun)
+ 		scsi_single_lun_run(sdev);
+@@ -1374,16 +1370,16 @@ static inline int scsi_host_queue_ready(struct request_queue *q,
+  * may be changed after request stacking drivers call the function,
+  * regardless of taking lock or not.
+  *
+- * When scsi can't dispatch I/Os anymore and needs to kill I/Os
+- * (e.g. !sdev), scsi needs to return 'not busy'.
+- * Otherwise, request stacking drivers may hold requests forever.
++ * When scsi can't dispatch I/Os anymore and needs to kill I/Os scsi
++ * needs to return 'not busy'. Otherwise, request stacking drivers
++ * may hold requests forever.
+  */
+ static int scsi_lld_busy(struct request_queue *q)
+ {
+ 	struct scsi_device *sdev = q->queuedata;
+ 	struct Scsi_Host *shost;
+ 
+-	if (!sdev)
++	if (blk_queue_dead(q))
+ 		return 0;
+ 
+ 	shost = sdev->host;
+@@ -1494,12 +1490,6 @@ static void scsi_request_fn(struct request_queue *q)
+ 	struct scsi_cmnd *cmd;
+ 	struct request *req;
+ 
+-	if (!sdev) {
+-		while ((req = blk_peek_request(q)) != NULL)
+-			scsi_kill_request(req, q);
+-		return;
+-	}
+-
+ 	if(!get_device(&sdev->sdev_gendev))
+ 		/* We must be tearing the block queue down already */
+ 		return;
+@@ -1701,20 +1691,6 @@ struct request_queue *scsi_alloc_queue(struct scsi_device *sdev)
+ 	return q;
+ }
+ 
+-void scsi_free_queue(struct request_queue *q)
+-{
+-	unsigned long flags;
+-
+-	WARN_ON(q->queuedata);
+-
+-	/* cause scsi_request_fn() to kill all non-finished requests */
+-	spin_lock_irqsave(q->queue_lock, flags);
+-	q->request_fn(q);
+-	spin_unlock_irqrestore(q->queue_lock, flags);
+-
+-	blk_cleanup_queue(q);
+-}
+-
+ /*
+  * Function:    scsi_block_requests()
+  *
+diff --git a/drivers/scsi/scsi_priv.h b/drivers/scsi/scsi_priv.h
+index 5b475d0..d58adca 100644
+--- a/drivers/scsi/scsi_priv.h
++++ b/drivers/scsi/scsi_priv.h
+@@ -85,7 +85,6 @@ extern void scsi_next_command(struct scsi_cmnd *cmd);
+ extern void scsi_io_completion(struct scsi_cmnd *, unsigned int);
+ extern void scsi_run_host_queues(struct Scsi_Host *shost);
+ extern struct request_queue *scsi_alloc_queue(struct scsi_device *sdev);
+-extern void scsi_free_queue(struct request_queue *q);
+ extern int scsi_init_queue(void);
+ extern void scsi_exit_queue(void);
+ struct request_queue;
+diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
+index 04c2a27..42c35ff 100644
+--- a/drivers/scsi/scsi_sysfs.c
++++ b/drivers/scsi/scsi_sysfs.c
+@@ -971,11 +971,8 @@ void __scsi_remove_device(struct scsi_device *sdev)
+ 		sdev->host->hostt->slave_destroy(sdev);
+ 	transport_destroy_device(dev);
+ 
+-	/* cause the request function to reject all I/O requests */
+-	sdev->request_queue->queuedata = NULL;
+-
+ 	/* Freeing the queue signals to block that we're done */
+-	scsi_free_queue(sdev->request_queue);
++	blk_cleanup_queue(sdev->request_queue);
+ 	put_device(dev);
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0054-Avoid-dangling-pointer-in-scsi_requeue_command.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0054-Avoid-dangling-pointer-in-scsi_requeue_command.patch
new file mode 100644
index 0000000..98e6b5b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0054-Avoid-dangling-pointer-in-scsi_requeue_command.patch
@@ -0,0 +1,57 @@
+From c24bb6a70695fb930fc0b976db55fad4334cd992 Mon Sep 17 00:00:00 2001
+From: Bart Van Assche <bvanassche@acm.org>
+Date: Fri, 29 Jun 2012 15:34:26 +0000
+Subject: [PATCH 54/73] Avoid dangling pointer in scsi_requeue_command()
+
+commit 940f5d47e2f2e1fa00443921a0abf4822335b54d upstream.
+
+When we call scsi_unprep_request() the command associated with the request
+gets destroyed and therefore drops its reference on the device.  If this was
+the only reference, the device may get released and we end up with a NULL
+pointer deref when we call blk_requeue_request.
+
+Reported-by: Mike Christie <michaelc@cs.wisc.edu>
+Signed-off-by: Bart Van Assche <bvanassche@acm.org>
+Reviewed-by: Mike Christie <michaelc@cs.wisc.edu>
+Reviewed-by: Tejun Heo <tj@kernel.org>
+[jejb: enhance commend and add commit log for stable]
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/scsi_lib.c |   11 +++++++++++
+ 1 files changed, 11 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
+index 4f68ba6..6c4b620 100644
+--- a/drivers/scsi/scsi_lib.c
++++ b/drivers/scsi/scsi_lib.c
+@@ -479,15 +479,26 @@ void scsi_requeue_run_queue(struct work_struct *work)
+  */
+ static void scsi_requeue_command(struct request_queue *q, struct scsi_cmnd *cmd)
+ {
++	struct scsi_device *sdev = cmd->device;
+ 	struct request *req = cmd->request;
+ 	unsigned long flags;
+ 
++	/*
++	 * We need to hold a reference on the device to avoid the queue being
++	 * killed after the unlock and before scsi_run_queue is invoked which
++	 * may happen because scsi_unprep_request() puts the command which
++	 * releases its reference on the device.
++	 */
++	get_device(&sdev->sdev_gendev);
++
+ 	spin_lock_irqsave(q->queue_lock, flags);
+ 	scsi_unprep_request(req);
+ 	blk_requeue_request(q, req);
+ 	spin_unlock_irqrestore(q->queue_lock, flags);
+ 
+ 	scsi_run_queue(q);
++
++	put_device(&sdev->sdev_gendev);
+ }
+ 
+ void scsi_next_command(struct scsi_cmnd *cmd)
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0055-fix-hot-unplug-vs-async-scan-race.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0055-fix-hot-unplug-vs-async-scan-race.patch
new file mode 100644
index 0000000..9d7c97a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0055-fix-hot-unplug-vs-async-scan-race.patch
@@ -0,0 +1,122 @@
+From 04ed7d216271c757e1f14ff369f5aa1908f04189 Mon Sep 17 00:00:00 2001
+From: Dan Williams <dan.j.williams@intel.com>
+Date: Thu, 21 Jun 2012 23:47:28 -0700
+Subject: [PATCH 55/73] fix hot unplug vs async scan race
+
+commit 3b661a92e869ebe2358de8f4b3230ad84f7fce51 upstream.
+
+The following crash results from cases where the end_device has been
+removed before scsi_sysfs_add_sdev has had a chance to run.
+
+ BUG: unable to handle kernel NULL pointer dereference at 0000000000000098
+ IP: [<ffffffff8115e100>] sysfs_create_dir+0x32/0xb6
+ ...
+ Call Trace:
+  [<ffffffff8125e4a8>] kobject_add_internal+0x120/0x1e3
+  [<ffffffff81075149>] ? trace_hardirqs_on+0xd/0xf
+  [<ffffffff8125e641>] kobject_add_varg+0x41/0x50
+  [<ffffffff8125e70b>] kobject_add+0x64/0x66
+  [<ffffffff8131122b>] device_add+0x12d/0x63a
+  [<ffffffff814b65ea>] ? _raw_spin_unlock_irqrestore+0x47/0x56
+  [<ffffffff8107de15>] ? module_refcount+0x89/0xa0
+  [<ffffffff8132f348>] scsi_sysfs_add_sdev+0x4e/0x28a
+  [<ffffffff8132dcbb>] do_scan_async+0x9c/0x145
+
+...teach scsi_sysfs_add_devices() to check for deleted devices() before
+trying to add them, and teach scsi_remove_target() how to remove targets
+that have not been added via device_add().
+
+Reported-by: Dariusz Majchrzak <dariusz.majchrzak@intel.com>
+Signed-off-by: Dan Williams <dan.j.williams@intel.com>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/scsi_scan.c  |    3 +++
+ drivers/scsi/scsi_sysfs.c |   41 ++++++++++++++++++++++++++---------------
+ 2 files changed, 29 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/scsi/scsi_scan.c b/drivers/scsi/scsi_scan.c
+index 6e7ea4a..a48b59c 100644
+--- a/drivers/scsi/scsi_scan.c
++++ b/drivers/scsi/scsi_scan.c
+@@ -1710,6 +1710,9 @@ static void scsi_sysfs_add_devices(struct Scsi_Host *shost)
+ {
+ 	struct scsi_device *sdev;
+ 	shost_for_each_device(sdev, shost) {
++		/* target removed before the device could be added */
++		if (sdev->sdev_state == SDEV_DEL)
++			continue;
+ 		if (!scsi_host_scan_allowed(shost) ||
+ 		    scsi_sysfs_add_sdev(sdev) != 0)
+ 			__scsi_remove_device(sdev);
+diff --git a/drivers/scsi/scsi_sysfs.c b/drivers/scsi/scsi_sysfs.c
+index 42c35ff..bb7c482 100644
+--- a/drivers/scsi/scsi_sysfs.c
++++ b/drivers/scsi/scsi_sysfs.c
+@@ -997,7 +997,6 @@ static void __scsi_remove_target(struct scsi_target *starget)
+ 	struct scsi_device *sdev;
+ 
+ 	spin_lock_irqsave(shost->host_lock, flags);
+-	starget->reap_ref++;
+  restart:
+ 	list_for_each_entry(sdev, &shost->__devices, siblings) {
+ 		if (sdev->channel != starget->channel ||
+@@ -1011,14 +1010,6 @@ static void __scsi_remove_target(struct scsi_target *starget)
+ 		goto restart;
+ 	}
+ 	spin_unlock_irqrestore(shost->host_lock, flags);
+-	scsi_target_reap(starget);
+-}
+-
+-static int __remove_child (struct device * dev, void * data)
+-{
+-	if (scsi_is_target_device(dev))
+-		__scsi_remove_target(to_scsi_target(dev));
+-	return 0;
+ }
+ 
+ /**
+@@ -1031,14 +1022,34 @@ static int __remove_child (struct device * dev, void * data)
+  */
+ void scsi_remove_target(struct device *dev)
+ {
+-	if (scsi_is_target_device(dev)) {
+-		__scsi_remove_target(to_scsi_target(dev));
+-		return;
++	struct Scsi_Host *shost = dev_to_shost(dev->parent);
++	struct scsi_target *starget, *found;
++	unsigned long flags;
++
++ restart:
++	found = NULL;
++	spin_lock_irqsave(shost->host_lock, flags);
++	list_for_each_entry(starget, &shost->__targets, siblings) {
++		if (starget->state == STARGET_DEL)
++			continue;
++		if (starget->dev.parent == dev || &starget->dev == dev) {
++			found = starget;
++			found->reap_ref++;
++			break;
++		}
+ 	}
++	spin_unlock_irqrestore(shost->host_lock, flags);
+ 
+-	get_device(dev);
+-	device_for_each_child(dev, NULL, __remove_child);
+-	put_device(dev);
++	if (found) {
++		__scsi_remove_target(found);
++		scsi_target_reap(found);
++		/* in the case where @dev has multiple starget children,
++		 * continue removing.
++		 *
++		 * FIXME: does such a case exist?
++		 */
++		goto restart;
++	}
+ }
+ EXPORT_SYMBOL(scsi_remove_target);
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0056-fix-eh-wakeup-scsi_schedule_eh-vs-scsi_restart_opera.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0056-fix-eh-wakeup-scsi_schedule_eh-vs-scsi_restart_opera.patch
new file mode 100644
index 0000000..a202864
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0056-fix-eh-wakeup-scsi_schedule_eh-vs-scsi_restart_opera.patch
@@ -0,0 +1,62 @@
+From 3936af31e073e2eb55d8d2eee05ec10999f0dacc Mon Sep 17 00:00:00 2001
+From: Dan Williams <dan.j.williams@intel.com>
+Date: Thu, 21 Jun 2012 23:25:32 -0700
+Subject: [PATCH 56/73] fix eh wakeup (scsi_schedule_eh vs
+ scsi_restart_operations)
+
+commit 57fc2e335fd3c2f898ee73570dc81426c28dc7b4 upstream.
+
+Rapid ata hotplug on a libsas controller results in cases where libsas
+is waiting indefinitely on eh to perform an ata probe.
+
+A race exists between scsi_schedule_eh() and scsi_restart_operations()
+in the case when scsi_restart_operations() issues i/o to other devices
+in the sas domain.  When this happens the host state transitions from
+SHOST_RECOVERY (set by scsi_schedule_eh) back to SHOST_RUNNING and
+->host_busy is non-zero so we put the eh thread to sleep even though
+->host_eh_scheduled is active.
+
+Before putting the error handler to sleep we need to check if the
+host_state needs to return to SHOST_RECOVERY for another trip through
+eh.  Since i/o that is released by scsi_restart_operations has been
+blocked for at least one eh cycle, this implementation allows those
+i/o's to run before another eh cycle starts to discourage hung task
+timeouts.
+
+Reported-by: Tom Jackson <thomas.p.jackson@intel.com>
+Tested-by: Tom Jackson <thomas.p.jackson@intel.com>
+Signed-off-by: Dan Williams <dan.j.williams@intel.com>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/scsi_error.c |   14 ++++++++++++++
+ 1 files changed, 14 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/scsi/scsi_error.c b/drivers/scsi/scsi_error.c
+index dc6131e..456b131 100644
+--- a/drivers/scsi/scsi_error.c
++++ b/drivers/scsi/scsi_error.c
+@@ -1673,6 +1673,20 @@ static void scsi_restart_operations(struct Scsi_Host *shost)
+ 	 * requests are started.
+ 	 */
+ 	scsi_run_host_queues(shost);
++
++	/*
++	 * if eh is active and host_eh_scheduled is pending we need to re-run
++	 * recovery.  we do this check after scsi_run_host_queues() to allow
++	 * everything pent up since the last eh run a chance to make forward
++	 * progress before we sync again.  Either we'll immediately re-run
++	 * recovery or scsi_device_unbusy() will wake us again when these
++	 * pending commands complete.
++	 */
++	spin_lock_irqsave(shost->host_lock, flags);
++	if (shost->host_eh_scheduled)
++		if (scsi_host_set_state(shost, SHOST_RECOVERY))
++			WARN_ON(scsi_host_set_state(shost, SHOST_CANCEL_RECOVERY));
++	spin_unlock_irqrestore(shost->host_lock, flags);
+ }
+ 
+ /**
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0057-libsas-continue-revalidation.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0057-libsas-continue-revalidation.patch
new file mode 100644
index 0000000..2a24209
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0057-libsas-continue-revalidation.patch
@@ -0,0 +1,49 @@
+From 07925ac535d9c4f774b0ba817fece3557670013f Mon Sep 17 00:00:00 2001
+From: Dan Williams <dan.j.williams@intel.com>
+Date: Thu, 21 Jun 2012 23:36:15 -0700
+Subject: [PATCH 57/73] libsas: continue revalidation
+
+commit 26f2f199ff150d8876b2641c41e60d1c92d2fb81 upstream.
+
+Continue running revalidation until no more broadcast devices are
+discovered.  Fixes cases where re-discovery completes too early in a
+domain with multiple expanders with pending re-discovery events.
+Servicing BCNs can get backed up behind error recovery.
+
+Signed-off-by: Dan Williams <dan.j.williams@intel.com>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/libsas/sas_expander.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/scsi/libsas/sas_expander.c b/drivers/scsi/libsas/sas_expander.c
+index e48ba4b..6330110 100644
+--- a/drivers/scsi/libsas/sas_expander.c
++++ b/drivers/scsi/libsas/sas_expander.c
+@@ -1983,9 +1983,7 @@ int sas_ex_revalidate_domain(struct domain_device *port_dev)
+ 	struct domain_device *dev = NULL;
+ 
+ 	res = sas_find_bcast_dev(port_dev, &dev);
+-	if (res)
+-		goto out;
+-	if (dev) {
++	while (res == 0 && dev) {
+ 		struct expander_device *ex = &dev->ex_dev;
+ 		int i = 0, phy_id;
+ 
+@@ -1997,8 +1995,10 @@ int sas_ex_revalidate_domain(struct domain_device *port_dev)
+ 			res = sas_rediscover(dev, phy_id);
+ 			i = phy_id + 1;
+ 		} while (i < ex->num_phys);
++
++		dev = NULL;
++		res = sas_find_bcast_dev(port_dev, &dev);
+ 	}
+-out:
+ 	return res;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0058-libsas-fix-sas_discover_devices-return-code-handling.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0058-libsas-fix-sas_discover_devices-return-code-handling.patch
new file mode 100644
index 0000000..4542c15
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0058-libsas-fix-sas_discover_devices-return-code-handling.patch
@@ -0,0 +1,128 @@
+From 61141b84f7a92caf6a6670396f9b2dec5345bc0e Mon Sep 17 00:00:00 2001
+From: Dan Williams <dan.j.williams@intel.com>
+Date: Thu, 21 Jun 2012 23:36:20 -0700
+Subject: [PATCH 58/73] libsas: fix sas_discover_devices return code handling
+
+commit b17caa174a7e1fd2e17b26e210d4ee91c4c28b37 upstream.
+
+commit 198439e4 [SCSI] libsas: do not set res = 0 in sas_ex_discover_dev()
+commit 19252de6 [SCSI] libsas: fix wide port hotplug issues
+
+The above commits seem to have confused the return value of
+sas_ex_discover_dev which is non-zero on failure and
+sas_ex_join_wide_port which just indicates short circuiting discovery on
+already established ports.  The result is random discovery failures
+depending on configuration.
+
+Calls to sas_ex_join_wide_port are the source of the trouble as its
+return value is errantly assigned to 'res'.  Convert it to bool and stop
+returning its result up the stack.
+
+Tested-by: Dan Melnic <dan.melnic@amd.com>
+Reported-by: Dan Melnic <dan.melnic@amd.com>
+Signed-off-by: Dan Williams <dan.j.williams@intel.com>
+Reviewed-by: Jack Wang <jack_wang@usish.com>
+Signed-off-by: James Bottomley <JBottomley@Parallels.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/scsi/libsas/sas_expander.c |   39 +++++++++++------------------------
+ 1 files changed, 12 insertions(+), 27 deletions(-)
+
+diff --git a/drivers/scsi/libsas/sas_expander.c b/drivers/scsi/libsas/sas_expander.c
+index 6330110..dbe3568 100644
+--- a/drivers/scsi/libsas/sas_expander.c
++++ b/drivers/scsi/libsas/sas_expander.c
+@@ -774,7 +774,7 @@ static struct domain_device *sas_ex_discover_end_dev(
+ }
+ 
+ /* See if this phy is part of a wide port */
+-static int sas_ex_join_wide_port(struct domain_device *parent, int phy_id)
++static bool sas_ex_join_wide_port(struct domain_device *parent, int phy_id)
+ {
+ 	struct ex_phy *phy = &parent->ex_dev.ex_phy[phy_id];
+ 	int i;
+@@ -790,11 +790,11 @@ static int sas_ex_join_wide_port(struct domain_device *parent, int phy_id)
+ 			sas_port_add_phy(ephy->port, phy->phy);
+ 			phy->port = ephy->port;
+ 			phy->phy_state = PHY_DEVICE_DISCOVERED;
+-			return 0;
++			return true;
+ 		}
+ 	}
+ 
+-	return -ENODEV;
++	return false;
+ }
+ 
+ static struct domain_device *sas_ex_discover_expander(
+@@ -932,8 +932,7 @@ static int sas_ex_discover_dev(struct domain_device *dev, int phy_id)
+ 		return res;
+ 	}
+ 
+-	res = sas_ex_join_wide_port(dev, phy_id);
+-	if (!res) {
++	if (sas_ex_join_wide_port(dev, phy_id)) {
+ 		SAS_DPRINTK("Attaching ex phy%d to wide port %016llx\n",
+ 			    phy_id, SAS_ADDR(ex_phy->attached_sas_addr));
+ 		return res;
+@@ -978,8 +977,7 @@ static int sas_ex_discover_dev(struct domain_device *dev, int phy_id)
+ 			if (SAS_ADDR(ex->ex_phy[i].attached_sas_addr) ==
+ 			    SAS_ADDR(child->sas_addr)) {
+ 				ex->ex_phy[i].phy_state= PHY_DEVICE_DISCOVERED;
+-				res = sas_ex_join_wide_port(dev, i);
+-				if (!res)
++				if (sas_ex_join_wide_port(dev, i))
+ 					SAS_DPRINTK("Attaching ex phy%d to wide port %016llx\n",
+ 						    i, SAS_ADDR(ex->ex_phy[i].attached_sas_addr));
+ 
+@@ -1849,32 +1847,20 @@ static int sas_discover_new(struct domain_device *dev, int phy_id)
+ {
+ 	struct ex_phy *ex_phy = &dev->ex_dev.ex_phy[phy_id];
+ 	struct domain_device *child;
+-	bool found = false;
+-	int res, i;
++	int res;
+ 
+ 	SAS_DPRINTK("ex %016llx phy%d new device attached\n",
+ 		    SAS_ADDR(dev->sas_addr), phy_id);
+ 	res = sas_ex_phy_discover(dev, phy_id);
+ 	if (res)
+-		goto out;
+-	/* to support the wide port inserted */
+-	for (i = 0; i < dev->ex_dev.num_phys; i++) {
+-		struct ex_phy *ex_phy_temp = &dev->ex_dev.ex_phy[i];
+-		if (i == phy_id)
+-			continue;
+-		if (SAS_ADDR(ex_phy_temp->attached_sas_addr) ==
+-		    SAS_ADDR(ex_phy->attached_sas_addr)) {
+-			found = true;
+-			break;
+-		}
+-	}
+-	if (found) {
+-		sas_ex_join_wide_port(dev, phy_id);
++		return res;
++
++	if (sas_ex_join_wide_port(dev, phy_id))
+ 		return 0;
+-	}
++
+ 	res = sas_ex_discover_devices(dev, phy_id);
+-	if (!res)
+-		goto out;
++	if (res)
++		return res;
+ 	list_for_each_entry(child, &dev->ex_dev.children, siblings) {
+ 		if (SAS_ADDR(child->sas_addr) ==
+ 		    SAS_ADDR(ex_phy->attached_sas_addr)) {
+@@ -1884,7 +1870,6 @@ static int sas_discover_new(struct domain_device *dev, int phy_id)
+ 			break;
+ 		}
+ 	}
+-out:
+ 	return res;
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0059-iscsi-target-Drop-bogus-struct-file-usage-for-iSCSI-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0059-iscsi-target-Drop-bogus-struct-file-usage-for-iSCSI-.patch
new file mode 100644
index 0000000..cfe9c56
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0059-iscsi-target-Drop-bogus-struct-file-usage-for-iSCSI-.patch
@@ -0,0 +1,230 @@
+From ea954b6e038224e5946f09b1a359d19e672cde3a Mon Sep 17 00:00:00 2001
+From: Al Viro <viro@ZenIV.linux.org.uk>
+Date: Sat, 21 Jul 2012 08:55:18 +0100
+Subject: [PATCH 59/73] iscsi-target: Drop bogus struct file usage for
+ iSCSI/SCTP
+
+commit bf6932f44a7b3fa7e2246a8b18a44670e5eab6c2 upstream.
+
+From Al Viro:
+
+	BTW, speaking of struct file treatment related to sockets -
+        there's this piece of code in iscsi:
+        /*
+         * The SCTP stack needs struct socket->file.
+         */
+        if ((np->np_network_transport == ISCSI_SCTP_TCP) ||
+            (np->np_network_transport == ISCSI_SCTP_UDP)) {
+                if (!new_sock->file) {
+                        new_sock->file = kzalloc(
+                                        sizeof(struct file), GFP_KERNEL);
+
+For one thing, as far as I can see it'not true - sctp does *not* depend on
+socket->file being non-NULL; it does, in one place, check socket->file->f_flags
+for O_NONBLOCK, but there it treats NULL socket->file as "flag not set".
+Which is the case here anyway - the fake struct file created in
+__iscsi_target_login_thread() (and in iscsi_target_setup_login_socket(), with
+the same excuse) do *not* get that flag set.
+
+Moreover, it's a bloody serious violation of a bunch of asserts in VFS;
+all struct file instances should come from filp_cachep, via get_empty_filp()
+(or alloc_file(), which is a wrapper for it).  FWIW, I'm very tempted to
+do this and be done with the entire mess:
+
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Cc: Andy Grover <agrover@redhat.com>
+Cc: Hannes Reinecke <hare@suse.de>
+Cc: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/target/iscsi/iscsi_target.c       |   22 +---------
+ drivers/target/iscsi/iscsi_target_core.h  |    2 -
+ drivers/target/iscsi/iscsi_target_login.c |   60 +---------------------------
+ 3 files changed, 6 insertions(+), 78 deletions(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
+index 0842cc7..2ff1255 100644
+--- a/drivers/target/iscsi/iscsi_target.c
++++ b/drivers/target/iscsi/iscsi_target.c
+@@ -427,19 +427,8 @@ int iscsit_reset_np_thread(
+ 
+ int iscsit_del_np_comm(struct iscsi_np *np)
+ {
+-	if (!np->np_socket)
+-		return 0;
+-
+-	/*
+-	 * Some network transports allocate their own struct sock->file,
+-	 * see  if we need to free any additional allocated resources.
+-	 */
+-	if (np->np_flags & NPF_SCTP_STRUCT_FILE) {
+-		kfree(np->np_socket->file);
+-		np->np_socket->file = NULL;
+-	}
+-
+-	sock_release(np->np_socket);
++	if (np->np_socket)
++		sock_release(np->np_socket);
+ 	return 0;
+ }
+ 
+@@ -4105,13 +4094,8 @@ int iscsit_close_connection(
+ 	kfree(conn->conn_ops);
+ 	conn->conn_ops = NULL;
+ 
+-	if (conn->sock) {
+-		if (conn->conn_flags & CONNFLAG_SCTP_STRUCT_FILE) {
+-			kfree(conn->sock->file);
+-			conn->sock->file = NULL;
+-		}
++	if (conn->sock)
+ 		sock_release(conn->sock);
+-	}
+ 	conn->thread_set = NULL;
+ 
+ 	pr_debug("Moving to TARG_CONN_STATE_FREE.\n");
+diff --git a/drivers/target/iscsi/iscsi_target_core.h b/drivers/target/iscsi/iscsi_target_core.h
+index 7da2d6a..0f68197 100644
+--- a/drivers/target/iscsi/iscsi_target_core.h
++++ b/drivers/target/iscsi/iscsi_target_core.h
+@@ -224,7 +224,6 @@ enum iscsi_timer_flags_table {
+ /* Used for struct iscsi_np->np_flags */
+ enum np_flags_table {
+ 	NPF_IP_NETWORK		= 0x00,
+-	NPF_SCTP_STRUCT_FILE	= 0x01 /* Bugfix */
+ };
+ 
+ /* Used for struct iscsi_np->np_thread_state */
+@@ -511,7 +510,6 @@ struct iscsi_conn {
+ 	u16			local_port;
+ 	int			net_size;
+ 	u32			auth_id;
+-#define CONNFLAG_SCTP_STRUCT_FILE			0x01
+ 	u32			conn_flags;
+ 	/* Used for iscsi_tx_login_rsp() */
+ 	u32			login_itt;
+diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
+index bd2adec..2ec5339 100644
+--- a/drivers/target/iscsi/iscsi_target_login.c
++++ b/drivers/target/iscsi/iscsi_target_login.c
+@@ -793,22 +793,6 @@ int iscsi_target_setup_login_socket(
+ 	}
+ 	np->np_socket = sock;
+ 	/*
+-	 * The SCTP stack needs struct socket->file.
+-	 */
+-	if ((np->np_network_transport == ISCSI_SCTP_TCP) ||
+-	    (np->np_network_transport == ISCSI_SCTP_UDP)) {
+-		if (!sock->file) {
+-			sock->file = kzalloc(sizeof(struct file), GFP_KERNEL);
+-			if (!sock->file) {
+-				pr_err("Unable to allocate struct"
+-						" file for SCTP\n");
+-				ret = -ENOMEM;
+-				goto fail;
+-			}
+-			np->np_flags |= NPF_SCTP_STRUCT_FILE;
+-		}
+-	}
+-	/*
+ 	 * Setup the np->np_sockaddr from the passed sockaddr setup
+ 	 * in iscsi_target_configfs.c code..
+ 	 */
+@@ -857,21 +841,15 @@ int iscsi_target_setup_login_socket(
+ 
+ fail:
+ 	np->np_socket = NULL;
+-	if (sock) {
+-		if (np->np_flags & NPF_SCTP_STRUCT_FILE) {
+-			kfree(sock->file);
+-			sock->file = NULL;
+-		}
+-
++	if (sock)
+ 		sock_release(sock);
+-	}
+ 	return ret;
+ }
+ 
+ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ {
+ 	u8 buffer[ISCSI_HDR_LEN], iscsi_opcode, zero_tsih = 0;
+-	int err, ret = 0, ip_proto, sock_type, set_sctp_conn_flag, stop;
++	int err, ret = 0, ip_proto, sock_type, stop;
+ 	struct iscsi_conn *conn = NULL;
+ 	struct iscsi_login *login;
+ 	struct iscsi_portal_group *tpg = NULL;
+@@ -882,7 +860,6 @@ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ 	struct sockaddr_in6 sock_in6;
+ 
+ 	flush_signals(current);
+-	set_sctp_conn_flag = 0;
+ 	sock = np->np_socket;
+ 	ip_proto = np->np_ip_proto;
+ 	sock_type = np->np_sock_type;
+@@ -907,35 +884,12 @@ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ 		spin_unlock_bh(&np->np_thread_lock);
+ 		goto out;
+ 	}
+-	/*
+-	 * The SCTP stack needs struct socket->file.
+-	 */
+-	if ((np->np_network_transport == ISCSI_SCTP_TCP) ||
+-	    (np->np_network_transport == ISCSI_SCTP_UDP)) {
+-		if (!new_sock->file) {
+-			new_sock->file = kzalloc(
+-					sizeof(struct file), GFP_KERNEL);
+-			if (!new_sock->file) {
+-				pr_err("Unable to allocate struct"
+-						" file for SCTP\n");
+-				sock_release(new_sock);
+-				/* Get another socket */
+-				return 1;
+-			}
+-			set_sctp_conn_flag = 1;
+-		}
+-	}
+-
+ 	iscsi_start_login_thread_timer(np);
+ 
+ 	conn = kzalloc(sizeof(struct iscsi_conn), GFP_KERNEL);
+ 	if (!conn) {
+ 		pr_err("Could not allocate memory for"
+ 			" new connection\n");
+-		if (set_sctp_conn_flag) {
+-			kfree(new_sock->file);
+-			new_sock->file = NULL;
+-		}
+ 		sock_release(new_sock);
+ 		/* Get another socket */
+ 		return 1;
+@@ -945,9 +899,6 @@ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ 	conn->conn_state = TARG_CONN_STATE_FREE;
+ 	conn->sock = new_sock;
+ 
+-	if (set_sctp_conn_flag)
+-		conn->conn_flags |= CONNFLAG_SCTP_STRUCT_FILE;
+-
+ 	pr_debug("Moving to TARG_CONN_STATE_XPT_UP.\n");
+ 	conn->conn_state = TARG_CONN_STATE_XPT_UP;
+ 
+@@ -1195,13 +1146,8 @@ old_sess_out:
+ 		iscsi_release_param_list(conn->param_list);
+ 		conn->param_list = NULL;
+ 	}
+-	if (conn->sock) {
+-		if (conn->conn_flags & CONNFLAG_SCTP_STRUCT_FILE) {
+-			kfree(conn->sock->file);
+-			conn->sock->file = NULL;
+-		}
++	if (conn->sock)
+ 		sock_release(conn->sock);
+-	}
+ 	kfree(conn);
+ 
+ 	if (tpg) {
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0060-mmc-sdhci-pci-CaFe-has-broken-card-detection.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0060-mmc-sdhci-pci-CaFe-has-broken-card-detection.patch
new file mode 100644
index 0000000..22812ab
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0060-mmc-sdhci-pci-CaFe-has-broken-card-detection.patch
@@ -0,0 +1,42 @@
+From eb0aa45b9b49d8daeef285f1c5bb0be392caaddf Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Tue, 3 Jul 2012 23:13:39 +0100
+Subject: [PATCH 60/73] mmc: sdhci-pci: CaFe has broken card detection
+
+commit 55fc05b7414274f17795cd0e8a3b1546f3649d5e upstream.
+
+At http://dev.laptop.org/ticket/11980 we have determined that the
+Marvell CaFe SDHCI controller reports bad card presence during
+resume. It reports that no card is present even when it is.
+This is a regression -- resume worked back around 2.6.37.
+
+Around 400ms after resuming, a "card inserted" interrupt is
+generated, at which point it starts reporting presence.
+
+Work around this hardware oddity by setting the
+SDHCI_QUIRK_BROKEN_CARD_DETECTION flag.
+Thanks to Chris Ball for helping with diagnosis.
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+[stable@: please apply to 3.0+]
+Signed-off-by: Chris Ball <cjb@laptop.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/mmc/host/sdhci-pci.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/mmc/host/sdhci-pci.c b/drivers/mmc/host/sdhci-pci.c
+index 6878a94..83b51b5 100644
+--- a/drivers/mmc/host/sdhci-pci.c
++++ b/drivers/mmc/host/sdhci-pci.c
+@@ -148,6 +148,7 @@ static const struct sdhci_pci_fixes sdhci_ene_714 = {
+ static const struct sdhci_pci_fixes sdhci_cafe = {
+ 	.quirks		= SDHCI_QUIRK_NO_SIMULT_VDD_AND_POWER |
+ 			  SDHCI_QUIRK_NO_BUSY_IRQ |
++			  SDHCI_QUIRK_BROKEN_CARD_DETECTION |
+ 			  SDHCI_QUIRK_BROKEN_TIMEOUT_VAL,
+ };
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0061-ext4-don-t-let-i_reserved_meta_blocks-go-negative.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0061-ext4-don-t-let-i_reserved_meta_blocks-go-negative.patch
new file mode 100644
index 0000000..428571d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0061-ext4-don-t-let-i_reserved_meta_blocks-go-negative.patch
@@ -0,0 +1,55 @@
+From a09474d4d4bba3e468ff96d826b90b5551f98111 Mon Sep 17 00:00:00 2001
+From: Brian Foster <bfoster@redhat.com>
+Date: Sun, 22 Jul 2012 23:59:40 -0400
+Subject: [PATCH 61/73] ext4: don't let i_reserved_meta_blocks go negative
+
+commit 97795d2a5b8d3c8dc4365d4bd3404191840453ba upstream.
+
+If we hit a condition where we have allocated metadata blocks that
+were not appropriately reserved, we risk underflow of
+ei->i_reserved_meta_blocks.  In turn, this can throw
+sbi->s_dirtyclusters_counter significantly out of whack and undermine
+the nondelalloc fallback logic in ext4_nonda_switch().  Warn if this
+occurs and set i_allocated_meta_blocks to avoid this problem.
+
+This condition is reproduced by xfstests 270 against ext2 with
+delalloc enabled:
+
+Mar 28 08:58:02 localhost kernel: [  171.526344] EXT4-fs (loop1): delayed block allocation failed for inode 14 at logical offset 64486 with max blocks 64 with error -28
+Mar 28 08:58:02 localhost kernel: [  171.526346] EXT4-fs (loop1): This should not happen!! Data will be lost
+
+270 ultimately fails with an inconsistent filesystem and requires an
+fsck to repair.  The cause of the error is an underflow in
+ext4_da_update_reserve_space() due to an unreserved meta block
+allocation.
+
+Signed-off-by: Brian Foster <bfoster@redhat.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ext4/inode.c |    9 +++++++++
+ 1 files changed, 9 insertions(+), 0 deletions(-)
+
+diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
+index d0dc109..03373c3 100644
+--- a/fs/ext4/inode.c
++++ b/fs/ext4/inode.c
+@@ -277,6 +277,15 @@ void ext4_da_update_reserve_space(struct inode *inode,
+ 		used = ei->i_reserved_data_blocks;
+ 	}
+ 
++	if (unlikely(ei->i_allocated_meta_blocks > ei->i_reserved_meta_blocks)) {
++		ext4_msg(inode->i_sb, KERN_NOTICE, "%s: ino %lu, allocated %d "
++			 "with only %d reserved metadata blocks\n", __func__,
++			 inode->i_ino, ei->i_allocated_meta_blocks,
++			 ei->i_reserved_meta_blocks);
++		WARN_ON(1);
++		ei->i_allocated_meta_blocks = ei->i_reserved_meta_blocks;
++	}
++
+ 	/* Update per-inode reservations */
+ 	ei->i_reserved_data_blocks -= used;
+ 	ei->i_reserved_meta_blocks -= ei->i_allocated_meta_blocks;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0062-ext4-undo-ext4_calc_metadata_amount-if-we-fail-to-cl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0062-ext4-undo-ext4_calc_metadata_amount-if-we-fail-to-cl.patch
new file mode 100644
index 0000000..dac384a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0062-ext4-undo-ext4_calc_metadata_amount-if-we-fail-to-cl.patch
@@ -0,0 +1,93 @@
+From f7aa52ca54cad12194d0c48a95c2d4ccdf487c6c Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Mon, 23 Jul 2012 00:00:20 -0400
+Subject: [PATCH 62/73] ext4: undo ext4_calc_metadata_amount if we fail to
+ claim space
+
+commit 03179fe92318e7934c180d96f12eff2cb36ef7b6 upstream.
+
+The function ext4_calc_metadata_amount() has side effects, although
+it's not obvious from its function name.  So if we fail to claim
+space, regardless of whether we retry to claim the space again, or
+return an error, we need to undo these side effects.
+
+Otherwise we can end up incorrectly calculating the number of metadata
+blocks needed for the operation, which was responsible for an xfstests
+failure for test #271 when using an ext2 file system with delalloc
+enabled.
+
+Reported-by: Brian Foster <bfoster@redhat.com>
+Signed-off-by: "Theodore Ts'o" <tytso@mit.edu>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/ext4/inode.c |   32 +++++++++++++++++++++-----------
+ 1 files changed, 21 insertions(+), 11 deletions(-)
+
+diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
+index 03373c3..b556994 100644
+--- a/fs/ext4/inode.c
++++ b/fs/ext4/inode.c
+@@ -1111,6 +1111,17 @@ static int ext4_da_reserve_space(struct inode *inode, ext4_lblk_t lblock)
+ 	struct ext4_inode_info *ei = EXT4_I(inode);
+ 	unsigned int md_needed;
+ 	int ret;
++	ext4_lblk_t save_last_lblock;
++	int save_len;
++
++	/*
++	 * We will charge metadata quota at writeout time; this saves
++	 * us from metadata over-estimation, though we may go over by
++	 * a small amount in the end.  Here we just reserve for data.
++	 */
++	ret = dquot_reserve_block(inode, EXT4_C2B(sbi, 1));
++	if (ret)
++		return ret;
+ 
+ 	/*
+ 	 * recalculate the amount of metadata blocks to reserve
+@@ -1119,32 +1130,31 @@ static int ext4_da_reserve_space(struct inode *inode, ext4_lblk_t lblock)
+ 	 */
+ repeat:
+ 	spin_lock(&ei->i_block_reservation_lock);
++	/*
++	 * ext4_calc_metadata_amount() has side effects, which we have
++	 * to be prepared undo if we fail to claim space.
++	 */
++	save_len = ei->i_da_metadata_calc_len;
++	save_last_lblock = ei->i_da_metadata_calc_last_lblock;
+ 	md_needed = EXT4_NUM_B2C(sbi,
+ 				 ext4_calc_metadata_amount(inode, lblock));
+ 	trace_ext4_da_reserve_space(inode, md_needed);
+-	spin_unlock(&ei->i_block_reservation_lock);
+ 
+ 	/*
+-	 * We will charge metadata quota at writeout time; this saves
+-	 * us from metadata over-estimation, though we may go over by
+-	 * a small amount in the end.  Here we just reserve for data.
+-	 */
+-	ret = dquot_reserve_block(inode, EXT4_C2B(sbi, 1));
+-	if (ret)
+-		return ret;
+-	/*
+ 	 * We do still charge estimated metadata to the sb though;
+ 	 * we cannot afford to run out of free blocks.
+ 	 */
+ 	if (ext4_claim_free_clusters(sbi, md_needed + 1, 0)) {
+-		dquot_release_reservation_block(inode, EXT4_C2B(sbi, 1));
++		ei->i_da_metadata_calc_len = save_len;
++		ei->i_da_metadata_calc_last_lblock = save_last_lblock;
++		spin_unlock(&ei->i_block_reservation_lock);
+ 		if (ext4_should_retry_alloc(inode->i_sb, &retries)) {
+ 			yield();
+ 			goto repeat;
+ 		}
++		dquot_release_reservation_block(inode, EXT4_C2B(sbi, 1));
+ 		return -ENOSPC;
+ 	}
+-	spin_lock(&ei->i_block_reservation_lock);
+ 	ei->i_reserved_data_blocks++;
+ 	ei->i_reserved_meta_blocks += md_needed;
+ 	spin_unlock(&ei->i_block_reservation_lock);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0063-ASoC-dapm-Fix-_PRE-and-_POST-events-for-DAPM-perform.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0063-ASoC-dapm-Fix-_PRE-and-_POST-events-for-DAPM-perform.patch
new file mode 100644
index 0000000..a1fc463
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0063-ASoC-dapm-Fix-_PRE-and-_POST-events-for-DAPM-perform.patch
@@ -0,0 +1,46 @@
+From 8fbf76d6e7e81a95a44e627e0c6dbeef231700f2 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Fri, 20 Jul 2012 17:29:34 +0100
+Subject: [PATCH 63/73] ASoC: dapm: Fix _PRE and _POST events for DAPM
+ performance improvements
+
+commit 0ff97ebf0804d2e519d578fcb4db03f104d2ca8c upstream.
+
+Ever since the DAPM performance improvements we've been marking all widgets
+as not dirty after each DAPM run. Since _PRE and _POST events aren't part
+of the DAPM graph this has rendered them non-functional, they will never be
+marked dirty again and thus will never be run again.
+
+Fix this by skipping them when marking widgets as not dirty.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Acked-by: Liam Girdwood <lrg@ti.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ sound/soc/soc-dapm.c |   10 +++++++++-
+ 1 files changed, 9 insertions(+), 1 deletions(-)
+
+diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
+index 90e93bf..0dc441c 100644
+--- a/sound/soc/soc-dapm.c
++++ b/sound/soc/soc-dapm.c
+@@ -1381,7 +1381,15 @@ static int dapm_power_widgets(struct snd_soc_dapm_context *dapm, int event)
+ 	}
+ 
+ 	list_for_each_entry(w, &card->widgets, list) {
+-		list_del_init(&w->dirty);
++		switch (w->id) {
++		case snd_soc_dapm_pre:
++		case snd_soc_dapm_post:
++			/* These widgets always need to be powered */
++			break;
++		default:
++			list_del_init(&w->dirty);
++			break;
++		}
+ 
+ 		if (w->power) {
+ 			d = w->dapm;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0064-locks-fix-checking-of-fcntl_setlease-argument.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0064-locks-fix-checking-of-fcntl_setlease-argument.patch
new file mode 100644
index 0000000..7296221
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0064-locks-fix-checking-of-fcntl_setlease-argument.patch
@@ -0,0 +1,57 @@
+From fb13198419fd31d8cbe249d285abd4f69d2c4f6d Mon Sep 17 00:00:00 2001
+From: "J. Bruce Fields" <bfields@fieldses.org>
+Date: Mon, 23 Jul 2012 15:17:17 -0400
+Subject: [PATCH 64/73] locks: fix checking of fcntl_setlease argument
+
+commit 0ec4f431eb56d633da3a55da67d5c4b88886ccc7 upstream.
+
+The only checks of the long argument passed to fcntl(fd,F_SETLEASE,.)
+are done after converting the long to an int.  Thus some illegal values
+may be let through and cause problems in later code.
+
+[ They actually *don't* cause problems in mainline, as of Dave Jones's
+  commit 8d657eb3b438 "Remove easily user-triggerable BUG from
+  generic_setlease", but we should fix this anyway.  And this patch will
+  be necessary to fix real bugs on earlier kernels. ]
+
+Signed-off-by: J. Bruce Fields <bfields@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/locks.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/fs/locks.c b/fs/locks.c
+index 6a64f15..fcc50ab 100644
+--- a/fs/locks.c
++++ b/fs/locks.c
+@@ -308,7 +308,7 @@ static int flock_make_lock(struct file *filp, struct file_lock **lock,
+ 	return 0;
+ }
+ 
+-static int assign_type(struct file_lock *fl, int type)
++static int assign_type(struct file_lock *fl, long type)
+ {
+ 	switch (type) {
+ 	case F_RDLCK:
+@@ -445,7 +445,7 @@ static const struct lock_manager_operations lease_manager_ops = {
+ /*
+  * Initialize a lease, use the default lock manager operations
+  */
+-static int lease_init(struct file *filp, int type, struct file_lock *fl)
++static int lease_init(struct file *filp, long type, struct file_lock *fl)
+  {
+ 	if (assign_type(fl, type) != 0)
+ 		return -EINVAL;
+@@ -463,7 +463,7 @@ static int lease_init(struct file *filp, int type, struct file_lock *fl)
+ }
+ 
+ /* Allocate a file_lock initialised to this type of lease */
+-static struct file_lock *lease_alloc(struct file *filp, int type)
++static struct file_lock *lease_alloc(struct file *filp, long type)
+ {
+ 	struct file_lock *fl = locks_alloc_lock();
+ 	int error = -ENOMEM;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0065-ACPI-AC-prevent-OOPS-on-some-boxes-due-to-missing-ch.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0065-ACPI-AC-prevent-OOPS-on-some-boxes-due-to-missing-ch.patch
new file mode 100644
index 0000000..5fa53fb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0065-ACPI-AC-prevent-OOPS-on-some-boxes-due-to-missing-ch.patch
@@ -0,0 +1,45 @@
+From 847ccb9086b1b76d8db67f37e36e909727c010cb Mon Sep 17 00:00:00 2001
+From: Lan Tianyu <tianyu.lan@intel.com>
+Date: Fri, 20 Jul 2012 13:29:16 +0800
+Subject: [PATCH 65/73] ACPI/AC: prevent OOPS on some boxes due to missing
+ check power_supply_register() return value check
+
+commit f197ac13f6eeb351b31250b9ab7d0da17434ea36 upstream.
+
+In the ac.c, power_supply_register()'s return value is not checked.
+
+As a result, the driver's add() ops may return success
+even though the device failed to initialize.
+
+For example, some BIOS may describe two ACADs in the same DSDT.
+The second ACAD device will fail to register,
+but ACPI driver's add() ops returns sucessfully.
+The ACPI device will receive ACPI notification and cause OOPS.
+
+https://bugzilla.redhat.com/show_bug.cgi?id=772730
+
+Signed-off-by: Lan Tianyu <tianyu.lan@intel.com>
+Signed-off-by: Len Brown <len.brown@intel.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/acpi/ac.c |    4 +++-
+ 1 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/acpi/ac.c b/drivers/acpi/ac.c
+index 6512b20..d1fcbc0 100644
+--- a/drivers/acpi/ac.c
++++ b/drivers/acpi/ac.c
+@@ -292,7 +292,9 @@ static int acpi_ac_add(struct acpi_device *device)
+ 	ac->charger.properties = ac_props;
+ 	ac->charger.num_properties = ARRAY_SIZE(ac_props);
+ 	ac->charger.get_property = get_ac_property;
+-	power_supply_register(&ac->device->dev, &ac->charger);
++	result = power_supply_register(&ac->device->dev, &ac->charger);
++	if (result)
++		goto end;
+ 
+ 	printk(KERN_INFO PREFIX "%s [%s] (%s)\n",
+ 	       acpi_device_name(device), acpi_device_bid(device),
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0066-drm-radeon-fix-bo-creation-retry-path.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0066-drm-radeon-fix-bo-creation-retry-path.patch
new file mode 100644
index 0000000..065e87b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0066-drm-radeon-fix-bo-creation-retry-path.patch
@@ -0,0 +1,47 @@
+From 9fc722e4c6da369ecad425d55a4fe50c6dbd21d9 Mon Sep 17 00:00:00 2001
+From: Jerome Glisse <jglisse@redhat.com>
+Date: Thu, 12 Jul 2012 18:23:05 -0400
+Subject: [PATCH 66/73] drm/radeon: fix bo creation retry path
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit d1c7871ddb1f588b8eb35affd9ee1a3d5e11cd0c upstream.
+
+Retry label was at wrong place in function leading to memory
+leak.
+
+Signed-off-by: Jerome Glisse <jglisse@redhat.com>
+Reviewed-by: Michel Dänzer <michel.daenzer@amd.com>
+Reviewed-by: Christian König <christian.koenig@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+[bwh: Backported to 3.2: adjust context]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/radeon_object.c |    3 ++-
+ 1 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
+index f3ae607..39497c7 100644
+--- a/drivers/gpu/drm/radeon/radeon_object.c
++++ b/drivers/gpu/drm/radeon/radeon_object.c
+@@ -117,7 +117,6 @@ int radeon_bo_create(struct radeon_device *rdev,
+ 		return -ENOMEM;
+ 	}
+ 
+-retry:
+ 	bo = kzalloc(sizeof(struct radeon_bo), GFP_KERNEL);
+ 	if (bo == NULL)
+ 		return -ENOMEM;
+@@ -130,6 +129,8 @@ retry:
+ 	bo->gem_base.driver_private = NULL;
+ 	bo->surface_reg = -1;
+ 	INIT_LIST_HEAD(&bo->list);
++
++retry:
+ 	radeon_ttm_placement_from_domain(bo, domain);
+ 	/* Kernel allocation are uninterruptible */
+ 	mutex_lock(&rdev->vram_mutex);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0067-drm-radeon-fix-non-revealent-error-message.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0067-drm-radeon-fix-non-revealent-error-message.patch
new file mode 100644
index 0000000..85e0cad
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0067-drm-radeon-fix-non-revealent-error-message.patch
@@ -0,0 +1,70 @@
+From 0521c32992bd885e150c17f413200d82fa83911c Mon Sep 17 00:00:00 2001
+From: Jerome Glisse <jglisse@redhat.com>
+Date: Tue, 17 Jul 2012 17:17:16 -0400
+Subject: [PATCH 67/73] drm/radeon: fix non revealent error message
+
+commit 8d1c702aa0b2c4b22b0742b72a1149d91690674b upstream.
+
+We want to print link status query failed only if it's
+an unexepected fail. If we query to see if we need
+link training it might be because there is nothing
+connected and thus link status query have the right
+to fail in that case.
+
+To avoid printing failure when it's expected, move the
+failure message to proper place.
+
+Signed-off-by: Jerome Glisse <jglisse@redhat.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/atombios_dp.c |   10 +++++++---
+ 1 files changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
+index 552b436..3254d51 100644
+--- a/drivers/gpu/drm/radeon/atombios_dp.c
++++ b/drivers/gpu/drm/radeon/atombios_dp.c
+@@ -22,6 +22,7 @@
+  *
+  * Authors: Dave Airlie
+  *          Alex Deucher
++ *          Jerome Glisse
+  */
+ #include "drmP.h"
+ #include "radeon_drm.h"
+@@ -634,7 +635,6 @@ static bool radeon_dp_get_link_status(struct radeon_connector *radeon_connector,
+ 	ret = radeon_dp_aux_native_read(radeon_connector, DP_LANE0_1_STATUS,
+ 					link_status, DP_LINK_STATUS_SIZE, 100);
+ 	if (ret <= 0) {
+-		DRM_ERROR("displayport link status failed\n");
+ 		return false;
+ 	}
+ 
+@@ -812,8 +812,10 @@ static int radeon_dp_link_train_cr(struct radeon_dp_link_train_info *dp_info)
+ 		else
+ 			mdelay(dp_info->rd_interval * 4);
+ 
+-		if (!radeon_dp_get_link_status(dp_info->radeon_connector, dp_info->link_status))
++		if (!radeon_dp_get_link_status(dp_info->radeon_connector, dp_info->link_status)) {
++			DRM_ERROR("displayport link status failed\n");
+ 			break;
++		}
+ 
+ 		if (dp_clock_recovery_ok(dp_info->link_status, dp_info->dp_lane_count)) {
+ 			clock_recovery = true;
+@@ -875,8 +877,10 @@ static int radeon_dp_link_train_ce(struct radeon_dp_link_train_info *dp_info)
+ 		else
+ 			mdelay(dp_info->rd_interval * 4);
+ 
+-		if (!radeon_dp_get_link_status(dp_info->radeon_connector, dp_info->link_status))
++		if (!radeon_dp_get_link_status(dp_info->radeon_connector, dp_info->link_status)) {
++			DRM_ERROR("displayport link status failed\n");
+ 			break;
++		}
+ 
+ 		if (dp_channel_eq_ok(dp_info->link_status, dp_info->dp_lane_count)) {
+ 			channel_eq = true;
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0068-drm-radeon-fix-hotplug-of-DP-to-DVI-HDMI-passive-ada.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0068-drm-radeon-fix-hotplug-of-DP-to-DVI-HDMI-passive-ada.patch
new file mode 100644
index 0000000..0872ed3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0068-drm-radeon-fix-hotplug-of-DP-to-DVI-HDMI-passive-ada.patch
@@ -0,0 +1,69 @@
+From 0de546b55811738998d83bb6e677306d65e90861 Mon Sep 17 00:00:00 2001
+From: Jerome Glisse <jglisse@redhat.com>
+Date: Thu, 19 Jul 2012 17:15:56 -0400
+Subject: [PATCH 68/73] drm/radeon: fix hotplug of DP to DVI|HDMI passive
+ adapters (v2)
+
+commit 266dcba541a1ef7e5d82d9e67c67fde2910636e8 upstream.
+
+No need to retrain the link for passive adapters.
+
+v2: agd5f
+- no passive DP to VGA adapters, update comments
+- assign radeon_connector_atom_dig after we are sure
+  we have a digital connector as analog connectors
+  have different private data.
+- get new sink type before checking for retrain.  No
+  need to check if it's no longer a DP connection.
+
+Signed-off-by: Jerome Glisse <jglisse@redhat.com>
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/radeon_connectors.c |   29 ++++++++++++++++++++-------
+ 1 files changed, 21 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
+index 4a4493f..fb8db7a 100644
+--- a/drivers/gpu/drm/radeon/radeon_connectors.c
++++ b/drivers/gpu/drm/radeon/radeon_connectors.c
+@@ -64,14 +64,27 @@ void radeon_connector_hotplug(struct drm_connector *connector)
+ 
+ 	/* just deal with DP (not eDP) here. */
+ 	if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+-		int saved_dpms = connector->dpms;
+-
+-		/* Only turn off the display it it's physically disconnected */
+-		if (!radeon_hpd_sense(rdev, radeon_connector->hpd.hpd))
+-			drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
+-		else if (radeon_dp_needs_link_train(radeon_connector))
+-			drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
+-		connector->dpms = saved_dpms;
++		struct radeon_connector_atom_dig *dig_connector =
++			radeon_connector->con_priv;
++
++		/* if existing sink type was not DP no need to retrain */
++		if (dig_connector->dp_sink_type != CONNECTOR_OBJECT_ID_DISPLAYPORT)
++			return;
++
++		/* first get sink type as it may be reset after (un)plug */
++		dig_connector->dp_sink_type = radeon_dp_getsinktype(radeon_connector);
++		/* don't do anything if sink is not display port, i.e.,
++		 * passive dp->(dvi|hdmi) adaptor
++		 */
++		if (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) {
++			int saved_dpms = connector->dpms;
++			/* Only turn off the display if it's physically disconnected */
++			if (!radeon_hpd_sense(rdev, radeon_connector->hpd.hpd))
++				drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
++			else if (radeon_dp_needs_link_train(radeon_connector))
++				drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
++			connector->dpms = saved_dpms;
++		}
+ 	}
+ }
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0069-drm-radeon-on-hotplug-force-link-training-to-happen-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0069-drm-radeon-on-hotplug-force-link-training-to-happen-.patch
new file mode 100644
index 0000000..67959f9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0069-drm-radeon-on-hotplug-force-link-training-to-happen-.patch
@@ -0,0 +1,51 @@
+From 66ce98f9164b89ce8566d303265e209829f41c9f Mon Sep 17 00:00:00 2001
+From: Jerome Glisse <jglisse@redhat.com>
+Date: Thu, 19 Jul 2012 17:25:55 -0400
+Subject: [PATCH 69/73] drm/radeon: on hotplug force link training to happen
+ (v2)
+
+commit ca2ccde5e2f24a792caa4cca919fc5c6f65d1887 upstream.
+
+To have DP behave like VGA/DVI we need to retrain the link
+on hotplug. For this to happen we need to force link
+training to happen by setting connector dpms to off
+before asking it turning it on again.
+
+v2: agd5f
+- drop the dp_get_link_status() change in atombios_dp.c
+  for now.  We still need the dpms OFF change.
+
+Signed-off-by: Jerome Glisse <jglisse@redhat.com>
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/radeon/radeon_connectors.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_connectors.c b/drivers/gpu/drm/radeon/radeon_connectors.c
+index fb8db7a..87d494d 100644
+--- a/drivers/gpu/drm/radeon/radeon_connectors.c
++++ b/drivers/gpu/drm/radeon/radeon_connectors.c
+@@ -79,10 +79,16 @@ void radeon_connector_hotplug(struct drm_connector *connector)
+ 		if (dig_connector->dp_sink_type == CONNECTOR_OBJECT_ID_DISPLAYPORT) {
+ 			int saved_dpms = connector->dpms;
+ 			/* Only turn off the display if it's physically disconnected */
+-			if (!radeon_hpd_sense(rdev, radeon_connector->hpd.hpd))
++			if (!radeon_hpd_sense(rdev, radeon_connector->hpd.hpd)) {
+ 				drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
+-			else if (radeon_dp_needs_link_train(radeon_connector))
++			} else if (radeon_dp_needs_link_train(radeon_connector)) {
++				/* set it to OFF so that drm_helper_connector_dpms()
++				 * won't return immediately since the current state
++				 * is ON at this point.
++				 */
++				connector->dpms = DRM_MODE_DPMS_OFF;
+ 				drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
++			}
+ 			connector->dpms = saved_dpms;
+ 		}
+ 	}
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0070-Btrfs-call-the-ordered-free-operation-without-any-lo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0070-Btrfs-call-the-ordered-free-operation-without-any-lo.patch
new file mode 100644
index 0000000..871e6c0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0070-Btrfs-call-the-ordered-free-operation-without-any-lo.patch
@@ -0,0 +1,48 @@
+From f9254351de93ec535792d9a66b462d835875a6d3 Mon Sep 17 00:00:00 2001
+From: Chris Mason <chris.mason@fusionio.com>
+Date: Wed, 25 Jul 2012 15:57:13 -0400
+Subject: [PATCH 70/73] Btrfs: call the ordered free operation without any
+ locks held
+
+commit e9fbcb42201c862fd6ab45c48ead4f47bb2dea9d upstream.
+
+Each ordered operation has a free callback, and this was called with the
+worker spinlock held.  Josef made the free callback also call iput,
+which we can't do with the spinlock.
+
+This drops the spinlock for the free operation and grabs it again before
+moving through the rest of the list.  We'll circle back around to this
+and find a cleaner way that doesn't bounce the lock around so much.
+
+Signed-off-by: Chris Mason <chris.mason@fusionio.com>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ fs/btrfs/async-thread.c |    9 ++++++++-
+ 1 files changed, 8 insertions(+), 1 deletions(-)
+
+diff --git a/fs/btrfs/async-thread.c b/fs/btrfs/async-thread.c
+index 0b39458..03321e5 100644
+--- a/fs/btrfs/async-thread.c
++++ b/fs/btrfs/async-thread.c
+@@ -206,10 +206,17 @@ static noinline int run_ordered_completions(struct btrfs_workers *workers,
+ 
+ 		work->ordered_func(work);
+ 
+-		/* now take the lock again and call the freeing code */
++		/* now take the lock again and drop our item from the list */
+ 		spin_lock(&workers->order_lock);
+ 		list_del(&work->order_list);
++		spin_unlock(&workers->order_lock);
++
++		/*
++		 * we don't want to call the ordered free functions
++		 * with the lock held though
++		 */
+ 		work->ordered_free(work);
++		spin_lock(&workers->order_lock);
+ 	}
+ 
+ 	spin_unlock(&workers->order_lock);
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0071-nouveau-Fix-alignment-requirements-on-src-and-dst-ad.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0071-nouveau-Fix-alignment-requirements-on-src-and-dst-ad.patch
new file mode 100644
index 0000000..96bdd5d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0071-nouveau-Fix-alignment-requirements-on-src-and-dst-ad.patch
@@ -0,0 +1,748 @@
+From ea77473ebf8397a7462fd28ad93e01a50084b146 Mon Sep 17 00:00:00 2001
+From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
+Date: Mon, 4 Jun 2012 12:00:31 +0200
+Subject: [PATCH 71/73] nouveau: Fix alignment requirements on src and dst
+ addresses
+
+commit ce806a30470bcd846d148bf39d46de3ad7748228 upstream.
+
+Linear copy works by adding the offset to the buffer address,
+which may end up not being 16-byte aligned.
+
+Some tests I've written for prime_pcopy show that the engine
+allows this correctly, so the restriction on lowest 4 bits of
+address can be lifted safely.
+
+The comments added were by envyas, I think because I used
+a newer version.
+
+Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
+[bwh: Backported to 3.2: no # prefixes in nva3_copy.fuc]
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ drivers/gpu/drm/nouveau/nva3_copy.fuc   |    4 +-
+ drivers/gpu/drm/nouveau/nva3_copy.fuc.h |   94 +++++++++++++++++++++++++++++-
+ drivers/gpu/drm/nouveau/nvc0_copy.fuc.h |   87 +++++++++++++++++++++++++++-
+ 3 files changed, 175 insertions(+), 10 deletions(-)
+
+diff --git a/drivers/gpu/drm/nouveau/nva3_copy.fuc b/drivers/gpu/drm/nouveau/nva3_copy.fuc
+index eaf35f8..d894731 100644
+--- a/drivers/gpu/drm/nouveau/nva3_copy.fuc
++++ b/drivers/gpu/drm/nouveau/nva3_copy.fuc
+@@ -118,9 +118,9 @@ dispatch_dma:
+ // mthd 0x030c-0x0340, various stuff
+ .b16 0xc3 14
+ .b32 ctx_src_address_high           ~0x000000ff
+-.b32 ctx_src_address_low            ~0xfffffff0
++.b32 ctx_src_address_low            ~0xffffffff
+ .b32 ctx_dst_address_high           ~0x000000ff
+-.b32 ctx_dst_address_low            ~0xfffffff0
++.b32 ctx_dst_address_low            ~0xffffffff
+ .b32 ctx_src_pitch                  ~0x0007ffff
+ .b32 ctx_dst_pitch                  ~0x0007ffff
+ .b32 ctx_xcnt                       ~0x0000ffff
+diff --git a/drivers/gpu/drm/nouveau/nva3_copy.fuc.h b/drivers/gpu/drm/nouveau/nva3_copy.fuc.h
+index 2731de2..e2a0e88 100644
+--- a/drivers/gpu/drm/nouveau/nva3_copy.fuc.h
++++ b/drivers/gpu/drm/nouveau/nva3_copy.fuc.h
+@@ -1,37 +1,72 @@
+-uint32_t nva3_pcopy_data[] = {
++u32 nva3_pcopy_data[] = {
++/* 0x0000: ctx_object */
+ 	0x00000000,
++/* 0x0004: ctx_dma */
++/* 0x0004: ctx_dma_query */
+ 	0x00000000,
++/* 0x0008: ctx_dma_src */
+ 	0x00000000,
++/* 0x000c: ctx_dma_dst */
+ 	0x00000000,
++/* 0x0010: ctx_query_address_high */
+ 	0x00000000,
++/* 0x0014: ctx_query_address_low */
+ 	0x00000000,
++/* 0x0018: ctx_query_counter */
+ 	0x00000000,
++/* 0x001c: ctx_src_address_high */
+ 	0x00000000,
++/* 0x0020: ctx_src_address_low */
+ 	0x00000000,
++/* 0x0024: ctx_src_pitch */
+ 	0x00000000,
++/* 0x0028: ctx_src_tile_mode */
+ 	0x00000000,
++/* 0x002c: ctx_src_xsize */
+ 	0x00000000,
++/* 0x0030: ctx_src_ysize */
+ 	0x00000000,
++/* 0x0034: ctx_src_zsize */
+ 	0x00000000,
++/* 0x0038: ctx_src_zoff */
+ 	0x00000000,
++/* 0x003c: ctx_src_xoff */
+ 	0x00000000,
++/* 0x0040: ctx_src_yoff */
+ 	0x00000000,
++/* 0x0044: ctx_src_cpp */
+ 	0x00000000,
++/* 0x0048: ctx_dst_address_high */
+ 	0x00000000,
++/* 0x004c: ctx_dst_address_low */
+ 	0x00000000,
++/* 0x0050: ctx_dst_pitch */
+ 	0x00000000,
++/* 0x0054: ctx_dst_tile_mode */
+ 	0x00000000,
++/* 0x0058: ctx_dst_xsize */
+ 	0x00000000,
++/* 0x005c: ctx_dst_ysize */
+ 	0x00000000,
++/* 0x0060: ctx_dst_zsize */
+ 	0x00000000,
++/* 0x0064: ctx_dst_zoff */
+ 	0x00000000,
++/* 0x0068: ctx_dst_xoff */
+ 	0x00000000,
++/* 0x006c: ctx_dst_yoff */
+ 	0x00000000,
++/* 0x0070: ctx_dst_cpp */
+ 	0x00000000,
++/* 0x0074: ctx_format */
+ 	0x00000000,
++/* 0x0078: ctx_swz_const0 */
+ 	0x00000000,
++/* 0x007c: ctx_swz_const1 */
+ 	0x00000000,
++/* 0x0080: ctx_xcnt */
+ 	0x00000000,
++/* 0x0084: ctx_ycnt */
+ 	0x00000000,
+ 	0x00000000,
+ 	0x00000000,
+@@ -63,6 +98,7 @@ uint32_t nva3_pcopy_data[] = {
+ 	0x00000000,
+ 	0x00000000,
+ 	0x00000000,
++/* 0x0100: dispatch_table */
+ 	0x00010000,
+ 	0x00000000,
+ 	0x00000000,
+@@ -73,6 +109,7 @@ uint32_t nva3_pcopy_data[] = {
+ 	0x00010162,
+ 	0x00000000,
+ 	0x00030060,
++/* 0x0128: dispatch_dma */
+ 	0x00010170,
+ 	0x00000000,
+ 	0x00010170,
+@@ -118,11 +155,11 @@ uint32_t nva3_pcopy_data[] = {
+ 	0x0000001c,
+ 	0xffffff00,
+ 	0x00000020,
+-	0x0000000f,
++	0x00000000,
+ 	0x00000048,
+ 	0xffffff00,
+ 	0x0000004c,
+-	0x0000000f,
++	0x00000000,
+ 	0x00000024,
+ 	0xfff80000,
+ 	0x00000050,
+@@ -146,7 +183,8 @@ uint32_t nva3_pcopy_data[] = {
+ 	0x00000800,
+ };
+ 
+-uint32_t nva3_pcopy_code[] = {
++u32 nva3_pcopy_code[] = {
++/* 0x0000: main */
+ 	0x04fe04bd,
+ 	0x3517f000,
+ 	0xf10010fe,
+@@ -158,23 +196,31 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x17f11031,
+ 	0x27f01200,
+ 	0x0012d003,
++/* 0x002f: spin */
+ 	0xf40031f4,
+ 	0x0ef40028,
++/* 0x0035: ih */
+ 	0x8001cffd,
+ 	0xf40812c4,
+ 	0x21f4060b,
++/* 0x0041: ih_no_chsw */
+ 	0x0412c472,
+ 	0xf4060bf4,
++/* 0x004a: ih_no_cmd */
+ 	0x11c4c321,
+ 	0x4001d00c,
++/* 0x0052: swctx */
+ 	0x47f101f8,
+ 	0x4bfe7700,
+ 	0x0007fe00,
+ 	0xf00204b9,
+ 	0x01f40643,
+ 	0x0604fa09,
++/* 0x006b: swctx_load */
+ 	0xfa060ef4,
++/* 0x006e: swctx_done */
+ 	0x03f80504,
++/* 0x0072: chsw */
+ 	0x27f100f8,
+ 	0x23cf1400,
+ 	0x1e3fc800,
+@@ -183,18 +229,22 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x1e3af052,
+ 	0xf00023d0,
+ 	0x24d00147,
++/* 0x0093: chsw_no_unload */
+ 	0xcf00f880,
+ 	0x3dc84023,
+ 	0x220bf41e,
+ 	0xf40131f4,
+ 	0x57f05221,
+ 	0x0367f004,
++/* 0x00a8: chsw_load_ctx_dma */
+ 	0xa07856bc,
+ 	0xb6018068,
+ 	0x87d00884,
+ 	0x0162b600,
++/* 0x00bb: chsw_finish_load */
+ 	0xf0f018f4,
+ 	0x23d00237,
++/* 0x00c3: dispatch */
+ 	0xf100f880,
+ 	0xcf190037,
+ 	0x33cf4032,
+@@ -202,6 +252,7 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x1024b607,
+ 	0x010057f1,
+ 	0x74bd64bd,
++/* 0x00dc: dispatch_loop */
+ 	0x58005658,
+ 	0x50b60157,
+ 	0x0446b804,
+@@ -211,6 +262,7 @@ uint32_t nva3_pcopy_code[] = {
+ 	0xb60276bb,
+ 	0x57bb0374,
+ 	0xdf0ef400,
++/* 0x0100: dispatch_valid_mthd */
+ 	0xb60246bb,
+ 	0x45bb0344,
+ 	0x01459800,
+@@ -220,31 +272,41 @@ uint32_t nva3_pcopy_code[] = {
+ 	0xb0014658,
+ 	0x1bf40064,
+ 	0x00538009,
++/* 0x0127: dispatch_cmd */
+ 	0xf4300ef4,
+ 	0x55f90132,
+ 	0xf40c01f4,
++/* 0x0132: dispatch_invalid_bitfield */
+ 	0x25f0250e,
++/* 0x0135: dispatch_illegal_mthd */
+ 	0x0125f002,
++/* 0x0138: dispatch_error */
+ 	0x100047f1,
+ 	0xd00042d0,
+ 	0x27f04043,
+ 	0x0002d040,
++/* 0x0148: hostirq_wait */
+ 	0xf08002cf,
+ 	0x24b04024,
+ 	0xf71bf400,
++/* 0x0154: dispatch_done */
+ 	0x1d0027f1,
+ 	0xd00137f0,
+ 	0x00f80023,
++/* 0x0160: cmd_nop */
++/* 0x0162: cmd_pm_trigger */
+ 	0x27f100f8,
+ 	0x34bd2200,
+ 	0xd00233f0,
+ 	0x00f80023,
++/* 0x0170: cmd_dma */
+ 	0x012842b7,
+ 	0xf00145b6,
+ 	0x43801e39,
+ 	0x0040b701,
+ 	0x0644b606,
+ 	0xf80043d0,
++/* 0x0189: cmd_exec_set_format */
+ 	0xf030f400,
+ 	0xb00001b0,
+ 	0x01b00101,
+@@ -256,20 +318,26 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x70b63847,
+ 	0x0232f401,
+ 	0x94bd84bd,
++/* 0x01b4: ncomp_loop */
+ 	0xb60f4ac4,
+ 	0xb4bd0445,
++/* 0x01bc: bpc_loop */
+ 	0xf404a430,
+ 	0xa5ff0f18,
+ 	0x00cbbbc0,
+ 	0xf40231f4,
++/* 0x01ce: cmp_c0 */
+ 	0x1bf4220e,
+ 	0x10c7f00c,
+ 	0xf400cbbb,
++/* 0x01da: cmp_c1 */
+ 	0xa430160e,
+ 	0x0c18f406,
+ 	0xbb14c7f0,
+ 	0x0ef400cb,
++/* 0x01e9: cmp_zero */
+ 	0x80c7f107,
++/* 0x01ed: bpc_next */
+ 	0x01c83800,
+ 	0xb60180b6,
+ 	0xb5b801b0,
+@@ -280,6 +348,7 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x98110680,
+ 	0x68fd2008,
+ 	0x0502f400,
++/* 0x0216: dst_xcnt */
+ 	0x75fd64bd,
+ 	0x1c078000,
+ 	0xf10078fd,
+@@ -304,6 +373,7 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x980056d0,
+ 	0x56d01f06,
+ 	0x1030f440,
++/* 0x0276: cmd_exec_set_surface_tiled */
+ 	0x579800f8,
+ 	0x6879c70a,
+ 	0xb66478c7,
+@@ -311,9 +381,11 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x0e76b060,
+ 	0xf0091bf4,
+ 	0x0ef40477,
++/* 0x0291: xtile64 */
+ 	0x027cf00f,
+ 	0xfd1170b6,
+ 	0x77f00947,
++/* 0x029d: xtileok */
+ 	0x0f5a9806,
+ 	0xfd115b98,
+ 	0xb7f000ab,
+@@ -371,6 +443,7 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x67d00600,
+ 	0x0060b700,
+ 	0x0068d004,
++/* 0x0382: cmd_exec_set_surface_linear */
+ 	0x6cf000f8,
+ 	0x0260b702,
+ 	0x0864b602,
+@@ -381,13 +454,16 @@ uint32_t nva3_pcopy_code[] = {
+ 	0xb70067d0,
+ 	0x98040060,
+ 	0x67d00957,
++/* 0x03ab: cmd_exec_wait */
+ 	0xf900f800,
+ 	0xf110f900,
+ 	0xb6080007,
++/* 0x03b6: loop */
+ 	0x01cf0604,
+ 	0x0114f000,
+ 	0xfcfa1bf4,
+ 	0xf800fc10,
++/* 0x03c5: cmd_exec_query */
+ 	0x0d34c800,
+ 	0xf5701bf4,
+ 	0xf103ab21,
+@@ -417,6 +493,7 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x47f10153,
+ 	0x44b60800,
+ 	0x0045d006,
++/* 0x0438: query_counter */
+ 	0x03ab21f5,
+ 	0x080c47f1,
+ 	0x980644b6,
+@@ -439,11 +516,13 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x47f10153,
+ 	0x44b60800,
+ 	0x0045d006,
++/* 0x0492: cmd_exec */
+ 	0x21f500f8,
+ 	0x3fc803ab,
+ 	0x0e0bf400,
+ 	0x018921f5,
+ 	0x020047f1,
++/* 0x04a7: cmd_exec_no_format */
+ 	0xf11e0ef4,
+ 	0xb6081067,
+ 	0x77f00664,
+@@ -451,19 +530,24 @@ uint32_t nva3_pcopy_code[] = {
+ 	0x981c0780,
+ 	0x67d02007,
+ 	0x4067d000,
++/* 0x04c2: cmd_exec_init_src_surface */
+ 	0x32f444bd,
+ 	0xc854bd02,
+ 	0x0bf4043f,
+ 	0x8221f50a,
+ 	0x0a0ef403,
++/* 0x04d4: src_tiled */
+ 	0x027621f5,
++/* 0x04db: cmd_exec_init_dst_surface */
+ 	0xf40749f0,
+ 	0x57f00231,
+ 	0x083fc82c,
+ 	0xf50a0bf4,
+ 	0xf4038221,
++/* 0x04ee: dst_tiled */
+ 	0x21f50a0e,
+ 	0x49f00276,
++/* 0x04f5: cmd_exec_kick */
+ 	0x0057f108,
+ 	0x0654b608,
+ 	0xd0210698,
+@@ -473,6 +557,8 @@ uint32_t nva3_pcopy_code[] = {
+ 	0xc80054d0,
+ 	0x0bf40c3f,
+ 	0xc521f507,
++/* 0x0519: cmd_exec_done */
++/* 0x051b: cmd_wrcache_flush */
+ 	0xf100f803,
+ 	0xbd220027,
+ 	0x0133f034,
+diff --git a/drivers/gpu/drm/nouveau/nvc0_copy.fuc.h b/drivers/gpu/drm/nouveau/nvc0_copy.fuc.h
+index 4199038..9e87036 100644
+--- a/drivers/gpu/drm/nouveau/nvc0_copy.fuc.h
++++ b/drivers/gpu/drm/nouveau/nvc0_copy.fuc.h
+@@ -1,34 +1,65 @@
+-uint32_t nvc0_pcopy_data[] = {
++u32 nvc0_pcopy_data[] = {
++/* 0x0000: ctx_object */
+ 	0x00000000,
++/* 0x0004: ctx_query_address_high */
+ 	0x00000000,
++/* 0x0008: ctx_query_address_low */
+ 	0x00000000,
++/* 0x000c: ctx_query_counter */
+ 	0x00000000,
++/* 0x0010: ctx_src_address_high */
+ 	0x00000000,
++/* 0x0014: ctx_src_address_low */
+ 	0x00000000,
++/* 0x0018: ctx_src_pitch */
+ 	0x00000000,
++/* 0x001c: ctx_src_tile_mode */
+ 	0x00000000,
++/* 0x0020: ctx_src_xsize */
+ 	0x00000000,
++/* 0x0024: ctx_src_ysize */
+ 	0x00000000,
++/* 0x0028: ctx_src_zsize */
+ 	0x00000000,
++/* 0x002c: ctx_src_zoff */
+ 	0x00000000,
++/* 0x0030: ctx_src_xoff */
+ 	0x00000000,
++/* 0x0034: ctx_src_yoff */
+ 	0x00000000,
++/* 0x0038: ctx_src_cpp */
+ 	0x00000000,
++/* 0x003c: ctx_dst_address_high */
+ 	0x00000000,
++/* 0x0040: ctx_dst_address_low */
+ 	0x00000000,
++/* 0x0044: ctx_dst_pitch */
+ 	0x00000000,
++/* 0x0048: ctx_dst_tile_mode */
+ 	0x00000000,
++/* 0x004c: ctx_dst_xsize */
+ 	0x00000000,
++/* 0x0050: ctx_dst_ysize */
+ 	0x00000000,
++/* 0x0054: ctx_dst_zsize */
+ 	0x00000000,
++/* 0x0058: ctx_dst_zoff */
+ 	0x00000000,
++/* 0x005c: ctx_dst_xoff */
+ 	0x00000000,
++/* 0x0060: ctx_dst_yoff */
+ 	0x00000000,
++/* 0x0064: ctx_dst_cpp */
+ 	0x00000000,
++/* 0x0068: ctx_format */
+ 	0x00000000,
++/* 0x006c: ctx_swz_const0 */
+ 	0x00000000,
++/* 0x0070: ctx_swz_const1 */
+ 	0x00000000,
++/* 0x0074: ctx_xcnt */
+ 	0x00000000,
++/* 0x0078: ctx_ycnt */
+ 	0x00000000,
+ 	0x00000000,
+ 	0x00000000,
+@@ -63,6 +94,7 @@ uint32_t nvc0_pcopy_data[] = {
+ 	0x00000000,
+ 	0x00000000,
+ 	0x00000000,
++/* 0x0100: dispatch_table */
+ 	0x00010000,
+ 	0x00000000,
+ 	0x00000000,
+@@ -111,11 +143,11 @@ uint32_t nvc0_pcopy_data[] = {
+ 	0x00000010,
+ 	0xffffff00,
+ 	0x00000014,
+-	0x0000000f,
++	0x00000000,
+ 	0x0000003c,
+ 	0xffffff00,
+ 	0x00000040,
+-	0x0000000f,
++	0x00000000,
+ 	0x00000018,
+ 	0xfff80000,
+ 	0x00000044,
+@@ -139,7 +171,8 @@ uint32_t nvc0_pcopy_data[] = {
+ 	0x00000800,
+ };
+ 
+-uint32_t nvc0_pcopy_code[] = {
++u32 nvc0_pcopy_code[] = {
++/* 0x0000: main */
+ 	0x04fe04bd,
+ 	0x3517f000,
+ 	0xf10010fe,
+@@ -151,15 +184,20 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x17f11031,
+ 	0x27f01200,
+ 	0x0012d003,
++/* 0x002f: spin */
+ 	0xf40031f4,
+ 	0x0ef40028,
++/* 0x0035: ih */
+ 	0x8001cffd,
+ 	0xf40812c4,
+ 	0x21f4060b,
++/* 0x0041: ih_no_chsw */
+ 	0x0412c4ca,
+ 	0xf5070bf4,
++/* 0x004b: ih_no_cmd */
+ 	0xc4010221,
+ 	0x01d00c11,
++/* 0x0053: swctx */
+ 	0xf101f840,
+ 	0xfe770047,
+ 	0x47f1004b,
+@@ -188,8 +226,11 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0xf00204b9,
+ 	0x01f40643,
+ 	0x0604fa09,
++/* 0x00c3: swctx_load */
+ 	0xfa060ef4,
++/* 0x00c6: swctx_done */
+ 	0x03f80504,
++/* 0x00ca: chsw */
+ 	0x27f100f8,
+ 	0x23cf1400,
+ 	0x1e3fc800,
+@@ -198,18 +239,22 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x1e3af053,
+ 	0xf00023d0,
+ 	0x24d00147,
++/* 0x00eb: chsw_no_unload */
+ 	0xcf00f880,
+ 	0x3dc84023,
+ 	0x090bf41e,
+ 	0xf40131f4,
++/* 0x00fa: chsw_finish_load */
+ 	0x37f05321,
+ 	0x8023d002,
++/* 0x0102: dispatch */
+ 	0x37f100f8,
+ 	0x32cf1900,
+ 	0x0033cf40,
+ 	0x07ff24e4,
+ 	0xf11024b6,
+ 	0xbd010057,
++/* 0x011b: dispatch_loop */
+ 	0x5874bd64,
+ 	0x57580056,
+ 	0x0450b601,
+@@ -219,6 +264,7 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0xbb0f08f4,
+ 	0x74b60276,
+ 	0x0057bb03,
++/* 0x013f: dispatch_valid_mthd */
+ 	0xbbdf0ef4,
+ 	0x44b60246,
+ 	0x0045bb03,
+@@ -229,24 +275,33 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x64b00146,
+ 	0x091bf400,
+ 	0xf4005380,
++/* 0x0166: dispatch_cmd */
+ 	0x32f4300e,
+ 	0xf455f901,
+ 	0x0ef40c01,
++/* 0x0171: dispatch_invalid_bitfield */
+ 	0x0225f025,
++/* 0x0174: dispatch_illegal_mthd */
++/* 0x0177: dispatch_error */
+ 	0xf10125f0,
+ 	0xd0100047,
+ 	0x43d00042,
+ 	0x4027f040,
++/* 0x0187: hostirq_wait */
+ 	0xcf0002d0,
+ 	0x24f08002,
+ 	0x0024b040,
++/* 0x0193: dispatch_done */
+ 	0xf1f71bf4,
+ 	0xf01d0027,
+ 	0x23d00137,
++/* 0x019f: cmd_nop */
+ 	0xf800f800,
++/* 0x01a1: cmd_pm_trigger */
+ 	0x0027f100,
+ 	0xf034bd22,
+ 	0x23d00233,
++/* 0x01af: cmd_exec_set_format */
+ 	0xf400f800,
+ 	0x01b0f030,
+ 	0x0101b000,
+@@ -258,20 +313,26 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x3847c701,
+ 	0xf40170b6,
+ 	0x84bd0232,
++/* 0x01da: ncomp_loop */
+ 	0x4ac494bd,
+ 	0x0445b60f,
++/* 0x01e2: bpc_loop */
+ 	0xa430b4bd,
+ 	0x0f18f404,
+ 	0xbbc0a5ff,
+ 	0x31f400cb,
+ 	0x220ef402,
++/* 0x01f4: cmp_c0 */
+ 	0xf00c1bf4,
+ 	0xcbbb10c7,
+ 	0x160ef400,
++/* 0x0200: cmp_c1 */
+ 	0xf406a430,
+ 	0xc7f00c18,
+ 	0x00cbbb14,
++/* 0x020f: cmp_zero */
+ 	0xf1070ef4,
++/* 0x0213: bpc_next */
+ 	0x380080c7,
+ 	0x80b601c8,
+ 	0x01b0b601,
+@@ -283,6 +344,7 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x1d08980e,
+ 	0xf40068fd,
+ 	0x64bd0502,
++/* 0x023c: dst_xcnt */
+ 	0x800075fd,
+ 	0x78fd1907,
+ 	0x1057f100,
+@@ -307,15 +369,18 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x1c069800,
+ 	0xf44056d0,
+ 	0x00f81030,
++/* 0x029c: cmd_exec_set_surface_tiled */
+ 	0xc7075798,
+ 	0x78c76879,
+ 	0x0380b664,
+ 	0xb06077c7,
+ 	0x1bf40e76,
+ 	0x0477f009,
++/* 0x02b7: xtile64 */
+ 	0xf00f0ef4,
+ 	0x70b6027c,
+ 	0x0947fd11,
++/* 0x02c3: xtileok */
+ 	0x980677f0,
+ 	0x5b980c5a,
+ 	0x00abfd0e,
+@@ -374,6 +439,7 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0xb70067d0,
+ 	0xd0040060,
+ 	0x00f80068,
++/* 0x03a8: cmd_exec_set_surface_linear */
+ 	0xb7026cf0,
+ 	0xb6020260,
+ 	0x57980864,
+@@ -384,12 +450,15 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x0060b700,
+ 	0x06579804,
+ 	0xf80067d0,
++/* 0x03d1: cmd_exec_wait */
+ 	0xf900f900,
+ 	0x0007f110,
+ 	0x0604b608,
++/* 0x03dc: loop */
+ 	0xf00001cf,
+ 	0x1bf40114,
+ 	0xfc10fcfa,
++/* 0x03eb: cmd_exec_query */
+ 	0xc800f800,
+ 	0x1bf40d34,
+ 	0xd121f570,
+@@ -419,6 +488,7 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x0153f026,
+ 	0x080047f1,
+ 	0xd00644b6,
++/* 0x045e: query_counter */
+ 	0x21f50045,
+ 	0x47f103d1,
+ 	0x44b6080c,
+@@ -442,11 +512,13 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x080047f1,
+ 	0xd00644b6,
+ 	0x00f80045,
++/* 0x04b8: cmd_exec */
+ 	0x03d121f5,
+ 	0xf4003fc8,
+ 	0x21f50e0b,
+ 	0x47f101af,
+ 	0x0ef40200,
++/* 0x04cd: cmd_exec_no_format */
+ 	0x1067f11e,
+ 	0x0664b608,
+ 	0x800177f0,
+@@ -454,18 +526,23 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x1d079819,
+ 	0xd00067d0,
+ 	0x44bd4067,
++/* 0x04e8: cmd_exec_init_src_surface */
+ 	0xbd0232f4,
+ 	0x043fc854,
+ 	0xf50a0bf4,
+ 	0xf403a821,
++/* 0x04fa: src_tiled */
+ 	0x21f50a0e,
+ 	0x49f0029c,
++/* 0x0501: cmd_exec_init_dst_surface */
+ 	0x0231f407,
+ 	0xc82c57f0,
+ 	0x0bf4083f,
+ 	0xa821f50a,
+ 	0x0a0ef403,
++/* 0x0514: dst_tiled */
+ 	0x029c21f5,
++/* 0x051b: cmd_exec_kick */
+ 	0xf10849f0,
+ 	0xb6080057,
+ 	0x06980654,
+@@ -475,7 +552,9 @@ uint32_t nvc0_pcopy_code[] = {
+ 	0x54d00546,
+ 	0x0c3fc800,
+ 	0xf5070bf4,
++/* 0x053f: cmd_exec_done */
+ 	0xf803eb21,
++/* 0x0541: cmd_wrcache_flush */
+ 	0x0027f100,
+ 	0xf034bd22,
+ 	0x23d00133,
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0072-mm-fix-wrong-argument-of-migrate_huge_pages-in-soft_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0072-mm-fix-wrong-argument-of-migrate_huge_pages-in-soft_.patch
new file mode 100644
index 0000000..6d93dda
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0072-mm-fix-wrong-argument-of-migrate_huge_pages-in-soft_.patch
@@ -0,0 +1,58 @@
+From 10d09034790926ded3c2ee655d72c48219d61122 Mon Sep 17 00:00:00 2001
+From: Joonsoo Kim <js1304@gmail.com>
+Date: Mon, 30 Jul 2012 14:39:04 -0700
+Subject: [PATCH 72/73] mm: fix wrong argument of migrate_huge_pages() in
+ soft_offline_huge_page()
+
+commit dc32f63453f56d07a1073a697dcd843dd3098c09 upstream.
+
+Commit a6bc32b89922 ("mm: compaction: introduce sync-light migration for
+use by compaction") changed the declaration of migrate_pages() and
+migrate_huge_pages().
+
+But it missed changing the argument of migrate_huge_pages() in
+soft_offline_huge_page().  In this case, we should call
+migrate_huge_pages() with MIGRATE_SYNC.
+
+Additionally, there is a mismatch between type the of argument and the
+function declaration for migrate_pages().
+
+Signed-off-by: Joonsoo Kim <js1304@gmail.com>
+Cc: Christoph Lameter <cl@linux.com>
+Cc: Mel Gorman <mgorman@suse.de>
+Acked-by: David Rientjes <rientjes@google.com>
+Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.vnet.ibm.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+---
+ mm/memory-failure.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mm/memory-failure.c b/mm/memory-failure.c
+index 56080ea..5bd5bb1 100644
+--- a/mm/memory-failure.c
++++ b/mm/memory-failure.c
+@@ -1427,8 +1427,8 @@ static int soft_offline_huge_page(struct page *page, int flags)
+ 	/* Keep page count to indicate a given hugepage is isolated. */
+ 
+ 	list_add(&hpage->lru, &pagelist);
+-	ret = migrate_huge_pages(&pagelist, new_page, MPOL_MF_MOVE_ALL, 0,
+-				true);
++	ret = migrate_huge_pages(&pagelist, new_page, MPOL_MF_MOVE_ALL, false,
++				MIGRATE_SYNC);
+ 	if (ret) {
+ 		struct page *page1, *page2;
+ 		list_for_each_entry_safe(page1, page2, &pagelist, lru)
+@@ -1557,7 +1557,7 @@ int soft_offline_page(struct page *page, int flags)
+ 					    page_is_file_cache(page));
+ 		list_add(&page->lru, &pagelist);
+ 		ret = migrate_pages(&pagelist, new_page, MPOL_MF_MOVE_ALL,
+-							0, MIGRATE_SYNC);
++							false, MIGRATE_SYNC);
+ 		if (ret) {
+ 			putback_lru_pages(&pagelist);
+ 			pr_info("soft offline: %#lx: migration failed %d, type %lx\n",
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0073-Linux-3.2.25.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0073-Linux-3.2.25.patch
new file mode 100644
index 0000000..cb9db48
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.25/0073-Linux-3.2.25.patch
@@ -0,0 +1,24 @@
+From d5f196e5b0f7d3770840af22c9fbd4b8355fd792 Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Thu, 2 Aug 2012 14:38:04 +0100
+Subject: [PATCH 73/73] Linux 3.2.25
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 80bb4fd..e13e4e7 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 24
++SUBLEVEL = 25
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.6
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 4c870bc..77b1680 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -11,11 +11,11 @@ S = "${WORKDIR}/git"
 MULTI_CONFIG_BASE_SUFFIX = ""
 
 # the PATCHES_OVER_PSP updates it to 3.2.x, so adjust PV to match
-PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.23", d)}"
+PV = "${@base_contains('DISTRO_FEATURES', 'tipspkernel', "3.2", "3.2.25", d)}"
 
 BRANCH = "v3.2-staging"
 SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
-MACHINE_KERNEL_PR_append = "i+gitr${SRCREV}"
+MACHINE_KERNEL_PR_append = "a+gitr${SRCREV}"
 
 COMPATIBLE_MACHINE = "(ti33x)"
 
@@ -1540,6 +1540,188 @@ PATCHES_OVER_PSP = " \
 	file://3.2.23/0047-tcm_fc-Resolve-suspicious-RCU-usage-warnings.patch \
 	file://3.2.23/0048-vfs-make-O_PATH-file-descriptors-usable-for-fchdir.patch \
 	file://3.2.23/0049-Linux-3.2.23.patch \
+	file://3.2.24/0001-samsung-laptop-make-the-dmi-check-less-strict.patch \
+	file://3.2.24/0002-raid5-delayed-stripe-fix.patch \
+	file://3.2.24/0003-tcp-drop-SYN-FIN-messages.patch \
+	file://3.2.24/0004-tg3-Apply-short-DMA-frag-workaround-to-5906.patch \
+	file://3.2.24/0005-rtl8187-brightness_set-can-not-sleep.patch \
+	file://3.2.24/0006-net-wireless-ipw2x00-add-supported-cipher-suites-to-.patch \
+	file://3.2.24/0007-drm-i915-do-not-enable-RC6p-on-Sandy-Bridge.patch \
+	file://3.2.24/0008-drm-i915-fix-operator-precedence-when-enabling-RC6p.patch \
+	file://3.2.24/0009-kbuild-do-not-check-for-ancient-modutils-tools.patch \
+	file://3.2.24/0010-brcmsmac-INTERMEDIATE-but-not-AMPDU-only-when-tracin.patch \
+	file://3.2.24/0011-NFSv4-Rate-limit-the-state-manager-for-lock-reclaim-.patch \
+	file://3.2.24/0012-ext4-Report-max_batch_time-option-correctly.patch \
+	file://3.2.24/0013-hugepages-fix-use-after-free-bug-in-quota-handling.patch \
+	file://3.2.24/0014-NFSv4-Reduce-the-footprint-of-the-idmapper.patch \
+	file://3.2.24/0015-NFSv4-Further-reduce-the-footprint-of-the-idmapper.patch \
+	file://3.2.24/0016-macvtap-zerocopy-fix-offset-calculation-when-buildin.patch \
+	file://3.2.24/0017-macvtap-zerocopy-fix-truesize-underestimation.patch \
+	file://3.2.24/0018-macvtap-zerocopy-put-page-when-fail-to-get-all-reque.patch \
+	file://3.2.24/0019-macvtap-zerocopy-set-SKBTX_DEV_ZEROCOPY-only-when-sk.patch \
+	file://3.2.24/0020-macvtap-zerocopy-validate-vectors-before-building-sk.patch \
+	file://3.2.24/0021-KVM-Fix-buffer-overflow-in-kvm_set_irq.patch \
+	file://3.2.24/0022-scsi-Silence-unnecessary-warnings-about-ioctl-to-par.patch \
+	file://3.2.24/0023-epoll-clear-the-tfile_check_list-on-ELOOP.patch \
+	file://3.2.24/0024-iommu-amd-Fix-missing-iommu_shutdown-initialization-.patch \
+	file://3.2.24/0025-iommu-amd-Initialize-dma_ops-for-hotplug-and-sriov-d.patch \
+	file://3.2.24/0026-usb-Add-support-for-root-hub-port-status-CAS.patch \
+	file://3.2.24/0027-gpiolib-wm8994-Pay-attention-to-the-value-set-when-e.patch \
+	file://3.2.24/0028-sched-nohz-Rewrite-and-fix-load-avg-computation-agai.patch \
+	file://3.2.24/0029-USB-option-add-ZTE-MF60.patch \
+	file://3.2.24/0030-USB-option-Add-MEDIATEK-product-ids.patch \
+	file://3.2.24/0031-USB-cdc-wdm-fix-lockup-on-error-in-wdm_read.patch \
+	file://3.2.24/0032-mtd-nandsim-don-t-open-code-a-do_div-helper.patch \
+	file://3.2.24/0033-dvb-core-Release-semaphore-on-error-path-dvb_registe.patch \
+	file://3.2.24/0034-hwspinlock-core-use-global-ID-to-register-hwspinlock.patch \
+	file://3.2.24/0035-libsas-fix-taskfile-corruption-in-sas_ata_qc_fill_rt.patch \
+	file://3.2.24/0036-md-raid1-fix-use-after-free-bug-in-RAID1-data-check-.patch \
+	file://3.2.24/0037-PCI-EHCI-fix-crash-during-suspend-on-ASUS-computers.patch \
+	file://3.2.24/0038-memory-hotplug-fix-invalid-memory-access-caused-by-s.patch \
+	file://3.2.24/0039-ocfs2-fix-NULL-pointer-dereference-in-__ocfs2_change.patch \
+	file://3.2.24/0040-mm-thp-abort-compaction-if-migration-page-cannot-be-.patch \
+	file://3.2.24/0041-drivers-rtc-rtc-mxc.c-fix-irq-enabled-interrupts-war.patch \
+	file://3.2.24/0042-fs-ramfs-file-nommu-add-SetPageUptodate.patch \
+	file://3.2.24/0043-cpufreq-ACPI-Fix-not-loading-acpi-cpufreq-driver-reg.patch \
+	file://3.2.24/0044-hwmon-it87-Preserve-configuration-register-bits-on-i.patch \
+	file://3.2.24/0045-ARM-SAMSUNG-fix-race-in-s3c_adc_start-for-ADC.patch \
+	file://3.2.24/0046-block-fix-infinite-loop-in-__getblk_slow.patch \
+	file://3.2.24/0047-Remove-easily-user-triggerable-BUG-from-generic_setl.patch \
+	file://3.2.24/0048-NFC-Export-nfc.h-to-userland.patch \
+	file://3.2.24/0049-PM-Hibernate-Hibernate-thaw-fixes-improvements.patch \
+	file://3.2.24/0050-cfg80211-check-iface-combinations-only-when-iface-is.patch \
+	file://3.2.24/0051-intel_ips-blacklist-HP-ProBook-laptops.patch \
+	file://3.2.24/0052-atl1c-fix-issue-of-transmit-queue-0-timed-out.patch \
+	file://3.2.24/0053-rt2x00usb-fix-indexes-ordering-on-RX-queue-kick.patch \
+	file://3.2.24/0054-iwlegacy-always-monitor-for-stuck-queues.patch \
+	file://3.2.24/0055-iwlegacy-don-t-mess-up-the-SCD-when-removing-a-key.patch \
+	file://3.2.24/0056-e1000e-Correct-link-check-logic-for-82571-serdes.patch \
+	file://3.2.24/0057-tcm_fc-Fix-crash-seen-with-aborts-and-large-reads.patch \
+	file://3.2.24/0058-fifo-Do-not-restart-open-if-it-already-found-a-partn.patch \
+	file://3.2.24/0059-target-Clean-up-returning-errors-in-PR-handling-code.patch \
+	file://3.2.24/0060-target-Fix-range-calculation-in-WRITE-SAME-emulation.patch \
+	file://3.2.24/0061-cifs-on-CONFIG_HIGHMEM-machines-limit-the-rsize-wsiz.patch \
+	file://3.2.24/0062-cifs-always-update-the-inode-cache-with-the-results-.patch \
+	file://3.2.24/0063-mm-fix-lost-kswapd-wakeup-in-kswapd_stop.patch \
+	file://3.2.24/0064-md-avoid-crash-when-stopping-md-array-races-with-clo.patch \
+	file://3.2.24/0065-md-raid1-close-some-possible-races-on-write-errors-d.patch \
+	file://3.2.24/0066-MIPS-Properly-align-the-.data.init_task-section.patch \
+	file://3.2.24/0067-UBIFS-fix-a-bug-in-empty-space-fix-up.patch \
+	file://3.2.24/0068-ore-Fix-NFS-crash-by-supporting-any-unaligned-RAID-I.patch \
+	file://3.2.24/0069-ore-Remove-support-of-partial-IO-request-NFS-crash.patch \
+	file://3.2.24/0070-pnfs-obj-don-t-leak-objio_state-if-ore_write-read-fa.patch \
+	file://3.2.24/0071-pnfs-obj-Fix-__r4w_get_page-when-offset-is-beyond-i_.patch \
+	file://3.2.24/0072-dm-raid1-fix-crash-with-mirror-recovery-and-discard.patch \
+	file://3.2.24/0073-dm-raid1-set-discard_zeroes_data_unsupported.patch \
+	file://3.2.24/0074-ntp-Fix-leap-second-hrtimer-livelock.patch \
+	file://3.2.24/0075-ntp-Correct-TAI-offset-during-leap-second.patch \
+	file://3.2.24/0076-timekeeping-Fix-CLOCK_MONOTONIC-inconsistency-during.patch \
+	file://3.2.24/0077-time-Move-common-updates-to-a-function.patch \
+	file://3.2.24/0078-hrtimer-Provide-clock_was_set_delayed.patch \
+	file://3.2.24/0079-timekeeping-Fix-leapsecond-triggered-load-spike-issu.patch \
+	file://3.2.24/0080-timekeeping-Maintain-ktime_t-based-offsets-for-hrtim.patch \
+	file://3.2.24/0081-hrtimers-Move-lock-held-region-in-hrtimer_interrupt.patch \
+	file://3.2.24/0082-timekeeping-Provide-hrtimer-update-function.patch \
+	file://3.2.24/0083-hrtimer-Update-hrtimer-base-offsets-each-hrtimer_int.patch \
+	file://3.2.24/0084-timekeeping-Add-missing-update-call-in-timekeeping_r.patch \
+	file://3.2.24/0085-powerpc-Fix-wrong-divisor-in-usecs_to_cputime.patch \
+	file://3.2.24/0086-vhost-don-t-forget-to-schedule.patch \
+	file://3.2.24/0087-r8169-call-netif_napi_del-at-errpaths-and-at-driver-.patch \
+	file://3.2.24/0088-bnx2x-fix-checksum-validation.patch \
+	file://3.2.24/0089-bnx2x-fix-panic-when-TX-ring-is-full.patch \
+	file://3.2.24/0090-net-remove-skb_orphan_try.patch \
+	file://3.2.24/0091-ACPI-Make-acpi_skip_timer_override-cover-all-source_.patch \
+	file://3.2.24/0092-ACPI-Remove-one-board-specific-WARN-when-ignoring-ti.patch \
+	file://3.2.24/0093-ACPI-Add-a-quirk-for-AMILO-PRO-V2030-to-ignore-the-t.patch \
+	file://3.2.24/0094-ACPI-x86-fix-Dell-M6600-ACPI-reboot-regression-via-D.patch \
+	file://3.2.24/0095-ACPI-sysfs.c-strlen-fix.patch \
+	file://3.2.24/0096-eCryptfs-Gracefully-refuse-miscdev-file-ops-on-inher.patch \
+	file://3.2.24/0097-eCryptfs-Fix-lockdep-warning-in-miscdev-operations.patch \
+	file://3.2.24/0098-eCryptfs-Properly-check-for-O_RDONLY-flag-before-doi.patch \
+	file://3.2.24/0099-ACPI-PM-Make-acpi_pm_device_sleep_state-follow-the-s.patch \
+	file://3.2.24/0100-ipheth-add-support-for-iPad.patch \
+	file://3.2.24/0101-stmmac-Fix-for-nfs-hang-on-multiple-reboot.patch \
+	file://3.2.24/0102-bonding-debugfs-and-network-namespaces-are-incompati.patch \
+	file://3.2.24/0103-bonding-Manage-proc-net-bonding-entries-from-the-net.patch \
+	file://3.2.24/0104-Input-bcm5974-Add-support-for-2012-MacBook-Pro-Retin.patch \
+	file://3.2.24/0105-Input-xpad-handle-all-variations-of-Mad-Catz-Beat-Pa.patch \
+	file://3.2.24/0106-Input-xpad-add-signature-for-Razer-Onza-Tournament-E.patch \
+	file://3.2.24/0107-Input-xpad-add-Andamiro-Pump-It-Up-pad.patch \
+	file://3.2.24/0108-HID-add-support-for-2012-MacBook-Pro-Retina.patch \
+	file://3.2.24/0109-Linux-3.2.24.patch \
+	file://3.2.25/0001-mm-reduce-the-amount-of-work-done-when-updating-min_.patch \
+	file://3.2.25/0002-mm-compaction-allow-compaction-to-isolate-dirty-page.patch \
+	file://3.2.25/0003-mm-compaction-determine-if-dirty-pages-can-be-migrat.patch \
+	file://3.2.25/0004-mm-page-allocator-do-not-call-direct-reclaim-for-THP.patch \
+	file://3.2.25/0005-mm-compaction-make-isolate_lru_page-filter-aware-aga.patch \
+	file://3.2.25/0006-mm-compaction-introduce-sync-light-migration-for-use.patch \
+	file://3.2.25/0007-mm-vmscan-when-reclaiming-for-compaction-ensure-ther.patch \
+	file://3.2.25/0008-mm-vmscan-do-not-OOM-if-aborting-reclaim-to-start-co.patch \
+	file://3.2.25/0009-mm-vmscan-check-if-reclaim-should-really-abort-even-.patch \
+	file://3.2.25/0010-vmscan-promote-shared-file-mapped-pages.patch \
+	file://3.2.25/0011-vmscan-activate-executable-pages-after-first-usage.patch \
+	file://3.2.25/0012-mm-vmscan.c-consider-swap-space-when-deciding-whethe.patch \
+	file://3.2.25/0013-mm-test-PageSwapBacked-in-lumpy-reclaim.patch \
+	file://3.2.25/0014-mm-vmscan-convert-global-reclaim-to-per-memcg-LRU-li.patch \
+	file://3.2.25/0015-cpuset-mm-reduce-large-amounts-of-memory-barrier-rel.patch \
+	file://3.2.25/0016-mm-hugetlb-fix-warning-in-alloc_huge_page-dequeue_hu.patch \
+	file://3.2.25/0017-Fix-NULL-dereferences-in-scsi_cmd_to_driver.patch \
+	file://3.2.25/0018-sched-nohz-Fix-rq-cpu_load-calculations.patch \
+	file://3.2.25/0019-sched-nohz-Fix-rq-cpu_load-calculations-some-more.patch \
+	file://3.2.25/0020-powerpc-ftrace-Fix-assembly-trampoline-register-usag.patch \
+	file://3.2.25/0021-cx25821-Remove-bad-strcpy-to-read-only-char.patch \
+	file://3.2.25/0022-x86-Fix-boot-on-Twinhead-H12Y.patch \
+	file://3.2.25/0023-r8169-RxConfig-hack-for-the-8168evl.patch \
+	file://3.2.25/0024-cifs-when-CONFIG_HIGHMEM-is-set-serialize-the-read-w.patch \
+	file://3.2.25/0025-wireless-rt2x00-rt2800usb-add-more-devices-ids.patch \
+	file://3.2.25/0026-wireless-rt2x00-rt2800usb-more-devices-were-identifi.patch \
+	file://3.2.25/0027-rt2800usb-2001-3c17-is-an-RT3370-device.patch \
+	file://3.2.25/0028-usb-gadget-Fix-g_ether-interface-link-status.patch \
+	file://3.2.25/0029-ext4-pass-a-char-to-ext4_count_free-instead-of-a-buf.patch \
+	file://3.2.25/0030-ftrace-Disable-function-tracing-during-suspend-resum.patch \
+	file://3.2.25/0031-x86-microcode-microcode_core.c-simple_strtoul-cleanu.patch \
+	file://3.2.25/0032-x86-microcode-Sanitize-per-cpu-microcode-reloading-i.patch \
+	file://3.2.25/0033-usbdevfs-Correct-amount-of-data-copied-to-user-in-pr.patch \
+	file://3.2.25/0034-ext4-fix-overhead-calculation-used-by-ext4_statfs.patch \
+	file://3.2.25/0035-udf-Improve-table-length-check-to-avoid-possible-ove.patch \
+	file://3.2.25/0036-powerpc-Add-memory-attribute-for-mfmsr.patch \
+	file://3.2.25/0037-mwifiex-correction-in-mcs-index-check.patch \
+	file://3.2.25/0038-USB-option-Ignore-ZTE-Vodafone-K3570-71-net-interfac.patch \
+	file://3.2.25/0039-USB-option-add-ZTE-MF821D.patch \
+	file://3.2.25/0040-target-Add-generation-of-LOGICAL-BLOCK-ADDRESS-OUT-O.patch \
+	file://3.2.25/0041-target-Add-range-checking-to-UNMAP-emulation.patch \
+	file://3.2.25/0042-target-Fix-reading-of-data-length-fields-for-UNMAP-c.patch \
+	file://3.2.25/0043-target-Fix-possible-integer-underflow-in-UNMAP-emula.patch \
+	file://3.2.25/0044-target-Check-number-of-unmap-descriptors-against-our.patch \
+	file://3.2.25/0045-s390-idle-fix-sequence-handling-vs-cpu-hotplug.patch \
+	file://3.2.25/0046-rtlwifi-rtl8192de-Fix-phy-based-version-calculation.patch \
+	file://3.2.25/0047-workqueue-perform-cpu-down-operations-from-low-prior.patch \
+	file://3.2.25/0048-ALSA-hda-Add-support-for-Realtek-ALC282.patch \
+	file://3.2.25/0049-iommu-amd-Fix-hotplug-with-iommu-pt.patch \
+	file://3.2.25/0050-drm-radeon-Try-harder-to-avoid-HW-cursor-ending-on-a.patch \
+	file://3.2.25/0051-ALSA-hda-Turn-on-PIN_OUT-from-hdmi-playback-prepare.patch \
+	file://3.2.25/0052-block-add-blk_queue_dead.patch \
+	file://3.2.25/0053-Fix-device-removal-NULL-pointer-dereference.patch \
+	file://3.2.25/0054-Avoid-dangling-pointer-in-scsi_requeue_command.patch \
+	file://3.2.25/0055-fix-hot-unplug-vs-async-scan-race.patch \
+	file://3.2.25/0056-fix-eh-wakeup-scsi_schedule_eh-vs-scsi_restart_opera.patch \
+	file://3.2.25/0057-libsas-continue-revalidation.patch \
+	file://3.2.25/0058-libsas-fix-sas_discover_devices-return-code-handling.patch \
+	file://3.2.25/0059-iscsi-target-Drop-bogus-struct-file-usage-for-iSCSI-.patch \
+	file://3.2.25/0060-mmc-sdhci-pci-CaFe-has-broken-card-detection.patch \
+	file://3.2.25/0061-ext4-don-t-let-i_reserved_meta_blocks-go-negative.patch \
+	file://3.2.25/0062-ext4-undo-ext4_calc_metadata_amount-if-we-fail-to-cl.patch \
+	file://3.2.25/0063-ASoC-dapm-Fix-_PRE-and-_POST-events-for-DAPM-perform.patch \
+	file://3.2.25/0064-locks-fix-checking-of-fcntl_setlease-argument.patch \
+	file://3.2.25/0065-ACPI-AC-prevent-OOPS-on-some-boxes-due-to-missing-ch.patch \
+	file://3.2.25/0066-drm-radeon-fix-bo-creation-retry-path.patch \
+	file://3.2.25/0067-drm-radeon-fix-non-revealent-error-message.patch \
+	file://3.2.25/0068-drm-radeon-fix-hotplug-of-DP-to-DVI-HDMI-passive-ada.patch \
+	file://3.2.25/0069-drm-radeon-on-hotplug-force-link-training-to-happen-.patch \
+	file://3.2.25/0070-Btrfs-call-the-ordered-free-operation-without-any-lo.patch \
+	file://3.2.25/0071-nouveau-Fix-alignment-requirements-on-src-and-dst-ad.patch \
+	file://3.2.25/0072-mm-fix-wrong-argument-of-migrate_huge_pages-in-soft_.patch \
+	file://3.2.25/0073-Linux-3.2.25.patch \
 	file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
 	file://libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch \
 	file://libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch \
-- 
1.7.10


