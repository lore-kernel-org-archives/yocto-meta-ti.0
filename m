Return-Path: <>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D8E6E009DC; Fri, 13 Sep 2019 08:42:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F41B1E00A93
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 08:42:13 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8DFgCZP109254
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 10:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568389332;
	bh=cLT5wAPUkGSlxcSRdwomgOa/VKj4BQPVKjg7l/TtuAM=;
	h=From:To:CC:Subject:Date;
	b=ilAWrBpGNsGTAE4uBZghO4pFCj3Z/4HILogKEKjd6Bl9IOgFzlM73BLJzZK+6tp6A
	L4A1UgTPMybQS+q1WHQJRLOT0Q7EAEBgz097KEhvh9XUIXqUiGOTp6F+oZn/LJbssm
	998aQgzje8ynY2ojrHk9hrOWwbmmhpZQbX3602+g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DFgCb2037258
	for <meta-ti@yoctoproject.org>; Fri, 13 Sep 2019 10:42:12 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 13 Sep 2019 10:42:11 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 13 Sep 2019 10:42:11 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8DFgBt5038651;
	Fri, 13 Sep 2019 10:42:11 -0500
Received: from localhost ([10.250.95.88])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	x8DFg8Z21347; Fri, 13 Sep 2019 10:42:08 -0500 (CDT)
From: "Andrew F. Davis" <afd@ti.com>
To: Denys Dmytriyenko <denys@ti.com>, Gowtham Tammana <g-tammana@ti.com>, Eric
	Ruei <e-ruei1@ti.com>
Date: Fri, 13 Sep 2019 11:42:01 -0400
Message-ID: <20190913154201.20600-1-afd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: [thud/master][PATCH] libgbm: Remove remaining parts of this project
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
X-List-Received-Date: Fri, 13 Sep 2019 15:42:15 -0000
Content-Type: text/plain

After libgbm was moved into the ti-sgx-ddk-um project the recipe for
libgbm was deleted, this patch was left over, remove it here.

Signed-off-by: Andrew F. Davis <afd@ti.com>
---
 ...s-sysmacros.h-for-minor-major-in-new.patch | 28 -------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch

diff --git a/recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch b/recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch
deleted file mode 100644
index 31134ab6..00000000
--- a/recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From ea5fc8da36886490d0ee40d475733cd98e38c2ec Mon Sep 17 00:00:00 2001
-From: Denys Dmytriyenko <denys@ti.com>
-Date: Tue, 28 Aug 2018 18:35:55 -0400
-Subject: [PATCH] gbm.c: include <sys/sysmacros.h> for minor/major in new glibc
-
-glibc 2.28+ now requires this.
-https://sourceware.org/bugzilla/show_bug.cgi?id=19239
-
-Signed-off-by: Denys Dmytriyenko <denys@ti.com>
----
- gbm.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/gbm.c b/gbm.c
-index c046b1a..9356d7b 100644
---- a/gbm.c
-+++ b/gbm.c
-@@ -35,6 +35,7 @@
- #include <stdint.h>
- 
- #include <sys/types.h>
-+#include <sys/sysmacros.h>
- #include <sys/stat.h>
- #include <unistd.h>
- #include <errno.h>
--- 
-2.7.4
-
-- 
2.17.1


