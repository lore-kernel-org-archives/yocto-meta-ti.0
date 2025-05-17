Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E800C5475C
	for <webhook@archiver.kernel.org>; Sat, 17 May 2025 00:55:04 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.4219.1747443296848445922
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 May 2025 17:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3CC0E40BD4;
	Sat, 17 May 2025 00:54:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2oOUAuWwNC9U; Sat, 17 May 2025 00:54:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 25A9140C2B;
	Sat, 17 May 2025 00:54:55 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id DA3D8168550;
	Fri, 16 May 2025 20:54:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 3/6] linux-bb.org: add 6.12 version
Date: Fri, 16 May 2025 20:54:47 -0400
Message-Id: <20250517005450.3648292-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250517005450.3648292-1-denis@denix.org>
References: <20250517005450.3648292-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 17 May 2025 00:55:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18572

From: Denys Dmytriyenko <denys@konsulko.com>

Add BeagleBoard.org Linux kernel version 6.12.22

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../defconfig                                 |  0
 ...nux-bb.org_6.6.bb =3D> linux-bb.org_6.12.bb} | 21 ++++++++-----------
 2 files changed, 9 insertions(+), 12 deletions(-)
 copy meta-beagle/recipes-kernel/linux/{linux-bb.org-6.1 =3D> linux-bb.or=
g-6.12}/defconfig (100%)
 copy meta-beagle/recipes-kernel/linux/{linux-bb.org_6.6.bb =3D> linux-bb=
.org_6.12.bb} (81%)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig =
b/meta-beagle/recipes-kernel/linux/linux-bb.org-6.12/defconfig
similarity index 100%
copy from meta-beagle/recipes-kernel/linux/linux-bb.org-6.1/defconfig
copy to meta-beagle/recipes-kernel/linux/linux-bb.org-6.12/defconfig
diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb b/meta-=
beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
similarity index 81%
copy from meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
copy to meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index e1a58b8c..2ef82e0c 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.6.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -1,5 +1,5 @@
 # Look in the generic major.minor directory for files
-FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.6:"
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-6.12:"
=20
 SECTION =3D "kernel"
 SUMMARY =3D "BeagleBoard.org Linux kernel"
@@ -55,17 +55,14 @@ ${DT_VENDOR_PREFIX}PB-MIKROBUS-1.dtbo \
=20
 S =3D "${WORKDIR}/git"
=20
-# 6.6.58 version for 32-bit
-SRCREV:armv7a =3D "0d043a88f69f48789e43526d7a807ab744708071"
-PV:armv7a =3D "6.6.58+git"
-BRANCH:armv7a =3D "v6.6.58-ti-arm32-r10"
+# 6.12.22 version for 32-bit
+SRCREV:armv7a =3D "d7f560ef48a867b94959f040b4c3c57053f4e32d"
+PV:armv7a =3D "6.12.22+git"
+BRANCH:armv7a =3D "v6.12.22-ti-arm32-r10"
=20
-# 6.6.58 version for 64-bit
-SRCREV:aarch64 =3D "0987ef737c9812374607475972f0868b8fecbbf7"
-PV:aarch64 =3D "6.6.58+git"
-BRANCH:aarch64 =3D "v6.6.58-ti-arm64-r23"
+# 6.12.22 version for 64-bit
+SRCREV:aarch64 =3D "9e43fd19ece3affb9406e87ec3df733b91b77a4f"
+PV:aarch64 =3D "6.12.22+git"
+BRANCH:aarch64 =3D "v6.12.22-ti-arm64-r35"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
-
-SRC_URI +=3D "file://no-fortify.cfg"
-KERNEL_CONFIG_FRAGMENTS +=3D "${WORKDIR}/no-fortify.cfg"
--=20
2.25.1


