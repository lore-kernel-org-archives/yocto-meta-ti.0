Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91F0FE009C8; Tue, 19 May 2015 09:31:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AADC9E0027F;
	Tue, 19 May 2015 09:31:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4JGVmtO003003
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 19 May 2015 09:31:49 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 19 May 2015 09:31:48 -0700
Message-ID: <555B6573.5030002@windriver.com>
Date: Tue, 19 May 2015 12:31:47 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Brian Hutchinson
	<b.hutchman@gmail.com>
References: <4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>	<5540DB34.6010102@windriver.com>	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>	<55421DA2.9060909@windriver.com>	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>	<554236CB.6000604@windriver.com>	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>	<5550FD98.1050507@windriver.com>	<CAFZh4h-SqSVsG_HXrx3H=QfDs3DH5GoKmFCgwBgGq90+B4WB5A@mail.gmail.com>	<55521DB8.2070606@windriver.com>
	<20150514220801.GD20022@denix.org>	<CAFZh4h9=cJG8aVbwvh_NjR24UTnCj9A44zHPs3rqEn_rdCfN3A@mail.gmail.com>	<CAFZh4h-r1_gabVP0HdDoOrcT_neED51JpMmm586KLuc_efWdFg@mail.gmail.com>	<CAFZh4h8qX6hYJ_kA4Ny=K7YqGnECu_nX1Jkejj=3P8saYmCH2g@mail.gmail.com>	<CAFZh4h9oJ3UZFt2b_3SHB1xi99M+rEWis12-VU2gQxMQ9sVBsA@mail.gmail.com>
	<CADkTA4Px0rhNzfPsjcNN5Bq4sKZujkPDwnJfxq5dsKRc7=G0Aw@mail.gmail.com>
In-Reply-To: <CADkTA4Px0rhNzfPsjcNN5Bq4sKZujkPDwnJfxq5dsKRc7=G0Aw@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>
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
X-List-Received-Date: Tue, 19 May 2015 16:31:58 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-19 07:39 AM, Bruce Ashfield wrote:
> On Fri, May 15, 2015 at 4:21 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
>> On Fri, May 15, 2015 at 3:26 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
>>> On Fri, May 15, 2015 at 9:55 AM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
>>>> On Thu, May 14, 2015 at 6:16 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
>>>>>
>>>>> On May 14, 2015 6:08 PM, "Denys Dmytriyenko" <denis@denix.org> wrote:
>>>>>>
>>>>>> On Tue, May 12, 2015 at 11:35:20AM -0400, Bruce Ashfield wrote:
>>>>>>> On 2015-05-12 10:20 AM, Brian Hutchinson wrote:
>>>>>>>> On Mon, May 11, 2015 at 3:06 PM, Bruce Ashfield
>>>>>>>> <bruce.ashfield@windriver.com> wrote:
>>>>>>>>> On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
>>>>>>>>>>
>>>>>>>>>> On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
>>>>>>>>>> <bruce.ashfield@windriver.com> wrote:
>>>>>>>>>>>
>>>>>>>>>>> It is plausible. But in theory, linux-dummy should still provide
>>>>>>>>>>> what you need (but since it doesn't build anything, there is
>>>>>>>>>>> no abi .. and no modules can be built against it) .. so the
>>>>>>>>>>> error isn't graceful.
>>>>>>>>>>>
>>>>>>>>>>> Bruce
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> I can confirm this same problem is happening to me.  I just updated
>>>>>>>>>> one of my builds from 1.7 to 1.8 and am also getting my rootfs to
>>>>>>>>>> fail
>>>>>>>>>> due to no abi kernel version:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> We still have a race condition in the 1.8 branch for the population
>>>>>>>>> of the build-artifacts directory.
>>>>>>>>>
>>>>>>>>> If modules start building, they'll race against the population of the
>>>>>>>>> abiversion, and you may see that message.
>>>>>>>>>
>>>>>>>>> There's a proposed patch for master, but I don't think it is in
>>>>>>>>> fido yet.
>>>>>>>>>
>>>>>>>>> Bruce
>>>>>>>>
>>>>>>>> Hi Bruce,
>>>>>>>>
>>>>>>>> I did some searches and looks like there are a number of 'race'
>>>>>>>> condition fixes but it wasn't obvious which one I may need.  Is it
>>>>>>>> this one:
>>>>>>>
>>>>>>>>> http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=02d0a003d603266114512160b209876199241e98
>>>>>>>>
>>>>>>>
>>>>>>> That's the one that should make sure that the shared workdir
>>>>>>> (Which has the abiversion) is in place before building any modules.
>>>>>>>
>>>>>>> I can't say that it is exactly your issue, but it is the change
>>>>>>> I was thinking of.
>>>>>>
>>>>>> Brian,
>>>>>>
>>>>>> Were you able to try the above mentioned commit against am180x in meta-ti?
>>>>>> Did
>>>>>> it solve the missing abi kernel version? Thanks.
>>>>>>
>>>>>> --
>>>>>> Denys
>>>>>
>>>>> Hi Denys,
>>>>>
>>>>> No, I got caught up in something else ... I'll try it tomorrow and report
>>>>> back after I cherry pick that commit Bruce mentioned.
>>>>>
>>>>> Regards,
>>>>>
>>>>> Brian
>>>>
>>>> Update.  Not sure if I did this right but this is what I did.  I added
>>>> master as a remote and cherry picked
>>>> 02d0a003d603266114512160b209876199241e98.  Next I just went for it and
>>>> tried to bitbake my image again and got the same result as before.
>>>> Next I did a bitbake cleanall on virtual/kernel and tried to make my
>>>> image again and still got the same result.
>>>>
>>>> I'm going to leave this build as is and setup a new one using 1.8
>>>> master and see if I get the same thing again.  I'll leave this broken
>>>> build alone for a while in case someone wants me to try something with
>>>> it to fix it.
>>>>
>>>> Regards,
>>>>
>>>> Brian
>>>
>>> Yet another update ... I did a fresh checkout of master and tried to
>>> build and had the same kernelabiversion error:
>>>
>>> WARNING: omap3-sgx-modules-5.01.01.01 ONLY supports hardfp mode for
>>> now#######################
>>>                                                            | ETA:
>>> 00:00:28
>>> WARNING: omap3-sgx-modules-5.01.01.02 ONLY supports hardfp mode for now
>>> WARNING: ti-cgt6x-8.0.0 ONLY supports hardfp mode for
>>> now########################################
>>>
>>>   | ETA:  00:00:26
>>> Parsing recipes: 100%
>>> |##############################################################################################################################################################################|
>>> Time: 00:01:02
>>> Parsing of 1802 .bb files complete (0 cached, 1802 parsed). 2303
>>> targets, 182 skipped, 0 masked, 0 errors.
>>> NOTE: Resolving any missing task queue dependencies
>>> NOTE: multiple providers are available for u-boot (u-boot,
>>> u-boot-glsdk, u-boot-ti-staging)
>>> NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
>>> NOTE: multiple providers are available for jpeg (jpeg, libjpeg-turbo)
>>> NOTE: consider defining a PREFERRED_PROVIDER entry to match jpeg
>>>
>>> Build Configuration:
>>> BB_VERSION        = "1.27.0"
>>> BUILD_SYS         = "x86_64-linux"
>>> NATIVELSBSTRING   = "Debian-7.8"
>>> TARGET_SYS        = "arm-poky-linux-gnueabi"
>>> MACHINE           = "am180x-evm"
>>> DISTRO            = "poky"
>>> DISTRO_VERSION    = "1.8+snapshot-20150515"
>>> TUNE_FEATURES     = "arm armv5 thumb dsp"
>>> TARGET_FPU        = "soft"
>>> meta
>>> meta-yocto
>>> meta-yocto-bsp    = "master:fab7da4f8030a4067db0522f77eaa6d3b501c68f"
>>> meta-ti           = "master:60a7bfbf96609ef6f3e084c32b2af853222b3b7e"
>>> meta-oe
>>> meta-python
>>> meta-networking
>>> meta-webserver    = "master:53d55216c8c721d3b66ec8f968737bf081def870"
>>>
>>> NOTE: Preparing RunQueue
>>> NOTE: Executing SetScene Tasks
>>> NOTE: Executing RunQueue Tasks
>>> WARNING: QA Issue: /usr/bin/apxs_apache2-dev contained in package
>>> apache2-dev requires /usr/bin/perl, but no providers found in its
>>> RDEPENDS [file-rdeps]
>>> ERROR: No kernel-abiversion file found
>>> (/home/hutch/yocto_1.8_davinci_2/poky/build/tmp/sysroots/am180x-evm/pkgdata/kernel-depmod/kernel-abiversion),
>>> cannot run depmod, aborting
>>> ERROR: Function failed: do_rootfs
>>> ERROR: Logfile of failure stored in:
>>> /home/hutch/yocto_1.8_davinci_2/poky/build/tmp/work/am180x_evm-poky-linux-gnueabi/core-image-nodeam/1.0-r0/temp/log.do_rootfs.10336
>>> ERROR: Task 7 (/home/hutch/yocto_1.8_davinci_2/poky/meta/recipes-core/images/core-image-nodeam.bb,
>>> do_rootfs) failed with exit code '1'
>>> NOTE: Tasks Summary: Attempted 2614 tasks of which 9 didn't need to be
>>> rerun and 1 failed.
>>> Waiting for 0 running tasks to finish:
>>>
>>> Summary: 1 task failed:
>>>    /home/hutch/yocto_1.8_davinci_2/poky/meta/recipes-core/images/core-image-nodeam.bb,
>>> do_rootfs
>>> Summary: There were 4 WARNING messages shown.
>>> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>>
>> More info for those that care ...
>>
>> The end of the error log file has:
>> DEBUG: Executing python function write_image_manifest
>> DEBUG: Python function write_image_manifest finished
>> NOTE: Executing: ldconfig
>> -r/home/hutch/yocto_1.8_davinci_2/poky/build/tmp/work/am180x_evm-poky-linux-gnueabi/core-image-nodeam/1.0-r0/rootfs-c
>> new -v
>> ERROR: No kernel-abiversion file found
>> (/home/hutch/yocto_1.8_davinci_2/poky/build/tmp/sysroots/am180x-evm/pkgdata/kernel-depmod/kernel-abiversion),
>> cannot run depmod, aborting
>> DEBUG: Python function do_rootfs finished
>> ERROR: Function failed: do_rootfs
>>
>> I have a linux-dummy director in pkgdata but no kernel-depmod directory exists.
>>
>
> Interesting. Looks like we have some sort of bad dependency. I'm poking around
> to see if I can reproduce this locally.

Brian,

I'm trying to wrap my head around this. Which kernel did you say
was building in your configuration ? Was it really linux-dummy, or
is there a bootable kernel in play ?

Looking at the dependencies, I can see how the depmodwrapper requires
that a kernel be built and the abiversion file created. But in the
case of linux-dummy, there's no header files to use and generate the
abiversion, so it won't be available for depmod.

Which takes me back to one of my original questions, why is depmod
running if the kernel isn't being built as part of this image .. and
that leads me to think I'm missing some important information.

Bruce

>
> Bruce
>
>> Regards,
>>
>> Brian
>> --
>> _______________________________________________
>> yocto mailing list
>> yocto@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/yocto
>
>
>


