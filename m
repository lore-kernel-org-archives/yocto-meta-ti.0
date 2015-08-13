Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 93389E00973; Thu, 13 Aug 2015 09:24:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 383A5E0095C
	for <meta-ti@yoctoproject.org>; Thu, 13 Aug 2015 09:24:03 -0700 (PDT)
Received: by pacrr5 with SMTP id rr5so40455376pac.3
	for <meta-ti@yoctoproject.org>; Thu, 13 Aug 2015 09:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ju11GQRquuTDbpAURkGqCVkaUnOsIvAm02/sc2ADqV0=;
	b=YZW5EiaEm5tqHOkS0OfVOn5gmRntnwDUtWAKebqeYpWT+LkCXmQNJioU6ds8Jntnqb
	ZFjvOK9O+S+scNK7RYRb87kwpDNMdDb5hRYYOhg7zcLOJPE7OSQihJspQhFwdVO/W1vL
	Ri0rfnVBwaBnKnxKi2eQVibHin2HK53RBWfuri1yoIkFtp9/yHZx+/1o/jgFcKA+attn
	PPCE2aS9gThAd9jMhpqctEVRdd5GCdNICN/KIu0nx5hAQcvLtBz1lpa7bXIh9eN72UhF
	IgeSD0LofZODvFU+U8F5e8haiaxv2b2Jyk0UfHi+JxX6Re8V0GW2VxHUve+fvZnQT6iD
	Oc3g==
X-Received: by 10.68.65.47 with SMTP id u15mr14335690pbs.127.1439483043071;
	Thu, 13 Aug 2015 09:24:03 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:91a9:55b7:6f3a:6b82?
	([2601:647:4c02:370d:91a9:55b7:6f3a:6b82])
	by smtp.gmail.com with ESMTPSA id k5sm3191998pda.34.2015.08.13.09.24.02
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 13 Aug 2015 09:24:02 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150813093617.GE15357@ad.chargestorm.se>
Date: Thu, 13 Aug 2015 09:23:56 -0700
Message-Id: <1B5C355C-9481-4F1F-AC4A-3D7DCB77EA0F@gmail.com>
References: <CADySD0GDcbUR7wRYgj1jnX4D24vhBg57SoTam+P326fLZuE1Lw@mail.gmail.com>
	<20150813093617.GE15357@ad.chargestorm.se>
To: Anders Darander <anders@chargestorm.se>
X-Mailer: Apple Mail (2.2104)
Cc: meta-ti@yoctoproject.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Valgrind doesn't give stack trace
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Aug 2015 16:24:05 -0000
X-Groupsio-MsgNum: 6846
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A38BF92E-B973-4D21-AC57-B8644AAD157E";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A38BF92E-B973-4D21-AC57-B8644AAD157E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Aug 13, 2015, at 2:36 AM, Anders Darander <anders@chargestorm.se> =
wrote:
>=20
> * Ankur Tyagi <ankur.tyagi85@gmail.com> [150813 06:26]:
>> I am using Valgrind coming from yocto on my AM335x-EVM kit.
>=20
>> But when I try to use valgrind, it doesn't give me stack trace. =
Following
>> is what I get :
>=20
> See my reply on meta-arago:
> http://arago-project.org/pipermail/meta-arago/2015-August/006016.html
>=20

You need just symbols not complete debug info. Adding
INHIBIT_PACKAGE_STRIP =3D =E2=80=9C1=E2=80=9D to valgrind recipe  should =
take care of this.

> Cheers,
> Anders
>=20
> --
> Anders Darander
> ChargeStorm AB / eStorm AB
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_A38BF92E-B973-4D21-AC57-B8644AAD157E
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXMxKAACgkQuwUzVZGdMxRamQCeJgEmO81G+tSgbU8VoD4fc3Y5
vuUAnigz48JwIyPP36JqI1/TO9yK7ap4
=G4Zl
-----END PGP SIGNATURE-----

--Apple-Mail=_A38BF92E-B973-4D21-AC57-B8644AAD157E--
