Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 87A32E00AF2; Tue, 28 Nov 2017 09:34:17 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 444CFE00A9C
	for <meta-ti@yoctoproject.org>; Tue, 28 Nov 2017 09:34:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vASHYFaJ012919
	for <meta-ti@yoctoproject.org>; Tue, 28 Nov 2017 11:34:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1511890455;
	bh=iJTuxMJuGEraE7W9/wJ1fRO8HF/LYqhnzuZggObg8CI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=x0DELYgWjtODBfdCUeIHuLoiuzWi6ZQuohNCsxEerOdgV360MJBXhHTYg06cM9hks
	Ho4XDzsOUiWtEkvcneVCFsgUNi+AD2pH+pPubYwt0urdsRqQp7koXay2FBobL+zbY2
	TCKFPxcI7FMO6vkjxf30bHOvHvmRdwCVgcorBdUw=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASHYFug010536
	for <meta-ti@yoctoproject.org>; Tue, 28 Nov 2017 11:34:15 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 28 Nov 2017 11:34:15 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 28 Nov 2017 11:34:14 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vASHYExa028974;
	Tue, 28 Nov 2017 11:34:14 -0600
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.171.220])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	vASHYE306328; Tue, 28 Nov 2017 11:34:14 -0600 (CST)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 28 Nov 2017 11:34:08 -0600
Message-ID: <20171128173408.19457-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20171128173408.19457-1-dmurphy@ti.com>
References: <20171128173408.19457-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] u-boot-ti-staging: update to ti2017.06-rc2 tag
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
X-List-Received-Date: Tue, 28 Nov 2017 17:34:17 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index 26ddfd66..8b224f15 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r19"
+PR = "r20"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "55dc9466139b126311e92e7a80f088c32df3dfcb"
+SRCREV = "df499e78a239409b53f772273e16cd18ff522f5a"
-- 
2.15.0.124.g7668cbc60


