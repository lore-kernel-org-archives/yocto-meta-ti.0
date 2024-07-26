Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 542BEC52CDC
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:38 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4497.1722026732365151726
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=boXzkD2Z;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjVGF039375;
	Fri, 26 Jul 2024 15:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026731;
	bh=jHkVrQT6/QUSD2TiT0HfJdNkE4T1c3GA//d6tVrSiVU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=boXzkD2ZZTuqAteB3+V/QJcZKtX65gnLkHUH2gQp3HnW9e0x7uWURIAN2IdgD4wLG
	 degbFNagsYxl2t8FhvkrnID1HkVaSMIcqjIXcnqFF6AwW0XI5y4ZDsCNZ10mBjz7Cn
	 lHm0B0kfnQZXqNkHXrdZzTBcmtPY+5Fcg1+MmveU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjV27068261
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:31 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjUnL010099;
	Fri, 26 Jul 2024 15:45:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRog-0002Mb-Os; Fri, 26 Jul 2024 15:45:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/4] libulm: Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:28 -0500
Message-ID: <20240726204530.9033-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726204530.9033-1-reatmon@ti.com>
References: <20240726204530.9033-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 26 Jul 2024 20:45:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17911

The ti-cgt6x compiler is a custom TI compiler for the TI C6000
Digital Signal Processor(DSP) platform.  It does not currently
support reproducible builds and is provided via a binary blob
download that we cannot patch in the recipe to address the
issue.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
index 6a2cde30..998d9d83 100644
--- a/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
+++ b/meta-ti-extras/recipes-bsp/dsptop/libulm_git.bb
@@ -43,3 +43,13 @@ include dsptop.inc
 ALLOW_EMPTY:${PN} = "1"
 
 PARALLEL_MAKE= ""
+
+# Disable the "buildpaths" check while we figure out how we are
+# going to address this issue.
+#
+# The ti-cgt6x compiler is a custom TI compiler for the TI C6000
+# Digital Signal Processor(DSP) platform.  It does not currently
+# support reproducible builds and is provided via a binary blob
+# download that we cannot patch in the recipe to address the
+# issue.
+INSANE_SKIP:${PN}-dev += "buildpaths"
-- 
2.17.1


