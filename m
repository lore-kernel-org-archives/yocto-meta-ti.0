Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1249.1635795195322343409
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E86F40C85
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yEbLP6O0cJOW for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3F0BA40C79
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 01DCA1746B6
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:13 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 06/22] conf: dra7xx-evm: ReIntroduce existent dtb* for 5.10
Date: Mon,  1 Nov 2021 15:32:56 -0400
Message-Id: <1635795192-43144-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This reverts commit 8bdfe1413c00e0c55132989dafcf8d91827999c3.
Introduces existent dtb and dtbo for dra7x

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/dra7xx-evm.conf | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/conf/machine/dra7xx-evm.conf b/conf/machine/dra7xx-evm.conf
index ad4b026..db4a5e1 100644
--- a/conf/machine/dra7xx-evm.conf
+++ b/conf/machine/dra7xx-evm.conf
@@ -10,10 +10,18 @@ SERIAL_CONSOLES = "115200;ttyS0"
 
 KERNEL_DEVICETREE = " \
     dra7-evm.dtb \
+    ti/dra7x-evm-osd-lcd-common.dtbo \
     dra71-evm.dtb \
+    dra71-evm-nand.dtb \
+    ti/dra71-evm-lcd-auo-g101evn01.0.dtbo \
     dra72-evm.dtb \
     dra72-evm-revc.dtb \
+    ti/dra72-evm-touchscreen.dtbo \
+    ti/dra74-evm-touchscreen.dtbo \
     dra76-evm.dtb \
+    ti/dra76-evm-tfp410.dtbo \
+    ti/lcd-osd101t2045.dtbo \
+    ti/lcd-osd101t2587.dtbo \
 "
 
 UBOOT_MACHINE = "dra7xx_evm_config"
-- 
2.7.4

