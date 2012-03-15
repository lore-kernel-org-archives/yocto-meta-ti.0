Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (hermes.mlbassoc.com [64.234.241.98])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22C4FE011D1
	for <meta-ti@yoctoproject.org>; Thu, 15 Mar 2012 03:45:54 -0700 (PDT)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 74A22F8124A; Thu, 15 Mar 2012 04:45:53 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 97388F81249;
	Thu, 15 Mar 2012 04:45:52 -0600 (MDT)
Message-ID: <4F61C860.2030701@mlbassoc.com>
Date: Thu, 15 Mar 2012 04:45:52 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Jack Mitchell <ml@communistcode.co.uk>
References: <4F61C496.2070506@communistcode.co.uk>
In-Reply-To: <4F61C496.2070506@communistcode.co.uk>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 15 Mar 2012 10:45:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-03-15 04:29, Jack Mitchell wrote:
> Trying to compile the systemd-image from Angstrom for the BeagleBone this morning and I ran into a few errors, the first one being in meta-ti and u-boot related:
>
>     ERROR: Function failed: do_compile (see
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/temp/log.do_compile.18432 for further information)
>     NOTE: make CROSS_COMPILE=arm-angstrom-linux-gnueabi- all
>     for dir in tools examples/standalone examples/api arch/arm/cpu/armv7
>     /home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7/ ; do \
>     make -C $dir _depend ; done
>     make[1]: Entering directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>     make[1]: Nothing to be done for `_depend'.
>     make[1]: Leaving directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>     make[1]: Entering directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'
>     make[1]: Nothing to be done for `_depend'.
>     make[1]: Leaving directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/standalone'
>     make[1]: Entering directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'
>     make[1]: Nothing to be done for `_depend'.
>     make[1]: Leaving directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/examples/api'
>     make[1]: Entering directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>     make[1]: Nothing to be done for `_depend'.
>     make[1]: Leaving directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>     make[1]: Entering directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>     make[1]: Nothing to be done for `_depend'.
>     make[1]: Leaving directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/arch/arm/cpu/armv7'
>     make -C tools all
>     make[1]: Entering directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>     *make[1]: *** No rule to make target `/usr/lib/gcc/x86_64-unknown-linux-gnu/4.6.2/include/stddef.h', needed by `crc32.o'. Stop.*
>     make[1]: Leaving directory `/home/jack/angstrom/build/tmp-angstrom_2010_x-eglibc/work/beaglebone-angstrom-linux-gnueabi/u-boot-2011.09+git-r26/git/tools'
>     make: *** [tools] Error 2
>     ERROR: oe_runmake failed
>
> Could anyone shed any light on this?

What's your build host?

It looks like your host gcc has some install problems (that missing
file is part of the base installation, at least on Fedora)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

