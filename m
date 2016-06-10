Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 17BD9E00DE2; Fri, 10 Jun 2016 10:33:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0D7EE00DE2
	for <meta-ti@yoctoproject.org>; Fri, 10 Jun 2016 10:33:20 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id E824B52A76; Fri, 10 Jun 2016 17:33:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160610173318.E824B52A76@arago-project.org>
Date: Fri, 10 Jun 2016 17:33:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libdce: move from meta-arago
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
X-List-Received-Date: Fri, 10 Jun 2016 17:33:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: dc6bbf30a4f88200044383f0f45dec64fa9cd60d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=dc6bbf30a4f88200044383f0f45dec64fa9cd60d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jun  8 05:18:49 2016 +0000

libdce: move from meta-arago

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-multimedia/libdce/libdce_3.00.10.01.bb |   13 +++++++++++++
 1 files changed, 13 insertions(+), 0 deletions(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
new file mode 100644
index 0000000..aa61cb6
--- /dev/null
+++ b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
@@ -0,0 +1,13 @@
+DESCRIPTION = "Library used for remotely invoking the hw accelerated codec on IVA-HD"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://libdce.h;beginline=1;endline=31;md5=0a398cf815b8b5f31f552266cd453dae"
+
+inherit autotools pkgconfig
+
+DEPENDS = "libdrm ti-ipc"
+
+SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
+SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
+
+S = "${WORKDIR}/git"
+EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"


