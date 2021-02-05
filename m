Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.856.1612550885808275527
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Feb 2021 10:48:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=W9TnKmVq;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115Im5q1075976
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:48:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612550885;
	bh=HC9on/WrJ8BUekfP5bjE2G5Z2H7VBScw9AuXDqG9R9Y=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=W9TnKmVq/Z/jM8E19QTK1oJMcMPeakwoK/lm07V/00kVoUyMekVtiQmDkn8bojmHQ
	 P/cYBhGTM+9YtyLLx86dos3flmoPK5J5w3Wqc7oWa9ep5Wq3lsE6/sI94X8gh6GLsf
	 IcVMrTB4rNJ70UoQ6R3Qr5Uy+e78CfouvfQ9B/58=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115Im5og104404
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Feb 2021 12:48:05 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Feb
 2021 12:48:04 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Feb 2021 12:48:04 -0600
Received: from [10.250.39.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115Im47U018558;
	Fri, 5 Feb 2021 12:48:04 -0600
Subject: Re: [PATCH dunfell/master] ti-uboot-staging: Update to the latest commit
To: Lokesh Vutla <lokeshvutla@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Praneeth Bajjuri <praneeth@ti.com>
References: <20210205181426.15839-1-lokeshvutla@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <0dff2c9f-b533-4a1e-69ac-5e9af17dfbea@ti.com>
Date: Fri, 5 Feb 2021 12:48:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210205181426.15839-1-lokeshvutla@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello

On 2/5/21 12:14 PM, Lokesh Vutla wrote:
> Update SRCREV to latest commit that includes AM64xx SK platform
>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Reviewed-by: Dan Murphy <dmurphy@ti.com>

