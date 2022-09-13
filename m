Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A34C6FA99
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.836.1663041349061801933
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C0F040D8A
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fxdriq8EiN3o for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0BEC740D8D
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BBFD41749FF
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:41 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 51/65] kernel u-boot: Fix formulation of
 LOCALVERSION
Date: Tue, 13 Sep 2022 03:55:27 +0000
Message-Id: <20220913035541.2364351-52-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15067

From: Ryan Eatmon <reatmon@ti.com>

devtool does not work with the current formulation of
the LOCALVERSION variables.  We need to use SRCPV to
avoid AUTOREV on bleeding builds, but there will be no
+ in the string, so we cannot split on that.  Just
use SRCPV directly.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc         | 2 +-
 meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/r=
ecipes-bsp/u-boot/u-boot-ti.inc
index f470c95e..7a22161d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,6 +1,6 @@
 # UBOOT_LOCALVERSION can be set to add a tag to the end of the
 # U-boot version string.  such as the commit id
-UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).split('+')[1]}"
+UBOOT_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).replace('AUTOINC+',=
'')[:10]}"
=20
 UBOOT_SUFFIX ?=3D "img"
 SPL_BINARY ?=3D "MLO"
diff --git a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc b/meta-=
ti-bsp/recipes-kernel/linux/setup-defconfig.inc
index 1e97acc0..df7d9ac8 100644
--- a/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/setup-defconfig.inc
@@ -1,6 +1,6 @@
 # KERNEL_LOCALVERSION can be set to add a tag to the end of the
 # kernel version string.  such as the commit id
-KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).split('+')[1]}"
+KERNEL_LOCALVERSION =3D "-g${@d.getVar('SRCPV', True).replace('AUTOINC+'=
,'')[:10]}"
=20
 # Check the defconfig file and see if it points to an in kernel
 # defconfig that should be used, or if it is a complete config file
--=20
2.25.1


