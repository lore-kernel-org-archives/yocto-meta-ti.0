Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.26352.1628793298760043063
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 11:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2910E40C8E;
	Thu, 12 Aug 2021 18:34:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OtAaJJ3dEgp6; Thu, 12 Aug 2021 18:34:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 0B26740BEC;
	Thu, 12 Aug 2021 18:34:57 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id CA2F2174656; Thu, 12 Aug 2021 14:34:56 -0400 (EDT)
Date: Thu, 12 Aug 2021 14:34:56 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: elberger@amazon.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Correct cross compile toolchain for meta-ti and meta-arago
Message-ID: <20210812183456.GY1528@denix.org>
References: <9Nqj.1628791295114258477.TFr1@lists.yoctoproject.org>
 <20210812181341.GV1528@denix.org>
 <9054b3fc-7510-783a-18bc-fafa338fbdb0@amazon.com>
MIME-Version: 1.0
In-Reply-To: <9054b3fc-7510-783a-18bc-fafa338fbdb0@amazon.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 02:30:17PM -0400, elberger via lists.yoctoproject=
.org wrote:
> On 8/12/21 2:13 PM, Denys Dmytriyenko wrote:
> >On Thu, Aug 12, 2021 at 11:01:35AM -0700, elberger via lists.yoctoproj=
ect.org wrote:
> >>Hello,
> >>
> >>I am in the process of setting up a new build container for TI target=
s.
> >>
> >>This section here
> >>
> >>http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#=
Cross-compile_toolchain
> >>
> >>Seems to have a conflicting message about versions.  Are the versions=
 in
> >>command lines correct or the version number in the initial paragraph?
> >See arago-dunfell-config.txt line in the config table - that's the cor=
rect one
> >and the rest hasn't been updated in a while.
> >
> Hello Denys,
>=20
> I was asking about the compiler toolchain version.=A0 I didn't see it
> in the config file.=A0 Maybe not enough sleep on my end.

http://arago-project.org/wiki/index.php?title=3DSetting_Up_Build_Environm=
ent&diff=3D1676&oldid=3D1675#Available_Layer_Configurations

| arago-dunfell-config.txt
| Configuration for meta-ti/meta-arago layers matching the "dunfell" stab=
le branch, that corresponds to the Yocto Project version 3.1. Uses Arm 9.=
2-2019.12

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
