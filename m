Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 165D9E00B9E; Fri, 16 Mar 2018 08:38:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59C30E00B28
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 08:38:06 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFc6kJ029003
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 10:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521214686;
	bh=nS9SkUcdihYew+yHJug1mNnTwTecLC3ujcxUeudPGQ8=;
	h=From:To:Subject:Date;
	b=bVDUouknFwqchICdo30sLFFmeCaIz8MfE+VR7gqt2uujFoiHaFvholC/p2mh1f4G+
	pbT34qbka7/A2qIMxyZ99g/zPCjS9FqXoFJmT3hqZGoXGF2NkfihTzHamA6ySTp6Bw
	q8jyuFci52dMO+ymtff8Va7/FLpAOttSU7sbepe0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFc5u1019364
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 10:38:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:38:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:38:05 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFc5bO016333
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2018 10:38:05 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 16 Mar 2018 11:38:04 -0400
Message-ID: <1521214684-26421-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] common-csl-ip: Updating to version 03.03.00.10
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
X-List-Received-Date: Fri, 16 Mar 2018 15:38:07 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 2 +-
 recipes-bsp/common-csl-ip/common-csl-ip.inc         | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
index 100d2f4..5f2dbd5 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
@@ -18,4 +18,4 @@ export DEST_ROOT="${S}"
 PDK_COMP_LINK_TEXT = "CSL-Chip Support Library"
 
 # Workaround: dra7xx build requires am57xx CSL libraries for opencl-monitor
-TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x"
+TI_PDK_LIMIT_SOCS_append_dra7xx = " am571x am572x am574x"
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip.inc b/recipes-bsp/common-csl-ip/common-csl-ip.inc
index e919773..6b55618 100644
--- a/recipes-bsp/common-csl-ip/common-csl-ip.inc
+++ b/recipes-bsp/common-csl-ip/common-csl-ip.inc
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING.txt;md5=5857833e20836213677fac33f9aded21"
 
 COMPATIBLE_MACHINE = "keystone|dra7xx|ti33x|ti43x|omapl1"
 
-PV = "03.03.00.09"
+PV = "03.03.00.10"
 INC_PR = "r0"
 
 CSL_GIT_URI = "git://git.ti.com/keystone-rtos/common-csl-ip.git"
@@ -12,8 +12,8 @@ CSL_GIT_PROTOCOL ="git"
 CSL_GIT_BRANCH = "master"
 CSL_GIT_DESTSUFFIX = "git"
 
-# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.09"
-CSL_SRCREV = "7a7ef0633d9e305072b79ac978738c48e46583cc"
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.10"
+CSL_SRCREV = "b252ed25443938ff59a6622aee2de7bc36304787"
 
 BRANCH="${CSL_GIT_BRANCH}"
 SRC_URI = "${CSL_GIT_URI};protocol=${CSL_GIT_PROTOCOL};branch=${BRANCH};destsuffix=${CSL_GIT_DESTSUFFIX}"
-- 
1.9.1


