Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.842.1639691673803855003
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Dec 2021 13:54:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CDB6C40C4E;
	Thu, 16 Dec 2021 21:54:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvLda0FbUT9n; Thu, 16 Dec 2021 21:54:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B62E040B05;
	Thu, 16 Dec 2021 21:54:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0A1F3174714;
	Thu, 16 Dec 2021 16:54:31 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [dunfell/master][PATCH] ti-img-encode-decode: constrain ti-img-encode-decode test apps to J7
Date: Thu, 16 Dec 2021 16:54:30 -0500
Message-Id: <1639691670-29857-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Since corresponding functionality and FW only available on J7.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb | 2 ++
 recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
index 48a1753..9fb473b 100644
--- a/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/viddec-test-app_1.0.0.bb
@@ -6,6 +6,8 @@ DEPENDS = "libdrm ffmpeg"
 
 inherit autotools pkgconfig
 
+COMPATIBLE_MACHINE = "j7"
+
 PR = "r1"
 SRCREV = "94a80c8c090dbfdc7fafd4e5bb78c2091e715af2"
 
diff --git a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
index 3bb5d74..3a128b9 100644
--- a/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
+++ b/recipes-bsp/ti-img-encode-decode/videnc-test-app_1.0.0.bb
@@ -6,6 +6,8 @@ DEPENDS = "libdrm"
 
 inherit autotools pkgconfig
 
+COMPATIBLE_MACHINE = "j7"
+
 PR = "r0"
 SRCREV = "a5e7d820bea1be24f25a8369d4d4521c784f869a"
 
-- 
2.7.4

