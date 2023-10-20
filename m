Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF69C004C0
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 20:45:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.65319.1697834725672366283
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 03CA041220;
	Fri, 20 Oct 2023 20:45:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7L6jutQjuyO8; Fri, 20 Oct 2023 20:45:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB9C741221;
	Fri, 20 Oct 2023 20:45:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8C038163D19;
	Fri, 20 Oct 2023 16:45:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 3/5] linux-bb.org: update kernel to 6.1 for Beagle devices
Date: Fri, 20 Oct 2023 20:44:56 +0000
Message-Id: <20231020204458.546852-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020204458.546852-1-denis@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 20:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17158

From: Denys Dmytriyenko <denys@konsulko.com>

Update both 32-bit and 64-bit configs to use the latest 6.1 Linux kernel
from beagleboard.org repository, which is based on ti-linux-kernel repo
used in linux-ti-staging, but with extra Beagle-specific features on top.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-kernel/linux/linux-bb.org_git.bb  | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb b/meta-=
ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
index f4c1775d..4048e106 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-bb.org_git.bb
@@ -10,21 +10,24 @@ inherit kernel
 require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/ti-kernel.inc
=20
+# BB.org hasn't switched to "vendored" DTB layout by default yet
+KERNEL_DTBVENDORED =3D "0"
+
 DEPENDS +=3D "gmp-native libmpc-native"
=20
 KERNEL_EXTRA_ARGS +=3D "LOADADDR=3D${UBOOT_ENTRYPOINT} ${EXTRA_DTC_ARGS}=
"
=20
 S =3D "${WORKDIR}/git"
=20
-# 5.10.168 version for 32-bit
-SRCREV:armv7a =3D "a943fc1987e1b8057b0b5219ecd3c5a85285d62a"
-PV:armv7a =3D "5.10.168+git${SRCPV}"
-BRANCH:armv7a =3D "v5.10.168-ti-r70"
+# 6.1.33 version for 32-bit
+SRCREV:armv7a =3D "feb1c153a9693d44dec5772d134bd2c7986ff95d"
+PV:armv7a =3D "6.1.33+git${SRCPV}"
+BRANCH:armv7a =3D "v6.1.33-ti-r7"
=20
-# 5.10.162 version for 64-bit
-SRCREV:aarch64 =3D "a2f5d5746b6c389e58d20fda0a0fa88403da428b"
-PV:aarch64 =3D "5.10.162+git${SRCPV}"
-BRANCH:aarch64 =3D "v5.10.162-ti-arm64-r99"
+# 6.1.46 version for 64-bit
+SRCREV:aarch64 =3D "0a1e93a38c699fdd3c629d57f5cd015f90ab0d36"
+PV:aarch64 =3D "6.1.46+git${SRCPV}"
+BRANCH:aarch64 =3D "v6.1.46-ti-arm64-r9"
=20
 SRC_URI =3D " \
     git://github.com/beagleboard/linux.git;protocol=3Dhttps;branch=3D${B=
RANCH} \
--=20
2.25.1


