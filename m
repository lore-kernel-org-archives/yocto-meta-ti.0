Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2947DE00B77; Tue, 27 Jun 2017 09:04:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E1D88E00B1B
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 09:04:36 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5RG4ZHJ020194
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 11:04:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498579475;
	bh=DAA1eD9fC5SJlUuS//+FoN1b81PnDig6gVqJywpr6w8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UdhuB/0/9igxRRNWs2OhcoNci/ppsKrqCylKBBO8Adxdn1GgnseJMeha9xlNRjoYU
	DCHVrl6rTpnC44WAlsoHIPi/b3uVbwgM5hooQXOieG4/K2KXMxFBEFuZcNDwSWMPnH
	eHNt/dXI2na8guV7nXgO3/9Xaxf8903neOCL7Rp8=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5RG4Z0l017323
	for <meta-ti@yoctoproject.org>; Tue, 27 Jun 2017 11:04:35 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 27 Jun 2017 11:04:35 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5RG4ZGj020826;	Tue, 27 Jun 2017 11:04:35 -0500
Received: from localhost ([172.22.135.11])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v5RG4Z317291;
	Tue, 27 Jun 2017 11:04:35 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Jun 2017 11:04:17 -0500
Message-ID: <20170627160417.20771-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170627160417.20771-1-dmurphy@ti.com>
References: <20170627160417.20771-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-ti-staging: update to ti2017.02-rc6 tag
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
X-List-Received-Date: Tue, 27 Jun 2017 16:04:40 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index ab5d6c22..27feb523 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "f8d2ec5b8ec4df32f581902dc7932e0243668e46"
+SRCREV = "6344c479b22e6cf73ff11f6fe65f9b1458ac5b5a"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 4e4098c0..b828c018 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "23cf36bd2bce6512cec5c141bb4953ac333b44d8"
-PV = "4.9.32+git${SRCPV}"
+SRCREV = "c035928ff9b3409185f79544e9e131383085a2ac"
+PV = "4.9.34+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "c"
-- 
2.13.2.516.ge629a7d28


