Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 625F6E01846
	for <meta-ti@yoctoproject.org>; Fri,  8 Nov 2013 07:34:48 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id A0336F81240; Fri,  8 Nov 2013 08:34:47 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id BA4C9F8123F;
	Fri,  8 Nov 2013 08:34:46 -0700 (MST)
Message-ID: <527D04A4.7080503@mlbassoc.com>
Date: Fri, 08 Nov 2013 08:35:00 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CAOEu_tgyTtu=tZzU+b_z4FeGE2yRSO8aiNS_Fq3=2QPOuA5KTQ@mail.gmail.com>
In-Reply-To: <CAOEu_tgyTtu=tZzU+b_z4FeGE2yRSO8aiNS_Fq3=2QPOuA5KTQ@mail.gmail.com>
Subject: Re: Panda board build question
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
X-List-Received-Date: Fri, 08 Nov 2013 15:34:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2013-11-08 08:08, Richard Memory wrote:
> Hi meta-ti email thread:
>
> I am not sure this is the correct forum to ask this question, if not, possibly you could kindly redirect me to the correct forum? I browsed through the archives and I didn't
> immediately see any answer to my question (hopefully I didn't blatantly miss it).
>
> I have a Panda Board ES. Using directions similar to those found at the following webpage:
>
> http://processors.wiki.ti.com/index.php/How_to_Make_3_Partition_SD_Card
>
> I successfully formatted my SD card (my card has a partition for boot and a partition for rootfs). I verified my SD card works with pandaboard images built from a downstream
> Yocto/OE distribution. My goal is to be able to boot my target with the official yocto from git.yotcoproject.org <http://git.yotcoproject.org>.
>
> I am able to successfully build target images (MLO, U-boot, uImage, and rootfs), but the kernel built from bitbake sources obtained from git.yoctoproject.org
> <http://git.yoctoproject.org> fails to start.
>
> I have tried the images a couple of times. I switch back and forth between downstream images (which always seem to work) and the images built from yoctoproject. In one case with
> the yoctoproject images, u-boot seemed to attempt to start the kernel. That is, I could see u-boot doing its thing at a serial terminal. But upon startup, the kernel just seems to
> die without any message of why. The LEDs stop flashing, the ethernet power has no power, etc. The images I built from the downstream yocto distrobution always seem to work without
> problem.
>
> Step 1) git clone git://git.yoctoproject.org/poky <http://git.yoctoproject.org/poky> poky
>
> Step 2) git clone git://git.yoctoproject.org/meta-ti <http://git.yoctoproject.org/meta-ti> meta-ti
>
> Step 3) source oe-init-build-env mypandaboard_build_dir
>
> Step 4) Modify local.conf to use machine ?= "pandaboard"
>
> Step 5) Modify BBLAYERS in bblayers.conf so that it can find the meta-ti layer.
>
> Step 6) bitbake core-image-minimal
>
> This produces the following images:
>
> MLO-pandaboard-2011.12-r8, 32748 bytes
> u-boot-pandaboard-2011.12-r8.img, 187676 bytes
> uImage--3.4-r1a-pandaboard-20131107151820.bin, 4333856 bytes
> core-image-minimal-pandaboard-20131107151820.rootfs.tar.gz, 2308175 bytes
>
> I have tried both the the master and dylan branches with the same results each time.
>
> Any ideas what I might be doing wrong?

If you are using the stock Yocto setup, you are probably using GCC 4.8.x
Can you try using GCC 4.7.x?  Just add this line to your local.conf & rebuild:
   GCCVERSION ?= "4.7%"

A copy of the exact serial port output from U-Boot may help, as well as showing
what the boot settings (bootargs) are.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

