Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53761E00EAD; Fri, 15 Nov 2019 07:34:18 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23F3DE00D16
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 07:34:15 -0800 (PST)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYEBC045734
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573832054;
	bh=249O13Ftf1EpciaWFtTkJ6lsBOoP6WPCD68fFF7CwaM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=DzswgTl31TxClswogQ++FNXliZ348bBQbS0XCxBJmnbs7W7eGhADdFjWZ4e1l4c3W
	+YKQG3IGfwhTBFmGPAH5wKd5HHMf9UWFXVahiI+JVXliHyr7L6duxaZARc82gn4h+C
	y7Dl0LND8QGq/2G4eUqvUTxPXVutk22I1Kl32GMc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xAFFYEEN114466
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 15 Nov 2019 09:34:14 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 15 Nov 2019 09:34:14 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 15 Nov 2019 09:34:14 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xAFFYBfV041975;
	Fri, 15 Nov 2019 09:34:14 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 15 Nov 2019 10:14:29 -0500
Message-ID: <1573830902-17409-10-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
References: <1573830902-17409-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH 09/42] fftc-lld: migrate to ti-pdk-fetch.bbclass
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
X-List-Received-Date: Fri, 15 Nov 2019 15:34:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
index 9103639..c8668c9 100644
--- a/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
+++ b/recipes-bsp/fftc-lld/fftc-lld-rtos_git.bb
@@ -1,6 +1,10 @@
 SUMMARY = "TI FFT Coprocessor (FFTC) low level driver "
 
-inherit ti-pdk
+inherit ti-pdk ti-pdk-fetch
+
+TI_PDK_COMP = "ti.drv.fftc"
+
+PE = "1"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644caf6d30a2b7df"
@@ -8,24 +12,8 @@ LIC_FILES_CHKSUM = "file://fftc.h;beginline=1;endline=39;md5=2f1010c47d364414644
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
-- 
2.7.4


