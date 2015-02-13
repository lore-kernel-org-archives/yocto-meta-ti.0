Return-Path: <wmills@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8AB2DE0087C; Thu, 12 Feb 2015 16:20:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48218E007CF;
	Thu, 12 Feb 2015 16:20:15 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1D0KDGU014414;
	Thu, 12 Feb 2015 18:20:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1D0KCKQ013389;
	Thu, 12 Feb 2015 18:20:12 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Feb 2015 18:20:11 -0600
Received: from [172.22.144.139] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1D0K9af024545;
	Thu, 12 Feb 2015 18:20:10 -0600
Message-ID: <54DD433E.2010703@ti.com>
Date: Thu, 12 Feb 2015 19:20:14 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Stephen Flowers <sflowers1@gmail.com>, Bruce Ashfield
	<bruce.ashfield@windriver.com>,
	<yocto@yoctoproject.org>, <meta-ti@yoctoproject.org>
References: <54DA0258.9070108@gmail.com>
	<54DA12C7.8000000@windriver.com>	<54DA84F1.1080109@gmail.com>
	<54DADD75.5000809@windriver.com>	<54DB17E7.8070308@gmail.com>
	<54DB7455.4020402@windriver.com> <54DBF55D.3020001@ti.com>
	<54DD2396.4000909@gmail.com>
In-Reply-To: <54DD2396.4000909@gmail.com>
Subject: Re: [yocto] Yocto Realtime tests on beaglebone black
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
X-List-Received-Date: Fri, 13 Feb 2015 00:20:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 02/12/2015 05:05 PM, Stephen Flowers wrote:
>
> So I ran cyclictest with an idle system and loaded with multiple
> instances of cat /dev/zero > /dev/null &
>

When I suggested filesystem activity I was suggesting getting a kernel
filesystem and a physical I/O device to be active.
The load above is just two character devices so not a ton of kernel
code is active.

If you are interested in pursuing this further I would write a script
that writes multiple files to MMC and then deletes them and do this in
a loop.

Perhaps Bruce knows if there is already a test like this in the
rt-tests.

> #cyclictest -a 0 -p 99 -m -n -l 100000 -q
>
> I ran this command as shown by Toyoka at the 2014 Linuxcon Japan
> [http://events.linuxfoundation.org/sites/events/files/slides/toyooka_LCJ2014_v10.pdf]
>
> to compare against his results for the BBB.  I also threw in xenomai
> with kernel 3.8 for comparison.  For the standard kernel HR timers were
> disabled.

I believe cyclictest requires HR timers for proper operation.
This may explain the very strange numbers for standard kernel below.

>
> [idle]
> preempt_rt: min 12 avg: 20 max: 59
> standard: min: 8005 avg: 309985,955 max: 619963985
> xenomai: min: 8 avg: 16: max 803
>
> [loaded]
> preempt_rt: min 16 avg: 21 max: 47
> standard: min: 15059 avg: 67769851 max: 135530885
> xenomai: min: 10 avg: 15: max 839
>

Yes, the RT numbers now look reasonable.

The standard kernel numbers are way out.  I can't believe the average
latency on an idle system was 5 minutes. Perhaps the dependency on HR
timers is more than I expect and without it the numbers are just
bonkers. I would have expected the numbers to have a floor near the tick 
rate w/o HR.
Bruce: Is that really what that number means??

The loaded numbers are smaller for RT and std.  Strange.
It might be that the "load" is not very significant.
Its not really the CPU load that were after.  Instead we are trying to 
activate code paths that have premtption disabled due to critical
sections and locks.

I don't know if your are interested in taking this to ground, but if so 
I would enable HR in std and try a load as I suggest above or is
already included in the rt-tests.
Bruce certainly knows more about this than I do and might suggest a
load script.

> Actually the preempt_rt results tie up pretty well with Toyooka above,
> leading me to conclude theres something off in my code that could be
> optimised - what do you guys think.

Is your test code userspace or kernel space?
You can look at cyclictest to see if you missed something.
The RT wiki also has some examples for RT apps.

https://rt.wiki.kernel.org/index.php/HOWTO:_Build_an_RT-application

> Also, I ran a test with preempt_rt at 100Hz and there was maybe 10%
> improvement in latency.
>
That sounds reasonable to me.


> Steve
>
> On 12/02/2015 00:35, William Mills wrote:
>> + meta-ti
>> Please keep meta-ti in the loop.
>>
>> [Sorry for the shorting.  Thunderbird keep locking up when I tried
>> replay all in plain text to this message.]
>>
>> ~ 15-02-11, Stephen Flowers wrote:
>> > Thanks for your input.  Here are results of 1000 samples over a
>> > 10 second period:
>> >
>> > Interrupt response (microseconds)
>> > standard: min: 81, max:118, average: 84
>> > rt: min: 224, max: 289, average: 231
>> >
>> >Will share the .config later once I get on that machine.
>>
>> Steve I agree the numbers look strange.
>> There may well be something funny for RT going on for BBB.
>> TI is just starting to look into RT for BBB.
>>
>> I would like to see the cyclictest results under heavy system load for
>> standard and RT kernels.  The whole point of RT is to limit the max
>> latency when the system is doing *anything*.
>>
>> I am not surprised that the standard kernel has good latency when idle.
>> As you add load (filessystem is usually a good load) you should see
>> that max goes up a lot.
>>
>> Also, as Bruce says, some degradation of min and average and also
>> general system throughput is expected for RT.  That is the trade-off.
>> I still think the number you are getting for RT seem high but I don't
>> know what your test is doing in detail.  (I did read your explanation.)
>> cyclictest should give us a standard baseline.
>>
>>
>> On 02/11/2015 10:25 AM, Bruce Ashfield wrote:
>>> On 15-02-11 03:50 AM, Stephen Flowers wrote:
>>>>
>>>> my bad, here is the patch set.
>>>> As for load, only system idle load for the results I posted previously.
>>>> Will run some cyclic test next.
>>>
>>> One thing that did jump out was the difference in config_hz, you
>>> are taking a lot more ticks in the preempt-rt configuration. If
>>> you run both at the same hz, or with no_hz enabled, it would be
>>> interesting to see if there's a difference.
>>>
>>> Bruce
>

