Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14A67C4828D
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 17:36:44 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1444.1706808999227804453
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Feb 2024 09:36:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1B4AB40C50;
	Thu,  1 Feb 2024 17:36:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DjuEvZqDXCGb; Thu,  1 Feb 2024 17:36:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 06F6240AB7;
	Thu,  1 Feb 2024 17:36:36 +0000 (UTC)
Received: from thorin.han-sole.ts.net (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 1E0EC163DEB;
	Thu,  1 Feb 2024 12:36:36 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] cairo: drop local bbappend
Date: Thu,  1 Feb 2024 12:36:35 -0500
Message-Id: <20240201173635.2591975-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Feb 2024 17:36:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17433

From: Denys Dmytriyenko <denys@konsulko.com>

Latest cairo release 1.18.0 no longer has corresponding opengl or glesv2
PACKAGECONFIGs.

https://git.openembedded.org/openembedded-core/commit/?id=3D9a4ca6b08d603=
1ebb67adcdd650aa59acd4fb5fb

Removed:
- The cairo-sphinx tool
- The XML, GL, GLES, Qt5, BeOS, OS/2, DirectFB, DRM, Cogl, and OpenVL
  backends
- Autotools build system

https://www.cairographics.org/news/cairo-1.18.0/

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 -
 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 -----
 2 files changed, 6 deletions(-)
 delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 delete mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-t=
i-bsp/recipes-graphics/cairo/cairo_%.bbappend
deleted file mode 100644
index 459d8d09..00000000
--- a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',=
 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-b=
sp/recipes-graphics/cairo/pvr-cairo.inc
deleted file mode 100644
index b41f1a01..00000000
--- a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
+++ /dev/null
@@ -1,5 +0,0 @@
-# This is required since cairo expects the opengl distro feature to refe=
r to
-# the desktop version of OpenGL. Imagination drivers only provide OpenGL=
ES.
-
-PACKAGECONFIG:remove =3D "opengl"
-PACKAGECONFIG:append =3D " glesv2"
--=20
2.25.1


