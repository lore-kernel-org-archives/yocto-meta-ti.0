Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1B6BE0044D
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 05:05:04 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([99.241.91.63] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1S4Xb5-0002zV-FS; Mon, 05 Mar 2012 08:05:03 -0500
Date: Mon, 5 Mar 2012 08:04:48 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: Christian.Schulenberg@bmw.de
In-Reply-To: <EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
Message-ID: <alpine.DEB.2.02.1203050730440.30632@oneiric>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
	<EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
	<329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 05 Mar 2012 13:05:05 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  i'd like to try to reproduce what's below, so a few questions first.
is this for a regular panda, or a 4460-based panda ES?  i'm
specifically interested in the ES, but there's a good chance a regular
build will still at least boot and i'll worry about any weirdness
later.  and i don't see anything in the meta-ti layer yet
*specifically* for the 4460.

  FYI, my setup is 64-bit ubuntu 11.10 with fully pulled

  * yocto
  * meta-ti
  * meta-openembedded (with underlying meta-oe layer, of course)

  and now, the stupid questions ...

On Mon, 5 Mar 2012, Christian.Schulenberg@bmw.de wrote:

> Hi,
>
> finally, I managed to bring up the Pandaboard with the meta-ti layer
> by myself. For all of you, who are facing the same problems and who
> don't want to use Angstrom, here are some hints, how to do this just
> using Yocto Poky:
>
> Remove systemd in local.conf as mentioned above.

  i remember that issue and, rather than remove systemd, i followed
someone else's suggestion and just added the meta-oe layer to pull it
in.  here's my layers info, does it look sane?  (is that the correct
order to get the right precedence?)

BBLAYERS ?= " \
  /home/rpjday/yocto/git/meta \
  /home/rpjday/yocto/git/meta-yocto \
  /home/rpjday/yocto/git/meta-openembedded/meta-oe \
  /home/rpjday/yocto/git/meta-ti \
  "

if systemd is truly a problem, i can take it out.

> I used machine configuration for "omap4430-panda", because machine
> "pandaboard" did not build the kernel.  i suspect the "pandaboard"
> file will be disappearing given its superfluity.

i noticed that already, that's what i'll be using as well.

> Because this configuration use the sakoman bootloader, which caused
> some trouble for me, I switched over to (denx) u-boot.

  and you did that how?

> Use gcc4.5 instead of gcc4.6. The reason for this is a compiler
> error that came up when compiling the u-boot bootloader. You can
> change the compiler in ./meta/conf/distro/include/tcmode-default.inc
> , variable GCCVERSION. Another alternative might be patching the
> gcc4.6, because there is already a fix for this compiler error.

  based on what i read here:

http://www.mail-archive.com/openembedded-devel@lists.openembedded.org/msg24283.html

can i just add that line

GCCVERSION = "4.7%"

to my local.conf?  might as well jump up to gcc 4.7.

  and i currently get a fetch error for udev 173, so i set the
PREFERRED_VERSION to 181.  did you not get such an error?  more later.

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

