Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.347.1579731638287629428
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Jan 2020 14:20:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uNpppJHx;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: m-radhakrishnan2@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7F53E015E8; Wed, 22 Jan 2020 14:20:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C47DCE01588
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 14:20:35 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKZ2u076295
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1579731635;
	bh=zMGQXXtbGbcPSTe/c9qrH83//fpqWjSFjagTlzP1iYE=;
	h=From:To:Subject:Date;
	b=uNpppJHxurkjgz+zjGBYLk0E32xnqMEpV0wg0K1CelgahPuhrNmwvdMgwn7QA3mi2
	 1p09/hi7VqZguVma4F6P5wR7YfIVZfCdESc4EuLMNZVfESDllQdv2PD2jgmJLj6xBs
	 ulr40FaCUqNZJdO7BqbI4XuJUUzViKFZIYT/9iT0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00MMKZVU065418
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:35 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 22
 Jan 2020 16:20:34 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 22 Jan 2020 16:20:34 -0600
Received: from UDA0875154.gt.design.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00MMKY4v061593
	for <meta-ti@yoctoproject.org>; Wed, 22 Jan 2020 16:20:34 -0600
From: "Mahesh Radhakrishnan" <m-radhakrishnan2@ti.com>
To: <meta-ti@yoctoproject.org>
Subject: [thud/master][PATCH 0/3] Patches for opencl failure on dra7xx-evm
Date: Wed, 22 Jan 2020 17:20:28 -0500
Message-ID: <20200122222031.13896-1-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Mahesh Radhakrishnan <a0875154@UDA0875154>

To build the am57xx libraries for PM and CSL, it is no longer sufficient to just provide the  SOC names, but board names also need to be given

Mahesh Radhakrishnan (3):
  ti-pdk-fetch: SRCREV update of pdk repo to 2020.1.22
  common-csl-ip-rtos: Adding am57xx boards for dra7xx build
  pm-lld-rtos:common-csl-ip-rtos: Adding am57xx boards for dra7xx build

 classes/ti-pdk-fetch.bbclass                        | 6 +++---
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 1 +
 recipes-bsp/pm-lld/pm-lld-rtos_git.bb               | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.17.1

