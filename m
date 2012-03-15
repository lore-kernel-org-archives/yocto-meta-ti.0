Return-Path: <ml@communistcode.co.uk>
Received: from tinyArch.localdomain (unknown [78.110.170.148])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24F4CE011D1
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 04:02:44 -0700 (PDT)
Received: from [192.168.0.26] (unknown [195.171.99.130])
	by tinyArch.localdomain (Postfix) with ESMTPSA id E1484270F5
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 10:33:01 +0000 (GMT)
Message-ID: <4F61CC63.6000305@communistcode.co.uk>
Date: Thu, 15 Mar 2012 11:02:59 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120314 Thunderbird/11.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <4F61C496.2070506@communistcode.co.uk>
	<4F61C860.2030701@mlbassoc.com>
In-Reply-To: <4F61C860.2030701@mlbassoc.com>
Subject: Re: u-boot failure
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Mar 2012 11:02:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/03/12 10:45, Gary Thomas wrote:
> On 2012-03-15 04:29, Jack Mitchell wrote:
>> Trying to compile the systemd-image from Angstrom for the BeagleBone 
>> this morning and I ran into a few errors, the first one being in 
>> meta-ti and u-boot related:
>>
>>     ERROR: Function failed: do_compile (see
>>     
>> /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/temp/log.do_compile.18432 
>> for further information)
>>     NOTE: make CROSS_COMPILE=arm-angstrom-linux-gnueabi- all
>>     for dir in tools examples/standalone examples/api arch/arm/cpu/armv7
>>     
>> /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7/ 
>> ; do \
>>     make -C $dir _depend ; done
>>     make[1]: Entering directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>>     make[1]: Nothing to be done for `_depend'.
>>     make[1]: Leaving directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>>     make[1]: Entering directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'
>>     make[1]: Nothing to be done for `_depend'.
>>     make[1]: Leaving directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'
>>     make[1]: Entering directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'
>>     make[1]: Nothing to be done for `_depend'.
>>     make[1]: Leaving directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'
>>     make[1]: Entering directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>>     make[1]: Nothing to be done for `_depend'.
>>     make[1]: Leaving directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>>     make[1]: Entering directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>>     make[1]: Nothing to be done for `_depend'.
>>     make[1]: Leaving directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>>     make -C tools all
>>     make[1]: Entering directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>>     *make[1]: *** No rule to make target 
>> `/usr/lib/gcc/x86_64-unknown-linux-gnu/4.6.2/include/stddef.h', 
>> needed by `crc32.o'. Stop.*
>>     make[1]: Leaving directory 
>> `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>>     make: *** [tools] Error 2
>>     ERROR: oe_runmake failed
>>
>> Could anyone shed any light on this?
>
> What's your build host?
>
> It looks like your host gcc has some install problems (that missing
> file is part of the base installation, at least on Fedora)
>

Ok, I fixed it thanks for the nudge in the right direction Gary!

I had updated my hosts GCC inbetween builds, so I performed -c 
cleasstate u-boot recompiled and it picked up my new GCC 4.6.3 
libraries, rather than the non-existant 4.6.2 libraries it was 
configured to use.

Cheers!

-- 

   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   http://www.embed.me.uk

--


