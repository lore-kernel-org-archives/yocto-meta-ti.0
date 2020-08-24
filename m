Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.60.1598290260502612489
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 Aug 2020 10:31:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F174B40C49;
	Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ctn_Y1N2g9hx; Mon, 24 Aug 2020 17:30:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DBBA540C55;
	Mon, 24 Aug 2020 17:30:58 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 7B958174477;
	Mon, 24 Aug 2020 13:30:56 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH 14/14] rtos,pdk,csl: bump PE where versions went backwards due to reverts
Date: Mon, 24 Aug 2020 13:30:49 -0400
Message-Id: <1598290249-23943-15-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598290249-23943-1-git-send-email-denis@denix.org>
References: <1598290249-23943-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk-fetch.bbclass                  | 1 +
 recipes-bsp/common-csl-ip/common-csl-ip.inc   | 2 +-
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb          | 2 +-
 recipes-ti/bios/ti-sysbios_6.76.03.01.bb      | 1 +
 recipes-ti/devtools/ti-cgt-arm_18.12.5.bb     | 1 +
 recipes-ti/devtools/ti-cgt7x_1.2.0.bb         | 2 ++
 recipes-ti/devtools/ti-xdctools_3.55.02.22.bb | 1 +
 recipes-ti/ndk/ti-ndk_3.61.01.01.bb           | 1 +
 recipes-ti/ns/ti-ns_2.60.01.06.bb             | 1 +
 9 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 7a27e37..0c9879b 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -6,6 +6,7 @@ TI_PDK_SRCREV ?= "a1ace885998e9adbcbbd0abf8b9ded6ba9ec54ff"
 TI_PDK_VERSION ?= "2020.5.6"
 
 PV = "${TI_PDK_VERSION}"
+PE = "2"
 
 TI_PDK_COMP ?= ""
 TI_PDK_COMP_PATH = "${@'${TI_PDK_COMP}'.replace('.','/')}"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index a8921ae..23586fd 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -6,7 +6,7 @@ COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
 
 PV = "03.03.00.17B"
 INC_PR = "r0"
-PE = "1"
+PE = "2"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
 CSL_GIT_PROTOCOL ="git"
diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 4f6ae89..380c274 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -18,7 +18,7 @@ SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 S = "${WORKDIR}/git"
 
 PV = "3.00.15.00"
-PR = "r5"
+PR = "r7"
 
 require recipes-ti/includes/ti-paths.inc
 
diff --git a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb b/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
index 8ebe2f3..d242510 100644
--- a/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
+++ b/recipes-ti/bios/ti-sysbios_6.76.03.01.bb
@@ -1,5 +1,6 @@
 require recipes-ti/bios/ti-sysbios.inc
 
+PE = "1"
 PV = "6_76_03_01"
 PR = "r0"
 
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
index 8b496f4..81384d5 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.5.bb
@@ -10,6 +10,7 @@ require recipes-ti/includes/ti-paths.inc
 
 S = "${WORKDIR}/ti-cgt-arm-${PV}"
 
+PE = "1"
 PR = "r0"
 
 SRC_URI = "http://software-dl.ti.com/codegen/esd/cgt_public_sw/TMS470/${PV}.LTS/${BINFILE};name=${BINFILE_NAME}"
diff --git a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
index 09178af..cbdac1e 100644
--- a/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
+++ b/recipes-ti/devtools/ti-cgt7x_1.2.0.bb
@@ -17,6 +17,8 @@ require recipes-ti/includes/ti-paths.inc
 COMPATIBLE_HOST = "x86_64.*-linux"
 COMPATIBLE_HOST_class-target = "null"
 
+PE = "1"
+
 BINFILE = "ti_cgt_c7000_${PV}.STS_linux_installer_x86.bin"
 BINFILE_NAME = "cgt7x_x86_installer"
 
diff --git a/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb b/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
index 7481783..6c3fdeb 100644
--- a/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
+++ b/recipes-ti/devtools/ti-xdctools_3.55.02.22.bb
@@ -1,5 +1,6 @@
 require recipes-ti/devtools/ti-xdctools-core.inc
 
+PE = "1"
 PV = "3_55_02_22"
 PR = "r0"
 
diff --git a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb b/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
index f120f2f..0cf8abb 100644
--- a/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
+++ b/recipes-ti/ndk/ti-ndk_3.61.01.01.bb
@@ -1,5 +1,6 @@
 require ti-ndk.inc
 
+PE = "1"
 PV = "3_61_01_01"
 PR = "r0"
 
diff --git a/recipes-ti/ns/ti-ns_2.60.01.06.bb b/recipes-ti/ns/ti-ns_2.60.01.06.bb
index d86fcd5..36a9003 100644
--- a/recipes-ti/ns/ti-ns_2.60.01.06.bb
+++ b/recipes-ti/ns/ti-ns_2.60.01.06.bb
@@ -1,5 +1,6 @@
 require ti-ns.inc
 
+PE = "1"
 PV = "2_60_01_06"
 PR = "r0"
 SRC_URI = "http://software-dl.ti.com/targetcontent/ns/${PV}/exports/ns_${PV}.zip;name=nszip"
-- 
2.7.4

