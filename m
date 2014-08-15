Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 933DDE00563; Fri, 15 Aug 2014 07:10:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5674AE00543
	for <meta-ti@yoctoproject.org>; Fri, 15 Aug 2014 07:10:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7FEAeIu004357;
	Fri, 15 Aug 2014 09:10:40 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7FEAeK3015590;
	Fri, 15 Aug 2014 09:10:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 15 Aug 2014 09:10:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7FEAdG6006615;
	Fri, 15 Aug 2014 09:10:39 -0500
Date: Fri, 15 Aug 2014 10:10:39 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Diego Sueiro <diego.sueiro@gmail.com>
Message-ID: <20140815141039.GZ23523@edge>
References: <53ED13BE.2090809@pseudoterminal.org> <20140814200450.GX23523@edge>
	<53ED175D.2090502@pseudoterminal.org> <20140814202056.GY23523@edge>
	<CAMCfZKFjnbxbMcEXwesGxDp1r88aSn_JgY33c0YVR0hv0K18Cw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMCfZKFjnbxbMcEXwesGxDp1r88aSn_JgY33c0YVR0hv0K18Cw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: BeagleBone Black , u-boot, and zImage
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
X-List-Received-Date: Fri, 15 Aug 2014 14:10:51 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 15, 2014 at 06:47:12AM -0300, Diego Sueiro wrote:
> Carlos,
> 
> On Thu, Aug 14, 2014 at 5:20 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> 
> > On Thu, Aug 14, 2014 at 10:09:01PM +0200, Carlos Rafael Giani wrote:
> > > On 08/14/2014 10:04 PM, Denys Dmytriyenko wrote:
> > > >On Thu, Aug 14, 2014 at 09:53:34PM +0200, Carlos Rafael Giani wrote:
> > > >>Hello,
> > > >>
> > > >>after building a rootfs for the Beaglebone Black, I see the
> > > >>following files in the deploy folder for the machine:
> > > >>
> > > >>MLO
> > > >>u-boot.img
> > > >>u-boot-spl.bin
> > > >>zImage
> > > >>
> > > >>as well as other symlinks with "-beaglebone" attached to their
> > filenames.
> > > >>
> > > >>What should I copy, the SPL bin, or the .img u-boot binary?
> > > >>Also, u-boot tries to load a uImage, even though a zImage was built.
> > > >>There is also no uEnv.txt file.
> > > >>Do I have to write one to be able to let u-boot load the zImage, or
> > > >>should it work out-of-the-box?
> > > >Depends on the rootfs image you are building. Most images that are
> > based on
> > > >core-image-base will take care of deploying necessary pieces into the
> > rootfs.
> > > >But core-image-minimal is special and very bare-bone, so extra manual
> > steps
> > > >are required.
> > > >
> > > >Regardless of the rootfs image, you'd need MLO and u-boot.img to be
> > located in
> > > >the first FAT partition of your SD card or eMMC flash.
> > > >
> > > >Then, if your rootfs does not already have zImage and the necessary DTB
> > files
> > > >in the /boot directory, you have to place them there (i.e.
> > core-image-minimal)
> > > >and you are ready to boot. All the defaults will work for
> > out-of-the-box in
> > > >this case. No uEnv.txt is necessary, unless you need to do something
> > extra
> > > >special...
> > > >
> > >
> > > Oh, I just built core-image-base .
> > >
> > > So I should use the .img and not the SPL .bin? I was wondering if
> > > the SPL bin is a newer binary that will eventually replace the .img
> > > one.
> > >
> > > But when I use the .img file, it turns out that it tries to load a
> > > uImage, even though a zImage was built. Simply setting the bootfile
> > > env var to "zImage" won't work, because the u-boot script will try
> > > to boot with the incorrect command.
> > >
> > > I am trying to rule out that something went wrong in my build, that
> > > something is wrong in my setup. If I build core-image-base , the
> > > resulting u-boot.img should automatically load a zImage, not a
> > > uImage, correct?
> >
> > u-boot-spl.bin, while named weird, is a special SPL binary (i.e. MLO) for
> > UART
> > booting - loading u-boot and the rest over serial. They are similar in
> > sizes
> > with MLO...
> >
> > The real u-boot.img should boot zImage by default - make sure you are
> > building
> > the correct one from meta-ti. The one named u-boot-ti-staging is preferred,
> > but u-boot_2014.07 should also be fine.
> 
> 
> Here you have some instructions on how to "cook" an sdcard for beaglebone
> black:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/README.hardware

Well, that README I wrote specifically for Poky and meta-yocto-bsp. And Carlos 
was looking for meta-ti specifics. The instructions are mostly similar, but 
require adjusting for things like uImage vs. zImage and such...

-- 
Denys

