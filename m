Return-Path: <denis@denix.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CD191E00A7D; Tue, 18 Aug 2015 14:51:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [206.46.173.19 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A5815E00973
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2015 14:51:33 -0700 (PDT)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NTA001XCSP72950@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Tue, 18 Aug 2015 16:51:12 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=uRRa74qj2VoA:10
	a=sozttTNsAAAA:8	a=2eoqVkci6WkNdKo_tckA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B6174161B46;	Tue,
	18 Aug 2015 17:51:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-ti@yoctoproject.org
Date: Tue, 18 Aug 2015 17:51:06 -0400
Message-id: <1439934666-14772-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Cc: "Molfetta, Stephen" <sjmolfetta@ti.com>
Subject: [PATCH] tiipclad-daemon.sh: Enabling GateMP support
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
X-List-Received-Date: Tue, 18 Aug 2015 21:51:39 -0000

From: "Molfetta, Stephen" <sjmolfetta@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
index 7f0632a..9ebfa35 100644
--- a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
+++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
@@ -1,7 +1,7 @@
 #! /bin/sh
 
 tiipclad_daemon=/usr/bin/__LAD_DAEMON__
-tiipclad_params="-l lad.txt"
+tiipclad_params="-g -l lad.txt"
 
 test -x "$tiipclad_daemon" || exit 0
 
-- 
2.2.0


