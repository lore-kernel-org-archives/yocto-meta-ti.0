Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2097.1582684412940803766
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Feb 2020 18:33:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: denys@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 472B0E016B6; Tue, 25 Feb 2020 18:33:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at https://www.dnswl.org/, low
	*      trust
	*      [64.68.198.64 listed in list.dnswl.org]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 16146E0107C
	for <meta-ti@yoctoproject.org>; Tue, 25 Feb 2020 18:33:30 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4D39540A23;
	Wed, 26 Feb 2020 02:33:30 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hGS6aE7PS4qW; Wed, 26 Feb 2020 02:33:30 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 33982409E7;
	Wed, 26 Feb 2020 02:33:29 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 5E255161A11;
	Tue, 25 Feb 2020 21:33:28 -0500 (EST)
From: "Denys Dmytriyenko" <denys@ti.com>
To: meta-ti@yoctoproject.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [zeus/master][PATCH] licenses: add Hewlett-Packard and Patrick-Powell licenses used by Code Gen tools
Date: Tue, 25 Feb 2020 21:33:26 -0500
Message-Id: <1582684406-18275-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4

Also correct ti-cgt-arm to not reference Hewlett-Packard, only Patrick-Powell,
according to included SPDX document.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 licenses/Hewlett-Packard                  | 13 +++++++++++++
 licenses/Patrick-Powell                   |  4 ++++
 recipes-ti/devtools/ti-cgt-arm_18.12.1.bb |  2 +-
 3 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 licenses/Hewlett-Packard
 create mode 100644 licenses/Patrick-Powell

diff --git a/licenses/Hewlett-Packard b/licenses/Hewlett-Packard
new file mode 100644
index 0000000..569d009
--- /dev/null
+++ b/licenses/Hewlett-Packard
@@ -0,0 +1,13 @@
+/*
+ * Copyright (c) 1994
+ * Hewlett-Packard Company
+ *
+ * Permission to use, copy, modify, distribute and sell this software
+ * and its documentation for any purpose is hereby granted without fee,
+ * provided that the above copyright notice appear in all copies and
+ * that both that copyright notice and this permission notice appear
+ * in supporting documentation.  Hewlett-Packard Company makes no
+ * representations about the suitability of this software for any
+ * purpose.  It is provided "as is" without express or implied warranty.
+ *
+ */
diff --git a/licenses/Patrick-Powell b/licenses/Patrick-Powell
new file mode 100644
index 0000000..9c6eac4
--- /dev/null
+++ b/licenses/Patrick-Powell
@@ -0,0 +1,4 @@
+Copyright Patrick Powell 1995
+This code is based on code written by Patrick Powell (papowell@astart.com)
+It may be used for any purpose as long as this notice remains intact
+on all source code distributions
diff --git a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb b/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
index e4e1c48..5e9c5f8 100644
--- a/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
+++ b/recipes-ti/devtools/ti-cgt-arm_18.12.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "TI ARM Code Generation Tools"
 HOMEPAGE = "https://www-a.ti.com/downloads/sds_support/TICodegenerationTools/download.htm"
-LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Hewlett-Packard & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
+LICENSE = "(TI-TSPA & Thai-Open-Source-Software-Center) & BSD-3-Clause & BSL-1.0 & Patrick-Powell & AFL-3.0 & MIT & BSD-2-Clause & PD & BSD-4-Clause"
 
 LIC_FILES_CHKSUM = "file://ti-cgt-arm_${PV}.LTS/README.txt;md5=ab7a61241e90fcd144a756d88294cf30"
 
-- 
2.7.4

