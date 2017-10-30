Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1861CE00BB7; Mon, 30 Oct 2017 13:42:11 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 972EFE00AAF
	for <meta-ti@yoctoproject.org>; Mon, 30 Oct 2017 13:42:10 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9UKg9Uk024354
	for <meta-ti@yoctoproject.org>; Mon, 30 Oct 2017 15:42:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509396129;
	bh=3wctTBbljS+O3JpWeOb6+H0IJzS+jReEvzsKhXm5/pI=;
	h=From:To:CC:Subject:Date;
	b=qqxbH5hojXbwttZSlI2wlFDrFmrr/Mav5Db89oxnvRjn3fMDrcUapTGngn7acDR8h
	0X3dwznbXVJPGtcBhsYX2aNRYMAceFLkIn9f3HQMQugn+kDf+GRau3tF94kjULI+CS
	YZ3eA8ntBZtYYsrpa8faU53NxPeVinrnPLEbrt5Q=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9UKg9Lv011901
	for <meta-ti@yoctoproject.org>; Mon, 30 Oct 2017 15:42:09 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 30 Oct 2017 15:42:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 30 Oct 2017 15:42:09 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9UKg9Tn010101;
	Mon, 30 Oct 2017 15:42:09 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.162.153])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v9UKg9308979; Mon, 30 Oct 2017 15:42:09 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 30 Oct 2017 15:42:02 -0500
Message-ID: <20171030204203.32301-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] linux-ti-staging: update to ti2017.05-rc4 tag
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
X-List-Received-Date: Mon, 30 Oct 2017 20:42:11 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index b968599d..3f1daf86 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "879814ad1872ce977e0946f04453a180d973ba2a"
+SRCREV = "3b472fc107a2377cb5ea0c6d2f2fcffd65a97e2d"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index f700e5b7..50a3b5d6 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "fa9448e5ca17ea67d2ded2a169c58fcf7e243fb4"
-PV = "4.9.58+git${SRCPV}"
+SRCREV = "6aac5fd2726e9fbe5c9f3e3ce588f309c5d95023"
+PV = "4.9.59+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.14.0


