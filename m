Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9C94AE0079B; Wed,  3 Sep 2014 18:59:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43B9FE004A0
	for <meta-ti@yoctoproject.org>; Wed,  3 Sep 2014 18:59:30 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa06-05.prod.phx3.secureserver.net with 
	id mpzU1o00E1mTNtu01pzV7W; Wed, 03 Sep 2014 18:59:30 -0700
Message-ID: <5407C780.5040801@pabigot.com>
Date: Wed, 03 Sep 2014 20:59:28 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: poor performance of OpenEmbedded on BeagleBoneBlack compared to Debian
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
X-List-Received-Date: Thu, 04 Sep 2014 01:59:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've been trying to figure out why OpenEmbedded on beaglebone is three 
times slower than Debian on the ray-tracing application described at:

http://scruss.com/blog/2013/09/23/beaglebone-black-slow-as-a-dog/

Part of it is due to meta-yocto-bsp's beaglebone config not enabling CPU 
frequency control (CONFIG_GENERIC_CPUFREQ_CPU0, 
CONFIG_VOLTAGE_DOMAIN_OMAP, and some THERMAL options).  That can be 
fixed for linux-yocto, and isn't an issue with linux-ti-staging, but it 
doesn't eliminate the discrepancies.

With debian, the sample program described in that blog posting runs this 
fast:

   debian@beaglebone:~$ g++ -Ofast -mfloat-abi=hard -o card card.cpp
   debian@beaglebone:~$ time ./card > /dev/null
   real    4m54.846s
   user    4m54.627s
   sys     0m0.057s

With poky master + meta-ti it runs this fast:

   root@beaglebone:~# time ./card > /dev/null
   real    9m37.901s
   user    9m37.200s
   sys     0m0.150s

Still nearly twice as slow.  (With linux-yocto and the default kernel 
configuration it's up around 14m.)

One anomaly I've found is the CPU frequency range.  On debian we have:

   debian@beaglebone:~$ cat 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
   300000 600000 800000 1000000

while on OE we have:

   root@beaglebone:~# cat 
/sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
   300000 600000 720000 800000

So OE isn't allowing the BeagleBoneBlack to run at its maximum speed.  
This isn't enough to explain a nearly 2x performance difference, but 
it's an issue I want resolved.

I've been unable to trace back where these frequencies come from. Could 
somebody tell me what configures the available frequencies for the 
AM335x in linux-ti-staging?

And if anybody has suggestions of where else to look for an explanation, 
I'd appreciate it.  I've tried all the gcc flags I can think of 
(-mcpu=cortex-a8, -mfpu=neon, -mfloat-abi=hard, etc), though I'm going 
to keep poking at it because I still suspect the problem is there.

Thanks.

Peter


