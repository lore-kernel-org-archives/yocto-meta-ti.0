Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3380DE00C2C; Mon, 31 Jul 2017 11:19:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AB91AE00BAF
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 11:19:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6VIJFev016616
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 13:19:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501525155;
	bh=pHwCelQCTpILy6XltDc0x+H03vZ8keJ7IXZiI0lQK94=;
	h=From:To:CC:Subject:Date;
	b=kO/KLfPQpp1jZH8SU6hDQ3X54MsU36JkOxR3+uDBatXBV6cjzbQRvQe1EBfYnVOJ8
	5g/qEbzHnMIpxSths3QTb64JHOeJ48VbtdLijQV4MgcbFBrf0hBWvdj8Fk2Mh0Bm06
	dMRneMK2E9uCy0IN6zVevTxtQir5dgeOljjxsV7g=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6VIJFnO008892
	for <meta-ti@yoctoproject.org>; Mon, 31 Jul 2017 13:19:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Jul 2017 13:19:15 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6VIJFaI011295;	Mon, 31 Jul 2017 13:19:15 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 31 Jul 2017 14:19:05 -0400
Message-ID: <1501525145-28076-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] libdce: Update PV and SRCREV
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
X-List-Received-Date: Mon, 31 Jul 2017 18:19:17 -0000
Content-Type: text/plain

From: Karthik Ramanan <a0393906@ti.com>

Updates to dce_test to print additional
extendedError for VC1 and MPEG2

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../{libdce_3.00.12.00.bb => libdce_3.00.13.00.bb} |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-multimedia/libdce/{libdce_3.00.12.00.bb => libdce_3.00.13.00.bb} (86%)

diff --git a/recipes-multimedia/libdce/libdce_3.00.12.00.bb b/recipes-multimedia/libdce/libdce_3.00.13.00.bb
similarity index 86%
rename from recipes-multimedia/libdce/libdce_3.00.12.00.bb
rename to recipes-multimedia/libdce/libdce_3.00.13.00.bb
index 1a2c104..0845605 100644
--- a/recipes-multimedia/libdce/libdce_3.00.12.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.13.00.bb
@@ -7,9 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "398dd27e7f3181fff9e3d910b418c69f1493f52f"
+SRCREV = "75810b7bb53d2d076a96c2d1e2f8c61b3c12cb6b"
 
-PR = "r4"
+PR = "r0"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.7.9.5


