Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.59.1598290260453586768
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E7DF940C48;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SrN774PZEn7R; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D428240C4C;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 6F9D9174476;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 13/14] Revert "ti-sysbios: upgrade 6.76.03.01 -> 6.82.01.19"
Date: Mon, 24 Aug 2020 13:30:48 -0400
Message-Id: <1598290249-23943-14-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 0bdb11bd04284f46c9a34efe390acd1cd85fb674.
---
 .../bios/{ti-sysbios_6.82.01.19.bb => ti-sysbios_6.76.03.01.bb}   | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.82.01.19.bb => ti-sysbios_6.76.03.01.bb} (50%)

diff --git a/recipes-ti/bios/ti-sysbios_6.82.01.19.bb b/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
similarity index 50%
rename from recipes-ti/bios/ti-sysbios_6.82.01.19.bb
rename to recipes-ti/bios/ti-sysbios_6.76.03.01.bb
index 5965209..8ebe2f3 100644
--- a/recipes-ti/bios/ti-sysbios_6.82.01.19.bb
+++ b/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
@@ -1,10 +1,12 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_82_01_19"
+PV = "6_76_03_01"
+PR = "r0"
 
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=4b72066ed4cb1dd73ff2f585c428105a"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
 
-SRC_URI[sysbiosbin.sha256sum] = "4d7c6cac993e6bc601083a41a5c52089d4852544b4c38563e4320310a54882b2"
+SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
+SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
2.7.4

