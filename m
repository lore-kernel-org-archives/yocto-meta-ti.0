Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5626C677F1
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 01:03:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.31805.1676941379600911116
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Feb 2023 17:02:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B6A8E40C8E;
	Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0-hTXQyifpcW; Tue, 21 Feb 2023 01:02:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 97E9340C46;
	Tue, 21 Feb 2023 01:02:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 28BA1163762;
	Mon, 20 Feb 2023 20:02:33 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 2/4] Revert "meta-ti-bsp: machine: Attempt to update DC alias"
Date: Tue, 21 Feb 2023 01:02:40 +0000
Message-Id: <20230221010242.3690-3-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221010242.3690-1-denis@denix.org>
References: <20230221010242.3690-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Feb 2023 01:03:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15888

From: Denys Dmytriyenko <denys@konsulko.com>

Merged by accident.

This reverts commit 0dd6a86b9a20bc1117d19bec3e642602b6c54b8c.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 ---
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 3 ---
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 3 ---
 3 files changed, 9 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index e5349134..efa33a10 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -10,10 +10,7 @@ MACHINE_KERNEL_PR =3D "r7"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
-
-# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
-PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
 KERNEL_IMAGETYPES =3D "zImage uImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 97c7d3c8..e2f75359 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -11,10 +11,7 @@ MACHINE_KERNEL_PR =3D "r22"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
-
-# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
-PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "tilcdc"
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index ddd430d5..e9999910 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -11,10 +11,7 @@ MACHINE_KERNEL_PR =3D "r3"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
-
-# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
-PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
--=20
2.25.1


