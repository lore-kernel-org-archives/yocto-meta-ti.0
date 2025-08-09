Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6D87CA0EC0
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 23:46:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.17026.1754783198366605584
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 09 Aug 2025 16:46:38 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CFAD740C82;
	Sat,  9 Aug 2025 23:46:37 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aU-uE1vPlo73; Sat,  9 Aug 2025 23:46:37 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B996C40CB1;
	Sat,  9 Aug 2025 23:46:36 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 754E016F92A;
	Sat,  9 Aug 2025 19:46:36 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH 3/4] linux-bb.org_6.12: upgrade to the latest 6.12.34
Date: Sat,  9 Aug 2025 19:46:34 -0400
Message-Id: <20250809234635.3626366-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250809234635.3626366-1-denis@denix.org>
References: <20250809234635.3626366-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 09 Aug 2025 23:46:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18918

From: Denys Dmytriyenko <denys@konsulko.com>

Upgrade BB.org 6.12 kernel to the latest 6.12.34 tags.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org_6.12.bb | 23 +++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb b/meta=
-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
index 52d5968a..829dbaad 100644
--- a/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
+++ b/meta-beagle/recipes-kernel/linux/linux-bb.org_6.12.bb
@@ -19,7 +19,6 @@ KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} =
${EXTRA_DTC_ARGS}"
=20
 # Extra DT overlays/capes
 KERNEL_DEVICETREE:append:armv7a =3D " \
-    ti/omap/AM335X-PRU-UIO-00A0.dtbo \
     ti/omap/BB-ADC-00A0.dtbo \
     ti/omap/BB-BBBW-WL1835-00A0.dtbo \
     ti/omap/BB-BBGG-WL1835-00A0.dtbo \
@@ -53,16 +52,22 @@ KERNEL_DEVICETREE:append:armv7a =3D " \
     ti/omap/PB-MIKROBUS-1.dtbo \
 "
=20
+KERNEL_DEVICETREE:append:aarch64 =3D " \
+    ti/BONE-I2C1.dtbo \
+    ti/BONE-I2C2.dtbo \
+    ti/BONE-I2C3.dtbo \
+"
+
 S =3D "${WORKDIR}/git"
=20
-# 6.12.22 version for 32-bit
-SRCREV:armv7a =3D "d7f560ef48a867b94959f040b4c3c57053f4e32d"
-PV:armv7a =3D "6.12.22+git"
-BRANCH:armv7a =3D "v6.12.22-ti-arm32-r10"
+# 6.12.34 version for 32-bit
+SRCREV:armv7a =3D "9e419b26243bd7efcd103ae0f6456f828592b34b"
+PV:armv7a =3D "6.12.34+git"
+BRANCH:armv7a =3D "v6.12.34-ti-arm32-r12"
=20
-# 6.12.22 version for 64-bit
-SRCREV:aarch64 =3D "9e43fd19ece3affb9406e87ec3df733b91b77a4f"
-PV:aarch64 =3D "6.12.22+git"
-BRANCH:aarch64 =3D "v6.12.22-ti-arm64-r35"
+# 6.12.34 version for 64-bit
+SRCREV:aarch64 =3D "9ca36b8c54806a037f357efcd40eaa8399798b05"
+PV:aarch64 =3D "6.12.34+git"
+BRANCH:aarch64 =3D "v6.12.34-ti-arm64-r46"
=20
 KERNEL_GIT_URI =3D "git://github.com/beagleboard/linux.git"
--=20
2.25.1


