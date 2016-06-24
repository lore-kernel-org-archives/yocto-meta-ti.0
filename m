Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8F642E00D26; Fri, 24 Jun 2016 07:31:35 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A67C1E00D28
	for <meta-ti@yoctoproject.org>; Fri, 24 Jun 2016 07:31:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 26CFC52AC8; Fri, 24 Jun 2016 14:31:28 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160624143128.26CFC52AC8@arago-project.org>
Date: Fri, 24 Jun 2016 14:31:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : libdce: add API for query remote proc information
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
X-List-Received-Date: Fri, 24 Jun 2016 14:31:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d259985667ba2a37e7fda95d03ae038f18497a50
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d259985667ba2a37e7fda95d03ae038f18497a50

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Jun 23 18:47:41 2016 +0000

libdce: add API for query remote proc information

This update contains two main changes:
 * Fix for multimedia playback failure with core dumped
 * New API addition for querying remote proc information

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-multimedia/libdce/libdce_3.00.10.01.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
index aa61cb6..7adb961 100644
--- a/recipes-multimedia/libdce/libdce_3.00.10.01.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
@@ -7,7 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
+SRCREV = "f83e785d2b98404fed9e3a6264bf4945c65abd12"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
+
+PR = "r1"


