Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7DA36E00EC6; Fri, 16 Dec 2016 09:45:13 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50A81E00E4A
	for <meta-ti@yoctoproject.org>; Fri, 16 Dec 2016 09:45:10 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7B02A52A5B; Fri, 16 Dec 2016 17:45:09 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161216174509.7B02A52A5B@arago-project.org>
Date: Fri, 16 Dec 2016 17:45:09 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : libdce: Update SRCREV add MJPEG Encoder support
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
X-List-Received-Date: Fri, 16 Dec 2016 17:45:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 413146be21307805c67d982f77ceeb3f760b38ad
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=413146be21307805c67d982f77ceeb3f760b38ad

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Fri Dec 16 20:46:23 2016 +0000

libdce: Update SRCREV add MJPEG Encoder support

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-multimedia/libdce/libdce_3.00.12.00.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.12.00.bb b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
index 32f12b4..b1bbeab 100644
--- a/recipes-multimedia/libdce/libdce_3.00.12.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
@@ -7,7 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "1b1b5a2e5e995f607c22651579b49aa98d08610a"
+SRCREV = "c51f144b079836afb868bff44afe7308248a0217"
+
+PR = "r1"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"


