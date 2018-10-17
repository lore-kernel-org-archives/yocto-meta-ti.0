Return-Path: <raj.khem@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6F9C5E00B5E; Wed, 17 Oct 2018 12:46:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (raj.khem[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.160.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9B45E00A0C
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:46:51 -0700 (PDT)
Received: by mail-qt1-f195.google.com with SMTP id q41-v6so31518562qtq.10
	for <meta-ti@yoctoproject.org>; Wed, 17 Oct 2018 12:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/QTHcj9/km4PgN5BYcg9FTpo5SK61OcthQn3IYiqPrQ=;
	b=ueZZcQGKeBGyC7nKSYjqiAodNm/+Z678vgeDqLF4XUOEu3sCVDQQXkjGHfb2F9xsZr
	9xe3Y0IJXzJwSQtvAc66dYVDVhVnp/mYJDJN2c4wrEO+1oPVrI6ZjEzoBXvs7R9R+zeA
	CB1LmeXFmthLXZJdoeR4r9rb7tEZsryoBcS3IyOyFKYDe0m7Um643AudhTe1HpUCtlYz
	vJgbzLXS2IIIxQRtf/tmAZsJZjAFPM5ICkTykeRk63uovpyvHbgMK7hU0Cj9FDYbjoMr
	twMcFqMG1H1Sj2LlrPS9TTZT9wJwAf5cARnaZtywEdlmGzrgNnHtW+5H7Woh+duvqyVo
	m+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/QTHcj9/km4PgN5BYcg9FTpo5SK61OcthQn3IYiqPrQ=;
	b=cdYjdyQXTjFUCAtgbyRaOG8ct/unsSnEdW50Nn1lMim46tXmAMsXCY6NIiw9np2CdU
	rE5S3WFOLw/QWTlKLlug4jKAlZE0/8PqKdFIfoR63KKoO3gzufGH1FeE7kSYUMn0cCvp
	au1e5nGaFIEGaoCC+vEuBSCn5OHpPpKnOeP8zyqven2017yzboSsGJcdafhJp0k8f2dJ
	h2qsqmqp4tvJO90R2o8HRzDTySKzFqR0dYqmrn6Dqtw9vI28A2wCtdRBOHqbk7mJH/75
	tJHCpXBeAjjMfHW7mzpIDhd3i3boAvN1NJ0bLOxsOdP+b+BPa6uDnBitJ/sxZCTDBVPH
	V64A==
X-Gm-Message-State: ABuFfohZDcyK5glauqih+5m8rVZsa6/QOyeS3x/i6M9P2faIoOvSN9bU
	THHQZsQWVE0k1wEPDqvJNE6cBKG0VXQcCu0R9go=
X-Google-Smtp-Source: ACcGV63cPTH5ky8nCqbmUNw7KTJCL0v+nw/cvpr39C5CG0xn7/x3PNKMYq2kV3worBHaHfFSyrnT48EKhbjDXQlKE2A=
X-Received: by 2002:ac8:689a:: with SMTP id
	m26-v6mr25534675qtq.254.1539805610873; 
	Wed, 17 Oct 2018 12:46:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAMKF1srw+fEpBr-yJ8DWTPajc=PvmTwV-qubMrr7MCbR4-xSHA@mail.gmail.com>
	<20181016182859.GI14250@beryl> <20181016183828.GK14250@beryl>
	<20181016185925.GO1032@bill-the-cat>
	<9e7016817d464dd8bfb1210b8e9e6cf5@SOC-EX01V.e01.socionext.com>
	<CAMKF1srteMQK0AC0Dj2hQ5z3ouzD7HsfTS5Yjg=-wcDTj4+z=A@mail.gmail.com>
	<20181017112615.GT1032@bill-the-cat>
	<CAMKF1srPbZ_8XKeKt=aMSrHCPZNAQULb4P8atahBLjm21Zvb9g@mail.gmail.com>
	<20181017192501.GG4031@beryl>
	<CAMKF1sqMCEGkNyOK_WgN6KfKs+_30tq-_868SrkSmxAjbRhGAA@mail.gmail.com>
	<20181017193716.GH4031@beryl>
In-Reply-To: <20181017193716.GH4031@beryl>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Oct 2018 12:46:24 -0700
Message-ID: <CAMKF1srTwXcfGNrsnGYU18piQ2h6fDWYC2=YUZpsj6LqMANUvw@mail.gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org, Tom Rini <trini@konsulko.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] beaglebone.conf: temporarily use generic am335x_evm_config for U-boot
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
X-List-Received-Date: Wed, 17 Oct 2018 19:46:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 17, 2018 at 12:37 PM Denys Dmytriyenko <denys@ti.com> wrote:
>
> On Wed, Oct 17, 2018 at 12:27:19PM -0700, Khem Raj wrote:
> > On Wed, Oct 17, 2018 at 12:25 PM Denys Dmytriyenko <denys@ti.com> wrote=
:
> > > > > > Yeah I saw that but this patch is not their in 2018.01 release =
that TI
> > > > > fork
> > > > > > is based on regardless I backported this patch to this version =
it did not
> > > > > > bring the size below mark
> > > > > > I think it=E2=80=99s because we are using hardened toolchain an=
d that enalbles
> > > > > > extra options to enable pie and ssp since these options get add=
ed to CC
> > > > > > they get passed into uboot straight
> > > > > >
> > > > > > I think we should just disable security flags for u boot in OE =
and may be
> > > > > > uboot make system should append fno-pie fno-stack-protector to =
nullify
> > > > > > these options
> > > > >
> > > > > OK, do you want to submit a patch for that or should I do one and=
 just
> > > > > Suggested-by you?  Thanks!
> > > >
> > > >Yes, that's right.
> > > > This would not be acceptable change since it changes how we build g=
cc
> > > > itself secondly it does not happen for master uboot
> > > >
> > > > However if this works then we need to understand why it increas e t=
he size
> > >
> > > Even if this change is not acceptable upstream, I would prefer it loc=
ally in
> > > meta-ti recipe, instead of disabling more features to free up 5-6KB i=
n SPL.
> >
> > this is a distro level change. meta-ti is not appropriate place to deci=
de that
>
> Are we talking about passing fno-pie and fno-stack-protector to U-boot bu=
ild
> that you suggested above? That is what I'm referring here. It can be BBB
> specific patch. That is until we figure out why it grows code so much...
>
oh I confused it with GCCPIE

> --
> Denys

