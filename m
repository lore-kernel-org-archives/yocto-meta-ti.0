Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 328EEE00293
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 12:20:54 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q95JKnfD025154;
	Fri, 5 Oct 2012 14:20:49 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q95JKn3K030408;
	Fri, 5 Oct 2012 14:20:49 -0500
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Fri, 5 Oct 2012 14:20:49 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: Enrico <ebutera@users.berlios.de>
Thread-Topic: [meta-ti] [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
Thread-Index: AQHNoysihNYlrsv/u0uDg8nuLj8Io5erZRkAgAACLYD//69wFQ==
Date: Fri, 5 Oct 2012 19:20:48 +0000
Message-ID: <6CF2DE49-0D65-4216-B374-805CE3754A17@ti.com>
References: <1349465081-10787-1-git-send-email-fcooper@ti.com>
	<506F2E82.8060906@mlbassoc.com>,
	<CA+2YH7ucY8NoMMc28fxsVav2cCg=n_6mYvama9Ox4t0ZowVizA@mail.gmail.com>
In-Reply-To: <CA+2YH7ucY8NoMMc28fxsVav2cCg=n_6mYvama9Ox4t0ZowVizA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] wl12xx-firmware: Port wl12xx-firmware recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 19:20:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The custom git tree is wl12xx only not all the different components that li=
nux-firmware provides. My understanding is that the team that works on wl12=
xx should be pushing it back to linux-firmware. But like I said this will c=
ontain the latest changes.

On Oct 5, 2012, at 2:09 PM, "Enrico" <ebutera@users.berlios.de> wrote:

> On Fri, Oct 5, 2012 at 9:01 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> On 2012-10-05 13:24, Franklin S. Cooper Jr wrote:
>>>=20
>>> * Port wl12xx-firmware recipe from arago. This recipe was originally
>>>   named linux-firmware in arago.
>>> * Wl12xx-firmware provides the firmware files for use with the TI
>>>   Wi-Fi + Bluetooth module.
>>>=20
>>> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
>>=20
>>=20
>> Why not just keep the main linux-firmware recipe up to date instead of
>> duplicate
>> functionality?
>=20
>=20
> I made myself the same question at first, but the answer was there:
>=20
>=20
>>> +# This recipe provides the latest firmware files for wl12xx.
>>> +# Therefore, use the contents of this recipe instead of the contents
>>> +# of linux-firmware-wl12xx.
>=20
>>> +SRC_URI =3D "git://github.com/TI-ECS/ti-utils.git;protocol=3Dgit"
>=20
>=20
> Well one could ask why they are there and not in linux-firmware git
> (not polemic, just curious).
>=20
> Enrico
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti

