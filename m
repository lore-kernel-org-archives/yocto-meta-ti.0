Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C901EE0030F
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 15:04:36 -0800 (PST)
Received: by wibhq12 with SMTP id hq12so2411291wib.35
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 15:04:35 -0800 (PST)
Received: by 10.180.86.9 with SMTP id l9mr14080312wiz.15.1327705475235;
	Fri, 27 Jan 2012 15:04:35 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l12sm15716547wiw.0.2012.01.27.15.04.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 15:04:34 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F231CA0.1000800@ti.com>
Date: Sat, 28 Jan 2012 00:04:32 +0100
Message-Id: <ECCE16CF-E624-47BD-BDEB-614A5BEF755D@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>	<4F21D735.5000303@ti.com>	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>	<4F22E41B.8070708@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>	<4F2304E7.7070809@ti.com>	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>	<20120127202150.GE8707@denix.org>	<02FC2B87-16E6-419F-9889-E070516AA122@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9DB56@DLEE12.ent.ti.com>
	<4F231CA0.1000800@ti.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 1/3] matrix-gui-browser: port	from	arago	overlay
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
X-List-Received-Date: Fri, 27 Jan 2012 23:04:37 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 22:52 heeft William Mills het volgende geschreven:

>=20
>=20
> On 01/27/2012 03:55 PM, Maupin, Chase wrote:
>>> Op 27 jan. 2012, om 21:21 heeft Denys Dmytriyenko het volgende
>>> geschreven:
>>>> On Fri, Jan 27, 2012 at 08:17:42PM +0000, Maupin, Chase wrote:
>>>> How about splitting meta-ti into:
>>>> * BSP only
>>>> * SGX graphics
>>>> * DSP tools
>>> Since sgx and dsp are built into the SoC, why isn't it considered
>>> BSP? I must really start warming about getting overzealous with
>>> layers and breeding a silo mentality. I'm not saying we only need
>>> one layer, but not a gazillion like the base proposal.
>> I did not read the above as making a bunch of layers in meta-ti.  At =
the risk of getting this all started again, I really hope meta-ti is one =
layer with BSP, SGX, DSP, WiFi support for our devices.
>>=20
>=20
> Well that was the proposal and why I figured you would barf all over =
it.  I am OK with all the above in one layer (but separate dirs) if it =
all works with all the layer stack combinations we are targeting.  The =
issue is we have no meta-ti+oe-core builds going on so we don't know =
where the dependencies will be hard to break.
>=20
> We all know the DSP support can get involved.  If we got to the point =
where BSP and graphics worked with oe-core but DSP support needed =
meta-oe or something else, then I would want the DSP stuff in a separate =
layer so people that did not need it could opt out.
>=20
> Likewise people using TI WIFI on non-TI processors should be able to =
get that in any layer stack.  If that all works with all the above in =
one layer thats fine.  We just don't know yet.  We can be optimistic and =
put it all in one layer or pessamistic and seperate them.  In this =
example I am more inclined to believe that the other TI stuff would not =
cause problems.
>=20
> Koen:  having a number of layers in on repo is a bad thing?  You =
should tell the meta-oe maintainer because that guys has a good number =
of layers in there.  :)  Are you saying that was the wrong thing to do =
for meta-oe?  Is there a leason learned?

It's getting late here, so I'll give the short version: every additional =
layer is a pain to maintain and it's even worse for the type of users we =
target. You need a really good set of layer tools, which still don't =
exist :(
And I just know that someone is going to ask the "why do I need 5 TI =
layers for my simple board?" question and I don't think we can give a =
satisfactory answer for users based on this discussion.

So what about this plan:

1) evaluate directory structure of the current meta-ti, fix if needed
2) break the easy dependencies on external layers by duplicating the =
image recipes.
3) document the remaining dependencies in the README

That should get us a layer that parses when being using with only =
bitbake+oe-core. Kernel and u-boot will build & work with the right =
toolchain

4) rename our u-boot recipes per the earlier RFC

That should avoid clashes with other layers

The remaining tasks are a bit more involved:

5) make our kernel+bootloaders compile and work with gcc 4.6/binutils =
2.22
6) Make SOC_FAMILY work or find an equivalent

regards,

Koen=

