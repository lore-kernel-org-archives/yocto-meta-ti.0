Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD2D7E00A03; Thu, 21 May 2015 08:12:10 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 85D4CE009D6
	for <meta-ti@yoctoproject.org>; Thu, 21 May 2015 08:12:01 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 48E3B52A22; Thu, 21 May 2015 15:12:01 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150521151201.48E3B52A22@arago-project.org>
Date: Thu, 21 May 2015 15:12:01 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap5-sgx-ddk-um-linux: fix GNU_HASH and RPATH QA warnings
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
X-List-Received-Date: Thu, 21 May 2015 15:12:10 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 92af7cd1bfba25867b2d72b7b591abf5f3ed91a5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=92af7cd1bfba25867b2d72b7b591abf5f3ed91a5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu May 21 07:56:25 2015 +0000

omap5-sgx-ddk-um-linux: fix GNU_HASH and RPATH QA warnings

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
index 10d1a1e..f806ae8 100644
--- a/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
+++ b/recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
@@ -25,4 +25,4 @@ FILES_${PN} +=  "${includedir}/* /usr/share/sgx-lib/"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-INSANE_SKIP_${PN} += "dev-so"
+INSANE_SKIP_${PN} += "dev-so ldflags useless-rpaths"


