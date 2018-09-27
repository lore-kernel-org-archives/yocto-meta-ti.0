Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E474E00C15; Thu, 27 Sep 2018 13:44:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 103A5E00C3C
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 13:43:43 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RKhg4F097814
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538081022;
	bh=8hixbDhWXkFTxqAnOlxoqxjhWyjrASonfH6uqhWeKFo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=ABBaWC+FDVUqlKRvNuYOQNzSuR5z3yYRAKKwHTK7j8RcTADTRPFZOFPyp9FIo4ZgX
	tZEfIllAnEHgELov6AFhTcfMLSSKhU5b/KUmrpYHvQJO6R5czOotnAJRXKNJcTupHU
	DiMRFaGatvmbK5QbP4RK04hgWF4h4cscSDp8NHgs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhgvF025650
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:42 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 15:43:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 15:43:42 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RKhbiR003847
	for <meta-ti@yoctoproject.org>; Thu, 27 Sep 2018 15:43:42 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 27 Sep 2018 16:43:25 -0400
Message-ID: <1538081009-52859-27-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538081009-52859-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2 26/30] profiling-rtos: Update to version 01.00.00.07 and added k3 support
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
X-List-Received-Date: Thu, 27 Sep 2018 20:44:05 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/utils-rtos/profiling-rtos_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/utils-rtos/profiling-rtos_git.bb b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
index 13a3838..0a0dabb 100644
--- a/recipes-bsp/utils-rtos/profiling-rtos_git.bb
+++ b/recipes-bsp/utils-rtos/profiling-rtos_git.bb
@@ -5,21 +5,21 @@ inherit ti-pdk
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://profilingver.h;beginline=1;endline=46;md5=974494ad60f33cfc0340e421c5a5a7a0"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|k3"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PROFILING_GIT_URI = "git://git.ti.com/keystone-rtos/utils.git"
 PROFILING_GIT_PROTOCOL = "git"
 PROFILING_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UTILS.01.00.00.06"
-PROFILING_SRCREV = "005d18b0219f2c34064dbb1cea2f4f7574fc2e09"
+# Below commit ID corresponds to "DEV.UTILS.01.00.00.07"
+PROFILING_SRCREV = "1f956c44ea369c9b138859cea619459a312681ea"
 
 BRANCH = "${PROFILING_GIT_BRANCH}"
 SRC_URI = "${PROFILING_GIT_URI};protocol=${PROFILING_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${PROFILING_SRCREV}"
-PV = "01.00.00.06"
+PV = "01.00.00.07"
 PR = "r0"
 
 S = "${WORKDIR}/git/profiling"
-- 
1.9.1


