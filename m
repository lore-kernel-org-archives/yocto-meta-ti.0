Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 18EB5E00C25; Fri, 13 Apr 2018 10:12:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6244E00B65
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 10:12:47 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3DHCl8t012795
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523639567;
	bh=/AjZ8t5Be6MKlLjzJ0hA7ZvSuxm6+cMZF8yCBc93s5Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=f57bs59H13VlWYaOatKlzlQW0A2wd57X6KTCH2sAeamqwllZbo1Klu5qkw209puun
	RGHg7zC/qVLdHZ3melkVhnWg+HU2Yv5ogleqz/fCAaf1zBGRbwm5NiVSyGp2udM1+W
	WUfLqtHDfJrWaDge3n7TeAhN0XXxR3KKXx4NUaTQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHClBd031980
	for <meta-ti@yoctoproject.org>; Fri, 13 Apr 2018 12:12:47 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 13 Apr 2018 12:12:47 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 13 Apr 2018 12:12:47 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3DHCfMI020225;
	Fri, 13 Apr 2018 12:12:46 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 13 Apr 2018 13:02:16 -0400
Message-ID: <1523638939-28861-21-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
References: <1523638939-28861-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 20/23] transport-rtos: Udpate to version 1.0.0.11A
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
X-List-Received-Date: Fri, 13 Apr 2018 17:12:48 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Updating to version 1.0.0.11A and update the license checksum of the sub
component recipes

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  | 2 +-
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 2 +-
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      | 2 +-
 recipes-bsp/transport-rtos/transport.inc         | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
index 775ef3d..71bea18 100644
--- a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
@@ -5,7 +5,7 @@ require transport.inc
 
 PR = "${INC_PR}.0"
 
-LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=7c7fbe6af03d79b61025a67a8fc96f93"
+LIC_FILES_CHKSUM = "file://bmet_transport.h;beginline=12;endline=40;md5=6d209c698b273aef180b0c1d38469e8e"
 
 COMPATIBLE_MACHINE = "k2hk-evm|k2e-evm|k2l-evm"
 
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
index 9aacfe4..4750e04 100644
--- a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
@@ -5,7 +5,7 @@ require transport.inc
 
 PR = "${INC_PR}.0"
 
-LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=fd897e67955a19ba88443d4bc2e7e18a"
+LIC_FILES_CHKSUM = "file://nimu_icssEth.h;beginline=1;endline=35;md5=3ea633a510be24d8a89d9d08b930994c"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g|c66x|omapl1"
 
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
index 7f4a00d..c60606b 100644
--- a/recipes-bsp/transport-rtos/nimu-rtos_git.bb
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -5,7 +5,7 @@ require transport.inc
 
 PR = "${INC_PR}.0"
 
-LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=52ba99291b03b91058e37115b66edb10"
+LIC_FILES_CHKSUM = "file://nimu_eth.h;beginline=1;endline=35;md5=ee9c662c39d4584fb2a8b66413d2866d"
 
 COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
 
diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transport-rtos/transport.inc
index 9097689..8d1b327 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -6,12 +6,12 @@ TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
 TRANSPORT_GIT_PROTOCOL = "git"
 TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.09"
-TRANSPORT_SRCREV = "7b69e1d6d189c579e2a27b955891f9f268fd0e98"
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.11A"
+TRANSPORT_SRCREV = "472efde60b5ede35c0746c432001d8e3673a6bb9"
 
 BRANCH = "${TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.11A"
 INC_PR = "r0"
-- 
2.7.4


