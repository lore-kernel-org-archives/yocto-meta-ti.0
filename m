Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 492D3E013A6
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DB9DF52993; Mon, 27 Feb 2012 14:12:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141228.DB9DF52993@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti33x-psp 3.2: update to 3.2.5
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
X-List-Received-Date: Mon, 27 Feb 2012 14:12:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c4eefd753012467261cf221babd2e8639b81d3ca
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c4eefd753012467261cf221babd2e8639b81d3ca

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Fri Feb 10 15:32:32 2012 +0100

linux-ti33x-psp 3.2: update to 3.2.5

Runtime tested on a beaglebone A3

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc                     |    2 +-
 .../0001-MAINTAINERS-stable-Update-address.patch   |   31 +
 .../0002-Documentation-Update-stable-address.patch |   56 ++
 ...x-an-oops-on-reading-fw_priv-fw-in-sysfs-.patch |   81 +++
 .../0004-rt2800usb-Move-ID-out-of-unknown.patch    |   43 ++
 ...ix-setting-of-the-pseudo-palette-for-8bpp.patch |   92 +++
 ...ix-bug-in-calculating-requested-vram-size.patch |   32 +
 ...07-libertas-clean-up-scan-thread-handling.patch |   86 +++
 .../0008-bcma-support-for-suspend-and-resume.patch |  120 ++++
 ...x-Validate-FEM-index-from-ini-file-and-FW.patch |   75 +++
 ...eck-buffer-bound-when-processing-nvs-data.patch |   68 ++
 .../3.2.1/0011-wl12xx-Restore-testmode-ABI.patch   |   32 +
 ...werpc-time-Handle-wrapping-of-decrementer.patch |   93 +++
 ...-unpaired-probe_hcall_entry-and-probe_hca.patch |   85 +++
 ...a-possible-data-corruption-when-receiving.patch |   78 +++
 .../0015-IB-uverbs-Protect-QP-multicast-list.patch |   96 +++
 .../3.2.1/0016-iwlagn-fix-TID-use-bug.patch        |   50 ++
 .../0017-iwlagn-fix-remove-use-of-PAGE_SIZE.patch  |  180 +++++
 ...Fix-parsing-of-__print_flags-in-TP_printk.patch |   37 +
 ...0019-ore-Fix-crash-in-case-of-an-IO-error.patch |   41 ++
 ...0-ore-fix-BUG_ON-too-few-sgs-when-reading.patch |   56 ++
 ...021-ore-Must-support-none-PAGE-aligned-IO.patch |  163 +++++
 ...breakage-when-MISC_FILESYSTEMS-is-not-set.patch |   89 +++
 ...3-reiserfs-Fix-quota-mount-option-parsing.patch |   34 +
 ...rce-inode-evictions-before-umount-to-avoi.patch |   70 ++
 ...warn-from-writepage-when-readonly-inode-i.patch |   73 ++
 ...-hv-Don-t-OOPS-when-you-cannot-init-vmbus.patch |   70 ++
 ...s-hv-Fix-a-bug-in-vmbus_driver_unregister.patch |   40 ++
 .../0028-USB-update-documentation-for-usbmon.patch |   54 ++
 ...oops-related-to-user-namespace-conversion.patch |  125 ++++
 ..._serial-fix-spinlock-lockup-in-RS485-code.patch |   47 ++
 ...fix-to-allow-mounting-a-hierarchy-by-name.patch |   50 ++
 ...dlock-when-converting-file-from-in-ICB-on.patch |  130 ++++
 ...sb-class-cdc-acm.c-clear-dangling-pointer.patch |   45 ++
 ...ight-fix-kernel-bug-when-loading-firmware.patch |   47 ++
 ...rage-doesn-t-support-dynamic-id-currently.patch |  121 ++++
 .../0036-USB-pxa168-Fix-compilation-error.patch    |   42 ++
 .../0037-USB-add-quirk-for-another-camera.patch    |   37 +
 .../3.2.1/0038-USB-omninet-fix-write_room.patch    |   34 +
 ...usb-option-add-ZD-Incorporated-HSPA-modem.patch |   53 ++
 ...-ID-for-Multiplex-RC-serial-adapter-to-cp.patch |   36 +
 ...1-usb-fix-number-of-mapped-SG-DMA-entries.patch |  155 +++++
 ...0042-xhci-Properly-handle-COMP_2ND_BW_ERR.patch |   62 ++
 .../0043-usb-ch9-fix-up-MaxStreams-helper.patch    |   81 +++
 ...zero-delay-when-receiving-odd-mixture-of-.patch |   37 +
 .../0045-asix-fix-infinite-loop-in-rx_fixup.patch  |   38 ++
 ...ng-fix-error-handling-if-slave-is-busy-v2.patch |   68 ++
 ...-Fix-acm_tty_hangup-vs.-acm_tty_close-rac.patch |   54 ++
 ...acl-count-validation-in-xfs_acl_from_disk.patch |   34 +
 .../3.2.1/0049-Linux-3.2.1.patch                   |   24 +
 ...mtdoops-fix-the-oops_page_used-array-size.patch |   39 ++
 ...mtdoops-skip-reading-initially-bad-blocks.patch |   36 +
 ...devs-don-t-increase-open-count-on-error-p.patch |   85 +++
 ...tresstest-bail-out-if-device-has-not-enou.patch |   60 ++
 ...-interface.c-fix-alarm-rollover-when-day-.patch |   53 ++
 ...dd-missing-ext4_resize_end-on-error-paths.patch |  109 +++
 ...undefined-behavior-in-ext4_fill_flex_info.patch |   74 ++
 ...sb-us122l-Delete-calls-to-preempt_disable.patch |   54 ++
 ...-Fix-master-control-for-Cirrus-Logic-421X.patch |   57 ++
 ...SA-HDA-Fix-automute-for-Cirrus-Logic-421x.patch |   48 ++
 ...e1724-Check-for-ac97-to-avoid-kernel-oops.patch |   38 ++
 ...dio-Avoid-flood-of-frame-active-debug-mes.patch |   46 ++
 ...e-auto-parser-for-HP-laptops-with-cx20459.patch |   37 +
 ...turn-the-error-from-get_wcaps_type-for-in.patch |   58 ++
 ...x-the-detection-of-Loopback-Mixing-contro.patch |   42 ++
 ...x-the-lost-power-setup-of-seconary-pins-a.patch |   92 +++
 ...kms-workaround-invalid-AVI-infoframe-chec.patch |   43 ++
 ...n-kms-disable-writeback-on-pre-R300-asics.patch |   40 ++
 ...disabling-PCI-bus-mastering-on-big-endian.patch |   70 ++
 ...FS-errors-are-communicated-on-iodata-pnfs.patch |   50 ++
 ...1-pnfs-obj-Must-return-layout-on-IO-error.patch |   92 +++
 .../3.2.2/0022-NFS-Retry-mounting-NFSROOT.patch    |   94 +++
 ...4.1-fix-backchannel-slotid-off-by-one-bug.patch |   30 +
 ...fix-recent-breakage-to-NFS-error-handling.patch |   60 ++
 ...FSv4-include-bitmap-in-nfsv4-get-acl-data.patch |  313 +++++++++
 ...ression-in-handling-of-context-option-in-.patch |  147 ++++
 ...ximum-global-item-tag-report-size-to-96-b.patch |   35 +
 .../0028-HID-wiimote-Select-INPUT_FF_MEMLESS.patch |   33 +
 ...ix-missing-scrub-when-there-is-a-bit-flip.patch |   81 +++
 ...0030-UBI-fix-use-after-free-on-error-path.patch |   52 ++
 .../0031-PCI-Fix-PCI_EXP_TYPE_RC_EC-value.patch    |   32 +
 ...able-msi-interrupts-when-we-initialize-a-.patch |   53 ++
 ...ore-CPU-non-addressable-_CRS-reserved-mem.patch |   65 ++
 ...x86-PCI-amd-factor-out-MMCONFIG-discovery.patch |  160 +++++
 ...build-amd_bus.o-only-when-CONFIG_AMD_NB-y.patch |   37 +
 ...s-Release-spinlock-for-the-raid-device-li.patch |   56 ++
 ...s-Fix-for-memory-allocation-error-for-lar.patch |  177 +++++
 ...Reject-replies-with-payload-XENSTORE_PAYL.patch |   78 +++
 ...rform-bad-block-tests-for-WriteMostly-dev.patch |   56 ++
 ...040-ima-free-duplicate-measurement-memory.patch |   52 ++
 .../0041-ima-fix-invalid-memory-reference.patch    |   68 ++
 ...ub-fix-a-possible-memleak-in-__slab_alloc.patch |   47 ++
 ...ound-Dell-1536-1546-BIOS-MMCONFIG-bug-tha.patch |  101 +++
 ...tting-custom-MAC-address-on-Asix-88178-de.patch |   45 ++
 ...tting-custom-MAC-address-on-Asix-88772-de.patch |   53 ++
 ...46-include-linux-crash_dump.h-needs-elf.h.patch |   54 ++
 ...ix-BUG-caused-by-failure-to-check-skb-all.patch |   44 ++
 ...x-rx-key-NULL-pointer-dereference-in-prom.patch |   52 ++
 ...egression-in-channelwidth-switch-at-the-s.patch |   68 ++
 ...em_cgroup_replace_page_cache-to-fix-LRU-i.patch |  179 +++++
 .../0051-x86-Fix-mmap-random-address-range.patch   |   47 ++
 .../0052-UBI-fix-nameless-volumes-handling.patch   |   37 +
 .../3.2.2/0053-UBI-fix-debugging-messages.patch    |   42 ++
 .../3.2.2/0054-UBI-make-vid_hdr-non-static.patch   |   36 +
 .../3.2.2/0055-UBIFS-fix-debugging-messages.patch  |   41 ++
 ...UBIFS-make-debugging-messages-light-again.patch |   57 ++
 ...ror-value-returned-by-several-bus-drivers.patch |  197 ++++++
 ...8-mmc-core-Fix-voltage-select-in-DDR-mode.patch |   39 ++
 ...ix-tuning-timer-incorrect-setting-when-su.patch |   39 ++
 .../0060-mmc-sd-Fix-SDR12-timing-regression.patch  |   38 ++
 ...2-ioctl-integer-overflow-in-video_usercop.patch |   54 ++
 ...s-in-a-batch-should-not-be-accounted-as-a.patch |   71 ++
 ...race-Fix-unregister-ftrace_ops-accounting.patch |  227 +++++++
 ...eamline-config.pl-Simplify-backslash-line.patch |   68 ++
 ...eamline-config.pl-Fix-parsing-Makefile-wi.patch |   98 +++
 ...double-free-on-shutdown-of-nfsd-after-cha.patch |   60 ++
 ...svcrpc-destroy-server-sockets-all-at-once.patch |   85 +++
 ...-avoid-memory-corruption-on-pool-shutdown.patch |  156 +++++
 .../3.2.2/0069-nfsd4-fix-lockowner-matching.patch  |   59 ++
 ...d-Fix-oops-when-parsing-a-0-length-export.patch |   82 +++
 ...notify-don-t-BUG-in-fsnotify_destroy_mark.patch |   61 ++
 ...Update-Boot-messages-for-SGI-UV2-platform.patch |   44 ++
 ...t-Fix-handling-of-elf64-big-endian-object.patch |   46 ++
 ...ix-integer-overflow-in-uvc_ioctl_ctrl_map.patch |   62 ++
 ...cache-use-a-dispose-list-in-select_parent.patch |  172 +++++
 .../0076-fix-shrink_dcache_parent-livelock.patch   |  130 ++++
 ...fsblock-acquire-im_lock-in-_preload_range.patch |   64 ++
 ...ock-don-t-spinlock-when-freeing-block_dev.patch |   46 ++
 .../0079-pnfsblock-limit-bio-page-count.patch      |   51 ++
 ...0211-revert-on-channel-work-optimisations.patch |  635 ++++++++++++++++++
 ...-HID-hid-multitouch-add-another-eGalax-id.patch |   60 ++
 ...touch-cleanup-with-eGalax-PID-definitions.patch |  112 ++++
 ...itouch-Add-egalax-ID-for-Acer-Iconia-W500.patch |   62 ++
 ...ouch-add-support-for-the-MSI-Windpad-110W.patch |   49 ++
 ...titouch-add-support-for-new-Hanvon-panels.patch |   63 ++
 ...uch-add-support-of-Atmel-multitouch-panel.patch |   63 ++
 ...0087-HID-multitouch-add-support-for-3M-32.patch |   45 ++
 ...ltitouch-add-support-9-new-Xiroku-devices.patch |  117 ++++
 ...-fix-cputime-overflow-in-uptime_proc_show.patch |   49 ++
 ...0090-block-add-and-use-scsi_blk_cmd_ioctl.patch |  166 +++++
 ...SCSI-passthrough-ioctls-on-partition-devi.patch |  166 +++++
 ...orward-ioctls-from-logical-volumes-to-the.patch |   90 +++
 ...oc-clean-up-and-fix-proc-pid-mem-handling.patch |  271 ++++++++
 ...Use-LPIB-position-fix-for-Macbook-Pro-7-1.patch |   35 +
 ...oso-Xonar-DS-fix-polarity-of-front-output.patch |   37 +
 ...x-internal-microphone-on-Dell-Studio-16-X.patch |   36 +
 ...97-TOMOYO-Accept-000-as-a-valid-character.patch |   43 ++
 ...8-intel-idle-Make-idle-driver-more-robust.patch |   53 ++
 .../3.2.2/0099-intel_idle-fix-API-misuse.patch     |   56 ++
 .../0100-ACPI-Store-SRAT-table-revision.patch      |   66 ++
 ...e-SRAT-table-rev-to-use-8bit-or-32bit-PXM.patch |   50 ++
 ...se-SRAT-table-rev-to-use-8bit-or-16-32bit.patch |   66 ++
 ...back-the-call-to-acpi_os_validate_address.patch |   59 ++
 ...essor-fix-acpi_get_cpuid-for-UP-processor.patch |   75 +++
 ...ix-NULL-pointer-dereference-in-slave_dest.patch |   37 +
 ...t-Set-response-format-in-INQUIRY-response.patch |   44 ++
 ...additional-sense-length-field-in-sense-da.patch |  177 +++++
 ...idate-the-mapped-core-over-suspend-resume.patch |   44 ++
 ...-cx23885-dvb-check-if-dvb_attach-succeded.patch |   36 +
 ...ix-don-t-duplicate-xc4000-entry-for-radio.patch |   95 +++
 ...umberspace-conflict-between-xc4000-and-pt.patch |   42 ++
 ...-module-Fix-disabling-tracepoints-with-ta.patch |   50 ++
 ...AP-correct-SYSC-register-offset-for-OMAP4.patch |   34 +
 ...-new-UV2-hardware-by-using-native-UV2-bro.patch |  350 ++++++++++
 ...ix-BAU-destination-timeout-initialization.patch |   66 ++
 .../3.2.2/0116-x86-UV2-Work-around-BAU-bug.patch   |  570 ++++++++++++++++
 ...fix-interpretation-of-the-rx-KeyMiss-flag.patch |   61 ++
 ...800pci-fix-spurious-interrupts-generation.patch |   86 +++
 ...x-endian-conversion-issue-in-discard-code.patch |   45 ++
 ...20t-modified-the-setting-of-transfer-rate.patch |   33 +
 ...e-fix-off-by-one-index-into-syscall-table.patch |   46 ++
 ...default-wsize-when-unix-extensions-are-no.patch |   67 ++
 ...3-kprobes-initialize-before-using-a-hlist.patch |   49 ++
 ...oc-clear_refs-do-not-clear-reserved-pages.patch |   64 ++
 ...-ptr-dereference-in-__count_immobile_page.patch |   91 +++
 .../3.2.2/0126-iwlagn-check-for-SMPS-mode.patch    |   50 ++
 ...945-fix-hw-passive-scan-on-radar-channels.patch |   60 ++
 ...SHM_UNLOCK-fix-long-unpreemptible-section.patch |  186 ++++++
 ...fix-Unevictable-pages-stranded-after-swap.patch |  342 ++++++++++
 .../3.2.2/0130-Linux-3.2.2.patch                   |   24 +
 ...x-buffer-alignment-regression-with-Nvidia.patch |   62 ++
 ...x-silent-outputs-from-docking-station-jac.patch |   64 ++
 ...tfs-Sanitize-write-counts-of-dev-ecryptfs.patch |  103 +++
 ...tfs-Improve-metadata-read-failure-logging.patch |   58 ++
 ...0005-eCryptfs-Make-truncate-path-killable.patch |   71 ++
 ...6-eCryptfs-Check-inode-changes-in-setattr.patch |  122 ++++
 ...x-oops-when-printing-debug-info-in-extent.patch |  103 +++
 ...adeon-kms-Add-an-MSI-quirk-for-Dell-RS690.patch |   38 ++
 ...kms-move-panel-mode-setup-into-encoder-mo.patch |  130 ++++
 ...kms-rework-modeset-sequence-for-DCE41-and.patch |   87 +++
 .../0011-drm-Fix-authentication-kernel-crash.patch |   91 +++
 ...sing-xfs_iunlock-on-error-recovery-path-i.patch |   38 ++
 ...M5100-register-map-cache-only-when-going-.patch |   32 +
 ...e-register-synchronisation-for-low-freque.patch |   66 ++
 ...go-through-cache-when-applying-WM5100-rev.patch |   41 ++
 ...-wm8996-Call-_POST_PMU-callback-for-CPVDD.patch |   33 +
 ...brcmsmac-fix-tx-queue-flush-infinite-loop.patch |   53 ++
 ...c80211-fix-work-removal-on-deauth-request.patch |  111 +++
 ...jbd-Issue-cache-flush-after-checkpointing.patch |  118 ++++
 ...12-make-it-work-undo-percpu-message-sched.patch |   78 +++
 ...-sha512-reduce-stack-usage-to-safe-number.patch |  129 ++++
 ...-tpm_tis-add-delay-after-aborting-command.patch |   37 +
 .../0023-x86-uv-Fix-uninitialized-spinlocks.patch  |   58 ++
 ...4-x86-uv-Fix-uv_gpa_to_soc_phys_ram-shift.patch |   41 ++
 ...de_amd-Add-support-for-CPU-family-specifi.patch |   75 +++
 ...sembler-constraint-to-prevent-overeager-g.patch |  172 +++++
 ...t-mute-led-polarity-for-laptops-with-bugg.patch |   43 ++
 ...8-ALSA-hda-Fix-silent-output-on-ASUS-A6Rp.patch |   55 ++
 ...hda-Fix-silent-output-on-Haier-W18-laptop.patch |   34 +
 ...per-over-missed-irq-issues-with-force-wak.patch |  126 ++++
 ...15-sdvo-always-set-positive-sync-polarity.patch |   52 ++
 ...-enable-gen7-RC6-and-GPU-turbo-after-resu.patch |   43 ++
 ...-at91-fix-at91rm9200-soc-subtype-handling.patch |   46 ++
 .../0034-mach-ux500-enable-ARM-errata-764369.patch |   31 +
 ...proc-v7.S-remove-HARVARD_CACHE-preprocess.patch |   53 ++
 ...ain-bitterly-about-attempts-to-remove-fil.patch |   68 ++
 ...e-struct-xen_spinlock-to-always-fit-in-ar.patch |  103 +++
 ...oved-redundant-calling-of-_scsih_probe_de.patch |   96 +++
 .../0039-USB-option-Add-LG-docomo-L-02C.patch      |   41 ++
 ...di_sio-fix-TIOCSSERIAL-baud_base-handling.patch |   41 ++
 .../0041-USB-ftdi_sio-fix-initial-baud-rate.patch  |   49 ++
 ...sio-add-PID-for-TI-XDS100v2-BeagleBone-A3.patch |   50 ++
 .../0043-USB-serial-ftdi-additional-IDs.patch      |   49 ++
 .../0044-USB-ftdi_sio-Add-more-identifiers.patch   |   48 ++
 ...-updating-desc-length-must-be-protected-b.patch |   37 +
 ...-use-two-mutexes-to-allow-simultaneous-re.patch |  178 +++++
 ...-add-more-Pantech-UML190-and-UML290-ports.patch |   43 ++
 ...dwc3-ep0-tidy-up-Pending-Request-handling.patch |   54 ++
 ...ake-edge_remove_sysfs_attrs-the-port_remo.patch |   60 ++
 ...0050-TTY-fix-UV-serial-console-regression.patch |   72 ++
 ...-pl011-lock-console-writes-against-interr.patch |   67 ++
 .../3.2.3/0052-jsm-Fixed-EEH-recovery-error.patch  |   53 ++
 ...053-iwlwifi-fix-PCI-E-transport-inta-race.patch |   53 ++
 ...assignment-in-vmw_framebuffer_create_hand.patch |   34 +
 ...tek-cr-fix-autopm-scheduling-while-atomic.patch |   36 +
 .../3.2.3/0056-USB-usbsevseg-fix-max-length.patch  |   34 +
 ...t-langwell-don-t-call-gadget-s-disconnect.patch |   94 +++
 .../3.2.3/0058-usb-gadget-storage-endian-fix.patch |   43 ++
 ...s-usb-host-ehci-fsl.c-add-missing-iounmap.patch |   54 ++
 ...xhci-Fix-USB-3.0-device-restart-on-resume.patch |   51 ++
 ...p-isoc-transfer-ring-when-TD-length-misma.patch |   40 ++
 .../0062-usb-musb-davinci-fix-build-breakage.patch |   41 ++
 ...71805f-Fix-clamping-of-temperature-limits.patch |   43 ++
 ...7ehf-Disable-setting-DC-mode-for-pwm2-pwm.patch |   46 ++
 .../0065-hwmon-sht15-fix-bad-error-code.patch      |   40 ++
 ...-call-wake_up_all-to-allow-driver-to-shut.patch |   45 ++
 ...-better-allocate-a-buffer-that-is-at-leas.patch |   38 ++
 ...-Avoid-hanging-on-interface-with-no-USB_C.patch |   53 ++
 .../3.2.3/0069-netns-fix-net_alloc_generic.patch   |  120 ++++
 ...conspicously-if-someone-uses-net_generic-.patch |   42 ++
 ...f-Register-properly-as-a-pernet-subsystem.patch |  117 ++++
 ...fix-EPOLLET-regression-for-stream-sockets.patch |   96 +++
 ...-fix-enslaving-in-alb-mode-when-link-down.patch |  116 ++++
 ...tp_ip-fix-possible-oops-on-packet-receive.patch |   73 ++
 ...075-macvlan-fix-a-possible-use-after-free.patch |   34 +
 ...76-net-bpf_jit-fix-divide-by-0-generation.patch |  129 ++++
 ...ntroduce-missing-rcu_assign_pointer-calls.patch |  703 ++++++++++++++++++++
 ...ake-rds_sock_lock-BH-rather-than-IRQ-safe.patch |  119 ++++
 ..._trim_head-to-adjust-segment-count-with-s.patch |   61 ++
 ...ng-remote-adress-for-md5-lookup-in-rst-pa.patch |   49 ++
 ...CP210x-Added-USB-ID-for-the-Link-Instrume.patch |   32 +
 ...USB-cp210x-call-generic-open-last-in-open.patch |   47 ++
 ...0083-USB-cp210x-fix-CP2104-baudrate-usage.patch |   78 +++
 ...84-USB-cp210x-do-not-map-baud-rates-to-B0.patch |   34 +
 ...5-USB-cp210x-fix-up-set_termios-variables.patch |   44 ++
 ...clean-up-refactor-and-document-speed-hand.patch |  121 ++++
 ...7-USB-cp210x-initialise-baud-rate-at-open.patch |   35 +
 ...cp210x-allow-more-baud-rates-above-1Mbaud.patch |   48 ++
 ...ux500-no-MMC_CAP_SD_HIGHSPEED-on-Snowball.patch |   34 +
 .../3.2.3/0090-Linux-3.2.3.patch                   |   24 +
 ...-Mark-WM5100-register-map-cache-only-when.patch |   32 +
 ...-Don-t-go-through-cache-when-applying-WM5.patch |   39 ++
 .../3.2.4/0003-Linux-3.2.4.patch                   |   24 +
 .../3.2.5/0001-PCI-Rework-ASPM-disable-code.patch  |  236 +++++++
 .../3.2.5/0002-Linux-3.2.5.patch                   |   24 +
 recipes-kernel/linux/linux-ti33x-psp-3.2/src.txt   |  295 ++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |  276 ++++++++-
 277 files changed, 21802 insertions(+), 2 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=c4eefd753012467261cf221babd2e8639b81d3ca

