Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.165.1596643928576539535
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CF74240C34;
	Wed,  5 Aug 2020 16:12:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYGvPoVmf9Rg; Wed,  5 Aug 2020 16:12:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E1EB140C2B;
	Wed,  5 Aug 2020 16:12:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id DA274170D09;
	Wed,  5 Aug 2020 12:12:04 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/4] linux-ti-staging: update to the latest
Date: Wed,  5 Aug 2020 12:12:00 -0400
Message-Id: <1596643923-30297-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index 87c64c5..f25a832 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "92c1547f2d83a4a75a1181a88631ef2d64f1e0dd"
+SRCREV = "8b406259d03ff67bbe45cdceb304ab6be2d4fc68"
 PV = "5.4.52+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 28dedcc..b76542a 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,7 +61,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "41c32273d7f5666a5637a109ec004fd746d5efac"
+SRCREV = "f90a28cd61121005c9b9b711a0198ef79d415caa"
 PV = "5.4.52+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.7.4

