Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 809E8E00B1E; Thu, 15 May 2014 08:45:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.216.173 listed in list.dnswl.org]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 1057 seconds by postgrey-1.32 at yocto-www;
	Thu, 15 May 2014 08:45:39 PDT
Received: from mail-qc0-f173.google.com (unknown [209.85.216.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F13AFE00975
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 08:45:39 -0700 (PDT)
Received: by mail-qc0-f173.google.com with SMTP id i8so2063528qcq.4
	for <meta-ti@yoctoproject.org>; Thu, 15 May 2014 08:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=Xev6t9ldb5+XR5SmQMUCNBv3BbQh3TZiZV9GKL6yEmM=;
	b=TJa/BNlqRoesG0ldNm9SDV7Lofcb+AKR+h917Oghzs3ZEA5EkRuUA5nwBl0wHeZInf
	JVkmokoM7xfn9/6eQjSuEpV7F+dwZqbMYw1PSE4ZHTrOThj53WhtdsPmqGk1nNK+CBXO
	0Pgs8OZCjajHQ41GO+4y6BzMdAc2/K23bdp0wqhBIdciwb0044V1elScLwuXwjg68S/v
	f9819wqnYOmRLVkeYPUmLUlTvYWsJmyX0Z2X4ipJ69iGFZykcWuZkk2H8Iw/+8EFuzYO
	mPtQemb91MqTaotdw08dAON9Hc9NxfsiG4I3YXPfjfVu52Ls2WH/fqzqDL84IpGu81kq
	iZ7Q==
X-Received: by 10.140.86.99 with SMTP id o90mr15806333qgd.14.1400167224230;
	Thu, 15 May 2014 08:20:24 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id d2sm8373025qad.5.2014.05.15.08.20.20
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 15 May 2014 08:20:22 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 15 May 2014 11:20:27 -0400
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denys@ti.com>
Message-ID: <20140515152027.GS22182@bill-the-cat>
References: <1400092189-13946-1-git-send-email-hzhang@ti.com>
	<20140514184018.GO18053@edge> <5373BCEB.9020808@ti.com>
	<20140514190101.GQ18053@edge>
	<7D46E86EC0A8354091174257B2FED1015D016DD6@DLEE11.ent.ti.com>
	<5373D442.9050706@ti.com>
	<7D46E86EC0A8354091174257B2FED1015D01B8F5@DLEE11.ent.ti.com>
	<5374D230.6090002@ti.com> <20140515145432.GR18053@edge>
MIME-Version: 1.0
In-Reply-To: <20140515145432.GR18053@edge>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
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
X-List-Received-Date: Thu, 15 May 2014 15:45:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 15, 2014 at 10:54:32AM -0400, Denys Dmytriyenko wrote:
> On Thu, May 15, 2014 at 10:41:52AM -0400, Hao Zhang wrote:
> > On 5/15/2014 10:21 AM, Maupin, Chase wrote:
> > >> -----Original Message-----
> > >> From: Zhang, Hao
> > >> Sent: Wednesday, May 14, 2014 3:38 PM
> > >> To: Maupin, Chase
> > >> Cc: Dmytriyenko, Denys; meta-ti@yoctoproject.org
> > >> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E boot
> > >> monitor build support
> > >>
> > >> On 5/14/2014 3:55 PM, Maupin, Chase wrote:
> > >>>> -----Original Message-----
> > >>>> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> > >>>> bounces@yoctoproject.org] On Behalf Of Dmytriyenko, Denys
> > >>>> Sent: Wednesday, May 14, 2014 2:01 PM
> > >>>> To: Zhang, Hao
> > >>>> Cc: meta-ti@yoctoproject.org
> > >>>> Subject: Re: [meta-ti] [PATCH] boot-monitor: add K2L and K2E
> > >> boot
> > >>>> monitor build support
> > >>>>
> > >>>> On Wed, May 14, 2014 at 02:58:51PM -0400, Hao Zhang wrote:
> > >>>>> On 5/14/2014 2:40 PM, Denys Dmytriyenko wrote:
> > >>>>>> On Wed, May 14, 2014 at 02:29:49PM -0400, hzhang@ti.com
> > >> wrote:
> > >>>>>>> From: Hao Zhang <hzhang@ti.com>
> > >>>>>>>
> > >>>>>>> ---
> > >>>>>>>  recipes-bsp/boot-monitor/boot-monitor_git.bb |   18
> > >>>> +++++++++++++-----
> > >>>>>>>  1 file changed, 13 insertions(+), 5 deletions(-)
> > >>>>>>>
> > >>>>>>> diff --git a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > >>>> b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > >>>>>>> index 7c5e9cf..2c3aa43 100644
> > >>>>>>> --- a/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > >>>>>>> +++ b/recipes-bsp/boot-monitor/boot-monitor_git.bb
> > >>>>>>> @@ -3,8 +3,12 @@ EXTRA_OEMAKE =
> > >>>> "CROSS_COMPILE=${TARGET_PREFIX}"
> > >>>>>>>
> > >>>>>>>  LICENSE = "BSD"
> > >>>>>>>
> > >>>>>>> -BOOT_MONITOR_BINARY ?= "skern.bin"
> > >>>>>>> -BOOT_MONITOR_IMAGE  ?= "skern-${MACHINE}.bin"
> > >>>>>>> +BOOT_MONITOR_BINARY_K2HK ?= "skern-k2hk.bin"
> > >>>>>>> +BOOT_MONITOR_IMAGE_k2HK  ?= "skern-k2hk-${MACHINE}.bin"
> > >>>>>>> +BOOT_MONITOR_BINARY_K2L ?= "skern-k2l.bin"
> > >>>>>>> +BOOT_MONITOR_IMAGE_k2L  ?= "skern-k2l-${MACHINE}.bin"
> > >>>>>>> +BOOT_MONITOR_BINARY_K2E ?= "skern-k2e.bin"
> > >>>>>>> +BOOT_MONITOR_IMAGE_k2E  ?= "skern-k2e-${MACHINE}.bin"
> > >>>
> > >>> Maybe a silly question but do you need to package all of these
> > >> in a single recipe or do you want to package K2HK and K2L and K2E
> > >> in separate packages?
> > >>>
> > >>>>>>
> > >>>>>> Have you tested it? You mix case in the above variables - one
> > >>>> has K2HK
> > >>>>>> uppercase, another has k2HK lowercase. Same for k2l...
> > >>>>>>
> > >>>>>>
> > >>>>>
> > >>>>> Yes, I tested it. I will correct the lowercase error and re-
> > >>>> submit the
> > >>>>> patch.
> > >>>>
> > >>>> It shouldn't have worked, as you use incorrect variables below
> > >> in
> > >>>> do_deploy.
> > >>>>
> > >>>>
> > >>
> > >> For some reason, it still works, anyway I fixed the lowercase
> > >> errors
> > >>
> > >>>>>>>  BOOT_MONITOR_MAKE_TARGET  ?= "all"
> > >>>>>>>
> > >>>>>>>  LIC_FILES_CHKSUM =
> > >>>> "file://COPYING;md5=25fe219a6febf6e5bb45beda1b2eb315"
> > >>>>>>> @@ -14,7 +18,7 @@ COMPATIBLE_MACHINE = "keystone-evm"
> > >>>>>>>  SRC_URI = "git://git.ti.com/keystone-linux/boot-
> > >>>> monitor.git;protocol=git;branch=${BRANCH}"
> > >>>>>>>
> > >>>>>>>  PV = "2.0"
> > >>>>>>> -PR = "r0+gitr${SRCPV}"
> > >>>>>>> +PR = "r1+gitr${SRCPV}"
> > >>>>>>>
> > >>>>>>>  BRANCH = "master"
> > >>>>>>>
> > >>>>>>> @@ -27,7 +31,9 @@ do_compile () {
> > >>>>>>>  	unset LDFLAGS
> > >>>>>>>  	unset CFLAGS
> > >>>>>>>  	unset CPPFLAGS
> > >>>>>>> -	oe_runmake ${BOOT_MONITOR_MAKE_TARGET}
> > >>>>>>> +	oe_runmake k2hk
> > >>>>>>> +	oe_runmake k2l
> > >>>>>>> +	oe_runmake k2e
> > >>>
> > >>> If you really want to package all of these in a single recipe
> > >> why not use a for loop?  The naming, etc is formulaic.  You could
> > >> just have a list of "k2hk k2l k2e" and do the make for that list
> > >> as well as your do_deploy stuff below.
> > >>>
> > >>
> > >> Will use for loop and re-sumbit the patch.
> > > 
> > > Can you clarify if you really want all 3 devices installed all the time or 
> > > do you really want a recipe that installs the boot monitor per device?  I 
> > > know you don't currently have 3 machine types so maybe that is what is 
> > > feeding your issue here, but my question is whether you need to have 
> > > separate builds per device.
> > > 
> > 
> > I want all the 3 boot monitors built and installed all the time in one
> > recipe, since MCSDK 3.1 supports all the 3 Keystone II devices in the
> > same release package. This applies to the U-boot (3 U-boot build for all
> > the 3 Keystone II devices) and Linux kernel DTB.
> 
> Linux kernel has support for board variations through DTBs, obviously.
> 
> As of U-boot, in Sitara world we had to manage board variations by detecting 
> the board at runtime. So, the same single binary would work on AM335x-EVM, 
> AM335x-SK, BeagleBone White and BeagleBone Black.

Note that this relies on a reliable way to tell what board we're on at
run-time.  AM335x TI influenced boards have an i2c EEPROM with a defined
layout and a board name field.  Siemens does something similar (but
different layout) with their am335x HW as well.  Beagleboard also
supports similar due to intentional GPIO setups, iirc.  If Keystone II
platforms have some way to tell at run-time, then we can do this there
too, otherwise it's 3 binaries.

-- 
Tom

