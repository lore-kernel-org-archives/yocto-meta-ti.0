Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CE50E00D83; Tue,  6 Aug 2019 11:54:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BA26E00C9B
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:35 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsZdr025485
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117675;
	bh=v/zqRaEQNs3rZhDx1rJIjtK0RLEUgATfDc4SKFbe1k0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=K63U5X/qQ0V7jZ9K2Qkkp63cFwNNc1KQNUGxeTn6U7G4cvr64WVhaUMzO5hXIPF0e
	sK/RUv7PVVtvCihiYXOA7QRpj98zYMLRwrVnA+cUBtou67Ls1czRHslhI1BYbIoD2/
	YJoXza00VhqFpCzUmYhiQEOHUGTKtPESrPm1JX7c=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76IsZNZ063872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:35 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFX070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:53:56 -0400
Message-ID: <1565117660-52661-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 01/25] aif2-lld: SRCREV update t 01.02.00.02B
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:36 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/aif2-lld/aif2-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
index 65b12cb..f06dde1 100644
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -7,14 +7,14 @@ AIF2_LLD_GIT_PROTOCOL = "git"
 AIF2_LLD_GIT_BRANCH = "master"
 AIF2_LLD_GIT_DESTSUFFIX = "git/ti/drv/aif2"
 
-# The following commit correspond to DEV.AIF2LLD.01.02.00.02A
-AIF2_LLD_SRCREV = "3eecba9b3b07b0c8fc39daa79fe4e8204e5d0e0e"
+# The following commit correspond to DEV.AIF2LLD.01.02.00.02B
+AIF2_LLD_SRCREV = "5304fdbca98b7f1aed8cb66bc6750f99d8bb7094"
 
 BRANCH = "${AIF2_LLD_GIT_BRANCH}"
 SRC_URI = "${AIF2_LLD_GIT_URI};destsuffix=${AIF2_LLD_GIT_DESTSUFFIX};protocol=${AIF2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${AIF2_LLD_SRCREV}"
 
-PV = "1.2.0.2A"
+PV = "1.2.0.2B"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2hk"
-- 
1.9.1


