Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2746.1586645083094788065
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 11 Apr 2020 15:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D56340B37;
	Sat, 11 Apr 2020 22:44:42 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KVdrqFbmHOve; Sat, 11 Apr 2020 22:44:42 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 277F840A6E;
	Sat, 11 Apr 2020 22:44:40 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 60530172011;
	Sat, 11 Apr 2020 18:44:40 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] layer.conf: depend on meta-arm layer
Date: Sat, 11 Apr 2020 18:44:40 -0400
Message-Id: <1586645080-18410-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/layer.conf | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 33a7407..7848d19 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -12,7 +12,10 @@ LAYERSERIES_COMPAT_meta-ti = "sumo thud warrior zeus dunfell"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-LAYERDEPENDS_meta-ti = "core"
+LAYERDEPENDS_meta-ti = " \
+    core \
+    meta-arm \
+"
 
 SIGGEN_EXCLUDERECIPES_ABISAFE += " \
     ti-sgx-ddk-km \
-- 
2.7.4

