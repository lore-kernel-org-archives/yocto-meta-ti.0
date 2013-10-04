Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C4DFE0161F
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 11:23:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r94INM45014041;
	Fri, 4 Oct 2013 13:23:22 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94INMKR009352;
	Fri, 4 Oct 2013 13:23:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 4 Oct 2013 13:23:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r94INLRt023811;
	Fri, 4 Oct 2013 13:23:21 -0500
Date: Fri, 4 Oct 2013 14:23:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Rudolf Streif <rstreif@linuxfoundation.org>
Message-ID: <20131004182321.GA3672@edge>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
	<CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Fri, 04 Oct 2013 18:23:25 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Rudi,

On Fri, Oct 04, 2013 at 10:29:21AM -0700, Rudolf Streif wrote:
> > Most likely u-boot couldn't find your DTB - did you put one in the /boot of
> > rootfs? Didn't u-boot complain about it? Should have been an error message.
> >
> That is a question that I forgot to ask in my first e-mail. With 3.12 I
> would have expected a dtb to be built but it did not. The tmp/deploy/images
> directory only contains [1] but no dtb. Neither does the tar.gz for the
> rootfs but I would not expect it to. And no, u-boot did not complain about
> the device tree either. If it had built a dtb I would have put it in the
> FAT boot partition and told u-boot to load it in the bootargs.

FAT boot partition is no longer preferred place for kernel images and DTB 
files - U-boot now wants to see them in /boot directory of the rootfs.

Ok, let's debug why you are not getting any DTB files produced. There should 
be at least 3 of them for the case of am335x-evm, as it covers EVM, EVM-SK and 
BeagleBone.

Can you show me your bblayers.conf file, please?


> > BTW, if you are not comfortable with 3.12-rc being unstable, you can also
> > add
> > to your config:
> >
> > PREFERRED_VERSION_linux-ti-staging = "3.8%"
> >
> Yes, of course. I am ok with 3.12-rc. I was only surprised that the Dylan
> branch of the bsp layer would build a 3.12 kernel while the default for
> Poky Dylan is 3.8. Or maybe my assumption that a bsp for a particular YP
> release would use the same kernel as a default is incorrect.

First, Poky != Yocto, so there's no requirement on what kernel version a BSP 
should provide. Second, there are several options available for am335x - 3.2, 
3.8 and 3.12, so anyone can use the version they like.


> > It's called OMAP2+ and that's how kernel folks decided to call a
> > consolidated
> > config for most if not all TI platforms. Gone are the times when each
> > platform
> > had it's own config file - kernel folks don't allow that anymore. Anyway,
> > omap2plus is the right defconfig.
> >
> That's actually a great thing. (One of Linus' pet peeves, I suppose.) I
> only wish the name of the file would be more intuitive. It's not quite
> obvious that a file called omap2plus_defconfig is the correct file to
> configure a kernel for an AM335x CPU. A different file name and/or a
> comment in the file to what CPU's it applies would have been great.

I agree it would have been nice to get a better name, but historically we 
ended up with this one.

-- 
Denys

