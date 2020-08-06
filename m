Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.15713.1596747118729022552
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2020 13:51:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EDE0740BEF;
	Thu,  6 Aug 2020 20:51:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xpz5137ZXrOp; Thu,  6 Aug 2020 20:51:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CED1540BAB;
	Thu,  6 Aug 2020 20:51:56 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 87D80173BE2;
	Thu,  6 Aug 2020 16:51:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] conf/machine: clean up MACHINE_FEATURES for k3/j7/am65 families
Date: Thu,  6 Aug 2020 16:51:56 -0400
Message-Id: <1596747116-56637-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/include/am65xx.inc | 2 +-
 conf/machine/include/k3.inc     | 3 +--
 conf/machine/j7-evm.conf        | 2 ++
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/am65xx.inc b/conf/machine/include/am65xx.inc
index f60d166..1acb205 100644
--- a/conf/machine/include/am65xx.inc
+++ b/conf/machine/include/am65xx.inc
@@ -1,7 +1,7 @@
 require conf/machine/include/k3.inc
 SOC_FAMILY_append = ":am65xx"
 
-MACHINE_FEATURES += "touchscreen"
+MACHINE_FEATURES += "screen touchscreen gpu"
 
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS1"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
index 6b78f4c..c727d72 100644
--- a/conf/machine/include/k3.inc
+++ b/conf/machine/include/k3.inc
@@ -36,8 +36,7 @@ MACHINE_GUI_CLASS = "smallscreen"
 UBI_VOLNAME = "rootfs"
 
 # List common SoC features, may need to add touchscreen for specific machines
-MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 screen alsa ethernet pci gpu"
-# Not ready yet - dsp mmip
+MACHINE_FEATURES = "kernel26 apm usbgadget usbhost vfat ext2 alsa ethernet pci"
 
 IMAGE_FSTYPES += "tar.xz wic.xz"
 
diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
index aedfc82..ee23207 100644
--- a/conf/machine/j7-evm.conf
+++ b/conf/machine/j7-evm.conf
@@ -4,6 +4,8 @@
 
 require conf/machine/include/j7.inc
 
+MACHINE_FEATURES += "gpu"
+
 SERIAL_CONSOLES = "115200;ttyS2 115200;ttyS3"
 SERIAL_CONSOLES_CHECK = "${SERIAL_CONSOLES}"
 
-- 
2.7.4

