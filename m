Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CF216E00B5E; Thu, 25 Oct 2018 04:58:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44B4BE00AE0
	for <meta-ti@yoctoproject.org>; Thu, 25 Oct 2018 04:58:15 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w9PBwEmh078436
	for <meta-ti@yoctoproject.org>; Thu, 25 Oct 2018 06:58:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1540468694;
	bh=72aNiXTiys8dPqp49i36LvjfAjhn802GuuGcUOPvxVY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=mPlHMFAEt9ls+TLCjMSI8KibcYqbqVi73yBQ2AnGmzq9C75C2iVea0/I1zkbTzCmU
	tNTOAfN15aA6QT43Z4hgJ5QvzY/r23X5/2MzQNC5DGRYnbVb8OMraKrOsEfxkpBe0H
	fYcQ+EqAEZ+5ouN3CMbmTqz+cB6fnHwx8w7bjtQ0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id w9PBwERB119087
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 25 Oct 2018 06:58:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 25 Oct 2018 06:58:14 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 25 Oct 2018 06:58:14 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w9PBwEmP012079;
	Thu, 25 Oct 2018 06:58:14 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.66.177])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w9PBwEx14319; Thu, 25 Oct 2018 06:58:14 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 25 Oct 2018 06:58:05 -0500
Message-ID: <20181025115805.7963-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20181025115805.7963-1-dmurphy@ti.com>
References: <20181025115805.7963-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] linux-ti-staging: update to ti2018.05-rc1 tag
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
X-List-Received-Date: Thu, 25 Oct 2018 11:58:15 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index b2e4a9a8..d22611f7 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "c6a232830729ce9ffce2b78c963893ba53b33a2a"
+SRCREV = "95beb30655768522678a593c2415674953e2838d"
 PV = "4.14.71+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 8d7f581d..6a17bf75 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "5358414c6c23c63a4b8df70b0abc8901dec5a560"
-PV = "4.14.74+git${SRCPV}"
+SRCREV = "ab0df20e1ca1aa93714bb5ff647438dc980a35d9"
+PV = "4.14.76+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.19.0


