Return-Path: <prvs=44190348a3=christian.schulenberg@bmw.de>
Received: from mxout38.expurgate.net (mxout38.expurgate.net [91.198.224.38])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5571E00596
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2012 23:53:08 -0800 (PST)
Received: from [127.0.0.1] (helo=localhost)
	by relay.expurgate.net with smtp (Exim 4.77)
	(envelope-from <prvs=44190348a3=christian.schulenberg@bmw.de>)
	id 1S2Hru-0000Eb-TR; Tue, 28 Feb 2012 08:53:07 +0100
Received: from [160.46.252.44] (helo=cmtamx3b.bmwgroup.com)
	by relay.expurgate.net with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.77) (envelope-from <Christian.Schulenberg@bmw.de>)
	id 1S2Hru-00079w-3H; Tue, 28 Feb 2012 08:53:06 +0100
Received: from cmtabb4a.muc (cmtabb4a.muc [160.50.100.17])
	by cmtamx3a.bmwgroup.com (8.13.8/8.13.8) with ESMTP id q1S7qmkC011847
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 28 Feb 2012 08:52:50 +0100
Received: from SMUCH06B.europe.bmw.corp (smuch06b.muc [160.50.20.56])
	by cmtabb4a.muc (8.13.8/8.13.8) with ESMTP id q1S7qPCL020442;
	Tue, 28 Feb 2012 08:52:35 +0100
Received: from SMUCM08V.europe.bmw.corp ([160.50.20.51]) by
	SMUCH06B.europe.bmw.corp ([160.50.20.56]) with mapi; Tue, 28 Feb 2012
	08:52:32 +0100
From: <Christian.Schulenberg@bmw.de>
To: <wmills@ti.com>, <koen@dominion.thruhere.net>
Date: Tue, 28 Feb 2012 08:52:31 +0100
Thread-Topic: [meta-ti] Building Yocto for Pandaboard
Thread-Index: Acz1ciEhzXh+9F1ZSl6FQpo+cZ7XyQAe6gXA
Message-ID: <EF446FF9DAC93B479C74AB9153DE173F0C154A32@SMUCM08V.europe.bmw.corp>
References: <EF446FF9DAC93B479C74AB9153DE173F0C0D32FF@SMUCM08V.europe.bmw.corp>
	<3BC330F9-CE58-4C4F-A473-B0F40D0A2777@dominion.thruhere.net>
	<4F4BA9EE.8030908@balister.org>
	<3A03FCB1-56B0-42C4-9260-24B10EF4531E@dominion.thruhere.net>
	<4F4BB801.3090108@ti.com>
In-Reply-To: <4F4BB801.3090108@ti.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-Spam-Status: No, No
X-purgate-relay-fid: relay-3cc1a3
X-purgate-sourceid: 1S2Hru-00079w-3H
X-purgate-Ad: Checked for spam and viruses by eXpurgate(R),
	see www.eleven.de for details.
X-purgate-ID: 151534::1330415586-0000332C-76417763/0-0/0-0
X-purgate: clean
X-purgate-type: clean
X-purgate-relay-bid: relay-f3ed12
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Tue, 28 Feb 2012 07:53:09 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Thanks a lot for your replies. Angstrom is definitely not the way I want to=
 go at the moment, because I prefer to have a clean architecture in my proj=
ect. So I have to wait, until the meta-ti layer is fixed to work with Poky =
without any dependencies to angstrom. Do you have any idea, how long this c=
an take?

May be, in the meantime I try to fix some problems on my own to get Pandabo=
ard working, because I really need to set up this device as a prototyping u=
nit.

BR,
Christian

-----Urspr=FCngliche Nachricht-----
Von: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.=
org] Im Auftrag von William Mills
Gesendet: Montag, 27. Februar 2012 18:06
An: Koen Kooi
Cc: meta-ti@yoctoproject.org
Betreff: Re: [meta-ti] Building Yocto for Pandaboard



On 02/27/2012 11:19 AM, Koen Kooi wrote:
> Op 27 feb. 2012, om 17:06 heeft Philip Balister het volgende geschreven:
>
>> On 02/27/2012 03:50 AM, Koen Kooi wrote:
>>> Op 27 feb. 2012, om 09:26 heeft<Christian.Schulenberg@bmw.de>  <Christi=
an.Schulenberg@bmw.de>  het volgende geschreven:
>>>
>>>> I already added to following line to my local.conf:
>>>>
>>>> BBMASK =3D ".*/meta-ti/recipes-misc/"
>>>>
>>>> which helps to bypass the first build problem. The next show stopper i=
s building the boot loader (denx version of u-boot):
>>>>
>>>> clocks.c:415:13: internal compiler error: in decode_addr_const, at var=
asm.c:2632
>>>>
>>>> This seems to be a problem with the used version of gcc. I guess there=
 are two ways to work around this: Use older version of gcc (4.5) or change=
 compiler optimization from -Os to -O0. Unfortunately, neither can I find t=
he right place to switch from gcc 4.6 to 4.5, nor the place to change compi=
ler flags.
>>> Have you read the README in the meta-ti layer yet? That explains how to=
 setup a working environment.
>> The README contains instructions for building Angstrom, which is not the
>> right answer for everyone trying to use meta-ti.
> Since the recipe in question break with gcc 4.6 and/or binutils 2.22 *and=
* you need SOC_FAMILY in overrides angstrom is the only "out of the box" op=
tion. Other routes will involve heavy patching. I agree that needs to be ad=
dressed, but it doesn't change the solution *right now*.
>
> And the instructions in the README set things for 'yocto', which is what =
people are asking for. If they asked for 'poky', that would be a totally di=
fferent thing.

Denis or Koen:  Before today is over please modify the README.txt to=20
describe where we are going and what is possible right now.  If Angstrom=20
is the only thing possible right now it should say that until we can=20
build with other layer stacks.  However it should also say that we are=20
working toward a solution that will build with multiple layer stacks=20
including poky.


_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

