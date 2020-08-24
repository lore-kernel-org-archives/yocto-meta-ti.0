Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.55.1598290259757737716
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:30:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1D4FA40A55;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMcEoS7EPuoA; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 03C5640C4F;
	Mon, 24 Aug 2020 17:30:57 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1CC0C17446F;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 06/14] Revert "edma3-lld: update to the latest"
Date: Mon, 24 Aug 2020 13:30:41 -0400
Message-Id: <1598290249-23943-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit f2419cdd2dd3bf442b7abb9101168fb6a1243a1d.
---
 recipes-bsp/edma3-lld/edma3-lld.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld.inc b/recipes-bsp/edma3-lld/edma3-lld.inc
index ea33078..34d3170 100644
--- a/recipes-bsp/edma3-lld/edma3-lld.inc
+++ b/recipes-bsp/edma3-lld/edma3-lld.inc
@@ -6,7 +6,8 @@ EDMA3_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/edma3_lld.git"
 EDMA3_LLD_GIT_PROTOCOL = "git"
 EDMA3_LLD_GIT_BRANCH = "master"
 
-EDMA3_LLD_SRCREV = "1ac9a3ff6632d5f04403d8789c3f95e0b585f7ae"
+# Below commit ID corresponds to version 2.12.05.30E
+EDMA3_LLD_SRCREV = "ce5ced2ac5eb1e0f1515288d279f5690813b5413"
 
 BRANCH = "${EDMA3_LLD_GIT_BRANCH}"
 SRC_URI = "${EDMA3_LLD_GIT_URI};protocol=${EDMA3_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-- 
2.7.4

