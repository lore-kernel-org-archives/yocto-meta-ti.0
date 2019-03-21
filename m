Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A061CE00D2B; Thu, 21 Mar 2019 14:16:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F4D9E00CED
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 14:16:47 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LLGk22076125
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 16:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553203006;
	bh=+QRs0vuEWCL8JDGcY2MmDWz8ax8oA65mxNZuDSbM8B0=;
	h=From:To:Subject:Date;
	b=QlKsW3Yw4wbVWqzxhEg9tQZr5cYSrURQsT52d2XNjTFzSGId/2M1mzCKszBPlL8Y0
	QtSesiTMkYCySgFq5oHB4DA3vLBvmiAFGCym7nX5I0RiTauUfsJoS0JKAGUGXRgC7d
	iSYCS9/T084NVNm/fJYQTsot44ImJNkft7vQGrJc=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LLGkph110257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 16:16:46 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 16:16:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 16:16:46 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LLGkau015615
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 16:16:46 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 17:16:44 -0400
Message-ID: <1553203004-32662-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] mathlib: Enhancements to facilitate AUTOREV
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
X-List-Received-Date: Thu, 21 Mar 2019 21:16:48 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Removed the unused BRANCH variable

 recipes-ti/mathlib/mathlib.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
index 41130c0..09823a1 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 require ../includes/ti-paths.inc
 
 PV = "3_1_2_3"
-PR = "r0"
+PR = "r2"
 
 DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native \
@@ -16,8 +16,13 @@ DEPENDS = "ti-cgt6x-native \
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git;protocol=git;branch=master"
-SRCREV = "faedd650c47becb48b2d179242c8310327ef9853"
+MATHLIB_GIT_BRANCH = "master"
+MATHLIB_GIT_PROTOCOL = "git"
+MATHLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git"
+MATHLIB_SRCREV = "faedd650c47becb48b2d179242c8310327ef9853"
+
+SRC_URI = "${MATHLIB_GIT_URI};protocol=${MATHLIB_GIT_PROTOCOL};branch=${MATHLIB_GIT_BRANCH}"
+SRCREV = "${MATHLIB_SRCREV}"
 
 LIC_FILES_CHKSUM = "file://ti/mathlib/src/acosdp/acosdp.h;beginline=1;endline=35;md5=c133f7e139b46385906c861dd9552250"
 
-- 
1.9.1


