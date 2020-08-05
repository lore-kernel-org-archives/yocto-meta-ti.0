Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.147.1596643928583719667
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Aug 2020 09:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E2A6940C4F;
	Wed,  5 Aug 2020 16:12:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XObDezXHkaDO; Wed,  5 Aug 2020 16:12:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5F0E740C32;
	Wed,  5 Aug 2020 16:12:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0B48B173C47;
	Wed,  5 Aug 2020 12:12:05 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 4/4] ti-sci-fw: set PV inside .inc so it's easier to update 3 files
Date: Wed,  5 Aug 2020 12:12:03 -0400
Message-Id: <1596643923-30297-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1596643923-30297-1-git-send-email-denis@denix.org>
References: <1596643923-30297-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../ti-sci-fw/{ti-sci-fw-source_2020.06.bb => ti-sci-fw-source_git.bb}  | 2 +-
 recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.06.inc => ti-sci-fw.inc}          | 2 ++
 recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.06.bb => ti-sci-fw_git.bb}        | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw-source_2020.06.bb => ti-sci-fw-source_git.bb} (96%)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.06.inc => ti-sci-fw.inc} (97%)
 rename recipes-bsp/ti-sci-fw/{ti-sci-fw_2020.06.bb => ti-sci-fw_git.bb} (97%)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.06.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
similarity index 96%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.06.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
index becf893..063e72d 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw-source_2020.06.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw-source_git.bb
@@ -2,7 +2,7 @@
 # Let's take a page from gcc-source as a common recipe for all gcc stages,
 # but also to provide a single package for MAINMACHINE of all multiconfigs
 
-require recipes-bsp/ti-sci-fw/ti-sci-fw_${PV}.inc
+require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 
 SUMMARY += "- sources"
 
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.inc b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
similarity index 97%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.inc
rename to recipes-bsp/ti-sci-fw/ti-sci-fw.inc
index db2b602..4b89863 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.inc
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw.inc
@@ -3,6 +3,8 @@ SUMMARY = "TI SCI firmware (SYSFW)"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENSE.ti;md5=b5aebf0668bdf95621259288c4a46d76"
 
+PV = "2020.06"
+
 SRCREV = "dbd8e8801ff20811981bddbb01203d91dc9f4f44"
 BRANCH ?= "ti-linux-firmware"
 SRCREV_imggen = "c0d6e6ebc85d9e7e4e02a7e6364cadf31c6fad0d"
diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
similarity index 97%
rename from recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.bb
rename to recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index b558826..7f7171a 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_2020.06.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -1,4 +1,4 @@
-require recipes-bsp/ti-sci-fw/ti-sci-fw_${PV}.inc
+require recipes-bsp/ti-sci-fw/ti-sci-fw.inc
 
 DEPENDS = "openssl-native u-boot-mkimage-native dtc-native"
 
-- 
2.7.4

