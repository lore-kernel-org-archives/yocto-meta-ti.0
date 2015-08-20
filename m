Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 770E2E00947; Wed, 19 Aug 2015 17:55:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2AFBE0097F
	for <meta-ti@yoctoproject.org>; Wed, 19 Aug 2015 17:55:48 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 77748529AC; Thu, 20 Aug 2015 00:55:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150820005547.77748529AC@arago-project.org>
Date: Thu, 20 Aug 2015 00:55:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Molfetta, Stephen : tiipclad-daemon.sh: Enabling GateMP support
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
X-List-Received-Date: Thu, 20 Aug 2015 00:55:51 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 781e7e00c4ba8e968cbd8e82e98edb0b7a5f2659
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=781e7e00c4ba8e968cbd8e82e98edb0b7a5f2659

Author: Molfetta, Stephen <sjmolfetta@ti.com>
Date:   Wed Aug 19 03:51:06 2015 +0000

tiipclad-daemon.sh: Enabling GateMP support

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
 


