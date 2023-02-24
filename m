Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A31C64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14450.1677233544468237606
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA9CE40C06
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:23 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XdO4FjDjaEmp for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:23 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D974C40C8C
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 8E6D6163769
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:11:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v8 6/6] conf/machine: fix use of screen and touchscreen machine features
Date: Fri, 24 Feb 2023 10:12:19 +0000
Message-Id: <20230224101219.4130589-7-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224101219.4130589-1-denis@denix.org>
References: <20230224101219.4130589-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15952

From: Denys Dmytriyenko <denys@konsulko.com>

Some machine configs didn't specify their use of screen and touchscreen
machine features correctly, fix them.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v8 - new patch for this series

 meta-ti-bsp/conf/machine/include/am62xx.inc | 2 +-
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 --
 meta-ti-bsp/conf/machine/include/j721e.inc  | 2 +-
 meta-ti-bsp/conf/machine/include/j721s2.inc | 2 +-
 meta-ti-bsp/conf/machine/include/j784s4.inc | 2 +-
 5 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index 2a06fc0f..98df24b2 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am62xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen gpu"
+MACHINE_FEATURES +=3D "screen gpu"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/co=
nf/machine/include/am64xx.inc
index 0fd15b90..a2e5d673 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -1,8 +1,6 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am64xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen"
-
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j721e.inc b/meta-ti-bsp/con=
f/machine/include/j721e.inc
index 74cdc0e7..8f9c24e6 100644
--- a/meta-ti-bsp/conf/machine/include/j721e.inc
+++ b/meta-ti-bsp/conf/machine/include/j721e.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721e"
=20
-MACHINE_FEATURES +=3D "gpu"
+MACHINE_FEATURES +=3D "screen gpu"
=20
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index b0953c1a..70569a16 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j721s2"
=20
-MACHINE_FEATURES +=3D "gpu"
+MACHINE_FEATURES +=3D "screen gpu"
=20
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
diff --git a/meta-ti-bsp/conf/machine/include/j784s4.inc b/meta-ti-bsp/co=
nf/machine/include/j784s4.inc
index 48d20a21..d03ee4a4 100644
--- a/meta-ti-bsp/conf/machine/include/j784s4.inc
+++ b/meta-ti-bsp/conf/machine/include/j784s4.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":j784s4"
=20
-MACHINE_FEATURES +=3D "gpu"
+MACHINE_FEATURES +=3D "screen gpu"
=20
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-img-rogue-driver"
=20
--=20
2.25.1


