Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7E45E00B1B; Wed, 12 Apr 2017 04:11:23 -0700 (PDT)
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
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A9DE2E00AD5
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 04:11:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3CBB91u031830
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 06:11:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491995469;
	bh=tXUp43aINmFWetRLnXucUD1lgnL/lqWQkb7pFpWv/cM=;
	h=From:To:CC:Subject:Date;
	b=vzYGdu92tuzM1drQztaaTfmeRqkgMRWMC7kiNPwdiI6GhFr1k2lqzDqfsQunIvRh3
	cS2oxMlHe3B/toyyKVw2ywSWisiAujDu0aHv1sqOybz/UEWh9z0+9qC/AqyK3vtuk4
	BWWt5I69pcP88m27imJaJ8XtbBF6UFUyl6JUudWw=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3CBB3gA029248
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 06:11:04 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 06:11:03 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3CBB2bk030142;
	Wed, 12 Apr 2017 06:11:02 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Apr 2017 16:40:59 +0530
Message-ID: <1491995459-156761-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty] dspdce-fw: Update SRCREV for dsp crash issue
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
X-List-Received-Date: Wed, 12 Apr 2017 11:11:24 -0000
Content-Type: text/plain

This update fixes the issue where the copycodec
firmware crashes every 300 seconds after bind/
unbind operation

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-bsp/dspdce-fw/dspdce-fw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
index ee00833..3ca1385 100644
--- a/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
+++ b/recipes-bsp/dspdce-fw/dspdce-fw_git.bb
@@ -6,16 +6,16 @@ COMPATIBLE_MACHINE = "dra7xx"
 
 SRC_URI = "git://git.ti.com/glsdk/dspdce.git;protocol=git"
 
-SRCREV = "3b9cea492f23d7dabb9ffa0e69631b858ba8e90a"
+SRCREV = "de6e599f067b25c46cc0c8f74a22cc3b8aafbae8"
 
-PV = "1.00.00.06"
+PV = "1.00.00.07"
 
 S = "${WORKDIR}/git"
 
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc
 
-PR = "r3"
+PR = "r4"
 inherit update-alternatives
 
 DEPENDS = "ti-xdctools ti-sysbios ti-codec-engine ti-framework-components ti-xdais ti-ipc-rtos ti-osal ti-cgt6x-native"
-- 
1.9.1


