Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A215EE01798
	for <meta-ti@yoctoproject.org>; Fri,  8 Nov 2013 09:15:03 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MVY00MQ1FW8JOO0@vms173015.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 08 Nov 2013 11:14:48 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 885CF20210; Fri,
	08 Nov 2013 12:14:32 -0500 (EST)
Date: Fri, 08 Nov 2013 12:14:32 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Richard Memory <richardfmemory@gmail.com>
Message-id: <20131108171432.GA24766@denix.org>
References: <CAOEu_tgyTtu=tZzU+b_z4FeGE2yRSO8aiNS_Fq3=2QPOuA5KTQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAOEu_tgyTtu=tZzU+b_z4FeGE2yRSO8aiNS_Fq3=2QPOuA5KTQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Fri, 08 Nov 2013 17:15:06 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Check this:
http://thread.gmane.org/gmane.linux.embedded.yocto.meta-ti/2951

On Fri, Nov 08, 2013 at 08:08:13AM -0700, Richard Memory wrote:
> Hi meta-ti email thread:
> 
> I am not sure this is the correct forum to ask this question, if not,
> possibly you could kindly redirect me to the correct forum? I browsed
> through the archives and I didn't immediately see any answer to my question
> (hopefully I didn't blatantly miss it).
> 
> I have a Panda Board ES. Using directions similar to those found at the
> following webpage:
> 
> http://processors.wiki.ti.com/index.php/How_to_Make_3_Partition_SD_Card
> 
> I successfully formatted my SD card (my card has a partition for boot and a
> partition for rootfs). I verified my SD card works with pandaboard images
> built from a downstream Yocto/OE distribution. My goal is to be able to
> boot my target with the official yocto from git.yotcoproject.org.
> 
> I am able to successfully build target images (MLO, U-boot, uImage, and
> rootfs), but the kernel built from bitbake sources obtained from
> git.yoctoproject.org fails to start.
> 
> I have tried the images a couple of times. I switch back and forth between
> downstream images (which always seem to work) and the images built from
> yoctoproject. In one case with the yoctoproject images, u-boot seemed to
> attempt to start the kernel. That is, I could see u-boot doing its thing at
> a serial terminal. But upon startup, the kernel just seems to die without
> any message of why. The LEDs stop flashing, the ethernet power has no
> power, etc. The images I built from the downstream yocto distrobution
> always seem to work without problem.
> 
> Step 1) git clone git://git.yoctoproject.org/poky poky
> 
> Step 2) git clone git://git.yoctoproject.org/meta-ti meta-ti
> 
> Step 3) source oe-init-build-env mypandaboard_build_dir
> 
> Step 4) Modify local.conf to use machine ?= "pandaboard"
> 
> Step 5) Modify BBLAYERS in bblayers.conf so that it can find the meta-ti
> layer.
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
> I have tried both the the master and dylan branches with the same results
> each time.
> 
> Any ideas what I might be doing wrong?
> 
> Thanks,
> Richard

> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


