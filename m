Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C90F1E014BD
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 14:42:30 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SLgRjm002422;
	Thu, 28 Mar 2013 16:42:27 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SLgRvF015897;
	Thu, 28 Mar 2013 16:42:27 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 28 Mar 2013 16:42:26 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 28 Mar 2013 16:42:27 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Ian Wisbon <ian.wisbon@timesys.com>
Thread-Topic: [meta-ti] OMAP5: Booting build output
Thread-Index: AQHOK8xUwOzseCB+eESalC9uG9viSpi7RADAgABanYD//8NDIIAAkn0A//+uFRA=
Date: Thu, 28 Mar 2013 21:42:26 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594ADCAC@DLEE11.ent.ti.com>
References: <20130328115247.029b68ae@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
	<20130328122753.2b957cca@duckworth>
	<7D46E86EC0A8354091174257B2FED101594AD1C3@DLEE11.ent.ti.com>
	<20130328173448.1e541526@duckworth>
In-Reply-To: <20130328173448.1e541526@duckworth>
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
X-List-Received-Date: Thu, 28 Mar 2013 21:42:31 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Ian Wisbon [mailto:ian.wisbon@timesys.com]
> Sent: Thursday, March 28, 2013 4:35 PM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] OMAP5: Booting build output
>=20
> Chase,
>=20
> Thanks - I have mine set to the same:
>=20
> off-on-off-on
>=20
> and still no luck booting. I also tried the reverse just in case
> I was
> backwards/upside-down; despite the same SD card booting an OMAP4
> Panda,
> and replacing with OMAP5 MLO and u-boot.img, I see nothing on the
> console whatsoever. Not even a junk character implying an
> incorrect
> baudrate, etc. The USBBOOT functionality seems to work, so I
> don't
> believe the board to be non-functional.

Are you connected to ttyUSB0 or ttyUSB1?  For my board the serial is ttyUSB=
0.

>=20
> I'll sit tight for a while and see what else is committed. Thanks
> for
> your assistance!
>=20
>=20
> > >
> > > Does the SYSBOOT switch dictate whether the SD is used for
> > > booting? If
> > > so, what is the correct setting? I've previously attempted to
> > > boot
> > > using an SD card formatted as necessary for the OMAP4 Panda,
> but
> > > have
> > > been unsuccessful - I assumed a similar FAT format would be
> > > required
> > > for MLO/u-boot.img
> >
> > My sysboot switch is off on off on and I'm booting from SD.
> >
> > You can use the same SD format at omap4.  Just replace the
> kerel and
> > bootloader, add the boot.scr and dtb file.
> >
>=20
> Regards,
>=20
> --
> ---
> Ian Wisbon
> Support Manager
> Timesys Corporation

