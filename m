Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 50901E0080A; Thu, 28 Jun 2018 10:15:01 -0700 (PDT)
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
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A7B50E0080A
	for <meta-ti@yoctoproject.org>; Thu, 28 Jun 2018 10:15:00 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5SHF0oE028840
	for <meta-ti@yoctoproject.org>; Thu, 28 Jun 2018 12:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530206100;
	bh=mMr5f5YxrCDFrAz0nZa0JA2UVEReyY5Few0eVwbfBW0=;
	h=Resent-From:Resent-Date:Resent-To:From:To:CC:Subject:Date:
	In-Reply-To:References;
	b=LBt1lK9/Y7N5ujh4SAojO5Pu93BxsahBU0luGnTURKkRWQ3Wsg8O+ae6BuVKAtbIC
	bASVsDCNgqMdeUvZpBvT7dqzNKPZ7UIlr/ecwlbrV1hXypn5oRyI1noGHuRcsnvNTp
	WQbLqIwu1zT2m5ODm0LGp2QFse2jgXNL/nXrAjG8=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SHF0H0023977
	for <meta-ti@yoctoproject.org>; Thu, 28 Jun 2018 12:15:00 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 28 Jun 2018 12:14:59 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 28 Jun 2018 12:14:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SHExD8006363
	for <meta-ti@yoctoproject.org>; Thu, 28 Jun 2018 12:14:59 -0500
Resent-From: Denys Dmytriyenko <denys@ti.com>
Resent-Date: Thu, 28 Jun 2018 13:14:04 -0400
Resent-Message-ID: <20180628171404.GA26075@beryl>
Resent-To: <meta-ti@yoctoproject.org>
Received: from DLEE111.ent.ti.com (157.170.170.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3 via
	Mailbox Transport; Thu, 28 Jun 2018 10:14:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 28 Jun 2018 10:14:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 28 Jun 2018 10:14:11 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5SFEBhH023799;
	Thu, 28 Jun 2018 10:14:11 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.190.81])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w5SFEBx18281; Thu, 28 Jun 2018 10:14:11 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 28 Jun 2018 10:14:00 -0500
Message-ID: <20180628151400.31112-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20180628151400.31112-1-dmurphy@ti.com>
References: <20180628151400.31112-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.2330595
X-MS-Exchange-Processed-By-BccFoldering: 15.01.1466.003
MIME-Version: 1.0
Subject: [PATCH 2/2] linux-ti-staging: update ti2018.02-rc2 tag
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
X-List-Received-Date: Thu, 28 Jun 2018 17:15:01 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index a8322928..e6feff9d 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "0027520b443976042f208d318bb7266683f38b49"
+SRCREV = "3e637f01a8c09912cc459b4d2a12f8f97b36d1fc"
 PV = "4.14.50+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index be4d9bdc..75b22a75 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -54,8 +54,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "e13cb5edef64dd74a8a502677ef924d2418faaa9"
-PV = "4.14.50+git${SRCPV}"
+SRCREV = "9b7fea24f3c3c68433e8069f60c5e4eab01609e2"
+PV = "4.14.52+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.0.582.gccdcbd54c


