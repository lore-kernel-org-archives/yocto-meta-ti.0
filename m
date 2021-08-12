Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.26046.1628792023916581551
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 11:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 3A63540C8E;
	Thu, 12 Aug 2021 18:13:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ug4dt_-JYQvz; Thu, 12 Aug 2021 18:13:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1E8CA40BEC;
	Thu, 12 Aug 2021 18:13:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id D289D174656; Thu, 12 Aug 2021 14:13:41 -0400 (EDT)
Date: Thu, 12 Aug 2021 14:13:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: elberger@amazon.com
Cc: meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti] Correct cross compile toolchain for meta-ti and meta-arago
Message-ID: <20210812181341.GV1528@denix.org>
References: <9Nqj.1628791295114258477.TFr1@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <9Nqj.1628791295114258477.TFr1@lists.yoctoproject.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 12, 2021 at 11:01:35AM -0700, elberger via lists.yoctoproject=
.org wrote:
> Hello,
>=20
> I am in the process of setting up a new build container for TI targets.
>=20
> This section here
>=20
> http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment#Cr=
oss-compile_toolchain
>=20
> Seems to have a conflicting message about versions.=A0 Are the versions=
 in=20
> command lines correct or the version number in the initial paragraph?

See arago-dunfell-config.txt line in the config table - that's the correc=
t one=20
and the rest hasn't been updated in a while.

--=20
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
