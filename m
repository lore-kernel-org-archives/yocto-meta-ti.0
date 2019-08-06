Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 63F7DE00D84; Tue,  6 Aug 2019 12:54:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 573DAE00D79
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 12:54:14 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76JsDhu082825
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 14:54:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565121253;
	bh=eDhRuZbtMMypezNIdYUyTdKAeP6ttdn1PPEAF5EPVHI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=KU5PTb57NAMIOEBsgj+ihV8zIoK2H8N+cOkCSuQqSzbIvqaJg/2A1Er4Bmf0MMTv/
	MPSv7LE2GdR2RD8/21TUcWgQBnln68BAheaU1ISonYDPAU1tqZ8QW4x3lgpqVDP/V+
	PJgnB7hkl77ZkeqXrFrpsmDZXQLdjdVdlWfa3D78=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76JsD2U100258
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 14:54:13 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 14:54:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 14:54:13 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76JsDUL026798;
	Tue, 6 Aug 2019 14:54:13 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:12 -0500
Message-ID: <20190806195412.31979-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.22.0.214.g8dca754b1e
In-Reply-To: <20190806195412.31979-1-dmurphy@ti.com>
References: <20190806195412.31979-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] u-boot-ti-staging: update to ti2019.03-rc1 tag
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
X-List-Received-Date: Tue, 06 Aug 2019 19:54:15 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
index f8349acc..bef0d2ba 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2019.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r20"
+PR = "r21"
 
 BRANCH = "ti-u-boot-2019.01"
 
-SRCREV = "060705d06cc36539a8e502a4cd500d8a80d74a48"
+SRCREV = "df20cf2425347d7fbaeaf3c59122c37d43aab1ad"
-- 
2.22.0.214.g8dca754b1e


