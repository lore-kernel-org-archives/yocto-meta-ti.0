Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C549E00406
	for <meta-ti@yoctoproject.org>; Thu, 22 Aug 2013 11:54:47 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7MIskVB029891;
	Thu, 22 Aug 2013 13:54:46 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MIskFk006129;
	Thu, 22 Aug 2013 13:54:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 22 Aug 2013 13:54:45 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7MIsjBa004363;
	Thu, 22 Aug 2013 13:54:45 -0500
Date: Thu, 22 Aug 2013 14:54:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Message-ID: <20130822185445.GD25749@edge>
References: <CAFZh4h_683cetV7QjyVgBcsJ9Seooy5wiE8R-fU9L+sqJanU4g@mail.gmail.com>
	<CAFZh4h8gDV9r6PzrANuj4ZWJCnpibh5DtK4OmoYqwO_vAdY-_g@mail.gmail.com>
	<CAFZh4h8ncW+-UskiqTAOSXFyDvN5Rc+bnj=ykGfXRZYPRbbgrA@mail.gmail.com>
	<CAMKF1sqb8smKgKM8wCyb5cbcdcbqphBBi0dhsZHo9j_-MMeUqg@mail.gmail.com>
	<CAFZh4h-OBDoeWFWpMLng8Uw6HEidMoWJtQvwdP9SjPwaci9O0Q@mail.gmail.com>
	<3BD5B47E-982D-4E04-9FF8-276A83B3DFD9@gmail.com>
	<20130822024616.GA25063@edge>
	<CAFZh4h9Ru3iED9ASmxqs14Pve+foh3gg15OBnVtfNR-B_b1rMQ@mail.gmail.com>
	<CAFZh4h8avM4+=5zDuB_6N4bJL5jLKaUPSi8VK66d1+NunaZx+w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFZh4h8avM4+=5zDuB_6N4bJL5jLKaUPSi8VK66d1+NunaZx+w@mail.gmail.com>
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
X-List-Received-Date: Thu, 22 Aug 2013 18:54:48 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Aug 22, 2013 at 02:41:17PM -0400, Brian Hutchinson wrote:
> On Thu, Aug 22, 2013 at 11:23 AM, Brian Hutchinson <b.hutchman@gmail.com>wrote:
> 
> > On Wed, Aug 21, 2013 at 10:46 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> >
> >>
> >>
> >> Well, if you use Dylan (or even Danny), it has a recipe already available
> >> in
> >> oe-core...
> >>
> >>
> > Yes, I found this one that Khem added checksums to and used web git to
> > cherry pick it out:
> >
> > http://cgit.openembedded.org/openembedded-core/commit/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb?h=dylan&id=370e082c8bbf14c9b0f54269eb99d291d187cd40
> >
> >
> >
> OK, I don't know if I did this right or not but now I have a
> linux-libc-headers_2.6.37.2.bb (from the web git link I mentioned before)
> file in my meta/recipes-kernel/linux-libc-headers directory.  In my
> local.conf I added LINUX_LIBC_HEADERS_VERSION = "2.6.37.2" but when I

You need something like this:

http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=61162abba3aa56057dfdfa8ae3a93c281aa2342a

There's no standard variable LINUX_LIBC_HEADERS_VERSION for that, AFAIK.

-- 
Denys


> bitbake core-image-minimal it doesn't look like it is rebuilding everything
> with the headers I specified.  If I look
> in build/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/linux-libc-headers
> all I see is 3.8-r0 so it doesn't look like it grabbed the 2.6.37 headers.
> 
> Did I go about this the wrong way?  I tried a bitbake -c cleanall
> core-image-minimal and that didn't appear to kick it in the pants and make
> it build everything over again with the new headers.
> 
> Regards,
> 
> Brian

