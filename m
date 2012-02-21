Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 37281E013A6
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:51 -0800 (PST)
Received: by werp13 with SMTP id p13so4548183wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Tue, 21 Feb 2012 02:30:50 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.90.225 as permitted sender)
	client-ip=10.180.90.225; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.90.225 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.90.225])
	by 10.180.90.225 with SMTP id bz1mr25641522wib.5.1329820250222
	(num_hops = 1); Tue, 21 Feb 2012 02:30:50 -0800 (PST)
Received: by 10.180.90.225 with SMTP id bz1mr21420688wib.5.1329820249990;
	Tue, 21 Feb 2012 02:30:49 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id ga1sm53629208wib.5.2012.02.21.02.30.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Feb 2012 02:30:48 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Tue, 21 Feb 2012 11:30:17 +0100
Message-Id: <1329820224-28112-3-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
References: <1329820224-28112-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnTjVNQOiyf/UeWWGBCn0+cCdtOulIBBORhH8sz6w/euMw9k1nocLT3gKTjct5ddcp2RSVT
Subject: [Beagleboard.org][PATCH v2 03/10] linux-ti335x-psp 3.2: update to 3.2.6
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
X-List-Received-Date: Tue, 21 Feb 2012 10:30:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Readahead fixed!

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 conf/machine/include/ti33x.inc                     |    2 +-
 ...d-fix-pipeline-break-caused-by-block-plug.patch |   99 +++++++
 ...x-the-logic-to-detect-VIA-analog-low-curr.patch |   35 +++
 ...0003-ALSA-HDA-Remove-quirk-for-Asus-N53Jq.patch |   35 +++
 ...ply-0x0f-VREF-fix-to-all-ASUS-laptops-wit.patch |  117 ++++++++
 ...x-calling-cs_automic-twice-for-Cirrus-cod.patch |   45 +++
 ...low-analog-low-current-mode-when-dynamic-.patch |  105 +++++++
 ...x-duplicated-output-to-more-than-one-code.patch |   36 +++
 ...sable-dynamic-power-control-for-VIA-as-de.patch |   34 +++
 ...s-Enable-line-out-VMID-buffer-for-single-.patch |   57 ++++
 ...ubs-fix-wrong-bits-for-LINEOUT2-N-P-mixer.patch |   32 +++
 ...vfp-flush-thread-hwstate-before-restoring.patch |   60 ++++
 ...1-vfp-fix-ptrace-regset-modification-race.patch |   68 +++++
 ...vfp-flush-thread-hwstate-before-copying-p.patch |   41 +++
 ...0014-ARM-OMAP2-GPMC-fix-device-size-setup.patch |   43 +++
 ...-vt-vt_ioctl.c-fix-KDFONTOP-32bit-compati.patch |   44 +++
 ...016-proc-mem_release-should-check-mm-NULL.patch |   34 +++
 .../0017-proc-unify-mem_read-and-mem_write.patch   |  148 ++++++++++
 ...ure-mem_open-doesn-t-pin-the-target-s-mem.patch |   79 ++++++
 ...ohci-add-reset-packet-quirk-for-SB-Audigy.patch |   43 +++
 ...ire-ohci-disable-MSI-on-Ricoh-controllers.patch |   43 +++
 ...s-SMP-vendor-specific-attribute-MADs-to-f.patch |   90 ++++++
 ...ix-kernel-panic-by-always-initializing-qp.patch |   68 +++++
 ...-a-memory-leak-in-function-pre_handler_kr.patch |   52 ++++
 ...nd-bugfix-reset-the-BCH-module-when-it-is.patch |   72 +++++
 ...atmel_nand-optimize-read-write-buffer-fun.patch |  113 ++++++++
 ...-at_hdmac-bugfix-for-enabling-channel-irq.patch |   92 ++++++
 ...xip.c-fix-race-condition-in-xip_file_faul.patch |   58 ++++
 ...on-check-pfn_valid-when-entering-a-new-MA.patch |  112 ++++++++
 ...e-Fix-s2disk-regression-related-to-freezi.patch |  100 +++++++
 ...S-CPU-C-state-breakage-with-PM-Qos-change.patch |   57 ++++
 ...Set-DESKTOP_HEIGHT-register-to-the-frameb.patch |   55 ++++
 ...-drm-nouveau-gem-fix-fence_sync-race-oops.patch |  108 +++++++
 ...kms-disable-output-polling-when-suspended.patch |   44 +++
 ...034-drm-radeon-kms-fix-TRAVIS-panel-setup.patch |   53 ++++
 ...x-task-stack-corruption-under-__ARCH_WANT.patch |   94 +++++++
 ...e-Thaw-processes-in-SNAPSHOT_CREATE_IMAGE.patch |   83 ++++++
 ...e-Thaw-kernel-threads-in-SNAPSHOT_CREATE_.patch |   48 ++++
 .../0038-8139cp-fix-missing-napi_gro_flush.patch   |   33 +++
 ...ID-buffer-as-uptodate-before-marking-it-d.patch |   40 +++
 ...MI-hot-remove-notification-to-audio-drive.patch |   53 ++++
 ...splayPort-hot-remove-notification-to-audi.patch |   40 +++
 .../0042-drm-i915-check-ACTHD-of-all-rings.patch   |   92 ++++++
 .../0043-drm-i915-Fix-TV-Out-refresh-rate.patch    |   98 +++++++
 .../3.2.6/0044-drm-i915-handle-3rd-pipe.patch      |   37 +++
 ...nvert-force_wake_get-to-func-pointer-in-t.patch |   42 +++
 ...otect-force_wake_-get-put-with-the-gt_loc.patch |  163 +++++++++++
 ...finite-loop-due-to-overflow-in-ecryptfs_w.patch |   51 ++++
 ...w83627ehf-Fix-number-of-fans-for-NCT6776F.patch |   55 ++++
 ...ps-in-session-setup-code-for-null-user-mo.patch |   47 +++
 ...-fix-usage-of-CONTRAST_CTR-in-suspend-res.patch |   36 +++
 ...-Exclude-TAINT_FIRMWARE_WORKAROUND-from-d.patch |   56 ++++
 ...-Exclude-TAINT_OOT_MODULE-from-disabling-.patch |   56 ++++
 ...t-Fix-reject-release-handling-in-iscsit_f.patch |   79 ++++++
 ...t-Fix-double-list_add-with-iscsit_alloc_b.patch |   35 +++
 ...t-Fix-discovery-with-INADDR_ANY-and-IN6AD.patch |  176 ++++++++++++
 ...s-Fix-routing-of-input-PGAs-to-line-outpu.patch |   46 +++
 ...s-Correct-line-input-to-line-output-2-pat.patch |   35 +++
 ...ASoC-wm8962-Fix-word-length-configuration.patch |   38 +++
 ...-Enabling-VMID-should-take-a-runtime-PM-r.patch |   42 +++
 ...ASoC-wm8994-Fix-typo-in-VMID-ramp-setting.patch |   31 ++
 ...socket-refcount-decrementing-on-each-resu.patch |  179 ++++++++++++
 ...-virtuoso-fix-exchanged-L-R-volumes-of-au.patch |   67 +++++
 ...-iommu-amd-Work-around-broken-IVRS-tables.patch |   37 +++
 ...msm-Fix-error-handling-in-msm_iommu_unmap.patch |   62 ++++
 ...on-check-for-overlapping-nodes-during-iso.patch |  111 ++++++++
 .../0066-mm-fix-UP-THP-spin_is_locked-BUGs.patch   |   63 +++++
 ...correct-preempted-registration-sense-code.patch |   59 ++++
 ...w-PERSISTENT-RESERVE-IN-for-non-reservati.patch |   35 +++
 ...ect-sense-key-for-INVALID-FIELD-IN-PARAME.patch |   69 +++++
 ...workaround-for-zero-length-control-CDB-ha.patch |   62 ++++
 ...rn-correct-ASC-for-unimplemented-VPD-page.patch |   37 +++
 ...-INQUIRY-commands-with-EVPD-0-but-PAGE-CO.patch |   43 +++
 ...73-Staging-asus_oled-fix-image-processing.patch |   59 ++++
 ...asus_oled-fix-NULL-ptr-crash-on-unloading.patch |   59 ++++
 ...075-staging-r8712u-Add-new-Sitecom-UsB-ID.patch |   32 +++
 ...-r8712u-Use-asynchronous-firmware-loading.patch |  285 +++++++++++++++++++
 ...h9.h-usb_endpoint_maxp-uses-__le16_to_cpu.patch |   37 +++
 ...zero-fix-bug-in-loopback-autoresume-handl.patch |   36 +++
 ...p-PCI-USB-quirk-handling-for-Netlogic-XLP.patch |   45 +++
 ...al-add-new-PID-number-0xa951-to-the-ftdi-.patch |   45 +++
 ...B-add-new-zte-3g-dongle-s-pid-to-option.c.patch |  181 ++++++++++++
 ...SWIZ_BITS-to-8-to-reduce-tmem-bucket-lock.patch |   46 +++
 .../3.2.6/0083-zcache-fix-deadlock-condition.patch |   55 ++++
 ...ore-Add-missing-spin_lock_init-for-irq_lo.patch |   33 +++
 ...-Avoid-Pstate-MSR-accesses-on-systems-sup.patch |   60 ++++
 .../0086-powernow-k8-Fix-indexing-issue.patch      |   86 ++++++
 .../3.2.6/0087-Linux-3.2.6.patch                   |   24 ++
 recipes-kernel/linux/linux-ti33x-psp-3.2/src.txt   |  295 --------------------
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   87 ++++++
 90 files changed, 5873 insertions(+), 296 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0001-readahead-fix-pipeline-break-caused-by-block-plug.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0002-ALSA-hda-Fix-the-logic-to-detect-VIA-analog-low-curr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0003-ALSA-HDA-Remove-quirk-for-Asus-N53Jq.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0004-ALSA-hda-Apply-0x0f-VREF-fix-to-all-ASUS-laptops-wit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0005-ALSA-hda-Fix-calling-cs_automic-twice-for-Cirrus-cod.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0006-ALSA-hda-Allow-analog-low-current-mode-when-dynamic-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0007-ALSA-HDA-Fix-duplicated-output-to-more-than-one-code.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0008-ALSA-hda-Disable-dynamic-power-control-for-VIA-as-de.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0009-ASoC-wm_hubs-Enable-line-out-VMID-buffer-for-single-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0010-ASoC-wm_hubs-fix-wrong-bits-for-LINEOUT2-N-P-mixer.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0011-ARM-7306-1-vfp-flush-thread-hwstate-before-restoring.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0012-ARM-7307-1-vfp-fix-ptrace-regset-modification-race.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0013-ARM-7308-1-vfp-flush-thread-hwstate-before-copying-p.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0014-ARM-OMAP2-GPMC-fix-device-size-setup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0015-drivers-tty-vt-vt_ioctl.c-fix-KDFONTOP-32bit-compati.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0016-proc-mem_release-should-check-mm-NULL.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0017-proc-unify-mem_read-and-mem_write.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0018-proc-make-sure-mem_open-doesn-t-pin-the-target-s-mem.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0019-firewire-ohci-add-reset-packet-quirk-for-SB-Audigy.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0020-firewire-ohci-disable-MSI-on-Ricoh-controllers.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0021-IB-mlx4-pass-SMP-vendor-specific-attribute-MADs-to-f.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0022-RDMA-core-Fix-kernel-panic-by-always-initializing-qp.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0023-kprobes-fix-a-memory-leak-in-function-pre_handler_kr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0024-mtd-gpmi-nand-bugfix-reset-the-BCH-module-when-it-is.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0025-Revert-mtd-atmel_nand-optimize-read-write-buffer-fun.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0026-at_hdmac-bugfix-for-enabling-channel-irq.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0027-mm-filemap_xip.c-fix-race-condition-in-xip_file_faul.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0028-mm-compaction-check-pfn_valid-when-entering-a-new-MA.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0029-PM-Hibernate-Fix-s2disk-regression-related-to-freezi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0030-PM-QoS-CPU-C-state-breakage-with-PM-Qos-change.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0031-drm-radeon-Set-DESKTOP_HEIGHT-register-to-the-frameb.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0032-drm-nouveau-gem-fix-fence_sync-race-oops.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0033-drm-radeon-kms-disable-output-polling-when-suspended.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0034-drm-radeon-kms-fix-TRAVIS-panel-setup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0035-sched-rt-Fix-task-stack-corruption-under-__ARCH_WANT.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0036-PM-Hibernate-Thaw-processes-in-SNAPSHOT_CREATE_IMAGE.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0037-PM-Hibernate-Thaw-kernel-threads-in-SNAPSHOT_CREATE_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0038-8139cp-fix-missing-napi_gro_flush.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0039-udf-Mark-LVID-buffer-as-uptodate-before-marking-it-d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0040-drm-i915-HDMI-hot-remove-notification-to-audio-drive.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0041-drm-i915-DisplayPort-hot-remove-notification-to-audi.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0042-drm-i915-check-ACTHD-of-all-rings.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0043-drm-i915-Fix-TV-Out-refresh-rate.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0044-drm-i915-handle-3rd-pipe.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0045-drm-i915-convert-force_wake_get-to-func-pointer-in-t.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0046-drm-i915-protect-force_wake_-get-put-with-the-gt_loc.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0047-eCryptfs-Infinite-loop-due-to-overflow-in-ecryptfs_w.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0048-hwmon-w83627ehf-Fix-number-of-fans-for-NCT6776F.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0049-cifs-Fix-oops-in-session-setup-code-for-null-user-mo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0050-atmel_lcdfb-fix-usage-of-CONTRAST_CTR-in-suspend-res.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0051-lockdep-bug-Exclude-TAINT_FIRMWARE_WORKAROUND-from-d.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0052-lockdep-bug-Exclude-TAINT_OOT_MODULE-from-disabling-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0053-iscsi-target-Fix-reject-release-handling-in-iscsit_f.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0054-iscsi-target-Fix-double-list_add-with-iscsit_alloc_b.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0055-iscsi-target-Fix-discovery-with-INADDR_ANY-and-IN6AD.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0056-ASoC-wm_hubs-Fix-routing-of-input-PGAs-to-line-outpu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0057-ASoC-wm_hubs-Correct-line-input-to-line-output-2-pat.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0058-ASoC-wm8962-Fix-word-length-configuration.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0059-ASoC-wm8994-Enabling-VMID-should-take-a-runtime-PM-r.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0060-ASoC-wm8994-Fix-typo-in-VMID-ramp-setting.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0061-pcmcia-fix-socket-refcount-decrementing-on-each-resu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0062-ALSA-oxygen-virtuoso-fix-exchanged-L-R-volumes-of-au.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0063-iommu-amd-Work-around-broken-IVRS-tables.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0064-iommu-msm-Fix-error-handling-in-msm_iommu_unmap.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0065-mm-compaction-check-for-overlapping-nodes-during-iso.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0066-mm-fix-UP-THP-spin_is_locked-BUGs.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0067-target-Use-correct-preempted-registration-sense-code.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0068-target-Allow-PERSISTENT-RESERVE-IN-for-non-reservati.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0069-target-Correct-sense-key-for-INVALID-FIELD-IN-PARAME.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0070-target-Add-workaround-for-zero-length-control-CDB-ha.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0071-target-Return-correct-ASC-for-unimplemented-VPD-page.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0072-target-Fail-INQUIRY-commands-with-EVPD-0-but-PAGE-CO.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0073-Staging-asus_oled-fix-image-processing.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0074-Staging-asus_oled-fix-NULL-ptr-crash-on-unloading.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0075-staging-r8712u-Add-new-Sitecom-UsB-ID.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0076-staging-r8712u-Use-asynchronous-firmware-loading.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0077-usb-ch9.h-usb_endpoint_maxp-uses-__le16_to_cpu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0078-usb-gadget-zero-fix-bug-in-loopback-autoresume-handl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0079-usb-Skip-PCI-USB-quirk-handling-for-Netlogic-XLP.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0080-USB-usbserial-add-new-PID-number-0xa951-to-the-ftdi-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0081-USB-add-new-zte-3g-dongle-s-pid-to-option.c.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0082-zcache-Set-SWIZ_BITS-to-8-to-reduce-tmem-bucket-lock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0083-zcache-fix-deadlock-condition.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0084-mmc-cb710-core-Add-missing-spin_lock_init-for-irq_lo.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0085-powernow-k8-Avoid-Pstate-MSR-accesses-on-systems-sup.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0086-powernow-k8-Fix-indexing-issue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0087-Linux-3.2.6.patch
 delete mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/src.txt

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index fc670d0..f9d8f7a 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -3,7 +3,7 @@ SOC_FAMILY = "ti33x"
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r3"
+MACHINE_KERNEL_PR = "r4"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0001-readahead-fix-pipeline-break-caused-by-block-plug.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0001-readahead-fix-pipeline-break-caused-by-block-plug.patch
new file mode 100644
index 0000000..b6dcc0f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0001-readahead-fix-pipeline-break-caused-by-block-plug.patch
@@ -0,0 +1,99 @@
+From 76af79f393ad562077f79627a4c719219ef09ee8 Mon Sep 17 00:00:00 2001
+From: Shaohua Li <shaohua.li@intel.com>
+Date: Fri, 3 Feb 2012 15:37:17 -0800
+Subject: [PATCH 01/87] readahead: fix pipeline break caused by block plug
+
+commit 3deaa7190a8da38453c4fabd9dec7f66d17fff67 upstream.
+
+Herbert Poetzl reported a performance regression since 2.6.39.  The test
+is a simple dd read, but with big block size.  The reason is:
+
+T1: ra (A, A+128k), (A+128k, A+256k)
+T2: lock_page for page A, submit the 256k
+T3: hit page A+128K, ra (A+256k, A+384). the range isn't submitted
+because of plug and there isn't any lock_page till we hit page A+256k
+because all pages from A to A+256k is in memory
+T4: hit page A+256k, ra (A+384, A+ 512). Because of plug, the range isn't
+submitted again.
+T5: lock_page A+256k, so (A+256k, A+512k) will be submitted. The task is
+waitting for (A+256k, A+512k) finish.
+
+There is no request to disk in T3 and T4, so readahead pipeline breaks.
+
+We really don't need block plug for generic_file_aio_read() for buffered
+I/O.  The readahead already has plug and has fine grained control when I/O
+should be submitted.  Deleting plug for buffered I/O fixes the regression.
+
+One side effect is plug makes the request size 256k, the size is 128k
+without it.  This is because default ra size is 128k and not a reason we
+need plug here.
+
+Vivek said:
+
+: We submit some readahead IO to device request queue but because of nested
+: plug, queue never gets unplugged.  When read logic reaches a page which is
+: not in page cache, it waits for page to be read from the disk
+: (lock_page_killable()) and that time we flush the plug list.
+:
+: So effectively read ahead logic is kind of broken in parts because of
+: nested plugging.  Removing top level plug (generic_file_aio_read()) for
+: buffered reads, will allow unplugging queue earlier for readahead.
+
+Signed-off-by: Shaohua Li <shaohua.li@intel.com>
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Reported-by: Herbert Poetzl <herbert@13thfloor.at>
+Tested-by: Eric Dumazet <eric.dumazet@gmail.com>
+Cc: Christoph Hellwig <hch@infradead.org>
+Cc: Jens Axboe <axboe@kernel.dk>
+Cc: Vivek Goyal <vgoyal@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/filemap.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/mm/filemap.c b/mm/filemap.c
+index 90286a4..03c5b0e 100644
+--- a/mm/filemap.c
++++ b/mm/filemap.c
+@@ -1400,15 +1400,12 @@ generic_file_aio_read(struct kiocb *iocb, const struct iovec *iov,
+ 	unsigned long seg = 0;
+ 	size_t count;
+ 	loff_t *ppos = &iocb->ki_pos;
+-	struct blk_plug plug;
+ 
+ 	count = 0;
+ 	retval = generic_segment_checks(iov, &nr_segs, &count, VERIFY_WRITE);
+ 	if (retval)
+ 		return retval;
+ 
+-	blk_start_plug(&plug);
+-
+ 	/* coalesce the iovecs and go direct-to-BIO for O_DIRECT */
+ 	if (filp->f_flags & O_DIRECT) {
+ 		loff_t size;
+@@ -1424,8 +1421,12 @@ generic_file_aio_read(struct kiocb *iocb, const struct iovec *iov,
+ 			retval = filemap_write_and_wait_range(mapping, pos,
+ 					pos + iov_length(iov, nr_segs) - 1);
+ 			if (!retval) {
++				struct blk_plug plug;
++
++				blk_start_plug(&plug);
+ 				retval = mapping->a_ops->direct_IO(READ, iocb,
+ 							iov, pos, nr_segs);
++				blk_finish_plug(&plug);
+ 			}
+ 			if (retval > 0) {
+ 				*ppos = pos + retval;
+@@ -1481,7 +1482,6 @@ generic_file_aio_read(struct kiocb *iocb, const struct iovec *iov,
+ 			break;
+ 	}
+ out:
+-	blk_finish_plug(&plug);
+ 	return retval;
+ }
+ EXPORT_SYMBOL(generic_file_aio_read);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0002-ALSA-hda-Fix-the-logic-to-detect-VIA-analog-low-curr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0002-ALSA-hda-Fix-the-logic-to-detect-VIA-analog-low-curr.patch
new file mode 100644
index 0000000..a25fadf
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0002-ALSA-hda-Fix-the-logic-to-detect-VIA-analog-low-curr.patch
@@ -0,0 +1,35 @@
+From 02e85499ffcb080ef11c8cc1b092e033f90651f5 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Tue, 24 Jan 2012 13:58:36 +0100
+Subject: [PATCH 02/87] ALSA: hda - Fix the logic to detect VIA analog
+ low-current mode
+
+commit 924339239fd5ba3e505f9420d41f0939196f3530 upstream.
+
+The analog low-current mode must be enabled when the no stream is
+running but the current detection checks it in a wrong way.
+
+Bugzilla: https://bugzilla.novell.com/show_bug.cgi?id=741128
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_via.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
+index 8d69e59..0684542 100644
+--- a/sound/pci/hda/patch_via.c
++++ b/sound/pci/hda/patch_via.c
+@@ -1041,7 +1041,7 @@ static void analog_low_current_mode(struct hda_codec *codec)
+ 	bool enable;
+ 	unsigned int verb, parm;
+ 
+-	enable = is_aa_path_mute(codec) && (spec->opened_streams != 0);
++	enable = is_aa_path_mute(codec) && !spec->opened_streams;
+ 
+ 	/* decide low current mode's verb & parameter */
+ 	switch (spec->codec_type) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0003-ALSA-HDA-Remove-quirk-for-Asus-N53Jq.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0003-ALSA-HDA-Remove-quirk-for-Asus-N53Jq.patch
new file mode 100644
index 0000000..13ad2bc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0003-ALSA-HDA-Remove-quirk-for-Asus-N53Jq.patch
@@ -0,0 +1,35 @@
+From ab692dfced98f2967cf710941d686e66cf519afb Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Fri, 27 Jan 2012 14:31:19 +0100
+Subject: [PATCH 03/87] ALSA: HDA: Remove quirk for Asus N53Jq
+
+commit a389d67cf9849aff1722ed73186a584e2196a873 upstream.
+
+The user reports that he needs to add model=auto for audio to
+work properly. In fact, since node 0x15 is not even a pin node,
+the existing fixup is definitely wrong. Relevant information can
+be found in the buglink below.
+
+BugLink: https://bugs.launchpad.net/bugs/918254
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_realtek.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 5f03c40..d02e8e0 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -5011,7 +5011,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
+ 	SND_PCI_QUIRK(0x1043, 0x8330, "ASUS Eeepc P703 P900A",
+ 		      ALC269_FIXUP_AMIC),
+ 	SND_PCI_QUIRK(0x1043, 0x1013, "ASUS N61Da", ALC269_FIXUP_AMIC),
+-	SND_PCI_QUIRK(0x1043, 0x1113, "ASUS N63Jn", ALC269_FIXUP_AMIC),
+ 	SND_PCI_QUIRK(0x1043, 0x1143, "ASUS B53f", ALC269_FIXUP_AMIC),
+ 	SND_PCI_QUIRK(0x1043, 0x1133, "ASUS UJ20ft", ALC269_FIXUP_AMIC),
+ 	SND_PCI_QUIRK(0x1043, 0x1183, "ASUS K72DR", ALC269_FIXUP_AMIC),
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0004-ALSA-hda-Apply-0x0f-VREF-fix-to-all-ASUS-laptops-wit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0004-ALSA-hda-Apply-0x0f-VREF-fix-to-all-ASUS-laptops-wit.patch
new file mode 100644
index 0000000..e25d66c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0004-ALSA-hda-Apply-0x0f-VREF-fix-to-all-ASUS-laptops-wit.patch
@@ -0,0 +1,117 @@
+From 4f53e64f2effdcbd8f563411031fdc5172f876ce Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Mon, 30 Jan 2012 10:54:08 +0100
+Subject: [PATCH 04/87] ALSA: hda - Apply 0x0f-VREF fix to all ASUS laptops
+ with ALC861/660
+
+commit 31150f2327cbb66363f38e13ca1be973d2f9203a upstream.
+
+It turned out that other ASUS laptops require the similar fix to
+enable the VREF on the pin 0x0f for the secret output amp, not only
+ASUS A6Rp.  Moreover, it's required even when the pin is being used
+as the output.  Thus, writing a fixed value doesn't work always.
+
+This patch applies the VREF-fix for all ASUS laptops with ALC861/660
+in a fixup function that checks the current value and turns on only
+the VREF value no matter whether input or output direction is set.
+
+The automute function is modified as well to keep the pin VREF upon
+muting/unmuting via pin-control; otherwise the pin VREF is reset at
+plugging/unplugging a jack.
+
+Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=42588
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_realtek.c |   43 +++++++++++++++++++++++++++++++++-------
+ 1 files changed, 35 insertions(+), 8 deletions(-)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index d02e8e0..34e5fcc 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -176,6 +176,7 @@ struct alc_spec {
+ 	unsigned int detect_lo:1;	/* Line-out detection enabled */
+ 	unsigned int automute_speaker_possible:1; /* there are speakers and either LO or HP */
+ 	unsigned int automute_lo_possible:1;	  /* there are line outs and HP */
++	unsigned int keep_vref_in_automute:1; /* Don't clear VREF in automute */
+ 
+ 	/* other flags */
+ 	unsigned int no_analog :1; /* digital I/O only */
+@@ -519,13 +520,24 @@ static void do_automute(struct hda_codec *codec, int num_pins, hda_nid_t *pins,
+ 
+ 	for (i = 0; i < num_pins; i++) {
+ 		hda_nid_t nid = pins[i];
++		unsigned int val;
+ 		if (!nid)
+ 			break;
+ 		switch (spec->automute_mode) {
+ 		case ALC_AUTOMUTE_PIN:
++			/* don't reset VREF value in case it's controlling
++			 * the amp (see alc861_fixup_asus_amp_vref_0f())
++			 */
++			if (spec->keep_vref_in_automute) {
++				val = snd_hda_codec_read(codec, nid, 0,
++					AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
++				val &= ~PIN_HP;
++			} else
++				val = 0;
++			val |= pin_bits;
+ 			snd_hda_codec_write(codec, nid, 0,
+ 					    AC_VERB_SET_PIN_WIDGET_CONTROL,
+-					    pin_bits);
++					    val);
+ 			break;
+ 		case ALC_AUTOMUTE_AMP:
+ 			snd_hda_codec_amp_stereo(codec, nid, HDA_OUTPUT, 0,
+@@ -5225,6 +5237,25 @@ enum {
+ 	PINFIX_ASUS_A6RP,
+ };
+ 
++/* On some laptops, VREF of pin 0x0f is abused for controlling the main amp */
++static void alc861_fixup_asus_amp_vref_0f(struct hda_codec *codec,
++			const struct alc_fixup *fix, int action)
++{
++	struct alc_spec *spec = codec->spec;
++	unsigned int val;
++
++	if (action != ALC_FIXUP_ACT_INIT)
++		return;
++	val = snd_hda_codec_read(codec, 0x0f, 0,
++				 AC_VERB_GET_PIN_WIDGET_CONTROL, 0);
++	if (!(val & (AC_PINCTL_IN_EN | AC_PINCTL_OUT_EN)))
++		val |= AC_PINCTL_IN_EN;
++	val |= AC_PINCTL_VREF_50;
++	snd_hda_codec_write(codec, 0x0f, 0,
++			    AC_VERB_SET_PIN_WIDGET_CONTROL, val);
++	spec->keep_vref_in_automute = 1;
++}
++
+ static const struct alc_fixup alc861_fixups[] = {
+ 	[PINFIX_FSC_AMILO_PI1505] = {
+ 		.type = ALC_FIXUP_PINS,
+@@ -5235,17 +5266,13 @@ static const struct alc_fixup alc861_fixups[] = {
+ 		}
+ 	},
+ 	[PINFIX_ASUS_A6RP] = {
+-		.type = ALC_FIXUP_VERBS,
+-		.v.verbs = (const struct hda_verb[]) {
+-			/* node 0x0f VREF seems controlling the master output */
+-			{ 0x0f, AC_VERB_SET_PIN_WIDGET_CONTROL, PIN_VREF50 },
+-			{ }
+-		},
++		.type = ALC_FIXUP_FUNC,
++		.v.func = alc861_fixup_asus_amp_vref_0f,
+ 	},
+ };
+ 
+ static const struct snd_pci_quirk alc861_fixup_tbl[] = {
+-	SND_PCI_QUIRK(0x1043, 0x1393, "ASUS A6Rp", PINFIX_ASUS_A6RP),
++	SND_PCI_QUIRK_VENDOR(0x1043, "ASUS laptop", PINFIX_ASUS_A6RP),
+ 	SND_PCI_QUIRK(0x1584, 0x2b01, "Haier W18", PINFIX_ASUS_A6RP),
+ 	SND_PCI_QUIRK(0x1734, 0x10c7, "FSC Amilo Pi1505", PINFIX_FSC_AMILO_PI1505),
+ 	{}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0005-ALSA-hda-Fix-calling-cs_automic-twice-for-Cirrus-cod.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0005-ALSA-hda-Fix-calling-cs_automic-twice-for-Cirrus-cod.patch
new file mode 100644
index 0000000..db90e5d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0005-ALSA-hda-Fix-calling-cs_automic-twice-for-Cirrus-cod.patch
@@ -0,0 +1,45 @@
+From d0f03303d8a9c7c82856c50e6c7ea137c8ca7c83 Mon Sep 17 00:00:00 2001
+From: Dylan Reid <dgreid@chromium.org>
+Date: Tue, 31 Jan 2012 13:04:41 -0800
+Subject: [PATCH 05/87] ALSA: hda - Fix calling cs_automic twice for Cirrus
+ codecs.
+
+commit f70eecde3bca92630d3886496e73316ff353f185 upstream.
+
+If cs_automic is called twice (like it is during init) while the mic
+is present, it will over-write the last_input with the new one,
+causing it to switch back to the automic input when the mic is
+unplugged. This leaves the driver in a state (cur_input, last_input,
+and automix_idx the same) where the internal mic can not be selected
+until it is rebooted without the mic attached.
+
+Check that the mic hasn't already been switched to before setting
+last_input.
+
+Signed-off-by: Dylan Reid <dgreid@chromium.org>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_cirrus.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/sound/pci/hda/patch_cirrus.c b/sound/pci/hda/patch_cirrus.c
+index 5b0a9bb..ec0518e 100644
+--- a/sound/pci/hda/patch_cirrus.c
++++ b/sound/pci/hda/patch_cirrus.c
+@@ -976,8 +976,10 @@ static void cs_automic(struct hda_codec *codec)
+ 	/* specific to CS421x, single ADC */
+ 	if (spec->vendor_nid == CS421X_VENDOR_NID) {
+ 		if (present) {
+-			spec->last_input = spec->cur_input;
+-			spec->cur_input = spec->automic_idx;
++			if (spec->cur_input != spec->automic_idx) {
++				spec->last_input = spec->cur_input;
++				spec->cur_input = spec->automic_idx;
++			}
+ 		} else  {
+ 			spec->cur_input = spec->last_input;
+ 		}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0006-ALSA-hda-Allow-analog-low-current-mode-when-dynamic-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0006-ALSA-hda-Allow-analog-low-current-mode-when-dynamic-.patch
new file mode 100644
index 0000000..fba2b6d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0006-ALSA-hda-Allow-analog-low-current-mode-when-dynamic-.patch
@@ -0,0 +1,105 @@
+From cb935a3a4ffa533491976365aa430ad9d586718f Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Wed, 1 Feb 2012 10:33:23 +0100
+Subject: [PATCH 06/87] ALSA: hda - Allow analog low-current mode when dynamic
+ power-control is on
+
+commit e9d010c2e8f03952e67a6fd8aed0f0dc92084ccc upstream.
+
+VIA codecs have several different power-saving features, and one of
+them is the analog low-current mode.  But it turned out that the ALC
+mode causes pop-noises at each on/off time on some machines.  As a
+quick workaround, disable the ALC when another power-saving feature,
+the dynamic pin power-control, is turned off, too, since the dynamic
+power-control is already exposed as a mixer enum element so that user
+can turn it on/off freely.
+
+Bugzilla: https://bugzilla.novell.com/show_bug.cgi?id=741128
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_via.c |   27 +++++++++++++++++++++------
+ 1 files changed, 21 insertions(+), 6 deletions(-)
+
+diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
+index 0684542..d2a477d 100644
+--- a/sound/pci/hda/patch_via.c
++++ b/sound/pci/hda/patch_via.c
+@@ -198,6 +198,9 @@ struct via_spec {
+ 	unsigned int no_pin_power_ctl;
+ 	enum VIA_HDA_CODEC codec_type;
+ 
++	/* analog low-power control */
++	bool alc_mode;
++
+ 	/* smart51 setup */
+ 	unsigned int smart51_nums;
+ 	hda_nid_t smart51_pins[2];
+@@ -748,6 +751,7 @@ static int via_pin_power_ctl_put(struct snd_kcontrol *kcontrol,
+ 		return 0;
+ 	spec->no_pin_power_ctl = val;
+ 	set_widgets_power_state(codec);
++	analog_low_current_mode(codec);
+ 	return 1;
+ }
+ 
+@@ -1035,13 +1039,19 @@ static bool is_aa_path_mute(struct hda_codec *codec)
+ }
+ 
+ /* enter/exit analog low-current mode */
+-static void analog_low_current_mode(struct hda_codec *codec)
++static void __analog_low_current_mode(struct hda_codec *codec, bool force)
+ {
+ 	struct via_spec *spec = codec->spec;
+ 	bool enable;
+ 	unsigned int verb, parm;
+ 
+-	enable = is_aa_path_mute(codec) && !spec->opened_streams;
++	if (spec->no_pin_power_ctl)
++		enable = false;
++	else
++		enable = is_aa_path_mute(codec) && !spec->opened_streams;
++	if (enable == spec->alc_mode && !force)
++		return;
++	spec->alc_mode = enable;
+ 
+ 	/* decide low current mode's verb & parameter */
+ 	switch (spec->codec_type) {
+@@ -1073,6 +1083,11 @@ static void analog_low_current_mode(struct hda_codec *codec)
+ 	snd_hda_codec_write(codec, codec->afg, 0, verb, parm);
+ }
+ 
++static void analog_low_current_mode(struct hda_codec *codec)
++{
++	return __analog_low_current_mode(codec, false);
++}
++
+ /*
+  * generic initialization of ADC, input mixers and output mixers
+  */
+@@ -1498,10 +1513,6 @@ static int via_build_controls(struct hda_codec *codec)
+ 			return err;
+ 	}
+ 
+-	/* init power states */
+-	set_widgets_power_state(codec);
+-	analog_low_current_mode(codec);
+-
+ 	via_free_kctls(codec); /* no longer needed */
+ 	return 0;
+ }
+@@ -2771,6 +2782,10 @@ static int via_init(struct hda_codec *codec)
+ 	for (i = 0; i < spec->num_iverbs; i++)
+ 		snd_hda_sequence_write(codec, spec->init_verbs[i]);
+ 
++	/* init power states */
++	set_widgets_power_state(codec);
++	__analog_low_current_mode(codec, true);
++
+ 	via_auto_init_multi_out(codec);
+ 	via_auto_init_hp_out(codec);
+ 	via_auto_init_speaker_out(codec);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0007-ALSA-HDA-Fix-duplicated-output-to-more-than-one-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0007-ALSA-HDA-Fix-duplicated-output-to-more-than-one-code.patch
new file mode 100644
index 0000000..e3e4e6d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0007-ALSA-HDA-Fix-duplicated-output-to-more-than-one-code.patch
@@ -0,0 +1,36 @@
+From b23a6ba81e42ad2d95afc04840d08b558092ba24 Mon Sep 17 00:00:00 2001
+From: David Henningsson <david.henningsson@canonical.com>
+Date: Wed, 1 Feb 2012 12:05:41 +0100
+Subject: [PATCH 07/87] ALSA: HDA: Fix duplicated output to more than one
+ codec
+
+commit 54c2a89f60fd71b924d0f848ac892442951401a6 upstream.
+
+This typo caused the wrong codec's nid to be checked for wcaps type.
+As a result, sometimes speakers would duplicate the output sent to
+HDMI output.
+
+BugLink: https://bugs.launchpad.net/bugs/924320
+Signed-off-by: David Henningsson <david.henningsson@canonical.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/hda_codec.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/sound/pci/hda/hda_codec.c b/sound/pci/hda/hda_codec.c
+index 4562e9d..05c8768 100644
+--- a/sound/pci/hda/hda_codec.c
++++ b/sound/pci/hda/hda_codec.c
+@@ -1446,7 +1446,7 @@ void snd_hda_codec_setup_stream(struct hda_codec *codec, hda_nid_t nid,
+ 		for (i = 0; i < c->cvt_setups.used; i++) {
+ 			p = snd_array_elem(&c->cvt_setups, i);
+ 			if (!p->active && p->stream_tag == stream_tag &&
+-			    get_wcaps_type(get_wcaps(codec, p->nid)) == type)
++			    get_wcaps_type(get_wcaps(c, p->nid)) == type)
+ 				p->dirty = 1;
+ 		}
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0008-ALSA-hda-Disable-dynamic-power-control-for-VIA-as-de.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0008-ALSA-hda-Disable-dynamic-power-control-for-VIA-as-de.patch
new file mode 100644
index 0000000..e8afd51
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0008-ALSA-hda-Disable-dynamic-power-control-for-VIA-as-de.patch
@@ -0,0 +1,34 @@
+From 1e7c37777276bcae0ead904309644422bace8608 Mon Sep 17 00:00:00 2001
+From: Takashi Iwai <tiwai@suse.de>
+Date: Thu, 2 Feb 2012 10:30:17 +0100
+Subject: [PATCH 08/87] ALSA: hda - Disable dynamic-power control for VIA as
+ default
+
+commit b5bcc189401c815988b7dd37611fc56f40c9139d upstream.
+
+Since the dynamic pin power-control and the analog low-current mode
+may lead to pop-noise, it's safer to set it off as default.
+
+Bugzilla: https://bugzilla.novell.com/show_bug.cgi?id=741128
+
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_via.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/sound/pci/hda/patch_via.c b/sound/pci/hda/patch_via.c
+index d2a477d..a0a3f50 100644
+--- a/sound/pci/hda/patch_via.c
++++ b/sound/pci/hda/patch_via.c
+@@ -1460,6 +1460,7 @@ static int via_build_controls(struct hda_codec *codec)
+ 	struct snd_kcontrol *kctl;
+ 	int err, i;
+ 
++	spec->no_pin_power_ctl = 1;
+ 	if (spec->set_widgets_power_state)
+ 		if (!via_clone_control(spec, &via_pin_power_ctl_enum))
+ 			return -ENOMEM;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0009-ASoC-wm_hubs-Enable-line-out-VMID-buffer-for-single-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0009-ASoC-wm_hubs-Enable-line-out-VMID-buffer-for-single-.patch
new file mode 100644
index 0000000..6e82d4b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0009-ASoC-wm_hubs-Enable-line-out-VMID-buffer-for-single-.patch
@@ -0,0 +1,57 @@
+From 7e1a603295915f189e0b1b2207f5c9297ee65250 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Fri, 20 Jan 2012 12:19:43 +0000
+Subject: [PATCH 09/87] ASoC: wm_hubs: Enable line out VMID buffer for single
+ ended line outputs
+
+commit 77231abe55433aa17eca712718745275853fa66d upstream.
+
+For optimal performance the single ended line outputs require that the
+line output VMID buffer be enabled.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm_hubs.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
+index 48e61e9..8c26c6d 100644
+--- a/sound/soc/codecs/wm_hubs.c
++++ b/sound/soc/codecs/wm_hubs.c
+@@ -614,6 +614,8 @@ SND_SOC_DAPM_INPUT("IN2RP:VXRP"),
+ SND_SOC_DAPM_MICBIAS("MICBIAS2", WM8993_POWER_MANAGEMENT_1, 5, 0),
+ SND_SOC_DAPM_MICBIAS("MICBIAS1", WM8993_POWER_MANAGEMENT_1, 4, 0),
+ 
++SND_SOC_DAPM_SUPPLY("LINEOUT_VMID_BUF", WM8993_ANTIPOP1, 7, 0, NULL, 0),
++
+ SND_SOC_DAPM_MIXER("IN1L PGA", WM8993_POWER_MANAGEMENT_2, 6, 0,
+ 		   in1l_pga, ARRAY_SIZE(in1l_pga)),
+ SND_SOC_DAPM_MIXER("IN1R PGA", WM8993_POWER_MANAGEMENT_2, 4, 0,
+@@ -832,9 +834,11 @@ static const struct snd_soc_dapm_route lineout1_diff_routes[] = {
+ };
+ 
+ static const struct snd_soc_dapm_route lineout1_se_routes[] = {
++	{ "LINEOUT1N Mixer", NULL, "LINEOUT_VMID_BUF" },
+ 	{ "LINEOUT1N Mixer", "Left Output Switch", "Left Output PGA" },
+ 	{ "LINEOUT1N Mixer", "Right Output Switch", "Right Output PGA" },
+ 
++	{ "LINEOUT1P Mixer", NULL, "LINEOUT_VMID_BUF" },
+ 	{ "LINEOUT1P Mixer", "Left Output Switch", "Left Output PGA" },
+ 
+ 	{ "LINEOUT1N Driver", NULL, "LINEOUT1N Mixer" },
+@@ -851,9 +855,11 @@ static const struct snd_soc_dapm_route lineout2_diff_routes[] = {
+ };
+ 
+ static const struct snd_soc_dapm_route lineout2_se_routes[] = {
++	{ "LINEOUT2N Mixer", NULL, "LINEOUT_VMID_BUF" },
+ 	{ "LINEOUT2N Mixer", "Left Output Switch", "Left Output PGA" },
+ 	{ "LINEOUT2N Mixer", "Right Output Switch", "Right Output PGA" },
+ 
++	{ "LINEOUT2P Mixer", NULL, "LINEOUT_VMID_BUF" },
+ 	{ "LINEOUT2P Mixer", "Right Output Switch", "Right Output PGA" },
+ 
+ 	{ "LINEOUT2N Driver", NULL, "LINEOUT2N Mixer" },
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0010-ASoC-wm_hubs-fix-wrong-bits-for-LINEOUT2-N-P-mixer.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0010-ASoC-wm_hubs-fix-wrong-bits-for-LINEOUT2-N-P-mixer.patch
new file mode 100644
index 0000000..13e5936
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0010-ASoC-wm_hubs-fix-wrong-bits-for-LINEOUT2-N-P-mixer.patch
@@ -0,0 +1,32 @@
+From f886b09222d9ae6a977aa75e7b1e924fddca2d5f Mon Sep 17 00:00:00 2001
+From: UK KIM <w0806.kim@samsung.com>
+Date: Sat, 28 Jan 2012 01:52:22 +0900
+Subject: [PATCH 10/87] ASoC: wm_hubs: fix wrong bits for LINEOUT2 N/P mixer
+
+commit 114395c61ad2eb5a7a5cd163fcadb2414e48245a upstream.
+
+Signed-off-by: UK KIM <w0806.kim@samsung.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm_hubs.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
+index 8c26c6d..8547191 100644
+--- a/sound/soc/codecs/wm_hubs.c
++++ b/sound/soc/codecs/wm_hubs.c
+@@ -593,8 +593,8 @@ SOC_DAPM_SINGLE("Output Switch", WM8993_LINE_MIXER2, 0, 1, 0),
+ };
+ 
+ static const struct snd_kcontrol_new line2n_mix[] = {
+-SOC_DAPM_SINGLE("Left Output Switch", WM8993_LINE_MIXER2, 6, 1, 0),
+-SOC_DAPM_SINGLE("Right Output Switch", WM8993_LINE_MIXER2, 5, 1, 0),
++SOC_DAPM_SINGLE("Left Output Switch", WM8993_LINE_MIXER2, 5, 1, 0),
++SOC_DAPM_SINGLE("Right Output Switch", WM8993_LINE_MIXER2, 6, 1, 0),
+ };
+ 
+ static const struct snd_kcontrol_new line2p_mix[] = {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0011-ARM-7306-1-vfp-flush-thread-hwstate-before-restoring.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0011-ARM-7306-1-vfp-flush-thread-hwstate-before-restoring.patch
new file mode 100644
index 0000000..116be5f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0011-ARM-7306-1-vfp-flush-thread-hwstate-before-restoring.patch
@@ -0,0 +1,60 @@
+From 04c6e8a2521ffa7049aa6df835d48d4bfce37a8e Mon Sep 17 00:00:00 2001
+From: Will Deacon <will.deacon@arm.com>
+Date: Mon, 30 Jan 2012 20:21:42 +0100
+Subject: [PATCH 11/87] ARM: 7306/1: vfp: flush thread hwstate before
+ restoring context from sigframe
+
+commit 2af276dfb1722e97b190bd2e646b079a2aa674db upstream.
+
+Following execution of a signal handler, we currently restore the VFP
+context from the ucontext in the signal frame. This involves copying
+from the user stack into the current thread's vfp_hard_struct and then
+flushing the new data out to the hardware registers.
+
+This is problematic when using a preemptible kernel because we could be
+context switched whilst updating the vfp_hard_struct. If the current
+thread has made use of VFP since the last context switch, the VFP
+notifier will copy from the hardware registers into the vfp_hard_struct,
+overwriting any data that had been partially copied by the signal code.
+
+Disabling preemption across copy_from_user calls is a terrible idea, so
+instead we move the VFP thread flush *before* we update the
+vfp_hard_struct. Since the flushing is performed lazily, this has the
+effect of disabling VFP and clearing the CPU's VFP state pointer,
+therefore preventing the thread from being updated with stale data on
+the next context switch.
+
+Tested-by: Peter Maydell <peter.maydell@linaro.org>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/kernel/signal.c |    5 ++---
+ 1 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
+index 0340224..9e617bd 100644
+--- a/arch/arm/kernel/signal.c
++++ b/arch/arm/kernel/signal.c
+@@ -227,6 +227,8 @@ static int restore_vfp_context(struct vfp_sigframe __user *frame)
+ 	if (magic != VFP_MAGIC || size != VFP_STORAGE_SIZE)
+ 		return -EINVAL;
+ 
++	vfp_flush_hwstate(thread);
++
+ 	/*
+ 	 * Copy the floating point registers. There can be unused
+ 	 * registers see asm/hwcap.h for details.
+@@ -251,9 +253,6 @@ static int restore_vfp_context(struct vfp_sigframe __user *frame)
+ 	__get_user_error(h->fpinst, &frame->ufp_exc.fpinst, err);
+ 	__get_user_error(h->fpinst2, &frame->ufp_exc.fpinst2, err);
+ 
+-	if (!err)
+-		vfp_flush_hwstate(thread);
+-
+ 	return err ? -EFAULT : 0;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0012-ARM-7307-1-vfp-fix-ptrace-regset-modification-race.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0012-ARM-7307-1-vfp-fix-ptrace-regset-modification-race.patch
new file mode 100644
index 0000000..139c766
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0012-ARM-7307-1-vfp-fix-ptrace-regset-modification-race.patch
@@ -0,0 +1,68 @@
+From c85ca4cdfafaee9fd428b934fea18e5c2d850fb6 Mon Sep 17 00:00:00 2001
+From: Dave Martin <dave.martin@linaro.org>
+Date: Mon, 30 Jan 2012 20:22:28 +0100
+Subject: [PATCH 12/87] ARM: 7307/1: vfp: fix ptrace regset modification race
+
+commit 247f4993a5974e6759606c4d380748eecfd273ff upstream.
+
+In a preemptible kernel, vfp_set() can be preempted, causing the
+hardware VFP context to be switched while the thread vfp state is
+being read and modified.  This leads to a race condition which can
+cause the thread vfp state to become corrupted if lazy VFP context
+save occurs due to preemption in between the time thread->vfpstate
+is read and the time the modified state is written back.
+
+This may occur if preemption occurs during the execution of a
+ptrace() call which modifies the VFP register state of a thread.
+Such instances should be very rare in most realistic scenarios --
+none has been reported, so far as I am aware.  Only uniprocessor
+systems should be affected, since VFP context save is not currently
+lazy in SMP kernels.
+
+The problem was introduced by my earlier patch migrating to use
+regsets to implement ptrace.
+
+This patch does a vfp_sync_hwstate() before reading
+thread->vfpstate, to make sure that the thread's VFP state is not
+live in the hardware registers while the registers are modified.
+
+Thanks to Will Deacon for spotting this.
+
+Signed-off-by: Dave Martin <dave.martin@linaro.org>
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/kernel/ptrace.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
+index 483727a..8b17fb4 100644
+--- a/arch/arm/kernel/ptrace.c
++++ b/arch/arm/kernel/ptrace.c
+@@ -699,10 +699,13 @@ static int vfp_set(struct task_struct *target,
+ {
+ 	int ret;
+ 	struct thread_info *thread = task_thread_info(target);
+-	struct vfp_hard_struct new_vfp = thread->vfpstate.hard;
++	struct vfp_hard_struct new_vfp;
+ 	const size_t user_fpregs_offset = offsetof(struct user_vfp, fpregs);
+ 	const size_t user_fpscr_offset = offsetof(struct user_vfp, fpscr);
+ 
++	vfp_sync_hwstate(thread);
++	new_vfp = thread->vfpstate.hard;
++
+ 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
+ 				  &new_vfp.fpregs,
+ 				  user_fpregs_offset,
+@@ -723,7 +726,6 @@ static int vfp_set(struct task_struct *target,
+ 	if (ret)
+ 		return ret;
+ 
+-	vfp_sync_hwstate(thread);
+ 	thread->vfpstate.hard = new_vfp;
+ 	vfp_flush_hwstate(thread);
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0013-ARM-7308-1-vfp-flush-thread-hwstate-before-copying-p.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0013-ARM-7308-1-vfp-flush-thread-hwstate-before-copying-p.patch
new file mode 100644
index 0000000..df943e4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0013-ARM-7308-1-vfp-flush-thread-hwstate-before-copying-p.patch
@@ -0,0 +1,41 @@
+From a4e4a6ee0cc6e069926d006b7a6efd73d33edfcc Mon Sep 17 00:00:00 2001
+From: Will Deacon <will.deacon@arm.com>
+Date: Mon, 30 Jan 2012 20:23:29 +0100
+Subject: [PATCH 13/87] ARM: 7308/1: vfp: flush thread hwstate before copying
+ ptrace registers
+
+commit 8130b9d7b9d858aa04ce67805e8951e3cb6e9b2f upstream.
+
+If we are context switched whilst copying into a thread's
+vfp_hard_struct then the partial copy may be corrupted by the VFP
+context switching code (see "ARM: vfp: flush thread hwstate before
+restoring context from sigframe").
+
+This patch updates the ptrace VFP set code so that the thread state is
+flushed before the copy, therefore disabling VFP and preventing
+corruption from occurring.
+
+Signed-off-by: Will Deacon <will.deacon@arm.com>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/kernel/ptrace.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/arch/arm/kernel/ptrace.c b/arch/arm/kernel/ptrace.c
+index 8b17fb4..90fa8b3 100644
+--- a/arch/arm/kernel/ptrace.c
++++ b/arch/arm/kernel/ptrace.c
+@@ -726,8 +726,8 @@ static int vfp_set(struct task_struct *target,
+ 	if (ret)
+ 		return ret;
+ 
+-	thread->vfpstate.hard = new_vfp;
+ 	vfp_flush_hwstate(thread);
++	thread->vfpstate.hard = new_vfp;
+ 
+ 	return 0;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0014-ARM-OMAP2-GPMC-fix-device-size-setup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0014-ARM-OMAP2-GPMC-fix-device-size-setup.patch
new file mode 100644
index 0000000..a2f52fe
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0014-ARM-OMAP2-GPMC-fix-device-size-setup.patch
@@ -0,0 +1,43 @@
+From 04712489fde65768a46fa4a4b240fff446c17aa6 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegor_sub1@visionsystems.de>
+Date: Mon, 23 Jan 2012 08:32:23 +0100
+Subject: [PATCH 14/87] ARM: OMAP2+: GPMC: fix device size setup
+
+commit 8ef5d844cc3a644ea6f7665932a4307e9fad01fa upstream.
+
+following statement can only change device size from 8-bit(0) to 16-bit(1),
+but not vice versa:
+
+regval |= GPMC_CONFIG1_DEVICESIZE(wval);
+
+so as this field has 1 reserved bit, that could be used in future,
+just clear both bits and then OR with the desired value
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Signed-off-by: Tony Lindgren <tony@atomide.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/arm/mach-omap2/gpmc.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/arch/arm/mach-omap2/gpmc.c b/arch/arm/mach-omap2/gpmc.c
+index 130034b..dfffbbf 100644
+--- a/arch/arm/mach-omap2/gpmc.c
++++ b/arch/arm/mach-omap2/gpmc.c
+@@ -528,7 +528,13 @@ int gpmc_cs_configure(int cs, int cmd, int wval)
+ 
+ 	case GPMC_CONFIG_DEV_SIZE:
+ 		regval  = gpmc_cs_read_reg(cs, GPMC_CS_CONFIG1);
++
++		/* clear 2 target bits */
++		regval &= ~GPMC_CONFIG1_DEVICESIZE(3);
++
++		/* set the proper value */
+ 		regval |= GPMC_CONFIG1_DEVICESIZE(wval);
++
+ 		gpmc_cs_write_reg(cs, GPMC_CS_CONFIG1, regval);
+ 		break;
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0015-drivers-tty-vt-vt_ioctl.c-fix-KDFONTOP-32bit-compati.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0015-drivers-tty-vt-vt_ioctl.c-fix-KDFONTOP-32bit-compati.patch
new file mode 100644
index 0000000..9b0e85e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0015-drivers-tty-vt-vt_ioctl.c-fix-KDFONTOP-32bit-compati.patch
@@ -0,0 +1,44 @@
+From 58f75a56e37352b7dea174ee75f2ca52218370a7 Mon Sep 17 00:00:00 2001
+From: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Date: Fri, 3 Feb 2012 15:37:15 -0800
+Subject: [PATCH 15/87] drivers/tty/vt/vt_ioctl.c: fix KDFONTOP 32bit
+ compatibility layer
+
+commit cbcb8346054073d000ecac324763372d6abd44ac upstream.
+
+KDFONTOP(GET) currently fails with EIO when being run in a 32bit userland
+with a 64bit kernel if the font width is not 8.
+
+This is because of the setting of the KD_FONT_FLAG_OLD flag, which makes
+con_font_get return EIO in such case.
+
+This flag should *not* be set for KDFONTOP, since it's actually the whole
+point of this flag (see comment in con_font_set for instance).
+
+Signed-off-by: Samuel Thibault <samuel.thibault@ens-lyon.org>
+Reviewed-by: Arnd Bergmann <arnd@arndb.de>
+Cc: Arthur Taylor <art@ified.ca>
+Cc: Jiri Slaby <jslaby@suse.cz>
+Cc: Jiri Olsa <jolsa@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/tty/vt/vt_ioctl.c |    1 -
+ 1 files changed, 0 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/tty/vt/vt_ioctl.c b/drivers/tty/vt/vt_ioctl.c
+index 5e096f4..65447c5 100644
+--- a/drivers/tty/vt/vt_ioctl.c
++++ b/drivers/tty/vt/vt_ioctl.c
+@@ -1463,7 +1463,6 @@ compat_kdfontop_ioctl(struct compat_console_font_op __user *fontop,
+ 	if (!perm && op->op != KD_FONT_OP_GET)
+ 		return -EPERM;
+ 	op->data = compat_ptr(((struct compat_console_font_op *)op)->data);
+-	op->flags |= KD_FONT_FLAG_OLD;
+ 	i = con_font_op(vc, op);
+ 	if (i)
+ 		return i;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0016-proc-mem_release-should-check-mm-NULL.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0016-proc-mem_release-should-check-mm-NULL.patch
new file mode 100644
index 0000000..200bc68
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0016-proc-mem_release-should-check-mm-NULL.patch
@@ -0,0 +1,34 @@
+From 3a196fbe2650a4465d49f6e84d9360eab60e3bcb Mon Sep 17 00:00:00 2001
+From: Oleg Nesterov <oleg@redhat.com>
+Date: Tue, 31 Jan 2012 17:14:38 +0100
+Subject: [PATCH 16/87] proc: mem_release() should check mm != NULL
+
+commit 71879d3cb3dd8f2dfdefb252775c1b3ea04a3dd4 upstream.
+
+mem_release() can hit mm == NULL, add the necessary check.
+
+Signed-off-by: Oleg Nesterov <oleg@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/proc/base.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/fs/proc/base.c b/fs/proc/base.c
+index 1fc1dca..a43c70a 100644
+--- a/fs/proc/base.c
++++ b/fs/proc/base.c
+@@ -886,8 +886,8 @@ loff_t mem_lseek(struct file *file, loff_t offset, int orig)
+ static int mem_release(struct inode *inode, struct file *file)
+ {
+ 	struct mm_struct *mm = file->private_data;
+-
+-	mmput(mm);
++	if (mm)
++		mmput(mm);
+ 	return 0;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0017-proc-unify-mem_read-and-mem_write.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0017-proc-unify-mem_read-and-mem_write.patch
new file mode 100644
index 0000000..1c26c7f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0017-proc-unify-mem_read-and-mem_write.patch
@@ -0,0 +1,148 @@
+From 034089b6f4e2ae0d0df38f3409cd73c386ad069a Mon Sep 17 00:00:00 2001
+From: Oleg Nesterov <oleg@redhat.com>
+Date: Tue, 31 Jan 2012 17:14:54 +0100
+Subject: [PATCH 17/87] proc: unify mem_read() and mem_write()
+
+commit 572d34b946bae070debd42db1143034d9687e13f upstream.
+
+No functional changes, cleanup and preparation.
+
+mem_read() and mem_write() are very similar. Move this code into the
+new common helper, mem_rw(), which takes the additional "int write"
+argument.
+
+Signed-off-by: Oleg Nesterov <oleg@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/proc/base.c |   90 ++++++++++++++++++++------------------------------------
+ 1 files changed, 32 insertions(+), 58 deletions(-)
+
+diff --git a/fs/proc/base.c b/fs/proc/base.c
+index a43c70a..0d3a4d1 100644
+--- a/fs/proc/base.c
++++ b/fs/proc/base.c
+@@ -782,57 +782,13 @@ static int mem_open(struct inode* inode, struct file* file)
+ 	return 0;
+ }
+ 
+-static ssize_t mem_read(struct file * file, char __user * buf,
+-			size_t count, loff_t *ppos)
++static ssize_t mem_rw(struct file *file, char __user *buf,
++			size_t count, loff_t *ppos, int write)
+ {
+-	int ret;
+-	char *page;
+-	unsigned long src = *ppos;
+ 	struct mm_struct *mm = file->private_data;
+-
+-	if (!mm)
+-		return 0;
+-
+-	page = (char *)__get_free_page(GFP_TEMPORARY);
+-	if (!page)
+-		return -ENOMEM;
+-
+-	ret = 0;
+- 
+-	while (count > 0) {
+-		int this_len, retval;
+-
+-		this_len = (count > PAGE_SIZE) ? PAGE_SIZE : count;
+-		retval = access_remote_vm(mm, src, page, this_len, 0);
+-		if (!retval) {
+-			if (!ret)
+-				ret = -EIO;
+-			break;
+-		}
+-
+-		if (copy_to_user(buf, page, retval)) {
+-			ret = -EFAULT;
+-			break;
+-		}
+- 
+-		ret += retval;
+-		src += retval;
+-		buf += retval;
+-		count -= retval;
+-	}
+-	*ppos = src;
+-
+-	free_page((unsigned long) page);
+-	return ret;
+-}
+-
+-static ssize_t mem_write(struct file * file, const char __user *buf,
+-			 size_t count, loff_t *ppos)
+-{
+-	int copied;
++	unsigned long addr = *ppos;
++	ssize_t copied;
+ 	char *page;
+-	unsigned long dst = *ppos;
+-	struct mm_struct *mm = file->private_data;
+ 
+ 	if (!mm)
+ 		return 0;
+@@ -843,30 +799,48 @@ static ssize_t mem_write(struct file * file, const char __user *buf,
+ 
+ 	copied = 0;
+ 	while (count > 0) {
+-		int this_len, retval;
++		int this_len = min_t(int, count, PAGE_SIZE);
+ 
+-		this_len = (count > PAGE_SIZE) ? PAGE_SIZE : count;
+-		if (copy_from_user(page, buf, this_len)) {
++		if (write && copy_from_user(page, buf, this_len)) {
+ 			copied = -EFAULT;
+ 			break;
+ 		}
+-		retval = access_remote_vm(mm, dst, page, this_len, 1);
+-		if (!retval) {
++
++		this_len = access_remote_vm(mm, addr, page, this_len, write);
++		if (!this_len) {
+ 			if (!copied)
+ 				copied = -EIO;
+ 			break;
+ 		}
+-		copied += retval;
+-		buf += retval;
+-		dst += retval;
+-		count -= retval;			
++
++		if (!write && copy_to_user(buf, page, this_len)) {
++			copied = -EFAULT;
++			break;
++		}
++
++		buf += this_len;
++		addr += this_len;
++		copied += this_len;
++		count -= this_len;
+ 	}
+-	*ppos = dst;
++	*ppos = addr;
+ 
+ 	free_page((unsigned long) page);
+ 	return copied;
+ }
+ 
++static ssize_t mem_read(struct file *file, char __user *buf,
++			size_t count, loff_t *ppos)
++{
++	return mem_rw(file, buf, count, ppos, 0);
++}
++
++static ssize_t mem_write(struct file *file, const char __user *buf,
++			 size_t count, loff_t *ppos)
++{
++	return mem_rw(file, (char __user*)buf, count, ppos, 1);
++}
++
+ loff_t mem_lseek(struct file *file, loff_t offset, int orig)
+ {
+ 	switch (orig) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0018-proc-make-sure-mem_open-doesn-t-pin-the-target-s-mem.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0018-proc-make-sure-mem_open-doesn-t-pin-the-target-s-mem.patch
new file mode 100644
index 0000000..836e302
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0018-proc-make-sure-mem_open-doesn-t-pin-the-target-s-mem.patch
@@ -0,0 +1,79 @@
+From 43904e95ba660b59db5899a4d58a00e4ac4d3663 Mon Sep 17 00:00:00 2001
+From: Oleg Nesterov <oleg@redhat.com>
+Date: Tue, 31 Jan 2012 17:15:11 +0100
+Subject: [PATCH 18/87] proc: make sure mem_open() doesn't pin the target's
+ memory
+
+commit 6d08f2c7139790c268820a2e590795cb8333181a upstream.
+
+Once /proc/pid/mem is opened, the memory can't be released until
+mem_release() even if its owner exits.
+
+Change mem_open() to do atomic_inc(mm_count) + mmput(), this only
+pins mm_struct. Change mem_rw() to do atomic_inc_not_zero(mm_count)
+before access_remote_vm(), this verifies that this mm is still alive.
+
+I am not sure what should mem_rw() return if atomic_inc_not_zero()
+fails. With this patch it returns zero to match the "mm == NULL" case,
+may be it should return -EINVAL like it did before e268337d.
+
+Perhaps it makes sense to add the additional fatal_signal_pending()
+check into the main loop, to ensure we do not hold this memory if
+the target task was oom-killed.
+
+Signed-off-by: Oleg Nesterov <oleg@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/proc/base.c |   14 +++++++++++++-
+ 1 files changed, 13 insertions(+), 1 deletions(-)
+
+diff --git a/fs/proc/base.c b/fs/proc/base.c
+index 0d3a4d1..1ace83d 100644
+--- a/fs/proc/base.c
++++ b/fs/proc/base.c
+@@ -775,6 +775,13 @@ static int mem_open(struct inode* inode, struct file* file)
+ 	if (IS_ERR(mm))
+ 		return PTR_ERR(mm);
+ 
++	if (mm) {
++		/* ensure this mm_struct can't be freed */
++		atomic_inc(&mm->mm_count);
++		/* but do not pin its memory */
++		mmput(mm);
++	}
++
+ 	/* OK to pass negative loff_t, we can catch out-of-range */
+ 	file->f_mode |= FMODE_UNSIGNED_OFFSET;
+ 	file->private_data = mm;
+@@ -798,6 +805,9 @@ static ssize_t mem_rw(struct file *file, char __user *buf,
+ 		return -ENOMEM;
+ 
+ 	copied = 0;
++	if (!atomic_inc_not_zero(&mm->mm_users))
++		goto free;
++
+ 	while (count > 0) {
+ 		int this_len = min_t(int, count, PAGE_SIZE);
+ 
+@@ -825,6 +835,8 @@ static ssize_t mem_rw(struct file *file, char __user *buf,
+ 	}
+ 	*ppos = addr;
+ 
++	mmput(mm);
++free:
+ 	free_page((unsigned long) page);
+ 	return copied;
+ }
+@@ -861,7 +873,7 @@ static int mem_release(struct inode *inode, struct file *file)
+ {
+ 	struct mm_struct *mm = file->private_data;
+ 	if (mm)
+-		mmput(mm);
++		mmdrop(mm);
+ 	return 0;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0019-firewire-ohci-add-reset-packet-quirk-for-SB-Audigy.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0019-firewire-ohci-add-reset-packet-quirk-for-SB-Audigy.patch
new file mode 100644
index 0000000..d8f6fa0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0019-firewire-ohci-add-reset-packet-quirk-for-SB-Audigy.patch
@@ -0,0 +1,43 @@
+From 49b7e22b82d73e58a5335820b3f0441b2606515b Mon Sep 17 00:00:00 2001
+From: Clemens Ladisch <clemens@ladisch.de>
+Date: Thu, 26 Jan 2012 22:05:58 +0100
+Subject: [PATCH 19/87] firewire: ohci: add reset packet quirk for SB Audigy
+
+commit d1bb399ad03c11e792f6dea198d3b1e23061f094 upstream.
+
+The Audigy's SB1394 controller is actually from Texas Instruments
+and has the same bus reset packet generation bug, so it needs the
+same quirk entry.
+
+Signed-off-by: Clemens Ladisch <clemens@ladisch.de>
+Signed-off-by: Stefan Richter <stefanr@s5r6.in-berlin.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/firewire/ohci.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
+index 6628fea..21250ec 100644
+--- a/drivers/firewire/ohci.c
++++ b/drivers/firewire/ohci.c
+@@ -263,6 +263,7 @@ static inline struct fw_ohci *fw_ohci(struct fw_card *card)
+ static char ohci_driver_name[] = KBUILD_MODNAME;
+ 
+ #define PCI_DEVICE_ID_AGERE_FW643	0x5901
++#define PCI_DEVICE_ID_CREATIVE_SB1394	0x4001
+ #define PCI_DEVICE_ID_JMICRON_JMB38X_FW	0x2380
+ #define PCI_DEVICE_ID_TI_TSB12LV22	0x8009
+ #define PCI_DEVICE_ID_TI_TSB12LV26	0x8020
+@@ -289,6 +290,9 @@ static const struct {
+ 	{PCI_VENDOR_ID_ATT, PCI_DEVICE_ID_AGERE_FW643, 6,
+ 		QUIRK_NO_MSI},
+ 
++	{PCI_VENDOR_ID_CREATIVE, PCI_DEVICE_ID_CREATIVE_SB1394, PCI_ANY_ID,
++		QUIRK_RESET_PACKET},
++
+ 	{PCI_VENDOR_ID_JMICRON, PCI_DEVICE_ID_JMICRON_JMB38X_FW, PCI_ANY_ID,
+ 		QUIRK_NO_MSI},
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0020-firewire-ohci-disable-MSI-on-Ricoh-controllers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0020-firewire-ohci-disable-MSI-on-Ricoh-controllers.patch
new file mode 100644
index 0000000..e758deb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0020-firewire-ohci-disable-MSI-on-Ricoh-controllers.patch
@@ -0,0 +1,43 @@
+From c1a1e15fd6fe7ed496d115ac9b87649e4d827d65 Mon Sep 17 00:00:00 2001
+From: Stefan Richter <stefanr@s5r6.in-berlin.de>
+Date: Sun, 29 Jan 2012 12:41:15 +0100
+Subject: [PATCH 20/87] firewire: ohci: disable MSI on Ricoh controllers
+
+commit 320cfa6ce0b3dc794fedfa4bae54c0f65077234d upstream.
+
+The PCIe device
+
+    FireWire (IEEE 1394) [0c00]: Ricoh Co Ltd FireWire Host Controller
+    [1180:e832] (prog-if 10 [OHCI])
+
+is unable to access attached FireWire devices when MSI is enabled but
+works if MSI is disabled.
+http://www.mail-archive.com/alsa-user@lists.sourceforge.net/msg28251.html
+
+Hence add the "disable MSI" quirks flag for this device, or in fact for
+safety and simplicity for all current (R5U230, R5U231, R5U240) and
+future Ricoh PCIe 1394 controllers.
+
+Reported-by: Stefan Thomas <kontrapunktstefan@googlemail.com>
+Signed-off-by: Stefan Richter <stefanr@s5r6.in-berlin.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/firewire/ohci.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/firewire/ohci.c b/drivers/firewire/ohci.c
+index 21250ec..7f5f0da 100644
+--- a/drivers/firewire/ohci.c
++++ b/drivers/firewire/ohci.c
+@@ -303,7 +303,7 @@ static const struct {
+ 		QUIRK_NO_MSI},
+ 
+ 	{PCI_VENDOR_ID_RICOH, PCI_ANY_ID, PCI_ANY_ID,
+-		QUIRK_CYCLE_TIMER},
++		QUIRK_CYCLE_TIMER | QUIRK_NO_MSI},
+ 
+ 	{PCI_VENDOR_ID_TI, PCI_DEVICE_ID_TI_TSB12LV22, PCI_ANY_ID,
+ 		QUIRK_CYCLE_TIMER | QUIRK_RESET_PACKET | QUIRK_NO_1394A},
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0021-IB-mlx4-pass-SMP-vendor-specific-attribute-MADs-to-f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0021-IB-mlx4-pass-SMP-vendor-specific-attribute-MADs-to-f.patch
new file mode 100644
index 0000000..0307b83
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0021-IB-mlx4-pass-SMP-vendor-specific-attribute-MADs-to-f.patch
@@ -0,0 +1,90 @@
+From a48d135810111baaedd01dfb833c06b094aa3a68 Mon Sep 17 00:00:00 2001
+From: Jack Morgenstein <jackm@mellanox.com>
+Date: Thu, 26 Jan 2012 16:41:33 +0200
+Subject: [PATCH 21/87] IB/mlx4: pass SMP vendor-specific attribute MADs to
+ firmware
+
+commit a6f7feae6d19e84253918d88b04153af09d3a243 upstream.
+
+In the current code, vendor-specific MADs (e.g with the FDR-10
+attribute) are silently dropped by the driver, resulting in timeouts
+at the sending side and inability to query/configure the relevant
+feature.  However, the ConnectX firmware is able to handle such MADs.
+For unsupported attributes, the firmware returns a GET_RESPONSE MAD
+containing an error status.
+
+For example, for a FDR-10 node with LID 11:
+
+    # ibstat mlx4_0 1
+
+    CA: 'mlx4_0'
+    Port 1:
+    State: Active
+    Physical state: LinkUp
+    Rate: 40 (FDR10)
+    Base lid: 11
+    LMC: 0
+    SM lid: 24
+    Capability mask: 0x02514868
+    Port GUID: 0x0002c903002e65d1
+    Link layer: InfiniBand
+
+Extended Port Query (EPI) vendor mad timeouts before the patch:
+
+    # smpquery MEPI 11 -d
+
+    ibwarn: [4196] smp_query_via: attr 0xff90 mod 0x0 route Lid 11
+    ibwarn: [4196] _do_madrpc: retry 1 (timeout 1000 ms)
+    ibwarn: [4196] _do_madrpc: retry 2 (timeout 1000 ms)
+    ibwarn: [4196] _do_madrpc: timeout after 3 retries, 3000 ms
+    ibwarn: [4196] mad_rpc: _do_madrpc failed; dport (Lid 11)
+    smpquery: iberror: [pid 4196] main: failed: operation EPI: ext port info query failed
+
+EPI query works OK with the patch:
+
+    # smpquery MEPI 11 -d
+
+    ibwarn: [6548] smp_query_via: attr 0xff90 mod 0x0 route Lid 11
+    ibwarn: [6548] mad_rpc: data offs 64 sz 64
+    mad data
+    0000 0000 0000 0001 0000 0001 0000 0001
+    0000 0000 0000 0000 0000 0000 0000 0000
+    0000 0000 0000 0000 0000 0000 0000 0000
+    0000 0000 0000 0000 0000 0000 0000 0000
+    # Ext Port info: Lid 11 port 0
+    StateChangeEnable:...............0x00
+    LinkSpeedSupported:..............0x01
+    LinkSpeedEnabled:................0x01
+    LinkSpeedActive:.................0x01
+
+Signed-off-by: Jack Morgenstein <jackm@mellanox.com>
+Signed-off-by: Or Gerlitz <ogerlitz@mellanox.com>
+Acked-by: Ira Weiny <weiny2@llnl.gov>
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/infiniband/hw/mlx4/mad.c |    7 ++-----
+ 1 files changed, 2 insertions(+), 5 deletions(-)
+
+diff --git a/drivers/infiniband/hw/mlx4/mad.c b/drivers/infiniband/hw/mlx4/mad.c
+index f36da99..77702c0 100644
+--- a/drivers/infiniband/hw/mlx4/mad.c
++++ b/drivers/infiniband/hw/mlx4/mad.c
+@@ -256,12 +256,9 @@ static int ib_process_mad(struct ib_device *ibdev, int mad_flags, u8 port_num,
+ 			return IB_MAD_RESULT_SUCCESS;
+ 
+ 		/*
+-		 * Don't process SMInfo queries or vendor-specific
+-		 * MADs -- the SMA can't handle them.
++		 * Don't process SMInfo queries -- the SMA can't handle them.
+ 		 */
+-		if (in_mad->mad_hdr.attr_id == IB_SMP_ATTR_SM_INFO ||
+-		    ((in_mad->mad_hdr.attr_id & IB_SMP_ATTR_VENDOR_MASK) ==
+-		     IB_SMP_ATTR_VENDOR_MASK))
++		if (in_mad->mad_hdr.attr_id == IB_SMP_ATTR_SM_INFO)
+ 			return IB_MAD_RESULT_SUCCESS;
+ 	} else if (in_mad->mad_hdr.mgmt_class == IB_MGMT_CLASS_PERF_MGMT ||
+ 		   in_mad->mad_hdr.mgmt_class == MLX4_IB_VENDOR_CLASS1   ||
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0022-RDMA-core-Fix-kernel-panic-by-always-initializing-qp.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0022-RDMA-core-Fix-kernel-panic-by-always-initializing-qp.patch
new file mode 100644
index 0000000..853d5b9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0022-RDMA-core-Fix-kernel-panic-by-always-initializing-qp.patch
@@ -0,0 +1,68 @@
+From 3ef7302303a7886fd1e6dea9dd33fe2c41784199 Mon Sep 17 00:00:00 2001
+From: Bernd Schubert <bernd.schubert@itwm.fraunhofer.de>
+Date: Fri, 20 Jan 2012 18:43:54 +0000
+Subject: [PATCH 22/87] RDMA/core: Fix kernel panic by always initializing
+ qp->usecnt
+
+commit e47e321a35c741ee41b67976f8c6a3a7a42bc5c0 upstream.
+
+We have just been investigating kernel panics related to
+cq->ibcq.event_handler() completion calls.  The problem is that
+ib_destroy_qp() fails with -EBUSY.
+
+Further investigation revealed qp->usecnt is not initialized.  This
+counter was introduced in linux-3.2 by commit 0e0ec7e0638e
+("RDMA/core: Export ib_open_qp() to share XRC TGT QPs") but it only
+gets initialized for IB_QPT_XRC_TGT, but it is checked in
+ib_destroy_qp() for any QP type.
+
+Fix this by initializing qp->usecnt for every QP we create.
+
+Signed-off-by: Bernd Schubert <bernd.schubert@itwm.fraunhofer.de>
+Signed-off-by: Sven Breuner <sven.breuner@itwm.fraunhofer.de>
+
+[ Initialize qp->usecnt in uverbs too.  - Sean ]
+
+Signed-off-by: Sean Hefty <sean.hefty@intel.com>
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/infiniband/core/uverbs_cmd.c |    1 +
+ drivers/infiniband/core/verbs.c      |    2 +-
+ 2 files changed, 2 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/infiniband/core/uverbs_cmd.c b/drivers/infiniband/core/uverbs_cmd.c
+index e3db8ef..a8445b8 100644
+--- a/drivers/infiniband/core/uverbs_cmd.c
++++ b/drivers/infiniband/core/uverbs_cmd.c
+@@ -1485,6 +1485,7 @@ ssize_t ib_uverbs_create_qp(struct ib_uverbs_file *file,
+ 		qp->event_handler = attr.event_handler;
+ 		qp->qp_context	  = attr.qp_context;
+ 		qp->qp_type	  = attr.qp_type;
++		atomic_set(&qp->usecnt, 0);
+ 		atomic_inc(&pd->usecnt);
+ 		atomic_inc(&attr.send_cq->usecnt);
+ 		if (attr.recv_cq)
+diff --git a/drivers/infiniband/core/verbs.c b/drivers/infiniband/core/verbs.c
+index 602b1bd..575b780 100644
+--- a/drivers/infiniband/core/verbs.c
++++ b/drivers/infiniband/core/verbs.c
+@@ -421,6 +421,7 @@ struct ib_qp *ib_create_qp(struct ib_pd *pd,
+ 		qp->uobject    = NULL;
+ 		qp->qp_type    = qp_init_attr->qp_type;
+ 
++		atomic_set(&qp->usecnt, 0);
+ 		if (qp_init_attr->qp_type == IB_QPT_XRC_TGT) {
+ 			qp->event_handler = __ib_shared_qp_event_handler;
+ 			qp->qp_context = qp;
+@@ -430,7 +431,6 @@ struct ib_qp *ib_create_qp(struct ib_pd *pd,
+ 			qp->xrcd = qp_init_attr->xrcd;
+ 			atomic_inc(&qp_init_attr->xrcd->usecnt);
+ 			INIT_LIST_HEAD(&qp->open_list);
+-			atomic_set(&qp->usecnt, 0);
+ 
+ 			real_qp = qp;
+ 			qp = __ib_open_qp(real_qp, qp_init_attr->event_handler,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0023-kprobes-fix-a-memory-leak-in-function-pre_handler_kr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0023-kprobes-fix-a-memory-leak-in-function-pre_handler_kr.patch
new file mode 100644
index 0000000..29e9a91
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0023-kprobes-fix-a-memory-leak-in-function-pre_handler_kr.patch
@@ -0,0 +1,52 @@
+From ff016619c98fa2edcb44b6cffe5a60435328348a Mon Sep 17 00:00:00 2001
+From: Jiang Liu <liuj97@gmail.com>
+Date: Fri, 3 Feb 2012 15:37:16 -0800
+Subject: [PATCH 23/87] kprobes: fix a memory leak in function
+ pre_handler_kretprobe()
+
+commit 55ca6140e9bb307efc97a9301a4f501de02a6fd6 upstream.
+
+In function pre_handler_kretprobe(), the allocated kretprobe_instance
+object will get leaked if the entry_handler callback returns non-zero.
+This may cause all the preallocated kretprobe_instance objects exhausted.
+
+This issue can be reproduced by changing
+samples/kprobes/kretprobe_example.c to probe "mutex_unlock".  And the fix
+is straightforward: just put the allocated kretprobe_instance object back
+onto the free_instances list.
+
+[akpm@linux-foundation.org: use raw_spin_lock/unlock]
+Signed-off-by: Jiang Liu <jiang.liu@huawei.com>
+Acked-by: Jim Keniston <jkenisto@us.ibm.com>
+Acked-by: Ananth N Mavinakayanahalli <ananth@in.ibm.com>
+Cc: Masami Hiramatsu <masami.hiramatsu.pt@hitachi.com>
+Cc: Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>
+Cc: "David S. Miller" <davem@davemloft.net>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/kprobes.c |    6 +++++-
+ 1 files changed, 5 insertions(+), 1 deletions(-)
+
+diff --git a/kernel/kprobes.c b/kernel/kprobes.c
+index 52fd049..faa39d1 100644
+--- a/kernel/kprobes.c
++++ b/kernel/kprobes.c
+@@ -1673,8 +1673,12 @@ static int __kprobes pre_handler_kretprobe(struct kprobe *p,
+ 		ri->rp = rp;
+ 		ri->task = current;
+ 
+-		if (rp->entry_handler && rp->entry_handler(ri, regs))
++		if (rp->entry_handler && rp->entry_handler(ri, regs)) {
++			raw_spin_lock_irqsave(&rp->lock, flags);
++			hlist_add_head(&ri->hlist, &rp->free_instances);
++			raw_spin_unlock_irqrestore(&rp->lock, flags);
+ 			return 0;
++		}
+ 
+ 		arch_prepare_kretprobe(ri, regs);
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0024-mtd-gpmi-nand-bugfix-reset-the-BCH-module-when-it-is.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0024-mtd-gpmi-nand-bugfix-reset-the-BCH-module-when-it-is.patch
new file mode 100644
index 0000000..92647a5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0024-mtd-gpmi-nand-bugfix-reset-the-BCH-module-when-it-is.patch
@@ -0,0 +1,72 @@
+From 5e71844e1d3a9ae8681fc18781a3579eed4b2406 Mon Sep 17 00:00:00 2001
+From: Huang Shijie <b32955@freescale.com>
+Date: Wed, 4 Jan 2012 11:18:46 +0800
+Subject: [PATCH 24/87] mtd: gpmi-nand bugfix: reset the BCH module when it is
+ not MX23
+
+commit 9398d1ce09b9009996f7d2468e1d3c785fa6feda upstream.
+
+In MX28, if we do not reset the BCH module. The BCH module may
+becomes unstable when the board reboots for several thousands times.
+This bug has been catched in customer's production.
+
+The patch adds some comments (some from Wolfram Sang), and fixes it now.
+
+Also change gpmi_reset_block() to static.
+
+Signed-off-by: Huang Shijie <b32955@freescale.com>
+Acked-by: Marek Vasut <marek.vasut@gmail.com>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/nand/gpmi-nand/gpmi-lib.c |   18 ++++++++++++++----
+ 1 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+index de4db76..bb2fe60 100644
+--- a/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
++++ b/drivers/mtd/nand/gpmi-nand/gpmi-lib.c
+@@ -69,17 +69,19 @@ static int clear_poll_bit(void __iomem *addr, u32 mask)
+  *  [1] enable the module.
+  *  [2] reset the module.
+  *
+- * In most of the cases, it's ok. But there is a hardware bug in the BCH block.
++ * In most of the cases, it's ok.
++ * But in MX23, there is a hardware bug in the BCH block (see erratum #2847).
+  * If you try to soft reset the BCH block, it becomes unusable until
+  * the next hard reset. This case occurs in the NAND boot mode. When the board
+  * boots by NAND, the ROM of the chip will initialize the BCH blocks itself.
+  * So If the driver tries to reset the BCH again, the BCH will not work anymore.
+- * You will see a DMA timeout in this case.
++ * You will see a DMA timeout in this case. The bug has been fixed
++ * in the following chips, such as MX28.
+  *
+  * To avoid this bug, just add a new parameter `just_enable` for
+  * the mxs_reset_block(), and rewrite it here.
+  */
+-int gpmi_reset_block(void __iomem *reset_addr, bool just_enable)
++static int gpmi_reset_block(void __iomem *reset_addr, bool just_enable)
+ {
+ 	int ret;
+ 	int timeout = 0x400;
+@@ -206,7 +208,15 @@ int bch_set_geometry(struct gpmi_nand_data *this)
+ 	if (ret)
+ 		goto err_out;
+ 
+-	ret = gpmi_reset_block(r->bch_regs, true);
++	/*
++	* Due to erratum #2847 of the MX23, the BCH cannot be soft reset on this
++	* chip, otherwise it will lock up. So we skip resetting BCH on the MX23.
++	* On the other hand, the MX28 needs the reset, because one case has been
++	* seen where the BCH produced ECC errors constantly after 10000
++	* consecutive reboots. The latter case has not been seen on the MX23 yet,
++	* still we don't know if it could happen there as well.
++	*/
++	ret = gpmi_reset_block(r->bch_regs, GPMI_IS_MX23(this));
+ 	if (ret)
+ 		goto err_out;
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0025-Revert-mtd-atmel_nand-optimize-read-write-buffer-fun.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0025-Revert-mtd-atmel_nand-optimize-read-write-buffer-fun.patch
new file mode 100644
index 0000000..53c40b7
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0025-Revert-mtd-atmel_nand-optimize-read-write-buffer-fun.patch
@@ -0,0 +1,113 @@
+From 061d6b14b3b59f140371baa0f98963f761a7080f Mon Sep 17 00:00:00 2001
+From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Date: Thu, 2 Feb 2012 13:54:25 +0200
+Subject: [PATCH 25/87] Revert "mtd: atmel_nand: optimize read/write buffer
+ functions"
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 500823195d0c9eec2a4637484f30cc93ec633d4a upstream.
+
+This reverts commit fb5427508abbd635e877fabdf55795488119c2d6.
+
+The reason is that it breaks 16 bits NAND flash as it was reported by
+Nikolaus Voss and confirmed by Eric Bénard.
+
+Nicolas Ferre <nicolas.ferre@atmel.com> alco confirmed:
+"After double checking with designers, I must admit that I misunderstood
+the way of optimizing accesses to SMC. 16 bit nand is not so common
+those days..."
+
+Reported-by: Nikolaus Voss <n.voss@weinmann.de>
+Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
+Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/mtd/nand/atmel_nand.c |   45 +++++++++++++++++++++++++++++++++++++---
+ 1 files changed, 41 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
+index 23e5d77..ee6e26e 100644
+--- a/drivers/mtd/nand/atmel_nand.c
++++ b/drivers/mtd/nand/atmel_nand.c
+@@ -161,6 +161,37 @@ static int atmel_nand_device_ready(struct mtd_info *mtd)
+                 !!host->board->rdy_pin_active_low;
+ }
+ 
++/*
++ * Minimal-overhead PIO for data access.
++ */
++static void atmel_read_buf8(struct mtd_info *mtd, u8 *buf, int len)
++{
++	struct nand_chip	*nand_chip = mtd->priv;
++
++	__raw_readsb(nand_chip->IO_ADDR_R, buf, len);
++}
++
++static void atmel_read_buf16(struct mtd_info *mtd, u8 *buf, int len)
++{
++	struct nand_chip	*nand_chip = mtd->priv;
++
++	__raw_readsw(nand_chip->IO_ADDR_R, buf, len / 2);
++}
++
++static void atmel_write_buf8(struct mtd_info *mtd, const u8 *buf, int len)
++{
++	struct nand_chip	*nand_chip = mtd->priv;
++
++	__raw_writesb(nand_chip->IO_ADDR_W, buf, len);
++}
++
++static void atmel_write_buf16(struct mtd_info *mtd, const u8 *buf, int len)
++{
++	struct nand_chip	*nand_chip = mtd->priv;
++
++	__raw_writesw(nand_chip->IO_ADDR_W, buf, len / 2);
++}
++
+ static void dma_complete_func(void *completion)
+ {
+ 	complete(completion);
+@@ -235,27 +266,33 @@ err_buf:
+ static void atmel_read_buf(struct mtd_info *mtd, u8 *buf, int len)
+ {
+ 	struct nand_chip *chip = mtd->priv;
++	struct atmel_nand_host *host = chip->priv;
+ 
+ 	if (use_dma && len > mtd->oobsize)
+ 		/* only use DMA for bigger than oob size: better performances */
+ 		if (atmel_nand_dma_op(mtd, buf, len, 1) == 0)
+ 			return;
+ 
+-	/* if no DMA operation possible, use PIO */
+-	memcpy_fromio(buf, chip->IO_ADDR_R, len);
++	if (host->board->bus_width_16)
++		atmel_read_buf16(mtd, buf, len);
++	else
++		atmel_read_buf8(mtd, buf, len);
+ }
+ 
+ static void atmel_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
+ {
+ 	struct nand_chip *chip = mtd->priv;
++	struct atmel_nand_host *host = chip->priv;
+ 
+ 	if (use_dma && len > mtd->oobsize)
+ 		/* only use DMA for bigger than oob size: better performances */
+ 		if (atmel_nand_dma_op(mtd, (void *)buf, len, 0) == 0)
+ 			return;
+ 
+-	/* if no DMA operation possible, use PIO */
+-	memcpy_toio(chip->IO_ADDR_W, buf, len);
++	if (host->board->bus_width_16)
++		atmel_write_buf16(mtd, buf, len);
++	else
++		atmel_write_buf8(mtd, buf, len);
+ }
+ 
+ /*
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0026-at_hdmac-bugfix-for-enabling-channel-irq.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0026-at_hdmac-bugfix-for-enabling-channel-irq.patch
new file mode 100644
index 0000000..e96a322
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0026-at_hdmac-bugfix-for-enabling-channel-irq.patch
@@ -0,0 +1,92 @@
+From 2139363dee1243badcac4da0af194ed764339c05 Mon Sep 17 00:00:00 2001
+From: Nikolaus Voss <n.voss@weinmann.de>
+Date: Tue, 17 Jan 2012 10:28:33 +0100
+Subject: [PATCH 26/87] at_hdmac: bugfix for enabling channel irq
+
+commit bda3a47c886664e86ee14eb79e9072b9e341f575 upstream.
+
+commit 463894705e4089d0ff69e7d877312d496ac70e5b deleted redundant
+chan_id and chancnt initialization in dma drivers as this is done
+in dma_async_device_register().
+
+However, atc_enable_irq() relied on chan_id set before registering
+the device, what left only channel 0 functional for this driver.
+
+This patch introduces atc_enable/disable_chan_irq() as a variant
+of atc_enable/disable_irq() with the channel as explicit argument.
+
+Signed-off-by: Nikolaus Voss <n.voss@weinmann.de>
+Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Signed-off-by: Vinod Koul <vinod.koul@linux.intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/dma/at_hdmac.c      |    4 ++--
+ drivers/dma/at_hdmac_regs.h |   17 ++++++++---------
+ 2 files changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
+index fcfa0a8..a60adbf 100644
+--- a/drivers/dma/at_hdmac.c
++++ b/drivers/dma/at_hdmac.c
+@@ -1286,7 +1286,7 @@ static int __init at_dma_probe(struct platform_device *pdev)
+ 
+ 		tasklet_init(&atchan->tasklet, atc_tasklet,
+ 				(unsigned long)atchan);
+-		atc_enable_irq(atchan);
++		atc_enable_chan_irq(atdma, i);
+ 	}
+ 
+ 	/* set base routines */
+@@ -1353,7 +1353,7 @@ static int __exit at_dma_remove(struct platform_device *pdev)
+ 		struct at_dma_chan	*atchan = to_at_dma_chan(chan);
+ 
+ 		/* Disable interrupts */
+-		atc_disable_irq(atchan);
++		atc_disable_chan_irq(atdma, chan->chan_id);
+ 		tasklet_disable(&atchan->tasklet);
+ 
+ 		tasklet_kill(&atchan->tasklet);
+diff --git a/drivers/dma/at_hdmac_regs.h b/drivers/dma/at_hdmac_regs.h
+index aa4c9ae..5aa82b4 100644
+--- a/drivers/dma/at_hdmac_regs.h
++++ b/drivers/dma/at_hdmac_regs.h
+@@ -326,28 +326,27 @@ static void atc_dump_lli(struct at_dma_chan *atchan, struct at_lli *lli)
+ }
+ 
+ 
+-static void atc_setup_irq(struct at_dma_chan *atchan, int on)
++static void atc_setup_irq(struct at_dma *atdma, int chan_id, int on)
+ {
+-	struct at_dma	*atdma = to_at_dma(atchan->chan_common.device);
+-	u32		ebci;
++	u32 ebci;
+ 
+ 	/* enable interrupts on buffer transfer completion & error */
+-	ebci =    AT_DMA_BTC(atchan->chan_common.chan_id)
+-		| AT_DMA_ERR(atchan->chan_common.chan_id);
++	ebci =    AT_DMA_BTC(chan_id)
++		| AT_DMA_ERR(chan_id);
+ 	if (on)
+ 		dma_writel(atdma, EBCIER, ebci);
+ 	else
+ 		dma_writel(atdma, EBCIDR, ebci);
+ }
+ 
+-static inline void atc_enable_irq(struct at_dma_chan *atchan)
++static void atc_enable_chan_irq(struct at_dma *atdma, int chan_id)
+ {
+-	atc_setup_irq(atchan, 1);
++	atc_setup_irq(atdma, chan_id, 1);
+ }
+ 
+-static inline void atc_disable_irq(struct at_dma_chan *atchan)
++static void atc_disable_chan_irq(struct at_dma *atdma, int chan_id)
+ {
+-	atc_setup_irq(atchan, 0);
++	atc_setup_irq(atdma, chan_id, 0);
+ }
+ 
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0027-mm-filemap_xip.c-fix-race-condition-in-xip_file_faul.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0027-mm-filemap_xip.c-fix-race-condition-in-xip_file_faul.patch
new file mode 100644
index 0000000..7c3c8a6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0027-mm-filemap_xip.c-fix-race-condition-in-xip_file_faul.patch
@@ -0,0 +1,58 @@
+From e7908f7b777ac850ef6a11cb53aa8e27fcf40a1e Mon Sep 17 00:00:00 2001
+From: Carsten Otte <carsteno@de.ibm.com>
+Date: Fri, 3 Feb 2012 15:37:14 -0800
+Subject: [PATCH 27/87] mm/filemap_xip.c: fix race condition in
+ xip_file_fault()
+
+commit 99f02ef1f18631eb0a4e0ea0a3d56878dbcb4b90 upstream.
+
+Fix a race condition that shows in conjunction with xip_file_fault() when
+two threads of the same user process fault on the same memory page.
+
+In this case, the race winner will install the page table entry and the
+unlucky loser will cause an oops: xip_file_fault calls vm_insert_pfn (via
+vm_insert_mixed) which drops out at this check:
+
+	retval = -EBUSY;
+	if (!pte_none(*pte))
+		goto out_unlock;
+
+The resulting -EBUSY return value will trigger a BUG_ON() in
+xip_file_fault.
+
+This fix simply considers the fault as fixed in this case, because the
+race winner has successfully installed the pte.
+
+[akpm@linux-foundation.org: use conventional (and consistent) comment layout]
+Reported-by: David Sadler <dsadler@us.ibm.com>
+Signed-off-by: Carsten Otte <cotte@de.ibm.com>
+Reported-by: Louis Alex Eisner <leisner@cs.ucsd.edu>
+Cc: Hugh Dickins <hughd@google.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/filemap_xip.c |    7 ++++++-
+ 1 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/mm/filemap_xip.c b/mm/filemap_xip.c
+index f91b2f6..a4eb311 100644
+--- a/mm/filemap_xip.c
++++ b/mm/filemap_xip.c
+@@ -263,7 +263,12 @@ found:
+ 							xip_pfn);
+ 		if (err == -ENOMEM)
+ 			return VM_FAULT_OOM;
+-		BUG_ON(err);
++		/*
++		 * err == -EBUSY is fine, we've raced against another thread
++		 * that faulted-in the same page
++		 */
++		if (err != -EBUSY)
++			BUG_ON(err);
+ 		return VM_FAULT_NOPAGE;
+ 	} else {
+ 		int err, ret = VM_FAULT_OOM;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0028-mm-compaction-check-pfn_valid-when-entering-a-new-MA.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0028-mm-compaction-check-pfn_valid-when-entering-a-new-MA.patch
new file mode 100644
index 0000000..8862a78
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0028-mm-compaction-check-pfn_valid-when-entering-a-new-MA.patch
@@ -0,0 +1,112 @@
+From 9da11afefb6f8ccc0f7731831f7ad73106fc87f3 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Fri, 3 Feb 2012 15:37:18 -0800
+Subject: [PATCH 28/87] mm: compaction: check pfn_valid when entering a new
+ MAX_ORDER_NR_PAGES block during isolation for
+ migration
+
+commit 0bf380bc70ecba68cb4d74dc656cc2fa8c4d801a upstream.
+
+When isolating for migration, migration starts at the start of a zone
+which is not necessarily pageblock aligned.  Further, it stops isolating
+when COMPACT_CLUSTER_MAX pages are isolated so migrate_pfn is generally
+not aligned.  This allows isolate_migratepages() to call pfn_to_page() on
+an invalid PFN which can result in a crash.  This was originally reported
+against a 3.0-based kernel with the following trace in a crash dump.
+
+PID: 9902   TASK: d47aecd0  CPU: 0   COMMAND: "memcg_process_s"
+ #0 [d72d3ad0] crash_kexec at c028cfdb
+ #1 [d72d3b24] oops_end at c05c5322
+ #2 [d72d3b38] __bad_area_nosemaphore at c0227e60
+ #3 [d72d3bec] bad_area at c0227fb6
+ #4 [d72d3c00] do_page_fault at c05c72ec
+ #5 [d72d3c80] error_code (via page_fault) at c05c47a4
+    EAX: 00000000  EBX: 000c0000  ECX: 00000001  EDX: 00000807  EBP: 000c0000
+    DS:  007b      ESI: 00000001  ES:  007b      EDI: f3000a80  GS:  6f50
+    CS:  0060      EIP: c030b15a  ERR: ffffffff  EFLAGS: 00010002
+ #6 [d72d3cb4] isolate_migratepages at c030b15a
+ #7 [d72d3d14] zone_watermark_ok at c02d26cb
+ #8 [d72d3d2c] compact_zone at c030b8de
+ #9 [d72d3d68] compact_zone_order at c030bba1
+#10 [d72d3db4] try_to_compact_pages at c030bc84
+#11 [d72d3ddc] __alloc_pages_direct_compact at c02d61e7
+#12 [d72d3e08] __alloc_pages_slowpath at c02d66c7
+#13 [d72d3e78] __alloc_pages_nodemask at c02d6a97
+#14 [d72d3eb8] alloc_pages_vma at c030a845
+#15 [d72d3ed4] do_huge_pmd_anonymous_page at c03178eb
+#16 [d72d3f00] handle_mm_fault at c02f36c6
+#17 [d72d3f30] do_page_fault at c05c70ed
+#18 [d72d3fb0] error_code (via page_fault) at c05c47a4
+    EAX: b71ff000  EBX: 00000001  ECX: 00001600  EDX: 00000431
+    DS:  007b      ESI: 08048950  ES:  007b      EDI: bfaa3788
+    SS:  007b      ESP: bfaa36e0  EBP: bfaa3828  GS:  6f50
+    CS:  0073      EIP: 080487c8  ERR: ffffffff  EFLAGS: 00010202
+
+It was also reported by Herbert van den Bergh against 3.1-based kernel
+with the following snippet from the console log.
+
+BUG: unable to handle kernel paging request at 01c00008
+IP: [<c0522399>] isolate_migratepages+0x119/0x390
+*pdpt = 000000002f7ce001 *pde = 0000000000000000
+
+It is expected that it also affects 3.2.x and current mainline.
+
+The problem is that pfn_valid is only called on the first PFN being
+checked and that PFN is not necessarily aligned.  Lets say we have a case
+like this
+
+H = MAX_ORDER_NR_PAGES boundary
+| = pageblock boundary
+m = cc->migrate_pfn
+f = cc->free_pfn
+o = memory hole
+
+H------|------H------|----m-Hoooooo|ooooooH-f----|------H
+
+The migrate_pfn is just below a memory hole and the free scanner is beyond
+the hole.  When isolate_migratepages started, it scans from migrate_pfn to
+migrate_pfn+pageblock_nr_pages which is now in a memory hole.  It checks
+pfn_valid() on the first PFN but then scans into the hole where there are
+not necessarily valid struct pages.
+
+This patch ensures that isolate_migratepages calls pfn_valid when
+necessary.
+
+Reported-by: Herbert van den Bergh <herbert.van.den.bergh@oracle.com>
+Tested-by: Herbert van den Bergh <herbert.van.den.bergh@oracle.com>
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Acked-by: Michal Nazarewicz <mina86@mina86.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/compaction.c |   13 +++++++++++++
+ 1 files changed, 13 insertions(+), 0 deletions(-)
+
+diff --git a/mm/compaction.c b/mm/compaction.c
+index 899d956..edc1e26 100644
+--- a/mm/compaction.c
++++ b/mm/compaction.c
+@@ -313,6 +313,19 @@ static isolate_migrate_t isolate_migratepages(struct zone *zone,
+ 		} else if (!locked)
+ 			spin_lock_irq(&zone->lru_lock);
+ 
++		/*
++		 * migrate_pfn does not necessarily start aligned to a
++		 * pageblock. Ensure that pfn_valid is called when moving
++		 * into a new MAX_ORDER_NR_PAGES range in case of large
++		 * memory holes within the zone
++		 */
++		if ((low_pfn & (MAX_ORDER_NR_PAGES - 1)) == 0) {
++			if (!pfn_valid(low_pfn)) {
++				low_pfn += MAX_ORDER_NR_PAGES - 1;
++				continue;
++			}
++		}
++
+ 		if (!pfn_valid_within(low_pfn))
+ 			continue;
+ 		nr_scanned++;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0029-PM-Hibernate-Fix-s2disk-regression-related-to-freezi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0029-PM-Hibernate-Fix-s2disk-regression-related-to-freezi.patch
new file mode 100644
index 0000000..524e6d1
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0029-PM-Hibernate-Fix-s2disk-regression-related-to-freezi.patch
@@ -0,0 +1,100 @@
+From d483054fe4c66eeb7a03fdc97519b07edb1dc803 Mon Sep 17 00:00:00 2001
+From: "Rafael J. Wysocki" <rjw@sisk.pl>
+Date: Sun, 29 Jan 2012 20:35:52 +0100
+Subject: [PATCH 29/87] PM / Hibernate: Fix s2disk regression related to
+ freezing workqueues
+
+commit 181e9bdef37bfcaa41f3ab6c948a2a0d60a268b5 upstream.
+
+Commit 2aede851ddf08666f68ffc17be446420e9d2a056
+
+  PM / Hibernate: Freeze kernel threads after preallocating memory
+
+introduced a mechanism by which kernel threads were frozen after
+the preallocation of hibernate image memory to avoid problems with
+frozen kernel threads not responding to memory freeing requests.
+However, it overlooked the s2disk code path in which the
+SNAPSHOT_CREATE_IMAGE ioctl was run directly after SNAPSHOT_FREE,
+which caused freeze_workqueues_begin() to BUG(), because it saw
+that worqueues had been already frozen.
+
+Although in principle this issue might be addressed by removing
+the relevant BUG_ON() from freeze_workqueues_begin(), that would
+reintroduce the very problem that commit 2aede851ddf08666f68ffc17be4
+attempted to avoid into that particular code path.  For this reason,
+to fix the issue at hand, introduce thaw_kernel_threads() and make
+the SNAPSHOT_FREE ioctl execute it.
+
+Special thanks to Srivatsa S. Bhat for detailed analysis of the
+problem.
+
+Reported-and-tested-by: Jiri Slaby <jslaby@suse.cz>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Acked-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/freezer.h |    2 ++
+ kernel/power/process.c  |    9 +++++++++
+ kernel/power/user.c     |    9 +++++++++
+ 3 files changed, 20 insertions(+), 0 deletions(-)
+
+diff --git a/include/linux/freezer.h b/include/linux/freezer.h
+index a5386e3..b5d6b6a 100644
+--- a/include/linux/freezer.h
++++ b/include/linux/freezer.h
+@@ -51,6 +51,7 @@ extern void refrigerator(void);
+ extern int freeze_processes(void);
+ extern int freeze_kernel_threads(void);
+ extern void thaw_processes(void);
++extern void thaw_kernel_threads(void);
+ 
+ static inline int try_to_freeze(void)
+ {
+@@ -185,6 +186,7 @@ static inline void refrigerator(void) {}
+ static inline int freeze_processes(void) { return -ENOSYS; }
+ static inline int freeze_kernel_threads(void) { return -ENOSYS; }
+ static inline void thaw_processes(void) {}
++static inline void thaw_kernel_threads(void) {}
+ 
+ static inline int try_to_freeze(void) { return 0; }
+ 
+diff --git a/kernel/power/process.c b/kernel/power/process.c
+index addbbe5..3d4b954 100644
+--- a/kernel/power/process.c
++++ b/kernel/power/process.c
+@@ -203,3 +203,12 @@ void thaw_processes(void)
+ 	printk("done.\n");
+ }
+ 
++void thaw_kernel_threads(void)
++{
++	printk("Restarting kernel threads ... ");
++	thaw_workqueues();
++	thaw_tasks(true);
++	schedule();
++	printk("done.\n");
++}
++
+diff --git a/kernel/power/user.c b/kernel/power/user.c
+index 6d8f535..3565b15 100644
+--- a/kernel/power/user.c
++++ b/kernel/power/user.c
+@@ -303,6 +303,15 @@ static long snapshot_ioctl(struct file *filp, unsigned int cmd,
+ 		swsusp_free();
+ 		memset(&data->handle, 0, sizeof(struct snapshot_handle));
+ 		data->ready = 0;
++		/*
++		 * It is necessary to thaw kernel threads here, because
++		 * SNAPSHOT_CREATE_IMAGE may be invoked directly after
++		 * SNAPSHOT_FREE.  In that case, if kernel threads were not
++		 * thawed, the preallocation of memory carried out by
++		 * hibernation_snapshot() might run into problems (i.e. it
++		 * might fail or even deadlock).
++		 */
++		thaw_kernel_threads();
+ 		break;
+ 
+ 	case SNAPSHOT_SET_IMAGE_SIZE:
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0030-PM-QoS-CPU-C-state-breakage-with-PM-Qos-change.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0030-PM-QoS-CPU-C-state-breakage-with-PM-Qos-change.patch
new file mode 100644
index 0000000..5e697d5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0030-PM-QoS-CPU-C-state-breakage-with-PM-Qos-change.patch
@@ -0,0 +1,57 @@
+From f51d67a64f32cd81ea8b67ca964fb7cf7e783b2e Mon Sep 17 00:00:00 2001
+From: Venkatesh Pallipadi <venki@google.com>
+Date: Fri, 3 Feb 2012 22:22:25 +0100
+Subject: [PATCH 30/87] PM / QoS: CPU C-state breakage with PM Qos change
+
+commit d020283dc694c9ec31b410f522252f7a8397e67d upstream.
+
+Looks like change "PM QoS: Move and rename the implementation files"
+merged during the 3.2 development cycle made PM QoS depend on
+CONFIG_PM which depends on (PM_SLEEP || PM_RUNTIME).
+
+That breaks CPU C-states with kernels not having these CONFIGs, causing CPUs
+to spend time in Polling loop idle instead of going into deep C-states,
+consuming way way more power. This is with either acpi idle or intel idle
+enabled.
+
+Either CONFIG_PM should be enabled with any pm_qos users or
+the !CONFIG_PM pm_qos_request() should return sane defaults not to break
+the existing users. Here's is the patch for the latter option.
+
+[rjw: Modified the changelog slightly.]
+
+Signed-off-by: Venkatesh Pallipadi <venki@google.com>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/pm_qos.h |   14 +++++++++++++-
+ 1 files changed, 13 insertions(+), 1 deletions(-)
+
+diff --git a/include/linux/pm_qos.h b/include/linux/pm_qos.h
+index 83b0ea3..8a0ede4 100644
+--- a/include/linux/pm_qos.h
++++ b/include/linux/pm_qos.h
+@@ -107,7 +107,19 @@ static inline void pm_qos_remove_request(struct pm_qos_request *req)
+ 			{ return; }
+ 
+ static inline int pm_qos_request(int pm_qos_class)
+-			{ return 0; }
++{
++	switch (pm_qos_class) {
++	case PM_QOS_CPU_DMA_LATENCY:
++		return PM_QOS_CPU_DMA_LAT_DEFAULT_VALUE;
++	case PM_QOS_NETWORK_LATENCY:
++		return PM_QOS_NETWORK_LAT_DEFAULT_VALUE;
++	case PM_QOS_NETWORK_THROUGHPUT:
++		return PM_QOS_NETWORK_THROUGHPUT_DEFAULT_VALUE;
++	default:
++		return PM_QOS_DEFAULT_VALUE;
++	}
++}
++
+ static inline int pm_qos_add_notifier(int pm_qos_class,
+ 				      struct notifier_block *notifier)
+ 			{ return 0; }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0031-drm-radeon-Set-DESKTOP_HEIGHT-register-to-the-frameb.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0031-drm-radeon-Set-DESKTOP_HEIGHT-register-to-the-frameb.patch
new file mode 100644
index 0000000..610b959
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0031-drm-radeon-Set-DESKTOP_HEIGHT-register-to-the-frameb.patch
@@ -0,0 +1,55 @@
+From 97f2f58ea0382e2e2df0dacc5bba99190cd10846 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@amd.com>
+Date: Wed, 1 Feb 2012 12:09:55 +0100
+Subject: [PATCH 31/87] drm/radeon: Set DESKTOP_HEIGHT register to the
+ framebuffer (not mode) height.
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit 1b61925061660009f5b8047f93c5297e04541273 upstream.
+
+The value of this register is transferred to the V_COUNTER register at the
+beginning of vertical blank. V_COUNTER is the reference for VLINE waits and
+goes from VIEWPORT_Y_START to VIEWPORT_Y_START+VIEWPORT_HEIGHT during scanout,
+so if VIEWPORT_Y_START is not 0, V_COUNTER actually went backwards at the
+beginning of vertical blank, and VLINE waits excluding the whole scanout area
+could never finish (possibly only if VIEWPORT_Y_START is larger than the length
+of vertical blank in scanlines). Setting DESKTOP_HEIGHT to the framebuffer
+height should prevent this for any kind of VLINE wait.
+
+Fixes https://bugs.freedesktop.org/show_bug.cgi?id=45329 .
+
+Signed-off-by: Michel Dänzer <michel.daenzer@amd.com>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/atombios_crtc.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/atombios_crtc.c b/drivers/gpu/drm/radeon/atombios_crtc.c
+index 2b97262..b30081f 100644
+--- a/drivers/gpu/drm/radeon/atombios_crtc.c
++++ b/drivers/gpu/drm/radeon/atombios_crtc.c
+@@ -1189,7 +1189,7 @@ static int dce4_crtc_do_set_base(struct drm_crtc *crtc,
+ 	WREG32(EVERGREEN_GRPH_ENABLE + radeon_crtc->crtc_offset, 1);
+ 
+ 	WREG32(EVERGREEN_DESKTOP_HEIGHT + radeon_crtc->crtc_offset,
+-	       crtc->mode.vdisplay);
++	       target_fb->height);
+ 	x &= ~3;
+ 	y &= ~1;
+ 	WREG32(EVERGREEN_VIEWPORT_START + radeon_crtc->crtc_offset,
+@@ -1358,7 +1358,7 @@ static int avivo_crtc_do_set_base(struct drm_crtc *crtc,
+ 	WREG32(AVIVO_D1GRPH_ENABLE + radeon_crtc->crtc_offset, 1);
+ 
+ 	WREG32(AVIVO_D1MODE_DESKTOP_HEIGHT + radeon_crtc->crtc_offset,
+-	       crtc->mode.vdisplay);
++	       target_fb->height);
+ 	x &= ~3;
+ 	y &= ~1;
+ 	WREG32(AVIVO_D1MODE_VIEWPORT_START + radeon_crtc->crtc_offset,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0032-drm-nouveau-gem-fix-fence_sync-race-oops.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0032-drm-nouveau-gem-fix-fence_sync-race-oops.patch
new file mode 100644
index 0000000..05ad972
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0032-drm-nouveau-gem-fix-fence_sync-race-oops.patch
@@ -0,0 +1,108 @@
+From 3d15bd1a90e3d768136562ad63e0d25c953d0c85 Mon Sep 17 00:00:00 2001
+From: Ben Skeggs <bskeggs@redhat.com>
+Date: Tue, 10 Jan 2012 10:18:28 +1000
+Subject: [PATCH 32/87] drm/nouveau/gem: fix fence_sync race / oops
+
+commit 525895ba388c949aa906f26e3ec5cb1ab041f56b upstream.
+
+Due to a race it was possible for a fence to be destroyed while another
+thread was trying to synchronise with it.  If this happened in the fallback
+non-semaphore path, it lead to the following oops due to fence->channel
+being NULL.
+
+BUG: unable to handle kernel NULL pointer dereference at   (null)
+IP: [<fa9632ce>] nouveau_fence_update+0xe/0xe0 [nouveau]
+*pde = a649c067
+SMP
+Modules linked in: fuse nouveau(O) ttm(O) drm_kms_helper(O) drm(O) mxm_wmi video wmi netconsole configfs lockd bnep bluetooth rfkill ip6t_REJECT nf_conntrack_ipv6 nf_defrag_ipv6 nf_conntrack_ipv4 nf_defrag_ipv4 xt_state nf_conntrack ip6table_filter ip6_tables snd_hda_codec_realtek snd_hda_intel snd_hda_cobinfmt_misc uinput ata_generic pata_acpi pata_aet2c_algo_bit i2c_core [last unloaded: wmi]
+
+Pid: 2255, comm: gnome-shell Tainted: G           O 3.2.0-0.rc5.git0.1.fc17.i686 #1 System manufacturer System Product Name/M2A-VM
+EIP: 0060:[<fa9632ce>] EFLAGS: 00010296 CPU: 1
+EIP is at nouveau_fence_update+0xe/0xe0 [nouveau]
+EAX: 00000000 EBX: ddfc6dd0 ECX: dd111580 EDX: 00000000
+ESI: 00003e80 EDI: dd111580 EBP: dd121d00 ESP: dd121ce8
+ DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068
+Process gnome-shell (pid: 2255, ti=dd120000 task=dd111580 task.ti=dd120000)
+Stack:
+ 7dc86c76 00000000 00003e80 ddfc6dd0 00003e80 dd111580 dd121d0c fa96371f
+ 00000000 dd121d3c fa963773 dd111580 01000246 000ec53d 00000000 ddfc6dd0
+ 00001f40 00000000 ddfc6dd0 00000010 dc7df840 dd121d6c fa9639a0 00000000
+Call Trace:
+ [<fa96371f>] __nouveau_fence_signalled+0x1f/0x30 [nouveau]
+ [<fa963773>] __nouveau_fence_wait+0x43/0xd0 [nouveau]
+ [<fa9639a0>] nouveau_fence_sync+0x1a0/0x1c0 [nouveau]
+ [<fa964046>] validate_list+0x176/0x300 [nouveau]
+ [<f7d9c9c0>] ? ttm_bo_mem_put+0x30/0x30 [ttm]
+ [<fa964b8a>] nouveau_gem_ioctl_pushbuf+0x48a/0xfd0 [nouveau]
+ [<c0406481>] ? die+0x31/0x80
+ [<f7c93d98>] drm_ioctl+0x388/0x490 [drm]
+ [<c0406481>] ? die+0x31/0x80
+ [<fa964700>] ? nouveau_gem_ioctl_new+0x150/0x150 [nouveau]
+ [<c0635c7b>] ? file_has_perm+0xcb/0xe0
+ [<f7c93a10>] ? drm_copy_field+0x80/0x80 [drm]
+ [<c0564f56>] do_vfs_ioctl+0x86/0x5b0
+ [<c0406481>] ? die+0x31/0x80
+ [<c0635f22>] ? selinux_file_ioctl+0x62/0x130
+ [<c0554f30>] ? fget_light+0x30/0x340
+ [<c05654ef>] sys_ioctl+0x6f/0x80
+ [<c099e3a4>] syscall_call+0x7/0xb
+ [<c0406481>] ? die+0x31/0x80
+ [<c0406481>] ? die+0x31/0x80
+
+Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/nouveau/nouveau_gem.c |   23 +++++++++++++++++++++--
+ 1 files changed, 21 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
+index 5f0bc57..7ce3fde 100644
+--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
++++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
+@@ -380,6 +380,25 @@ retry:
+ }
+ 
+ static int
++validate_sync(struct nouveau_channel *chan, struct nouveau_bo *nvbo)
++{
++	struct nouveau_fence *fence = NULL;
++	int ret = 0;
++
++	spin_lock(&nvbo->bo.bdev->fence_lock);
++	if (nvbo->bo.sync_obj)
++		fence = nouveau_fence_ref(nvbo->bo.sync_obj);
++	spin_unlock(&nvbo->bo.bdev->fence_lock);
++
++	if (fence) {
++		ret = nouveau_fence_sync(fence, chan);
++		nouveau_fence_unref(&fence);
++	}
++
++	return ret;
++}
++
++static int
+ validate_list(struct nouveau_channel *chan, struct list_head *list,
+ 	      struct drm_nouveau_gem_pushbuf_bo *pbbo, uint64_t user_pbbo_ptr)
+ {
+@@ -393,7 +412,7 @@ validate_list(struct nouveau_channel *chan, struct list_head *list,
+ 	list_for_each_entry(nvbo, list, entry) {
+ 		struct drm_nouveau_gem_pushbuf_bo *b = &pbbo[nvbo->pbbo_index];
+ 
+-		ret = nouveau_fence_sync(nvbo->bo.sync_obj, chan);
++		ret = validate_sync(chan, nvbo);
+ 		if (unlikely(ret)) {
+ 			NV_ERROR(dev, "fail pre-validate sync\n");
+ 			return ret;
+@@ -416,7 +435,7 @@ validate_list(struct nouveau_channel *chan, struct list_head *list,
+ 			return ret;
+ 		}
+ 
+-		ret = nouveau_fence_sync(nvbo->bo.sync_obj, chan);
++		ret = validate_sync(chan, nvbo);
+ 		if (unlikely(ret)) {
+ 			NV_ERROR(dev, "fail post-validate sync\n");
+ 			return ret;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0033-drm-radeon-kms-disable-output-polling-when-suspended.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0033-drm-radeon-kms-disable-output-polling-when-suspended.patch
new file mode 100644
index 0000000..a90ce35
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0033-drm-radeon-kms-disable-output-polling-when-suspended.patch
@@ -0,0 +1,44 @@
+From d11fa680b5daad1ffb72807cfd0ad30237505fff Mon Sep 17 00:00:00 2001
+From: Seth Forshee <seth.forshee@canonical.com>
+Date: Tue, 31 Jan 2012 19:06:25 -0600
+Subject: [PATCH 33/87] drm/radeon/kms: disable output polling when suspended
+
+commit 86698c20f71d488b32c49ed4687fb3cf8a88a5ca upstream.
+
+Polling the outputs when the device is suspended can result in erroneous
+status updates. Disable output polling during suspend to prevent this
+from happening.
+
+Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
+Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/radeon_device.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/radeon/radeon_device.c
+index 9b39145..9231564 100644
+--- a/drivers/gpu/drm/radeon/radeon_device.c
++++ b/drivers/gpu/drm/radeon/radeon_device.c
+@@ -864,6 +864,8 @@ int radeon_suspend_kms(struct drm_device *dev, pm_message_t state)
+ 	if (dev->switch_power_state == DRM_SWITCH_POWER_OFF)
+ 		return 0;
+ 
++	drm_kms_helper_poll_disable(dev);
++
+ 	/* turn off display hw */
+ 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+ 		drm_helper_connector_dpms(connector, DRM_MODE_DPMS_OFF);
+@@ -950,6 +952,8 @@ int radeon_resume_kms(struct drm_device *dev)
+ 	list_for_each_entry(connector, &dev->mode_config.connector_list, head) {
+ 		drm_helper_connector_dpms(connector, DRM_MODE_DPMS_ON);
+ 	}
++
++	drm_kms_helper_poll_enable(dev);
+ 	return 0;
+ }
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0034-drm-radeon-kms-fix-TRAVIS-panel-setup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0034-drm-radeon-kms-fix-TRAVIS-panel-setup.patch
new file mode 100644
index 0000000..a7915d4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0034-drm-radeon-kms-fix-TRAVIS-panel-setup.patch
@@ -0,0 +1,53 @@
+From 307a5a187c97d1c280e66db8d957249439141850 Mon Sep 17 00:00:00 2001
+From: Alex Deucher <alexander.deucher@amd.com>
+Date: Thu, 2 Feb 2012 10:18:00 -0500
+Subject: [PATCH 34/87] drm/radeon/kms: fix TRAVIS panel setup
+
+commit 304a48400d9718f74ec35ae46f30868a5f4c4516 upstream.
+
+Different versions of the DP to LVDS bridge chip
+need different panel mode settings depending on
+the chip version used.
+
+Fixes:
+https://bugs.freedesktop.org/show_bug.cgi?id=41569
+
+Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
+Signed-off-by: Dave Airlie <airlied@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/radeon/atombios_dp.c |   18 +++++++++++++++---
+ 1 files changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/radeon/atombios_dp.c b/drivers/gpu/drm/radeon/atombios_dp.c
+index a71557c..552b436 100644
+--- a/drivers/gpu/drm/radeon/atombios_dp.c
++++ b/drivers/gpu/drm/radeon/atombios_dp.c
+@@ -564,9 +564,21 @@ int radeon_dp_get_panel_mode(struct drm_encoder *encoder,
+ 	    ENCODER_OBJECT_ID_NUTMEG)
+ 		panel_mode = DP_PANEL_MODE_INTERNAL_DP1_MODE;
+ 	else if (radeon_connector_encoder_get_dp_bridge_encoder_id(connector) ==
+-		 ENCODER_OBJECT_ID_TRAVIS)
+-		panel_mode = DP_PANEL_MODE_INTERNAL_DP2_MODE;
+-	else if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
++		 ENCODER_OBJECT_ID_TRAVIS) {
++		u8 id[6];
++		int i;
++		for (i = 0; i < 6; i++)
++			id[i] = radeon_read_dpcd_reg(radeon_connector, 0x503 + i);
++		if (id[0] == 0x73 &&
++		    id[1] == 0x69 &&
++		    id[2] == 0x76 &&
++		    id[3] == 0x61 &&
++		    id[4] == 0x72 &&
++		    id[5] == 0x54)
++			panel_mode = DP_PANEL_MODE_INTERNAL_DP1_MODE;
++		else
++			panel_mode = DP_PANEL_MODE_INTERNAL_DP2_MODE;
++	} else if (connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
+ 		u8 tmp = radeon_read_dpcd_reg(radeon_connector, DP_EDP_CONFIGURATION_CAP);
+ 		if (tmp & 1)
+ 			panel_mode = DP_PANEL_MODE_INTERNAL_DP2_MODE;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0035-sched-rt-Fix-task-stack-corruption-under-__ARCH_WANT.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0035-sched-rt-Fix-task-stack-corruption-under-__ARCH_WANT.patch
new file mode 100644
index 0000000..4fcf64b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0035-sched-rt-Fix-task-stack-corruption-under-__ARCH_WANT.patch
@@ -0,0 +1,94 @@
+From 6341f8928cf458016bab6aab444536843083ef0a Mon Sep 17 00:00:00 2001
+From: Chanho Min <chanho0207@gmail.com>
+Date: Thu, 5 Jan 2012 20:00:19 +0900
+Subject: [PATCH 35/87] sched/rt: Fix task stack corruption under
+ __ARCH_WANT_INTERRUPTS_ON_CTXSW
+
+commit cb297a3e433dbdcf7ad81e0564e7b804c941ff0d upstream.
+
+This issue happens under the following conditions:
+
+ 1. preemption is off
+ 2. __ARCH_WANT_INTERRUPTS_ON_CTXSW is defined
+ 3. RT scheduling class
+ 4. SMP system
+
+Sequence is as follows:
+
+ 1.suppose current task is A. start schedule()
+ 2.task A is enqueued pushable task at the entry of schedule()
+   __schedule
+    prev = rq->curr;
+    ...
+    put_prev_task
+     put_prev_task_rt
+      enqueue_pushable_task
+ 4.pick the task B as next task.
+   next = pick_next_task(rq);
+ 3.rq->curr set to task B and context_switch is started.
+   rq->curr = next;
+ 4.At the entry of context_swtich, release this cpu's rq->lock.
+   context_switch
+    prepare_task_switch
+     prepare_lock_switch
+      raw_spin_unlock_irq(&rq->lock);
+ 5.Shortly after rq->lock is released, interrupt is occurred and start IRQ context
+ 6.try_to_wake_up() which called by ISR acquires rq->lock
+    try_to_wake_up
+     ttwu_remote
+      rq = __task_rq_lock(p)
+      ttwu_do_wakeup(rq, p, wake_flags);
+        task_woken_rt
+ 7.push_rt_task picks the task A which is enqueued before.
+   task_woken_rt
+    push_rt_tasks(rq)
+     next_task = pick_next_pushable_task(rq)
+ 8.At find_lock_lowest_rq(), If double_lock_balance() returns 0,
+   lowest_rq can be the remote rq.
+  (But,If preemption is on, double_lock_balance always return 1 and it
+   does't happen.)
+   push_rt_task
+    find_lock_lowest_rq
+     if (double_lock_balance(rq, lowest_rq))..
+ 9.find_lock_lowest_rq return the available rq. task A is migrated to
+   the remote cpu/rq.
+   push_rt_task
+    ...
+    deactivate_task(rq, next_task, 0);
+    set_task_cpu(next_task, lowest_rq->cpu);
+    activate_task(lowest_rq, next_task, 0);
+ 10. But, task A is on irq context at this cpu.
+     So, task A is scheduled by two cpus at the same time until restore from IRQ.
+     Task A's stack is corrupted.
+
+To fix it, don't migrate an RT task if it's still running.
+
+Signed-off-by: Chanho Min <chanho.min@lge.com>
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Acked-by: Steven Rostedt <rostedt@goodmis.org>
+Link: http://lkml.kernel.org/r/CAOAMb1BHA=5fm7KTewYyke6u-8DP0iUuJMpgQw54vNeXFsGpoQ@mail.gmail.com
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/sched_rt.c |    5 +++++
+ 1 files changed, 5 insertions(+), 0 deletions(-)
+
+diff --git a/kernel/sched_rt.c b/kernel/sched_rt.c
+index 583a136..78fcacf 100644
+--- a/kernel/sched_rt.c
++++ b/kernel/sched_rt.c
+@@ -1388,6 +1388,11 @@ static int push_rt_task(struct rq *rq)
+ 	if (!next_task)
+ 		return 0;
+ 
++#ifdef __ARCH_WANT_INTERRUPTS_ON_CTXSW
++       if (unlikely(task_running(rq, next_task)))
++               return 0;
++#endif
++
+ retry:
+ 	if (unlikely(next_task == rq->curr)) {
+ 		WARN_ON(1);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0036-PM-Hibernate-Thaw-processes-in-SNAPSHOT_CREATE_IMAGE.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0036-PM-Hibernate-Thaw-processes-in-SNAPSHOT_CREATE_IMAGE.patch
new file mode 100644
index 0000000..fb7696d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0036-PM-Hibernate-Thaw-processes-in-SNAPSHOT_CREATE_IMAGE.patch
@@ -0,0 +1,83 @@
+From 26b67a54a31d8e18f66f52d6bae4907963648d3c Mon Sep 17 00:00:00 2001
+From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
+Date: Thu, 1 Dec 2011 22:33:10 +0100
+Subject: [PATCH 36/87] PM / Hibernate: Thaw processes in
+ SNAPSHOT_CREATE_IMAGE ioctl test path
+
+commit 97819a26224f019e73d88bb2fd4eb5a614860461 upstream.
+
+Commit 2aede851ddf08666f68ffc17be446420e9d2a056 (PM / Hibernate: Freeze
+kernel threads after preallocating memory) moved the freezing of kernel
+threads to hibernation_snapshot() function.
+
+So now, if the call to hibernation_snapshot() returns early due to a
+successful hibernation test, the caller has to thaw processes to ensure
+that the system gets back to its original state.
+
+But in SNAPSHOT_CREATE_IMAGE hibernation ioctl, the caller does not thaw
+processes in case hibernation_snapshot() returned due to a successful
+freezer test. Fix this issue. But note we still send the value of 'in_suspend'
+(which is now 0) to userspace, because we are not in an error path per-se,
+and moreover, the value of in_suspend correctly depicts the situation here.
+
+Signed-off-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/power/hibernate.c |    2 +-
+ kernel/power/power.h     |    2 ++
+ kernel/power/user.c      |   11 ++++++++---
+ 3 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
+index a6b0503..624538a 100644
+--- a/kernel/power/hibernate.c
++++ b/kernel/power/hibernate.c
+@@ -55,7 +55,7 @@ enum {
+ 
+ static int hibernation_mode = HIBERNATION_SHUTDOWN;
+ 
+-static bool freezer_test_done;
++bool freezer_test_done;
+ 
+ static const struct platform_hibernation_ops *hibernation_ops;
+ 
+diff --git a/kernel/power/power.h b/kernel/power/power.h
+index 23a2db1..0c4defe 100644
+--- a/kernel/power/power.h
++++ b/kernel/power/power.h
+@@ -50,6 +50,8 @@ static inline char *check_image_kernel(struct swsusp_info *info)
+ #define SPARE_PAGES	((1024 * 1024) >> PAGE_SHIFT)
+ 
+ /* kernel/power/hibernate.c */
++extern bool freezer_test_done;
++
+ extern int hibernation_snapshot(int platform_mode);
+ extern int hibernation_restore(int platform_mode);
+ extern int hibernation_platform_enter(void);
+diff --git a/kernel/power/user.c b/kernel/power/user.c
+index 3565b15..f08bbfb 100644
+--- a/kernel/power/user.c
++++ b/kernel/power/user.c
+@@ -283,10 +283,15 @@ static long snapshot_ioctl(struct file *filp, unsigned int cmd,
+ 		}
+ 		pm_restore_gfp_mask();
+ 		error = hibernation_snapshot(data->platform_support);
+-		if (!error)
++		if (!error) {
+ 			error = put_user(in_suspend, (int __user *)arg);
+-		if (!error)
+-			data->ready = 1;
++			if (!error && !freezer_test_done)
++				data->ready = 1;
++			if (freezer_test_done) {
++				freezer_test_done = false;
++				thaw_processes();
++			}
++		}
+ 		break;
+ 
+ 	case SNAPSHOT_ATOMIC_RESTORE:
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0037-PM-Hibernate-Thaw-kernel-threads-in-SNAPSHOT_CREATE_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0037-PM-Hibernate-Thaw-kernel-threads-in-SNAPSHOT_CREATE_.patch
new file mode 100644
index 0000000..6741b06
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0037-PM-Hibernate-Thaw-kernel-threads-in-SNAPSHOT_CREATE_.patch
@@ -0,0 +1,48 @@
+From 695cb013a3332b6c773c8a75be97aa6f91bc227f Mon Sep 17 00:00:00 2001
+From: "Srivatsa S. Bhat" <srivatsa.bhat@linux.vnet.ibm.com>
+Date: Wed, 1 Feb 2012 22:16:36 +0100
+Subject: [PATCH 37/87] PM / Hibernate: Thaw kernel threads in
+ SNAPSHOT_CREATE_IMAGE ioctl path
+
+commit fe9161db2e6053da21e4649d77bbefaf3030b11d upstream.
+
+In the SNAPSHOT_CREATE_IMAGE ioctl, if the call to hibernation_snapshot()
+fails, the frozen tasks are not thawed.
+
+And in the case of success, if we happen to exit due to a successful freezer
+test, all tasks (including those of userspace) are thawed, whereas actually
+we should have thawed only the kernel threads at that point. Fix both these
+issues.
+
+Signed-off-by: Srivatsa S. Bhat <srivatsa.bhat@linux.vnet.ibm.com>
+Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/power/user.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/power/user.c b/kernel/power/user.c
+index f08bbfb..f08d227 100644
+--- a/kernel/power/user.c
++++ b/kernel/power/user.c
+@@ -283,13 +283,15 @@ static long snapshot_ioctl(struct file *filp, unsigned int cmd,
+ 		}
+ 		pm_restore_gfp_mask();
+ 		error = hibernation_snapshot(data->platform_support);
+-		if (!error) {
++		if (error) {
++			thaw_kernel_threads();
++		} else {
+ 			error = put_user(in_suspend, (int __user *)arg);
+ 			if (!error && !freezer_test_done)
+ 				data->ready = 1;
+ 			if (freezer_test_done) {
+ 				freezer_test_done = false;
+-				thaw_processes();
++				thaw_kernel_threads();
+ 			}
+ 		}
+ 		break;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0038-8139cp-fix-missing-napi_gro_flush.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0038-8139cp-fix-missing-napi_gro_flush.patch
new file mode 100644
index 0000000..bb26a30
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0038-8139cp-fix-missing-napi_gro_flush.patch
@@ -0,0 +1,33 @@
+From ff91ca433acbb464e82dbc655c1339498c20d45a Mon Sep 17 00:00:00 2001
+From: Francois Romieu <romieu@fr.zoreil.com>
+Date: Sun, 8 Jan 2012 13:41:33 +0000
+Subject: [PATCH 38/87] 8139cp: fix missing napi_gro_flush.
+
+commit b189e810619a676e6b931a942a3e8387f3d39c21 upstream.
+
+The driver uses __napi_complete and napi_gro_receive. Without it, the
+driver hits the BUG_ON(n->gro_list) assertion hard in __napi_complete.
+
+Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>
+Tested-by: Marin Glibic <zhilla2@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/realtek/8139cp.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/ethernet/realtek/8139cp.c b/drivers/net/ethernet/realtek/8139cp.c
+index ee5da92..aba4f67 100644
+--- a/drivers/net/ethernet/realtek/8139cp.c
++++ b/drivers/net/ethernet/realtek/8139cp.c
+@@ -563,6 +563,7 @@ rx_next:
+ 		if (cpr16(IntrStatus) & cp_rx_intr_mask)
+ 			goto rx_status_loop;
+ 
++		napi_gro_flush(napi);
+ 		spin_lock_irqsave(&cp->lock, flags);
+ 		__napi_complete(napi);
+ 		cpw16_f(IntrMask, cp_intr_mask);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0039-udf-Mark-LVID-buffer-as-uptodate-before-marking-it-d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0039-udf-Mark-LVID-buffer-as-uptodate-before-marking-it-d.patch
new file mode 100644
index 0000000..d0d7c9a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0039-udf-Mark-LVID-buffer-as-uptodate-before-marking-it-d.patch
@@ -0,0 +1,40 @@
+From 43f4a516b2f5492bc597f3753b693ad8adc62748 Mon Sep 17 00:00:00 2001
+From: Jan Kara <jack@suse.cz>
+Date: Fri, 23 Dec 2011 11:53:07 +0100
+Subject: [PATCH 39/87] udf: Mark LVID buffer as uptodate before marking it
+ dirty
+
+commit 853a0c25baf96b028de1654bea1e0c8857eadf3d upstream.
+
+When we hit EIO while writing LVID, the buffer uptodate bit is cleared.
+This then results in an anoying warning from mark_buffer_dirty() when we
+write the buffer again. So just set uptodate flag unconditionally.
+
+Reviewed-by: Namjae Jeon <linkinjeon@gmail.com>
+Signed-off-by: Jan Kara <jack@suse.cz>
+Cc: Dave Jones <davej@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/udf/super.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/fs/udf/super.c b/fs/udf/super.c
+index e185253..87cb24a 100644
+--- a/fs/udf/super.c
++++ b/fs/udf/super.c
+@@ -1799,6 +1799,12 @@ static void udf_close_lvid(struct super_block *sb)
+ 				le16_to_cpu(lvid->descTag.descCRCLength)));
+ 
+ 	lvid->descTag.tagChecksum = udf_tag_checksum(&lvid->descTag);
++	/*
++	 * We set buffer uptodate unconditionally here to avoid spurious
++	 * warnings from mark_buffer_dirty() when previous EIO has marked
++	 * the buffer as !uptodate
++	 */
++	set_buffer_uptodate(bh);
+ 	mark_buffer_dirty(bh);
+ 	sbi->s_lvid_dirty = 0;
+ 	mutex_unlock(&sbi->s_alloc_mutex);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0040-drm-i915-HDMI-hot-remove-notification-to-audio-drive.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0040-drm-i915-HDMI-hot-remove-notification-to-audio-drive.patch
new file mode 100644
index 0000000..02c199e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0040-drm-i915-HDMI-hot-remove-notification-to-audio-drive.patch
@@ -0,0 +1,53 @@
+From febaacc3a6165f0cf54ff512f1e7e51563fd27b1 Mon Sep 17 00:00:00 2001
+From: Wu Fengguang <fengguang.wu@intel.com>
+Date: Fri, 9 Dec 2011 20:42:20 +0800
+Subject: [PATCH 40/87] drm/i915: HDMI hot remove notification to audio driver
+
+commit 2deed761188d7480eb5f7efbfe7aa77f09322ed8 upstream.
+
+On HDMI monitor hot remove, clear SDVO_AUDIO_ENABLE accordingly, so that
+the audio driver will receive hot plug events and take action to refresh
+its device state and ELD contents.
+
+The cleared SDVO_AUDIO_ENABLE bit needs to be restored to prevent losing
+HDMI audio after DPMS on.
+
+CC: Wang Zhenyu <zhenyu.z.wang@intel.com>
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_hdmi.c |    8 ++++++--
+ 1 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_hdmi.c b/drivers/gpu/drm/i915/intel_hdmi.c
+index d4f5a0b..64541f7 100644
+--- a/drivers/gpu/drm/i915/intel_hdmi.c
++++ b/drivers/gpu/drm/i915/intel_hdmi.c
+@@ -269,6 +269,10 @@ static void intel_hdmi_dpms(struct drm_encoder *encoder, int mode)
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
+ 	struct intel_hdmi *intel_hdmi = enc_to_intel_hdmi(encoder);
+ 	u32 temp;
++	u32 enable_bits = SDVO_ENABLE;
++
++	if (intel_hdmi->has_audio)
++		enable_bits |= SDVO_AUDIO_ENABLE;
+ 
+ 	temp = I915_READ(intel_hdmi->sdvox_reg);
+ 
+@@ -281,9 +285,9 @@ static void intel_hdmi_dpms(struct drm_encoder *encoder, int mode)
+ 	}
+ 
+ 	if (mode != DRM_MODE_DPMS_ON) {
+-		temp &= ~SDVO_ENABLE;
++		temp &= ~enable_bits;
+ 	} else {
+-		temp |= SDVO_ENABLE;
++		temp |= enable_bits;
+ 	}
+ 
+ 	I915_WRITE(intel_hdmi->sdvox_reg, temp);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0041-drm-i915-DisplayPort-hot-remove-notification-to-audi.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0041-drm-i915-DisplayPort-hot-remove-notification-to-audi.patch
new file mode 100644
index 0000000..1278a4e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0041-drm-i915-DisplayPort-hot-remove-notification-to-audi.patch
@@ -0,0 +1,40 @@
+From e306967621bd97280eb17c9abab473070a2e5b45 Mon Sep 17 00:00:00 2001
+From: Wu Fengguang <fengguang.wu@intel.com>
+Date: Fri, 9 Dec 2011 20:42:21 +0800
+Subject: [PATCH 41/87] drm/i915: DisplayPort hot remove notification to audio
+ driver
+
+commit 832afda6a7d7235ef0e09f4ec46736861540da6d upstream.
+
+On DP monitor hot remove, clear DP_AUDIO_OUTPUT_ENABLE accordingly,
+so that the audio driver will receive hot plug events and take action
+to refresh its device state and ELD contents.
+
+Note that the DP_AUDIO_OUTPUT_ENABLE bit may be enabled or disabled
+only when the link training is complete and set to "Normal".
+
+Tested OK for both hot plug/remove and DPMS on/off.
+
+Signed-off-by: Wu Fengguang <fengguang.wu@intel.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_dp.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_dp.c b/drivers/gpu/drm/i915/intel_dp.c
+index 92b041b..db3b461 100644
+--- a/drivers/gpu/drm/i915/intel_dp.c
++++ b/drivers/gpu/drm/i915/intel_dp.c
+@@ -1926,6 +1926,7 @@ intel_dp_link_down(struct intel_dp *intel_dp)
+ 			intel_wait_for_vblank(dev, to_intel_crtc(crtc)->pipe);
+ 	}
+ 
++	DP &= ~DP_AUDIO_OUTPUT_ENABLE;
+ 	I915_WRITE(intel_dp->output_reg, DP & ~DP_PORT_EN);
+ 	POSTING_READ(intel_dp->output_reg);
+ 	msleep(intel_dp->panel_power_down_delay);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0042-drm-i915-check-ACTHD-of-all-rings.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0042-drm-i915-check-ACTHD-of-all-rings.patch
new file mode 100644
index 0000000..9a3ddca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0042-drm-i915-check-ACTHD-of-all-rings.patch
@@ -0,0 +1,92 @@
+From 2d0e8c788387c3aea69c498d0cc24a73645b71cb Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Sun, 27 Nov 2011 18:58:17 +0100
+Subject: [PATCH 42/87] drm/i915: check ACTHD of all rings
+
+commit 097354eb14fa94d31a09c64d640643f58e4a5a9a upstream.
+
+Otherwise hangcheck spuriously fires when running blitter/bsd-only
+workloads.
+
+Contrary to a similar patch by Ben Widawsky this does not check
+INSTDONE of the other rings. Chris Wilson implied that in a failure to
+detect a hang, most likely because INSTDONE was fluctuating. Thus only
+check ACTHD, which as far as I know is rather reliable. Also, blitter
+and bsd rings can't launch complex tasks from a single instruction
+(like 3D_PRIM on the render with complex or even infinite shaders).
+
+This fixes spurious gpu hang detection when running
+tests/gem_hangcheck_forcewake on snb/ivb.
+
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_drv.h |    2 ++
+ drivers/gpu/drm/i915/i915_irq.c |   13 ++++++++++---
+ 2 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
+index 554bef7..505af3f 100644
+--- a/drivers/gpu/drm/i915/i915_drv.h
++++ b/drivers/gpu/drm/i915/i915_drv.h
+@@ -337,6 +337,8 @@ typedef struct drm_i915_private {
+ 	struct timer_list hangcheck_timer;
+ 	int hangcheck_count;
+ 	uint32_t last_acthd;
++	uint32_t last_acthd_bsd;
++	uint32_t last_acthd_blt;
+ 	uint32_t last_instdone;
+ 	uint32_t last_instdone1;
+ 
+diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
+index b40004b..d47a53b 100644
+--- a/drivers/gpu/drm/i915/i915_irq.c
++++ b/drivers/gpu/drm/i915/i915_irq.c
+@@ -1669,7 +1669,7 @@ void i915_hangcheck_elapsed(unsigned long data)
+ {
+ 	struct drm_device *dev = (struct drm_device *)data;
+ 	drm_i915_private_t *dev_priv = dev->dev_private;
+-	uint32_t acthd, instdone, instdone1;
++	uint32_t acthd, instdone, instdone1, acthd_bsd, acthd_blt;
+ 	bool err = false;
+ 
+ 	if (!i915_enable_hangcheck)
+@@ -1686,16 +1686,21 @@ void i915_hangcheck_elapsed(unsigned long data)
+ 	}
+ 
+ 	if (INTEL_INFO(dev)->gen < 4) {
+-		acthd = I915_READ(ACTHD);
+ 		instdone = I915_READ(INSTDONE);
+ 		instdone1 = 0;
+ 	} else {
+-		acthd = I915_READ(ACTHD_I965);
+ 		instdone = I915_READ(INSTDONE_I965);
+ 		instdone1 = I915_READ(INSTDONE1);
+ 	}
++	acthd = intel_ring_get_active_head(&dev_priv->ring[RCS]);
++	acthd_bsd = HAS_BSD(dev) ?
++		intel_ring_get_active_head(&dev_priv->ring[VCS]) : 0;
++	acthd_blt = HAS_BLT(dev) ?
++		intel_ring_get_active_head(&dev_priv->ring[BCS]) : 0;
+ 
+ 	if (dev_priv->last_acthd == acthd &&
++	    dev_priv->last_acthd_bsd == acthd_bsd &&
++	    dev_priv->last_acthd_blt == acthd_blt &&
+ 	    dev_priv->last_instdone == instdone &&
+ 	    dev_priv->last_instdone1 == instdone1) {
+ 		if (dev_priv->hangcheck_count++ > 1) {
+@@ -1727,6 +1732,8 @@ void i915_hangcheck_elapsed(unsigned long data)
+ 		dev_priv->hangcheck_count = 0;
+ 
+ 		dev_priv->last_acthd = acthd;
++		dev_priv->last_acthd_bsd = acthd_bsd;
++		dev_priv->last_acthd_blt = acthd_blt;
+ 		dev_priv->last_instdone = instdone;
+ 		dev_priv->last_instdone1 = instdone1;
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0043-drm-i915-Fix-TV-Out-refresh-rate.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0043-drm-i915-Fix-TV-Out-refresh-rate.patch
new file mode 100644
index 0000000..a01b012
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0043-drm-i915-Fix-TV-Out-refresh-rate.patch
@@ -0,0 +1,98 @@
+From eb10e9cd3a43bcaea5f7d4727b27b8f7e40d9fc7 Mon Sep 17 00:00:00 2001
+From: Rodrigo Vivi <rodrigo.vivi@gmail.com>
+Date: Wed, 14 Dec 2011 21:10:06 -0200
+Subject: [PATCH 43/87] drm/i915: Fix TV Out refresh rate.
+
+commit 23bd15ec662344dc10e9918fdd0dbc58bc71526d upstream.
+
+TV Out refresh rate was half of the specification for almost all modes.
+Due to this reason pixel clock was so low for some modes causing flickering screen.
+
+Signed-off-by: Rodrigo Vivi <rodrigo.vivi@gmail.com>
+Reviewed-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/intel_tv.c |   16 ++++++++--------
+ 1 files changed, 8 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
+index f3c6a9a..2b1fcad 100644
+--- a/drivers/gpu/drm/i915/intel_tv.c
++++ b/drivers/gpu/drm/i915/intel_tv.c
+@@ -417,7 +417,7 @@ static const struct tv_mode tv_modes[] = {
+ 	{
+ 		.name		= "NTSC-M",
+ 		.clock		= 108000,
+-		.refresh	= 29970,
++		.refresh	= 59940,
+ 		.oversample	= TV_OVERSAMPLE_8X,
+ 		.component_only = 0,
+ 		/* 525 Lines, 60 Fields, 15.734KHz line, Sub-Carrier 3.580MHz */
+@@ -460,7 +460,7 @@ static const struct tv_mode tv_modes[] = {
+ 	{
+ 		.name		= "NTSC-443",
+ 		.clock		= 108000,
+-		.refresh	= 29970,
++		.refresh	= 59940,
+ 		.oversample	= TV_OVERSAMPLE_8X,
+ 		.component_only = 0,
+ 		/* 525 Lines, 60 Fields, 15.734KHz line, Sub-Carrier 4.43MHz */
+@@ -502,7 +502,7 @@ static const struct tv_mode tv_modes[] = {
+ 	{
+ 		.name		= "NTSC-J",
+ 		.clock		= 108000,
+-		.refresh	= 29970,
++		.refresh	= 59940,
+ 		.oversample	= TV_OVERSAMPLE_8X,
+ 		.component_only = 0,
+ 
+@@ -545,7 +545,7 @@ static const struct tv_mode tv_modes[] = {
+ 	{
+ 		.name		= "PAL-M",
+ 		.clock		= 108000,
+-		.refresh	= 29970,
++		.refresh	= 59940,
+ 		.oversample	= TV_OVERSAMPLE_8X,
+ 		.component_only = 0,
+ 
+@@ -589,7 +589,7 @@ static const struct tv_mode tv_modes[] = {
+ 		/* 625 Lines, 50 Fields, 15.625KHz line, Sub-Carrier 4.434MHz */
+ 		.name	    = "PAL-N",
+ 		.clock		= 108000,
+-		.refresh	= 25000,
++		.refresh	= 50000,
+ 		.oversample	= TV_OVERSAMPLE_8X,
+ 		.component_only = 0,
+ 
+@@ -634,7 +634,7 @@ static const struct tv_mode tv_modes[] = {
+ 		/* 625 Lines, 50 Fields, 15.625KHz line, Sub-Carrier 4.434MHz */
+ 		.name	    = "PAL",
+ 		.clock		= 108000,
+-		.refresh	= 25000,
++		.refresh	= 50000,
+ 		.oversample	= TV_OVERSAMPLE_8X,
+ 		.component_only = 0,
+ 
+@@ -821,7 +821,7 @@ static const struct tv_mode tv_modes[] = {
+ 	{
+ 		.name       = "1080i@50Hz",
+ 		.clock		= 148800,
+-		.refresh	= 25000,
++		.refresh	= 50000,
+ 		.oversample     = TV_OVERSAMPLE_2X,
+ 		.component_only = 1,
+ 
+@@ -847,7 +847,7 @@ static const struct tv_mode tv_modes[] = {
+ 	{
+ 		.name       = "1080i@60Hz",
+ 		.clock		= 148800,
+-		.refresh	= 30000,
++		.refresh	= 60000,
+ 		.oversample     = TV_OVERSAMPLE_2X,
+ 		.component_only = 1,
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0044-drm-i915-handle-3rd-pipe.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0044-drm-i915-handle-3rd-pipe.patch
new file mode 100644
index 0000000..6753317
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0044-drm-i915-handle-3rd-pipe.patch
@@ -0,0 +1,37 @@
+From a390a377bfcf132841798e09e9bb4d0f6c27de91 Mon Sep 17 00:00:00 2001
+From: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Date: Sat, 7 Jan 2012 23:40:35 -0200
+Subject: [PATCH 44/87] drm/i915: handle 3rd pipe
+
+commit 07c1e8c1462fa7324de4c36ae9e55da2abd79cee upstream.
+
+We don't need to check 3rd pipe specifically, as it shares PLL with some
+other one.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=41977
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Reviewed-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_suspend.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_suspend.c b/drivers/gpu/drm/i915/i915_suspend.c
+index 43cbafe..a1eb83d 100644
+--- a/drivers/gpu/drm/i915/i915_suspend.c
++++ b/drivers/gpu/drm/i915/i915_suspend.c
+@@ -34,6 +34,10 @@ static bool i915_pipe_enabled(struct drm_device *dev, enum pipe pipe)
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
+ 	u32	dpll_reg;
+ 
++	/* On IVB, 3rd pipe shares PLL with another one */
++	if (pipe > 1)
++		return false;
++
+ 	if (HAS_PCH_SPLIT(dev))
+ 		dpll_reg = (pipe == PIPE_A) ? _PCH_DPLL_A : _PCH_DPLL_B;
+ 	else
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0045-drm-i915-convert-force_wake_get-to-func-pointer-in-t.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0045-drm-i915-convert-force_wake_get-to-func-pointer-in-t.patch
new file mode 100644
index 0000000..7e24608
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0045-drm-i915-convert-force_wake_get-to-func-pointer-in-t.patch
@@ -0,0 +1,42 @@
+From 97b068a6657ded880cf3b6617e92da865067a0db Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel@ffwll.ch>
+Date: Fri, 13 Jan 2012 16:20:06 -0800
+Subject: [PATCH 45/87] drm/i915: convert force_wake_get to func pointer in
+ the gpu reset code
+
+commit 8109021313c7a3d8947677391ce6ab9cd0bb1d28 upstream.
+
+This was forgotten in the original multi-threaded forcewake
+conversion:
+
+commit 8d715f0024f64ad1b1be85d8c081cf577944c847
+Author: Keith Packard <keithp at keithp.com>
+Date:   Fri Nov 18 20:39:01 2011 -0800
+
+    drm/i915: add multi-threaded forcewake support
+
+Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Reviewed-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_drv.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
+index a1103fc..d7c9d99 100644
+--- a/drivers/gpu/drm/i915/i915_drv.c
++++ b/drivers/gpu/drm/i915/i915_drv.c
+@@ -645,7 +645,7 @@ int i915_reset(struct drm_device *dev, u8 flags)
+ 		ret = gen6_do_reset(dev, flags);
+ 		/* If reset with a user forcewake, try to restore */
+ 		if (atomic_read(&dev_priv->forcewake_count))
+-			__gen6_gt_force_wake_get(dev_priv);
++			dev_priv->display.force_wake_get(dev_priv);
+ 		break;
+ 	case 5:
+ 		ret = ironlake_do_reset(dev, flags);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0046-drm-i915-protect-force_wake_-get-put-with-the-gt_loc.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0046-drm-i915-protect-force_wake_-get-put-with-the-gt_loc.patch
new file mode 100644
index 0000000..060d345
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0046-drm-i915-protect-force_wake_-get-put-with-the-gt_loc.patch
@@ -0,0 +1,163 @@
+From 69ac25cd32a4032a94c100b52cf52abf6fde90a5 Mon Sep 17 00:00:00 2001
+From: Daniel Vetter <daniel.vetter@ffwll.ch>
+Date: Wed, 14 Dec 2011 13:57:03 +0100
+Subject: [PATCH 46/87] drm/i915: protect force_wake_(get|put) with the
+ gt_lock
+
+commit 9f1f46a45a681d357d1ceedecec3671a5ae957f4 upstream.
+
+The problem this patch solves is that the forcewake accounting
+necessary for register reads is protected by dev->struct_mutex. But the
+hangcheck and error_capture code need to access registers without
+grabbing this mutex because we hold it while waiting for the gpu.
+So a new lock is required. Because currently the error_state capture
+is called from the error irq handler and the hangcheck code runs from
+a timer, it needs to be an irqsafe spinlock (note that the registers
+used by the irq handler (neglecting the error handling part) only uses
+registers that don't need the forcewake dance).
+
+We could tune this down to a normal spinlock when we rework the
+error_state capture and hangcheck code to run from a workqueue.  But
+we don't have any read in a fastpath that needs forcewake, so I've
+decided to not care much about overhead.
+
+This prevents tests/gem_hangcheck_forcewake from i-g-t from killing my
+snb on recent kernels - something must have slightly changed the
+timings. On previous kernels it only trigger a WARN about the broken
+locking.
+
+v2: Drop the previous patch for the register writes.
+
+v3: Improve the commit message per Chris Wilson's suggestions.
+
+Signed-Off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
+Reviewed-by: Chris Wilson <chris@chris-wilson.co.uk>
+Reviewed-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Signed-off-by: Eugeni Dodonov <eugeni.dodonov@intel.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/gpu/drm/i915/i915_debugfs.c |    8 ++++++--
+ drivers/gpu/drm/i915/i915_dma.c     |    1 +
+ drivers/gpu/drm/i915/i915_drv.c     |   18 ++++++++++++------
+ drivers/gpu/drm/i915/i915_drv.h     |   10 +++++++---
+ 4 files changed, 26 insertions(+), 11 deletions(-)
+
+diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
+index 004b048..b2e3c97 100644
+--- a/drivers/gpu/drm/i915/i915_debugfs.c
++++ b/drivers/gpu/drm/i915/i915_debugfs.c
+@@ -1314,9 +1314,13 @@ static int i915_gen6_forcewake_count_info(struct seq_file *m, void *data)
+ 	struct drm_info_node *node = (struct drm_info_node *) m->private;
+ 	struct drm_device *dev = node->minor->dev;
+ 	struct drm_i915_private *dev_priv = dev->dev_private;
++	unsigned forcewake_count;
+ 
+-	seq_printf(m, "forcewake count = %d\n",
+-		   atomic_read(&dev_priv->forcewake_count));
++	spin_lock_irq(&dev_priv->gt_lock);
++	forcewake_count = dev_priv->forcewake_count;
++	spin_unlock_irq(&dev_priv->gt_lock);
++
++	seq_printf(m, "forcewake count = %u\n", forcewake_count);
+ 
+ 	return 0;
+ }
+diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
+index a9ae374..c4da951 100644
+--- a/drivers/gpu/drm/i915/i915_dma.c
++++ b/drivers/gpu/drm/i915/i915_dma.c
+@@ -2042,6 +2042,7 @@ int i915_driver_load(struct drm_device *dev, unsigned long flags)
+ 	if (!IS_I945G(dev) && !IS_I945GM(dev))
+ 		pci_enable_msi(dev->pdev);
+ 
++	spin_lock_init(&dev_priv->gt_lock);
+ 	spin_lock_init(&dev_priv->irq_lock);
+ 	spin_lock_init(&dev_priv->error_lock);
+ 	spin_lock_init(&dev_priv->rps_lock);
+diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i915_drv.c
+index d7c9d99..e2d85a9 100644
+--- a/drivers/gpu/drm/i915/i915_drv.c
++++ b/drivers/gpu/drm/i915/i915_drv.c
+@@ -368,11 +368,12 @@ void __gen6_gt_force_wake_mt_get(struct drm_i915_private *dev_priv)
+  */
+ void gen6_gt_force_wake_get(struct drm_i915_private *dev_priv)
+ {
+-	WARN_ON(!mutex_is_locked(&dev_priv->dev->struct_mutex));
++	unsigned long irqflags;
+ 
+-	/* Forcewake is atomic in case we get in here without the lock */
+-	if (atomic_add_return(1, &dev_priv->forcewake_count) == 1)
++	spin_lock_irqsave(&dev_priv->gt_lock, irqflags);
++	if (dev_priv->forcewake_count++ == 0)
+ 		dev_priv->display.force_wake_get(dev_priv);
++	spin_unlock_irqrestore(&dev_priv->gt_lock, irqflags);
+ }
+ 
+ void __gen6_gt_force_wake_put(struct drm_i915_private *dev_priv)
+@@ -392,10 +393,12 @@ void __gen6_gt_force_wake_mt_put(struct drm_i915_private *dev_priv)
+  */
+ void gen6_gt_force_wake_put(struct drm_i915_private *dev_priv)
+ {
+-	WARN_ON(!mutex_is_locked(&dev_priv->dev->struct_mutex));
++	unsigned long irqflags;
+ 
+-	if (atomic_dec_and_test(&dev_priv->forcewake_count))
++	spin_lock_irqsave(&dev_priv->gt_lock, irqflags);
++	if (--dev_priv->forcewake_count == 0)
+ 		dev_priv->display.force_wake_put(dev_priv);
++	spin_unlock_irqrestore(&dev_priv->gt_lock, irqflags);
+ }
+ 
+ void __gen6_gt_wait_for_fifo(struct drm_i915_private *dev_priv)
+@@ -626,6 +629,7 @@ int i915_reset(struct drm_device *dev, u8 flags)
+ 	 * need to
+ 	 */
+ 	bool need_display = true;
++	unsigned long irqflags;
+ 	int ret;
+ 
+ 	if (!i915_try_reset)
+@@ -644,8 +648,10 @@ int i915_reset(struct drm_device *dev, u8 flags)
+ 	case 6:
+ 		ret = gen6_do_reset(dev, flags);
+ 		/* If reset with a user forcewake, try to restore */
+-		if (atomic_read(&dev_priv->forcewake_count))
++		spin_lock_irqsave(&dev_priv->gt_lock, irqflags);
++		if (dev_priv->forcewake_count)
+ 			dev_priv->display.force_wake_get(dev_priv);
++		spin_unlock_irqrestore(&dev_priv->gt_lock, irqflags);
+ 		break;
+ 	case 5:
+ 		ret = ironlake_do_reset(dev, flags);
+diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
+index 505af3f..ae294a0 100644
+--- a/drivers/gpu/drm/i915/i915_drv.h
++++ b/drivers/gpu/drm/i915/i915_drv.h
+@@ -286,7 +286,13 @@ typedef struct drm_i915_private {
+ 	int relative_constants_mode;
+ 
+ 	void __iomem *regs;
+-	u32 gt_fifo_count;
++	/** gt_fifo_count and the subsequent register write are synchronized
++	 * with dev->struct_mutex. */
++	unsigned gt_fifo_count;
++	/** forcewake_count is protected by gt_lock */
++	unsigned forcewake_count;
++	/** gt_lock is also taken in irq contexts. */
++	struct spinlock gt_lock;
+ 
+ 	struct intel_gmbus {
+ 		struct i2c_adapter adapter;
+@@ -738,8 +744,6 @@ typedef struct drm_i915_private {
+ 
+ 	struct drm_property *broadcast_rgb_property;
+ 	struct drm_property *force_audio_property;
+-
+-	atomic_t forcewake_count;
+ } drm_i915_private_t;
+ 
+ enum i915_cache_level {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0047-eCryptfs-Infinite-loop-due-to-overflow-in-ecryptfs_w.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0047-eCryptfs-Infinite-loop-due-to-overflow-in-ecryptfs_w.patch
new file mode 100644
index 0000000..dabc4e5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0047-eCryptfs-Infinite-loop-due-to-overflow-in-ecryptfs_w.patch
@@ -0,0 +1,51 @@
+From 3d1b7976d3697421e04c86c7a782833c83244694 Mon Sep 17 00:00:00 2001
+From: Li Wang <liwang@nudt.edu.cn>
+Date: Thu, 19 Jan 2012 09:44:36 +0800
+Subject: [PATCH 47/87] eCryptfs: Infinite loop due to overflow in
+ ecryptfs_write()
+
+commit 684a3ff7e69acc7c678d1a1394fe9e757993fd34 upstream.
+
+ecryptfs_write() can enter an infinite loop when truncating a file to a
+size larger than 4G. This only happens on architectures where size_t is
+represented by 32 bits.
+
+This was caused by a size_t overflow due to it incorrectly being used to
+store the result of a calculation which uses potentially large values of
+type loff_t.
+
+[tyhicks@canonical.com: rewrite subject and commit message]
+Signed-off-by: Li Wang <liwang@nudt.edu.cn>
+Signed-off-by: Yunchuan Wen <wenyunchuan@kylinos.com.cn>
+Reviewed-by: Cong Wang <xiyou.wangcong@gmail.com>
+Signed-off-by: Tyler Hicks <tyhicks@canonical.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/ecryptfs/read_write.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/fs/ecryptfs/read_write.c b/fs/ecryptfs/read_write.c
+index 54eb14c..608c1c3 100644
+--- a/fs/ecryptfs/read_write.c
++++ b/fs/ecryptfs/read_write.c
+@@ -130,7 +130,7 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
+ 		pgoff_t ecryptfs_page_idx = (pos >> PAGE_CACHE_SHIFT);
+ 		size_t start_offset_in_page = (pos & ~PAGE_CACHE_MASK);
+ 		size_t num_bytes = (PAGE_CACHE_SIZE - start_offset_in_page);
+-		size_t total_remaining_bytes = ((offset + size) - pos);
++		loff_t total_remaining_bytes = ((offset + size) - pos);
+ 
+ 		if (fatal_signal_pending(current)) {
+ 			rc = -EINTR;
+@@ -141,7 +141,7 @@ int ecryptfs_write(struct inode *ecryptfs_inode, char *data, loff_t offset,
+ 			num_bytes = total_remaining_bytes;
+ 		if (pos < offset) {
+ 			/* remaining zeros to write, up to destination offset */
+-			size_t total_remaining_zeros = (offset - pos);
++			loff_t total_remaining_zeros = (offset - pos);
+ 
+ 			if (num_bytes > total_remaining_zeros)
+ 				num_bytes = total_remaining_zeros;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0048-hwmon-w83627ehf-Fix-number-of-fans-for-NCT6776F.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0048-hwmon-w83627ehf-Fix-number-of-fans-for-NCT6776F.patch
new file mode 100644
index 0000000..b3da87e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0048-hwmon-w83627ehf-Fix-number-of-fans-for-NCT6776F.patch
@@ -0,0 +1,55 @@
+From 38c8c07ac7383692d0a4f932f6ac611437ed24ed Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <linux@roeck-us.net>
+Date: Fri, 27 Jan 2012 05:43:59 -0800
+Subject: [PATCH 48/87] hwmon: (w83627ehf) Fix number of fans for NCT6776F
+
+commit 585c0fd8216e0c9f98e2434092af7ec0f999522d upstream.
+
+NCT6776F can select fan input pins for fans 3 to 5 with a secondary set of
+chip register bits. Check that second set of bits in addition to the first set
+to detect if fans 3..5 are monitored.
+
+Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+Acked-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/w83627ehf.c |   23 ++++++++++++++++++++---
+ 1 files changed, 20 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
+index 4b57ab6..c25387d 100644
+--- a/drivers/hwmon/w83627ehf.c
++++ b/drivers/hwmon/w83627ehf.c
+@@ -1920,9 +1920,26 @@ w83627ehf_check_fan_inputs(const struct w83627ehf_sio_data *sio_data,
+ 		fan4min = 0;
+ 		fan5pin = 0;
+ 	} else if (sio_data->kind == nct6776) {
+-		fan3pin = !(superio_inb(sio_data->sioreg, 0x24) & 0x40);
+-		fan4pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x01);
+-		fan5pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x02);
++		bool gpok = superio_inb(sio_data->sioreg, 0x27) & 0x80;
++
++		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
++		regval = superio_inb(sio_data->sioreg, SIO_REG_ENABLE);
++
++		if (regval & 0x80)
++			fan3pin = gpok;
++		else
++			fan3pin = !(superio_inb(sio_data->sioreg, 0x24) & 0x40);
++
++		if (regval & 0x40)
++			fan4pin = gpok;
++		else
++			fan4pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x01);
++
++		if (regval & 0x20)
++			fan5pin = gpok;
++		else
++			fan5pin = !!(superio_inb(sio_data->sioreg, 0x1C) & 0x02);
++
+ 		fan4min = fan4pin;
+ 	} else if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b) {
+ 		fan3pin = 1;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0049-cifs-Fix-oops-in-session-setup-code-for-null-user-mo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0049-cifs-Fix-oops-in-session-setup-code-for-null-user-mo.patch
new file mode 100644
index 0000000..fab9d8a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0049-cifs-Fix-oops-in-session-setup-code-for-null-user-mo.patch
@@ -0,0 +1,47 @@
+From 85f2f3e05e8e0deec4fc8b751324f91acb276d21 Mon Sep 17 00:00:00 2001
+From: Shirish Pargaonkar <shirishpargaonkar@gmail.com>
+Date: Thu, 2 Feb 2012 15:28:28 -0600
+Subject: [PATCH 49/87] cifs: Fix oops in session setup code for null user
+ mounts
+
+commit de47a4176c532ef5961b8a46a2d541a3517412d3 upstream.
+
+For null user mounts, do not invoke string length function
+during session setup.
+
+Reported-and-Tested-by: Chris Clayton <chris2553@googlemail.com>
+Acked-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Shirish Pargaonkar <shirishpargaonkar@gmail.com>
+Signed-off-by: Steve French <smfrench@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/sess.c |    7 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/fs/cifs/sess.c b/fs/cifs/sess.c
+index 4ec3ee9..2504809 100644
+--- a/fs/cifs/sess.c
++++ b/fs/cifs/sess.c
+@@ -246,16 +246,15 @@ static void ascii_ssetup_strings(char **pbcc_area, struct cifs_ses *ses,
+ 	/* copy user */
+ 	/* BB what about null user mounts - check that we do this BB */
+ 	/* copy user */
+-	if (ses->user_name != NULL)
++	if (ses->user_name != NULL) {
+ 		strncpy(bcc_ptr, ses->user_name, MAX_USERNAME_SIZE);
++		bcc_ptr += strnlen(ses->user_name, MAX_USERNAME_SIZE);
++	}
+ 	/* else null user mount */
+-
+-	bcc_ptr += strnlen(ses->user_name, MAX_USERNAME_SIZE);
+ 	*bcc_ptr = 0;
+ 	bcc_ptr++; /* account for null termination */
+ 
+ 	/* copy domain */
+-
+ 	if (ses->domainName != NULL) {
+ 		strncpy(bcc_ptr, ses->domainName, 256);
+ 		bcc_ptr += strnlen(ses->domainName, 256);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0050-atmel_lcdfb-fix-usage-of-CONTRAST_CTR-in-suspend-res.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0050-atmel_lcdfb-fix-usage-of-CONTRAST_CTR-in-suspend-res.patch
new file mode 100644
index 0000000..506fcd3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0050-atmel_lcdfb-fix-usage-of-CONTRAST_CTR-in-suspend-res.patch
@@ -0,0 +1,36 @@
+From c1a4af09cec0d39604a99ab58e59276c69c4179a Mon Sep 17 00:00:00 2001
+From: Hubert Feurstein <h.feurstein@gmail.com>
+Date: Mon, 9 Jan 2012 17:23:57 +0100
+Subject: [PATCH 50/87] atmel_lcdfb: fix usage of CONTRAST_CTR in
+ suspend/resume
+
+commit 9f1065032ceb7e86c7c9f16bb86518857e88a172 upstream.
+
+An error was existing in the saving of CONTRAST_CTR register
+across suspend/resume.
+
+Signed-off-by: Hubert Feurstein <h.feurstein@gmail.com>
+Signed-off-by: Nicolas Ferre <nicolas.ferre@atmel.com>
+Acked-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
+Signed-off-by: Florian Tobias Schandinat <FlorianSchandinat@gmx.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/video/atmel_lcdfb.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/video/atmel_lcdfb.c b/drivers/video/atmel_lcdfb.c
+index 63409c1..e919c70 100644
+--- a/drivers/video/atmel_lcdfb.c
++++ b/drivers/video/atmel_lcdfb.c
+@@ -1089,7 +1089,7 @@ static int atmel_lcdfb_suspend(struct platform_device *pdev, pm_message_t mesg)
+ 	 */
+ 	lcdc_writel(sinfo, ATMEL_LCDC_IDR, ~0UL);
+ 
+-	sinfo->saved_lcdcon = lcdc_readl(sinfo, ATMEL_LCDC_CONTRAST_VAL);
++	sinfo->saved_lcdcon = lcdc_readl(sinfo, ATMEL_LCDC_CONTRAST_CTR);
+ 	lcdc_writel(sinfo, ATMEL_LCDC_CONTRAST_CTR, 0);
+ 	if (sinfo->atmel_lcdfb_power_control)
+ 		sinfo->atmel_lcdfb_power_control(0);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0051-lockdep-bug-Exclude-TAINT_FIRMWARE_WORKAROUND-from-d.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0051-lockdep-bug-Exclude-TAINT_FIRMWARE_WORKAROUND-from-d.patch
new file mode 100644
index 0000000..d96ecde
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0051-lockdep-bug-Exclude-TAINT_FIRMWARE_WORKAROUND-from-d.patch
@@ -0,0 +1,56 @@
+From 1a90d01be282f295186d58b42d8cbac1d5d7edc4 Mon Sep 17 00:00:00 2001
+From: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Date: Mon, 14 Nov 2011 13:13:49 +0100
+Subject: [PATCH 51/87] lockdep, bug: Exclude TAINT_FIRMWARE_WORKAROUND from
+ disabling lockdep
+
+commit df754e6af2f237a6c020c0daff55a1a609338e31 upstream.
+
+It's unlikely that TAINT_FIRMWARE_WORKAROUND causes false
+lockdep messages, so do not disable lockdep in that case.
+We still want to keep lockdep disabled in the
+TAINT_OOT_MODULE case:
+
+  - bin-only modules can cause various instabilities in
+    their and in unrelated kernel code
+
+  - they are impossible to debug for kernel developers
+
+  - they also typically do not have the copyright license
+    permission to link to the GPL-ed lockdep code.
+
+Suggested-by: Ben Hutchings <ben@decadent.org.uk>
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Link: http://lkml.kernel.org/n/tip-xopopjjens57r0i13qnyh2yo@git.kernel.org
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/panic.c |   12 ++++++++++--
+ 1 files changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/panic.c b/kernel/panic.c
+index b2659360..1b83fd8 100644
+--- a/kernel/panic.c
++++ b/kernel/panic.c
+@@ -240,8 +240,16 @@ void add_taint(unsigned flag)
+ 	 * Also we want to keep up lockdep for staging development and
+ 	 * post-warning case.
+ 	 */
+-	if (flag != TAINT_CRAP && flag != TAINT_WARN && __debug_locks_off())
+-		printk(KERN_WARNING "Disabling lock debugging due to kernel taint\n");
++	switch (flag) {
++	case TAINT_CRAP:
++	case TAINT_WARN:
++	case TAINT_FIRMWARE_WORKAROUND:
++		break;
++
++	default:
++		if (__debug_locks_off())
++			printk(KERN_WARNING "Disabling lock debugging due to kernel taint\n");
++	}
+ 
+ 	set_bit(flag, &tainted_mask);
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0052-lockdep-bug-Exclude-TAINT_OOT_MODULE-from-disabling-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0052-lockdep-bug-Exclude-TAINT_OOT_MODULE-from-disabling-.patch
new file mode 100644
index 0000000..57df74c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0052-lockdep-bug-Exclude-TAINT_OOT_MODULE-from-disabling-.patch
@@ -0,0 +1,56 @@
+From 6492a0fb92a35630103cc62a1902018dfef8b46c Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <ben@decadent.org.uk>
+Date: Wed, 7 Dec 2011 14:30:58 +0000
+Subject: [PATCH 52/87] lockdep, bug: Exclude TAINT_OOT_MODULE from disabling
+ lock debugging
+
+commit 9ec84acee1e221d99dc33237bff5e82839d10cc0 upstream.
+
+We do want to allow lock debugging for GPL-compatible modules
+that are not (yet) built in-tree.  This was disabled as a
+side-effect of commit 2449b8ba0745327c5fa49a8d9acffe03b2eded69
+('module,bug: Add TAINT_OOT_MODULE flag for modules not built
+in-tree').  Lock debug warnings now include taint flags, so
+kernel developers should still be able to deflect warnings
+caused by out-of-tree modules.
+
+The TAINT_PROPRIETARY_MODULE flag for non-GPL-compatible modules
+will still disable lock debugging.
+
+Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
+Cc: Nick Bowler <nbowler@elliptictech.com>
+Cc: Dave Jones <davej@redhat.com>
+Cc: Rusty Russell <rusty@rustcorp.com.au>
+Cc: Randy Dunlap <rdunlap@xenotime.net>
+Cc: Debian kernel maintainers <debian-kernel@lists.debian.org>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Alan Cox <alan@linux.intel.com>
+Link: http://lkml.kernel.org/r/1323268258.18450.11.camel@deadeye
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ kernel/panic.c |    5 +++--
+ 1 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/kernel/panic.c b/kernel/panic.c
+index 1b83fd8..3458469 100644
+--- a/kernel/panic.c
++++ b/kernel/panic.c
+@@ -237,11 +237,12 @@ void add_taint(unsigned flag)
+ 	 * Can't trust the integrity of the kernel anymore.
+ 	 * We don't call directly debug_locks_off() because the issue
+ 	 * is not necessarily serious enough to set oops_in_progress to 1
+-	 * Also we want to keep up lockdep for staging development and
+-	 * post-warning case.
++	 * Also we want to keep up lockdep for staging/out-of-tree
++	 * development and post-warning case.
+ 	 */
+ 	switch (flag) {
+ 	case TAINT_CRAP:
++	case TAINT_OOT_MODULE:
+ 	case TAINT_WARN:
+ 	case TAINT_FIRMWARE_WORKAROUND:
+ 		break;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0053-iscsi-target-Fix-reject-release-handling-in-iscsit_f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0053-iscsi-target-Fix-reject-release-handling-in-iscsit_f.patch
new file mode 100644
index 0000000..1b1175d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0053-iscsi-target-Fix-reject-release-handling-in-iscsit_f.patch
@@ -0,0 +1,79 @@
+From fa577fc1c4b43933b74efe8d44075ef93f289516 Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Mon, 16 Jan 2012 16:04:15 -0800
+Subject: [PATCH 53/87] iscsi-target: Fix reject release handling in
+ iscsit_free_cmd()
+
+commit c1ce4bd56f2846de55043374598fd929ad3b711b upstream.
+
+This patch addresses a bug where iscsit_free_cmd() was incorrectly calling
+iscsit_release_cmd() for ISCSI_OP_REJECT because iscsi_add_reject*() will
+overwrite the original iscsi_cmd->iscsi_opcode assignment.  This bug was
+introduced with the following commit:
+
+commit 0be67f2ed8f577d2c72d917928394c5885fa9134
+Author: Nicholas Bellinger <nab@linux-iscsi.org>
+Date:   Sun Oct 9 01:48:14 2011 -0700
+
+    iscsi-target: Remove SCF_SE_LUN_CMD flag abuses
+
+and was manifesting itself as list corruption with the following:
+
+[  131.191092] ------------[ cut here ]------------
+[  131.191092] WARNING: at lib/list_debug.c:53 __list_del_entry+0x8d/0x98()
+[  131.191092] Hardware name: VMware Virtual Platform
+[  131.191092] list_del corruption. prev->next should be ffff880022d3c100, but was 6b6b6b6b6b6b6b6b
+[  131.191092] Modules linked in: tcm_vhost ib_srpt ib_cm ib_sa ib_mad ib_core tcm_qla2xxx qla2xxx tcm_loop tcm_fc libfc scsi_transport_fc crc32c iscsi_target_mod target_core_stgt scsi_tgt target_core_pscsi target_core_file target_core_iblock target_core_mod configfs ipv6 iscsi_tcp libiscsi_tcp libiscsi scsi_transport_iscsi sr_mod cdrom sd_mod e1000 ata_piix libata mptspi mptscsih mptbase [last unloaded: scsi_wait_scan]
+[  131.191092] Pid: 2250, comm: iscsi_ttx Tainted: G        W    3.2.0-rc4+ #42
+[  131.191092] Call Trace:
+[  131.191092]  [<ffffffff8103b553>] warn_slowpath_common+0x80/0x98
+[  131.191092]  [<ffffffff8103b5ff>] warn_slowpath_fmt+0x41/0x43
+[  131.191092]  [<ffffffff811d0279>] __list_del_entry+0x8d/0x98
+[  131.191092]  [<ffffffffa01395c9>] transport_lun_remove_cmd+0x9b/0xb7 [target_core_mod]
+[  131.191092]  [<ffffffffa013a55c>] transport_generic_free_cmd+0x5d/0x71 [target_core_mod]
+[  131.191092]  [<ffffffffa01a012b>] iscsit_free_cmd+0x1e/0x27 [iscsi_target_mod]
+[  131.191092]  [<ffffffffa01a13be>] iscsit_close_connection+0x14d/0x5b2 [iscsi_target_mod]
+[  131.191092]  [<ffffffffa0196a0c>] iscsit_take_action_for_connection_exit+0xdb/0xe0 [iscsi_target_mod]
+[  131.191092]  [<ffffffffa01a55d4>] iscsi_target_tx_thread+0x15cb/0x1608 [iscsi_target_mod]
+[  131.191092]  [<ffffffff8103609a>] ? check_preempt_wakeup+0x121/0x185
+[  131.191092]  [<ffffffff81030801>] ? __dequeue_entity+0x2e/0x33
+[  131.191092]  [<ffffffffa01a4009>] ? iscsit_send_text_rsp+0x25f/0x25f [iscsi_target_mod]
+[  131.191092]  [<ffffffffa01a4009>] ? iscsit_send_text_rsp+0x25f/0x25f [iscsi_target_mod]
+[  131.191092]  [<ffffffff8138f706>] ? schedule+0x55/0x57
+[  131.191092]  [<ffffffff81056c7d>] kthread+0x7d/0x85
+[  131.191092]  [<ffffffff81399534>] kernel_thread_helper+0x4/0x10
+[  131.191092]  [<ffffffff81056c00>] ? kthread_worker_fn+0x16d/0x16d
+[  131.191092]  [<ffffffff81399530>] ? gs_change+0x13/0x13
+
+Reported-by: <jrepac@yahoo.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/iscsi/iscsi_target_util.c |   11 +++++++++++
+ 1 files changed, 11 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target_util.c b/drivers/target/iscsi/iscsi_target_util.c
+index 02348f7..99f2af3 100644
+--- a/drivers/target/iscsi/iscsi_target_util.c
++++ b/drivers/target/iscsi/iscsi_target_util.c
+@@ -851,6 +851,17 @@ void iscsit_free_cmd(struct iscsi_cmd *cmd)
+ 	case ISCSI_OP_SCSI_TMFUNC:
+ 		transport_generic_free_cmd(&cmd->se_cmd, 1);
+ 		break;
++	case ISCSI_OP_REJECT:
++		/*
++		 * Handle special case for REJECT when iscsi_add_reject*() has
++		 * overwritten the original iscsi_opcode assignment, and the
++		 * associated cmd->se_cmd needs to be released.
++		 */
++		if (cmd->se_cmd.se_tfo != NULL) {
++			transport_generic_free_cmd(&cmd->se_cmd, 1);
++			break;
++		}
++		/* Fall-through */
+ 	default:
+ 		iscsit_release_cmd(cmd);
+ 		break;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0054-iscsi-target-Fix-double-list_add-with-iscsit_alloc_b.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0054-iscsi-target-Fix-double-list_add-with-iscsit_alloc_b.patch
new file mode 100644
index 0000000..159d901
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0054-iscsi-target-Fix-double-list_add-with-iscsit_alloc_b.patch
@@ -0,0 +1,35 @@
+From 49f4afd3b15866b16b72691a6060fad041e8f2dc Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Mon, 16 Jan 2012 17:11:54 -0800
+Subject: [PATCH 54/87] iscsi-target: Fix double list_add with
+ iscsit_alloc_buffs reject
+
+commit cd931ee62fd0258fc85c76a7c5499fe85e0f3436 upstream.
+
+This patch fixes a bug where the iscsit_add_reject_from_cmd() call
+from a failure to iscsit_alloc_buffs() was incorrectly passing
+add_to_conn=1 and causing a double list_add after iscsi_cmd->i_list
+had already been added in iscsit_handle_scsi_cmd().
+
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/iscsi/iscsi_target.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
+index 8599545..3b46e3a 100644
+--- a/drivers/target/iscsi/iscsi_target.c
++++ b/drivers/target/iscsi/iscsi_target.c
+@@ -1062,7 +1062,7 @@ attach_cmd:
+ 	if (ret < 0)
+ 		return iscsit_add_reject_from_cmd(
+ 				ISCSI_REASON_BOOKMARK_NO_RESOURCES,
+-				1, 1, buf, cmd);
++				1, 0, buf, cmd);
+ 	/*
+ 	 * Check the CmdSN against ExpCmdSN/MaxCmdSN here if
+ 	 * the Immediate Bit is not set, and no Immediate
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0055-iscsi-target-Fix-discovery-with-INADDR_ANY-and-IN6AD.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0055-iscsi-target-Fix-discovery-with-INADDR_ANY-and-IN6AD.patch
new file mode 100644
index 0000000..feb7c2e
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0055-iscsi-target-Fix-discovery-with-INADDR_ANY-and-IN6AD.patch
@@ -0,0 +1,176 @@
+From 7b88c23d62bcaf794ebd97400869d00f00befcd6 Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Mon, 16 Jan 2012 23:33:48 -0800
+Subject: [PATCH 55/87] iscsi-target: Fix discovery with INADDR_ANY and
+ IN6ADDR_ANY_INIT
+
+commit 2f9bc894c67dbacae5a6a9875818d2a18a918d18 upstream.
+
+This patch addresses a bug with sendtargets discovery where INADDR_ANY (0.0.0.0)
++ IN6ADDR_ANY_INIT ([0:0:0:0:0:0:0:0]) network portals where incorrectly being
+reported back to initiators instead of the address of the connecting interface.
+To address this, save local socket ->getname() output during iscsi login setup,
+and makes iscsit_build_sendtargets_response() return these TargetAddress keys
+when INADDR_ANY or IN6ADDR_ANY_INIT portals are in use.
+
+Reported-by: Dax Kelson <dkelson@gurulabs.com>
+Reported-by: Andy Grover <agrover@redhat.com>
+Cc: David S. Miller <davem@davemloft.net>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/iscsi/iscsi_target.c       |   37 +++++++++++++++++++++++++---
+ drivers/target/iscsi/iscsi_target_core.h  |    2 +
+ drivers/target/iscsi/iscsi_target_login.c |   31 +++++++++++++++++++++---
+ 3 files changed, 62 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
+index 3b46e3a..0c1d5c73 100644
+--- a/drivers/target/iscsi/iscsi_target.c
++++ b/drivers/target/iscsi/iscsi_target.c
+@@ -3165,6 +3165,30 @@ static int iscsit_send_task_mgt_rsp(
+ 	return 0;
+ }
+ 
++static bool iscsit_check_inaddr_any(struct iscsi_np *np)
++{
++	bool ret = false;
++
++	if (np->np_sockaddr.ss_family == AF_INET6) {
++		const struct sockaddr_in6 sin6 = {
++			.sin6_addr = IN6ADDR_ANY_INIT };
++		struct sockaddr_in6 *sock_in6 =
++			 (struct sockaddr_in6 *)&np->np_sockaddr;
++
++		if (!memcmp(sock_in6->sin6_addr.s6_addr,
++				sin6.sin6_addr.s6_addr, 16))
++			ret = true;
++	} else {
++		struct sockaddr_in * sock_in =
++			(struct sockaddr_in *)&np->np_sockaddr;
++
++		if (sock_in->sin_addr.s_addr == INADDR_ANY)
++			ret = true;
++	}
++
++	return ret;
++}
++
+ static int iscsit_build_sendtargets_response(struct iscsi_cmd *cmd)
+ {
+ 	char *payload = NULL;
+@@ -3214,12 +3238,17 @@ static int iscsit_build_sendtargets_response(struct iscsi_cmd *cmd)
+ 			spin_lock(&tpg->tpg_np_lock);
+ 			list_for_each_entry(tpg_np, &tpg->tpg_gnp_list,
+ 						tpg_np_list) {
++				struct iscsi_np *np = tpg_np->tpg_np;
++				bool inaddr_any = iscsit_check_inaddr_any(np);
++
+ 				len = sprintf(buf, "TargetAddress="
+ 					"%s%s%s:%hu,%hu",
+-					(tpg_np->tpg_np->np_sockaddr.ss_family == AF_INET6) ?
+-					"[" : "", tpg_np->tpg_np->np_ip,
+-					(tpg_np->tpg_np->np_sockaddr.ss_family == AF_INET6) ?
+-					"]" : "", tpg_np->tpg_np->np_port,
++					(np->np_sockaddr.ss_family == AF_INET6) ?
++					"[" : "", (inaddr_any == false) ?
++						np->np_ip : conn->local_ip,
++					(np->np_sockaddr.ss_family == AF_INET6) ?
++					"]" : "", (inaddr_any == false) ?
++						np->np_port : conn->local_port,
+ 					tpg->tpgt);
+ 				len += 1;
+ 
+diff --git a/drivers/target/iscsi/iscsi_target_core.h b/drivers/target/iscsi/iscsi_target_core.h
+index f1a02da..7da2d6a 100644
+--- a/drivers/target/iscsi/iscsi_target_core.h
++++ b/drivers/target/iscsi/iscsi_target_core.h
+@@ -508,6 +508,7 @@ struct iscsi_conn {
+ 	u16			cid;
+ 	/* Remote TCP Port */
+ 	u16			login_port;
++	u16			local_port;
+ 	int			net_size;
+ 	u32			auth_id;
+ #define CONNFLAG_SCTP_STRUCT_FILE			0x01
+@@ -527,6 +528,7 @@ struct iscsi_conn {
+ 	unsigned char		bad_hdr[ISCSI_HDR_LEN];
+ #define IPV6_ADDRESS_SPACE				48
+ 	unsigned char		login_ip[IPV6_ADDRESS_SPACE];
++	unsigned char		local_ip[IPV6_ADDRESS_SPACE];
+ 	int			conn_usage_count;
+ 	int			conn_waiting_on_uc;
+ 	atomic_t		check_immediate_queue;
+diff --git a/drivers/target/iscsi/iscsi_target_login.c b/drivers/target/iscsi/iscsi_target_login.c
+index d734bde..bd2adec 100644
+--- a/drivers/target/iscsi/iscsi_target_login.c
++++ b/drivers/target/iscsi/iscsi_target_login.c
+@@ -616,8 +616,8 @@ static int iscsi_post_login_handler(
+ 		}
+ 
+ 		pr_debug("iSCSI Login successful on CID: %hu from %s to"
+-			" %s:%hu,%hu\n", conn->cid, conn->login_ip, np->np_ip,
+-				np->np_port, tpg->tpgt);
++			" %s:%hu,%hu\n", conn->cid, conn->login_ip,
++			conn->local_ip, conn->local_port, tpg->tpgt);
+ 
+ 		list_add_tail(&conn->conn_list, &sess->sess_conn_list);
+ 		atomic_inc(&sess->nconn);
+@@ -659,7 +659,8 @@ static int iscsi_post_login_handler(
+ 	sess->session_state = TARG_SESS_STATE_LOGGED_IN;
+ 
+ 	pr_debug("iSCSI Login successful on CID: %hu from %s to %s:%hu,%hu\n",
+-		conn->cid, conn->login_ip, np->np_ip, np->np_port, tpg->tpgt);
++		conn->cid, conn->login_ip, conn->local_ip, conn->local_port,
++		tpg->tpgt);
+ 
+ 	spin_lock_bh(&sess->conn_lock);
+ 	list_add_tail(&conn->conn_list, &sess->sess_conn_list);
+@@ -1019,6 +1020,18 @@ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ 		snprintf(conn->login_ip, sizeof(conn->login_ip), "%pI6c",
+ 				&sock_in6.sin6_addr.in6_u);
+ 		conn->login_port = ntohs(sock_in6.sin6_port);
++
++		if (conn->sock->ops->getname(conn->sock,
++				(struct sockaddr *)&sock_in6, &err, 0) < 0) {
++			pr_err("sock_ops->getname() failed.\n");
++			iscsit_tx_login_rsp(conn, ISCSI_STATUS_CLS_TARGET_ERR,
++					ISCSI_LOGIN_STATUS_TARGET_ERROR);
++			goto new_sess_out;
++		}
++		snprintf(conn->local_ip, sizeof(conn->local_ip), "%pI6c",
++				&sock_in6.sin6_addr.in6_u);
++		conn->local_port = ntohs(sock_in6.sin6_port);
++
+ 	} else {
+ 		memset(&sock_in, 0, sizeof(struct sockaddr_in));
+ 
+@@ -1031,6 +1044,16 @@ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ 		}
+ 		sprintf(conn->login_ip, "%pI4", &sock_in.sin_addr.s_addr);
+ 		conn->login_port = ntohs(sock_in.sin_port);
++
++		if (conn->sock->ops->getname(conn->sock,
++				(struct sockaddr *)&sock_in, &err, 0) < 0) {
++			pr_err("sock_ops->getname() failed.\n");
++			iscsit_tx_login_rsp(conn, ISCSI_STATUS_CLS_TARGET_ERR,
++					ISCSI_LOGIN_STATUS_TARGET_ERROR);
++			goto new_sess_out;
++		}
++		sprintf(conn->local_ip, "%pI4", &sock_in.sin_addr.s_addr);
++		conn->local_port = ntohs(sock_in.sin_port);
+ 	}
+ 
+ 	conn->network_transport = np->np_network_transport;
+@@ -1038,7 +1061,7 @@ static int __iscsi_target_login_thread(struct iscsi_np *np)
+ 	pr_debug("Received iSCSI login request from %s on %s Network"
+ 			" Portal %s:%hu\n", conn->login_ip,
+ 		(conn->network_transport == ISCSI_TCP) ? "TCP" : "SCTP",
+-			np->np_ip, np->np_port);
++			conn->local_ip, conn->local_port);
+ 
+ 	pr_debug("Moving to TARG_CONN_STATE_IN_LOGIN.\n");
+ 	conn->conn_state	= TARG_CONN_STATE_IN_LOGIN;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0056-ASoC-wm_hubs-Fix-routing-of-input-PGAs-to-line-outpu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0056-ASoC-wm_hubs-Fix-routing-of-input-PGAs-to-line-outpu.patch
new file mode 100644
index 0000000..98c8833
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0056-ASoC-wm_hubs-Fix-routing-of-input-PGAs-to-line-outpu.patch
@@ -0,0 +1,46 @@
+From f11e42f5205653968c6496e637b1cd524405a9ec Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Tue, 31 Jan 2012 11:55:32 +0000
+Subject: [PATCH 56/87] ASoC: wm_hubs: Fix routing of input PGAs to line
+ output mixer
+
+commit ee76744c51ec342df9822b4a85dbbfc3887b6d60 upstream.
+
+IN1L/R is routed to both line output mixers, we don't route IN1 to LINEOUT1
+and IN2 to LINEOUT2.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm_hubs.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
+index 8547191..6ef2283 100644
+--- a/sound/soc/codecs/wm_hubs.c
++++ b/sound/soc/codecs/wm_hubs.c
+@@ -587,8 +587,8 @@ SOC_DAPM_SINGLE("Left Output Switch", WM8993_LINE_MIXER1, 0, 1, 0),
+ };
+ 
+ static const struct snd_kcontrol_new line2_mix[] = {
+-SOC_DAPM_SINGLE("IN2R Switch", WM8993_LINE_MIXER2, 2, 1, 0),
+-SOC_DAPM_SINGLE("IN2L Switch", WM8993_LINE_MIXER2, 1, 1, 0),
++SOC_DAPM_SINGLE("IN1R Switch", WM8993_LINE_MIXER2, 2, 1, 0),
++SOC_DAPM_SINGLE("IN1L Switch", WM8993_LINE_MIXER2, 1, 1, 0),
+ SOC_DAPM_SINGLE("Output Switch", WM8993_LINE_MIXER2, 0, 1, 0),
+ };
+ 
+@@ -846,8 +846,8 @@ static const struct snd_soc_dapm_route lineout1_se_routes[] = {
+ };
+ 
+ static const struct snd_soc_dapm_route lineout2_diff_routes[] = {
+-	{ "LINEOUT2 Mixer", "IN2L Switch", "IN2L PGA" },
+-	{ "LINEOUT2 Mixer", "IN2R Switch", "IN2R PGA" },
++	{ "LINEOUT2 Mixer", "IN1L Switch", "IN1L PGA" },
++	{ "LINEOUT2 Mixer", "IN1R Switch", "IN1R PGA" },
+ 	{ "LINEOUT2 Mixer", "Output Switch", "Right Output PGA" },
+ 
+ 	{ "LINEOUT2N Driver", NULL, "LINEOUT2 Mixer" },
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0057-ASoC-wm_hubs-Correct-line-input-to-line-output-2-pat.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0057-ASoC-wm_hubs-Correct-line-input-to-line-output-2-pat.patch
new file mode 100644
index 0000000..7a62535
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0057-ASoC-wm_hubs-Correct-line-input-to-line-output-2-pat.patch
@@ -0,0 +1,35 @@
+From 520a5189a6745dcd3b61e87562e28d6e8aba12f8 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Wed, 1 Feb 2012 23:46:58 +0000
+Subject: [PATCH 57/87] ASoC: wm_hubs: Correct line input to line output 2
+ paths
+
+commit 43b6cec27e1e50a1de3eff47e66e502f3fe7e66e upstream.
+
+The second line output mixer has the controls for the line input bypasses
+in the opposite order.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm_hubs.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sound/soc/codecs/wm_hubs.c b/sound/soc/codecs/wm_hubs.c
+index 6ef2283..3642e06 100644
+--- a/sound/soc/codecs/wm_hubs.c
++++ b/sound/soc/codecs/wm_hubs.c
+@@ -587,8 +587,8 @@ SOC_DAPM_SINGLE("Left Output Switch", WM8993_LINE_MIXER1, 0, 1, 0),
+ };
+ 
+ static const struct snd_kcontrol_new line2_mix[] = {
+-SOC_DAPM_SINGLE("IN1R Switch", WM8993_LINE_MIXER2, 2, 1, 0),
+-SOC_DAPM_SINGLE("IN1L Switch", WM8993_LINE_MIXER2, 1, 1, 0),
++SOC_DAPM_SINGLE("IN1L Switch", WM8993_LINE_MIXER2, 2, 1, 0),
++SOC_DAPM_SINGLE("IN1R Switch", WM8993_LINE_MIXER2, 1, 1, 0),
+ SOC_DAPM_SINGLE("Output Switch", WM8993_LINE_MIXER2, 0, 1, 0),
+ };
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0058-ASoC-wm8962-Fix-word-length-configuration.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0058-ASoC-wm8962-Fix-word-length-configuration.patch
new file mode 100644
index 0000000..1109c8b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0058-ASoC-wm8962-Fix-word-length-configuration.patch
@@ -0,0 +1,38 @@
+From ef7dcc8c0fd35d7fb937d7bc4ac7b883945b3586 Mon Sep 17 00:00:00 2001
+From: Susan Gao <sgao@opensource.wolfsonmicro.com>
+Date: Mon, 30 Jan 2012 13:57:04 -0800
+Subject: [PATCH 58/87] ASoC: wm8962: Fix word length configuration
+
+commit 2b6712b19531e22455e7fa18371c5ba9eec76699 upstream.
+
+Signed-off-by: Susan Gao <sgao@opensource.wolfsonmicro.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm8962.c |    6 +++---
+ 1 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
+index 53edd9a..d795294 100644
+--- a/sound/soc/codecs/wm8962.c
++++ b/sound/soc/codecs/wm8962.c
+@@ -3172,13 +3172,13 @@ static int wm8962_hw_params(struct snd_pcm_substream *substream,
+ 	case SNDRV_PCM_FORMAT_S16_LE:
+ 		break;
+ 	case SNDRV_PCM_FORMAT_S20_3LE:
+-		aif0 |= 0x40;
++		aif0 |= 0x4;
+ 		break;
+ 	case SNDRV_PCM_FORMAT_S24_LE:
+-		aif0 |= 0x80;
++		aif0 |= 0x8;
+ 		break;
+ 	case SNDRV_PCM_FORMAT_S32_LE:
+-		aif0 |= 0xc0;
++		aif0 |= 0xc;
+ 		break;
+ 	default:
+ 		return -EINVAL;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0059-ASoC-wm8994-Enabling-VMID-should-take-a-runtime-PM-r.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0059-ASoC-wm8994-Enabling-VMID-should-take-a-runtime-PM-r.patch
new file mode 100644
index 0000000..0c1b50c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0059-ASoC-wm8994-Enabling-VMID-should-take-a-runtime-PM-r.patch
@@ -0,0 +1,42 @@
+From e9ee45b83b21448a8e27309456430890b5fa1ff2 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Mon, 6 Feb 2012 12:07:08 +0000
+Subject: [PATCH 59/87] ASoC: wm8994: Enabling VMID should take a runtime PM
+ reference
+
+commit db966f8abb9ba74f7d5a7230f51572f52c31c4e5 upstream.
+
+We can enable VMID independently of the bias in some use cases so we need
+to ensure that the core device is powered up.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm8994.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
+index d0c545b..a3d6bd8 100644
+--- a/sound/soc/codecs/wm8994.c
++++ b/sound/soc/codecs/wm8994.c
+@@ -729,6 +729,8 @@ static void vmid_reference(struct snd_soc_codec *codec)
+ {
+ 	struct wm8994_priv *wm8994 = snd_soc_codec_get_drvdata(codec);
+ 
++	pm_runtime_get_sync(codec->dev);
++
+ 	wm8994->vmid_refcount++;
+ 
+ 	dev_dbg(codec->dev, "Referencing VMID, refcount is now %d\n",
+@@ -796,6 +798,8 @@ static void vmid_dereference(struct snd_soc_codec *codec)
+ 				    WM8994_VMID_BUF_ENA |
+ 				    WM8994_VMID_RAMP_MASK, 0);
+ 	}
++
++	pm_runtime_put(codec->dev);
+ }
+ 
+ static int vmid_event(struct snd_soc_dapm_widget *w,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0060-ASoC-wm8994-Fix-typo-in-VMID-ramp-setting.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0060-ASoC-wm8994-Fix-typo-in-VMID-ramp-setting.patch
new file mode 100644
index 0000000..d4b7d71
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0060-ASoC-wm8994-Fix-typo-in-VMID-ramp-setting.patch
@@ -0,0 +1,31 @@
+From a79cee16dfd9206eb087fbd25767c4d8dec0b0c5 Mon Sep 17 00:00:00 2001
+From: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Date: Tue, 7 Feb 2012 17:24:19 +0000
+Subject: [PATCH 60/87] ASoC: wm8994: Fix typo in VMID ramp setting
+
+commit f647e1526fd6c7c8ab720781c40d11e11f930e93 upstream.
+
+The VMID ramp rate is supposed to be 0x3, not 11b. Fix that.
+
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/codecs/wm8994.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
+index a3d6bd8..6e502af 100644
+--- a/sound/soc/codecs/wm8994.c
++++ b/sound/soc/codecs/wm8994.c
+@@ -744,7 +744,7 @@ static void vmid_reference(struct snd_soc_codec *codec)
+ 				    WM8994_VMID_RAMP_MASK,
+ 				    WM8994_STARTUP_BIAS_ENA |
+ 				    WM8994_VMID_BUF_ENA |
+-				    (0x11 << WM8994_VMID_RAMP_SHIFT));
++				    (0x3 << WM8994_VMID_RAMP_SHIFT));
+ 
+ 		/* Main bias enable, VMID=2x40k */
+ 		snd_soc_update_bits(codec, WM8994_POWER_MANAGEMENT_1,
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0061-pcmcia-fix-socket-refcount-decrementing-on-each-resu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0061-pcmcia-fix-socket-refcount-decrementing-on-each-resu.patch
new file mode 100644
index 0000000..375aeeb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0061-pcmcia-fix-socket-refcount-decrementing-on-each-resu.patch
@@ -0,0 +1,179 @@
+From 93636af6098a627a1ddc02f2f265be4a9d337201 Mon Sep 17 00:00:00 2001
+From: Russell King <rmk+kernel@arm.linux.org.uk>
+Date: Wed, 8 Feb 2012 17:13:41 -0800
+Subject: [PATCH 61/87] pcmcia: fix socket refcount decrementing on each
+ resume
+
+commit 025e4ab3db07fcbf62c01e4f30d1012234beb980 upstream.
+
+This fixes a memory-corrupting bug: not only does it cause the warning,
+but as a result of dropping the refcount to zero, it causes the
+pcmcia_socket0 device structure to be freed while it still has
+references, causing slab caches corruption.  A fatal oops quickly
+follows this warning - often even just a 'dmesg' following the warning
+causes the kernel to oops.
+
+While testing suspend/resume on an ARM device with PCMCIA support, and a
+CF card inserted, I found that after five suspend and resumes, the
+kernel would complain, and shortly die after with slab corruption.
+
+  WARNING: at include/linux/kref.h:41 kobject_get+0x28/0x50()
+
+As the message doesn't give a clue about which kobject, and the built-in
+debugging in drivers/base/power/main.c happens too late, this was added
+right before each get_device():
+
+  printk("%s: %p [%s] %u\n", __func__, dev, kobject_name(&dev->kobj), atomic_read(&dev->kobj.kref.refcount));
+
+and on the 3rd s2ram cycle, the following behaviour observed:
+
+On the 3rd suspend/resume cycle:
+
+  dpm_prepare: c1a0d998 [pcmcia_socket0] 3
+  dpm_suspend: c1a0d998 [pcmcia_socket0] 3
+  dpm_suspend_noirq: c1a0d998 [pcmcia_socket0] 3
+  dpm_resume_noirq: c1a0d998 [pcmcia_socket0] 3
+  dpm_resume: c1a0d998 [pcmcia_socket0] 3
+  dpm_complete: c1a0d998 [pcmcia_socket0] 2
+
+4th:
+
+  dpm_prepare: c1a0d998 [pcmcia_socket0] 2
+  dpm_suspend: c1a0d998 [pcmcia_socket0] 2
+  dpm_suspend_noirq: c1a0d998 [pcmcia_socket0] 2
+  dpm_resume_noirq: c1a0d998 [pcmcia_socket0] 2
+  dpm_resume: c1a0d998 [pcmcia_socket0] 2
+  dpm_complete: c1a0d998 [pcmcia_socket0] 1
+
+5th:
+
+  dpm_prepare: c1a0d998 [pcmcia_socket0] 1
+  dpm_suspend: c1a0d998 [pcmcia_socket0] 1
+  dpm_suspend_noirq: c1a0d998 [pcmcia_socket0] 1
+  dpm_resume_noirq: c1a0d998 [pcmcia_socket0] 1
+  dpm_resume: c1a0d998 [pcmcia_socket0] 1
+  dpm_complete: c1a0d998 [pcmcia_socket0] 0
+  ------------[ cut here ]------------
+  WARNING: at include/linux/kref.h:41 kobject_get+0x28/0x50()
+  Modules linked in: ucb1x00_core
+  Backtrace:
+  [<c0212090>] (dump_backtrace+0x0/0x110) from [<c04799dc>] (dump_stack+0x18/0x1c)
+  [<c04799c4>] (dump_stack+0x0/0x1c) from [<c021cba0>] (warn_slowpath_common+0x50/0x68)
+  [<c021cb50>] (warn_slowpath_common+0x0/0x68) from [<c021cbdc>] (warn_slowpath_null+0x24/0x28)
+  [<c021cbb8>] (warn_slowpath_null+0x0/0x28) from [<c0335374>] (kobject_get+0x28/0x50)
+  [<c033534c>] (kobject_get+0x0/0x50) from [<c03804f4>] (get_device+0x1c/0x24)
+  [<c0388c90>] (dpm_complete+0x0/0x1a0) from [<c0389cc0>] (dpm_resume_end+0x1c/0x20)
+  ...
+
+Looking at commit 7b24e7988263 ("pcmcia: split up central event handler"),
+the following change was made to cs.c:
+
+                return 0;
+        }
+ #endif
+-
+-       send_event(skt, CS_EVENT_PM_RESUME, CS_EVENT_PRI_LOW);
++       if (!(skt->state & SOCKET_CARDBUS) && (skt->callback))
++               skt->callback->early_resume(skt);
+        return 0;
+ }
+
+And the corresponding change in ds.c is from:
+
+-static int ds_event(struct pcmcia_socket *skt, event_t event, int priority)
+-{
+-       struct pcmcia_socket *s = pcmcia_get_socket(skt);
+...
+-       switch (event) {
+...
+-       case CS_EVENT_PM_RESUME:
+-               if (verify_cis_cache(skt) != 0) {
+-                       dev_dbg(&skt->dev, "cis mismatch - different card\n");
+-                       /* first, remove the card */
+-                       ds_event(skt, CS_EVENT_CARD_REMOVAL, CS_EVENT_PRI_HIGH);
+-                       mutex_lock(&s->ops_mutex);
+-                       destroy_cis_cache(skt);
+-                       kfree(skt->fake_cis);
+-                       skt->fake_cis = NULL;
+-                       s->functions = 0;
+-                       mutex_unlock(&s->ops_mutex);
+-                       /* now, add the new card */
+-                       ds_event(skt, CS_EVENT_CARD_INSERTION,
+-                                CS_EVENT_PRI_LOW);
+-               }
+-               break;
+...
+-    }
+
+-    pcmcia_put_socket(s);
+
+-    return 0;
+-} /* ds_event */
+
+to:
+
++static int pcmcia_bus_early_resume(struct pcmcia_socket *skt)
++{
++       if (!verify_cis_cache(skt)) {
++               pcmcia_put_socket(skt);
++               return 0;
++       }
+
++       dev_dbg(&skt->dev, "cis mismatch - different card\n");
+
++       /* first, remove the card */
++       pcmcia_bus_remove(skt);
++       mutex_lock(&skt->ops_mutex);
++       destroy_cis_cache(skt);
++       kfree(skt->fake_cis);
++       skt->fake_cis = NULL;
++       skt->functions = 0;
++       mutex_unlock(&skt->ops_mutex);
+
++       /* now, add the new card */
++       pcmcia_bus_add(skt);
++       return 0;
++}
+
+As can be seen, the original function called pcmcia_get_socket() and
+pcmcia_put_socket() around the guts, whereas the replacement code
+calls pcmcia_put_socket() only in one path.  This creates an imbalance
+in the refcounting.
+
+Testing with pcmcia_put_socket() put removed shows that the bug is gone:
+
+  dpm_suspend: c1a10998 [pcmcia_socket0] 5
+  dpm_suspend_noirq: c1a10998 [pcmcia_socket0] 5
+  dpm_resume_noirq: c1a10998 [pcmcia_socket0] 5
+  dpm_resume: c1a10998 [pcmcia_socket0] 5
+  dpm_complete: c1a10998 [pcmcia_socket0] 5
+
+Tested-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
+Cc: Dominik Brodowski <linux@dominikbrodowski.net>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/pcmcia/ds.c |    4 +---
+ 1 files changed, 1 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/pcmcia/ds.c b/drivers/pcmcia/ds.c
+index 749c2a1..1932029 100644
+--- a/drivers/pcmcia/ds.c
++++ b/drivers/pcmcia/ds.c
+@@ -1269,10 +1269,8 @@ static int pcmcia_bus_add(struct pcmcia_socket *skt)
+ 
+ static int pcmcia_bus_early_resume(struct pcmcia_socket *skt)
+ {
+-	if (!verify_cis_cache(skt)) {
+-		pcmcia_put_socket(skt);
++	if (!verify_cis_cache(skt))
+ 		return 0;
+-	}
+ 
+ 	dev_dbg(&skt->dev, "cis mismatch - different card\n");
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0062-ALSA-oxygen-virtuoso-fix-exchanged-L-R-volumes-of-au.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0062-ALSA-oxygen-virtuoso-fix-exchanged-L-R-volumes-of-au.patch
new file mode 100644
index 0000000..4bd7da2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0062-ALSA-oxygen-virtuoso-fix-exchanged-L-R-volumes-of-au.patch
@@ -0,0 +1,67 @@
+From bc7e7c8b2462ed098d18bc54b431341cc69584b2 Mon Sep 17 00:00:00 2001
+From: Clemens Ladisch <clemens@ladisch.de>
+Date: Sat, 4 Feb 2012 20:56:47 +0100
+Subject: [PATCH 62/87] ALSA: oxygen, virtuoso: fix exchanged L/R volumes of
+ aux and CD inputs
+
+commit 2492250e4412c6411324c14ab289629360640b0a upstream.
+
+The driver accidentally exchanged the left/right fields for stereo AC'97
+mixer registers.  This affected only the aux and CD inputs because the
+line input bypasses the AC'97 codec and the mic input is mono; cards
+without AC'97 (Xonar DS/DG/HDAV Slim, HG2PCI, HiFier) were not affected.
+
+Reported-and-tested-by: Abby Cedar <abbycedar@yahoo.com.au>
+Signed-off-by: Clemens Ladisch <clemens@ladisch.de>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/oxygen/oxygen_mixer.c |   25 ++++++++++++++-----------
+ 1 files changed, 14 insertions(+), 11 deletions(-)
+
+diff --git a/sound/pci/oxygen/oxygen_mixer.c b/sound/pci/oxygen/oxygen_mixer.c
+index 26c7e8b..c0dbb52 100644
+--- a/sound/pci/oxygen/oxygen_mixer.c
++++ b/sound/pci/oxygen/oxygen_mixer.c
+@@ -618,9 +618,12 @@ static int ac97_volume_get(struct snd_kcontrol *ctl,
+ 	mutex_lock(&chip->mutex);
+ 	reg = oxygen_read_ac97(chip, codec, index);
+ 	mutex_unlock(&chip->mutex);
+-	value->value.integer.value[0] = 31 - (reg & 0x1f);
+-	if (stereo)
+-		value->value.integer.value[1] = 31 - ((reg >> 8) & 0x1f);
++	if (!stereo) {
++		value->value.integer.value[0] = 31 - (reg & 0x1f);
++	} else {
++		value->value.integer.value[0] = 31 - ((reg >> 8) & 0x1f);
++		value->value.integer.value[1] = 31 - (reg & 0x1f);
++	}
+ 	return 0;
+ }
+ 
+@@ -636,14 +639,14 @@ static int ac97_volume_put(struct snd_kcontrol *ctl,
+ 
+ 	mutex_lock(&chip->mutex);
+ 	oldreg = oxygen_read_ac97(chip, codec, index);
+-	newreg = oldreg;
+-	newreg = (newreg & ~0x1f) |
+-		(31 - (value->value.integer.value[0] & 0x1f));
+-	if (stereo)
+-		newreg = (newreg & ~0x1f00) |
+-			((31 - (value->value.integer.value[1] & 0x1f)) << 8);
+-	else
+-		newreg = (newreg & ~0x1f00) | ((newreg & 0x1f) << 8);
++	if (!stereo) {
++		newreg = oldreg & ~0x1f;
++		newreg |= 31 - (value->value.integer.value[0] & 0x1f);
++	} else {
++		newreg = oldreg & ~0x1f1f;
++		newreg |= (31 - (value->value.integer.value[0] & 0x1f)) << 8;
++		newreg |= 31 - (value->value.integer.value[1] & 0x1f);
++	}
+ 	change = newreg != oldreg;
+ 	if (change)
+ 		oxygen_write_ac97(chip, codec, index, newreg);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0063-iommu-amd-Work-around-broken-IVRS-tables.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0063-iommu-amd-Work-around-broken-IVRS-tables.patch
new file mode 100644
index 0000000..b3b5969
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0063-iommu-amd-Work-around-broken-IVRS-tables.patch
@@ -0,0 +1,37 @@
+From 61c39c6dcc3c7b3278c611a5bdcc135a1e4d825e Mon Sep 17 00:00:00 2001
+From: Joerg Roedel <joerg.roedel@amd.com>
+Date: Wed, 18 Jan 2012 14:03:11 +0100
+Subject: [PATCH 63/87] iommu/amd: Work around broken IVRS tables
+
+commit af1be04901e27ce669b4ecde1c953d5c939498f5 upstream.
+
+On some systems the IVRS table does not contain all PCI
+devices present in the system. In case a device not present
+in the IVRS table is translated by the IOMMU no DMA is
+possible from that device by default.
+This patch fixes this by removing the DTE entry for every
+PCI device present in the system and not covered by IVRS.
+
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/iommu/amd_iommu.c |    3 +++
+ 1 files changed, 3 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/iommu/amd_iommu.c b/drivers/iommu/amd_iommu.c
+index 4ee277a..e0b3e33 100644
+--- a/drivers/iommu/amd_iommu.c
++++ b/drivers/iommu/amd_iommu.c
+@@ -2479,6 +2479,9 @@ static unsigned device_dma_ops_init(void)
+ 
+ 	for_each_pci_dev(pdev) {
+ 		if (!check_device(&pdev->dev)) {
++
++			iommu_ignore_device(&pdev->dev);
++
+ 			unhandled += 1;
+ 			continue;
+ 		}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0064-iommu-msm-Fix-error-handling-in-msm_iommu_unmap.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0064-iommu-msm-Fix-error-handling-in-msm_iommu_unmap.patch
new file mode 100644
index 0000000..b488d7b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0064-iommu-msm-Fix-error-handling-in-msm_iommu_unmap.patch
@@ -0,0 +1,62 @@
+From d7cd8fc525c9322ceb1f1de26d7c6201aef9d842 Mon Sep 17 00:00:00 2001
+From: Joerg Roedel <joerg.roedel@amd.com>
+Date: Thu, 26 Jan 2012 18:25:37 +0100
+Subject: [PATCH 64/87] iommu/msm: Fix error handling in msm_iommu_unmap()
+
+commit 05df1f3c2afaef5672627f2b7095f0d4c4dbc3a0 upstream.
+
+Error handling in msm_iommu_unmap() is broken. On some error
+conditions retval is set to a non-zero value which causes
+the function to return 'len' at the end. This hides the
+error from the user. Zero should be returned in those error
+cases.
+
+Cc: David Brown <davidb@codeaurora.org>
+Cc: Stepan Moskovchenko <stepanm@codeaurora.org>
+Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
+Acked-by: David Brown <davidb@codeaurora.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/iommu/msm_iommu.c |    7 +------
+ 1 files changed, 1 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
+index 5865dd2..a4d134d 100644
+--- a/drivers/iommu/msm_iommu.c
++++ b/drivers/iommu/msm_iommu.c
+@@ -481,23 +481,19 @@ static int msm_iommu_unmap(struct iommu_domain *domain, unsigned long va,
+ 
+ 	priv = domain->priv;
+ 
+-	if (!priv) {
+-		ret = -ENODEV;
++	if (!priv)
+ 		goto fail;
+-	}
+ 
+ 	fl_table = priv->pgtable;
+ 
+ 	if (len != SZ_16M && len != SZ_1M &&
+ 	    len != SZ_64K && len != SZ_4K) {
+ 		pr_debug("Bad length: %d\n", len);
+-		ret = -EINVAL;
+ 		goto fail;
+ 	}
+ 
+ 	if (!fl_table) {
+ 		pr_debug("Null page table\n");
+-		ret = -EINVAL;
+ 		goto fail;
+ 	}
+ 
+@@ -506,7 +502,6 @@ static int msm_iommu_unmap(struct iommu_domain *domain, unsigned long va,
+ 
+ 	if (*fl_pte == 0) {
+ 		pr_debug("First level PTE is 0\n");
+-		ret = -ENODEV;
+ 		goto fail;
+ 	}
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0065-mm-compaction-check-for-overlapping-nodes-during-iso.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0065-mm-compaction-check-for-overlapping-nodes-during-iso.patch
new file mode 100644
index 0000000..1b7e90d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0065-mm-compaction-check-for-overlapping-nodes-during-iso.patch
@@ -0,0 +1,111 @@
+From a7d2576c858c397282602fe92adf8c8ac9d6a0e0 Mon Sep 17 00:00:00 2001
+From: Mel Gorman <mgorman@suse.de>
+Date: Wed, 8 Feb 2012 17:13:38 -0800
+Subject: [PATCH 65/87] mm: compaction: check for overlapping nodes during
+ isolation for migration
+
+commit dc9086004b3d5db75997a645b3fe08d9138b7ad0 upstream.
+
+When isolating pages for migration, migration starts at the start of a
+zone while the free scanner starts at the end of the zone.  Migration
+avoids entering a new zone by never going beyond the free scanned.
+
+Unfortunately, in very rare cases nodes can overlap.  When this happens,
+migration isolates pages without the LRU lock held, corrupting lists
+which will trigger errors in reclaim or during page free such as in the
+following oops
+
+  BUG: unable to handle kernel NULL pointer dereference at 0000000000000008
+  IP: [<ffffffff810f795c>] free_pcppages_bulk+0xcc/0x450
+  PGD 1dda554067 PUD 1e1cb58067 PMD 0
+  Oops: 0000 [#1] SMP
+  CPU 37
+  Pid: 17088, comm: memcg_process_s Tainted: G            X
+  RIP: free_pcppages_bulk+0xcc/0x450
+  Process memcg_process_s (pid: 17088, threadinfo ffff881c2926e000, task ffff881c2926c0c0)
+  Call Trace:
+    free_hot_cold_page+0x17e/0x1f0
+    __pagevec_free+0x90/0xb0
+    release_pages+0x22a/0x260
+    pagevec_lru_move_fn+0xf3/0x110
+    putback_lru_page+0x66/0xe0
+    unmap_and_move+0x156/0x180
+    migrate_pages+0x9e/0x1b0
+    compact_zone+0x1f3/0x2f0
+    compact_zone_order+0xa2/0xe0
+    try_to_compact_pages+0xdf/0x110
+    __alloc_pages_direct_compact+0xee/0x1c0
+    __alloc_pages_slowpath+0x370/0x830
+    __alloc_pages_nodemask+0x1b1/0x1c0
+    alloc_pages_vma+0x9b/0x160
+    do_huge_pmd_anonymous_page+0x160/0x270
+    do_page_fault+0x207/0x4c0
+    page_fault+0x25/0x30
+
+The "X" in the taint flag means that external modules were loaded but but
+is unrelated to the bug triggering.  The real problem was because the PFN
+layout looks like this
+
+  Zone PFN ranges:
+    DMA      0x00000010 -> 0x00001000
+    DMA32    0x00001000 -> 0x00100000
+    Normal   0x00100000 -> 0x01e80000
+  Movable zone start PFN for each node
+  early_node_map[14] active PFN ranges
+      0: 0x00000010 -> 0x0000009b
+      0: 0x00000100 -> 0x0007a1ec
+      0: 0x0007a354 -> 0x0007a379
+      0: 0x0007f7ff -> 0x0007f800
+      0: 0x00100000 -> 0x00680000
+      1: 0x00680000 -> 0x00e80000
+      0: 0x00e80000 -> 0x01080000
+      1: 0x01080000 -> 0x01280000
+      0: 0x01280000 -> 0x01480000
+      1: 0x01480000 -> 0x01680000
+      0: 0x01680000 -> 0x01880000
+      1: 0x01880000 -> 0x01a80000
+      0: 0x01a80000 -> 0x01c80000
+      1: 0x01c80000 -> 0x01e80000
+
+The fix is straight-forward.  isolate_migratepages() has to make a
+similar check to isolate_freepage to ensure that it never isolates pages
+from a zone it does not hold the LRU lock for.
+
+This was discovered in a 3.0-based kernel but it affects 3.1.x, 3.2.x
+and current mainline.
+
+Signed-off-by: Mel Gorman <mgorman@suse.de>
+Acked-by: Michal Nazarewicz <mina86@mina86.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/compaction.c |   11 ++++++++++-
+ 1 files changed, 10 insertions(+), 1 deletions(-)
+
+diff --git a/mm/compaction.c b/mm/compaction.c
+index edc1e26..8fb8a40 100644
+--- a/mm/compaction.c
++++ b/mm/compaction.c
+@@ -330,8 +330,17 @@ static isolate_migrate_t isolate_migratepages(struct zone *zone,
+ 			continue;
+ 		nr_scanned++;
+ 
+-		/* Get the page and skip if free */
++		/*
++		 * Get the page and ensure the page is within the same zone.
++		 * See the comment in isolate_freepages about overlapping
++		 * nodes. It is deliberate that the new zone lock is not taken
++		 * as memory compaction should not move pages between nodes.
++		 */
+ 		page = pfn_to_page(low_pfn);
++		if (page_zone(page) != zone)
++			continue;
++
++		/* Skip if free */
+ 		if (PageBuddy(page))
+ 			continue;
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0066-mm-fix-UP-THP-spin_is_locked-BUGs.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0066-mm-fix-UP-THP-spin_is_locked-BUGs.patch
new file mode 100644
index 0000000..42d3525
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0066-mm-fix-UP-THP-spin_is_locked-BUGs.patch
@@ -0,0 +1,63 @@
+From d0a77dc1abbe11f8d14a6cce8632d85ff79f3636 Mon Sep 17 00:00:00 2001
+From: Hugh Dickins <hughd@google.com>
+Date: Wed, 8 Feb 2012 17:13:40 -0800
+Subject: [PATCH 66/87] mm: fix UP THP spin_is_locked BUGs
+
+commit b9980cdcf2524c5fe15d8cbae9c97b3ed6385563 upstream.
+
+Fix CONFIG_TRANSPARENT_HUGEPAGE=y CONFIG_SMP=n CONFIG_DEBUG_VM=y
+CONFIG_DEBUG_SPINLOCK=n kernel: spin_is_locked() is then always false,
+and so triggers some BUGs in Transparent HugePage codepaths.
+
+asm-generic/bug.h mentions this problem, and provides a WARN_ON_SMP(x);
+but being too lazy to add VM_BUG_ON_SMP, BUG_ON_SMP, WARN_ON_SMP_ONCE,
+VM_WARN_ON_SMP_ONCE, just test NR_CPUS != 1 in the existing VM_BUG_ONs.
+
+Signed-off-by: Hugh Dickins <hughd@google.com>
+Cc: Andrea Arcangeli <aarcange@redhat.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ mm/huge_memory.c |    4 ++--
+ mm/swap.c        |    2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/mm/huge_memory.c b/mm/huge_memory.c
+index 36b3d98..33141f5 100644
+--- a/mm/huge_memory.c
++++ b/mm/huge_memory.c
+@@ -2064,7 +2064,7 @@ static void collect_mm_slot(struct mm_slot *mm_slot)
+ {
+ 	struct mm_struct *mm = mm_slot->mm;
+ 
+-	VM_BUG_ON(!spin_is_locked(&khugepaged_mm_lock));
++	VM_BUG_ON(NR_CPUS != 1 && !spin_is_locked(&khugepaged_mm_lock));
+ 
+ 	if (khugepaged_test_exit(mm)) {
+ 		/* free mm_slot */
+@@ -2094,7 +2094,7 @@ static unsigned int khugepaged_scan_mm_slot(unsigned int pages,
+ 	int progress = 0;
+ 
+ 	VM_BUG_ON(!pages);
+-	VM_BUG_ON(!spin_is_locked(&khugepaged_mm_lock));
++	VM_BUG_ON(NR_CPUS != 1 && !spin_is_locked(&khugepaged_mm_lock));
+ 
+ 	if (khugepaged_scan.mm_slot)
+ 		mm_slot = khugepaged_scan.mm_slot;
+diff --git a/mm/swap.c b/mm/swap.c
+index a91caf7..55b266d 100644
+--- a/mm/swap.c
++++ b/mm/swap.c
+@@ -667,7 +667,7 @@ void lru_add_page_tail(struct zone* zone,
+ 	VM_BUG_ON(!PageHead(page));
+ 	VM_BUG_ON(PageCompound(page_tail));
+ 	VM_BUG_ON(PageLRU(page_tail));
+-	VM_BUG_ON(!spin_is_locked(&zone->lru_lock));
++	VM_BUG_ON(NR_CPUS != 1 && !spin_is_locked(&zone->lru_lock));
+ 
+ 	SetPageLRU(page_tail);
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0067-target-Use-correct-preempted-registration-sense-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0067-target-Use-correct-preempted-registration-sense-code.patch
new file mode 100644
index 0000000..73d2839
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0067-target-Use-correct-preempted-registration-sense-code.patch
@@ -0,0 +1,59 @@
+From 1c7a78d3cf820992a6a67ea90423713fb429907f Mon Sep 17 00:00:00 2001
+From: Marco Sanvido <marco@purestorage.com>
+Date: Tue, 3 Jan 2012 17:12:57 -0800
+Subject: [PATCH 67/87] target: Use correct preempted registration sense code
+
+commit 9e08e34e3735ae057eb3834da3570995811b7eb9 upstream.
+
+The comments quote the right parts of the spec:
+
+   * d) Establish a unit attention condition for the
+   *    initiator port associated with every I_T nexus
+   *    that lost its registration other than the I_T
+   *    nexus on which the PERSISTENT RESERVE OUT command
+   *    was received, with the additional sense code set
+   *    to REGISTRATIONS PREEMPTED.
+
+and
+
+   * e) Establish a unit attention condition for the initiator
+   *    port associated with every I_T nexus that lost its
+   *    persistent reservation and/or registration, with the
+   *    additional sense code set to REGISTRATIONS PREEMPTED;
+
+but the actual code accidentally uses ASCQ_2AH_RESERVATIONS_PREEMPTED
+instead of ASCQ_2AH_REGISTRATIONS_PREEMPTED.  Fix this.
+
+Signed-off-by: Marco Sanvido <marco@purestorage.com>
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_pr.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core_pr.c
+index 95dee70..4911fe9 100644
+--- a/drivers/target/target_core_pr.c
++++ b/drivers/target/target_core_pr.c
+@@ -3138,7 +3138,7 @@ static int core_scsi3_pro_preempt(
+ 			if (!calling_it_nexus)
+ 				core_scsi3_ua_allocate(pr_reg_nacl,
+ 					pr_res_mapped_lun, 0x2A,
+-					ASCQ_2AH_RESERVATIONS_PREEMPTED);
++					ASCQ_2AH_REGISTRATIONS_PREEMPTED);
+ 		}
+ 		spin_unlock(&pr_tmpl->registration_lock);
+ 		/*
+@@ -3251,7 +3251,7 @@ static int core_scsi3_pro_preempt(
+ 		 *    additional sense code set to REGISTRATIONS PREEMPTED;
+ 		 */
+ 		core_scsi3_ua_allocate(pr_reg_nacl, pr_res_mapped_lun, 0x2A,
+-				ASCQ_2AH_RESERVATIONS_PREEMPTED);
++				ASCQ_2AH_REGISTRATIONS_PREEMPTED);
+ 	}
+ 	spin_unlock(&pr_tmpl->registration_lock);
+ 	/*
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0068-target-Allow-PERSISTENT-RESERVE-IN-for-non-reservati.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0068-target-Allow-PERSISTENT-RESERVE-IN-for-non-reservati.patch
new file mode 100644
index 0000000..83fcdfb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0068-target-Allow-PERSISTENT-RESERVE-IN-for-non-reservati.patch
@@ -0,0 +1,35 @@
+From 1348bc5266eb73206b11e675656051201f28949b Mon Sep 17 00:00:00 2001
+From: Marco Sanvido <marco@purestorage.com>
+Date: Tue, 3 Jan 2012 17:12:58 -0800
+Subject: [PATCH 68/87] target: Allow PERSISTENT RESERVE IN for
+ non-reservation holder
+
+commit 6816966a8418b980481b4dced7eddd1796b145e8 upstream.
+
+Initiators that aren't the active reservation holder should be able to
+do a PERSISTENT RESERVE IN command in all cases, so add it to the list
+of allowed CDBs in core_scsi3_pr_seq_non_holder().
+
+Signed-off-by: Marco Sanvido <marco@purestorage.com>
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_pr.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core_pr.c
+index 4911fe9..9119d92 100644
+--- a/drivers/target/target_core_pr.c
++++ b/drivers/target/target_core_pr.c
+@@ -481,6 +481,7 @@ static int core_scsi3_pr_seq_non_holder(
+ 	case READ_MEDIA_SERIAL_NUMBER:
+ 	case REPORT_LUNS:
+ 	case REQUEST_SENSE:
++	case PERSISTENT_RESERVE_IN:
+ 		ret = 0; /*/ Allowed CDBs */
+ 		break;
+ 	default:
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0069-target-Correct-sense-key-for-INVALID-FIELD-IN-PARAME.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0069-target-Correct-sense-key-for-INVALID-FIELD-IN-PARAME.patch
new file mode 100644
index 0000000..dbbc827
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0069-target-Correct-sense-key-for-INVALID-FIELD-IN-PARAME.patch
@@ -0,0 +1,69 @@
+From f4d055fceeb62aca2303fe076d17005a662690a3 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Mon, 9 Jan 2012 17:54:00 -0800
+Subject: [PATCH 69/87] target: Correct sense key for INVALID FIELD IN
+ {PARAMETER LIST,CDB}
+
+commit 9fbc8909876a2160044e71d376848973b9bfdc3f upstream.
+
+According to SPC-4, the sense key for commands that are failed with
+INVALID FIELD IN PARAMETER LIST and INVALID FIELD IN CDB should be
+ILLEGAL REQUEST (5h) rather than ABORTED COMMAND (Bh).  Without this
+patch, a tcm_loop LUN incorrectly gives:
+
+    # sg_raw -r 1 -v /dev/sda 3 1 0 0 ff 0
+    Sense Information:
+     Fixed format, current;  Sense key: Aborted Command
+     Additional sense: Invalid field in cdb
+     Raw sense data (in hex):
+            70 00 0b 00 00 00 00 0a  00 00 00 00 24 00 00 00
+            00 00
+
+While a real SCSI disk gives:
+
+    Sense Information:
+     Fixed format, current;  Sense key: Illegal Request
+     Additional sense: Invalid field in cdb
+     Raw sense data (in hex):
+            70 00 05 00 00 00 00 18  00 00 00 00 24 00 00 00
+            00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00
+
+with the main point being that the real disk gives a sense key of
+ILLEGAL REQUEST (5h).
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_transport.c |    8 ++++----
+ 1 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
+index e87d0eb..4f99d4c 100644
+--- a/drivers/target/target_core_transport.c
++++ b/drivers/target/target_core_transport.c
+@@ -4403,8 +4403,8 @@ int transport_send_check_condition_and_sense(
+ 		/* CURRENT ERROR */
+ 		buffer[offset] = 0x70;
+ 		buffer[offset+SPC_ADD_SENSE_LEN_OFFSET] = 10;
+-		/* ABORTED COMMAND */
+-		buffer[offset+SPC_SENSE_KEY_OFFSET] = ABORTED_COMMAND;
++		/* ILLEGAL REQUEST */
++		buffer[offset+SPC_SENSE_KEY_OFFSET] = ILLEGAL_REQUEST;
+ 		/* INVALID FIELD IN CDB */
+ 		buffer[offset+SPC_ASC_KEY_OFFSET] = 0x24;
+ 		break;
+@@ -4412,8 +4412,8 @@ int transport_send_check_condition_and_sense(
+ 		/* CURRENT ERROR */
+ 		buffer[offset] = 0x70;
+ 		buffer[offset+SPC_ADD_SENSE_LEN_OFFSET] = 10;
+-		/* ABORTED COMMAND */
+-		buffer[offset+SPC_SENSE_KEY_OFFSET] = ABORTED_COMMAND;
++		/* ILLEGAL REQUEST */
++		buffer[offset+SPC_SENSE_KEY_OFFSET] = ILLEGAL_REQUEST;
+ 		/* INVALID FIELD IN PARAMETER LIST */
+ 		buffer[offset+SPC_ASC_KEY_OFFSET] = 0x26;
+ 		break;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0070-target-Add-workaround-for-zero-length-control-CDB-ha.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0070-target-Add-workaround-for-zero-length-control-CDB-ha.patch
new file mode 100644
index 0000000..5eabdb9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0070-target-Add-workaround-for-zero-length-control-CDB-ha.patch
@@ -0,0 +1,62 @@
+From f467de45d956d46c692fd6a2331f296e9e872aba Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Fri, 13 Jan 2012 12:01:34 -0800
+Subject: [PATCH 70/87] target: Add workaround for zero-length control CDB
+ handling
+
+commit 91ec1d3535b2acf12c599045cc19ad9be3c6a47b upstream.
+
+This patch adds a work-around for handling zero allocation length
+control CDBs (type SCF_SCSI_CONTROL_SG_IO_CDB) that was causing an
+OOPs with the following raw calls:
+
+   # sg_raw -v /dev/sdd 3 0 0 0 0 0
+   # sg_raw -v /dev/sdd 0x1a 0 1 0 0 0
+
+This patch will follow existing zero-length handling for data I/O
+and silently return with GOOD status.  This addresses the zero length
+issue, but the proper long-term resolution for handling arbitary
+allocation lengths will be to refactor out data-phase handling in
+individual CDB emulation logic within target_core_cdb.c
+
+Reported-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_transport.c |   13 +++++++++++++
+ 1 files changed, 13 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
+index 4f99d4c..861628e 100644
+--- a/drivers/target/target_core_transport.c
++++ b/drivers/target/target_core_transport.c
+@@ -3701,6 +3701,11 @@ transport_allocate_control_task(struct se_cmd *cmd)
+ 	struct se_task *task;
+ 	unsigned long flags;
+ 
++	/* Workaround for handling zero-length control CDBs */
++	if ((cmd->se_cmd_flags & SCF_SCSI_CONTROL_SG_IO_CDB) &&
++	    !cmd->data_length)
++		return 0;
++
+ 	task = transport_generic_get_task(cmd, cmd->data_direction);
+ 	if (!task)
+ 		return -ENOMEM;
+@@ -3772,6 +3777,14 @@ int transport_generic_new_cmd(struct se_cmd *cmd)
+ 	else if (!task_cdbs && (cmd->se_cmd_flags & SCF_SCSI_DATA_SG_IO_CDB)) {
+ 		cmd->t_state = TRANSPORT_COMPLETE;
+ 		atomic_set(&cmd->t_transport_active, 1);
++
++		if (cmd->t_task_cdb[0] == REQUEST_SENSE) {
++			u8 ua_asc = 0, ua_ascq = 0;
++
++			core_scsi3_ua_clear_for_request_sense(cmd,
++					&ua_asc, &ua_ascq);
++		}
++
+ 		INIT_WORK(&cmd->work, target_complete_ok_work);
+ 		queue_work(target_completion_wq, &cmd->work);
+ 		return 0;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0071-target-Return-correct-ASC-for-unimplemented-VPD-page.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0071-target-Return-correct-ASC-for-unimplemented-VPD-page.patch
new file mode 100644
index 0000000..3f9aff2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0071-target-Return-correct-ASC-for-unimplemented-VPD-page.patch
@@ -0,0 +1,37 @@
+From 0e14d6b67d73aba29df97b9619e97e249a882cbe Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Tue, 17 Jan 2012 18:00:56 -0800
+Subject: [PATCH 71/87] target: Return correct ASC for unimplemented VPD pages
+
+commit bb1acb2ee038a6c13ee99e0b9fb44dacb4a9de84 upstream.
+
+My draft of SPC-4 says:
+
+    If the device server does not implement the requested vital product
+    data page, then the command shall be terminated with CHECK CONDITION
+    status, with the sense key set to ILLEGAL REQUEST, and the
+    additional sense code set to INVALID FIELD IN CDB.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_cdb.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 2e8c1be..24991f3 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -732,7 +732,7 @@ int target_emulate_inquiry(struct se_task *task)
+ 	}
+ 
+ 	pr_err("Unknown VPD Code: 0x%02x\n", cdb[2]);
+-	cmd->scsi_sense_reason = TCM_UNSUPPORTED_SCSI_OPCODE;
++	cmd->scsi_sense_reason = TCM_INVALID_CDB_FIELD;
+ 	ret = -EINVAL;
+ 
+ out_unmap:
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0072-target-Fail-INQUIRY-commands-with-EVPD-0-but-PAGE-CO.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0072-target-Fail-INQUIRY-commands-with-EVPD-0-but-PAGE-CO.patch
new file mode 100644
index 0000000..cd102df
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0072-target-Fail-INQUIRY-commands-with-EVPD-0-but-PAGE-CO.patch
@@ -0,0 +1,43 @@
+From 95db7f1f8dee58ba87842ecd5b93e7c2884e0637 Mon Sep 17 00:00:00 2001
+From: Roland Dreier <roland@purestorage.com>
+Date: Tue, 17 Jan 2012 18:00:57 -0800
+Subject: [PATCH 72/87] target: Fail INQUIRY commands with EVPD==0 but PAGE
+ CODE!=0
+
+commit bf0053550aebe56f3bb5dd793e9de69238b5b945 upstream.
+
+My draft of SPC-4 says:
+
+    If the PAGE CODE field is not set to zero when the EVPD bit is set
+    to zero, the command shall be terminated with CHECK CONDITION
+    status, with the sense key set to ILLEGAL REQUEST, and the
+    additional sense code set to INVALID FIELD IN CDB.
+
+Signed-off-by: Roland Dreier <roland@purestorage.com>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_cdb.c |    7 +++++++
+ 1 files changed, 7 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/target/target_core_cdb.c b/drivers/target/target_core_cdb.c
+index 24991f3..251e48f 100644
+--- a/drivers/target/target_core_cdb.c
++++ b/drivers/target/target_core_cdb.c
+@@ -701,6 +701,13 @@ int target_emulate_inquiry(struct se_task *task)
+ 	int p, ret;
+ 
+ 	if (!(cdb[1] & 0x1)) {
++		if (cdb[2]) {
++			pr_err("INQUIRY with EVPD==0 but PAGE CODE=%02x\n",
++			       cdb[2]);
++			cmd->scsi_sense_reason = TCM_INVALID_CDB_FIELD;
++			return -EINVAL;
++		}
++
+ 		ret = target_emulate_inquiry_std(cmd);
+ 		goto out;
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0073-Staging-asus_oled-fix-image-processing.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0073-Staging-asus_oled-fix-image-processing.patch
new file mode 100644
index 0000000..d6490da
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0073-Staging-asus_oled-fix-image-processing.patch
@@ -0,0 +1,59 @@
+From d352f16e64cab162bb25e4f6af298f1a9d1d9e12 Mon Sep 17 00:00:00 2001
+From: Pekka Paalanen <pq@iki.fi>
+Date: Sun, 22 Jan 2012 16:33:46 +0200
+Subject: [PATCH 73/87] Staging: asus_oled: fix image processing
+
+commit 635032cb397b396241372fa0ff36ae758e658b23 upstream.
+
+Programming an image was broken, because odev->buf_offs was not advanced
+for val == 0 in append_values(). This regression was introduced in:
+
+ commit 1ff12a4aa354bed093a0240d5e6347b1e27601bc
+ Author: Kevin A. Granade <kevin.granade@gmail.com>
+ Date:   Sat Sep 5 01:03:39 2009 -0500
+
+     Staging: asus_oled: Cleaned up checkpatch issues.
+
+Fix the image processing by special-casing val == 0.
+
+I have tested this change on an Asus G50V laptop only.
+
+Cc: Jakub Schmidtke <sjakub@gmail.com>
+Cc: Kevin A. Granade <kevin.granade@gmail.com>
+Signed-off-by: Pekka Paalanen <pq@iki.fi>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/asus_oled/asus_oled.c |   10 ++++++++--
+ 1 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/staging/asus_oled/asus_oled.c b/drivers/staging/asus_oled/asus_oled.c
+index 7bb7da7..8894bd5 100644
+--- a/drivers/staging/asus_oled/asus_oled.c
++++ b/drivers/staging/asus_oled/asus_oled.c
+@@ -355,7 +355,14 @@ static void send_data(struct asus_oled_dev *odev)
+ 
+ static int append_values(struct asus_oled_dev *odev, uint8_t val, size_t count)
+ {
+-	while (count-- > 0 && val) {
++	odev->last_val = val;
++
++	if (val == 0) {
++		odev->buf_offs += count;
++		return 0;
++	}
++
++	while (count-- > 0) {
+ 		size_t x = odev->buf_offs % odev->width;
+ 		size_t y = odev->buf_offs / odev->width;
+ 		size_t i;
+@@ -406,7 +413,6 @@ static int append_values(struct asus_oled_dev *odev, uint8_t val, size_t count)
+ 			;
+ 		}
+ 
+-		odev->last_val = val;
+ 		odev->buf_offs++;
+ 	}
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0074-Staging-asus_oled-fix-NULL-ptr-crash-on-unloading.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0074-Staging-asus_oled-fix-NULL-ptr-crash-on-unloading.patch
new file mode 100644
index 0000000..43ee220
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0074-Staging-asus_oled-fix-NULL-ptr-crash-on-unloading.patch
@@ -0,0 +1,59 @@
+From ebb468b38e343782b3271343766d92978f8436a7 Mon Sep 17 00:00:00 2001
+From: Pekka Paalanen <pq@iki.fi>
+Date: Sun, 22 Jan 2012 16:33:47 +0200
+Subject: [PATCH 74/87] Staging: asus_oled: fix NULL-ptr crash on unloading
+
+commit 3589e74595a4332ebf77b5ed006f3c6686071ecd upstream.
+
+Asus_oled triggers the following bug on module unloading:
+
+ usbcore: deregistering interface driver asus-oled
+ BUG: unable to handle kernel NULL pointer dereference at 0000000000000038
+ IP: [<ffffffff8111292b>] sysfs_delete_link+0x30/0x66
+
+ Call Trace:
+  [<ffffffff81225373>] device_remove_class_symlinks+0x6b/0x70
+  [<ffffffff812256a8>] device_del+0x9f/0x1ab
+  [<ffffffff812257c5>] device_unregister+0x11/0x1e
+  [<ffffffffa000cb82>] asus_oled_disconnect+0x4f/0x9e [asus_oled]
+  [<ffffffff81277430>] usb_unbind_interface+0x54/0x103
+  [<ffffffff812276c4>] __device_release_driver+0xa2/0xeb
+  [<ffffffff81227794>] driver_detach+0x87/0xad
+  [<ffffffff812269e9>] bus_remove_driver+0x91/0xc1
+  [<ffffffff81227fb4>] driver_unregister+0x66/0x6e
+  [<ffffffff812771ed>] usb_deregister+0xbb/0xc4
+  [<ffffffffa000ce87>] asus_oled_exit+0x2f/0x31 [asus_oled]
+  [<ffffffff81068365>] sys_delete_module+0x1b8/0x21b
+  [<ffffffff810ae3de>] ? do_munmap+0x2ef/0x313
+  [<ffffffff813699bb>] system_call_fastpath+0x16/0x1b
+
+This is due to an incorrect destruction sequence in asus_oled_exit().
+
+Fix the order, fixes the bug. Tested on an Asus G50V laptop only.
+
+Cc: Jakub Schmidtke <sjakub@gmail.com>
+Signed-off-by: Pekka Paalanen <pq@iki.fi>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/asus_oled/asus_oled.c |    3 +--
+ 1 files changed, 1 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/staging/asus_oled/asus_oled.c b/drivers/staging/asus_oled/asus_oled.c
+index 8894bd5..63bafbb 100644
+--- a/drivers/staging/asus_oled/asus_oled.c
++++ b/drivers/staging/asus_oled/asus_oled.c
+@@ -811,10 +811,9 @@ error:
+ 
+ static void __exit asus_oled_exit(void)
+ {
++	usb_deregister(&oled_driver);
+ 	class_remove_file(oled_class, &class_attr_version.attr);
+ 	class_destroy(oled_class);
+-
+-	usb_deregister(&oled_driver);
+ }
+ 
+ module_init(asus_oled_init);
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0075-staging-r8712u-Add-new-Sitecom-UsB-ID.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0075-staging-r8712u-Add-new-Sitecom-UsB-ID.patch
new file mode 100644
index 0000000..67a862d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0075-staging-r8712u-Add-new-Sitecom-UsB-ID.patch
@@ -0,0 +1,32 @@
+From 1cbce5d4added4defb84dc19acab3efc86b1e979 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Sat, 7 Jan 2012 10:07:03 -0600
+Subject: [PATCH 75/87] staging: r8712u: Add new Sitecom UsB ID
+
+commit 1793bf1deddc8ce25dc41925d5dbe64536c841b6 upstream.
+
+Add USB ID for SITECOM WLA-1000 V1 001 WLAN
+
+Reported-and-tested-by: Roland Gruber <post@rolandgruber.de>
+Reported-and-tested-by: Dario Lucia <dario.lucia@gmail.com>
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/rtl8712/usb_intf.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
+index 5385da2..8de0c80 100644
+--- a/drivers/staging/rtl8712/usb_intf.c
++++ b/drivers/staging/rtl8712/usb_intf.c
+@@ -89,6 +89,7 @@ static struct usb_device_id rtl871x_usb_id_tbl[] = {
+ 	{USB_DEVICE(0x0DF6, 0x0045)},
+ 	{USB_DEVICE(0x0DF6, 0x0059)}, /* 11n mode disable */
+ 	{USB_DEVICE(0x0DF6, 0x004B)},
++	{USB_DEVICE(0x0DF6, 0x005B)},
+ 	{USB_DEVICE(0x0DF6, 0x005D)},
+ 	{USB_DEVICE(0x0DF6, 0x0063)},
+ 	/* Sweex */
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0076-staging-r8712u-Use-asynchronous-firmware-loading.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0076-staging-r8712u-Use-asynchronous-firmware-loading.patch
new file mode 100644
index 0000000..7cfd04b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0076-staging-r8712u-Use-asynchronous-firmware-loading.patch
@@ -0,0 +1,285 @@
+From bc5d453eab4506cb52397db8830d1070904265a4 Mon Sep 17 00:00:00 2001
+From: Larry Finger <Larry.Finger@lwfinger.net>
+Date: Sun, 5 Feb 2012 21:12:26 -0600
+Subject: [PATCH 76/87] staging: r8712u: Use asynchronous firmware loading
+
+commit 8c213fa59199f9673d66970d6940fa093186642f upstream.
+
+In https://bugs.archlinux.org/task/27996, failure of driver r8712u is
+reported, with a timeout during module loading due to synchronous loading
+of the firmware. The code now uses request_firmware_nowait().
+
+Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/rtl8712/drv_types.h   |    7 ++++
+ drivers/staging/rtl8712/hal_init.c    |   62 +++++++++++++++++++++++----------
+ drivers/staging/rtl8712/os_intfs.c    |   14 ++++++--
+ drivers/staging/rtl8712/rtl8712_hal.h |    1 +
+ drivers/staging/rtl8712/usb_intf.c    |    9 +++--
+ 5 files changed, 68 insertions(+), 25 deletions(-)
+
+diff --git a/drivers/staging/rtl8712/drv_types.h b/drivers/staging/rtl8712/drv_types.h
+index 9b5d771..ed85b44 100644
+--- a/drivers/staging/rtl8712/drv_types.h
++++ b/drivers/staging/rtl8712/drv_types.h
+@@ -37,6 +37,8 @@ struct _adapter;
+ #include "wlan_bssdef.h"
+ #include "rtl8712_spec.h"
+ #include "rtl8712_hal.h"
++#include <linux/mutex.h>
++#include <linux/completion.h>
+ 
+ enum _NIC_VERSION {
+ 	RTL8711_NIC,
+@@ -168,6 +170,7 @@ struct _adapter {
+ 	s32	bSurpriseRemoved;
+ 	u32	IsrContent;
+ 	u32	ImrContent;
++	bool	fw_found;
+ 	u8	EepromAddressSize;
+ 	u8	hw_init_completed;
+ 	struct task_struct *cmdThread;
+@@ -184,6 +187,10 @@ struct _adapter {
+ 	_workitem wkFilterRxFF0;
+ 	u8 blnEnableRxFF0Filter;
+ 	spinlock_t lockRxFF0Filter;
++	const struct firmware *fw;
++	struct usb_interface *pusb_intf;
++	struct mutex mutex_start;
++	struct completion rtl8712_fw_ready;
+ };
+ 
+ static inline u8 *myid(struct eeprom_priv *peepriv)
+diff --git a/drivers/staging/rtl8712/hal_init.c b/drivers/staging/rtl8712/hal_init.c
+index d0029aa..cc893c0 100644
+--- a/drivers/staging/rtl8712/hal_init.c
++++ b/drivers/staging/rtl8712/hal_init.c
+@@ -42,29 +42,56 @@
+ #define FWBUFF_ALIGN_SZ 512
+ #define MAX_DUMP_FWSZ	49152 /*default = 49152 (48k)*/
+ 
+-static u32 rtl871x_open_fw(struct _adapter *padapter, void **pphfwfile_hdl,
+-		    const u8 **ppmappedfw)
++static void rtl871x_load_fw_cb(const struct firmware *firmware, void *context)
+ {
++	struct _adapter *padapter = context;
++
++	complete(&padapter->rtl8712_fw_ready);
++	if (!firmware) {
++		struct usb_device *udev = padapter->dvobjpriv.pusbdev;
++		struct usb_interface *pusb_intf = padapter->pusb_intf;
++		printk(KERN_ERR "r8712u: Firmware request failed\n");
++		padapter->fw_found = false;
++		usb_put_dev(udev);
++		usb_set_intfdata(pusb_intf, NULL);
++		return;
++	}
++	padapter->fw = firmware;
++	padapter->fw_found = true;
++	/* firmware available - start netdev */
++	register_netdev(padapter->pnetdev);
++}
++
++static const char firmware_file[] = "rtlwifi/rtl8712u.bin";
++
++int rtl871x_load_fw(struct _adapter *padapter)
++{
++	struct device *dev = &padapter->dvobjpriv.pusbdev->dev;
+ 	int rc;
+-	const char firmware_file[] = "rtlwifi/rtl8712u.bin";
+-	const struct firmware **praw = (const struct firmware **)
+-				       (pphfwfile_hdl);
+-	struct dvobj_priv *pdvobjpriv = (struct dvobj_priv *)
+-					(&padapter->dvobjpriv);
+-	struct usb_device *pusbdev = pdvobjpriv->pusbdev;
+ 
++	init_completion(&padapter->rtl8712_fw_ready);
+ 	printk(KERN_INFO "r8712u: Loading firmware from \"%s\"\n",
+ 	       firmware_file);
+-	rc = request_firmware(praw, firmware_file, &pusbdev->dev);
+-	if (rc < 0) {
+-		printk(KERN_ERR "r8712u: Unable to load firmware\n");
+-		printk(KERN_ERR "r8712u: Install latest linux-firmware\n");
++	rc = request_firmware_nowait(THIS_MODULE, 1, firmware_file, dev,
++				     GFP_KERNEL, padapter, rtl871x_load_fw_cb);
++	if (rc)
++		printk(KERN_ERR "r8712u: Firmware request error %d\n", rc);
++	return rc;
++}
++MODULE_FIRMWARE("rtlwifi/rtl8712u.bin");
++
++static u32 rtl871x_open_fw(struct _adapter *padapter, const u8 **ppmappedfw)
++{
++	const struct firmware **praw = &padapter->fw;
++
++	if (padapter->fw->size > 200000) {
++		printk(KERN_ERR "r8172u: Badfw->size of %d\n",
++		       (int)padapter->fw->size);
+ 		return 0;
+ 	}
+ 	*ppmappedfw = (u8 *)((*praw)->data);
+ 	return (*praw)->size;
+ }
+-MODULE_FIRMWARE("rtlwifi/rtl8712u.bin");
+ 
+ static void fill_fwpriv(struct _adapter *padapter, struct fw_priv *pfwpriv)
+ {
+@@ -142,18 +169,17 @@ static u8 rtl8712_dl_fw(struct _adapter *padapter)
+ 	uint dump_imem_sz, imem_sz, dump_emem_sz, emem_sz; /* max = 49152; */
+ 	struct fw_hdr fwhdr;
+ 	u32 ulfilelength;	/* FW file size */
+-	void *phfwfile_hdl = NULL;
+ 	const u8 *pmappedfw = NULL;
+ 	u8 *ptmpchar = NULL, *ppayload, *ptr;
+ 	struct tx_desc *ptx_desc;
+ 	u32 txdscp_sz = sizeof(struct tx_desc);
+ 	u8 ret = _FAIL;
+ 
+-	ulfilelength = rtl871x_open_fw(padapter, &phfwfile_hdl, &pmappedfw);
++	ulfilelength = rtl871x_open_fw(padapter, &pmappedfw);
+ 	if (pmappedfw && (ulfilelength > 0)) {
+ 		update_fwhdr(&fwhdr, pmappedfw);
+ 		if (chk_fwhdr(&fwhdr, ulfilelength) == _FAIL)
+-			goto firmware_rel;
++			return ret;
+ 		fill_fwpriv(padapter, &fwhdr.fwpriv);
+ 		/* firmware check ok */
+ 		maxlen = (fwhdr.img_IMEM_size > fwhdr.img_SRAM_size) ?
+@@ -161,7 +187,7 @@ static u8 rtl8712_dl_fw(struct _adapter *padapter)
+ 		maxlen += txdscp_sz;
+ 		ptmpchar = _malloc(maxlen + FWBUFF_ALIGN_SZ);
+ 		if (ptmpchar == NULL)
+-			goto firmware_rel;
++			return ret;
+ 
+ 		ptx_desc = (struct tx_desc *)(ptmpchar + FWBUFF_ALIGN_SZ -
+ 			    ((addr_t)(ptmpchar) & (FWBUFF_ALIGN_SZ - 1)));
+@@ -297,8 +323,6 @@ static u8 rtl8712_dl_fw(struct _adapter *padapter)
+ 
+ exit_fail:
+ 	kfree(ptmpchar);
+-firmware_rel:
+-	release_firmware((struct firmware *)phfwfile_hdl);
+ 	return ret;
+ }
+ 
+diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
+index 9a75c6d..98a3d68 100644
+--- a/drivers/staging/rtl8712/os_intfs.c
++++ b/drivers/staging/rtl8712/os_intfs.c
+@@ -31,6 +31,7 @@
+ #include <linux/module.h>
+ #include <linux/init.h>
+ #include <linux/kthread.h>
++#include <linux/firmware.h>
+ #include "osdep_service.h"
+ #include "drv_types.h"
+ #include "xmit_osdep.h"
+@@ -264,12 +265,12 @@ static void start_drv_timers(struct _adapter *padapter)
+ void r8712_stop_drv_timers(struct _adapter *padapter)
+ {
+ 	_cancel_timer_ex(&padapter->mlmepriv.assoc_timer);
+-	_cancel_timer_ex(&padapter->mlmepriv.sitesurveyctrl.
+-			 sitesurvey_ctrl_timer);
+ 	_cancel_timer_ex(&padapter->securitypriv.tkip_timer);
+ 	_cancel_timer_ex(&padapter->mlmepriv.scan_to_timer);
+ 	_cancel_timer_ex(&padapter->mlmepriv.dhcp_timer);
+ 	_cancel_timer_ex(&padapter->mlmepriv.wdg_timer);
++	_cancel_timer_ex(&padapter->mlmepriv.sitesurveyctrl.
++			 sitesurvey_ctrl_timer);
+ }
+ 
+ static u8 init_default_value(struct _adapter *padapter)
+@@ -347,7 +348,8 @@ u8 r8712_free_drv_sw(struct _adapter *padapter)
+ 	r8712_free_mlme_priv(&padapter->mlmepriv);
+ 	r8712_free_io_queue(padapter);
+ 	_free_xmit_priv(&padapter->xmitpriv);
+-	_r8712_free_sta_priv(&padapter->stapriv);
++	if (padapter->fw_found)
++		_r8712_free_sta_priv(&padapter->stapriv);
+ 	_r8712_free_recv_priv(&padapter->recvpriv);
+ 	mp871xdeinit(padapter);
+ 	if (pnetdev)
+@@ -388,6 +390,7 @@ static int netdev_open(struct net_device *pnetdev)
+ {
+ 	struct _adapter *padapter = (struct _adapter *)netdev_priv(pnetdev);
+ 
++	mutex_lock(&padapter->mutex_start);
+ 	if (padapter->bup == false) {
+ 		padapter->bDriverStopped = false;
+ 		padapter->bSurpriseRemoved = false;
+@@ -435,11 +438,13 @@ static int netdev_open(struct net_device *pnetdev)
+ 	/* start driver mlme relation timer */
+ 	start_drv_timers(padapter);
+ 	padapter->ledpriv.LedControlHandler(padapter, LED_CTL_NO_LINK);
++	mutex_unlock(&padapter->mutex_start);
+ 	return 0;
+ netdev_open_error:
+ 	padapter->bup = false;
+ 	netif_carrier_off(pnetdev);
+ 	netif_stop_queue(pnetdev);
++	mutex_unlock(&padapter->mutex_start);
+ 	return -1;
+ }
+ 
+@@ -473,6 +478,9 @@ static int netdev_close(struct net_device *pnetdev)
+ 	r8712_free_network_queue(padapter);
+ 	/* The interface is no longer Up: */
+ 	padapter->bup = false;
++	release_firmware(padapter->fw);
++	/* never exit with a firmware callback pending */
++	wait_for_completion(&padapter->rtl8712_fw_ready);
+ 	return 0;
+ }
+ 
+diff --git a/drivers/staging/rtl8712/rtl8712_hal.h b/drivers/staging/rtl8712/rtl8712_hal.h
+index 665e718..d19865a 100644
+--- a/drivers/staging/rtl8712/rtl8712_hal.h
++++ b/drivers/staging/rtl8712/rtl8712_hal.h
+@@ -145,5 +145,6 @@ struct hal_priv {
+ };
+ 
+ uint	 rtl8712_hal_init(struct _adapter *padapter);
++int rtl871x_load_fw(struct _adapter *padapter);
+ 
+ #endif
+diff --git a/drivers/staging/rtl8712/usb_intf.c b/drivers/staging/rtl8712/usb_intf.c
+index 8de0c80..9bade18 100644
+--- a/drivers/staging/rtl8712/usb_intf.c
++++ b/drivers/staging/rtl8712/usb_intf.c
+@@ -390,6 +390,7 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
+ 	pdvobjpriv = &padapter->dvobjpriv;
+ 	pdvobjpriv->padapter = padapter;
+ 	padapter->dvobjpriv.pusbdev = udev;
++	padapter->pusb_intf = pusb_intf;
+ 	usb_set_intfdata(pusb_intf, pnetdev);
+ 	SET_NETDEV_DEV(pnetdev, &pusb_intf->dev);
+ 	/* step 2. */
+@@ -596,10 +597,11 @@ static int r871xu_drv_init(struct usb_interface *pusb_intf,
+ 			       "%pM\n", mac);
+ 		memcpy(pnetdev->dev_addr, mac, ETH_ALEN);
+ 	}
+-	/* step 6. Tell the network stack we exist */
+-	if (register_netdev(pnetdev) != 0)
++	/* step 6. Load the firmware asynchronously */
++	if (rtl871x_load_fw(padapter))
+ 		goto error;
+ 	spin_lock_init(&padapter->lockRxFF0Filter);
++	mutex_init(&padapter->mutex_start);
+ 	return 0;
+ error:
+ 	usb_put_dev(udev);
+@@ -630,7 +632,8 @@ static void r871xu_dev_remove(struct usb_interface *pusb_intf)
+ 		flush_scheduled_work();
+ 		udelay(1);
+ 		/*Stop driver mlme relation timer */
+-		r8712_stop_drv_timers(padapter);
++		if (padapter->fw_found)
++			r8712_stop_drv_timers(padapter);
+ 		r871x_dev_unload(padapter);
+ 		r8712_free_drv_sw(padapter);
+ 	}
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0077-usb-ch9.h-usb_endpoint_maxp-uses-__le16_to_cpu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0077-usb-ch9.h-usb_endpoint_maxp-uses-__le16_to_cpu.patch
new file mode 100644
index 0000000..98855bb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0077-usb-ch9.h-usb_endpoint_maxp-uses-__le16_to_cpu.patch
@@ -0,0 +1,37 @@
+From 915cf0ec84e35d10f00166d3c9b64b12e605c792 Mon Sep 17 00:00:00 2001
+From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+Date: Tue, 31 Jan 2012 16:43:50 -0800
+Subject: [PATCH 77/87] usb: ch9.h: usb_endpoint_maxp() uses __le16_to_cpu()
+
+commit 9c0a835a9d9aed41bcf9c287f5069133a6e2a87b upstream.
+
+The usb/ch9.h will be installed to /usr/include/linux,
+and be used from user space.
+But le16_to_cpu() is only defined for kernel code.
+Without this patch, user space compile will be broken.
+Special thanks to Stefan Becker
+
+Reported-by: Stefan Becker <chemobejk@gmail.com>
+Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/usb/ch9.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/linux/usb/ch9.h b/include/linux/usb/ch9.h
+index 61b2905..3b6f628 100644
+--- a/include/linux/usb/ch9.h
++++ b/include/linux/usb/ch9.h
+@@ -589,7 +589,7 @@ static inline int usb_endpoint_is_isoc_out(
+  */
+ static inline int usb_endpoint_maxp(const struct usb_endpoint_descriptor *epd)
+ {
+-	return le16_to_cpu(epd->wMaxPacketSize);
++	return __le16_to_cpu(epd->wMaxPacketSize);
+ }
+ 
+ /*-------------------------------------------------------------------------*/
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0078-usb-gadget-zero-fix-bug-in-loopback-autoresume-handl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0078-usb-gadget-zero-fix-bug-in-loopback-autoresume-handl.patch
new file mode 100644
index 0000000..e43e5dc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0078-usb-gadget-zero-fix-bug-in-loopback-autoresume-handl.patch
@@ -0,0 +1,36 @@
+From d99aad98ef32d6615cef9f91aa213b8484cb4083 Mon Sep 17 00:00:00 2001
+From: Timo Juhani Lindfors <timo.lindfors@iki.fi>
+Date: Sun, 29 Jan 2012 16:12:13 +0200
+Subject: [PATCH 78/87] usb: gadget: zero: fix bug in loopback autoresume
+ handling
+
+commit 683da59d7b8ae04891636d4b59893cd4e9b0b7e5 upstream.
+
+ab943a2e125b (USB: gadget: gadget zero uses new suspend/resume hooks)
+introduced a copy-paste error where f_loopback.c writes to a variable
+declared in f_sourcesink.c. This prevents one from creating gadgets
+that only have a loopback function.
+
+Signed-off-by: Timo Juhani Lindfors <timo.lindfors@iki.fi>
+Signed-off-by: Felipe Balbi <balbi@ti.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/gadget/f_loopback.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/gadget/f_loopback.c b/drivers/usb/gadget/f_loopback.c
+index 6d87f28..2c0cd82 100644
+--- a/drivers/usb/gadget/f_loopback.c
++++ b/drivers/usb/gadget/f_loopback.c
+@@ -418,7 +418,7 @@ int __init loopback_add(struct usb_composite_dev *cdev, bool autoresume)
+ 
+ 	/* support autoresume for remote wakeup testing */
+ 	if (autoresume)
+-		sourcesink_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
++		loopback_driver.bmAttributes |= USB_CONFIG_ATT_WAKEUP;
+ 
+ 	/* support OTG systems */
+ 	if (gadget_is_otg(cdev->gadget)) {
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0079-usb-Skip-PCI-USB-quirk-handling-for-Netlogic-XLP.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0079-usb-Skip-PCI-USB-quirk-handling-for-Netlogic-XLP.patch
new file mode 100644
index 0000000..d9b862f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0079-usb-Skip-PCI-USB-quirk-handling-for-Netlogic-XLP.patch
@@ -0,0 +1,45 @@
+From 0bbd5d1b0a768b0b5761643b601422dfe78fd9c5 Mon Sep 17 00:00:00 2001
+From: Jayachandran C <jayachandranc@netlogicmicro.com>
+Date: Fri, 27 Jan 2012 20:27:32 +0530
+Subject: [PATCH 79/87] usb: Skip PCI USB quirk handling for Netlogic XLP
+
+commit e4436a7c17ac2b5e138f93f83a541cba9b311685 upstream.
+
+The Netlogic XLP SoC's on-chip USB controller appears as a PCI
+USB device, but does not need the EHCI/OHCI handoff done in
+usb/host/pci-quirks.c.
+
+The pci-quirks.c is enabled for all vendors and devices, and is
+enabled if USB and PCI are configured.
+
+If we do not skip the qurik handling on XLP, the readb() call in
+ehci_bios_handoff() will cause a crash since byte access is not
+supported for EHCI registers in XLP.
+
+Signed-off-by: Jayachandran C <jayachandranc@netlogicmicro.com>
+Acked-by: Alan Stern <stern@rowland.harvard.edu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/host/pci-quirks.c |    6 ++++++
+ 1 files changed, 6 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/host/pci-quirks.c b/drivers/usb/host/pci-quirks.c
+index caf8742..ac53a66 100644
+--- a/drivers/usb/host/pci-quirks.c
++++ b/drivers/usb/host/pci-quirks.c
+@@ -867,6 +867,12 @@ hc_init:
+ 
+ static void __devinit quirk_usb_early_handoff(struct pci_dev *pdev)
+ {
++	/* Skip Netlogic mips SoC's internal PCI USB controller.
++	 * This device does not need/support EHCI/OHCI handoff
++	 */
++	if (pdev->vendor == 0x184e)	/* vendor Netlogic */
++		return;
++
+ 	if (pdev->class == PCI_CLASS_SERIAL_USB_UHCI)
+ 		quirk_usb_handoff_uhci(pdev);
+ 	else if (pdev->class == PCI_CLASS_SERIAL_USB_OHCI)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0080-USB-usbserial-add-new-PID-number-0xa951-to-the-ftdi-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0080-USB-usbserial-add-new-PID-number-0xa951-to-the-ftdi-.patch
new file mode 100644
index 0000000..48d275f
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0080-USB-usbserial-add-new-PID-number-0xa951-to-the-ftdi-.patch
@@ -0,0 +1,45 @@
+From 294913e9df10298b440f3c8ee1df4b2d02c06f49 Mon Sep 17 00:00:00 2001
+From: Milan Kocian <milon@wq.cz>
+Date: Fri, 3 Feb 2012 14:28:00 +0100
+Subject: [PATCH 80/87] USB: usbserial: add new PID number (0xa951) to the
+ ftdi driver
+
+commit 90451e6973a5da155c6f315a409ca0a8d3ce6b76 upstream.
+
+Signed-off-by: Milan Kocian <milon@wq.cz>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/ftdi_sio.c     |    1 +
+ drivers/usb/serial/ftdi_sio_ids.h |    7 +++++++
+ 2 files changed, 8 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/usb/serial/ftdi_sio.c b/drivers/usb/serial/ftdi_sio.c
+index 058b92c..f030471 100644
+--- a/drivers/usb/serial/ftdi_sio.c
++++ b/drivers/usb/serial/ftdi_sio.c
+@@ -839,6 +839,7 @@ static struct usb_device_id id_table_combined [] = {
+ 	{ USB_DEVICE(FTDI_VID, FTDI_SCIENCESCOPE_LOGBOOKML_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_SCIENCESCOPE_LS_LOGBOOK_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_SCIENCESCOPE_HS_LOGBOOK_PID) },
++	{ USB_DEVICE(FTDI_VID, FTDI_CINTERION_MC55I_PID) },
+ 	{ USB_DEVICE(FTDI_VID, FTDI_DOTEC_PID) },
+ 	{ USB_DEVICE(QIHARDWARE_VID, MILKYMISTONE_JTAGSERIAL_PID),
+ 		.driver_info = (kernel_ulong_t)&ftdi_jtag_quirk },
+diff --git a/drivers/usb/serial/ftdi_sio_ids.h b/drivers/usb/serial/ftdi_sio_ids.h
+index 76d4f31..4eb7715 100644
+--- a/drivers/usb/serial/ftdi_sio_ids.h
++++ b/drivers/usb/serial/ftdi_sio_ids.h
+@@ -1187,3 +1187,10 @@
+  */
+ /* ZigBee controller */
+ #define FTDI_RF_R106		0x8A28
++
++/*
++ * Product: HCP HIT GPRS modem
++ * Manufacturer: HCP d.o.o.
++ * ATI command output: Cinterion MC55i
++ */
++#define FTDI_CINTERION_MC55I_PID	0xA951
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0081-USB-add-new-zte-3g-dongle-s-pid-to-option.c.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0081-USB-add-new-zte-3g-dongle-s-pid-to-option.c.patch
new file mode 100644
index 0000000..82b8672
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0081-USB-add-new-zte-3g-dongle-s-pid-to-option.c.patch
@@ -0,0 +1,181 @@
+From 57c313f71800dd93f10f6641650dcb4167fa8739 Mon Sep 17 00:00:00 2001
+From: Rui li <li.rui27@zte.com.cn>
+Date: Tue, 31 Jan 2012 15:27:33 +0800
+Subject: [PATCH 81/87] USB: add new zte 3g-dongle's pid to option.c
+
+commit 1608ea5f4b5d6262cd6e808839491cfb2a67405a upstream.
+
+As ZTE have and will use more pid for new products this year,
+so we need to add some new zte 3g-dongle's pid on option.c ,
+and delete one pid 0x0154 because it use for mass-storage port.
+
+Signed-off-by: Rui li <li.rui27@zte.com.cn>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/usb/serial/option.c |  129 ++++++++++++++++++++++++++++++++++++++++++-
+ 1 files changed, 128 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
+index 2a9ed6e..338d082 100644
+--- a/drivers/usb/serial/option.c
++++ b/drivers/usb/serial/option.c
+@@ -855,6 +855,18 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0083, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0086, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0087, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0088, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0089, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0090, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0091, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0092, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0093, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0094, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0095, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0096, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0097, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0098, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0099, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0104, 0xff, 0xff, 0xff),
+ 		.driver_info = (kernel_ulong_t)&net_intf4_blacklist },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0105, 0xff, 0xff, 0xff) },
+@@ -883,7 +895,6 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0151, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0152, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0153, 0xff, 0xff, 0xff) },
+-	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0154, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0155, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0156, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0157, 0xff, 0xff, 0xff) },
+@@ -892,6 +903,12 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0160, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0161, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0162, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0164, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0165, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0168, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0170, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0176, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0178, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1008, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1010, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1012, 0xff, 0xff, 0xff) },
+@@ -1066,6 +1083,116 @@ static const struct usb_device_id option_ids[] = {
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1298, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1299, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1300, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1401, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1402, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1403, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1404, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1405, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1406, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1407, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1408, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1409, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1410, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1411, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1412, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1413, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1414, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1415, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1416, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1417, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1418, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1419, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1420, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1421, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1422, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1423, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1424, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1425, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1426, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1427, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1428, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1429, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1430, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1431, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1432, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1433, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1434, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1435, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1436, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1437, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1438, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1439, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1440, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1441, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1442, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1443, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1444, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1445, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1446, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1447, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1448, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1449, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1450, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1451, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1452, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1453, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1454, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1455, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1456, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1457, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1458, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1459, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1460, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1461, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1462, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1463, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1464, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1465, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1466, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1467, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1468, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1469, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1470, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1471, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1472, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1473, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1474, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1475, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1476, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1477, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1478, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1479, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1480, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1481, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1482, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1483, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1484, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1485, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1486, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1487, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1488, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1489, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1490, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1491, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1492, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1493, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1494, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1495, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1496, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1497, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1498, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1499, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1500, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1501, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1502, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1503, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1504, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1505, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1506, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1507, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1508, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1509, 0xff, 0xff, 0xff) },
++	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x1510, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0014, 0xff, 0xff, 0xff) }, /* ZTE CDMA products */
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0027, 0xff, 0xff, 0xff) },
+ 	{ USB_DEVICE_AND_INTERFACE_INFO(ZTE_VENDOR_ID, 0x0059, 0xff, 0xff, 0xff) },
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0082-zcache-Set-SWIZ_BITS-to-8-to-reduce-tmem-bucket-lock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0082-zcache-Set-SWIZ_BITS-to-8-to-reduce-tmem-bucket-lock.patch
new file mode 100644
index 0000000..fddd690
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0082-zcache-Set-SWIZ_BITS-to-8-to-reduce-tmem-bucket-lock.patch
@@ -0,0 +1,46 @@
+From c1efec8273372700693661f094324081d8f3ad3d Mon Sep 17 00:00:00 2001
+From: Dan Magenheimer <dan.magenheimer@oracle.com>
+Date: Mon, 23 Jan 2012 16:52:20 -0500
+Subject: [PATCH 82/87] zcache: Set SWIZ_BITS to 8 to reduce tmem bucket lock
+ contention.
+
+commit e8b4553457e78bcff90f70a31212a40a8fd4f0db upstream.
+
+SWIZ_BITS > 8 results in a much larger number of "tmem_obj"
+allocations, likely one per page-placed-in-frontswap.  The
+tmem_obj is not huge (roughly 100 bytes), but it is large
+enough to add a not-insignificant memory overhead to zcache.
+
+The SWIZ_BITS=8  will get roughly the same lock contention
+without the space wastage.
+
+The effect of SWIZ_BITS can be thought of as "2^SWIZ_BITS is
+the number of unique oids that be generated" (This concept is
+limited to frontswap's use of tmem).
+
+Acked-by: Seth Jennings <sjenning@linux.vnet.ibm.com>
+Signed-off-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/zcache/zcache-main.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/staging/zcache/zcache-main.c b/drivers/staging/zcache/zcache-main.c
+index 56c1f9c..d3a8e67 100644
+--- a/drivers/staging/zcache/zcache-main.c
++++ b/drivers/staging/zcache/zcache-main.c
+@@ -1782,9 +1782,9 @@ static int zcache_frontswap_poolid = -1;
+  * Swizzling increases objects per swaptype, increasing tmem concurrency
+  * for heavy swaploads.  Later, larger nr_cpus -> larger SWIZ_BITS
+  * Setting SWIZ_BITS to 27 basically reconstructs the swap entry from
+- * frontswap_get_page()
++ * frontswap_get_page(), but has side-effects. Hence using 8.
+  */
+-#define SWIZ_BITS		27
++#define SWIZ_BITS		8
+ #define SWIZ_MASK		((1 << SWIZ_BITS) - 1)
+ #define _oswiz(_type, _ind)	((_type << SWIZ_BITS) | (_ind & SWIZ_MASK))
+ #define iswiz(_ind)		(_ind >> SWIZ_BITS)
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0083-zcache-fix-deadlock-condition.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0083-zcache-fix-deadlock-condition.patch
new file mode 100644
index 0000000..c73b80a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0083-zcache-fix-deadlock-condition.patch
@@ -0,0 +1,55 @@
+From 5c97f5b2d4924961479e862e8fe516ba217551b3 Mon Sep 17 00:00:00 2001
+From: Dan Magenheimer <dan.magenheimer@oracle.com>
+Date: Wed, 25 Jan 2012 14:32:51 -0800
+Subject: [PATCH 83/87] zcache: fix deadlock condition
+
+commit 9256a4789be3dae37d00924c03546ba7958ea5a3 upstream.
+
+I discovered this deadlock condition awhile ago working on RAMster
+but it affects zcache as well.  The list spinlock must be
+locked prior to the page spinlock and released after.  As
+a result, the page copy must also be done while the locks are held.
+
+Applies to 3.2.  Konrad, please push (via GregKH?)...
+this is definitely a bug fix so need not be pushed during
+a -rc0 window.
+
+Signed-off-by: Dan Magenheimer <dan.magenheimer@oracle.com>
+Acked-by: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/staging/zcache/zcache-main.c |    7 +++----
+ 1 files changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/staging/zcache/zcache-main.c b/drivers/staging/zcache/zcache-main.c
+index d3a8e67..f5e469d 100644
+--- a/drivers/staging/zcache/zcache-main.c
++++ b/drivers/staging/zcache/zcache-main.c
+@@ -358,8 +358,8 @@ static struct zbud_hdr *zbud_create(uint16_t client_id, uint16_t pool_id,
+ 	if (unlikely(zbpg == NULL))
+ 		goto out;
+ 	/* ok, have a page, now compress the data before taking locks */
+-	spin_lock(&zbpg->lock);
+ 	spin_lock(&zbud_budlists_spinlock);
++	spin_lock(&zbpg->lock);
+ 	list_add_tail(&zbpg->bud_list, &zbud_unbuddied[nchunks].list);
+ 	zbud_unbuddied[nchunks].count++;
+ 	zh = &zbpg->buddy[0];
+@@ -389,12 +389,11 @@ init_zh:
+ 	zh->oid = *oid;
+ 	zh->pool_id = pool_id;
+ 	zh->client_id = client_id;
+-	/* can wait to copy the data until the list locks are dropped */
+-	spin_unlock(&zbud_budlists_spinlock);
+-
+ 	to = zbud_data(zh, size);
+ 	memcpy(to, cdata, size);
+ 	spin_unlock(&zbpg->lock);
++	spin_unlock(&zbud_budlists_spinlock);
++
+ 	zbud_cumul_chunk_counts[nchunks]++;
+ 	atomic_inc(&zcache_zbud_curr_zpages);
+ 	zcache_zbud_cumul_zpages++;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0084-mmc-cb710-core-Add-missing-spin_lock_init-for-irq_lo.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0084-mmc-cb710-core-Add-missing-spin_lock_init-for-irq_lo.patch
new file mode 100644
index 0000000..7ff88b2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0084-mmc-cb710-core-Add-missing-spin_lock_init-for-irq_lo.patch
@@ -0,0 +1,33 @@
+From 6bffce08e4d8f5daf00e3d45dad594764c3fc8f0 Mon Sep 17 00:00:00 2001
+From: Axel Lin <axel.lin@gmail.com>
+Date: Wed, 1 Feb 2012 12:31:47 +0800
+Subject: [PATCH 84/87] mmc: cb710 core: Add missing spin_lock_init for
+ irq_lock of struct cb710_chip
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+commit b5266ea675c5a041e2852c7ccec4cf2d4f5e0cf4 upstream.
+
+Signed-off-by: Axel Lin <axel.lin@gmail.com>
+Acked-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/misc/cb710/core.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/misc/cb710/core.c b/drivers/misc/cb710/core.c
+index 68cd05b..85cc771 100644
+--- a/drivers/misc/cb710/core.c
++++ b/drivers/misc/cb710/core.c
+@@ -245,6 +245,7 @@ static int __devinit cb710_probe(struct pci_dev *pdev,
+ 	if (err)
+ 		return err;
+ 
++	spin_lock_init(&chip->irq_lock);
+ 	chip->pdev = pdev;
+ 	chip->iobase = pcim_iomap_table(pdev)[0];
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0085-powernow-k8-Avoid-Pstate-MSR-accesses-on-systems-sup.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0085-powernow-k8-Avoid-Pstate-MSR-accesses-on-systems-sup.patch
new file mode 100644
index 0000000..b00bc7d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0085-powernow-k8-Avoid-Pstate-MSR-accesses-on-systems-sup.patch
@@ -0,0 +1,60 @@
+From af2ff521425c83a3043af8a600b62d32443031dd Mon Sep 17 00:00:00 2001
+From: Andreas Herrmann <andreas.herrmann3@amd.com>
+Date: Fri, 6 Jan 2012 15:56:31 +0100
+Subject: [PATCH 85/87] powernow-k8: Avoid Pstate MSR accesses on systems
+ supporting CPB
+
+commit 201bf0f129e1715a33568d1563d9a75b840ab4d3 upstream.
+
+Due to CPB we can't directly map SW Pstates to Pstate MSRs. Get rid of
+the paranoia check. (assuming that the ACPI Pstate information is
+correct.)
+
+Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
+Signed-off-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/cpufreq/powernow-k8.c |   19 ++++++++++---------
+ 1 files changed, 10 insertions(+), 9 deletions(-)
+
+diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
+index bce576d..e0329f9 100644
+--- a/drivers/cpufreq/powernow-k8.c
++++ b/drivers/cpufreq/powernow-k8.c
+@@ -926,23 +926,24 @@ static int fill_powernow_table_pstate(struct powernow_k8_data *data,
+ 			invalidate_entry(powernow_table, i);
+ 			continue;
+ 		}
+-		rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
+-		if (!(hi & HW_PSTATE_VALID_MASK)) {
+-			pr_debug("invalid pstate %d, ignoring\n", index);
+-			invalidate_entry(powernow_table, i);
+-			continue;
+-		}
+-
+-		powernow_table[i].index = index;
+-
+ 		/* Frequency may be rounded for these */
+ 		if ((boot_cpu_data.x86 == 0x10 && boot_cpu_data.x86_model < 10)
+ 				 || boot_cpu_data.x86 == 0x11) {
++
++			rdmsr(MSR_PSTATE_DEF_BASE + index, lo, hi);
++			if (!(hi & HW_PSTATE_VALID_MASK)) {
++				pr_debug("invalid pstate %d, ignoring\n", index);
++				invalidate_entry(powernow_table, i);
++				continue;
++			}
++
+ 			powernow_table[i].frequency =
+ 				freq_from_fid_did(lo & 0x3f, (lo >> 6) & 7);
+ 		} else
+ 			powernow_table[i].frequency =
+ 				data->acpi_data.states[i].core_frequency * 1000;
++
++		powernow_table[i].index = index;
+ 	}
+ 	return 0;
+ }
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0086-powernow-k8-Fix-indexing-issue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0086-powernow-k8-Fix-indexing-issue.patch
new file mode 100644
index 0000000..998d0c5
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0086-powernow-k8-Fix-indexing-issue.patch
@@ -0,0 +1,86 @@
+From 8f44619e1e633884c5f0bfcf6ae05d7b0304cca3 Mon Sep 17 00:00:00 2001
+From: Andreas Herrmann <andreas.herrmann3@amd.com>
+Date: Fri, 6 Jan 2012 15:57:55 +0100
+Subject: [PATCH 86/87] powernow-k8: Fix indexing issue
+
+commit a8eb28480e9b637cc78b9aa5e08612ba97e1317a upstream.
+
+The driver uses the pstate number from the status register as index in
+its table of ACPI pstates (powernow_table). This is wrong as this is
+not a 1-to-1 mapping.
+
+For example we can have _PSS information to just utilize Pstate 0 and
+Pstate 4, ie.
+
+  powernow-k8: Core Performance Boosting: on.
+  powernow-k8:    0 : pstate 0 (2200 MHz)
+  powernow-k8:    1 : pstate 4 (1400 MHz)
+
+In this example the driver's powernow_table has just 2 entries. Using
+the pstate number (4) as index into this table is just plain wrong.
+
+Signed-off-by: Andreas Herrmann <andreas.herrmann3@amd.com>
+Signed-off-by: Dave Jones <davej@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/cpufreq/powernow-k8.c |   15 +++++++++++----
+ 1 files changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/cpufreq/powernow-k8.c b/drivers/cpufreq/powernow-k8.c
+index e0329f9..ad683ec 100644
+--- a/drivers/cpufreq/powernow-k8.c
++++ b/drivers/cpufreq/powernow-k8.c
+@@ -54,6 +54,9 @@ static DEFINE_PER_CPU(struct powernow_k8_data *, powernow_data);
+ 
+ static int cpu_family = CPU_OPTERON;
+ 
++/* array to map SW pstate number to acpi state */
++static u32 ps_to_as[8];
++
+ /* core performance boost */
+ static bool cpb_capable, cpb_enabled;
+ static struct msr __percpu *msrs;
+@@ -80,9 +83,9 @@ static u32 find_khz_freq_from_fid(u32 fid)
+ }
+ 
+ static u32 find_khz_freq_from_pstate(struct cpufreq_frequency_table *data,
+-		u32 pstate)
++				     u32 pstate)
+ {
+-	return data[pstate].frequency;
++	return data[ps_to_as[pstate]].frequency;
+ }
+ 
+ /* Return the vco fid for an input fid
+@@ -926,6 +929,9 @@ static int fill_powernow_table_pstate(struct powernow_k8_data *data,
+ 			invalidate_entry(powernow_table, i);
+ 			continue;
+ 		}
++
++		ps_to_as[index] = i;
++
+ 		/* Frequency may be rounded for these */
+ 		if ((boot_cpu_data.x86 == 0x10 && boot_cpu_data.x86_model < 10)
+ 				 || boot_cpu_data.x86 == 0x11) {
+@@ -1190,7 +1196,8 @@ static int powernowk8_target(struct cpufreq_policy *pol,
+ 	powernow_k8_acpi_pst_values(data, newstate);
+ 
+ 	if (cpu_family == CPU_HW_PSTATE)
+-		ret = transition_frequency_pstate(data, newstate);
++		ret = transition_frequency_pstate(data,
++			data->powernow_table[newstate].index);
+ 	else
+ 		ret = transition_frequency_fidvid(data, newstate);
+ 	if (ret) {
+@@ -1203,7 +1210,7 @@ static int powernowk8_target(struct cpufreq_policy *pol,
+ 
+ 	if (cpu_family == CPU_HW_PSTATE)
+ 		pol->cur = find_khz_freq_from_pstate(data->powernow_table,
+-				newstate);
++				data->powernow_table[newstate].index);
+ 	else
+ 		pol->cur = find_khz_freq_from_fid(data->currfid);
+ 	ret = 0;
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0087-Linux-3.2.6.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0087-Linux-3.2.6.patch
new file mode 100644
index 0000000..e5754bc
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.6/0087-Linux-3.2.6.patch
@@ -0,0 +1,24 @@
+From c2db2e264bce3b5c82b8786ec3080cbe41b7114c Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Mon, 13 Feb 2012 11:17:29 -0800
+Subject: [PATCH 87/87] Linux 3.2.6
+
+---
+ Makefile |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index e9dd0ff..47fe496 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 5
++SUBLEVEL = 6
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.7.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/src.txt b/recipes-kernel/linux/linux-ti33x-psp-3.2/src.txt
deleted file mode 100644
index 916c5c5..0000000
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/src.txt
+++ /dev/null
@@ -1,295 +0,0 @@
-	file://3.2.1/0001-MAINTAINERS-stable-Update-address.patch \
-	file://3.2.1/0002-Documentation-Update-stable-address.patch \
-	file://3.2.1/0003-firmware-Fix-an-oops-on-reading-fw_priv-fw-in-sysfs-.patch \
-	file://3.2.1/0004-rt2800usb-Move-ID-out-of-unknown.patch \
-	file://3.2.1/0005-offb-Fix-setting-of-the-pseudo-palette-for-8bpp.patch \
-	file://3.2.1/0006-offb-Fix-bug-in-calculating-requested-vram-size.patch \
-	file://3.2.1/0007-libertas-clean-up-scan-thread-handling.patch \
-	file://3.2.1/0008-bcma-support-for-suspend-and-resume.patch \
-	file://3.2.1/0009-wl12xx-Validate-FEM-index-from-ini-file-and-FW.patch \
-	file://3.2.1/0010-wl12xx-Check-buffer-bound-when-processing-nvs-data.patch \
-	file://3.2.1/0011-wl12xx-Restore-testmode-ABI.patch \
-	file://3.2.1/0012-powerpc-time-Handle-wrapping-of-decrementer.patch \
-	file://3.2.1/0013-powerpc-Fix-unpaired-probe_hcall_entry-and-probe_hca.patch \
-	file://3.2.1/0014-IB-qib-Fix-a-possible-data-corruption-when-receiving.patch \
-	file://3.2.1/0015-IB-uverbs-Protect-QP-multicast-list.patch \
-	file://3.2.1/0016-iwlagn-fix-TID-use-bug.patch \
-	file://3.2.1/0017-iwlagn-fix-remove-use-of-PAGE_SIZE.patch \
-	file://3.2.1/0018-perf-Fix-parsing-of-__print_flags-in-TP_printk.patch \
-	file://3.2.1/0019-ore-Fix-crash-in-case-of-an-IO-error.patch \
-	file://3.2.1/0020-ore-fix-BUG_ON-too-few-sgs-when-reading.patch \
-	file://3.2.1/0021-ore-Must-support-none-PAGE-aligned-IO.patch \
-	file://3.2.1/0022-ore-FIX-breakage-when-MISC_FILESYSTEMS-is-not-set.patch \
-	file://3.2.1/0023-reiserfs-Fix-quota-mount-option-parsing.patch \
-	file://3.2.1/0024-reiserfs-Force-inode-evictions-before-umount-to-avoi.patch \
-	file://3.2.1/0025-ext3-Don-t-warn-from-writepage-when-readonly-inode-i.patch \
-	file://3.2.1/0026-drivers-hv-Don-t-OOPS-when-you-cannot-init-vmbus.patch \
-	file://3.2.1/0027-Drivers-hv-Fix-a-bug-in-vmbus_driver_unregister.patch \
-	file://3.2.1/0028-USB-update-documentation-for-usbmon.patch \
-	file://3.2.1/0029-usbfs-Fix-oops-related-to-user-namespace-conversion.patch \
-	file://3.2.1/0030-atmel_serial-fix-spinlock-lockup-in-RS485-code.patch \
-	file://3.2.1/0031-cgroup-fix-to-allow-mounting-a-hierarchy-by-name.patch \
-	file://3.2.1/0032-udf-Fix-deadlock-when-converting-file-from-in-ICB-on.patch \
-	file://3.2.1/0033-drivers-usb-class-cdc-acm.c-clear-dangling-pointer.patch \
-	file://3.2.1/0034-USB-isight-fix-kernel-bug-when-loading-firmware.patch \
-	file://3.2.1/0035-usb-usb-storage-doesn-t-support-dynamic-id-currently.patch \
-	file://3.2.1/0036-USB-pxa168-Fix-compilation-error.patch \
-	file://3.2.1/0037-USB-add-quirk-for-another-camera.patch \
-	file://3.2.1/0038-usb-musb-fix-pm_runtime-mismatch.patch \
-	file://3.2.1/0039-USB-omninet-fix-write_room.patch \
-	file://3.2.1/0040-usb-option-add-ZD-Incorporated-HSPA-modem.patch \
-	file://3.2.1/0041-USB-Add-USB-ID-for-Multiplex-RC-serial-adapter-to-cp.patch \
-	file://3.2.1/0042-usb-fix-number-of-mapped-SG-DMA-entries.patch \
-	file://3.2.1/0043-xhci-Properly-handle-COMP_2ND_BW_ERR.patch \
-	file://3.2.1/0044-usb-ch9-fix-up-MaxStreams-helper.patch \
-	file://3.2.1/0045-igmp-Avoid-zero-delay-when-receiving-odd-mixture-of-.patch \
-	file://3.2.1/0046-asix-fix-infinite-loop-in-rx_fixup.patch \
-	file://3.2.1/0047-bonding-fix-error-handling-if-slave-is-busy-v2.patch \
-	file://3.2.1/0048-usb-cdc-acm-Fix-acm_tty_hangup-vs.-acm_tty_close-rac.patch \
-	file://3.2.1/0049-xfs-fix-acl-count-validation-in-xfs_acl_from_disk.patch \
-	file://3.2.1/0050-Linux-3.2.1.patch \
-	file://3.2.2/0001-mtdoops-fix-the-oops_page_used-array-size.patch \
-	file://3.2.2/0002-mtd-mtdoops-skip-reading-initially-bad-blocks.patch \
-	file://3.2.2/0003-mtd-mtd_blkdevs-don-t-increase-open-count-on-error-p.patch \
-	file://3.2.2/0004-mtd-tests-stresstest-bail-out-if-device-has-not-enou.patch \
-	file://3.2.2/0005-drivers-rtc-interface.c-fix-alarm-rollover-when-day-.patch \
-	file://3.2.2/0006-ext4-add-missing-ext4_resize_end-on-error-paths.patch \
-	file://3.2.2/0007-ext4-fix-undefined-behavior-in-ext4_fill_flex_info.patch \
-	file://3.2.2/0008-ALSA-snd-usb-us122l-Delete-calls-to-preempt_disable.patch \
-	file://3.2.2/0009-ALSA-HDA-Fix-master-control-for-Cirrus-Logic-421X.patch \
-	file://3.2.2/0010-ALSA-HDA-Fix-automute-for-Cirrus-Logic-421x.patch \
-	file://3.2.2/0011-ALSA-ice1724-Check-for-ac97-to-avoid-kernel-oops.patch \
-	file://3.2.2/0012-ALSA-usb-audio-Avoid-flood-of-frame-active-debug-mes.patch \
-	file://3.2.2/0013-ALSA-hda-Use-auto-parser-for-HP-laptops-with-cx20459.patch \
-	file://3.2.2/0014-ALSA-hda-Return-the-error-from-get_wcaps_type-for-in.patch \
-	file://3.2.2/0015-ALSA-hda-Fix-the-detection-of-Loopback-Mixing-contro.patch \
-	file://3.2.2/0016-ALSA-hda-Fix-the-lost-power-setup-of-seconary-pins-a.patch \
-	file://3.2.2/0017-drm-radeon-kms-workaround-invalid-AVI-infoframe-chec.patch \
-	file://3.2.2/0018-drm-radeon-kms-disable-writeback-on-pre-R300-asics.patch \
-	file://3.2.2/0019-radeon-Fix-disabling-PCI-bus-mastering-on-big-endian.patch \
-	file://3.2.2/0020-pnfs-obj-pNFS-errors-are-communicated-on-iodata-pnfs.patch \
-	file://3.2.2/0021-pnfs-obj-Must-return-layout-on-IO-error.patch \
-	file://3.2.2/0022-NFS-Retry-mounting-NFSROOT.patch \
-	file://3.2.2/0023-NFSv4.1-fix-backchannel-slotid-off-by-one-bug.patch \
-	file://3.2.2/0024-NFS-fix-recent-breakage-to-NFS-error-handling.patch \
-	file://3.2.2/0025-NFSv4-include-bitmap-in-nfsv4-get-acl-data.patch \
-	file://3.2.2/0026-nfs-fix-regression-in-handling-of-context-option-in-.patch \
-	file://3.2.2/0027-HID-bump-maximum-global-item-tag-report-size-to-96-b.patch \
-	file://3.2.2/0028-HID-wiimote-Select-INPUT_FF_MEMLESS.patch \
-	file://3.2.2/0029-UBI-fix-missing-scrub-when-there-is-a-bit-flip.patch \
-	file://3.2.2/0030-UBI-fix-use-after-free-on-error-path.patch \
-	file://3.2.2/0031-PCI-Fix-PCI_EXP_TYPE_RC_EC-value.patch \
-	file://3.2.2/0032-PCI-msi-Disable-msi-interrupts-when-we-initialize-a-.patch \
-	file://3.2.2/0033-x86-PCI-Ignore-CPU-non-addressable-_CRS-reserved-mem.patch \
-	file://3.2.2/0034-x86-PCI-amd-factor-out-MMCONFIG-discovery.patch \
-	file://3.2.2/0035-x86-PCI-build-amd_bus.o-only-when-CONFIG_AMD_NB-y.patch \
-	file://3.2.2/0036-SCSI-mpt2sas-Release-spinlock-for-the-raid-device-li.patch \
-	file://3.2.2/0037-SCSI-mpt2sas-Fix-for-memory-allocation-error-for-lar.patch \
-	file://3.2.2/0038-xen-xenbus-Reject-replies-with-payload-XENSTORE_PAYL.patch \
-	file://3.2.2/0039-md-raid1-perform-bad-block-tests-for-WriteMostly-dev.patch \
-	file://3.2.2/0040-ima-free-duplicate-measurement-memory.patch \
-	file://3.2.2/0041-ima-fix-invalid-memory-reference.patch \
-	file://3.2.2/0042-slub-fix-a-possible-memleak-in-__slab_alloc.patch \
-	file://3.2.2/0043-PNP-work-around-Dell-1536-1546-BIOS-MMCONFIG-bug-tha.patch \
-	file://3.2.2/0044-asix-fix-setting-custom-MAC-address-on-Asix-88178-de.patch \
-	file://3.2.2/0045-asix-fix-setting-custom-MAC-address-on-Asix-88772-de.patch \
-	file://3.2.2/0046-include-linux-crash_dump.h-needs-elf.h.patch \
-	file://3.2.2/0047-rtl8192se-Fix-BUG-caused-by-failure-to-check-skb-all.patch \
-	file://3.2.2/0048-mac80211-fix-rx-key-NULL-pointer-dereference-in-prom.patch \
-	file://3.2.2/0049-ath9k-Fix-regression-in-channelwidth-switch-at-the-s.patch \
-	file://3.2.2/0050-memcg-add-mem_cgroup_replace_page_cache-to-fix-LRU-i.patch \
-	file://3.2.2/0051-x86-Fix-mmap-random-address-range.patch \
-	file://3.2.2/0052-UBI-fix-nameless-volumes-handling.patch \
-	file://3.2.2/0053-UBI-fix-debugging-messages.patch \
-	file://3.2.2/0054-UBI-make-vid_hdr-non-static.patch \
-	file://3.2.2/0055-UBIFS-fix-debugging-messages.patch \
-	file://3.2.2/0056-UBIFS-make-debugging-messages-light-again.patch \
-	file://3.2.2/0057-i2c-Fix-error-value-returned-by-several-bus-drivers.patch \
-	file://3.2.2/0058-mmc-core-Fix-voltage-select-in-DDR-mode.patch \
-	file://3.2.2/0059-mmc-sdhci-Fix-tuning-timer-incorrect-setting-when-su.patch \
-	file://3.2.2/0060-mmc-sd-Fix-SDR12-timing-regression.patch \
-	file://3.2.2/0061-V4L-DVB-v4l2-ioctl-integer-overflow-in-video_usercop.patch \
-	file://3.2.2/0062-Unused-iocbs-in-a-batch-should-not-be-accounted-as-a.patch \
-	file://3.2.2/0063-ftrace-Fix-unregister-ftrace_ops-accounting.patch \
-	file://3.2.2/0064-kconfig-streamline-config.pl-Simplify-backslash-line.patch \
-	file://3.2.2/0065-kconfig-streamline-config.pl-Fix-parsing-Makefile-wi.patch \
-	file://3.2.2/0066-svcrpc-fix-double-free-on-shutdown-of-nfsd-after-cha.patch \
-	file://3.2.2/0067-svcrpc-destroy-server-sockets-all-at-once.patch \
-	file://3.2.2/0068-svcrpc-avoid-memory-corruption-on-pool-shutdown.patch \
-	file://3.2.2/0069-nfsd4-fix-lockowner-matching.patch \
-	file://3.2.2/0070-nfsd-Fix-oops-when-parsing-a-0-length-export.patch \
-	file://3.2.2/0071-fsnotify-don-t-BUG-in-fsnotify_destroy_mark.patch \
-	file://3.2.2/0072-x86-UV-Update-Boot-messages-for-SGI-UV2-platform.patch \
-	file://3.2.2/0073-recordmcount-Fix-handling-of-elf64-big-endian-object.patch \
-	file://3.2.2/0074-uvcvideo-Fix-integer-overflow-in-uvc_ioctl_ctrl_map.patch \
-	file://3.2.2/0075-dcache-use-a-dispose-list-in-select_parent.patch \
-	file://3.2.2/0076-fix-shrink_dcache_parent-livelock.patch \
-	file://3.2.2/0077-pnfsblock-acquire-im_lock-in-_preload_range.patch \
-	file://3.2.2/0078-pnfsblock-don-t-spinlock-when-freeing-block_dev.patch \
-	file://3.2.2/0079-pnfsblock-limit-bio-page-count.patch \
-	file://3.2.2/0080-mac80211-revert-on-channel-work-optimisations.patch \
-	file://3.2.2/0081-HID-hid-multitouch-add-another-eGalax-id.patch \
-	file://3.2.2/0082-HID-multitouch-cleanup-with-eGalax-PID-definitions.patch \
-	file://3.2.2/0083-HID-multitouch-Add-egalax-ID-for-Acer-Iconia-W500.patch \
-	file://3.2.2/0084-HID-multitouch-add-support-for-the-MSI-Windpad-110W.patch \
-	file://3.2.2/0085-HID-hid-multitouch-add-support-for-new-Hanvon-panels.patch \
-	file://3.2.2/0086-HID-multitouch-add-support-of-Atmel-multitouch-panel.patch \
-	file://3.2.2/0087-HID-multitouch-add-support-for-3M-32.patch \
-	file://3.2.2/0088-HID-hid-multitouch-add-support-9-new-Xiroku-devices.patch \
-	file://3.2.2/0089-fix-cputime-overflow-in-uptime_proc_show.patch \
-	file://3.2.2/0090-block-add-and-use-scsi_blk_cmd_ioctl.patch \
-	file://3.2.2/0091-block-fail-SCSI-passthrough-ioctls-on-partition-devi.patch \
-	file://3.2.2/0092-dm-do-not-forward-ioctls-from-logical-volumes-to-the.patch \
-	file://3.2.2/0093-proc-clean-up-and-fix-proc-pid-mem-handling.patch \
-	file://3.2.2/0094-ALSA-HDA-Use-LPIB-position-fix-for-Macbook-Pro-7-1.patch \
-	file://3.2.2/0095-ALSA-virtuoso-Xonar-DS-fix-polarity-of-front-output.patch \
-	file://3.2.2/0096-ALSA-HDA-Fix-internal-microphone-on-Dell-Studio-16-X.patch \
-	file://3.2.2/0097-TOMOYO-Accept-000-as-a-valid-character.patch \
-	file://3.2.2/0098-intel-idle-Make-idle-driver-more-robust.patch \
-	file://3.2.2/0099-intel_idle-fix-API-misuse.patch \
-	file://3.2.2/0100-ACPI-Store-SRAT-table-revision.patch \
-	file://3.2.2/0101-ACPI-x86-Use-SRAT-table-rev-to-use-8bit-or-32bit-PXM.patch \
-	file://3.2.2/0102-ACPI-ia64-Use-SRAT-table-rev-to-use-8bit-or-16-32bit.patch \
-	file://3.2.2/0103-ACPICA-Put-back-the-call-to-acpi_os_validate_address.patch \
-	file://3.2.2/0104-ACPI-processor-fix-acpi_get_cpuid-for-UP-processor.patch \
-	file://3.2.2/0105-sym53c8xx-Fix-NULL-pointer-dereference-in-slave_dest.patch \
-	file://3.2.2/0106-target-Set-response-format-in-INQUIRY-response.patch \
-	file://3.2.2/0107-target-Set-additional-sense-length-field-in-sense-da.patch \
-	file://3.2.2/0108-bcma-invalidate-the-mapped-core-over-suspend-resume.patch \
-	file://3.2.2/0109-cx23885-dvb-check-if-dvb_attach-succeded.patch \
-	file://3.2.2/0110-cx88-fix-don-t-duplicate-xc4000-entry-for-radio.patch \
-	file://3.2.2/0111-tuner-Fix-numberspace-conflict-between-xc4000-and-pt.patch \
-	file://3.2.2/0112-tracepoints-module-Fix-disabling-tracepoints-with-ta.patch \
-	file://3.2.2/0113-I2C-OMAP-correct-SYSC-register-offset-for-OMAP4.patch \
-	file://3.2.2/0114-x86-UV2-Fix-new-UV2-hardware-by-using-native-UV2-bro.patch \
-	file://3.2.2/0115-x86-UV2-Fix-BAU-destination-timeout-initialization.patch \
-	file://3.2.2/0116-x86-UV2-Work-around-BAU-bug.patch \
-	file://3.2.2/0117-ath9k_hw-fix-interpretation-of-the-rx-KeyMiss-flag.patch \
-	file://3.2.2/0118-rt2800pci-fix-spurious-interrupts-generation.patch \
-	file://3.2.2/0119-xfs-fix-endian-conversion-issue-in-discard-code.patch \
-	file://3.2.2/0120-i2c-eg20t-modified-the-setting-of-transfer-rate.patch \
-	file://3.2.2/0121-score-fix-off-by-one-index-into-syscall-table.patch \
-	file://3.2.2/0122-cifs-lower-default-wsize-when-unix-extensions-are-no.patch \
-	file://3.2.2/0123-kprobes-initialize-before-using-a-hlist.patch \
-	file://3.2.2/0124-proc-clear_refs-do-not-clear-reserved-pages.patch \
-	file://3.2.2/0125-mm-fix-NULL-ptr-dereference-in-__count_immobile_page.patch \
-	file://3.2.2/0126-iwlagn-check-for-SMPS-mode.patch \
-	file://3.2.2/0127-iwlegacy-3945-fix-hw-passive-scan-on-radar-channels.patch \
-	file://3.2.2/0128-SHM_UNLOCK-fix-long-unpreemptible-section.patch \
-	file://3.2.2/0129-SHM_UNLOCK-fix-Unevictable-pages-stranded-after-swap.patch \
-	file://3.2.2/0130-Linux-3.2.2.patch \
-	file://3.2.3/0001-ALSA-hda-Fix-buffer-alignment-regression-with-Nvidia.patch \
-	file://3.2.3/0002-ALSA-hda-Fix-silent-outputs-from-docking-station-jac.patch \
-	file://3.2.3/0003-eCryptfs-Sanitize-write-counts-of-dev-ecryptfs.patch \
-	file://3.2.3/0004-ecryptfs-Improve-metadata-read-failure-logging.patch \
-	file://3.2.3/0005-eCryptfs-Make-truncate-path-killable.patch \
-	file://3.2.3/0006-eCryptfs-Check-inode-changes-in-setattr.patch \
-	file://3.2.3/0007-eCryptfs-Fix-oops-when-printing-debug-info-in-extent.patch \
-	file://3.2.3/0008-drm-radeon-kms-Add-an-MSI-quirk-for-Dell-RS690.patch \
-	file://3.2.3/0009-drm-radeon-kms-move-panel-mode-setup-into-encoder-mo.patch \
-	file://3.2.3/0010-drm-radeon-kms-rework-modeset-sequence-for-DCE41-and.patch \
-	file://3.2.3/0011-drm-Fix-authentication-kernel-crash.patch \
-	file://3.2.3/0012-xfs-Fix-missing-xfs_iunlock-on-error-recovery-path-i.patch \
-	file://3.2.3/0013-ASoC-Mark-WM5100-register-map-cache-only-when-going-.patch \
-	file://3.2.3/0014-ASoC-Disable-register-synchronisation-for-low-freque.patch \
-	file://3.2.3/0015-ASoC-Don-t-go-through-cache-when-applying-WM5100-rev.patch \
-	file://3.2.3/0016-ASoC-wm8996-Call-_POST_PMU-callback-for-CPVDD.patch \
-	file://3.2.3/0017-brcmsmac-fix-tx-queue-flush-infinite-loop.patch \
-	file://3.2.3/0018-mac80211-fix-work-removal-on-deauth-request.patch \
-	file://3.2.3/0019-jbd-Issue-cache-flush-after-checkpointing.patch \
-	file://3.2.3/0020-crypto-sha512-make-it-work-undo-percpu-message-sched.patch \
-	file://3.2.3/0021-crypto-sha512-reduce-stack-usage-to-safe-number.patch \
-	file://3.2.3/0022-tpm_tis-add-delay-after-aborting-command.patch \
-	file://3.2.3/0023-x86-uv-Fix-uninitialized-spinlocks.patch \
-	file://3.2.3/0024-x86-uv-Fix-uv_gpa_to_soc_phys_ram-shift.patch \
-	file://3.2.3/0025-x86-microcode_amd-Add-support-for-CPU-family-specifi.patch \
-	file://3.2.3/0026-m68k-Fix-assembler-constraint-to-prevent-overeager-g.patch \
-	file://3.2.3/0027-ALSA-hda-set-mute-led-polarity-for-laptops-with-bugg.patch \
-	file://3.2.3/0028-ALSA-hda-Fix-silent-output-on-ASUS-A6Rp.patch \
-	file://3.2.3/0029-ALSA-hda-Fix-silent-output-on-Haier-W18-laptop.patch \
-	file://3.2.3/0030-drm-i915-paper-over-missed-irq-issues-with-force-wak.patch \
-	file://3.2.3/0031-drm-i915-sdvo-always-set-positive-sync-polarity.patch \
-	file://3.2.3/0032-drm-i915-Re-enable-gen7-RC6-and-GPU-turbo-after-resu.patch \
-	file://3.2.3/0033-ARM-at91-fix-at91rm9200-soc-subtype-handling.patch \
-	file://3.2.3/0034-mach-ux500-enable-ARM-errata-764369.patch \
-	file://3.2.3/0035-ARM-7296-1-proc-v7.S-remove-HARVARD_CACHE-preprocess.patch \
-	file://3.2.3/0036-sysfs-Complain-bitterly-about-attempts-to-remove-fil.patch \
-	file://3.2.3/0037-x86-xen-size-struct-xen_spinlock-to-always-fit-in-ar.patch \
-	file://3.2.3/0038-mpt2sas-Removed-redundant-calling-of-_scsih_probe_de.patch \
-	file://3.2.3/0039-USB-option-Add-LG-docomo-L-02C.patch \
-	file://3.2.3/0040-USB-ftdi_sio-fix-TIOCSSERIAL-baud_base-handling.patch \
-	file://3.2.3/0041-USB-ftdi_sio-fix-initial-baud-rate.patch \
-	file://3.2.3/0042-USB-ftdi_sio-add-PID-for-TI-XDS100v2-BeagleBone-A3.patch \
-	file://3.2.3/0043-USB-serial-ftdi-additional-IDs.patch \
-	file://3.2.3/0044-USB-ftdi_sio-Add-more-identifiers.patch \
-	file://3.2.3/0045-USB-cdc-wdm-updating-desc-length-must-be-protected-b.patch \
-	file://3.2.3/0046-USB-cdc-wdm-use-two-mutexes-to-allow-simultaneous-re.patch \
-	file://3.2.3/0047-qcaux-add-more-Pantech-UML190-and-UML290-ports.patch \
-	file://3.2.3/0048-usb-dwc3-ep0-tidy-up-Pending-Request-handling.patch \
-	file://3.2.3/0049-usb-io_ti-Make-edge_remove_sysfs_attrs-the-port_remo.patch \
-	file://3.2.3/0050-TTY-fix-UV-serial-console-regression.patch \
-	file://3.2.3/0051-serial-amba-pl011-lock-console-writes-against-interr.patch \
-	file://3.2.3/0052-jsm-Fixed-EEH-recovery-error.patch \
-	file://3.2.3/0053-iwlwifi-fix-PCI-E-transport-inta-race.patch \
-	file://3.2.3/0054-vmwgfx-Fix-assignment-in-vmw_framebuffer_create_hand.patch \
-	file://3.2.3/0055-USB-Realtek-cr-fix-autopm-scheduling-while-atomic.patch \
-	file://3.2.3/0056-USB-usbsevseg-fix-max-length.patch \
-	file://3.2.3/0057-usb-gadget-langwell-don-t-call-gadget-s-disconnect.patch \
-	file://3.2.3/0058-usb-gadget-storage-endian-fix.patch \
-	file://3.2.3/0059-drivers-usb-host-ehci-fsl.c-add-missing-iounmap.patch \
-	file://3.2.3/0060-xhci-Fix-USB-3.0-device-restart-on-resume.patch \
-	file://3.2.3/0061-xHCI-Cleanup-isoc-transfer-ring-when-TD-length-misma.patch \
-	file://3.2.3/0062-usb-musb-davinci-fix-build-breakage.patch \
-	file://3.2.3/0063-hwmon-f71805f-Fix-clamping-of-temperature-limits.patch \
-	file://3.2.3/0064-hwmon-w83627ehf-Disable-setting-DC-mode-for-pwm2-pwm.patch \
-	file://3.2.3/0065-hwmon-sht15-fix-bad-error-code.patch \
-	file://3.2.3/0066-USB-cdc-wdm-call-wake_up_all-to-allow-driver-to-shut.patch \
-	file://3.2.3/0067-USB-cdc-wdm-better-allocate-a-buffer-that-is-at-leas.patch \
-	file://3.2.3/0068-USB-cdc-wdm-Avoid-hanging-on-interface-with-no-USB_C.patch \
-	file://3.2.3/0069-netns-fix-net_alloc_generic.patch \
-	file://3.2.3/0070-netns-Fail-conspicously-if-someone-uses-net_generic-.patch \
-	file://3.2.3/0071-net-caif-Register-properly-as-a-pernet-subsystem.patch \
-	file://3.2.3/0072-af_unix-fix-EPOLLET-regression-for-stream-sockets.patch \
-	file://3.2.3/0073-bonding-fix-enslaving-in-alb-mode-when-link-down.patch \
-	file://3.2.3/0074-l2tp-l2tp_ip-fix-possible-oops-on-packet-receive.patch \
-	file://3.2.3/0075-macvlan-fix-a-possible-use-after-free.patch \
-	file://3.2.3/0076-net-bpf_jit-fix-divide-by-0-generation.patch \
-	file://3.2.3/0077-net-reintroduce-missing-rcu_assign_pointer-calls.patch \
-	file://3.2.3/0078-rds-Make-rds_sock_lock-BH-rather-than-IRQ-safe.patch \
-	file://3.2.3/0079-tcp-fix-tcp_trim_head-to-adjust-segment-count-with-s.patch \
-	file://3.2.3/0080-tcp-md5-using-remote-adress-for-md5-lookup-in-rst-pa.patch \
-	file://3.2.3/0081-USB-serial-CP210x-Added-USB-ID-for-the-Link-Instrume.patch \
-	file://3.2.3/0082-USB-cp210x-call-generic-open-last-in-open.patch \
-	file://3.2.3/0083-USB-cp210x-fix-CP2104-baudrate-usage.patch \
-	file://3.2.3/0084-USB-cp210x-do-not-map-baud-rates-to-B0.patch \
-	file://3.2.3/0085-USB-cp210x-fix-up-set_termios-variables.patch \
-	file://3.2.3/0086-USB-cp210x-clean-up-refactor-and-document-speed-hand.patch \
-	file://3.2.3/0087-USB-cp210x-initialise-baud-rate-at-open.patch \
-	file://3.2.3/0088-USB-cp210x-allow-more-baud-rates-above-1Mbaud.patch \
-	file://3.2.3/0089-mach-ux500-no-MMC_CAP_SD_HIGHSPEED-on-Snowball.patch \
-	file://3.2.3/0090-Linux-3.2.3.patch \
-	file://3.2.4/0001-Revert-ASoC-Mark-WM5100-register-map-cache-only-when.patch \
-	file://3.2.4/0002-Revert-ASoC-Don-t-go-through-cache-when-applying-WM5.patch \
-	file://3.2.4/0003-Linux-3.2.4.patch \
-	file://3.2.5/0001-PCI-Rework-ASPM-disable-code.patch \
-	file://3.2.5/0002-Linux-3.2.5.patch \
-	file://0002-f_rndis-HACK-around-undefined-variables.patch \
-	file://0003-da8xx-fb-add-DVI-support-for-beaglebone.patch \
-	file://0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
-	file://0005-more-beaglebone-merges.patch \
-	file://0006-beaglebone-disable-tsadc.patch \
-	file://0007-tscadc-Add-general-purpose-mode-untested-with-touchs.patch \
-	file://0008-tscadc-Add-board-file-mfd-support-fix-warning.patch \
-	file://0009-AM335X-init-tsc-bone-style-for-new-boards.patch \
-	file://0010-tscadc-make-stepconfig-channel-configurable.patch \
-	file://0011-tscadc-Trigger-through-sysfs.patch \
-	file://0012-meta-ti-Remove-debug-messages-for-meta-ti.patch \
-	file://0013-tscadc-switch-to-polling-instead-of-interrupts.patch \
-	file://0014-beaglebone-fix-ADC-init.patch \
-	file://0015-AM335x-MUX-add-ehrpwm1A.patch \
-	file://0016-beaglebone-enable-PWM-for-lcd-backlight-backlight-is.patch \
-	file://0017-omap_hsmmc-Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch \
-	file://0018-beaglebone-set-default-brightness-to-50-for-pwm-back.patch \
-	file://0019-st7735fb-WIP-framebuffer-driver-supporting-Adafruit-.patch \
-	file://0020-beaglebone-use-P8_6-gpio1_3-as-w1-bus.patch \
-	file://0021-beaglebone-add-support-for-Towertech-TT3201-CAN-cape.patch \
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index 33ae9bd..42a606d 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -299,6 +299,93 @@ PATCHES_OVER_PSP = " \
 	file://3.2.4/0003-Linux-3.2.4.patch \
 	file://3.2.5/0001-PCI-Rework-ASPM-disable-code.patch \
 	file://3.2.5/0002-Linux-3.2.5.patch \
+	file://3.2.6/0001-readahead-fix-pipeline-break-caused-by-block-plug.patch \
+	file://3.2.6/0002-ALSA-hda-Fix-the-logic-to-detect-VIA-analog-low-curr.patch \
+	file://3.2.6/0003-ALSA-HDA-Remove-quirk-for-Asus-N53Jq.patch \
+	file://3.2.6/0004-ALSA-hda-Apply-0x0f-VREF-fix-to-all-ASUS-laptops-wit.patch \
+	file://3.2.6/0005-ALSA-hda-Fix-calling-cs_automic-twice-for-Cirrus-cod.patch \
+	file://3.2.6/0006-ALSA-hda-Allow-analog-low-current-mode-when-dynamic-.patch \
+	file://3.2.6/0007-ALSA-HDA-Fix-duplicated-output-to-more-than-one-code.patch \
+	file://3.2.6/0008-ALSA-hda-Disable-dynamic-power-control-for-VIA-as-de.patch \
+	file://3.2.6/0009-ASoC-wm_hubs-Enable-line-out-VMID-buffer-for-single-.patch \
+	file://3.2.6/0010-ASoC-wm_hubs-fix-wrong-bits-for-LINEOUT2-N-P-mixer.patch \
+	file://3.2.6/0011-ARM-7306-1-vfp-flush-thread-hwstate-before-restoring.patch \
+	file://3.2.6/0012-ARM-7307-1-vfp-fix-ptrace-regset-modification-race.patch \
+	file://3.2.6/0013-ARM-7308-1-vfp-flush-thread-hwstate-before-copying-p.patch \
+	file://3.2.6/0014-ARM-OMAP2-GPMC-fix-device-size-setup.patch \
+	file://3.2.6/0015-drivers-tty-vt-vt_ioctl.c-fix-KDFONTOP-32bit-compati.patch \
+	file://3.2.6/0016-proc-mem_release-should-check-mm-NULL.patch \
+	file://3.2.6/0017-proc-unify-mem_read-and-mem_write.patch \
+	file://3.2.6/0018-proc-make-sure-mem_open-doesn-t-pin-the-target-s-mem.patch \
+	file://3.2.6/0019-firewire-ohci-add-reset-packet-quirk-for-SB-Audigy.patch \
+	file://3.2.6/0020-firewire-ohci-disable-MSI-on-Ricoh-controllers.patch \
+	file://3.2.6/0021-IB-mlx4-pass-SMP-vendor-specific-attribute-MADs-to-f.patch \
+	file://3.2.6/0022-RDMA-core-Fix-kernel-panic-by-always-initializing-qp.patch \
+	file://3.2.6/0023-kprobes-fix-a-memory-leak-in-function-pre_handler_kr.patch \
+	file://3.2.6/0024-mtd-gpmi-nand-bugfix-reset-the-BCH-module-when-it-is.patch \
+	file://3.2.6/0025-Revert-mtd-atmel_nand-optimize-read-write-buffer-fun.patch \
+	file://3.2.6/0026-at_hdmac-bugfix-for-enabling-channel-irq.patch \
+	file://3.2.6/0027-mm-filemap_xip.c-fix-race-condition-in-xip_file_faul.patch \
+	file://3.2.6/0028-mm-compaction-check-pfn_valid-when-entering-a-new-MA.patch \
+	file://3.2.6/0029-PM-Hibernate-Fix-s2disk-regression-related-to-freezi.patch \
+	file://3.2.6/0030-PM-QoS-CPU-C-state-breakage-with-PM-Qos-change.patch \
+	file://3.2.6/0031-drm-radeon-Set-DESKTOP_HEIGHT-register-to-the-frameb.patch \
+	file://3.2.6/0032-drm-nouveau-gem-fix-fence_sync-race-oops.patch \
+	file://3.2.6/0033-drm-radeon-kms-disable-output-polling-when-suspended.patch \
+	file://3.2.6/0034-drm-radeon-kms-fix-TRAVIS-panel-setup.patch \
+	file://3.2.6/0035-sched-rt-Fix-task-stack-corruption-under-__ARCH_WANT.patch \
+	file://3.2.6/0036-PM-Hibernate-Thaw-processes-in-SNAPSHOT_CREATE_IMAGE.patch \
+	file://3.2.6/0037-PM-Hibernate-Thaw-kernel-threads-in-SNAPSHOT_CREATE_.patch \
+	file://3.2.6/0038-8139cp-fix-missing-napi_gro_flush.patch \
+	file://3.2.6/0039-udf-Mark-LVID-buffer-as-uptodate-before-marking-it-d.patch \
+	file://3.2.6/0040-drm-i915-HDMI-hot-remove-notification-to-audio-drive.patch \
+	file://3.2.6/0041-drm-i915-DisplayPort-hot-remove-notification-to-audi.patch \
+	file://3.2.6/0042-drm-i915-check-ACTHD-of-all-rings.patch \
+	file://3.2.6/0043-drm-i915-Fix-TV-Out-refresh-rate.patch \
+	file://3.2.6/0044-drm-i915-handle-3rd-pipe.patch \
+	file://3.2.6/0045-drm-i915-convert-force_wake_get-to-func-pointer-in-t.patch \
+	file://3.2.6/0046-drm-i915-protect-force_wake_-get-put-with-the-gt_loc.patch \
+	file://3.2.6/0047-eCryptfs-Infinite-loop-due-to-overflow-in-ecryptfs_w.patch \
+	file://3.2.6/0048-hwmon-w83627ehf-Fix-number-of-fans-for-NCT6776F.patch \
+	file://3.2.6/0049-cifs-Fix-oops-in-session-setup-code-for-null-user-mo.patch \
+	file://3.2.6/0050-atmel_lcdfb-fix-usage-of-CONTRAST_CTR-in-suspend-res.patch \
+	file://3.2.6/0051-lockdep-bug-Exclude-TAINT_FIRMWARE_WORKAROUND-from-d.patch \
+	file://3.2.6/0052-lockdep-bug-Exclude-TAINT_OOT_MODULE-from-disabling-.patch \
+	file://3.2.6/0053-iscsi-target-Fix-reject-release-handling-in-iscsit_f.patch \
+	file://3.2.6/0054-iscsi-target-Fix-double-list_add-with-iscsit_alloc_b.patch \
+	file://3.2.6/0055-iscsi-target-Fix-discovery-with-INADDR_ANY-and-IN6AD.patch \
+	file://3.2.6/0056-ASoC-wm_hubs-Fix-routing-of-input-PGAs-to-line-outpu.patch \
+	file://3.2.6/0057-ASoC-wm_hubs-Correct-line-input-to-line-output-2-pat.patch \
+	file://3.2.6/0058-ASoC-wm8962-Fix-word-length-configuration.patch \
+	file://3.2.6/0059-ASoC-wm8994-Enabling-VMID-should-take-a-runtime-PM-r.patch \
+	file://3.2.6/0060-ASoC-wm8994-Fix-typo-in-VMID-ramp-setting.patch \
+	file://3.2.6/0061-pcmcia-fix-socket-refcount-decrementing-on-each-resu.patch \
+	file://3.2.6/0062-ALSA-oxygen-virtuoso-fix-exchanged-L-R-volumes-of-au.patch \
+	file://3.2.6/0063-iommu-amd-Work-around-broken-IVRS-tables.patch \
+	file://3.2.6/0064-iommu-msm-Fix-error-handling-in-msm_iommu_unmap.patch \
+	file://3.2.6/0065-mm-compaction-check-for-overlapping-nodes-during-iso.patch \
+	file://3.2.6/0066-mm-fix-UP-THP-spin_is_locked-BUGs.patch \
+	file://3.2.6/0067-target-Use-correct-preempted-registration-sense-code.patch \
+	file://3.2.6/0068-target-Allow-PERSISTENT-RESERVE-IN-for-non-reservati.patch \
+	file://3.2.6/0069-target-Correct-sense-key-for-INVALID-FIELD-IN-PARAME.patch \
+	file://3.2.6/0070-target-Add-workaround-for-zero-length-control-CDB-ha.patch \
+	file://3.2.6/0071-target-Return-correct-ASC-for-unimplemented-VPD-page.patch \
+	file://3.2.6/0072-target-Fail-INQUIRY-commands-with-EVPD-0-but-PAGE-CO.patch \
+	file://3.2.6/0073-Staging-asus_oled-fix-image-processing.patch \
+	file://3.2.6/0074-Staging-asus_oled-fix-NULL-ptr-crash-on-unloading.patch \
+	file://3.2.6/0075-staging-r8712u-Add-new-Sitecom-UsB-ID.patch \
+	file://3.2.6/0076-staging-r8712u-Use-asynchronous-firmware-loading.patch \
+	file://3.2.6/0077-usb-ch9.h-usb_endpoint_maxp-uses-__le16_to_cpu.patch \
+	file://3.2.6/0078-usb-gadget-zero-fix-bug-in-loopback-autoresume-handl.patch \
+	file://3.2.6/0079-usb-Skip-PCI-USB-quirk-handling-for-Netlogic-XLP.patch \
+	file://3.2.6/0080-USB-usbserial-add-new-PID-number-0xa951-to-the-ftdi-.patch \
+	file://3.2.6/0081-USB-add-new-zte-3g-dongle-s-pid-to-option.c.patch \
+	file://3.2.6/0082-zcache-Set-SWIZ_BITS-to-8-to-reduce-tmem-bucket-lock.patch \
+	file://3.2.6/0083-zcache-fix-deadlock-condition.patch \
+	file://3.2.6/0084-mmc-cb710-core-Add-missing-spin_lock_init-for-irq_lo.patch \
+	file://3.2.6/0085-powernow-k8-Avoid-Pstate-MSR-accesses-on-systems-sup.patch \
+	file://3.2.6/0086-powernow-k8-Fix-indexing-issue.patch \
+	file://3.2.6/0087-Linux-3.2.6.patch \
 	file://0002-f_rndis-HACK-around-undefined-variables.patch \
 	file://0003-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://0004-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
-- 
1.7.2.5


