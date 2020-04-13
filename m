Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.1251.1586804530495527241
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Apr 2020 12:02:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E4D0940C36;
	Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yCxB097JO0wx; Mon, 13 Apr 2020 19:02:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6934240C23;
	Mon, 13 Apr 2020 19:02:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BCFB9172565;
	Mon, 13 Apr 2020 15:02:06 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 04/10] traceframework: fix packaging issue due to libtraceframework.a
Date: Mon, 13 Apr 2020 15:01:57 -0400
Message-Id: <1586804523-23047-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586804523-23047-1-git-send-email-denis@denix.org>
References: <1586804523-23047-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

dwarfsrcfiles: .../work/k2hk_evm-linux-gnueabi/traceframework/01.01.01.09A-r0.0/package/usr/lib/libtraceframework.a: not a valid ELF file

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/traceframework/traceframework_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-bsp/traceframework/traceframework_git.bb b/recipes-bsp/traceframework/traceframework_git.bb
index 2b2020b..26eb81a 100644
--- a/recipes-bsp/traceframework/traceframework_git.bb
+++ b/recipes-bsp/traceframework/traceframework_git.bb
@@ -36,3 +36,5 @@ PACKAGES =+ "${PN}-test"
 
 FILES_${PN}-test = "${bindir}/tfw*.out \
                     ${bindir}/*.txt"
+
+INHIBIT_PACKAGE_STRIP_FILES = "${PKGD}${libdir}/libtraceframework.a"
-- 
2.7.4

