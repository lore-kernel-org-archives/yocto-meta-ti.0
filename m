Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A31C76196
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.422.1680899815382080642
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:36:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B8DDB40C52;
	Fri,  7 Apr 2023 20:36:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C3eWna17-HDz; Fri,  7 Apr 2023 20:36:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9B78940C46;
	Fri,  7 Apr 2023 20:36:52 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id CF2D41637FF;
	Fri,  7 Apr 2023 16:36:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [master/kirkstone][PATCH 5/5] machine: switch beaglebone and beagle-x15 to bb.org kernel/u-boot
Date: Fri,  7 Apr 2023 20:36:36 +0000
Message-Id: <20230407203636.3265548-6-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407203636.3265548-1-denis@denix.org>
References: <20230407203636.3265548-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16330

From: Denys Dmytriyenko <denys@konsulko.com>

Switch 32-bit beaglebone and beagle-x15 platforms to use linux-bb.org and
u-boot-bb.org recipes for simplicity and for additional Beagle-specific
features that are added on top of TI reference kernel, such as dynamic
management of capes and other OOBE enhancements.

Cc: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf | 4 ++++
 meta-ti-bsp/conf/machine/beaglebone.conf | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/=
machine/beagle-x15.conf
index 8efd6e60..fb52245b 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -4,6 +4,10 @@
=20
 require conf/machine/include/am57xx.inc
=20
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
+
 KERNEL_DEVICETREE_PREFIX =3D "am57xx-beagle-x15"
=20
 KERNEL_DEVICETREE =3D " \
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index 2a8dc6d7..dceef1db 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -4,6 +4,10 @@
=20
 require conf/machine/include/ti33x.inc
=20
+PREFERRED_PROVIDER_virtual/kernel =3D "linux-bb.org"
+PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-bb.org"
+PREFERRED_PROVIDER_u-boot =3D "u-boot-bb.org"
+
 KERNEL_DEVICETREE_PREFIX =3D "am335x-bone"
=20
 KERNEL_DEVICETREE =3D " \
--=20
2.25.1


