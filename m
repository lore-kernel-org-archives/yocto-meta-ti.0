Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 948E9E0080A; Mon, 14 Nov 2016 13:55:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49011E007D3
	for <meta-ti@yoctoproject.org>; Mon, 14 Nov 2016 13:55:25 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D1B55209D7;
	Mon, 14 Nov 2016 21:55:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id lRLJ3illjmIk; Mon, 14 Nov 2016 21:55:24 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B21CD2091B;
	Mon, 14 Nov 2016 21:55:23 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 1F2D8162199;
	Mon, 14 Nov 2016 16:55:23 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Mon, 14 Nov 2016 16:55:21 -0500
Message-Id: <1479160521-29817-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] ti-ipc: update to include -pthread fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 21:55:30 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
index 869dada..488e0fc 100644
--- a/recipes-ti/ipc/ti-ipc.inc
+++ b/recipes-ti/ipc/ti-ipc.inc
@@ -9,7 +9,7 @@ TI_IPC_GIT_PROTOCOL = "git"
 TI_IPC_GIT_BRANCH = "ipc-next"
 
 #Corresponds to 3.44.00.00
-TI_IPC_SRCREV = "e6f64d4b04f1c929366c922a2e5a4728fbb4d919"
+TI_IPC_SRCREV = "a1852fc8b254ed207bd1c1c88f5b362c9b6cc454"
 
 BRANCH = "${TI_IPC_GIT_BRANCH}"
 SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"
@@ -17,7 +17,7 @@ SRCREV = "${TI_IPC_SRCREV}"
 
 S = "${WORKDIR}/git"
 PV = "3.44.00.00"
-INC_PR = "r0"
+INC_PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-- 
2.7.4


