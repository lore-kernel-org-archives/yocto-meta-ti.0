Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31CA8E00D3B; Thu, 27 Oct 2016 16:44:20 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6904E00DBA
	for <meta-ti@yoctoproject.org>; Thu, 27 Oct 2016 16:44:12 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDEE95299E; Thu, 27 Oct 2016 23:44:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161027234411.CDEE95299E@arago-project.org>
Date: Thu, 27 Oct 2016 23:44:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Khem Raj : uim: Fix build breaks when toolchain is used from sstate
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
X-List-Received-Date: Thu, 27 Oct 2016 23:44:20 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 8844d0e0b630226977a4103b586c246289f8148a
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8844d0e0b630226977a4103b586c246289f8148a

Author: Khem Raj <raj.khem@gmail.com>
Date:   Wed Oct 26 00:36:00 2016 +0000

uim: Fix build breaks when toolchain is used from sstate

CC is being redefined here but its not considering
the essential options to specify the sysroot as a result
this breaks on systems tied to sstate servers where the toolchain
might have had a different sysroot when built, in here
it fails to find the standard headers due to missing sysroot
options.

Deleting the extra oeconf works fine.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-connectivity/uim/uim_8.5.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes-connectivity/uim/uim_8.5.bb b/recipes-connectivity/uim/uim_8.5.bb
index ac9dc51..72e2166 100644
--- a/recipes-connectivity/uim/uim_8.5.bb
+++ b/recipes-connectivity/uim/uim_8.5.bb
@@ -12,8 +12,6 @@ SRC_URI = "git://git.ti.com/ti-bt/uim.git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
-
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 uim ${D}${bindir}


