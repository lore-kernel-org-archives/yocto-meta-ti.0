Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 765CEE00A9C; Fri, 28 Sep 2018 09:26:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13805E00B81
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 09:26:37 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8SGQbgi130116
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538151997;
	bh=zVTVqUldr2Pr7Pu8+dP9rBZ6yfkCAqT5FNVrsChJFnE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=lexP9pBJV7CnqLdr2F1S2a6wxYwX9JUTJQbhCpMXCCFqpXWZntC6StHWTbSZ9OTog
	Js/9dNkNs20E/eFxDyImr/lKoUfON619VMqklegVHtKxXHMM4eyhTjAZEaDeHhc+Am
	0OOW2PfIV8QsYIgfx70dvU+wR0Cftqhjw5TY23Ss=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQbJd000749
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 28 Sep 2018 11:26:37 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 28 Sep 2018 11:26:37 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8SGQWMY011688
	for <meta-ti@yoctoproject.org>; Fri, 28 Sep 2018 11:26:37 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 28 Sep 2018 12:26:23 -0400
Message-ID: <1538151990-44823-23-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538151990-44823-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v3 22/29] transport-rtos: nimu-rtos: Updated to version 01.00.00.13 & added k3 support
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
X-List-Received-Date: Fri, 28 Sep 2018 16:26:40 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/transport-rtos/nimu-rtos_git.bb | 3 ++-
 recipes-bsp/transport-rtos/transport.inc    | 6 +++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
index 3321af4..101951b 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -7,7 +7,7 @@ PR = "${INC_PR}.0"
 
 LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584fb2a8b66413d2866d"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1|k3"
 
 NIMU_DESTSUFFIX = "git/ndk/nimu"
 
@@ -25,6 +25,7 @@ DEPENDS_append_k2g = " emac-lld-rtos"
 DEPENDS_append_c665x-evm = " emac-lld-rtos"
 DEPENDS_append_c667x-evm = " pa-lld-rtos cppi-lld-rtos"
 DEPENDS_append_omapl1 = " emac-lld-rtos"
+DEPENDS_append_k3 = " emac-lld-rtos"
 
 # Build with make instead of XDC
 TI_PDK_XDCMAKE = "0"
diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
index 61772bd..b78b680 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -6,12 +6,12 @@ TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
 TRANSPORT_GIT_PROTOCOL = "git"
 TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.12"
-TRANSPORT_SRCREV = "0e0f30a30388ea34b3a00beb69c9bfccc26dfaa0"
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.13"
+TRANSPORT_SRCREV = "3129b2ac9b00eb8882252402bc6ff31092e57da2"
 
 BRANCH = "${TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.12"
+PV = "01.00.00.13"
 INC_PR = "r0"
-- 
1.9.1


