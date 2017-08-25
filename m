Return-Path: <jjhiblot@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 248B8E00CB0; Fri, 25 Aug 2017 14:38:56 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DDB55E00B1B
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 14:38:54 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7PLcs8i011508
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 16:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1503697134;
	bh=0o4PWExgGZe/Oa5SsyPDCPUoAC/GdrvsLz6roFpvKk4=;
	h=From:To:CC:Subject:Date;
	b=RQ/fZkDdmOwNHRPBVEjbI6VggsKNR6HdV6OajFBOFWpLlugP4NF7/PCPQBGhGXjU7
	Tspdw2R+0Pg/zhdY3av8QaX8f7aIETuT6iAWFI2PEeNnFXrVo97n7FIb1qjaWkJEI2
	DYwD83N754EqhRAh6EPaKDN5VA+yg/6iuwUIes4s=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PLcsS7018867
	for <meta-ti@yoctoproject.org>; Fri, 25 Aug 2017 16:38:54 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 25 Aug 2017 16:38:53 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 25 Aug 2017 16:38:53 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7PLcqUJ012252;
	Fri, 25 Aug 2017 16:38:53 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 25 Aug 2017 23:38:45 +0200
Message-ID: <1503697128-6311-1-git-send-email-jjhiblot@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [krogoth] [PATCH 0/3] recipe updates for 2016.08-rc2
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
X-List-Received-Date: Fri, 25 Aug 2017 21:38:56 -0000
Content-Type: text/plain

This patch series bumps the version of u-boot and the kernel.
It also update the kernel recipe to package the dtb for new dra76-evm platform.

Jean-Jacques Hiblot (3):
  u-boot-ti-staging 2016.05: update to the latest for ti2016.08-rc2
  linux-ti-staging 4.4: update to the latest for ti2016.08-rc2
  linux-ti-staging 4.4: package the dtb for the dra76-evm platform

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    | 7 ++++---
 3 files changed, 7 insertions(+), 6 deletions(-)

-- 
1.9.1


