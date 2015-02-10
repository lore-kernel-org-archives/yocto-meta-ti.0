Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0C18E008CC; Tue, 10 Feb 2015 12:41:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1DB12E008CF
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:40:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9BD2152A67; Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150210204056.9BD2152A67@arago-project.org>
Date: Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : ti-ipc: Correct error in ti ipc lad daemon startup script
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
X-List-Received-Date: Tue, 10 Feb 2015 20:41:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: fc80f04360d5c67e4501eb8b292b67864b2a3aad
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=fc80f04360d5c67e4501eb8b292b67864b2a3aad

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Feb  9 22:42:53 2015 +0000

ti-ipc: Correct error in ti ipc lad daemon startup script

- Need to add -l for the log file parameter
- Added -- to pass log file as additional parameter

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/ipc/ti-ipc/tiipclad-daemon.sh |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

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


