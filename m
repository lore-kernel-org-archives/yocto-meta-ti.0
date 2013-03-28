Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A8CEE014C1
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 15:11:09 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SMB44j019105;
	Thu, 28 Mar 2013 17:11:05 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SMB41O016999;
	Thu, 28 Mar 2013 17:11:04 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 28 Mar 2013 17:11:04 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r2SMB4HW011776;
	Thu, 28 Mar 2013 17:11:04 -0500
Date: Thu, 28 Mar 2013 18:11:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130328221103.GH23022@edge>
References: <20130328115247.029b68ae@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
	<20130328122753.2b957cca@duckworth>
	<7D46E86EC0A8354091174257B2FED101594AD1C3@DLEE11.ent.ti.com>
	<20130328173448.1e541526@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ADCAC@DLEE11.ent.ti.com>
	<20130328175012.7f9533b3@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ADDAE@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101594ADDAE@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: OMAP5: Booting build output
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
X-List-Received-Date: Thu, 28 Mar 2013 22:11:09 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 28, 2013 at 09:56:12PM +0000, Maupin, Chase wrote:
> 
> > -----Original Message-----
> > From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
> > Sent: Thursday, March 28, 2013 4:50 PM
> > To: Maupin, Chase
> > Cc: meta-ti@yoctoproject.org
> > Subject: Re: [meta-ti] OMAP5: Booting build output
> > 
> > Chase,
> > 
> > I've got a 4-port USB serial adapter connected to my host, so, it
> > enumerates as ttyUSB5 on my host.
> > 
> > I'm connecting to the micro-USB port labeled DEBUG USB, and the
> > LED
> > indicating debug power is lit, screen /dev/ttyUSB5 115200
> 
> In the dmesg output you should see two ttyUSB devices enumerated when the 
> FTDI is detected.  The first is the serial console.  I'm not sure about your 
> setup but if you have a 4 port serial adapter I would expect those are 
> ttyUSB0 - ttyUSB3.  This would make the FTDI ttyUSB4.
> 
> The first thing we need is that you can see the serial console.  In some 
> ways I wish this was like the beaglebone where you would see CCCCC when no 
> SD card is loaded to know your serial connection was working :(
> 
> > Applying power, LEDs D1 and D2 light blue, but otherwise, nothing
> > lights; I don't see a link come up either on the eth port.
> 
> Ethernet won't work until later kernels.  I haven't tried the one Denys just 
> updated to yet but ethernet is supposed to work there.

But with that we are hearing reports the DSS is broken... :(

-- 
Denys


> > On Thu, 28 Mar 2013 17:42:26 -0400
> > "Maupin, Chase" <chase.maupin@ti.com> wrote:
> > 
> > > > -----Original Message-----
> > > > From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
> > > > Sent: Thursday, March 28, 2013 4:35 PM
> > > > To: Maupin, Chase
> > > > Cc: meta-ti@yoctoproject.org
> > > > Subject: Re: [meta-ti] OMAP5: Booting build output
> > > >
> > > > Chase,
> > > >
> > > > Thanks - I have mine set to the same:
> > > >
> > > > off-on-off-on
> > > >
> > > > and still no luck booting. I also tried the reverse just in
> > case
> > > > I was
> > > > backwards/upside-down; despite the same SD card booting an
> > OMAP4
> > > > Panda,
> > > > and replacing with OMAP5 MLO and u-boot.img, I see nothing on
> > the
> > > > console whatsoever. Not even a junk character implying an
> > > > incorrect
> > > > baudrate, etc. The USBBOOT functionality seems to work, so I
> > > > don't
> > > > believe the board to be non-functional.
> > >
> > > Are you connected to ttyUSB0 or ttyUSB1?  For my board the
> > serial is
> > > ttyUSB0.
> > >
> > > >
> > > > I'll sit tight for a while and see what else is committed.
> > Thanks
> > > > for
> > > > your assistance!
> > > >
> > > >
> > > > > >
> > > > > > Does the SYSBOOT switch dictate whether the SD is used
> > for
> > > > > > booting? If
> > > > > > so, what is the correct setting? I've previously
> > attempted to
> > > > > > boot
> > > > > > using an SD card formatted as necessary for the OMAP4
> > Panda,
> > > > but
> > > > > > have
> > > > > > been unsuccessful - I assumed a similar FAT format would
> > be
> > > > > > required
> > > > > > for MLO/u-boot.img
> > > > >
> > > > > My sysboot switch is off on off on and I'm booting from SD.
> > > > >
> > > > > You can use the same SD format at omap4.  Just replace the
> > > > kerel and
> > > > > bootloader, add the boot.scr and dtb file.
> > 
> > Thanks,
> > 
> > 
> > --
> > ---
> > Ian Wisbon
> > Support Manager
> > Timesys Corporation
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

