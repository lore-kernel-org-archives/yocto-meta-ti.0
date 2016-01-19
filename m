Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C08CE00B36; Tue, 19 Jan 2016 11:01:41 -0800 (PST)
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
	*      [209.85.192.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06785E00A92
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 11:01:39 -0800 (PST)
Received: by mail-pf0-f169.google.com with SMTP id n128so179845018pfn.3
	for <meta-ti@yoctoproject.org>; Tue, 19 Jan 2016 11:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NbR5vyFe/l8XO94WWIsSdYE7uz5+hsfHu1qByI24Kkg=;
	b=e9xWONcmNtysjAXJGsXfr5AN+jQd01M9LnO+Px0fM9yXGUAbtBQZ917leDPp498SrM
	FXPUQZA2inTbbSM/xWosyTId++8f6KID5dQ77DLJJTuR1CXY3odqhZpq2W22rE9UiqO3
	dctxJlNpUMHTj7B8/WPmGWmSBdaj5iqLh3+I+ub43YtZOSU9EtYNI/D8HGmfeS1gts7k
	sxtBnRPY7rKdUXusrq8UaFFC2roI9952NXyNeFCCvs7dLg45bYhQ+4QbRUh8FglQrd2P
	ryq6s0pfxjni2jbw4cFXFKxU5z4GLyhz3vgWegAGTWGLZ1w4oTNHDuY6KDaTNKDcqNXc
	cQJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=NbR5vyFe/l8XO94WWIsSdYE7uz5+hsfHu1qByI24Kkg=;
	b=g6sRErvHONf3fMJgBwBAtMir86KKStP7njqhbP50ZD/i1wftorY7jmVApo5DYgN4/y
	uEaF3VsAMc5AyVId9a5SO1vbBd0FWA/SnEH/PLZaP4xXnvC7hkz3ya8r3ZY6HlbDfb+d
	IfKCmkuDKZUtd587v1L91ZoqmU2ondiaEgJC/yYozSWqLl7KJUclYf2hE2wKz9KHWzax
	7uFOflaA70jSsS/O+k8DVoDedSqZ3fSw7kGSNArcc5L9h0O6/wDtIIkKEBY8bLvOt89w
	fFeQX8d6b2jOzzaD2lX4EKOMD9ZFYgZRH+F0dehgjn/UC5OnWhxltAknWvdHUuyB34FQ
	R3bw==
X-Gm-Message-State: ALoCoQkW0ktc+y8LI5EA52xryE1QzyaWyE09y7z6juEiIU3MLLz1wuOdbJHfa0/0UZ0Sj3cyp80IKMcoHF07/xGw3ydUJqufuw==
X-Received: by 10.98.12.21 with SMTP id u21mr46255877pfi.36.1453230098998;
	Tue, 19 Jan 2016 11:01:38 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	p20sm43144914pfi.86.2016.01.19.11.01.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 11:01:38 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1453218687-30012-1-git-send-email-paul.barker@commagility.com>
Date: Tue, 19 Jan 2016 11:01:37 -0800
Message-Id: <D9EE8563-6AA4-47D5-9CFE-6638C32B5658@gmail.com>
References: <1453218687-30012-1-git-send-email-paul.barker@commagility.com>
To: Paul Barker <paul.barker@commagility.com>
X-Mailer: Apple Mail (2.3112)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-softhsmv2: Use target includes for zlib and openssl
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
X-List-Received-Date: Tue, 19 Jan 2016 19:01:41 -0000
X-Groupsio-MsgNum: 7755
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5739D284-FD86-4A20-93CC-A9B3E366538A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5739D284-FD86-4A20-93CC-A9B3E366538A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 19, 2016, at 7:51 AM, Paul Barker <paul.barker@commagility.com> =
wrote:
>=20
> ti-softhsmv2 needs to look at the target include directories instead =
of the host
> include directories for zlib and openssl header files.
>=20
> Signed-off-by: Paul Barker <paul.barker@commagility.com>
> ---
> recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb =
b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> index c1e1654..dd51309 100644
> --- a/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> +++ b/recipes-ti/ti-softhsmv2/ti-softhsmv2_git.bb
> @@ -21,7 +21,10 @@ S =3D "${WORKDIR}/git"
> CFLAGS +=3D " -mno-unaligned-access"
> CPPFLAGS +=3D " -mno-unaligned-access"
>=20
> -EXTRA_OECONF +=3D "--with-zlib=3D${STAGING_DIR_HOST}/usr"
> +EXTRA_OECONF +=3D " \
> +    --with-zlib=3D${STAGING_DIR_TARGET}/usr \
> +    --with-openssl=3D${STAGING_DIR_TARGET}/usr \
> +    =E2=80=9C

you know there is STAGING_EXECPREFIXDIR, may be better suited here ?
>=20
> INITSCRIPT_NAME =3D "softhsm-daemon.sh"
> INITSCRIPT_PARAMS =3D "defaults 10"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


--Apple-Mail=_5739D284-FD86-4A20-93CC-A9B3E366538A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeiBEACgkQuwUzVZGdMxQRKwCeKDd9HZvX0k7r5XyPCVZeq1bR
AgAAniJCdgPOOXSVF1mj9gFa2xnzw5kQ
=xppv
-----END PGP SIGNATURE-----

--Apple-Mail=_5739D284-FD86-4A20-93CC-A9B3E366538A--
