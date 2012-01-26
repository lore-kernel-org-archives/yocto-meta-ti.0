Return-Path: <chase.maupin@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 739E8E0030F
	for <meta-ti@lists.yoctoproject.org>;
	Thu, 26 Jan 2012 12:37:50 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QKblRo015676;
	Thu, 26 Jan 2012 14:37:47 -0600
Received: from DFLE71.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QKbkCP006037;
	Thu, 26 Jan 2012 14:37:46 -0600 (CST)
Received: from DLEE12.ent.ti.com ([fe80::3867:617:aab3:5956]) by
	DFLE71.ent.ti.com ([fe80::29f6:72ad:a62e:2025%21]) with mapi id
	14.01.0323.003; Thu, 26 Jan 2012 14:37:47 -0600
From: "Maupin, Chase" <chase.maupin@ti.com>
To: Philip Balister <philip@balister.org>, Koen Kooi
	<koen@dominion.thruhere.net>
Thread-Topic: [meta-ti] [PATCH] linux-ti33x-psp 3.1: add dto patch to fix
	problems with various sd cards
Thread-Index: AQHM3GoNZjhVh95970KTZi3oMo75K5YfG5MA
Date: Thu, 26 Jan 2012 20:37:46 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1010BF9A59C@DLEE12.ent.ti.com>
References: <1327599532-31609-1-git-send-email-koen@dominion.thruhere.net>
	<CA+M6bXmFYnz62unD5Mq5-3cbTmk4rpuySETP7Kd134F_k+qXvw@mail.gmail.com>
	<F17AE0E2-A005-4000-A122-3C7BA4393875@dominion.thruhere.net>
	<4F21B90B.9020103@balister.org>
In-Reply-To: <4F21B90B.9020103@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
Cc: Ben Hilburn <ben@ettus.com>,
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [PATCH] linux-ti33x-psp 3.1: add dto patch to fix	problems with various sd cards
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
X-List-Received-Date: Thu, 26 Jan 2012 20:37:50 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Philip,

We use the dto=3D14 setting in the AMSDK from TI because this calculation o=
nly seems to work 50% of the time.  So I would be find with ditching the ca=
lculation altogether.

Sincerely,
Chase Maupin
Software Applications
ARM MPU
e-mail: chase.maupin@ti.com
phone: (214) 567-2950

For support:
Forums - http://community.ti.com/forums/
Wiki - http://wiki.davincidsp.com/=20


> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
> bounces@yoctoproject.org] On Behalf Of Philip Balister
> Sent: Thursday, January 26, 2012 2:35 PM
> To: Koen Kooi
> Cc: Ben Hilburn; meta-ti@lists.yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] linux-ti33x-psp 3.1: add dto patch
> to fix problems with various sd cards
>=20
> On 01/26/2012 01:12 PM, Koen Kooi wrote:
> >
> > Op 26 jan. 2012, om 19:01 heeft Tom Rini het volgende geschreven:
> >
> >> On Thu, Jan 26, 2012 at 10:38 AM, Koen Kooi
> <koen@dominion.thruhere.net> wrote:
> >>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> >>
> >> I know the patch isn't yours but should we perhaps go in and
> make the
> >> patch more obvious?  The function we're patching does a lot of
> >> guesswork to find 'dto' and then we just say 'use the max'.  Why
> not
> >> also go rip out that logic?
> >
> > I was having the same conversation with Philip Balister on IRC
> just now :) It seems that this patch is being used by various TI
> customers to magically fix things so we do need to come up with a
> proper solution.
>=20
> Basically, we are pissed of with really annoying SD card failures.
> (This
> is an understatement, the problem cost me a lot of sleep at ELCE)
>=20
> Unless someone has a better solution, we should rip out the hairy
> calculation and set dto to 14 al the time and send the patch
> upstream.
> Does anyone see any reason not to do this?
>=20
> Philip
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

