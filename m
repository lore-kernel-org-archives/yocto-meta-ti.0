Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.331.1576562606465625111
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2019 22:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=mC7yjnzs;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: nsaulnier@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EADF1E01257; Mon, 16 Dec 2019 22:03:25 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60D1FE00963
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 22:03:24 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBH63NF2100213
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 00:03:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576562603;
	bh=3lnb3mndCR9yOJsG7Hv0Vaa5xWdBooRvDLfq/OUC1aA=;
	h=From:To:CC:Subject:Date;
	b=mC7yjnzsfaXQtzwS9SwZ6ME5ED6CDCij0MO+xmc8tBH6+5N77xDRum++E50VDSJRu
	 X7sHIF97UXNY1nYLVqz9JXGeJTixNtq1OxJDh0swHh47ZP3Xbjdaeyng4auvnksJC8
	 PqwZsqa8MgRUO6bssBFPzr2rKazNNpDzQRjHx+v0=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBH63N8G100504
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 17 Dec 2019 00:03:23 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 17
 Dec 2019 00:03:23 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 17 Dec 2019 00:03:23 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBH63N5N028549;
	Tue, 17 Dec 2019 00:03:23 -0600
From: "Nick Saulnier" <nsaulnier@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <nsaulnier@ti.com>, <denys@ti.com>, <j-stiffler@ti.com>
Subject: [meta-ti][PATCH v3] pru-icss_git.bb: Update Manifest and PSSP commits
Date: Tue, 17 Dec 2019 00:02:32 -0600
Message-ID: <20191217060232.18195-1-nsaulnier@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

- Updated the Software Manifest from 5.0 -> 6.0 to account for new processors,
etc.

- Updated to PRU Software Support Package v5.6.0
	updated manifest
	added PRU Getting Started Labs
	improved several examples

Signed-off-by: Nick Saulnier <nsaulnier@ti.com>
---
 recipes-bsp/pru/pru-icss_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/pru/pru-icss_git.bb b/recipes-bsp/pru/pru-icss_git.bb
index 6508b6c2bcf3..88d28f37cc5b 100644
--- a/recipes-bsp/pru/pru-icss_git.bb
+++ b/recipes-bsp/pru/pru-icss_git.bb
@@ -2,15 +2,15 @@ DESCRIPTION = "Programmable Real-time Unit Software Package"
 HOMEPAGE = "http://processors.wiki.ti.com/index.php/PRU-ICSS"
 LICENSE = "BSD-3-Clause & GPL-2.0 & PD"
 
-LIC_FILES_CHKSUM = "file://PRU-Package-v5.0-Manifest.html;md5=a86a37c8b6396ad0ad6ae752f1aa8fcc"
+LIC_FILES_CHKSUM = "file://PRU-Package-v6.0-Manifest.html;md5=ea854230556f47609efdaedca174b44c"
 
 inherit update-alternatives
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/pru-software-support-package/pru-software-support-package.git;protocol=git;branch=${BRANCH}"
-SRCREV = "1ff0393b3b9454fe9c58399c1b5d2db511e8049c"
+SRCREV = "ff252a5e174f1b6aa42931744939f20d25d8e070"
 
-PV = "5.5.0"
+PV = "5.6.0"
 PR = "r1"
 
 require recipes-ti/includes/ti-paths.inc
@@ -33,6 +33,7 @@ DEPENDS = "ti-cgt-pru-native"
 S = "${WORKDIR}/git"
 
 export PRU_CGT = "${TI_CGT_PRU_INSTALL_DIR}"
+export PRU_SSP = "${S}"
 
 SUBDIRS = "examples pru_cape/pru_fw lib/src labs"
 
-- 
2.17.1

