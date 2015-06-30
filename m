Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AE29E00A7E; Tue, 30 Jun 2015 12:09:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6566AE00A3C
	for <meta-ti@yoctoproject.org>; Tue, 30 Jun 2015 12:09:04 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8F9B152AB5; Tue, 30 Jun 2015 19:09:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150630190903.8F9B152AB5@arago-project.org>
Date: Tue, 30 Jun 2015 19:09:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : hyplnk-lld: Correct reference to k2l library
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
X-List-Received-Date: Tue, 30 Jun 2015 19:09:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 74dcf32e4b62ed0c076b581ac48268728fc66b66
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=74dcf32e4b62ed0c076b581ac48268728fc66b66

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Mon Jun 29 22:56:23 2015 +0000

hyplnk-lld: Correct reference to k2l library

- Hyperlink module is not present in k2l device.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hyplnk-lld/files/init_hyplnk.sh |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
index fb65057..d6795f1 100755
--- a/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
+++ b/recipes-bsp/hyplnk-lld/files/init_hyplnk.sh
@@ -28,10 +28,6 @@ case "$compatible" in
 		device=k2hk
 		ln -sf libhyplnk_k2h.so.1.0.0 libhyplnk_device.so.1
 	;;
-	*k2l*)
-		device=k2l
-		ln -sf libhyplnk_k2l.so.1.0.0 libhyplnk_device.so.1
-	;;
 	*k2e*)
 		device=k2e
 		ln -sf libhyplnk_k2e.so.1.0.0 libhyplnk_device.so.1


