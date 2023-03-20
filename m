Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115E1C6FD1D
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 11:25:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.11351.1679311495347594382
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Mar 2023 04:24:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 66A5240C50
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GxdBS1dtEI3w for <meta-ti@lists.yoctoproject.org>;
	Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4B50340C62
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:24:54 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4C2C21637C6
	for <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 07:24:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 02/53] j784s4-hs: changes to support new hs platform
Date: Mon, 20 Mar 2023 11:24:01 +0000
Message-Id: <20230320112452.2813505-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320112452.2813505-1-denis@denix.org>
References: <20230320112452.2813505-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Mar 2023 11:25:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16161

From: Manorit Chawdhry <m-chawdhry@ti.com>

Changes to support new j784s4-hs platform in:

    1) ti-sci-fw_git: Update firmware prefix for j784s4-hs
    2) atf: sign the image
    4) optee: sign the image

Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti=
-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 46d5111d..eb641270 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -36,6 +36,7 @@ SYSFW_PREFIX:j7200-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j721s2-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:j784s4-evm-k3r5 =3D "fs"
+SYSFW_PREFIX:j784s4-hs-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-evm-k3r5 =3D "fs"
 SYSFW_PREFIX:am62xx-lp-evm-k3r5 =3D "fs"
=20
--=20
2.25.1


