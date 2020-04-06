Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.2762.1586205429963094523
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 13:37:10 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5101040BA3;
	Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FlKVNDvG0bOt; Mon,  6 Apr 2020 20:37:09 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1137A40C18;
	Mon,  6 Apr 2020 20:37:08 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BDE941718FF;
	Mon,  6 Apr 2020 16:37:07 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [master][PATCH 4/8] libulm: require dsp machine feature, cleanup
Date: Mon,  6 Apr 2020 16:37:01 -0400
Message-Id: <1586205425-55562-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586205425-55562-1-git-send-email-denis@denix.org>
References: <1586205425-55562-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/dsptop/libulm_git.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_git.bb
index 7bf7f09..47248ff 100644
--- a/recipes-bsp/dsptop/libulm_git.bb
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -1,7 +1,11 @@
-DESCRIPTION = "TI dsptop utility."
+SUMMARY = "TI Usage & Load Monitor Implementation"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://../debian/copyright;md5=309825aa8f5edfcf2c44912ac094b979"
 
+inherit features_check
+
+REQUIRED_MACHINE_FEATURES = "dsp"
+
 DEPENDS = "ti-cgt6x-native"
 PR = "${INC_PR}.0"
 
-- 
2.7.4

