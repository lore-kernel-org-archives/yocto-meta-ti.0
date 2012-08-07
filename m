Return-Path: <richard.purdie@linuxfoundation.org>
Received: from tim.rpsys.net (93-97-173-237.zone5.bethere.co.uk
	[93.97.173.237])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E40FE011AD
	for <meta-ti@yoctoproject.org>; Tue,  7 Aug 2012 08:45:01 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77FiuuS012784;
	Tue, 7 Aug 2012 16:44:56 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 12085-07; Tue,  7 Aug 2012 16:44:52 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q77Fil3j012778
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 7 Aug 2012 16:44:48 +0100
Message-ID: <1344354289.9756.276.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Date: Tue, 07 Aug 2012 16:44:49 +0100
In-Reply-To: <20120807153806.GC8716@edge>
References: <5020D9A0.30000@communistcode.co.uk> <20120807153016.GA8716@edge>
	<015A9197-70E1-4195-BA85-71097586D635@dominion.thruhere.net>
	<20120807153806.GC8716@edge>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: meta-ti@yoctoproject.org
Subject: Re: Turning off kernel config option
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
X-List-Received-Date: Tue, 07 Aug 2012 15:45:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2012-08-07 at 11:38 -0400, Denys Dmytriyenko wrote:
> On Tue, Aug 07, 2012 at 05:32:36PM +0200, Koen Kooi wrote:
> > 
> > Op 7 aug. 2012, om 17:30 heeft Denys Dmytriyenko <denys@ti.com> het volgende geschreven:
> > 
> > > On Tue, Aug 07, 2012 at 10:02:24AM +0100, Jack Mitchell wrote:
> > >> I am trying to turn of CONFIG_SPI_DEBUG in the beaglebone BSP from
> > >> meta-ti. I am using the poky distro configuration and I have changed
> > >> the defconfig in
> > >> meta-ti/recipes-kernel/linux/linux-ti33x-psp-3.2/beaglebone/defconfig
> > >> but it still builds with CONFIG_SPI_DEBUG enabled.
> > > 
> > > That should be the correct location, please make sure you re-do the unpack 
> > > task - if you previously built the kernel with the old defconfig, it will be 
> > > stored in the work directory and won't be copied from the repository above, 
> > > until you repeat the do_unpack task, i.e. by clenaing the build.
> 
> BTW, no need to clean the entire build, just the kernel build:
> 
> $ bitbake virtual/kernel -c clean
> 
> > Or just increment PR as you're supposed to, it's an output change after all. 
> > No need to check anything if you do it properly :) 
> 
> Well, but then you are staring to change the recipe, which might be overkill 
> for a simple defconfig change you want to test. If you go that route, you may 
> want to create your own custom layer with the modified defconfig overlayed on 
> top of meta-ti and a simple .bbappend with PRINC. That way your changes will 
> be detached from meta-ti and you won't need to merge the recipe changes every 
> time meta-ti updates... Although, there's no way to bbappend the defconfig 
> itself - that's where config fragments come to play.

With the recent changes to OE-Core, you can edit the defconfig, the
system will notice the checksum change and automatically rerun the
unpack and subsequent steps automagically.

If the PR server is enabled, it will bump PR for you too.

Cheers,

Richard



