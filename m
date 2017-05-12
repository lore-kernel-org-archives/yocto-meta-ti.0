Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D14F0E00B7A; Fri, 12 May 2017 05:03:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A266E00961
	for <meta-ti@yoctoproject.org>; Fri, 12 May 2017 05:03:38 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4CC3RlH021715
	for <meta-ti@yoctoproject.org>; Fri, 12 May 2017 07:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494590607;
	bh=EgsGj6IZEdsSdGz2+d2rdIjI0eS7NQKHrQhH40mbNi0=;
	h=From:To:CC:Subject:Date;
	b=g6CXuvj/y9yD8U1/NHUhoNLFPIcKaPuPD5hF7UAtHlEjNWgEBLTIcNwzbfqe34tlb
	UfL4jeTa9Pe2XjeHgbBqd9HqQh6m7koxF+d8AxFnPc8UKby2KAKNnjzdDJS9wRJ2ul
	CsomPZorLSGiAhgQ+D31EMJ8hyiMKdgM8GHBLAvg=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4CC3MmE002166
	for <meta-ti@yoctoproject.org>; Fri, 12 May 2017 07:03:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 12 May 2017 07:03:22 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4CC3M3B019394;	Fri, 12 May 2017 07:03:22 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.166.45])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v4CC3L302367; Fri, 12 May 2017 07:03:22 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 12 May 2017 07:03:09 -0500
Message-ID: <20170512120310.17511-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
MIME-Version: 1.0
Subject: [PATCH] ti-sci-fw: update to the latest 0.1.1-50 version
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
X-List-Received-Date: Fri, 12 May 2017 12:03:41 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index bbfbd49a..83d01885 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "TI SCI firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.1.47"
-PR = "r1"
+PV = "0.1.1.50"
+PR = "r2"
 
 CLEANBROKEN = "1"
 
@@ -12,7 +12,7 @@ COMPATIBLE_MACHINE = "k2g"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRCREV = "31c67d39e313d1bd08f82213d50f32fbb64f73fd"
+SRCREV = "ab507546f0f3f217f4c782a20845856e14b38224"
 BRANCH ?= "ti-linux-firmware-4.1.y"
 
 SRC_URI = "git://git.ti.com/processor-firmware/ti-linux-firmware.git;protocol=git;branch=${BRANCH}"
-- 
2.12.2


