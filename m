Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424D8C83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 18:56:15 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.21762.1753210572742033297
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Jul 2025 11:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3145140C76;
	Tue, 22 Jul 2025 18:56:12 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NVpMFRdvsQYo; Tue, 22 Jul 2025 18:56:12 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 13AE240800;
	Tue, 22 Jul 2025 18:56:11 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id A3BE216C97B;
	Tue, 22 Jul 2025 14:56:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [scarthgap][PATCH] beaglebone-ai64: restore removed TI_VXE_VXD_DRIVER:bsp-bb_org-6_6
Date: Tue, 22 Jul 2025 14:56:09 -0400
Message-Id: <20250722185609.29775-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Jul 2025 18:56:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18809

From: Denys Dmytriyenko <denys@konsulko.com>

During recent removal of 6.1 BSPs, TI_VXE_VXD_DRIVER:bsp-bb_org-6_6
setting for BB.org 6.6 BSP was accidentally removed - restore it.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-beagle/conf/machine/beaglebone-ai64.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-beagle/conf/machine/beaglebone-ai64.conf b/meta-beagle/=
conf/machine/beaglebone-ai64.conf
index 3da6e878..0f15c712 100644
--- a/meta-beagle/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -27,3 +27,8 @@ ti/k3-j721e-sk.dtb \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
+
+# TI has moved a driver out of its kernel tree and into an out of tree m=
odule.
+# We need to not include that for older kernels since the module is stil=
l in
+# the kernel.
+TI_VXE_VXD_DRIVER:bsp-bb_org-6_6 =3D ""
--=20
2.35.3


