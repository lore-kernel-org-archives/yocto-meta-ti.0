Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65ED1E0072A
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:53:47 -0800 (PST)
Received: by wibhq12 with SMTP id hq12so2275400wib.35
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 12:53:46 -0800 (PST)
Received: by 10.181.11.231 with SMTP id el7mr10924783wid.0.1327697625954;
	Fri, 27 Jan 2012 12:53:45 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm26762732wib.0.2012.01.27.12.53.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 12:53:45 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120127202150.GE8707@denix.org>
Date: Fri, 27 Jan 2012 21:53:42 +0100
Message-Id: <02FC2B87-16E6-419F-9889-E070516AA122@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<7D46E86EC0A8354091174257B2FED1010BF9BA72@DLEE12.ent.ti.com>
	<4F22E41B.8070708@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D77A@DLEE12.ent.ti.com>
	<4F2304E7.7070809@ti.com>
	<7D46E86EC0A8354091174257B2FED1010BF9D879@DLEE12.ent.ti.com>
	<20120127202150.GE8707@denix.org>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Fri, 27 Jan 2012 20:53:47 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 21:21 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Fri, Jan 27, 2012 at 08:17:42PM +0000, Maupin, Chase wrote:
>>> -----Original Message-----
>>> From: Mills, William
>>> Sent: Friday, January 27, 2012 2:11 PM
>>> To: Maupin, Chase
>>> Cc: Koen Kooi; meta-ti@yoctoproject.org
>>> Subject: Re: [meta-ti] [PATCH 1/3] matrix-gui-browser: port from
>>> arago overlay
>>>=20
>>>=20
>>> On 01/27/2012 02:46 PM, Maupin, Chase wrote:
>>>> I guess we have a difference of opinion on how we see meta-arago.
>>> I
>>>> don?t separate that layer into distro and non-distro. I was
>>> really
>>>> planning on meta-arago being all the stuff related to the
>>> arago/SDK
>>>> distribution. Meta-ti is for TI packages that can be used by
>>> other
>>>> distros. That being said I'm OK with meta-ti being split into a
>>> BSP
>>>> layer and everthing else, but I don't know exactly what that buys
>>> us.
>>>> Does it particularly hurt someone that pulls in meta-ti to have
>>> access
>>>> to matrix if they don't use it? I pull in things from meta-oe or
>>>> oe-core that I don?t "need" but they are there anyway.
>>>=20
>>> Do you know that everything you are putting in meta-ti today only
>>> depends on oe-core?  I don't think you do as we are not testing
>>> that
>>> today.  Yes, in the old days a recipie collection had tons of stuff
>>> that
>>> would be present but just fail if you actually tried to use it.
>>> The
>>> point of layers was to clean that up.
>>=20
>> Not sure what your comment about only needing oe-core is.  For =
example I use=20
>> lmbench but I don?t see that in oe-core.  I get that from meta-oe.  I =
can=20
>> agree to spliting meta-ti into two layers, a HW layer for our devices =
and a=20
>> layer containing all of the TI recipes.
>>=20
>> But if we wanted to match the meta-intel layer way would you also =
propose=20
>> making a layer per device?  I personally find that more confusing.
>=20
> I don't think that was Bill's message. It was simplicity. BSP only =
layer, no=20
> supplemental apps, if not absolutely required.
>=20
> Your example with lmbench is not correct - BSP layer should be simple =
enough=20
> to be used with OE-Core alone to produce a console rootfs image with =
nothing=20
> but busybox.
>=20
> How about splitting meta-ti into:
> * BSP only
> * SGX graphics
> * DSP tools

Since sgx and dsp are built into the SoC, why isn't it considered BSP? I =
must really start warming about getting overzealous with layers and =
breeding a silo mentality. I'm not saying we only need one layer, but =
not a gazillion like the base proposal.


