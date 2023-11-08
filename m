Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 885BAC4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:57:18 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.19863.1699462637584641841
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 08:57:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Au+A+vNC;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A8GvGQQ104286;
	Wed, 8 Nov 2023 10:57:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1699462636;
	bh=S6wq24zdZlyt7H//b8b66IZWP860pYy77nNT1nT9A5E=;
	h=From:To:CC:Subject:Date;
	b=Au+A+vNCx0WpORQp4eSdpqr1+RfSeAGAK7hWpZieoQyErhbUYFysj4oI+mLdjPIz7
	 PDQbne+Fpb4eHWg45/AQED7dFizEL7QUEfYuGs+nYJHojpNd7ZDe+jyDieM9i0xleo
	 gcwgJcHA0ooqJpLZ4aHdnAIbORhM4kA46HlgAirg=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A8GvGRV051745
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Nov 2023 10:57:16 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 8
 Nov 2023 10:57:16 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 8 Nov 2023 10:57:15 -0600
Received: from lelv0326.itg.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A8GvFPG085560;
	Wed, 8 Nov 2023 10:57:15 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH] k3conf: Update to v0.3
Date: Wed, 8 Nov 2023 10:57:14 -0600
Message-ID: <20231108165714.2774213-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 08 Nov 2023 16:57:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17277

The SRCREV is auto updated, but the PV still uses the old tag version,
update this to v0.3.

While here, we also now have a proper LICENSE file, use that.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index dcff684e..9c359fee 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Diagnostic tool for TI K3 processors"
 
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://common/k3conf.c;beginline=1;endline=34;md5=7154c0ffcd418064ffa528e34e70ca9d"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a56bddef00b39fb0f45488fdc4ce108f"
 
 inherit cmake
 
-PV = "0.2+git${SRCPV}"
+PV = "0.3+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "k3"
 
@@ -15,4 +15,3 @@ SRCREV = "de06befe878be061a40540d2127d4273320b35bc"
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-
-- 
2.39.2


