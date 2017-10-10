Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3DD68E00CC3; Tue, 10 Oct 2017 02:36:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9021E00C96
	for <meta-ti@yoctoproject.org>; Tue, 10 Oct 2017 02:36:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9A9agUc007422
	for <meta-ti@yoctoproject.org>; Tue, 10 Oct 2017 04:36:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507628202;
	bh=neCK2P80aCk/UW9kXgVnjHtHkv7odmWDGTZCzYUkxFQ=;
	h=From:To:CC:Subject:Date;
	b=LJssTK/KofZ5XZv43d7oa9UBgZWfGGmYu4TllYazM5n5PYvjnt/l0e6+5yKU3UJa5
	4Ral+yDX0giv1xNuoCFN78B83cegw5MUturH9l4csCM55kk7a6BI6UGgKWJ2CuVhKB
	QufjopUfC674qPo1xNe5W38t4ch7TzaoyTVsDUl4=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A9abkw018878
	for <meta-ti@yoctoproject.org>; Tue, 10 Oct 2017 04:36:37 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 04:36:37 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 04:36:37 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9A9aZlh016442;
	Tue, 10 Oct 2017 04:36:36 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 10 Oct 2017 15:06:34 +0530
Message-ID: <1507628194-109632-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] libdce: Update SRCREV
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
X-List-Received-Date: Tue, 10 Oct 2017 09:36:54 -0000
Content-Type: text/plain

* Minor REV bump

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 recipes-multimedia/libdce/libdce_3.00.12.00.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-multimedia/libdce/libdce_3.00.12.00.bb b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
index 1a2c104..e2f3c28 100644
--- a/recipes-multimedia/libdce/libdce_3.00.12.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.12.00.bb
@@ -7,9 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "398dd27e7f3181fff9e3d910b418c69f1493f52f"
+SRCREV = "75810b7bb53d2d076a96c2d1e2f8c61b3c12cb6b"
 
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.9.1


