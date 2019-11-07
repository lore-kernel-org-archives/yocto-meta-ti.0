Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C23AEE00E04; Thu,  7 Nov 2019 10:09:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0CEBE008D9
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2019 10:09:49 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9n8J039633
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:49 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573150189;
	bh=AkE41hr0EGE0/UYPoh1tfQ2Be40xnTOTqhw/D13To+M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=uhfsAAFBlyKRDf/E3ItkdyrcZQ5J6E8iocrY27Tlj5WJ6ikC6Hvcoz+OfbCmspVrH
	Y6loLvGozVVkoQyneu62yaYHFmP7dFhfnGP7Z6kHtWruUMiRBpvbNCI9Lb0m42Wldl
	YKvo9fSU2L/4q1HwUSDREWNn3Uagj2wU48u/V0VA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9nl4125136
	for <meta-ti@yoctoproject.org>; Thu, 7 Nov 2019 12:09:49 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 7 Nov 2019 12:09:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 7 Nov 2019 12:09:33 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA7I9jIF067418;
	Thu, 7 Nov 2019 12:09:48 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 7 Nov 2019 12:50:04 -0500
Message-ID: <1573149037-762-10-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
References: <1573149037-762-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][RFC 09/42] fftc-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Thu, 07 Nov 2019 18:09:53 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
index 9103639..1feac80 100644
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -1,6 +1,7 @@
 SUMMARY = "TI FFT Coprocessor (FFTC) low level driver "
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
@@ -8,27 +9,12 @@ LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644
 COMPATIBLE_MACHINE = "k2hk|k2l"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-FFTC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/fftc-lld.git"
-FFTC_LLD_GIT_PROTOCOL = "git"
-FFTC_LLD_GIT_BRANCH = "master"
-FFTC_LLD_GIT_DESTSUFFIX = "git/ti/drv/fftc"
-
-# Below commit ID corresponds to "DEV.FFTC_LLD.02.02.00.07B"
-FFTC_LLD_SRCREV = "962d899e1e81a4d02ad59368032cf24956cde5f2"
-
-BRANCH = "${FFTC_LLD_GIT_BRANCH}"
-SRC_URI = "${FFTC_LLD_GIT_URI};destsuffix=${FFTC_LLD_GIT_DESTSUFFIX};protocol=${FFTC_LLD_GIT_PROTOCOL};branch=${BRANCH}"
-
-SRCREV = "${FFTC_LLD_SRCREV}"
-PV = "02.02.00.07B"
 PR = "r0"
 
-S = "${WORKDIR}/${FFTC_LLD_GIT_DESTSUFFIX}"
-
-
 DEPENDS_append= " qmss-lld-rtos \
                   cppi-lld-rtos \
 "
 
 # HTML doc link params
 PDK_COMP_LINK_TEXT = "FFTC LLD"
+TI_PDK_COMP = "ti.drv.fftc"
-- 
2.7.4


