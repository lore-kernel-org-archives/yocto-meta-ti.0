Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8581.1589962340219320714
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A6B5F40C43;
	Wed, 20 May 2020 08:12:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KiCIeTvaNNfn; Wed, 20 May 2020 08:12:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9162F40C1E;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E1D631731FF;
	Wed, 20 May 2020 04:12:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 3/8] ti-ns: upgrade 2.60.01.06 -> 2.75.00.17
Date: Wed, 20 May 2020 04:11:43 -0400
Message-Id: <1589962308-54665-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589962308-54665-1-git-send-email-denis@denix.org>
References: <1589962308-54665-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

License change due to year update.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ns/{ti-ns_2.60.01.06.bb => ti-ns_2.75.00.17.bb} | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename recipes-ti/ns/{ti-ns_2.60.01.06.bb => ti-ns_2.75.00.17.bb} (43%)

diff --git a/recipes-ti/ns/ti-ns_2.60.01.06.bb b/recipes-ti/ns/ti-ns_2.75.00.17.bb
similarity index 43%
rename from recipes-ti/ns/ti-ns_2.60.01.06.bb
rename to recipes-ti/ns/ti-ns_2.75.00.17.bb
index d86fcd5..0d0bb54 100644
--- a/recipes-ti/ns/ti-ns_2.60.01.06.bb
+++ b/recipes-ti/ns/ti-ns_2.75.00.17.bb
@@ -1,13 +1,12 @@
 require ti-ns.inc
 
-PV = "2_60_01_06"
-PR = "r0"
+PV = "2_75_00_17"
+
 SRC_URI = "http://software-dl.ti.com/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
 
-LIC_FILES_CHKSUM = "file://manifest_ns_${PV}.html;md5=e15dc261b0ef14c6fbabba24abcde4f0"
+LIC_FILES_CHKSUM = "file://manifest_ns_${PV}.html;md5=d6a172fb0625f2ddf7d0cbfded273898"
 
-SRC_URI[nszip.md5sum] = "b78d86423e9c4d148be5fba5903cc2c7"
-SRC_URI[nszip.sha256sum] = "f66b2fda6ab02585020e67d84897305209f3e141847581a214ccf123c3f15f00"
+SRC_URI[nszip.sha256sum] = "612cbaf9b91c978b39cf370f7ef721596c36141575ca74da76b025beef4d9a03"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4

