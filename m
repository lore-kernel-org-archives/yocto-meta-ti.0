Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2FFFE00D70; Wed, 13 Dec 2017 13:57:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 53700E00D6D
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 13:57:10 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDLvASD020859
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 15:57:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513202230;
	bh=50mbzdWyjRpRc52qObcw+qIPYqJtm7CnwKLiuTcRPh4=;
	h=From:To:Subject:Date;
	b=S17ieHRI6jq7Wj4qRuZItAeMA9vzwQN7KBspYp8WwD0B48BFeJcKOFuwHRp6N9fM/
	/8aDNNjMLrN3bP9tKAsD0aqoIknBPg0SLSZuhNrDckYaOXKlyTbkPndnUTQpjgnIkx
	Y3+WkbFRVAWHdBS+rb4dExfnGK331pQoz/D8+xww=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLvAdb007370
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 15:57:10 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 15:57:10 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 15:57:10 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDLv96Y010744
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 15:57:10 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 13 Dec 2017 16:57:08 -0500
Message-ID: <1513202228-22841-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty/master][PATCH] uart-lld-rtos: Updating to version 1.0.0.9
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
X-List-Received-Date: Wed, 13 Dec 2017 21:57:12 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/uart-lld/uart-lld-rtos_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
index e8510b6..e76401d 100644
--- a/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
+++ b/recipes-bsp/uart-lld/uart-lld-rtos_git.bb
@@ -13,14 +13,14 @@ UART_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/uart-lld.git"
 UART_LLD_GIT_PROTOCOL = "git"
 UART_LLD_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.07A"
-UART_LLD_SRCREV = "884e340f5d2f004de99e44f014fedb781f1fb975"
+# Below commit ID corresponds to "DEV.UART_LLD.01.00.00.09"
+UART_LLD_SRCREV = "f3670e497186b5ec5258d0e51fb1ebdaa3d60577"
 
 BRANCH = "${UART_LLD_GIT_BRANCH}"
 SRC_URI = "${UART_LLD_GIT_URI};protocol=${UART_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${UART_LLD_SRCREV}"
-PV = "01.00.00.07A"
+PV = "01.00.00.09"
 PR = "r0"
 
 DEPENDS_append = " edma3-lld-rtos \
-- 
1.9.1


