Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59B66E0090C; Mon, 27 Aug 2018 12:42:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79347E0053F
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 12:42:29 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7RJgS57054525
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 14:42:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535398948;
	bh=zhBR+q6kNTDTmqOQzUbvvMow0J90TCgPlu9C5bqWu+g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aHSlx0vcCGJgLeR1ixUjT6NN8KD/MIYZQ9E6G1mBwDZ0Bdz4q4/ulUQ3obzdORu5q
	xuLO/EKwg2nPSukH3mGxvqfmA6D6bASLXzrj3ZSI1CyOAEGn/H7vqJ0BAWKplncwau
	7llco/lKVN3w7VTWjxy47JGy4GYZ4YjsyOKgWMHU=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RJgSeE011009
	for <meta-ti@yoctoproject.org>; Mon, 27 Aug 2018 14:42:28 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 27 Aug 2018 14:42:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 27 Aug 2018 14:42:28 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7RJgSV0001429;
	Mon, 27 Aug 2018 14:42:28 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 27 Aug 2018 19:39:27 +0000
Message-ID: <20180827193927.16079-2-denys@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180827193927.16079-1-denys@ti.com>
References: <20180827193927.16079-1-denys@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH 2/2] u-boot-ti-staging: update to ti2018.03-rc4 tag
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
X-List-Received-Date: Mon, 27 Aug 2018 19:42:30 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
index 5708f94b..aed46ecd 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2018.01.bb
@@ -1,7 +1,7 @@
 require u-boot-ti.inc
 
-PR = "r18"
+PR = "r19"
 
 BRANCH = "ti-u-boot-2018.01"
 
-SRCREV = "6d540394a483c2d38aec0b84d1950d1031648ccc"
+SRCREV = "8b2f1df4b55bc0797399a21d42ac191d44f99227"
-- 
2.17.1


