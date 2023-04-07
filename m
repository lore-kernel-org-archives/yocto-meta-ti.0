Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91090C77B6E
	for <webhook@archiver.kernel.org>; Fri,  7 Apr 2023 20:37:03 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.407.1680899814367533811
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Apr 2023 13:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7754140CA5;
	Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k1h54Qd7Plht; Fri,  7 Apr 2023 20:36:53 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-88-116.washdc.fios.verizon.net [100.15.88.116])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 566A640C5D;
	Fri,  7 Apr 2023 20:36:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BF9281637FD;
	Fri,  7 Apr 2023 16:36:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>,
	Robert Nelson <robertcnelson@gmail.com>
Subject: [master/kirkstone][PATCH 3/5] beaglebone-ai64: add new DTBOs, remove duplicate settings
Date: Fri,  7 Apr 2023 20:36:34 +0000
Message-Id: <20230407203636.3265548-4-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230407203636.3265548-1-denis@denix.org>
References: <20230407203636.3265548-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Apr 2023 20:37:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16329

From: Denys Dmytriyenko <denys@konsulko.com>

* 5.10.162 added 2 new DT overlays
* Remove duplicate settings that are already set in SoC config

Cc: Robert Nelson <robertcnelson@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/beaglebone-ai64.conf | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-ti-bsp/=
conf/machine/beaglebone-ai64.conf
index 6e8c863c..94439911 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
@@ -18,6 +18,7 @@ ti/k3-j721e-beagleboneai64.dtb \
 ti/k3-j721e-beagleboneai64-no-shared-mem.dtb \
 ti/k3-j721e-common-proc-board.dtb \
 ti/k3-j721e-common-proc-board-infotainment.dtbo \
+ti/k3-j721e-common-proc-board-uarts.dtbo \
 ti/k3-j721e-cpb-csi2-ov5640.dtbo \
 ti/k3-j721e-fpdlink-cpb-fusion.dtbo \
 ti/k3-j721e-fpdlink-imx390-cm-0-0.dtbo \
@@ -64,6 +65,7 @@ ti/overlays/BONE-PWM1.dtbo \
 ti/overlays/BONE-PWM2.dtbo \
 ti/overlays/BONE-SPI0_0.dtbo \
 ti/overlays/BONE-SPI0_1.dtbo \
+ti/overlays/BONE-SPI1_0.dtbo \
 ti/overlays/BONE-UART1.dtbo \
 ti/overlays/BONE-USB0-host.dtbo \
 ti/overlays/J721E-PRU-UIO-00A0.dtbo \
@@ -71,9 +73,5 @@ ti/overlays/k3-j721e-beagleboneai64-RPi-7inch-panel.dtb=
o \
 ti/overlays/robotics-cape.dtbo \
 "
=20
-IMAGE_BOOT_FILES +=3D "sysfw.itb"
-
 MACHINE_GUI_CLASS =3D "bigscreen"
-MACHINE_FEATURES +=3D "screen"
-
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS +=3D "kernel-devicetree kernel-image-im=
age"
--=20
2.25.1


