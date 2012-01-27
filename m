Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9366FE00592
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 05:50:04 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0RDo26N012968;
	Fri, 27 Jan 2012 07:50:02 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0RDo2l2027629;
	Fri, 27 Jan 2012 07:50:02 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE70.ent.ti.com ([fe80::db3:609a:aa62:e1ec%22]) with mapi id
	14.01.0323.003; Fri, 27 Jan 2012 07:50:02 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from arago overlay
Thread-Index: AQHM3On0Dbm0PzMSSkumsFWamIEJ9pYgOjCg
Date: Fri, 27 Jan 2012 13:50:02 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
In-Reply-To: <27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 13:50:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Koen Kooi
> Sent: Friday, January 27, 2012 5:51 AM
> To: meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
> arago overlay
>=20
>=20
> Op 26 jan. 2012, om 23:44 heeft William Mills het volgende
> geschreven:
>=20
> > On 01/26/2012 01:46 PM, Chase Maupin wrote:
> >> * This package adds a simple web browser GUI application with
> >>   no decorations used to display matrix on the local display.
> >> * Ported from arago overlay
> >>
> >
> > Sorry for hijacking your patch Chase but I have serious big
> picture questions about all this stuff going into meta-ti and
> especially all into one layer.
> >
> > meta-ti is suppose to be the TI specific stuff people need to
> support their platforms regardless of what layer stack they are
> using.  I understand we are not layer stack independent yet but
> that needs to be the goal.  Certainly adding a whole bunch of non-
> HW related stuff into the same layer is not going to move us any
> closer.
> >
> > When we talked about where matrix belonged before there was
> debate about meta-oe or meta-arago.  When did I miss the memo that
> put it into meta-ti??
>=20
> Since meta-arago is supposed to be as empty as possible and matrix
> doesn't play well with others it's a bad fit for both meta-arago
> and meta-oe. Maybe we should split the meta-ti repo into 2 layers:
> one for BSP things (including sgx, dsp, etc) and one for 'sdk'
> things (matrix).
> The idea is to keep reusable TI deliverables together without
> forcing people to use arago. Putting matrix in meta-arago would
> mean you can only use it with DISTRO=3Darago, which is a huge step
> backwards from the current situation.

I think Koen got it right here.  We can split meta-ti, but I definitely don=
=92t think matrix belongs in meta-arago.  As for meta-oe my thoughts are:

1. As of now matrix is only maintained by TI and used by TI (and Koen to so=
me extent) on our products.  So I would put this in a layer that we maintai=
n because it would seem strange to me to have to go through another set of =
maintainers to update the SRCREV of the package we are developing.  Particu=
larly if no one is using it.
2. If people wanted matrix they could still include our layer to get it.  I=
f we see that happening a lot a there is a request from a group of people t=
o have this then we could push it lower, but if we are the only ones using =
it and who care about it then I don't see the reason to move this lower in =
the layer stack.

>=20
> regards,
>=20
> Koen
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

