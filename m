Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9666BC25B75
	for <webhook@archiver.kernel.org>; Mon,  3 Jun 2024 23:07:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.8161.1717456043547650493
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Jun 2024 16:07:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=poDoq0Nu;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 453N7LDQ043462;
	Mon, 3 Jun 2024 18:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717456041;
	bh=MVLV7m7Rju+PKPAATcBefPCsnK6nc151eKxt1bWdt7A=;
	h=From:To:Subject:Date;
	b=poDoq0Nu4TCAEEKGgBqMRQWeKAIZ85Hzi63/L/cl9UF/J9TgNRA42bKOhnnpLm7Tb
	 9YJT8XFaUgMOjgV1m6lX8rmKumZoXXSJ9M6QfZZ9sqHLplSsxlnNRKagZ1Qv/RHT81
	 XuNF9VF6Re9LRFRb3hgN9HPRe1KHeJky53FNw51I=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 453N7LsS023273
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 Jun 2024 18:07:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jun 2024 18:07:20 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 3 Jun 2024 18:07:20 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 453N7KSE006963;
	Mon, 3 Jun 2024 18:07:20 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sEGls-00058V-N1; Mon, 03 Jun 2024 18:07:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] gdbc6x: Update for gcc v14 support
Date: Mon, 3 Jun 2024 18:07:20 -0500
Message-ID: <20240603230720.19393-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Jun 2024 23:07:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17692

One of the changes in gcc v14 is making implicit-function-declaration an
error.  For some older software packages the easiest fix is to add
-fpermissive to the compile line.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
index d3ada9c6..012136ac 100644
--- a/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
+++ b/meta-ti-extras/recipes-devtools/gdbc6x/gdbc6x_git.bb
@@ -19,7 +19,7 @@ S = "${WORKDIR}/git/gdbc6x"
 inherit update-rc.d
 inherit gettext
 
-CFLAGS += "-fcommon"
+CFLAGS += "-fcommon -fpermissive"
 
 do_configure () {
     cd ${S}
-- 
2.17.1


