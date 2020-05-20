Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8620.1589962340237716991
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id ADB2F40C1E;
	Wed, 20 May 2020 08:12:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZuxEZ0N85eoc; Wed, 20 May 2020 08:12:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 93F4740C29;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 071FB173208;
	Wed, 20 May 2020 04:12:17 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 5/8] ti-xdctools: upgrade 3.55.02.22 -> 3.61.00.16
Date: Wed, 20 May 2020 04:11:45 -0400
Message-Id: <1589962308-54665-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589962308-54665-1-git-send-email-denis@denix.org>
References: <1589962308-54665-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{ti-xdctools_3.55.02.22.bb => ti-xdctools_3.61.00.16.bb}        | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename recipes-ti/devtools/{ti-xdctools_3.55.02.22.bb => ti-xdctools_3.61.00.16.bb} (49%)

diff --git a/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/recipes-ti/devtools/ti-xdctools_3.61.00.16.bb
similarity index 49%
rename from recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
rename to recipes-ti/devtools/ti-xdctools_3.61.00.16.bb
index 7481783..9047198 100644
--- a/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.61.00.16.bb
@@ -1,9 +1,7 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
-PV = "3_55_02_22"
-PR = "r0"
+PV = "3_61_00_16"
 
 LIC_FILES_CHKSUM = "file://docs/license/xdc/shelf/package.html;beginline=1;endline=140;md5=2e742b9757bc9ce0241aadba9f627ab8"
 
-SRC_URI[xdczip.md5sum] = "bb9154d677ce4724a5eac73817b23a0f"
-SRC_URI[xdczip.sha256sum] = "bf90dfbbe298458c736d81d5631db25b335e79146923a4a50fab217e02723e7b"
+SRC_URI[xdczip.sha256sum] = "19caf6d5ff412d48c11ba1c05b543e39f5d678203407e5f659ff306b274e7606"
-- 
2.7.4

