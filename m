Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D2DC43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 20:32:24 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.2301.1658349143303851904
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:32:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=jsT3u8Aq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KKWJpM008595;
	Wed, 20 Jul 2022 15:32:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658349139;
	bh=xhpn6MGV3yPOHCNDfXW/BQrK0l7wD8CKkGUDALcI9kg=;
	h=From:To:Subject:Date;
	b=jsT3u8AqVvBYQu/x5IaxXjyWr5b5omLga5B1xm+H43eIFkrNuQpaYmmaX6pnP8V0y
	 a37FNfztIAcqhVDGNXduWj/xfnM+ki/nWfTwbfyFQum3QERqJQSZyyarCPdhmtezvR
	 c3jkm5jM0RuE7eM9uP6pn30Hx4pYVubgPnIRl3wI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KKWJNi018046
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 15:32:19 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 15:32:19 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 15:32:19 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KKWJGF111134;
	Wed, 20 Jul 2022 15:32:19 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1oEGMk-0005Py-WF; Wed, 20 Jul 2022 15:32:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] x-load: Remove reference to
 arago-project.org
Date: Wed, 20 Jul 2022 15:32:18 -0500
Message-ID: <20220720203218.20787-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Jul 2022 20:32:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/14889

arago-project.org is being shut down in August.  This
commit changes the last recipes that point to that
old site to point to git.ti.com, or just rmeove the
reference entirely.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 recipes-bsp/x-load/x-load_1.46-psp.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/x-load/x-load_1.46-psp.bb b/recipes-bsp/x-load/x-load_1.46-psp.bb
index 108e408d..5713927b 100644
--- a/recipes-bsp/x-load/x-load_1.46-psp.bb
+++ b/recipes-bsp/x-load/x-load_1.46-psp.bb
@@ -12,7 +12,7 @@ PE = "1"
 
 # TI PSP v1.46_OMAPPSP_03.00.01.06 (Tag is one commit different)
 SRCREV_pn-${PN} = "fc6d5be15c703d21aef0ae0b8c02177721f0445f"
-SRC_URI = "git://arago-project.org/git/projects/x-load-omap3.git;protocol=git"
+SRC_URI = "git://git.ti.com/git/arago-project-org/x-load-omap3.git;protocol=https"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


