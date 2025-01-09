Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D17E77197
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 17:16:56 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.2442.1736443014280260639
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jan 2025 09:16:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RHooXfXu;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 509HGqqC3292742
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 11:16:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736443013;
	bh=OZIp2X3osLAZy7VKpD9j8vVgM1wBj6rw4IFhZUDu9Nc=;
	h=From:To:Subject:Date;
	b=RHooXfXu2EZX833UM8DVmxfjzHgYp+gngJCBnujBaTT8hx8lEHEt7AYYCM4qZ96hF
	 nyP4sdQSj0Dme5gg9GARbhE6ZnpnXxp3VeJA1qncrJli7Kul6GD9JP4FNArIqj+o6z
	 XtlhSPC/wIoLJ91fp1rW75sjq2UKHa8Fc6o5X+F0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 509HGqa5014938
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Jan 2025 11:16:52 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 9
 Jan 2025 11:16:52 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 9 Jan 2025 11:16:52 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 509HGqRw092532;
	Thu, 9 Jan 2025 11:16:52 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tVw9M-0000nT-CD; Thu, 09 Jan 2025 11:16:52 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] libdce: Fix compile errors
Date: Thu, 9 Jan 2025 11:16:52 -0600
Message-ID: <20250109171652.3024-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 09 Jan 2025 17:16:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18173

Added a patch to fix some compile errors:

../git/memplugin_linux.c: In function 'memplugin_alloc':
../git/memplugin_linux.c:69:9: error: implicit declaration of function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
   69 |         dsp_dce_buf_lock(1, &(h->dma_buf_fd));
      |         ^~~~~~~~~~~~~~~~
../git/memplugin_linux.c:71:9: error: implicit declaration of function 'dce_buf_lock' [-Wimplicit-function-declaration]
   71 |         dce_buf_lock(1, &(h->dma_buf_fd));
      |         ^~~~~~~~~~~~
../git/memplugin_linux.c: In function 'memplugin_free':
../git/memplugin_linux.c:91:17: error: implicit declaration of function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
   91 |                 dsp_dce_buf_unlock(1, &(h->dma_buf_fd));
      |                 ^~~~~~~~~~~~~~~~~~
../git/memplugin_linux.c:93:17: error: implicit declaration of function 'dce_buf_unlock' [-Wimplicit-function-declaration]
   93 |                 dce_buf_unlock(1, &(h->dma_buf_fd));
      |                 ^~~~~~~~~~~~~~
../git/memplugin_linux.c:95:13: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   95 |             close(h->dma_buf_fd);
      |             ^~~~~
      |             pclose

and

../git/libdce_linux.c: In function 'dce_deinit':
../git/libdce_linux.c:90:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   90 |         close(OmapDrm_FD);
      |         ^~~~~
      |         pclose

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../files/0001-linux-Fix-compile-errors.patch | 70 +++++++++++++++++++
 .../libdce/libdce_3.00.15.00.bb               |  5 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compile-errors.patch

diff --git a/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compile-errors.patch b/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compile-errors.patch
new file mode 100644
index 00000000..aaee694d
--- /dev/null
+++ b/meta-ti-extras/recipes-multimedia/libdce/files/0001-linux-Fix-compile-errors.patch
@@ -0,0 +1,70 @@
+From 23db5f29715b771b8557703f1eea7f1502796d5d Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Thu, 9 Jan 2025 10:34:17 -0600
+Subject: [PATCH] linux: Fix compile errors
+
+Fix the following compile errors:
+
+../git/memplugin_linux.c:69:9: error: implicit declaration of function 'dsp_dce_buf_lock' [-Wimplicit-function-declaration]
+   69 |         dsp_dce_buf_lock(1, &(h->dma_buf_fd));
+      |         ^~~~~~~~~~~~~~~~
+../git/memplugin_linux.c:71:9: error: implicit declaration of function 'dce_buf_lock' [-Wimplicit-function-declaration]
+   71 |         dce_buf_lock(1, &(h->dma_buf_fd));
+      |         ^~~~~~~~~~~~
+../git/memplugin_linux.c: In function 'memplugin_free':
+../git/memplugin_linux.c:91:17: error: implicit declaration of function 'dsp_dce_buf_unlock' [-Wimplicit-function-declaration]
+   91 |                 dsp_dce_buf_unlock(1, &(h->dma_buf_fd));
+      |                 ^~~~~~~~~~~~~~~~~~
+../git/memplugin_linux.c:93:17: error: implicit declaration of function 'dce_buf_unlock' [-Wimplicit-function-declaration]
+   93 |                 dce_buf_unlock(1, &(h->dma_buf_fd));
+      |                 ^~~~~~~~~~~~~~
+../git/memplugin_linux.c:95:13: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+   95 |             close(h->dma_buf_fd);
+      |             ^~~~~
+      |             pclose
+
+and
+
+../git/libdce_linux.c: In function 'dce_deinit':
+../git/libdce_linux.c:90:9: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+   90 |         close(OmapDrm_FD);
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+
+Upstream-Status: Pending
+
+---
+ libdce_linux.c    | 2 ++
+ memplugin_linux.c | 2 ++
+ 2 files changed, 4 insertions(+)
+
+diff --git a/libdce_linux.c b/libdce_linux.c
+index 8bae002..6e4f63d 100644
+--- a/libdce_linux.c
++++ b/libdce_linux.c
+@@ -45,6 +45,8 @@
+ #include "dce_rpc.h"
+ #include "memplugin.h"
+ 
++#include <unistd.h>
++
+ #define INVALID_DRM_FD (-1)
+ 
+ static int             OmapDrm_FD  = INVALID_DRM_FD;
+diff --git a/memplugin_linux.c b/memplugin_linux.c
+index 5543a68..59b3658 100644
+--- a/memplugin_linux.c
++++ b/memplugin_linux.c
+@@ -33,6 +33,9 @@
+ #include "memplugin.h"
+ #include "dce_priv.h"
+ 
++#include "libdce.h"
++#include <unistd.h>
++
+ extern struct omap_device   *OmapDev;
+ 
+ 
+-- 
+2.17.1
+
diff --git a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
index f46d9c77..998d3ff6 100644
--- a/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
+++ b/meta-ti-extras/recipes-multimedia/libdce/libdce_3.00.15.00.bb
@@ -6,7 +6,10 @@ inherit autotools pkgconfig
 
 DEPENDS = "libdrm ti-ipc"
 
-SRC_URI = "git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master"
+SRC_URI = "\
+    git://git.ti.com/git/omapzoom/libdce.git;protocol=https;branch=master \
+    file://0001-linux-Fix-compile-errors.patch \
+"
 
 SRCREV = "ec14e1d5cea1ed3c3ea0e2b9cf1fd581acff93e3"
 
-- 
2.17.1


