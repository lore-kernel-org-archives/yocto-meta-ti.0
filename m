Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7C87AE0090C; Wed,  8 Aug 2018 11:48:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99948E00875
	for <meta-ti@yoctoproject.org>; Wed,  8 Aug 2018 11:48:50 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w78Imoss044721
	for <meta-ti@yoctoproject.org>; Wed, 8 Aug 2018 13:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533754130;
	bh=zUPj7j3/Xl/hA5a+ZnfR5IDts0DHWUs1GaJBjf3Xqac=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=J3GQTP4XMS7qZUN75Zaikl6NufiVXMuM40O6oDWppgqmc3ty2d+0xBjRWCA3Fxk25
	404lG2hCsJzF/UPMiV7hyYYO9fIqni8zu6wzlbfJNE5R1/SgZuEYGOc/qCERudMfJ0
	O8LI7a8XVSG0KbwKYZdvXDmUqsai7ewQGqsrYJC0=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w78Imo1n013398
	for <meta-ti@yoctoproject.org>; Wed, 8 Aug 2018 13:48:50 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 8 Aug 2018 13:48:49 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 8 Aug 2018 13:48:49 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w78ImngS016977;
	Wed, 8 Aug 2018 13:48:49 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.156.167])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w78Imnx07818; Wed, 8 Aug 2018 13:48:49 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 8 Aug 2018 13:48:39 -0500
Message-ID: <20180808184839.5927-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20180808184839.5927-1-dmurphy@ti.com>
References: <20180808184839.5927-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] linux-ti-staging: update ti2018.03-rc2 tag
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
X-List-Received-Date: Wed, 08 Aug 2018 18:48:52 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index bffa66de..dc0d25a7 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "0184cb49ab53b1d30bb53f944f839fe2f8327399"
-PV = "4.14.59+git${SRCPV}"
+SRCREV = "bf9805829c7d263775e9323ad16a4c5e3373d04e"
+PV = "4.14.61+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index 1131d18a..6bb5c33b 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -55,8 +55,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "f35ef92fbbf0b821eb5e25c6500917144b46c1a4"
-PV = "4.14.59+git${SRCPV}"
+SRCREV = "7364914505da7bc264d2f8a38c4ff4f865fcba03"
+PV = "4.14.61+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "b"
-- 
2.17.0.582.gccdcbd54c


