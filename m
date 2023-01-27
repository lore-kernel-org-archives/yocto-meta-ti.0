Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C771FC54EAA
	for <webhook@archiver.kernel.org>; Fri, 27 Jan 2023 18:02:31 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.109269.1674842541281294724
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 27 Jan 2023 10:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=RVaONprK;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30RI2KQG082088
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 12:02:20 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1674842540;
	bh=QQiggOf8PPKb5BX+6RMcjJxap/ORzV0A+LI7/oh2lWM=;
	h=From:To:CC:Subject:Date;
	b=RVaONprK7rat7HPZAWLBZbdyMGe54/U7Lc1NZmsj3iCnk9jNwk30CtzzeShc9nJP+
	 evlJ7ZooX1un9TV/N4o7d1N8Zsv1A0Zz8OIXtQKRosnRzCqq1pXNU8sTW0/IyADViU
	 WGSJXrXM2YAmScTX+wMWRH82sa+a23gsxk6ZzkXY=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30RI2KmR017441
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 12:02:20 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 27
 Jan 2023 12:02:20 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 27 Jan 2023 12:02:19 -0600
Received: from res.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30RI2JaH050424;
	Fri, 27 Jan 2023 12:02:19 -0600
From: Randolph Sapp <rs@ti.com>
To: <denys@ti.com>, <reatmon@ti.com>, <afd@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [PATCH] meta-ti-extras: ti-unpack: Drop update_data call
Date: Fri, 27 Jan 2023 12:02:17 -0600
Message-ID: <20230127180217.1760815-1-rs@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 27 Jan 2023 18:02:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15691

Bitbake made it's data store dynamic many releases ago and finally
removed the update_data command altogether in commit
584989ed2b5af4e8799571dece0cf94f995ef14e. This drops our references as
well.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-extras/recipes-ti/includes/ti-unpack.inc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
index 46bfb957..13068843 100644
--- a/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
+++ b/meta-ti-extras/recipes-ti/includes/ti-unpack.inc
@@ -24,7 +24,6 @@ python ti_bin_do_unpack() {
         bb.fatal("TI installer requires 32bit glibc libraries for proper operation\nrun 'yum install glibc.i686' on Fedora or 'apt-get install libc6:i386' on Ubuntu/Debian")
 
     localdata = bb.data.createCopy(d)
-    bb.data.update_data(localdata)
 
     binfile  = localdata.getVar('BINFILE')
     binfile  = bb.data.expand(binfile, localdata)
-- 
2.34.1


