Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0779FE0134D
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 08:19:59 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so366810wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 08:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.180.86.230 as permitted sender)
	client-ip=10.180.86.230; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.180.86.230 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.180.86.230])
	by 10.180.86.230 with SMTP id s6mr20412466wiz.16.1330359598985
	(num_hops = 1); Mon, 27 Feb 2012 08:19:58 -0800 (PST)
Received: by 10.180.86.230 with SMTP id s6mr16060562wiz.16.1330359598880;
	Mon, 27 Feb 2012 08:19:58 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id h19sm22819359wiw.9.2012.02.27.08.19.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 27 Feb 2012 08:19:58 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F4BA9EE.8030908@balister.org>
Date: Mon, 27 Feb 2012 17:19:53 +0100
Message-Id: <3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnu8q5MhMNIoR+/R2Hy3e8f/F69GR/fz3/GR9teimhaUcGXK8vApEAqW6DnrrUgJChXrRS2
Subject: Re: Building Yocto for Pandaboard
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
X-List-Received-Date: Mon, 27 Feb 2012 16:20:00 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 feb. 2012, om 17:06 heeft Philip Balister het volgende geschreven:

> On 02/27/2012 03:50 AM, Koen Kooi wrote:
>>=20
>> Op 27 feb. 2012, om 09:26 heeft <Christian.Schulenberg@bmw.de> =
<Christian.Schulenberg@bmw.de> het volgende geschreven:
>>=20
>>> I already added to following line to my local.conf:
>>>=20
>>> BBMASK =3D ".*/meta-ti/recipes-misc/"
>>>=20
>>> which helps to bypass the first build problem. The next show stopper =
is building the boot loader (denx version of u-boot):
>>>=20
>>> clocks.c:415:13: internal compiler error: in decode_addr_const, at =
varasm.c:2632
>>>=20
>>> This seems to be a problem with the used version of gcc. I guess =
there are two ways to work around this: Use older version of gcc (4.5) =
or change compiler optimization from -Os to -O0. Unfortunately, neither =
can I find the right place to switch from gcc 4.6 to 4.5, nor the place =
to change compiler flags.
>>=20
>> Have you read the README in the meta-ti layer yet? That explains how =
to setup a working environment.
>=20
> The README contains instructions for building Angstrom, which is not =
the
> right answer for everyone trying to use meta-ti.

Since the recipe in question break with gcc 4.6 and/or binutils 2.22 =
*and* you need SOC_FAMILY in overrides angstrom is the only "out of the =
box" option. Other routes will involve heavy patching. I agree that =
needs to be addressed, but it doesn't change the solution *right now*.

And the instructions in the README set things for 'yocto', which is what =
people are asking for. If they asked for 'poky', that would be a totally =
different thing.=

