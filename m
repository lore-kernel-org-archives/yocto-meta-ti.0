Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D353BE00CEA; Tue,  5 Mar 2019 09:19:07 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A65E3E00CE8
	for <meta-ti@yoctoproject.org>; Tue,  5 Mar 2019 09:19:06 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x25HJ6Ca107077
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 11:19:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1551806346;
	bh=kOgx6SMgVoBVXqJMX0FMqeHQnM0Y5bTeLSxlz+iO3nM=;
	h=From:To:Subject:Date;
	b=RETGDcdwf5uGT93edEGFBen5Vh2bJFqOUVhXmE4wftBd5KEshmw9B6x6Yc3RnBTYk
	DFGvVp6Utos1VXjjIMUFSXHrMKB3nj1WoS9hi5R/DqUv3p2/RL7R41iY58HsB5Uk+q
	N8wnSsFiLgyJG1tpfQojljB4WBAaRGALAj4pC8AE=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x25HJ65b003550
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 11:19:06 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 5 Mar 2019 11:19:05 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 5 Mar 2019 11:19:05 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x25HJ4t6005568
	for <meta-ti@yoctoproject.org>; Tue, 5 Mar 2019 11:19:05 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 5 Mar 2019 12:19:01 -0500
Message-ID: <1551806342-16708-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH v2] Addressing review comments
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
X-List-Received-Date: Tue, 05 Mar 2019 17:19:07 -0000
Content-Type: text/plain

Updated PV (& PE) as per review comments to use "." instead of "_"
Also updated the commit id description with a description of license checksum change

Mahesh Radhakrishnan (1):
  ti-cg-xml: Update to version 2.61.00

 .../{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb}      | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
 rename recipes-ti/devtools/{ti-cg-xml_2.41.00.bb => ti-cg-xml_2.61.00.bb} (64%)

-- 
1.9.1


