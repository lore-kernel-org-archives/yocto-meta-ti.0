Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8955.1645503276657532447
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:14:36 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6FB5140C7B
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i5ahpNab5ci5 for <meta-ti@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:14:35 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6171340A28
	for <meta-ti@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:14:34 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 4ACB7174772
	for <meta-ti@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:14:34 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [PATCH 21/29] conf/machine/am57xx-evm: add overlay for OV10635 sensor
Date: Tue, 22 Feb 2022 04:14:22 +0000
Message-Id: <20220222041430.2840289-22-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222041430.2840289-1-denis@denix.org>
References: <20220222041430.2840289-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Kevin Hilman <khilman@baylibre.com>

The VIP camera capture driver recently ported to ti-linux-5.10.y adds
a DT overlay for the OV10635 camera sensor.  Add this to
KERNEL_DEVICTREE so it's added to the artifacts.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Reviewed-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-ti-bsp/conf/machine/am57xx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am57xx-evm.conf b/meta-ti-bsp/conf/=
machine/am57xx-evm.conf
index eb0082ee..825bc31d 100644
--- a/meta-ti-bsp/conf/machine/am57xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am57xx-evm.conf
@@ -25,6 +25,7 @@ KERNEL_DEVICETREE =3D " \
     ti/am572x-idk-touchscreen.dtbo \
     ti/lcd-osd101t2587.dtbo \
     ti/lcd-osd101t2045.dtbo \
+    ti/ov10635.dtbo \
 "
=20
 KERNEL_DEVICETREE +=3D "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES',=
 '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk=
-pru-excl-uio.dtb', '', d)}"
--=20
2.25.1

