Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7603FC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 19:37:14 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.5036.1712086625777308986
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 12:37:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=yzqXOSoR;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 432Jb4Fh059342;
	Tue, 2 Apr 2024 14:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712086624;
	bh=7QSzx5J4OU9uxa6o//NnRXs+HcYZeDuaCUccfSFywSE=;
	h=From:To:Subject:Date;
	b=yzqXOSoRm7eNN4jk0mVBuXNpACzUUtnWCZ5qETOQYJxsSXLWXr6LCBNwAqcrL6aE1
	 p2xxZR59q/a46r94i5kBa3RgUdaeoz5mGQOE/LYUtPFqV5hhNiQVv4g/MrWSaDlZlX
	 qpISf19i7/1hFRFqcMhUid9FwKN2+x1G2iviirWM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 432Jb4n5005576
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Apr 2024 14:37:04 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 Apr 2024 14:37:04 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 Apr 2024 14:37:04 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 432Jb4ae067209;
	Tue, 2 Apr 2024 14:37:04 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rrjwO-0003Yu-4r; Tue, 02 Apr 2024 14:37:04 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH v2] README: update with scarthgap specific info
Date: Tue, 2 Apr 2024 14:37:04 -0500
Message-ID: <20240402193704.13653-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Apr 2024 19:37:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17557

Update the READMEs with the current available scarthgap branches.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Rollback the layers to master that do not have scarthgap branches
yet.

 meta-ti-bsp/README    | 2 +-
 meta-ti-extras/README | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
index c5780531..4c86c8fb 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-bsp/README
@@ -8,7 +8,7 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
diff --git a/meta-ti-extras/README b/meta-ti-extras/README
index 1b38921a..764ae0f7 100644
--- a/meta-ti-extras/README
+++ b/meta-ti-extras/README
@@ -8,14 +8,14 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
 branch: master
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-ti-bsp
 
-- 
2.17.1


