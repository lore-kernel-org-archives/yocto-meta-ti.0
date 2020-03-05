Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.3.1583433900650867991
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2020 10:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=PFMWbu2x;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: tmannan@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F1D42E017D1; Thu,  5 Mar 2020 10:44:59 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB57FE017CE
	for <meta-ti@yoctoproject.org>; Thu,  5 Mar 2020 10:44:56 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 025IiuGB072398
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:44:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583433896;
	bh=BKh6NDKsbcLTEXLlD6PacyxqzcM9Ytw/IGVmEk40llo=;
	h=From:To:Subject:Date;
	b=PFMWbu2xsh8MK8rxxf8x6HSnS7qQHm8vMxXJjHdiFKe6aoVCgFcD8BsOcCXEqRzm4
	 Fd2OuN9uz9Q5/2RUu1Hpn3YCFQYZyIo/4UcR4h4MRipOkIl+I0ZR19oja8IkhrN+WL
	 dW31VY7kap0j/2cesrn2MVdmJ0bTzdETYoXOKaJg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 025Iiue0078624
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:44:56 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Mar
 2020 12:44:56 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 5 Mar 2020 12:44:56 -0600
Received: from ares-ubuntu1.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 025IitSh116317
	for <meta-ti@yoctoproject.org>; Thu, 5 Mar 2020 12:44:56 -0600
From: "Tinku Mannan" <tmannan@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 0/2] *** PRSDK-4441: icss-emac-lld and nimu-icss recipe updates ***
Date: Thu, 5 Mar 2020 13:44:50 -0500
Message-ID: <1583433892-6323-1-git-send-email-tmannan@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

*** Adding k3 to COMPATIBLE_MACHINE list ***

Tinku Mannan (2):
  icss-emac-lld: Adding k3 to COMPATIBLE_MACHINE list
  nimu-icss: Adding k3 to COMPATIBLE_MACHINE list

 recipes-bsp/icss-emac-lld/icss-emac-lld.inc      | 4 ++--
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.7.4

