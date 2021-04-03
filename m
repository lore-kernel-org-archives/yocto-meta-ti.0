Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.25063.1617408632047157851
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 527FF40C56;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id utyEeKML4oCE; Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3B1E640C8F;
	Sat,  3 Apr 2021 00:10:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 1821517457F;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 07/11] {qmss,cppi,srio,pa,sa}-lld-test: suppress gcc10 multiple definition of fw_qmss*
Date: Fri,  2 Apr 2021 20:09:59 -0400
Message-Id: <1617408603-2482-8-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Workaround for these:
.../ti/drv/cppi/test/k2h/armv7/linux/fw_main.c:50: multiple definition of `coreNum';
./obj/k2h/cppi/test/cppi_test.o:.../ti/drv/cppi/test/src/cppi_test.c:102: first defined here
.../ti/drv/cppi/test/k2h/armv7/linux/fw_main.c:50: multiple definition of `errorCount';
./obj/k2h/cppi/test/cppi_test.o:.../ti/drv/cppi/test/src/cppi_test.c:102: first defined here
.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:85: multiple definition of `fw_passCfgVaddr';
./obj/k2h/cppi/test/cppi_test.o:.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:85: first defined here
.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:84: multiple definition of `fw_srioCfgVaddr';
./obj/k2h/cppi/test/cppi_test.o:.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:84: first defined here
.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:83: multiple definition of `fw_qmssDataVaddr';
./obj/k2h/cppi/test/cppi_test.o:.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:83: first defined here
.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:82: multiple definition of `fw_qmssCfgVaddr';
./obj/k2h/cppi/test/cppi_test.o:.../ti/drv/cppi/test/k2h/armv7/linux/fw_test.h:82: first defined here

Needs to be fixed properly later:
https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-bsp/cppi-lld/cppi-lld-test_git.bb | 2 ++
 recipes-bsp/pa-lld/pa-lld-test_git.bb     | 2 ++
 recipes-bsp/qmss-lld/qmss-lld-test_git.bb | 2 ++
 recipes-bsp/sa-lld/sa-lld-test_git.bb     | 2 ++
 recipes-bsp/srio-lld/srio-lld-test_git.bb | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
index b4f5c23..0c630b4 100644
--- a/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
+++ b/recipes-bsp/cppi-lld/cppi-lld-test_git.bb
@@ -7,6 +7,8 @@ PR = "${INC_PR}.0"
 
 CHOICELIST = "yes no"
 
+CFLAGS += "-fcommon"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	for device in ${DEVICELIST}
diff --git a/recipes-bsp/pa-lld/pa-lld-test_git.bb b/recipes-bsp/pa-lld/pa-lld-test_git.bb
index 62ec122..760f188 100644
--- a/recipes-bsp/pa-lld/pa-lld-test_git.bb
+++ b/recipes-bsp/pa-lld/pa-lld-test_git.bb
@@ -8,6 +8,8 @@ PR = "${INC_PR}.1"
 
 CHOICELIST = "yes no"
 
+CC += "-fcommon"
+
 do_compile () {
 # Now build the lld unit test examples
 	for device in ${DEVICELIST}
diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
index 77e698a..53f6dcf 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -8,6 +8,8 @@ PR = "${INC_PR}.2"
 
 CHOICELIST = "yes no"
 
+CFLAGS += "-fcommon"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	for device in ${DEVICELIST}
diff --git a/recipes-bsp/sa-lld/sa-lld-test_git.bb b/recipes-bsp/sa-lld/sa-lld-test_git.bb
index f3fa4f3..b9050b6 100644
--- a/recipes-bsp/sa-lld/sa-lld-test_git.bb
+++ b/recipes-bsp/sa-lld/sa-lld-test_git.bb
@@ -14,6 +14,8 @@ DEVICELIST_k2e  = "k2e"
 
 CHOICELIST = "no yes"
 
+CFLAGS += "-fcommon"
+
 PARALLEL_MAKE = ""
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR} SA_SRC_DIR=${S}"
 
diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
index d2a0068..ca22b7d 100644
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -7,6 +7,8 @@ PR = "${INC_PR}.0"
 
 CHOICELIST = "yes no"
 
+CFLAGS += "-fcommon"
+
 do_compile () {
 #   Now build the lld in the updated directory
 	for device in ${DEVICELIST}
-- 
2.7.4

