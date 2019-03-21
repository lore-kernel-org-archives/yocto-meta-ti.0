Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A83A5E00DFA; Thu, 21 Mar 2019 06:18:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 07607E00D63
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 06:16:25 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2LDGPRc105520
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553174185;
	bh=Hs8i1lq22UwhHxtj7EP0Yzt02Klgjt6GChXK0hzuRJM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=wvVcqDXJWi+GdNDdJxD1vryRGvLcnSfOtpvg4cmFMgDO7E0f0fcHKEfTqT8/ZbYSQ
	BMW4YAaMezgH8bmVjYCTlUMhq2SS1gGm8RElNj5yxQ5OeRftgOu5QP4ZMpDVjnrdy7
	ETYwq8fZn9Afqtcln38qLLUABGEqWD17dXb/3sR4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2LDGPVJ066947
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:25 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 21 Mar 2019 08:16:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 21 Mar 2019 08:16:25 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2LDGHa6025094
	for <meta-ti@yoctoproject.org>; Thu, 21 Mar 2019 08:16:25 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 21 Mar 2019 09:16:10 -0400
Message-ID: <1553174173-28679-27-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553174173-28679-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 26/29] dsplib: Recipe enhancements to facilitate AUTOREV
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
X-List-Received-Date: Thu, 21 Mar 2019 13:18:45 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/dsplib/dsplib.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 2738fc5..ad47437 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -5,7 +5,7 @@ LICENSE = "BSD-3-Clause"
 require ../includes/ti-paths.inc
 
 PV = "3_4_0_3"
-PR = "r0"
+PR = "r1"
 
 DEPENDS = "ti-cgt6x-native \
            ti-xdctools-native \
@@ -16,8 +16,14 @@ DEPENDS = "ti-cgt6x-native \
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git;protocol=git;branch=master"
-SRCREV = "2cd21a04913648d040bd63234183cc6f81f5286a"
+DSPLIB_GIT_BRANCH = "master"
+DSPLIB_GIT_PROTOCOL = "git"
+DSPLIB_GIT_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git"
+DSPLIB_SRCREV = "2cd21a04913648d040bd63234183cc6f81f5286a"
+
+BRANCH = "${DSPLIB_GIT_BRANCH}"
+SRC_URI = "${DSPLIB_GIT_URI};protocol=${DSPLIB_GIT_PROTOCOL};branch=${DSPLIB_GIT_BRANCH}"
+SRCREV = "${DSPLIB_SRCREV}"
 
 LIC_FILES_CHKSUM = "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4d51d8af75419781591ace190b"
 
-- 
1.9.1


