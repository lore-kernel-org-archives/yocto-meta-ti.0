Return-Path: <dmurphy@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3396FE00BC8; Wed, 20 Mar 2019 11:31:45 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09D51E00BBC
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2019 11:31:43 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2KIVhIr043676
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2019 13:31:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553106703;
	bh=yJ142A6bn9DUxPPZmAUIxNDTeWgojkQyGBhhwojKd+o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tcIQy1ouBZQc1AxxMtqKHJpwfDV/hfTOxhTo0vR3awpRoRSUFRIoMOSgzR528V6kZ
	Hpqfxy1njPhDoKGiESMpEsSyXOF6gJ59JvjLj0RGlJ3GyrLTm/Dnp9tPjONgpt+jQ+
	O2S4kUCl480XHF0c36EV7lmyjwQdQC705/6gHvds=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2KIVh0T110420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 20 Mar 2019 13:31:43 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 20 Mar 2019 13:31:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1713.5 via Frontend
	Transport; Wed, 20 Mar 2019 13:31:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id x2KIVgl4021207;
	Wed, 20 Mar 2019 13:31:43 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Wed, 20 Mar 2019 13:31:16 -0500
Message-ID: <20190320183116.6215-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20190320183116.6215-1-dmurphy@ti.com>
References: <20190320183116.6215-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/2] linux-ti-staging: update to ti2019.00-rc3 tag
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
X-List-Received-Date: Wed, 20 Mar 2019 18:31:45 -0000
Content-Type: text/plain

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
index 75eb9de0..05440e6c 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.19:"
 
 BRANCH = "ti-rt-linux-4.19.y"
 
-SRCREV = "7cc393e448475c8b68dba81ca568b5ffd219e5aa"
+SRCREV = "24b7d60eb75b1193fed97f0a275ff47afddb6dc3"
 PV = "4.19.25+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kernel/linux/linux-ti-staging_4.19.bb
index 5c341c24..9506fa3e 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -56,7 +56,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-4.19.y"
 
-SRCREV = "0584082b5f5c815faee33f5fc0a1c8bc3d77ebf7"
+SRCREV = "e7e1c645f0757d6c7d8636b3d8080efa0812f2c8"
 PV = "4.19.25+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.21.0.196.g041f5ea1cf


