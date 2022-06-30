Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A201CCA47F
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 12:19:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.24465.1656591565478294946
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 30 Jun 2022 05:19:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yF3kOXqg;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJM1w055404;
	Thu, 30 Jun 2022 07:19:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656591562;
	bh=VsbNYSxnVMseFq9vKRqaQCII+g7vKeBmQ/5v42MrHl4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yF3kOXqgoZ7wB/ieQuCmUUFOpZj9vstj62Y/wTUAHnVHmfgScjlwe0uLJoStLT5Sq
	 fncurhnNCTEHLc+ihGTmYsZR+T+j8JtF9LgYanoucv+Ey03mxSGaV7SaBhHt2RLfkE
	 t0n6LIsm/h+aiF8Mu+eaAwtREf99KjzL4QpqeYgU=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25UCJMNu024136
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 30
 Jun 2022 07:19:22 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 30 Jun 2022 07:19:22 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25UCJM8I036298;
	Thu, 30 Jun 2022 07:19:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1o6t8k-0006g4-Eo; Thu, 30 Jun 2022 07:19:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH 2/4] linux-ti-staging: Bump to 08.04.00.003
 release
Date: Thu, 30 Jun 2022 07:19:20 -0500
Message-ID: <20220630121922.25624-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220630121922.25624-1-reatmon@ti.com>
References: <20220630121922.25624-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 30 Jun 2022 12:19:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14852

Updated the linux version for 08.04.00.003

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 7ec06dae..4c5c2902 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,8 +25,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "fb0a0333fbbb73679e719745575df8efd800380b"
-PV = "..+git${SRCPV}"
+SRCREV = "a293790a7822997b0ff63bdd95f580ac6e2d85e2"
+PV = "5.10.120+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
-- 
2.17.1


