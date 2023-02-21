Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B200CC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 01:03:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.31802.1676941379388244378
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 17:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B286040A3F;
	Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gclnjT_1LWKS; Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9368E40C30;
	Tue, 21 Feb 2023 01:02:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1D47C163760;
	Mon, 20 Feb 2023 20:02:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 1/4] Revert "conf: machine: Fallback to software rendering"
Date: Tue, 21 Feb 2023 01:02:39 +0000
Message-Id: <20230221010242.3690-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221010242.3690-1-denis@denix.org>
References: <20230221010242.3690-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 01:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15889

From: Denys Dmytriyenko <denys@konsulko.com>

Merged by accident.

This reverts commit 5ae790999e762063446ec4623693eecd8ecd6be9.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/am65xx.inc   | 2 +-
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 2 +-
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 2 +-
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am65xx.inc b/meta-ti-bsp/co=
nf/machine/include/am65xx.inc
index 9edafb2c..385bb164 100644
--- a/meta-ti-bsp/conf/machine/include/am65xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am65xx.inc
@@ -6,7 +6,7 @@ MACHINE_FEATURES +=3D "screen touchscreen"
 SERIAL_CONSOLES =3D "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
=20
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
=20
 KERNEL_DEVICETREE =3D " \
     ti/k3-am654-base-board.dtb \
diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 2e76da60..e5349134 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-s=
taging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 # Graphics providers and variables
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index c793c830..97c7d3c8 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-s=
taging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 # Graphics providers and variables
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "tilcdc"
=20
 KERNEL_IMAGETYPE =3D "zImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index f894b4b5..ddd430d5 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -13,7 +13,7 @@ PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-s=
taging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
=20
 # Graphics providers and variables
-PREFERRED_PROVIDER_virtual/gpudriver ?=3D ""
+PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
 PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
--=20
2.25.1


