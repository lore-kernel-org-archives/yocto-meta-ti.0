Return-Path: <santosh.shilimkar@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 44475E00B68; Thu, 15 May 2014 09:20:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 372 seconds by postgrey-1.32 at yocto-www;
	Thu, 15 May 2014 09:20:27 PDT
Received: from arroyo.ext.ti.com (unknown [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A2E2E00A44
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 09:20:26 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4FGEFpY029951
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 11:14:15 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FGEFj2008859
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 11:14:15 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 15 May 2014 11:14:14 -0500
Received: from [158.218.103.31] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4FGEEIk025090;
	Thu, 15 May 2014 11:14:14 -0500
Message-ID: <5374E7D6.4010901@ti.com>
Date: Thu, 15 May 2014 12:14:14 -0400
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <20140514190101.GQ18053@edge>
	<7D46E86EC0A8354091174257B2FED1015D016DD6@DLEE11.ent.ti.com>
	<5373D442.9050706@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01B8F5@DLEE11.ent.ti.com>
	<5374D230.6090002@ti.com> <20140515145432.GR18053@edge>
	<5374D81B.7020909@ti.com> <5374DF89.1040105@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01C00A@DLEE11.ent.ti.com>
	<5374E5F7.2080705@ti.com> <20140515161137.GS18053@edge>
In-Reply-To: <20140515161137.GS18053@edge>
X-Mailman-Approved-At: Thu, 15 May 2014 09:22:01 -0700
Cc: "Rini, Tom" <trini@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 15 May 2014 16:20:30 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 15 May 2014 12:11 PM, Denys Dmytriyenko wrote:
> On Thu, May 15, 2014 at 12:06:15PM -0400, Santosh Shilimkar wrote:
>> On Thursday 15 May 2014 11:56 AM, Maupin, Chase wrote:
>>>> -----Original Message-----
>>>> From: Shilimkar, Santosh
>>>> Sent: Thursday, May 15, 2014 10:39 AM
>>>> To: Zhang, Hao; Dmytriyenko, Denys
>>>> Cc: Maupin, Chase; Rini, Tom; meta-ti@yoctoproject.org
>>>> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E boot
>>>> monitor build support
>>>>
>>>> On Thursday 15 May 2014 11:07 AM, Hao Zhang wrote:
>>>>> On 5/15/2014 10:54 AM, Denys Dmytriyenko wrote:
>>>>>> On Thu, May 15, 2014 at 10:41:52AM -0400, Hao Zhang wrote:
>>>>
>>>> [..]
>>>>
>>>>>>>> Can you clarify if you really want all 3 devices installed
>>>> all the time or
>>>>>>>> do you really want a recipe that installs the boot monitor
>>>> per device?  I
>>>>>>>> know you don't currently have 3 machine types so maybe that
>>>> is what is
>>>>>>>> feeding your issue here, but my question is whether you need
>>>> to have
>>>>>>>> separate builds per device.
>>>>>>>>
>>>>>>>
>>>>>>> I want all the 3 boot monitors built and installed all the
>>>> time in one
>>>>>>> recipe, since MCSDK 3.1 supports all the 3 Keystone II devices
>>>> in the
>>>>>>> same release package. This applies to the U-boot (3 U-boot
>>>> build for all
>>>>>>> the 3 Keystone II devices) and Linux kernel DTB.
>>>>>>
>>>>>> Linux kernel has support for board variations through DTBs,
>>>> obviously.
>>>>>>
>>>>>> As of U-boot, in Sitara world we had to manage board variations
>>>> by detecting
>>>>>> the board at runtime. So, the same single binary would work on
>>>> AM335x-EVM,
>>>>>> AM335x-SK, BeagleBone White and BeagleBone Black.
>>>>>>
>>>>>> I would recommend you working with Tom Rini and doing it
>>>> similarly, so you
>>>>>> don't have to build 3 different binaries for 3 slightly
>>>> different Keystone
>>>>>> baords...
>>>>>>
>>>>>>
>>>> Three boars for same SOC is different than 3 different SOCs with
>>>> their
>>>> own boards. We need to support different u-boot configs for that.
>>>> And
>>>> upstream of the patches work is already in progress with Tom
>>>> reviewing
>>>> the patches.
>>>
>>> So which one is it?  Is this a case of three boards for a single SoC or 3 SoCs with their own boards?
>>>
>> I was just saying you AM example was multiple board for 1 SOC. What Hao is talking
>> '3 SOCs with their own boards.
> 
> If those are 3 different SOCs (not just spins or diff part #s), then we should 
> consider creating 3 different OE machine configs.
> 
yes they are 3 different SOCs with different capabilities

