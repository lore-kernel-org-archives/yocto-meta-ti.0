Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC26CC00A8F
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 20:45:31 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.65321.1697834726045868584
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 13:45:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 124FD4121F;
	Fri, 20 Oct 2023 20:45:25 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okIql5L_lwRj; Fri, 20 Oct 2023 20:45:25 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E868A41213;
	Fri, 20 Oct 2023 20:45:22 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 9AD3E163D1B;
	Fri, 20 Oct 2023 16:45:20 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master/kirkstone][PATCH 5/5] conf: beagle*: recommend essential FW images for Beagle devices
Date: Fri, 20 Oct 2023 20:44:58 +0000
Message-Id: <20231020204458.546852-5-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020204458.546852-1-denis@denix.org>
References: <20231020204458.546852-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 20 Oct 2023 20:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17160

From: Denys Dmytriyenko <denys@konsulko.com>

Set MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS per platform to list recommended
essential FW images to be added to rootfs by default.

Correct beagle-x15 to pull devicetrees and kernel image as well.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beagle-x15.conf      | 2 ++
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 3 +++
 meta-ti-bsp/conf/machine/beaglebone.conf      | 2 ++
 meta-ti-bsp/conf/machine/beagleplay.conf      | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-ti-bsp/conf/=
machine/beagle-x15.conf
index be27705c..3b857165 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-ti-bsp/conf/machine/beagle-x15.conf
@@ -19,3 +19,5 @@ MACHINE_GUI_CLASS =3D "bigscreen"
 SERIAL_CONSOLES =3D "115200;ttyS2"
=20
 UBOOT_MACHINE =3D "am57xx_evm_config"
+
+MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-zi=
mage"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index 2f9c7288..3f5a027e 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -24,4 +24,7 @@ ti/k3-j721e-sk.dtb \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
+
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-im=
age"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "cadence-mhdp-fw vxd-dec-fw"
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-ti-bsp/conf/=
machine/beaglebone.conf
index 2d811d0d..45944ce8 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone.conf
@@ -23,3 +23,5 @@ MACHINE_FEATURES +=3D "screen"
 SERIAL_CONSOLES =3D "115200;ttyS0"
=20
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-zi=
mage"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "amx3-cm3"
diff --git a/meta-ti-bsp/conf/machine/beagleplay.conf b/meta-ti-bsp/conf/=
machine/beagleplay.conf
index 6a0f697f..4dd550a1 100644
--- a/meta-ti-bsp/conf/machine/beagleplay.conf
+++ b/meta-ti-bsp/conf/machine/beagleplay.conf
@@ -42,4 +42,7 @@ ti/k3-am625-sk-rpi-hdr-pwm.dtbo \
 "
=20
 MACHINE_GUI_CLASS =3D "bigscreen"
+
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-im=
age"
+
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D ""
--=20
2.25.1


