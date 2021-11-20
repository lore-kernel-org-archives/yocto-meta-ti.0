Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3447.1637378775191910393
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 19:26:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AA30840C53
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egSKaVFodTEV for <meta-ti@lists.yoctoproject.org>;
	Sat, 20 Nov 2021 03:26:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 68DC840C86
	for <meta-ti@lists.yoctoproject.org>; Sat, 20 Nov 2021 03:26:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2C6091746DC
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 22:26:12 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH v2 12/26] conf: am57xx-evm: Add missing *.dtb and *.dtbo
Date: Fri, 19 Nov 2021 22:25:57 -0500
Message-Id: <1637378771-24987-13-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637378771-24987-1-git-send-email-denis@denix.org>
References: <1637378771-24987-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

Add missing dtb and dtbo to deploy folder

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/am57xx-evm.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 7441e80..f977c5c 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -15,6 +15,7 @@ KERNEL_DEVICETREE = " \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
     ti/am57xx-evm-common.dtbo \
+    am57xx-evm-reva3.dtb \
     ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
     ti/am571x-idk-touchscreen.dtbo \
@@ -22,6 +23,8 @@ KERNEL_DEVICETREE = " \
     am574x-idk.dtb \
     ti/am57xx-idk-osd-lcd-common.dtbo \
     ti/am572x-idk-touchscreen.dtbo \
+    ti/lcd-osd101t2587.dtbo \
+    ti/lcd-osd101t2045.dtbo \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.7.4

