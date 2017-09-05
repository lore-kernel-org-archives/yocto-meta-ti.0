Return-Path: <jjhiblot@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10831E00C2B; Tue,  5 Sep 2017 08:42:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 849F5E009F5
	for <meta-ti@yoctoproject.org>; Tue,  5 Sep 2017 08:42:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v85FgbH9032237
	for <meta-ti@yoctoproject.org>; Tue, 5 Sep 2017 10:42:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504626157;
	bh=xuO33OlZ6CSQIDIWFO3Ulycwqq+F+TNqqiDZ6tZr3nc=;
	h=From:To:CC:Subject:Date;
	b=j0FCi+gzz0+8tfiw8D3VTBQoV9bFWcBSKznuXufx4yBHHaODKxuPr5Ol14QZbV1nj
	sxuUog3oZmCxPzr4UB6icJkZmnMk78Yb8IZR+UPxvHqfzmd6Hpzg45Xgq/qI0h1dT/
	xCQCZKumxmSnMUVfBdW6ciRtbjzgJaNZG26gFf0g=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85FgbQ5009478
	for <meta-ti@yoctoproject.org>; Tue, 5 Sep 2017 10:42:37 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 5 Sep 2017 10:42:37 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 5 Sep 2017 10:42:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v85FgaJQ010570;
	Tue, 5 Sep 2017 10:42:36 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <denys@ti.com>, <meta-ti@yoctoproject.org>
Date: Tue, 5 Sep 2017 17:42:34 +0200
Message-ID: <1504626154-18004-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] [PATCH] linux-ti-staging 4.4: update to 4.4.86 and ti2016.08-rc3 tag
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
X-List-Received-Date: Tue, 05 Sep 2017 15:42:39 -0000
Content-Type: text/plain

Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index f806e62..7a9e4aa 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "a316253be548aa1fbad2ede3a1c8b62ac2f142e5"
+SRCREV = "d9d960591e172dffc7e94278a262fa129f0c92ff"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 433f6e8..672801d 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -82,8 +82,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "3c90ccbbfc222646aaaa0a263afc2028c1c6333e"
-PV = "4.4.84+git${SRCPV}"
+SRCREV = "96206b1c35877a54a5d22de90122788976d78a94"
+PV = "4.4.86+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
1.9.1


