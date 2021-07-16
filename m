Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.4213.1626429737289226754
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Jul 2021 03:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=BwHenQnI;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 16GA2FRi126979;
	Fri, 16 Jul 2021 05:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1626429735;
	bh=eJDuWxUXT6A5Pi74Cx3W+tU06afEdQEGYm54lhyK3DM=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=BwHenQnIJfwX/T/EFNGhr/uQjZmf/G8Cs1TA8IziDlzgcxS+E9dfbdmjy2ywPo6ql
	 8hcvIIXcVRs8izJYhFlCLLfH3pLx0VgFNe6nyJg+4pkgJ4tWzeEE+npwQJdP7YKYfW
	 nOfuwQdGBZZCsVip9eTKQhdr7jy7XJ5xovV9HKN4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 16GA2FcU115485
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 16 Jul 2021 05:02:15 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 16
 Jul 2021 05:02:15 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 16 Jul 2021 05:02:15 -0500
Received: from [10.250.38.184] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 16GA2EYs095739;
	Fri, 16 Jul 2021 05:02:15 -0500
Subject: Re: [EXTERNAL] [meta-ti][dunfell/master][PATCH] ti-rtos-firmware: update the source to ti-linux-firmware
To: Vignesh Raghavendra <vigneshr@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        Praneeth Bajjuri <praneeth@ti.com>, Nishant Menon
	<nm@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210715203300.13364-1-yogeshs@ti.com>
 <1e859761-1cf6-25ca-47ca-5ac3e9353c6b@ti.com>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <8c0c9e88-8b05-6506-5cec-f6b895635237@ti.com>
Date: Fri, 16 Jul 2021 05:02:14 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1e859761-1cf6-25ca-47ca-5ac3e9353c6b@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 7/16/2021 3:04 AM, Vignesh Raghavendra wrote:
> 
> 
> On 7/16/21 2:03 AM, Yogesh Siraswar via lists.yoctoproject.org wrote:
>> This is temporary change to pick the 08.00.00.026 firmware from
>> ti-linux-firmware repos:
> 
> ti-eth is @ 08.00.00.029 -> how is that taken care of?
> 

The SRCREV for the ti-sci-fw.inc will be updated to head after tagging. 
Need to fix the PV to override from the ti-sci-fw. Will submit new patch 
revision.

TODO: Will need to split ti-eth and ti-ipc recipes so that they can have 
different versions. But that will be targeted for next release as part 
of over-all clean-up.


>> 1) Using the ti-sci-fw to pick the latest firmware and support AUTOREV
> 
> I thought we did not do AUTOREV on master branch in order for builds to
> be reproducible?
> 

AUTOREV will be only for bleeding brand. Regular build will use the 
SRCREV in ti-sci-fw.inc. This way you do not keep updating this recipe 
as long as you can use the HEAD ti-linux-firmware branch. You can always 
override in-case you want a specific version.

>> 2) Kept the destination folder name same to avoid wide-spead changes to
>> other recipes. Since that will be changed as part of over-all clean-up
>>
>> TODO:
>> 1) Re-structure rtos firmware repo and update all dependent firmware recipes.
>> 2) Fix the destination folder name to match src folder
>>
>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
> 
> Regards
> Vignesh
> 
