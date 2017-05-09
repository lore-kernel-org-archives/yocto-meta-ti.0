Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DCD62E00B2E; Tue,  9 May 2017 11:16:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 584 seconds by postgrey-1.32 at yocto-www;
	Tue, 09 May 2017 11:16:35 PDT
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7466DE00B23
	for <meta-ti@yoctoproject.org>; Tue,  9 May 2017 11:16:34 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AB30220BF1;
	Tue,  9 May 2017 18:06:50 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZtJREZca7PIG; Tue,  9 May 2017 18:06:50 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 83BB520BE4;
	Tue,  9 May 2017 18:06:49 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id EC9021624B5;
	Tue,  9 May 2017 14:06:48 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue,  9 May 2017 14:06:48 -0400
Message-Id: <1494353208-50981-3-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1494353208-50981-1-git-send-email-denis@denix.org>
References: <1494353208-50981-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 3/3] ti-ipc-examples: explicitly depend on zip-native used during install
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
X-List-Received-Date: Tue, 09 May 2017 18:16:36 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc-examples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ipc/ti-ipc-examples_git.bb b/recipes-ti/ipc/ti-ipc-examples_git.bb
index 40c3bc3..8e6ceb0 100644
--- a/recipes-ti/ipc/ti-ipc-examples_git.bb
+++ b/recipes-ti/ipc/ti-ipc-examples_git.bb
@@ -6,7 +6,7 @@ require ti-ipc-rtos.inc
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://${S_ipc-examples}/src/makefile;beginline=1;endline=30;md5=fb83580b16bce88e8ed568a6005c8f02"
 
-DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos"
+DEPENDS = "ti-ipc ti-xdctools ti-sysbios ti-ipc-rtos zip-native"
 
 INSANE_SKIP_${PN} += "arch"
 
-- 
2.7.4


