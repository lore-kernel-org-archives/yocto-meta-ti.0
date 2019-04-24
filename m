Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 818F9E00AD5; Wed, 24 Apr 2019 06:35:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6E8DFE00B1B
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 06:35:53 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3ODZq4j117106
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 08:35:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1556112952;
	bh=BYr8HAWvO5lG6mHvhwFSvhdP/izA9cQ6qGLBvbisK2E=;
	h=From:To:CC:Subject:Date;
	b=lNr/kMeYIJ1x9aknBwlfDt5WiNWrLK1aVZ0lTdjFcDMbUu91T7Q4CIJolcUbWsd7W
	fnGS0NgvFSJmUST1pWqrICrq7JMuuhi7XVnGVTuWI+Cbp5SJ3jhQroq2le56TjL3g5
	yUwioEhOzYY1Mq952oDPtzdT3sJrS0PIas2HJmSc=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3ODZqe7025224
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 24 Apr 2019 08:35:52 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 24 Apr 2019 08:35:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 24 Apr 2019 08:35:53 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3ODZqTi005619;
	Wed, 24 Apr 2019 08:35:52 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 24 Apr 2019 09:23:32 -0400
Message-ID: <1556112212-19002-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-ipc-rtos: add SRCREV_FORMAT
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
X-List-Received-Date: Wed, 24 Apr 2019 13:35:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ipc/ti-ipc-rtos.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
index e4f632d..9b7bccf 100644
--- a/recipes-ti/ipc/ti-ipc-rtos.inc
+++ b/recipes-ti/ipc/ti-ipc-rtos.inc
@@ -29,6 +29,7 @@ TI_IPC_METADATA_SRCREV = "3936c41d021c6d56c25f4bb07b647314a6589a57"
 # Corresponds to tag: 3.50.03.05
 TI_IPC_EXAMPLES_SRCREV = "55a8341c60a91c0ba2d79b7e4b805e2e39b3060f"
 
+SRCREV_FORMAT = "default"
 SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
 SRCREV_ipc-examples = "${TI_IPC_EXAMPLES_SRCREV}"
 
-- 
2.7.4


