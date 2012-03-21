Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 851CAE0059A
	for <meta-ti@yoctoproject.org>; Wed, 21 Mar 2012 15:12:44 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M1900LY39OWBUS0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 21 Mar 2012 17:12:33 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C9A532018B; Wed,
	21 Mar 2012 18:12:32 -0400 (EDT)
Date: Wed, 21 Mar 2012 18:12:32 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Marco Monguzzi <marco.monguzzi@gmail.com>
Message-id: <20120321221232.GE6857@denix.org>
References: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CALKp9+Z+pk6GZR2UPwToxCLGsKw0FO-Jj4nOnXEocSfFWwZBzg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, denys@ti.com, k-kooi@ti.com
Subject: Re: question on meta-ti for yocto
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
X-List-Received-Date: Wed, 21 Mar 2012 22:12:44 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Mar 21, 2012 at 03:58:44PM +0100, Marco Monguzzi wrote:
> Dear Sirs,
> 
> I am dumping this mail to ask for some clarifications. I am looking closely

First of all, _dumping_ here is a very correct word, as you neglected 
subscribing to the mailing list, check the past archives and see if your 
question was previously answered, as required by Netiquette.


> to yocto as environment for
> building embedded linux distro for omap based boards.
> 
> In particular, I do have AM3517 and DM3730 custom boards to support.
> 
> I am seeing that TI has made available meta-ti on yocto git that looks like
> a good starting point for me.
> 
> But at same time the readme.txt does spot incompatibilities with the
> current yocto structure and points
> to open embeded and angstron layers.

I'm finishing my testing cycle to confirm that Angstrom layer is no longer 
mandated. I should have edited the README right after the hard dependency was 
removed, but I wanted first to do the extensive testing against oe-core, 
meta-arago and then meta-yocto. Unfortunately, meta-yocto testing is lagging 
behind. But it works fine with oe-core WITHOUT meta-angstrom and also I'm 
working on bringing up our own meta-arago. Working with oe-core in a 
distro-less configuration should qualify as being Yocto-compatible!


> I am confused. When do you plan full compatibility with yocto?
> 
> Would the gcc-4.5 toolchain grant full compatibility with neon?

Yes.


> I am asking this because other players such as Denx (with its own ELDK
> www.denx.de) are providing an armv7a based on gcc-4.6
> that I could test with "CFLAGS= -march=armv7-a -fno-tree-vectorize
> -mthumb-interwork -mfloat-abi=softfp -mfpu=neon"
> and observe operating fine on AM3517.

We have some build issues with gcc-4.6, hence sticking to 4.5 for a while 
longer. In most cases, especially for base BSP, gcc-4.6 should work just fine 
though.


> I am wondering what is the best way to go:
> 
> - attempt integrating meta-ti with yocto for portions I need (davinci
> support for sure on DM3730)

DM3730 is not davinci, it's "OMAP". So it's linux-omap kernel tree and not 
linux-davinci. If you are talking about DSP side, that's different, while uses 
some of the same components, like dsplink/syslink, xdc etc. I have on my TODO 
list to extract those from base BSP support into something called "extras", so 
it won't impede people trying to start with the base BSP...


> - or stick with meta-ti as it is and develop my own recipes for custom hw
> as meta-ti bsp.

Either way is fine at this point. Please note, that I only tested meta-ti 
against oe-core as of now, my testing of it against meta-yocto is not 
finished. And, here's the confusion that Koen implied and Richard didn't like:

Yocto = oe-core
Poky = meta-yocto

Our goal is to support using meta-ti with any OE distro - meta-angstrom, 
meta-arago and meta-yocto/poky, as well as in a distro-less environment, i.e. 
with oe-core only.

-- 
Denys

