Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.4553.1615350335756975545
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Mar 2021 20:25:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IkUq3i8Y;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12A4PVdM070563;
	Tue, 9 Mar 2021 22:25:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615350331;
	bh=7qlE+ENrLAsQsz2vnv8H9GM/oNriigLImfhQ3WCmJJY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=IkUq3i8YCcHBg7oLrt1qCMg2LVlTOH6wfqUxxmqjydct1dF8MJYdynX98c1KbJRS9
	 MpXWNLb/5U+qNIyUBMxJxOosBvD5whhlpqvZx1C3FJKSHaYXqry5y00dytYfRM3YUQ
	 5fNOTa8M2bRu1cWWnSnqQLXU3JGtoxSPmyMLxu58=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12A4PVsV001853
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 9 Mar 2021 22:25:31 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 9 Mar
 2021 22:25:31 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Tue, 9 Mar 2021 22:25:31 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12A4PVqP112666;
	Tue, 9 Mar 2021 22:25:31 -0600
Subject: Re: [meta-ti] [PATCH] ti33x: allow different virtual/bootloader
To: Denys Dmytriyenko <denis@denix.org>,
        Vivien Didelot
	<vivien.didelot@gmail.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20210309172331.22122-1-vdidelot@pbsc.com>
 <20210309203413.GL4892@denix.org> <20210309154234.GB55678@t480s.localdomain>
 <20210309222056.GP4892@denix.org>
From: "praneeth" <praneeth@ti.com>
Message-ID: <4a369727-506f-4942-7ec0-ea004487296a@ti.com>
Date: Tue, 9 Mar 2021 22:25:31 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309222056.GP4892@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/9/2021 4:20 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 09, 2021 at 03:42:34PM -0500, Vivien Didelot wrote:
>> Hi Denys,
>>
>> On Tue, 09 Mar 2021 15:34:13 -0500 Denys Dmytriyenko <denis@denix.org> wrote:
>>> On Tue, Mar 09, 2021 at 12:23:31PM -0500, Vivien Didelot wrote:
>>>> Boards like the beaglebone currently hardcode "u-boot" as a dependency
>>>> for the image and the wic format, and this prevents one from choosing
>>>> a different bootloader via:
>>>>
>>>>      PREFERRED_PROVIDER_virtual/bootloader = "non-u-boot-bootloader"
>>>>
>>>> Depending on "virtual/bootloader" instead of "u-boot" fixes this.
>>>>
>>>> Signed-off-by: Vivien Didelot <vdidelot@pbsc.com>
>>>
>>> Could have added Suggested-by: here. Oh, well...
>>>
>>> Reviewed-by: Denys Dmytriyenko <denis@denix.org>
>>
>> Oops I messed up, can you please add your address as Suggested-by:,
>> and set the author address to my Signed-off-by: address? Otherwise
>> I can resend if that is simpler.
> 
> Sorry, I won't be able to change anything in the patch. So you better off
> re-sending a v2, if you want.

Denys,Vivien,

Updated Suggested-by and pushed to dunfell-next.
https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=dunfell-next&id=9ca1472eef933748b94855d45dc0ab0c14884486


> 
> 
> 
> 
> 
