Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2869.1586205432041532199
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 78C5740BA3;
	Mon,  6 Apr 2020 20:37:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XVLJisPk9qXZ; Mon,  6 Apr 2020 20:37:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 653C340C33;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id ECC65171904;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 8/8] libgal: require gc320 machine feature
Date: Mon,  6 Apr 2020 16:37:05 -0400
Message-Id: <1586205425-55562-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586205425-55562-1-git-send-email-denis@denix.org>
References: <1586205425-55562-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 9487e72..5575868 100644
--- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -3,6 +3,10 @@ HOMEPAGE = "https://git.ti.com/graphics/ti-gc320-libs"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://Manifest.html;md5=a9121e8936ace09820d23f7626daaca5"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "gc320"
+
 COMPATIBLE_MACHINE = "omap-a15"
 
 CLEANBROKEN = "1"
-- 
2.7.4

