Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6FB14E00AF8; Tue, 11 Apr 2017 23:24:34 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 361AFE00AD5
	for <meta-ti@yoctoproject.org>; Tue, 11 Apr 2017 23:24:30 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3C6OJxL029019
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 01:24:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1491978259;
	bh=tXUp43aINmFWetRLnXucUD1lgnL/lqWQkb7pFpWv/cM=;
	h=From:To:CC:Subject:Date;
	b=VpJ2+Qu9ZjVl0vrFMAT7zoEM7qsUEeiGiG97bSVG5kXHilxW1aQP1oam2w04419PB
	Qcfb39x9ElFekB/Z+P2l4ZHMBq/J4Fnx4gfw9hM1djAhvs75gPLXlGLF9X+WVTRXxs
	7Hvc2SqujPhiLYQsx6YCAl3oU6DsatAxokZi0wjE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3C6OEf3031138
	for <meta-ti@yoctoproject.org>; Wed, 12 Apr 2017 01:24:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Apr 2017 01:24:14 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3C6O7GW015417;
	Wed, 12 Apr 2017 01:24:13 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 12 Apr 2017 11:53:52 +0530
Message-ID: <1491978235-55368-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [krogoth] dspdce-fw: Update SRCREV for dsp crash issue
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
X-List-Received-Date: Wed, 12 Apr 2017 06:24:34 -0000
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


