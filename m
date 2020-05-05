Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.19918.1588640534587258199
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 04 May 2020 18:02:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7E3B740A6E;
	Tue,  5 May 2020 01:02:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xnhohVLNGO1t; Tue,  5 May 2020 01:02:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 67DA540ADE;
	Tue,  5 May 2020 01:02:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 28650172D0C;
	Mon,  4 May 2020 21:02:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 2/2] am65xx-evm.conf: add SR1 DTB, list DTBs one-per-line for easy patching
Date: Mon,  4 May 2020 21:02:11 -0400
Message-Id: <1588640531-6213-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588640531-6213-1-git-send-email-denis@denix.org>
References: <1588640531-6213-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/am65xx-evm.conf | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/conf/machine/am65xx-evm.conf b/conf/machine/am65xx-evm.conf
index 62fa360..e5766f1 100644
--- a/conf/machine/am65xx-evm.conf
+++ b/conf/machine/am65xx-evm.conf
@@ -12,10 +12,15 @@ SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
 KERNEL_DEVICETREE = " \
-    ti/k3-am654-base-board.dtb ti/k3-am654-gp.dtbo \
-    ti/k3-am654-evm-hdmi.dtbo ti/k3-am654-idk.dtbo \
-    ti/k3-am654-evm-oldi-lcd1evm.dtbo ti/k3-am654-evm-tc358876.dtbo \
-    ti/k3-am654-pcie-usb2.dtbo ti/k3-am654-pcie-usb3.dtbo \
+    ti/k3-am654-base-board.dtb \
+    ti/k3-am654-base-board-sr1.dtb \
+    ti/k3-am654-gp.dtbo \
+    ti/k3-am654-idk.dtbo \
+    ti/k3-am654-evm-hdmi.dtbo \
+    ti/k3-am654-evm-oldi-lcd1evm.dtbo \
+    ti/k3-am654-evm-tc358876.dtbo \
+    ti/k3-am654-pcie-usb2.dtbo \
+    ti/k3-am654-pcie-usb3.dtbo \
     ti/k3-am654-base-board-jailhouse.dtbo \
     ti/k3-am654-evm-prupwm.dtbo \
 "
-- 
2.7.4

