Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.1616.1586202248428620887
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 12:44:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BB1FA40BA3;
	Mon,  6 Apr 2020 19:44:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eM470QCojTsf; Mon,  6 Apr 2020 19:44:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3AD7940A3A;
	Mon,  6 Apr 2020 19:44:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 778A716E1CC;
	Mon,  6 Apr 2020 15:44:05 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH] ti-img-rogue-umlibs: drop RDEPENDS on python-core
Date: Mon,  6 Apr 2020 15:44:05 -0400
Message-Id: <1586202245-53617-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

* Python2 is deprecated
* It doesn't seem there's still a run-time dependency on Python2

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
index 0e0335b..ce92bb1 100644
--- a/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
+++ b/recipes-graphics/libgles/ti-img-rogue-umlibs_1.10.5371573.bb
@@ -26,7 +26,6 @@ PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 
 DEPENDS += "libdrm wayland expat"
 RDEPENDS_${PN} += "bash"
-RDEPENDS_${PN} += "python-core"
 RDEPENDS_${PN} += "wayland expat"
 
 RPROVIDES_${PN} = "libegl libgles1 libgles2 libgbm"
-- 
2.7.4

