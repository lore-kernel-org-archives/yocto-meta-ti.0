Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDB7C77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 18:42:48 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.420.1681324966966293600
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Apr 2023 11:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uwGb+9n5;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33CIgj0O047922;
	Wed, 12 Apr 2023 13:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681324965;
	bh=z9Qo4k6uo9jpAoQPfApq6ag1LmynsiO/xn6NcL7b6fI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uwGb+9n5/sTWjjPgiYMvPZAN5Biofp/iP5B//vb4lIC6KyGLbFp9qMiDYA9bhOYo8
	 6Siv8H2rEipmKvVSjUtwygxtZfqAaxxpnxNcn1hx7jUr4uV3EGAL/O6r+w/tVC4TZQ
	 881Fe7xaANynLtnKGGVje7StwkREnNqoBLpTcS3A=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33CIgjLA092497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Apr 2023 13:42:45 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 12
 Apr 2023 13:42:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 12 Apr 2023 13:42:44 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33CIggZZ023440;
	Wed, 12 Apr 2023 13:42:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Randolph Sapp <rs@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v2 5/6] meta-ti-bsp: Remove SGX driver from SIGGEN_EXCLUDERECIPES_ABISAFE
Date: Wed, 12 Apr 2023 13:42:41 -0500
Message-ID: <20230412184242.29743-5-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230412184242.29743-1-afd@ti.com>
References: <20230412184242.29743-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Apr 2023 18:42:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16380

Neither of recipes nor their ABI is all that stable. OpenGL might be
slightly more stable, but that is not what these provide anymore.
Remove these.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/conf/layer.conf | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.conf
index 39e7f9eb..31eb9db8 100644
--- a/meta-ti-bsp/conf/layer.conf
+++ b/meta-ti-bsp/conf/layer.conf
@@ -18,9 +18,4 @@ LAYERDEPENDS_meta-ti-bsp = " \
     meta-arm \
 "
 
-SIGGEN_EXCLUDERECIPES_ABISAFE += " \
-    ti-sgx-ddk-km \
-    ti-sgx-ddk-um \
-"
-
 HOSTTOOLS_NONFATAL += "truncate xxd comm"
-- 
2.39.2


