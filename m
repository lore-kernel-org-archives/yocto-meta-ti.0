Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.1114.1586211573780522802
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 06 Apr 2020 15:19:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ZwvmUGSw;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D2C3E01979; Mon,  6 Apr 2020 15:19:33 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63950E01972
	for <meta-ti@yoctoproject.org>; Mon,  6 Apr 2020 15:19:31 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 036MJVth098334
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1586211571;
	bh=inHMrvf7QK21Qf2kXcOrzB45uBgvS923WknQAILouCk=;
	h=From:To:Subject:Date;
	b=ZwvmUGSwI1fBGmYd635e32mrTfjt/aA/s8GO/v9wWu0DrJiIZoWXkL4hI0TpVrTTi
	 Zw0QNbzg7NDMzeDOXLfNWEOSXf9xTZVAulznKHdfI8V+1lz/Wvj6g+Qey7tWOmU3OQ
	 VAtrrJQrCAQNWwrPx06yullRHEA/zNCxaHdJffXQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 036MJViQ085127
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:31 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 6 Apr
 2020 17:19:31 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 6 Apr 2020 17:19:31 -0500
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 036MJVBT017306
	for <meta-ti@yoctoproject.org>; Mon, 6 Apr 2020 17:19:31 -0500
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [zeus/master][PATCH 0/5] 6.3 RTOS Patchset 1
Date: Mon, 6 Apr 2020 18:19:23 -0400
Message-ID: <20200406221928.23776-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

RTOS patchset 1 for 6.3 release

Mahesh Radhakrishnan (5):
  ti-pdk:SRCREV update to 2020.4.5
  common-csl-ip:SRCREV update to 03.03.00.17A
  pm-lld-rtos:SRCREV update to 01.08.00.23A
  sa-lld:SRCREV update to 04.00.00.03C
  starterware-inc: SRCREV update to 02.01.01.12A

 classes/ti-pdk-fetch.bbclass                | 4 ++--
 recipes-bsp/common-csl-ip/common-csl-ip.inc | 6 +++---
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb       | 6 +++---
 recipes-bsp/sa-lld/sa-lld.inc               | 6 +++---
 recipes-bsp/starterware/starterware.inc     | 6 +++---
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.17.1

