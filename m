Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C19C0E00303
	for <meta-ti@yoctoproject.org>; Fri, 30 Dec 2011 10:12:26 -0800 (PST)
Received: by wibhq4 with SMTP id hq4so10216573wib.35
	for <meta-ti@yoctoproject.org>; Fri, 30 Dec 2011 10:12:25 -0800 (PST)
Received: by 10.180.106.165 with SMTP id gv5mr87745945wib.18.1325268745385;
	Fri, 30 Dec 2011 10:12:25 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id i9sm42723039wie.8.2011.12.30.10.12.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Dec 2011 10:12:24 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4EF0D0FC.2050201@gmail.com>
Date: Fri, 30 Dec 2011 19:12:21 +0100
Message-Id: <901561C5-2E5A-4424-ABD8-C48C598B71F7@dominion.thruhere.net>
References: <4EF0D0FC.2050201@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux.inc: don't choke on missing defconfig in lzop dep
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
X-List-Received-Date: Fri, 30 Dec 2011 18:12:27 -0000
X-Groupsio-MsgNum: 315
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DB73A24C-0BAE-4935-A03B-0FC99F3E36BF";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DB73A24C-0BAE-4935-A03B-0FC99F3E36BF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 20 dec. 2011, om 19:16 heeft Christopher Larson het volgende =
geschreven:

> When a recipe is being parsed which will be skipped due to an =
incompatible
> machine, no local defconfig will exist for the current machine. It =
seems that
> the fetch localpath code doesn't error in that case, so we need to =
check for
> an IOError on the attempted open. Without this, we can hit parse =
errors.
>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---

meta-ti$ git am -s /tmp/\[meta-ti\]\ \[PATCH\]\ linux.inc_\ don\'t\ =
choke\ on\ missing\ defconfig\ in\ lzop\ dep.eml=20
Applying: linux.inc: don't choke on missing defconfig in lzop dep
error: patch failed: recipes-kernel/linux/linux.inc:269
error: recipes-kernel/linux/linux.inc: patch does not apply
Patch failed at 0001 linux.inc: don't choke on missing defconfig in lzop =
dep
When you have resolved this problem run "git am --resolved".
If you would prefer to skip this patch, instead run "git am --skip".
To restore the original branch and stop patching run "git am --abort".


--Apple-Mail=_DB73A24C-0BAE-4935-A03B-0FC99F3E36BF
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)

iEYEARECAAYFAk79/wcACgkQMkyGM64RGpHDlgCeMaH907/RSeuCXpzyr1LLwta4
Hc0AniqF7Kw18aCrowtOzBDiqv+SpnbT
=wJS4
-----END PGP SIGNATURE-----

--Apple-Mail=_DB73A24C-0BAE-4935-A03B-0FC99F3E36BF--
