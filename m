Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA8D6E00ACD; Mon,  1 May 2017 11:34:07 -0700 (PDT)
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
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C65AE0083D
	for <meta-ti@yoctoproject.org>; Mon,  1 May 2017 11:34:03 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v41IY3vu018522
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 13:34:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493663643;
	bh=k8ioWEzELJoW93zzo+5J5ge0UDeXcCbo5VOca/fDIIw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=azZRm8TMDlggy2dBynidCQMT26m0Qi13dLTSHNQMuGaUEcFTjKAwGyLJ/p9nywB45
	UiBVJh7V7yTtm5MzRicbjZqdN0EzUAa+7cpDqtIuwIwD6DBaQm1BZFjJeieiyFhppE
	W4R8tNgHh/uoQOZGBVw93vgCOujKkOd+8elqqwpE=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v41IY3uK022316
	for <meta-ti@yoctoproject.org>; Mon, 1 May 2017 13:34:03 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 1 May 2017 13:34:02 -0500
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v41IY2dm031609;	Mon, 1 May 2017 13:34:03 -0500
Received: from localhost (a0272616local-lt.dhcp.ti.com [172.22.109.252])	by
	legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	v41IY2328276; Mon, 1 May 2017 13:34:02 -0500 (CDT)
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 1 May 2017 13:33:58 -0500
Message-ID: <20170501183359.1645-3-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170501183359.1645-1-dmurphy@ti.com>
References: <20170501183359.1645-1-dmurphy@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] ti-sci-fw: update to the latest 0.1.1-47 version
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
X-List-Received-Date: Mon, 01 May 2017 18:34:07 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
index f5706a65..f04008f3 100644
--- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
+++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "TI SCI firmware"
 LICENSE = "TI-TFL"
 LIC_FILES_CHKSUM = "file://LICENCE.ti-keystone;md5=3a86335d32864b0bef996bee26cc0f2c"
 
-PV = "0.1.1.37"
-PR = "r0"
+PV = "0.1.1.47"
+PR = "r1"
 
 CLEANBROKEN = "1"
 
-- 
2.12.2


