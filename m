Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6446E0044D
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 30 Mar 2012 11:58:31 -0700 (PDT)
Received: by werm13 with SMTP id m13so649240wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 30 Mar 2012 11:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:mime-version
	:x-gm-message-state:content-type:content-transfer-encoding;
	bh=MRzDjUYCnhxR/QahJS6hm6wq0t77wfSBxIeBITQAuvw=;
	b=FUuGyuD93bZcagjEbravhrwLPu+HXHFvxYh6Np2YS2b2AY/4fcHIHzRTz3dc5mQsJR
	x2pqpTsEfDFkYStzbkLceciVKBfZAk8LOwNVqBETR8ei6hJhaFyDdkosQ2BTS5Z8liD3
	N3H7YF1kMdRusccD1rvEuATF2mC0xwpS2QRBGX6COFn/Knz7wntqilvGF3QjOApKxHaU
	+qVvtSzpHxKbJVbS9Jlrau+Ka0aIr4LdGYEiJt+VmtPGazetGK+qTQHKrYFMwbSXxYw0
	gz+4mcKgWyjK/rjagcrFf+72I/ntjdNiw/KbLROO8VQxOC/vyVJU22wgrDhla0IiyyWl
	nJ/w==
Received: by 10.180.104.230 with SMTP id gh6mr761648wib.22.1333133910017;
	Fri, 30 Mar 2012 11:58:30 -0700 (PDT)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id j3sm13794702wiw.1.2012.03.30.11.58.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Mar 2012 11:58:28 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 30 Mar 2012 20:58:22 +0200
Message-Id: <1333133904-14404-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQmbnPU7Esj06d+OX7yGj6BBqmz+UK+3i9B39XVMI9MRMjE7QhkcU41uGPb/6+Fr6lSqOr/W
Cc: denys@ti.com
Subject: [PATCH 1/3] linux-ti33x-psp 3.2: update to 3.2.13
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
X-List-Received-Date: Fri, 30 Mar 2012 18:58:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
Also available from https://github.com/angstrom-distribution/meta-ti/tree/pull20123003


 conf/machine/include/ti33x.inc                     |    2 +-
 ...neo1973-fix-neo1973-wm8753-initialization.patch |   42 +++
 ...altek-Apply-the-coef-setup-only-to-ALC269.patch |   56 ++++
 .../0003-aio-fix-io_setup-io_destroy-race.patch    |   54 ++++
 .../0004-aio-fix-the-too-late-munmap-race.patch    |   81 ++++++
 .../0005-x86-Derandom-delay_tsc-for-64-bit.patch   |   63 +++++
 ...pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch |   38 +++
 ...ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch |   40 +++
 .../3.2.12/0008-rt2x00-fix-random-stalls.patch     |   99 +++++++
 ...x-local-vs-remote-memory-events-for-NHM-W.patch |  222 +++++++++++++++
 ...-Do-not-kmalloc-under-the-flocks-spinlock.patch |  140 ++++++++++
 .../0011-vfs-fix-return-value-from-do_last.patch   |   34 +++
 ...12-vfs-fix-double-put-after-complete_walk.patch |   35 +++
 ...cer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch |   77 ++++++
 .../0014-atl1c-dont-use-highprio-tx-queue.patch    |   51 ++++
 ...neighbour-Fixed-race-condition-at-tbl-nht.patch |   48 ++++
 ...ec-be-careful-of-non-existing-mac-headers.patch |  144 ++++++++++
 ...ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch |   90 ++++++
 ...ignment-of-ip_summed-for-pre-allocated-sk.patch |   56 ++++
 ...alse-reordering-signal-in-tcp_shifted_skb.patch |   72 +++++
 .../0020-vmxnet3-Fix-transport-header-size.patch   |   58 ++++
 .../0021-packetengines-fix-config-default.patch    |   33 +++
 ...-corrupted-IP-fragments-fix-for-large-mtu.patch |   49 ++++
 ...ragment-SACKed-skbs-in-tcp_mark_head_lost.patch |   55 ++++
 ...-check-return-value-of-ipv6_dev_get_saddr.patch |   39 +++
 ..._shift_skb_data-to-not-shift-SACKed-data-.patch |   89 ++++++
 ...t-join-all-router-mcast-group-when-forwar.patch |   36 +++
 .../0027-usb-asix-Patch-for-Sitecom-LN-031.patch   |   36 +++
 ...ix-setting-selector-in-tps6524x-set_volta.patch |   33 +++
 ...ULL-pointer-dereference-in-sd_revalidate_.patch |  170 ++++++++++++
 ...fix-pointer-math-issue-getting-fw-version.patch |   34 +++
 ...-__blkdev_get-and-add_disk-race-condition.patch |  163 +++++++++++
 ...-freezable-workqueue-for-disk-event-polli.patch |  129 +++++++++
 ...sparc32-Add-Av8-to-assembler-command-line.patch |   40 +++
 ...7ehf-Fix-writing-into-fan_stop_time-for-N.patch |   35 +++
 ...3627ehf-Fix-memory-leak-in-probe-function.patch |   53 ++++
 ...-w83627ehf-Fix-temp2-source-for-W83627UHG.patch |   69 +++++
 ...721-fix-bug-in-register-offset-definition.patch |  103 +++++++
 ...t-Fix-spurious-SCL-timeouts-under-heavy-l.patch |   46 ++++
 ...t-Fix-reservation-conflict-EBUSY-response.patch |   51 ++++
 ...compatible-reservation-handling-CRH-1-wit.patch |  152 +++++++++++
 ...0-Enable-interval-between-chip-accesses-f.patch |   72 +++++
 .../3.2.12/0042-Linux-3.2.12.patch                 |   24 ++
 ...NULL-pointer-dereference-in-nilfs_load_su.patch |   62 +++++
 .../0002-afs-Read-of-file-returns-EBADMSG.patch    |   56 ++++
 ...-Remote-abort-can-cause-BUG-in-rxrpc-code.patch |   68 +++++
 ...Incorrect-use-of-snprintf-results-in-SEGV.patch |   66 +++++
 ...perf-tools-Use-scnprintf-where-applicable.patch |  283 ++++++++++++++++++++
 .../3.2.13/0006-tcp-fix-syncookie-regression.patch |  111 ++++++++
 ...Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch |   36 +++
 ...-possible-il-txq-NULL-pointer-dereference.patch |   63 +++++
 ...c-Fix-SMP-kernels-on-pre-core99-UP-machin.patch |   36 +++
 .../3.2.13/0010-Linux-3.2.13.patch                 |   24 ++
 recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh  |    2 +-
 recipes-kernel/linux/linux-ti33x-psp_3.2.bb        |   52 ++++
 55 files changed, 3870 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0001-ASoC-neo1973-fix-neo1973-wm8753-initialization.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0002-ALSA-hda-realtek-Apply-the-coef-setup-only-to-ALC269.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0003-aio-fix-io_setup-io_destroy-race.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0004-aio-fix-the-too-late-munmap-race.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0005-x86-Derandom-delay_tsc-for-64-bit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0006-PCI-ignore-pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0007-omap3isp-ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0008-rt2x00-fix-random-stalls.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0009-perf-x86-Fix-local-vs-remote-memory-events-for-NHM-W.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0010-CIFS-Do-not-kmalloc-under-the-flocks-spinlock.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0011-vfs-fix-return-value-from-do_last.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0012-vfs-fix-double-put-after-complete_walk.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0013-acer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0014-atl1c-dont-use-highprio-tx-queue.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0015-neighbour-Fixed-race-condition-at-tbl-nht.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0016-ipsec-be-careful-of-non-existing-mac-headers.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0017-ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0018-sfc-Fix-assignment-of-ip_summed-for-pre-allocated-sk.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0019-tcp-fix-false-reordering-signal-in-tcp_shifted_skb.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0020-vmxnet3-Fix-transport-header-size.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0021-packetengines-fix-config-default.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0022-r8169-corrupted-IP-fragments-fix-for-large-mtu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0023-tcp-don-t-fragment-SACKed-skbs-in-tcp_mark_head_lost.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0024-bridge-check-return-value-of-ipv6_dev_get_saddr.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0025-tcp-fix-tcp_shift_skb_data-to-not-shift-SACKed-data-.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0026-IPv6-Fix-not-join-all-router-mcast-group-when-forwar.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0027-usb-asix-Patch-for-Sitecom-LN-031.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0028-regulator-Fix-setting-selector-in-tps6524x-set_volta.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0029-block-Fix-NULL-pointer-dereference-in-sd_revalidate_.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0030-block-sx8-fix-pointer-math-issue-getting-fw-version.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0031-block-fix-__blkdev_get-and-add_disk-race-condition.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0032-Block-use-a-freezable-workqueue-for-disk-event-polli.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0033-sparc32-Add-Av8-to-assembler-command-line.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0034-hwmon-w83627ehf-Fix-writing-into-fan_stop_time-for-N.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0035-hwmon-w83627ehf-Fix-memory-leak-in-probe-function.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0036-hwmon-w83627ehf-Fix-temp2-source-for-W83627UHG.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0037-rapidio-tsi721-fix-bug-in-register-offset-definition.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0038-i2c-algo-bit-Fix-spurious-SCL-timeouts-under-heavy-l.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0039-iscsi-target-Fix-reservation-conflict-EBUSY-response.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0040-target-Fix-compatible-reservation-handling-CRH-1-wit.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0041-hwmon-zl6100-Enable-interval-between-chip-accesses-f.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0042-Linux-3.2.12.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0001-nilfs2-fix-NULL-pointer-dereference-in-nilfs_load_su.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0002-afs-Read-of-file-returns-EBADMSG.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0003-afs-Remote-abort-can-cause-BUG-in-rxrpc-code.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0004-perf-tools-Incorrect-use-of-snprintf-results-in-SEGV.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0005-perf-tools-Use-scnprintf-where-applicable.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0006-tcp-fix-syncookie-regression.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0007-ipv6-Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0008-iwl3945-fix-possible-il-txq-NULL-pointer-dereference.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0009-powerpc-pmac-Fix-SMP-kernels-on-pre-core99-UP-machin.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0010-Linux-3.2.13.patch

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index b8a5c88..39cc130 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa8.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti33x-psp"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r6"
+MACHINE_KERNEL_PR = "r7"
 
 KERNEL_IMAGETYPE = "uImage"
 
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0001-ASoC-neo1973-fix-neo1973-wm8753-initialization.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0001-ASoC-neo1973-fix-neo1973-wm8753-initialization.patch
new file mode 100644
index 0000000..d25417a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0001-ASoC-neo1973-fix-neo1973-wm8753-initialization.patch
@@ -0,0 +1,42 @@
+From a1d89c5f542755e8508b072a1d2f9b295c6c028c Mon Sep 17 00:00:00 2001
+From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Date: Sun, 26 Feb 2012 19:21:54 +0100
+Subject: [PATCH 01/42] ASoC: neo1973: fix neo1973 wm8753 initialization
+
+commit b2ccf065f7b23147ed135a41b01d05a332ca6b7e upstream.
+
+The neo1973 driver had wrong codec name which prevented the "sound card"
+from appearing.
+
+Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/soc/samsung/neo1973_wm8753.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/sound/soc/samsung/neo1973_wm8753.c b/sound/soc/samsung/neo1973_wm8753.c
+index 7207189..2fba3f7 100644
+--- a/sound/soc/samsung/neo1973_wm8753.c
++++ b/sound/soc/samsung/neo1973_wm8753.c
+@@ -421,7 +421,7 @@ static struct snd_soc_dai_link neo1973_dai[] = {
+ 	.platform_name = "samsung-audio",
+ 	.cpu_dai_name = "s3c24xx-iis",
+ 	.codec_dai_name = "wm8753-hifi",
+-	.codec_name = "wm8753-codec.0-001a",
++	.codec_name = "wm8753.0-001a",
+ 	.init = neo1973_wm8753_init,
+ 	.ops = &neo1973_hifi_ops,
+ },
+@@ -430,7 +430,7 @@ static struct snd_soc_dai_link neo1973_dai[] = {
+ 	.stream_name = "Voice",
+ 	.cpu_dai_name = "dfbmcs320-pcm",
+ 	.codec_dai_name = "wm8753-voice",
+-	.codec_name = "wm8753-codec.0-001a",
++	.codec_name = "wm8753.0-001a",
+ 	.ops = &neo1973_voice_ops,
+ },
+ };
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0002-ALSA-hda-realtek-Apply-the-coef-setup-only-to-ALC269.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0002-ALSA-hda-realtek-Apply-the-coef-setup-only-to-ALC269.patch
new file mode 100644
index 0000000..b11376b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0002-ALSA-hda-realtek-Apply-the-coef-setup-only-to-ALC269.patch
@@ -0,0 +1,56 @@
+From 87e095818ba51e16500206f1507590d8cd3127ef Mon Sep 17 00:00:00 2001
+From: Kailang Yang <kailang@realtek.com>
+Date: Wed, 7 Mar 2012 08:25:20 +0100
+Subject: [PATCH 02/42] ALSA: hda/realtek - Apply the coef-setup only to
+ ALC269VB
+
+commit 526af6eb4dc71302f59806e2ccac7793963a7fe0 upstream.
+
+The coef setup in alc269_fill_coef() was designed only for ALC269VB
+model, and this has some bad effects for other ALC269 variants, such
+as turning off the external mic input.  Apply it only to ALC269VB.
+
+Signed-off-by: Kailang Yang <kailang@realtek.com>
+Signed-off-by: Takashi Iwai <tiwai@suse.de>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ sound/pci/hda/patch_realtek.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
+index 3d8fbf4..dc8a6fc 100644
+--- a/sound/pci/hda/patch_realtek.c
++++ b/sound/pci/hda/patch_realtek.c
+@@ -2063,12 +2063,16 @@ static int alc_build_controls(struct hda_codec *codec)
+  */
+ 
+ static void alc_init_special_input_src(struct hda_codec *codec);
++static int alc269_fill_coef(struct hda_codec *codec);
+ 
+ static int alc_init(struct hda_codec *codec)
+ {
+ 	struct alc_spec *spec = codec->spec;
+ 	unsigned int i;
+ 
++	if (codec->vendor_id == 0x10ec0269)
++		alc269_fill_coef(codec);
++
+ 	alc_fix_pll(codec);
+ 	alc_auto_init_amp(codec, spec->init_amp);
+ 
+@@ -5110,8 +5114,12 @@ static const struct alc_model_fixup alc269_fixup_models[] = {
+ 
+ static int alc269_fill_coef(struct hda_codec *codec)
+ {
++	struct alc_spec *spec = codec->spec;
+ 	int val;
+ 
++	if (spec->codec_variant != ALC269_TYPE_ALC269VB)
++		return 0;
++
+ 	if ((alc_get_coef0(codec) & 0x00ff) < 0x015) {
+ 		alc_write_coef_idx(codec, 0xf, 0x960b);
+ 		alc_write_coef_idx(codec, 0xe, 0x8817);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0003-aio-fix-io_setup-io_destroy-race.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0003-aio-fix-io_setup-io_destroy-race.patch
new file mode 100644
index 0000000..a01113a
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0003-aio-fix-io_setup-io_destroy-race.patch
@@ -0,0 +1,54 @@
+From e5459681303b77f0525bb3311ce20b05e570ae04 Mon Sep 17 00:00:00 2001
+From: Al Viro <viro@ZenIV.linux.org.uk>
+Date: Wed, 7 Mar 2012 05:16:35 +0000
+Subject: [PATCH 03/42] aio: fix io_setup/io_destroy race
+
+commit 86b62a2cb4fc09037bbce2959d2992962396fd7f upstream.
+
+Have ioctx_alloc() return an extra reference, so that caller would drop it
+on success and not bother with re-grabbing it on failure exit.  The current
+code is obviously broken - io_destroy() from another thread that managed
+to guess the address io_setup() would've returned would free ioctx right
+under us; gets especially interesting if aio_context_t * we pass to
+io_setup() points to PROT_READ mapping, so put_user() fails and we end
+up doing io_destroy() on kioctx another thread has just got freed...
+
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Acked-by: Benjamin LaHaise <bcrl@kvack.org>
+Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/aio.c |    8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/fs/aio.c b/fs/aio.c
+index 67e4b90..f6578cb 100644
+--- a/fs/aio.c
++++ b/fs/aio.c
+@@ -273,7 +273,7 @@ static struct kioctx *ioctx_alloc(unsigned nr_events)
+ 	mm = ctx->mm = current->mm;
+ 	atomic_inc(&mm->mm_count);
+ 
+-	atomic_set(&ctx->users, 1);
++	atomic_set(&ctx->users, 2);
+ 	spin_lock_init(&ctx->ctx_lock);
+ 	spin_lock_init(&ctx->ring_info.ring_lock);
+ 	init_waitqueue_head(&ctx->wait);
+@@ -1338,10 +1338,10 @@ SYSCALL_DEFINE2(io_setup, unsigned, nr_events, aio_context_t __user *, ctxp)
+ 	ret = PTR_ERR(ioctx);
+ 	if (!IS_ERR(ioctx)) {
+ 		ret = put_user(ioctx->user_id, ctxp);
+-		if (!ret)
++		if (!ret) {
++			put_ioctx(ioctx);
+ 			return 0;
+-
+-		get_ioctx(ioctx); /* io_destroy() expects us to hold a ref */
++		}
+ 		io_destroy(ioctx);
+ 	}
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0004-aio-fix-the-too-late-munmap-race.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0004-aio-fix-the-too-late-munmap-race.patch
new file mode 100644
index 0000000..00ba981
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0004-aio-fix-the-too-late-munmap-race.patch
@@ -0,0 +1,81 @@
+From a0e1937b89ad227fad39dd1f0edb83d57dc46c12 Mon Sep 17 00:00:00 2001
+From: Al Viro <viro@ZenIV.linux.org.uk>
+Date: Thu, 8 Mar 2012 17:51:19 +0000
+Subject: [PATCH 04/42] aio: fix the "too late munmap()" race
+
+commit c7b285550544c22bc005ec20978472c9ac7138c6 upstream.
+
+Current code has put_ioctx() called asynchronously from aio_fput_routine();
+that's done *after* we have killed the request that used to pin ioctx,
+so there's nothing to stop io_destroy() waiting in wait_for_all_aios()
+from progressing.  As the result, we can end up with async call of
+put_ioctx() being the last one and possibly happening during exit_mmap()
+or elf_core_dump(), neither of which expects stray munmap() being done
+to them...
+
+We do need to prevent _freeing_ ioctx until aio_fput_routine() is done
+with that, but that's all we care about - neither io_destroy() nor
+exit_aio() will progress past wait_for_all_aios() until aio_fput_routine()
+does really_put_req(), so the ioctx teardown won't be done until then
+and we don't care about the contents of ioctx past that point.
+
+Since actual freeing of these suckers is RCU-delayed, we don't need to
+bump ioctx refcount when request goes into list for async removal.
+All we need is rcu_read_lock held just over the ->ctx_lock-protected
+area in aio_fput_routine().
+
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Reviewed-by: Jeff Moyer <jmoyer@redhat.com>
+Acked-by: Benjamin LaHaise <bcrl@kvack.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/aio.c |   14 ++++++--------
+ 1 file changed, 6 insertions(+), 8 deletions(-)
+
+diff --git a/fs/aio.c b/fs/aio.c
+index f6578cb..b9d64d8 100644
+--- a/fs/aio.c
++++ b/fs/aio.c
+@@ -228,12 +228,6 @@ static void __put_ioctx(struct kioctx *ctx)
+ 	call_rcu(&ctx->rcu_head, ctx_rcu_free);
+ }
+ 
+-static inline void get_ioctx(struct kioctx *kioctx)
+-{
+-	BUG_ON(atomic_read(&kioctx->users) <= 0);
+-	atomic_inc(&kioctx->users);
+-}
+-
+ static inline int try_get_ioctx(struct kioctx *kioctx)
+ {
+ 	return atomic_inc_not_zero(&kioctx->users);
+@@ -609,11 +603,16 @@ static void aio_fput_routine(struct work_struct *data)
+ 			fput(req->ki_filp);
+ 
+ 		/* Link the iocb into the context's free list */
++		rcu_read_lock();
+ 		spin_lock_irq(&ctx->ctx_lock);
+ 		really_put_req(ctx, req);
++		/*
++		 * at that point ctx might've been killed, but actual
++		 * freeing is RCU'd
++		 */
+ 		spin_unlock_irq(&ctx->ctx_lock);
++		rcu_read_unlock();
+ 
+-		put_ioctx(ctx);
+ 		spin_lock_irq(&fput_lock);
+ 	}
+ 	spin_unlock_irq(&fput_lock);
+@@ -644,7 +643,6 @@ static int __aio_put_req(struct kioctx *ctx, struct kiocb *req)
+ 	 * this function will be executed w/out any aio kthread wakeup.
+ 	 */
+ 	if (unlikely(!fput_atomic(req->ki_filp))) {
+-		get_ioctx(ctx);
+ 		spin_lock(&fput_lock);
+ 		list_add(&req->ki_list, &fput_head);
+ 		spin_unlock(&fput_lock);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0005-x86-Derandom-delay_tsc-for-64-bit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0005-x86-Derandom-delay_tsc-for-64-bit.patch
new file mode 100644
index 0000000..29ebbba
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0005-x86-Derandom-delay_tsc-for-64-bit.patch
@@ -0,0 +1,63 @@
+From fc10b28e82caa4d0a793b9ec9657dedbd1c2afd8 Mon Sep 17 00:00:00 2001
+From: Thomas Gleixner <tglx@linutronix.de>
+Date: Fri, 9 Mar 2012 20:55:10 +0100
+Subject: [PATCH 05/42] x86: Derandom delay_tsc for 64 bit
+
+commit a7f4255f906f60f72e00aad2fb000939449ff32e upstream.
+
+Commit f0fbf0abc093 ("x86: integrate delay functions") converted
+delay_tsc() into a random delay generator for 64 bit.  The reason is
+that it merged the mostly identical versions of delay_32.c and
+delay_64.c.  Though the subtle difference of the result was:
+
+ static void delay_tsc(unsigned long loops)
+ {
+-	unsigned bclock, now;
++	unsigned long bclock, now;
+
+Now the function uses rdtscl() which returns the lower 32bit of the
+TSC. On 32bit that's not problematic as unsigned long is 32bit. On 64
+bit this fails when the lower 32bit are close to wrap around when
+bclock is read, because the following check
+
+       if ((now - bclock) >= loops)
+       	  	break;
+
+evaluated to true on 64bit for e.g. bclock = 0xffffffff and now = 0
+because the unsigned long (now - bclock) of these values results in
+0xffffffff00000001 which is definitely larger than the loops
+value. That explains Tvortkos observation:
+
+"Because I am seeing udelay(500) (_occasionally_) being short, and
+ that by delaying for some duration between 0us (yep) and 491us."
+
+Make those variables explicitely u32 again, so this works for both 32
+and 64 bit.
+
+Reported-by: Tvrtko Ursulin <tvrtko.ursulin@onelan.co.uk>
+Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/lib/delay.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arch/x86/lib/delay.c b/arch/x86/lib/delay.c
+index fc45ba8..e395693 100644
+--- a/arch/x86/lib/delay.c
++++ b/arch/x86/lib/delay.c
+@@ -48,9 +48,9 @@ static void delay_loop(unsigned long loops)
+ }
+ 
+ /* TSC based delay: */
+-static void delay_tsc(unsigned long loops)
++static void delay_tsc(unsigned long __loops)
+ {
+-	unsigned long bclock, now;
++	u32 bclock, now, loops = __loops;
+ 	int cpu;
+ 
+ 	preempt_disable();
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0006-PCI-ignore-pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0006-PCI-ignore-pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch
new file mode 100644
index 0000000..6129b69
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0006-PCI-ignore-pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch
@@ -0,0 +1,38 @@
+From 7d3540104ba156ddc2a80f5c9608958faad01cec Mon Sep 17 00:00:00 2001
+From: Matthew Garrett <mjg@redhat.com>
+Date: Tue, 6 Mar 2012 13:41:49 -0500
+Subject: [PATCH 06/42] PCI: ignore pre-1.1 ASPM quirking when ASPM is
+ disabled
+
+commit 4949be16822e92a18ea0cc1616319926628092ee upstream.
+
+Right now we won't touch ASPM state if ASPM is disabled, except in the case
+where we find a device that appears to be too old to reliably support ASPM.
+Right now we'll clear it in that case, which is almost certainly the wrong
+thing to do. The easiest way around this is just to disable the blacklisting
+when ASPM is disabled.
+
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+Signed-off-by: Jesse Barnes <jbarnes@virtuousgeek.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/pci/pcie/aspm.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
+index 1cfbf22..24f049e 100644
+--- a/drivers/pci/pcie/aspm.c
++++ b/drivers/pci/pcie/aspm.c
+@@ -500,6 +500,9 @@ static int pcie_aspm_sanity_check(struct pci_dev *pdev)
+ 	int pos;
+ 	u32 reg32;
+ 
++	if (aspm_disabled)
++		return 0;
++
+ 	/*
+ 	 * Some functions in a slot might not all be PCIe functions,
+ 	 * very strange. Disable ASPM for the whole slot
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0007-omap3isp-ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0007-omap3isp-ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch
new file mode 100644
index 0000000..a5c82fd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0007-omap3isp-ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch
@@ -0,0 +1,40 @@
+From 53af81856eb79f36e3c497dd12c3875c3c340411 Mon Sep 17 00:00:00 2001
+From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Date: Fri, 11 Nov 2011 11:22:20 -0300
+Subject: [PATCH 07/42] omap3isp: ccdc: Fix crash in HS/VS interrupt handler
+
+commit bd0f2e6da7ea9e225cb2dbd3229e25584b0e9538 upstream.
+
+The HS/VS interrupt handler needs to access the pipeline object. It
+erronously tries to get it from the CCDC output video node, which isn't
+necessarily included in the pipeline. This leads to a NULL pointer
+dereference.
+
+Fix the bug by getting the pipeline object from the CCDC subdev entity.
+
+Reported-by: Gary Thomas <gary@mlbassoc.com>
+Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
+Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
+Signed-off-by: Mauro Carvalho Chehab <mchehab@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/media/video/omap3isp/ispccdc.c |    3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/drivers/media/video/omap3isp/ispccdc.c b/drivers/media/video/omap3isp/ispccdc.c
+index 54a4a3f..a319281 100644
+--- a/drivers/media/video/omap3isp/ispccdc.c
++++ b/drivers/media/video/omap3isp/ispccdc.c
+@@ -1406,8 +1406,7 @@ static int __ccdc_handle_stopping(struct isp_ccdc_device *ccdc, u32 event)
+ 
+ static void ccdc_hs_vs_isr(struct isp_ccdc_device *ccdc)
+ {
+-	struct isp_pipeline *pipe =
+-		to_isp_pipeline(&ccdc->video_out.video.entity);
++	struct isp_pipeline *pipe = to_isp_pipeline(&ccdc->subdev.entity);
+ 	struct video_device *vdev = ccdc->subdev.devnode;
+ 	struct v4l2_event event;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0008-rt2x00-fix-random-stalls.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0008-rt2x00-fix-random-stalls.patch
new file mode 100644
index 0000000..1784526
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0008-rt2x00-fix-random-stalls.patch
@@ -0,0 +1,99 @@
+From c27583afc5c12c3731697b41e6a7c4fa2a239fae Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Fri, 9 Mar 2012 12:39:54 +0100
+Subject: [PATCH 08/42] rt2x00: fix random stalls
+
+commit 3780d038fdf4b5ef26ead10b0604ab1f46dd9510 upstream.
+
+Is possible that we stop queue and then do not wake up it again,
+especially when packets are transmitted fast. That can be easily
+reproduced with modified tx queue entry_num to some small value e.g. 16.
+
+If mac80211 already hold local->queue_stop_reason_lock, then we can wait
+on that lock in both rt2x00queue_pause_queue() and
+rt2x00queue_unpause_queue(). After drooping ->queue_stop_reason_lock
+is possible that __ieee80211_wake_queue() will be performed before
+__ieee80211_stop_queue(), hence we stop queue and newer wake up it
+again.
+
+Another race condition is possible when between rt2x00queue_threshold()
+check and rt2x00queue_pause_queue() we will process all pending tx
+buffers on different cpu. This might happen if for example interrupt
+will be triggered on cpu performing rt2x00mac_tx().
+
+To prevent race conditions serialize pause/unpause by queue->tx_lock.
+
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Acked-by: Gertjan van Wingerde <gwingerde@gmail.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/wireless/rt2x00/rt2x00dev.c   |    6 +++++-
+ drivers/net/wireless/rt2x00/rt2x00mac.c   |    9 +++++++++
+ drivers/net/wireless/rt2x00/rt2x00queue.c |    3 +++
+ 3 files changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/net/wireless/rt2x00/rt2x00dev.c b/drivers/net/wireless/rt2x00/rt2x00dev.c
+index edd317f..21b529b 100644
+--- a/drivers/net/wireless/rt2x00/rt2x00dev.c
++++ b/drivers/net/wireless/rt2x00/rt2x00dev.c
+@@ -426,10 +426,14 @@ void rt2x00lib_txdone(struct queue_entry *entry,
+ 	/*
+ 	 * If the data queue was below the threshold before the txdone
+ 	 * handler we must make sure the packet queue in the mac80211 stack
+-	 * is reenabled when the txdone handler has finished.
++	 * is reenabled when the txdone handler has finished. This has to be
++	 * serialized with rt2x00mac_tx(), otherwise we can wake up queue
++	 * before it was stopped.
+ 	 */
++	spin_lock_bh(&entry->queue->tx_lock);
+ 	if (!rt2x00queue_threshold(entry->queue))
+ 		rt2x00queue_unpause_queue(entry->queue);
++	spin_unlock_bh(&entry->queue->tx_lock);
+ }
+ EXPORT_SYMBOL_GPL(rt2x00lib_txdone);
+ 
+diff --git a/drivers/net/wireless/rt2x00/rt2x00mac.c b/drivers/net/wireless/rt2x00/rt2x00mac.c
+index bf0acff..373dae1 100644
+--- a/drivers/net/wireless/rt2x00/rt2x00mac.c
++++ b/drivers/net/wireless/rt2x00/rt2x00mac.c
+@@ -152,13 +152,22 @@ void rt2x00mac_tx(struct ieee80211_hw *hw, struct sk_buff *skb)
+ 	if (unlikely(rt2x00queue_write_tx_frame(queue, skb, false)))
+ 		goto exit_fail;
+ 
++	/*
++	 * Pausing queue has to be serialized with rt2x00lib_txdone(). Note
++	 * we should not use spin_lock_bh variant as bottom halve was already
++	 * disabled before ieee80211_xmit() call.
++	 */
++	spin_lock(&queue->tx_lock);
+ 	if (rt2x00queue_threshold(queue))
+ 		rt2x00queue_pause_queue(queue);
++	spin_unlock(&queue->tx_lock);
+ 
+ 	return;
+ 
+  exit_fail:
++	spin_lock(&queue->tx_lock);
+ 	rt2x00queue_pause_queue(queue);
++	spin_unlock(&queue->tx_lock);
+  exit_free_skb:
+ 	dev_kfree_skb_any(skb);
+ }
+diff --git a/drivers/net/wireless/rt2x00/rt2x00queue.c b/drivers/net/wireless/rt2x00/rt2x00queue.c
+index 5adfb3e..9b1b2b7 100644
+--- a/drivers/net/wireless/rt2x00/rt2x00queue.c
++++ b/drivers/net/wireless/rt2x00/rt2x00queue.c
+@@ -619,6 +619,9 @@ int rt2x00queue_write_tx_frame(struct data_queue *queue, struct sk_buff *skb,
+ 	else if (test_bit(REQUIRE_DMA, &queue->rt2x00dev->cap_flags))
+ 		rt2x00queue_align_frame(skb);
+ 
++	/*
++	 * That function must be called with bh disabled.
++	 */
+ 	spin_lock(&queue->tx_lock);
+ 
+ 	if (unlikely(rt2x00queue_full(queue))) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0009-perf-x86-Fix-local-vs-remote-memory-events-for-NHM-W.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0009-perf-x86-Fix-local-vs-remote-memory-events-for-NHM-W.patch
new file mode 100644
index 0000000..d57e5e3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0009-perf-x86-Fix-local-vs-remote-memory-events-for-NHM-W.patch
@@ -0,0 +1,222 @@
+From 1c301a267126e6e01056eda0164a67731b738f5f Mon Sep 17 00:00:00 2001
+From: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Date: Mon, 5 Mar 2012 23:59:25 +0100
+Subject: [PATCH 09/42] perf/x86: Fix local vs remote memory events for
+ NHM/WSM
+
+commit 87e24f4b67e68d9fd8df16e0bf9c66d1ad2a2533 upstream.
+
+Verified using the below proglet.. before:
+
+[root@westmere ~]# perf stat -e node-stores -e node-store-misses ./numa 0
+remote write
+
+ Performance counter stats for './numa 0':
+
+         2,101,554 node-stores
+         2,096,931 node-store-misses
+
+       5.021546079 seconds time elapsed
+
+[root@westmere ~]# perf stat -e node-stores -e node-store-misses ./numa 1
+local write
+
+ Performance counter stats for './numa 1':
+
+           501,137 node-stores
+               199 node-store-misses
+
+       5.124451068 seconds time elapsed
+
+After:
+
+[root@westmere ~]# perf stat -e node-stores -e node-store-misses ./numa 0
+remote write
+
+ Performance counter stats for './numa 0':
+
+         2,107,516 node-stores
+         2,097,187 node-store-misses
+
+       5.012755149 seconds time elapsed
+
+[root@westmere ~]# perf stat -e node-stores -e node-store-misses ./numa 1
+local write
+
+ Performance counter stats for './numa 1':
+
+         2,063,355 node-stores
+               165 node-store-misses
+
+       5.082091494 seconds time elapsed
+
+#define _GNU_SOURCE
+
+#include <sched.h>
+#include <stdio.h>
+#include <errno.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <dirent.h>
+#include <signal.h>
+#include <unistd.h>
+#include <numaif.h>
+#include <stdlib.h>
+
+#define SIZE (32*1024*1024)
+
+volatile int done;
+
+void sig_done(int sig)
+{
+	done = 1;
+}
+
+int main(int argc, char **argv)
+{
+	cpu_set_t *mask, *mask2;
+	size_t size;
+	int i, err, t;
+	int nrcpus = 1024;
+	char *mem;
+	unsigned long nodemask = 0x01; /* node 0 */
+	DIR *node;
+	struct dirent *de;
+	int read = 0;
+	int local = 0;
+
+	if (argc < 2) {
+		printf("usage: %s [0-3]\n", argv[0]);
+		printf("  bit0 - local/remote\n");
+		printf("  bit1 - read/write\n");
+		exit(0);
+	}
+
+	switch (atoi(argv[1])) {
+	case 0:
+		printf("remote write\n");
+		break;
+	case 1:
+		printf("local write\n");
+		local = 1;
+		break;
+	case 2:
+		printf("remote read\n");
+		read = 1;
+		break;
+	case 3:
+		printf("local read\n");
+		local = 1;
+		read = 1;
+		break;
+	}
+
+	mask = CPU_ALLOC(nrcpus);
+	size = CPU_ALLOC_SIZE(nrcpus);
+	CPU_ZERO_S(size, mask);
+
+	node = opendir("/sys/devices/system/node/node0/");
+	if (!node)
+		perror("opendir");
+	while ((de = readdir(node))) {
+		int cpu;
+
+		if (sscanf(de->d_name, "cpu%d", &cpu) == 1)
+			CPU_SET_S(cpu, size, mask);
+	}
+	closedir(node);
+
+	mask2 = CPU_ALLOC(nrcpus);
+	CPU_ZERO_S(size, mask2);
+	for (i = 0; i < size; i++)
+		CPU_SET_S(i, size, mask2);
+	CPU_XOR_S(size, mask2, mask2, mask); // invert
+
+	if (!local)
+		mask = mask2;
+
+	err = sched_setaffinity(0, size, mask);
+	if (err)
+		perror("sched_setaffinity");
+
+	mem = mmap(0, SIZE, PROT_READ|PROT_WRITE,
+			MAP_PRIVATE|MAP_ANONYMOUS, -1, 0);
+	err = mbind(mem, SIZE, MPOL_BIND, &nodemask, 8*sizeof(nodemask), MPOL_MF_MOVE);
+	if (err)
+		perror("mbind");
+
+	signal(SIGALRM, sig_done);
+	alarm(5);
+
+	if (!read) {
+		while (!done) {
+			for (i = 0; i < SIZE; i++)
+				mem[i] = 0x01;
+		}
+	} else {
+		while (!done) {
+			for (i = 0; i < SIZE; i++)
+				t += *(volatile char *)(mem + i);
+		}
+	}
+
+	return 0;
+}
+
+Signed-off-by: Peter Zijlstra <a.p.zijlstra@chello.nl>
+Cc: Stephane Eranian <eranian@google.com>
+Link: http://lkml.kernel.org/n/tip-tq73sxus35xmqpojf7ootxgs@git.kernel.org
+Signed-off-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/x86/kernel/cpu/perf_event_intel.c |   17 +++++++++--------
+ 1 file changed, 9 insertions(+), 8 deletions(-)
+
+diff --git a/arch/x86/kernel/cpu/perf_event_intel.c b/arch/x86/kernel/cpu/perf_event_intel.c
+index 121f1be..957c216 100644
+--- a/arch/x86/kernel/cpu/perf_event_intel.c
++++ b/arch/x86/kernel/cpu/perf_event_intel.c
+@@ -389,14 +389,15 @@ static __initconst const u64 westmere_hw_cache_event_ids
+ #define NHM_LOCAL_DRAM		(1 << 14)
+ #define NHM_NON_DRAM		(1 << 15)
+ 
+-#define NHM_ALL_DRAM		(NHM_REMOTE_DRAM|NHM_LOCAL_DRAM)
++#define NHM_LOCAL		(NHM_LOCAL_DRAM|NHM_REMOTE_CACHE_FWD)
++#define NHM_REMOTE		(NHM_REMOTE_DRAM)
+ 
+ #define NHM_DMND_READ		(NHM_DMND_DATA_RD)
+ #define NHM_DMND_WRITE		(NHM_DMND_RFO|NHM_DMND_WB)
+ #define NHM_DMND_PREFETCH	(NHM_PF_DATA_RD|NHM_PF_DATA_RFO)
+ 
+ #define NHM_L3_HIT	(NHM_UNCORE_HIT|NHM_OTHER_CORE_HIT_SNP|NHM_OTHER_CORE_HITM)
+-#define NHM_L3_MISS	(NHM_NON_DRAM|NHM_ALL_DRAM|NHM_REMOTE_CACHE_FWD)
++#define NHM_L3_MISS	(NHM_NON_DRAM|NHM_LOCAL_DRAM|NHM_REMOTE_DRAM|NHM_REMOTE_CACHE_FWD)
+ #define NHM_L3_ACCESS	(NHM_L3_HIT|NHM_L3_MISS)
+ 
+ static __initconst const u64 nehalem_hw_cache_extra_regs
+@@ -420,16 +421,16 @@ static __initconst const u64 nehalem_hw_cache_extra_regs
+  },
+  [ C(NODE) ] = {
+ 	[ C(OP_READ) ] = {
+-		[ C(RESULT_ACCESS) ] = NHM_DMND_READ|NHM_ALL_DRAM,
+-		[ C(RESULT_MISS)   ] = NHM_DMND_READ|NHM_REMOTE_DRAM,
++		[ C(RESULT_ACCESS) ] = NHM_DMND_READ|NHM_LOCAL|NHM_REMOTE,
++		[ C(RESULT_MISS)   ] = NHM_DMND_READ|NHM_REMOTE,
+ 	},
+ 	[ C(OP_WRITE) ] = {
+-		[ C(RESULT_ACCESS) ] = NHM_DMND_WRITE|NHM_ALL_DRAM,
+-		[ C(RESULT_MISS)   ] = NHM_DMND_WRITE|NHM_REMOTE_DRAM,
++		[ C(RESULT_ACCESS) ] = NHM_DMND_WRITE|NHM_LOCAL|NHM_REMOTE,
++		[ C(RESULT_MISS)   ] = NHM_DMND_WRITE|NHM_REMOTE,
+ 	},
+ 	[ C(OP_PREFETCH) ] = {
+-		[ C(RESULT_ACCESS) ] = NHM_DMND_PREFETCH|NHM_ALL_DRAM,
+-		[ C(RESULT_MISS)   ] = NHM_DMND_PREFETCH|NHM_REMOTE_DRAM,
++		[ C(RESULT_ACCESS) ] = NHM_DMND_PREFETCH|NHM_LOCAL|NHM_REMOTE,
++		[ C(RESULT_MISS)   ] = NHM_DMND_PREFETCH|NHM_REMOTE,
+ 	},
+  },
+ };
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0010-CIFS-Do-not-kmalloc-under-the-flocks-spinlock.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0010-CIFS-Do-not-kmalloc-under-the-flocks-spinlock.patch
new file mode 100644
index 0000000..150144c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0010-CIFS-Do-not-kmalloc-under-the-flocks-spinlock.patch
@@ -0,0 +1,140 @@
+From 6fc4721b47d58ae599a4bb37869d4bfd41f70511 Mon Sep 17 00:00:00 2001
+From: Pavel Shilovsky <piastry@etersoft.ru>
+Date: Mon, 5 Mar 2012 09:39:20 +0300
+Subject: [PATCH 10/42] CIFS: Do not kmalloc under the flocks spinlock
+
+commit d5751469f210d2149cc2159ffff66cbeef6da3f2 upstream.
+
+Reorganize the code to make the memory already allocated before
+spinlock'ed loop.
+
+Reviewed-by: Jeff Layton <jlayton@redhat.com>
+Signed-off-by: Pavel Shilovsky <piastry@etersoft.ru>
+Signed-off-by: Steve French <sfrench@us.ibm.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/cifs/file.c |   69 +++++++++++++++++++++++++++++++++++++++++++++-----------
+ 1 file changed, 56 insertions(+), 13 deletions(-)
+
+diff --git a/fs/cifs/file.c b/fs/cifs/file.c
+index 4dd9283..5e64748 100644
+--- a/fs/cifs/file.c
++++ b/fs/cifs/file.c
+@@ -920,16 +920,26 @@ cifs_push_mandatory_locks(struct cifsFileInfo *cfile)
+ 	for (lockp = &inode->i_flock; *lockp != NULL; \
+ 	     lockp = &(*lockp)->fl_next)
+ 
++struct lock_to_push {
++	struct list_head llist;
++	__u64 offset;
++	__u64 length;
++	__u32 pid;
++	__u16 netfid;
++	__u8 type;
++};
++
+ static int
+ cifs_push_posix_locks(struct cifsFileInfo *cfile)
+ {
+ 	struct cifsInodeInfo *cinode = CIFS_I(cfile->dentry->d_inode);
+ 	struct cifs_tcon *tcon = tlink_tcon(cfile->tlink);
+ 	struct file_lock *flock, **before;
+-	struct cifsLockInfo *lck, *tmp;
++	unsigned int count = 0, i = 0;
+ 	int rc = 0, xid, type;
++	struct list_head locks_to_send, *el;
++	struct lock_to_push *lck, *tmp;
+ 	__u64 length;
+-	struct list_head locks_to_send;
+ 
+ 	xid = GetXid();
+ 
+@@ -940,29 +950,55 @@ cifs_push_posix_locks(struct cifsFileInfo *cfile)
+ 		return rc;
+ 	}
+ 
++	lock_flocks();
++	cifs_for_each_lock(cfile->dentry->d_inode, before) {
++		if ((*before)->fl_flags & FL_POSIX)
++			count++;
++	}
++	unlock_flocks();
++
+ 	INIT_LIST_HEAD(&locks_to_send);
+ 
++	/*
++	 * Allocating count locks is enough because no locks can be added to
++	 * the list while we are holding cinode->lock_mutex that protects
++	 * locking operations of this inode.
++	 */
++	for (; i < count; i++) {
++		lck = kmalloc(sizeof(struct lock_to_push), GFP_KERNEL);
++		if (!lck) {
++			rc = -ENOMEM;
++			goto err_out;
++		}
++		list_add_tail(&lck->llist, &locks_to_send);
++	}
++
++	i = 0;
++	el = locks_to_send.next;
+ 	lock_flocks();
+ 	cifs_for_each_lock(cfile->dentry->d_inode, before) {
++		if (el == &locks_to_send) {
++			/* something is really wrong */
++			cERROR(1, "Can't push all brlocks!");
++			break;
++		}
+ 		flock = *before;
++		if ((flock->fl_flags & FL_POSIX) == 0)
++			continue;
+ 		length = 1 + flock->fl_end - flock->fl_start;
+ 		if (flock->fl_type == F_RDLCK || flock->fl_type == F_SHLCK)
+ 			type = CIFS_RDLCK;
+ 		else
+ 			type = CIFS_WRLCK;
+-
+-		lck = cifs_lock_init(flock->fl_start, length, type,
+-				     cfile->netfid);
+-		if (!lck) {
+-			rc = -ENOMEM;
+-			goto send_locks;
+-		}
++		lck = list_entry(el, struct lock_to_push, llist);
+ 		lck->pid = flock->fl_pid;
+-
+-		list_add_tail(&lck->llist, &locks_to_send);
++		lck->netfid = cfile->netfid;
++		lck->length = length;
++		lck->type = type;
++		lck->offset = flock->fl_start;
++		i++;
++		el = el->next;
+ 	}
+-
+-send_locks:
+ 	unlock_flocks();
+ 
+ 	list_for_each_entry_safe(lck, tmp, &locks_to_send, llist) {
+@@ -979,11 +1015,18 @@ send_locks:
+ 		kfree(lck);
+ 	}
+ 
++out:
+ 	cinode->can_cache_brlcks = false;
+ 	mutex_unlock(&cinode->lock_mutex);
+ 
+ 	FreeXid(xid);
+ 	return rc;
++err_out:
++	list_for_each_entry_safe(lck, tmp, &locks_to_send, llist) {
++		list_del(&lck->llist);
++		kfree(lck);
++	}
++	goto out;
+ }
+ 
+ static int
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0011-vfs-fix-return-value-from-do_last.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0011-vfs-fix-return-value-from-do_last.patch
new file mode 100644
index 0000000..f95b2aa
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0011-vfs-fix-return-value-from-do_last.patch
@@ -0,0 +1,34 @@
+From f52c418abc401baac70461c9b92954f9cf77b5dc Mon Sep 17 00:00:00 2001
+From: Miklos Szeredi <mszeredi@suse.cz>
+Date: Tue, 6 Mar 2012 13:56:34 +0100
+Subject: [PATCH 11/42] vfs: fix return value from do_last()
+
+commit 7f6c7e62fcc123e6bd9206da99a2163fe3facc31 upstream.
+
+complete_walk() returns either ECHILD or ESTALE.  do_last() turns this into
+ECHILD unconditionally.  If not in RCU mode, this error will reach userspace
+which is complete nonsense.
+
+Signed-off-by: Miklos Szeredi <mszeredi@suse.cz>
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/namei.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/namei.c b/fs/namei.c
+index 744e942..b8344d0 100644
+--- a/fs/namei.c
++++ b/fs/namei.c
+@@ -2139,7 +2139,7 @@ static struct file *do_last(struct nameidata *nd, struct path *path,
+ 		/* sayonara */
+ 		error = complete_walk(nd);
+ 		if (error)
+-			return ERR_PTR(-ECHILD);
++			return ERR_PTR(error);
+ 
+ 		error = -ENOTDIR;
+ 		if (nd->flags & LOOKUP_DIRECTORY) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0012-vfs-fix-double-put-after-complete_walk.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0012-vfs-fix-double-put-after-complete_walk.patch
new file mode 100644
index 0000000..7a88ad0
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0012-vfs-fix-double-put-after-complete_walk.patch
@@ -0,0 +1,35 @@
+From c2f9efa695b37b1f5e70557edfdfd36f8d186d31 Mon Sep 17 00:00:00 2001
+From: Miklos Szeredi <mszeredi@suse.cz>
+Date: Tue, 6 Mar 2012 13:56:33 +0100
+Subject: [PATCH 12/42] vfs: fix double put after complete_walk()
+
+commit 097b180ca09b581ef0dc24fbcfc1b227de3875df upstream.
+
+complete_walk() already puts nd->path, no need to do it again at cleanup time.
+
+This would result in Oopses if triggered, apparently the codepath is not too
+well exercised.
+
+Signed-off-by: Miklos Szeredi <mszeredi@suse.cz>
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/namei.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/namei.c b/fs/namei.c
+index b8344d0..9680cef 100644
+--- a/fs/namei.c
++++ b/fs/namei.c
+@@ -2238,7 +2238,7 @@ static struct file *do_last(struct nameidata *nd, struct path *path,
+ 	/* Why this, you ask?  _Now_ we might have grown LOOKUP_JUMPED... */
+ 	error = complete_walk(nd);
+ 	if (error)
+-		goto exit;
++		return ERR_PTR(error);
+ 	error = -EISDIR;
+ 	if (S_ISDIR(nd->inode->i_mode))
+ 		goto exit;
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0013-acer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0013-acer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch
new file mode 100644
index 0000000..6cb9d28
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0013-acer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch
@@ -0,0 +1,77 @@
+From 9102b08273c16ddc92444c913e81572989342a8f Mon Sep 17 00:00:00 2001
+From: Ike Panhc <ike.pan@canonical.com>
+Date: Fri, 3 Feb 2012 16:46:39 +0800
+Subject: [PATCH 13/42] acer-wmi: No wifi rfkill on Lenovo machines
+
+commit 461e74377cfcfc2c0d6bbdfa8fc5fbc21b052c2a upstream.
+
+We have several reports which says acer-wmi is loaded on ideapads
+and register rfkill for wifi which can not be unblocked.
+
+Since ideapad-laptop also register rfkill for wifi and it works
+reliably, it will be fine acer-wmi is not going to register rfkill
+for wifi once VPC2004 is found.
+
+Also put IBM0068/LEN0068 in the list. Though thinkpad_acpi has no
+wifi rfkill capability, there are reports which says acer-wmi also
+block wireless on Thinkpad E520/E420.
+
+Signed-off-by: Ike Panhc <ike.pan@canonical.com>
+Signed-off-by: Matthew Garrett <mjg@redhat.com>
+Cc: Jonathan Nieder <jrnieder@gmail.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/platform/x86/acer-wmi.c |   30 +++++++++++++++++++++++++++++-
+ 1 file changed, 29 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
+index b848277..1e5290b 100644
+--- a/drivers/platform/x86/acer-wmi.c
++++ b/drivers/platform/x86/acer-wmi.c
+@@ -679,6 +679,32 @@ static acpi_status AMW0_find_mailled(void)
+ 	return AE_OK;
+ }
+ 
++static int AMW0_set_cap_acpi_check_device_found;
++
++static acpi_status AMW0_set_cap_acpi_check_device_cb(acpi_handle handle,
++	u32 level, void *context, void **retval)
++{
++	AMW0_set_cap_acpi_check_device_found = 1;
++	return AE_OK;
++}
++
++static const struct acpi_device_id norfkill_ids[] = {
++	{ "VPC2004", 0},
++	{ "IBM0068", 0},
++	{ "LEN0068", 0},
++	{ "", 0},
++};
++
++static int AMW0_set_cap_acpi_check_device(void)
++{
++	const struct acpi_device_id *id;
++
++	for (id = norfkill_ids; id->id[0]; id++)
++		acpi_get_devices(id->id, AMW0_set_cap_acpi_check_device_cb,
++				NULL, NULL);
++	return AMW0_set_cap_acpi_check_device_found;
++}
++
+ static acpi_status AMW0_set_capabilities(void)
+ {
+ 	struct wmab_args args;
+@@ -692,7 +718,9 @@ static acpi_status AMW0_set_capabilities(void)
+ 	 * work.
+ 	 */
+ 	if (wmi_has_guid(AMW0_GUID2)) {
+-		interface->capability |= ACER_CAP_WIRELESS;
++		if ((quirks != &quirk_unknown) ||
++		    !AMW0_set_cap_acpi_check_device())
++			interface->capability |= ACER_CAP_WIRELESS;
+ 		return AE_OK;
+ 	}
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0014-atl1c-dont-use-highprio-tx-queue.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0014-atl1c-dont-use-highprio-tx-queue.patch
new file mode 100644
index 0000000..72577e4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0014-atl1c-dont-use-highprio-tx-queue.patch
@@ -0,0 +1,51 @@
+From 8bdd32d35e2bc723a11b475eb797a9f11e8db598 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Wed, 15 Feb 2012 20:43:11 +0000
+Subject: [PATCH 14/42] atl1c: dont use highprio tx queue
+
+[ Upstream commit 11aad99af6ef629ff3b05d1c9f0936589b204316 ]
+
+This driver attempts to use two TX rings but lacks proper support :
+
+1) IRQ handler only takes care of TX completion on first TX ring
+2) the stop/start logic uses the legacy functions (for non multiqueue
+drivers)
+
+This means all packets witk skb mark set to 1 are sent through high
+queue but are never cleaned and queue eventualy fills and block the
+device, triggering the infamous "NETDEV WATCHDOG" message.
+
+Lets use a single TX ring to fix the problem, this driver is not a real
+multiqueue one yet.
+
+Minimal fix for stable kernels.
+
+Reported-by: Thomas Meyer <thomas@m3y3r.de>
+Tested-by: Thomas Meyer <thomas@m3y3r.de>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Cc: Jay Cliburn <jcliburn@gmail.com>
+Cc: Chris Snook <chris.snook@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/atheros/atl1c/atl1c_main.c |    4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+index 02c7ed8..eccdcff 100644
+--- a/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
++++ b/drivers/net/ethernet/atheros/atl1c/atl1c_main.c
+@@ -2241,10 +2241,6 @@ static netdev_tx_t atl1c_xmit_frame(struct sk_buff *skb,
+ 			dev_info(&adapter->pdev->dev, "tx locked\n");
+ 		return NETDEV_TX_LOCKED;
+ 	}
+-	if (skb->mark == 0x01)
+-		type = atl1c_trans_high;
+-	else
+-		type = atl1c_trans_normal;
+ 
+ 	if (atl1c_tpd_avail(adapter, type) < tpd_req) {
+ 		/* no enough descriptor, just stop queue */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0015-neighbour-Fixed-race-condition-at-tbl-nht.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0015-neighbour-Fixed-race-condition-at-tbl-nht.patch
new file mode 100644
index 0000000..35bd072
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0015-neighbour-Fixed-race-condition-at-tbl-nht.patch
@@ -0,0 +1,48 @@
+From 3ba7a3f4339ce0147ffa46086eead88cb45c9b0d Mon Sep 17 00:00:00 2001
+From: Michel Machado <michel@digirati.com.br>
+Date: Tue, 21 Feb 2012 11:04:13 +0000
+Subject: [PATCH 15/42] neighbour: Fixed race condition at tbl->nht
+
+[ Upstream commit 84338a6c9dbb6ff3de4749864020f8f25d86fc81 ]
+
+When the fixed race condition happens:
+
+1. While function neigh_periodic_work scans the neighbor hash table
+pointed by field tbl->nht, it unlocks and locks tbl->lock between
+buckets in order to call cond_resched.
+
+2. Assume that function neigh_periodic_work calls cond_resched, that is,
+the lock tbl->lock is available, and function neigh_hash_grow runs.
+
+3. Once function neigh_hash_grow finishes, and RCU calls
+neigh_hash_free_rcu, the original struct neigh_hash_table that function
+neigh_periodic_work was using doesn't exist anymore.
+
+4. Once back at neigh_periodic_work, whenever the old struct
+neigh_hash_table is accessed, things can go badly.
+
+Signed-off-by: Michel Machado <michel@digirati.com.br>
+CC: "David S. Miller" <davem@davemloft.net>
+CC: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/core/neighbour.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/net/core/neighbour.c b/net/core/neighbour.c
+index 5ac07d3..7aafaed 100644
+--- a/net/core/neighbour.c
++++ b/net/core/neighbour.c
+@@ -802,6 +802,8 @@ next_elt:
+ 		write_unlock_bh(&tbl->lock);
+ 		cond_resched();
+ 		write_lock_bh(&tbl->lock);
++		nht = rcu_dereference_protected(tbl->nht,
++						lockdep_is_held(&tbl->lock));
+ 	}
+ 	/* Cycle through all hash buckets every base_reachable_time/2 ticks.
+ 	 * ARP entry timeouts range from 1/2 base_reachable_time to 3/2
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0016-ipsec-be-careful-of-non-existing-mac-headers.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0016-ipsec-be-careful-of-non-existing-mac-headers.patch
new file mode 100644
index 0000000..706cdd6
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0016-ipsec-be-careful-of-non-existing-mac-headers.patch
@@ -0,0 +1,144 @@
+From b38838f790c928ebeb30dbd6a06d4a26e84d54dc Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Thu, 23 Feb 2012 10:55:02 +0000
+Subject: [PATCH 16/42] ipsec: be careful of non existing mac headers
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[ Upstream commit 03606895cd98c0a628b17324fd7b5ff15db7e3cd ]
+
+Niccolo Belli reported ipsec crashes in case we handle a frame without
+mac header (atm in his case)
+
+Before copying mac header, better make sure it is present.
+
+Bugzilla reference:  https://bugzilla.kernel.org/show_bug.cgi?id=42809
+
+Reported-by: Niccolò Belli <darkbasic@linuxsystems.it>
+Tested-by: Niccolò Belli <darkbasic@linuxsystems.it>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ include/linux/skbuff.h       |   10 ++++++++++
+ net/ipv4/xfrm4_mode_beet.c   |    5 +----
+ net/ipv4/xfrm4_mode_tunnel.c |    6 ++----
+ net/ipv6/xfrm6_mode_beet.c   |    6 +-----
+ net/ipv6/xfrm6_mode_tunnel.c |    6 ++----
+ 5 files changed, 16 insertions(+), 17 deletions(-)
+
+diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
+index fe86488..6cf8b53 100644
+--- a/include/linux/skbuff.h
++++ b/include/linux/skbuff.h
+@@ -1453,6 +1453,16 @@ static inline void skb_set_mac_header(struct sk_buff *skb, const int offset)
+ }
+ #endif /* NET_SKBUFF_DATA_USES_OFFSET */
+ 
++static inline void skb_mac_header_rebuild(struct sk_buff *skb)
++{
++	if (skb_mac_header_was_set(skb)) {
++		const unsigned char *old_mac = skb_mac_header(skb);
++
++		skb_set_mac_header(skb, -skb->mac_len);
++		memmove(skb_mac_header(skb), old_mac, skb->mac_len);
++	}
++}
++
+ static inline int skb_checksum_start_offset(const struct sk_buff *skb)
+ {
+ 	return skb->csum_start - skb_headroom(skb);
+diff --git a/net/ipv4/xfrm4_mode_beet.c b/net/ipv4/xfrm4_mode_beet.c
+index 6341818..e3db3f9 100644
+--- a/net/ipv4/xfrm4_mode_beet.c
++++ b/net/ipv4/xfrm4_mode_beet.c
+@@ -110,10 +110,7 @@ static int xfrm4_beet_input(struct xfrm_state *x, struct sk_buff *skb)
+ 
+ 	skb_push(skb, sizeof(*iph));
+ 	skb_reset_network_header(skb);
+-
+-	memmove(skb->data - skb->mac_len, skb_mac_header(skb),
+-		skb->mac_len);
+-	skb_set_mac_header(skb, -skb->mac_len);
++	skb_mac_header_rebuild(skb);
+ 
+ 	xfrm4_beet_make_header(skb);
+ 
+diff --git a/net/ipv4/xfrm4_mode_tunnel.c b/net/ipv4/xfrm4_mode_tunnel.c
+index 534972e..ed4bf11 100644
+--- a/net/ipv4/xfrm4_mode_tunnel.c
++++ b/net/ipv4/xfrm4_mode_tunnel.c
+@@ -66,7 +66,6 @@ static int xfrm4_mode_tunnel_output(struct xfrm_state *x, struct sk_buff *skb)
+ 
+ static int xfrm4_mode_tunnel_input(struct xfrm_state *x, struct sk_buff *skb)
+ {
+-	const unsigned char *old_mac;
+ 	int err = -EINVAL;
+ 
+ 	if (XFRM_MODE_SKB_CB(skb)->protocol != IPPROTO_IPIP)
+@@ -84,10 +83,9 @@ static int xfrm4_mode_tunnel_input(struct xfrm_state *x, struct sk_buff *skb)
+ 	if (!(x->props.flags & XFRM_STATE_NOECN))
+ 		ipip_ecn_decapsulate(skb);
+ 
+-	old_mac = skb_mac_header(skb);
+-	skb_set_mac_header(skb, -skb->mac_len);
+-	memmove(skb_mac_header(skb), old_mac, skb->mac_len);
+ 	skb_reset_network_header(skb);
++	skb_mac_header_rebuild(skb);
++
+ 	err = 0;
+ 
+ out:
+diff --git a/net/ipv6/xfrm6_mode_beet.c b/net/ipv6/xfrm6_mode_beet.c
+index 3437d7d..f37cba9 100644
+--- a/net/ipv6/xfrm6_mode_beet.c
++++ b/net/ipv6/xfrm6_mode_beet.c
+@@ -80,7 +80,6 @@ static int xfrm6_beet_output(struct xfrm_state *x, struct sk_buff *skb)
+ static int xfrm6_beet_input(struct xfrm_state *x, struct sk_buff *skb)
+ {
+ 	struct ipv6hdr *ip6h;
+-	const unsigned char *old_mac;
+ 	int size = sizeof(struct ipv6hdr);
+ 	int err;
+ 
+@@ -90,10 +89,7 @@ static int xfrm6_beet_input(struct xfrm_state *x, struct sk_buff *skb)
+ 
+ 	__skb_push(skb, size);
+ 	skb_reset_network_header(skb);
+-
+-	old_mac = skb_mac_header(skb);
+-	skb_set_mac_header(skb, -skb->mac_len);
+-	memmove(skb_mac_header(skb), old_mac, skb->mac_len);
++	skb_mac_header_rebuild(skb);
+ 
+ 	xfrm6_beet_make_header(skb);
+ 
+diff --git a/net/ipv6/xfrm6_mode_tunnel.c b/net/ipv6/xfrm6_mode_tunnel.c
+index 4d6edff..23ecd68 100644
+--- a/net/ipv6/xfrm6_mode_tunnel.c
++++ b/net/ipv6/xfrm6_mode_tunnel.c
+@@ -63,7 +63,6 @@ static int xfrm6_mode_tunnel_output(struct xfrm_state *x, struct sk_buff *skb)
+ static int xfrm6_mode_tunnel_input(struct xfrm_state *x, struct sk_buff *skb)
+ {
+ 	int err = -EINVAL;
+-	const unsigned char *old_mac;
+ 
+ 	if (XFRM_MODE_SKB_CB(skb)->protocol != IPPROTO_IPV6)
+ 		goto out;
+@@ -80,10 +79,9 @@ static int xfrm6_mode_tunnel_input(struct xfrm_state *x, struct sk_buff *skb)
+ 	if (!(x->props.flags & XFRM_STATE_NOECN))
+ 		ipip6_ecn_decapsulate(skb);
+ 
+-	old_mac = skb_mac_header(skb);
+-	skb_set_mac_header(skb, -skb->mac_len);
+-	memmove(skb_mac_header(skb), old_mac, skb->mac_len);
+ 	skb_reset_network_header(skb);
++	skb_mac_header_rebuild(skb);
++
+ 	err = 0;
+ 
+ out:
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0017-ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0017-ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch
new file mode 100644
index 0000000..fe5fd32
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0017-ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch
@@ -0,0 +1,90 @@
+From 486667d032b8183f75da22b245635debbfa381ca Mon Sep 17 00:00:00 2001
+From: Ben McKeegan <ben@netservers.co.uk>
+Date: Fri, 24 Feb 2012 06:33:56 +0000
+Subject: [PATCH 17/42] ppp: fix 'ppp_mp_reconstruct bad seq' errors
+
+[ Upstream commit 8a49ad6e89feb5015e77ce6efeb2678947117e20 ]
+
+This patch fixes a (mostly cosmetic) bug introduced by the patch
+'ppp: Use SKB queue abstraction interfaces in fragment processing'
+found here: http://www.spinics.net/lists/netdev/msg153312.html
+
+The above patch rewrote and moved the code responsible for cleaning
+up discarded fragments but the new code does not catch every case
+where this is necessary.  This results in some discarded fragments
+remaining in the queue, and triggering a 'bad seq' error on the
+subsequent call to ppp_mp_reconstruct.  Fragments are discarded
+whenever other fragments of the same frame have been lost.
+This can generate a lot of unwanted and misleading log messages.
+
+This patch also adds additional detail to the debug logging to
+make it clearer which fragments were lost and which other fragments
+were discarded as a result of losses. (Run pppd with 'kdebug 1'
+option to enable debug logging.)
+
+Signed-off-by: Ben McKeegan <ben@netservers.co.uk>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ppp/ppp_generic.c |   23 +++++++++++++++++++++++
+ 1 file changed, 23 insertions(+)
+
+diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
+index edfa15d..486b404 100644
+--- a/drivers/net/ppp/ppp_generic.c
++++ b/drivers/net/ppp/ppp_generic.c
+@@ -2024,14 +2024,22 @@ ppp_mp_reconstruct(struct ppp *ppp)
+ 			continue;
+ 		}
+ 		if (PPP_MP_CB(p)->sequence != seq) {
++			u32 oldseq;
+ 			/* Fragment `seq' is missing.  If it is after
+ 			   minseq, it might arrive later, so stop here. */
+ 			if (seq_after(seq, minseq))
+ 				break;
+ 			/* Fragment `seq' is lost, keep going. */
+ 			lost = 1;
++			oldseq = seq;
+ 			seq = seq_before(minseq, PPP_MP_CB(p)->sequence)?
+ 				minseq + 1: PPP_MP_CB(p)->sequence;
++
++			if (ppp->debug & 1)
++				netdev_printk(KERN_DEBUG, ppp->dev,
++					      "lost frag %u..%u\n",
++					      oldseq, seq-1);
++
+ 			goto again;
+ 		}
+ 
+@@ -2076,6 +2084,10 @@ ppp_mp_reconstruct(struct ppp *ppp)
+ 			struct sk_buff *tmp2;
+ 
+ 			skb_queue_reverse_walk_from_safe(list, p, tmp2) {
++				if (ppp->debug & 1)
++					netdev_printk(KERN_DEBUG, ppp->dev,
++						      "discarding frag %u\n",
++						      PPP_MP_CB(p)->sequence);
+ 				__skb_unlink(p, list);
+ 				kfree_skb(p);
+ 			}
+@@ -2091,6 +2103,17 @@ ppp_mp_reconstruct(struct ppp *ppp)
+ 		/* If we have discarded any fragments,
+ 		   signal a receive error. */
+ 		if (PPP_MP_CB(head)->sequence != ppp->nextseq) {
++			skb_queue_walk_safe(list, p, tmp) {
++				if (p == head)
++					break;
++				if (ppp->debug & 1)
++					netdev_printk(KERN_DEBUG, ppp->dev,
++						      "discarding frag %u\n",
++						      PPP_MP_CB(p)->sequence);
++				__skb_unlink(p, list);
++				kfree_skb(p);
++			}
++
+ 			if (ppp->debug & 1)
+ 				netdev_printk(KERN_DEBUG, ppp->dev,
+ 					      "  missed pkts %u..%u\n",
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0018-sfc-Fix-assignment-of-ip_summed-for-pre-allocated-sk.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0018-sfc-Fix-assignment-of-ip_summed-for-pre-allocated-sk.patch
new file mode 100644
index 0000000..ac641a9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0018-sfc-Fix-assignment-of-ip_summed-for-pre-allocated-sk.patch
@@ -0,0 +1,56 @@
+From 724515edd415300e12da1a3d2e84cadd6a5cd90b Mon Sep 17 00:00:00 2001
+From: Ben Hutchings <bhutchings@solarflare.com>
+Date: Fri, 24 Feb 2012 15:12:34 +0000
+Subject: [PATCH 18/42] sfc: Fix assignment of ip_summed for pre-allocated
+ skbs
+
+[ Upstream commit ff3bc1e7527504a93710535611b2f812f3bb89bf ]
+
+When pre-allocating skbs for received packets, we set ip_summed =
+CHECKSUM_UNNCESSARY.  We used to change it back to CHECKSUM_NONE when
+the received packet had an incorrect checksum or unhandled protocol.
+
+Commit bc8acf2c8c3e43fcc192762a9f964b3e9a17748b ('drivers/net: avoid
+some skb->ip_summed initializations') mistakenly replaced the latter
+assignment with a DEBUG-only assertion that ip_summed ==
+CHECKSUM_NONE.  This assertion is always false, but it seems no-one
+has exercised this code path in a DEBUG build.
+
+Fix this by moving our assignment of CHECKSUM_UNNECESSARY into
+efx_rx_packet_gro().
+
+Signed-off-by: Ben Hutchings <bhutchings@solarflare.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/sfc/rx.c |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/ethernet/sfc/rx.c b/drivers/net/ethernet/sfc/rx.c
+index 752d521..5ef4cc0 100644
+--- a/drivers/net/ethernet/sfc/rx.c
++++ b/drivers/net/ethernet/sfc/rx.c
+@@ -156,11 +156,10 @@ static int efx_init_rx_buffers_skb(struct efx_rx_queue *rx_queue)
+ 		if (unlikely(!skb))
+ 			return -ENOMEM;
+ 
+-		/* Adjust the SKB for padding and checksum */
++		/* Adjust the SKB for padding */
+ 		skb_reserve(skb, NET_IP_ALIGN);
+ 		rx_buf->len = skb_len - NET_IP_ALIGN;
+ 		rx_buf->is_page = false;
+-		skb->ip_summed = CHECKSUM_UNNECESSARY;
+ 
+ 		rx_buf->dma_addr = pci_map_single(efx->pci_dev,
+ 						  skb->data, rx_buf->len,
+@@ -499,6 +498,7 @@ static void efx_rx_packet_gro(struct efx_channel *channel,
+ 
+ 		EFX_BUG_ON_PARANOID(!checksummed);
+ 		rx_buf->u.skb = NULL;
++		skb->ip_summed = CHECKSUM_UNNECESSARY;
+ 
+ 		gro_result = napi_gro_receive(napi, skb);
+ 	}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0019-tcp-fix-false-reordering-signal-in-tcp_shifted_skb.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0019-tcp-fix-false-reordering-signal-in-tcp_shifted_skb.patch
new file mode 100644
index 0000000..7796b7d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0019-tcp-fix-false-reordering-signal-in-tcp_shifted_skb.patch
@@ -0,0 +1,72 @@
+From 201eee97e7d58fbde884394768761fb24229602a Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Sun, 26 Feb 2012 10:06:19 +0000
+Subject: [PATCH 19/42] tcp: fix false reordering signal in tcp_shifted_skb
+
+[ Upstream commit 4c90d3b30334833450ccbb02f452d4972a3c3c3f ]
+
+When tcp_shifted_skb() shifts bytes from the skb that is currently
+pointed to by 'highest_sack' then the increment of
+TCP_SKB_CB(skb)->seq implicitly advances tcp_highest_sack_seq(). This
+implicit advancement, combined with the recent fix to pass the correct
+SACKed range into tcp_sacktag_one(), caused tcp_sacktag_one() to think
+that the newly SACKed range was before the tcp_highest_sack_seq(),
+leading to a call to tcp_update_reordering() with a degree of
+reordering matching the size of the newly SACKed range (typically just
+1 packet, which is a NOP, but potentially larger).
+
+This commit fixes this by simply calling tcp_sacktag_one() before the
+TCP_SKB_CB(skb)->seq advancement that can advance our notion of the
+highest SACKed sequence.
+
+Correspondingly, we can simplify the code a little now that
+tcp_shifted_skb() should update the lost_cnt_hint in all cases where
+skb == tp->lost_skb_hint.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Acked-by: Yuchung Cheng <ycheng@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_input.c |   18 ++++++++++--------
+ 1 file changed, 10 insertions(+), 8 deletions(-)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 53113b9..9e32fca 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -1406,8 +1406,16 @@ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ 
+ 	BUG_ON(!pcount);
+ 
+-	/* Adjust hint for FACK. Non-FACK is handled in tcp_sacktag_one(). */
+-	if (tcp_is_fack(tp) && (skb == tp->lost_skb_hint))
++	/* Adjust counters and hints for the newly sacked sequence
++	 * range but discard the return value since prev is already
++	 * marked. We must tag the range first because the seq
++	 * advancement below implicitly advances
++	 * tcp_highest_sack_seq() when skb is highest_sack.
++	 */
++	tcp_sacktag_one(sk, state, TCP_SKB_CB(skb)->sacked,
++			start_seq, end_seq, dup_sack, pcount);
++
++	if (skb == tp->lost_skb_hint)
+ 		tp->lost_cnt_hint += pcount;
+ 
+ 	TCP_SKB_CB(prev)->end_seq += shifted;
+@@ -1433,12 +1441,6 @@ static int tcp_shifted_skb(struct sock *sk, struct sk_buff *skb,
+ 		skb_shinfo(skb)->gso_type = 0;
+ 	}
+ 
+-	/* Adjust counters and hints for the newly sacked sequence range but
+-	 * discard the return value since prev is already marked.
+-	 */
+-	tcp_sacktag_one(sk, state, TCP_SKB_CB(skb)->sacked,
+-			start_seq, end_seq, dup_sack, pcount);
+-
+ 	/* Difference in this won't matter, both ACKed by the same cumul. ACK */
+ 	TCP_SKB_CB(prev)->sacked |= (TCP_SKB_CB(skb)->sacked & TCPCB_EVER_RETRANS);
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0020-vmxnet3-Fix-transport-header-size.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0020-vmxnet3-Fix-transport-header-size.patch
new file mode 100644
index 0000000..8bcb9ae
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0020-vmxnet3-Fix-transport-header-size.patch
@@ -0,0 +1,58 @@
+From 40cfa9924ed2f94482607fc884f1acb414d492b9 Mon Sep 17 00:00:00 2001
+From: Shreyas Bhatewara <sbhatewara@vmware.com>
+Date: Tue, 28 Feb 2012 22:17:38 +0000
+Subject: [PATCH 20/42] vmxnet3: Fix transport header size
+
+[ Upstream commit efead8710aad9e384730ecf25eae0287878840d7 ]
+
+Fix transport header size
+
+Fix the transpoert header size for UDP packets.
+
+Signed-off-by: Shreyas N Bhatewara <sbhatewara@vmware.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/vmxnet3/vmxnet3_drv.c |    7 +------
+ drivers/net/vmxnet3/vmxnet3_int.h |    4 ++--
+ 2 files changed, 3 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/net/vmxnet3/vmxnet3_drv.c b/drivers/net/vmxnet3/vmxnet3_drv.c
+index d96bfb1..d426261 100644
+--- a/drivers/net/vmxnet3/vmxnet3_drv.c
++++ b/drivers/net/vmxnet3/vmxnet3_drv.c
+@@ -830,13 +830,8 @@ vmxnet3_parse_and_copy_hdr(struct sk_buff *skb, struct vmxnet3_tx_queue *tq,
+ 					ctx->l4_hdr_size = ((struct tcphdr *)
+ 					   skb_transport_header(skb))->doff * 4;
+ 				else if (iph->protocol == IPPROTO_UDP)
+-					/*
+-					 * Use tcp header size so that bytes to
+-					 * be copied are more than required by
+-					 * the device.
+-					 */
+ 					ctx->l4_hdr_size =
+-							sizeof(struct tcphdr);
++							sizeof(struct udphdr);
+ 				else
+ 					ctx->l4_hdr_size = 0;
+ 			} else {
+diff --git a/drivers/net/vmxnet3/vmxnet3_int.h b/drivers/net/vmxnet3/vmxnet3_int.h
+index b18eac1..8df921b 100644
+--- a/drivers/net/vmxnet3/vmxnet3_int.h
++++ b/drivers/net/vmxnet3/vmxnet3_int.h
+@@ -70,10 +70,10 @@
+ /*
+  * Version numbers
+  */
+-#define VMXNET3_DRIVER_VERSION_STRING   "1.1.18.0-k"
++#define VMXNET3_DRIVER_VERSION_STRING   "1.1.29.0-k"
+ 
+ /* a 32-bit int, each byte encode a verion number in VMXNET3_DRIVER_VERSION */
+-#define VMXNET3_DRIVER_VERSION_NUM      0x01011200
++#define VMXNET3_DRIVER_VERSION_NUM      0x01011D00
+ 
+ #if defined(CONFIG_PCI_MSI)
+ 	/* RSS only makes sense if MSI-X is supported. */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0021-packetengines-fix-config-default.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0021-packetengines-fix-config-default.patch
new file mode 100644
index 0000000..6cfbc55
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0021-packetengines-fix-config-default.patch
@@ -0,0 +1,33 @@
+From 08a5b2365331981cd769e07182fce70ed50c8b66 Mon Sep 17 00:00:00 2001
+From: stephen hemminger <shemminger@vyatta.com>
+Date: Fri, 2 Mar 2012 13:38:56 +0000
+Subject: [PATCH 21/42] packetengines: fix config default
+
+[ Upstream commit 3f2010b2ad3d66d5291497c9b274315e7b807ecd ]
+
+As part of the big network driver reorg, each vendor directory defaults to
+yes, so that older config's can migrate correctly. Looks like this one
+got missed.
+
+Signed-off-by: Stephen Hemminger <shemminger@vyatta.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/packetengines/Kconfig |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/drivers/net/ethernet/packetengines/Kconfig b/drivers/net/ethernet/packetengines/Kconfig
+index b97132d..8f29feb 100644
+--- a/drivers/net/ethernet/packetengines/Kconfig
++++ b/drivers/net/ethernet/packetengines/Kconfig
+@@ -4,6 +4,7 @@
+ 
+ config NET_PACKET_ENGINE
+ 	bool "Packet Engine devices"
++	default y
+ 	depends on PCI
+ 	---help---
+ 	  If you have a network (Ethernet) card belonging to this class, say Y
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0022-r8169-corrupted-IP-fragments-fix-for-large-mtu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0022-r8169-corrupted-IP-fragments-fix-for-large-mtu.patch
new file mode 100644
index 0000000..497caa4
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0022-r8169-corrupted-IP-fragments-fix-for-large-mtu.patch
@@ -0,0 +1,49 @@
+From 87f64e870bbad8d4558ae32ea0152c5e986a5264 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?fran=C3=A7ois=20romieu?= <romieu@fr.zoreil.com>
+Date: Fri, 2 Mar 2012 04:43:14 +0000
+Subject: [PATCH 22/42] r8169: corrupted IP fragments fix for large mtu.
+
+[ Upstream commit 9c5028e9da1255dd2b99762d8627b88b29f68cce ]
+
+Noticed with the 8168d (-vb-gr, aka RTL_GIGA_MAC_VER_26).
+
+ConfigX registers should only be written while the Config9346 lock
+is held.
+
+Signed-off-by: Francois Romieu <romieu@fr.zoreil.com>
+Reported-by: Nick Bowler <nbowler@elliptictech.com>
+Cc: Hayes Wang <hayeswang@realtek.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/ethernet/realtek/r8169.c |    8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
+index c8f47f1..0cf2351 100644
+--- a/drivers/net/ethernet/realtek/r8169.c
++++ b/drivers/net/ethernet/realtek/r8169.c
+@@ -3781,12 +3781,20 @@ static void rtl8169_init_ring_indexes(struct rtl8169_private *tp)
+ 
+ static void rtl_hw_jumbo_enable(struct rtl8169_private *tp)
+ {
++	void __iomem *ioaddr = tp->mmio_addr;
++
++	RTL_W8(Cfg9346, Cfg9346_Unlock);
+ 	rtl_generic_op(tp, tp->jumbo_ops.enable);
++	RTL_W8(Cfg9346, Cfg9346_Lock);
+ }
+ 
+ static void rtl_hw_jumbo_disable(struct rtl8169_private *tp)
+ {
++	void __iomem *ioaddr = tp->mmio_addr;
++
++	RTL_W8(Cfg9346, Cfg9346_Unlock);
+ 	rtl_generic_op(tp, tp->jumbo_ops.disable);
++	RTL_W8(Cfg9346, Cfg9346_Lock);
+ }
+ 
+ static void r8168c_hw_jumbo_enable(struct rtl8169_private *tp)
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0023-tcp-don-t-fragment-SACKed-skbs-in-tcp_mark_head_lost.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0023-tcp-don-t-fragment-SACKed-skbs-in-tcp_mark_head_lost.patch
new file mode 100644
index 0000000..41a5387
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0023-tcp-don-t-fragment-SACKed-skbs-in-tcp_mark_head_lost.patch
@@ -0,0 +1,55 @@
+From c0313fea8fa8ff77714bfdab4eed42ae0785dc37 Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Fri, 2 Mar 2012 21:36:51 +0000
+Subject: [PATCH 23/42] tcp: don't fragment SACKed skbs in
+ tcp_mark_head_lost()
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+[ Upstream commit c0638c247f559e1a16ee79e54df14bca2cb679ea ]
+
+In tcp_mark_head_lost() we should not attempt to fragment a SACKed skb
+to mark the first portion as lost. This is for two primary reasons:
+
+(1) tcp_shifted_skb() coalesces adjacent regions of SACKed skbs. When
+doing this, it preserves the sum of their packet counts in order to
+reflect the real-world dynamics on the wire. But given that skbs can
+have remainders that do not align to MSS boundaries, this packet count
+preservation means that for SACKed skbs there is not necessarily a
+direct linear relationship between tcp_skb_pcount(skb) and
+skb->len. Thus tcp_mark_head_lost()'s previous attempts to fragment
+off and mark as lost a prefix of length (packets - oldcnt)*mss from
+SACKed skbs were leading to occasional failures of the WARN_ON(len >
+skb->len) in tcp_fragment() (which used to be a BUG_ON(); see the
+recent "crash in tcp_fragment" thread on netdev).
+
+(2) there is no real point in fragmenting off part of a SACKed skb and
+calling tcp_skb_mark_lost() on it, since tcp_skb_mark_lost() is a NOP
+for SACKed skbs.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Acked-by: Ilpo Järvinen <ilpo.jarvinen@helsinki.fi>
+Acked-by: Yuchung Cheng <ycheng@google.com>
+Acked-by: Nandita Dukkipati <nanditad@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_input.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 9e32fca..1c774af 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -2571,6 +2571,7 @@ static void tcp_mark_head_lost(struct sock *sk, int packets, int mark_head)
+ 
+ 		if (cnt > packets) {
+ 			if ((tcp_is_sack(tp) && !tcp_is_fack(tp)) ||
++			    (TCP_SKB_CB(skb)->sacked & TCPCB_SACKED_ACKED) ||
+ 			    (oldcnt >= packets))
+ 				break;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0024-bridge-check-return-value-of-ipv6_dev_get_saddr.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0024-bridge-check-return-value-of-ipv6_dev_get_saddr.patch
new file mode 100644
index 0000000..7a05ae2
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0024-bridge-check-return-value-of-ipv6_dev_get_saddr.patch
@@ -0,0 +1,39 @@
+From 384298df213387fc31905729a5e23e79bc6b8222 Mon Sep 17 00:00:00 2001
+From: Ulrich Weber <ulrich.weber@sophos.com>
+Date: Mon, 5 Mar 2012 04:52:44 +0000
+Subject: [PATCH 24/42] bridge: check return value of ipv6_dev_get_saddr()
+
+[ Upstream commit d1d81d4c3dd886d5fa25a2c4fa1e39cb89613712 ]
+
+otherwise source IPv6 address of ICMPV6_MGM_QUERY packet
+might be random junk if IPv6 is disabled on interface or
+link-local address is not yet ready (DAD).
+
+Signed-off-by: Ulrich Weber <ulrich.weber@sophos.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/bridge/br_multicast.c |    7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/net/bridge/br_multicast.c b/net/bridge/br_multicast.c
+index a5f4e57..8eb6b15 100644
+--- a/net/bridge/br_multicast.c
++++ b/net/bridge/br_multicast.c
+@@ -446,8 +446,11 @@ static struct sk_buff *br_ip6_multicast_alloc_query(struct net_bridge *br,
+ 	ip6h->nexthdr = IPPROTO_HOPOPTS;
+ 	ip6h->hop_limit = 1;
+ 	ipv6_addr_set(&ip6h->daddr, htonl(0xff020000), 0, 0, htonl(1));
+-	ipv6_dev_get_saddr(dev_net(br->dev), br->dev, &ip6h->daddr, 0,
+-			   &ip6h->saddr);
++	if (ipv6_dev_get_saddr(dev_net(br->dev), br->dev, &ip6h->daddr, 0,
++			       &ip6h->saddr)) {
++		kfree_skb(skb);
++		return NULL;
++	}
+ 	ipv6_eth_mc_map(&ip6h->daddr, eth->h_dest);
+ 
+ 	hopopt = (u8 *)(ip6h + 1);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0025-tcp-fix-tcp_shift_skb_data-to-not-shift-SACKed-data-.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0025-tcp-fix-tcp_shift_skb_data-to-not-shift-SACKed-data-.patch
new file mode 100644
index 0000000..07ce46b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0025-tcp-fix-tcp_shift_skb_data-to-not-shift-SACKed-data-.patch
@@ -0,0 +1,89 @@
+From c0ebd50aab8d8fa2f98ceb9da54d161f492326e0 Mon Sep 17 00:00:00 2001
+From: Neal Cardwell <ncardwell@google.com>
+Date: Mon, 5 Mar 2012 19:35:04 +0000
+Subject: [PATCH 25/42] tcp: fix tcp_shift_skb_data() to not shift SACKed data
+ below snd_una
+
+[ Upstream commit 4648dc97af9d496218a05353b0e442b3dfa6aaab ]
+
+This commit fixes tcp_shift_skb_data() so that it does not shift
+SACKed data below snd_una.
+
+This fixes an issue whose symptoms exactly match reports showing
+tp->sacked_out going negative since 3.3.0-rc4 (see "WARNING: at
+net/ipv4/tcp_input.c:3418" thread on netdev).
+
+Since 2008 (832d11c5cd076abc0aa1eaf7be96c81d1a59ce41)
+tcp_shift_skb_data() had been shifting SACKed ranges that were below
+snd_una. It checked that the *end* of the skb it was about to shift
+from was above snd_una, but did not check that the end of the actual
+shifted range was above snd_una; this commit adds that check.
+
+Shifting SACKed ranges below snd_una is problematic because for such
+ranges tcp_sacktag_one() short-circuits: it does not declare anything
+as SACKed and does not increase sacked_out.
+
+Before the fixes in commits cc9a672ee522d4805495b98680f4a3db5d0a0af9
+and daef52bab1fd26e24e8e9578f8fb33ba1d0cb412, shifting SACKed ranges
+below snd_una happened to work because tcp_shifted_skb() was always
+(incorrectly) passing in to tcp_sacktag_one() an skb whose end_seq
+tcp_shift_skb_data() had already guaranteed was beyond snd_una. Hence
+tcp_sacktag_one() never short-circuited and always increased
+tp->sacked_out in this case.
+
+After those two fixes, my testing has verified that shifting SACKed
+ranges below snd_una could cause tp->sacked_out to go negative with
+the following sequence of events:
+
+(1) tcp_shift_skb_data() sees an skb whose end_seq is beyond snd_una,
+    then shifts a prefix of that skb that is below snd_una
+
+(2) tcp_shifted_skb() increments the packet count of the
+    already-SACKed prev sk_buff
+
+(3) tcp_sacktag_one() sees the end of the new SACKed range is below
+    snd_una, so it short-circuits and doesn't increase tp->sacked_out
+
+(5) tcp_clean_rtx_queue() sees the SACKed skb has been ACKed,
+    decrements tp->sacked_out by this "inflated" pcount that was
+    missing a matching increase in tp->sacked_out, and hence
+    tp->sacked_out underflows to a u32 like 0xFFFFFFFF, which casted
+    to s32 is negative.
+
+(6) this leads to the warnings seen in the recent "WARNING: at
+    net/ipv4/tcp_input.c:3418" thread on the netdev list; e.g.:
+    tcp_input.c:3418  WARN_ON((int)tp->sacked_out < 0);
+
+More generally, I think this bug can be tickled in some cases where
+two or more ACKs from the receiver are lost and then a DSACK arrives
+that is immediately above an existing SACKed skb in the write queue.
+
+This fix changes tcp_shift_skb_data() to abort this sequence at step
+(1) in the scenario above by noticing that the bytes are below snd_una
+and not shifting them.
+
+Signed-off-by: Neal Cardwell <ncardwell@google.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/tcp_input.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
+index 1c774af..e4d1e4a 100644
+--- a/net/ipv4/tcp_input.c
++++ b/net/ipv4/tcp_input.c
+@@ -1588,6 +1588,10 @@ static struct sk_buff *tcp_shift_skb_data(struct sock *sk, struct sk_buff *skb,
+ 		}
+ 	}
+ 
++	/* tcp_sacktag_one() won't SACK-tag ranges below snd_una */
++	if (!after(TCP_SKB_CB(skb)->seq + len, tp->snd_una))
++		goto fallback;
++
+ 	if (!skb_shift(prev, skb, len))
+ 		goto fallback;
+ 	if (!tcp_shifted_skb(sk, skb, state, pcount, len, mss, dup_sack))
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0026-IPv6-Fix-not-join-all-router-mcast-group-when-forwar.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0026-IPv6-Fix-not-join-all-router-mcast-group-when-forwar.patch
new file mode 100644
index 0000000..048a7e3
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0026-IPv6-Fix-not-join-all-router-mcast-group-when-forwar.patch
@@ -0,0 +1,36 @@
+From 7ddf7a941aeb1bdb57801edb82c68fae8d40ea75 Mon Sep 17 00:00:00 2001
+From: Li Wei <lw@cn.fujitsu.com>
+Date: Mon, 5 Mar 2012 14:45:17 +0000
+Subject: [PATCH 26/42] IPv6: Fix not join all-router mcast group when
+ forwarding set.
+
+[ Upstream commit d6ddef9e641d1229d4ec841dc75ae703171c3e92 ]
+
+When forwarding was set and a new net device is register,
+we need add this device to the all-router mcast group.
+
+Signed-off-by: Li Wei <lw@cn.fujitsu.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv6/addrconf.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/net/ipv6/addrconf.c b/net/ipv6/addrconf.c
+index 836c4ea..a5521c5 100644
+--- a/net/ipv6/addrconf.c
++++ b/net/ipv6/addrconf.c
+@@ -434,6 +434,10 @@ static struct inet6_dev * ipv6_add_dev(struct net_device *dev)
+ 	/* Join all-node multicast group */
+ 	ipv6_dev_mc_inc(dev, &in6addr_linklocal_allnodes);
+ 
++	/* Join all-router multicast group if forwarding is set */
++	if (ndev->cnf.forwarding && dev && (dev->flags & IFF_MULTICAST))
++		ipv6_dev_mc_inc(dev, &in6addr_linklocal_allrouters);
++
+ 	return ndev;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0027-usb-asix-Patch-for-Sitecom-LN-031.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0027-usb-asix-Patch-for-Sitecom-LN-031.patch
new file mode 100644
index 0000000..be2bf82
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0027-usb-asix-Patch-for-Sitecom-LN-031.patch
@@ -0,0 +1,36 @@
+From 636b06096f3e95adf81e162fdb74ed388c696be1 Mon Sep 17 00:00:00 2001
+From: Joerg Neikes <j.neikes@midlandgate.de>
+Date: Thu, 8 Mar 2012 22:44:03 +0000
+Subject: [PATCH 27/42] usb: asix: Patch for Sitecom LN-031
+
+commit 4e50391968849860dff1aacde358b4eb14aa5127 upstream.
+
+This patch adds support for the Sitecom LN-031 USB adapter with a AX88178 chip.
+
+Added USB id to find correct driver for AX88178 1000 Ethernet adapter.
+
+Signed-off-by: Joerg Neikes <j.neikes@midlandgate.de>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/net/usb/asix.c |    4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/drivers/net/usb/asix.c b/drivers/net/usb/asix.c
+index f5e063a..fda4be2 100644
+--- a/drivers/net/usb/asix.c
++++ b/drivers/net/usb/asix.c
+@@ -1595,6 +1595,10 @@ static const struct usb_device_id	products [] = {
+ 	USB_DEVICE (0x6189, 0x182d),
+ 	.driver_info =  (unsigned long) &ax8817x_info,
+ }, {
++	// Sitecom LN-031 "USB 2.0 10/100/1000 Ethernet adapter"
++	USB_DEVICE (0x0df6, 0x0056),
++	.driver_info =  (unsigned long) &ax88178_info,
++}, {
+ 	// corega FEther USB2-TX
+ 	USB_DEVICE (0x07aa, 0x0017),
+ 	.driver_info =  (unsigned long) &ax8817x_info,
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0028-regulator-Fix-setting-selector-in-tps6524x-set_volta.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0028-regulator-Fix-setting-selector-in-tps6524x-set_volta.patch
new file mode 100644
index 0000000..32f16eb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0028-regulator-Fix-setting-selector-in-tps6524x-set_volta.patch
@@ -0,0 +1,33 @@
+From 62c35c47cb8ddee3510f8da30768d995d62736ba Mon Sep 17 00:00:00 2001
+From: Axel Lin <axel.lin@gmail.com>
+Date: Thu, 8 Mar 2012 10:02:17 +0800
+Subject: [PATCH 28/42] regulator: Fix setting selector in tps6524x
+ set_voltage function
+
+commit f03570cf1709397ebe656608266b44ec772960c2 upstream.
+
+Don't assign the voltage to selector.
+
+Signed-off-by: Axel Lin <axel.lin@gmail.com>
+Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/regulator/tps6524x-regulator.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/regulator/tps6524x-regulator.c b/drivers/regulator/tps6524x-regulator.c
+index 9166aa0..229b6f4 100644
+--- a/drivers/regulator/tps6524x-regulator.c
++++ b/drivers/regulator/tps6524x-regulator.c
+@@ -481,7 +481,7 @@ static int set_voltage(struct regulator_dev *rdev, int min_uV, int max_uV,
+ 	if (i >= info->n_voltages)
+ 		i = info->n_voltages - 1;
+ 
+-	*selector = info->voltages[i];
++	*selector = i;
+ 
+ 	return write_field(hw, &info->voltage, i);
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0029-block-Fix-NULL-pointer-dereference-in-sd_revalidate_.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0029-block-Fix-NULL-pointer-dereference-in-sd_revalidate_.patch
new file mode 100644
index 0000000..3a4af4b
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0029-block-Fix-NULL-pointer-dereference-in-sd_revalidate_.patch
@@ -0,0 +1,170 @@
+From f90fbbb22b2a145c5a3d66a31a46a32bb54ed722 Mon Sep 17 00:00:00 2001
+From: Jun'ichi Nomura <j-nomura@ce.jp.nec.com>
+Date: Fri, 2 Mar 2012 10:38:33 +0100
+Subject: [PATCH 29/42] block: Fix NULL pointer dereference in
+ sd_revalidate_disk
+
+commit fe316bf2d5847bc5dd975668671a7b1067603bc7 upstream.
+
+Since 2.6.39 (1196f8b), when a driver returns -ENOMEDIUM for open(),
+__blkdev_get() calls rescan_partitions() to remove
+in-kernel partition structures and raise KOBJ_CHANGE uevent.
+
+However it ends up calling driver's revalidate_disk without open
+and could cause oops.
+
+In the case of SCSI:
+
+  process A                  process B
+  ----------------------------------------------
+  sys_open
+    __blkdev_get
+      sd_open
+        returns -ENOMEDIUM
+                             scsi_remove_device
+                               <scsi_device torn down>
+      rescan_partitions
+        sd_revalidate_disk
+          <oops>
+Oopses are reported here:
+http://marc.info/?l=linux-scsi&m=132388619710052
+
+This patch separates the partition invalidation from rescan_partitions()
+and use it for -ENOMEDIUM case.
+
+Reported-by: Huajun Li <huajun.li.lee@gmail.com>
+Signed-off-by: Jun'ichi Nomura <j-nomura@ce.jp.nec.com>
+Acked-by: Tejun Heo <tj@kernel.org>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/block_dev.c        |   16 ++++++++++++----
+ fs/partitions/check.c |   48 ++++++++++++++++++++++++++++++++++++++++--------
+ include/linux/genhd.h |    1 +
+ 3 files changed, 53 insertions(+), 12 deletions(-)
+
+diff --git a/fs/block_dev.c b/fs/block_dev.c
+index b07f1da..abe9b48 100644
+--- a/fs/block_dev.c
++++ b/fs/block_dev.c
+@@ -1159,8 +1159,12 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, int for_part)
+ 			 * The latter is necessary to prevent ghost
+ 			 * partitions on a removed medium.
+ 			 */
+-			if (bdev->bd_invalidated && (!ret || ret == -ENOMEDIUM))
+-				rescan_partitions(disk, bdev);
++			if (bdev->bd_invalidated) {
++				if (!ret)
++					rescan_partitions(disk, bdev);
++				else if (ret == -ENOMEDIUM)
++					invalidate_partitions(disk, bdev);
++			}
+ 			if (ret)
+ 				goto out_clear;
+ 		} else {
+@@ -1190,8 +1194,12 @@ static int __blkdev_get(struct block_device *bdev, fmode_t mode, int for_part)
+ 			if (bdev->bd_disk->fops->open)
+ 				ret = bdev->bd_disk->fops->open(bdev, mode);
+ 			/* the same as first opener case, read comment there */
+-			if (bdev->bd_invalidated && (!ret || ret == -ENOMEDIUM))
+-				rescan_partitions(bdev->bd_disk, bdev);
++			if (bdev->bd_invalidated) {
++				if (!ret)
++					rescan_partitions(bdev->bd_disk, bdev);
++				else if (ret == -ENOMEDIUM)
++					invalidate_partitions(bdev->bd_disk, bdev);
++			}
+ 			if (ret)
+ 				goto out_unlock_bdev;
+ 		}
+diff --git a/fs/partitions/check.c b/fs/partitions/check.c
+index e3c63d1..6b5fcc5 100644
+--- a/fs/partitions/check.c
++++ b/fs/partitions/check.c
+@@ -539,17 +539,11 @@ static bool disk_unlock_native_capacity(struct gendisk *disk)
+ 	}
+ }
+ 
+-int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
++static int drop_partitions(struct gendisk *disk, struct block_device *bdev)
+ {
+-	struct parsed_partitions *state = NULL;
+ 	struct disk_part_iter piter;
+ 	struct hd_struct *part;
+-	int p, highest, res;
+-rescan:
+-	if (state && !IS_ERR(state)) {
+-		kfree(state);
+-		state = NULL;
+-	}
++	int res;
+ 
+ 	if (bdev->bd_part_count)
+ 		return -EBUSY;
+@@ -562,6 +556,24 @@ rescan:
+ 		delete_partition(disk, part->partno);
+ 	disk_part_iter_exit(&piter);
+ 
++	return 0;
++}
++
++int rescan_partitions(struct gendisk *disk, struct block_device *bdev)
++{
++	struct parsed_partitions *state = NULL;
++	struct hd_struct *part;
++	int p, highest, res;
++rescan:
++	if (state && !IS_ERR(state)) {
++		kfree(state);
++		state = NULL;
++	}
++
++	res = drop_partitions(disk, bdev);
++	if (res)
++		return res;
++
+ 	if (disk->fops->revalidate_disk)
+ 		disk->fops->revalidate_disk(disk);
+ 	check_disk_size_change(disk, bdev);
+@@ -665,6 +677,26 @@ rescan:
+ 	return 0;
+ }
+ 
++int invalidate_partitions(struct gendisk *disk, struct block_device *bdev)
++{
++	int res;
++
++	if (!bdev->bd_invalidated)
++		return 0;
++
++	res = drop_partitions(disk, bdev);
++	if (res)
++		return res;
++
++	set_capacity(disk, 0);
++	check_disk_size_change(disk, bdev);
++	bdev->bd_invalidated = 0;
++	/* tell userspace that the media / partition table may have changed */
++	kobject_uevent(&disk_to_dev(disk)->kobj, KOBJ_CHANGE);
++
++	return 0;
++}
++
+ unsigned char *read_dev_sector(struct block_device *bdev, sector_t n, Sector *p)
+ {
+ 	struct address_space *mapping = bdev->bd_inode->i_mapping;
+diff --git a/include/linux/genhd.h b/include/linux/genhd.h
+index 6d18f35..c6f7f6a 100644
+--- a/include/linux/genhd.h
++++ b/include/linux/genhd.h
+@@ -596,6 +596,7 @@ extern char *disk_name (struct gendisk *hd, int partno, char *buf);
+ 
+ extern int disk_expand_part_tbl(struct gendisk *disk, int target);
+ extern int rescan_partitions(struct gendisk *disk, struct block_device *bdev);
++extern int invalidate_partitions(struct gendisk *disk, struct block_device *bdev);
+ extern struct hd_struct * __must_check add_partition(struct gendisk *disk,
+ 						     int partno, sector_t start,
+ 						     sector_t len, int flags,
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0030-block-sx8-fix-pointer-math-issue-getting-fw-version.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0030-block-sx8-fix-pointer-math-issue-getting-fw-version.patch
new file mode 100644
index 0000000..0ed858c
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0030-block-sx8-fix-pointer-math-issue-getting-fw-version.patch
@@ -0,0 +1,34 @@
+From 5a399c9c3325b2a72d3bf522b7e1b0fa48954d96 Mon Sep 17 00:00:00 2001
+From: Dan Carpenter <dan.carpenter@oracle.com>
+Date: Sat, 3 Mar 2012 12:09:17 +0100
+Subject: [PATCH 30/42] block, sx8: fix pointer math issue getting fw version
+
+commit ea5f4db8ece896c2ab9eafa0924148a2596c52e4 upstream.
+
+"mem" is type u8.  We need parenthesis here or it screws up the pointer
+math probably leading to an oops.
+
+Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
+Acked-by: Jeff Garzik <jgarzik@redhat.com>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/block/sx8.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/block/sx8.c b/drivers/block/sx8.c
+index b70f0fc..eec7b7a 100644
+--- a/drivers/block/sx8.c
++++ b/drivers/block/sx8.c
+@@ -1116,7 +1116,7 @@ static inline void carm_handle_resp(struct carm_host *host,
+ 			break;
+ 		case MISC_GET_FW_VER: {
+ 			struct carm_fw_ver *ver = (struct carm_fw_ver *)
+-				mem + sizeof(struct carm_msg_get_fw_ver);
++				(mem + sizeof(struct carm_msg_get_fw_ver));
+ 			if (!error) {
+ 				host->fw_ver = le32_to_cpu(ver->version);
+ 				host->flags |= (ver->features & FL_FW_VER_MASK);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0031-block-fix-__blkdev_get-and-add_disk-race-condition.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0031-block-fix-__blkdev_get-and-add_disk-race-condition.patch
new file mode 100644
index 0000000..4a08d31
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0031-block-fix-__blkdev_get-and-add_disk-race-condition.patch
@@ -0,0 +1,163 @@
+From 365dff776f2730d8aa79bb2d4cec1abcca4d30fd Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Fri, 2 Mar 2012 10:43:28 +0100
+Subject: [PATCH 31/42] block: fix __blkdev_get and add_disk race condition
+
+commit 9f53d2fe815b4011ff930a7b6db98385d45faa68 upstream.
+
+The following situation might occur:
+
+__blkdev_get:			add_disk:
+
+				register_disk()
+get_gendisk()
+
+disk_block_events()
+	disk->ev == NULL
+
+				disk_add_events()
+
+__disk_unblock_events()
+	disk->ev != NULL
+	--ev->block
+
+Then we unblock events, when they are suppose to be blocked. This can
+trigger events related block/genhd.c warnings, but also can crash in
+sd_check_events() or other places.
+
+I'm able to reproduce crashes with the following scripts (with
+connected usb dongle as sdb disk).
+
+<snip>
+DEV=/dev/sdb
+ENABLE=/sys/bus/usb/devices/1-2/bConfigurationValue
+
+function stop_me()
+{
+	for i in `jobs -p` ; do kill $i 2> /dev/null ; done
+	exit
+}
+
+trap stop_me SIGHUP SIGINT SIGTERM
+
+for ((i = 0; i < 10; i++)) ; do
+	while true; do fdisk -l $DEV  2>&1 > /dev/null ; done &
+done
+
+while true ; do
+echo 1 > $ENABLE
+sleep 1
+echo 0 > $ENABLE
+done
+</snip>
+
+I use the script to verify patch fixing oops in sd_revalidate_disk
+http://marc.info/?l=linux-scsi&m=132935572512352&w=2
+Without Jun'ichi Nomura patch titled "Fix NULL pointer dereference in
+sd_revalidate_disk" or this one, script easily crash kernel within
+a few seconds. With both patches applied I do not observe crash.
+Unfortunately after some time (dozen of minutes), script will hung in:
+
+[ 1563.906432]  [<c08354f5>] schedule_timeout_uninterruptible+0x15/0x20
+[ 1563.906437]  [<c04532d5>] msleep+0x15/0x20
+[ 1563.906443]  [<c05d60b2>] blk_drain_queue+0x32/0xd0
+[ 1563.906447]  [<c05d6e00>] blk_cleanup_queue+0xd0/0x170
+[ 1563.906454]  [<c06d278f>] scsi_free_queue+0x3f/0x60
+[ 1563.906459]  [<c06d7e6e>] __scsi_remove_device+0x6e/0xb0
+[ 1563.906463]  [<c06d4aff>] scsi_forget_host+0x4f/0x60
+[ 1563.906468]  [<c06cd84a>] scsi_remove_host+0x5a/0xf0
+[ 1563.906482]  [<f7f030fb>] quiesce_and_remove_host+0x5b/0xa0 [usb_storage]
+[ 1563.906490]  [<f7f03203>] usb_stor_disconnect+0x13/0x20 [usb_storage]
+
+Anyway I think this patch is some step forward.
+
+As drawback, I do not teardown on sysfs file create error, because I do
+not know how to nullify disk->ev (since it can be used). However add_disk
+error handling practically does not exist too, and things will work
+without this sysfs file, except events will not be exported to user
+space.
+
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Acked-by: Tejun Heo <tj@kernel.org>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ block/genhd.c |   32 +++++++++++++++++++-------------
+ 1 file changed, 19 insertions(+), 13 deletions(-)
+
+diff --git a/block/genhd.c b/block/genhd.c
+index 02e9fca..9db720d 100644
+--- a/block/genhd.c
++++ b/block/genhd.c
+@@ -36,6 +36,7 @@ static DEFINE_IDR(ext_devt_idr);
+ 
+ static struct device_type disk_type;
+ 
++static void disk_alloc_events(struct gendisk *disk);
+ static void disk_add_events(struct gendisk *disk);
+ static void disk_del_events(struct gendisk *disk);
+ static void disk_release_events(struct gendisk *disk);
+@@ -602,6 +603,8 @@ void add_disk(struct gendisk *disk)
+ 	disk->major = MAJOR(devt);
+ 	disk->first_minor = MINOR(devt);
+ 
++	disk_alloc_events(disk);
++
+ 	/* Register BDI before referencing it from bdev */
+ 	bdi = &disk->queue->backing_dev_info;
+ 	bdi_register_dev(bdi, disk_devt(disk));
+@@ -1734,9 +1737,9 @@ module_param_cb(events_dfl_poll_msecs, &disk_events_dfl_poll_msecs_param_ops,
+ 		&disk_events_dfl_poll_msecs, 0644);
+ 
+ /*
+- * disk_{add|del|release}_events - initialize and destroy disk_events.
++ * disk_{alloc|add|del|release}_events - initialize and destroy disk_events.
+  */
+-static void disk_add_events(struct gendisk *disk)
++static void disk_alloc_events(struct gendisk *disk)
+ {
+ 	struct disk_events *ev;
+ 
+@@ -1749,16 +1752,6 @@ static void disk_add_events(struct gendisk *disk)
+ 		return;
+ 	}
+ 
+-	if (sysfs_create_files(&disk_to_dev(disk)->kobj,
+-			       disk_events_attrs) < 0) {
+-		pr_warn("%s: failed to create sysfs files for events\n",
+-			disk->disk_name);
+-		kfree(ev);
+-		return;
+-	}
+-
+-	disk->ev = ev;
+-
+ 	INIT_LIST_HEAD(&ev->node);
+ 	ev->disk = disk;
+ 	spin_lock_init(&ev->lock);
+@@ -1767,8 +1760,21 @@ static void disk_add_events(struct gendisk *disk)
+ 	ev->poll_msecs = -1;
+ 	INIT_DELAYED_WORK(&ev->dwork, disk_events_workfn);
+ 
++	disk->ev = ev;
++}
++
++static void disk_add_events(struct gendisk *disk)
++{
++	if (!disk->ev)
++		return;
++
++	/* FIXME: error handling */
++	if (sysfs_create_files(&disk_to_dev(disk)->kobj, disk_events_attrs) < 0)
++		pr_warn("%s: failed to create sysfs files for events\n",
++			disk->disk_name);
++
+ 	mutex_lock(&disk_events_mutex);
+-	list_add_tail(&ev->node, &disk_events);
++	list_add_tail(&disk->ev->node, &disk_events);
+ 	mutex_unlock(&disk_events_mutex);
+ 
+ 	/*
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0032-Block-use-a-freezable-workqueue-for-disk-event-polli.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0032-Block-use-a-freezable-workqueue-for-disk-event-polli.patch
new file mode 100644
index 0000000..de8f4c9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0032-Block-use-a-freezable-workqueue-for-disk-event-polli.patch
@@ -0,0 +1,129 @@
+From 21816a3fe95d2536991ece0a71609d8c22f8af9d Mon Sep 17 00:00:00 2001
+From: Alan Stern <stern@rowland.harvard.edu>
+Date: Fri, 2 Mar 2012 10:51:00 +0100
+Subject: [PATCH 32/42] Block: use a freezable workqueue for disk-event
+ polling
+
+commit 62d3c5439c534b0e6c653fc63e6d8c67be3a57b1 upstream.
+
+This patch (as1519) fixes a bug in the block layer's disk-events
+polling.  The polling is done by a work routine queued on the
+system_nrt_wq workqueue.  Since that workqueue isn't freezable, the
+polling continues even in the middle of a system sleep transition.
+
+Obviously, polling a suspended drive for media changes and such isn't
+a good thing to do; in the case of USB mass-storage devices it can
+lead to real problems requiring device resets and even re-enumeration.
+
+The patch fixes things by creating a new system-wide, non-reentrant,
+freezable workqueue and using it for disk-events polling.
+
+Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
+Acked-by: Tejun Heo <tj@kernel.org>
+Acked-by: Rafael J. Wysocki <rjw@sisk.pl>
+Signed-off-by: Jens Axboe <axboe@kernel.dk>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ block/genhd.c             |   10 +++++-----
+ include/linux/workqueue.h |    4 ++++
+ kernel/workqueue.c        |    7 ++++++-
+ 3 files changed, 15 insertions(+), 6 deletions(-)
+
+diff --git a/block/genhd.c b/block/genhd.c
+index 9db720d..997afd6 100644
+--- a/block/genhd.c
++++ b/block/genhd.c
+@@ -1479,9 +1479,9 @@ static void __disk_unblock_events(struct gendisk *disk, bool check_now)
+ 	intv = disk_events_poll_jiffies(disk);
+ 	set_timer_slack(&ev->dwork.timer, intv / 4);
+ 	if (check_now)
+-		queue_delayed_work(system_nrt_wq, &ev->dwork, 0);
++		queue_delayed_work(system_nrt_freezable_wq, &ev->dwork, 0);
+ 	else if (intv)
+-		queue_delayed_work(system_nrt_wq, &ev->dwork, intv);
++		queue_delayed_work(system_nrt_freezable_wq, &ev->dwork, intv);
+ out_unlock:
+ 	spin_unlock_irqrestore(&ev->lock, flags);
+ }
+@@ -1525,7 +1525,7 @@ void disk_flush_events(struct gendisk *disk, unsigned int mask)
+ 	ev->clearing |= mask;
+ 	if (!ev->block) {
+ 		cancel_delayed_work(&ev->dwork);
+-		queue_delayed_work(system_nrt_wq, &ev->dwork, 0);
++		queue_delayed_work(system_nrt_freezable_wq, &ev->dwork, 0);
+ 	}
+ 	spin_unlock_irq(&ev->lock);
+ }
+@@ -1562,7 +1562,7 @@ unsigned int disk_clear_events(struct gendisk *disk, unsigned int mask)
+ 
+ 	/* uncondtionally schedule event check and wait for it to finish */
+ 	disk_block_events(disk);
+-	queue_delayed_work(system_nrt_wq, &ev->dwork, 0);
++	queue_delayed_work(system_nrt_freezable_wq, &ev->dwork, 0);
+ 	flush_delayed_work(&ev->dwork);
+ 	__disk_unblock_events(disk, false);
+ 
+@@ -1599,7 +1599,7 @@ static void disk_events_workfn(struct work_struct *work)
+ 
+ 	intv = disk_events_poll_jiffies(disk);
+ 	if (!ev->block && intv)
+-		queue_delayed_work(system_nrt_wq, &ev->dwork, intv);
++		queue_delayed_work(system_nrt_freezable_wq, &ev->dwork, intv);
+ 
+ 	spin_unlock_irq(&ev->lock);
+ 
+diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
+index 0d556de..e228ca9 100644
+--- a/include/linux/workqueue.h
++++ b/include/linux/workqueue.h
+@@ -289,12 +289,16 @@ enum {
+  *
+  * system_freezable_wq is equivalent to system_wq except that it's
+  * freezable.
++ *
++ * system_nrt_freezable_wq is equivalent to system_nrt_wq except that
++ * it's freezable.
+  */
+ extern struct workqueue_struct *system_wq;
+ extern struct workqueue_struct *system_long_wq;
+ extern struct workqueue_struct *system_nrt_wq;
+ extern struct workqueue_struct *system_unbound_wq;
+ extern struct workqueue_struct *system_freezable_wq;
++extern struct workqueue_struct *system_nrt_freezable_wq;
+ 
+ extern struct workqueue_struct *
+ __alloc_workqueue_key(const char *name, unsigned int flags, int max_active,
+diff --git a/kernel/workqueue.c b/kernel/workqueue.c
+index 42fa9ad..bb425b1 100644
+--- a/kernel/workqueue.c
++++ b/kernel/workqueue.c
+@@ -253,11 +253,13 @@ struct workqueue_struct *system_long_wq __read_mostly;
+ struct workqueue_struct *system_nrt_wq __read_mostly;
+ struct workqueue_struct *system_unbound_wq __read_mostly;
+ struct workqueue_struct *system_freezable_wq __read_mostly;
++struct workqueue_struct *system_nrt_freezable_wq __read_mostly;
+ EXPORT_SYMBOL_GPL(system_wq);
+ EXPORT_SYMBOL_GPL(system_long_wq);
+ EXPORT_SYMBOL_GPL(system_nrt_wq);
+ EXPORT_SYMBOL_GPL(system_unbound_wq);
+ EXPORT_SYMBOL_GPL(system_freezable_wq);
++EXPORT_SYMBOL_GPL(system_nrt_freezable_wq);
+ 
+ #define CREATE_TRACE_POINTS
+ #include <trace/events/workqueue.h>
+@@ -3821,8 +3823,11 @@ static int __init init_workqueues(void)
+ 					    WQ_UNBOUND_MAX_ACTIVE);
+ 	system_freezable_wq = alloc_workqueue("events_freezable",
+ 					      WQ_FREEZABLE, 0);
++	system_nrt_freezable_wq = alloc_workqueue("events_nrt_freezable",
++			WQ_NON_REENTRANT | WQ_FREEZABLE, 0);
+ 	BUG_ON(!system_wq || !system_long_wq || !system_nrt_wq ||
+-	       !system_unbound_wq || !system_freezable_wq);
++	       !system_unbound_wq || !system_freezable_wq ||
++		!system_nrt_freezable_wq);
+ 	return 0;
+ }
+ early_initcall(init_workqueues);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0033-sparc32-Add-Av8-to-assembler-command-line.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0033-sparc32-Add-Av8-to-assembler-command-line.patch
new file mode 100644
index 0000000..7807d73
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0033-sparc32-Add-Av8-to-assembler-command-line.patch
@@ -0,0 +1,40 @@
+From 80a069c15be0297948b3075c0e691832b9241187 Mon Sep 17 00:00:00 2001
+From: "David S. Miller" <davem@davemloft.net>
+Date: Tue, 13 Mar 2012 18:19:51 -0700
+Subject: [PATCH 33/42] sparc32: Add -Av8 to assembler command line.
+
+commit e0adb9902fb338a9fe634c3c2a3e474075c733ba upstream.
+
+Newer version of binutils are more strict about specifying the
+correct options to enable certain classes of instructions.
+
+The sparc32 build is done for v7 in order to support sun4c systems
+which lack hardware integer multiply and divide instructions.
+
+So we have to pass -Av8 when building the assembler routines that
+use these instructions and get patched into the kernel when we find
+out that we have a v8 capable cpu.
+
+Reported-by: Paul Gortmaker <paul.gortmaker@windriver.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/sparc/Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/sparc/Makefile b/arch/sparc/Makefile
+index ad1fb5d..eddcfb3 100644
+--- a/arch/sparc/Makefile
++++ b/arch/sparc/Makefile
+@@ -31,7 +31,7 @@ UTS_MACHINE    := sparc
+ 
+ #KBUILD_CFLAGS += -g -pipe -fcall-used-g5 -fcall-used-g7
+ KBUILD_CFLAGS += -m32 -pipe -mno-fpu -fcall-used-g5 -fcall-used-g7
+-KBUILD_AFLAGS += -m32
++KBUILD_AFLAGS += -m32 -Wa,-Av8
+ 
+ #LDFLAGS_vmlinux = -N -Ttext 0xf0004000
+ #  Since 2.5.40, the first stage is left not btfix-ed.
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0034-hwmon-w83627ehf-Fix-writing-into-fan_stop_time-for-N.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0034-hwmon-w83627ehf-Fix-writing-into-fan_stop_time-for-N.patch
new file mode 100644
index 0000000..0fb2aca
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0034-hwmon-w83627ehf-Fix-writing-into-fan_stop_time-for-N.patch
@@ -0,0 +1,35 @@
+From 0cf88be2891cd60ef2f132c0eb55cb5334b6439d Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <linux@roeck-us.net>
+Date: Mon, 12 Mar 2012 08:21:16 -0700
+Subject: [PATCH 34/42] hwmon: (w83627ehf) Fix writing into fan_stop_time for
+ NCT6775F/NCT6776F
+
+commit 33fa9b620409edfc71aa6cf01a51f990fbe46ab8 upstream.
+
+NCT6775F and NCT6776F have their own set of registers for FAN_STOP_TIME. The
+correct registers were used to read FAN_STOP_TIME, but writes used the wrong
+registers. Fix it.
+
+Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+Acked-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/w83627ehf.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
+index c25387d..7a44a56 100644
+--- a/drivers/hwmon/w83627ehf.c
++++ b/drivers/hwmon/w83627ehf.c
+@@ -1607,7 +1607,7 @@ store_##reg(struct device *dev, struct device_attribute *attr, \
+ 	val = step_time_to_reg(val, data->pwm_mode[nr]); \
+ 	mutex_lock(&data->update_lock); \
+ 	data->reg[nr] = val; \
+-	w83627ehf_write_value(data, W83627EHF_REG_##REG[nr], val); \
++	w83627ehf_write_value(data, data->REG_##REG[nr], val); \
+ 	mutex_unlock(&data->update_lock); \
+ 	return count; \
+ } \
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0035-hwmon-w83627ehf-Fix-memory-leak-in-probe-function.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0035-hwmon-w83627ehf-Fix-memory-leak-in-probe-function.patch
new file mode 100644
index 0000000..0df8c38
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0035-hwmon-w83627ehf-Fix-memory-leak-in-probe-function.patch
@@ -0,0 +1,53 @@
+From 61fa0a2298850898c90ce67bb0b9b440c452820a Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <linux@roeck-us.net>
+Date: Mon, 12 Mar 2012 08:33:10 -0700
+Subject: [PATCH 35/42] hwmon: (w83627ehf) Fix memory leak in probe function
+
+commit 32260d94408c553dca4ce54104edf79941a27536 upstream.
+
+The driver probe function leaked memory if creating the cpu0_vid attribute file
+failed. Fix by converting the driver to use devm_kzalloc.
+
+Signed-off-by: Guenter Roeck <linux@roeck-us.net>
+Acked-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/hwmon/w83627ehf.c |    7 +++----
+ 1 file changed, 3 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
+index 7a44a56..3ffa1fa 100644
+--- a/drivers/hwmon/w83627ehf.c
++++ b/drivers/hwmon/w83627ehf.c
+@@ -2004,7 +2004,8 @@ static int __devinit w83627ehf_probe(struct platform_device *pdev)
+ 		goto exit;
+ 	}
+ 
+-	data = kzalloc(sizeof(struct w83627ehf_data), GFP_KERNEL);
++	data = devm_kzalloc(&pdev->dev, sizeof(struct w83627ehf_data),
++			    GFP_KERNEL);
+ 	if (!data) {
+ 		err = -ENOMEM;
+ 		goto exit_release;
+@@ -2498,9 +2499,8 @@ static int __devinit w83627ehf_probe(struct platform_device *pdev)
+ 
+ exit_remove:
+ 	w83627ehf_device_remove_files(dev);
+-	kfree(data);
+-	platform_set_drvdata(pdev, NULL);
+ exit_release:
++	platform_set_drvdata(pdev, NULL);
+ 	release_region(res->start, IOREGION_LENGTH);
+ exit:
+ 	return err;
+@@ -2514,7 +2514,6 @@ static int __devexit w83627ehf_remove(struct platform_device *pdev)
+ 	w83627ehf_device_remove_files(&pdev->dev);
+ 	release_region(data->addr, IOREGION_LENGTH);
+ 	platform_set_drvdata(pdev, NULL);
+-	kfree(data);
+ 
+ 	return 0;
+ }
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0036-hwmon-w83627ehf-Fix-temp2-source-for-W83627UHG.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0036-hwmon-w83627ehf-Fix-temp2-source-for-W83627UHG.patch
new file mode 100644
index 0000000..40044dd
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0036-hwmon-w83627ehf-Fix-temp2-source-for-W83627UHG.patch
@@ -0,0 +1,69 @@
+From 9a7969b58bd5d4f2c05fefa4143f244ccb5b06ab Mon Sep 17 00:00:00 2001
+From: Jean Delvare <khali@linux-fr.org>
+Date: Tue, 13 Mar 2012 04:03:27 -0400
+Subject: [PATCH 36/42] hwmon: (w83627ehf) Fix temp2 source for W83627UHG
+
+commit aacb6b0052692c72fe0cb94c6b547202def6ef46 upstream.
+
+Properly set the source of temp2 for the W83627UHG. Also fix a
+comment right before that, and document the W83627UHG as reporting up
+to 3 temperatures.
+
+Signed-off-by: Jean Delvare <khali@linux-fr.org>
+Cc: Guenter Roeck <guenter.roeck@ericsson.com>
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ Documentation/hwmon/w83627ehf |    2 +-
+ drivers/hwmon/w83627ehf.c     |    8 ++++----
+ 2 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/Documentation/hwmon/w83627ehf b/Documentation/hwmon/w83627ehf
+index 3f44dbd..75f3155 100644
+--- a/Documentation/hwmon/w83627ehf
++++ b/Documentation/hwmon/w83627ehf
+@@ -50,7 +50,7 @@ W83627DHG, W83627DHG-P, W83627UHG, W83667HG, W83667HG-B, W83667HG-I
+ (NCT6775F), and NCT6776F super I/O chips. We will refer to them collectively
+ as Winbond chips.
+ 
+-The chips implement 2 to 4 temperature sensors (9 for NCT6775F and NCT6776F),
++The chips implement 3 to 4 temperature sensors (9 for NCT6775F and NCT6776F),
+ 2 to 5 fan rotation speed sensors, 8 to 10 analog voltage sensors, one VID
+ (except for 627UHG), alarms with beep warnings (control unimplemented),
+ and some automatic fan regulation strategies (plus manual fan control mode).
+diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
+index 3ffa1fa..ceaec92 100644
+--- a/drivers/hwmon/w83627ehf.c
++++ b/drivers/hwmon/w83627ehf.c
+@@ -39,7 +39,7 @@
+ 					       0x8860 0xa1
+     w83627dhg    9      5       4       3      0xa020 0xc1    0x5ca3
+     w83627dhg-p  9      5       4       3      0xb070 0xc1    0x5ca3
+-    w83627uhg    8      2       2       2      0xa230 0xc1    0x5ca3
++    w83627uhg    8      2       2       3      0xa230 0xc1    0x5ca3
+     w83667hg     9      5       3       3      0xa510 0xc1    0x5ca3
+     w83667hg-b   9      5       3       4      0xb350 0xc1    0x5ca3
+     nct6775f     9      4       3       9      0xb470 0xc1    0x5ca3
+@@ -2158,16 +2158,16 @@ static int __devinit w83627ehf_probe(struct platform_device *pdev)
+ 		w83627ehf_set_temp_reg_ehf(data, 3);
+ 
+ 		/*
+-		 * Temperature sources for temp1 and temp2 are selected with
++		 * Temperature sources for temp2 and temp3 are selected with
+ 		 * bank 0, registers 0x49 and 0x4a.
+ 		 */
+ 		data->temp_src[0] = 0;	/* SYSTIN */
+ 		reg = w83627ehf_read_value(data, 0x49) & 0x07;
+ 		/* Adjust to have the same mapping as other source registers */
+ 		if (reg == 0)
+-			data->temp_src[1]++;
++			data->temp_src[1] = 1;
+ 		else if (reg >= 2 && reg <= 5)
+-			data->temp_src[1] += 2;
++			data->temp_src[1] = reg + 2;
+ 		else	/* should never happen */
+ 			data->have_temp &= ~(1 << 1);
+ 		reg = w83627ehf_read_value(data, 0x4a);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0037-rapidio-tsi721-fix-bug-in-register-offset-definition.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0037-rapidio-tsi721-fix-bug-in-register-offset-definition.patch
new file mode 100644
index 0000000..4f59e54
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0037-rapidio-tsi721-fix-bug-in-register-offset-definition.patch
@@ -0,0 +1,103 @@
+From 4998c8b933c68ede83d8c017928a6666d26b42de Mon Sep 17 00:00:00 2001
+From: Alexandre Bounine <alexandre.bounine@idt.com>
+Date: Thu, 15 Mar 2012 15:17:09 -0700
+Subject: [PATCH 37/42] rapidio/tsi721: fix bug in register offset definitions
+
+commit 9bbad7da76b3dd578fb55c862624366a8c9ccd22 upstream.
+
+Fix indexed register offset definitions that use decimal (wrong) instead
+of hexadecimal (correct) notation for indexing multipliers.
+
+Incorrect definitions do not affect Tsi721 driver in its current default
+configuration because it uses only IDB queue 0.  Loss of inbound
+doorbell functionality should be observed if queue other than 0 is used.
+
+Signed-off-by: Alexandre Bounine <alexandre.bounine@idt.com>
+Cc: Matt Porter <mporter@kernel.crashing.org>
+Cc: Chul Kim <chul.kim@idt.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/rapidio/devices/tsi721.h |   30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/drivers/rapidio/devices/tsi721.h b/drivers/rapidio/devices/tsi721.h
+index 822e54c..1c226b3 100644
+--- a/drivers/rapidio/devices/tsi721.h
++++ b/drivers/rapidio/devices/tsi721.h
+@@ -118,34 +118,34 @@
+ 
+ #define TSI721_IDB_ENTRY_SIZE	64
+ 
+-#define TSI721_IDQ_CTL(x)	(0x20000 + (x) * 1000)
++#define TSI721_IDQ_CTL(x)	(0x20000 + (x) * 0x1000)
+ #define TSI721_IDQ_SUSPEND	0x00000002
+ #define TSI721_IDQ_INIT		0x00000001
+ 
+-#define TSI721_IDQ_STS(x)	(0x20004 + (x) * 1000)
++#define TSI721_IDQ_STS(x)	(0x20004 + (x) * 0x1000)
+ #define TSI721_IDQ_RUN		0x00200000
+ 
+-#define TSI721_IDQ_MASK(x)	(0x20008 + (x) * 1000)
++#define TSI721_IDQ_MASK(x)	(0x20008 + (x) * 0x1000)
+ #define TSI721_IDQ_MASK_MASK	0xffff0000
+ #define TSI721_IDQ_MASK_PATT	0x0000ffff
+ 
+-#define TSI721_IDQ_RP(x)	(0x2000c + (x) * 1000)
++#define TSI721_IDQ_RP(x)	(0x2000c + (x) * 0x1000)
+ #define TSI721_IDQ_RP_PTR	0x0007ffff
+ 
+-#define TSI721_IDQ_WP(x)	(0x20010 + (x) * 1000)
++#define TSI721_IDQ_WP(x)	(0x20010 + (x) * 0x1000)
+ #define TSI721_IDQ_WP_PTR	0x0007ffff
+ 
+-#define TSI721_IDQ_BASEL(x)	(0x20014 + (x) * 1000)
++#define TSI721_IDQ_BASEL(x)	(0x20014 + (x) * 0x1000)
+ #define TSI721_IDQ_BASEL_ADDR	0xffffffc0
+-#define TSI721_IDQ_BASEU(x)	(0x20018 + (x) * 1000)
+-#define TSI721_IDQ_SIZE(x)	(0x2001c + (x) * 1000)
++#define TSI721_IDQ_BASEU(x)	(0x20018 + (x) * 0x1000)
++#define TSI721_IDQ_SIZE(x)	(0x2001c + (x) * 0x1000)
+ #define TSI721_IDQ_SIZE_VAL(size)	(__fls(size) - 4)
+ #define TSI721_IDQ_SIZE_MIN	512
+ #define TSI721_IDQ_SIZE_MAX	(512 * 1024)
+ 
+-#define TSI721_SR_CHINT(x)	(0x20040 + (x) * 1000)
+-#define TSI721_SR_CHINTE(x)	(0x20044 + (x) * 1000)
+-#define TSI721_SR_CHINTSET(x)	(0x20048 + (x) * 1000)
++#define TSI721_SR_CHINT(x)	(0x20040 + (x) * 0x1000)
++#define TSI721_SR_CHINTE(x)	(0x20044 + (x) * 0x1000)
++#define TSI721_SR_CHINTSET(x)	(0x20048 + (x) * 0x1000)
+ #define TSI721_SR_CHINT_ODBOK	0x00000020
+ #define TSI721_SR_CHINT_IDBQRCV	0x00000010
+ #define TSI721_SR_CHINT_SUSP	0x00000008
+@@ -156,7 +156,7 @@
+ 
+ #define TSI721_IBWIN_NUM	8
+ 
+-#define TSI721_IBWINLB(x)	(0x29000 + (x) * 20)
++#define TSI721_IBWINLB(x)	(0x29000 + (x) * 0x20)
+ #define TSI721_IBWINLB_BA	0xfffff000
+ #define TSI721_IBWINLB_WEN	0x00000001
+ 
+@@ -187,13 +187,13 @@
+  */
+ #define TSI721_OBWIN_NUM	TSI721_PC2SR_WINS
+ 
+-#define TSI721_OBWINLB(x)	(0x40000 + (x) * 20)
++#define TSI721_OBWINLB(x)	(0x40000 + (x) * 0x20)
+ #define TSI721_OBWINLB_BA	0xffff8000
+ #define TSI721_OBWINLB_WEN	0x00000001
+ 
+-#define TSI721_OBWINUB(x)	(0x40004 + (x) * 20)
++#define TSI721_OBWINUB(x)	(0x40004 + (x) * 0x20)
+ 
+-#define TSI721_OBWINSZ(x)	(0x40008 + (x) * 20)
++#define TSI721_OBWINSZ(x)	(0x40008 + (x) * 0x20)
+ #define TSI721_OBWINSZ_SIZE	0x00001f00
+ #define TSI721_OBWIN_SIZE(size)	(__fls(size) - 15)
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0038-i2c-algo-bit-Fix-spurious-SCL-timeouts-under-heavy-l.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0038-i2c-algo-bit-Fix-spurious-SCL-timeouts-under-heavy-l.patch
new file mode 100644
index 0000000..896f6ab
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0038-i2c-algo-bit-Fix-spurious-SCL-timeouts-under-heavy-l.patch
@@ -0,0 +1,46 @@
+From 67d192ddf0b8fb26bc4f8f2cf405b984174522b8 Mon Sep 17 00:00:00 2001
+From: Ville Syrjala <syrjala@sci.fi>
+Date: Thu, 15 Mar 2012 18:11:05 +0100
+Subject: [PATCH 38/42] i2c-algo-bit: Fix spurious SCL timeouts under heavy
+ load
+
+commit 8ee161ce5e0cfc689eb677f227a6248191165fac upstream.
+
+When the system is under heavy load, there can be a significant delay
+between the getscl() and time_after() calls inside sclhi(). That delay
+may cause the time_after() check to trigger after SCL has gone high,
+causing sclhi() to return -ETIMEDOUT.
+
+To fix the problem, double check that SCL is still low after the
+timeout has been reached, before deciding to return -ETIMEDOUT.
+
+Signed-off-by: Ville Syrjala <syrjala@sci.fi>
+Signed-off-by: Jean Delvare <khali@linux-fr.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/i2c/algos/i2c-algo-bit.c |    8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/drivers/i2c/algos/i2c-algo-bit.c b/drivers/i2c/algos/i2c-algo-bit.c
+index 525c734..24f94f4 100644
+--- a/drivers/i2c/algos/i2c-algo-bit.c
++++ b/drivers/i2c/algos/i2c-algo-bit.c
+@@ -103,8 +103,14 @@ static int sclhi(struct i2c_algo_bit_data *adap)
+ 		 * chips may hold it low ("clock stretching") while they
+ 		 * are processing data internally.
+ 		 */
+-		if (time_after(jiffies, start + adap->timeout))
++		if (time_after(jiffies, start + adap->timeout)) {
++			/* Test one last time, as we may have been preempted
++			 * between last check and timeout test.
++			 */
++			if (getscl(adap))
++				break;
+ 			return -ETIMEDOUT;
++		}
+ 		cond_resched();
+ 	}
+ #ifdef DEBUG
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0039-iscsi-target-Fix-reservation-conflict-EBUSY-response.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0039-iscsi-target-Fix-reservation-conflict-EBUSY-response.patch
new file mode 100644
index 0000000..3b071da
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0039-iscsi-target-Fix-reservation-conflict-EBUSY-response.patch
@@ -0,0 +1,51 @@
+From 68cefddd17e9b4f4600a64b0351acff4bb250419 Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Tue, 13 Mar 2012 18:20:11 -0700
+Subject: [PATCH 39/42] iscsi-target: Fix reservation conflict -EBUSY response
+ handling bug
+
+commit 00fdc6bbef77844ce397a7de7acfaf25e8e2e4eb upstream.
+
+This patch addresses a iscsi-target specific bug related to reservation conflict
+handling in iscsit_handle_scsi_cmd() that has been causing reservation conflicts
+to complete and not fail as expected due to incorrect errno checking.  The problem
+occured with the change to return -EBUSY from transport_generic_cmd_sequencer() ->
+transport_generic_allocate_tasks() failures, that broke iscsit_handle_scsi_cmd()
+checking for -EINVAL in order to invoke a non GOOD status response.
+
+This was manifesting itself as data corruption with legacy SPC-2 reservations,
+but also effects iscsi-target LUNs with SPC-3 persistent reservations.
+
+This bug was originally introduced in lio-core commit:
+
+commit 03e98c9eb916f3f0868c1dc344dde2a60287ff72
+Author: Nicholas Bellinger <nab@linux-iscsi.org>
+Date:   Fri Nov 4 02:36:16 2011 -0700
+
+    target: Address legacy PYX_TRANSPORT_* return code breakage
+
+Reported-by: Martin Svec <martin.svec@zoner.cz>
+Cc: Martin Svec <martin.svec@zoner.cz>
+Cc: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/iscsi/iscsi_target.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drivers/target/iscsi/iscsi_target.c b/drivers/target/iscsi/iscsi_target.c
+index 0c1d5c73..03d3528 100644
+--- a/drivers/target/iscsi/iscsi_target.c
++++ b/drivers/target/iscsi/iscsi_target.c
+@@ -1029,7 +1029,7 @@ done:
+ 		return iscsit_add_reject_from_cmd(
+ 				ISCSI_REASON_BOOKMARK_NO_RESOURCES,
+ 				1, 1, buf, cmd);
+-	} else if (transport_ret == -EINVAL) {
++	} else if (transport_ret < 0) {
+ 		/*
+ 		 * Unsupported SAM Opcode.  CHECK_CONDITION will be sent
+ 		 * in iscsit_execute_cmd() during the CmdSN OOO Execution
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0040-target-Fix-compatible-reservation-handling-CRH-1-wit.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0040-target-Fix-compatible-reservation-handling-CRH-1-wit.patch
new file mode 100644
index 0000000..1673697
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0040-target-Fix-compatible-reservation-handling-CRH-1-wit.patch
@@ -0,0 +1,152 @@
+From 16add6db674e266a62219145284435960e47435e Mon Sep 17 00:00:00 2001
+From: Nicholas Bellinger <nab@linux-iscsi.org>
+Date: Tue, 13 Mar 2012 21:29:06 -0700
+Subject: [PATCH 40/42] target: Fix compatible reservation handling (CRH=1)
+ with legacy RESERVE/RELEASE
+
+commit 087a03b3ea1c8d6e2d5743a8d1c6d571058caa04 upstream.
+
+This patch addresses a bug with target_check_scsi2_reservation_conflict()
+return checking in target_scsi2_reservation_[reserve,release]() that was
+preventing CRH=1 operation from silently succeeding in the two special
+cases defined by SPC-3, and not failing with reservation conflict status
+when dealing with legacy RESERVE/RELEASE + active SPC-3 PR logic.
+
+Also explictly set cmd->scsi_status = SAM_STAT_RESERVATION_CONFLICT during
+the early non reservation holder failure from pr_ops->t10_seq_non_holder()
+check in transport_generic_cmd_sequencer() for fabrics that already expect
+it to be set.
+
+This bug was originally introduced in mainline commit:
+
+commit eacac00ce5bfde8086cd0615fb53c986f7f970fe
+Author: Christoph Hellwig <hch@infradead.org>
+Date:   Thu Nov 3 17:50:40 2011 -0400
+
+    target: split core_scsi2_emulate_crh
+
+Reported-by: Martin Svec <martin.svec@zoner.cz>
+Cc: Martin Svec <martin.svec@zoner.cz>
+Cc: Christoph Hellwig <hch@lst.de>
+Signed-off-by: Nicholas Bellinger <nab@linux-iscsi.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ drivers/target/target_core_pr.c        |   34 +++++++++++++++++++++-----------
+ drivers/target/target_core_transport.c |    1 +
+ 2 files changed, 23 insertions(+), 12 deletions(-)
+
+diff --git a/drivers/target/target_core_pr.c b/drivers/target/target_core_pr.c
+index 778c1a6..6cf6ff4 100644
+--- a/drivers/target/target_core_pr.c
++++ b/drivers/target/target_core_pr.c
+@@ -120,7 +120,7 @@ static struct t10_pr_registration *core_scsi3_locate_pr_reg(struct se_device *,
+ 					struct se_node_acl *, struct se_session *);
+ static void core_scsi3_put_pr_reg(struct t10_pr_registration *);
+ 
+-static int target_check_scsi2_reservation_conflict(struct se_cmd *cmd, int *ret)
++static int target_check_scsi2_reservation_conflict(struct se_cmd *cmd)
+ {
+ 	struct se_session *se_sess = cmd->se_sess;
+ 	struct se_subsystem_dev *su_dev = cmd->se_dev->se_sub_dev;
+@@ -130,7 +130,7 @@ static int target_check_scsi2_reservation_conflict(struct se_cmd *cmd, int *ret)
+ 	int conflict = 0;
+ 
+ 	if (!crh)
+-		return false;
++		return -EINVAL;
+ 
+ 	pr_reg = core_scsi3_locate_pr_reg(cmd->se_dev, se_sess->se_node_acl,
+ 			se_sess);
+@@ -158,16 +158,14 @@ static int target_check_scsi2_reservation_conflict(struct se_cmd *cmd, int *ret)
+ 		 */
+ 		if (pr_reg->pr_res_holder) {
+ 			core_scsi3_put_pr_reg(pr_reg);
+-			*ret = 0;
+-			return false;
++			return 1;
+ 		}
+ 		if ((pr_reg->pr_res_type == PR_TYPE_WRITE_EXCLUSIVE_REGONLY) ||
+ 		    (pr_reg->pr_res_type == PR_TYPE_EXCLUSIVE_ACCESS_REGONLY) ||
+ 		    (pr_reg->pr_res_type == PR_TYPE_WRITE_EXCLUSIVE_ALLREG) ||
+ 		    (pr_reg->pr_res_type == PR_TYPE_EXCLUSIVE_ACCESS_ALLREG)) {
+ 			core_scsi3_put_pr_reg(pr_reg);
+-			*ret = 0;
+-			return true;
++			return 1;
+ 		}
+ 		core_scsi3_put_pr_reg(pr_reg);
+ 		conflict = 1;
+@@ -192,10 +190,10 @@ static int target_check_scsi2_reservation_conflict(struct se_cmd *cmd, int *ret)
+ 			" while active SPC-3 registrations exist,"
+ 			" returning RESERVATION_CONFLICT\n");
+ 		cmd->scsi_sense_reason = TCM_RESERVATION_CONFLICT;
+-		return true;
++		return -EBUSY;
+ 	}
+ 
+-	return false;
++	return 0;
+ }
+ 
+ int target_scsi2_reservation_release(struct se_task *task)
+@@ -204,12 +202,18 @@ int target_scsi2_reservation_release(struct se_task *task)
+ 	struct se_device *dev = cmd->se_dev;
+ 	struct se_session *sess = cmd->se_sess;
+ 	struct se_portal_group *tpg = sess->se_tpg;
+-	int ret = 0;
++	int ret = 0, rc;
+ 
+ 	if (!sess || !tpg)
+ 		goto out;
+-	if (target_check_scsi2_reservation_conflict(cmd, &ret))
++	rc = target_check_scsi2_reservation_conflict(cmd);
++	if (rc == 1)
++		goto out;
++	else if (rc < 0) {
++		cmd->scsi_sense_reason = TCM_RESERVATION_CONFLICT;
++		ret = -EINVAL;
+ 		goto out;
++	}
+ 
+ 	ret = 0;
+ 	spin_lock(&dev->dev_reservation_lock);
+@@ -246,7 +250,7 @@ int target_scsi2_reservation_reserve(struct se_task *task)
+ 	struct se_device *dev = cmd->se_dev;
+ 	struct se_session *sess = cmd->se_sess;
+ 	struct se_portal_group *tpg = sess->se_tpg;
+-	int ret = 0;
++	int ret = 0, rc;
+ 
+ 	if ((cmd->t_task_cdb[1] & 0x01) &&
+ 	    (cmd->t_task_cdb[1] & 0x02)) {
+@@ -262,8 +266,14 @@ int target_scsi2_reservation_reserve(struct se_task *task)
+ 	 */
+ 	if (!sess || !tpg)
+ 		goto out;
+-	if (target_check_scsi2_reservation_conflict(cmd, &ret))
++	rc = target_check_scsi2_reservation_conflict(cmd);
++	if (rc == 1)
+ 		goto out;
++	else if (rc < 0) {
++		cmd->scsi_sense_reason = TCM_RESERVATION_CONFLICT;
++		ret = -EINVAL;
++		goto out;
++	}
+ 
+ 	ret = 0;
+ 	spin_lock(&dev->dev_reservation_lock);
+diff --git a/drivers/target/target_core_transport.c b/drivers/target/target_core_transport.c
+index e4ddb93..cdb774b 100644
+--- a/drivers/target/target_core_transport.c
++++ b/drivers/target/target_core_transport.c
+@@ -2507,6 +2507,7 @@ static int transport_generic_cmd_sequencer(
+ 					cmd, cdb, pr_reg_type) != 0) {
+ 			cmd->se_cmd_flags |= SCF_SCSI_CDB_EXCEPTION;
+ 			cmd->se_cmd_flags |= SCF_SCSI_RESERVATION_CONFLICT;
++			cmd->scsi_status = SAM_STAT_RESERVATION_CONFLICT;
+ 			cmd->scsi_sense_reason = TCM_RESERVATION_CONFLICT;
+ 			return -EBUSY;
+ 		}
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0041-hwmon-zl6100-Enable-interval-between-chip-accesses-f.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0041-hwmon-zl6100-Enable-interval-between-chip-accesses-f.patch
new file mode 100644
index 0000000..7d266e8
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0041-hwmon-zl6100-Enable-interval-between-chip-accesses-f.patch
@@ -0,0 +1,72 @@
+From e4dffc01371682d0b23d22f1fe611f96b53cc486 Mon Sep 17 00:00:00 2001
+From: Guenter Roeck <guenter.roeck@ericsson.com>
+Date: Tue, 13 Mar 2012 09:05:14 -0700
+Subject: [PATCH 41/42] hwmon: (zl6100) Enable interval between chip accesses
+ for all chips
+
+commit fecfb64422d91a9621a3f96ab75c3a5f13e80b58 upstream.
+
+Intersil reports that all chips supported by the zl6100 driver require
+an interval between chip accesses, even ZL2004 and ZL6105 which were thought
+to be safe.
+
+Reported-by: Vivek Gani <vgani@intersil.com>
+Signed-off-by: Guenter Roeck <guenter.roeck@ericsson.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ Documentation/hwmon/zl6100   |   14 ++++++--------
+ drivers/hwmon/pmbus/zl6100.c |   11 +++--------
+ 2 files changed, 9 insertions(+), 16 deletions(-)
+
+diff --git a/Documentation/hwmon/zl6100 b/Documentation/hwmon/zl6100
+index 7617798..c5e1a5b 100644
+--- a/Documentation/hwmon/zl6100
++++ b/Documentation/hwmon/zl6100
+@@ -73,14 +73,12 @@ Module parameters
+ delay
+ -----
+ 
+-Some Intersil/Zilker Labs DC-DC controllers require a minimum interval between
+-I2C bus accesses. According to Intersil, the minimum interval is 2 ms, though
+-1 ms appears to be sufficient and has not caused any problems in testing.
+-The problem is known to affect ZL6100, ZL2105, and ZL2008. It is known not to
+-affect ZL2004 and ZL6105. The driver automatically sets the interval to 1 ms
+-except for ZL2004 and ZL6105. To enable manual override, the driver provides a
+-writeable module parameter, 'delay', which can be used to set the interval to
+-a value between 0 and 65,535 microseconds.
++Intersil/Zilker Labs DC-DC controllers require a minimum interval between I2C
++bus accesses. According to Intersil, the minimum interval is 2 ms, though 1 ms
++appears to be sufficient and has not caused any problems in testing. The problem
++is known to affect all currently supported chips. For manual override, the
++driver provides a writeable module parameter, 'delay', which can be used to set
++the interval to a value between 0 and 65,535 microseconds.
+ 
+ 
+ Sysfs entries
+diff --git a/drivers/hwmon/pmbus/zl6100.c b/drivers/hwmon/pmbus/zl6100.c
+index ba296fd..5c5cdd2 100644
+--- a/drivers/hwmon/pmbus/zl6100.c
++++ b/drivers/hwmon/pmbus/zl6100.c
+@@ -178,16 +178,11 @@ static int zl6100_probe(struct i2c_client *client,
+ 	data->id = mid->driver_data;
+ 
+ 	/*
+-	 * ZL2008, ZL2105, and ZL6100 are known to require a wait time
+-	 * between I2C accesses. ZL2004 and ZL6105 are known to be safe.
+-	 *
+-	 * Only clear the wait time for chips known to be safe. The wait time
+-	 * can be cleared later for additional chips if tests show that it
+-	 * is not needed (in other words, better be safe than sorry).
++	 * According to information from the chip vendor, all currently
++	 * supported chips are known to require a wait time between I2C
++	 * accesses.
+ 	 */
+ 	data->delay = delay;
+-	if (data->id == zl2004 || data->id == zl6105)
+-		data->delay = 0;
+ 
+ 	/*
+ 	 * Since there was a direct I2C device access above, wait before
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0042-Linux-3.2.12.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0042-Linux-3.2.12.patch
new file mode 100644
index 0000000..282912d
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.12/0042-Linux-3.2.12.patch
@@ -0,0 +1,24 @@
+From 5193c69b7a34cf74e5cd0ed629eb921c3f029b3e Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Mon, 19 Mar 2012 09:03:17 -0700
+Subject: [PATCH 42/42] Linux 3.2.12
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 4b76371..15e80f1 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 11
++SUBLEVEL = 12
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0001-nilfs2-fix-NULL-pointer-dereference-in-nilfs_load_su.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0001-nilfs2-fix-NULL-pointer-dereference-in-nilfs_load_su.patch
new file mode 100644
index 0000000..29df299
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0001-nilfs2-fix-NULL-pointer-dereference-in-nilfs_load_su.patch
@@ -0,0 +1,62 @@
+From 4f3587e3e193f8ae9278442bf254d1271c4d010d Mon Sep 17 00:00:00 2001
+From: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Date: Fri, 16 Mar 2012 17:08:39 -0700
+Subject: [PATCH 01/10] nilfs2: fix NULL pointer dereference in
+ nilfs_load_super_block()
+
+commit d7178c79d9b7c5518f9943188091a75fc6ce0675 upstream.
+
+According to the report from Slicky Devil, nilfs caused kernel oops at
+nilfs_load_super_block function during mount after he shrank the
+partition without resizing the filesystem:
+
+ BUG: unable to handle kernel NULL pointer dereference at 00000048
+ IP: [<d0d7a08e>] nilfs_load_super_block+0x17e/0x280 [nilfs2]
+ *pde = 00000000
+ Oops: 0000 [#1] PREEMPT SMP
+ ...
+ Call Trace:
+  [<d0d7a87b>] init_nilfs+0x4b/0x2e0 [nilfs2]
+  [<d0d6f707>] nilfs_mount+0x447/0x5b0 [nilfs2]
+  [<c0226636>] mount_fs+0x36/0x180
+  [<c023d961>] vfs_kern_mount+0x51/0xa0
+  [<c023ddae>] do_kern_mount+0x3e/0xe0
+  [<c023f189>] do_mount+0x169/0x700
+  [<c023fa9b>] sys_mount+0x6b/0xa0
+  [<c04abd1f>] sysenter_do_call+0x12/0x28
+ Code: 53 18 8b 43 20 89 4b 18 8b 4b 24 89 53 1c 89 43 24 89 4b 20 8b 43
+ 20 c7 43 2c 00 00 00 00 23 75 e8 8b 50 68 89 53 28 8b 54 b3 20 <8b> 72
+ 48 8b 7a 4c 8b 55 08 89 b3 84 00 00 00 89 bb 88 00 00 00
+ EIP: [<d0d7a08e>] nilfs_load_super_block+0x17e/0x280 [nilfs2] SS:ESP 0068:ca9bbdcc
+ CR2: 0000000000000048
+
+This turned out due to a defect in an error path which runs if the
+calculated location of the secondary super block was invalid.
+
+This patch fixes it and eliminates the reported oops.
+
+Reported-by: Slicky Devil <slicky.dvl@gmail.com>
+Signed-off-by: Ryusuke Konishi <konishi.ryusuke@lab.ntt.co.jp>
+Tested-by: Slicky Devil <slicky.dvl@gmail.com>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/nilfs2/the_nilfs.c |    1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
+index d327140..35a8970 100644
+--- a/fs/nilfs2/the_nilfs.c
++++ b/fs/nilfs2/the_nilfs.c
+@@ -515,6 +515,7 @@ static int nilfs_load_super_block(struct the_nilfs *nilfs,
+ 		brelse(sbh[1]);
+ 		sbh[1] = NULL;
+ 		sbp[1] = NULL;
++		valid[1] = 0;
+ 		swp = 0;
+ 	}
+ 	if (!valid[swp]) {
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0002-afs-Read-of-file-returns-EBADMSG.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0002-afs-Read-of-file-returns-EBADMSG.patch
new file mode 100644
index 0000000..ff1e0d9
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0002-afs-Read-of-file-returns-EBADMSG.patch
@@ -0,0 +1,56 @@
+From d603197ba390bdeba1aa79167697278669fdd9f3 Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@samba.org>
+Date: Fri, 16 Mar 2012 10:28:07 +0000
+Subject: [PATCH 02/10] afs: Read of file returns EBADMSG
+
+commit 2c724fb92732c0b2a5629eb8af74e82eb62ac947 upstream.
+
+A read of a large file on an afs mount failed:
+
+# cat junk.file > /dev/null
+cat: junk.file: Bad message
+
+Looking at the trace, call->offset wrapped since it is only an
+unsigned short. In afs_extract_data:
+
+        _enter("{%u},{%zu},%d,,%zu", call->offset, len, last, count);
+...
+
+        if (call->offset < count) {
+                if (last) {
+                        _leave(" = -EBADMSG [%d < %zu]", call->offset, count);
+                        return -EBADMSG;
+                }
+
+Which matches the trace:
+
+[cat   ] ==> afs_extract_data({65132},{524},1,,65536)
+[cat   ] <== afs_extract_data() = -EBADMSG [0 < 65536]
+
+call->offset went from 65132 to 0. Fix this by making call->offset an
+unsigned int.
+
+Signed-off-by: Anton Blanchard <anton@samba.org>
+Signed-off-by: David Howells <dhowells@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/afs/internal.h |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fs/afs/internal.h b/fs/afs/internal.h
+index d2b0888..a306bb6 100644
+--- a/fs/afs/internal.h
++++ b/fs/afs/internal.h
+@@ -109,7 +109,7 @@ struct afs_call {
+ 	unsigned		reply_size;	/* current size of reply */
+ 	unsigned		first_offset;	/* offset into mapping[first] */
+ 	unsigned		last_to;	/* amount of mapping[last] */
+-	unsigned short		offset;		/* offset into received data store */
++	unsigned		offset;		/* offset into received data store */
+ 	unsigned char		unmarshall;	/* unmarshalling phase */
+ 	bool			incoming;	/* T if incoming call */
+ 	bool			send_pages;	/* T if data from mapping should be sent */
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0003-afs-Remote-abort-can-cause-BUG-in-rxrpc-code.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0003-afs-Remote-abort-can-cause-BUG-in-rxrpc-code.patch
new file mode 100644
index 0000000..22cfa61
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0003-afs-Remote-abort-can-cause-BUG-in-rxrpc-code.patch
@@ -0,0 +1,68 @@
+From 4dd3f846325bf16e5b2d976dce42da7f722ade1f Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@samba.org>
+Date: Fri, 16 Mar 2012 10:28:19 +0000
+Subject: [PATCH 03/10] afs: Remote abort can cause BUG in rxrpc code
+
+commit c0173863528a8c9212c53e080d63a1aaae5ef4f4 upstream.
+
+When writing files to afs I sometimes hit a BUG:
+
+kernel BUG at fs/afs/rxrpc.c:179!
+
+With a backtrace of:
+
+	afs_free_call
+	afs_make_call
+	afs_fs_store_data
+	afs_vnode_store_data
+	afs_write_back_from_locked_page
+	afs_writepages_region
+	afs_writepages
+
+The cause is:
+
+	ASSERT(skb_queue_empty(&call->rx_queue));
+
+Looking at a tcpdump of the session the abort happens because we
+are exceeding our disk quota:
+
+	rx abort fs reply store-data error diskquota exceeded (32)
+
+So the abort error is valid. We hit the BUG because we haven't
+freed all the resources for the call.
+
+By freeing any skbs in call->rx_queue before calling afs_free_call
+we avoid hitting leaking memory and avoid hitting the BUG.
+
+Signed-off-by: Anton Blanchard <anton@samba.org>
+Signed-off-by: David Howells <dhowells@redhat.com>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ fs/afs/rxrpc.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/fs/afs/rxrpc.c b/fs/afs/rxrpc.c
+index e45a323..8ad8c2a 100644
+--- a/fs/afs/rxrpc.c
++++ b/fs/afs/rxrpc.c
+@@ -314,6 +314,7 @@ int afs_make_call(struct in_addr *addr, struct afs_call *call, gfp_t gfp,
+ 	struct msghdr msg;
+ 	struct kvec iov[1];
+ 	int ret;
++	struct sk_buff *skb;
+ 
+ 	_enter("%x,{%d},", addr->s_addr, ntohs(call->port));
+ 
+@@ -380,6 +381,8 @@ int afs_make_call(struct in_addr *addr, struct afs_call *call, gfp_t gfp,
+ 
+ error_do_abort:
+ 	rxrpc_kernel_abort_call(rxcall, RX_USER_ABORT);
++	while ((skb = skb_dequeue(&call->rx_queue)))
++		afs_free_skb(skb);
+ 	rxrpc_kernel_end_call(rxcall);
+ 	call->rxcall = NULL;
+ error_kill_call:
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0004-perf-tools-Incorrect-use-of-snprintf-results-in-SEGV.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0004-perf-tools-Incorrect-use-of-snprintf-results-in-SEGV.patch
new file mode 100644
index 0000000..0cfd765
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0004-perf-tools-Incorrect-use-of-snprintf-results-in-SEGV.patch
@@ -0,0 +1,66 @@
+From 4458ed1dbe1180712e2c42c1816145bb793b9422 Mon Sep 17 00:00:00 2001
+From: Anton Blanchard <anton@samba.org>
+Date: Wed, 7 Mar 2012 11:42:49 +1100
+Subject: [PATCH 04/10] perf tools: Incorrect use of snprintf results in SEGV
+
+commit b832796caa1fda8516464a003c8c7cc547bc20c2 upstream.
+
+I have a workload where perf top scribbles over the stack and we SEGV.
+What makes it interesting is that an snprintf is causing this.
+
+The workload is a c++ gem that has method names over 3000 characters
+long, but snprintf is designed to avoid overrunning buffers. So what
+went wrong?
+
+The problem is we assume snprintf returns the number of characters
+written:
+
+    ret += repsep_snprintf(bf + ret, size - ret, "[%c] ", self->level);
+...
+    ret += repsep_snprintf(bf + ret, size - ret, "%s", self->ms.sym->name);
+
+Unfortunately this is not how snprintf works. snprintf returns the
+number of characters that would have been written if there was enough
+space. In the above case, if the first snprintf returns a value larger
+than size, we pass a negative size into the second snprintf and happily
+scribble over the stack. If you have 3000 character c++ methods thats a
+lot of stack to trample.
+
+This patch fixes repsep_snprintf by clamping the value at size - 1 which
+is the maximum snprintf can write before adding the NULL terminator.
+
+I get the sinking feeling that there are a lot of other uses of snprintf
+that have this same bug, we should audit them all.
+
+Cc: David Ahern <dsahern@gmail.com>
+Cc: Eric B Munson <emunson@mgebm.net>
+Cc: Frederic Weisbecker <fweisbec@gmail.com>
+Cc: Ingo Molnar <mingo@elte.hu>
+Cc: Paul Mackerras <paulus@samba.org>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>
+Link: http://lkml.kernel.org/r/20120307114249.44275ca3@kryten
+Signed-off-by: Anton Blanchard <anton@samba.org>
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/util/sort.c |    3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/tools/perf/util/sort.c b/tools/perf/util/sort.c
+index 16da30d..076c9d4 100644
+--- a/tools/perf/util/sort.c
++++ b/tools/perf/util/sort.c
+@@ -33,6 +33,9 @@ static int repsep_snprintf(char *bf, size_t size, const char *fmt, ...)
+ 		}
+ 	}
+ 	va_end(ap);
++
++	if (n >= (int)size)
++		return size - 1;
+ 	return n;
+ }
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0005-perf-tools-Use-scnprintf-where-applicable.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0005-perf-tools-Use-scnprintf-where-applicable.patch
new file mode 100644
index 0000000..0b3e626
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0005-perf-tools-Use-scnprintf-where-applicable.patch
@@ -0,0 +1,283 @@
+From 0761aae695aebede1d2ab4bf704419ee0ac957f1 Mon Sep 17 00:00:00 2001
+From: Arnaldo Carvalho de Melo <acme@redhat.com>
+Date: Wed, 14 Mar 2012 12:29:29 -0300
+Subject: [PATCH 05/10] perf tools: Use scnprintf where applicable
+
+commit e7f01d1e3d8d501deb8abeaa269d5d48a703b8b0 upstream.
+
+Several places were expecting that the value returned was the number of
+characters printed, not what would be printed if there was space.
+
+Fix it by using the scnprintf and vscnprintf variants we inherited from
+the kernel sources.
+
+Some corner cases where the number of printed characters were not
+accounted were fixed too.
+
+Reported-by: Anton Blanchard <anton@samba.org>
+Cc: Anton Blanchard <anton@samba.org>
+Cc: Eric B Munson <emunson@mgebm.net>
+Cc: David Ahern <dsahern@gmail.com>
+Cc: Frederic Weisbecker <fweisbec@gmail.com>
+Cc: Mike Galbraith <efault@gmx.de>
+Cc: Paul Mackerras <paulus@samba.org>
+Cc: Peter Zijlstra <peterz@infradead.org>
+Cc: Stephane Eranian <eranian@google.com>
+Cc: Yanmin Zhang <yanmin_zhang@linux.intel.com>
+Link: http://lkml.kernel.org/n/tip-kwxo2eh29cxmd8ilixi2005x@git.kernel.org
+Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ tools/perf/arch/powerpc/util/header.c |    2 +-
+ tools/perf/arch/x86/util/header.c     |    2 +-
+ tools/perf/util/color.c               |    9 +++++----
+ tools/perf/util/header.c              |    4 ++--
+ tools/perf/util/hist.c                |   30 +++++++++++++++---------------
+ tools/perf/util/strbuf.c              |    7 ++++---
+ tools/perf/util/ui/browsers/hists.c   |   12 ++++++------
+ tools/perf/util/ui/helpline.c         |    2 +-
+ 8 files changed, 35 insertions(+), 33 deletions(-)
+
+diff --git a/tools/perf/arch/powerpc/util/header.c b/tools/perf/arch/powerpc/util/header.c
+index eba80c2..2f7073d 100644
+--- a/tools/perf/arch/powerpc/util/header.c
++++ b/tools/perf/arch/powerpc/util/header.c
+@@ -25,7 +25,7 @@ get_cpuid(char *buffer, size_t sz)
+ 
+ 	pvr = mfspr(SPRN_PVR);
+ 
+-	nb = snprintf(buffer, sz, "%lu,%lu$", PVR_VER(pvr), PVR_REV(pvr));
++	nb = scnprintf(buffer, sz, "%lu,%lu$", PVR_VER(pvr), PVR_REV(pvr));
+ 
+ 	/* look for end marker to ensure the entire data fit */
+ 	if (strchr(buffer, '$')) {
+diff --git a/tools/perf/arch/x86/util/header.c b/tools/perf/arch/x86/util/header.c
+index f940060..146d12a 100644
+--- a/tools/perf/arch/x86/util/header.c
++++ b/tools/perf/arch/x86/util/header.c
+@@ -48,7 +48,7 @@ get_cpuid(char *buffer, size_t sz)
+ 		if (family >= 0x6)
+ 			model += ((a >> 16) & 0xf) << 4;
+ 	}
+-	nb = snprintf(buffer, sz, "%s,%u,%u,%u$", vendor, family, model, step);
++	nb = scnprintf(buffer, sz, "%s,%u,%u,%u$", vendor, family, model, step);
+ 
+ 	/* look for end marker to ensure the entire data fit */
+ 	if (strchr(buffer, '$')) {
+diff --git a/tools/perf/util/color.c b/tools/perf/util/color.c
+index 521c38a..11e46da1 100644
+--- a/tools/perf/util/color.c
++++ b/tools/perf/util/color.c
+@@ -1,3 +1,4 @@
++#include <linux/kernel.h>
+ #include "cache.h"
+ #include "color.h"
+ 
+@@ -182,12 +183,12 @@ static int __color_vsnprintf(char *bf, size_t size, const char *color,
+ 	}
+ 
+ 	if (perf_use_color_default && *color)
+-		r += snprintf(bf, size, "%s", color);
+-	r += vsnprintf(bf + r, size - r, fmt, args);
++		r += scnprintf(bf, size, "%s", color);
++	r += vscnprintf(bf + r, size - r, fmt, args);
+ 	if (perf_use_color_default && *color)
+-		r += snprintf(bf + r, size - r, "%s", PERF_COLOR_RESET);
++		r += scnprintf(bf + r, size - r, "%s", PERF_COLOR_RESET);
+ 	if (trail)
+-		r += snprintf(bf + r, size - r, "%s", trail);
++		r += scnprintf(bf + r, size - r, "%s", trail);
+ 	return r;
+ }
+ 
+diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
+index 33c17a2..2cd88c1 100644
+--- a/tools/perf/util/header.c
++++ b/tools/perf/util/header.c
+@@ -1227,7 +1227,7 @@ int build_id_cache__add_s(const char *sbuild_id, const char *debugdir,
+ 	if (realname == NULL || filename == NULL || linkname == NULL)
+ 		goto out_free;
+ 
+-	len = snprintf(filename, size, "%s%s%s",
++	len = scnprintf(filename, size, "%s%s%s",
+ 		       debugdir, is_kallsyms ? "/" : "", realname);
+ 	if (mkdir_p(filename, 0755))
+ 		goto out_free;
+@@ -1242,7 +1242,7 @@ int build_id_cache__add_s(const char *sbuild_id, const char *debugdir,
+ 			goto out_free;
+ 	}
+ 
+-	len = snprintf(linkname, size, "%s/.build-id/%.2s",
++	len = scnprintf(linkname, size, "%s/.build-id/%.2s",
+ 		       debugdir, sbuild_id);
+ 
+ 	if (access(linkname, X_OK) && mkdir_p(linkname, 0755))
+diff --git a/tools/perf/util/hist.c b/tools/perf/util/hist.c
+index abef270..216e33a 100644
+--- a/tools/perf/util/hist.c
++++ b/tools/perf/util/hist.c
+@@ -767,7 +767,7 @@ static int hist_entry__pcnt_snprintf(struct hist_entry *self, char *s,
+ 						     sep ? "%.2f" : "   %6.2f%%",
+ 						     (period * 100.0) / total);
+ 		else
+-			ret = snprintf(s, size, sep ? "%.2f" : "   %6.2f%%",
++			ret = scnprintf(s, size, sep ? "%.2f" : "   %6.2f%%",
+ 				       (period * 100.0) / total);
+ 		if (symbol_conf.show_cpu_utilization) {
+ 			ret += percent_color_snprintf(s + ret, size - ret,
+@@ -790,20 +790,20 @@ static int hist_entry__pcnt_snprintf(struct hist_entry *self, char *s,
+ 			}
+ 		}
+ 	} else
+-		ret = snprintf(s, size, sep ? "%" PRIu64 : "%12" PRIu64 " ", period);
++		ret = scnprintf(s, size, sep ? "%" PRIu64 : "%12" PRIu64 " ", period);
+ 
+ 	if (symbol_conf.show_nr_samples) {
+ 		if (sep)
+-			ret += snprintf(s + ret, size - ret, "%c%" PRIu64, *sep, nr_events);
++			ret += scnprintf(s + ret, size - ret, "%c%" PRIu64, *sep, nr_events);
+ 		else
+-			ret += snprintf(s + ret, size - ret, "%11" PRIu64, nr_events);
++			ret += scnprintf(s + ret, size - ret, "%11" PRIu64, nr_events);
+ 	}
+ 
+ 	if (symbol_conf.show_total_period) {
+ 		if (sep)
+-			ret += snprintf(s + ret, size - ret, "%c%" PRIu64, *sep, period);
++			ret += scnprintf(s + ret, size - ret, "%c%" PRIu64, *sep, period);
+ 		else
+-			ret += snprintf(s + ret, size - ret, " %12" PRIu64, period);
++			ret += scnprintf(s + ret, size - ret, " %12" PRIu64, period);
+ 	}
+ 
+ 	if (pair_hists) {
+@@ -818,25 +818,25 @@ static int hist_entry__pcnt_snprintf(struct hist_entry *self, char *s,
+ 		diff = new_percent - old_percent;
+ 
+ 		if (fabs(diff) >= 0.01)
+-			snprintf(bf, sizeof(bf), "%+4.2F%%", diff);
++			ret += scnprintf(bf, sizeof(bf), "%+4.2F%%", diff);
+ 		else
+-			snprintf(bf, sizeof(bf), " ");
++			ret += scnprintf(bf, sizeof(bf), " ");
+ 
+ 		if (sep)
+-			ret += snprintf(s + ret, size - ret, "%c%s", *sep, bf);
++			ret += scnprintf(s + ret, size - ret, "%c%s", *sep, bf);
+ 		else
+-			ret += snprintf(s + ret, size - ret, "%11.11s", bf);
++			ret += scnprintf(s + ret, size - ret, "%11.11s", bf);
+ 
+ 		if (show_displacement) {
+ 			if (displacement)
+-				snprintf(bf, sizeof(bf), "%+4ld", displacement);
++				ret += scnprintf(bf, sizeof(bf), "%+4ld", displacement);
+ 			else
+-				snprintf(bf, sizeof(bf), " ");
++				ret += scnprintf(bf, sizeof(bf), " ");
+ 
+ 			if (sep)
+-				ret += snprintf(s + ret, size - ret, "%c%s", *sep, bf);
++				ret += scnprintf(s + ret, size - ret, "%c%s", *sep, bf);
+ 			else
+-				ret += snprintf(s + ret, size - ret, "%6.6s", bf);
++				ret += scnprintf(s + ret, size - ret, "%6.6s", bf);
+ 		}
+ 	}
+ 
+@@ -854,7 +854,7 @@ int hist_entry__snprintf(struct hist_entry *he, char *s, size_t size,
+ 		if (se->elide)
+ 			continue;
+ 
+-		ret += snprintf(s + ret, size - ret, "%s", sep ?: "  ");
++		ret += scnprintf(s + ret, size - ret, "%s", sep ?: "  ");
+ 		ret += se->se_snprintf(he, s + ret, size - ret,
+ 				       hists__col_len(hists, se->se_width_idx));
+ 	}
+diff --git a/tools/perf/util/strbuf.c b/tools/perf/util/strbuf.c
+index 92e0685..2eeb51b 100644
+--- a/tools/perf/util/strbuf.c
++++ b/tools/perf/util/strbuf.c
+@@ -1,4 +1,5 @@
+ #include "cache.h"
++#include <linux/kernel.h>
+ 
+ int prefixcmp(const char *str, const char *prefix)
+ {
+@@ -89,14 +90,14 @@ void strbuf_addf(struct strbuf *sb, const char *fmt, ...)
+ 	if (!strbuf_avail(sb))
+ 		strbuf_grow(sb, 64);
+ 	va_start(ap, fmt);
+-	len = vsnprintf(sb->buf + sb->len, sb->alloc - sb->len, fmt, ap);
++	len = vscnprintf(sb->buf + sb->len, sb->alloc - sb->len, fmt, ap);
+ 	va_end(ap);
+ 	if (len < 0)
+-		die("your vsnprintf is broken");
++		die("your vscnprintf is broken");
+ 	if (len > strbuf_avail(sb)) {
+ 		strbuf_grow(sb, len);
+ 		va_start(ap, fmt);
+-		len = vsnprintf(sb->buf + sb->len, sb->alloc - sb->len, fmt, ap);
++		len = vscnprintf(sb->buf + sb->len, sb->alloc - sb->len, fmt, ap);
+ 		va_end(ap);
+ 		if (len > strbuf_avail(sb)) {
+ 			die("this should not happen, your snprintf is broken");
+diff --git a/tools/perf/util/ui/browsers/hists.c b/tools/perf/util/ui/browsers/hists.c
+index d0c94b4..81c9fa5 100644
+--- a/tools/perf/util/ui/browsers/hists.c
++++ b/tools/perf/util/ui/browsers/hists.c
+@@ -839,15 +839,15 @@ static int hists__browser_title(struct hists *self, char *bf, size_t size,
+ 	unsigned long nr_events = self->stats.nr_events[PERF_RECORD_SAMPLE];
+ 
+ 	nr_events = convert_unit(nr_events, &unit);
+-	printed = snprintf(bf, size, "Events: %lu%c %s", nr_events, unit, ev_name);
++	printed = scnprintf(bf, size, "Events: %lu%c %s", nr_events, unit, ev_name);
+ 
+ 	if (thread)
+-		printed += snprintf(bf + printed, size - printed,
++		printed += scnprintf(bf + printed, size - printed,
+ 				    ", Thread: %s(%d)",
+ 				    (thread->comm_set ? thread->comm : ""),
+ 				    thread->pid);
+ 	if (dso)
+-		printed += snprintf(bf + printed, size - printed,
++		printed += scnprintf(bf + printed, size - printed,
+ 				    ", DSO: %s", dso->short_name);
+ 	return printed;
+ }
+@@ -1097,7 +1097,7 @@ static void perf_evsel_menu__write(struct ui_browser *browser,
+ 						       HE_COLORSET_NORMAL);
+ 
+ 	nr_events = convert_unit(nr_events, &unit);
+-	printed = snprintf(bf, sizeof(bf), "%lu%c%s%s", nr_events,
++	printed = scnprintf(bf, sizeof(bf), "%lu%c%s%s", nr_events,
+ 			   unit, unit == ' ' ? "" : " ", ev_name);
+ 	slsmg_printf("%s", bf);
+ 
+@@ -1107,8 +1107,8 @@ static void perf_evsel_menu__write(struct ui_browser *browser,
+ 		if (!current_entry)
+ 			ui_browser__set_color(browser, HE_COLORSET_TOP);
+ 		nr_events = convert_unit(nr_events, &unit);
+-		snprintf(bf, sizeof(bf), ": %ld%c%schunks LOST!", nr_events,
+-			 unit, unit == ' ' ? "" : " ");
++		printed += scnprintf(bf, sizeof(bf), ": %ld%c%schunks LOST!",
++				     nr_events, unit, unit == ' ' ? "" : " ");
+ 		warn = bf;
+ 	}
+ 
+diff --git a/tools/perf/util/ui/helpline.c b/tools/perf/util/ui/helpline.c
+index 6ef3c56..f50f81c 100644
+--- a/tools/perf/util/ui/helpline.c
++++ b/tools/perf/util/ui/helpline.c
+@@ -65,7 +65,7 @@ int ui_helpline__show_help(const char *format, va_list ap)
+ 	static int backlog;
+ 
+ 	pthread_mutex_lock(&ui__lock);
+-	ret = vsnprintf(ui_helpline__last_msg + backlog,
++	ret = vscnprintf(ui_helpline__last_msg + backlog,
+ 			sizeof(ui_helpline__last_msg) - backlog, format, ap);
+ 	backlog += ret;
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0006-tcp-fix-syncookie-regression.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0006-tcp-fix-syncookie-regression.patch
new file mode 100644
index 0000000..b245f58
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0006-tcp-fix-syncookie-regression.patch
@@ -0,0 +1,111 @@
+From 1783dd4e3bf403739015f4494cb05445623826c8 Mon Sep 17 00:00:00 2001
+From: Eric Dumazet <eric.dumazet@gmail.com>
+Date: Sat, 10 Mar 2012 09:20:21 +0000
+Subject: [PATCH 06/10] tcp: fix syncookie regression
+
+[ Upstream commit dfd25ffffc132c00070eed64200e8950da5d7e9d ]
+
+commit ea4fc0d619 (ipv4: Don't use rt->rt_{src,dst} in ip_queue_xmit())
+added a serious regression on synflood handling.
+
+Simon Kirby discovered a successful connection was delayed by 20 seconds
+before being responsive.
+
+In my tests, I discovered that xmit frames were lost, and needed ~4
+retransmits and a socket dst rebuild before being really sent.
+
+In case of syncookie initiated connection, we use a different path to
+initialize the socket dst, and inet->cork.fl.u.ip4 is left cleared.
+
+As ip_queue_xmit() now depends on inet flow being setup, fix this by
+copying the temp flowi4 we use in cookie_v4_check().
+
+Reported-by: Simon Kirby <sim@netnation.com>
+Bisected-by: Simon Kirby <sim@netnation.com>
+Signed-off-by: Eric Dumazet <eric.dumazet@gmail.com>
+Tested-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv4/syncookies.c |   30 ++++++++++++++++--------------
+ net/ipv4/tcp_ipv4.c   |   10 +++++++---
+ 2 files changed, 23 insertions(+), 17 deletions(-)
+
+diff --git a/net/ipv4/syncookies.c b/net/ipv4/syncookies.c
+index 90f6544..769c0e9 100644
+--- a/net/ipv4/syncookies.c
++++ b/net/ipv4/syncookies.c
+@@ -278,6 +278,7 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb,
+ 	struct rtable *rt;
+ 	__u8 rcv_wscale;
+ 	bool ecn_ok = false;
++	struct flowi4 fl4;
+ 
+ 	if (!sysctl_tcp_syncookies || !th->ack || th->rst)
+ 		goto out;
+@@ -346,20 +347,16 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb,
+ 	 * hasn't changed since we received the original syn, but I see
+ 	 * no easy way to do this.
+ 	 */
+-	{
+-		struct flowi4 fl4;
+-
+-		flowi4_init_output(&fl4, 0, sk->sk_mark, RT_CONN_FLAGS(sk),
+-				   RT_SCOPE_UNIVERSE, IPPROTO_TCP,
+-				   inet_sk_flowi_flags(sk),
+-				   (opt && opt->srr) ? opt->faddr : ireq->rmt_addr,
+-				   ireq->loc_addr, th->source, th->dest);
+-		security_req_classify_flow(req, flowi4_to_flowi(&fl4));
+-		rt = ip_route_output_key(sock_net(sk), &fl4);
+-		if (IS_ERR(rt)) {
+-			reqsk_free(req);
+-			goto out;
+-		}
++	flowi4_init_output(&fl4, 0, sk->sk_mark, RT_CONN_FLAGS(sk),
++			   RT_SCOPE_UNIVERSE, IPPROTO_TCP,
++			   inet_sk_flowi_flags(sk),
++			   (opt && opt->srr) ? opt->faddr : ireq->rmt_addr,
++			   ireq->loc_addr, th->source, th->dest);
++	security_req_classify_flow(req, flowi4_to_flowi(&fl4));
++	rt = ip_route_output_key(sock_net(sk), &fl4);
++	if (IS_ERR(rt)) {
++		reqsk_free(req);
++		goto out;
+ 	}
+ 
+ 	/* Try to redo what tcp_v4_send_synack did. */
+@@ -373,5 +370,10 @@ struct sock *cookie_v4_check(struct sock *sk, struct sk_buff *skb,
+ 	ireq->rcv_wscale  = rcv_wscale;
+ 
+ 	ret = get_cookie_sock(sk, skb, req, &rt->dst);
++	/* ip_queue_xmit() depends on our flow being setup
++	 * Normal sockets get it right from inet_csk_route_child_sock()
++	 */
++	if (ret)
++		inet_sk(ret)->cork.fl.u.ip4 = fl4;
+ out:	return ret;
+ }
+diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
+index eb90aa8..de69cec 100644
+--- a/net/ipv4/tcp_ipv4.c
++++ b/net/ipv4/tcp_ipv4.c
+@@ -1465,9 +1465,13 @@ struct sock *tcp_v4_syn_recv_sock(struct sock *sk, struct sk_buff *skb,
+ 		inet_csk(newsk)->icsk_ext_hdr_len = inet_opt->opt.optlen;
+ 	newinet->inet_id = newtp->write_seq ^ jiffies;
+ 
+-	if (!dst && (dst = inet_csk_route_child_sock(sk, newsk, req)) == NULL)
+-		goto put_and_exit;
+-
++	if (!dst) {
++		dst = inet_csk_route_child_sock(sk, newsk, req);
++		if (!dst)
++			goto put_and_exit;
++	} else {
++		/* syncookie case : see end of cookie_v4_check() */
++	}
+ 	sk_setup_caps(newsk, dst);
+ 
+ 	tcp_mtup_init(newsk);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0007-ipv6-Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0007-ipv6-Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch
new file mode 100644
index 0000000..c1e22fb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0007-ipv6-Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch
@@ -0,0 +1,36 @@
+From 599c3a877230bfb0db2f20028170b27a9cfef914 Mon Sep 17 00:00:00 2001
+From: "RongQing.Li" <roy.qing.li@gmail.com>
+Date: Thu, 15 Mar 2012 22:54:14 +0000
+Subject: [PATCH 07/10] ipv6: Don't dev_hold(dev) in ip6_mc_find_dev_rcu.
+
+[ Upstream commit c577923756b7fe9071f28a76b66b83b306d1d001 ]
+
+ip6_mc_find_dev_rcu() is called with rcu_read_lock(), so don't
+need to dev_hold().
+With dev_hold(), not corresponding dev_put(), will lead to leak.
+
+[ bug introduced in 96b52e61be1 (ipv6: mcast: RCU conversions) ]
+
+Signed-off-by: RongQing.Li <roy.qing.li@gmail.com>
+Acked-by: Eric Dumazet <eric.dumazet@gmail.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ net/ipv6/mcast.c |    1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/net/ipv6/mcast.c b/net/ipv6/mcast.c
+index ee7839f..2257366 100644
+--- a/net/ipv6/mcast.c
++++ b/net/ipv6/mcast.c
+@@ -257,7 +257,6 @@ static struct inet6_dev *ip6_mc_find_dev_rcu(struct net *net,
+ 
+ 		if (rt) {
+ 			dev = rt->rt6i_dev;
+-			dev_hold(dev);
+ 			dst_release(&rt->dst);
+ 		}
+ 	} else
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0008-iwl3945-fix-possible-il-txq-NULL-pointer-dereference.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0008-iwl3945-fix-possible-il-txq-NULL-pointer-dereference.patch
new file mode 100644
index 0000000..07ecf54
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0008-iwl3945-fix-possible-il-txq-NULL-pointer-dereference.patch
@@ -0,0 +1,63 @@
+From 50090beeab6611dbfccd8565bf6a6a97beddc6ee Mon Sep 17 00:00:00 2001
+From: Stanislaw Gruszka <sgruszka@redhat.com>
+Date: Thu, 8 Mar 2012 13:16:01 +0100
+Subject: [PATCH 08/10] iwl3945: fix possible il->txq NULL pointer dereference
+ in delayed works
+
+commit 210787e82a0ac1ffb5d7be1c796f0c51050849ad upstream.
+
+On il3945_down procedure we free tx queue data and nullify il->txq
+pointer. After that we drop mutex and then cancel delayed works. There
+is possibility, that after drooping mutex and before the cancel, some
+delayed work will start and crash while trying to send commands to
+the device. For example, here is reported crash in
+il3945_bg_reg_txpower_periodic():
+https://bugzilla.kernel.org/show_bug.cgi?id=42766#c10
+
+Patch fix problem by adding il->txq check on works that send commands,
+hence utilize tx queue.
+
+Reported-by: Clemens Eisserer <linuxhippy@gmail.com>
+Signed-off-by: Stanislaw Gruszka <sgruszka@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/iwlegacy/iwl-3945.c     |    7 ++++---
+ drivers/net/wireless/iwlegacy/iwl3945-base.c |    2 +-
+ 2 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/drivers/net/wireless/iwlegacy/iwl-3945.c b/drivers/net/wireless/iwlegacy/iwl-3945.c
+index f7c0a74..7d1aa7c 100644
+--- a/drivers/net/wireless/iwlegacy/iwl-3945.c
++++ b/drivers/net/wireless/iwlegacy/iwl-3945.c
+@@ -1870,11 +1870,12 @@ static void iwl3945_bg_reg_txpower_periodic(struct work_struct *work)
+ 	struct iwl_priv *priv = container_of(work, struct iwl_priv,
+ 					     _3945.thermal_periodic.work);
+ 
+-	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
+-		return;
+-
+ 	mutex_lock(&priv->mutex);
++	if (test_bit(STATUS_EXIT_PENDING, &priv->status) || priv->txq == NULL)
++		goto out;
++
+ 	iwl3945_reg_txpower_periodic(priv);
++out:
+ 	mutex_unlock(&priv->mutex);
+ }
+ 
+diff --git a/drivers/net/wireless/iwlegacy/iwl3945-base.c b/drivers/net/wireless/iwlegacy/iwl3945-base.c
+index 05f2ad1..b3d9f3f 100644
+--- a/drivers/net/wireless/iwlegacy/iwl3945-base.c
++++ b/drivers/net/wireless/iwlegacy/iwl3945-base.c
+@@ -2513,7 +2513,7 @@ static void iwl3945_bg_alive_start(struct work_struct *data)
+ 	    container_of(data, struct iwl_priv, alive_start.work);
+ 
+ 	mutex_lock(&priv->mutex);
+-	if (test_bit(STATUS_EXIT_PENDING, &priv->status))
++	if (test_bit(STATUS_EXIT_PENDING, &priv->status) || priv->txq == NULL)
+ 		goto out;
+ 
+ 	iwl3945_alive_start(priv);
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0009-powerpc-pmac-Fix-SMP-kernels-on-pre-core99-UP-machin.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0009-powerpc-pmac-Fix-SMP-kernels-on-pre-core99-UP-machin.patch
new file mode 100644
index 0000000..98111cb
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0009-powerpc-pmac-Fix-SMP-kernels-on-pre-core99-UP-machin.patch
@@ -0,0 +1,36 @@
+From 93bbacdcea5490053dc692cad003f74eb116fd4a Mon Sep 17 00:00:00 2001
+From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Date: Fri, 9 Dec 2011 15:06:18 +1100
+Subject: [PATCH 09/10] powerpc/pmac: Fix SMP kernels on pre-core99 UP
+ machines
+
+commit 78c5c68a4cf4329d17abfa469345ddf323d4fd62 upstream.
+
+The code for "powersurge" SMP would kick in and cause a crash
+at boot due to the lack of a NULL test.
+
+Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
+Signed-off-by: Jeremy Kerr <jeremy.kerr@canonical.com>
+Reported-by: Adam Conrad <adconrad@ubuntu.com>
+Tested-by: Adam Conrad <adconrad@ubuntu.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+---
+ arch/powerpc/platforms/powermac/smp.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
+index 9b6a820..3394254 100644
+--- a/arch/powerpc/platforms/powermac/smp.c
++++ b/arch/powerpc/platforms/powermac/smp.c
+@@ -414,7 +414,7 @@ static struct irqaction psurge_irqaction = {
+ 
+ static void __init smp_psurge_setup_cpu(int cpu_nr)
+ {
+-	if (cpu_nr != 0)
++	if (cpu_nr != 0 || !psurge_start)
+ 		return;
+ 
+ 	/* reset the entry point so if we get another intr we won't
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0010-Linux-3.2.13.patch b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0010-Linux-3.2.13.patch
new file mode 100644
index 0000000..08a5856
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/3.2.13/0010-Linux-3.2.13.patch
@@ -0,0 +1,24 @@
+From add3df1bc247cc4056661dd9ea3b445c1aea3e0d Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Date: Fri, 23 Mar 2012 13:54:45 -0700
+Subject: [PATCH 10/10] Linux 3.2.13
+
+---
+ Makefile |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 15e80f1..172e041 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,6 +1,6 @@
+ VERSION = 3
+ PATCHLEVEL = 2
+-SUBLEVEL = 12
++SUBLEVEL = 13
+ EXTRAVERSION =
+ NAME = Saber-toothed Squirrel
+ 
+-- 
+1.7.9.4
+
diff --git a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
index 9bc6cf3..20d590a 100755
--- a/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
+++ b/recipes-kernel/linux/linux-ti33x-psp-3.2/patch.sh
@@ -19,7 +19,7 @@ git reset --hard ${TAG}
 rm -Rf export
 
 previous=${TAG}
-PATCHSET="3.2.1 3.2.2 3.2.3 3.2.4 3.2.5 3.2.6 3.2.7 3.2.8 3.2.9 3.2.10 3.2.11 beaglebone"
+PATCHSET="3.2.1 3.2.2 3.2.3 3.2.4 3.2.5 3.2.6 3.2.7 3.2.8 3.2.9 3.2.10 3.2.11 3.2.12 3.2.13 beaglebone"
 
 # apply patches
 for patchset in ${PATCHSET} ; do
diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
index c30d1be..0b54e26 100644
--- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
+++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
@@ -593,6 +593,58 @@ PATCHES_OVER_PSP = " \
 	file://3.2.10/0095-Linux-3.2.10.patch \
 	file://3.2.11/0001-Revert-mfd-Test-for-jack-detection-when-deciding-if-.patch \
 	file://3.2.11/0002-Linux-3.2.11.patch \
+	file://3.2.12/0001-ASoC-neo1973-fix-neo1973-wm8753-initialization.patch \
+	file://3.2.12/0002-ALSA-hda-realtek-Apply-the-coef-setup-only-to-ALC269.patch \
+	file://3.2.12/0003-aio-fix-io_setup-io_destroy-race.patch \
+	file://3.2.12/0004-aio-fix-the-too-late-munmap-race.patch \
+	file://3.2.12/0005-x86-Derandom-delay_tsc-for-64-bit.patch \
+	file://3.2.12/0006-PCI-ignore-pre-1.1-ASPM-quirking-when-ASPM-is-disabl.patch \
+	file://3.2.12/0007-omap3isp-ccdc-Fix-crash-in-HS-VS-interrupt-handler.patch \
+	file://3.2.12/0008-rt2x00-fix-random-stalls.patch \
+	file://3.2.12/0009-perf-x86-Fix-local-vs-remote-memory-events-for-NHM-W.patch \
+	file://3.2.12/0010-CIFS-Do-not-kmalloc-under-the-flocks-spinlock.patch \
+	file://3.2.12/0011-vfs-fix-return-value-from-do_last.patch \
+	file://3.2.12/0012-vfs-fix-double-put-after-complete_walk.patch \
+	file://3.2.12/0013-acer-wmi-No-wifi-rfkill-on-Lenovo-machines.patch \
+	file://3.2.12/0014-atl1c-dont-use-highprio-tx-queue.patch \
+	file://3.2.12/0015-neighbour-Fixed-race-condition-at-tbl-nht.patch \
+	file://3.2.12/0016-ipsec-be-careful-of-non-existing-mac-headers.patch \
+	file://3.2.12/0017-ppp-fix-ppp_mp_reconstruct-bad-seq-errors.patch \
+	file://3.2.12/0018-sfc-Fix-assignment-of-ip_summed-for-pre-allocated-sk.patch \
+	file://3.2.12/0019-tcp-fix-false-reordering-signal-in-tcp_shifted_skb.patch \
+	file://3.2.12/0020-vmxnet3-Fix-transport-header-size.patch \
+	file://3.2.12/0021-packetengines-fix-config-default.patch \
+	file://3.2.12/0022-r8169-corrupted-IP-fragments-fix-for-large-mtu.patch \
+	file://3.2.12/0023-tcp-don-t-fragment-SACKed-skbs-in-tcp_mark_head_lost.patch \
+	file://3.2.12/0024-bridge-check-return-value-of-ipv6_dev_get_saddr.patch \
+	file://3.2.12/0025-tcp-fix-tcp_shift_skb_data-to-not-shift-SACKed-data-.patch \
+	file://3.2.12/0026-IPv6-Fix-not-join-all-router-mcast-group-when-forwar.patch \
+	file://3.2.12/0027-usb-asix-Patch-for-Sitecom-LN-031.patch \
+	file://3.2.12/0028-regulator-Fix-setting-selector-in-tps6524x-set_volta.patch \
+	file://3.2.12/0029-block-Fix-NULL-pointer-dereference-in-sd_revalidate_.patch \
+	file://3.2.12/0030-block-sx8-fix-pointer-math-issue-getting-fw-version.patch \
+	file://3.2.12/0031-block-fix-__blkdev_get-and-add_disk-race-condition.patch \
+	file://3.2.12/0032-Block-use-a-freezable-workqueue-for-disk-event-polli.patch \
+	file://3.2.12/0033-sparc32-Add-Av8-to-assembler-command-line.patch \
+	file://3.2.12/0034-hwmon-w83627ehf-Fix-writing-into-fan_stop_time-for-N.patch \
+	file://3.2.12/0035-hwmon-w83627ehf-Fix-memory-leak-in-probe-function.patch \
+	file://3.2.12/0036-hwmon-w83627ehf-Fix-temp2-source-for-W83627UHG.patch \
+	file://3.2.12/0037-rapidio-tsi721-fix-bug-in-register-offset-definition.patch \
+	file://3.2.12/0038-i2c-algo-bit-Fix-spurious-SCL-timeouts-under-heavy-l.patch \
+	file://3.2.12/0039-iscsi-target-Fix-reservation-conflict-EBUSY-response.patch \
+	file://3.2.12/0040-target-Fix-compatible-reservation-handling-CRH-1-wit.patch \
+	file://3.2.12/0041-hwmon-zl6100-Enable-interval-between-chip-accesses-f.patch \
+	file://3.2.12/0042-Linux-3.2.12.patch \
+	file://3.2.13/0001-nilfs2-fix-NULL-pointer-dereference-in-nilfs_load_su.patch \
+	file://3.2.13/0002-afs-Read-of-file-returns-EBADMSG.patch \
+	file://3.2.13/0003-afs-Remote-abort-can-cause-BUG-in-rxrpc-code.patch \
+	file://3.2.13/0004-perf-tools-Incorrect-use-of-snprintf-results-in-SEGV.patch \
+	file://3.2.13/0005-perf-tools-Use-scnprintf-where-applicable.patch \
+	file://3.2.13/0006-tcp-fix-syncookie-regression.patch \
+	file://3.2.13/0007-ipv6-Don-t-dev_hold-dev-in-ip6_mc_find_dev_rcu.patch \
+	file://3.2.13/0008-iwl3945-fix-possible-il-txq-NULL-pointer-dereference.patch \
+	file://3.2.13/0009-powerpc-pmac-Fix-SMP-kernels-on-pre-core99-UP-machin.patch \
+	file://3.2.13/0010-Linux-3.2.13.patch \
 	file://beaglebone/0001-f_rndis-HACK-around-undefined-variables.patch \
 	file://beaglebone/0002-da8xx-fb-add-DVI-support-for-beaglebone.patch \
 	file://beaglebone/0003-beaglebone-rebase-everything-onto-3.2-WARNING-MEGAPA.patch \
-- 
1.7.2.5


