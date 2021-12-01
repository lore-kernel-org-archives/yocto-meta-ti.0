Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1357.1638401901225899375
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Dec 2021 15:38:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 835A240C76
	for <meta-ti@lists.yoctoproject.org>; Wed,  1 Dec 2021 23:38:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id auKrl1mHYNhi for <meta-ti@lists.yoctoproject.org>;
	Wed,  1 Dec 2021 23:38:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 7527B40BEB
	for <meta-ti@lists.yoctoproject.org>; Wed,  1 Dec 2021 23:38:19 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id B7F281746D5;
	Wed,  1 Dec 2021 18:38:18 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denis@denix.org>
Subject: [master][PATCH] prusw-fw-am65x-sr2: update with the new override syntax
Date: Wed,  1 Dec 2021 18:38:18 -0500
Message-Id: <1638401898-24444-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

This got accidentally merged from Dunfell with the old syntax, fix it.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
index 8cb450a..2d0d3f9 100644
--- a/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
+++ b/recipes-bsp/prusw-fw/prusw-fw-am65x-sr2_git.bb
@@ -29,6 +29,6 @@ do_install() {
 	done
 }
 
-FILES_${PN} = "${base_libdir}/firmware"
+FILES:${PN} = "${base_libdir}/firmware"
 
-INSANE_SKIP_${PN} = "arch"
+INSANE_SKIP:${PN} = "arch"
-- 
2.7.4

