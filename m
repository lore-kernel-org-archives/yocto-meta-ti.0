Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1347DC63717
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 21:41:08 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.207.1667598059773134883
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 04 Nov 2022 14:40:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EF51240D52
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fZXy9bGdelDy for <meta-ti@lists.yoctoproject.org>;
	Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E2FFB40D89
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 21:40:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 40E8A163686
	for <meta-ti@lists.yoctoproject.org>; Fri,  4 Nov 2022 17:40:52 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 13/47] trusted-firmware-a: upgrade to v2.7
Date: Fri,  4 Nov 2022 21:40:21 +0000
Message-Id: <20221104214055.1221197-14-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221104214055.1221197-1-denis@denix.org>
References: <20221104214055.1221197-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 04 Nov 2022 21:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15231

From: Praneeth Bajjuri <praneeth@ti.com>

upgrade arm-trusted-firmare to v2.7

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Tested-by: Judith Mendez <jm@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 55fc3e29..916d8773 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -1,5 +1,5 @@
-PV:k3 =3D "2.6+2.7-rc0"
-SRCREV_tfa:k3 =3D "453abc80b2eacbf2816c838e47e40f063227d934"
+PV:k3 =3D "2.7"
+SRCREV_tfa:k3 =3D "35f4c7295bafeb32c8bcbdfb6a3f2e74a57e732b"
 SRC_URI:k3 =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.gi=
t;protocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
 COMPATIBLE_MACHINE:k3 =3D "k3"
 TFA_BUILD_TARGET:k3 =3D "all"
--=20
2.25.1


