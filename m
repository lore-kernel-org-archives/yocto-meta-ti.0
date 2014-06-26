Return-Path: <tom.rini@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DB4EE0044A; Thu, 26 Jun 2014 06:30:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.192.52 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5E0CBE003D8
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 06:30:45 -0700 (PDT)
Received: by mail-qg0-f52.google.com with SMTP id f51so3000570qge.39
	for <meta-ti@yoctoproject.org>; Thu, 26 Jun 2014 06:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:organization
	:user-agent; bh=CWLkSnMQAl/0kZIF5bx4fAn7H2YHwPb82SUhOj5RYyk=;
	b=YOzPeSwqsjfeo4ReuNLQ571AST5w+jiWRzuJzDZBsG4To8sPfp0Oaf13zR5Wf4d+bV
	cID/3y0v9LaVSS1o3STTutERLdmZ6fIl3mMGVKG5Uu6UywK6DuGeLSfjzV7AQWFSsDId
	XkC5UThFtaM5zHuAjKdpUG/R//npEs+st+Gpdaq5LrNxfPQOyKyxYlQLT06a4sfLVfa1
	q/LxAuocs4vP06+CGEQIrPHkmFyGZOn/HekiCA6B69GpGIAZL6oN5QKrZjfyTlUmIe9j
	LUw07VH4ELLA/R7NMN5Bu+zEyibtnNOcCUY5iLJ0Z7YrMN7s35HwA4sQEAy4KcUacaKc
	ujyQ==
X-Received: by 10.229.252.130 with SMTP id mw2mr22077239qcb.12.1403789444989; 
	Thu, 26 Jun 2014 06:30:44 -0700 (PDT)
Received: from bill-the-cat (cpe-098-121-186-226.ec.res.rr.com.
	[98.121.186.226])
	by mx.google.com with ESMTPSA id i76sm4242937qge.12.2014.06.26.06.30.44
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 26 Jun 2014 06:30:44 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
Date: Thu, 26 Jun 2014 09:30:45 -0400
From: Tom Rini <trini@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20140626133045.GN9006@bill-the-cat>
References: <1403712632-26072-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1403712632-26072-1-git-send-email-denis@denix.org>
Organization: Texas Instruments
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] u-boot: disable SPL/MLO processing for omapl138 SOCs
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
X-List-Received-Date: Thu, 26 Jun 2014 13:30:49 -0000
X-Groupsio-MsgNum: 4792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="jdM5ZcN/ZcXXVwZs"
Content-Disposition: inline

--jdM5ZcN/ZcXXVwZs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2014 at 12:10:32PM -0400, Denys Dmytriyenko wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>=20
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  recipes-bsp/u-boot/u-boot_2014.07.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/recipes-bsp/u-boot/u-boot_2014.07.bb b/recipes-bsp/u-boot/u-=
boot_2014.07.bb
> index b326aa1..9da6f7d 100644
> --- a/recipes-bsp/u-boot/u-boot_2014.07.bb
> +++ b/recipes-bsp/u-boot/u-boot_2014.07.bb
> @@ -25,3 +25,6 @@ SRCREV =3D "76b21026ceb5a6a83fc53b0ecdf425f240318022"
> =20
>  SPL_BINARY =3D "MLO"
>  SPL_UART_BINARY =3D "u-boot-spl.bin"
> +
> +SPL_BINARY_omapl138 =3D ""
> +SPL_UART_BINARY_omapl138 =3D ""

omapl138 is am18xx right?  SPL supports that.  The only issue is that we
need to ship u-boot.ais which is a combo image.  If I'm looking at the
right branch, the problem(s) right now are we don't use the right config
target (da850_am18xxevm_config is what we want) and UBOOT_SUFFIX to
"ais" (in the omapl138.inc file).

--=20
Tom

--jdM5ZcN/ZcXXVwZs
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJTrCCFAAoJENk4IS6UOR1WI4QP/1D0o19kSmTLwiBk24akXA0f
pVZbW3+KXHMnfWwkQYbm40HlHfsnHgXWM+2ee2jKeGpqE9OsMq8KQZuN2YdGMAE5
cKpGr7AUfUm7X9nfdnCoMktmLSU3yhyZhfmhYeZq5UkmW2+BJnOXQ0EjLY/DQ+Mu
1JgydmcNv/12P8XM0eFQRlwB2V1hMHkxjT+nBDgMSpfUP3ypW1sCiyzYbcePcaOF
kmhTTO1f9rZraN8Dqa+MCJ3bbLIuN4DPAYNg3PGprgGS2CzVK2P3B8Ec/OH8ucAf
bpeUZyLOcmkWftU4Yr4sMQ5/hnesa1uEt2/62vsf8IXOrc/JtHh0yrtIO04IDh2B
bJTkknpaBRENPFEa0MT+dIN9ha86jnQlcajT90EQJP0t+p6LwBh1+qq53l2Uqwq6
SZlKWHLzAvWYQ5UD3EMTrXI5u+yj6omCMHEFKZUbadC4kgzjN6pXxR2DcfXzGfsX
s7NebWafnkRv5xjkgSY0JB50elEQFrHQEzmORKbQq5e5/rmdYuXKCpG+AHnjC9Kk
nhgRNzUQDZ9K+kXUJeLwZAvXH4YlA5KEoz0wC1s/6uT/aw7YUyM8jVfaYqOk8ily
KpYS0YLuj9tm2sy75xatbU/b5DaVOXK/DFQ6kZba+x6idnbobGVvyfmd9nJpRJTW
sjxoMp3R6FWx96PSn7yK
=i9of
-----END PGP SIGNATURE-----

--jdM5ZcN/ZcXXVwZs--
