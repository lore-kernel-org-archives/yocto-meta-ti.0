Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DFAF3E0082A; Thu,  4 Sep 2014 08:55:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [173.201.192.231 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C413BE00769
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 08:55:21 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id n3vK1o00U1mTNtu013vK25; Thu, 04 Sep 2014 08:55:20 -0700
Message-ID: <54088B67.7020709@pabigot.com>
Date: Thu, 04 Sep 2014 10:55:19 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <a46afa0b8d064471ae32a8078631d962@mb.cognitivesystems.com>
	<20140904150022.GD18620@edge> <54088734.1090204@pabigot.com>
	<20140904154819.GH18620@edge>
In-Reply-To: <20140904154819.GH18620@edge>
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
X-List-Received-Date: Thu, 04 Sep 2014 15:55:25 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/04/2014 10:48 AM, Denys Dmytriyenko wrote:
> On Thu, Sep 04, 2014 at 10:37:24AM -0500, Peter A. Bigot wrote:
>> On 09/04/2014 10:00 AM, Denys Dmytriyenko wrote:
>>> On Thu, Sep 04, 2014 at 02:50:03PM +0000, Mikhail Zakharov wrote:
>>>> On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>>>>
>>>>> One anomaly I've found is the CPU frequency range.  On debian we have:
>>>>>
>>>>>     debian@beaglebone:~$ cat
>>>>> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>>>>>     300000 600000 800000 1000000
>>>>>
>>>>> while on OE we have:
>>>>>
>>>>>     root@beaglebone:~# cat
>>>>> /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
>>>>>     300000 600000 720000 800000
>>>> Stock yocto-bsp is missing a few things that can be found in Robert
>>>> Nelson's patchset for 3.14 linux kernel.
>>>>
>>>> There are lots of other functionality that is missing from yocto-bsp
>>>> kernel for Beaglebone. I suggest you take at the following repos and
>>>> scavenge for what you need :P
>>> First of all, this is meta-ti mailing list for the corresponding BSP. That's
>>> what Peter was asking for, comparing to Robert's Debian and Yocto reference
>>> BSPs, not the other way around.
>>>
>>> Second, Yocto reference BSP is that way for a reason - it's a reference BSP
>>> done with pure mainline kernel and u-boot components w/o any patching on top.
>>> That's its entire purpose. For anything else special, including performance
>>> tweaks, there are other BSPs available. If there is an issue with performance
>>> in meta-ti, we'll investigate it and try to match with Robert's BSP.
>> Yes, at this time meta-ti's BSP performs as well as I've seen any
>> OE-based system, and gets several things right that meta-yocto-bsp
>> does not (and one thing wrong that meta-yocto-bsp gets right, I
>> think; still investigating, will follow-up when I'm sure).
>>
>> I've also verified that performance with a native gcc 4.9.1 build on
>> BeagleBone with hard float is poor, so it's not due to the way OE
>> builds gcc.  I have several competing hypotheses to test.
> Can you please point to the test case you were using to measure time? I'd like
> to try it with few different toolchains here as well. BTW, we are currently
> using Linaro gcc-4.7.3 - I'm wondering how it performs.


The context is: 
http://scruss.com/blog/2013/09/23/beaglebone-black-slow-as-a-dog/

The specific application is: http://www.cs.utah.edu/~aek/code/card.cpp

The "ought to work" compiler line is: g++ -Ofast card.cpp -o card

The "kitchen-sink-still-doesn't-help" compiler line is:

g++ \
   -march=armv7-a -mtune=cortex-a8 \
   -mthumb-interwork \
   -mfloat-abi=hard -mfpu=neon \
   -Ofast \
   -o card \
   card.cpp

All my tests are with gcc-4.9.1, with or without the openembedded-core 
patch set.

>
>> But I'm still looking for a way to set the CPU frequency to the
>> higher values supported on Beaglebone Black.  I had hoped meta-ti's
>> would be able to do that, since it has bone vs boneblack device
>> trees and u-boot detection.
>>
>> Any hints where to look for clock settings?
> Some of those values are considered overclocking and according to the manual
> will reduce the lifespan of the part...

So the Beagle Bone Black SRM's claim that the AM3358BZCZ100 can run at 
1GHz is not entirely true?  Or is it just that the operating-points in 
that patch are too aggressive?

Peter

