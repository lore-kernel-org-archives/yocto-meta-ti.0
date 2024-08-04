Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 796BCC3DA64
	for <webhook@archiver.kernel.org>; Sun,  4 Aug 2024 16:49:31 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.29739.1722790168028540884
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Aug 2024 09:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=No6SRXKG;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 474GnRVh019575;
	Sun, 4 Aug 2024 11:49:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722790167;
	bh=MHbg+fIxg//KUs04FeXGiou2WglwyHH92AqTDPUoIDQ=;
	h=From:To:Subject:Date;
	b=No6SRXKGJOjgFsBa6b9G3d4axtvlcWz2GAC8DVRUBBmjlsVEyvelOW+31uC3NndTn
	 cKfukd+4+afCW9EtmNlsokF0m/xg5jyELmn7OO3YsNdjztc7GvBzK54pZRvyaiWqXN
	 WeOebJcgJDfmZFPID9q1qUK8zSt+tkR6fQNSEEM4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 474GnRfK030978
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 Aug 2024 11:49:27 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 4
 Aug 2024 11:49:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 4 Aug 2024 11:49:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 474GnQ04069742;
	Sun, 4 Aug 2024 11:49:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1saeQA-000458-Jv; Sun, 04 Aug 2024 11:49:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] debugss-module-drv: Fix compile failure under kernel v6.10
Date: Sun, 4 Aug 2024 11:49:26 -0500
Message-ID: <20240804164926.15650-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sun, 04 Aug 2024 16:49:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17919

A compile error has apperaed when building againt the v6.10 kernel.

git/debugss_module/debugss-mod/debugss_kmodule.c:1149:34: error: array type has incomplete element type 'struct of_device_id'
 1149 | static const struct of_device_id dra7xx_debugss_of_match[] = {
      |                                  ^~~~~~~~~~~~~~~~~~~~~~~

The easy fix is just to add an include for the header that defines the
missing struct.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../dsptop/debugss-module-drv_git.bb          |  2 ++
 ...le-Add-include-for-mod_devicetable.h.patch | 33 +++++++++++++++++++
 2 files changed, 35 insertions(+)
 create mode 100644 meta-ti-extras/recipes-bsp/dsptop/files/0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch

diff --git a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
index 62b4645c..81e544f7 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/debugss-module-drv_git.bb
@@ -17,3 +17,5 @@ COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 include dsptop.inc
+
+SRC_URI += "file://0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch"
diff --git a/meta-ti-extras/recipes-bsp/dsptop/files/0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch b/meta-ti-extras/recipes-bsp/dsptop/files/0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch
new file mode 100644
index 00000000..89cfe1cd
--- /dev/null
+++ b/meta-ti-extras/recipes-bsp/dsptop/files/0001-debugss_kmodule-Add-include-for-mod_devicetable.h.patch
@@ -0,0 +1,33 @@
+From 5a514f6a6bb1c49bdbaf8eabc1776f54851227af Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Sun, 4 Aug 2024 11:17:28 -0500
+Subject: [PATCH] debugss_kmodule: Add include for mod_devicetable.h
+
+Add include for <linux/mod_devicetable.h> to fix compile error:
+
+git/debugss_module/debugss-mod/debugss_kmodule.c:1149:34: error:
+array type has incomplete element type 'struct of_device_id'
+
+Upstream-Status: Inactive-Upstream
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ debugss_kmodule.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/debugss_kmodule.c b/debugss_kmodule.c
+index 6fac61d..9e084eb 100644
+--- a/debugss_kmodule.c
++++ b/debugss_kmodule.c
+@@ -26,6 +26,8 @@
+ #include <linux/of_device.h>
+ #include "debugss_kmodule.h"
+ 
++#include <linux/mod_devicetable.h>
++
+ /* un-comment the line below to enable printing for kernel debug messages */
+ //#define DEBUGSS_DRV_DEBUG
+ 
+-- 
+2.17.1
+
-- 
2.17.1


