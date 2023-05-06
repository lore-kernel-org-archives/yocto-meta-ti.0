Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6ABC7EE24
	for <webhook@archiver.kernel.org>; Sat,  6 May 2023 02:37:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.15234.1683340666380683852
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 May 2023 19:37:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B805F40C76
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kzDEuiEoEvOa for <meta-ti@lists.yoctoproject.org>;
	Sat,  6 May 2023 02:37:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 995E340C88
	for <meta-ti@lists.yoctoproject.org>; Sat,  6 May 2023 02:37:43 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 45AD11638CC
	for <meta-ti@lists.yoctoproject.org>; Fri,  5 May 2023 22:37:01 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 3/4] cairo: resolve opengl version
Date: Sat,  6 May 2023 02:37:42 +0000
Message-Id: <20230506023743.1259692-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230506023743.1259692-1-denis@denix.org>
References: <20230506023743.1259692-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 06 May 2023 02:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16496

From: Randolph Sapp <rs@ti.com>

Cairo can either be built for use with OpenGL or OpenGLES. By default it
assumes it can use OpenGL if X11 is provided as a distro feature. This
assumption is not true when using the proprietary SGX / Rogue drivers.

Vulkan libraries need some X libs at runtime now, so we need to manually
override the PACKAGECONFIG for cairo to use OpenGLES.

Signed-off-by: Randolph Sapp <rs@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend | 1 +
 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc    | 5 +++++
 2 files changed, 6 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
 create mode 100644 meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc

diff --git a/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend b/meta-t=
i-bsp/recipes-graphics/cairo/cairo_%.bbappend
new file mode 100644
index 00000000..459d8d09
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/cairo/cairo_%.bbappend
@@ -0,0 +1 @@
+require ${@bb.utils.contains_any('PREFERRED_PROVIDER_virtual/gpudriver',=
 'ti-img-rogue-driver ti-sgx-ddk-km', 'pvr-cairo.inc', '', d)}
diff --git a/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc b/meta-ti-b=
sp/recipes-graphics/cairo/pvr-cairo.inc
new file mode 100644
index 00000000..b41f1a01
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/cairo/pvr-cairo.inc
@@ -0,0 +1,5 @@
+# This is required since cairo expects the opengl distro feature to refe=
r to
+# the desktop version of OpenGL. Imagination drivers only provide OpenGL=
ES.
+
+PACKAGECONFIG:remove =3D "opengl"
+PACKAGECONFIG:append =3D " glesv2"
--=20
2.25.1


