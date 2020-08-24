Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.58.1598290260396933470
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DB44C40C46;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SVMQeL2Y8Ecq; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C4E0340C48;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4D533174473;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 10/14] Revert "ti-xdctools: upgrade 3.55.02.22 -> 3.61.00.16"
Date: Mon, 24 Aug 2020 13:30:45 -0400
Message-Id: <1598290249-23943-11-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 4d2441931c0e3c15c59e82c084c97d4ac9bc9c29.
---
 .../{ti-xdctools_3.61.00.16.bb => ti-xdctools_3.55.02.22.bb}        | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.61.00.16.bb => ti-xdctools_3.55.02.22.bb} (49%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.61.00.16.bb b/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
similarity index 49%
rename from recipes-ti/devtools/ti-xdctools_3.61.00.16.bb
rename to recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index 9047198..7481783 100644
--- a/recipes-ti/devtools/ti-xdctools_3.61.00.16.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -1,7 +1,9 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_61_00_16"
+PV = "3_55_02_22"
+PR = "r0"
 
 LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=2e742b9757bc9ce0241aadba9f627ab8"
 
-SRC_URI[xdczip.sha256sum] = "19caf6d5ff412d48c11ba1c05b543e39f5d678203407e5f659ff306b274e7606"
+SRC_URI[xdczip.md5sum] = "bb9154d677ce4724a5eac73817b23a0f"
+SRC_URI[xdczip.sha256sum] = "bf90dfbbe298458c736d81d5631db25b335e79146923a4a50fab217e02723e7b"
-- 
2.7.4

