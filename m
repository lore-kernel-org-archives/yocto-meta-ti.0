Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 034D2E013D1
	for <meta-ti@yoctoproject.org>; Wed, 21 Aug 2013 19:46:18 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7M2kHWk009702;
	Wed, 21 Aug 2013 21:46:17 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7M2kH77023490;
	Wed, 21 Aug 2013 21:46:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 21 Aug 2013 21:46:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7M2kHIv010524;
	Wed, 21 Aug 2013 21:46:17 -0500
Date: Wed, 21 Aug 2013 22:46:16 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130822024616.GA25063@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Stumped. Can't get 2.6.37 TI kernel to boot when built with toolchain from denzil or Linaro gcc-linaro-arm-linux-gnueabihf-4.8-2013.07-1_linux/
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
X-List-Received-Date: Thu, 22 Aug 2013 02:46:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Aug 20, 2013 at 09:11:57PM -0700, Khem Raj wrote:
> 
> > First question.  I looked at my 
> > poky/meta/recipes-kernel/linux-libc-headers dir of a denzil checkout that 
> > last had c6a816x-evm support to use as kind of an example/guide.  I see 
> > recipes for linux-libc-headers_3.2.bb and linux-libc-headers_3.0.8.bb.  Do 
> > I need to create a recipe for 2.6.37 and set the SRC_URI for a 2.6.37 
> > commit so that my rootfs packages will be built against headers that match 
> > the version of the kernel I'm using?  It looked like 
> > linux-libc-headers.inc has some kind of check to decide on which headers 
> > to use (3 or 2.6) but I don't quite follow how it works yet.
> 
> yes you need to add a recipe for linux-libc-headers_2.6.37…. and also make 
> sure that your distro/machine chooses this for preferred provider for 
> linux-libc-headers

Well, if you use Dylan (or even Danny), it has a recipe already available in 
oe-core...


> > Second question.  When I try to bitbake core-image-minimal after adding in 
> > my kernel (a tar.bz2), it builds but the do_package phase gets errors:
> 
> > arm-oe-linux-gnueabi-objcopy:/home/hutch/oe_core_beagleboard/oe-core/build/tmp-eglibc/work/c6a816x_evm-oe-linux-gnueabi/linux-ti81xx-psp/2.6.37-r0/package/usr/src/kernel/image/usr/src/kernel/scripts/mod/mk_elfconfig: 
> > File format not recognized
> 
> what is that file ? can you run it through file cmd and find out what arch 
> its targeted for ? if its a host tool then remove it from install location

