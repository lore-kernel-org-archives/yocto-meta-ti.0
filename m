Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E774C6FD37
	for <webhook@archiver.kernel.org>; Tue, 13 Sep 2022 03:56:06 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.877.1663041347256710915
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Sep 2022 20:55:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DCC5940D81
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MStiE54eb-pp for <meta-ti@lists.yoctoproject.org>;
	Tue, 13 Sep 2022 03:55:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net
 [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BD74340D87
	for <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:55:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1D33C1749D4
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Sep 2022 23:55:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH 08/65] conf: machine: am62xx: add new dtb
 for low-power
Date: Tue, 13 Sep 2022 03:54:44 +0000
Message-Id: <20220913035541.2364351-9-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220913035541.2364351-1-denis@denix.org>
References: <20220913035541.2364351-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 13 Sep 2022 03:56:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15040

From: Praneeth Bajjuri <praneeth@ti.com>

The following commits in ti-linux-5.10.y kernel has introduced new dtbs.
a minimal skeleton and a lpm (low-power-mode) demo dtb.

commit c161df7b1ea0 ("arm64: dts: ti: Introduce k3-am625-sk-lpmdemo")
commit 61df7fcf9307 ("arm64: dts: ti: introduce minimal dt for am625")

This patch on am62xx conf is to include the new dtbs.

Reported-by: Dave Gerlach <d-gerlach@ti.com>
Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
index 6f097e77..73859d5f 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -6,6 +6,8 @@ require conf/machine/include/am62xx.inc
=20
 KERNEL_DEVICETREE =3D " \
     ti/k3-am625-sk.dtb \
+    ti/k3-am625-skeleton.dtb \
+    ti/k3-am625-sk-lpmdemo.dtb \
     ti/k3-am625-sk-csi2-ov5640.dtbo \
 "
=20
--=20
2.25.1


