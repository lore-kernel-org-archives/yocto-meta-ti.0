Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.54038.1597702274152234502
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 15:11:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4E34A40C49;
	Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id brgHoZbvZMCj; Mon, 17 Aug 2020 22:11:13 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2F4FD40C36;
	Mon, 17 Aug 2020 22:11:12 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id E21C5174455;
	Mon, 17 Aug 2020 18:11:11 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 2/6] linux-ti-staging: update to the latest
Date: Mon, 17 Aug 2020 18:10:57 -0400
Message-Id: <1597702261-12174-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597702261-12174-1-git-send-email-denis@denix.org>
References: <1597702261-12174-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index f7c3ce5..dd9a253 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "93189093447068135d91f93aa75ee1c1239438f1"
+SRCREV = "d45c3cc47d88fe530821141e20b2683acf3cd5f1"
 PV = "5.4.54+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 75ce5ba..cf1ecc6 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "e5a461dfc65bd00558e0b40e97f678cc7fa480bd"
+SRCREV = "a32d62437eb9f2acd64a124c221de98d6f728bcc"
 PV = "5.4.54+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.7.4

