Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CECDC0032E
	for <webhook@archiver.kernel.org>; Wed, 25 Oct 2023 16:56:40 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.49014.1698252995099394432
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 25 Oct 2023 09:56:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=k7TxISM7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuX27120609;
	Wed, 25 Oct 2023 11:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698252993;
	bh=+yQvVvHtDe0YrR5X4sSHOh0nPlXTSjk4FqFl8WRKZzU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=k7TxISM7St6O4N0cGrTCho8sLjrxk4bkKzx3V2sXhvHxiVp6wWS3pBpDEbIN6Od+j
	 QL4rViLJQnFyaS/dfGdmzSJEwBMf58jk1yknehr/gnWhJJu0FigTeeySEPik6Jfpde
	 TGX2tB2oI0IwP3qNtOt5Yz5MLPsJA/PGARfgdzrA=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39PGuXWo016782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Oct 2023 11:56:33 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 25
 Oct 2023 11:56:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 25 Oct 2023 11:56:33 -0500
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39PGuVER008415;
	Wed, 25 Oct 2023 11:56:33 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 4/8] ti-sci-fw: Do not unexport CFLAGS, LDFLAGS, AS, or LD
Date: Wed, 25 Oct 2023 11:56:26 -0500
Message-ID: <20231025165630.2274889-4-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231025165630.2274889-1-afd@ti.com>
References: <20231025165630.2274889-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Oct 2023 16:56:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17186

There is no compilation in this simple firmware recipe, no need for
these lines, remove them.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index 0eb03b92..12292c88 100644
--- a/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -6,11 +6,6 @@ require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-CFLAGS[unexport] = "1"
-LDFLAGS[unexport] = "1"
-AS[unexport] = "1"
-LD[unexport] = "1"
-
 PV = "${TI_SYSFW_VERSION}"
 PR = "${INC_PR}.0"
 
-- 
2.39.2


