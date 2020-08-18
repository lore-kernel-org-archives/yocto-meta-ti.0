Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.77216.1597788545394089516
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 15:09:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A786340C35;
	Tue, 18 Aug 2020 22:09:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id peJT7gMKH4SQ; Tue, 18 Aug 2020 22:09:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8D35340AB7;
	Tue, 18 Aug 2020 22:09:03 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id D5323174463;
	Tue, 18 Aug 2020 18:09:02 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] pru-icss: revert part of the last change that moved rpmsg_lib.lib to base_libdir
Date: Tue, 18 Aug 2020 18:09:02 -0400
Message-Id: <1597788542-54667-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

As part of replacing hard-coded /lib with ${base_libdir}, rpmsg_lib.lib was
also mistakenly moved from ${libdir} to ${base_libdir}, which is incorrect
and breaks other recipes, when they try to link against this library from
${libdir}.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index eda235d..c74a15d 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -56,8 +56,8 @@ do_install() {
     install -d ${D}${base_libdir}/firmware/pru
     install -d ${D}${includedir}
     cp ${CP_ARGS} ${S}/include/* ${D}${includedir}
-    install -d ${D}${base_libdir}
-    install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${base_libdir}
+    install -d ${D}${libdir}
+    install -m 0644 ${S}/lib/rpmsg_lib.lib ${D}${libdir}
 }
 
 FILES_${PN}-staticdev = "${libdir}"
-- 
2.7.4

