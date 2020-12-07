Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1463.1607370917273361782
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 11:55:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aHkYGs1T;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7JtBb2111982;
	Mon, 7 Dec 2020 13:55:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607370911;
	bh=eby9y/Wuc18SexLee99dneJ+8oqZrBr5fI+u599Viho=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=aHkYGs1T6ntEGSaHaHd5oDXzbZEd3+jjw8bKwipfN/D3bApQksBqV+y0xqRsqcQNS
	 hW7lF0gya2gErJ4tGflX8fuvXosuzwdr0JlpRF6/x/VAuFmX1tb7nIYnEjDugcncTY
	 39bHGPd+Vq7RZ19ZxaPxkbVxVS5115jafs6H0DNI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7JtBHV111823
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 7 Dec 2020 13:55:11 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 13:55:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 13:55:11 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7JtBcM036285;
	Mon, 7 Dec 2020 13:55:11 -0600
Subject: Re: [meta-ti] [PATCH] Remove a 32bit binary
To: Alessio Igor Bogani <alessio.bogani@elettra.eu>,
        <meta-ti@lists.yoctoproject.org>
References: <20201205180153.1A30A440F70_FCBCB11B@spamalot.elettra.eu>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <ff7286b4-9d8a-6652-4594-7dd33e1ae5fe@ti.com>
Date: Mon, 7 Dec 2020 13:55:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201205180153.1A30A440F70_FCBCB11B@spamalot.elettra.eu>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Alessio

On 12/5/20 12:01 PM, Alessio Igor Bogani wrote:
> Make nativesdk-ti-cgt-pru installable removing a file which is the
> uninstaller (useless anyway) and avoid this errors:
> https://lists.yoctoproject.org/g/meta-ti/message/13301

$subject should also indicate what branch this is targetted for like 
[dunfell/master]

Also can you clean up the commit message a bit confusing

Dan
