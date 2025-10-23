Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3A52CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 18:10:23 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.732.1761243016998103201
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 23 Oct 2025 11:10:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4F44140C2B;
	Thu, 23 Oct 2025 18:10:16 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gJr7Y37-p_DB; Thu, 23 Oct 2025 18:10:16 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D4C240BEC;
	Thu, 23 Oct 2025 18:10:15 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id B627E169137;
	Thu, 23 Oct 2025 14:10:14 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] packagegroup-ti-core-initramfs: ensure TI_INITRAMFS_KERNEL_MODULES is set
Date: Thu, 23 Oct 2025 14:10:13 -0400
Message-Id: <20251023181013.25365-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 23 Oct 2025 18:10:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19156

From: Denys Dmytriyenko <denys@konsulko.com>

TI_INITRAMFS_KERNEL_MODULES gets set only for TI platfroms and ends up
being undefined otherwise, which breaks parsing in yocto-check-layer
and/or in multi-BSP setups. Ensure the variable is defined in the
packagegroup, if not already set by the machine configuration.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initra=
mfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.=
bb
index e9cf5e6b..6845f0c9 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -2,6 +2,8 @@ SUMMARY =3D "Minimal initramfs for boot requirements"
=20
 require recipes-core/packagegroups/packagegroup-core-boot.bb
=20
+TI_INITRAMFS_KERNEL_MODULES ?=3D ""
+
 RDEPENDS:${PN} +=3D "\
     ${TI_INITRAMFS_KERNEL_MODULES} \
     initramfs-framework-base \
--=20
2.35.3


