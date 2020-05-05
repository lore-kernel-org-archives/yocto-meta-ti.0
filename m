Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3367.1588663133290847351
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 05 May 2020 00:18:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 31E6440AF3;
	Tue,  5 May 2020 07:18:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id avmP_twS9U0m; Tue,  5 May 2020 07:18:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1567840A6E;
	Tue,  5 May 2020 07:18:51 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6B98C16ECE4;
	Tue,  5 May 2020 03:18:50 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] ti-sci-fw: update imggen SRCREV to the latest
Date: Tue,  5 May 2020 03:18:50 -0400
Message-Id: <1588663130-22105-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
index b17147a..dcfcf3a 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.04.bb
@@ -19,7 +19,7 @@ export TI_SECURE_DEV_PKG
 
 SRCREV = "6b02b1ea07da65a68444e86439ad5b031e9fd5a2"
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "79f3807e0b169f2029dec9f3a679c231f4deb625"
+SRCREV_imggen = "8cfe64e7ca5729b0fbb4930bc2fed66ddf19049f"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4

