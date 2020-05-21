Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1152.1590084333394409185
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 21 May 2020 11:05:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A86AF40C40;
	Thu, 21 May 2020 18:05:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqdY2jlRh5Lm; Thu, 21 May 2020 18:05:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9122440B3E;
	Thu, 21 May 2020 18:05:31 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 3C0BA1734D8;
	Thu, 21 May 2020 14:05:29 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 10/11] ti-cgt-arm: upgrade 18.12.5 -> 20.2.0
Date: Thu, 21 May 2020 14:05:27 -0400
Message-Id: <1590084328-19033-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590084328-19033-1-git-send-email-denis@denix.org>
References: <1590084328-19033-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

License file got changed from txt to html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/devtools/{ti-cgt-arm_18.12.5.bb => ti-cgt-arm_20.2.0.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename recipes-ti/devtools/{ti-cgt-arm_18.12.5.bb => ti-cgt-arm_20.2.0.bb} (81%)

diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/recipes-ti/devtools/ti-cgt-arm_20.2.0.bb
similarity index 81%
rename from recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
rename to recipes-ti/devtools/ti-cgt-arm_20.2.0.bb
index 8b496f4..05b52e6 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_20.2.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "TI ARM Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
 LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
 
-LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=79631eb21b2e5b7190cd3ff1dfd41108"
+LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.html;md5=9ed980fae072af522545a0e5f297bca0"
 
 require recipes-ti/includes/ti-unpack.inc
 require recipes-ti/includes/ti-staging.inc
@@ -27,8 +27,7 @@ do_install() {
     cp -r ${S}/ti-cgt-arm*/. ${D}${M4_TOOLCHAIN_INSTALL_DIR_RECIPE}
 }
 
-SRC_URI[cgt_arm_installer.md5sum] = "e9e668332cf86c965b4da9d1d488426b"
-SRC_URI[cgt_arm_installer.sha256sum] = "da976143128c619a278cb4214a4295c409d100f9e65ad2f4d0d1039db7cf98f4"
+SRC_URI[cgt_arm_installer.sha256sum] = "e27b1ebae58085b1587af3016bf201b54b6ace99e9e7165c1e4a042afe4b55eb"
 
 BINFILE_NAME = "cgt_arm_installer"
 
-- 
2.7.4

