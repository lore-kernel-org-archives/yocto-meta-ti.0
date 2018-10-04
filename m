Return-Path: <x0038811@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0ECF0E00B47; Thu,  4 Oct 2018 05:26:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0899E00A9B
	for <meta-ti@yoctoproject.org>; Thu,  4 Oct 2018 05:26:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w94CQRJw041051
	for <meta-ti@yoctoproject.org>; Thu, 4 Oct 2018 07:26:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538655987;
	bh=pjCF255vV1FxvKxAHJr101xLJn380CK/t16d1a/p8Yc=;
	h=From:To:CC:Subject:Date;
	b=h6u4VAkkI1RHRshPkU8KyfRecD43AxqoWxZcWVEL4TSXCZ7l6+KVHfd/GUhec3ev0
	c45jiIwkSXfitpaxm4GNjrOkEBEcq9FJFvNGCPp/Cz+FB3ARp+7qbEszjzvHatrgRI
	bh0d/JFKJVZ4J7YeWh4Wij+5N2nMz2NCg9w7znbQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w94CQRdO024040
	for <meta-ti@yoctoproject.org>; Thu, 4 Oct 2018 07:26:27 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 4 Oct 2018 07:26:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 4 Oct 2018 07:26:26 -0500
Received: from udx0038811.india.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w94CQOHg014156;
	Thu, 4 Oct 2018 07:26:25 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 4 Oct 2018 17:56:22 +0530
Message-ID: <1538655983-1625-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/1] ipumm update SRCREV
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
X-List-Received-Date: Thu, 04 Oct 2018 12:26:29 -0000
Content-Type: text/plain

This updates two issues
*H264dec hang with an erroneous stream
*Integration with latest IPC,BIOS tools

Ramprasad N (1):
  ipumm: Update SRCREV and cleanup patches

 ...egration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch | 79 ----------------------
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  7 +-
 2 files changed, 2 insertions(+), 84 deletions(-)
 delete mode 100644 recipes-bsp/ipumm-fw/files/0001-Integration-with-IPC-3.50-BIOS-6.73-XDC-3.50.patch

-- 
1.9.1


