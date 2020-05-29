Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.2825.1590776516189813849
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 29 May 2020 11:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 456B940C14;
	Fri, 29 May 2020 18:21:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iWD-cZirVA07; Fri, 29 May 2020 18:21:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4627409DE;
	Fri, 29 May 2020 18:21:53 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D6376173170;
	Fri, 29 May 2020 14:21:52 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-sci-fw: update to 2020.04a and 07.00.00.004 tag
Date: Fri, 29 May 2020 14:21:52 -0400
Message-Id: <1590776512-31012-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{ti-sci-fw-source_2020.04.bb => ti-sci-fw-source_2020.04a.bb}     | 0
 recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.04.bb => ti-sci-fw_2020.04a.bb} | 0
 .../ti-sci-fw/{ti-sci-fw_2020.04.inc => ti-sci-fw_2020.04a.inc}       | 4 ++--
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw-source_2020.04.bb => ti-sci-fw-source_2020.04a.bb} (100%)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.04.bb => ti-sci-fw_2020.04a.bb} (100%)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.04.inc => ti-sci-fw_2020.04a.inc} (79%)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04a.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.04a.bb
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.bb
similarity index 100%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.bb
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.inc
similarity index 79%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.inc
index 429d077..e785ce0 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04a.inc
@@ -3,9 +3,9 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
-SRCREV = "6b02b1ea07da65a68444e86439ad5b031e9fd5a2"
+SRCREV = "c8decf64be551dfd1244cd1d231a97eb2255fb80"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "a7d3909ed8ae23a7c90f7ef821713a8b0c3c061d"
+SRCREV_imggen = "d9a550b91ec95d06a80f2ccc6dd829815ba35d88"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4

