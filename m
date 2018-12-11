Return-Path: <xuj@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E405E00C94; Tue, 11 Dec 2018 12:21:24 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE1F1E00BB7
	for <meta-ti@yoctoproject.org>; Tue, 11 Dec 2018 12:21:23 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBBKLNW0089252
	for <meta-ti@yoctoproject.org>; Tue, 11 Dec 2018 14:21:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544559683;
	bh=L8sfOk4hNyMYkTapXk3cgB/CIw4i9+y0JRIJp7rdbik=;
	h=From:To:CC:Subject:Date;
	b=XVMAw2up+Qa8qBFAYLo2NNqcQRNoVMxLlbmgdOubiOZFUw7dgCXE3Hv3hkQyfc2/A
	XLX08r1QUrs4GXmxCJfVdapFMXAcBJJ0Mve5DPeoLiydWnVoChIXaJKJFHFvBVOvOD
	BGj78BwDLK/2FMTAjy4JNPcTE6VPSgemKaZtO+7Q=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBBKLN1L041077
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 11 Dec 2018 14:21:23 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 11 Dec 2018 14:21:22 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 11 Dec 2018 14:21:22 -0600
Received: from UDA0869574.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBBKLMLq001704;
	Tue, 11 Dec 2018 14:21:22 -0600
From: Jianzhong Xu <xuj@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 11 Dec 2018 15:21:19 -0500
Message-ID: <1544559679-2367-1-git-send-email-xuj@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] dsplib/mathlib: bump SRCREV to latest
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
X-List-Received-Date: Tue, 11 Dec 2018 20:21:24 -0000
Content-Type: text/plain

Modified .json metadata to make CCS variables backward compatible

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 recipes-ti/dsplib/dsplib.inc   | 2 +-
 recipes-ti/mathlib/mathlib.inc | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/dsplib/dsplib.inc b/recipes-ti/dsplib/dsplib.inc
index 95cd034..7f63891 100644
--- a/recipes-ti/dsplib/dsplib.inc
+++ b/recipes-ti/dsplib/dsplib.inc
@@ -17,7 +17,7 @@ DEPENDS = "ti-cgt6x-native \
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.ti.com/ep-processor-libraries/dsplib.git;protocol=git;branch=master"
-SRCREV = "0eb7e849c4cf0ffbfd67e2a777e655375822792b"
+SRCREV = "52adc985f1bba7484b74f136db80728195ff37d5"
 
 LIC_FILES_CHKSUM = "file://ti/dsplib/src/common/c66/lnk.cmd;beginline=1;endline=37;md5=0f0c9c4d51d8af75419781591ace190b"
 
diff --git a/recipes-ti/mathlib/mathlib.inc b/recipes-ti/mathlib/mathlib.inc
index 3792f4d..41130c0 100644
--- a/recipes-ti/mathlib/mathlib.inc
+++ b/recipes-ti/mathlib/mathlib.inc
@@ -17,7 +17,7 @@ DEPENDS = "ti-cgt6x-native \
 S = "${WORKDIR}/git"
 
 SRC_URI = "git://git.ti.com/ep-processor-libraries/mathlib.git;protocol=git;branch=master"
-SRCREV = "8ca923210d156aa09f582aaab0dc2d0174a88962"
+SRCREV = "faedd650c47becb48b2d179242c8310327ef9853"
 
 LIC_FILES_CHKSUM = "file://ti/mathlib/src/acosdp/acosdp.h;beginline=1;endline=35;md5=c133f7e139b46385906c861dd9552250"
 
-- 
1.9.1


