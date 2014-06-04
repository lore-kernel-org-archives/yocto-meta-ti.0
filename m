Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BAFE4E00B6F; Wed,  4 Jun 2014 08:04:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40425E00B68
	for <meta-ti@yoctoproject.org>; Wed,  4 Jun 2014 08:04:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s54F4rF8007216
	for <meta-ti@yoctoproject.org>; Wed, 4 Jun 2014 10:04:53 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54F4rSY004451
	for <meta-ti@yoctoproject.org>; Wed, 4 Jun 2014 10:04:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 4 Jun 2014 10:04:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s54F4qau001841;
	Wed, 4 Jun 2014 10:04:53 -0500
Date: Wed, 4 Jun 2014 11:04:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140604150452.GG21819@edge>
References: <5374D81B.7020909@ti.com> <5374DF89.1040105@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01C00A@DLEE11.ent.ti.com>
	<5374E5F7.2080705@ti.com> <20140515161137.GS18053@edge>
	<5374E7D6.4010901@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01C3E0@DLEE11.ent.ti.com>
	<5374EAA5.9060100@ti.com> <20140515163305.GT18053@edge>
	<7D46E86EC0A8354091174257B2FED1015D08BE4C@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D08BE4C@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "Rini, Tom" <trini@ti.com>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"Shilimkar, Santosh" <santosh.shilimkar@ti.com>
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
X-List-Received-Date: Wed, 04 Jun 2014 15:04:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2014 at 09:48:57AM -0400, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Dmytriyenko, Denys
> >Sent: Thursday, May 15, 2014 11:33 AM
> >To: Zhang, Hao
> >Cc: Maupin, Chase; Shilimkar, Santosh; Rini, Tom; meta-
> >ti@yoctoproject.org
> >Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E boot
> >monitor build support
> >
> >On Thu, May 15, 2014 at 12:26:13PM -0400, Hao Zhang wrote:
> >> On 5/15/2014 12:22 PM, Maupin, Chase wrote:
> >> >> -----Original Message-----
> >> >> From: Shilimkar, Santosh
> >> >> Sent: Thursday, May 15, 2014 11:14 AM
> >> >> To: Dmytriyenko, Denys
> >> >> Cc: Maupin, Chase; Zhang, Hao; Rini, Tom; meta-
> >ti@yoctoproject.org
> >> >> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E
> >boot
> >> >> monitor build support
> >> >>
> >> >> On Thursday 15 May 2014 12:11 PM, Denys Dmytriyenko wrote:
> >> >>> On Thu, May 15, 2014 at 12:06:15PM -0400, Santosh Shilimkar
> >> >> wrote:
> >> >>>> On Thursday 15 May 2014 11:56 AM, Maupin, Chase wrote:
> >> >>>>>> -----Original Message-----
> >> >>>>>> From: Shilimkar, Santosh
> >> >>>>>> Sent: Thursday, May 15, 2014 10:39 AM
> >> >>>>>> To: Zhang, Hao; Dmytriyenko, Denys
> >> >>>>>> Cc: Maupin, Chase; Rini, Tom; meta-ti@yoctoproject.org
> >> >>>>>> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and
> >K2E
> >> >> boot
> >> >>>>>> monitor build support
> >> >>>>>>
> >> >>>>>> On Thursday 15 May 2014 11:07 AM, Hao Zhang wrote:
> >> >>>>>>> On 5/15/2014 10:54 AM, Denys Dmytriyenko wrote:
> >> >>>>>>>> On Thu, May 15, 2014 at 10:41:52AM -0400, Hao Zhang
> >wrote:
> >> >>>>>>
> >> >>>>>> [..]
> >> >>>>>>
> >> >>>>>>>>>> Can you clarify if you really want all 3 devices
> >> >> installed
> >> >>>>>> all the time or
> >> >>>>>>>>>> do you really want a recipe that installs the boot
> >> >> monitor
> >> >>>>>> per device?  I
> >> >>>>>>>>>> know you don't currently have 3 machine types so
> >maybe
> >> >> that
> >> >>>>>> is what is
> >> >>>>>>>>>> feeding your issue here, but my question is whether
> >you
> >> >> need
> >> >>>>>> to have
> >> >>>>>>>>>> separate builds per device.
> >> >>>>>>>>>>
> >> >>>>>>>>>
> >> >>>>>>>>> I want all the 3 boot monitors built and installed all
> >the
> >> >>>>>> time in one
> >> >>>>>>>>> recipe, since MCSDK 3.1 supports all the 3 Keystone II
> >> >> devices
> >> >>>>>> in the
> >> >>>>>>>>> same release package. This applies to the U-boot (3 U-
> >boot
> >> >>>>>> build for all
> >> >>>>>>>>> the 3 Keystone II devices) and Linux kernel DTB.
> >> >>>>>>>>
> >> >>>>>>>> Linux kernel has support for board variations through
> >DTBs,
> >> >>>>>> obviously.
> >> >>>>>>>>
> >> >>>>>>>> As of U-boot, in Sitara world we had to manage board
> >> >> variations
> >> >>>>>> by detecting
> >> >>>>>>>> the board at runtime. So, the same single binary would
> >work
> >> >> on
> >> >>>>>> AM335x-EVM,
> >> >>>>>>>> AM335x-SK, BeagleBone White and BeagleBone Black.
> >> >>>>>>>>
> >> >>>>>>>> I would recommend you working with Tom Rini and doing
> >it
> >> >>>>>> similarly, so you
> >> >>>>>>>> don't have to build 3 different binaries for 3 slightly
> >> >>>>>> different Keystone
> >> >>>>>>>> baords...
> >> >>>>>>>>
> >> >>>>>>>>
> >> >>>>>> Three boars for same SOC is different than 3 different
> >SOCs
> >> >> with
> >> >>>>>> their
> >> >>>>>> own boards. We need to support different u-boot configs
> >for
> >> >> that.
> >> >>>>>> And
> >> >>>>>> upstream of the patches work is already in progress with
> >Tom
> >> >>>>>> reviewing
> >> >>>>>> the patches.
> >> >>>>>
> >> >>>>> So which one is it?  Is this a case of three boards for a
> >> >> single SoC or 3 SoCs with their own boards?
> >> >>>>>
> >> >>>> I was just saying you AM example was multiple board for 1
> >SOC.
> >> >> What Hao is talking
> >> >>>> '3 SOCs with their own boards.
> >> >>>
> >> >>> If those are 3 different SOCs (not just spins or diff part
> >#s),
> >> >> then we should
> >> >>> consider creating 3 different OE machine configs.
> >> >>>
> >> >> yes they are 3 different SOCs with different capabilities
> >> >
> >> > Then Denys is right.  We should have 3 different OE machine
> >configs which all share an SOC_FAMILY of "keystone".  That way
> >they can re-use as much as possible, but unique differences such
> >as the bootloader, example apps, etc can be easily handled.
> >> >
> >>
> >> Can you show me an example how to do that?
> >
> >meta-ti layer, conf/machine for machine configs and
> >conf/machine/include for
> >SOC configs.
> >
> >examples would be:
> >
> >- am335x-evm.conf and beaglebone.conf both use ti33x.inc SOC
> >definition
> >- dra7xx-evm.conf and omap5-evm.conf both use omap-a15.inc SOC
> 
> Denys,
> 
> Is there something outstanding here?  Does this patch need to be revamped 
> now that we have individual machine types?

Yes, indeed. This recipe should build boot-monitor for current ${MACHINE} and 
not all 3 of them together. Similar to kernel and u-boot.

-- 
Denys

