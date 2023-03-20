Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F373C761A6
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:38:48 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.6410.1679283527047787017
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:38:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1561240CA2
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SZQmZT0zUUno for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:38:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 736E740CA8
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:42 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id C809F1637D1
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [kirkstone][PATCH 13/54] optee-os: Enable SW PRNG for OP-TEE in AM62X
Date: Mon, 20 Mar 2023 03:37:59 +0000
Message-Id: <20230320033840.1193963-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033840.1193963-1-denis@denix.org>
References: <20230320033840.1193963-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:38:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16052

From: Dhruva Gole <d-gole@ti.com>

commit 98506a4a07363 ("optee-os: Update SRCREV for OP-TEE TRNG in AM62X")

Disables SW PRNG =3D> Enabling Hardware RNG. This is breaking Suspend Res=
ume
on AM62xx EVM variants. To fix this keep using SOFTWARE_PRNG enabled as
it was.

Cc: vibhore@ti.com
Cc: Andrew Davis <afd@ti.com>
Signed-off-by: Dhruva Gole <d-gole@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend b=
/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
index 7772c58e..8fdf6513 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_3.16%.bbappend
@@ -6,7 +6,7 @@ inherit ti-secdev
=20
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
-EXTRA_OEMAKE:append:am62xx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
+EXTRA_OEMAKE:append:am62xx =3D " CFG_WITH_SOFTWARE_PRNG=3Dy CFG_TEE_CORE=
_LOG_LEVEL=3D1"
 EXTRA_OEMAKE:append:am62axx =3D " CFG_TEE_CORE_LOG_LEVEL=3D1"
=20
 # Signing procedure for legacy HS devices
--=20
2.25.1


