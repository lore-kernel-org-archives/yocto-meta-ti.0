Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9953AD2C558
	for <webhook@archiver.kernel.org>; Tue, 22 Oct 2024 13:54:25 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.18767.1729605259004856481
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 22 Oct 2024 06:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mkh8Ptu/;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49MDsHqk025866;
	Tue, 22 Oct 2024 08:54:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729605257;
	bh=6oJOdK2QnrJS7f7Kitcnps6dfPBT0kKt8WM1qleqLA8=;
	h=From:To:Subject:Date;
	b=mkh8Ptu/KHkRt1vS7/TVwwzyNFw+1cp73kIyXcTsJUqj/I/smjOyUZmCHpZiZsx7T
	 FSCDNSu5vnV8tOykhR2HR3COioRotYs5Lhr/AcMqNGS16oMO4Ui8Db4ZFk4+3Yanny
	 8CaiJRGLqvizZXj+7yu8miAvyIPt8tJXxKpIeLNY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49MDsHiL013768
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Oct 2024 08:54:17 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Oct 2024 08:54:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Oct 2024 08:54:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49MDsHLm020249;
	Tue, 22 Oct 2024 08:54:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t3FKz-0006Mk-3d; Tue, 22 Oct 2024 08:54:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][PATCH] optee: Update to v4.4.0
Date: Tue, 22 Oct 2024 08:54:17 -0500
Message-ID: <20241022135417.24430-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 22 Oct 2024 13:54:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18024

Update all of the components to the upstream 4.4.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 5f06fa03..2c8977dd 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.3.0+git"
-SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
+PV = "4.4.0+git"
+SRCREV = "d221676a58b305bddbf97db00395205b3038de8e"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 4d9897a7..8c21bc75 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.3.0+git"
+PV = "4.4.0+git"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index a79e5702..d7b1c927 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.3.0+git"
-SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
+PV = "4.4.0+git"
+SRCREV = "8f645256efc0dc66bd5c118778b0b50c44469ae1"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 0b902d69..3c1fedc9 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.3.0+git"
-SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
+PV = "4.4.0+git"
+SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
-- 
2.17.1


