Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f42.google.com (mail-ww0-f42.google.com [74.125.82.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6CB2FE004D2
	for <meta-ti@yoctoproject.org>; Wed,  8 Feb 2012 14:27:24 -0800 (PST)
Received: by wgbgn7 with SMTP id gn7so5676188wgb.5
	for <meta-ti@yoctoproject.org>; Wed, 08 Feb 2012 14:27:23 -0800 (PST)
Received: by 10.180.93.132 with SMTP id cu4mr29024160wib.9.1328740042634;
	Wed, 08 Feb 2012 14:27:22 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ho4sm2898496wib.3.2012.02.08.14.27.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 08 Feb 2012 14:27:22 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F32F59B.7010804@mlbassoc.com>
Date: Wed, 8 Feb 2012 23:27:21 +0100
Message-Id: <8EA0B5D5-4DC5-4F48-83E6-B019862BD57F@dominion.thruhere.net>
References: <4F32F016.4020008@gmail.com> <4F32F1B3.8090000@mlbassoc.com>
	<4F32F31B.2000303@gmail.com>
	<59EDC5ED-F339-48E8-8C4D-7137C23927CD@dominion.thruhere.net>
	<4F32F59B.7010804@mlbassoc.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
X-Gm-Message-State: ALoCoQlAuyUqSUygyHs1K9rqOHV0n3z6AGyApwz8vBo0Mgu8UBuqM9KWph3fjHqblJw0zZ7kcrF2
Subject: Re: building Yocto for Pandaboard
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
X-List-Received-Date: Wed, 08 Feb 2012 22:27:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 8 feb. 2012, om 23:22 heeft Gary Thomas het volgende geschreven:

> On 2012-02-08 15:18, Koen Kooi wrote:
>>=20
>> Op 8 feb. 2012, om 23:11 heeft jfabernathy het volgende geschreven:
>>=20
>>> On 02/08/2012 05:05 PM, Gary Thomas wrote:
>>>> On 2012-02-08 14:58, jfabernathy wrote:
>>>>> I'm trying to build the pandaboard BSP for Yocto. I cloned the =
meta-ti repository in the poky directory and tried to build =
core-image-sato for both machine pandaboard and
>>>>> omap4430-panda. However, I immediately get an error because =
bitbake is looking for recipes-images/angstrom/systemd-image.bb, which =
is required in the ti-hw-bringup-image.bb image
>>>>> recipe.
>>>>>=20
>>>>> All I really included was the machine name change in local.conf =
and added the meta-ti layer in bblayers.conf.
>>>>>=20
>>>>> Did I miss a step?
>>>>=20
>>>> This was discussed last week.  Add this line to your local.conf
>>>>  BBMASK =3D ".*/meta-ti/recipes-misc/"
>>>> This will skip some BeagleBoard/BeagleBone recipes that are not
>>>> currently working in a Yocto tree.
>>>>=20
>>> Thanks a bunch. That got it going.  The README said nothing
>>=20
>> Stop spreading such lies!
>=20
> It's not a lie, just a perspective.=20

It *is* a lie, since the README is non-empty. Regardless of what you =
want to do, the README does contain content.=

