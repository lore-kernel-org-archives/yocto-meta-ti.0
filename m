Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C9094E0030B
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 11:51:21 -0800 (PST)
Received: by wyg34 with SMTP id 34so7005734wyg.35
	for <meta-ti@yoctoproject.org>; Fri, 11 Nov 2011 11:51:20 -0800 (PST)
Received: by 10.180.87.199 with SMTP id ba7mr15927676wib.27.1321041080049;
	Fri, 11 Nov 2011 11:51:20 -0800 (PST)
Received: from [172.20.1.19] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v6sm7557889wix.1.2011.11.11.11.51.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 11:51:19 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1321040836-29819-1-git-send-email-bigotp@acm.org>
Date: Fri, 11 Nov 2011 20:51:09 +0100
Message-Id: <DF9F3F54-64A1-467E-B9C1-BFD29A4AE722@dominion.thruhere.net>
References: <1321040836-29819-1-git-send-email-bigotp@acm.org>
To: "Peter A. Bigot" <bigotp@acm.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] sdcard_image bbclass: correct MLO path in DEPLOY_DIR_IMAGE
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
X-List-Received-Date: Fri, 11 Nov 2011 19:51:22 -0000
X-Groupsio-MsgNum: 108
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B504FA92-8B09-4CB2-B27A-9F7ED00D8873";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B504FA92-8B09-4CB2-B27A-9F7ED00D8873
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 11 nov. 2011, om 20:47 heeft Peter A. Bigot het volgende geschreven:

> From: "Peter A. Bigot" <bigotp@acm.org>
>=20
> The symlink created by x-load.inc for MLO in ${DEPLOY_DIR_IMAGE} =
includes
> ${MACHINE}.

This will break SPL builds, a better idea would be to patch the xloader =
recipe to generate a MLO symlink as well. It's on my todo do fix xload, =
uboot(spl) and kernel to generate ready-to-use link like uImage, MLO and =
u-boot.{img,bin}. If someone beats me to it, great :)

regards,

Koen=

--Apple-Mail=_B504FA92-8B09-4CB2-B27A-9F7ED00D8873
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk69fLAACgkQMkyGM64RGpFITQCfWIupy+vIyAC4LrwvUKETwvPG
hr4An3TRAFTEVNXi6uvnk8mjda6TY2Gl
=uIzI
-----END PGP SIGNATURE-----

--Apple-Mail=_B504FA92-8B09-4CB2-B27A-9F7ED00D8873--
