Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2356AE00A5C; Wed, 15 Feb 2017 11:41:33 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FD86E009C3
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 11:41:28 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 455F452996; Wed, 15 Feb 2017 19:41:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170215194127.455F452996@arago-project.org>
Date: Wed, 15 Feb 2017 19:41:27 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : libdce: Update SRCREV
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
X-List-Received-Date: Wed, 15 Feb 2017 19:41:33 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 82fd7969b1d2c310af4043378b112a4ca2444bd7
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=82fd7969b1d2c310af4043378b112a4ca2444bd7

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Wed Feb 15 17:34:38 2017 +0000

libdce: Update SRCREV

This change will include:
 * New interface file for MJPEG Encoder
 * Increase max instances of Engines

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-multimedia/libdce/libdce_3.00.12.00.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.12.00.bb b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
index b1bbeab..1a2c104 100644
--- a/recipes-multimedia/libdce/libdce_3.00.12.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
@@ -7,9 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "c51f144b079836afb868bff44afe7308248a0217"
+SRCREV = "398dd27e7f3181fff9e3d910b418c69f1493f52f"
 
-PR = "r1"
+PR = "r4"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"


