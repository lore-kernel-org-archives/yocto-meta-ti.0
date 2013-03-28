Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64F21E014BD
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 14:56:15 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SLuDsb027322;
	Thu, 28 Mar 2013 16:56:13 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SLuDof031552;
	Thu, 28 Mar 2013 16:56:13 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Thu, 28 Mar 2013 16:56:13 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Ian Wisbon <ian.wisbon@timesys.com>
Thread-Topic: [meta-ti] OMAP5: Booting build output
Thread-Index: AQHOK8xUwOzseCB+eESalC9uG9viSpi7RADAgABanYD//8NDIIAAkn0A//+uFRCAAFY5AP//rL7w
Date: Thu, 28 Mar 2013 21:56:12 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594ADDAE@DLEE11.ent.ti.com>
References: <20130328115247.029b68ae@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
	<20130328122753.2b957cca@duckworth>
	<7D46E86EC0A8354091174257B2FED101594AD1C3@DLEE11.ent.ti.com>
	<20130328173448.1e541526@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ADCAC@DLEE11.ent.ti.com>
	<20130328175012.7f9533b3@duckworth>
In-Reply-To: <20130328175012.7f9533b3@duckworth>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 28 Mar 2013 21:56:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable


> -----Original Message-----
> From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
> Sent: Thursday, March 28, 2013 4:50 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] OMAP5: Booting build output
>=20
> Chase,
>=20
> I've got a 4-port USB serial adapter connected to my host, so, it
> enumerates as ttyUSB5 on my host.
>=20
> I'm connecting to the micro-USB port labeled DEBUG USB, and the
> LED
> indicating debug power is lit, screen /dev/ttyUSB5 115200

In the dmesg output you should see two ttyUSB devices enumerated when the F=
TDI is detected.  The first is the serial console.  I'm not sure about your=
 setup but if you have a 4 port serial adapter I would expect those are tty=
USB0 - ttyUSB3.  This would make the FTDI ttyUSB4.

The first thing we need is that you can see the serial console.  In some wa=
ys I wish this was like the beaglebone where you would see CCCCC when no SD=
 card is loaded to know your serial connection was working :(

>=20
> Applying power, LEDs D1 and D2 light blue, but otherwise, nothing
> lights; I don't see a link come up either on the eth port.

Ethernet won't work until later kernels.  I haven't tried the one Denys jus=
t updated to yet but ethernet is supposed to work there.

>=20
> On Thu, 28 Mar 2013 17:42:26 -0400
> "Maupin, Chase" <chase.maupin@ti.com> wrote:
>=20
> > > -----Original Message-----
> > > From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
> > > Sent: Thursday, March 28, 2013 4:35 PM
> > > To: Maupin, Chase
> > > Cc: meta-ti@yoctoproject.org
> > > Subject: Re: [meta-ti] OMAP5: Booting build output
> > >
> > > Chase,
> > >
> > > Thanks - I have mine set to the same:
> > >
> > > off-on-off-on
> > >
> > > and still no luck booting. I also tried the reverse just in
> case
> > > I was
> > > backwards/upside-down; despite the same SD card booting an
> OMAP4
> > > Panda,
> > > and replacing with OMAP5 MLO and u-boot.img, I see nothing on
> the
> > > console whatsoever. Not even a junk character implying an
> > > incorrect
> > > baudrate, etc. The USBBOOT functionality seems to work, so I
> > > don't
> > > believe the board to be non-functional.
> >
> > Are you connected to ttyUSB0 or ttyUSB1?  For my board the
> serial is
> > ttyUSB0.
> >
> > >
> > > I'll sit tight for a while and see what else is committed.
> Thanks
> > > for
> > > your assistance!
> > >
> > >
> > > > >
> > > > > Does the SYSBOOT switch dictate whether the SD is used
> for
> > > > > booting? If
> > > > > so, what is the correct setting? I've previously
> attempted to
> > > > > boot
> > > > > using an SD card formatted as necessary for the OMAP4
> Panda,
> > > but
> > > > > have
> > > > > been unsuccessful - I assumed a similar FAT format would
> be
> > > > > required
> > > > > for MLO/u-boot.img
> > > >
> > > > My sysboot switch is off on off on and I'm booting from SD.
> > > >
> > > > You can use the same SD format at omap4.  Just replace the
> > > kerel and
> > > > bootloader, add the boot.scr and dtb file.
>=20
> Thanks,
>=20
>=20
> --
> ---
> Ian Wisbon
> Support Manager
> Timesys Corporation

