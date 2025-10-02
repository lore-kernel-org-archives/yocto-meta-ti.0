Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AF7CAC5B0
	for <webhook@archiver.kernel.org>; Thu,  2 Oct 2025 13:54:58 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.9267.1759413296485441769
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 02 Oct 2025 06:54:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J0UNLnkN;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: afd@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 592Dstii3348614;
	Thu, 2 Oct 2025 08:54:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759413295;
	bh=/WN92GFdy5ZPTgYzjqGqy+sHWL+ifeUsn/MnURhOzkQ=;
	h=From:To:CC:Subject:Date;
	b=J0UNLnkNfCjgVKxAUs7dCmVfFwcA3enx8413YzL78joVkEsG9nBl79JinrhQYU3R1
	 Vcpd9KHk9xeXf1hVU6lTchUA0Oi/yZYN+dWg9in4P4pkYJvhLu7QtHbx7kPieV/EyF
	 aozRuz75npqZgzHLEPMYPHXiJT8POMOFYsDDGzks=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 592Dst4j1273494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 2 Oct 2025 08:54:55 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 2
 Oct 2025 08:54:55 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 2 Oct 2025 08:54:55 -0500
Received: from localhost.localdomain ([10.249.42.149])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 592Dsssw2179255;
	Thu, 2 Oct 2025 08:54:54 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH 1/4] meta-ti-extras: gdbc6x: Simplify for DRA7xx only build
Date: Thu, 2 Oct 2025 08:54:50 -0500
Message-ID: <20251002135453.1820662-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Oct 2025 13:54:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19094

This recipe is already only compatible with the DRA7xx machine, so
no need to set PLATFORM based on the only possibility. This then
allows us to directly set the compile flags for the same. And now
that the package does not change based on the machine, remove the
PACKAGE_ARCH line.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../recipes-devtools/gdbc6x/gdbserver-c6x_git.bb          | 8 ++------
 .../gdbc6x/gdbserverproxy-module-drv_git.bb               | 8 ++------
 2 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
index 6c538817..c73fb031 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserver-c6x_git.bb
@@ -8,10 +8,9 @@ PR = "${INC_PR}.0"
 
 S:append = "/gdbserver-c6x/src"
 
-PLATFORM = ""
-PLATFORM:dra7xx = "DRA7xx_PLATFORM"
+COMPATIBLE_MACHINE = "dra7xx"
 
-EXTRA_OEMAKE = "PLATFORM=${PLATFORM}"
+EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM"
 
 export XDAIS_DIR = "${XDAIS_INSTALL_DIR}"
 export FC_DIR = "${FC_INSTALL_DIR}"
@@ -33,9 +32,6 @@ do_install() {
     cp -f ../lib/* ${D}${datadir}/ti/gdbc6x/lib
 }
 
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 FILES:${PN}-dev += "\
     ${datadir}/ti/gdbc6x \
 "
diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
index 2ee97269..fcca0bbe 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbserverproxy-module-drv_git.bb
@@ -13,10 +13,9 @@ S:append = "/kernel_module/gdbproxy-mod"
 
 inherit module
 
-PLATFORM = ""
-PLATFORM:dra7xx = "DRA7xx_PLATFORM"
+COMPATIBLE_MACHINE = "dra7xx"
 
-EXTRA_OEMAKE = "PLATFORM=${PLATFORM} KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
+EXTRA_OEMAKE = "PLATFORM=DRA7xx_PLATFORM KVERSION=${KERNEL_VERSION} KERNEL_SRC=${STAGING_KERNEL_DIR}"
 
 # The following is to prevent an unused configure.ac from erroneously
 # triggering the QA check for gettext.
@@ -25,9 +24,6 @@ do_configure() {
     :
 }
 
-COMPATIBLE_MACHINE = "dra7xx"
-PACKAGE_ARCH = "${MACHINE_ARCH}"
-
 include gdbc6x.inc
 
 KERNEL_MODULE_AUTOLOAD += "gdbserverproxy"
-- 
2.39.2


