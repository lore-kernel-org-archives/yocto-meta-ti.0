Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.3405.1637290745439602066
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 18 Nov 2021 18:59:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C988440C52
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MZT2zkZSHfYI for <meta-ti@lists.yoctoproject.org>;
	Fri, 19 Nov 2021 02:59:04 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 61EAB40C86
	for <meta-ti@lists.yoctoproject.org>; Fri, 19 Nov 2021 02:59:02 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 23A081746DA
	for <meta-ti@lists.yoctoproject.org>; Thu, 18 Nov 2021 21:59:02 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 11/20] ti-linux-fw: Add AUTOREV support for K3 Image Gen
Date: Thu, 18 Nov 2021 21:58:52 -0500
Message-Id: <1637290741-8603-12-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1637290741-8603-1-git-send-email-denis@denix.org>
References: <1637290741-8603-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

This patch brings k3 image gen under bleeding for nightly builds

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/ti-linux-fw/ti-linux-fw.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 97e5196..c59120b 100644
--- a/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -21,7 +21,9 @@ TI_LINUX_FW_SRCREV ?= "95232a584175a8ac872adf477b2dbb9ca68ba063"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
-SRCREV_imggen = "6baabef219aea0f667423f2cab2bc2d63a349488"
+
+K3_IMAGE_GEN_SRCREV ?= "6baabef219aea0f667423f2cab2bc2d63a349488"
+SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
 SRC_URI = " \
-- 
2.7.4

