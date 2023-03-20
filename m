Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F429C77B7D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 03:39:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.6330.1679283568995247104
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 19 Mar 2023 20:39:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B78B140CB6
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 48MLKdNh6EUS for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 03:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AD3DF40C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:26 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BE43D1637CA
	for <meta-ti@lists.yoctoproject.org>; Sun, 19 Mar 2023 23:38:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 14/53] trusted-firmware-a: upgrade to v2.8+
Date: Mon, 20 Mar 2023 03:38:46 +0000
Message-Id: <20230320033925.1306823-15-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320033925.1306823-1-denis@denix.org>
References: <20230320033925.1306823-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 03:39:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16084

From: Judith Mendez <jm@ti.com>

Upgrade arm-trusted-firmare to v2.8-226-g2fcd408bb.

This upgrade picks up K3 L2 cache, snoop delayed, and EA
handling updates from upstream master.

Do not update to tip of master due to PSCI system off
support breaking AM62x and AM62q platforms.

Signed-off-by: Judith Mendez <jm@ti.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Tested-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../trusted-firmware-a/trusted-firmware-a_%.bbappend          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a_%.bbappend
index 13581358..4019a94b 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bba=
ppend
@@ -1,5 +1,5 @@
-PV:k3 =3D "2.7"
-SRCREV_tfa:k3 =3D "1309c6c805190bd376c0561597653f3f8ecd0f58"
+PV:k3 =3D "2.8+git${SRCPV}"
+SRCREV_tfa:k3 =3D "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
 SRC_URI:k3 =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.gi=
t;protocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
 COMPATIBLE_MACHINE:k3 =3D "k3"
 TFA_BUILD_TARGET:k3 =3D "all"
--=20
2.25.1


