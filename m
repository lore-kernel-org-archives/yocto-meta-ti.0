Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 465AFE00BB6; Wed, 20 Jan 2016 10:43:50 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (raj.khem[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.192.172 listed in list.dnswl.org]
Received: from mail-pf0-f172.google.com (mail-pf0-f172.google.com
	[209.85.192.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2222BE009C3
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2016 10:43:45 -0800 (PST)
Received: by mail-pf0-f172.google.com with SMTP id n128so8803239pfn.3
	for <meta-ti@yoctoproject.org>; Wed, 20 Jan 2016 10:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=9eilQb40RhY3QLtxel+gxhxvjI1VPE/fHf0VFSKpL6g=;
	b=GG4pXYUyD7jhxVCtzPkbDVygkE+IJ84lefvGvLN1ubTv0hEGXVb3dbi8nAjbVuGNC3
	047lWgDHLq0y4HCmcyj1CHUx78zAKXjYrYgd5ZtVzCnfuhL1oF4JrltlagB3S9mEzc0K
	1V5dv3uTl3MEWfnOORvng+HMGb22uTU4DfJicgXz9x9MFqgyoSAYdxLx/rejrT8acAkl
	ulSkZJpz07IY715m4WwyfvQCJ4ncyMii92+pVgGqv9Aag3Yn+9cAoI0isNFAOy2nMzoS
	6qra6AebV89X1HCi0+3soe/FdgObkc+/AccwUtjH/8z0R246gyjDhuNsmL7rA+oNYQn6
	9vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=9eilQb40RhY3QLtxel+gxhxvjI1VPE/fHf0VFSKpL6g=;
	b=YkIhWcdouSlyYHPOxKNcspPoBH+i6tsf075xHr3rMxvyIq/oL+C3fbbGx/kVPaDHpJ
	pIwFHnLPg6Ib2fARaSOL5K5GggLFx3ak/aEBsMNsaZimcRnm35CZZzrDbmqQVthDSyp+
	ey8DkvEnwgao8NND4iA+SU0rukNYXHCcmA6O1xd+wX+yVtzDQRY/NxdZxt3LlQmbiKbC
	BPAC5xoxqKdZpa7qeu9uJMvdpd85PLI52JlaJvIaCRg62f4Esm13jnjg9jCZboWSg7Rv
	UH1jWofJS7HTbaeXLi5xUX9e3id8x6lm/k7swupPwJ7xAgHWPqZJzh9MnQM2gX4y/Oa5
	sdRQ==
X-Gm-Message-State: ALoCoQntcfrpC/inStlb9VtPbxA3YnBsL7ZR3uK2GEpe60Hz79uaS8Tg3T3iEaNlmYsZaDHL0nPY9y4/4TErQwA5lBRrRy2JfQ==
X-Received: by 10.98.15.207 with SMTP id 76mr54932413pfp.60.1453315425533;
	Wed, 20 Jan 2016 10:43:45 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:450b:e083:385a:4667?
	([2601:646:8802:5d5c:450b:e083:385a:4667])
	by smtp.gmail.com with ESMTPSA id
	t67sm50398891pfa.14.2016.01.20.10.43.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jan 2016 10:43:44 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453298666-17095-1-git-send-email-paul.barker@commagility.com>
Date: Wed, 20 Jan 2016 10:43:40 -0800
Message-Id: <3B08E0F3-93AC-40AD-B155-80BDE12CE61E@gmail.com>
References: <1453298666-17095-1-git-send-email-paul.barker@commagility.com>
To: Paul Barker <paul.barker@commagility.com>
X-Mailer: Apple Mail (2.3112)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH V2] ti-softhsmv2: Use target includes for zlib and openssl
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
X-List-Received-Date: Wed, 20 Jan 2016 18:43:50 -0000
X-Groupsio-MsgNum: 7762
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B4672AEE-8397-44A1-AD78-138B1625BED3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B4672AEE-8397-44A1-AD78-138B1625BED3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 20, 2016, at 6:04 AM, Paul Barker <paul.barker@commagility.com> =
wrote:
>=20
> ti-softhsmv2 needs to look at the target include directories instead =
of the host
> include directories for zlib and openssl header files. By using
> STAGING_EXECPREFIXDIR we can support changes to exec_prefix.
>=20

this looks good

> Signed-off-by: Paul Barker <paul.barker@commagility.com>
> ---
> recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb =
b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> index c1e1654..3143acd 100644
> --- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> @@ -21,7 +21,10 @@ S =3D "${WORKDIR}/git"
> CFLAGS +=3D " -mno-unaligned-access"
> CPPFLAGS +=3D " -mno-unaligned-access"
>=20
> -EXTRA_OECONF +=3D "--with-zlib=3D${STAGING_DIR_HOST}/usr"
> +EXTRA_OECONF +=3D " \
> +    --with-zlib=3D${STAGING_EXECPREFIXDIR} \
> +    --with-openssl=3D${STAGING_EXECPREFIXDIR} \
> +    "
>=20
> INITSCRIPT_NAME =3D "softhsm-daemon.sh"
> INITSCRIPT_PARAMS =3D "defaults 10"
> --
> 1.9.1
>=20


--Apple-Mail=_B4672AEE-8397-44A1-AD78-138B1625BED3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaf1WAACgkQuwUzVZGdMxRU8wCfQIpztKeVghWtfuHSXsDOhWNj
F1QAoIMOAY+ALKVy4s9yv/tLd6vq7A2y
=nhJo
-----END PGP SIGNATURE-----

--Apple-Mail=_B4672AEE-8397-44A1-AD78-138B1625BED3--
