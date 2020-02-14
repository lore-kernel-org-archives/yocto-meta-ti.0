Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1983.1581653668718440587
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 20:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PQSkG0iQ;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: x0038811@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92FFAE016EE; Thu, 13 Feb 2020 20:14:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 776BBE016EB
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 20:14:27 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E4EQSY038723
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 22:14:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581653666;
	bh=MXQdmg6/SJ1YMItIXWkRVSSoKQDJdcv1bduBB56f7pY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=PQSkG0iQ6Y/31fMCcUm4NbYE+ByQanckq8vaj6GR+MctWwWTU5V+uZnJlkiJoJyy/
	 nGAwz3Q+Ov66mEqM3eN0VDMdNzj324CKBD/1EXKwfGUFTKZmTFddq6JTZuA6Z6Blhp
	 iXjEr9fD3fA49oEjzOOakK2KhuU5RCn1jAMei8Ag=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E4EQIa083796
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 22:14:26 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 22:14:26 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 22:14:26 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E4ENYW044701;
	Thu, 13 Feb 2020 22:14:25 -0600
From: "Ramprasad.N" <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Ramprasad N <x0038811@ti.com>
Subject: [zeus/master 1/1] ipumm: Update SRCREV with the vring fix for k5.1+
Date: Fri, 14 Feb 2020 09:44:17 +0530
Message-ID: <1581653657-13192-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1581653657-13192-1-git-send-email-x0038811@ti.com>
References: <1581653657-13192-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

The following is the main change done:
Use FW_RSC_ADDR_ANY for places where memory needs to be allocated
dynamically like RSC_CARVEOUT and vdev resource entries

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
index 5cb38b0..2ef2101 100644
--- a/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
+++ b/recipes-bsp/ipumm-fw/ipumm-fw_git.bb
@@ -17,12 +17,12 @@ RDEPENDS_${PN} = " libdce"
 
 SRC_URI = "git://git.ti.com/ivimm/ipumm.git;protocol=git"
 
-SRCREV = "e4872a8966a267d537399b1babc54e5f66ae8b3b"
+SRCREV = "df4c50aecc9aad7ab3eb1ca9ebacfe473fcad7c5"
 
 S = "${WORKDIR}/git"
 
 PV = "3.00.15.00"
-PR = "r4"
+PR = "r5"
 
 require recipes-ti/includes/ti-paths.inc
 
-- 
1.9.1

