Return-Path: <prvs=839b01271=Christopher.Pow@honeywell.com>
Received: from de08ip008.honeywell.com (de08ip008.honeywell.com [199.61.24.27])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE3B9E01366
	for <meta-ti@yoctoproject.org>; Tue, 14 May 2013 10:34:48 -0700 (PDT)
Received-SPF: Neutral (de08ip008.honeywell.com: domain of
	Christopher.Pow@honeywell.com does not assert whether or not
	10.216.34.42 is permitted sender) identity=mailfrom;
	client-ip=10.216.34.42; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="Christopher.Pow@honeywell.com";
	x-conformance=spf_only; x-record-type="v=spf1"
Received-SPF: None (de08ip008.honeywell.com: no sender
	authenticity information available from domain of
	postmaster@de08ex5004.global.ds.honeywell.com) identity=helo;
	client-ip=10.216.34.42; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="postmaster@de08ex5004.global.ds.honeywell.com";
	x-conformance=spf_only
X-SBRS: None
X-SenderGroup: Relay_to_Internet
X-MailFlowPolicy: $Relay
X-Attachment_Filename: 
X-Attachment_Filesize: None
X-IronPort-AV: E=Sophos;i="4.87,665,1363158000"; d="scan'208";a="18109677"
Received: from unknown (HELO de08ex5004.global.ds.honeywell.com)
	([10.216.34.42])
	by de08ip008.honeywell.com with ESMTP; 14 May 2013 10:34:48 -0700
Received: from DE08EX3002.global.ds.honeywell.com ([169.254.2.234]) by
	de08ex5004.global.ds.honeywell.com ([10.216.14.77]) with mapi id
	14.02.0309.002; Tue, 14 May 2013 13:34:47 -0400
From: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] TI SysLink for am180-evm target
Thread-Index: AQHOUANGO7z4DcnQ10+nDe5adcSJ2JkDwNmA///A/HCAAa1DAP//vT3g
Date: Tue, 14 May 2013 17:34:47 +0000
Message-ID: <7B8A37CE7777314D9B931CDD3BA8C83B1B9F71E9@de08ex3002.global.ds.honeywell.com>
References: <mailman.0.1368467467.29286.meta-ti@yoctoproject.org>
	<7B8A37CE7777314D9B931CDD3BA8C83B1B9F6A72@de08ex3002.global.ds.honeywell.com>
	<20130513192021.GL17907@edge>
	<7B8A37CE7777314D9B931CDD3BA8C83B1B9F6B39@de08ex3002.global.ds.honeywell.com>
	<20130514171112.GA31835@denix.org>
In-Reply-To: <20130514171112.GA31835@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.167.150.119]
MIME-Version: 1.0
X-CFilter-Loop: Forwarded
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: TI SysLink for am180-evm target
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
X-List-Received-Date: Tue, 14 May 2013 17:34:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

There's a file in the START_HERE partition of the SD card.  dvsdk_omapl138-=
evm_4_01_00_09_setuplinux.  Is that what you mean?

Thanks for the explanation RE the similar boards.  It sounds like you are s=
aying that I am out of luck with regard to finding support for OMAP-L138 wi=
thin meta-ti?  Do I have it right that DA850 and AM180x boards are just boa=
rds with ARM core processors on them, while the OMAP-L138 board is a board =
with an OMAP-L138 processor on it [ARM and DSP core]?  So the support that =
I'll get from meta-ti is *only* support for the ARM-core.  That makes sense=
, if I've got it right.

I am only responsible for the ARM-core side of the OMAP-L138.  I'm thus onl=
y concerned with building things that need to run on the ARM core, which in=
cludes the Linux BSP and ARM-core SysLink components.  Someone else is doin=
g the DSP-core work [using SYS/BIOS] so I believe they will be integrating =
the DSP-core SysLink components. =20

From the perspective of the meta-ti capabilities, is there really anything =
above and beyond it that I need to have here?  My understanding of the OMAP=
-L138 is that the ARM-core is "in charge" and brings the DSP-core out of re=
set.  Once that's done they should be independent [except, of course, for S=
ysLink communications].

Thanks for your helpful replies!

-----Original Message-----
From: Denys Dmytriyenko [mailto:denys@ti.com]=20
Sent: Tuesday, May 14, 2013 12:11 PM
To: Pow, Christopher (SWCOE)
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] TI SysLink for am180-evm target

Christopher,

Can you please identify the TI SDK you received with the board - it's name =
and the version.

DA850, OMAP-L138 and AM180x are slightly different boards, even though very=
 similar. As a matter of fact, from ARM GPP perspective they are pretty muc=
h the same, but the difference is in the peripherals, including the availab=
ility of DSP. Hence, you can build the am180x-evm (non-DSP) from meta-ti an=
d run it on any of the above boards. BTW, why do you need SysLink just for =
ARM?

--=20
Denys


On Mon, May 13, 2013 at 08:02:25PM +0000, Pow, Christopher (SWCOE) wrote:
> Denys,
>=20
> Thanks for the reply.  I have a TI OMAP L138 devkit [with a touch screen]=
. =20
> The TI SDK that came with it indicates it is a Davinci=20
> DA850/OMAP-L138/AM18xx EVM.  When I took a look at the machines available=
 in=20
> meta-ti, I saw am180x-evm so I picked that one.  It didn't seem right to=
=20
> pick omap3 or omap5.  The Yocto am180x-evm image I built does run on the=
=20
> devkit.
>=20
> The TI SDK comes with DSP/Link.  I have been asked to change that to=20
> SysLink.  I noticed that the latest available SysLink package indicates=20
> support for OMAPL1XX targets.
>=20
> Are OMAP-L138 devices supported in meta-ti?  My interpretation from a rec=
ent=20
> conversation [on IRC] was that they were, with the am180x-evm target.  I =
am=20
> only interested [at the moment] in building and installing the ARM-side o=
f=20
> the SysLink package.  Someone else is doing the DSP work.
>=20
> Sorry for the confusion.  I thought I had all my pieces lined up but it=20
> seems that there's still much for me to learn!  Thanks again for your hel=
p=20
> in this!
>=20
> Christopher S. Pow
> Senior Engineer, Systems
> Honeywell SWCOE - RTOS
> o: 612-951-5852
> c: 612-910-1271
>=20
>=20
> -----Original Message-----
> From: Denys Dmytriyenko [mailto:denys@ti.com]=20
> Sent: Monday, May 13, 2013 2:20 PM
> To: Pow, Christopher (SWCOE)
> Cc: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] TI SysLink for am180-evm target
>=20
> On Mon, May 13, 2013 at 05:57:03PM +0000, Pow, Christopher (SWCOE) wrote:
> > I am trying to integrate the TI Syslink package into a Yocto BSP.  So=20
> > far I have not been successful.  I have found and downloaded the=20
> > cgt_c6000 binary installer, but can't figure out how to modify the=20
> > BitBake recipe to point to it.  [bitbake ti-syslink errors on the=20
> > fetch phase even though the SRC URI has been modified to point to the=20
> > downloaded installer binary.]  Also I am unable to find a download=20
> > link for the TMS470 compiler, which seems to be another dependency for=
=20
> > SysLink.  Has anyone successfully integrated the TI SysLink recipe? =20
> > Would it be easier to download and build SysLink separately and just in=
stall it on top of the targetfs?
> >=20
> > I am trying to meet a very demanding schedule so I'd appreciate any=20
> > help anyone can provide.
>=20
> Well, strictly speaking none of AMx devices have DSPs in them. That would=
 require DMx devices, which are not currently supported in meta-ti.
>=20
> --
> Denys
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>=20

