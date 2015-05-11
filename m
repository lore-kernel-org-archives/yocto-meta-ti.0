Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DF72AE00961; Mon, 11 May 2015 12:06:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94523E004F6;
	Mon, 11 May 2015 12:06:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4BJ61dt014438
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 May 2015 12:06:01 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 11 May 2015 12:06:00 -0700
Message-ID: <5550FD98.1050507@windriver.com>
Date: Mon, 11 May 2015 15:06:00 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Brian Hutchinson <b.hutchman@gmail.com>
References: <ce604c0c1a1d4131a72119dbecb97ab2@ASTRO-EX1.Bensberg.de>	<553F90A3.9070501@windriver.com>	<82ac67a7e46e416dbabdda01c42fc89a@ASTRO-EX1.Bensberg.de>	<553FD83A.6040407@windriver.com>	<4f2d75bf33ac423ab064f754e0b67655@ASTRO-EX1.Bensberg.de>	<5540DB34.6010102@windriver.com>	<a01714e680f8470cb21bb0b52e66c91e@ASTRO-EX1.Bensberg.de>	<55421DA2.9060909@windriver.com>	<e134e69a27bd460a9da71929a7f78d9a@ASTRO-EX1.Bensberg.de>	<554236CB.6000604@windriver.com>
	<CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
In-Reply-To: <CAFZh4h9oL7K-=Nxhy=GV0k31ZgnPQuhFLQ-r_fReSRk1ZRhk1g@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	=?UTF-8?B?IlNjaGF1bWzDtmZmZWwsIEphbiI=?= <J.Schaumloeffel@astro-kom.de>
Subject: Re: [yocto] Migration from 1.7.1 to 1.8 - kernel-abiversion missing
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
X-List-Received-Date: Mon, 11 May 2015 19:06:14 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-05-11 02:10 PM, Brian Hutchinson wrote:
> On Thu, Apr 30, 2015 at 10:06 AM, Bruce Ashfield
> <bruce.ashfield@windriver.com> wrote:
>> It is plausible. But in theory, linux-dummy should still provide
>> what you need (but since it doesn't build anything, there is
>> no abi .. and no modules can be built against it) .. so the
>> error isn't graceful.
>>
>> Bruce
>
> I can confirm this same problem is happening to me.  I just updated
> one of my builds from 1.7 to 1.8 and am also getting my rootfs to fail
> due to no abi kernel version:

We still have a race condition in the 1.8 branch for the population
of the build-artifacts directory.

If modules start building, they'll race against the population of the
abiversion, and you may see that message.

There's a proposed patch for master, but I don't think it is in
fido yet.

Bruce

>
> ERROR: No kernel-abiversion file found
> (/home/hutch/yocto_1.8_davinci/poky/build/tmp/sysroots/am180x-evm/pkgdata/kernel-depmod/kernel-abiversion),
> cannot run depmod, aborting
> ERROR: Function failed: do_rootfs
> ERROR: Logfile of failure stored in:
> /home/hutch/yocto_1.8_davinci/poky/build/tmp/work/am180x_evm-poky-linux-gnueabi/core-image-nodeam/1.0-r0/temp/log.do_rootfs.23558
> ERROR: Task 7 (/home/hutch/yocto_1.8_davinci/poky/meta/recipes-core/images/core-image-nodeam.bb,
> do_rootfs) failed with exit code '1'
>
> This is for an AM1808 build.  I'm using fido branch of yocto and
> openembedded and master of meta-ti (since it doesn't have a fido
> branch yet).
>
> STAGING_KERNEL_BUILDDIR="/home/hutch/yocto_1.8_davinci/poky/build/tmp/work-shared/am180x-evm/kernel-build-artifacts"
>
> I didn't do anything different in my local.conf than what I normally
> do.  linux-dummy was also built with my last yocto 1.7 build and it
> didn't have this problem.
>
> Regards,
>
> Brian
>


