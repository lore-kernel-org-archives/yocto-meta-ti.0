Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.3108.1634777544965233761
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 20 Oct 2021 17:52:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=S7AhmKc1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 19L0qM5X043171;
	Wed, 20 Oct 2021 19:52:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1634777542;
	bh=EOYs3thB4lm4Qvn8OkemTPfnBfSVU7lV16ZFJBpCi48=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=S7AhmKc1ny7G/6jZs+DLLUoFNe1leoJFZZ/1eW6ZfrQEHDV5e6FIByd0SttevuUyl
	 RwAg2o7fUL8Qx/0yg0Xtr1HEc846xqgCJHYMUgZrVRbjJxCINWUpeAxdUjOPpDCC1v
	 ODgDJ7U6Bt8ZxN0VVU4Zn6H8KaW5cXg946GXgA+Q=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 19L0qMMb052940
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Oct 2021 19:52:22 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Oct 2021 19:52:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Oct 2021 19:52:22 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 19L0qL65050918;
	Wed, 20 Oct 2021 19:52:21 -0500
Message-ID: <5acf4b8e-be87-ad85-a8ec-5d7f233cca73@ti.com>
Date: Wed, 20 Oct 2021 19:52:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [meta-ti][dunfell/master][PATCH] conf: j7-evm: Replace eaik dtb with sk to KERNEL_DEVICETREE
To: Sinthu Raja M <sinthu.raja@mistralsolutions.com>,
        Denys Dmytriyenko
	<denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>,
        Sinthu Raja
	<sinthu.raja@ti.com>
References: <20211019082221.4767-1-sinthu.raja@ti.com>
 <20211019171544.GN10132@denix.org>
 <CAEd-yTQ6f37sp7bpXucQH3s02S=hy_3PEwy8qWYj84X+64i0rw@mail.gmail.com>
From: "praneeth" <praneeth@ti.com>
In-Reply-To: <CAEd-yTQ6f37sp7bpXucQH3s02S=hy_3PEwy8qWYj84X+64i0rw@mail.gmail.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Language: en-US
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/2021 12:42 PM, Sinthu Raja M wrote:
> Denys,
> 
> On Tue, Oct 19, 2021 at 10:45 PM Denys Dmytriyenko <denis@denix.org> wrote:
>>
>> On Tue, Oct 19, 2021 at 01:52:21PM +0530, Sinthu Raja wrote:
>>> From: Sinthu Raja <sinthu.raja@ti.com>
>>>
>>> The board name for J721E EdgeAI Kit (EAIK) is changed to J721E SK [1],
>>> so replace the eaik dtb with sk dtb file
>>>
>>> [1] https://www.ti.com/tool/SK-TDA4VM
>>>
>>> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
>>> ---
>>>   conf/machine/j7-evm.conf | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
>>> index 7cde9f4d..1f47f00c 100644
>>> --- a/conf/machine/j7-evm.conf
>>> +++ b/conf/machine/j7-evm.conf
>>> @@ -13,7 +13,7 @@ KERNEL_DEVICETREE = " \
>>>       ti/k3-j721e-common-proc-board.dtb \
>>>       ti/k3-j721e-proc-board-tps65917.dtb \
>>>       ti/k3-j721e-common-proc-board-infotainment.dtbo \
>>> -    ti/k3-j721e-eaik.dtb \
>>> +    ti/k3-j721e-sk.dtb \
>>
>> Was there a corresponding kernel change with the file rename?
>>
> Yes, The kernel changes are there in the review state and will get merged today.

merged now :
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=ti-linux-5.10.y&id=2654df7db9e8f024be9ac4e769cdb454a61907e0


> 
> Regards,
> Sinthu Raja.
>>
>>>   "
>>>
>>>   UBOOT_MACHINE = "j721e_evm_a72_config"
>>> --
>>> 2.31.1
>>>
>>
>> --
>> Regards,
>> Denys Dmytriyenko <denis@denix.org>
>> PGP: 0x420902729A92C964 - https://linkprotect.cudasvc.com/url?a=https%3a%2f%2fdenix.org%2f0x420902729A92C964&c=E,1,C0HrYL1gD9V7bSi-iQbI97NAE43GDeAoLiiW2Wg__UFVPyOqND5brhrXZ0Es0QyCv0jZu9dIaTwvF4dAAFZ_syeUaA-_tEMOMiO2VR4dUN1_0PS4z44,&typo=1
>> Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
> 
> 
> 
