Return-Path: <prvs=838ee2003=Christopher.Pow@honeywell.com>
Received: from de08ip008.honeywell.com (de08ip008.honeywell.com [199.61.24.27])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8F71E006D6
	for <meta-ti@yoctoproject.org>; Mon, 13 May 2013 13:02:26 -0700 (PDT)
Received-SPF: Neutral (de08ip008.honeywell.com: domain of
	Christopher.Pow@honeywell.com does not assert whether or not
	10.216.34.43 is permitted sender) identity=mailfrom;
	client-ip=10.216.34.43; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="Christopher.Pow@honeywell.com";
	x-conformance=spf_only; x-record-type="v=spf1"
Received-SPF: None (de08ip008.honeywell.com: no sender
	authenticity information available from domain of
	postmaster@de08ex5001.global.ds.honeywell.com) identity=helo;
	client-ip=10.216.34.43; receiver=de08ip008.honeywell.com;
	envelope-from="Christopher.Pow@honeywell.com";
	x-sender="postmaster@de08ex5001.global.ds.honeywell.com";
	x-conformance=spf_only
X-SBRS: None
X-SenderGroup: Relay_to_Internet
X-MailFlowPolicy: $Relay
X-Attachment_Filename: 
X-Attachment_Filesize: None
X-IronPort-AV: E=Sophos;i="4.84,260,1355122800"; d="scan'208";a="18032994"
Received: from unknown (HELO de08ex5001.global.ds.honeywell.com)
	([10.216.34.43])
	by de08ip008.honeywell.com with ESMTP; 13 May 2013 13:02:26 -0700
Received: from DE08EX3002.global.ds.honeywell.com ([169.254.2.234]) by
	de08ex5001.global.ds.honeywell.com ([10.216.14.56]) with mapi id
	14.02.0309.002; Mon, 13 May 2013 16:02:26 -0400
From: "Pow, Christopher (SWCOE)" <Christopher.Pow@honeywell.com>
To: Denys Dmytriyenko <denys@ti.com>
Thread-Topic: [meta-ti] TI SysLink for am180-evm target
Thread-Index: AQHOUANGO7z4DcnQ10+nDe5adcSJ2JkDwNmA///A/HA=
Date: Mon, 13 May 2013 20:02:25 +0000
Message-ID: <7B8A37CE7777314D9B931CDD3BA8C83B1B9F6B39@de08ex3002.global.ds.honeywell.com>
References: <mailman.0.1368467467.29286.meta-ti@yoctoproject.org>
	<7B8A37CE7777314D9B931CDD3BA8C83B1B9F6A72@de08ex3002.global.ds.honeywell.com>
	<20130513192021.GL17907@edge>
In-Reply-To: <20130513192021.GL17907@edge>
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
X-List-Received-Date: Mon, 13 May 2013 20:02:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Thanks for the reply.  I have a TI OMAP L138 devkit [with a touch screen]. =
 The TI SDK that came with it indicates it is a Davinci DA850/OMAP-L138/AM1=
8xx EVM.  When I took a look at the machines available in meta-ti, I saw am=
180x-evm so I picked that one.  It didn't seem right to pick omap3 or omap5=
.  The Yocto am180x-evm image I built does run on the devkit. =20

The TI SDK comes with DSP/Link.  I have been asked to change that to SysLin=
k.  I noticed that the latest available SysLink package indicates support f=
or OMAPL1XX targets.

Are OMAP-L138 devices supported in meta-ti?  My interpretation from a recen=
t conversation [on IRC] was that they were, with the am180x-evm target.  I =
am only interested [at the moment] in building and installing the ARM-side =
of the SysLink package.  Someone else is doing the DSP work.

Sorry for the confusion.  I thought I had all my pieces lined up but it see=
ms that there's still much for me to learn!  Thanks again for your help in =
this!

Christopher S. Pow
Senior Engineer, Systems
Honeywell SWCOE - RTOS
o: 612-951-5852
c: 612-910-1271


-----Original Message-----
From: Denys Dmytriyenko [mailto:denys@ti.com]=20
Sent: Monday, May 13, 2013 2:20 PM
To: Pow, Christopher (SWCOE)
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] TI SysLink for am180-evm target

On Mon, May 13, 2013 at 05:57:03PM +0000, Pow, Christopher (SWCOE) wrote:
> I am trying to integrate the TI Syslink package into a Yocto BSP.  So=20
> far I have not been successful.  I have found and downloaded the=20
> cgt_c6000 binary installer, but can't figure out how to modify the=20
> BitBake recipe to point to it.  [bitbake ti-syslink errors on the=20
> fetch phase even though the SRC URI has been modified to point to the=20
> downloaded installer binary.]  Also I am unable to find a download=20
> link for the TMS470 compiler, which seems to be another dependency for=20
> SysLink.  Has anyone successfully integrated the TI SysLink recipe? =20
> Would it be easier to download and build SysLink separately and just inst=
all it on top of the targetfs?
>=20
> I am trying to meet a very demanding schedule so I'd appreciate any=20
> help anyone can provide.

Well, strictly speaking none of AMx devices have DSPs in them. That would r=
equire DMx devices, which are not currently supported in meta-ti.

--
Denys

