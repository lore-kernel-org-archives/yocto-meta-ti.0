Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2540E00ACE; Mon,  1 May 2017 12:01:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A49FFE00B27
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 12:01:53 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41J1qjg000610
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:01:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493665312;
	bh=kVonSinWOsZsbwHOIBV37sbgi2AEnHByqFON9K/6JPA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ayD1DNb2lzPf3iczDIPiIlB4sxF+0WoIXLuq1nR+HfkWDXCcwfjdFyKx1sx6rrEMM
	FK/+WEwtX7sQxBdg2TrJBIfIFUDqsokQ2Vn25003WhYijn2naqTGyiq4fQEP1sGgdK
	IQ5xY7BzGVlO3icQ6HGtCJ5eBPTJhwNE8o7u3Kso=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41J1qsi018487
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 14:01:52 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 14:01:52 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41J1qMW000378;	Mon, 1 May 2017 14:01:52 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.109.252])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v41J1q300531; Mon, 1 May 2017 14:01:52 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 14:01:48 -0500
Message-ID: <20170501190150.4110-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170501190150.4110-1-dmurphy@ti.com>
References: <20170501190150.4110-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [v2 PATCH 2/4] uboot-ti-staging: update to ti2017.01-rc2 tag
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
X-List-Received-Date: Mon, 01 May 2017 19:01:57 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---

v2 - No changes

 recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
index f7548892..257d9b59 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2017.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r1"
+PR = "r2"
 
 BRANCH = "ti-u-boot-2017.01"
 
-SRCREV = "da5f8ccd0176b613a70566456577a4cfde96d653"
+SRCREV = "afb742e245808ecd7736194db6d6fbfbddeb20d3"
-- 
2.12.2


