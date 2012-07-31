Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1B19E002A8
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 20:51:57 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [96.240.136.247])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M8000HUBAQLWEC1@vms173005.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 30 Jul 2012 22:51:57 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DDA55201BB; Mon,
	30 Jul 2012 23:51:56 -0400 (EDT)
Date: Mon, 30 Jul 2012 23:51:56 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: joshua.marinacci@nokia.com
Message-id: <20120731035156.GB7856@denix.org>
References: <9D64B6CF-0B94-413C-89A4-D9A55DB38AF1@nokia.com>
	<CA+2YH7sLFSnRJ4RAUGj=V=BbGpE-3pB79sxm33O_RXCSqWC8Tw@mail.gmail.com>
	<40A10ADC-FEF3-4292-8C02-F50825A59D4A@nokia.com>
	<20120730194207.GA23003@edge>
	<1DDA99E7-9D0B-42DF-977F-EC15832B6795@nokia.com>
MIME-version: 1.0
In-reply-to: <1DDA99E7-9D0B-42DF-977F-EC15832B6795@nokia.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: Gumstix Wifi
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
X-List-Received-Date: Tue, 31 Jul 2012 03:51:57 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Jul 31, 2012 at 12:31:10AM +0000, joshua.marinacci@nokia.com wrote:
> Incidentally, I don't get all of the kernel boot messages when my gumstix 
> boots.  It says 
> 
> Starting kernel ...
> 
> Uncompressing Linux... done, booting the kernel.
> 
> Yocto (Built by Poky 7.0) 1.2+snapshot-20120730 overo ttyO2
> 
> overo login:
> 
> 
> And then I'm at the login prompt.  I'm assuming there is some boot setting 
> which controls this? All of the messages are showing up in 
> /var/log/messages, however.

What's your "bootargs" variable in u-boot? Does it contain "quiet"? Does it 
have the proper console settings?

-- 
Denys


> On Jul 30, 2012, at 12:42 PM, ext Denys Dmytriyenko wrote:
> 
> > On Mon, Jul 30, 2012 at 07:10:23PM +0000, joshua.marinacci@nokia.com wrote:
> >> Hmm. I don't see to have depmod installed.  Perhaps that is part of my 
> >> problem. What package would I need to add to the minimal-core-image to get 
> >> that?
> > 
> > Josh,
> > 
> > core-image-minimal uses busybox for tools like insmod and modprobe. The 
> > default configuration for busybox does not have depmod enabled. As of 
> > module-init-tools, they are being built, but not installed on the filesystem. 
> > So, you can either modify busybox config to enable depmod, or add 
> > module-init-tools-depmod package to your filesystem. The new way is to use 
> > kmod, which is available in oe-core master, or meta-oe in denzil. But oe-core 
> > master setup is broken for me at the moment, so I can't verify that kmod is 
> > included. At least it's not listed in the image/task...
> > 
> > Denys
> > 
> > 
> >> On Jul 30, 2012, at 1:07 AM, ext Enrico wrote:
> >> 
> >>> On Sat, Jul 28, 2012 at 9:30 PM,  <joshua.marinacci@nokia.com> wrote:
> >>>> This does work. When I boot the wpa stuff is included but I still don't have a network driver loaded.  If I include the built modules-3.2.19-r0-overo.tgz in my rootfs I can cd into the directory with all of the modules.  However insmod libertas.ko fails with
> >>>> 
> >>>>       insmod: can't insert 'libertas_tf_usb.ko': unknown symbol in module, or unknown parameter
> >>>> 
> >>>> and modprobe fails with
> >>>> 
> >>>>       modprobe: module libertas not found in modules.dep
> >>>> 
> >>>> 
> >>>> So, what should I do to make sure the libertas module is compiled correctly, included in my kernel, and then actually used at runtime?
> >>> 
> >>> try with "depmod -a" (this must be done only once after you untar the
> >>> modules) before modprobe libertas.
> >>> 
> >>> I am not sure but i think it was "modprobe libertas_sdio", try that
> >>> too. And of course you will need the libertas firmware
> >>> (sd8686....bin).
> >>> 
> >>> Enrico
> >> 
> >> _______________________________________________
> >> meta-ti mailing list
> >> meta-ti@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-ti
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

