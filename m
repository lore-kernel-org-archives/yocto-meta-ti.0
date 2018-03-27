Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9A643E009AC; Tue, 27 Mar 2018 12:54:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7414FE00529
	for <meta-ti@yoctoproject.org>; Tue, 27 Mar 2018 12:54:11 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2RJsBSg029202
	for <meta-ti@yoctoproject.org>; Tue, 27 Mar 2018 14:54:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522180451;
	bh=Fm1Pv9m4nCzfkwfHWgnDq7lZ+vphamPI1IqxGmZQeJk=;
	h=From:To:CC:Subject:Date;
	b=ktLdtRUw6Zowa+Vgl5ozfvj7N4dFaoamgPS/8nJoS0Tgqc8AE42C4XZdUP3KJ2+zW
	Ere2CiHK5T0xLNMGssyDnu02yguSkBwo6iJmOQweqGjUX1F+Wo8HQZNrrFOOZi86Xa
	lVkXdEvQTKr0vcE3VUxcoFmyg1PUzkst2SevsKZ4=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2RJsBPH029837
	for <meta-ti@yoctoproject.org>; Tue, 27 Mar 2018 14:54:11 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 27 Mar 2018 14:54:11 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 27 Mar 2018 14:54:11 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2RJsAtt002924;
	Tue, 27 Mar 2018 14:54:10 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.82.222])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w2RJsAx10606; Tue, 27 Mar 2018 14:54:10 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 27 Mar 2018 14:54:08 -0500
Message-ID: <20180327195409.7241-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 1/2] linux-ti-staging: update to ti2018.00-rc4
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
X-List-Received-Date: Tue, 27 Mar 2018 19:54:13 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.14.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.14.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
index e35c00bf..a121a29a 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.14.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.14:"
 
 BRANCH = "ti-rt-linux-4.14.y"
 
-SRCREV = "684436586d348c99edb6009976639332a3b698a9"
-PV = "4.14.27+git${SRCPV}"
+SRCREV = "4ec705911f68c4e11da2a4445b3202b4f2482a2e"
+PV = "4.14.30+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.14.bb b/recipes-kernel/linux/linux-ti-staging_4.14.bb
index d5eb77c7..bfa5bfa2 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.14.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.14.bb
@@ -54,8 +54,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.14.y"
 
-SRCREV = "ad8707e96625508462b5dd40da14723755dfcc14"
-PV = "4.14.28+git${SRCPV}"
+SRCREV = "45ddd72a9196e15252743bf8e5a1d6bc0acbfdd9"
+PV = "4.14.30+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.16.2.440.gc6284da4f


