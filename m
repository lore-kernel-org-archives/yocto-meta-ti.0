Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A8073E00D55; Fri, 20 May 2016 13:50:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BE4CE00D1E
	for <meta-ti@yoctoproject.org>; Fri, 20 May 2016 13:50:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4KKoNrx003363;
	Fri, 20 May 2016 15:50:23 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4KKoNp3016215;
	Fri, 20 May 2016 15:50:23 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 20 May 2016 15:50:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4KKoLHv004531;
	Fri, 20 May 2016 15:50:22 -0500
Date: Fri, 20 May 2016 16:50:05 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Keith Kyzivat <kamaji@gmail.com>
Message-ID: <20160520205004.GH3287@edge>
References: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAH5ySac1VscW4vszpXbj4zw5vDZhCovVyxtnLKn59k=8JjVp5Q@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Rename of omap5-sgx-ddk-um-linux to ti-sgx-ddk-um not complete?
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
X-List-Received-Date: Fri, 20 May 2016 20:50:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, May 19, 2016 at 11:41:10PM +0000, Keith Kyzivat wrote:
> Hi folks,
> 
> I've been trying to get a beagleboard krogoth build working with working
> OpenGLES2 DRI drivers in place, and have been failing.
> 
> I did find out that drivers changed name from libgles-omap3 to
> ti-sgx-ddk-um - but specifying ti-sgx-ddk-um as my
> PREFERRED_PROVIDER_virtual/libgles2 fails hard --
>  -- Nothing RPROVIDES 'ti-sgx-ddk-um'
> 
> Digging through commits, I found commit c70102c671 -
> renaming omap5-sgx-ddk-um-linux to ti-sgx-ddk-um.
> 
> The problem seems to be that these are renamed, but the package names have
> not changed -- recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> includes:

Keith,

The rename is complete and correct and works as expected. 


> PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2
> omap5-sgx-ddk-um-linux"
> 
> Shouldn't this be the following?
> PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 ti-sgx-ddk-um"

No, the way it is now is correct - it doesn't need to include ti-sgx-ddk-um in 
PROVIDES list, as that's already the name of the package. The reason it 
includes the old omap5-sgx-ddk-um-linux name is to ensure upgradeability path 
from the old name of the package.


> And also RPROVIDES, RREPLACES, RCONFLICTS and associated -dev, -dbg
> packages?

Same as above. Moreover, adding own name into RREPLACES and RCONFLICTS would 
be problematic, as it would mean it replaces and conflicts with itself.


> Apologies if I'm asking this wrong - I'm pretty new to Yocto/OE and still
> figuring it all out.


Now, as to your problem. Which exact platform are you trying it on? I see you 
mention beagleboard, so if it is really an old OMAP3-based BeagleBoard and not 
the new AM335x-based BeagleBone, then it simply is not supported. Currently 
supported platforms by the new SGX components are am335x/ti33x, am437x/am43x 
and j6/dra7xx/am57x:

http://git.ti.com/gitweb/?p=graphics/omap5-sgx-ddk-um-linux.git;a=tree;f=targetfs;h=76a04f848bfa75a7e157e5d1b14e518380f8ec70;hb=refs/heads/ti-img-sgx/1.14.3699939

For old OMAP3 platforms, you'd still need libgles-omap3, which, unfortunately, 
hasn't been updated to recent 4.x kernel and therefore was dropped in krogoth.

-- 
Denys

