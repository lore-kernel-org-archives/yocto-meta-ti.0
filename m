Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A166C77B62
	for <webhook@archiver.kernel.org>; Wed,  5 Apr 2023 18:47:20 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.139201.1680720437613714747
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Apr 2023 11:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AhNqTndx;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 335IlFdQ069209;
	Wed, 5 Apr 2023 13:47:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1680720435;
	bh=XRE4o1E2qfsNQ3Fa9iHIM6d6aY4Nr8oa12VW5vdNvDg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AhNqTndx5eGvWE14SAaF7EoQmhnRwzvfhEQX5nblfySdBwDrq9wG7zFA1hONBIFEO
	 XVsLXfUeKZ+69htBniNRv9MMsH2rtccEb4XhvhZCaYTe29dO+CPGyzN8fx3O323w5g
	 5OSlUqR7JpCAJo1AwNecg28palXoD+y8oZYTNAjM=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 335IlFSt062145
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Apr 2023 13:47:15 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Wed, 5
 Apr 2023 13:47:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Wed, 5 Apr 2023 13:47:15 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 335IlEcZ016337;
	Wed, 5 Apr 2023 13:47:15 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH 2/4] linux-ti-mainline: Update to v6.2 mainline version
Date: Wed, 5 Apr 2023 13:47:12 -0500
Message-ID: <20230405184714.26036-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405184714.26036-1-afd@ti.com>
References: <20230405184714.26036-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Apr 2023 18:47:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16289

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 3f4b560d..eb8009df 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -16,12 +16,10 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 
 S = "${WORKDIR}/git"
 
+# 6.2 Mainline version
 BRANCH = "master"
-TOOLS_BRANCH = "master"
-
-# 5.15 Mainline version
-SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
-PV = "5.15+git${SRCPV}"
+SRCREV = "c9c3395d5e3dcc6daee66c6908354d47bf98cb0c"
+PV = "6.2+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
2.39.2


