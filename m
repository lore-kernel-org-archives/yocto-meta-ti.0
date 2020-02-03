Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.6065.1580769796480989644
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Feb 2020 14:43:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=m3iR9NYr;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D6780E016A7; Mon,  3 Feb 2020 14:43:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 974BBE01610
	for <meta-ti@yoctoproject.org>; Mon,  3 Feb 2020 14:43:12 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 013MhCb1094685
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580769792;
	bh=uEj9kPZW7pp04noU2/nQtOZhZh6QgYLJ/LLRMIkXBgs=;
	h=From:To:Subject:Date;
	b=m3iR9NYrWu7JUsskIfVRhior2r8DYh2IPMWTs2qfpzEyUOyEwchAgfrhAjdm+zKB6
	 aWDr5cVYmuqzVUBxrX8QyNv0Eg/BUD7S7Xap45he7KQDEDxciyDKw0gn6i8QHflhTk
	 0CxwzX2rcgyzaEmiKq/1OS371wPAkK8SPO8/Ua9o=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 013MhClN048503
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:12 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 3 Feb
 2020 16:43:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 3 Feb 2020 16:43:11 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 013MhB1E023888
	for <meta-ti@yoctoproject.org>; Mon, 3 Feb 2020 16:43:11 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 0/2] SCICLIENT License checksum update
Date: Mon, 3 Feb 2020 17:43:07 -0500
Message-ID: <20200203224309.19843-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

The Sciclient license is now calculated based on a new COPYING.txt which is less likely to change.
The corresponding PDK SRCREV update is also attached.

Mahesh Radhakrishnan (2):
  ti-pdk-fetch: SRCREV udpate to 2020.2.3
  sciclient-rtos: Updating License checksum, along with the file it is
    calculated

 classes/ti-pdk-fetch.bbclass                | 4 ++--
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1

