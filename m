Return-Path: <tom.rini@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BB6C0E00596
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 12:06:36 -0700 (PDT)
Received: by ghbz10 with SMTP id z10so126398ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=Zn5AQ9kk+uXltwArG7dRBwNS2EtX7rZdEFe8KHXvYFI=;
	b=FXq97unmxKSQuSvXcKJaqG8OnDPdiV8vMnv+FrC0J31KlCzMVRwbmg/RH7AZTGUhkD
	YfU2RKN1ntA7vtf12cRjh5y7gXE8URUPjaZls7Tau2Vio9fXR6XhMIqYj//Em6bQ4Hyt
	GOPym9jtTi92bIUjZPMOkZt7XWylGaJJ+6lLjqgaMfenK2z0J+J3opGd/1kPyBMg5C7s
	wjda1D6a8OKmt5lMbmRE3I0OvFd/K1KQAQA6ky3RHOP8l0h2Z59jGYE3Okumrbli+Yvr
	ji7ix8rdrsz5+Honw3FYQCHpjR7X3050Bl+tDsUwSIVNzSXtADe1HbHlVr8OQRaJGvyV
	EeyA==
Received: by 10.60.6.8 with SMTP id w8mr18494249oew.3.1334084795998;
	Tue, 10 Apr 2012 12:06:35 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id b2sm215687obo.22.2012.04.10.12.06.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 10 Apr 2012 12:06:35 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Tue, 10 Apr 2012 12:06:38 -0700
From: Tom Rini <trini@ti.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Message-ID: <20120410190638.GB24748@bill-the-cat>
References: <1334063833-9235-1-git-send-email-eric@eukrea.com>
	<6C2C4B59-3AD6-4C69-8534-D5E32BEACBA4@dominion.thruhere.net>
MIME-Version: 1.0
In-Reply-To: <6C2C4B59-3AD6-4C69-8534-D5E32BEACBA4@dominion.thruhere.net>
Organization: Texas Instruments
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot-git: add COMPATIBLE_MACHINE
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
X-List-Received-Date: Tue, 10 Apr 2012 19:06:36 -0000
X-Groupsio-MsgNum: 934
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cvVnyQ+4j833TQvp"
Content-Disposition: inline

--cvVnyQ+4j833TQvp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 10, 2012 at 03:28:41PM +0200, Koen Kooi wrote:
>=20
> Op 10 apr. 2012, om 15:17 heeft Eric B?nard het volgende geschreven:
>=20
> > so that an other BSP layer can also provide a u-boot_git recipe
>=20
> ah right, we talked about this earlier and were going to namespace our ub=
oot recipes instead. COMPATIBLE_MACHINE is just too dang hard to grasp for =
customers adding their machine.
>=20
> Chase, Tom, any patches q'd to rename our uboots?

None from me, Chase?

--=20
Tom

--cvVnyQ+4j833TQvp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iQIcBAEBAgAGBQJPhIS+AAoJENk4IS6UOR1WClcP/1KuPIpMHM0YJ1f2bGMHPts8
ED+VnNXI3Izg+w7tOwyu5v3KikYFBdcVOSVliwEFxs+ka7SJvmyT7zrT1D9SV3IX
temfy3s55PuSMFdJlN4WUZDJhFEQk8Mgq9W1TvR/auJvYxlX6KmEjdYfX39lDMrI
6CBgJoQ6GOtZkdpy3bARrSi3b5eAMQyoQPbFVc3h4MLwd0QjTqw6ajnb46/XSPB2
eg4+hg67eVqqoC9tQ7VASfIzlhEpWayJobZmoOuLQ7TYoFghHeRneZwjlhVvgYJk
pjKyH5xQNWPtlLEQadGongnym3ZNKRy5C0YSCL5PtpqvT+xRaOl2LV8UgAz2egTX
R6I/joMIxImqkkYpq5GE633Liwhiv2ypHgk7rcNDw6MwtMBv5oD0cKP2D75rhn8B
mWcXIqgpgYy79h/fmB1ewyQfarCe1beBZpmuSGOCdeGIwO53lbBqJtyrkomx/cex
/2nQ7BwfIWxEzsbOYq1lsfTKOY+oLieojsXZ12vCkOK3Zq0QHs7ut6iT+je/XJkJ
0Rc6QhXV8o2f61DmrMRKBnISY6c5i1oKa3vJ5t9WMIdAzCaWf1aGvTami6LgXQuK
YKn4bcYAw7N6oVmKEyNfybdBMU0nPTcO43mOdIYyeGojId5diJxGfQu6rIqifD5m
BGCzEKa8vKviCtSUlrlC
=Yg3J
-----END PGP SIGNATURE-----

--cvVnyQ+4j833TQvp--
