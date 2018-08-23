Return-Path: <x0038811@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1CD6CE00474; Thu, 23 Aug 2018 03:31:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4602E003C1
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 03:31:19 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7NAVJ6B116771
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 05:31:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535020279;
	bh=XciT00rAPT7bW6MRr6488x8g/q6Z+hx9P1pLDZOk/gY=;
	h=From:To:CC:Subject:Date;
	b=aD99tXfuTbLsi4t1BkgUq0lnTRAs3tO7jrq0J7qelMkScSGT5GMRV1RUFAdhdFBSq
	8DHsP9uXYXVj/dxazvzdi3LYC67SoGQFPBdnKpb8r2HGRdDgARmeyzkzUr1mob64po
	xcwJIpHSmHuqlWGn/1TGJS1g2sJrkvTlqRnRQsvA=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NAVJr4028278
	for <meta-ti@yoctoproject.org>; Thu, 23 Aug 2018 05:31:19 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 05:31:18 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 05:31:18 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7NAVHuf029877;
	Thu, 23 Aug 2018 05:31:18 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 23 Aug 2018 16:01:09 +0530
Message-ID: <1535020270-15662-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/1] IPUMM: Integrate with latest IPC, BIOS and XDC
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
X-List-Received-Date: Thu, 23 Aug 2018 10:31:21 -0000
Content-Type: text/plain

This patch fixes the compilation error
with SYSBIOS 6.73.00.12

Ramprasad N (1):
  ipumm: Integration with latest IPC, BIOS and XDC tools

 ...egration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch | 79 ++++++++++++++++++++++
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  5 +-
 2 files changed, 83 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch

-- 
1.9.1


