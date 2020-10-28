Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.1056.1603908352346241816
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 28 Oct 2020 11:05:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XQhw1vb5;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 9600D38C11F9
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 11:05:51 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09SI5oVM093911
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 13:05:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603908350;
	bh=iChP9FfWFJrK+/nXy3b/wDqptqDaW7V1wRQWrLVJ+js=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=XQhw1vb5FwsPo/+bx1ppK9HgYcifAMZ1K/glHK8V1xf7CnxSuvqxHeJZifoS9mKnv
	 B0wLqxiEIlPTTQy0r8yhU20NN8Prn5wdEYdKevEZCKAxhoOtX4ui5UMJbSrhuAPo3I
	 kWS43/q6L5uMt3pplqW1X2nklY9pPCDSlVtY23xk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09SI5o3F034319
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 28 Oct 2020 13:05:50 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 28
 Oct 2020 13:05:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 28 Oct 2020 13:05:50 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09SI5nGC085840;
	Wed, 28 Oct 2020 13:05:49 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull general toolchain support
To: "Tammana, Gowtham" <g-tammana@ti.com>,
        "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>,
        "Dmytriyenko, Denys" <denys@ti.com>
References: <20201028173608.10421-1-g-tammana@ti.com>
 <562ed28b-b53a-c87f-3c8e-359aa8adbfa4@ti.com>
 <3cd9303eba6e4ea19d7310cea8387ca0@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <1a1f5f98-3975-5644-911e-24eb6c570132@ti.com>
Date: Wed, 28 Oct 2020 13:05:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3cd9303eba6e4ea19d7310cea8387ca0@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Gowtham

On 10/28/20 1:02 PM, Tammana, Gowtham wrote:
>
>> -----Original Message-----
>> From: Murphy, Dan
>> Sent: Wednesday, October 28, 2020 12:54 PM
>> To: Tammana, Gowtham <g-tammana@ti.com>; meta-ti@yoctoproject.org;
>> Dmytriyenko, Denys <denys@ti.com>
>> Subject: Re: [meta-ti][dunfell/master][PATCH v2] ti-img-rogue-driver: pull
>> general toolchain support
>>
>> Gowtham
>>
>> On 10/28/20 12:36 PM, Gowtham Tammana wrote:
>>> The patch for supporting the general toolchain is pulled into the repo.
>>> Removing it here from the recipe.
>>>
>>> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
>>> ---
>>> v2: fix email in signoff
>>>
>>>    .../0001-km-support-general-toolchain.patch   | 56 -------------------
>> Did you use "git rm" to remove the file? This looks weird that the file
>> changed then got deleted
> Yes, did use 'git rm' to remove the file. Haven't paid attention to the
> how the changes are structured before. Do you see any issues with am, I was
> just trying it here again and it applies cleanly.

It just looked weird but Denys said it look fine to him

Dan

