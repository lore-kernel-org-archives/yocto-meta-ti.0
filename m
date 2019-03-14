Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 08990E00D28; Thu, 14 Mar 2019 15:50:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77BE4E00D2E
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 15:50:36 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2EMoag1126490
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1552603836;
	bh=Rh9ZVmKcUczpXeWxdB8lLwSWYZuXJCe1FrSmtLZLgQk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=yGM3/ltijQ2KE/ayyRGso4gZTeYGHCxprUlJzs3gZE4QTHT5PUQSHvsz5/+QhnD7A
	raK8o52+ajrDh1SeqIoWRlpzBV3Rq4YaqjDihG0EDp/OoXdBz6Xi7jh5piGH8yNxkt
	w7eiS4h8NAlegZHBgMhYYjt5pqdoWct6XOBAwfjI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2EMoaO7086267
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:36 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 14 Mar 2019 17:50:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Thu, 14 Mar 2019 17:50:35 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2EMoXS9013025
	for <meta-ti@yoctoproject.org>; Thu, 14 Mar 2019 17:50:35 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 14 Mar 2019 18:50:32 -0400
Message-ID: <1552603832-16016-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1552603832-16016-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1552603832-16016-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 5/5] dsplib: SRCREV update to 3.4.0.3 and facilitate AUTOREV
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
X-List-Received-Date: Thu, 14 Mar 2019 22:50:38 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/dsplib/dsplib.inc | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 7f63891..494a112 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 
 require ../includes/ti-paths.inc
 
-PV = "3_4_0_2"
+PV = "3_4_0_3"
 PR = "r0"
 
 DEPENDS = "ti-cgt6x-native \
@@ -16,8 +16,14 @@ DEPENDS = "ti-cgt6x-native \
 
 S = "${WORKDIR}/git"
 
-SRC_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git;protocol=git;branch=master"
-SRCREV = "52adc985f1bba7484b74f136db80728195ff37d5"
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


