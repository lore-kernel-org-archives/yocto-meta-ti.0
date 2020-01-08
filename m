Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.408.1578521466240086230
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 08 Jan 2020 14:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S5zKzH6f;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 99396E01405; Wed,  8 Jan 2020 14:11:05 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F7ABE01387
	for <meta-ti@yoctoproject.org>; Wed,  8 Jan 2020 14:11:04 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008MB3GT057338
	for <meta-ti@yoctoproject.org>; Wed, 8 Jan 2020 16:11:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578521463;
	bh=glhbq+SWqqsRTJEO9jeO7kQt7IQdjaw7gOXMJ6460JA=;
	h=From:To:Subject:Date;
	b=S5zKzH6fMd0+Vi78sStVyUQQK7sKiOfMdQcjQyVMjQR+D0yUl9ezFM5cnVHOPq3qh
	 uYza8zMR5RLcGqAmKy8YKSWs01gyBXtA4TKa/Jss5jb4RMDFuXPlu9AZoRL7lcRDfN
	 5sQNXqN+NcFWzwwg5gQs9QKDTyf+xBVoIFNaP2aY=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008MB3bQ124518
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 8 Jan 2020 16:11:03 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 16:11:02 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 16:11:02 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008MB27m012957
	for <meta-ti@yoctoproject.org>; Wed, 8 Jan 2020 16:11:02 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH v2] ti-pdk-fetch: SRCREV update for fetching PCIE updates
Date: Wed, 8 Jan 2020 17:10:59 -0500
Message-ID: <1578521459-38498-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: "Mahesh Radhakrishnan via Lists.Yoctoproject.Org" <m-radhakrishnan2=ti.com@lists.yoctoproject.org>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 classes/ti-pdk-fetch.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/classes/ti-pdk-fetch.bbclass b/classes/ti-pdk-fetch.bbclass
index 117e54f..c275916 100644
--- a/classes/ti-pdk-fetch.bbclass
+++ b/classes/ti-pdk-fetch.bbclass
@@ -1,9 +1,9 @@
 TI_PDK_GIT_URI ?= "git://git.ti.com/processor-sdk/pdk.git"
-TI_PDK_GIT_BRANCH ?= "release/PROCESSOR-SDK_06.02.00"
+TI_PDK_GIT_BRANCH ?= "master"
 TI_PDK_GIT_PROTOCOL ?= "git"
-TI_PDK_SRCREV ?= "2357d1436f1b2c3b5f1d0c9c94e045d33b63f3fe"
+TI_PDK_SRCREV ?= "4e5372ab43f283d96cb5e2a0373aca3944d869a3"
 
-TI_PDK_VERSION ?= "2019.12.2"
+TI_PDK_VERSION ?= "2020.1.8"
 
 PV = "${TI_PDK_VERSION}"
 
-- 
1.9.1

