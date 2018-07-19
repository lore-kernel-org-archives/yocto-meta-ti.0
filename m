Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7861E010F0; Thu, 19 Jul 2018 10:24:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 742A0E010F0
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 10:24:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6JHOPHe021992
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532021065;
	bh=UbAXG0dR5wgBS6eza7yBmowG4+O+0YxGpex3VmM0YmI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=E809SwUYpV7xeX96gHE1DoFnzRX4BWvpYpqxz66/lYnYXpBoxkT9js7H65eJNh6Kk
	h6N5V+XvRlh7Opx6kTOf7jdt6jLGrVgNGVtQBCYtbZiYpI0DfBQTnfV7FMuNdBP0jh
	oWZl/9RR1IsA1omGbQHN1Sled9TJk2k3YbsoJ6ZU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOPGK015374
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 19 Jul 2018 12:24:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 19 Jul 2018 12:24:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6JHOORX023684
	for <meta-ti@yoctoproject.org>; Thu, 19 Jul 2018 12:24:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 19 Jul 2018 13:23:36 -0400
Message-ID: <1532021058-48916-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1532021058-48916-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 03/45] bcp-lld-rtos: Update to version 2.1.0.7
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
X-List-Received-Date: Thu, 19 Jul 2018 17:24:29 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
index c3d49b3..6806687 100644
--- a/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
+++ b/recipes-bsp/bcp-lld/bcp-lld-rtos_git.bb
@@ -13,14 +13,14 @@ BCP_LLD_GIT_PROTOCOL = "git"
 BCP_LLD_GIT_BRANCH = "master"
 BCP_LLD_GIT_DESTSUFFIX = "git/ti/drv/bcp"
 
-# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.06"
-BCP_LLD_SRCREV = "44e2ffcb6fd236c41f7ea8f9a1684833f5361daa"
+# Below commit ID corresponds to "DEV.BCP_LLD.02.01.00.07"
+BCP_LLD_SRCREV = "84c34a7e79a017c39319daa453cea6ea1b45751c"
 
 BRANCH = "${BCP_LLD_GIT_BRANCH}"
 SRC_URI = "${BCP_LLD_GIT_URI};destsuffix=${BCP_LLD_GIT_DESTSUFFIX};protocol=${BCP_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BCP_LLD_SRCREV}"
-PV = "02.01.00.06"
+PV = "02.01.00.07"
 PR = "r0"
 
 S = "${WORKDIR}/${BCP_LLD_GIT_DESTSUFFIX}"
-- 
1.9.1


