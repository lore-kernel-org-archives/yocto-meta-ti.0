Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D456DC04FF6
	for <webhook@archiver.kernel.org>; Tue, 16 Apr 2024 19:42:35 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.31027.1713296554127471912
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 Apr 2024 12:42:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ExOiR0zd;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43GJgX5n098356;
	Tue, 16 Apr 2024 14:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713296553;
	bh=RZVLMAs9piB7s8AbxFQuqft8VPHUwNNtZwClzzaNOj8=;
	h=From:To:Subject:Date;
	b=ExOiR0zdtP5+1VCGE8E4w7NR+BQi+ezsn4EzhnFGRSGo2aLpVTSC3kyUlE11WN9DQ
	 SCsz8G4n6DszwOmtsOkq+Kd0JLQ372n0YyH+RMlGUQNxBbVfstGvevw0M75b2gSzeC
	 5FOxBC5DxKfAdmsk1URekJPFFNxV8DbD/jVG44iw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43GJgXsa128260
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Apr 2024 14:42:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 Apr 2024 14:42:32 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 Apr 2024 14:42:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43GJgWDV046043;
	Tue, 16 Apr 2024 14:42:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rwohM-0004EF-PY; Tue, 16 Apr 2024 14:42:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] conf/layer.conf: Update LAYERSERIES_COMPAT
Date: Tue, 16 Apr 2024 14:42:32 -0500
Message-ID: <20240416194232.16215-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 Apr 2024 19:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17571

Update LAYERSERIES_COMPAT to scarthgap and styhead.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 502e355f..e87221f3 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-ti-bsp = "scarthgap styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index a05dbe5f..a8c68343 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-ti-extras = "scarthgap styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.17.1


