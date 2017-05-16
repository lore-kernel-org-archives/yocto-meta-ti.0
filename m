Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E0F1EE00B57; Tue, 16 May 2017 05:06:20 -0700 (PDT)
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
	*      [198.47.27.77 listed in list.dnswl.org]
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7C6F4E00B0B
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 05:06:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4GC6IxC017702
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 07:06:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1494936378;
	bh=XL/JCjXfODrEKm86oPLFhKfQ9w7bXjxitCsPJDzLUug=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oboDgwdPmqJxaoOZk8Wu5J812acnVy1doQYbz7z0xmuXnjvhsH9GbRt+SlTUb1lGc
	15ENBZbmHJBMyRLENp6Gx3SGZjJjfxtc80n7M8k8/ftd8HRR/tameUZ+JooTQG3j09
	Q3RL5Byv4HPPtxdlYKxdXzv1FGE5zsrTuPbcRRuE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4GC6I0e023172
	for <meta-ti@yoctoproject.org>; Tue, 16 May 2017 07:06:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 16 May 2017 07:06:17 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4GC6I6o032450;	Tue, 16 May 2017 07:06:18 -0500
Received: from localhost ([172.22.129.14])	by legion.dal.design.ti.com
	(8.11.7p1+Sun/8.11.7) with ESMTP id v4GC6H304879;
	Tue, 16 May 2017 07:06:17 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 16 May 2017 07:06:01 -0500
Message-ID: <20170516120601.8411-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170516120601.8411-1-dmurphy@ti.com>
References: <20170516120601.8411-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] uboot-ti-staging: update to ti2017.01-rc4 tag
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
X-List-Received-Date: Tue, 16 May 2017 12:06:20 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index ca48426c..c0d81b7d 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r3"
+PR = "r4"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "5875b5f5072adb4d2320cbe7aed787c00a3f1b7f"
+SRCREV = "9fd60700db4562ffac00317a9a44761b8c3255f1"
-- 
2.12.2


