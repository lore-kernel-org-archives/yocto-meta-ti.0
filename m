Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.15444.1581974588456330535
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Feb 2020 13:23:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=akTW66Ji;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 516BBE01735; Mon, 17 Feb 2020 13:23:08 -0800 (PST)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C00D3E00C82
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 13:23:07 -0800 (PST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01HLN7r4057174
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:23:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581974587;
	bh=3dmjeMHHg/+ulWIsVTqq5pvJHkfVC8f9Ix02nOZbI4E=;
	h=From:To:Subject:Date;
	b=akTW66Ji9143q4NtYwvY5+8sVjVJ2VVPFIXi7FbvLQQbyJpDBeica7gPbpQqVzSNB
	 RVXx0UMMGsse7HiqBaj8P7Skl4O6esCqPAGKvCvckgXWZ9ZrqvUqx1VHSQ2IVG4xKj
	 et1vCQFqie6QNX98+cHepMAWauiOUctx2KDU4Tis=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HLN7Ih016043
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:23:07 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 17
 Feb 2020 15:23:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 17 Feb 2020 15:23:06 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01HLN6Lc115909
	for <meta-ti@yoctoproject.org>; Mon, 17 Feb 2020 15:23:06 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH v2 0/2] Address review comments
Date: Mon, 17 Feb 2020 16:23:01 -0500
Message-ID: <20200217212303.38290-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Addressed review comments such as
1) sciclient-rtos: Used COPYING.txt fully instead of lines within. ALso added STRIP to strip out bin2c.exe
2) ti-pdk-fetch: Updated SRCREV of pdk.git 

Mahesh Radhakrishnan (2):
  ti-pdk-fetch: SRCREV udpate to 2020.2.17
  sciclient-rtos: Updating License checksum, along with the file it is
    calculated

 classes/ti-pdk-fetch.bbclass                | 4 ++--
 recipes-bsp/sciclient/sciclient-rtos_git.bb | 8 ++++++--
 2 files changed, 8 insertions(+), 4 deletions(-)

-- 
2.17.1

