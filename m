Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1085.1590084331989111924
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 May 2020 11:05:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 663C140C3D;
	Thu, 21 May 2020 18:05:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a_1fTk5_N418; Thu, 21 May 2020 18:05:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 45AE740B3E;
	Thu, 21 May 2020 18:05:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DEE2A173205;
	Thu, 21 May 2020 14:05:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 03/11] ti-ndk: upgrade 3.61.01.01 -> 3.75.01.01
Date: Thu, 21 May 2020 14:05:20 -0400
Message-Id: <1590084328-19033-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590084328-19033-1-git-send-email-denis@denix.org>
References: <1590084328-19033-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

License change due to year update.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ndk/{ti-ndk_3.61.01.01.bb => ti-ndk_3.75.01.01.bb} | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename recipes-ti/ndk/{ti-ndk_3.61.01.01.bb => ti-ndk_3.75.01.01.bb} (38%)

diff --git a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb b/recipes-ti/ndk/ti-ndk_3.75.01.01.bb
similarity index 38%
rename from recipes-ti/ndk/ti-ndk_3.61.01.01.bb
rename to recipes-ti/ndk/ti-ndk_3.75.01.01.bb
index f120f2f..812fbb3 100644
--- a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
+++ b/recipes-ti/ndk/ti-ndk_3.75.01.01.bb
@@ -1,12 +1,10 @@
 require ti-ndk.inc
 
-PV = "3_61_01_01"
-PR = "r0"
+PV = "3_75_01_01"
 
-LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=871c716abcf52bac5a7c23154eaba3b6"
+LIC_FILES_CHKSUM = "file://manifest_ndk_${PV}.html;md5=ef952a30d0f1640e886bb4b60618f352"
 
-SRC_URI[ndkzip.md5sum] = "87f0494c9faee344fe93ae68e71ca189"
-SRC_URI[ndkzip.sha256sum] = "3bfca50367432603ebc1d53d9185302bb4fa4558ac766696f086dc7a5a2ccd29"
+SRC_URI[ndkzip.sha256sum] = "fd2318f0490a3eb342bc16812f30394107f098a12704c11cd9a5dc3d5a0bba64"
 
 INHIBIT_PACKAGE_STRIP = "1"
 INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
-- 
2.7.4

