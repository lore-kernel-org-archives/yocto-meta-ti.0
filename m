Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2426AC433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 17:44:39 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.235.1651772675391034734
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 May 2022 10:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64,
 mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9FCA640C81;
	Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HwKnxuDCPtJQ; Thu,  5 May 2022 17:44:34 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
 [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8659140C30;
	Thu,  5 May 2022 17:44:33 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 7DE0317491C;
	Thu,  5 May 2022 13:44:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 1/5] am62xx,
 j721s2: move "gpu" machine feature from machine to soc config
Date: Thu,  5 May 2022 17:44:18 +0000
Message-Id: <20220505174422.334666-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 May 2022 17:44:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14706

From: Denys Dmytriyenko <denys@konsulko.com>

In most cases machine features should be set in the corresponding SoC con=
fig
to be applicable to different machine variants, like GP, HS or custom boa=
rd.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm.conf    | 2 --
 meta-ti-bsp/conf/machine/include/am62xx.inc | 2 +-
 meta-ti-bsp/conf/machine/include/j721s2.inc | 2 ++
 meta-ti-bsp/conf/machine/j721s2-evm.conf    | 2 --
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/=
machine/am62xx-evm.conf
index 44f46d78..33b3294e 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -4,8 +4,6 @@
=20
 require conf/machine/include/am62xx.inc
=20
-MACHINE_FEATURES +=3D "gpu"
-
 KERNEL_DEVICETREE =3D " \
     ti/k3-am625-sk.dtb \
     ti/k3-am625-sk-csi2-ov5640.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/am62xx.inc b/meta-ti-bsp/co=
nf/machine/include/am62xx.inc
index f3bde639..56cd7c20 100644
--- a/meta-ti-bsp/conf/machine/include/am62xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am62xx.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY:append =3D ":am62xx"
=20
-MACHINE_FEATURES +=3D "screen touchscreen"
+MACHINE_FEATURES +=3D "screen touchscreen gpu"
=20
 SERIAL_CONSOLES =3D "115200;ttyS2"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
diff --git a/meta-ti-bsp/conf/machine/include/j721s2.inc b/meta-ti-bsp/co=
nf/machine/include/j721s2.inc
index 113f86c4..06654179 100644
--- a/meta-ti-bsp/conf/machine/include/j721s2.inc
+++ b/meta-ti-bsp/conf/machine/include/j721s2.inc
@@ -1,2 +1,4 @@
 require conf/machine/include/j7.inc
 SOC_FAMILY:append =3D ":j721s2"
+
+MACHINE_FEATURES +=3D "gpu"
diff --git a/meta-ti-bsp/conf/machine/j721s2-evm.conf b/meta-ti-bsp/conf/=
machine/j721s2-evm.conf
index 5d977776..a2c15f74 100644
--- a/meta-ti-bsp/conf/machine/j721s2-evm.conf
+++ b/meta-ti-bsp/conf/machine/j721s2-evm.conf
@@ -4,8 +4,6 @@
=20
 require conf/machine/include/j721s2.inc
=20
-MACHINE_FEATURES +=3D "gpu"
-
 SERIAL_CONSOLES =3D "115200;ttyS10"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
 TFA_K3_USART =3D "0x8"
--=20
2.25.1


