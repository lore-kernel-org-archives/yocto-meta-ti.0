Return-Path: <wmills@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B42CDE0093B; Wed, 11 Feb 2015 16:35:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 19B04E00815;
	Wed, 11 Feb 2015 16:35:43 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1C0Zf44026763;
	Wed, 11 Feb 2015 18:35:41 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1C0Zeaw015671;
	Wed, 11 Feb 2015 18:35:40 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Feb 2015 18:35:40 -0600
Received: from [172.22.142.177] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1C0ZcIc012042;
	Wed, 11 Feb 2015 18:35:39 -0600
Message-ID: <54DBF55D.3020001@ti.com>
Date: Wed, 11 Feb 2015 19:35:41 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@windriver.com>, Stephen Flowers
	<sflowers1@gmail.com>, <yocto@yoctoproject.org>, <meta-ti@yoctoproject.org>
References: <54DA0258.9070108@gmail.com>
	<54DA12C7.8000000@windriver.com>	<54DA84F1.1080109@gmail.com>
	<54DADD75.5000809@windriver.com>	<54DB17E7.8070308@gmail.com>
	<54DB7455.4020402@windriver.com>
In-Reply-To: <54DB7455.4020402@windriver.com>
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
X-List-Received-Date: Thu, 12 Feb 2015 00:35:55 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

+ meta-ti
Please keep meta-ti in the loop.

[Sorry for the shorting.  Thunderbird keep locking up when I tried 
replay all in plain text to this message.]

~ 15-02-11, Stephen Flowers wrote:
 > Thanks for your input.  Here are results of 1000 samples over a
 > 10 second period:
 >
 > Interrupt response (microseconds)
 > standard: min: 81, max:118, average: 84
 > rt: min: 224, max: 289, average: 231
 >
 >Will share the .config later once I get on that machine.

Steve I agree the numbers look strange.
There may well be something funny for RT going on for BBB.
TI is just starting to look into RT for BBB.

I would like to see the cyclictest results under heavy system load for
standard and RT kernels.  The whole point of RT is to limit the max
latency when the system is doing *anything*.

I am not surprised that the standard kernel has good latency when idle.
As you add load (filessystem is usually a good load) you should see that 
max goes up a lot.

Also, as Bruce says, some degradation of min and average and also
general system throughput is expected for RT.  That is the trade-off.
I still think the number you are getting for RT seem high but I don't
know what your test is doing in detail.  (I did read your explanation.)
cyclictest should give us a standard baseline.


On 02/11/2015 10:25 AM, Bruce Ashfield wrote:
> On 15-02-11 03:50 AM, Stephen Flowers wrote:
>>
>> my bad, here is the patch set.
>> As for load, only system idle load for the results I posted previously.
>> Will run some cyclic test next.
>
> One thing that did jump out was the difference in config_hz, you
> are taking a lot more ticks in the preempt-rt configuration. If
> you run both at the same hz, or with no_hz enabled, it would be
> interesting to see if there's a difference.
>
> Bruce

