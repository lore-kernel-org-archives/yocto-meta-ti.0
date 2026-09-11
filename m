Return-Path: <francesco@dolcini.it>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B06C79FA1
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 07:02:22 +0000 (UTC)
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34056.1789110137059278745
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 00:02:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@dolcini.it header.s=default header.b=Wcudr1gE;
 spf=pass (domain: dolcini.it, ip: 217.194.8.81, mailfrom: francesco@dolcini.it)
Received: from francesco-nb.. (93-33-68-39.ip43.fastwebnet.it [93.33.68.39])
	by mail11.truemail.it (Postfix) with ESMTPA id 6EC8F1FCAA;
	Fri, 11 Sep 2026 09:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1789110133;
	bh=J3nabLnT6KOa6dhrMWzbq5XLYDoqQKTpN70gv4zswIY=; h=From:To:Subject;
	b=Wcudr1gEOOFxHkkBReahjTkzN5RSUwqMi2EAtObQPNY5b+0rnkAttpds8pNPXsvrK
	 awz4LElI18hpev5AJ3XDdpApDUY/l7m1tqQNzetFzT5YWXy4o7yPhVlS1Qbob4VebM
	 7FX95DiATgl+zqjdKSR5hYjvktlypbpc4PgEpOGQJJ7/XkUYJ4WOAg3kKltplO+N3f
	 1NXaXyQXpWxEn/4Q/aryQq2PTx9cbAG6xsaYVdE+vTMy0ZS+BcoOVLdRfRc4bhJMqf
	 HtONeE3/lfK1ycZXT92MO55mJM7QUg/BNB4V3MqBTQUgCuWTFzh+1TS+mRE401FBBK
	 6nC2xbCdzlmww==
From: Francesco Dolcini <francesco@dolcini.it>
To: meta-ti@lists.yoctoproject.org
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	Ryan Eatmon <reatmon@ti.com>,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [RFC PATCH] k3: only require IMAGE_BOOT_FILES entries that the resolved bootloader provider actually deploys
Date: Fri, 11 Sep 2026 09:02:07 +0200
Message-ID: <20260911070209.58601-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 11 Sep 2026 07:02:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20370

From: Francesco Dolcini <francesco.dolcini@toradex.com>

IMAGE_BOOT_FILES on k3 machines unconditionally required two entries
that are only ever produced by u-boot-ti's own do_deploy:

- ti_logo_414x97_32bpp.bmp.gz (am62xx.inc, am62pxx.inc): installed only
  by do_deploy:append:am62xx()/do_deploy:append:am62pxx() in
  recipes-bsp/u-boot/u-boot-ti.inc.
- tiboot3-*-evm.bin (k3.inc): the naming scheme u-boot-ti's own
  uboot_deploy_config:append:k3r5()/uboot_deploy:append:k3r5() use for
  the reference EVM defconfigs, which preserve the tiboot3 basename as
  built from the board's defconfig.

Any BSP that overrides PREFERRED_PROVIDER_virtual/bootloader to a
different U-Boot recipe built from its own custom defconfig deploys
tiboot3 binaries (and, for am62xx/am62pxx, never deploys the splash
bmp at all) under a different naming, and ends up with boot file
entries that never get produced. For a literal filename entry (the
bmp case) this breaks wic/image boot-file assembly outright; for a
glob entry (the tiboot3 case) it silently contributes nothing. Either
way, downstream layers are left having to manually strip the entry
with IMAGE_BOOT_FILES:remove to "cope with" TI's own reference naming.

Only add each entry when the resolved bootloader provider actually is
one of the u-boot-ti* recipes that produce it.

Assisted-by: LLM
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
RFC: I noticed both of these while adjusting IMAGE_BOOT_FILES:remove
workarounds in a downstream layer to cope with these two entries when
using a non-u-boot-ti bootloader provider on k3 machines, and wanted
to flag the underlying issue upstream rather than just carry the
workaround silently. I don't plan to follow up on this thread myself,
so please feel free to take this patch, rework it, or fix the
underlying issue however you see fit if this approach isn't the one
you'd want.

 meta-ti-bsp/conf/machine/include/am62pxx.inc | 6 ++++--
 meta-ti-bsp/conf/machine/include/am62xx.inc  | 6 ++++--
 meta-ti-bsp/conf/machine/include/k3.inc      | 8 +++++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62pxx.inc b/meta-ti-bsp/c=
onf/machine/include/am62pxx.inc
index 6bf20ee43236..82ab22a5b751 100644
--- a/meta-ti-bsp/conf/machine/include/am62pxx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62pxx.inc
@@ -16,5 +16,7 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cnm-wave-fw"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
-# Bitmap image tarball for early splashscreen
-IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
+# Bitmap image tarball for early splashscreen. Only u-boot-ti's own do_d=
eploy
+# installs this file, so skip requiring it when a different bootloader
+# recipe is selected (e.g. via PREFERRED_PROVIDER_virtual/bootloader).
+IMAGE_BOOT_FILES +=3D "${@ 'ti_logo_414x97_32bpp.bmp.gz' if (d.getVar('P=
REFERRED_PROVIDER_virtual/bootloader') or '').startswith('u-boot-ti') els=
e ''}"
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index fc20893bf1a2..14256b4ab5c7 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -8,8 +8,10 @@ MACHINE_FEATURES +=3D "screen"
 require conf/machine/include/mesa-pvr.inc
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "${BSP_ROGUE_DRIVER_PROVIDER}"
=20
-# Bitmap image tarball for early splashscreen
-IMAGE_BOOT_FILES +=3D "ti_logo_414x97_32bpp.bmp.gz"
+# Bitmap image tarball for early splashscreen. Only u-boot-ti's own do_d=
eploy
+# installs this file, so skip requiring it when a different bootloader
+# recipe is selected (e.g. via PREFERRED_PROVIDER_virtual/bootloader).
+IMAGE_BOOT_FILES +=3D "${@ 'ti_logo_414x97_32bpp.bmp.gz' if (d.getVar('P=
REFERRED_PROVIDER_virtual/bootloader') or '').startswith('u-boot-ti') els=
e ''}"
=20
 TFA_BOARD =3D "lite"
=20
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/m=
achine/include/k3.inc
index 2ebbfb9e54f8..e3ec36e1c5c7 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -46,7 +46,13 @@ MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-pka-fw"
=20
 IMAGE_FSTYPES +=3D "tar.xz wic.xz wic.bmap"
=20
-IMAGE_BOOT_FILES +=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.=
bin tiboot3-*-evm.bin"
+IMAGE_BOOT_FILES +=3D "${SPL_BINARYNAME} u-boot.${UBOOT_SUFFIX} tiboot3.=
bin"
+# tiboot3-*-evm.bin is the naming scheme u-boot-ti's own do_deploy uses =
for
+# the reference EVM defconfigs; a downstream bootloader recipe built fro=
m a
+# custom defconfig (e.g. via PREFERRED_PROVIDER_virtual/bootloader) depl=
oys
+# tiboot3 binaries under its own naming instead, so only require this gl=
ob
+# when the resolved bootloader provider actually produces it.
+IMAGE_BOOT_FILES +=3D "${@ 'tiboot3-*-evm.bin' if (d.getVar('PREFERRED_P=
ROVIDER_virtual/bootloader') or '').startswith('u-boot-ti') else ''}"
 IMAGE_EFI_BOOT_FILES ?=3D "${IMAGE_BOOT_FILES}"
=20
 EFI_PROVIDER ?=3D "grub-efi"
--=20
2.47.3


