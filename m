Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553F6C63715
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 22:47:09 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.934.1667602018875452315
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 15:46:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E183C40D83
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 91WWxHIJqUVm for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D814340D84
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 22:46:56 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7646216368E
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 18:46:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 21/50] optee-os: Upgrade to upstream 3.18.0
Date: Fri,  4 Nov 2022 22:46:23 +0000
Message-Id: <20221104224653.1223044-22-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104224653.1223044-1-denis@denix.org>
References: <20221104224653.1223044-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 22:47:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15284

From: Andrew Davis <afd@ti.com>

Update to the latest upstream master which is 3.18.0.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend b/met=
a-ti-bsp/recipes-security/optee/optee-os_%.bbappend
index e59a8e79..76f55257 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
+++ b/meta-ti-bsp/recipes-security/optee/optee-os_%.bbappend
@@ -1,7 +1,5 @@
-PV:ti-soc =3D "3.17.0+git${SRCPV}"
-SRCREV:ti-soc =3D "15a746d28d10df3d79d72bc9fe4a5a654b88bcca"
-
-DEPENDS:append:ti-soc =3D " python3-cryptography-native"
+PV:ti-soc =3D "3.18.0+git${SRCPV}"
+SRCREV:ti-soc =3D "8e155bae3a5eb9d1a3ed9260bd7281a7a35f5086"
=20
 EXTRA_OEMAKE:append:k3 =3D "${@ ' CFG_CONSOLE_UART=3D'+ d.getVar('OPTEE_=
K3_USART') if d.getVar('OPTEE_K3_USART') else ''}"
=20
--=20
2.25.1


