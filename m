Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65E17C4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 19:50:35 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.23741.1713383425876833059
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 12:50:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B98D40C7B;
	Wed, 17 Apr 2024 19:50:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I5jQ4BJetAsN; Wed, 17 Apr 2024 19:50:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0244540A0B;
	Wed, 17 Apr 2024 19:50:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 67679163F21;
	Wed, 17 Apr 2024 15:50:22 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/scarthgap][PATCH] meta-ti-extras: remove SRCPV
Date: Wed, 17 Apr 2024 15:50:22 -0400
Message-Id: <20240417195022.2984505-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 19:50:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17591

From: Denys Dmytriyenko <denys@konsulko.com>

Last time around SRCPV was removed from meta-ti-bsp[1], but meta-ti-extra=
s
got missed. Resolve it now.

[1] https://git.yoctoproject.org/meta-ti/commit/?id=3Dd7624a767e20c776eb9=
37c2942127299b4dc0093

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb                   | 2 +-
 meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb     | 2 +-
 .../recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb    | 2 +-
 meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc            | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb b/meta-ti-extr=
as/recipes-bsp/bt-fw/bt-fw_git.bb
index 8fef493b..9a5a6ffa 100644
--- a/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
+++ b/meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "Firmware files for Bluetooth"
 LICENSE =3D "TI-TSPA"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df39eac9f4573be5b012e8313831e7=
2a9"
=20
-PV =3D "8.7.1+git${SRCPV}"
+PV =3D "8.7.1+git"
=20
 CLEANBROKEN =3D "1"
=20
diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb =
b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 51e82983..9d85829b 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D9d4316fe43=
4ba450dca4da25348ca5a3"
 # This package builds a kernel module, use kernel PR as base and append =
a local
 MACHINE_KERNEL_PR:append =3D "d"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV:append =3D "+git${SRCPV}"
+PV:append =3D "+git"
=20
 S =3D "${WORKDIR}/git/debugss_module/debugss-mod"
=20
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module=
-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-modul=
e-drv_git.bb
index b68c4463..8bea12f7 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_gi=
t.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_gi=
t.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING.txt;md5=3D7585998954=
5e37968a99b631ef42722e"
 # This package builds a kernel module, use kernel PR as base and append =
a local
 MACHINE_KERNEL_PR:append =3D "b"
 PR =3D "${MACHINE_KERNEL_PR}"
-PV:append =3D "+git${SRCPV}"
+PV:append =3D "+git"
=20
 SRC_URI:append =3D "\
     file://0001-Support-Linux-kernels-v5.15.patch;patchdir=3D../.. \
diff --git a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc b/meta-=
ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
index af94a780..6faf16b8 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
+++ b/meta-ti-extras/recipes-ti/jailhouse/ti-jailhouse.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 COMPATIBLE_MACHINE =3D "am62xx|am62pxx"
 TARGET_CC_ARCH +=3D "${LDFLAGS}"
-PV =3D "0.12+git${SRCPV}"
+PV =3D "0.12+git"
 SRCREV =3D "603819ef9a771a3c253a141220daab8e61751a43"
 BRANCH =3D "master"
 SRC_URI =3D " \
--=20
2.25.1


