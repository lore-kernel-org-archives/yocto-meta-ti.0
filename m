Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.54460.1597702274152400669
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 15:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5116D40C4B;
	Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NnvM-WblkWul; Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2C31A40AB7;
	Mon, 17 Aug 2020 22:11:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D579D17339B;
	Mon, 17 Aug 2020 18:11:11 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/6] ti-sci-fw: upgrade 2020.06 -> 2020.07-rc2
Date: Mon, 17 Aug 2020 18:10:56 -0400
Message-Id: <1597702261-12174-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index 4b89863..019ac9c 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,11 +3,11 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-PV = "2020.06"
+PV = "2020.07-rc2"
 
-SRCREV = "dbd8e8801ff20811981bddbb01203d91dc9f4f44"
+SRCREV = "8762ac51ba85781805d607a5df43f44e7d95e827"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "c0d6e6ebc85d9e7e4e02a7e6364cadf31c6fad0d"
+SRCREV_imggen = "060498a9bf287260431139f69767f54eff3d159c"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4

