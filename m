Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.41602.1629216819174616620
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 17 Aug 2021 09:13:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 195B740C53;
	Tue, 17 Aug 2021 16:13:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2tqCUDFdXOIg; Tue, 17 Aug 2021 16:13:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F22AF40301;
	Tue, 17 Aug 2021 16:13:36 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 5729D174661; Tue, 17 Aug 2021 12:13:36 -0400 (EDT)
Date: Tue, 17 Aug 2021 12:13:36 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: elberger@amazon.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Plan for meta-arago-distro (master)
Message-ID: <20210817161336.GD1528@denix.org>
References: <61eb847a-1f5d-a4b9-7300-1350005ebe2f@amazon.com>
MIME-Version: 1.0
In-Reply-To: <61eb847a-1f5d-a4b9-7300-1350005ebe2f@amazon.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 17, 2021 at 11:13:15AM -0400, elberger via lists.yoctoproject=
.org wrote:
> Hello,
>=20
> I need to use master branch due to MACHINE configuration
> availability only on master.
>=20
> However, the availability of new override syntax on
> meta-arago-distro emits the usual compatibility error.=A0 I noticed
> there is no master-next branch so this is probably the state of
> things.
>=20
> In such case
>=20
> 1/ is there a plan in motion to evolve meta-arago-distro and if so
> is there a rough timeline to have the syntax migrated
>=20
> or
>=20
> 2/ is there a possibility to take a PR - not sure how TI handles
> this since there is probably full regression testing done.
>=20
> thank you

Richard,

1. meta-ti mailing list is not the right place for meta-arago questions, =
but=20
anyway

2. meta-ti can be used on its own w/o meta-arago-distro with any other di=
stro=20
and MACHINE configuration availability should not be blocked by meta-arag=
o

3. override syntax conversion for meta-arago is still in progress and has=
 been=20
blocked by meta-ti, which only got merged today

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
