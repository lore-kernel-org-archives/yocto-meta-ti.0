Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B5A7FE00945; Wed, 11 Feb 2015 19:50:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F444E0093B;
	Wed, 11 Feb 2015 19:50:16 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1C3oCDt005706
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 11 Feb 2015 19:50:12 -0800 (PST)
Received: from server.local (128.224.22.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 11 Feb 2015 19:50:12 -0800
Message-ID: <54DC22F3.9030805@windriver.com>
Date: Wed, 11 Feb 2015 22:50:11 -0500
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: William Mills <wmills@ti.com>, Stephen Flowers <sflowers1@gmail.com>,
	<yocto@yoctoproject.org>, <meta-ti@yoctoproject.org>
References: <54DA0258.9070108@gmail.com>
	<54DA12C7.8000000@windriver.com>	<54DA84F1.1080109@gmail.com>
	<54DADD75.5000809@windriver.com>	<54DB17E7.8070308@gmail.com>
	<54DB7455.4020402@windriver.com> <54DBF55D.3020001@ti.com>
In-Reply-To: <54DBF55D.3020001@ti.com>
X-Mailman-Approved-At: Fri, 13 Feb 2015 07:49:53 -0800
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
X-List-Received-Date: Thu, 12 Feb 2015 03:50:25 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-11 7:35 PM, William Mills wrote:
> + meta-ti
> Please keep meta-ti in the loop.
>
> [Sorry for the shorting.  Thunderbird keep locking up when I tried
> replay all in plain text to this message.]

Heh. I know the pain, the giant .configs can give it a fit.

>
> ~ 15-02-11, Stephen Flowers wrote:
>  > Thanks for your input.  Here are results of 1000 samples over a
>  > 10 second period:
>  >
>  > Interrupt response (microseconds)
>  > standard: min: 81, max:118, average: 84
>  > rt: min: 224, max: 289, average: 231
>  >
>  >Will share the .config later once I get on that machine.
>
> Steve I agree the numbers look strange.
> There may well be something funny for RT going on for BBB.
> TI is just starting to look into RT for BBB.
>
> I would like to see the cyclictest results under heavy system load for
> standard and RT kernels.  The whole point of RT is to limit the max
> latency when the system is doing *anything*.
>
> I am not surprised that the standard kernel has good latency when idle.
> As you add load (filessystem is usually a good load) you should see that
> max goes up a lot.
>
> Also, as Bruce says, some degradation of min and average and also
> general system throughput is expected for RT.  That is the trade-off.
> I still think the number you are getting for RT seem high but I don't
> know what your test is doing in detail.  (I did read your explanation.)
> cyclictest should give us a standard baseline.

Agreed.

Bruce

>
>
> On 02/11/2015 10:25 AM, Bruce Ashfield wrote:
>> On 15-02-11 03:50 AM, Stephen Flowers wrote:
>>>
>>> my bad, here is the patch set.
>>> As for load, only system idle load for the results I posted previously.
>>> Will run some cyclic test next.
>>
>> One thing that did jump out was the difference in config_hz, you
>> are taking a lot more ticks in the preempt-rt configuration. If
>> you run both at the same hz, or with no_hz enabled, it would be
>> interesting to see if there's a difference.
>>
>> Bruce


