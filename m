Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.13281.1637347377084955812
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Nov 2021 10:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=I6wUqQzI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: yogeshs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AJIgqRs003677;
	Fri, 19 Nov 2021 12:42:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637347372;
	bh=xYyAfK6gNSP75jRAT6Dy0u052jx8mYqDdVJC4PkmSP8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=I6wUqQzIW5w5+Xalfx0qiV1ADLOCHMHJQko9MZexiZfDCJ2bwxa4FkYSYXbjZ7YRt
	 QeAMAig9mPqlgxSmPsyzmjAd5Eg3t6b737H3xATx99BmxQPExgwAaD/3EtOvVCZnt1
	 YXAlL+pFSgkLggtrrAr5C8RF5vjynjKy4Ym1CP3s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AJIgq6X009252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Nov 2021 12:42:52 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 19
 Nov 2021 12:42:52 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 19 Nov 2021 12:42:52 -0600
Received: from [10.249.32.113] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1AJIgqa3054190;
	Fri, 19 Nov 2021 12:42:52 -0600
Message-ID: <c1d39f6a-118d-2d85-33d6-53f892d0a353@ti.com>
Date: Fri, 19 Nov 2021 12:42:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [meta-ti][dunfell][PATCH] wic: revert grub-efi patch
To: Tom Rini <trini@konsulko.com>, Denys Dmytriyenko <denis@denix.org>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20211119022952.6588-1-yogeshs@ti.com>
 <20211119024657.GK18191@denix.org> <20211119163446.GH24579@bill-the-cat>
From: "Yogesh Siraswar" <yogeshs@ti.com>
In-Reply-To: <20211119163446.GH24579@bill-the-cat>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/19/2021 10:34 AM, Tom Rini wrote:
> On Thu, Nov 18, 2021 at 09:46:57PM -0500, Denys Dmytriyenko wrote:
>> +Tom
>>
>> On Fri, Nov 19, 2021 at 02:29:52AM +0000, Yogesh Siraswar via lists.yoctoproject.org wrote:
>>> Revert "conf/machine: k3: Enable grub-efi by default in wic images"
>>>
>>> This reverts commit d0b09833b44fa23cce86fd99dd8ca6631c61c476.
>>
>> It is customary to provide a reason for revert.

This is causing boot issue with WIC images. Didn't get much time debug

> 
> Especially since EFI booting is the path forward.  I know there was some
> messages about this breaking non-EFI booting but there wasn't enough
> context to explain what was really going on.
> 
