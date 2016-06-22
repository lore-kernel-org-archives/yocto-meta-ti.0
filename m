Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FEF1E00A6D; Wed, 22 Jun 2016 09:07:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7E7FE009F6
	for <meta-ti@yoctoproject.org>; Wed, 22 Jun 2016 09:07:02 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5MG6GdQ002132
	for <meta-ti@yoctoproject.org>; Wed, 22 Jun 2016 11:06:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5MG71D3029063
	for <meta-ti@yoctoproject.org>; Wed, 22 Jun 2016 11:07:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 22 Jun 2016 11:07:01 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5MG6xKo032399;
	Wed, 22 Jun 2016 11:07:00 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 22 Jun 2016 21:36:12 +0530
Message-ID: <1466611572-31285-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] libdce: temporarily revert back to 3.08
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
X-List-Received-Date: Wed, 22 Jun 2016 16:07:06 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.10.01.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.10.01.bb b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
index aa61cb6..7cf95dc 100644
--- a/recipes-multimedia/libdce/libdce_3.00.10.01.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.10.01.bb
@@ -7,7 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "4e9b02508ac3847df0af5c496a1be7b4ae082ad5"
+SRCREV = "3040e7e3f7d1ed42a1273ccc6b912328b90b16db"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
+
+PR = "r1"
-- 
1.9.1


