Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 72BDFE00C2B; Tue,  5 Sep 2017 09:22:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEEFDE00C1C
	for <meta-ti@yoctoproject.org>; Tue,  5 Sep 2017 09:22:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85GMhud012951
	for <meta-ti@yoctoproject.org>; Tue, 5 Sep 2017 11:22:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504628563;
	bh=o6wguAIO02aUsblRrgCmKt+vkJ8p1yEtZpE2n84i7IY=;
	h=From:To:CC:Subject:Date;
	b=MdsCY6khFACSMQDTZvfLJvsoyzWejpH06yu4U4rIu9Aprf5+ZRh9z8aF1IeYM6Zru
	khx4LlpYxAGIEUOML6OHW9wNy8B8s1eVmGBZXVC85I621BizCJn6Q3rg9qoKYLNVJ/
	9eDKPTmRYS3x2l6OHXz310VfYGa+D/2szSwZH1dM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85GMcvi030384
	for <meta-ti@yoctoproject.org>; Tue, 5 Sep 2017 11:22:38 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 11:22:38 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 11:22:38 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85GMcw7032365;
	Tue, 5 Sep 2017 11:22:38 -0500
Received: from localhost ([172.22.138.220])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v85GMc329801; Tue, 5 Sep 2017 11:22:38 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Sep 2017 11:22:31 -0500
Message-ID: <20170905162232.7160-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] linux-ti-staging: update to ti2017.04-rc2 tag
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
X-List-Received-Date: Tue, 05 Sep 2017 16:22:55 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index 3ee1588a..d4b51a36 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "e23d2cd3402ba7566ed2d7600be470a06d777495"
+SRCREV = "b758af1b09065bce3331e128423ea52cc411fa2c"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 03dbac4f..03a54e05 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "bf788c725a3db00226e78cce9e1c4b81c48e9652"
-PV = "4.9.45+git${SRCPV}"
+SRCREV = "b7dd237abcd1363fc166173b59a86a107ca0bcce"
+PV = "4.9.47+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "c"
-- 
2.14.0


