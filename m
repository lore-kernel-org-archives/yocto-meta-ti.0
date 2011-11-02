Return-Path: <joelagnel@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6101AE006B4
	for <meta-ti@yoctoproject.org>; Wed,  2 Nov 2011 14:42:04 -0700 (PDT)
Received: from dlep33.itg.ti.com ([157.170.170.112])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA2Lg3JI008010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 16:42:03 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep33.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA2Lg3nk022336
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 16:42:03 -0500 (CDT)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA2Lg3Zp017956
	for <meta-ti@yoctoproject.org>; Wed, 2 Nov 2011 16:42:03 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Wed, 2 Nov 2011
	16:42:03 -0500
Received: from localhost.localdomain (lta0273324a.am.dhcp.ti.com
	[10.247.20.212])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	pA2Lg223027662;	Wed, 2 Nov 2011 16:42:02 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 2 Nov 2011 16:42:00 -0500
Message-ID: <1320270120-16866-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] beaglebone-tester: Use optargs instead of ip_method on kernel cmdline
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
X-List-Received-Date: Wed, 02 Nov 2011 21:42:04 -0000
Content-Type: text/plain

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 6284ff2..2db6e8c 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
           "
-SRCREV = "53cc6b3d8f46814d0aa2daedfbc380ba64059a97"
+SRCREV = "7c994dfe5d97d9385605bfafab9c0b967814bac5"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1


