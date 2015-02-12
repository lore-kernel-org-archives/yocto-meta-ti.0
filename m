Return-Path: <sflowers1@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DDBBDE00824; Thu, 12 Feb 2015 14:05:21 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (sflowers1[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.212.176 listed in list.dnswl.org]
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3EB4DE00546;
	Thu, 12 Feb 2015 14:05:19 -0800 (PST)
Received: by mail-wi0-f176.google.com with SMTP id h11so7805192wiw.3;
	Thu, 12 Feb 2015 14:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Lzo4+ESdPEqXNkYwAq4JWjCPljG+WMxa4q8IXengzYQ=;
	b=ov7DFdAgkQlfH/JNT/JRbwToup5dSEfD32ipJuUNfhDIQ1sDeWI+pGPTsU6ivKf7gg
	NSBAnnLx42R6FNI84AfXbybQBC/RyVKBjXX2XiyHIk9NPdtdeegZ3aqAx394hJ/5MF9P
	0VqfJQMBf+bnFnPMveUjfse2CfHhYLtKnmTOd2NioM2/XXagoUFcJAn6OdCSiDTXjj9X
	+0fTKwx725q2jzyr+xFJ8e6fj6QDaPoax90yuLsavepGSJYEnNU661ZiyDGiBzSgW7Ar
	r6Nh87Ew9OnOqJo9xWTInXkBwC5FMbBIpd50GU121WD9ekCjDAL086DOVei67T6sILH5
	ksOQ==
X-Received: by 10.180.73.241 with SMTP id o17mr846959wiv.16.1423778718518;
	Thu, 12 Feb 2015 14:05:18 -0800 (PST)
Received: from [192.168.0.5] ([2.123.59.41])
	by mx.google.com with ESMTPSA id ha1sm220193wib.24.2015.02.12.14.05.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 12 Feb 2015 14:05:17 -0800 (PST)
Message-ID: <54DD2396.4000909@gmail.com>
Date: Thu, 12 Feb 2015 22:05:10 +0000
From: Stephen Flowers <sflowers1@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: William Mills <wmills@ti.com>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	yocto@yoctoproject.org, meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 12 Feb 2015 22:05:21 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


So I ran cyclictest with an idle system and loaded with multiple 
instances of cat /dev/zero > /dev/null &

#cyclictest -a 0 -p 99 -m -n -l 100000 -q

I ran this command as shown by Toyoka at the 2014 Linuxcon Japan 
[http://events.linuxfoundation.org/sites/events/files/slides/toyooka_LCJ2014_v10.pdf]
to compare against his results for the BBB.  I also threw in xenomai 
with kernel 3.8 for comparison.  For the standard kernel HR timers were 
disabled.

[idle]
preempt_rt: min 12 avg: 20 max: 59
standard: min: 8005 avg: 309985955 max: 619963985
xenomai: min: 8 avg: 16: max 803

[loaded]
preempt_rt: min 16 avg: 21 max: 47
standard: min: 15059 avg: 67769851 max: 135530885
xenomai: min: 10 avg: 15: max 839

Actually the preempt_rt results tie up pretty well with Toyooka above, 
leading me to conclude theres something off in my code that could be 
optimised - what do you guys think.
Also, I ran a test with preempt_rt at 100Hz and there was maybe 10% 
improvement in latency.

Steve

On 12/02/2015 00:35, William Mills wrote:
> + meta-ti
> Please keep meta-ti in the loop.
>
> [Sorry for the shorting.  Thunderbird keep locking up when I tried 
> replay all in plain text to this message.]
>
> ~ 15-02-11, Stephen Flowers wrote:
> > Thanks for your input.  Here are results of 1000 samples over a
> > 10 second period:
> >
> > Interrupt response (microseconds)
> > standard: min: 81, max:118, average: 84
> > rt: min: 224, max: 289, average: 231
> >
> >Will share the .config later once I get on that machine.
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
> As you add load (filessystem is usually a good load) you should see 
> that max goes up a lot.
>
> Also, as Bruce says, some degradation of min and average and also
> general system throughput is expected for RT.  That is the trade-off.
> I still think the number you are getting for RT seem high but I don't
> know what your test is doing in detail.  (I did read your explanation.)
> cyclictest should give us a standard baseline.
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


