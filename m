Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3568EE00BAF; Fri, 30 Jun 2017 13:28:27 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F27A6E00B9F
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 13:28:23 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5UKSNTI002713
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 15:28:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498854503;
	bh=iBCPomJ6AMVIV6p3IhSQNUa9rJYuc/yV42XfXj5fedI=;
	h=From:To:CC:Subject:Date;
	b=kNx913O48ZbrJ/TIAlUUxZrQ6sqUVMgkof3wthhDgoARtFkVjrpWq+WxaelGXjxyu
	u6rRYDLXs8gqhZJju96Pkyj90yluga6FkzuLSi7aowemPI6/poubmI8sJhc31qEOhP
	WZPTRdcmChD83DOrHHEgpIMp1+jrVdJgg/lHOb9g=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5UKSMMp008626
	for <meta-ti@yoctoproject.org>; Fri, 30 Jun 2017 15:28:22 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 30 Jun 2017 15:28:22 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5UKSM9k024549;	Fri, 30 Jun 2017 15:28:22 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 30 Jun 2017 16:28:20 -0400
Message-ID: <1498854500-43685-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] edma3-lld-rtos: Add support for omapl1
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
X-List-Received-Date: Fri, 30 Jun 2017 20:28:27 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
index f524478..a31aa2d 100644
--- a/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
+++ b/recipes-bsp/edma3-lld/edma3-lld-rtos_git.bb
@@ -1,11 +1,11 @@
 require edma3-lld.inc
 require recipes-ti/includes/ti-paths.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
 DEPENDS = "ti-sysbios ti-xdctools gcc-arm-none-eabi-native ti-cgt-arm-native ti-cgt6x-native"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|omapl1"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PLATFORMLIST = ""
-- 
1.9.1


