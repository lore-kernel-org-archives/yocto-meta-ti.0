Return-Path: <manisha.agrawal@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17563E0093F; Thu,  2 Mar 2017 12:44:55 -0800 (PST)
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
X-Greylist: delayed 1169 seconds by postgrey-1.32 at yocto-www;
	Thu, 02 Mar 2017 12:44:51 PST
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2386E0049D
	for <meta-ti@yoctoproject.org>; Thu,  2 Mar 2017 12:44:51 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v22KPBqM021699
	for <meta-ti@yoctoproject.org>; Thu, 2 Mar 2017 14:25:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488486311;
	bh=/VxUo+Cym3lqZPfHxDy2qh3Ik6zPAfTxabCNgxRkj0c=;
	h=From:To:CC:Subject:Date;
	b=LAk0CE8GxwW5pnCKM+od5wBvsYnKFOImOKPvyay1Xw8nIg1X86rjcTkUJ6y0WoPKO
	yS/Fj49/csJgY/KZkaOPWBw3aWseBwo+iN6pb8J5Pw91VjZH68/hlv3X0OOLCI6X5B
	Su5k0lVXD1byM6elAL4TnUDe3jtfG6eqGnNuzHgE=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v22KP6MO008054
	for <meta-ti@yoctoproject.org>; Thu, 2 Mar 2017 14:25:06 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 2 Mar 2017 14:25:05 -0600
Received: from uda0393239.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v22KP5BD005125;	Thu, 2 Mar 2017 14:25:05 -0600
From: <manisha.agrawal@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 Mar 2017 14:25:03 -0600
Message-ID: <20170302202503.26165-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [[krogoth/morty]] dual-camera-demo : Video buffers from CMEM
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
X-List-Received-Date: Thu, 02 Mar 2017 20:44:55 -0000
Content-Type: text/plain

From: Manisha Agrawal <manisha.agrawal@ti.com>

Update git commit id to pick the source code demonstrating CMEM API
usage for allocating video buffers from CMEM driver. This is to showcase
the CPU access of the video buffers with read and write cache enabled
for optimal CPU performance. Since the CMEM driver support exists only
on AM57x today, modify makefile to  include the CMEM library
conditionally only for am57xx-evm platform.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index 6c36b98..1d1d836 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c7ca707704d3354a64feeb4f19f52eb5"
 DEPENDS += "libdrm"
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r16"
+PR = "r17"
 
 BRANCH = "master"
-SRCREV = "5e250641bfbc8a1a90e5b98527d2012729d54c09"
+SRCREV = "f52cb4354785e5f2fd63f7cf8ab02d99a2fbbea7"
 
 SRC_URI = "git://git.ti.com/sitara-linux/dual-camera-demo.git;protocol=git;branch=${BRANCH} \
            file://desc_dual-camera.html \
-- 
2.9.3


