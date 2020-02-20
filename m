Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.2785.1582159121382213048
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 19 Feb 2020 16:38:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bDwieBGU;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01K0ceNq058671
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:38:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1582159120;
	bh=IV/WKB4YWbceibmK+OMb6tAjlctjZnR1s17imQYQ8aA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=bDwieBGU/XBUf3E1FOL7QWwb89+Fwo1i2UFh6pwYe7O1taL9R8XcHuZVLM3Pt0MBt
	 hZA/YppVYBzoB3Tu24h9HTgeQxdWMwe2va3RQfxquaIMxvFa3SHdpfdFDf7Fz0uhpI
	 1hQhyM42Fbeiq6uxDUdt/JJAfyU0GLnaei9t4yr0=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K0cebO068291
	for <meta-ti@lists.yoctoproject.org>; Wed, 19 Feb 2020 18:38:40 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 19
 Feb 2020 18:38:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 19 Feb 2020 18:38:40 -0600
Received: from [10.250.73.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01K0cdJ4065355;
	Wed, 19 Feb 2020 18:38:40 -0600
Subject: Re: [meta-ti][zeus/master][PATCH] ti-sgx-ddk-um: Add runtime dependency on the SGX kernel module
To: Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20200218160621.26272-1-afd@ti.com> <20200218175234.GJ720@beryl>
 <ed392732-a4bb-fd54-6c0e-3c2358edba49@ti.com> <20200219235832.GY720@beryl>
 <b1012ba2-e080-3c50-4e92-b16ccf67f1ac@ti.com> <20200220001535.GA720@beryl>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <83217b23-0582-b008-0860-edda7c03a6df@ti.com>
Date: Wed, 19 Feb 2020 19:38:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200220001535.GA720@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/19/20 7:15 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 19, 2020 at 07:06:29PM -0500, Andrew F. Davis wrote:
>> On 2/19/20 6:58 PM, Denys Dmytriyenko wrote:
>>> On Tue, Feb 18, 2020 at 01:08:46PM -0500, Andrew F. Davis wrote:
>>>> On 2/18/20 12:52 PM, Denys Dmytriyenko wrote:
>>>>> I was sitting on a similar patch in a private testing branch:
>>>>> https://lists.yoctoproject.org/g/meta-ti/message/12418
>>>>
>>>> Why RRECOMMENDS? It should be a real dependency right?
>>>
>>> Andrew,
>>>
>>> Historically kernel modules used RRECOMMENDS.
>>>
>>> Plus, it's easier to break RRECOMMENDS dependency than RDEPENDS. And we had 
>>> instances in the past, when we needed to be able to build against UM libs, 
>>> even when KM support is not there. Of course, it may not be an issue in the 
>>> future, when we split up UM libs package into individual libs and/or move to 
>>> Mesa based builds...
>>>
>>
>> Okay then, either way works for me, I'm just looking to get the
>> dependency tree in order so we don't have to explicitly include the
>> "gpudriver" anymore. It should be pulled in by any app using 3D.
> 
> Oh, I totally agree! BTW, I've been starting to look into dependency cleanup 
> as part of that parallel private work I mentioned - the patch I linked is from 
> that series. I'm hoping to be able to merge everything in the near future, as 
> it's diverging quite rapidly, since it was based on Thud for few months...
> 

:) I've got the same problem, patches building up on thud that need a
path into zeus/master.

Idea for above being if you include a 3D app in your image you get the
km via

app -> egl/gles2 -> ti-sgx-um -> ti-sgx-km

if no apps need 3D, then we don't pull in any of that extra stuff. Got
the same for gtk3 and webkit.. Should shave a couple hours of the
default (non-tisdk) build of Arago.

Will post some more tomorrow.

Andrew
