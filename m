Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.12546.1605220903299848258
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Nov 2020 14:41:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xkpLazl4;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: s-anna@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id DF1A538C11CC
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 22:41:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACMfgOk128666
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 16:41:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605220902;
	bh=uZUdIUpFvvOiVmyQ6Omw+wKQ8bYr2w5iJzrZ7PsKfWc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=xkpLazl46sTdcscZLk0CRmOWS/Dw3AiXVnNYlArl4JPGDjDZiQo1R8jEO0dKVLoGn
	 GQo+spgfR3AIDWRwZXg2b4WqAHAFPy+MUjt2yKO6BCt26PSST3YISFQRkQmT8Zcc2u
	 eRxmFbsYgJc8krOBzePDRhc6uh3BtoJelI/zhScg=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACMfgRI031485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2020 16:41:42 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 12
 Nov 2020 16:41:41 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 12 Nov 2020 16:41:41 -0600
Received: from [10.250.64.205] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACMffNN053427;
	Thu, 12 Nov 2020 16:41:41 -0600
Subject: Re: [meta-ti][dunfell PATCH] k3conf: Update SRCREV to latest
To: Dan Murphy <dmurphy@ti.com>
CC: Lokesh Vutla <lokeshvutla@ti.com>, Nikhil Devshatwar <nikhil.nd@ti.com>,
        <meta-ti@yoctoproject.org>
References: <20201112134841.7108-1-s-anna@ti.com>
 <f4dd7293-6aad-aa09-c962-f6a2cc02b91f@ti.com>
 <f34c286b-91fe-b516-c34a-506c71f86278@ti.com>
 <53f2f60f-4a86-7475-bd3d-e3b2317ccfc3@ti.com>
From: "Suman Anna" <s-anna@ti.com>
Message-ID: <fed31064-8330-2dda-7204-c6ff3ef17521@ti.com>
Date: Thu, 12 Nov 2020 16:41:41 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <53f2f60f-4a86-7475-bd3d-e3b2317ccfc3@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/12/20 2:12 PM, Dan Murphy wrote:
> Suman
> 
> On 11/12/20 9:21 AM, Dan Murphy wrote:
>> Suman
>>
>> On 11/12/20 7:54 AM, Suman Anna wrote:
>>> On 11/12/20 7:48 AM, Suman Anna wrote:
>>>> Use latest SRCREV on master branch to pick up all the
>>>> changes compliant with TIFS 2020.08b firmware.
>>>>
>>>> Signed-off-by: Suman Anna <s-anna@ti.com>
>>>> ---
>>>> Hi Dan,
>>>>
>>>> Please pick this up for 07.01.00.006. Will submit a separate patch
>>>> for master, looks like Nikhil missed one update to master branch.
>>> Sorry, my bad, I take this back, my local master branch was not up-to-date. This
>>> is applicable for master as well.
>>>
>> OK it is applied to -next and will be pushed shortly
>>
>> Dan
>>
> Patch failed to build due to checksum mismatch on the License file due to this
> commit
> https://git.ti.com/gitweb?p=k3conf/k3conf.git;a=commit;h=bf1b4143e0065fb119766c2dddd8c08fb5ded7a9
> 
> ERROR: QA Issue: k3conf: The LIC_FILES_CHKSUM does not match for file://common/k3conf.c;beginline=1;endline=34;md5=37f4e460bd8501c6f02ce71f02bc7ccf
> k3conf: The new md5 checksum is 7154c0ffcd418064ffa528e34e70ca9d

Sorry my bad, v2 coming shortly..

regards
Suman
