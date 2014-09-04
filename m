Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D1DD7E007C1; Thu,  4 Sep 2014 03:46:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.192.106 listed in list.dnswl.org]
Received: from p3plsmtpa06-05.prod.phx3.secureserver.net
	(p3plsmtpa06-05.prod.phx3.secureserver.net [173.201.192.106])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74A3DE0079A
	for <meta-ti@yoctoproject.org>; Thu,  4 Sep 2014 03:46:41 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-05.prod.phx3.secureserver.net with 
	id mymf1o00E1mTNtu01ymfJ9; Thu, 04 Sep 2014 03:46:40 -0700
Message-ID: <5408430F.1000306@pabigot.com>
Date: Thu, 04 Sep 2014 05:46:39 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Robert Nelson <robertcnelson@gmail.com>
References: <5407C780.5040801@pabigot.com>
	<CAOCHtYhyBZs512mArExutSkK6Y_HPpeCNaUeuvJre22zyZ82PQ@mail.gmail.com>
In-Reply-To: <CAOCHtYhyBZs512mArExutSkK6Y_HPpeCNaUeuvJre22zyZ82PQ@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: poor performance of OpenEmbedded on BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 10:46:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2014 09:46 PM, Robert Nelson wrote:
> On Wed, Sep 3, 2014 at 8:59 PM, Peter A. Bigot <pab@pabigot.com> wrote:
>> I've been trying to figure out why OpenEmbedded on beaglebone is three times
>> slower than Debian on the ray-tracing application described at:
>>
>> http://scruss.com/blog/2013/09/23/beaglebone-black-slow-as-a-dog/
>>
>> Part of it is due to meta-yocto-bsp's beaglebone config not enabling CPU
>> frequency control (CONFIG_GENERIC_CPUFREQ_CPU0, CONFIG_VOLTAGE_DOMAIN_OMAP,
>> and some THERMAL options).  That can be fixed for linux-yocto, and isn't an
>> issue with linux-ti-staging, but it doesn't eliminate the discrepancies.
>>
>> With debian, the sample program described in that blog posting runs this
>> fast:
>>
>>    debian@beaglebone:~$ g++ -Ofast -mfloat-abi=hard -o card card.cpp
>>    debian@beaglebone:~$ time ./card > /dev/null
>>    real    4m54.846s
>>    user    4m54.627s
>>    sys     0m0.057s
>>
>> With poky master + meta-ti it runs this fast:
>>
>>    root@beaglebone:~# time ./card > /dev/null
>>    real    9m37.901s
>>    user    9m37.200s
>>    sys     0m0.150s
> This seems very odd, what version of g++ do you have on poky?

4.9.1, also nothing special.

Peter

>
> On debian wheezy, we have the old:
>
> gcc version 4.6.3 (Debian 4.6.3-14)
>
> Which really doesn't have any of the linaro special sauce..
>
> Regards,
>


