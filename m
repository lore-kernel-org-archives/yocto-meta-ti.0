Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A79EC4321E
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 14:51:30 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web08.11693.1651503086760952785
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 May 2022 07:51:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 271A240C2A
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZcBLJTIpEwf1 for <meta-ti@lists.yoctoproject.org>;
	Mon,  2 May 2022 14:51:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 56D8E40C8C
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 14:51:23 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 193B617491C
	for <meta-ti@lists.yoctoproject.org>; Mon,  2 May 2022 10:51:21 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 07/26] linux-ti-staging-rt: Bump to 08.02.00.005
 release
Date: Mon,  2 May 2022 14:51:01 +0000
Message-Id: <20220502145120.726632-8-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502145120.726632-1-denis@denix.org>
References: <20220502145120.726632-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 May 2022 14:51:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14661

From: Ryan Eatmon <reatmon@ti.com>

Updated the linux rt version for 08.02.00.005

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb=
 b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index f47b1bc3..b11b8fd6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-5.10:"
=20
 BRANCH =3D "ti-rt-linux-5.10.y"
=20
-SRCREV =3D "8844ac0db67cf31b83b1b1b125baf1e637ef38d0"
+SRCREV =3D "204ec708dc86f4334f585f04835527570be1c4eb"
 PV =3D "5.10.100+git${SRCPV}"
--=20
2.25.1


