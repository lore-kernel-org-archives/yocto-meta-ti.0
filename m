Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59265E003D2; Mon, 23 Jun 2014 15:04:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=RDNS_DYNAMIC, TO_NO_BRKTS_DYNIP
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.4 RDNS_DYNAMIC Delivered to internal network by host
	with *      dynamic-looking rDNS
	*  1.1 TO_NO_BRKTS_DYNIP To: misformatted and dynamic rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73B96E00511
	for <meta-ti@yoctoproject.org>; Mon, 23 Jun 2014 15:04:54 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B412152AB8; Mon, 23 Jun 2014 22:04:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20140623220450.B412152AB8@arago-project.org>
Date: Mon, 23 Jun 2014 22:04:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Ash Charles : gstreamer-ti: Revert to build in place ${B} = ${S}
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
X-List-Received-Date: Mon, 23 Jun 2014 22:04:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 95db662c8a1bb2c89f1ec83658a07ba2d8ac6c0a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=95db662c8a1bb2c89f1ec83658a07ba2d8ac6c0a

Author: Ash Charles <ashcharles@gmail.com>
Date:   Sat Jun 14 04:34:06 2014 +0000

gstreamer-ti: Revert to build in place ${B} = ${S}

This recipe use autotools and breaks when built out-of-tree
(${B} != ${S}).

Signed-off-by: Ash Charles <ashcharles@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-ti/gstreamer-ti/gstreamer-ti.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-ti/gstreamer-ti/gstreamer-ti.inc b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
index 2c503f5..e0e65a7 100644
--- a/recipes-ti/gstreamer-ti/gstreamer-ti.inc
+++ b/recipes-ti/gstreamer-ti/gstreamer-ti.inc
@@ -9,7 +9,7 @@ LICENSE = "LGPL"
 # TODO :: Check if CPPFLAGS_append is still required
 # TODO :: Remove ENCODE/DECODE combo exports - these are not used anymore (check?)
 
-inherit autotools
+inherit autotools-brokensep
 inherit update-rc.d
 require recipes-ti/includes/ti-paths.inc
 require recipes-ti/includes/ti-staging.inc


