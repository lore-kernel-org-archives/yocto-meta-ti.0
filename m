Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9D37E00B77; Thu,  1 Jun 2017 08:33:48 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0791E00BB1
	for <meta-ti@yoctoproject.org>; Thu,  1 Jun 2017 08:33:44 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v51FXXY0010978
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496331213;
	bh=YNo1rNw1rw/S4ym4C6WTAJ7OyN/FmwnCJIf5qgi25V4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=U0UtxM9Ngwd5jx/DfAf33XX+sywGAQLnCdCQyTn8+0aquMwdYVsVYjJbb9FbBEhyJ
	dOWDVpE8l3IlX0yOIUWasiQ/cHogPCHRDBdGtvPWw6cXXQwBbaAqXzBLI7MRdwdjoI
	vhP/MB3igOotrNbQAohzX9P+ztccxsIDGyGuAGQU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v51FXSaY021696
	for <meta-ti@yoctoproject.org>; Thu, 1 Jun 2017 10:33:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Jun 2017 10:33:28 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v51FXRvJ026013;	Thu, 1 Jun 2017 10:33:28 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 1 Jun 2017 11:27:51 -0400
Message-ID: <1496330876-6173-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
References: <1496330876-6173-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 1/6] ti-pdk-build-rtos: set PACKAGE_ARCH to MACHINE_ARCH
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
X-List-Received-Date: Thu, 01 Jun 2017 15:33:48 -0000
Content-Type: text/plain

* The set of files installed varies between machines.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
index b196ee6..573c48d 100644
--- a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://makerules/env.mk;beginline=1;endline=31;md5=10503e8de
 require recipes-ti/includes/ti-paths.inc
 
 PV = "01.00.00.04B"
-PR = "r0"
+PR = "r1"
 
 PDK_BUILD_GIT_URI = "git://git.ti.com/keystone-rtos/processor-pdk-build.git"
 PDK_BUILD_GIT_PROTOCOL = "git"
@@ -20,6 +20,7 @@ SRC_URI = "${PDK_BUILD_GIT_URI};protocol=${PDK_BUILD_GIT_PROTOCOL};branch=${BRAN
 SRCREV = "${PDK_BUILD_SRCREV}"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/"
 
-- 
2.7.4


