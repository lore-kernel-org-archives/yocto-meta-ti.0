Return-Path: <anthony@ajmartinez.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DA6EE01E0
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 16:45:51 +0000 (UTC)
Received: from mail-40136.proton.ch (mail-40136.proton.ch [185.70.40.136])
 by mx.groups.io with SMTP id smtpd.web11.1803.1694623537628428546
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 13 Sep 2023 09:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ajmartinez.com header.s=protonmail header.b=iQt8sU88;
 spf=pass (domain: ajmartinez.com, ip: 185.70.40.136, mailfrom: anthony@ajmartinez.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ajmartinez.com;
	s=protonmail; t=1694623529; x=1694882729;
	bh=mYzt3kOP1cjXtTbXwoxoeCsFlc6GZbJ3TvQVmdW2MZM=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=iQt8sU885nJ8gJiZhH0+mhNLij4uXAeffuRywOuj7MyvgHZzpQMaZIjFE9g1smRm7
	 6INg1Kr9j1xK3msY4H/3xf1Mr1bJsKVQuZcroOVGgYM8gQGqvfQ4kpw67dH2CjJj2g
	 0nesCCqYw+d4n68r6cwNSezZyKQcUDciPjB04/b6Okdrx4NfJnbVN91wl/ORteyuZ3
	 bGm9/PjAtuU3N2UoaEx4UdIxbW3fH7SvnBqH5IFNfaeP3TCpwodVbfYAsrEjBaa9fU
	 Ou8CnDwEeStnKn9EsLKHb6XSRdrmCj/pFqKfVP7rgRSYX2xkdxJMijdHLhDQh45KQa
	 TNmsrz9cqPvZg==
Date: Wed, 13 Sep 2023 16:45:05 +0000
To: meta-ti@lists.yoctoproject.org
From: "Anthony J. Martinez" <anthony@ajmartinez.com>
Cc: "Anthony J. Martinez" <anthony@ajmartinez.com>, Robert Nelson <robertcnelson@gmail.com>
Subject: [PATCH] linux-bb.org: update to 5.10.168 for armv7a targets
Message-ID: <20230913164423.7867-1-anthony@ajmartinez.com>
Feedback-ID: 12351652:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 13 Sep 2023 16:45:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16964

Updates SRCREV, PV, and BRANCH for armv7a targets and fixes
failure to mount /boot when using poky with systemd. The
kernel selected supports VFAT without initramfs as noted
here - https://lists.yoctoproject.org/g/meta-ti/message/16913

Removes defconfig patch setting LZMA, as the new kernel
already defaults to LZ4.

Tested by running `bitbake core-image-base` with this patchset,
and then booting a pair of Beaglebone Black devices from the
resulting image. Prior to the change, systemd boots to a
maintenance mode having failed to mount /boot. After the change,
the system boots normally and /boot is mounted.

Suggested-by: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Anthony J. Martinez <anthony@ajmartinez.com>
---
 ...h-default-kernel-compression-to-LZMA.patch | 29 -------------------
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 10 +++----
 2 files changed, 4 insertions(+), 35 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defc=
onfig-switch-default-kernel-compression-to-LZMA.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-s=
witch-default-kernel-compression-to-LZMA.patch b/meta-ti-bsp/recipes-kernel=
/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-to-LZM=
A.patch
deleted file mode 100644
index 54dc8c91..00000000
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch-d=
efault-kernel-compression-to-LZMA.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0ccadc7a676341bbd66eb176308c7c59931e9dd2 Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@konsulko.com>
-Date: Fri, 7 Apr 2023 01:44:56 +0000
-Subject: [PATCH] defconfig: switch default kernel compression to LZMA
-
-LZO compression and lzop tool haven't been maintained for long time and ha=
ve
-been removed in recent versions of OE-Core, even though Debian may still u=
se
-them. Switch to LZMA compression that is used by default in TI kernel conf=
ig.
-
-Upstream-Status: Inappropriate [OE-specific]
-
-Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
----
- arch/arm/configs/bb.org_defconfig | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/arch/arm/configs/bb.org_defconfig b/arch/arm/configs/bb.org_d=
efconfig
-index 6bf0fb860683..7c035735172d 100644
---- a/arch/arm/configs/bb.org_defconfig
-+++ b/arch/arm/configs/bb.org_defconfig
-@@ -1,5 +1,5 @@
- # CONFIG_LOCALVERSION_AUTO is not set
--CONFIG_KERNEL_LZO=3Dy
-+CONFIG_KERNEL_LZMA=3Dy
- CONFIG_SYSVIPC=3Dy
- CONFIG_POSIX_MQUEUE=3Dy
- CONFIG_NO_HZ_IDLE=3Dy
---
-2.25.1
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-ti=
-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index e134fb84..f4c1775d 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -16,10 +16,10 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} =
${EXTRA_DTC_ARGS}"
=20
 S =3D "${WORKDIR}/git"
=20
-# 5.10.162 version for 32-bit
-SRCREV:armv7a =3D "982fde4eb381f98ec8be946e8d33dd0c9f9416ab"
-PV:armv7a =3D "5.10.162+git${SRCPV}"
-BRANCH:armv7a =3D "v5.10.162-ti-r59"
+# 5.10.168 version for 32-bit
+SRCREV:armv7a =3D "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
+PV:armv7a =3D "5.10.168+git${SRCPV}"
+BRANCH:armv7a =3D "v5.10.168-ti-r70"
=20
 # 5.10.162 version for 64-bit
 SRCREV:aarch64 =3D "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
@@ -30,5 +30,3 @@ SRC_URI =3D " \
     git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${BRA=
NCH} \
     file://defconfig \
 "
-
-SRC_URI:append:armv7a =3D " file://0001-defconfig-switch-default-kernel-co=
mpression-to-LZMA.patch"
--=20
2.30.2



