Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0392E00CD7; Mon, 19 Mar 2018 07:43:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29E41E00903
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 07:43:20 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEhJrk027674
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 09:43:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470599;
	bh=b6fRRgUlDY5ML273cqJjedjukCi9oorhWVIFySW4sJA=;
	h=From:To:Subject:Date;
	b=eWKSpPODkQM9xjH15W6EADmkBFcodRh4K4X6GD9fq61myov70KgbqSytIH3TsGcn+
	m+04cFYqsuRzCvlSyTkTY6vbVYWUOSwWKMT9Fb/6+hR6MD5dpiH1PUYqz+v8XsFEbu
	iUluyQ6pkFgr708qQZrJ1xGFufq3f48oF3sHo/nI=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEhJCN022871
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 09:43:19 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:43:19 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:43:19 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEhJN3025662
	for <meta-ti@yoctoproject.org>; Mon, 19 Mar 2018 09:43:19 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 Mar 2018 10:43:17 -0400
Message-ID: <1521470597-18416-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/rocko/master][PATCH] transport-rtos: Udpate to version 1.0.0.11
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
X-List-Received-Date: Mon, 19 Mar 2018 14:43:20 -0000
Content-Type: text/plain

Updating to version 1.0.0.11 and update the license checksum of the sub
component recipes
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
index 9097689..5b5a777 100644
--- a/recipes-bsp/transport-rtos/transport.inc
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -6,12 +6,12 @@ TRANSPORT_GIT_URI = "git://git.ti.com/keystone-rtos/transport.git"
 TRANSPORT_GIT_PROTOCOL = "git"
 TRANSPORT_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.09"
-TRANSPORT_SRCREV = "7b69e1d6d189c579e2a27b955891f9f268fd0e98"
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.11"
+TRANSPORT_SRCREV = "7bd5f7ffb38a6021762f29d0652fe63c6114a86f"
 
 BRANCH = "${TRANSPORT_GIT_BRANCH}"
 SRC_URI = "${TRANSPORT_GIT_URI};protocol=${TRANSPORT_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${TRANSPORT_SRCREV}"
-PV = "01.00.00.09"
+PV = "01.00.00.11"
 INC_PR = "r0"
-- 
1.9.1


