Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F084EC04FF9
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 18:40:34 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.22039.1713379233330327224
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 11:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=MTlTL4Nj;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43HIeW5R085488;
	Wed, 17 Apr 2024 13:40:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713379232;
	bh=40A5wp5YC8KvdD0/I+4+TJJdcDYYWPTrC+VUV0hIoUA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MTlTL4NjoAB/oFnVaLH6ZH9cN0LuIZCff3Nnp5kmTK/UdbO8gliT8W0iBaxza+A/E
	 Sghwk/n9onFY2cotCs9X6M1hVbh/qSUGqOP89pdj9jXeIBXRkhL3x/lkVMuuwCu0uM
	 MlSat3ElA2ICBH5x0oi5kLg8lkF1SgQ6Frt22VFM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43HIeWDD018227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Apr 2024 13:40:32 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 Apr 2024 13:40:31 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 Apr 2024 13:40:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43HIeVP3077128;
	Wed, 17 Apr 2024 13:40:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rxACt-0004W8-PA; Wed, 17 Apr 2024 13:40:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v2 3/3] conf/layer.conf: Update LAYERSERIES_COMPAT
Date: Wed, 17 Apr 2024 13:40:31 -0500
Message-ID: <20240417184031.17308-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240417184031.17308-1-reatmon@ti.com>
References: <20240417184031.17308-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Apr 2024 18:40:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17585

Update LAYERSERIES_COMPAT to remove EOL branches and add future styhead.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Add missing nanbield in meta-ti-extras/conf/layer.conf

 meta-ti-bsp/conf/layer.conf    | 2 +-
 meta-ti-extras/conf/layer.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 502e355f..03cbd7ea 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-bsp"
 BBFILE_PATTERN_meta-ti-bsp := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-bsp = "6"
 
-LAYERSERIES_COMPAT_meta-ti-bsp = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-ti-bsp = "nanbield scarthgap styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
diff --git a/meta-ti-extras/conf/layer.conf b/meta-ti-extras/conf/layer.conf
index a05dbe5f..f2d6b250 100644
--- a/meta-ti-extras/conf/layer.conf
+++ b/meta-ti-extras/conf/layer.conf
@@ -9,7 +9,7 @@ BBFILE_COLLECTIONS += "meta-ti-extras"
 BBFILE_PATTERN_meta-ti-extras := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-ti-extras = "6"
 
-LAYERSERIES_COMPAT_meta-ti-extras = "kirkstone langdale mickledore nanbield scarthgap"
+LAYERSERIES_COMPAT_meta-ti-extras = "nanbield scarthgap styhead"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.17.1


