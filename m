Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5759.1605194476256665607
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 07:21:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CUC+WX3Y;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id F20E138C110B
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 15:21:15 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACFLFYG126028
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 09:21:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605194475;
	bh=jJKhKP/u2fbztoa9Be4cH9afd+xaogz94na5YT7KY/U=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CUC+WX3YTkCKXA25t6Z5jBDmgAN68ILpHMtVeVp4x1OhZSZOgCSQOP2TSUZDzEjpm
	 7244RfmseK0enXvIkFPyh6Yi7N2fv6EBPav5AN4KdXtLfT3StNRl2Sk1nJtSxdoh67
	 Jtbp36ewIWgXd35S41m+I1xz9UXQvJ/LRcV0KF+c=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACFLF5N086318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 09:21:15 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 09:21:15 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 09:21:15 -0600
Received: from [10.250.39.187] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACFLFsj063427;
	Thu, 12 Nov 2020 09:21:15 -0600
Subject: Re: [meta-ti][dunfell PATCH] k3conf: Update SRCREV to latest
To: Suman Anna <s-anna@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@yoctoproject.org>
References: <20201112134841.7108-1-s-anna@ti.com>
 <f4dd7293-6aad-aa09-c962-f6a2cc02b91f@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <f34c286b-91fe-b516-c34a-506c71f86278@ti.com>
Date: Thu, 12 Nov 2020 09:21:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f4dd7293-6aad-aa09-c962-f6a2cc02b91f@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Suman

On 11/12/20 7:54 AM, Suman Anna wrote:
> On 11/12/20 7:48 AM, Suman Anna wrote:
>> Use latest SRCREV on master branch to pick up all the
>> changes compliant with TIFS 2020.08b firmware.
>>
>> Signed-off-by: Suman Anna <s-anna@ti.com>
>> ---
>> Hi Dan,
>>
>> Please pick this up for 07.01.00.006. Will submit a separate patch
>> for master, looks like Nikhil missed one update to master branch.
> Sorry, my bad, I take this back, my local master branch was not up-to-date. This
> is applicable for master as well.
>
OK it is applied to -next and will be pushed shortly

Dan

