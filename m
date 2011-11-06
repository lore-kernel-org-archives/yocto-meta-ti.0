Return-Path: <jdk@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2307FE00310
	for <meta-ti@yoctoproject.org>; Sun,  6 Nov 2011 03:40:46 -0800 (PST)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA6Bej3W025609
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 6 Nov 2011 05:40:45 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA6BejwQ018120
	for <meta-ti@yoctoproject.org>; Sun, 6 Nov 2011 05:40:45 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA6BejCJ005805
	for <meta-ti@yoctoproject.org>; Sun, 6 Nov 2011 05:40:45 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Sun, 6 Nov 2011
	05:40:44 -0600
Received: from D620.itg.ti.com (h0-192.vpn.ti.com [172.24.0.192])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA6Beis5007849;
	Sun, 6 Nov 2011 05:40:44 -0600
From: Jason Kridner <jdk@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 6 Nov 2011 06:40:44 -0500
Message-ID: <1320579644-14051-1-git-send-email-jdk@ti.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] beaglebone-getting-started: Update Mac driver
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Nov 2011 11:40:46 -0000
Content-Type: text/plain

This still isn't complete, but I wanted to push the latest Mac drivers
to be certain they are in the next build.

Signed-off-by: Jason Kridner <jdk@ti.com>
---
 recipes-misc/payload/beaglebone-getting-started.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-misc/payload/beaglebone-getting-started.bb b/recipes-misc/payload/beaglebone-getting-started.bb
index 15dac21..67b6f31 100644
--- a/recipes-misc/payload/beaglebone-getting-started.bb
+++ b/recipes-misc/payload/beaglebone-getting-started.bb
@@ -1,13 +1,13 @@
 DESCRIPTION = "BeagleBone Getting Started Guide"
 
-PR = "r2"
+PR = "r3"
 
 inherit allarch
 
 LICENSE = "GPLv2+ && MIT && PD && others"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=603591dea023c3c75b48e07cb47ce639"
 
-SRCREV = "bb2fdff7d7bed1bddddc0e5e05da4e03916d88a8"
+SRCREV = "f2f23b6031eeb21cef062dbfb035cc10f9603ff2"
 SRC_URI = "git://github.com/jadonk/beaglebone-getting-started.git"
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1


