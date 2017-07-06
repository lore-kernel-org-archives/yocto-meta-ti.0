Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF1E2E00B9D; Thu,  6 Jul 2017 09:06:23 -0700 (PDT)
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
	*      [198.47.27.80 listed in list.dnswl.org]
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B75EDE00B2F
	for <meta-ti@yoctoproject.org>; Thu,  6 Jul 2017 09:06:22 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v66G6LI1020494
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:06:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1499357181;
	bh=EJDwPSUKvi7xtXMIOo9+SbwiZ5Ncwd+su3p/01CyQuc=;
	h=From:To:CC:Subject:Date;
	b=A85pHPMhDhyW41+cXc5GG8m7vwFAb6mZQcOngvO8zJIoRyswvE78fKkxY7AmENkZS
	ayxAlcyvwt8t+Ncr7ZJP4wpU8vY3o+Ft83T2/wo5xhQzApOdEIDjCwV3Jkual4cWuV
	sxkHC7zygHneSC/BA3LlF9A0BEfajm6bXQyG5u+c=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v66G6LQP018184
	for <meta-ti@yoctoproject.org>; Thu, 6 Jul 2017 11:06:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 6 Jul 2017 11:06:21 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v66G6KLr022159;	Thu, 6 Jul 2017 11:06:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 6 Jul 2017 12:06:18 -0400
Message-ID: <1499357178-23074-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] ti-staging: Inhibiting sysroot strip & package debug split
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
X-List-Received-Date: Thu, 06 Jul 2017 16:06:23 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/includes/ti-staging.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/includes/ti-staging.inc b/recipes-ti/includes/ti-staging.inc
index b588805..ae523ce 100644
--- a/recipes-ti/includes/ti-staging.inc
+++ b/recipes-ti/includes/ti-staging.inc
@@ -1,4 +1,6 @@
 INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_SYSROOT_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
 
 ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-dev = "1"
-- 
1.9.1


