Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.2020.1581653668162414565
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 13 Feb 2020 20:14:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=t2ctnfz1;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: x0038811@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BD2BEE016FA; Thu, 13 Feb 2020 20:14:27 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 680A5E0050E
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 20:14:26 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01E4EP6R098302
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 22:14:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581653665;
	bh=vlcFK2h+ILt1MoSJVlOFKvQoUX4uUvl6XFGRA7SOlj8=;
	h=From:To:CC:Subject:Date;
	b=t2ctnfz124E8MXswt7yXurMueMrc3HtwHOAcz+Wi8QZwZk4OBq5yKoVXffIBy9IcP
	 pI3FwVMoD2kqZs8xJj7MU5FNlxfDyeKL2NTAiKyDCjrmwjET1bgWHOy3upA+KTjOAy
	 bXUmLi0tnHlHiE1kK/xF12en86yhJxIvmHWAPeVs=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01E4EP3j083772
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 13 Feb 2020 22:14:25 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 13
 Feb 2020 22:14:25 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 13 Feb 2020 22:14:25 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01E4ENYV044701;
	Thu, 13 Feb 2020 22:14:24 -0600
From: "Ramprasad.N" <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Ramprasad N <x0038811@ti.com>
Subject: [zeus/master 0/1] ipumm: Update SRCREV for vring fix for k5.1+
Date: Fri, 14 Feb 2020 09:44:16 +0530
Message-ID: <1581653657-13192-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

This updates ipumm resource table to support vring device addresses 
as FW_RSC_ADDR_ANY, so that Linux kernel knows it needs to update
these to the actual dynamically allocated memory locations.

Ramprasad N (1):
  ipumm: Update SRCREV with the vring fix for k5.1+

 recipes-bsp/ipumm-fw/ipumm-fw_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.9.1

