Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DACCCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 18:40:55 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.813.1762195246244590403
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Nov 2025 10:40:47 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 56FA140C8A;
	Mon,  3 Nov 2025 18:40:45 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OW0q4ikU6l4n; Mon,  3 Nov 2025 18:40:45 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3835040C2C;
	Mon,  3 Nov 2025 18:40:44 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 5D4A1164711;
	Mon,  3 Nov 2025 13:40:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH] packagegroup-ti-core-initramfs: move cifs-utils to dynamic-layers
Date: Mon,  3 Nov 2025 13:40:42 -0500
Message-Id: <20251103184043.3394912-1-denis@denix.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Nov 2025 18:40:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19219

From: Denys Dmytriyenko <denys@konsulko.com>

Since cifs-utils is available in meta-openembedded, not OE-Core, it
cannot be added to this packagegroup unconditionally, as meta-ti-bsp
doesn't depend on meta-oe, only recommends it.

As it breaks yocto-check-layer now, move cifs-utils addition to
dynamic-layers to be added conditionally on meta-oe presence.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../initramfs/packagegroup-ti-core-initramfs.bbappend          | 3 +++
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb     | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/dynamic-layers/openembedded-layer/recipes=
-ti/initramfs/packagegroup-ti-core-initramfs.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/ini=
tramfs/packagegroup-ti-core-initramfs.bbappend b/meta-ti-bsp/dynamic-laye=
rs/openembedded-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs=
.bbappend
new file mode 100644
index 00000000..ce417125
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/=
packagegroup-ti-core-initramfs.bbappend
@@ -0,0 +1,3 @@
+RDEPENDS:${PN} +=3D "\
+    cifs-utils \
+"
diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initra=
mfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.=
bb
index 6845f0c9..86b69aff 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -9,7 +9,6 @@ RDEPENDS:${PN} +=3D "\
     initramfs-framework-base \
     initramfs-module-udev \
     initramfs-module-nfsrootfs \
-    cifs-utils \
     nfs-utils \
     nfs-utils-client \
 "
--=20
2.25.1


