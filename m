Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD252E016D5; Mon, 18 Jun 2018 16:53:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FDCAE016D3
	for <meta-ti@yoctoproject.org>; Mon, 18 Jun 2018 16:53:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5INrHuS027050
	for <meta-ti@yoctoproject.org>; Mon, 18 Jun 2018 18:53:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529365997;
	bh=Y7Dbhrew+mrOeUkjouOzSwYWCF/l4g0rS34VFI14cPg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=VmSutDtm92aOd40e8qd+dMRC+sWIa/o16+C5SWzq7pVh2lg4oi7GMt3Lnrz1YVY3+
	CipEzYHP5t4ava0xUkjJsZUtHKlBESgLPp2FB5O2dn9nLpaUe4OFtYJOSkRMhkcYgn
	891hFmQXh2xlxF1oXlKch4LSX1aV3x+a2GIfwCqI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5INrHRP004319
	for <meta-ti@yoctoproject.org>; Mon, 18 Jun 2018 18:53:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 18 Jun 2018 18:53:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 18 Jun 2018 18:53:17 -0500
Received: from puget.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5INrHtK026396;
	Mon, 18 Jun 2018 18:53:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 18 Jun 2018 23:52:37 +0000
Message-ID: <20180618235237.9255-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180618235237.9255-1-denys@ti.com>
References: <20180618235237.9255-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/2] linux-ti-staging: update to 4.14.50 and ti2018.02-rc1 tag
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
X-List-Received-Date: Mon, 18 Jun 2018 23:53:18 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index a5ed2536..a8322928 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "2c7fc5f1d50fbfe18bebe22361fd4b522aeddeb7"
-PV = "4.14.49+git${SRCPV}"
+SRCREV = "0027520b443976042f208d318bb7266683f38b49"
+PV = "4.14.50+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 3aa4dd7c..be4d9bdc 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -54,8 +54,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "e9a15b9881f68dc03c7a6a7d9730d706cde4bd1f"
-PV = "4.14.49+git${SRCPV}"
+SRCREV = "e13cb5edef64dd74a8a502677ef924d2418faaa9"
+PV = "4.14.50+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1


