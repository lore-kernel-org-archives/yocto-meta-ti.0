Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62BCFE006B5
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 00:18:10 -0800 (PST)
Received: by wibhq4 with SMTP id hq4so8734348wib.35
	for <meta-ti@yoctoproject.org>; Thu, 29 Dec 2011 00:18:09 -0800 (PST)
Received: by 10.181.13.179 with SMTP id ez19mr76232537wid.11.1325146689338;
	Thu, 29 Dec 2011 00:18:09 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id g26sm8456320wbo.16.2011.12.29.00.18.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 29 Dec 2011 00:18:08 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1325033520-6907-1-git-send-email-bigotp@acm.org>
Date: Thu, 29 Dec 2011 09:18:10 +0100
Message-Id: <8F5EE063-AD41-45F2-AEEA-BE35433C397D@dominion.thruhere.net>
References: <1325033520-6907-1-git-send-email-bigotp@acm.org>
To: Peter A. Bigot <bigotp@acm.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 0/5] Updates to support building dsp tools
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
X-List-Received-Date: Thu, 29 Dec 2011 08:18:10 -0000
X-Groupsio-MsgNum: 311
Content-Type: multipart/signed;
	boundary="Apple-Mail=_BC608CA2-4CAE-449B-9A22-63A84F17C1FC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_BC608CA2-4CAE-449B-9A22-63A84F17C1FC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 28 dec. 2011, om 01:51 heeft Peter A. Bigot het volgende geschreven:

> From: "Peter A. Bigot" <bigotp@acm.org>
>=20
> I finally got the dsp tools to build.  I don't know how y'all want =
this
> fixed, but here's what's going on:
>=20
> ti-eula-unpack spawns the installer, then writes canned input to it to =
do
> things like set the output directory.  The function that does this
> explicitly tacks a second newline on, in addition to the one normally =
added
> by Python's print statement.
>=20
> For ti-cgt6x, the result is that a bare newline is fed to the =
installer at
> the point where the installation directory is requested, instead of =
the
> workdir.  Hence, the default directory gets used; for this package, =
that's
> in /opt/TI.
>=20
> For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newline also =
caused
> the default installation directory to be requested, but for this =
package
> that's ${HOME}/ti.  Since ti-eula-unpack overrides the HOME =
environment
> variable to be the work directory, everything somehow happened to work =
out,
> at least for other folks.  I don't think that's a great solution =
though, so
> I updated the recipes to do it "right", by changing the commands to =
conform
> to what the current installers expect.  There may be other =
installation
> recipes for other tools that need the same fixes.

I'm going to wait for Roger to get back from holidays to comment on the =
installer issues, I'll push the CE and dmai patches later today.

regards,

Koen=

--Apple-Mail=_BC608CA2-4CAE-449B-9A22-63A84F17C1FC
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk78IkIACgkQMkyGM64RGpGvkQCfRj91BoLqcIncMuFNG8KOGk25
VWEAmwYxtYPVJBHRDfRIDqENVTq1hgMD
=w5iS
-----END PGP SIGNATURE-----

--Apple-Mail=_BC608CA2-4CAE-449B-9A22-63A84F17C1FC--
