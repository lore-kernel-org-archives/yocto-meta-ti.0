Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2761.1586205429948076768
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 349D740C32;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pBeRz6eLgPqH; Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 07FFC40A3A;
	Mon,  6 Apr 2020 20:37:07 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 9A74817126C;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 1/8] libdce: cleanup SUMMARY
Date: Mon,  6 Apr 2020 16:36:58 -0400
Message-Id: <1586205425-55562-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.14.00.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.14.00.bb b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
index 4d03242..a82644a 100644
--- a/recipes-multimedia/libdce/libdce_3.00.14.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
+SUMMARY = "Library for remotely invoking HW accelerated codecs on IVA-HD"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
 
-- 
2.7.4

