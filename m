Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 016C3D3611A
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 19:11:28 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.28725.1730833879423674001
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 Nov 2024 11:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5238A40CDF;
	Tue,  5 Nov 2024 19:11:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t9MrB1Y8RH78; Tue,  5 Nov 2024 19:11:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3CCB940C16;
	Tue,  5 Nov 2024 19:11:17 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5D4AF1640B6;
	Tue,  5 Nov 2024 14:11:16 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][RFC PATCH 1/6] conf/machine: rename beagleplay machine to beagleplay-ti
Date: Tue,  5 Nov 2024 14:10:55 -0500
Message-Id: <20241105191100.532413-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 05 Nov 2024 19:11:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18045

From: Denys Dmytriyenko <denys@konsulko.com>

BeaglePlay is officially supported by TI "ti-6_6" BSP and is part
of the TI-SDK releases. Switching BSP to BeagleBoard.org "bb_org"
settings for the same machine is possible within the same layer.

But having different machine configs for the same machine name in
multiple layers can be confusing and prone to errors. Hence rename
the config to indicate BeaglePlay with official TI support in order
to re-use the canonical name in a separate layer.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../machine/{beagleplay-k3r5.conf =3D> beagleplay-ti-k3r5.conf}     | 0
 meta-ti-bsp/conf/machine/{beagleplay.conf =3D> beagleplay-ti.conf}  | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-ti-bsp/conf/machine/{beagleplay-k3r5.conf =3D> beagleplay-ti=
-k3r5.conf} (100%)
 rename meta-ti-bsp/conf/machine/{beagleplay.conf =3D> beagleplay-ti.conf=
} (100%)

diff --git a/meta-ti-bsp/conf/machine/beagleplay-k3r5.conf b/meta-ti-bsp/=
conf/machine/beagleplay-ti-k3r5.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beagleplay-k3r5.conf
rename to meta-ti-bsp/conf/machine/beagleplay-ti-k3r5.conf
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay-ti.conf
similarity index 100%
rename from meta-ti-bsp/conf/machine/beagleplay.conf
rename to meta-ti-bsp/conf/machine/beagleplay-ti.conf
--=20
2.25.1


