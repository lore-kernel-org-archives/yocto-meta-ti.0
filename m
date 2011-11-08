Return-Path: <joelagnel@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE772E0138C
	for <meta-ti@yoctoproject.org>; Mon,  7 Nov 2011 22:10:12 -0800 (PST)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id pA86ABIA004911
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Tue, 8 Nov 2011 00:10:12 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pA86ABD9007588
	for <meta-ti@yoctoproject.org>; Tue, 8 Nov 2011 00:10:11 -0600 (CST)
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA86ABJE000559
	for <meta-ti@yoctoproject.org>; Tue, 8 Nov 2011 00:10:11 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3; Tue, 8 Nov 2011
	00:10:12 -0600
Received: from localhost.localdomain (h16-252.vpn.ti.com [172.24.16.252])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id pA86AAB9021053;
	Tue, 8 Nov 2011 00:10:11 -0600
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 8 Nov 2011 00:10:07 -0600
Message-ID: <1320732607-1033-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>
Subject: [PATCH] beaglebone-tester: Update to latest, add quiet option to bootargs
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
X-List-Received-Date: Tue, 08 Nov 2011 06:10:13 -0000
Content-Type: text/plain

Changes:
* Fix a bug where I was removing g_mass_storage causing the storage-gadget service
to appear to not work

* Add quiet option

Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
---
 recipes-ti/beagleboard/beaglebone-tester.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/beagleboard/beaglebone-tester.bb b/recipes-ti/beagleboard/beaglebone-tester.bb
index 1020172..5816a5c 100644
--- a/recipes-ti/beagleboard/beaglebone-tester.bb
+++ b/recipes-ti/beagleboard/beaglebone-tester.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM="file://gpl.txt;md5=5b122a36d0f6dc55279a0ebc69f3c60b"
 # only scripts and data
 inherit allarch
 
-PR = "r6"
+PR = "r7"
 
 SRC_URI = "git://github.com/joelagnel/validation-scripts.git;protocol=git \
           "
-SRCREV = "be5173d05cce4f914911366e5ddae1ff5c0af9cf"
+SRCREV = "602b3936907795520dba370b246c195a4f612a44"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.4.1


