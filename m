Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FAC4C4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 21:08:01 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.5297.1668805677925532620
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 18 Nov 2022 13:07:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BC93140DE6;
	Fri, 18 Nov 2022 21:07:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUjvd3tRyG3Q; Fri, 18 Nov 2022 21:07:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E4F240DDE;
	Fri, 18 Nov 2022 21:07:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7879C163677;
	Fri, 18 Nov 2022 16:07:49 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	=?UTF-8?q?Daniel=20D=C3=ADaz?= <mrchapp@gmail.com>
Subject: [master/kirkstone][PATCH] ti-sci-fw: make dependency on meta-ti-extras soft
Date: Fri, 18 Nov 2022 21:07:49 +0000
Message-Id: <20221118210749.2462011-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 18 Nov 2022 21:08:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15349

From: Denys Dmytriyenko <denys@konsulko.com>

Replace "require" with "include" to load ti-paths.inc and not break
parsing when meta-ti-extras is not in the BBLAYERS list.

As ti-paths.inc is only needed to define TI_K3_SECDEV_INSTALL_DIR
for ti-k3-secdev when TI_SECURE_DEV_PKG_K3 is not set and building
for K3 HS platforms. Since ti-k3-secdev resides in meta-ti-extras,
the soft dependency will still work fine and give a build error
"Nothing PROVIDES 'ti-k3-secdev-native'" when it is needed.

Also, since TI_K3_SECDEV_INSTALL_DIR can now be undefined, use
d.getVar() to access it ensuring it doesn't break the condition.

Reported-by: Daniel D=C3=ADaz <mrchapp@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index e89a6855..c99cd660 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,5 +1,5 @@
 require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
-require recipes-ti/includes/ti-paths.inc
+include recipes-ti/includes/ti-paths.inc
=20
 DEPENDS =3D "openssl-native u-boot-mkimage-native dtc-native virtual/boo=
tloader"
 DEPENDS:remove:am65xx-evm-k3r5 =3D "virtual/bootloader"
@@ -20,7 +20,7 @@ COMPATIBLE_MACHINE:aarch64 =3D "null"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or '${TI_K3_=
SECDEV_INSTALL_DIR}' }"
+TI_SECURE_DEV_PKG =3D "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar(=
'TI_K3_SECDEV_INSTALL_DIR') }"
 export TI_SECURE_DEV_PKG
=20
 SYSFW_SOC ?=3D "unknown"
--=20
2.25.1


