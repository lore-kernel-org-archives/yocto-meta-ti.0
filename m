Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01108E00D9F; Tue,  6 Aug 2019 11:54:39 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A3C3DE00D8C
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2019 11:54:37 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x76IsbVG025502
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565117677;
	bh=V9uTXs2K2oQtxfYCHkrHsAnKeAO0aLZqNgxf4MoOBAI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=KUyEagPG8v20/fCw8vwVXomzBfbWPsj/Bm+byeboTMJDTh9/kN8rDzRoclO0TdKil
	7wItHwDFpSsuhaCOFJbhAHMWZ/yD1m1BUU5zmLBeZ5mHOTkPzZUDQQ0iZi78yukvst
	CgiJ760FXoKziKwhb11caWTDInsC4DDVLSe0xZhI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x76Isb6n033762
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:37 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 6 Aug 2019 13:54:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 6 Aug 2019 13:54:37 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x76IsTFe070565
	for <meta-ti@yoctoproject.org>; Tue, 6 Aug 2019 13:54:36 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Aug 2019 14:54:03 -0400
Message-ID: <1565117660-52661-9-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1565117660-52661-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 08/25] iqn-lld: SRCREV update to 1.0.0.11A
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
X-List-Received-Date: Tue, 06 Aug 2019 18:54:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/iqn2-lld/iqn2-lld.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld.inc b/recipes-bsp/iqn2-lld/iqn2-lld.inc
index 2737562..29b230a 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld.inc
+++ b/recipes-bsp/iqn2-lld/iqn2-lld.inc
@@ -6,14 +6,14 @@ IQN2_LLD_GIT_PROTOCOL = "git"
 IQN2_LLD_GIT_BRANCH = "master"
 IQN2_LLD_GIT_DESTSUFFIX = "git/ti/drv/iqn2"
 
-# Following commit corresponds to DEV.IQN_LLD.01.00.00.11
-IQN2_LLD_SRCREV = "cf78b793523e42867f2c538ae19227d2ae764b86"
+# Following commit corresponds to DEV.IQN_LLD.01.00.00.11A
+IQN2_LLD_SRCREV = "41c0cd3cb4fc25453904f8c583ebd0a7a0e5b940"
 
 BRANCH = "${IQN2_LLD_GIT_BRANCH}"
 SRC_URI = "${IQN2_LLD_GIT_URI};destsuffix=${IQN2_LLD_GIT_DESTSUFFIX};protocol=${IQN2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${IQN2_LLD_SRCREV}"
 
-PV = "1.0.0.11"
+PV = "1.0.0.11A"
 INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2l"
-- 
1.9.1


