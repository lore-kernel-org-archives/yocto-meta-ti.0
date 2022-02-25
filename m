Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.2421.1645822289453766504
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Feb 2022 12:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L26R4Zad;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-m1@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 21PKpPcN073856;
	Fri, 25 Feb 2022 14:51:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1645822285;
	bh=Xi3Ae+N8JGdJ5whKW7c3vVOoivc0qLmA29j8JBhPnHg=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=L26R4ZadYRLueeNb7yeun8vygHljiPXtw7rjZaaXZhAdFkkcPHXOdzP8WZCtDTJKY
	 DQ0haWkO9LYgk83CS6qo6f8crpEBmjxEo/noNkXoxpYRf0ndm47fBT16MzQM1vASNx
	 WyOwI/CCFKOY8go2cQrMns3id7sgd07AIMC1fJrs=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 21PKpPNA089733
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Feb 2022 14:51:25 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 25
 Feb 2022 14:51:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 25 Feb 2022 14:51:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 21PKpO43117241;
	Fri, 25 Feb 2022 14:51:24 -0600
Date: Sat, 26 Feb 2022 02:21:23 +0530
From: "Aparna M" <a-m1@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <praneeth@ti.com>,
        <nikhil.nd@ti.com>, <devarsht@ti.com>
Subject: Re: [meta-ti][dunfell][PATCH] conf: machine: am64xx-hs-evm: Fix naming of u-boot.img
Message-ID: <20220225205123.muo5m4vf7gsy5y72@ti.com>
References: <20220221081331.11263-1-a-m1@ti.com>
 <20220222004145.GJ26229@denix.org>
MIME-Version: 1.0
In-Reply-To: <20220222004145.GJ26229@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

I looked into wic images generated for am64xx HS, am65xx HS, j7 HS and
j7200 HS - the issue seems to be similar. The boot partition contains 
u-boot.img_HS file but other boot binaries are missing.
Please wait before further review. Will get back with updates.

Thanks,
Aparna
