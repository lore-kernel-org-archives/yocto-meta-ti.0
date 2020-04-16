Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.5366.1587041362515327231
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 05:49:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cUl7Jb/i;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 60F24E019AF; Thu, 16 Apr 2020 05:49:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D67AAE01962
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 05:49:21 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnLpb064188
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587041361;
	bh=8a0zzprzcBP1HzEZG6lC782Tl27T87YIOlmy3BrOdok=;
	h=From:To:Subject:Date;
	b=cUl7Jb/iJc2UvkSfG+1iyuXYm1pnTBYlH9t1toxhrRFsOAJM4g+S/dfwPKaaOXQqL
	 WMZe6HRJzUB40jEz1Xvw2R6XSjGa9a1z4YEqLWeQKtn3Ykda0qNPFwYueAzKEP+3Pm
	 ZRZEO11ID5ZJg5FioNFlalETyBXdteJz5yVrIvy0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03GCnLY0057223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:21 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 16
 Apr 2020 07:49:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 16 Apr 2020 07:49:20 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03GCnKQc127342
	for <meta-ti@yoctoproject.org>; Thu, 16 Apr 2020 07:49:20 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/thud/master][PATCH 0/3] 6.3 RTOS Patchset 2
Date: Thu, 16 Apr 2020 08:49:14 -0400
Message-ID: <20200416124917.45057-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

6.3 RTOS patchset 2 containing fixes for
1) fix for OMAPL137  examples' compilation failures
2) ePWM fix with automation

Mahesh Radhakrishnan (3):
  ti-pdk:SRCREV update to 2020.4.16
  cmb-addon-rtos: SRCREV update to 01.01.00.03A
  common-csl-ip: SRCREV update to 03.03.00.17B

 classes/ti-pdk-fetch.bbclass                | 4 ++--
 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.17.1

