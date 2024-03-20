Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13950C54E67
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 20:05:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.37.1710965140836604715
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 13:05:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TEQZRsmt;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 42KK5dqf108836;
	Wed, 20 Mar 2024 15:05:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1710965139;
	bh=XL86vbrry1kPBqo13IS6lRuzpXsYaX5+8Az9Dk3tOq4=;
	h=From:To:Subject:Date;
	b=TEQZRsmtDnsrYztOk+qZsozQR75QUvPxTJKpU110ZSU1WktBXM5TVtlk+0AKVuSu+
	 2BBVzwwDfKj2CcNajC1rry3Kznz2azailpdf6Yy/qL+NL4B2O8QNf0bzTjtk+268Mp
	 I61axzdQ/yFRzee5Wdd7Ctzl6JPRyAb3Ull52aFA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 42KK5djw051581
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Mar 2024 15:05:39 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 20
 Mar 2024 15:05:39 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 20 Mar 2024 15:05:39 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 42KK5dXl130600;
	Wed, 20 Mar 2024 15:05:39 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rn2Bv-0006Hf-73; Wed, 20 Mar 2024 15:05:39 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] README: update with scarthgap specific info
Date: Wed, 20 Mar 2024 15:05:39 -0500
Message-ID: <20240320200539.24116-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 20 Mar 2024 20:05:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17541

All READMEs were still mentioning master, update that.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/README    | 4 ++--
 meta-ti-extras/README | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-ti-bsp/README b/meta-ti-bsp/README
index c5780531..70c40d4e 100644
--- a/meta-ti-bsp/README
+++ b/meta-ti-bsp/README
@@ -8,11 +8,11 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: scarthgap
 
 
 The base BSP part of meta-ti should work with different OpenEmbedded/Yocto
diff --git a/meta-ti-extras/README b/meta-ti-extras/README
index 1b38921a..c6c058e0 100644
--- a/meta-ti-extras/README
+++ b/meta-ti-extras/README
@@ -8,14 +8,14 @@ This layer depends on:
 
 URI: git://git.openembedded.org/openembedded-core
 layers: meta
-branch: master
+branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-arm
 layers: meta-arm
-branch: master
+branch: scarthgap
 
 URI: git://git.yoctoproject.org/meta-ti
-branch: master
+branch: scarthgap
 revision: HEAD
 layers: meta-ti-bsp
 
-- 
2.17.1


