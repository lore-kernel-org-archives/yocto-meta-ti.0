Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E8B06E00D70; Wed, 13 Dec 2017 13:38:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF60BE00D17
	for <meta-ti@yoctoproject.org>; Wed, 13 Dec 2017 13:38:39 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id E3187208CC;
	Wed, 13 Dec 2017 21:38:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id MXSAaiexoVf5; Wed, 13 Dec 2017 21:38:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C417020433;
	Wed, 13 Dec 2017 21:38:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 6BB651627FC;
	Wed, 13 Dec 2017 16:38:37 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Wed, 13 Dec 2017 16:38:37 -0500
Message-Id: <1513201117-119678-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] multiprocmgr-rtos: RDEPENDS on bash
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
X-List-Received-Date: Wed, 13 Dec 2017 21:38:41 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
index 4147ee2..7a6e0f6 100644
--- a/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
+++ b/recipes-ti/multiprocmgr/multiprocmgr-rtos_git.bb
@@ -39,4 +39,6 @@ FILES_${PN}-dev += "${MPM_INSTALL_DIR_RECIPE}"
 INSANE_SKIP_${PN}-dev = "arch"
 INSANE_SKIP_${PN}-test = "arch"
 
+RDEPENDS_${PN}-dev = "bash"
+
 ALLOW_EMPTY_${PN} = "1"
-- 
2.7.4


