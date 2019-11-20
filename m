Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 09402E00E36; Wed, 20 Nov 2019 14:21:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96E64E00E13
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2019 14:21:43 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAKMLhns025324
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2019 16:21:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1574288503;
	bh=yIop1DMPGF13sVG4wjH+DAReufv0otAK1cfHNaH1Ecc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=AUq5P/0KpJ7EuNiiRntYWgN0VNZ2yTUWpMIjs+OH5eVOm7Khdcp8IzL3fMZJuqld1
	S1aSanPN5pRrprIv9pGF6En09X2nfeqUxsz5l3gwWqsAhYFOd+VHhHU7kD0ThC90o4
	MDR8IZ1pMr3GMG5dgh9vLUjGOPz2Nguva5rty9nE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKMLh0P008718
	for <meta-ti@yoctoproject.org>; Wed, 20 Nov 2019 16:21:43 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 20 Nov 2019 16:21:42 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 20 Nov 2019 16:21:42 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAKMLgbj126111;
	Wed, 20 Nov 2019 16:21:42 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Nov 2019 16:19:59 -0600
Message-ID: <20191120221959.29516-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191120221959.29516-1-dmurphy@ti.com>
References: <20191120221959.29516-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] linux-ti-staging: update to ti2019.05-rc4
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
X-List-Received-Date: Wed, 20 Nov 2019 22:21:44 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
index 7bc90ad9..8b0c692a 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 BRANCH = "ti-rt-linux-4.19.y"
 
-SRCREV = "94677bda81ff6fe7a5c04cfa6bf434014104162a"
+SRCREV = "38ae13e6914beeeff5565d02d3ba1843fa647497"
 PV = "4.19.79+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index 6371c127..852bfa94 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -59,7 +59,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "6f929595b9d64333380bd547788714c81fbc2508"
+SRCREV = "fbf2b6dfdbcc821cd5f80fd32712515e4a6720d6"
 PV = "4.19.79+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.23.0


