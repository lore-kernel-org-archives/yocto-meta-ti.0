Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B613C87FCA
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 15:37:06 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.22518.1753457818261476770
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Jul 2025 08:36:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HVdXSIkv;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56PFatUb1759935;
	Fri, 25 Jul 2025 10:36:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753457815;
	bh=hnNhCNVxDOHJlsG7St+xImuquf+DqG3fTve5B7Els58=;
	h=From:To:Subject:Date;
	b=HVdXSIkvMPk2HIcCEA/43Nwh2jQNZpg/s/VBjL/57UYDPgMGJHvgH2Gc4SeaZiGjD
	 +oVNKilrun7DiFfytO1Dy07EtIUC83phISIIk3gkWbdG7DEkO3xylHronVHLrQxpzk
	 sPv818C+PpGkgYlhnQxJoqV0xm5Y6MqIyyddy5Bc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56PFat9p3936132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 25 Jul 2025 10:36:55 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 25
 Jul 2025 10:36:55 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 25 Jul 2025 10:36:55 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56PFat4t1950638;
	Fri, 25 Jul 2025 10:36:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1ufKTf-0001pM-9W; Fri, 25 Jul 2025 10:36:55 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2] layer.conf: Drop walnascar compatibility
Date: Fri, 25 Jul 2025 10:36:55 -0500
Message-ID: <20250725153655.6983-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Jul 2025 15:37:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18828

Since meta-ti-bsp requires the new fitImage code, we are no longer
backwards compatible with walnascar.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Fix typo in commit mesage.

 meta-beagle/conf/layer.conf    | 2 +-
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
index d036bb08..87a12268 100644
--- a/meta-beagle/conf/layer.conf
+++ b/meta-beagle/conf/layer.conf
@@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-beagle"
 BBFILE_PATTERN_meta-beagle := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-beagle = "6"
 
-LAYERSERIES_COMPAT_meta-beagle = "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-beagle = "whinlatter"
 
 LAYERDEPENDS_meta-beagle = " \
     meta-ti-bsp \
diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 10067159..f5633919 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-ti-bsp = "whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index d340c414..af82e95b 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "walnascar whinlatter"
+LAYERSERIES_COMPAT_meta-ti-extras = "whinlatter"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.17.1


