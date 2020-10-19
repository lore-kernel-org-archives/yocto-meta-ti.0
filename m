Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.11331.1603107413927972782
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 Oct 2020 04:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=shYsW7h6;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09JBarjf125214
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:36:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603107413;
	bh=eoFTMQNX8fJI1H1/HIyx5xtAp1TsSUwH5kTqT0HnR5E=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=shYsW7h6mh5ZXDr9TawAqxKP/MfiaOzLkl3KmUQ8dSMFbEl55pjUBQlJrV2o+0KxV
	 bWLTfdhIUwBbxqXaXWMP0wuAoxYwrUC5dNm+PjJT/6j2rTVjTNs34zXjVoYgg20q08
	 qmXi5PTQEuBaaGT41WLh/uQaAXQtxquWgnpTDOqY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09JBarUN024099
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 19 Oct 2020 06:36:53 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 19
 Oct 2020 06:36:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 19 Oct 2020 06:36:52 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09JBaqYu079187;
	Mon, 19 Oct 2020 06:36:52 -0500
Subject: Re: [dunfell/master PATCH] prusw-fw: Update the firmware to 3.1.6 version
To: Roger Quadros <rogerq@ti.com>, <meta-ti@lists.yoctoproject.org>,
        <denys@ti.com>
CC: <nsekhar@ti.com>, <vigneshr@ti.com>, <lokeshvutla@ti.com>
References: <20201019083620.6665-1-rogerq@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <81f7e96e-2141-acca-f6b3-760198ae1cb7@ti.com>
Date: Mon, 19 Oct 2020 06:36:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019083620.6665-1-rogerq@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Roger

On 10/19/20 3:36 AM, Roger Quadros wrote:
> Update the firmware to version 3.1.6

Thanks for the patch this one was already submitted

http://dflvsu0004.dal.design.ti.com/patch/57940/

Dan

