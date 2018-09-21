Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D4B0E00AAA; Fri, 21 Sep 2018 10:38:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C3EBEE0080F
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2018 10:38:00 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8LHc0jv108829
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2018 12:38:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537551480;
	bh=GqYNTZq6y6bCYz0WInZCvhvRdLm2VU7FaESnGOq+g6k=;
	h=From:To:CC:Subject:Date;
	b=ifhvb6vNg7o2kr1yO0nqJK7u//49bPkWVlqJTr4qLdPFq9t8HbuDNUmtIKVB1eb7T
	i85aebky0RcAwWgUH2SaUugMKXZXhBuprilS9X8bOAHcqaTxZGZgIcxIg3hu6krIdl
	nWPbU1s75EL3EXMUOiM+e+84GbPNlzU9Cii0UEZo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8LHc0MF008421
	for <meta-ti@yoctoproject.org>; Fri, 21 Sep 2018 12:38:00 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 21 Sep 2018 12:38:00 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 21 Sep 2018 12:38:00 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8LHbxDm007551;
	Fri, 21 Sep 2018 12:37:59 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.187.66])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w8LHbxx13979; Fri, 21 Sep 2018 12:37:59 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 21 Sep 2018 12:37:40 -0500
Message-ID: <20180921173741.1052-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] u-boot-ti-staging: update to ti2018.04-rc2 -tag
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
X-List-Received-Date: Fri, 21 Sep 2018 17:38:01 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index f58c6852..98e9a7d0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r20"
+PR = "r21"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "d07de09b73daa65157925d928955219d4915a94b"
+SRCREV = "9b8c6b92b7cbbbe027cf73743686de46d1f1574b"
-- 
2.19.0


