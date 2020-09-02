Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.2078.1599031402833711998
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 02 Sep 2020 00:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 1FA9440C23;
	Wed,  2 Sep 2020 07:23:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9RQ0IJfFeQUu; Wed,  2 Sep 2020 07:23:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 02ACC40AB7;
	Wed,  2 Sep 2020 07:23:20 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 611C817408E;
	Wed,  2 Sep 2020 03:23:20 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [dunfell/master][PATCH] ti-rtos-firmware/metadata: update to 07.01.00.10 version
Date: Wed,  2 Sep 2020 03:23:20 -0400
Message-Id: <1599031400-41921-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 10 +++++-----
 recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
index 9bfbe74..b0c4ac1 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
@@ -17,8 +17,8 @@ include ${DEPLOY_DIR_IMAGE}/metadata.inc
 
 # Set some defaults for when metadata.inc is not available
 DEFAULT_RTOS_FAMILY = "jacinto"
-DEFAULT_RTOS_VERSION = "07_01_00_02"
-DEFAULT_RTOS_VERSION_DOT = "07.01.00.02"
+DEFAULT_RTOS_VERSION = "07_01_00_10"
+DEFAULT_RTOS_VERSION_DOT = "07.01.00.10"
 
 DEFAULT_RTOS_SOC = "undefined"
 DEFAULT_RTOS_SOC_j7 = "j721e"
@@ -35,9 +35,9 @@ DEFAULT_FIRMWARE_URL = "file://empty"
 DEFAULT_FIRMWARE_URL_k3 = "${CORESDK_RTOS_WEBLINK}/${DEFAULT_FIRMWARE_FILE}"
 
 DEFAULT_FIRMWARE_SHA256SUM = "unknown"
-DEFAULT_FIRMWARE_SHA256SUM_j7 = "e1e2eb0086a28468f1bb4b796571dcf1bfa23aedbb092bd02227e777a078afe3"
-DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "218e51739c53e306cc61bbb705b3d8eeae3afb63869f2aa82a4c804f7847bd63"
-DEFAULT_FIRMWARE_SHA256SUM_am65xx = "37188564fbb8420ba9dadb74ecf05b3aac2bf39a0e72c18c23272a141e69ace7"
+DEFAULT_FIRMWARE_SHA256SUM_j7 = "ee5fdc0d7257b1e14444a8dbb846975a6f6a189bedf2ace0f03f82c5229081fc"
+DEFAULT_FIRMWARE_SHA256SUM_j7200-evm = "ae30e4c271d4ba66c352e8601d6473f084a7f7c287fc02fc283bb3031ee41c63"
+DEFAULT_FIRMWARE_SHA256SUM_am65xx = "c455abeb04a0a4984a33349be56d24f8f718c0dbd4bfc2341ce7e6582a3de1e2"
 
 # Use weak assignment for CORESDK_RTOS_* variables to use defaults if not yet set
 CORESDK_RTOS_FAMILY ?= "${DEFAULT_RTOS_FAMILY}"
diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
index 564a54e..5aace1b 100644
--- a/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
+++ b/recipes-ti/ti-rtos-bin/ti-rtos-metadata.bb
@@ -17,7 +17,7 @@ PLAT_SFX_am65xx = "/am65xx"
 # Use weak assignment to set defaults to TI_RTOS_METADATA_* variables
 TI_RTOS_METADATA_URI ?= "git://git.ti.com/processor-sdk/coresdk_rtos_releases.git"
 TI_RTOS_METADATA_PROTOCOL ?= "git"
-TI_RTOS_METADATA_SRCREV ?= "2290c123a0c4ba4804d794c39532296a9c7b9587"
+TI_RTOS_METADATA_SRCREV ?= "8c3ad87c6d20070dd4caee7e6ce36a122f44d799"
 TI_RTOS_METADATA_BRANCH ?= "master"
 TI_RTOS_METADATA_DIR ?= "${PLAT_SFX}"
 TI_RTOS_METADATA_FILE ?= "${S}${TI_RTOS_METADATA_DIR}/metadata.inc"
-- 
2.7.4

