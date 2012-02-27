Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4453AE0074A
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 06:12:30 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 1EB1852995; Mon, 27 Feb 2012 14:12:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120227141229.1EB1852995@arago-project.org>
Date: Mon, 27 Feb 2012 14:12:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : linux-ti335x-psp 3.2: update to 3.2.6
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
Commit: 2425d6e457b51e756a742c58494e86d36fca0839
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=2425d6e457b51e756a742c58494e86d36fca0839

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Tue Feb 14 19:11:39 2012 +0100

linux-ti335x-psp 3.2: update to 3.2.6

Readahead fixed!

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

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

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=2425d6e457b51e756a742c58494e86d36fca0839

