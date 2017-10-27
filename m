Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 739F1E00D46; Thu, 26 Oct 2017 22:11:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE01FE00D51
	for <meta-ti@yoctoproject.org>; Thu, 26 Oct 2017 22:11:28 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9R5BHjK001175
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 00:11:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1509081077;
	bh=jbZMVt4mfLmeUskxAekyiwoibbLMY1wAvs1lBccmfXc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=YBjxw+0ept6KEV/RB9dfq+x2zWjC7Apq/UAvWFjhGmNlJO401UiX99G9YFIoQn8F1
	MzcUFMVa0hs+5F8L7o50NNolmHYPf0F5QTbm8NIgLHMdsc7Zay5r7psRUN01J84sqi
	+OUgDGoKZV6BRf9w/1aq1g0s4ocHJz/A8ozK0osw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9R5BCld024138
	for <meta-ti@yoctoproject.org>; Fri, 27 Oct 2017 00:11:12 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 27 Oct 2017 00:11:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 27 Oct 2017 00:11:12 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9R5B9RJ013231;
	Fri, 27 Oct 2017 00:11:11 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 27 Oct 2017 10:41:08 +0530
Message-ID: <1509081068-45481-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1509081068-45481-1-git-send-email-a0393906@ti.com>
References: <1509081068-45481-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty 2/2] libdce: update to 3.00.14.00 version
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
X-List-Received-Date: Fri, 27 Oct 2017 05:11:30 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../libdce/{libdce_3.00.13.00.bb => libdce_3.00.14.00.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-multimedia/libdce/{libdce_3.00.13.00.bb => libdce_3.00.14.00.bb} (86%)

diff --git a/recipes-multimedia/libdce/libdce_3.00.13.00.bb b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
similarity index 86%
rename from recipes-multimedia/libdce/libdce_3.00.13.00.bb
rename to recipes-multimedia/libdce/libdce_3.00.14.00.bb
index 0845605..04c0b71 100644
--- a/recipes-multimedia/libdce/libdce_3.00.13.00.bb
+++ b/recipes-multimedia/libdce/libdce_3.00.14.00.bb
@@ -7,9 +7,9 @@ inherit autotools pkgconfig
 DEPENDS = "libdrm ti-ipc"
 
 SRC_URI = "git://git.omapzoom.org/repo/libdce.git;protocol=git"
-SRCREV = "75810b7bb53d2d076a96c2d1e2f8c61b3c12cb6b"
+SRCREV = "f72096090e3063e85ea77cae66b2d99a48d91727"
 
-PR = "r0"
+PR = "r1"
 
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "IPC_HEADERS=${STAGING_INCDIR}/ti/ipc/mm"
-- 
1.9.1


