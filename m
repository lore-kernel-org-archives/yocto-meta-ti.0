Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58D79E00744; Thu,  4 Sep 2014 12:49:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.170 listed in list.dnswl.org]
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 14503E004F5
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 12:48:55 -0700 (PDT)
Received: by mail-ie0-f170.google.com with SMTP id rl12so12446454iec.29
	for <meta-ti@yoctoproject.org>; Thu, 04 Sep 2014 12:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=NuEZL/4KBBkhIvUTPGDLBxdAVgtoQnQZSqIaW5+5yno=;
	b=JUgr2IaxIWA67jefP64TbQs/OdJJUdXas/Vk/gfs94f0igtA+uf2RylU9jy0Zlsi3C
	ziQBTb3/wk6aa4R0TgAYe8sqbdZdUJKK1F83KsRw+Yur7K8XU2BAIF44NDp3/5AiZGKL
	/KhJNLpovwEda1TbbjfPxYW0ecXjJoA7BITUfcV7YI8ICHsK5/uva0WTxtCrd2sZjhXa
	RMwZkBy4CBsHautWG0CtEHPBeseqIXzgvx52mNtwIj5PwPsLjhBrlf1XO6eeNksKZ/yb
	KLLnDJfcigRg81SymXQrVxyZeinZFq3o3WzOBAQDiGGSWck1/14E5IMDP5/clPEGqPso
	SO5w==
X-Received: by 10.42.62.6 with SMTP id w6mr8975939ich.24.1409860134850; Thu,
	04 Sep 2014 12:48:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Thu, 4 Sep 2014 12:48:24 -0700 (PDT)
In-Reply-To: <54088B67.7020709@pabigot.com>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge> <54088B67.7020709@pabigot.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Sep 2014 12:48:24 -0700
Message-ID: <CAMKF1soAD3uq9pOuu9Hzy8r7Wytzj0Cc_F2aMuzJJ9P76849nw@mail.gmail.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on, BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 19:49:00 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 4, 2014 at 8:55 AM, Peter A. Bigot <pab@pabigot.com> wrote:
> On 09/04/2014 10:48 AM, Denys Dmytriyenko wrote:
>>
>> On Thu, Sep 04, 2014 at 10:37:24AM -0500, Peter A. Bigot wrote:
>>>
>>> On 09/04/2014 10:00 AM, Denys Dmytriyenko wrote:
>>>>
>>>> On Thu, Sep 04, 2014 at 02:50:03PM +0000, Mikhail Zakharov wrote:
>>>>>
>>>>> On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>>>>>
>>>>>> One anomaly I've found is the CPU frequency range.  On debian we have:
>>>>>>
>>>>>>     debian@beaglebone:~$ cat
>>>>>> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>>>>>>     300000 600000 800000 1000000
>>>>>>
>>>>>> while on OE we have:
>>>>>>
>>>>>>     root@beaglebone:~# cat
>>>>>> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>>>>>>     300000 600000 720000 800000
>>>>>
>>>>> Stock yocto-bsp is missing a few things that can be found in Robert
>>>>> Nelson's patchset for 3.14 linux kernel.
>>>>>
>>>>> There are lots of other functionality that is missing from yocto-bsp
>>>>> kernel for Beaglebone. I suggest you take at the following repos and
>>>>> scavenge for what you need :P
>>>>
>>>> First of all, this is meta-ti mailing list for the corresponding BSP.
>>>> That's
>>>> what Peter was asking for, comparing to Robert's Debian and Yocto
>>>> reference
>>>> BSPs, not the other way around.
>>>>
>>>> Second, Yocto reference BSP is that way for a reason - it's a reference
>>>> BSP
>>>> done with pure mainline kernel and u-boot components w/o any patching on
>>>> top.
>>>> That's its entire purpose. For anything else special, including
>>>> performance
>>>> tweaks, there are other BSPs available. If there is an issue with
>>>> performance
>>>> in meta-ti, we'll investigate it and try to match with Robert's BSP.
>>>
>>> Yes, at this time meta-ti's BSP performs as well as I've seen any
>>> OE-based system, and gets several things right that meta-yocto-bsp
>>> does not (and one thing wrong that meta-yocto-bsp gets right, I
>>> think; still investigating, will follow-up when I'm sure).
>>>
>>> I've also verified that performance with a native gcc 4.9.1 build on
>>> BeagleBone with hard float is poor, so it's not due to the way OE
>>> builds gcc.  I have several competing hypotheses to test.
>>
>> Can you please point to the test case you were using to measure time? I'd
>> like
>> to try it with few different toolchains here as well. BTW, we are
>> currently
>> using Linaro gcc-4.7.3 - I'm wondering how it performs.
>
>
>
> The context is:
> http://scruss.com/blog/2013/09/23/beaglebone-black-slow-as-a-dog/
>
> The specific application is: http://www.cs.utah.edu/~aek/code/card.cpp
>
> The "ought to work" compiler line is: g++ -Ofast card.cpp -o card
>
> The "kitchen-sink-still-doesn't-help" compiler line is:
>
> g++ \
>   -march=armv7-a -mtune=cortex-a8 \
>   -mthumb-interwork \
>   -mfloat-abi=hard -mfpu=neon \
>   -Ofast \
>   -o card \
>   card.cpp
>
> All my tests are with gcc-4.9.1, with or without the openembedded-core patch
> set.
>

can you profile run it.? As i understand, you have exact same hardware
and same way of running
it with two different rootfs.

>
>>
>>> But I'm still looking for a way to set the CPU frequency to the
>>> higher values supported on Beaglebone Black.  I had hoped meta-ti's
>>> would be able to do that, since it has bone vs boneblack device
>>> trees and u-boot detection.
>>>
>>> Any hints where to look for clock settings?
>>
>> Some of those values are considered overclocking and according to the
>> manual
>> will reduce the lifespan of the part...
>
>
> So the Beagle Bone Black SRM's claim that the AM3358BZCZ100 can run at 1GHz
> is not entirely true?  Or is it just that the operating-points in that patch
> are too aggressive?
>
> Peter
>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

