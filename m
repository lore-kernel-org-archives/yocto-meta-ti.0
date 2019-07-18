Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C8F20E00B8E; Thu, 18 Jul 2019 12:10:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BC424E00A5C
	for <meta-ti@yoctoproject.org>; Thu, 18 Jul 2019 12:10:02 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6IJA2DQ010134
	for <meta-ti@yoctoproject.org>; Thu, 18 Jul 2019 14:10:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563477002;
	bh=TSzxULKmNmmCNl8uSLyyvsuZxHJff/Rx6HvowalyYVc=;
	h=From:To:Subject:Date;
	b=kpL/V3WAcWSJ7xGwn7CqtkaAxCHYTc8d/nduo+5sZRJk5PX8m4xgokN8FH6vgsP2z
	FT9fr+HycUCY0McY6DxJELhRSvDnaEd3jX4q9qZDwDbHeEcAerbnNMObpL/pwu08a4
	zYyKyQgaWZprEa5a7/HIC80wWoVu+9GbT+RC/NFI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6IJA1ns125502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 18 Jul 2019 14:10:02 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 18 Jul 2019 14:10:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 18 Jul 2019 14:10:01 -0500
Received: from uda0132704c (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6IJA1AE110885;
	Thu, 18 Jul 2019 14:10:01 -0500
Received: from praneethlocal by uda0132704c with local (Exim 4.86_2)
	id 1hoBmz-0007Cv-Er; Thu, 18 Jul 2019 14:10:01 -0500
From: Praneeth Bajjuri <praneeth@ti.com>
To: <praneeth@ti.com>, Denys Dmytriyenko <denys@ti.com>,
	<meta-ti@yoctoproject.org>
Date: Thu, 18 Jul 2019 14:09:59 -0500
Message-ID: <1563476999-27662-1-git-send-email-praneeth@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] cadence-mhdp-fw: fix firmware license path
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Jul 2019 19:10:04 -0000
Content-Type: text/plain

update license as defined at
https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/tree/LICENCE.cadence

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
index a7032720d36c..38a1f82beabf 100644
--- a/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
+++ b/recipes-bsp/cadence-mhdp-fw/cadence-mhdp-fw_git.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Cadence MHDP DP bridge firmware"
 
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENCE.Spectrum-GT9271;md5=2a6de6be7af1fe46370c684daf27c852"
+LICENSE = "BSD-3-Clause | Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENCE.cadence;md5=009f46816f6956cfb75ede13d3e1cee0"
 
 PV = "1.2.15"
 PR = "r0"
-- 
2.7.4


