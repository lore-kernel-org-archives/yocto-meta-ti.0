Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.276.1588803287787991624
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 15:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1C2EE40C2D;
	Wed,  6 May 2020 22:14:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3OUTt7R7vYYy; Wed,  6 May 2020 22:14:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8D75840C2E;
	Wed,  6 May 2020 22:14:45 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 401E3172F71;
	Wed,  6 May 2020 18:14:45 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 3/3] ti-sci-fw: update k3-image-gen to ti2020.01.00 tag
Date: Wed,  6 May 2020 18:14:44 -0400
Message-Id: <1588803284-7275-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588803284-7275-1-git-send-email-denis@denix.org>
References: <1588803284-7275-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
index dcfcf3a..add4ee9 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 
 CLEANBROKEN = "1"
-PR = "r0"
+PR = "r1"
 
 # Loaded by R5F core
 COMPATIBLE_MACHINE = "k3r5"
@@ -19,7 +19,7 @@ export TI_SECURE_DEV_PKG
 
 SRCREV = "6b02b1ea07da65a68444e86439ad5b031e9fd5a2"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "8cfe64e7ca5729b0fbb4930bc2fed66ddf19049f"
+SRCREV_imggen = "a7d3909ed8ae23a7c90f7ef821713a8b0c3c061d"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4

