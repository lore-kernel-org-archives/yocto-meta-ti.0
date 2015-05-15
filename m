Return-Path: <b.hutchman@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2983DE00945; Fri, 15 May 2015 12:26:11 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (b.hutchman[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.214.180 listed in list.dnswl.org]
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59404E00820;
	Fri, 15 May 2015 12:26:05 -0700 (PDT)
Received: by obblk2 with SMTP id lk2so85534468obb.0;
	Fri, 15 May 2015 12:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4Y7KPczhAlmkQKfb2kqwybMyVy0j/mo1GRb2pHbhgvU=;
	b=uf6NAI1AMyTRl47JYu+pE4MniCx1rqZTcH0vOhRy7JvX7SbJAfIcQ75CTXUhsTzavb
	I9jbmsRk1B+voBhQxy37C2ujgEfwY4AWvuDdSYsYKwU4eb6Oshq/7X/JhowofHyR0+Ag
	fkgMZzg0rR5E9ZIwLZ48rj4srwVjQg+XEVb/BSEjBOGtzRetf6Wk+btzR/WyBU0Edz37
	7EBwNCdOIMcQPKRukhMCUon2xAxTox0vsDEqs4u/Mx2jvkTnxcLjzlKMp+/IQd4zsQHk
	1897NGgV9Duw5SoR5v9yMUYRt0FdvgxFmO/N57ibyMx2jIbrVBNoz+Okz9mckm+twoip
	tAQA==
MIME-Version: 1.0
X-Received: by 10.182.236.5 with SMTP id uq5mr9726271obc.13.1431717965030;
	Fri, 15 May 2015 12:26:05 -0700 (PDT)
Received: by 10.60.6.33 with HTTP; Fri, 15 May 2015 12:26:04 -0700 (PDT)
In-Reply-To: <CAFZh4h-r1_gabVP0HdDoOrcT_neED51JpMmm586KLuc_efWdFg@mail.gmail.com>
References: <4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>
	<5540DB34.6010102@windriver.com>
	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>
	<55421DA2.9060909@windriver.com>
	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>
	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
	<5550FD98.1050507@windriver.com>
	<CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>
	<55521DB8.2070606@windriver.com> <20150514220801.GD20022@denix.org>
	<CAFZh4h9=cJG8aVbwvh_NjR24UTnCj9A44zHPs3rqEn_rdCfN3A@mail.gmail.com>
	<CAFZh4h-r1_gabVP0HdDoOrcT_neED51JpMmm586KLuc_efWdFg@mail.gmail.com>
Date: Fri, 15 May 2015 15:26:04 -0400
Message-ID: <CAFZh4h8qX6hYJ_kA4Ny=K7YqGnECu_nX1Jkejj=3P8saYmCH2g@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	=?UTF-8?B?U2NoYXVtbMO2ZmZlbCw=?= <J.Schaumloeffel@astro-kom.de>,
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Fri, 15 May 2015 19:26:11 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 15, 2015 at 9:55 AM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
> On Thu, May 14, 2015 at 6:16 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
>>
>> On May 14, 2015 6:08 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>>>
>>> On Tue, May 12, 2015 at 11:35:20AM -0400, Bruce Ashfield wrote:
>>> > On 2015-05-12 10:20 AM, Brian Hutchinson wrote:
>>> > >On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield
>>> > ><bruce.ashfield@windriver.com> wrote:
>>> > >>On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
>>> > >>>
>>> > >>>On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
>>> > >>><bruce.ashfield@windriver.com> wrote:
>>> > >>>>
>>> > >>>>It is plausible. But in theory, linux-dummy should still provide
>>> > >>>>what you need (but since it doesn't build anything, there is
>>> > >>>>no abi .. and no modules can be built against it) .. so the
>>> > >>>>error isn't graceful.
>>> > >>>>
>>> > >>>>Bruce
>>> > >>>
>>> > >>>
>>> > >>>I can confirm this same problem is happening to me.  I just updated
>>> > >>>one of my builds from 1.7 to 1.8 and am also getting my rootfs to
>>> > >>> fail
>>> > >>>due to no abi kernel version:
>>> > >>
>>> > >>
>>> > >>We still have a race condition in the 1.8 branch for the population
>>> > >>of the build-artifacts directory.
>>> > >>
>>> > >>If modules start building, they'll race against the population of the
>>> > >>abiversion, and you may see that message.
>>> > >>
>>> > >>There's a proposed patch for master, but I don't think it is in
>>> > >>fido yet.
>>> > >>
>>> > >>Bruce
>>> > >
>>> > >Hi Bruce,
>>> > >
>>> > >I did some searches and looks like there are a number of 'race'
>>> > >condition fixes but it wasn't obvious which one I may need.  Is it
>>> > >this one:
>>> >
>>> > > >http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02d0a003d603266114512160b209876199241e98
>>> > >
>>> >
>>> > That's the one that should make sure that the shared workdir
>>> > (Which has the abiversion) is in place before building any modules.
>>> >
>>> > I can't say that it is exactly your issue, but it is the change
>>> > I was thinking of.
>>>
>>> Brian,
>>>
>>> Were you able to try the above mentioned commit against am180x in meta-ti?
>>> Did
>>> it solve the missing abi kernel version? Thanks.
>>>
>>> --
>>> Denys
>>
>> Hi Denys,
>>
>> No, I got caught up in something else ... I'll try it tomorrow and report
>> back after I cherry pick that commit Bruce mentioned.
>>
>> Regards,
>>
>> Brian
>
> Update.  Not sure if I did this right but this is what I did.  I added
> master as a remote and cherry picked
> 02d0a003d603266114512160b209876199241e98.  Next I just went for it and
> tried to bitbake my image again and got the same result as before.
> Next I did a bitbake cleanall on virtual/kernel and tried to make my
> image again and still got the same result.
>
> I'm going to leave this build as is and setup a new one using 1.8
> master and see if I get the same thing again.  I'll leave this broken
> build alone for a while in case someone wants me to try something with
> it to fix it.
>
> Regards,
>
> Brian

Yet another update ... I did a fresh checkout of master and tried to
build and had the same kernelabiversion error:

WARNING: omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for
now#######################
                                                          | ETA:
00:00:28
WARNING: omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
WARNING: ti-cgt6x-8.0.0 ONLY supports hardfp mode for
now########################################

 | ETA:  00:00:26
Parsing recipes: 100%
|##############################################################################################################################################################################|
Time: 00:01:02
Parsing of 1802 .bb files complete (0 cached, 1802 parsed). 2303
targets, 182 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for u-boot (u-boot,
u-boot-glsdk, u-boot-ti-staging)
NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg

Build Configuration:
BB_VERSION        = "1.27.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-7.8"
TARGET_SYS        = "arm-poky-linux-gnueabi"
MACHINE           = "am180x-evm"
DISTRO            = "poky"
DISTRO_VERSION    = "1.8+snapshot-20150515"
TUNE_FEATURES     = "arm armv5 thumb dsp"
TARGET_FPU        = "soft"
meta
meta-yocto
meta-yocto-bsp    = "master:fab7da4f8030a4067db0522f77eaa6d3b501c68f"
meta-ti           = "master:60a7bfbf96609ef6f3e084c32b2af853222b3b7e"
meta-oe
meta-python
meta-networking
meta-webserver    = "master:53d55216c8c721d3b66ec8f968737bf081def870"

NOTE: Preparing RunQueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: QA Issue: /usr/bin/apxs_apache2-dev contained in package
apache2-dev requires /usr/bin/perl, but no providers found in its
RDEPENDS [file-rdeps]
ERROR: No kernel-abiversion file found
(/home/hutch/yocto_1.8_davinci_2/poky/build/tmp/sysroots/am180x-evm/pkgdata/kernel-depmod/kernel-abiversion),
cannot run depmod, aborting
ERROR: Function failed: do_rootfs
ERROR: Logfile of failure stored in:
/home/hutch/yocto_1.8_davinci_2/poky/build/tmp/work/am180x_evm-poky-linux-gnueabi/core-image-nodeam/1.0-r0/temp/log.do_rootfs.10336
ERROR: Task 7 (/home/hutch/yocto_1.8_davinci_2/poky/meta/recipes-core/images/core-image-nodeam.bb,
do_rootfs) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2614 tasks of which 9 didn't need to be
rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/hutch/yocto_1.8_davinci_2/poky/meta/recipes-core/images/core-image-nodeam.bb,
do_rootfs
Summary: There were 4 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

