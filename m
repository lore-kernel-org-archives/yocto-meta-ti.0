Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.8621.1589962340665101019
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 219CF40B53;
	Wed, 20 May 2020 08:12:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q118UwhYEOCb; Wed, 20 May 2020 08:12:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EB61E403F2;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1EC5717320A;
	Wed, 20 May 2020 04:12:17 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 7/8] common-csl-ip: update to REL.CORESDK.07.00.00.06
Date: Wed, 20 May 2020 04:11:47 -0400
Message-Id: <1589962308-54665-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589962308-54665-1-git-send-email-denis@denix.org>
References: <1589962308-54665-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index a8921ae..c0be200 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
 
-PV = "03.03.00.17B"
+PV = "07.00.00.06"
 INC_PR = "r0"
 PE = "1"
 
@@ -13,8 +13,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "release"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.17B"
-CSL_SRCREV = "027d26031709ad6a0e9f84625d11a3419e486467"
+# Below commit ID corresponding to "REL.CORESDK.07.00.00.06"
+CSL_SRCREV = "e97e0eb09dd120af6a55897400163b48e61726da"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
2.7.4

