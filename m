Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF12C6FA99
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:12:29 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.14468.1677233543384064859
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 24 Feb 2023 02:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AD0F640C93
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ae_cS3jDNLii for <meta-ti@lists.yoctoproject.org>;
	Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9E0D840C46
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:21 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 76FC1163767
	for <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 05:11:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master/kirkstone][PATCH v8 4/6] meta-ti-bsp: machine: set SGX display controller alias
Date: Fri, 24 Feb 2023 10:12:17 +0000
Message-Id: <20230224101219.4130589-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230224101219.4130589-1-denis@denix.org>
References: <20230224101219.4130589-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 24 Feb 2023 10:12:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15950

From: Randolph Sapp <rs@ti.com>

Set SGX display controller alias variables accordingly, as SGX has a few
different aliases across platforms.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
v8 - rephrase changelog to be clear and assertive

 meta-ti-bsp/conf/machine/include/omap-a15.inc | 3 +++
 meta-ti-bsp/conf/machine/include/ti33x.inc    | 3 +++
 meta-ti-bsp/conf/machine/include/ti43x.inc    | 3 +++
 3 files changed, 9 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/omap-a15.inc b/meta-ti-bsp/=
conf/machine/include/omap-a15.inc
index 01769bb3..2588aac2 100644
--- a/meta-ti-bsp/conf/machine/include/omap-a15.inc
+++ b/meta-ti-bsp/conf/machine/include/omap-a15.inc
@@ -10,7 +10,10 @@ MACHINE_KERNEL_PR =3D "r7"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+
+# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
+PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
 KERNEL_IMAGETYPES =3D "zImage uImage"
diff --git a/meta-ti-bsp/conf/machine/include/ti33x.inc b/meta-ti-bsp/con=
f/machine/include/ti33x.inc
index 24154d06..da2273e1 100644
--- a/meta-ti-bsp/conf/machine/include/ti33x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti33x.inc
@@ -11,7 +11,10 @@ MACHINE_KERNEL_PR =3D "r22"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+
+# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
+PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "tilcdc"
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
diff --git a/meta-ti-bsp/conf/machine/include/ti43x.inc b/meta-ti-bsp/con=
f/machine/include/ti43x.inc
index 96a599ed..277416b9 100644
--- a/meta-ti-bsp/conf/machine/include/ti43x.inc
+++ b/meta-ti-bsp/conf/machine/include/ti43x.inc
@@ -11,7 +11,10 @@ MACHINE_KERNEL_PR =3D "r3"
 PREFERRED_PROVIDER_virtual/kernel ?=3D "linux-ti-staging"
 PREFERRED_PROVIDER_virtual/bootloader ?=3D "u-boot-ti-staging"
 PREFERRED_PROVIDER_u-boot ?=3D "u-boot-ti-staging"
+
+# Graphics providers and variables
 PREFERRED_PROVIDER_virtual/gpudriver ?=3D "ti-sgx-ddk-km"
+PVR_DISPLAY_CONTROLLER_ALIAS ?=3D "omapdrm"
=20
 KERNEL_IMAGETYPE =3D "zImage"
=20
--=20
2.25.1


