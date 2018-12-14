Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0C9BE00DD3; Fri, 14 Dec 2018 11:31:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F558E00DA9
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 11:31:55 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEJVt9A125674
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:55 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544815915;
	bh=5MTZz70+19oP2aYEXW14QV1G6PdBU1eht/D0GpQjzso=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Zzj/2JUetkQJSuX/clHP+a1shV1zIWwUxEJbibJ5nlSzJ4FJx2YzrqykwKQJafQrJ
	O2eqj5x24jDL4hMNK4OwVDWRjCT2EGNFk65rw3jEco7XqCmJAodxREw+tYSDqNtCNz
	NVoMdphCNk+D3tWDEGTdN8iPjqiVQBe8ka0fR1+I=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEJVs8n087525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:55 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 13:31:54 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 13:31:54 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEJVmdV031115
	for <meta-ti@yoctoproject.org>; Fri, 14 Dec 2018 13:31:54 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 14 Dec 2018 14:31:40 -0500
Message-ID: <1544815903-10792-32-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1544815903-10792-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 31/34] udma-lld-rtos: SRCREV update to 01.00.00.01
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
X-List-Received-Date: Fri, 14 Dec 2018 19:31:55 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/udma-lld/udma-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
index ad6be64..c918742 100644
--- a/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
+++ b/recipes-bsp/udma-lld/udma-lld-rtos_git.bb
@@ -13,14 +13,14 @@ UDMA_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/udma-lld.git"
 UDMA_LLD_GIT_PROTOCOL = "git"
 UDMA_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.00"
-UDMA_LLD_SRCREV = "745f7d3fa12cca6507821489451ffe0cfad4609e"
+# Below commit ID corresponds to "DEV.UDMA_LLD.01.00.00.01"
+UDMA_LLD_SRCREV = "3a17e8cb4df073368e3a261c6482eba733aff78e"
 
 BRANCH = "${UDMA_LLD_GIT_BRANCH}"
 SRC_URI = "${UDMA_LLD_GIT_URI};protocol=${UDMA_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UDMA_LLD_SRCREV}"
-PV = "01.00.00.00"
+PV = "01.00.00.01"
 PR = "r0"
 
 DEPENDS_append = " osal-rtos \
-- 
1.9.1


