Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 95A64E00C1E; Fri, 13 May 2016 12:46:44 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD924E00BDE
	for <meta-ti@yoctoproject.org>; Fri, 13 May 2016 12:46:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 932C6529B9; Fri, 13 May 2016 19:46:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160513194639.932C6529B9@arago-project.org>
Date: Fri, 13 May 2016 19:46:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libgbm: add latest version 10.0.0 from meta-arago
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
X-List-Received-Date: Fri, 13 May 2016 19:46:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 632ea21d490022bbca34ee43bda31bbe5678a779
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=632ea21d490022bbca34ee43bda31bbe5678a779

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat May 14 01:30:07 2016 +0000

libgbm: add latest version 10.0.0 from meta-arago

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-graphics/gbm/libgbm_10.0.0.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
new file mode 100644
index 0000000..a55074a
--- /dev/null
+++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Userspace interface for the kernel GBM services."
+HOMEPAGE = "http://git.ti.com"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://gbm.c;beginline=1;endline=26;md5=b871c7f2f477df29ee4c0ec437b187f7"
+DEPENDS = "libdrm"
+
+inherit autotools pkgconfig
+
+BRANCH = "next"
+
+SRCREV = "96f37555c7e82a417b02051661377b10e6b3966e"
+
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"


