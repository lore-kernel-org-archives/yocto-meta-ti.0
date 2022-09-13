Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5F3C6FA8D
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:55:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.841.1663041349679864373
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C93740D76
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id adBS7nuWLKOS for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 128CC40D6E
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:46 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4F4451666A7
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:42 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 65/65] prueth-fw: Deploy for AM64xx based on
 SoC not EVM
Date: Tue, 13 Sep 2022 03:55:41 +0000
Message-Id: <20220913035541.2364351-66-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15080

From: Andrew Davis <afd@ti.com>

This makes sense but looks like was done wrong to match AM65xx which
needed the exact EVM specified due to this only working on SR2.

Signed-off-by: Andrew Davis <afd@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb=
 b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
index 4eb48959..28c02698 100644
--- a/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
+++ b/meta-ti-bsp/recipes-bsp/prueth-fw/prueth-fw-am65x-sr2_git.bb
@@ -7,7 +7,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx-evm"
+COMPATIBLE_MACHINE =3D "am65xx-evm|am64xx"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index c6619b1d..1071a278 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -18,7 +18,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti43x =3D "=
 prueth-fw pruhsr-fw pruprp
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:ti33x =3D " prueth-fw pruhsr=
-fw pruprp-fw"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx =3D " prueth-fw-am65x=
"
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am65xx-evm =3D " prueth-fw-a=
m65x-sr2 prusw-fw-am65x-sr2"
-RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx-evm =3D " prueth-fw-a=
m65x-sr2"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D " prueth-fw-am65x=
-sr2"
=20
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " cadence-mhdp-fw"
--=20
2.25.1


