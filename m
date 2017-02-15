Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22D64E0086E; Wed, 15 Feb 2017 03:44:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 558 seconds by postgrey-1.32 at yocto-www;
	Wed, 15 Feb 2017 03:44:20 PST
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7AFBE0082E
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 03:44:20 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v1FBYqvM001144
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 05:34:52 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FBYlXV002858
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 05:34:47 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Feb 2017 05:34:46 -0600
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v1FBYiu7029878;
	Wed, 15 Feb 2017 05:34:46 -0600
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 15 Feb 2017 17:04:38 +0530
Message-ID: <1487158478-9962-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487158478-9962-1-git-send-email-a0393906@ti.com>
References: <1487158478-9962-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [master, krogoth 2/2] libdce: Update SRCREV
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
X-List-Received-Date: Wed, 15 Feb 2017 11:44:22 -0000
Content-Type: text/plain

This change will include:
 * New interface file for MJPEG Encoder
 * Increase max instances of Engines

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.12.00.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

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
-- 
1.9.1


