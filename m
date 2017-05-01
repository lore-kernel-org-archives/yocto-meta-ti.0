Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4B79BE00AA2; Mon,  1 May 2017 12:01:57 -0700 (PDT)
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
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E96EAE0083D
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:01:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41J1qS6030785
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493665312;
	bh=phmUE3Om7ldim44aa9WlM1zwrkdMwZNdsPkveuOgnWo=;
	h=From:To:CC:Subject:Date;
	b=YBNECeuXY4YltSvaF/mRxZmQfxGImNl5CpSymIhWhHzNwGgESwHwn5iBCZOhIrCWZ
	0OMhNpJqyl2zPZ3rHbfA5VIi5DvolIIVgwdBJcQjS3xXDFEE2hkVQp0SEV0hbpvvX6
	aWYXZ78EpUqG33beQxwkQsVARb9xoEqOOucFmp+w=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41J1qmL018462
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:01:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:01:51 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41J1plT000364;	Mon, 1 May 2017 14:01:51 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.109.252])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v41J1p300527; Mon, 1 May 2017 14:01:51 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 14:01:47 -0500
Message-ID: <20170501190150.4110-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [v2 PATCH 1/4] linux-ti-staging: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:01:57 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - No changes

 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index ba5b30c4..f156ab1f 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "9aca48cec363e084da1a6fef6ca4e16dd6788312"
+SRCREV = "ca8f5854f1d211373e2bd80307215b086f18cbe1"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index ab5852bc..17e5af58 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "36a655ef1ade71c52c52c2e2ba5cb6cbb2e5031a"
-PV = "4.9.24+git${SRCPV}"
+SRCREV = "cfe6f9907fd6d84fdcc2728c8ec9c79c07127c2e"
+PV = "4.9.25+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "c"
-- 
2.12.2


