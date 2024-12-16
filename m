Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 660DEE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 18:23:51 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.63640.1734373421795864624
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2024 10:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XXk7w/yt;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGINdBB3359909
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 12:23:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734373419;
	bh=xajiecKacj/74eHS0H+dN8JF7daebInSZ30F2xYQrZs=;
	h=From:To:Subject:Date;
	b=XXk7w/ytMzzaWJOtM0YoefNqQ+WEu58vZIm8bFbkZcwIGh3wpLI1GHccva518eLok
	 FR+UL5AAOgb1Q7+5HJXDFHEseq17jE7z7uNXOOlKh9eYd6fK2x+cxztNRttCbPQhAD
	 5dAtE2UXcyM+cMUZs48h1yZT0JO6EfB1pT0+c7xI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGINdBx103310
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 12:23:39 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 12:23:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 12:23:39 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGINdHi009886;
	Mon, 16 Dec 2024 12:23:39 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tNFkp-0005nH-6A; Mon, 16 Dec 2024 12:23:39 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] linux-ti-mainline: Update KERNEL_REPRODUCIBILITY_PATCHES for v6.12
Date: Mon, 16 Dec 2024 12:23:39 -0600
Message-ID: <20241216182339.22232-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Dec 2024 18:23:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18124

The script that sends the automated patch does not currently handle
updating the KERNEL_REPRODUCIBILITY_PATCHES variable with the changes in
the patches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...thon-Fix-compile-for-32bit-platforms.patch | 32 +++++++++++++++++++
 .../linux/linux-ti-mainline_git.bb            |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/0001-perf-python-Fix-compile-for-32bit-platforms.patch

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/0001-perf-python-Fix-compile-for-32bit-platforms.patch b/meta-ti-bsp/recipes-kernel/linux/files/0001-perf-python-Fix-compile-for-32bit-platforms.patch
new file mode 100644
index 00000000..12e12c68
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/0001-perf-python-Fix-compile-for-32bit-platforms.patch
@@ -0,0 +1,32 @@
+From a51ebf08cec81d84ac258da1c0ead139d6ddc94f Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Tue, 2 Jul 2024 11:07:14 -0500
+Subject: [master][PATCH] perf python: Fix compile for 32bit platforms
+
+The definition for perf_sample is missing on 32bit compiles:
+
+tools/perf/util/python.c:75:28: error: field 'sample' has incomplete type
+   75 |         struct perf_sample sample;
+
+Adding #include "sample.h" fixes it.
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ tools/perf/util/python.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tools/perf/util/python.c b/tools/perf/util/python.c
+index 3be882b2e845..de64ca3cf2d1 100644
+--- a/tools/perf/util/python.c
++++ b/tools/perf/util/python.c
+@@ -1,3 +1,5 @@
++#include "sample.h"
++
+ // SPDX-License-Identifier: GPL-2.0
+ #include <Python.h>
+ #include <structmember.h>
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 803db1fd..b4ec47bc 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -24,6 +24,7 @@ KERNEL_DEFCONFIG = ""
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-drivers-gpu-drm-msm-registers-improve-reproducibilit.patch \
+    file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
 "
 
 DEFCONFIG_NAME = "multi_v7_defconfig"
-- 
2.17.1


