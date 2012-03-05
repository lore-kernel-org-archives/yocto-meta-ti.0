Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 699C2E01374
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 12:30:12 -0800 (PST)
Received: from gandalf.denix.org ([unknown] [71.178.225.66])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M0F009RLI9LGJC4@vms173019.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Mon, 05 Mar 2012 14:29:51 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 93800200AB; Mon,
	05 Mar 2012 15:29:45 -0500 (EST)
Date: Mon, 05 Mar 2012 15:29:45 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-id: <20120305202945.GA2030@denix.org>
References: <329D2F11-A3FF-4029-8F3D-EC6A7587D138@dominion.thruhere.net>
	<EF446FF9DAC93B479C74AB9153DE173F0C154AC2@SMUCM08V.europe.bmw.corp>
	<EF446FF9DAC93B479C74AB9153DE173F0C280116@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203050730440.30632@oneiric>
	<EF446FF9DAC93B479C74AB9153DE173F0C2806AF@SMUCM08V.europe.bmw.corp>
	<alpine.DEB.2.02.1203051138060.14598@oneiric>
	<4F54ED21.9000208@mlbassoc.com> <20120305165844.GE14417@denix.org>
	<alpine.DEB.2.02.1203051212100.15878@oneiric>
	<AD1E46F4-9CEA-4FBA-AB1C-255FCD2E258A@dominion.thruhere.net>
MIME-version: 1.0
In-reply-to: <AD1E46F4-9CEA-4FBA-AB1C-255FCD2E258A@dominion.thruhere.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Mon, 05 Mar 2012 20:30:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Mar 05, 2012 at 06:15:54PM +0100, Koen Kooi wrote:
> 
> >>> Yes, you'll also get a newer kernel (3.0.2 last I looked, not 2.6.35)
> >> 
> >> FYI, there is already 3.1 for Panda in meta-ti with -1 D_P...
> > 
> >  ok, i can see the new content and i just pulled into meta-ti and
> > meta-openembedded.  so, starting all over again, is there now a
> > known recipe for building for the panda with a minimum of
> > customziation?
> 
> Yes, use the setup-scripts mentioned in the wiki, zero customization needed.

Anyone else is seeing this on Panda's 3.1 kernel in do_install? Using GNU make 
3.82, but seems SECONDEXPANSION with PHONY rules don't work...

...
  INSTALL sound/usb/caiaq/snd-usb-caiaq.ko
  INSTALL sound/soc/codecs/snd-soc-wm9081.ko
  INSTALL sound/usb/snd-usb-audio.ko
  INSTALL sound/usb/snd-usbmidi-lib.ko
  INSTALL sound/usb/misc/snd-ua101.ko
  MKDIR   /OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboard-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/emi26/
  MKDIR   /OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboard-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/emi62/
make[1]: *** No rule to make target `/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboard-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/./', needed by `/OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboard-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/ti_3410.fw'.  Stop.
make[1]: *** Waiting for unfinished jobs....
  MKDIR   /OE/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglibc/work/pandaboard-angstrom-linux-gnueabi/linux-omap4-3.1.0-r1/image/lib/firmware/kaweth/
make: *** [_modinst_post] Error 2
ERROR: oe_runmake failed

-- 
Denys

