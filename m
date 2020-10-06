Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.1760.1602010981994173094
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 06 Oct 2020 12:03:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=AxOggUXu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 096J31Mp072371
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 14:03:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602010981;
	bh=5OaIEkLII9IziNqnFKLFfJesmFTNYWk6YnfJPUY2hiw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=AxOggUXugmAIqgqrdUTI976lb/WocXTa+MhUxo1UXWYd85dQ7N6R2BjB10Tnuxah8
	 K1lfPj9SRH0VJsJSij18OKl3J8ACy1pzsBpJn/dkMftQ98YrAojaJVlHhhXp8sdYx3
	 PVXTamkIMMkTY5fIUTQZ3NBTlzkcKOE1QhU6a+SY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 096J31Yw085741
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Tue, 6 Oct 2020 14:03:01 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 6 Oct
 2020 14:03:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 6 Oct 2020 14:03:01 -0500
Received: from [10.250.37.2] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 096J30Xn112259;
	Tue, 6 Oct 2020 14:03:01 -0500
Subject: Re: [PATCH 1/2] linux-ti-staging: Update to the tag 07.01.000.03
To: <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20201006185935.15462-1-dmurphy@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <64b5f09f-03a5-9f81-cb6b-fa18054045d9@ti.com>
Date: Tue, 6 Oct 2020 14:02:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201006185935.15462-1-dmurphy@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/6/20 1:59 PM, Dan Murphy wrote:
> Signed-off-by: Dan Murphy <dmurphy@ti.com>
> ---
$subject will be updated to indicate correct tag of 07.01.00.003

Dan

