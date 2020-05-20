Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.8579.1589962339378030987
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 May 2020 01:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CA35D40C14;
	Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qDO0A9JKI0pv; Wed, 20 May 2020 08:12:18 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id AA071403F2;
	Wed, 20 May 2020 08:12:17 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C8AC116F347;
	Wed, 20 May 2020 04:12:16 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 1/8] ti-sysbios: upgrade 6.76.03.01 -> 6.82.00.16
Date: Wed, 20 May 2020 04:11:41 -0400
Message-Id: <1589962308-54665-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

License change due to year update.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../bios/{ti-sysbios_6.76.03.01.bb => ti-sysbios_6.82.00.16.bb}   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.76.03.01.bb => ti-sysbios_6.82.00.16.bb} (50%)

diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bios/ti-sysbios_6.82.00.16.bb
similarity index 50%
rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to recipes-ti/bios/ti-sysbios_6.82.00.16.bb
index 8ebe2f3..270e9a1 100644
--- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/recipes-ti/bios/ti-sysbios_6.82.00.16.bb
@@ -1,12 +1,10 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_76_03_01"
-PR = "r0"
+PV = "6_82_00_16"
 
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=4b72066ed4cb1dd73ff2f585c428105a"
 
-SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
-SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
+SRC_URI[sysbiosbin.sha256sum] = "ce6c1ec7a80a04db95d813eea57205069adbfe200454c2c9c4001091e2b2c7fc"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
2.7.4

