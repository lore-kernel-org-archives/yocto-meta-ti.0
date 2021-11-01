Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1244.1635795195299348596
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 01 Nov 2021 12:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 46BAB40C86
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThOoHIL1TkfR for <meta-ti@lists.yoctoproject.org>;
	Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3C10540C53
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 19:33:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id EB1251746B5
	for <meta-ti@lists.yoctoproject.org>; Mon,  1 Nov 2021 15:33:12 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 05/22] conf: omap-a15: fix the dtb file path for extlinux boot
Date: Mon,  1 Nov 2021 15:32:55 -0400
Message-Id: <1635795192-43144-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635795192-43144-1-git-send-email-denis@denix.org>
References: <1635795192-43144-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

The uboot extlinux is using kernel device tree variable to populate the
dtb files. The error occurs if the device tree files are in ti folder
since there is no ti folder in deploy directory. Fix the kernel device
tree path before using in the uboot extlinux.

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 conf/machine/include/omap-a15.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/conf/machine/include/omap-a15.inc b/conf/machine/include/omap-a15.inc
index ed202f5..9a2e004 100644
--- a/conf/machine/include/omap-a15.inc
+++ b/conf/machine/include/omap-a15.inc
@@ -19,13 +19,15 @@ UBOOT_ARCH = "arm"
 UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
+DEVICETREE_FILE = "${@d.getVar('KERNEL_DEVICETREE').replace("ti/","")}"
+
 # Generate an extlinux.conf file
 UBOOT_EXTLINUX = "1"
 UBOOT_EXTLINUX_ROOT = "root=PARTUUID=${uuid}"
 UBOOT_EXTLINUX_BOOT_FILES = " \
     extlinux.conf;extlinux/extlinux.conf \
     ${KERNEL_IMAGETYPE} \
-    ${KERNEL_DEVICETREE} \
+    ${DEVICETREE_FILE} \
 "
 
 SPL_BINARY = "MLO"
-- 
2.7.4

