Return-Path: <trini@konsulko.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A792BE00950; Tue, 16 Oct 2018 09:42:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.222.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com
	[209.85.222.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F1F3E006AF
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 09:42:13 -0700 (PDT)
Received: by mail-qk1-f194.google.com with SMTP id v68-v6so14549047qka.2
	for <meta-ti@yoctoproject.org>; Tue, 16 Oct 2018 09:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=wvJ/6l7yFViQdCHjs2H0M76f+zHUQ3+ij72eS7jj0wU=;
	b=bV0rGeKK34/y2raf+waabRU5bUIvibX8kl1Vq1IBZa79osVbCIhUlQrTl5iA9F3/QT
	o6njjlvoFhlGEC5ygvlngmcRvYxGWh3PpLNkG1a8CZhZz0mn3Zux8TYerSB5ywgbkOfB
	WXElQtGwwclvdOJudVyumZQyss3rasyZuwZr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=wvJ/6l7yFViQdCHjs2H0M76f+zHUQ3+ij72eS7jj0wU=;
	b=rwIvL9L+sOVEEGMgdZGEDIrKT2MZEOGUn6LVGkkK17qoCc0NPRT1YafNpbw2BQm/zL
	iwwUSima2jeXZ69PorYiDJY2n404FxEKNJut2HnLRIe1UAo8IGMHbSGk+KRoKnKLxyK/
	o+DrEu6zMp7JQb1E8Du8fR0ORkYrX3Ag0hD1gAecyeFdwxO9/KvMx8eq5jte3zxnvgfl
	igmAoQiZ3d2tC0CrBK7pIxJOIgef2olUqocnL22h+n+LydO6MrTBSsyaYngR3JttseGZ
	2MHcwBfSOPaLZYwArVReA/WnTxBCtRfGicSbrV4iSu3gjpxgrtVOAxgNmO5Cno/w4iUf
	nnNw==
X-Gm-Message-State: ABuFfog4CHYyZIfOtscJrn8Q/dOBL5FRMqX6Ye0aVmWJUCMkGjIjgJjz
	gOcMwc5KH0cmpMktxIal6jsAZQ==
X-Google-Smtp-Source: ACcGV61N8mX5gat5UB/QILy3g0pZe3O2d7ynw3mVb2/DG/eIWvy5Cn+DzmbPmji6Y3+sAhVY/PdNcw==
X-Received: by 2002:ae9:f408:: with SMTP id y8-v6mr21974121qkl.2.1539708133254;
	Tue, 16 Oct 2018 09:42:13 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-133-47.ec.res.rr.com. [65.184.133.47])
	by smtp.gmail.com with ESMTPSA id
	w17-v6sm12922993qth.47.2018.10.16.09.42.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Oct 2018 09:42:12 -0700 (PDT)
Date: Tue, 16 Oct 2018 12:42:10 -0400
From: Tom Rini <trini@konsulko.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20181016164210.GI1032@bill-the-cat>
References: <1539399036-6199-1-git-send-email-denys@ti.com>
	<CAMKF1soZ5HFiWKDrk5jcYG1NihHaSMqmpJXMxCH9b-cKyKra7w@mail.gmail.com>
	<20181014192417.GB20670@beryl>
	<CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqGw7PxhmncR7cZL_BMqZ37uhfWA7+L7N=EN7FZLaAomw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Tue, 16 Oct 2018 16:42:14 -0000
X-Groupsio-MsgNum: 11375
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="81JctsDUVPekGcy+"
Content-Disposition: inline

--81JctsDUVPekGcy+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 14, 2018 at 10:07:45PM -0700, Khem Raj wrote:
> On Sun, Oct 14, 2018 at 12:24 PM Denys Dmytriyenko <denys@ti.com> wrote:
> >
> > On Sat, Oct 13, 2018 at 01:17:12AM -0700, Khem Raj wrote:
> > > On Fri, Oct 12, 2018 at 8:00 PM Denys Dmytriyenko <denys@ti.com> wrot=
e:
> > > >
> > > > There have been reports recently that am335x_beaglebone_config gene=
rates bad SPL.
> > > > Until that is debugged and fixed, use generic am335x_evm_config tha=
t covers all
> > > > AM335x platforms, including BeagleBone variants.
> > > >
> > >
> > > it fails to link
> > >
> > > | arm-yoe-linux-gnueabi-ld.bfd: u-boot-spl section `.rodata' will not
> > > fit in region `.sram'
> > > | arm-yoe-linux-gnueabi-ld.bfd: region `.sram' overflowed by 5772 byt=
es
> > > | make[2]: *** [/mnt/a/yoe/build/tmp/work/beaglebone-yoe-linux-gnueab=
i/u-boot-ti-staging/2018.01+gitAUTOINC+2cc52408bf-r24/git/scripts/Makefile.=
spl:349:
> > > spl/u-boot-spl] Error 1
> >
> > FWIW, just built u-boot-ti-staging with gcc7 and gcc8 from oe-core, as =
well as
> > Linaro gcc7 - no problems.
>=20
> My distro inherits poky policies, and on master it now inherits
> hardening policies ( security flags) by defaults
> do you happen to test poky ?

I think we want to take a look at which of the security flags really
make sense to use in this context.  Thanks!

--=20
Tom

--81JctsDUVPekGcy+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbxhTiAAoJEIf59jXTHXZSSxEP/RVzGI+deqZ8KldK2N/OjX8y
XDX39mNAe+YLrIZLzCksp96RbzRrM2zpKDGZDIsTfYOMyqswFYGjHIR7sAcEqCAc
ekPlB0Bop/IRp3psiKI9r0dCEH4oCbXCpxW2TClWQq1XmXOWjmm8dd/T2STKUm+P
pdflrkSc8agthfq5SuTb077VPZWVkoeUHbbZ20GcyQkakfDm7g6d4SU1DVaL/YOR
brIvv+Xx2xcq7pjw4+qKyp4cBNf58BYqvCWB7P+gIUWAeH1Q451XO6YX4j/8qj+b
tbx2b8W3a1o4bkn1H1bUO7SShSNJkMYj93pVYFPlY4Utbf9ptOcJ2EKpKyx9bl6K
obONNv5+VEr01sQVZpkV+WpQa4f754hPdrF6pq+0HbBj+CIZ3q+gUJUAh8IB2AOP
gpmiZjaD81du8OWkqL4CUTPdTzsePQ+RrrPd0vNLuOFscZ3zM2S+ooDuJuik0abT
aNNX1eGCWlhtY3p+70uiozM50fvOstgitwdzDKSUPjB2LM8+Ca1icx+oonkg8oP9
mN4bAzXWxC6gw5+uiZwKtzFwz48UGvsV9jJytpij2UTUVBLDnmK2NdWbGCt9MjYZ
0E1x0wDVpgB+VN6CUwrUz2ltPTy8IX/duPT8adKYGQ8Kc4f58dns/Y/j1RVfFVnW
tQV71le+0+rspk8Y/suk
=Qryu
-----END PGP SIGNATURE-----

--81JctsDUVPekGcy+--
