Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0F2C77B70
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.405.1680899814248246286
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8C7D840C5D;
	Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G79BjCbIMto1; Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4E04640031;
	Fri,  7 Apr 2023 20:36:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id A845B1637FA;
	Fri,  7 Apr 2023 16:36:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [master/kirkstone][PATCH 1/5] linux-bb.org: update to 5.10.162 and dedicated branches
Date: Fri,  7 Apr 2023 20:36:32 +0000
Message-Id: <20230407203636.3265548-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407203636.3265548-1-denis@denix.org>
References: <20230407203636.3265548-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16327

From: Denys Dmytriyenko <denys@konsulko.com>

* Update both 32 and 64-bit trees to 5.10.162
* Switch from using a common branch that gets periodically rebased to usi=
ng
  dedicated per-merge branches
* Patch 32-bit defconfig to use LZMA compression instead of LZO, that is
  being deprecated in OE-Core

Cc: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 ...h-default-kernel-compression-to-LZMA.patch | 30 +++++++++++++++++++
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 18 ++++++-----
 2 files changed, 40 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-de=
fconfig-switch-default-kernel-compression-to-LZMA.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig=
-switch-default-kernel-compression-to-LZMA.patch b/meta-ti-bsp/recipes-ke=
rnel/linux/linux-bb.org/0001-defconfig-switch-default-kernel-compression-=
to-LZMA.patch
new file mode 100644
index 00000000..f6bff39f
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/0001-defconfig-switch=
-default-kernel-compression-to-LZMA.patch
@@ -0,0 +1,30 @@
+From 0ccadc7a676341bbd66eb176308c7c59931e9dd2 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@konsulko.com>
+Date: Fri, 7 Apr 2023 01:44:56 +0000
+Subject: [PATCH] defconfig: switch default kernel compression to LZMA
+
+LZO compression and lzop tool haven't been maintained for long time and =
have
+been removed in recent versions of OE-Core, even though Debian may still=
 use
+them. Switch to LZMA compression that is used by default in TI kernel co=
nfig.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
+---
+ arch/arm/configs/bb.org_defconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/arch/arm/configs/bb.org_defconfig b/arch/arm/configs/bb.org=
_defconfig
+index 6bf0fb860683..7c035735172d 100644
+--- a/arch/arm/configs/bb.org_defconfig
++++ b/arch/arm/configs/bb.org_defconfig
+@@ -1,5 +1,5 @@
+ # CONFIG_LOCALVERSION_AUTO is not set
+-CONFIG_KERNEL_LZO=3Dy
++CONFIG_KERNEL_LZMA=3Dy
+ CONFIG_SYSVIPC=3Dy
+ CONFIG_POSIX_MQUEUE=3Dy
+ CONFIG_NO_HZ_IDLE=3Dy
+--=20
+2.25.1
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 2c459ce5..19664ba8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -15,18 +15,20 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT=
} ${EXTRA_DTC_ARGS}"
=20
 S =3D "${WORKDIR}/git"
=20
-# 5.10.145 version
-SRCREV =3D "9b11aaf2cdb1861ca74dc69d032a0f94cdd32bd6"
-PV =3D "5.10.145+git${SRCPV}"
-BRANCH =3D "5.10"
+# 5.10.162 version for 32-bit
+SRCREV:armv7a =3D "982fde4eb381f98ec8be946e8d33dd0c9f9416ab"
+PV:armv7a =3D "5.10.162+git${SRCPV}"
+BRANCH:armv7a =3D "v5.10.162-ti-r59"
=20
-# 5.10.153 version
-SRCREV:k3 =3D "11ebcc09f32669fac8254dff56d500f86c4c2caf"
-PV:k3 =3D "5.10.153+git${SRCPV}"
-BRANCH:k3 =3D "5.10-arm64"
+# 5.10.162 version for 64-bit
+SRCREV:aarch64 =3D "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
+PV:aarch64 =3D "5.10.162+git${SRCPV}"
+BRANCH:aarch64 =3D "v5.10.162-ti-arm64-r99"
=20
 SRC_URI =3D "git://github.com/beagleboard/linux.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
=20
+SRC_URI:append:armv7a =3D " file://0001-defconfig-switch-default-kernel-=
compression-to-LZMA.patch"
+
 DEFCONFIG_NAME =3D "bb.org_defconfig"
 KERNEL_CONFIG_COMMAND =3D "oe_runmake -C ${S} O=3D${B} ${DEFCONFIG_NAME}=
"
=20
--=20
2.25.1


