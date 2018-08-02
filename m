Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5C570E008E0; Thu,  2 Aug 2018 11:56:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43FDFE006B4
	for <meta-ti@yoctoproject.org>; Thu,  2 Aug 2018 11:56:48 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w72Iulxj106282
	for <meta-ti@yoctoproject.org>; Thu, 2 Aug 2018 13:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533236207;
	bh=0rReWbxPtQmSz07lEqzds3sUvtAS7vaWDd23DjZifC4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UAVoMA/GNEY2OrCLTycGAnYAYBfpqHp8akPZpnSVfSl9tIAfAQ+tkQ5McuJH6VbR9
	0rzH0vnu2s0tz93oiV85y6272zjlCvxVb0bnd08dJcc2j7roYCAIfggiekQrzM2yC1
	v45+b3l5EuwoRLoGa89mOfkIIX6hn0Xvg9RMSaJ8=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72IulgA008890
	for <meta-ti@yoctoproject.org>; Thu, 2 Aug 2018 13:56:47 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 2 Aug 2018 13:56:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 2 Aug 2018 13:56:47 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w72IulRn004157;
	Thu, 2 Aug 2018 13:56:47 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.163.74])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	w72Iulx14508; Thu, 2 Aug 2018 13:56:47 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 2 Aug 2018 13:56:43 -0500
Message-ID: <20180802185643.24422-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20180802185643.24422-1-dmurphy@ti.com>
References: <20180802185643.24422-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 3/3] arm-trusted-firmware: update to ti2018.03-rc1 tag
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
X-List-Received-Date: Thu, 02 Aug 2018 18:56:49 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
index ee5a6df7..27b1591f 100644
--- a/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
+++ b/recipes-bsp/arm-trusted-firmware/arm-trusted-firmware_1.5.bb
@@ -22,7 +22,7 @@ PV_append = "+git${SRCPV}"
 BRANCH = "ti-atf"
 SRC_URI = "git://git.ti.com/atf/arm-trusted-firmware.git;branch=${BRANCH}"
 
-SRCREV ?= "5a0daebab6bf72b27cc74151d4e596247f804e44"
+SRCREV ?= "516abc5fb4826e28be0acdbe6e22fd1b1b476c59"
 
 # Make ATF "aware" of OPTEE, no build dependency
 PACKAGECONFIG[optee] = "SPD=opteed"
-- 
2.17.0.582.gccdcbd54c


