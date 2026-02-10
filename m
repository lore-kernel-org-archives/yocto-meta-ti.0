Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D65EB2718
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 20:59:52 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3581.1770757184002094835
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 10 Feb 2026 12:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 18FFF40C85;
	Tue, 10 Feb 2026 20:59:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FtJnjM6Xut2b; Tue, 10 Feb 2026 20:59:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB96B40A2F;
	Tue, 10 Feb 2026 20:59:41 +0000 (UTC)
Received: from gimli.cabin (argonath.cabin [172.31.1.2])
	by mail.denix.org (Postfix) with ESMTP id 36BEA1680B4;
	Tue, 10 Feb 2026 15:59:41 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
Subject: [master][PATCH] ti-core-initramfs: pull correct VIRTUAL_RUNTIME components
Date: Tue, 10 Feb 2026 15:59:40 -0500
Message-Id: <20260210205940.18081-1-denis@denix.org>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 10 Feb 2026 20:59:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19479

From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>

Pull additional standard VIRTUAL_RUNTIME components to respect Distro
configuration (e.g. systemd/udev, etc.)
This only requires adjusting the size to 128MB.

Signed-off-by: Denys Dmytriyenko (TI) <denys@konsulko.com>
---
 .../recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb  | 6 ++++++
 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb       | 2 +-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initra=
mfs.bb b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.=
bb
index c759808c..5ed9391e 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
@@ -11,6 +11,12 @@ TI_INITRAMFS_KERNEL_MODULES ?=3D ""
 RDEPENDS:${PN} +=3D "\
     ${TI_INITRAMFS_KERNEL_MODULES} \
     ${VIRTUAL-RUNTIME_base-utils} \
+    ${VIRTUAL-RUNTIME_login_manager} \
+    ${VIRTUAL-RUNTIME_init_manager} \
+    ${VIRTUAL-RUNTIME_dev_manager} \
+    ${VIRTUAL-RUNTIME_update-alternatives} \
+    netbase \
+    base-files \
     base-passwd \
     initramfs-framework-base \
     initramfs-module-udev \
diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb b/meta=
-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
index 223fef7a..ddf4e5b4 100644
--- a/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
+++ b/meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb
@@ -9,7 +9,7 @@ LICENSE =3D "MIT"
=20
 INITRAMFS_FSTYPES =3D "cpio cpio.xz"
=20
-INITRAMFS_MAXSIZE =3D "65536"
+INITRAMFS_MAXSIZE =3D "131072"
=20
 IMAGE_NAME =3D "ti-core-initramfs"
=20
--=20
2.35.3


