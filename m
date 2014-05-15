Return-Path: <santosh.shilimkar@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 00331E00A44; Thu, 15 May 2014 08:40:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 72 seconds by postgrey-1.32 at yocto-www;
	Thu, 15 May 2014 08:40:02 PDT
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49967E0053B
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 08:40:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4FFcoNx025746
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 10:38:50 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FFco0b019579
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 10:38:50 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 May 2014 10:38:49 -0500
Received: from [158.218.103.31] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FFcnaF031062;
	Thu, 15 May 2014 10:38:49 -0500
Message-ID: <5374DF89.1040105@ti.com>
Date: Thu, 15 May 2014 11:38:49 -0400
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Hao Zhang <hzhang@ti.com>, Denys Dmytriyenko <denys@ti.com>
References: <1400092189-13946-1-git-send-email-hzhang@ti.com>
	<20140514184018.GO18053@edge> <5373BCEB.9020808@ti.com>
	<20140514190101.GQ18053@edge>
	<7D46E86EC0A8354091174257B2FED1015D016DD6@DLEE11.ent.ti.com>
	<5373D442.9050706@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01B8F5@DLEE11.ent.ti.com>
	<5374D230.6090002@ti.com> <20140515145432.GR18053@edge>
	<5374D81B.7020909@ti.com>
In-Reply-To: <5374D81B.7020909@ti.com>
X-Mailman-Approved-At: Thu, 15 May 2014 09:22:01 -0700
Cc: trini@ti.com, "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] boot-monitor: add K2L and K2E boot monitor build support
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 May 2014 15:40:03 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 15 May 2014 11:07 AM, Hao Zhang wrote:
> On 5/15/2014 10:54 AM, Denys Dmytriyenko wrote:
>> On Thu, May 15, 2014 at 10:41:52AM -0400, Hao Zhang wrote:

[..]

>>>> Can you clarify if you really want all 3 devices installed all the time or 
>>>> do you really want a recipe that installs the boot monitor per device?  I 
>>>> know you don't currently have 3 machine types so maybe that is what is 
>>>> feeding your issue here, but my question is whether you need to have 
>>>> separate builds per device.
>>>>
>>>
>>> I want all the 3 boot monitors built and installed all the time in one
>>> recipe, since MCSDK 3.1 supports all the 3 Keystone II devices in the
>>> same release package. This applies to the U-boot (3 U-boot build for all
>>> the 3 Keystone II devices) and Linux kernel DTB.
>>
>> Linux kernel has support for board variations through DTBs, obviously.
>>
>> As of U-boot, in Sitara world we had to manage board variations by detecting 
>> the board at runtime. So, the same single binary would work on AM335x-EVM, 
>> AM335x-SK, BeagleBone White and BeagleBone Black.
>>
>> I would recommend you working with Tom Rini and doing it similarly, so you 
>> don't have to build 3 different binaries for 3 slightly different Keystone 
>> baords...
>>
>>
Three boars for same SOC is different than 3 different SOCs with their
own boards. We need to support different u-boot configs for that. And
upstream of the patches work is already in progress with Tom reviewing
the patches.

Regards,
Santosh 



