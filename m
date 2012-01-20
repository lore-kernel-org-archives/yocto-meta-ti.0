Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43573E00307
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 08:40:43 -0800 (PST)
Received: by wgbdq10 with SMTP id dq10so713768wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 20 Jan 2012 08:40:42 -0800 (PST)
Received: by 10.180.19.42 with SMTP id b10mr5113661wie.13.1327077642382;
	Fri, 20 Jan 2012 08:40:42 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm34559520wib.9.2012.01.20.08.40.41
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 08:40:41 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CA+M6bXn-Rz=zrzAx0A6FVrRQrHr5uk2U17_UCPwOSC2FkN-HGg@mail.gmail.com>
Date: Fri, 20 Jan 2012 17:40:39 +0100
Message-Id: <9861DC2A-D4A4-4275-936B-260B601A1784@dominion.thruhere.net>
References: <9F2249DF-2E56-4B4E-98CB-CE746690DCEC@dominion.thruhere.net>
	<CA+M6bXn-Rz=zrzAx0A6FVrRQrHr5uk2U17_UCPwOSC2FkN-HGg@mail.gmail.com>
To: Tom Rini <tom.rini@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [RFC] u-boot recipe naming
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
X-List-Received-Date: Fri, 20 Jan 2012 16:40:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 20 jan. 2012, om 16:39 heeft Tom Rini het volgende geschreven:

> On Fri, Jan 20, 2012 at 5:41 AM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Hi,
>>=20
>> We currently have a problem with other layers including their own =
version of u-boot_2011.12.bb which confuses bitbake. To avoid such =
hassle in the future I'm going to propose using the kernel naming scheme =
for u-boot recipes as well:
>>=20
>> u-boot-denx_2011.12.bb -> u-boot from git.denx.de master + patches
>> u-boot-ti_git.bb -> u-boot from git.denx.de ti branch + patches
>> u-boot-psp-<soc>_git.bb -> u-boot from psp tree for $SoC + patches =
e.g. u-boot-psp-am18x_git.bb
>>=20
>> This should avoid filename based conflicts between layers and make it =
clearer which tree the recipe will be building.
>>=20
>> Thoughts/flames/opinions?
>=20
> Works for me, but I do hope we need u-boot-ti_git.bb sparingly as I'm
> just using that for requests for Albert to pull into u-boot-arm (it's
> possible that stuff might stay in 'next' for a while, ie when merge
> window closes but I don't want to lose stuff) so please make sure it's
> marked as a rebasing git tree.

It was only mean as an example to illustrate the namespace, if we don't =
need it, it's one less recipe to support :)=

