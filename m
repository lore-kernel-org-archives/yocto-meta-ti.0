Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.3556.1586828411011804979
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 18:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DF7B740C4C;
	Tue, 14 Apr 2020 01:40:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XThO7VrRb2Ai; Tue, 14 Apr 2020 01:40:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 53E5A40C49;
	Tue, 14 Apr 2020 01:40:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0F7A51724AA;
	Mon, 13 Apr 2020 21:40:08 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] optee: mark compatible with ti-soc platforms
Date: Mon, 13 Apr 2020 21:40:07 -0400
Message-Id: <1586828407-9032-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

May need to limit this to HS platforms in the future, but since there's
no SOC_FAMILY defined, listing them individually is rather painful now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-security/optee/optee-%.bbappend | 1 +
 1 file changed, 1 insertion(+)
 create mode 100644 recipes-security/optee/optee-%.bbappend

diff --git a/recipes-security/optee/optee-%.bbappend b/recipes-security/optee/optee-%.bbappend
new file mode 100644
index 0000000..32307e2
--- /dev/null
+++ b/recipes-security/optee/optee-%.bbappend
@@ -0,0 +1 @@
+COMPATIBLE_MACHINE_ti-soc = "ti-soc"
-- 
2.7.4

