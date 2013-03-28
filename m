Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D2A19E014BD
	for <meta-ti@yoctoproject.org>; Thu, 28 Mar 2013 10:51:46 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r2SHpjkV031033;
	Thu, 28 Mar 2013 12:51:45 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r2SHpjDx016923;
	Thu, 28 Mar 2013 12:51:45 -0500
Received: from DLEE74.ent.ti.com (157.170.170.8) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Thu, 28 Mar 2013 12:51:44 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE74.ent.ti.com ([fe80::a0f1:125b:e7e3:7ed8%18]) with mapi id
	14.01.0323.003; Thu, 28 Mar 2013 12:51:45 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Ian M. Wisbon" <ian.wisbon@timesys.com>
Thread-Topic: [meta-ti] OMAP5: Booting build output
Thread-Index: AQHOK8xUwOzseCB+eESalC9uG9viSpi7RADAgABanYD//8NDIA==
Date: Thu, 28 Mar 2013 17:51:43 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED101594AD1C3@DLEE11.ent.ti.com>
References: <20130328115247.029b68ae@duckworth>
	<7D46E86EC0A8354091174257B2FED101594ACEFA@DLEE11.ent.ti.com>
	<20130328122753.2b957cca@duckworth>
In-Reply-To: <20130328122753.2b957cca@duckworth>
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
X-List-Received-Date: Thu, 28 Mar 2013 17:51:47 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: Ian M. Wisbon [mailto:ian.wisbon@timesys.com]
> Sent: Thursday, March 28, 2013 11:28 AM
> To: Maupin, Chase
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] OMAP5: Booting build output
>=20
> Chase,
>=20
> Thank you!
>=20
> Does the SYSBOOT switch dictate whether the SD is used for
> booting? If
> so, what is the correct setting? I've previously attempted to
> boot
> using an SD card formatted as necessary for the OMAP4 Panda, but
> have
> been unsuccessful - I assumed a similar FAT format would be
> required
> for MLO/u-boot.img

My sysboot switch is off on off on and I'm booting from SD.

You can use the same SD format at omap4.  Just replace the kerel and bootlo=
ader, add the boot.scr and dtb file.

>=20
> Also - thank you for the boot script, as I just now saw the
> commit
> changing the console from ttyO0 to ttyO2.
>=20
> On Thu, 28 Mar 2013 12:06:21 -0400
> "Maupin, Chase" <chase.maupin@ti.com> wrote:
>=20
> > Ian,
> >
> > We are updating the base images to boot this more easily.
> Until then
> > you can boot from an SD card that has a FAT boot partition and
> the
> > rootfs in an EXT partition.
> >
> > You need to pass one of the device tree files from the deploy
> > directory as well.  If you use the attached boot.scr (It is
> called
> > boot.txt so please rename it) file in your FAT partition you
> can just
> > rename the omap5-panda.dtb file to omap5-evm.dtb in the FAT
> partition
> > and the boot should work on a uEVM.  These names are changing
> in the
> > next kernel to omap5-uevm.dtb by default.
> >
> > Sincerely,
> > Chase Maupin
>=20
> Regards,
>=20
>=20
> --
> ---
> Ian Wisbon
> Support Manager
> Timesys Corporation

