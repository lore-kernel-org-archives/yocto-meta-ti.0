Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0515E00877; Tue,  7 Oct 2014 12:24:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 932F9E00786
	for <meta-ti@yoctoproject.org>; Tue,  7 Oct 2014 12:24:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id EEF1E529CF; Tue,  7 Oct 2014 19:23:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141007192357.EEF1E529CF@arago-project.org>
Date: Tue,  7 Oct 2014 19:23:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : bltsville: Updated SRCREV to the latest
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
X-List-Received-Date: Tue, 07 Oct 2014 19:24:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d0ee68d6bab6056f68123c56c0d45370ef6b563a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d0ee68d6bab6056f68123c56c0d45370ef6b563a

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Tue Sep 23 22:00:34 2014 +0000

bltsville: Updated SRCREV to the latest

* Contains incremental updates and bug fixes

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/bltsville/bltsville_git.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/bltsville/bltsville_git.bb b/recipes-graphics/bltsville/bltsville_git.bb
index 158d189..7a05b4d 100644
--- a/recipes-graphics/bltsville/bltsville_git.bb
+++ b/recipes-graphics/bltsville/bltsville_git.bb
@@ -4,9 +4,9 @@ LICENSE = "BSD-3-Clause & TI-TSPA"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10a9abb9c5bb19edd83a8cf66eef7148 \
                     file://ticpu/license;md5=0bb831850a0de80e32a63772d89c6562"
 
-PR = "r2"
+PR = "r3"
 
-SRCREV = "016586280ecdae201fd6e340ec8c4f8a9605cc94"
+SRCREV = "a759bde8a5a6e518dfb8a6e633736a360005498e"
 
 inherit autotools pkgconfig
 


