Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1222.1635795195261193255
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4DCD740C53
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5YPeETmhH6iG for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 445F040C83
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0C7A3174694
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 07/22] conf: am57xx-evm: ReIntroduce existent dtb* for 5.10
Date: Mon,  1 Nov 2021 15:32:57 -0400
Message-Id: <1635795192-43144-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This reverts commit 43bf0f36a3ac62cc3378688358ba704a27b501ce.
Added dtb and dtbo for am57xx

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/am57xx-evm.conf | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/conf/machine/am57xx-evm.conf b/conf/machine/am57xx-evm.conf
index 78e730c..7441e80 100644
--- a/conf/machine/am57xx-evm.conf
+++ b/conf/machine/am57xx-evm.conf
@@ -14,10 +14,14 @@ KERNEL_DEVICETREE = " \
     am57xx-beagle-x15-revc.dtb \
     am5729-beagleboneai.dtb \
     am57xx-evm.dtb \
-    am57xx-evm-reva3.dtb \
+    ti/am57xx-evm-common.dtbo \
+    ti/am57xx-evm-reva3.dtbo \
     am571x-idk.dtb \
+    ti/am571x-idk-touchscreen.dtbo \
     am572x-idk.dtb \
     am574x-idk.dtb \
+    ti/am57xx-idk-osd-lcd-common.dtbo \
+    ti/am572x-idk-touchscreen.dtbo \
 "
 
 KERNEL_DEVICETREE += "${@oe.utils.conditional('ENABLE_TI_UIO_DEVICES', '1', 'am574x-idk-pru-excl-uio.dtb am572x-idk-pru-excl-uio.dtb am571x-idk-pru-excl-uio.dtb', '', d)}"
-- 
2.7.4

