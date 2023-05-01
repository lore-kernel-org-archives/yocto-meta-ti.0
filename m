Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751CFC7EE21
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 19:23:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.104334.1682968974662757088
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 May 2023 12:22:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9325A40C1C;
	Mon,  1 May 2023 19:22:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xjkdgnIqbC9P; Mon,  1 May 2023 19:22:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7874740C13;
	Mon,  1 May 2023 19:22:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 3CAF316387A;
	Mon,  1 May 2023 15:22:11 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH] linux-bb.org: add support for config fragments
Date: Mon,  1 May 2023 19:22:50 +0000
Message-Id: <20230501192250.1823510-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 01 May 2023 19:23:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16464

From: Denys Dmytriyenko <denys@konsulko.com>

* Add support for additional config fragments passed via semi-standard
  KERNEL_CONFIG_FRAGMENTS variable
* Also don't build all DTBs, only those specified in the machine config

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org/defconfig     |  1 +
 .../recipes-kernel/linux/linux-bb.org_git.bb        | 13 +++++--------
 2 files changed, 6 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconf=
ig

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig b/me=
ta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig
new file mode 100644
index 00000000..a5de2e24
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org/defconfig
@@ -0,0 +1 @@
+use-kernel-config=3Dbb.org_defconfig
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index 19664ba8..e134fb84 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -7,6 +7,7 @@ COMPATIBLE_MACHINE =3D "beagle.*"
=20
 inherit kernel
=20
+require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
 DEPENDS +=3D "gmp-native libmpc-native"
@@ -25,13 +26,9 @@ SRCREV:aarch64 =3D "a2f5d5746b6c389e58d20fda0a0fa88403=
da428b"
 PV:aarch64 =3D "5.10.162+git${SRCPV}"
 BRANCH:aarch64 =3D "v5.10.162-ti-arm64-r99"
=20
-SRC_URI =3D "git://github.com/beagleboard/linux.git;protocol=3Dhttps;bra=
nch=3D${BRANCH}"
+SRC_URI =3D " \
+    git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH} \
+    file://defconfig \
+"
=20
 SRC_URI:append:armv7a =3D " file://0001-defconfig-switch-default-kernel-=
compression-to-LZMA.patch"
-
-DEFCONFIG_NAME =3D "bb.org_defconfig"
-KERNEL_CONFIG_COMMAND =3D "oe_runmake -C ${S} O=3D${B} ${DEFCONFIG_NAME}=
"
-
-kernel_do_compile:append() {
-	oe_runmake dtbs CC=3D"${KERNEL_CC} $cc_extra " LD=3D"${KERNEL_LD}" ${KE=
RNEL_EXTRA_ARGS}
-}
--=20
2.25.1


