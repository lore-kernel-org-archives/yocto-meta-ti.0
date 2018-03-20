Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25C60E0091A; Tue, 20 Mar 2018 11:44:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98AA8E008D2
	for <meta-ti@yoctoproject.org>; Tue, 20 Mar 2018 11:43:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2KIhx3h008198
	for <meta-ti@yoctoproject.org>; Tue, 20 Mar 2018 13:43:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521571439;
	bh=pUCsFNNE2quhcNXdaUtu9uxkJnpeVpg9GPeO7NvWe3A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=r4uT7TA21Ws0C3GvSxnPbRTAPvcAtNZqQ86pg1BGsi66ikeJuxMvbec0v2YUvD2Hd
	cL/uD0iYNCSaISROBagAnNsIVx9Yz3ED1bIRP7GzO8dUVSnMXHTM2HpATyii9u2ca+
	C6+OfpRL5BsbdE37XOAOf3k5zkLvT16wVpQyV/Ao=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KIhx44015203
	for <meta-ti@yoctoproject.org>; Tue, 20 Mar 2018 13:43:59 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 20 Mar 2018 13:43:58 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 20 Mar 2018 13:43:58 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2KIhw3v020251;
	Tue, 20 Mar 2018 13:43:58 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.153.33])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w2KIhwx14156; Tue, 20 Mar 2018 13:43:58 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 20 Mar 2018 13:43:32 -0500
Message-ID: <20180320184332.24392-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20180320184332.24392-1-dmurphy@ti.com>
References: <20180320184332.24392-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] u-boot-ti-staging: update to ti2018.00-rc3
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
X-List-Received-Date: Tue, 20 Mar 2018 18:44:01 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index 67bf4383..d9835306 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "7a172930b2d94c7eed67fe4d9881984b5a79ef29"
+SRCREV = "3df845759f674f8b14f7868e7711409cd86f84c2"
-- 
2.16.2.440.gc6284da4f


