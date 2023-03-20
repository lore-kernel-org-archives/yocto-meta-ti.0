Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED748C7EE2E
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11356.1679311496711321510
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A5D5540CAF
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xLSMxPuEJes5 for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9C6B940CA7
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BB3B01637D1
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 13/53] optee-os: Enable SW PRNG for OP-TEE in AM62X
Date: Mon, 20 Mar 2023 11:24:12 +0000
Message-Id: <20230320112452.2813505-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16170

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
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index a06fe858..0c5a6b21 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -3,7 +3,7 @@ inherit ti-secdev
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


