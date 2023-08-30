Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4305EC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 18:21:00 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.2210.1693419656511346436
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 11:20:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZsO/kUib;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37UIKsjV021686;
	Wed, 30 Aug 2023 13:20:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693419654;
	bh=q3nl2Hmuoh0v3zJ8uIQ3zo0MRfb07U50pF2PAjbn+rg=;
	h=From:To:Subject:Date;
	b=ZsO/kUibPWc5Ui84jelW+xpPisuANc6cJN0EK2XvYBd1up3dzb7bZA3iGnAplXv/Z
	 avBTkFQ5txrZRZIRJA2i1T7zVHYM6iExhZznFMRXT1UZWj5UbZV8/R2m9FIYiFmEn7
	 raSQtsZCkuSJTnHcS3v5i9nVtMzAecWO7Y2lIklg=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37UIKsHe104081
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 30 Aug 2023 13:20:54 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 30
 Aug 2023 13:20:54 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 30 Aug 2023 13:20:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37UIKsjT011396;
	Wed, 30 Aug 2023 13:20:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qbPoE-0005oS-Ac; Wed, 30 Aug 2023 13:20:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] k3conf: Update SRCREV and move to cmake
Date: Wed, 30 Aug 2023 13:20:54 -0500
Message-ID: <20230830182054.21693-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 30 Aug 2023 18:21:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16909

The SRCREV change corresponds to a commit that changes from make to
cmake for building k3conf, so we need to update the recipe as well.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 2686810d..987055b0 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -3,22 +3,16 @@ SUMMARY = "Diagnostic tool for TI K3 processors"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://common/k3conf.c;beginline=1;endline=34;md5=7154c0ffcd418064ffa528e34e70ca9d"
 
+inherit cmake
+
 PV = "0.2+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "81581afb405085755aea7744c1d196533e8094c4"
+SRCREV = "859e1cc105a01a8a4a58318679f92e2135a03a99"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-do_compile () {
-    oe_runmake CC="${CC}" CROSS_COMPILE=${TARGET_PREFIX} all
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install ${S}/k3conf ${D}${bindir}
-}
-- 
2.17.1


