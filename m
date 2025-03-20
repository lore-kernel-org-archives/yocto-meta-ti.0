Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9650C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:51:24 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.2858.1742496683490650735
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:51:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tsrY1RJv;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIpMFJ711697
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Mar 2025 13:51:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742496683;
	bh=V5gOYLdovJthsEX6xbM/2ZBQychhs+FA97KNSZH56X0=;
	h=From:To:Subject:Date;
	b=tsrY1RJvVsgJIfx8aCyt3hbE07G3LILa/cwWHoyRE6G7ao4mbFmkp2TryWEzkA1rH
	 fMErOk9FcTCJYdMt5qJRifJ+l72lUbC0ceIPsDGvpjlwYI9P+ebQBJBQrym/IglLZo
	 mFtDc9LAWR4nMZirXD5IO42CRUywxSZcqZRqPmWw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIpMgG046138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 20 Mar 2025 13:51:22 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:51:22 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:51:22 -0500
Received: from localhost (praneethhome.dhcp.ti.com [128.247.81.61])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIpM9q129648;
	Thu, 20 Mar 2025 13:51:22 -0500
From: <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [scarthgap] ipc: ti-rpmsg-char: Update library to 0.6.9
Date: Thu, 20 Mar 2025 13:51:22 -0500
Message-ID: <20250320185122.1536-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:51:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18416

From: Praneeth Bajjuri <praneeth@ti.com>

update from 0.6.7 to 0.6.9.
This update brings the following fixes from ti-rpmsg-char repo.

09b064c src: fix misc warnings
5a9ec97 src: fix warnings for resource leak & string null
b4ef987 Fix Werror=stringop-truncation
dabdc21 lib: Fix klockwork warnings

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
index be88aade..4aa16b58 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-rpmsg-char.inc
@@ -7,10 +7,10 @@ PROTOCOL = "https"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
-# 0.6.7 release
-SRCREV = "5100a2e4a4a951e40ea0708fa78960770ec0ac33"
+# 0.6.9 release
+SRCREV = "09b064c6663ed46e4a402291dd87c8fe96135bd7"
 
-PV = "0.6.7+git"
+PV = "0.6.9+git"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


