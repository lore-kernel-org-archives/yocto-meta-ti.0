Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B085E00D14; Tue, 17 Oct 2017 11:10:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5BD83E00B83
	for <meta-ti@yoctoproject.org>; Tue, 17 Oct 2017 11:10:19 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9HIA8A7003930
	for <meta-ti@yoctoproject.org>; Tue, 17 Oct 2017 13:10:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1508263808;
	bh=nVxK76tvt6daZzA1waBAKKvuJLol+mfEQ/FLDR594+s=;
	h=From:To:CC:Subject:Date;
	b=J2qQJK0oHldme3tHJl71VTVYcWDCLf3QqLaNvaud9kkUWr54UvA0IngUsH0Zsuk5f
	HK6FlpeuaOSzUROIc/FkNKY4VFOOZuNCOqOrBh01vbcBbC7RR5SFrMr8Ky0oPdOfmw
	udGcR0rpEOvXazZ1Z0nD3XHqXs8U8/OVPwd7BjsI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9HIA3rq005972
	for <meta-ti@yoctoproject.org>; Tue, 17 Oct 2017 13:10:03 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 17 Oct 2017 13:10:03 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 17 Oct 2017 13:10:03 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9HIA3vv012182;
	Tue, 17 Oct 2017 13:10:03 -0500
Received: from localhost ([172.22.132.69])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v9HIA2311101; Tue, 17 Oct 2017 13:10:03 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 17 Oct 2017 13:09:51 -0500
Message-ID: <20171017180952.397-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] linux-ti-staging: update to ti2017.05-rc2 tag
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
X-List-Received-Date: Tue, 17 Oct 2017 18:10:28 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index 748b0856..c29451e2 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "7780e12a123b1215e26f91014efcf4d2ce0169b4"
+SRCREV = "5b92b93b8e2b96219a11c0be536589a346817112"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 01253330..a1de6372 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "89cbc74ba780b1c87cc9a498f318fba91640c594"
-PV = "4.9.54+git${SRCPV}"
+SRCREV = "0c430af23d292a548459fbb8440474c1c09ea571"
+PV = "4.9.56+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.14.0


