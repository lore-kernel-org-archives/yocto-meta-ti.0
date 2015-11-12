Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22480E007C3; Wed, 11 Nov 2015 18:04:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02977E0049B
	for <meta-ti@yoctoproject.org>; Wed, 11 Nov 2015 18:04:46 -0800 (PST)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXO00BZGJ3SUF90@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 11 Nov 2015 20:04:40 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=xejpMw4v_WMwpW67jmkA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 05365161D0B;	Wed,
	11 Nov 2015 21:04:40 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Wed, 11 Nov 2015 21:04:38 -0500
Message-id: <1447293879-4110-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
In-reply-to: <1447293879-4110-1-git-send-email-denis@denix.org>
References: <1447293879-4110-1-git-send-email-denis@denix.org>
Subject: [PATCH] kselftests: make machine-specific due to kernel-specific conditionals
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
X-List-Received-Date: Thu, 12 Nov 2015 02:04:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-kernel/kselftests/kselftests_4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-kernel/kselftests/kselftests_4.1.bb b/recipes-kernel/kselftests/kselftests_4.1.bb
index 38cb76b..2dced11 100644
--- a/recipes-kernel/kselftests/kselftests_4.1.bb
+++ b/recipes-kernel/kselftests/kselftests_4.1.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8e
 
 S = "${WORKDIR}/linux-${PV}"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 DEPENDS = "virtual/kernel popt"
 
 inherit kernel-arch
-- 
2.2.0


