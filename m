Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wy0-f176.google.com (mail-wy0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CEE3FE00559
	for <meta-ti@yoctoproject.org>; Thu,  3 Nov 2011 09:39:38 -0700 (PDT)
Received: by wyg34 with SMTP id 34so2061539wyg.35
	for <meta-ti@yoctoproject.org>; Thu, 03 Nov 2011 09:39:37 -0700 (PDT)
Received: by 10.227.205.20 with SMTP id fo20mr12815648wbb.20.1320338376864;
	Thu, 03 Nov 2011 09:39:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	fy13sm11108929wbb.18.2011.11.03.09.39.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Nov 2011 09:39:36 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20111103161518.GB15391@denix.org>
Date: Thu, 3 Nov 2011 17:39:32 +0100
Message-Id: <9686C066-9DD2-4BD4-BC5F-A3CFE9222A13@dominion.thruhere.net>
References: <1320309987-31529-1-git-send-email-koen@dominion.thruhere.net>
	<20111103161518.GB15391@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1251.1)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] beaglebone-getting-started: initial add
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
X-List-Received-Date: Thu, 03 Nov 2011 16:39:39 -0000
X-Groupsio-MsgNum: 75
Content-Type: multipart/signed;
	boundary="Apple-Mail=_7D2909F0-E979-4CD3-8120-312D1F854D9D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_7D2909F0-E979-4CD3-8120-312D1F854D9D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 3 nov. 2011, om 17:15 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Thu, Nov 03, 2011 at 09:46:26AM +0100, Koen Kooi wrote:
>> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> ---
>> recipes-misc/payload/beaglebone-getting-started.bb |   15 =
+++++++++++++++
>> 1 files changed, 15 insertions(+), 0 deletions(-)
>> create mode 100644 recipes-misc/payload/beaglebone-getting-started.bb
>>=20
>> diff --git a/recipes-misc/payload/beaglebone-getting-started.bb =
b/recipes-misc/payload/beaglebone-getting-started.bb
>> new file mode 100644
>> index 0000000..d68de7e
>> --- /dev/null
>> +++ b/recipes-misc/payload/beaglebone-getting-started.bb
>> @@ -0,0 +1,15 @@
>> +DESCRIPTION =3D "BeagleBone Getting Started Guide"
>> +
>> +# Ask Jason
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D =
"file://${COREBASE}/LICENSE;md5=3D3f40d7994397109285ec7b81fdeb3b58"
>=20
> Is this allowed (logically and/or legally)? It seems like defeating =
the=20
> purpose of checksumming the license definition of the package. I know =
it's=20
> done for the tasks, but tasks are not real packages - they are pure =
metadata.=20
> This one fetches a git repository, hence contains "code".
>=20
> I believe the proper way, if the package even mentions its license, is =
to=20
> checksum that text directly or a portion of the code:
>=20
> LIC_FILES_CHKSUM =3D =
"file://git/src/main.c;beginline=3D5;endline=3D9;md5=3D1234567890abcdef"

That's why it says "ask jason", since the code itself contains no =
license info (matrix-gui suffers from the same bug).

regards,

Koen=

--Apple-Mail=_7D2909F0-E979-4CD3-8120-312D1F854D9D
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk6yw8UACgkQMkyGM64RGpHxFwCeOLi9WjEpx9QsxGYnpRgvbRmf
EJsAn1IG9fRJpv5qRPOJDT5Kj8vYjYK9
=f+Jv
-----END PGP SIGNATURE-----

--Apple-Mail=_7D2909F0-E979-4CD3-8120-312D1F854D9D--
