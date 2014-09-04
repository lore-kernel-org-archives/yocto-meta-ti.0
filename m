Return-Path: <robertcnelson@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 407F2E0079A; Thu,  4 Sep 2014 08:55:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (robertcnelson[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.177 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f177.google.com (mail-ie0-f177.google.com
	[209.85.223.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0DBE4E004F5
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 08:55:03 -0700 (PDT)
Received: by mail-ie0-f177.google.com with SMTP id tp5so11375496ieb.8
	for <meta-ti@yoctoproject.org>; Thu, 04 Sep 2014 08:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=FN183z8GOMto7mNbHtwVqO2EmVh17HPtOLiXpB3Ak4U=;
	b=kLsa7TuUngSTO33vHuZOij4tfuyLZNGh0YWqtMVJsET1Y7q+83OmPIME+v/AiNGlqQ
	ztCh6VKZ9xRaaTknmcn8Nk4C35deTtF8QGf+PCEpLB1wdYmKGbWrxsypPQvI6jUFXGly
	Wwy/cBQwt0NaXoZdT1lrg8a0ZE1X4zVtquNl5K/hYapNYni6gmjBoKX1gGj6IqXxw+km
	kEUX70DqeZxmUffJeN2Iorwxn8dx4utFx+5v0bC7Tni01LPo58jnrgLehgmfGEr8WznU
	rq5C8p3jG1AwCiN6tmd0uDWX+1WfEDfHdeZYeLT/gjBGbCmb138f6batZ/BerLvyy2LG
	lKsQ==
MIME-Version: 1.0
X-Received: by 10.42.100.6 with SMTP id y6mr6686426icn.28.1409846103046; Thu,
	04 Sep 2014 08:55:03 -0700 (PDT)
Received: by 10.107.166.16 with HTTP; Thu, 4 Sep 2014 08:55:02 -0700 (PDT)
In-Reply-To: <20140904154819.GH18620@edge>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
Date: Thu, 4 Sep 2014 10:55:02 -0500
Message-ID: <CAOCHtYgkaixBwP84Ocqa4y9H1_9__Y1BR-2UKGeiUXn0Bhk_+Q@mail.gmail.com>
From: Robert Nelson <robertcnelson@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
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
X-List-Received-Date: Thu, 04 Sep 2014 15:55:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 4, 2014 at 10:48 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Thu, Sep 04, 2014 at 10:37:24AM -0500, Peter A. Bigot wrote:
>> On 09/04/2014 10:00 AM, Denys Dmytriyenko wrote:
>> >On Thu, Sep 04, 2014 at 02:50:03PM +0000, Mikhail Zakharov wrote:
>> >>On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> >>
>> >>>One anomaly I've found is the CPU frequency range.  On debian we have:
>> >>>
>> >>>    debian@beaglebone:~$ cat
>> >>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>> >>>    300000 600000 800000 1000000
>> >>>
>> >>>while on OE we have:
>> >>>
>> >>>    root@beaglebone:~# cat
>> >>>/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>> >>>    300000 600000 720000 800000
>> >>Stock yocto-bsp is missing a few things that can be found in Robert
>> >>Nelson's patchset for 3.14 linux kernel.
>> >>
>> >>There are lots of other functionality that is missing from yocto-bsp
>> >>kernel for Beaglebone. I suggest you take at the following repos and
>> >>scavenge for what you need :P
>> >First of all, this is meta-ti mailing list for the corresponding BSP. That's
>> >what Peter was asking for, comparing to Robert's Debian and Yocto reference
>> >BSPs, not the other way around.
>> >
>> >Second, Yocto reference BSP is that way for a reason - it's a reference BSP
>> >done with pure mainline kernel and u-boot components w/o any patching on top.
>> >That's its entire purpose. For anything else special, including performance
>> >tweaks, there are other BSPs available. If there is an issue with performance
>> >in meta-ti, we'll investigate it and try to match with Robert's BSP.
>>
>> Yes, at this time meta-ti's BSP performs as well as I've seen any
>> OE-based system, and gets several things right that meta-yocto-bsp
>> does not (and one thing wrong that meta-yocto-bsp gets right, I
>> think; still investigating, will follow-up when I'm sure).
>>
>> I've also verified that performance with a native gcc 4.9.1 build on
>> BeagleBone with hard float is poor, so it's not due to the way OE
>> builds gcc.  I have several competing hypotheses to test.
>
> Can you please point to the test case you were using to measure time? I'd like
> to try it with few different toolchains here as well. BTW, we are currently
> using Linaro gcc-4.7.3 - I'm wondering how it performs.
>
>
>> But I'm still looking for a way to set the CPU frequency to the
>> higher values supported on Beaglebone Black.  I had hoped meta-ti's
>> would be able to do that, since it has bone vs boneblack device
>> trees and u-boot detection.
>>
>> Any hints where to look for clock settings?
>
> Some of those values are considered overclocking and according to the manual
> will reduce the lifespan of the part...

That's an odd statement, as the parts used on the beaglebone black are
binned and sold for 1Ghz operation.

Regards,

-- 
Robert Nelson
http://www.rcn-ee.com/

