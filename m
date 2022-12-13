Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1253BC4332F
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 21:07:00 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.85859.1670965617721912385
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Dec 2022 13:06:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E5F2940C2B;
	Tue, 13 Dec 2022 21:06:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg-Bq9XSHPrh; Tue, 13 Dec 2022 21:06:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C7C9440A3F;
	Tue, 13 Dec 2022 21:06:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1BA4E1636AD;
	Tue, 13 Dec 2022 16:06:45 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Ryan Eatmon <reatmon@ti.com>
Subject: [dunfell][PATCH] k3: also inherit kernel-fitimage class for FIT image generation
Date: Tue, 13 Dec 2022 21:06:53 +0000
Message-Id: <20221213210653.2450345-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Dec 2022 21:07:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15469

From: Denys Dmytriyenko <denys@konsulko.com>

In order to support fitImage image type, kernel-fitimage class is needed.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
(cherry picked from kirkstone/master commit 48b22e8266ba0358b5b7319faa75a=
d731a350db7)
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/include/k3.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 349f4fda..81139571 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -16,6 +16,7 @@ PREFERRED_PROVIDER_u-boot =3D "u-boot-ti-staging"
=20
 KERNEL_IMAGETYPE =3D "Image"
 KERNEL_IMAGETYPES =3D "Image fitImage"
+KERNEL_CLASSES +=3D "kernel-fitimage"
=20
 UBOOT_ARCH =3D "arm"
 UBOOT_ENTRYPOINT =3D "0x80008000"
--=20
2.25.1


