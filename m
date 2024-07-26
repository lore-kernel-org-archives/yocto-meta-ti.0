Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37114C52CDA
	for <webhook@archiver.kernel.org>; Fri, 26 Jul 2024 20:45:38 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.4496.1722026732236547233
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Jul 2024 13:45:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XNfGuRuN;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjVd7016412;
	Fri, 26 Jul 2024 15:45:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722026731;
	bh=UPAO9GmtFNYL8LWTBz+yxPGS9bfdOHv6P48lo5NNGX8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=XNfGuRuNQdXUTAMZnVBzjgC0MlzLpv76CJ4SNhMqxvgJanUjO3NtEBBK+uZC6N1yp
	 UkAjchkRnUfQTljyHLItU3xMMt1l2SZeRIIPFBMe7yR7vLWxTczeMbhraDVhTJZH28
	 sEIZCcmJhx1jG7WCVlh9jOaMWc92PST/RyHwLLZ4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46QKjVYp015192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 26 Jul 2024 15:45:31 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 26
 Jul 2024 15:45:31 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 26 Jul 2024 15:45:31 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46QKjV5X010107;
	Fri, 26 Jul 2024 15:45:31 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sXRoh-0002Mn-12; Fri, 26 Jul 2024 15:45:31 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 4/4] gdbc6x: Disable buildpaths check
Date: Fri, 26 Jul 2024 15:45:30 -0500
Message-ID: <20240726204530.9033-5-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17910

The gdbc6x debugger might be able to be updated for the reproducible
build effort.  While we continue to explore what is possible, we will
disable the check so that we can continue to maintain our code for
releases.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index 1f296dc5..855de762 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -47,3 +47,7 @@ INITSCRIPT_NAME = "gdbserverproxy"
 INITSCRIPT_PARAMS = "defaults 95"
 
 PARALLEL_MAKE = ""
+
+# Disable the "buildpaths" check while we figure out how we are
+# going to address this issue.
+INSANE_SKIP:${PN} += "buildpaths"
-- 
2.17.1


