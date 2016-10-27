Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B077BE00D3F; Thu, 27 Oct 2016 16:44:09 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,RDNS_DYNAMIC,
	TO_NO_BRKTS_PCNT autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
	*  2.5 TO_NO_BRKTS_PCNT To: lacks brackets + percentage
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E02D9E00CFF
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 16:44:07 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E5879529B4; Thu, 27 Oct 2016 23:44:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161027234406.E5879529B4@arago-project.org>
Date: Thu, 27 Oct 2016 23:44:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libdce: update to 3.00.12.00 version
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
X-List-Received-Date: Thu, 27 Oct 2016 23:44:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e4f5ee61fb81e4aacc5ee35202ba6849fbb1651a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e4f5ee61fb81e4aacc5ee35202ba6849fbb1651a

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Oct 27 22:39:46 2016 +0000

libdce: update to 3.00.12.00 version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../{libdce_3.00.10.01.bb => libdce_3.00.12.00.bb} |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
similarity index 86%
rename from recipes-multimedia/libdce/libdce_3.00.10.01.bb
rename to recipes-multimedia/libdce/libdce_3.00.12.00.bb
index 7adb961..32f12b4 100644
--- a/recipes-multimedia/libdce/libdce_3.00.10.01.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
@@ -7,9 +7,7 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "f83e785d2b98404fed9e3a6264bf4945c65abd12"
+SRCREV = "1b1b5a2e5e995f607c22651579b49aa98d08610a"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-
-PR = "r1"


