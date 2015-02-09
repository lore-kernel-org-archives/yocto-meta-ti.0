Return-Path: <sam.nelson@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22D5FE008CF; Mon,  9 Feb 2015 08:43:08 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5EA99E008A7
	for <meta-ti@yoctoproject.org>; Mon,  9 Feb 2015 08:42:57 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t19GguhF025972
	for <meta-ti@yoctoproject.org>; Mon, 9 Feb 2015 10:42:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t19Ggt2f026615
	for <meta-ti@yoctoproject.org>; Mon, 9 Feb 2015 10:42:55 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 9 Feb 2015 10:42:54 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t19GgsOx005582;	Mon, 9 Feb 2015 10:42:55 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 9 Feb 2015 11:42:53 -0500
Message-ID: <1423500174-21662-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ti-ipc: Correct error in ti ipc lad daemon startup script
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
X-List-Received-Date: Mon, 09 Feb 2015 16:43:08 -0000
Content-Type: text/plain

- Need to add -l for the log file parameter
- Added -- to pass log file as additional parameter

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
index 97f870e..7f0632a 100644
--- a/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
+++ b/recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh
@@ -1,14 +1,15 @@
 #! /bin/sh
 
 tiipclad_daemon=/usr/bin/__LAD_DAEMON__
-tiipclad_params=lad.txt
+tiipclad_params="-l lad.txt"
 
 test -x "$tiipclad_daemon" || exit 0
 
 case "$1" in
   start)
     echo -n "Starting tiipclad daemon"
-    start-stop-daemon --start --quiet --exec $tiipclad_daemon $tiipclad_params
+    start-stop-daemon --start --quiet \
+        --exec $tiipclad_daemon -- $tiipclad_params
     echo "."
     ;;
   stop)
-- 
1.7.9.5


