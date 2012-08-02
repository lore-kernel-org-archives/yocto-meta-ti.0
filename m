Return-Path: <Tim.Verstraete@medecbenelux.be>
Received: from mail.medecbenelux.be (mail.medecbenelux.be [81.83.14.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 575D1E0142B
	for <meta-ti@yoctoproject.org>; Thu,  2 Aug 2012 02:14:36 -0700 (PDT)
Received: from SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407]) by
	SBS-MEDEC.medecbenelux.local ([fe80::1b66:a66e:3778:1407%10]) with mapi
	id 14.01.0355.002; Thu, 2 Aug 2012 11:11:38 +0200
From: Tim Verstraete <Tim.Verstraete@medecbenelux.be>
To: William Mills <wmills@ti.com>, Matthew Spencer <matthew@thespencers.me.uk>
Thread-Topic: [SPAM] - Re: [meta-ti] OMAP4 SGX drivers - Email found in subject
Thread-Index: AQHNcBLbIkU6BCtBgU+LJHxik3hmV5dGMUFg
Date: Thu, 2 Aug 2012 09:11:37 +0000
Message-ID: <4439C3C0562087488F139C696CD862A72C1A5C@SBS-MEDEC.medecbenelux.local>
References: <CA+itjEGUuhwLOVADq5c5cntPyZQa1qqDZ2v4Y2YdpAC4bTHeaQ@mail.gmail.com>
	<50197444.2070406@ti.com>
In-Reply-To: <50197444.2070406@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [2002:5153:ef2:0:ec9a:306f:a428:4749]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [SPAM] - Re: OMAP4 SGX drivers - Email found in subject
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
X-List-Received-Date: Thu, 02 Aug 2012 09:14:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Can't you use http://processors.wiki.ti.com/index.php/RN_4_04_00_03 instead=
 of http://processors.wiki.ti.com/index.php/RN_4_05_00_03 because i do see =
support in 4.04.00.04 for the pandaboard driver? I have checked the recipe =
and it seems not so difficult to adapt the current one for this one ... I m=
ight also give it a try later on  ...

Btw you can find the binary here: http://software-dl.ti.com/dsps/dsps_publi=
c_sw/sdo_sb/targetcontent/gfxsdk/4_04_00_03/index_FDS.html=20

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of William Mills
Sent: woensdag 1 augustus 2012 20:24
To: Matthew Spencer
Cc: meta-ti@yoctoproject.org
Subject: [SPAM] - Re: [meta-ti] OMAP4 SGX drivers - Email found in subject

On 08/01/2012 01:59 AM, Matthew Spencer wrote:
> Hi Guys
>
> I am looking into using the meta-ti project to help me build a demo=20
> platform around the Pandaboard. I need to get the SGX drivers working=20
> for the demo - but I notice that the virtual/egl package is only=20
> available for OMAP3 based platforms and excludes the pandaboard from=20
> its configuration.
>
> Am I supposed to be able to build the SGX packages through the meta-ti=20
> project - and if so how?

Its been a good bit since I played with panda.  But I will tell you what I =
know.

You can build a recipie to rebundle an SGX package for the OE ecosystem.=20
  You can not build the core SGX user space libraries from source as the so=
urce for these pieces is not published.  The same is true on OMAP3.

[The SGX binary packages are available for anonymous download and can be re=
distributed.]

>
> If the package is not available through the meta-ti project, what is=20
> my best approach for including is?

Panda board officially supports Ubuntu.  I would look at the graphics packa=
ge enablement for Ubuntu 11.10 and repackage that into an OE form factor.

[I would not use the 12.04 packages since that is hardfloat ABI and YP/oe-c=
ore are still on softfloat ABI.]

[We are still looking for a panda board maintainer for meta-ti.]

>
> Kind regards
>
> Matt
>
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

