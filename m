Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.8960.1645503275981228034
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 543A240C7F
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TUTtTTQAX76Y for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D73A40C8A
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3B3D4174776
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 12/29] Revert "ti-sci-fw: Fix for k3-image-gen issue for combined boot images"
Date: Tue, 22 Feb 2022 04:14:13 +0000
Message-Id: <20220222041430.2840289-13-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Praneeth Bajjuri <praneeth@ti.com>

This reverts commit d29025f7e868bea6299b55caf78e684fc647be33.

* associated fix in k3-image-gen is picked up now.
  commit 892c86501ff7 ("Makefile: Skip signing of binaries for HS combine=
d boot")

hence its no longer needed to carry the same fix from meta-ti here.

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc   |  2 +-
 ...gning-of-binaries-for-combined-boot-.patch | 64 -------------------
 .../recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb    |  5 --
 3 files changed, 1 insertion(+), 70 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-bsp/ti-sci-fw/files/0001-Makefile=
-Skip-signing-of-binaries-for-combined-boot-.patch

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-t=
i-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index fea0c783..014e89c8 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -24,7 +24,7 @@ SRCREV =3D "${TI_LINUX_FW_SRCREV}"
=20
 BRANCH ?=3D "ti-linux-firmware"
=20
-K3_IMAGE_GEN_SRCREV ?=3D "9abbe130d47a7fa6f8e02b740ad3ad27bc81d327"
+K3_IMAGE_GEN_SRCREV ?=3D "892c86501ff745dfde4d535923ce686f45700da3"
 SRCREV_imggen =3D "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT =3D "imggen"
=20
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-s=
igning-of-binaries-for-combined-boot-.patch b/meta-ti-bsp/recipes-bsp/ti-=
sci-fw/files/0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.pa=
tch
deleted file mode 100644
index 196f3d3f..00000000
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/files/0001-Makefile-Skip-signing-=
of-binaries-for-combined-boot-.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From 2efc79702a47f9cbbeecbb2f604577f1ec8c95ba Mon Sep 17 00:00:00 2001
-From: Yogesh Siraswar <yogeshs@ti.com>
-Date: Wed, 8 Dec 2021 17:50:19 -0600
-Subject: [KIG PATCH] Makefile: Skip signing of binaries for combined boo=
t hs
- images
-
-Combined sysfw binaries used in tiboot.bin do not require signed images.
-This fixes issues with AM64x HS and J7200 HS boot images
-
-Upstream-Status: Submitted
-Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
----
- Makefile           | 8 +++++++-
- soc/am64x/Makefile | 1 +
- soc/j7200/Makefile | 1 +
- 3 files changed, 9 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 47b3b20..ab465df 100644
---- a/Makefile
-+++ b/Makefile
-@@ -215,8 +215,14 @@ $(soc_objroot)/%.o: %.c
- 	$(CROSS_COMPILE)gcc $(CFLAGS) -c -o $@-pre-validated $<
- 	python3 ./scripts/sysfw_boardcfg_validator.py -b $@-pre-validated -i -=
o $@ -s $(SOC) -l $@.log
-=20
--# On HS board configuration binaries must be signed
-+# On HS board configuration binaries must be signed unless it is combin=
ed boot image
- ifdef HS
-+ifndef COMBINED_BOOT_IMAGE
-+SIGN_BINARY=3D1
-+endif
-+endif
-+
-+ifdef SIGN_BINARY
- %.bin.unsigned: %.o
- 	$(CROSS_COMPILE)objcopy -S -O binary $< $@
- %.bin: %.bin.unsigned
-diff --git a/soc/am64x/Makefile b/soc/am64x/Makefile
-index bfbe3e5..33ebbd0 100644
---- a/soc/am64x/Makefile
-+++ b/soc/am64x/Makefile
-@@ -31,6 +31,7 @@
- #
-=20
- SBL_LOADADDDR ?=3D 0x70000000
-+COMBINED_BOOT_IMAGE =3D 1
- COMBINED_SYSFW_BRDCFG_LOADADDR ?=3D 0x7b000
- LOADADDR  ?=3D 0x44000
- SCIFS =3D sci
-diff --git a/soc/j7200/Makefile b/soc/j7200/Makefile
-index 3b754f7..0baef51 100644
---- a/soc/j7200/Makefile
-+++ b/soc/j7200/Makefile
-@@ -31,6 +31,7 @@
- #
-=20
- SBL_LOADADDDR ?=3D 0x41c00000
-+COMBINED_BOOT_IMAGE =3D 1
- COMBINED_TIFS_BRDCFG_LOADADDR ?=3D 0x7f000
- COMBINED_DM_BRDCFG_LOADADDR ?=3D 0x41c80000
- LOADADDR ?=3D 0x40000
---=20
-2.17.1
-
diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index dda47797..3d50b112 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -49,11 +49,6 @@ LD[unexport] =3D "1"
=20
 do_configure[noexec] =3D "1"
=20
-SRC_URI:append:j7200-hs-evm-k3r5 =3D " \
-	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;=
patchdir=3D../imggen"
-SRC_URI:append:am64xx-hs-evm-k3r5 =3D " \
-	file://0001-Makefile-Skip-signing-of-binaries-for-combined-boot-.patch;=
patchdir=3D../imggen"
-
 EXTRA_OEMAKE =3D "\
     CROSS_COMPILE=3D${TARGET_PREFIX} SYSFW_DL_URL=3D'' SYSFW_HS_DL_URL=3D=
'' SYSFW_HS_INNER_CERT_DL_URL=3D'' \
     SYSFW_PATH=3D"${SYSFW_TISCI}" SOC=3D${SYSFW_SOC} CONFIG=3D${SYSFW_CO=
NFIG} \
--=20
2.25.1

