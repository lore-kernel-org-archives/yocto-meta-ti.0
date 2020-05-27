Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.3575.1590604588345183113
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 27 May 2020 11:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B42FD40C06;
	Wed, 27 May 2020 18:36:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z_O2Z8X8G30z; Wed, 27 May 2020 18:36:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6E22F40A18;
	Wed, 27 May 2020 18:36:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id BD0F216FAC7;
	Wed, 27 May 2020 14:36:25 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH v2 01/11] ti-sysbios: upgrade 6.76.03.01 -> 6.82.01.19
Date: Wed, 27 May 2020 14:36:13 -0400
Message-Id: <1590604573-17492-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

License change due to year update.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - 6.82.01.19 now includes C7x hotfix needed for 6.82.00.16

 .../bios/{ti-sysbios_6.76.03.01.bb => ti-sysbios_6.82.01.19.bb}   | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)
 rename recipes-ti/bios/{ti-sysbios_6.76.03.01.bb => ti-sysbios_6.82.01.19.bb} (50%)

diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bios/ti-sysbios_6.82.01.19.bb
similarity index 50%
rename from recipes-ti/bios/ti-sysbios_6.76.03.01.bb
rename to recipes-ti/bios/ti-sysbios_6.82.01.19.bb
index 8ebe2f3..5965209 100644
--- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/recipes-ti/bios/ti-sysbios_6.82.01.19.bb
@@ -1,12 +1,10 @@
 require recipes-ti/bios/ti-sysbios.inc
 
-PV = "6_76_03_01"
-PR = "r0"
+PV = "6_82_01_19"
 
-LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=5cf40699c51b26d36fc01647c0b27fb1"
+LIC_FILES_CHKSUM = "file://manifest_bios_${PV}.html;md5=4b72066ed4cb1dd73ff2f585c428105a"
 
-SRC_URI[sysbiosbin.md5sum] = "647243209d66d5dd35503b0ec5a84ab9"
-SRC_URI[sysbiosbin.sha256sum] = "b762b7f2343d26d367f952488e529046785128005158cc921c3baef08e97116a"
+SRC_URI[sysbiosbin.sha256sum] = "4d7c6cac993e6bc601083a41a5c52089d4852544b4c38563e4320310a54882b2"
 
 TI_BIN_UNPK_CMDS = ""
 TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
2.7.4

