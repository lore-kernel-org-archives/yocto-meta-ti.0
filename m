Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.1965.1621895360284404571
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 24 May 2021 15:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SIQHPlbn;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14OMTG9f023441;
	Mon, 24 May 2021 17:29:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1621895356;
	bh=U1E6Wlk2ZWGcsSPstuzJWubxd9z/yYqbGTBZeQytqvc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=SIQHPlbnM4b90+hpMvzOwjO5JCvYJ8VDDjA1qVIog+V32olVXLD3TpyV6uLCJmtuY
	 Qxhb9AkzCZ253FDHkIOGhxgVe7RkRNxtdHHQIWUVPp6Nxfk4EE0JO3Eg/khDcSAlHu
	 NR9NG8igi7cn2sjChgO77d735fuMEs9zblTxVwZY=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14OMTGDl069223
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 May 2021 17:29:16 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Mon, 24
 May 2021 17:29:15 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Mon, 24 May 2021 17:29:16 -0500
Received: from [10.250.33.34] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14OMTFib031481;
	Mon, 24 May 2021 17:29:15 -0500
Subject: Re: [meta-ti][dunfell/master][PATCH V2] linux-ti-staging: Add extra dtc flags to support dtb overlays
To: Denys Dmytriyenko <denis@denix.org>, <nm@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20210524202608.24622-1-yogeshs@ti.com>
 <20210524215201.72svjoseh6mjvuxg@turbojet> <20210524220234.GW1528@denix.org>
From: "Yogesh Siraswar" <yogeshs@ti.com>
Message-ID: <1f1bbead-54f1-34bf-57a4-1dbaa88f1406@ti.com>
Date: Mon, 24 May 2021 17:29:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210524220234.GW1528@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 5/24/21 5:02 PM, Denys Dmytriyenko wrote:
> On Mon, May 24, 2021 at 04:52:01PM -0500, Nishanth Menon via lists.yoctoproject.org wrote:
>> On 15:26-20210524, Yogesh Siraswar wrote:
>>> Added KERNEL_DTB_OVERLAY_SUPPORT to individual MACHINE conf to
>>> compile dtbs with symbols. This fixes the issue where the dtbs
>>> are build without symbols causing issue with overlays.
>> Might be worthwhile to add that enabling overlay support increases the
>> size of the dtb, hence it is done at a platform level rather than
>> globally to allow custom boards derived from meta-ti to not pay the
>> penalty of extra dtb size, yet have the flexibility to enable on need
>> basis.
Will add in new version
>>
>>> Changes from last version:
>>> 1) Added human readable flag KERNEL_DTB_OVERLAY_SUPPORT to control
>>> DTC_FLAGS.
>>> 2) The KERNEL_DTB_OVERLAY_SUPPORT is also derived from build-root
>>> usage.
>> Please don't add change log of patch version in commit message. That is
>> not an information that is useful in git history.
Will remove it
>>> Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
>>> ---
>>>   conf/machine/am335x-evm.conf                  | 2 ++
>>>   conf/machine/am335x-hs-evm.conf               | 2 ++
>>>   conf/machine/am437x-evm.conf                  | 2 ++
>>>   conf/machine/am437x-hs-evm.conf               | 2 ++
>>>   conf/machine/am57xx-evm.conf                  | 2 ++
>>>   conf/machine/am57xx-hs-evm.conf               | 3 +++
>>>   conf/machine/am65xx-evm.conf                  | 2 ++
>>>   conf/machine/am65xx-hs-evm.conf               | 2 ++
>>>   conf/machine/dra7xx-evm.conf                  | 2 ++
>>>   conf/machine/dra7xx-hs-evm.conf               | 3 +++
>>>   conf/machine/j7-evm.conf                      | 2 ++
>>>   conf/machine/j7-hs-evm.conf                   | 2 ++
>>>   conf/machine/j7200-evm.conf                   | 2 ++
>>>   conf/machine/k2g-evm.conf                     | 2 ++
>>>   conf/machine/k2g-hs-evm.conf                  | 2 ++
>>>   recipes-kernel/linux/linux-ti-mainline_git.bb | 6 ++++--
>>>   recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++--
>>>   recipes-kernel/linux/ti-kernel.inc            | 9 +++++++++
>>>   18 files changed, 49 insertions(+), 4 deletions(-)
>>>   create mode 100644 recipes-kernel/linux/ti-kernel.inc
>>>
>>> +
>> [...]
>>
>>> +def get_extra_dtc_args(d):
>>> +    if d.getVar('KERNEL_DTB_OVERLAY_SUPPORT') == "1":
>>> +        return "DTC_FLAGS=-@"
>>> +    else:
>>> +        return ""
>>> +
>>> +EXTRA_DTC_ARGS += "${@get_extra_dtc_args(d)}"
>>> -- 
>>> 2.17.1
>>>
>> just for the record for other bb files:
>> linux-ti-staging-rt_5.10.bb linux-ti-staging-systest_5.10.bb
>>
>> I think this opens up other possibilities in the future to move common
>> operations into ti-kernel.inc and probably drop duplications
> Both -rt and -systest are built on top of the main recipe, they just change
> defconfig and/or branch:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linux/linux-ti-staging-systest_5.10.bb
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
I guess no action here.
>
