Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 056CDE00A30; Tue,  7 Jul 2015 05:29:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E295EE009F0
	for <meta-ti@yoctoproject.org>; Tue,  7 Jul 2015 05:29:20 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t67CTJ0o031566
	for <meta-ti@yoctoproject.org>; Tue, 7 Jul 2015 07:29:19 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t67CTJEN015236
	for <meta-ti@yoctoproject.org>; Tue, 7 Jul 2015 07:29:19 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 7 Jul 2015 07:29:06 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t67CTHCs022149;	Tue, 7 Jul 2015 07:29:19 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 7 Jul 2015 08:29:15 -0400
Message-ID: <1436272155-9491-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1436272155-9491-1-git-send-email-j-stiffler@ti.com>
References: <1436272155-9491-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] ti-sysbios: Remove version 6.41.02.41
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
X-List-Received-Date: Tue, 07 Jul 2015 12:29:23 -0000
Content-Type: text/plain

* This has been superseded by 6.41.04.54

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 recipes-ti/bios/ti-sysbios_6.41.02.41.bb |   12 ------------
 1 file changed, 12 deletions(-)
 delete mode 100644 recipes-ti/bios/ti-sysbios_6.41.02.41.bb

diff --git a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb b/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
deleted file mode 100644
index ccc6ad1..0000000
--- a/recipes-ti/bios/ti-sysbios_6.41.02.41.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require ti-sysbios.inc
-
-PV = "6_41_02_41"
-PR = "r1"
-
-LIC_FILES_CHKSUM = "file://bios_${PV}_manifest.html;md5=a4af75ec6d586c5267c71075eebff418"
-
-SRC_URI[sysbiosbin.md5sum] = "65deff27110c2af87a3c71fea3c0345e"
-SRC_URI[sysbiosbin.sha256sum] = "2c47b4a3aa9513d10e5811a8ac7ed1d6ce3d13df57a0bffe10d8cabaf228c76f"
-
-TI_BIN_UNPK_CMDS=""
-TI_BIN_UNPK_ARGS = "--mode unattended --prefix ${WORKDIR}"
-- 
1.7.9.5


