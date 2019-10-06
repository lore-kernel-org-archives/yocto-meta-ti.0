Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF5FDE00DB6; Sun,  6 Oct 2019 09:53:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F01C2E00D99
	for <meta-ti@yoctoproject.org>; Sun,  6 Oct 2019 09:52:57 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x96GqvLf100622
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570380777;
	bh=eTljR1uLtZaJu/lfOJobKb+TaZ+Td32df9O/UbKsRxM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=mVayj5L5Q/qdN8HLbMD47csWYBRhx2seg0NwT5DPUXPopXM7Fu2zvYIkho2uz4tpo
	rmXpqnjcie3eImkXLO40lKtJi1/bMWpIpwvUMoX+NjxmojxsIIM13OD3j/H57c+Ijp
	JXo3h3GBjpoT7OZkWaM9IMokyQvjOniENUlRRfXs=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x96Gqv7h037704
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:57 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sun, 6 Oct 2019 11:52:55 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sun, 6 Oct 2019 11:52:55 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x96GqsKA103999
	for <meta-ti@yoctoproject.org>; Sun, 6 Oct 2019 11:52:57 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Oct 2019 12:52:51 -0400
Message-ID: <1570380771-1351-14-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570380771-1351-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH 13/13] ti-pdk-build-rtos: SRCREV update to 01.00.00.14A
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
X-List-Received-Date: Sun, 06 Oct 2019 16:53:03 -0000
Content-Type: text/plain

---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index c403642..2e1a557 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -4,15 +4,15 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;beginline=1;endline=31;md5=92ab6f5e10f150
 
 require recipes-ti/includes/ti-paths.inc
 
-PV = "01.00.00.14"
+PV = "01.00.00.14A"
 PR = "r0"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
 PDK_BUILD_GIT_BRANCH = "master"
 
-# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.14"
-PDK_BUILD_SRCREV = "21a7a453bed44e383464fa709b206064c2e0caa0"
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.14A"
+PDK_BUILD_SRCREV = "0a459346f029fb33a4a808a206382ef3c1b8086f"
 
 BRANCH = "${PDK_BUILD_GIT_BRANCH}"
 SRC_URI = "\
-- 
1.9.1


