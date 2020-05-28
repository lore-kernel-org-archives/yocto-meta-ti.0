Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.7498.1590650663694124401
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 28 May 2020 00:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FChLA0l5;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: x0038811@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44731E01BED; Thu, 28 May 2020 00:24:23 -0700 (PDT)
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
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29486E01BEA
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2020 00:24:21 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04S7OL83114441
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2020 02:24:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1590650661;
	bh=IOtzHUB1hCEDVs2OGv5QC3UQuNJmnJ6KC/EhV5G6V0M=;
	h=From:To:CC:Subject:Date;
	b=FChLA0l5NJb5pp+f1WCUTJd+ZQcUp3Psb0SuwecGRv2UaETmQK0Wphhw2+Dg2XymD
	 B5cO8/+k0dOc6qQLAxBoXVv9pieMCrYERyGmkEw07LhJcfjT335LyfEAa/St2h1mxR
	 Nxs08t9VES/H9CAfmUvhiB/TTTv7Fxcn94AFrak4=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04S7OLgY022633
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 28 May 2020 02:24:21 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 02:24:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 02:24:20 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04S7OJJx018399;
	Thu, 28 May 2020 02:24:20 -0500
From: "Ramprasad.N" <x0038811@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Ramprasad N <x0038811@ti.com>
Subject: [dunfell 0/1] ipumm: Temporary workaround for linker error issue
Date: Thu, 28 May 2020 12:54:15 +0530
Message-ID: <1590650656-18953-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

IPUMM build is showing linker error for a function
ti_sdo_ce_utils_syscbuf_SysCBuf_Module_startup__E with latest xdc tool
A dummy version of this function is added in ipumm as a temporary solution.


Ramprasad N (1):
  ipumm: Hack: Temporary work-around for linker error with XDC tools
    upgradation.

 ...01-HACK-ipumm-Workaround-for-linker-error.patch | 48 ++++++++++++++++++++++
 recipes-bsp/ipumm-fw/ipumm-fw_git.bb               |  6 ++-
 2 files changed, 53 insertions(+), 1 deletion(-)
 create mode 100644 recipes-bsp/ipumm-fw/files/0001-HACK-ipumm-Workaround-for-linker-error.patch

-- 
1.9.1

