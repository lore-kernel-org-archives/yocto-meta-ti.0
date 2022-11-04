Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DADC63703
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.806.1667602019749898950
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CC7CF40D7F
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fxSfxJMdQtQ5 for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C0DF440D9A
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9648E163691
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 24/50] cadence-mhdp-fw: Add dependency for j721s2
Date: Fri,  4 Nov 2022 22:46:26 +0000
Message-Id: <20221104224653.1223044-25-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15300

From: Rahul T R <r-ravikumar@ti.com>

cdns mhdp bridge is present in j721s2 soc.
Add the dependency for the same

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.=
bb b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index 2f694202..b066a676 100644
--- a/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -10,7 +10,7 @@ PR =3D "${INC_PR}.0"
=20
 CLEANBROKEN =3D "1"
=20
-COMPATIBLE_MACHINE =3D "j721e"
+COMPATIBLE_MACHINE =3D "j721e|j721s2"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
diff --git a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc b/meta-=
ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
index 3da41581..38289491 100644
--- a/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
+++ b/meta-ti-bsp/recipes-kernel/linux/kernel-rdepends.inc
@@ -22,6 +22,7 @@ RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:am64xx =3D =
" prueth-fw-am65x-sr2"
=20
 # Add run-time dependency for Cadence MHDP firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721e =3D " cadence-mhdp-fw"
+RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j721s2 =3D " cadence-mhdp-fw=
"
=20
 # Add run-time dependency for Video Decoding firmware to the rootfs
 RDEPENDS:${KERNEL_PACKAGE_NAME}-base:append:j7 =3D " vxd-dec-fw"
--=20
2.25.1


