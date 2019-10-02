Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D47FBE00D9F; Tue,  1 Oct 2019 17:04:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C6C53E00D9E
	for <meta-ti@yoctoproject.org>; Tue,  1 Oct 2019 17:04:25 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9204OQ2024648
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569974664;
	bh=GhXdfEPItMDuqfvJKrv0ldXfnwQOc3EqQwubEe/4L9o=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=d1Lt3f7BfY16SVQAs2ZYXq2tu1p8pXR//xskLLZRTiGsHLd8i5mUJ0cxP7WuE2YmF
	gu/1cNOp2nIB4vhxtwFhc/a2xP7ez3Ig7g6SfaXV1km1SQOiOX2ptjBmgVourfHzfS
	/ZOyMokdGTmC1cmJfNpmtfxdhyAoS3rXkQ8dy3qw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9204Ov9093767
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:24 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 1 Oct 2019 19:04:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 1 Oct 2019 19:04:24 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9204JGk007494
	for <meta-ti@yoctoproject.org>; Tue, 1 Oct 2019 19:04:24 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 1 Oct 2019 20:04:06 -0400
Message-ID: <1569974651-63945-23-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1569974651-63945-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 22/27] uart-lld-rtos: SRCREV update to 01.00.00.16
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
X-List-Received-Date: Wed, 02 Oct 2019 00:04:33 -0000
Content-Type: text/plain

---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
index 5bd7d6f..d475eb5 100644
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -13,14 +13,14 @@ UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
 UART_LLD_GIT_PROTOCOL = "git"
 UART_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.15"
-UART_LLD_SRCREV = "4493f456549c85749a05b1f46bf0b75d23976db1"
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.16"
+UART_LLD_SRCREV = "7e606f1db126af3e4e8e6f8a9173e1004a844e97"
 
 BRANCH = "${UART_LLD_GIT_BRANCH}"
 SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UART_LLD_SRCREV}"
-PV = "01.00.00.15"
+PV = "01.00.00.16"
 PR = "r0"
 
 DEPENDS_append = " edma3-lld-rtos \
-- 
1.9.1


