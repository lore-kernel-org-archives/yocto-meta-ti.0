Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5B6CCE00C52; Wed, 14 Nov 2018 12:25:35 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 305C2E00C4B
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2018 12:25:33 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAEKPXua092078
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2018 14:25:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542227133;
	bh=ZR9IsbFKm57RfsIHLwk0kkMmJJmLZvXdQbESjxgWlSM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WEyo5S7uuAwXcQv4RYpXNtDjIHW7IblrW8LNose5Y16oCMfHwKRWnK9WzbFVIOk57
	3IpLdnQnFC6Yo+wmY3y2We01bxy+FwJstDslmJOvk608fqNAlzk4H3ZmfFMz3pR0+g
	aMo+97KT/L6yWw3J9xVnsqroRnuwjuReF9t4+qNE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAEKPXnG120407
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 14 Nov 2018 14:25:33 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 14 Nov 2018 14:25:33 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 14 Nov 2018 14:25:33 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAEKPXPv030834;
	Wed, 14 Nov 2018 14:25:33 -0600
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.179.134])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	wAEKPWx23097; Wed, 14 Nov 2018 14:25:32 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 14 Nov 2018 14:25:19 -0600
Message-ID: <20181114202519.7687-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20181114202519.7687-1-dmurphy@ti.com>
References: <20181114202519.7687-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 2/2] u-boot-ti-staging: update to ti2018.05-rc4 tag
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
X-List-Received-Date: Wed, 14 Nov 2018 20:25:35 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index 6fa2af9a..f027dc44 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r27"
+PR = "r28"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "9e1b118712213d2cab15280b5c6776bef35d4d59"
+SRCREV = "b1db1fb0d39fa706f0ad8e36f301aba429475bed"
-- 
2.19.1.856.g8858448bb4


