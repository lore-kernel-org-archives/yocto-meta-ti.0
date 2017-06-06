Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1D765E00BDA; Tue,  6 Jun 2017 10:06:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0CFCE00BD5
	for <meta-ti@yoctoproject.org>; Tue,  6 Jun 2017 10:05:59 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v56H5mdD024462
	for <meta-ti@yoctoproject.org>; Tue, 6 Jun 2017 12:05:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1496768748;
	bh=85hHsI9eCV85vxBRudZgtPVfLEYl6IEehEHwzdqnaqs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=sn8f2ZCLoI+hhyHxfB0BGS6BeEmD29bRuXp+5QYnI26IcsWyZT05K0Mm8yWr79EJW
	2qFUnG1TEr+dUkUNz1Dn6lbam97kZwx9NTZi9gHeO9ZrsTOua8prUwNt2CwRvnHiVw
	QxX7uODTUSrI3wro8eRMkuH6TVxBKzuJ6MvdFde4=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v56H5hxt007588
	for <meta-ti@yoctoproject.org>; Tue, 6 Jun 2017 12:05:43 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Jun 2017 12:05:42 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v56H5hKh009858;	Tue, 6 Jun 2017 12:05:43 -0500
Received: from localhost ([172.22.138.215])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v56H5g323856;
	Tue, 6 Jun 2017 12:05:42 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 6 Jun 2017 12:05:23 -0500
Message-ID: <20170606170524.3511-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170606170524.3511-1-dmurphy@ti.com>
References: <20170606170524.3511-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH v3 2/3] uboot-ti-staging: update to ti2017.02-rc2 tag
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
X-List-Received-Date: Tue, 06 Jun 2017 17:06:05 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
v3 - Moved to rc2 from rc1

 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index c0d81b7d..73aec1c4 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r4"
+PR = "r5"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "9fd60700db4562ffac00317a9a44761b8c3255f1"
+SRCREV = "40e76546f34e77cf12454137a3f16322b9610d4c"
-- 
2.12.2


