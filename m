Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A092EC64ED9
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 01:03:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.31804.1676941379567617487
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 17:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A574340C88;
	Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ovTQ1GFwTssi; Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 87F2340A3F;
	Tue, 21 Feb 2023 01:02:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 199AA163757;
	Mon, 20 Feb 2023 20:02:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 0/4] Revert graphics changes that were merged by accident
Date: Tue, 21 Feb 2023 01:02:38 +0000
Message-Id: <20230221010242.3690-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 01:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15891

From: Denys Dmytriyenko <denys@konsulko.com>

It appears v7 revision of the graphics patches got merged by accident.
Since that was not the final revision, plus it breaks few other things,
let's revert the corresponding commits ASAP.

Denys Dmytriyenko (4):
  Revert "conf: machine: Fallback to software rendering"
  Revert "meta-ti-bsp: machine: Attempt to update DC alias"
  Revert "meta-ti-bsp: machine: Remove all gpu features"
  Revert "meta-ti-bsp: graphics: Resolve dependency chain"

 meta-ti-bsp/conf/machine/am62xx-lp-evm.conf   |  2 +
 meta-ti-bsp/conf/machine/include/am62xx.inc   |  6 +-
 meta-ti-bsp/conf/machine/include/am65xx.inc   |  8 ++-
 meta-ti-bsp/conf/machine/include/j721e.inc    |  6 ++
 meta-ti-bsp/conf/machine/include/j721s2.inc   |  6 ++
 meta-ti-bsp/conf/machine/include/j784s4.inc   |  6 ++
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 11 +--
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 11 +--
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 11 +--
 ...-OpenEmbedded-nodistro-internal-aarc.patch | 29 ++++++++
 ...bb =3D> ti-img-rogue-driver_1.15.6133109.bb} | 20 +++---
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  8 +--
 .../ti-img-rogue-umlibs_1.15.6133109.bb       | 71 +++++++++++++++++++
 .../ti-img-rogue-umlibs_1.18.6276027.bb       | 39 ----------
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 30 +++++++-
 .../mesa/mesa-gl_22.0.%.bbappend              |  1 -
 .../mesa/mesa_22.0.%.bbappend                 |  1 -
 .../recipes-graphics/mesa/pvr-mesa.inc        | 40 -----------
 18 files changed, 191 insertions(+), 115 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-=
driver/0001-compiler-support-OpenEmbedded-nodistro-internal-aarc.patch
 rename meta-ti-bsp/recipes-bsp/powervr-drivers/{ti-img-rogue-driver_1.18=
.6276027.bb =3D> ti-img-rogue-driver_1.15.6133109.bb} (72%)
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-uml=
ibs_1.15.6133109.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-img-rogue-uml=
ibs_1.18.6276027.bb
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa-gl_22.0.%.bbap=
pend
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/mesa_22.0.%.bbappen=
d
 delete mode 100644 meta-ti-bsp/recipes-graphics/mesa/pvr-mesa.inc

--=20
2.25.1


