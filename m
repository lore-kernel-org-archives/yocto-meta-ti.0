Return-Path: <g-tammana@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 84408E00992; Wed, 12 Apr 2017 15:38:24 -0700 (PDT)
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
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3D566E00961
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 15:38:22 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3CMcLLo017770
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 17:38:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1492036702;
	bh=NF5VDurqzkADSmjur9RNV69E1JmTLBHx2T9RaLMVQD4=;
	h=From:To:CC:Subject:Date;
	b=DTEqyKR8KCVAwev5sI8dw9kOoDnw/LmB2//aeaOFyAGlwM70QHilK9eb2rHR9FUew
	Z+tnhsjddwHoFCFch9RlDczINDgb1/z2ZoYw1dHnwzqcJQU8bgkEuutPpCIrKU7haI
	UhvAxdOkHgzfxnP5bnzMj/07rOlzoyHPMpJF4sas=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3CMcLZw024166
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 17:38:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 17:38:21 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3CMcLFN020069;	Wed, 12 Apr 2017 17:38:21 -0500
Received: from uda0271916b.am.dhcp.ti.com (uda0271916b.am.dhcp.ti.com
	[128.247.77.97])	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with
	ESMTP id v3CMcL320487;	Wed, 12 Apr 2017 17:38:21 -0500 (CDT)
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-ti@yoctoproject.org>, Denys Dmytriyenko <denys@ti.com>
Date: Wed, 12 Apr 2017 17:38:36 -0500
Message-ID: <1492036716-11806-1-git-send-email-g-tammana@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [morty/master][PATCH] ti-gc320-driver: Use GFP_DMA32 flag for allocations
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
X-List-Received-Date: Wed, 12 Apr 2017 22:38:24 -0000
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
index f292b10..7beb9aa 100644
--- a/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
+++ b/recipes-bsp/gc320-drivers/ti-gc320-driver_5.0.11.p7.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=78d9818a51b9a8e9bb89dea418bac297"
 
 inherit module
 
-MACHINE_KERNEL_PR_append = "c"
+MACHINE_KERNEL_PR_append = "d"
 PR = "${MACHINE_KERNEL_PR}"
 
 # Need to branch out with ${PV} var
 BRANCH = "ti-${PV}-k4.9"
 
-SRCREV = "030df5ecf503ef3c83dca6e732e6d47d4a11cd4b"
+SRCREV = "295443bf56f2100b7b2714c2c30b31ba86e96a0c"
 
 SRC_URI = "git://git.ti.com/graphics/ti-gc320-driver.git;protocol=git;branch=${BRANCH}"
 S = "${WORKDIR}/git/src"
-- 
2.7.4


